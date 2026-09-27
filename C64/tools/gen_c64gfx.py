"""Décor C64 : le stade du Tennis GB (tilemap $6F16 + arbitre $5180), à l'échelle 1.

Le Game Boy construit une image de 256x256 pixels (32x32 tuiles) dont son
écran ne montre qu'une fenêtre ; le C64 (320x200) en montre 25 rangées sur
toute la largeur (colonnes C64 4-35). Une tuile GB 8x8 = un caractère C64.

Mode caractères multicolore mixte (couleur de case bit 3) :
  - tuile à deux teintes dont la plus claire (0) : caractère haute
    résolution, fond $D021 = teinte 0, encre = couleur de la case ;
  - sinon : caractère multicolore (pixels doubles) :
    00 = $D021 (teinte 0), 01 = $D022 (teinte 1), 10 = $D023 (teinte 3),
    11 = couleur de la case (teinte 2 : permet de colorer le public).
Sorties : gfx/court.asm (jeu de caractères, écran, couleurs), build/court_preview.png
"""
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from gbgfx import VRAM, tile_pixels  # noqa: E402

ROOT = os.path.join(HERE, '..')
ROM = open(os.path.join(ROOT, '..', 're', 'tennis.gb'), 'rb').read()

# Palette C64 (Pepto)
PAL = [(0, 0, 0), (255, 255, 255), (104, 55, 43), (112, 164, 178), (111, 61, 134), (88, 141, 67),
       (53, 40, 121), (184, 199, 111), (111, 79, 37), (67, 57, 0), (154, 103, 89), (68, 68, 68),
       (108, 108, 108), (154, 210, 132), (108, 94, 181), (149, 149, 149)]
BG0, BG1, BG2 = 13, 10, 0       # $D021 teinte 0 (vert clair), $D022 teinte 1 (peau), $D023 teinte 3 (noir)
COURT_INK = 5                   # encre des cases haute résolution (lignes, bords du court)
FIRST_ROW = 2                   # première rangée GB affichée (25 rangées)
COL0 = 4                        # colonne C64 de la colonne GB 0
CROWD_COLS = [2, 7, 3, 4, 1, 6]  # teinte 2 du public : une couleur par spectateur
UMPIRE = (22, 25, 10, 16)       # colonnes GB, rangées GB de l'arbitre (Mario)
UMPIRE_COL = 2                  # rouge
NET_COL = 1                     # blanc


def tennis_tilemap(v, hl, de=0x9800, c=1):
    """Décodeur de tilemap du jeu ($326B) : $F9 00 fin, $F9 02 n v répétition,
    $F9 pas adresse : nouveau pas et nouvelle destination."""
    while True:
        a = ROM[hl]; hl += 1
        if a != 0xF9:
            v.mem[de - 0x8000] = a
            de += c
            continue
        a = ROM[hl]; hl += 1
        if a == 0x02:
            n, val = ROM[hl], ROM[hl + 1]; hl += 2
            for _ in range(n):
                v.mem[de - 0x8000] = val
                de += c
            continue
        if a == 0:
            return
        c = a
        de = ROM[hl] | (ROM[hl + 1] << 8); hl += 2


def court_vram():
    v = VRAM(ROM, fill_tile=0x80)
    v.copy(0x62D6, 0x8000, 0x800)
    v.copy(0x5AD6, 0x8800, 0x800)
    v.copy(0x52D6, 0x9000, 0x800)
    tennis_tilemap(v, 0x6F16)
    tennis_tilemap(v, 0x5180)
    return v


def convert_tile(px, wall=False):
    """-> (8 octets du caractère, multicolore ?, teinte encre si haute résolution)
    wall : case de mur sans teinte 2 -> la teinte 1 prend la couleur de la case."""
    shades = {c for r in px for c in r}
    if wall and shades <= {0, 2, 3} and 0 in shades:        # décor noir sur fond clair
        return bytes(sum(0x80 >> x for x in range(8) if px[y][x] >= 2) for y in range(8)), False, 3
    if 0 in shades and len(shades) <= 2 or shades == {0}:
        ink = max(shades)
        return bytes(sum(0x80 >> x for x in range(8) if px[y][x] == ink and ink) for y in range(8)), False, ink
    code = {0: 0, 1: 3, 3: 2, 2: 2} if wall else {0: 0, 1: 1, 3: 2, 2: 3}
    out = []
    for y in range(8):
        b = 0
        for fx in range(4):
            s = max(px[y][2 * fx], px[y][2 * fx + 1])
            b |= code[s] << (6 - 2 * fx)
        out.append(b)
    return bytes(out), True, None


def components(v):
    """Silhouettes du public : composantes connexes des pixels de teinte 1-2
    dans l'image GB 256x256 -> numéro de composante par pixel."""
    img = [[0] * 256 for _ in range(256)]
    for ty in range(32):
        for tx in range(32):
            px = v.map_tile(tx, ty)
            for y in range(8):
                for x in range(8):
                    img[ty * 8 + y][tx * 8 + x] = px[y][x]
    comp = {}
    n = 0
    for y in range(256):
        for x in range(256):
            if img[y][x] in (1, 2) and (x, y) not in comp:
                stack = [(x, y)]
                comp[(x, y)] = n
                while stack:
                    cx, cy = stack.pop()
                    for dx in (-1, 0, 1):
                        for dy in (-1, 0, 1):
                            nx, ny = cx + dx, cy + dy
                            if 0 <= nx < 256 and 0 <= ny < 256 and (nx, ny) not in comp and img[ny][nx] in (1, 2):
                                comp[(nx, ny)] = n
                                stack.append((nx, ny))
                n += 1
    return comp, img, comp_sizes(comp)


