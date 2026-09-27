"""Sprites matériels de l'ASIC (CPC Plus / GX4000), tirés de la ROM du Tennis GB.

Un sprite ASIC : 16x16 pixels, 256 octets (un octet par pixel, encre 1-15
dans les 4 bits bas, 0 = transparent), rangés ligne par ligne. Affiché avec
un agrandissement horizontal x2 : un pixel de sprite = un pixel du mode 1,
donc les images GB restent à l'échelle 1.

Objets (numéros d'images comme les autres versions) : 0-19 joueur 1, 20-39
joueur 2 (images de 32x32 au plus : 4 sprites, ordre haut-gauche, haut-droit,
bas-gauche, bas-droit), 40-42 balle, 43 ombre, 44 marque (1 sprite chacune),
45 l'arbitre (4 sprites posés sur son dessin du décor, pour le colorer).
Couleurs des sprites (encres 1-15, communes à tous les sprites) : chaque
objet a ses propres encres pour les teintes GB 1-3 (J1 rouge, J2 bleu...).

Les données (256 octets par sprite) vont dans des pages de la cartouche,
à partir de FIRST_PAGE : l'affichage les recopie dans l'ASIC quand l'image
d'un objet change.
Sorties : build/sprite_pages.bin, gfx/plus_sprites.asm (table des images,
palette des sprites), build/plus_sprites_preview.png
"""
import json
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
sys.path.insert(0, os.path.join(ROOT, '..', 're'))
import extract_sprites as es  # noqa: E402

FIRST_PAGE = 3                  # pages de cartouche des données de sprites
TILE_SPRITES = [(0x31, -6, -3), (0x37, -6, -3), (0x38, -6, -3),   # balle
                (0x22, -8, -3),                                     # ombre
                (0x2F, -5, -3)]                                     # marque

# Encres des sprites (1-15) : couleur 12 bits (R, G, B de 0 à 15)
SPRITE_PENS = {
    1: (15, 12, 10),            # J1 : clair (peau, maillot)
    2: (14, 2, 2),              # J1 : rouge
    3: (1, 1, 2),               # contour (commun)
    4: (15, 13, 11),            # J2 : clair
    5: (2, 5, 15),              # J2 : bleu
    6: (15, 15, 9),             # balle : claire
    7: (7, 7, 2),               # balle : foncée
    8: (1, 5, 1),               # ombre
    9: (2, 6, 2),               # marque
    10: (15, 11, 8),            # arbitre : peau
    11: (14, 1, 1),             # arbitre : rouge (casquette, maillot)
    12: (1, 1, 5),              # arbitre : bleu nuit
}
# teinte GB 1, 2, 3 -> encre du sprite, selon l'objet
MAP_P1 = {1: 1, 2: 2, 3: 3}
MAP_P2 = {1: 4, 2: 5, 3: 3}
MAP_BALL = {1: 6, 2: 7, 3: 7}
MAP_SHADOW = {1: 8, 2: 8, 3: 8}
MAP_MARK = {1: 9, 2: 9, 3: 9}
MAP_UMPIRE = {1: 10, 2: 11, 3: 12}
UMPIRE_BOX = (176, 90, 197, 112)    # Mario dans l'image GB (sans la chaise) : x0, y0, x1, y1


def sprite_block(pix, ox, oy, pens):
    """256 octets : pixels (ox..ox+15, oy..oy+15) de pix, en encres."""
    return bytes(pens.get(pix.get((ox + x, oy + y), 0), 0) for y in range(16) for x in range(16))


