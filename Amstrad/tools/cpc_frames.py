"""Simule la boucle de jeu CPC (version de test -DAUTOPLAY) image par image dans
le simulateur Z80, et enregistre l'écran au début de chaque image (ce que le
moniteur affiche, le dessin se faisant dans la bordure du haut).

Usage : python tools/cpc_frames.py [images] [première enregistrée]
Sortie : build/frames.png (planche), et la liste des images où un joueur
manque (pixels du joueur absents à sa position).
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import prof_cpc as p  # noqa: E402
from PIL import Image  # noqa: E402

INKS = [(128, 255, 128), (0, 255, 0), (0, 128, 0), (0, 0, 0)]


class Tracer:
    border = 0

    def read_port(self, registers, port):
        if port >> 8 == 0xF5:
            return 0xFF                         # VSYNC : chaque interruption = une image
        return 0xFF

    def write_port(self, registers, port, value, offset=0):
        pass


def screen(m):
    im = Image.new('RGB', (320, 200))
    px = im.load()
    for y in range(200):
        a = 0x4000 + (y & 7) * 0x800 + (y >> 3) * 80
        for bx in range(80):
            b = m[a + bx]
            for i in range(4):
                ink = ((b >> (7 - i)) & 1) | (((b >> (3 - i)) & 1) << 1)
                px[bx * 4 + i, y] = INKS[ink]
    return im


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 200
    first = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    s = p.symbols()
    sim = p.make_sim()
    sim.set_tracer(Tracer())
    m = sim.memory
    reloc = s['reloc_end'] - 0xC100
    m[0xC100:0xC100 + reloc] = m[0x4000:0x4000 + reloc]
    p.call(sim, s['init_sprites'])
    m[0x38] = 0xC3
    m[0x39], m[0x3A] = s['isr'] & 0xFF, s['isr'] >> 8
    r = sim.registers
    m[s['W_LEVEL']] = 1
    r[12] = 0x0200
    r[24] = s['start.loop']
    r[26] = 1                                   # IFF
    sim.frame_duration = 69888
    frames = []
    stop = s['draw_all']
    clean = None
    missing = []
    slot = s['SlotTab']
    for f in range(n):
        sim.run(r[24], stop, True)              # jusqu'au dessin de l'image suivante
        if clean is None:
            clean = bytes(m[0x4000:0x8000])     # court vide (avant le 1er dessin)
        else:
            for k, name in ((2, 'J2'), (3, 'J1')):
                b = slot + 16 * k               # ce qui est dessiné (état sauvegardé)
                rows, y0, col, w = m[b + 8], m[b + 9], m[b + 10], m[b + 11]
                on = m[b + 0]
                if not on:
                    continue
                diff = 0
                for y in range(y0, y0 + rows):
                    a0 = 0x4000 + (y & 7) * 0x800 + (y >> 3) * 80 + col
                    diff += sum(1 for i in range(w) if m[a0 + i] != clean[a0 + i - 0x4000])
                if rows == 0 or diff == 0:
                    missing.append((f, name, rows, diff))
        if f >= first:
            frames.append(screen(m))
        sim.run()                               # dépasse le point d'arrêt
    print("joueur absent de l'écran :", missing[:20])
    print(len(missing), 'cas sur', n, 'images')
    cols = 6
    rows = (len(frames) + cols - 1) // cols
    sheet = Image.new('RGB', (cols * 160, rows * 100))
    for i, im in enumerate(frames):
        sheet.paste(im.resize((160, 100)), ((i % cols) * 160, (i // cols) * 100))
    sheet.save(os.path.join(HERE, '..', 'build', 'frames.png'))
    print(len(frames), 'images')


if __name__ == '__main__':
    main()
