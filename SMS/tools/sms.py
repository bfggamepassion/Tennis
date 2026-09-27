"""Outils communs du VDP de la Master System (mode 4) : couleurs, palettes,
tuiles 8x8 en 4 bits par pixel, dédoublonnage avec retournements, aperçus.

Couleur : 6 bits %00BBGGRR (4 niveaux par composante : 0, 85, 170, 255).
Deux palettes de 16 couleurs :
  - palette 0 : décor ;
  - palette 1 : sprites (la couleur 0 y est transparente), utilisable aussi
    par le décor (bit 3 de l'octet haut d'une case de la carte).
Tuile : 32 octets, 4 octets par ligne (plans de bits 0 à 3, bit 7 = pixel
de gauche).
Case de la carte (2 octets) : octet bas = tuile (bits 0-7) ; octet haut :
bit 0 tuile (bit 8), bit 1 miroir horizontal, bit 2 miroir vertical,
bit 3 palette des sprites, bit 4 devant les sprites.
"""

# Couleurs nommées (R, G, B de 0 à 3)
COLORS = {
    'black': (0, 0, 0),
    'navy': (0, 0, 1),            # fond du public
    'white': (3, 3, 3),
    'grey': (2, 2, 2),
    'dgrey': (1, 1, 1),
    'red': (3, 0, 0),
    'dred': (2, 0, 0),
    'blue': (0, 1, 3),
    'dblue': (0, 0, 2),
    'lblue': (1, 2, 3),
    'yellow': (3, 3, 0),
    'ball': (3, 3, 1),
    'orange': (3, 2, 0),
    'brown': (2, 1, 0),
    'dbrown': (1, 0, 0),
    'skin': (3, 2, 1),
    'green': (0, 2, 0),
    'dgreen': (0, 1, 0),
    'lgreen': (2, 3, 1),
    'court': (0, 1, 2),           # court : bleu
    'field': (0, 2, 1),           # autour du court : vert
    'wall': (0, 1, 1),            # murs du stade
    'edge': (2, 3, 2),            # liseré des murs
    'purple': (2, 0, 2),
    'cyan': (0, 3, 3),
    'pink': (3, 1, 2),
}


def rgb(name):
    r, g, b = COLORS[name]
    return (r * 85, g * 85, b * 85)


def sms_byte(name):
    r, g, b = COLORS[name]
    return r | (g << 2) | (b << 4)


def tile_bytes(px):
    """8 lignes de 8 indices (0-15) -> 32 octets (4 plans par ligne)."""
    out = bytearray()
    for row in px:
        for plane in range(4):
            b = 0
            for x, c in enumerate(row):
                if (c >> plane) & 1:
                    b |= 0x80 >> x
            out.append(b)
    return bytes(out)


def tile_px(data):
    """Inverse de tile_bytes."""
    px = []
    for y in range(8):
        row = []
        for x in range(8):
            c = 0
            for plane in range(4):
                if data[y * 4 + plane] & (0x80 >> x):
                    c |= 1 << plane
            row.append(c)
        px.append(row)
    return px


def hflip(px):
    return [list(reversed(r)) for r in px]


def vflip(px):
    return [list(r) for r in reversed(px)]


class TileSet:
    """Tuiles uniques (à un retournement près) -> numéro + bits de miroir."""

    def __init__(self, flips=True):
        self.tiles = []             # 32 octets chacune
        self.index = {}             # octets -> (numéro, bits de miroir)
        self.flips = flips

    def add(self, px):
        key = tile_bytes(px)
        if key in self.index:
            return self.index[key]
        n = len(self.tiles)
        self.tiles.append(key)
        variants = [(px, 0)]
        if self.flips:
            variants += [(hflip(px), 2), (vflip(px), 4), (vflip(hflip(px)), 6)]
        for v, f in variants:
            self.index.setdefault(tile_bytes(v), (n, f))
        return self.index[key]


def db_lines(data, per=16):
    return ['        db ' + ', '.join(f'${b:02X}' for b in data[k:k + per])
            for k in range(0, len(data), per)]


def dw_lines(data, per=16):
    return ['        dw ' + ', '.join(f'${w:04X}' for w in data[k:k + per])
            for k in range(0, len(data), per)]


def palette_rgb(names):
    return [rgb(n) for n in names]
