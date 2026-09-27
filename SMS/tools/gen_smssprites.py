"""Sprites Master System (mode 4 : 8x16 pixels, 16 couleurs, 8 par ligne).

Une image GB (métasprite de tuiles 8x8, 3 teintes) est mise en couleurs selon
la tuile d'où vient chaque pixel :
  - tuile de raquette (damier de teinte 3) : cordage gris, main en peau ;
  - rangée du haut (tête) : teinte 1 = peau, 2 = couleur du joueur, 3 = noir ;
  - rangée du bas (jambes) : teinte 1 = peau, 2 = short, 3 = noir ;
  - entre les deux (corps) : teinte 1 = peau, 2 = maillot, 3 = noir.
Joueur 1 : maillot rouge, short blanc. Joueur 2 : maillot bleu ciel, short
bleu marine. Balle jaune, ombre noire, marque grise.

L'image est ensuite couverte de sprites 8x16 : une colonne de 8 pixels à la
fois, depuis son premier pixel non vide ; les sprites vides sont omis.

Numéros d'images (comme les autres versions) : 0-19 joueur 1, 20-39 joueur 2,
40-42 balle, 43 ombre, 44 marque.
Format :
  gfx/sprites.asm (code fixe) :
    spr_img : DW adresse de chaque image
    image   : DB n, DB page, DW motifs, puis n x (DB dx, dy)
              dx, dy : coin haut-gauche du sprite depuis le point d'ancrage (signés)
  gfx/sprites_bankN.asm : motifs (n x 64 octets par image, 2 tuiles par
    sprite), dans la page N de la cartouche ($8000-$BFFF)
Sortie : build/sprites_preview.png
"""
import json
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, '..', 're'))
import extract_sprites as es  # noqa: E402
import gen_smsgfx as gfx  # noqa: E402
import sms  # noqa: E402

PAL = gfx.PAL_SPR
TILE_SPRITES = [(0x31, -6, -3, 'ball'), (0x37, -6, -3, 'ball'), (0x38, -6, -3, 'ball'),  # balle
                (0x22, -8, -3, 'black'),                                               # ombre
                (0x2F, -5, -3, 'grey')]                                                # marque
PLAYERS = [('j1', {'head': 'red', 'body': 'red', 'legs': 'white'}),
           ('j2', {'head': 'lblue', 'body': 'lblue', 'legs': 'dblue'})]
MAX_SPR = 8
BANK_SIZE = 0x4000


def is_racket(t):
    """Tuile de raquette : damier de teinte 3 sur fond transparent."""
    px = es.tile_px(t)
    n = 0
    for row in px:
        for x in range(1, 7):
            if row[x] == 3 and row[x - 1] == 0 and row[x + 1] == 0:
                n += 1
    return n >= 4


def color_player(items, colors):
    """Métasprite GB -> {(x, y): nom de couleur}."""
    rows = [dy for dy, _, t, _ in items if not is_racket(t)]
    top, bottom = min(rows), max(rows)
    pix = {}
    for dy, dx, t, attr in items:
        px = es.tile_px(t)
        racket = is_racket(t)
        part = 'head' if dy == top else 'legs' if dy == bottom else 'body'
        for y in range(8):
            for x in range(8):
                sx = 7 - x if attr & 0x20 else x
                sy = 7 - y if attr & 0x40 else y
                s = px[sy][sx]
                if not s:
                    continue
                if racket:
                    c = {1: 'skin', 2: 'skin', 3: 'grey'}[s]
                else:
                    c = {1: 'skin', 2: colors[part], 3: 'black'}[s]
                pix[(dx + x, dy + y)] = c
    return pix


