"""Extraction des graphismes de la ROM Tennis (GB) en PNG.

- planches de tuiles brutes (2bpp) pour chaque bloc copié en VRAM ;
- reconstitution des écrans (fond) en rejouant les copies de tuiles et le
  décodeur de tilemap du jeu (routine $326b).
"""
import os

from PIL import Image

HERE = os.path.dirname(__file__)
ROM = open(os.path.join(HERE, 'tennis.gb'), 'rb').read()
OUT = os.path.join(HERE, 'gfx')
os.makedirs(OUT, exist_ok=True)

# Teintes DMG : 0 = blanc ... 3 = noir (palette $e4 = identité)
SHADES = [(224, 248, 208), (136, 192, 112), (52, 104, 86), (8, 24, 32)]


def tile_pixels(data, off):
    rows = []
    for y in range(8):
        lo, hi = data[off + 2 * y], data[off + 2 * y + 1]
        rows.append([((lo >> (7 - x)) & 1) | (((hi >> (7 - x)) & 1) << 1) for x in range(8)])
    return rows


def sheet(src, length, name, per_row=16, scale=3):
    n = length // 16
    rows = (n + per_row - 1) // per_row
    img = Image.new('RGB', (per_row * 9 + 1, rows * 9 + 1), (255, 0, 255))
    for t in range(n):
        px = tile_pixels(ROM, src + t * 16)
        bx, by = 1 + (t % per_row) * 9, 1 + (t // per_row) * 9
        for y in range(8):
            for x in range(8):
                img.putpixel((bx + x, by + y), SHADES[px[y][x]])
    img = img.resize((img.width * scale, img.height * scale), Image.NEAREST)
    img.save(os.path.join(OUT, name))


class VRAM:
    def __init__(self):
        self.mem = bytearray(0x2000)  # $8000-$9fff
        # $3001 : le jeu remplit les deux tilemaps ($9800-$9fff) avec la tuile $80
        self.mem[0x1800:0x2000] = bytes([0x80]) * 0x800

    def copy(self, src, dst, length):
        self.mem[dst - 0x8000:dst - 0x8000 + length] = ROM[src:src + length]

    def tilemap(self, hl, de=0x9800, c=1):
        """Rejoue la routine $326b : flux d'octets écrits avec un pas c."""
        while True:
            a = ROM[hl]; hl += 1
            if a != 0xF9:
                self.mem[de - 0x8000] = a
                de += c
                continue
            a = ROM[hl]; hl += 1
            if a == 0x02:  # répétition : compte, valeur
                b = ROM[hl]; hl += 1
                v = ROM[hl]; hl += 1
                for _ in range(b):
                    self.mem[de - 0x8000] = v
                    de += c
                continue
            if a == 0:
                return hl
            c = a
            de = ROM[hl] | (ROM[hl + 1] << 8); hl += 2

    def render(self, name, signed=True, base=0x9800, w=20, h=18, scale=3):
        img = Image.new('RGB', (w * 8, h * 8))
        for ty in range(h):
            for tx in range(w):
                t = self.mem[base - 0x8000 + ty * 32 + tx]
                if signed:
                    addr = 0x9000 + (t - 256 if t > 127 else t) * 16
                else:
                    addr = 0x8000 + t * 16
                px = tile_pixels(self.mem, addr - 0x8000)
                for y in range(8):
                    for x in range(8):
                        img.putpixel((tx * 8 + x, ty * 8 + y), SHADES[px[y][x]])
        img = img.resize((img.width * scale, img.height * scale), Image.NEAREST)
        img.save(os.path.join(OUT, name))


def boot_vram():
    v = VRAM()
    v.copy(0x62D6, 0x8000, 0x800)
    v.copy(0x5AD6, 0x8800, 0x800)
    v.copy(0x52D6, 0x9000, 0x800)
    return v


# Planches brutes
sheet(0x62D6, 0x800, 'tiles_62d6_sprites_8000.png')
sheet(0x5AD6, 0x800, 'tiles_5ad6_8800.png')
sheet(0x52D6, 0x800, 'tiles_52d6_9000.png')
sheet(0x69F6, 0x520, 'tiles_69f6_alt_8000.png')
sheet(0x71B4, 0x500, 'tiles_71b4_titre_8800.png')
sheet(0x781D, 0x500, 'tiles_781d_8000.png')
sheet(0x7CFD, 0x300, 'tiles_7cfd_9000.png')

# Écran titre (état 0) et variante (état 2)
for mp, name in ((0x76B4, 'ecran_titre.png'), (0x7785, 'ecran_titre_2.png')):
    v = boot_vram()
    v.copy(0x71B4, 0x8800, 0x500)
    v.tilemap(mp)
    v.render(name)

# Court (état 4) : arbitre à gauche (a) ou à droite (b) selon $ffba bit 1.
# Image = tilemap entier (256x256) ; l'écran GB n'en montre que 160x144.
for over, name in ((0x515A, 'court_a.png'), (0x5180, 'court_b.png')):
    v = boot_vram()
    v.tilemap(0x6F16)
    v.tilemap(over)
    v.render(name, w=32, h=32)

# Vue écran du court, au cadrage relevé dans l'émulateur (SCX=$24, SCY=$30)
full = Image.open(os.path.join(OUT, 'court_b.png'))
full.crop((0x24 * 3, 0x30 * 3, (0x24 + 160) * 3, (0x30 + 144) * 3)).save(os.path.join(OUT, 'court_vue_ecran.png'))

# Écran des états 8/9 (routine $041a)
v = boot_vram()
v.copy(0x781D, 0x8000, 0x500)
v.copy(0x7CFD, 0x9000, 0x300)
v.tilemap(0x7F7D)
v.tilemap(0x520E)
v.render('ecran_041a.png')
print('ok')
