"""Décor du court (arbitre et public) tiré des tuiles de fond de la ROM GB.

Compose des blocs de caractères 8x8 à partir du tilemap du court GB
($6F16 + $5180, arbitre à droite) et les convertit en 1 bit par pixel :
  - gradins (vert sur noir) : teinte GB 3 -> papier, 2 -> trame, 0/1 -> encre
  - arbitre (sur le vert du court) : 3 -> encre, 2 -> trame, 0/1 -> papier
Couleurs (attributs par case 8x8) : chaque spectateur (bloc de 2x2 cases)
reçoit une couleur vive sur fond noir ; Mario : casquette rouge, visage noir,
salopette bleue, chaise noire.
Écrit asm/gfx/scenery.asm (blocs + table de placement) et un aperçu PNG.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..', 're'))
import extract_gfx as g  # noqa: E402
from PIL import Image  # noqa: E402

OUT = os.path.join(HERE, '..', 'asm', 'gfx', 'scenery.asm')
PREVIEW = os.path.join(HERE, '..', 'asm', 'build', 'scenery_preview.png')

CROWD_INKS = [2, 6, 5, 3, 7, 4]      # rouge, jaune, cyan, magenta, blanc, vert
BRIGHT = 0x40
PAPER_GREEN = 4 << 3
UMPIRE_INKS = [2, 0, 1, 0, 0]        # par rangée : casquette, visage, salopette, chaise
ZX_RGB = [(0, 0, 0), (0, 0, 255), (255, 0, 0), (255, 0, 255),
          (0, 255, 0), (0, 255, 255), (255, 255, 0), (255, 255, 255)]


def crowd_attr(name, r, c):
    """Couleur d'une case de public : une par spectateur en haut et en bas,
    une par rangée sur les côtés."""
    if name == 'top':
        k = c + r * 3                   # une tête par case sur la rangée du haut
    elif name == 'bottom':
        k = c // 2
    else:
        # côtés : les spectateurs chevauchent les cases ; une couleur par rangée
        # (même couleur sur toute la largeur) donne tête et vêtement distincts
        k = r + (3 if name == 'left' else 0)
    return BRIGHT | CROWD_INKS[k % len(CROWD_INKS)]


def block_attrs(name, h, w, stands):
    if stands:
        return [[crowd_attr(name, r, c) for c in range(w)] for r in range(h)]
    return [[BRIGHT | PAPER_GREEN | UMPIRE_INKS[r] for c in range(w)] for r in range(h)]

vram = g.boot_vram()
vram.tilemap(0x6F16)
vram.tilemap(0x5180)


def tile_at(col, row):
    t = vram.mem[0x1800 + row * 32 + col]
    a = 0x9000 + ((t - 256 if t > 127 else t) * 16)
    return g.tile_pixels(vram.mem, a - 0x8000)


def to_bits(px, y, x, stands):
    c = px[y][x]
    if c == 2:
        return (x + y) % 2 == 0
    if stands:
        return c != 3
    return c == 3


def block(cells, stands, mirror=False):
    """cells : liste de lignes de (col, row) GB. Renvoie les octets (8 lignes par caractère)."""
    h = len(cells)
    w = len(cells[0])
    rows = []
    for cr in range(h):
        for y in range(8):
            line = []
            for cc in range(w):
                src = cells[cr][w - 1 - cc] if mirror else cells[cr][cc]
                px = tile_at(*src)
                b = 0
                for x in range(8):
                    sx = 7 - x if mirror else x
                    if to_bits(px, y, sx, stands):
                        b |= 0x80 >> x
                line.append(b)
            rows.append(line)
    return rows


# Blocs : (nom, ligne écran, colonne écran, cellules GB, gradins ?, miroir ?)
top = [[(4 + (c % 19), 0) for c in range(32)], [(4 + (c % 19), 0) for c in range(32)]]
bottom = [[(c, 29) for c in range(32)], [(c, 30) for c in range(32)]]
# gradins latéraux : les 3 colonnes de spectateurs du bord droit du tilemap
# (sans le mur en diagonale), en miroir pour le côté gauche
right = [[(c, r) for c in range(29, 32)] for r in range(3, 20)]
left = right
umpire = [[(22, r), (23, r)] for r in range(11, 16)]

BLOCKS = [
    ('top', 2, 0, top, True, False),
    ('bottom', 22, 0, bottom, True, False),
    ('left', 4, 0, left, True, True),
    ('right', 4, 29, right, True, False),
    ('umpire', 10, 27, umpire, False, False),
]


def main():
    out = ['; Fichier généré par tools/gen_scenery.py (tuiles de fond de la ROM GB).',
           '; Ne pas modifier à la main.', '',
           '; Table : pixels, attributs, ligne, colonne, hauteur, largeur (caractères).',
           '; Pixels : pour chaque rangée de cases, 8 lignes. Attributs : une case par octet.',
           'scenery_table:']
    data = []
    screen = Image.new('RGB', (256, 192), (0, 0, 0))
    for name, row, col, cells, stands, mirror in BLOCKS:
        bits = block(cells, stands, mirror)
        h, w = len(cells), len(cells[0])
        attrs = block_attrs(name, h, w, stands)
        out.append(f'        dw sc_{name}, sa_{name}')
        out.append(f'        db {row}, {col}, {h}, {w}')
        data.append(f'sc_{name}:')
        for line in bits:
            data.append('        db ' + ', '.join(f'${b:02X}' for b in line))
        data.append(f'sa_{name}:')
        for line in attrs:
            data.append('        db ' + ', '.join(f'${a:02X}' for a in line))
        for y, line in enumerate(bits):
            for cx, b in enumerate(line):
                a = attrs[y // 8][cx]
                ink, paper = ZX_RGB[a & 7], ZX_RGB[(a >> 3) & 7]
                for x in range(8):
                    screen.putpixel(((col + cx) * 8 + x, row * 8 + y), ink if b & (0x80 >> x) else paper)
    out.append('        dw 0')
    out.append('')
    out += data
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    open(OUT, 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    os.makedirs(os.path.dirname(PREVIEW), exist_ok=True)
    screen.resize((768, 576), Image.NEAREST).save(PREVIEW)
    size = sum(len(c) * len(c[0]) * 9 for _, _, _, c, _, _ in BLOCKS)
    print(f'décor : {size} octets -> {OUT}')


if __name__ == '__main__':
    main()
