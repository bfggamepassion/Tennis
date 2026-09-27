"""Traduction automatique de la logique du Tennis Game Boy (SM83) en Z80.

Lit directement la ROM (re/tennis.gb), suit le code atteint depuis les
routines de logique (voir gb_closure.ROOTS) et écrit asm/gb/gb_logic.asm.

Principes :
- la RAM GB garde ses adresses : $C000-$DFFF et $FF80-$FFFF (le programme
  Spectrum les réserve), donc les accès mémoire se traduisent tels quels ;
- chaque instruction SM83 donne son équivalent Z80 (identique pour
  l'essentiel ; ld [hl+], ldh, swap, rst sont réécrits) ;
- tous les sauts deviennent des JP vers des étiquettes G_xxxx (adresse GB),
  les tables rst $08 des DW, les données en ligne (rst $18/$28) des DB ;
- les appels au son, aux changements d'écran et au mode démo sont redirigés
  vers des routines Spectrum (S_...) écrites à la main.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(HERE, 'mgbdis'))
import gb_closure as gc  # noqa: E402
from instruction_set import instructions, cb_instructions  # noqa: E402

ROM = gc.ROM
OUT = os.path.join(HERE, '..', 'asm', 'gb', 'gb_logic.asm')

STUB_LABEL = {
    0x3665: 'S_SOUND',        # joue le son A
    0x1F6B: 'S_RET',          # vérification de la musique : rien à faire
    0x016D: 'S_SCREEN',       # changement d'écran ($FF8A)
    0x227C: 'S_RET',          # sortie du mode démo (jamais atteinte)
}
# Réglages volontaires (hors ROM) : instruction GB remplacée -> code Z80.
# $10A6 : coup du joueur 1 en échange, juste avant le lancement de la balle
#         ($165C) -> S_P1SHOT atténue les coups croisés / longs (gb_support.asm).
PATCHES = {
    0x10A6: 'jp S_P1SHOT',
}
# Immédiats 16 bits qui sont des adresses de la ROM (les autres sont des constantes)
CODE_PTRS = {0x19E9, 0x1A3A}
DATA_PTRS = {0x0B35}
# Données recopiées : table de pointeurs des fiches de niveau + fiches
DATA_BLOCKS = [(0x0B35, 0x0B3D, 'dw'), (0x0B3D, 0x0B7D, 'db')]
ROT_NO_Z = {0x07, 0x0F, 0x17, 0x1F}          # rlca rrca rla rra : Z différent


def w(a):
    return ROM[a] | (ROM[a + 1] << 8)


def lab(a):
    return f'G_{a:04X}'


def translate():
    starts, targets, tables, _, _, _, _ = gc.explore()
    labels = set(targets) | set(gc.ROOTS) | CODE_PTRS
    for ents in tables.values():
        labels |= set(ents)
    out = ['; Fichier généré par tools/gb2z80.py à partir de la ROM Game Boy.',
           '; Ne pas modifier à la main : relancer le script.', '']
    order = sorted(starts)
    warnings = []
    prev_end = None
    prev_falls = False
    for idx, pc in enumerate(order):
        if prev_falls and prev_end != pc:
            out.append(f'        jp {lab(prev_end)}          ; continuité du code GB')
            labels.add(prev_end)
        if pc in labels or pc in STUB_LABEL:
            out.append(f'{lab(pc)}:')
        op = ROM[pc]
        n = gc.length(op)
        nxt = pc + n
        m = instructions[op]
        d8 = ROM[pc + 1] if n >= 2 else 0
        d16 = w(pc + 1) if n == 3 else 0
        comment = f'; ${pc:04X}'
        falls = True
        z80 = []
        if pc in PATCHES:
            out.append(f'        {PATCHES[pc]:30s}{comment} (réglage : {instructions[op]})')
            prev_end = nxt
            prev_falls = not PATCHES[pc].startswith('jp ')
            continue

        def target16(v):
            if v in STUB_LABEL:
                return STUB_LABEL[v]
            return lab(v)

        if op == 0xCB:
            cbm = cb_instructions[ROM[pc + 1]]
            if cbm.startswith('swap'):
                if cbm != 'swap a':
                    warnings.append(f'{pc:04x} {cbm}')
                z80 = ['rrca', 'rrca', 'rrca', 'rrca', 'or a']
            else:
                z80 = [cbm.replace('[hl]', '(hl)')]
        elif op == 0xCF:                                     # rst $08 + table
            z80 = ['call G_RST08']
            out.append(f'        {z80[0]:30s}{comment}')
            out.append('        dw ' + ', '.join(lab(t) for t in tables[nxt]))
            prev_end = nxt + 2 * len(tables[nxt])
            prev_falls = False
            continue
        elif op in (0xDF, 0xEF):                             # rst $18 / $28 + données
            name = 'G_RST18' if op == 0xDF else 'G_RST28'
            cnt = ROM[nxt]
            out.append(f'        {"call " + name:30s}{comment}')
            out.append('        db ' + ', '.join(f'${b:02X}' for b in ROM[nxt:nxt + 1 + cnt]))
            prev_end = nxt + 1 + cnt
            prev_falls = True
            continue
        elif m == 'rst vec':
            z80 = [f'call G_RST{op & 0x38:02X}']
        elif m in ('ld a,[hl+]', 'ld a,[hl-]'):
            z80 = ['ld a,(hl)', 'inc hl' if '+' in m else 'dec hl']
        elif m in ('ld [hl+],a', 'ld [hl-],a'):
            z80 = ['ld (hl),a', 'inc hl' if '+' in m else 'dec hl']
        elif m == 'ldh [a8],a':
            z80 = [f'ld (${0xFF00 + d8:04X}),a']
        elif m == 'ldh a,[a8]':
            z80 = [f'ld a,(${0xFF00 + d8:04X})']
        elif m in ('ld [a16],a', 'ld a,[a16]'):
            z80 = [m.replace('[a16]', f'(${d16:04X})').replace('[', '(').replace(']', ')')]
            if d16 < 0x8000:
                warnings.append(f'{pc:04x} accès ROM {d16:04x}')
        elif 'pc+r8' in m:
            r = d8 - 256 if d8 > 127 else d8
            t = nxt + r
            cond = m.split()[1].split(',')[0] if ',' in m else ''
            z80 = [f'jp {cond + "," if cond else ""}{lab(t)}']
            falls = bool(cond)
            if prev_rot_no_z and cond in ('z', 'nz'):
                warnings.append(f'{pc:04x} saut sur Z après rotation')
        elif 'a16' in m:                                     # jp/call
            v = d16
            z80 = [m.replace('a16', target16(v))]
            if m == 'jp a16':
                falls = False
        elif 'd16' in m:
            v = d16
            if v in CODE_PTRS:
                s = lab(v)
            elif v in DATA_PTRS:
                s = f'D_{v:04X}'
            else:
                s = f'${v:04X}'
            z80 = [m.replace('d16', s)]
        else:
            t = m.replace('d8', f'${d8:02X}').replace('[', '(').replace(']', ')')
            parts = t.split(None, 1)
            if parts[0] in ('add', 'adc', 'sbc') and len(parts) == 2 and ',' not in parts[1]:
                t = f'{parts[0]} a,{parts[1]}'
            if t == 'reti':
                t = 'ret'
            if t == 'jp hl':
                t = 'jp (hl)'
                falls = False
            z80 = [t]
            if m in ('ret', 'reti'):
                falls = False
        prev_rot_no_z = op in ROT_NO_Z
        for i, ins in enumerate(z80):
            out.append(f'        {ins:30s}{comment if i == 0 else ""}')
        prev_end = nxt
        prev_falls = falls
    # étiquettes manquantes (cibles non traduites) -> erreur explicite
    emitted = {int(l[2:6], 16) for l in out if l.startswith('G_') and l.endswith(':')}
    missing = sorted(a for a in labels if a not in emitted and a not in STUB_LABEL)
    out.append('')
    out.append('; --- Données de la ROM lues par la logique ---')
    for start, end, kind in DATA_BLOCKS:
        if kind == 'dw':
            out.append(f'D_{start:04X}:')
        if kind == 'dw':
            out.append('        dw ' + ', '.join(f'D_{w(a):04X}' for a in range(start, end, 2)))
        else:
            for a in range(start, end, 16):
                if a in (0x0B3D, 0x0B4D, 0x0B5D, 0x0B6D):
                    out.append(f'D_{a:04X}:')
                out.append('        db ' + ', '.join(f'${b:02X}' for b in ROM[a:min(a + 16, end)]))
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    open(OUT, 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    print(f'{len(order)} instructions GB traduites -> {OUT}')
    if missing:
        print('ÉTIQUETTES MANQUANTES :', ' '.join(f'{a:04x}' for a in missing))
    for x in warnings:
        print('ATTENTION :', x)


prev_rot_no_z = False

if __name__ == '__main__':
    translate()
