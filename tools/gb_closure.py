"""Explore le code GB atteint depuis les routines de logique du jeu.

Affiche : routines atteintes, appels vers des adresses remplacées (stubs),
accès au matériel GB ($FF00-$FF7F, VRAM, OAM), immédiats 16 bits < $8000
(pointeurs possibles vers la ROM) et instructions sans équivalent Z80 direct.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, 'mgbdis'))
from instruction_set import instructions, cb_instructions  # noqa: E402

ROM = open(os.path.join(HERE, '..', 're', 'tennis.gb'), 'rb').read()

ROOTS = {
    0x1F8E: 'déroulement du match',
    0x0B7D: 'joueur 1',
    0x10ED: 'joueur 2',
    0x17A0: 'balle',
    0x2720: 'IA joueur 2',
    0x0A9D: 'fiche de niveau',
    0x3297: 'remise à zéro du match',
    0x2159: 'nouveau jeu',
}
# Adresses remplacées par du code Spectrum (on ne les suit pas)
STUBS = {
    0x3665: 'son', 0x3670: 'son', 0x1F6B: 'son',
    0x016D: 'reset écran', 0x0150: 'reset', 0x227C: 'sortie démo',
    0x2FDB: 'série', 0x2FED: 'série', 0x0837: 'série',
}
TABLE_LEN = {0x19E3: 3, 0x1A34: 3}


def length(op):
    if op == 0xCB:
        return 2
    m = instructions[op]
    if 'd16' in m or 'a16' in m:
        return 3
    if 'd8' in m or 'r8' in m or 'a8' in m:
        return 2
    return 1


def w(a):
    return ROM[a] | (ROM[a + 1] << 8)


def explore():
    starts, targets, calls_to_stub = set(), set(), {}
    hw, imm16, special = [], [], []
    tables = {}
    todo = list(ROOTS)
    extra_roots = [0x19E9, 0x1A3A]      # adresses de retour empilées ($19AC)
    todo += extra_roots
    while todo:
        pc = todo.pop()
        while True:
            if pc in starts:
                break
            if pc in STUBS:
                break
            op = ROM[pc]
            m = instructions[op]
            n = length(op)
            starts.add(pc)
            nxt = pc + n
            if op == 0xCF:                       # rst $08 + table
                tb = nxt
                ents = []
                a = tb
                lim = TABLE_LEN.get(tb, 99)
                while len(ents) < lim:
                    t = w(a)
                    if not (0x0150 <= t < 0x8000) or a in starts:
                        break
                    ents.append(t)
                    a += 2
                    if a in targets:
                        break
                tables[tb] = ents
                for t in ents:
                    targets.add(t)
                    todo.append(t)
                break
            if op in (0xDF, 0xEF):               # rst $18 / $28 + données
                pc = nxt + 1 + ROM[nxt]
                continue
            if op == 0xE9:
                special.append((pc, 'jp hl'))
                break
            if op in (0xE0, 0xF0):               # ldh
                a = 0xFF00 + ROM[pc + 1]
                if a < 0xFF80:
                    hw.append((pc, m, a))
            if op in (0xE2, 0xF2):
                special.append((pc, m))
            if op == 0xCB and (ROM[pc + 1] & 0xF8) == 0x30:
                special.append((pc, 'swap ' + cb_instructions[ROM[pc + 1]]))
            if op in (0xE8, 0xF8, 0x08, 0x10, 0x27):
                special.append((pc, m))
            if 'd16' in m or 'a16' in m:
                v = w(pc + 1)
                if op in (0xC3, 0xCA, 0xC2, 0xDA, 0xD2, 0xCD, 0xC4, 0xCC, 0xD4, 0xDC):
                    if v in STUBS:
                        calls_to_stub.setdefault(v, []).append(pc)
                    else:
                        targets.add(v)
                        todo.append(v)
                else:
                    if 0x8000 <= v < 0xA000 or 0xFE00 <= v < 0xFF80:
                        hw.append((pc, m, v))
                    if v < 0x8000:
                        imm16.append((pc, m, v))
            if op in (0x18, 0x20, 0x28, 0x30, 0x38):
                r = ROM[pc + 1]
                t = nxt + (r - 256 if r > 127 else r)
                targets.add(t)
                todo.append(t)
            if op in (0xC3, 0x18, 0xC9, 0xD9, 0xC7, 0xFF):
                break
            pc = nxt
    return starts, targets, tables, calls_to_stub, hw, imm16, special


if __name__ == '__main__':
    starts, targets, tables, stubs, hw, imm16, special = explore()
    code_bytes = sum(length(ROM[a]) for a in starts)
    print(f'{len(starts)} instructions, {code_bytes} octets de code GB')
    print('appels remplacés :', {hex(k): [hex(x) for x in v] for k, v in stubs.items()})
    print('matériel GB :')
    for pc, m, a in hw:
        print(f'  {pc:04x}  {m}  -> {a:04x}')
    print('immédiats 16 bits < $8000 :')
    for pc, m, v in imm16:
        tag = 'code' if v in starts else ''
        print(f'  {pc:04x}  {m:14s} {v:04x} {tag}')
    print('instructions spéciales :')
    for s in special:
        print(f'  {s[0]:04x}  {s[1]}')
