"""Test : un smash du joueur 1 part-il bien dans la version assembleur ?

Robot : niveau 4 (l'IA lobe le plus), monte au filet pour provoquer des lobs,
se place sous les balles hautes et appuie quand la balle redescend vers la
fenêtre de frappe du smash ($0E77, index 4 : hauteur $30-$50).
Compte les élans de smash (type de coup >= $0C) et les smashs réussis
(balle relancée avec le profil de smash $C05C = $22).

Options :
  --lob        l'IA lobe à chaque coup (dans la simulation seulement)
  --view       affiche l'écran du Spectrum dans une fenêtre, en temps réel
  --from N     avance rapide jusqu'à la trame N avant d'afficher (avec --view)
  --frames N   nombre de trames simulées (40000 par défaut)
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import time  # noqa: E402
import zxrun  # noqa: E402
from skoolkit import CSimulator  # noqa: E402
from skoolkit.simutils import from_snapshot  # noqa: E402
from skoolkit.snapshot import Snapshot  # noqa: E402

SNAP = os.path.join(HERE, '..', 'asm', 'build', 'run', 'loaded.z80')


BASE = zxrun.Bot('0xC000')


def smash_bot(m, f, st):
    """Robot normal (zxrun.Bot), plus : monter au filet et smasher les balles hautes."""
    p_state = m[0xC000]
    px, py = m[0xC005], m[0xC003]
    bst, bx, by, bz = m[0xC040], m[0xC045], m[0xC043], m[0xC047]
    falling = m[0xC052] & 0x80
    toward = not (m[0xC04F] & 0x80)          # la balle vient vers J1
    if st['cool']:
        st['cool'] -= 1
    if p_state == 1 and bst in (3, 4) and toward and bz >= 0x40 and by >= 0x60:
        keys = []
        tx = (bx - 4) & 0xFF                 # fenêtre X du smash : [-2, 10]
        if px < tx - 1:
            keys.append('P')
        elif px > tx + 1:
            keys.append('O')
        if falling and bz <= 0x5C and not st['cool']:
            keys.append('SPACE')
            st['cool'] = 20
        return keys
    keys = BASE.keys(m, f)
    if p_state == 1 and bst in (3, 4) and not toward and py > 0x90:
        keys = [k for k in keys if k not in ('A', 'Q')] + ['Q']   # monter au filet
    return keys


def arg(name, default):
    if name in sys.argv:
        return int(sys.argv[sys.argv.index(name) + 1])
    return default


class Viewer:
    """Fenêtre Tkinter : écran Spectrum x2, cadencé à 50 images/s."""

    def __init__(self):
        import tkinter as tk
        from PIL import ImageTk
        self.tk, self.ImageTk = tk, ImageTk
        self.root = tk.Tk()
        self.root.title('Test smash - Tennis ZX Spectrum')
        self.label = tk.Label(self.root)
        self.label.pack()
        self.info = tk.Label(self.root, font=('Consolas', 11), anchor='w')
        self.info.pack(fill='x')
        self.closed = False
        self.root.protocol('WM_DELETE_WINDOW', self.close)
        self.next_t = time.perf_counter()

    def close(self):
        self.closed = True

    def show(self, mem, text):
        from PIL import Image
        img = zxrun.screen_to_image(bytes(mem[16384:23296]), 4)
        img = img.resize((img.width * 2, img.height * 2), Image.NEAREST)
        self.photo = self.ImageTk.PhotoImage(img)
        self.label.configure(image=self.photo)
        self.info.configure(text=text)
        self.root.update()
        self.next_t += 0.02
        delay = self.next_t - time.perf_counter()
        if delay > 0:
            time.sleep(delay)
        else:
            self.next_t = time.perf_counter()


def main():
    viewer = Viewer() if '--view' in sys.argv else None
    start_view = arg('--from', 0)
    total = arg('--frames', 40000)
    sim = from_snapshot(CSimulator, Snapshot.get(SNAP))
    tr = zxrun.Tracer()
    sim.set_tracer(tr)
    m = sim.memory
    t0 = sim.registers[25]
    st = {'cool': 0, 'serve': 0}
    swings = hits = 0
    prev_state = prev_prof = 0
    first_hit = None
    for f in range(total):
        tr.keyboard = [0] * 8
        if 40 <= f <= 42:
            keys = ['4']
        elif 60 <= f <= 62:
            keys = ['ENTER']
        elif f >= 70:
            keys = smash_bot(m, f, st)
        else:
            keys = []
        for k in keys:
            r, b = zxrun.KEYPOS[k]
            tr.keyboard[r] |= 1 << b
        if '--lob' in sys.argv and f > 70:
            m[0xC0B1] = 100                     # test : l'IA lobe à chaque fois
        zxrun._run_frame(sim, t0 + (f + 1) * sim.frame_duration)
        if m[0xC000] == 2 and prev_state != 2 and m[0xC00A] >= 0x0C:
            swings += 1
        prof = m[0xC05C]
        if prof == 0x22 and prev_prof != 0x22 and (m[0xFFAD] & 0x80):
            hits += 1
            if first_hit is None:
                first_hit = f
        prev_state, prev_prof = m[0xC000], prof
        if viewer and f >= start_view:
            if viewer.closed:
                break
            viewer.show(m, f'trame {f}   élans de smash {swings}   smashs réussis {hits}')
    print(f'élans de smash : {swings} | smashs réussis : {hits} | premier à la trame {first_hit}')


if __name__ == '__main__':
    main()
