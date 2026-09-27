"""Écran de présentation C64 : « C64 » en grand (police du Tennis GB agrandie
x3) et la bande TENNIS de l'écran titre GB (tuiles $71B4, tilemap $76B4),
prolongée sur toute la largeur. Le bas de l'écran reçoit le menu (police de
la ROM du C64, recopiée au démarrage en caractères 128-191).

Mode caractères multicolore mixte, fond $D021 noir :
  teinte 3 -> noir ($D021), 0 -> vert clair ($D022), 1 -> vert ($D023),
  2 -> couleur de la case. Cases à deux couleurs dont le noir : haute
  résolution (encre = l'autre couleur).
Sorties : gfx/title_charset.asm, title_screen.asm, title_colors.asm,
          title.asm (couleurs de fond), build/title_preview.png
"""
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen_c64gfx as g  # noqa: E402

ROOT = os.path.join(HERE, '..')
BG0, BG1, BG2 = 0, 13, 5            # $D021 noir, $D022 vert clair, $D023 vert
SHADE_COL = {3: 0, 0: 13, 1: 5, 2: 1}
BAND_ROW = 6                        # rangée C64 de la 1re rangée de la bande
BAND_COL = 10                       # colonne C64 de la colonne GB 0
LOGO_ROWS = range(1, 10)            # rangées GB : filet haut ... poignées des raquettes
EXTEND = {1: 0xB1, 8: 0xB2, 9: 0x80}   # prolongement hors du logo (sinon $81)
BIG = 'C64'
BIG_TOP = 1
BIG_COLORS = [2, 7, 3]              # rouge, jaune, cyan (une couleur par rangée)


def title_vram():
    v = g.VRAM(g.ROM, fill_tile=0x80)
    v.copy(0x62D6, 0x8000, 0x800)
    v.copy(0x5AD6, 0x8800, 0x800)
    v.copy(0x52D6, 0x9000, 0x800)
    v.copy(0x71B4, 0x8800, 0x500)
    g.tennis_tilemap(v, 0x76B4)
    return v


def convert(px, outside=False):
    """-> (octets, multicolore, encre). outside : hors de la bande, la teinte 0
    (fond de l'écran GB) devient le fond noir."""
    sc = dict(SHADE_COL)
    if outside:
        sc[0] = 0
    cols = {sc[c] for r in px for c in r}
    if cols <= {0} or (len(cols) == 2 and 0 in cols and max(cols) <= 7):
        ink = max(cols)
        return bytes(sum(0x80 >> x for x in range(8) if sc[px[y][x]] == ink and ink)
                     for y in range(8)), False, ink
    slot = {0: 0, 13: 1, 5: 2}
    out = []
    for y in range(8):
        b = 0
        for fx in range(4):
            # pixel double : on garde le plus foncé (teinte GB la plus haute)
            s = max(px[y][2 * fx], px[y][2 * fx + 1])
            c = sc[s]
            b |= (slot[c] if s != 2 else 3) << (6 - 2 * fx)
        out.append(b)
    return bytes(out), True, SHADE_COL[2]


def glyph_tile(ch):
    if ch.isdigit():
        return 0xD0 + int(ch)
    return 0xDA + ord(ch) - ord('A')


def main():
    v = title_vram()
    chars = {}
    screen = [[0] * 40 for _ in range(25)]
    color = [[0] * 40 for _ in range(25)]
    blank = bytes(8)
    chars[blank] = (0, False, 0)

    def put(r, c, data, mc, ink):
        if data not in chars:
            chars[data] = (len(chars), mc, ink)
        code = chars[data][0]
        screen[r][c] = code
        color[r][c] = (8 | ink) if mc else ink

    # bande du titre
    for i, gy in enumerate(LOGO_ROWS):
        for c in range(40):
            gx = c - BAND_COL
            t = v.mem[0x1800 + gy * 32 + gx] if 0 <= gx < 20 else EXTEND.get(gy, 0x81)
            data, mc, ink = convert(v.tile(t), outside=(gy == 9))
            put(BAND_ROW + i, c, data, mc, ink)
    # « C64 » : police GB x3 (tuiles $D0-$F3), haute résolution
    width = len(BIG) * 3 + (len(BIG) - 1)
    c0 = (40 - width) // 2
    for k, ch in enumerate(BIG):
        px = v.tile(glyph_tile(ch))
        px = [[r[x] or (x > 0 and r[x - 1]) for x in range(8)] for r in px]     # gras
        big = [[px[y // 3][x // 3] for x in range(24)] for y in range(24)]
        for cy in range(3):
            for cx in range(3):
                data = bytes(sum(0x80 >> x for x in range(8) if big[cy * 8 + y][cx * 8 + x])
                             for y in range(8))
                put(BIG_TOP + cy, c0 + k * 4 + cx, data, False, BIG_COLORS[cy])
    print(f'écran titre : {len(chars)} caractères')
    assert len(chars) <= 128
    charset = bytearray(2048)
    for data, (code, mc, ink) in chars.items():
        charset[code * 8:code * 8 + 8] = data
    head = '; Fichier généré par tools/gen_c64title.py : écran de présentation.'

    def dump(name, label, rows):
        out = [head, label] + ['        .byte ' + ', '.join(f'${b:02X}' for b in r) for r in rows]
        open(os.path.join(ROOT, 'gfx', name), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    dump('title_charset.asm', 'title_charset', [charset[k:k + 16] for k in range(0, 1024, 16)])
    dump('title_screen.asm', 'title_screen', screen)
    dump('title_colors.asm', 'title_colors', color)
    open(os.path.join(ROOT, 'gfx', 'title.asm'), 'w', encoding='utf-8').write(
        f'{head}\nTITLE_BG0 = {BG0}\nTITLE_BG1 = {BG1}\nTITLE_BG2 = {BG2}\n')
    preview(charset, screen, color)


def preview(charset, screen, color, scale=2):
    pal = g.PAL
    im = Image.new('RGB', (320, 200))
    px = im.load()
    for r in range(25):
        for c in range(40):
            ch, col = screen[r][c], color[r][c]
            for y in range(8):
                b = charset[ch * 8 + y]
                if col & 8:
                    for fx in range(4):
                        vv = (b >> (6 - 2 * fx)) & 3
                        rgb = pal[[BG0, BG1, BG2, col & 7][vv]]
                        px[c * 8 + 2 * fx, r * 8 + y] = rgb
                        px[c * 8 + 2 * fx + 1, r * 8 + y] = rgb
                else:
                    for x in range(8):
                        px[c * 8 + x, r * 8 + y] = pal[col & 7] if b & (0x80 >> x) else pal[BG0]
    im.resize((320 * scale, 200 * scale), Image.NEAREST).save(os.path.join(ROOT, 'build', 'title_preview.png'))


if __name__ == '__main__':
    main()