def split(pix):
    """{(x, y): couleur} -> sprites [(dx, dy, 64 octets)] (8x16, 2 tuiles)."""
    out = []
    if not pix:
        return out
    x0 = min(x for x, _ in pix)
    x1 = max(x for x, _ in pix)
    for cx in range(x0, x1 + 1, 8):
        col = [(x, y) for x, y in pix if cx <= x < cx + 8]
        if not col:
            continue
        y = min(yy for _, yy in col)
        y1 = max(yy for _, yy in col)
        while y <= y1:
            px = [[PAL.index(pix[(cx + i, y + j)]) if (cx + i, y + j) in pix else 0
                   for i in range(8)] for j in range(16)]
            if any(any(r) for r in px):
                out.append((cx, y, sms.tile_bytes(px[:8]) + sms.tile_bytes(px[8:])))
            y += 16
    return out


def images():
    frames = json.load(open(os.path.join(ROOT, '..', 're', 'sprites.json')))
    imgs = []
    for pl, colors in PLAYERS:
        for f in frames[pl]['frames']:
            s = split(color_player([tuple(i) for i in f], colors))
            assert len(s) <= MAX_SPR, f'{pl} : {len(s)} sprites'
            imgs.append(s)
    for t, dy, dx, color in TILE_SPRITES:
        px = es.tile_px(t)
        pix = {(dx + x, dy + y): color for y in range(8) for x in range(8) if px[y][x]}
        s = split(pix)
        assert len(s) == 1
        imgs.append(s)
    return imgs


def main():
    imgs = images()
    # motifs rangés page par page (une image ne chevauche pas deux pages)
    banks = [[]]
    used = 0
    place = []
    for s in imgs:
        size = 64 * len(s)
        if used + size > BANK_SIZE:
            banks.append([])
            used = 0
        place.append((len(banks) - 1, used))
        banks[-1].append(s)
        used += size
    out = ['; Fichier généré par tools/gen_smssprites.py : sprites 8x16 en 16 couleurs.', '',
           f'NIMAGES     equ {len(imgs)}',
           f'SPR_BANKS   equ {len(banks)}',
           'spr_img']
    for k in range(0, len(imgs), 8):
        out.append('        dw ' + ', '.join(f'spr_i{i}' for i in range(k, min(k + 8, len(imgs)))))
    for i, (s, (bank, off)) in enumerate(zip(imgs, place)):
        out.append(f'spr_i{i}  db {len(s)}, SPR_BANK0 + {bank}')
        out.append(f'        dw $8000 + {off}')
        for dx, dy, _ in s:
            out.append(f'        db {dx & 0xFF}, {dy & 0xFF}')
    open(os.path.join(ROOT, 'gfx', 'sprites.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    for b, group in enumerate(banks):
        lines = [f'; Fichier généré par tools/gen_smssprites.py : motifs des sprites, page SPR_BANK0 + {b}.']
        for s in group:
            for _, _, data in s:
                lines += sms.db_lines(data, 32)
        open(os.path.join(ROOT, 'gfx', f'sprites_bank{b}.asm'), 'w', encoding='utf-8').write('\n'.join(lines) + '\n')
    total = sum(64 * len(s) for s in imgs)
    print(f'{len(imgs)} images, {sum(len(s) for s in imgs)} sprites 8x16, {total} octets '
          f'en {len(banks)} page(s), au plus {max(len(s) for s in imgs)} sprites par image')
    preview(imgs)


def preview(imgs, scale=3):
    back = sms.rgb('court')
    im = Image.new('RGB', (len(imgs) * 36, 48), back)
    px = im.load()
    for i, s in enumerate(imgs):
        for dx, dy, data in s:
            for half in (0, 1):
                t = sms.tile_px(data[half * 32:half * 32 + 32])
                for y in range(8):
                    for x in range(8):
                        c = t[y][x]
                        X, Y = i * 36 + 14 + dx + x, 40 + dy + half * 8 + y
                        if c and 0 <= X < im.width and 0 <= Y < im.height:
                            px[X, Y] = sms.rgb(PAL[c])
    os.makedirs(os.path.join(ROOT, 'build'), exist_ok=True)
    im = im.resize((im.width * scale, im.height * scale), Image.NEAREST)
    im.save(os.path.join(ROOT, 'build', 'sprites_preview.png'))


if __name__ == '__main__':
    main()
