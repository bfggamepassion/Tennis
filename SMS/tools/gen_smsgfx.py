"""Décor Master System : le stade du Tennis GB mis en couleurs, en mode 4
(256x192, 16 couleurs par tuile, 2 palettes de 16).

Le stade GB fait 256 pixels de large : il remplit l'écran. 24 rangées GB
(2 à 25) sont affichées : y écran = y GB - 16 (comme la version Coleco).

Les 4 teintes du GB sont remplacées par des couleurs selon la zone du pixel,
trouvée par la forme du stade :
  - public (à gauche et à droite, au-delà du liseré des murs) : fond bleu
    nuit, et chaque spectateur (groupe de pixels) reçoit ses couleurs :
    cheveux, peau, col blanc, vêtements (au hasard, mais toujours les mêmes) ;
  - murs : vert sombre, liseré clair ;
  - sol : court bleu (zone fermée par les lignes), vert autour, lignes blanches ;
  - filet : bande blanche, mailles grises, poteaux noirs ;
  - Mario (l'arbitre) : casquette et chemise rouges, salopette bleue, peau ;
    sa chaise en bois.
Le public utilise la palette des sprites (ses couleurs y sont déjà), le reste
la palette du décor. Les tuiles identiques à un retournement près sont
partagées.

Sorties : gfx/court.asm (tuiles), gfx/court_map.asm (palettes, carte 32x24
de mots), gfx/font.asm
(police 1 bit par pixel, codes 32-95), build/court_preview.png
"""
import os
import random
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen_cpcgfx as g  # noqa: E402  (VRAM GB du stade, décodeur de tilemap)
import sms  # noqa: E402

ROOT = os.path.join(HERE, '..')
FIRST_ROW = 2
ROWS = 24
W, H = 256, ROWS * 8

# Palettes (noms de sms.COLORS). La couleur 0 des sprites est transparente
# pour eux, mais visible pour le décor qui utilise cette palette (public).
PAL_BG = ['black', 'court', 'field', 'white', 'wall', 'edge', 'dgreen', 'grey',
          'dgrey', 'red', 'blue', 'skin', 'brown', 'orange', 'yellow', 'navy']
PAL_SPR = ['navy', 'black', 'skin', 'white', 'red', 'dred', 'lblue', 'dblue',
           'ball', 'brown', 'grey', 'dgrey', 'green', 'dgreen', 'wall', 'edge']

# Zones du stade (pixels écran)
NET = (40, 176, 102, 112)           # x0, x1, y0, y1 (exclus)
MARIO = (170, 192, 72, 97)
CHAIR = [(180, 192, 97, 112), (190, 192, 85, 97),      # échelle, montant
         (181, 191, 93, 97), (188, 190, 85, 93)]       # siège, dossier
CHAIR_SOLID = CHAIR[2:]             # siège et dossier : pleins (le sol n'y est pas visible)

# Spectateurs : vêtements (clair, foncé) et cheveux
SHIRTS = [('red', 'dred'), ('lblue', 'dblue'), ('white', 'grey'), ('green', 'dgreen'),
          ('ball', 'brown'), ('grey', 'dgrey'), ('red', 'dred'), ('lblue', 'dblue')]
HAIR = ['black', 'brown', 'ball', 'dgrey', 'brown', 'black']
SKIN = ['skin']

# Police : tuiles de l'écran titre GB + signes dessinés à la main
EXTRA = {                       # signes absents de la police GB (8 lignes de 8 pixels)
    '-': ['', '', '', '######', '', '', '', ''],
    '/': ['      #', '     #', '    #', '   #', '  #', ' #', '#', ''],
    ':': ['', '  ##', '  ##', '', '', '  ##', '  ##', ''],
    '.': ['', '', '', '', '', '  ##', '  ##', ''],
    ',': ['', '', '', '', '', '  ##', '  ##', ' ##'],
    '!': ['  ##', '  ##', '  ##', '  ##', '  ##', '', '  ##', ''],
    '>': [' #', '  #', '   #', '    #', '   #', '  #', ' #', ''],
    '<': ['     #', '    #', '   #', '  #', '   #', '    #', '     #', ''],
    '+': ['', '   #', '   #', ' #####', '   #', '   #', '', ''],
    '(': ['   #', '  #', ' #', ' #', ' #', '  #', '   #', ''],
    ')': [' #', '  #', '   #', '   #', '   #', '  #', ' #', ''],
    "'": ['  #', '  #', ' #', '', '', '', '', ''],
    '#': ['', ' #  #', '######', ' #  #', ' #  #', '######', ' #  #', ''],
    '*': ['', ' #  #', '  ##', '######', '  ##', ' #  #', '', ''],
}


