"""Sprites C64 tirés de la ROM du Tennis GB (images d'animation des joueurs,
balle, ombre, marque de rebond), à l'échelle 1.

Joueurs : chaque image (24 pixels de large au plus, 21 à 32 de haut) = deux
sprites multicolores empilés (rangées 0-20 et 21-41 de l'image). Pixels
doubles : on garde la teinte la plus foncée des deux pixels GB.
  teinte 3 (contour) -> 01 = $D025 (noir), teinte 1 -> 11 = $D026 (blanc),
  teinte 2 -> 10 = couleur propre du sprite (J1 et J2 différents).
Balle : deux sprites haute résolution superposés (contour noir devant,
intérieur blanc derrière). Ombre, marque : un sprite noir.

Sorties : gfx/sprites.asm (images, à placer en SPRITES), gfx/sprite_tables.asm
(pointeurs et décalages par image), build/sprites_preview.png.
"""
import json
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
sys.path.insert(0, os.path.join(ROOT, '..', 're'))
import extract_sprites as es  # noqa: E402

SPR_BASE = 0x5000                 # adresse des images (banque VIC $4000)
PTR0 = (SPR_BASE - 0x4000) // 64
BALL_TILES = [0x31, 0x37, 0x38]   # trois tailles ($1BC2, $1BDB, $1BE5)
SHADOW_TILE = 0x22                # $1BCC
MARK_TILE = 0x2F                  # $1BD6

images = []                       # 63 octets chacune


def add(data):
    images.append(bytes(data) + b'\0')
    return PTR0 + len(images) - 1


def mc_sprite(pix, x0, y0):
    data = bytearray(63)
    for row in range(21):
        for fx in range(12):
            s = max(pix.get((x0 + 2 * fx, y0 + row), 0), pix.get((x0 + 2 * fx + 1, y0 + row), 0))
            code = {0: 0, 3: 1, 1: 3, 2: 2}[s]
            data[row * 3 + fx // 4] |= code << (6 - 2 * (fx % 4))
    return data


def hires_sprite(pix, test):
    data = bytearray(63)
    for (x, y), s in pix.items():
        if test(s) and 0 <= x < 24 and 0 <= y < 21:
            data[y * 3 + x // 8] |= 0x80 >> (x % 8)
    return data


def tile_pix(t):
    px = es.tile_px(t)
    return {(x, y): px[y][x] for y in range(8) for x in range(8) if px[y][x]}


def main():
    empty = add(bytearray(63))
    frames = json.load(open(os.path.join(ROOT, '..', 're', 'sprites.json')))
    tables = ['; Fichier généré par tools/gen_c64sprites.py : tables des sprites.', '',
              f'SPR_EMPTY = {empty}']
    for pl, name in (('j1', 'p1'), ('j2', 'p2')):
        top, bot, xs, ys = [], [], [], []
        for f in frames[pl]['frames']:
            pix = es.render([tuple(i) for i in f])
            x0 = min(x for x, _ in pix)
            y0 = min(y for _, y in pix)
            h = max(y for _, y in pix) - y0 + 1
            top.append(add(mc_sprite(pix, x0, y0)))
            bot.append(add(mc_sprite(pix, x0, y0 + 21)) if h > 21 else empty)
            xs.append(x0 & 0xFF)
            ys.append(y0 & 0xFF)
        tables += [f'{name}_top  .byte ' + ', '.join(map(str, top)),
                   f'{name}_bot  .byte ' + ', '.join(map(str, bot)),
                   f'{name}_dx   .byte ' + ', '.join(f'${v:02X}' for v in xs),
                   f'{name}_dy   .byte ' + ', '.join(f'${v:02X}' for v in ys)]
    ball_out, ball_in = [], []
    for t in BALL_TILES:
        pix = tile_pix(t)
        ball_out.append(add(hires_sprite(pix, lambda s: s >= 2)))
        ball_in.append(add(hires_sprite(pix, lambda s: s == 1)))
    shadow = add(hires_sprite(tile_pix(SHADOW_TILE), lambda s: s > 0))
    mark = add(hires_sprite(tile_pix(MARK_TILE), lambda s: s > 0))
    tables += ['ball_out .byte ' + ', '.join(map(str, ball_out)),
               'ball_in  .byte ' + ', '.join(map(str, ball_in)),
               f'SPR_SHADOW = {shadow}', f'SPR_MARK = {mark}']
    out = ['; Fichier généré par tools/gen_c64sprites.py : images des sprites (64 octets).',
           f'; {len(images)} images à partir de ${SPR_BASE:04X}.']
    for img in images:
        for k in range(0, 64, 16):
            out.append('        .byte ' + ', '.join(f'${b:02X}' for b in img[k:k + 16]))
    open(os.path.join(ROOT, 'gfx', 'sprites.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    open(os.path.join(ROOT, 'gfx', 'sprite_tables.asm'), 'w', encoding='utf-8').write('\n'.join(tables) + '\n')
    preview()
    print(f'{len(images)} images de sprites ({len(images) * 64} octets)')


def preview(scale=3):
    """Planche : images multicolores (J1 rouge, J2 bleu) puis haute résolution."""
    cols = 16
    rows = (len(images) + cols - 1) // cols
    im = Image.new('RGB', (cols * 26, rows * 23), (154, 210, 132))
    for i, img in enumerate(images):
        ox, oy = (i % cols) * 26, (i // cols) * 23
        mc = 1 <= i <= 80
        col = (104, 55, 43) if i <= 40 else (53, 40, 121)
        for row in range(21):
            for bx in range(3):
                b = img[row * 3 + bx]
                for k in range(8 if not mc else 4):
                    if mc:
                        v = (b >> (6 - 2 * k)) & 3
                        if v:
                            c = {1: (0, 0, 0), 3: (255, 255, 255), 2: col}[v]
                            im.putpixel((ox + bx * 8 + 2 * k, oy + row), c)
                            im.putpixel((ox + bx * 8 + 2 * k + 1, oy + row), c)
                    elif b & (0x80 >> k):
                        im.putpixel((ox + bx * 8 + k, oy + row), (0, 0, 0))
    im.resize((im.width * scale, im.height * scale), Image.NEAREST).save(
        os.path.join(ROOT, 'build', 'sprites_preview.png'))


if __name__ == '__main__':
    main()
