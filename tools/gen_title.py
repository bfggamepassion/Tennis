"""Écran de présentation de ZX Tennis.

Compose un écran Spectrum (6144 octets de pixels + 768 d'attributs) :
  - « ZX » en grand (police de la ROM Spectrum agrandie x3), une couleur par rangée ;
  - le logo « TENNIS » et les raquettes de l'écran titre de la ROM GB
    ($71B4 + tilemap $76B4), bande étendue à toute la largeur ;
  - les rayures arc-en-ciel du Spectrum en bas à droite ;
  - le bas de l'écran (fond noir) reçoit le texte du menu.
Sorties : asm/gfx/title.scr (écran de chargement, bloc SCREEN$),
          asm/gfx/title.asm (même écran compressé RLE, pour le menu),
          asm/build/title_preview.png.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..', 're'))
import extract_gfx as g  # noqa: E402
from PIL import Image  # noqa: E402
from skoolkit import ROM48  # noqa: E402

GFX = os.path.join(HERE, '..', 'asm', 'gfx')
PREVIEW = os.path.join(HERE, '..', 'asm', 'build', 'title_preview.png')

BLACK, BLUE, RED, MAGENTA, GREEN, CYAN, YELLOW, WHITE = range(8)
BRIGHT = 0x40


def attr(ink, paper, bright=True):
    return (BRIGHT if bright else 0) | (paper << 3) | ink


# --- Écran de travail : pixels 256x192 (0/1) et attributs 32x24 ---
pix = [[0] * 256 for _ in range(192)]
att = [[attr(WHITE, BLACK) for _ in range(32)] for _ in range(24)]

# --- Logo GB : rangées de tuiles 1 à 8 de l'écran titre (y 8-71), 20 colonnes ---
vram = g.boot_vram()
vram.copy(0x71B4, 0x8800, 0x500)
vram.tilemap(0x76B4)


def gb_tile(tx, ty):
    t = vram.mem[0x1800 + ty * 32 + tx]
    a = 0x9000 + ((t - 256 if t > 127 else t) * 16)
    return g.tile_pixels(vram.mem, a - 0x8000)


LOGO_ROW = 5            # rangée Spectrum de la première rangée de la bande
LOGO_COL = 6            # colonne Spectrum du logo (20 colonnes -> 6..25)
BAND_ROWS = range(1, 9)  # rangées de tuiles GB de la bande (filets compris)
# tuile unie pour prolonger chaque rangée de la bande hors du logo :
# filet du haut ($B1), fond de bande ($81), filet du bas ($B2)
EXTEND = {1: (0, 1), 8: (0, 8)}
for i, ty in enumerate(BAND_ROWS):
    for sc in range(32):
        if LOGO_COL <= sc < LOGO_COL + 20:
            px = gb_tile(sc - LOGO_COL, ty)
        else:
            px = gb_tile(*EXTEND.get(ty, (0, 2)))
        for y in range(8):
            for x in range(8):
                pix[(LOGO_ROW + i) * 8 + y][sc * 8 + x] = 1 if px[y][x] >= 2 else 0
        att[LOGO_ROW + i][sc] = attr(BLACK, GREEN)

# --- « ZX » : police de la ROM Spectrum, x3, centré au-dessus de la bande ---
rom = open(ROM48, 'rb').read()


def glyph(ch):
    o = 0x3D00 + (ord(ch) - 32) * 8
    return rom[o:o + 8]


ZX_TOP = 1              # rangées 1-4 (x4 : 32 pixels de haut)
ZX_SCALE = 4
x0 = 128 - 8 * ZX_SCALE
for k, ch in enumerate('ZX'):
    gl = [b | (b >> 1) for b in glyph(ch)]      # gras
    for y in range(8):
        for x in range(8):
            if gl[y] & (0x80 >> x):
                for dy in range(ZX_SCALE):
                    for dx in range(ZX_SCALE):
                        pix[ZX_TOP * 8 + y * ZX_SCALE + dy][x0 + k * 8 * ZX_SCALE + x * ZX_SCALE + dx] = 1
for r, ink in zip(range(ZX_TOP, ZX_TOP + 4), (RED, YELLOW, GREEN, CYAN)):
    for c in range(32):
        att[r][c] = attr(ink, BLACK)

# --- Rayures arc-en-ciel du Spectrum (en haut à droite, en diagonale) ---
RAINBOW = (RED, YELLOW, GREEN, CYAN)
for r in range(0, 4):
    for k, col in enumerate(RAINBOW):
        c = 27 + k - r + 1
        if 0 <= c < 32:
            att[r][c] = attr(BLACK, col)
            for y in range(8):
                for x in range(8):
                    pix[r * 8 + y][c * 8 + x] = 0

# --- Crédit en bas (police ROM, taille normale) ---


def text(row, col, s, ink=WHITE):
    for k, ch in enumerate(s):
        gl = glyph(ch)
        for y in range(8):
            for x in range(8):
                pix[row * 8 + y][(col + k) * 8 + x] = 1 if gl[y] & (0x80 >> x) else 0
        att[row][col + k] = attr(ink, BLACK)


text(23, 1, 'based on Nintendo, 1989', CYAN)


# --- Encodage Spectrum ---
def to_scr():
    data = bytearray(6912)
    for y in range(192):
        addr = ((y & 0xC0) << 5) | ((y & 7) << 8) | ((y & 0x38) << 2)
        for cx in range(32):
            b = 0
            for x in range(8):
                if pix[y][cx * 8 + x]:
                    b |= 0x80 >> x
            data[addr + cx] = b
    for r in range(24):
        for c in range(32):
            data[6144 + r * 32 + c] = att[r][c]
    return data


def rle(data):
    """Paquets : n (1-127) suivi de n octets littéraux, ou $80+n (n 3-127)
    suivi d'un octet répété n fois. $00 : fin."""
    out = bytearray()
    i = 0
    lit = bytearray()

    def flush():
        nonlocal lit
        while lit:
            chunk = lit[:127]
            out.append(len(chunk))
            out.extend(chunk)
            lit = lit[127:]
    while i < len(data):
        j = i
        while j < len(data) and data[j] == data[i] and j - i < 127:
            j += 1
        if j - i >= 3:
            flush()
            out.append(0x80 | (j - i))
            out.append(data[i])
            i = j
        else:
            lit.append(data[i])
            i += 1
    flush()
    out.append(0)
    return out