def shades():
    """Teintes GB (0-3) du stade affiché : S[y][x]."""
    v = g.court_vram()
    S = [[0] * W for _ in range(H)]
    for r in range(ROWS):
        for c in range(32):
            t = v.map_tile(c, FIRST_ROW + r)
            for y in range(8):
                for x in range(8):
                    S[r * 8 + y][c * 8 + x] = t[y][x]
    return S


def inside(x, y, box):
    x0, x1, y0, y1 = box
    return x0 <= x < x1 and y0 <= y < y1


def colorize(S):
    """-> image H x W de noms de couleurs, et la palette (0 ou 1) de chaque pixel."""
    img = [[None] * W for _ in range(H)]
    crowd = [[False] * W for _ in range(H)]
    floor = [[False] * W for _ in range(H)]
    for y in range(H):
        row = S[y]
        # public : jusqu'au dernier pixel noir à gauche, depuis le premier à droite
        left = max((x for x in range(40) if row[x] == 3), default=-1) if y < 100 else -1
        right = min((x for x in range(196, W) if row[x] == 3), default=W)
        for x in range(left + 1):
            crowd[y][x] = True
        for x in range(right, W):
            crowd[y][x] = True
        # murs : liseré (teinte 0 juste après le public), puis bande jusqu'au sol
        fl = wall_scan(row, left, +1, img[y], y)
        fr = wall_scan(row, right, -1, img[y], y)
        for x in range(fl, fr + 1):
            floor[y][x] = True
    color_crowd(S, img, crowd)
    color_floor(S, img, floor)
    return img


def wall_scan(row, start, step, out, y):
    """Colorie le mur à partir du public (start : dernier pixel du public, ou
    hors écran) et renvoie le premier pixel du sol."""
    x = start + step
    crowd = 0 <= start < W
    k = x                                       # liseré : teintes 0 juste après le public
    while 0 <= k < W and abs(k - x) < 3 and row[k] != 0:
        k += step
    if 0 <= k < W and row[k] == 0 and (crowd or row[k + step] != 0):
        while 0 <= k < W and row[k] == 0:
            out[k] = 'edge'
            k += step
        for j in range(x, k, step):
            if out[j] is None:
                out[j] = 'wall'
        x = k
    while 0 <= x < W and row[x] != 0:
        out[x] = 'dgreen' if row[x] >= 2 else 'wall'
        x += step
    return x


def color_crowd(S, img, crowd):
    seen = [[False] * W for _ in range(H)]
    rnd = random.Random(1989)
    for y in range(H):
        for x in range(W):
            if not crowd[y][x]:
                continue
            if S[y][x] == 3:
                img[y][x] = 'navy'
                continue
            if seen[y][x]:
                continue
            # un spectateur : pixels non noirs reliés (8 voisins)
            comp = []
            stack = [(x, y)]
            seen[y][x] = True
            while stack:
                cx, cy = stack.pop()
                comp.append((cx, cy))
                for dx in (-1, 0, 1):
                    for dy in (-1, 0, 1):
                        nx, ny = cx + dx, cy + dy
                        if 0 <= nx < W and 0 <= ny < H and not seen[ny][nx] \
                                and crowd[ny][nx] and S[ny][nx] != 3:
                            seen[ny][nx] = True
                            stack.append((nx, ny))
            top = min(p[1] for p in comp)
            collar = [p[1] for p in comp if S[p[1]][p[0]] == 0]
            neck = min(collar) if collar else top + 9
            light, dark = rnd.choice(SHIRTS)
            hair = rnd.choice(HAIR)
            skin = rnd.choice(SKIN)
            for px, py in comp:
                s = S[py][px]
                if py < neck:
                    img[py][px] = {0: skin, 1: skin, 2: hair}[s]
                else:
                    img[py][px] = {0: 'white', 1: light, 2: dark}[s]


