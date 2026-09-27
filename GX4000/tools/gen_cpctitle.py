"""Écran de présentation, en mode 0 (160x200, 16 couleurs) : « SUPER CPC » en
grand (police du Tennis GB agrandie x3) et la bande TENNIS de l'écran titre
GB (tuiles $71B4, tilemap $76B4). L'écran GB fait 160 pixels de large : la
bande occupe exactement la largeur du mode 0 (20 colonnes de 8 pixels).

Les tuiles restent au format mode 1 (4 teintes, 16 octets) : src/menu.asm les
convertit en mode 0 au dessin, avec une palette de 4 encres par rangée
(title_rowpal) : bande GB, lettres rouges, vertes, bleues...
Sortie : gfx/title.asm (tuiles + carte des rangées 0-13, 20 colonnes ;
tuile $FF = noir), build/title_preview.png
"""
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen_cpcgfx as g  # noqa: E402

ROOT = os.path.join(HERE, '..')
BAND_ROW = 6                    # rangée CPC de la 1re rangée de la bande
BAND_COL = 0                    # colonne (mode 0) de la colonne GB 0
LOGO_ROWS = range(1, 10)        # rangées GB : filet haut ... poignées des raquettes
EXTEND = {1: 0xB1, 8: 0xB2, 9: 0x80}   # prolongement hors du logo (sinon $81)
ROWS = 15                       # rangées décrites (0-14), le reste : menu
BIG_WORDS = [('SUPER', 0), ('CPC', 3)]      # (mot, première rangée) en grandes lettres
BIG_INK = 1                     # teinte des lettres (couleur choisie par rangée)
COLS = 20                       # mode 0 : 20 colonnes de 8 pixels
# palette de chaque rangée (index dans title_pals de src/menu.asm) :
# 0 bande GB, 1-3 lettres « CPC » (une couleur par rangée)
ROW_PAL = [1, 2, 3, 1, 2, 3] + [0] * 9


def title_vram():
    v = g.VRAM(g.ROM, fill_tile=0x80)
    v.copy(0x62D6, 0x8000, 0x800)
    v.copy(0x5AD6, 0x8800, 0x800)
    v.copy(0x52D6, 0x9000, 0x800)
    v.copy(0x71B4, 0x8800, 0x500)
    g.tennis_tilemap(v, 0x76B4)
    return v


def put_big(v, put, word, top):
    """Mot en grandes lettres (police GB, x2 en largeur, x3 en hauteur : les
    pixels du mode 0 sont deux fois plus larges que hauts), centré."""
    width = len(word) * 2 + (len(word) - 1)
    c0 = (COLS - width) // 2
    for k, ch in enumerate(word):
        gt = 0xDA + ord(ch) - ord('A')
        px = v.tile(gt)
        px = [[bool(r[x] or (x > 0 and r[x - 1])) for x in range(8)] for r in px]   # gras
        for cy in range(3):
            for cx in range(2):
                t = [[BIG_INK if px[(cy * 8 + y) // 3][(cx * 8 + x) // 2] else 3 for x in range(8)]
                     for y in range(8)]
                put(top + cy, c0 + k * 3 + cx, t)


def main():
    v = title_vram()
    tiles = {}
    tmap = [[0xFF] * COLS for _ in range(ROWS)]
    pix = [[3] * (COLS * 8) for _ in range(ROWS * 8)]  # aperçu (teinte 3 = noir)

    def put(r, c, px):
        for y in range(8):
            for x in range(8):
                pix[r * 8 + y][c * 8 + x] = px[y][x]
        if all(p == 3 for row in px for p in row):
            return
        data = g.tile_mode1(px)
        if data not in tiles:
            tiles[data] = len(tiles)
        tmap[r][c] = tiles[data]

    for i, gy in enumerate(LOGO_ROWS):
        for c in range(COLS):
            gx = c - BAND_COL
            t = v.mem[0x1800 + gy * 32 + gx] if 0 <= gx < 20 else EXTEND.get(gy, 0x81)
            px = v.tile(t)
            if gy == 9:                                 # sous la bande : fond noir
                px = [[3 if p == 0 else p for p in row] for row in px]
            put(BAND_ROW + i, c, px)
    # pixels du mode 0 deux fois plus larges que hauts : x2 en largeur, x3 en hauteur
    for word, top in BIG_WORDS:
        put_big(v, put, word, top)
    assert len(tiles) < 255
    print(f'écran titre : {len(tiles)} tuiles ({len(tiles) * 16} octets)')
    out = ['; Fichier généré par tools/gen_cpctitle.py : écran de présentation (mode 1).', '',
           f'TITLE_ROWS  equ {ROWS}', 'title_tiles']
    for data in tiles:
        out.append('        db ' + ', '.join(f'${b:02X}' for b in data))
    out.append('title_rowpal                    ; palette de chaque rangée')
    out.append('        db ' + ', '.join(str(p) for p in ROW_PAL[:ROWS]))
    out.append('title_map                       ; $FF : noir')
    for row in tmap:
        out.append('        db ' + ', '.join(f'${t:02X}' for t in row))
    open(os.path.join(ROOT, 'gfx', 'title.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    pals = [[(128, 255, 128), (0, 255, 0), (255, 255, 255), (0, 0, 0)],
            [(0, 0, 0), (255, 0, 0), (0, 0, 0), (0, 0, 0)],
            [(0, 0, 0), (0, 255, 0), (0, 0, 0), (0, 0, 0)],
            [(0, 0, 0), (0, 0, 255), (0, 0, 0), (0, 0, 0)]]
    im = Image.new('RGB', (160, 200), (0, 0, 0))
    for y in range(ROWS * 8):
        for x in range(160):
            im.putpixel((x, y), pals[ROW_PAL[y // 8]][pix[y][x]])
    im.resize((640, 400), Image.NEAREST).save(os.path.join(ROOT, 'build', 'title_preview.png'))


if __name__ == '__main__':
    main()
