"""Génère src/gfx_sprites.bas : sprites Spectrum (masque + dessin) tirés de la ROM GB.

Conversion des teintes GB (0 transparent, 1 clair, 2 foncé, 3 noir) :
  3 -> encre ; 2 -> trame (un pixel sur deux) ; 1 -> papier opaque ; 0 -> transparent.

Format d'un sprite (octets) :
  largeur en octets W, hauteur H, décalage X (signé), décalage Y (signé),
  puis H lignes de W paires (masque, dessin). Écran = (écran AND masque) OR dessin.
Index : 0-19 joueur 1 (bas), 20-39 joueur 2 (haut), 40-42 balle (3 tailles),
        43 ombre, 44 marque de rebond.
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..', 're'))
import extract_sprites as es  # noqa: E402

BALL_LISTS = [0x1BC2, 0x1BDB, 0x1BE5, 0x1BCC, 0x1BD6]


def to_mono(pix):
    """pix : dict (x, y) -> teinte. Renvoie (x0, y0, W, H, lignes de (masque, dessin))."""
    xs = [x for x, _ in pix]
    ys = [y for _, y in pix]
    x0, x1, y0, y1 = min(xs), max(xs), min(ys), max(ys)
    wbytes = (x1 - x0) // 8 + 1
    h = y1 - y0 + 1
    rows = []
    for y in range(y0, y1 + 1):
        row = []
        for b in range(wbytes):
            m, g = 0xFF, 0
            for bit in range(8):
                x = x0 + b * 8 + bit
                c = pix.get((x, y), 0)
                if c:
                    m &= ~(0x80 >> bit) & 0xFF
                    ink = c == 3 or (c == 2 and (x + y) % 2 == 0)
                    if ink:
                        g |= 0x80 >> bit
            row.append((m, g))
        rows.append(row)
    return x0, y0, wbytes, h, rows


def main():
    data = json.load(open(os.path.join(HERE, '..', 're', 'sprites.json')))
    sprites = []
    for pl in ('j1', 'j2'):
        for f in data[pl]['frames']:
            sprites.append(to_mono(es.render([tuple(i) for i in f])))
    for a in BALL_LISTS:
        sprites.append(to_mono(es.render(es.read_list(a))))

    if '--asm' in sys.argv:
        write_asm(sprites)
        return
    out = ["' Fichier généré par tools/gen_sprites.py - ne pas modifier à la main",
           '#ifndef GFX_SPRITES_BAS', '#define GFX_SPRITES_BAS', '',
           f'CONST NSPRITES AS UByte = {len(sprites)}', '',
           "' Appeler une fois au démarrage : garde les données dans le binaire.",
           'SUB FASTCALL SpriteDataKeep()', '    ASM', '        ret', 'SprTable:']
    for i in range(len(sprites)):
        out.append(f'        defw Spr{i}')
    total = 0
    for i, (x0, y0, w, h, rows) in enumerate(sprites):
        out.append(f'Spr{i}:')
        out.append(f'        defb {w}, {h}, {x0 & 0xFF}, {y0 & 0xFF}')
        for row in rows:
            out.append('        defb ' + ', '.join(f'${m:02X}, ${g:02X}' for m, g in row))
        total += 4 + h * w * 2
    out += ['    END ASM', 'END SUB', '', '#endif', '']
    open(os.path.join(HERE, '..', 'src', 'gfx_sprites.bas'), 'w', encoding='utf-8').write('\n'.join(out))
    print(f'{len(sprites)} sprites, {total} octets')


def write_asm(sprites):
    """Version sjasmplus : asm/gfx/sprites.asm (table SprTable + données)."""
    out = ['; Fichier généré par tools/gen_sprites.py --asm (sprites tirés de la ROM GB)',
           '; Ne pas modifier à la main.', '', 'SprTable:']
    for i in range(0, len(sprites), 8):
        out.append('        dw ' + ', '.join(f'Spr{j}' for j in range(i, min(i + 8, len(sprites)))))
    for i, (x0, y0, w, h, rows) in enumerate(sprites):
        out.append(f'Spr{i}:')
        out.append(f'        db {w}, {h}, {x0 & 0xFF}, {y0 & 0xFF}')
        for row in rows:
            out.append('        db ' + ', '.join(f'${m:02X}, ${g:02X}' for m, g in row))
    path = os.path.join(HERE, '..', 'asm', 'gfx', 'sprites.asm')
    os.makedirs(os.path.dirname(path), exist_ok=True)
    open(path, 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    print(f'{len(sprites)} sprites -> {path}')


if __name__ == '__main__':
    main()