def color_floor(S, img, floor):
    # sol hors du court : atteint depuis les bords du sol sans traverser de ligne
    special = [[inside(x, y, NET) or inside(x, y, MARIO) or any(inside(x, y, b) for b in CHAIR)
                for x in range(W)] for y in range(H)]
    reach = [[False] * W for _ in range(H)]
    stack = []
    for y in range(H):
        xs = [x for x in range(W) if floor[y][x]]
        if not xs:
            continue
        seeds = [xs[0], xs[-1]]
        if y in (16, H - 1):
            seeds = xs
        for x in seeds:
            if S[y][x] == 0 and not (special[y][x] and not inside(x, y, MARIO)):
                stack.append((x, y))
    while stack:
        x, y = stack.pop()
        if reach[y][x]:
            continue
        reach[y][x] = True
        for nx, ny in ((x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)):
            if 0 <= nx < W and 0 <= ny < H and floor[ny][nx] and S[ny][nx] == 0 \
                    and not reach[ny][nx] and not inside(nx, ny, NET) \
                    and not any(inside(nx, ny, b) for b in CHAIR):
                stack.append((nx, ny))

    def ground(x, y):
        return 'field' if reach[y][x] else 'court'

    for y in range(H):
        for x in range(W):
            if not floor[y][x] or img[y][x] is not None:
                continue
            s = S[y][x]
            if inside(x, y, NET):
                if s == 0:
                    yy = NET[2] - 1                     # le sol derrière les mailles
                    while yy > 0 and S[yy][x] != 0:
                        yy -= 1
                    img[y][x] = ground(x, yy)
                else:
                    img[y][x] = {1: 'white', 2: 'grey', 3: 'black'}[s]
            elif any(inside(x, y, b) for b in CHAIR):
                see = 'orange' if any(inside(x, y, b) for b in CHAIR_SOLID) else 'field'
                img[y][x] = {0: see, 1: 'orange', 2: 'brown', 3: 'black'}[s]
            elif inside(x, y, MARIO):
                if s == 3:
                    img[y][x] = 'black'
                elif s == 0 and reach[y][x]:
                    img[y][x] = 'field'                 # le sol autour de lui
                elif y < 80:                            # casquette (et son écusson blanc)
                    img[y][x] = 'white' if s == 0 else 'red'
                elif y < 85:                            # visage : peau, yeux blancs
                    img[y][x] = {0: 'white', 1: 'skin', 2: 'red'}[s]
                elif y >= 93 and s == 2:                # chaussures
                    img[y][x] = 'brown'
                else:                                   # manches rouges, salopette bleue
                    img[y][x] = 'red' if s == 0 else 'blue'
            elif s == 0:
                img[y][x] = ground(x, y)
            else:
                img[y][x] = 'white'                     # lignes du court