def comp_sizes(cmap):
    sizes = {}
    for k in cmap.values():
        sizes[k] = sizes.get(k, 0) + 1
    return sizes


def is_figure(gx, gy, comp):
    """Case d'un personnage (spectateur, arbitre) : pixels de teinte 1-2
    appartenant à une petite silhouette. Sinon : décor (murs, filet...)."""
    c0, c1, r0, r1 = UMPIRE
    if c0 <= gx < c1 and r0 <= gy < r1:
        return True
    cmap, img, sizes = comp
    for y in range(8):
        for x in range(8):
            p = (gx * 8 + x, gy * 8 + y)
            if img[p[1]][p[0]] in (1, 2) and sizes[cmap[p]] <= 400:
                return True
    return False


def mc_color(gx, gy, comp, v):
    """Couleur (teinte 2) d'une case multicolore : arbitre, filet ou spectateur."""
    c0, c1, r0, r1 = UMPIRE
    if c0 <= gx < c1 and r0 <= gy < r1:
        return UMPIRE_COL
    cmap, img, sizes = comp
    count = {}
    for y in range(8):
        for x in range(8):
            p = (gx * 8 + x, gy * 8 + y)
            if img[p[1]][p[0]] == 2:
                k = cmap[p]
                count[k] = count.get(k, 0) + 1
    if not count:
        return NET_COL
    k = max(count, key=count.get)
    big = sizes[k] > 400                                     # grande zone : filet, murs
    return NET_COL if big else CROWD_COLS[k % len(CROWD_COLS)]


def main():
    v = court_vram()
    comp = components(v)
    chars = {}          # tuile GB -> (code caractère, octets, multicolore, encre)
    screen = [[0x20] * 40 for _ in range(25)]
    color = [[0] * 40 for _ in range(25)]
    for r in range(25):
        for gx in range(32):
            t = v.mem[0x1800 + (FIRST_ROW + r) * 32 + gx]
            px = v.tile(t)
            wall = not is_figure(gx, FIRST_ROW + r, comp)
            if (t, wall) not in chars:
                data, mc, ink = convert_tile(px, wall)
                chars[(t, wall)] = (len(chars), data, mc, ink)
            code, data, mc, ink = chars[(t, wall)]
            screen[r][COL0 + gx] = code
            if mc:
                col = COURT_INK if wall else mc_color(gx, FIRST_ROW + r, comp, v)
                color[r][COL0 + gx] = 8 | (col & 7)
            else:
                color[r][COL0 + gx] = 0 if ink == 3 else COURT_INK
    print(f'{len(chars)} caractères')
    # colonnes 0-3 et 36-39 : vides (fond noir via caractère plein ? pour l'instant espace = code 0 ?)
    blank = len(chars)
    for r in range(25):
        for c in list(range(COL0)) + list(range(COL0 + 32, 40)):
            screen[r][c] = blank
            color[r][c] = 0
    charset = bytearray(2048)
    for code, data, mc, ink in chars.values():
        charset[code * 8:code * 8 + 8] = data
    charset[blank * 8:blank * 8 + 8] = b'\xAA' * 8        # multicolore 10 = $D023 (noir)
    for r in range(25):
        for c in list(range(COL0)) + list(range(COL0 + 32, 40)):
            color[r][c] = 8
    write_asm(charset, screen, color)
    preview(charset, screen, color)


def write_asm(charset, screen, color):
    """Trois fichiers : chaque bloc est placé par src/main.asm à son adresse."""
    head = '; Fichier généré par tools/gen_c64gfx.py : décor du stade (tuiles du Tennis GB).'

    def dump(name, label, rows):
        out = [head, label] + ['        .byte ' + ', '.join(f'${b:02X}' for b in r) for r in rows]
        open(os.path.join(ROOT, 'gfx', name), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    dump('court_charset.asm', 'court_charset', [charset[k:k + 16] for k in range(0, 2048, 16)])
    dump('court_screen.asm', 'court_screen', screen)
    dump('court_colors.asm', 'court_colors', color)
    open(os.path.join(ROOT, 'gfx', 'court.asm'), 'w', encoding='utf-8').write(
        f'{head}\nCOURT_BG0 = {BG0}\nCOURT_BG1 = {BG1}\nCOURT_BG2 = {BG2}\n')


def preview(charset, screen, color, scale=2):
    im = Image.new('RGB', (320, 200))
    px = im.load()
    for r in range(25):
        for c in range(40):
            ch = screen[r][c]
            col = color[r][c]
            for y in range(8):
                b = charset[ch * 8 + y]
                if col & 8:
                    for fx in range(4):
                        v = (b >> (6 - 2 * fx)) & 3
                        rgb = PAL[[BG0, BG1, BG2, col & 7][v]]
                        px[c * 8 + 2 * fx, r * 8 + y] = rgb
                        px[c * 8 + 2 * fx + 1, r * 8 + y] = rgb
                else:
                    for x in range(8):
                        px[c * 8 + x, r * 8 + y] = PAL[col & 7] if b & (0x80 >> x) else PAL[BG0]
    os.makedirs(os.path.join(ROOT, 'build'), exist_ok=True)
    im.resize((320 * scale, 200 * scale), Image.NEAREST).save(os.path.join(ROOT, 'build', 'court_preview.png'))


if __name__ == '__main__':
    main()
