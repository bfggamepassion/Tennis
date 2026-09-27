"""Sprites CPC (mode 1) tirés de la ROM du Tennis GB, à l'échelle 1.

Numéros (comme la version Spectrum) : 0-19 joueur 1, 20-39 joueur 2,
40-42 balle (3 tailles), 43 ombre, 44 marque de rebond.
Teinte GB n -> encre n ; teinte 0 (transparente) -> encre 0.

Le fichier ne contient que les images non décalées (spr_raw, placées dans la
zone qui deviendra l'écran). Au démarrage, init_sprites fabrique les 4
décalages au pixel près (un octet mode 1 = 4 pixels) aux adresses fixées
ici, dans la RAM libérée par le firmware. Décalage s : octet de sortie =
SHR_s[octet] | CAR_s[octet précédent]. Chaque ligne est rognée : décalage
(octets transparents à gauche), longueur, puis les octets utiles. Les sprites
sont dessinés en XOR (src/sprite.asm) : l'encre 0 laisse le décor intact.

Sorties : gfx/sprites_raw.asm (images, tables par image et par décalage),
          gfx/sprite_shift_tables.asm (tables de décalage),
          build/sprites_preview.png
"""
import json
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
sys.path.insert(0, os.path.join(ROOT, '..', 're'))
import extract_sprites as es  # noqa: E402

TILE_SPRITES = [(0x31, -6, -3), (0x37, -6, -3), (0x38, -6, -3),   # balle (liste $1BC2...)
                (0x22, -8, -3),                                     # ombre ($1BCC)
                (0x2F, -5, -3)]                                     # marque ($1BD6)
# Zones où init_sprites range les images décalées (après le démarrage)
REGIONS = [(0xA600, 0xC000), (0xD000, 0xDD00), (0xDE00, 0xFF80)]
AREA_B = 'spr_area_b'           # réserve en partie B (taille calculée ici)


def pixel(b, p):
    return ((b >> (7 - p)) & 1) | (((b >> (3 - p)) & 1) << 1)


def make_byte(pix4):
    b = 0
    for p, ink in enumerate(pix4):
        b |= (ink & 1) << (7 - p)
        b |= ((ink >> 1) & 1) << (3 - p)
    return b


def image(pix):
    """{(x, y): teinte} -> (wb, h, x0, y0, lignes d'octets)"""
    xs = [x for x, _ in pix]
    ys = [y for _, y in pix]
    x0, y0 = min(xs), min(ys)
    w = max(xs) - x0 + 1
    h = max(ys) - y0 + 1
    wb = (w + 3) // 4
    rows = []
    for y in range(h):
        rows.append([make_byte([pix.get((x0 + k * 4 + p, y0 + y), 0) for p in range(4)])
                     for k in range(wb)])
    return wb, h, x0, y0, rows


def shifted(rows, wb, s):
    out = []
    for r in rows:
        src = r + [0]
        prev = 0
        o = []
        for k in range(wb + (1 if s else 0)):
            b = src[k]
            px = [pixel(b, j - s) if j >= s else pixel(prev, 4 + j - s) for j in range(4)]
            o.append(make_byte(px))
            prev = b
        out.append(o)
    return out


def trimmed_size(rows, wb, s):
    """Taille d'une image décalée, lignes rognées : par ligne, 2 octets
    (décalage, longueur) + les octets entre le premier et le dernier non nuls."""
    size = 0
    for r in (shifted(rows, wb, s) if s else rows):
        nz = [i for i, b in enumerate(r) if b]
        size += 2 + ((nz[-1] - nz[0] + 1) if nz else 0)
    return size


def tables():
    t = {}
    for s in range(4):
        t[f'SHR{s}'] = [make_byte([pixel(b, j - s) if j >= s else 0 for j in range(4)]) for b in range(256)]
        t[f'CAR{s}'] = [make_byte([pixel(b, 4 + j - s) if j < s else 0 for j in range(4)]) for b in range(256)]
    return t