def to_tiles(img, tiles=None, base=0):
    """Image de noms -> cases de la carte (mots). Chaque tuile prend la palette
    du décor si elle suffit, sinon celle des sprites."""
    tiles = tiles or sms.TileSet()
    cmap = []
    for r in range(len(img) // 8):
        row = []
        for c in range(32):
            block = [img[r * 8 + y][c * 8:c * 8 + 8] for y in range(8)]
            names = {n for line in block for n in line}
            if names <= set(PAL_BG):
                pal, bit = PAL_BG, 0
            elif names <= set(PAL_SPR):
                pal, bit = PAL_SPR, 8
            else:
                raise SystemExit(f'tuile ({c}, {r}) : couleurs dans aucune palette : {sorted(names)}')
            px = [[pal.index(n) for n in line] for line in block]
            n, flip = tiles.add(px)
            t = base + n
            row.append((t & 0xFF) | (((t >> 8) | flip | bit) << 8))
        cmap.append(row)
    return tiles, cmap


def title_vram():
    """VRAM GB de l'écran titre (police : tuiles $D0-$F3)."""
    v = g.VRAM(g.ROM, fill_tile=0x80)
    v.copy(0x62D6, 0x8000, 0x800)
    v.copy(0x5AD6, 0x8800, 0x800)
    v.copy(0x52D6, 0x9000, 0x800)
    v.copy(0x71B4, 0x8800, 0x500)
    g.tennis_tilemap(v, 0x76B4)
    return v


def font_rows():
    """64 caractères (codes 32-95) : 8 octets de motif (1 = encre) chacun."""
    v = title_vram()
    out = []
    for code in range(32, 96):
        ch = chr(code)
        rows = [0] * 8
        if ch.isdigit() or ('A' <= ch <= 'Z'):
            tile = 0xD0 + int(ch) if ch.isdigit() else 0xDA + ord(ch) - ord('A')
            px = v.tile(tile)
            rows = [sum(0x80 >> x for x in range(8) if px[y][x]) for y in range(8)]
        elif ch in EXTRA:
            rows = [sum(0x80 >> x for x, c in enumerate(r) if c == '#') for r in EXTRA[ch]]
        out.append(rows)
    return out


def palette_lines():
    out = ['pal_bg']
    out += sms.db_lines(bytes(sms.sms_byte(n) for n in PAL_BG))
    out.append('pal_spr')
    out += sms.db_lines(bytes(sms.sms_byte(n) for n in PAL_SPR))
    return out


def main():
    img = colorize(shades())
    tiles, cmap = to_tiles(img)
    assert len(tiles.tiles) <= 256, f'{len(tiles.tiles)} tuiles'
    out = ['; Fichier généré par tools/gen_smsgfx.py : tuiles du stade (page GFX_BANK).', '',
           f'COURT_NT    equ {len(tiles.tiles)}',
           'court_tiles']
    for t in tiles.tiles:
        out += sms.db_lines(t, 32)
    open(os.path.join(ROOT, 'gfx', 'court.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    out = ['; Fichier généré par tools/gen_smsgfx.py : palettes et carte du stade (pages fixes).', '',
           f'PAL_TEXT    equ {PAL_BG.index("white")}          ; encre de la police (palette du décor)']
    out += palette_lines()
    out.append('court_map                   ; 24 rangées x 32 cases (mots)')
    for row in cmap:
        out += sms.dw_lines(row, 16)
    open(os.path.join(ROOT, 'gfx', 'court_map.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    font = font_rows()
    fo = ['; Fichier généré par tools/gen_smsgfx.py : police (codes 32-95), 1 bit par pixel.', 'font']
    for code, rows in enumerate(font, 32):
        fo.append('        db ' + ', '.join(f'${b:02X}' for b in rows) + f'   ; {chr(code)!r}')
    open(os.path.join(ROOT, 'gfx', 'font.asm'), 'w', encoding='utf-8').write('\n'.join(fo) + '\n')
    print(f'décor : {len(tiles.tiles)} tuiles ({len(tiles.tiles) * 32} octets)')
    check(img, tiles, cmap)
    preview(img)


def decode_map(tiles, cmap, base=0):
    """Carte + tuiles -> image de noms (vérification du codage)."""
    out = [[None] * W for _ in range(len(cmap) * 8)]
    for r, row in enumerate(cmap):
        for c, word in enumerate(row):
            t = (word & 0xFF) | ((word >> 8) & 1) << 8
            px = sms.tile_px(tiles.tiles[t - base])
            if word & 0x200:
                px = sms.hflip(px)
            if word & 0x400:
                px = sms.vflip(px)
            pal = PAL_SPR if word & 0x800 else PAL_BG
            for y in range(8):
                for x in range(8):
                    out[r * 8 + y][c * 8 + x] = pal[px[y][x]]
    return out


def check(img, tiles, cmap, base=0):
    dec = decode_map(tiles, cmap, base)
    bad = sum(1 for y in range(len(img)) for x in range(W)
              if sms.rgb(img[y][x]) != sms.rgb(dec[y][x]))
    assert bad == 0, f'{bad} pixels mal codés'


def preview(img, name='court_preview.png'):
    im = Image.new('RGB', (W, len(img)))
    px = im.load()
    for y, line in enumerate(img):
        for x, n in enumerate(line):
            px[x, y] = sms.rgb(n)
    os.makedirs(os.path.join(ROOT, 'build'), exist_ok=True)
    im.resize((W * 2, len(img) * 2), Image.NEAREST).save(os.path.join(ROOT, 'build', name))


if __name__ == '__main__':
    main()