def main():
    scr = to_scr()
    os.makedirs(GFX, exist_ok=True)
    open(os.path.join(GFX, 'title.scr'), 'wb').write(scr)
    packed = rle(scr)
    lines = ['; Fichier généré par tools/gen_title.py : écran de présentation compressé (RLE).',
             '; Paquets : n (1-127) + n octets, ou $80+n + octet répété n fois ; 0 = fin.',
             'title_rle:']
    for k in range(0, len(packed), 16):
        lines.append('        db ' + ', '.join(f'${b:02X}' for b in packed[k:k + 16]))
    open(os.path.join(GFX, 'title.asm'), 'w', encoding='utf-8').write('\n'.join(lines) + '\n')
    # aperçu
    pal = [[(0, 0, 0), (0, 0, 205), (205, 0, 0), (205, 0, 205), (0, 205, 0), (0, 205, 205), (205, 205, 0), (205, 205, 205)],
           [(0, 0, 0), (0, 0, 255), (255, 0, 0), (255, 0, 255), (0, 255, 0), (0, 255, 255), (255, 255, 0), (255, 255, 255)]]
    im = Image.new('RGB', (256, 192))
    for y in range(192):
        for x in range(256):
            a = att[y // 8][x // 8]
            p = pal[(a >> 6) & 1]
            im.putpixel((x, y), p[a & 7] if pix[y][x] else p[(a >> 3) & 7])
    os.makedirs(os.path.dirname(PREVIEW), exist_ok=True)
    im.resize((768, 576), Image.NEAREST).save(PREVIEW)
    print(f'écran titre : {len(packed)} octets compressés (sur 6912)')


if __name__ == '__main__':
    main()
