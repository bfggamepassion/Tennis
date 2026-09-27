"""Écran de présentation Master System (mode 4) : « MASTER » en grandes
lettres (police du Tennis GB x3, un dégradé de couleurs ligne par ligne),
puis la bande TENNIS de l'écran titre GB (tuiles $71B4, tilemap $76B4),
prolongée sur toute la largeur, sur un fond bleu court. Les rangées 14-23
reçoivent le menu (texte).

Même palette que le stade (gen_smsgfx.PAL_BG).
Sortie : gfx/title.asm (tuiles, carte des rangées 0 à TITLE_ROWS-1 ; les
autres rangées : espaces), build/title_preview.png
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen_smsgfx as cg  # noqa: E402
import sms  # noqa: E402

ROOT = os.path.join(HERE, '..')
BAND_ROW = 5                    # rangée de la 1re rangée de la bande
BAND_COL = 6                    # colonne de la colonne GB 0 (bande GB : 20 colonnes)
LOGO_ROWS = range(1, 10)        # rangées GB : filet haut ... poignées des raquettes
EXTEND = {1: 0xB1, 8: 0xB2, 9: 0x80}   # prolongement hors du logo (sinon $81)
BAND_SHADE = ['court', 'blue', 'white', 'black']
BIG_WORD, BIG_Y, BIG = 'MASTER', 4, 3     # mot, ligne du haut, agrandissement
BIG_GRADIENT = (['white'] * 2 + ['yellow'] * 4 + ['orange'] * 5 + ['red'] * 6 +
                ['brown'] * 7)
TITLE_ROWS = 14


def main():
    v = cg.title_vram()
    img = [['black'] * 256 for _ in range(TITLE_ROWS * 8)]
    for i, gy in enumerate(LOGO_ROWS):
        for c in range(32):
            gx = c - BAND_COL
            t = v.mem[0x1800 + gy * 32 + gx] if 0 <= gx < 20 else EXTEND.get(gy, 0x81)
            px = v.tile(t)
            for y in range(8):
                for x in range(8):
                    s = px[y][x]
                    col = BAND_SHADE[s]
                    if gy == 9 and s == 0:              # sous la bande : fond noir
                        col = 'black'
                    img[(BAND_ROW + i) * 8 + y][c * 8 + x] = col
    # grandes lettres : police GB en gras, agrandie BIG fois
    size = 8 * BIG
    width = len(BIG_WORD) * size + (len(BIG_WORD) - 1) * 8
    x0 = (256 - width) // 2 // 8 * 8
    for k, ch in enumerate(BIG_WORD):
        px = v.tile(0xDA + ord(ch) - ord('A'))
        px = [[bool(r[x] or (x > 0 and r[x - 1])) for x in range(8)] for r in px]
        for y in range(size):
            for x in range(size):
                if px[y // BIG][x // BIG]:
                    img[BIG_Y + y][x0 + k * (size + 8) + x] = BIG_GRADIENT[y]
    tiles, tmap = cg.to_tiles(img)
    assert len(tiles.tiles) <= 256, f'{len(tiles.tiles)} tuiles'
    cg.check(img, tiles, tmap)
    out = ['; Fichier généré par tools/gen_smstitle.py : écran de présentation (mode 4).', '',
           f'TITLE_ROWS  equ {TITLE_ROWS}',
           f'TITLE_NT    equ {len(tiles.tiles)}',
           'title_tiles']
    for t in tiles.tiles:
        out += sms.db_lines(t, 32)
    out.append('title_map')
    for row in tmap:
        out += sms.dw_lines(row, 16)
    open(os.path.join(ROOT, 'gfx', 'title.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    print(f'écran titre : {len(tiles.tiles)} tuiles')
    cg.preview(img, 'title_preview.png')


if __name__ == '__main__':
    main()