def main():
    frames = json.load(open(os.path.join(ROOT, '..', 're', 'sprites.json')))
    imgs = []
    for pl in ('j1', 'j2'):
        for f in frames[pl]['frames']:
            imgs.append(image(es.render([tuple(i) for i in f])))
    for t, dy, dx in TILE_SPRITES:
        px = es.tile_px(t)
        imgs.append(image({(dx + x, dy + y): px[y][x] for y in range(8) for x in range(8) if px[y][x]}))
    # allocation des images décalées
    regions = [list(r) for r in REGIONS]
    area_b = 0
    ptrs = []
    for wb, h, x0, y0, rows in imgs:
        for s in range(4):
            size = trimmed_size(rows, wb, s)
            for r in regions:
                if r[1] - r[0] >= size:
                    ptrs.append(f'${r[0]:04X}')
                    r[0] += size
                    break
            else:
                ptrs.append(f'{AREA_B}+{area_b}')
                area_b += size
    total = sum(trimmed_size(rows, wb, s) for wb, h, x0, y0, rows in imgs for s in range(4))
    print(f'{len(imgs)} images, {sum(wb * h for wb, h, *_ in imgs)} octets non décalés, '
          f'{total} octets décalés (dont {area_b} en partie B)')
    out = ['; Fichier généré par tools/gen_cpcsprites.py : sprites (mode 1).', '',
           f'NSPRITES    equ {len(imgs)}', f'SPR_AREA_B_SIZE equ {area_b}',
           'spr_raw_tab                     ; image non décalée (utilisée au démarrage)']
    for i in range(len(imgs)):
        out.append(f'        dw spr_raw{i}')
    out.append('spr_ptr                         ; image décalée : [numéro x 4 + décalage]')
    for i in range(0, len(ptrs), 4):
        out.append('        dw ' + ', '.join(ptrs[i:i + 4]))
    out.append('spr_wtab                        ; largeur en octets : [numéro x 4 + décalage]')
    for wb, *_ in imgs:
        out.append(f'        db {wb}, {wb + 1}, {wb + 1}, {wb + 1}')
    out.append('spr_htab')
    out.append('        db ' + ', '.join(str(h) for _, h, *_ in imgs))
    out.append('spr_x0tab                       ; décalage signé depuis le point d\'ancrage')
    out.append('        db ' + ', '.join(str(x0 & 0xFF) for _, _, x0, *_ in imgs))
    out.append('spr_y0tab')
    out.append('        db ' + ', '.join(str(y0 & 0xFF) for _, _, _, y0, _ in imgs))
    raw = ['; Fichier généré par tools/gen_cpcsprites.py : images non décalées.']
    for i, (wb, h, x0, y0, rows) in enumerate(imgs):
        raw.append(f'spr_raw{i}')
        for r in rows:
            raw.append('        db ' + ', '.join(f'${b:02X}' for b in r))
    open(os.path.join(ROOT, 'gfx', 'sprites_meta.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    open(os.path.join(ROOT, 'gfx', 'sprites_raw.asm'), 'w', encoding='utf-8').write('\n'.join(raw) + '\n')
    tb = ['; Fichier généré par tools/gen_cpcsprites.py : tables (alignées sur 256 octets).',
          '; SHRs[b] : pixels de b décalés de s vers la droite ; CARs[b] : pixels sortis,',
          '; pour l\'octet suivant.']
    for name, t in tables().items():
        dst = tb
        dst.append(f'        ALIGN 256\n{name}_TAB')
        for k in range(0, 256, 16):
            dst.append('        db ' + ', '.join(f'${b:02X}' for b in t[k:k + 16]))
    # SHR/CAR ne servent qu'au démarrage : placées dans la zone de l'écran
    open(os.path.join(ROOT, 'gfx', 'sprite_shift_tables.asm'), 'w', encoding='utf-8').write('\n'.join(tb) + '\n')
    # contrôle : le décalage de référence (Python) = celui des tables
    t = tables()
    for wb, h, x0, y0, rows in imgs:
        for s in range(1, 4):
            ref = shifted(rows, wb, s)
            for r, rr in zip(rows, ref):
                prev = 0
                src = r + [0]
                for k in range(wb + 1):
                    assert rr[k] == t[f'SHR{s}'][src[k]] | t[f'CAR{s}'][prev]
                    prev = src[k]
    preview(imgs)


def preview(imgs, scale=3):
    pal = [(128, 255, 128), (0, 255, 0), (0, 128, 0), (0, 0, 0)]
    cols = 12
    rows = (len(imgs) + cols - 1) // cols
    im = Image.new('RGB', (cols * 34, rows * 36), (200, 200, 255))
    for i, (wb, h, x0, y0, data) in enumerate(imgs):
        ox, oy = (i % cols) * 34 + 2, (i // cols) * 36 + 2
        for y, r in enumerate(data):
            for k, b in enumerate(r):
                for p in range(4):
                    ink = pixel(b, p)
                    if ink:
                        im.putpixel((ox + k * 4 + p, oy + y), pal[ink])
    im.resize((im.width * scale, im.height * scale), Image.NEAREST).save(
        os.path.join(ROOT, 'build', 'sprites_preview.png'))


if __name__ == '__main__':
    main()