def main():
    frames = json.load(open(os.path.join(ROOT, '..', 're', 'sprites.json')))
    images = []                 # (liste de blocs de 256 octets, x0, y0)
    for pl, pens in (('j1', MAP_P1), ('j2', MAP_P2)):
        for f in frames[pl]['frames']:
            pix = es.render([tuple(i) for i in f])
            x0 = min(x for x, _ in pix)
            y0 = min(y for _, y in pix)
            assert max(x for x, _ in pix) - x0 < 32 and max(y for _, y in pix) - y0 < 32
            blocks = [sprite_block(pix, x0 + dx, y0 + dy, pens) for dy in (0, 16) for dx in (0, 16)]
            images.append((blocks, x0, y0))
    for (t, dy, dx), pens in zip(TILE_SPRITES, (MAP_BALL, MAP_BALL, MAP_BALL, MAP_SHADOW, MAP_MARK)):
        px = es.tile_px(t)
        pix = {(dx + x, dy + y): px[y][x] for y in range(8) for x in range(8) if px[y][x]}
        images.append(([sprite_block(pix, dx, dy, pens)], dx, dy))
    # 45 : l'arbitre (Mario), recoloré par 4 sprites posés sur son dessin
    sys.path.insert(0, HERE)
    import gen_cpcgfx
    v = gen_cpcgfx.court_vram()
    x0, y0, x1, y1 = UMPIRE_BOX
    pix = {}
    for y in range(y0, y1):
        for x in range(x0, x1):
            c = v.map_tile(x // 8, y // 8)[y % 8][x % 8]
            if c and not (x >= 189 and y >= 100):      # sans le montant de la chaise
                pix[(x - x0, y - y0)] = c
    images.append(([sprite_block(pix, dx, dy, MAP_UMPIRE) for dy in (0, 16) for dx in (0, 16)], 0, 0))
    # pages : 64 sprites de 256 octets par page de 16 Ko ; une image ne
    # chevauche pas deux pages
    data = bytearray()
    table = []
    for blocks, x0, y0 in images:
        if (len(data) % 16384) + 256 * len(blocks) > 16384:
            data += bytes(16384 - len(data) % 16384)
        page = FIRST_PAGE + len(data) // 16384
        addr = 0xC000 + len(data) % 16384
        table.append((page, addr, len(blocks), x0, y0))
        for b in blocks:
            data += b
    data += bytes((-len(data)) % 16384)
    open(os.path.join(ROOT, 'build', 'sprite_pages.bin'), 'wb').write(data)
    out = ['; Fichier généré par tools/gen_plus_sprites.py : sprites matériels (ASIC).', '',
           f'NIMAGES     equ {len(images)}',
           f'SPR_PAGES   equ {len(data) // 16384}      ; pages de cartouche, à partir de {FIRST_PAGE}',
           'img_page    ; page de cartouche de chaque image']
    out.append('        db ' + ', '.join(str(t[0]) for t in table))
    out.append('img_addr    ; adresse dans la page (vue en $C000)')
    for k in range(0, len(table), 8):
        out.append('        dw ' + ', '.join(f'${t[1]:04X}' for t in table[k:k + 8]))
    out.append('img_x0      ; décalage du coin haut-gauche depuis le point d\'ancrage (signé)')
    out.append('        db ' + ', '.join(str(t[3] & 0xFF) for t in table))
    out.append('img_y0')
    out.append('        db ' + ', '.join(str(t[4] & 0xFF) for t in table))
    out.append('spr_pens    ; encres 1-15 des sprites : %RRRRBBBB, %0000GGGG')
    for n in range(1, 16):
        r, g, b = SPRITE_PENS.get(n, (0, 0, 0))
        out.append(f'        db ${(r << 4) | b:02X}, ${g:02X}')
    open(os.path.join(ROOT, 'gfx', 'plus_sprites.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    # aperçu
    im = Image.new('RGB', (len(images) * 34, 34), (160, 220, 150))
    for i, (blocks, x0, y0) in enumerate(images):
        for k, b in enumerate(blocks):
            bx, by = (k % 2) * 16, (k // 2) * 16
            for p in range(256):
                if b[p]:
                    r, g, bb = SPRITE_PENS[b[p]]
                    im.putpixel((i * 34 + bx + p % 16, by + p // 16), (r * 17, g * 17, bb * 17))
    im.resize((im.width * 3, im.height * 3), Image.NEAREST).save(
        os.path.join(ROOT, 'build', 'plus_sprites_preview.png'))
    print(f'{len(images)} images, {len(data) // 256} sprites ASIC, {len(data) // 16384} pages')


if __name__ == '__main__':
    main()
