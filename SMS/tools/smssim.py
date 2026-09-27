"""Master System simulée (Z80 de SkoolKit + VDP mode 4 + mapper Sega + manette),
pour tester la cartouche sans émulateur, et surtout VÉRIFIER LES ACCÈS AU
VDP comme sur une vraie console :

- pendant l'affichage (lignes 0-191, écran allumé), deux accès à la mémoire
  vidéo doivent être espacés d'au moins MIN_GAP cycles, sinon la vraie
  console perd des octets ;
- l'interruption ne doit pas toucher au VDP pendant que la boucle principale
  est au milieu d'une écriture d'adresse (deux octets sur le port de contrôle) ;
- durée de l'interruption (doit finir avant la ligne 0 si elle écrit en VRAM) ;
- aucune écriture dans la cartouche (hors registres de pages).

Usage :
  python tools/smssim.py [trames] [--pal] [--shot N,N,...] [--keys script] [--rom fichier]
  script : suite de « trame:touches » ; touches parmi U D L R 1 2 (boutons)
  et P (bouton Pause), ex. « 60:1 70: 300:R 330: ».
Images : build/sim_NNNN.png
"""
import os
import re
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
sys.path.insert(0, HERE)
from sim64 import Simulator  # noqa: E402  (SkoolKit, 64 Ko de RAM)

LINE_T = 228                    # cycles par ligne
VBLANK_LINE = 192
MIN_GAP = 26                    # cycles entre deux accès VRAM pendant l'affichage


def symbols():
    sym = open(os.path.join(ROOT, 'build', 'tennis.sym')).read()
    return {m.group(1): int(m.group(2), 16)
            for m in re.finditer(r'^(\S+):\s+EQU\s+0x([0-9A-F]+)', sym, re.M)}


def cram_rgb(v):
    return ((v & 3) * 85, ((v >> 2) & 3) * 85, ((v >> 4) & 3) * 85)


class VDP:
    def __init__(self):
        self.vram = bytearray(0x4000)
        self.cram = bytearray(32)
        self.reg = [0] * 11
        self.addr = 0
        self.code = 0
        self.latch = None
        self.status = 0
        self.readbuf = 0


class SMS:
    def __init__(self, rom_path=None, pal=False):
        self.rom = open(rom_path or os.path.join(ROOT, 'build', 'tennis.sms'), 'rb').read()
        self.mem = bytearray(65536)
        self.mem[0:0x8000] = self.rom[0:0x8000]
        self.bank = 2
        self.mem[0x8000:0xC000] = self.page(2)
        self.mem[0xFFFF] = 2
        self.sim = Simulator(self.mem, {'SP': 0xDFF0})
        self.sim.set_tracer(self)
        self.r = self.sim.registers
        self.r[24] = 0
        self.lines = 313 if pal else 262
        self.frame_t = LINE_T * self.lines
        self.vdp = VDP()
        self.next_vb = VBLANK_LINE * LINE_T
        self.in_irq = False
        self.irq_start = 0
        self.irq_latch_busy = False
        self.irq_times = []
        self.irq_late = 0
        self.nmi_pending = False
        self.last_access = -10 ** 9
        self.errors = []
        self.joy = set()
        self.frame = 0
        self.vdp_accesses = 0

    def page(self, n):
        n %= len(self.rom) // 0x4000
        return self.rom[n * 0x4000:(n + 1) * 0x4000]

    # --- ports -----------------------------------------------------------------
    def t(self):
        return self.r[25]

    def line(self, t=None):
        return ((self.t() if t is None else t) % self.frame_t) // LINE_T

    def active(self, t):
        return (self.vdp.reg[1] & 0x40) and self.line(t) < VBLANK_LINE

    def access(self, what):
        t = self.t()
        self.vdp_accesses += 1
        if self.active(t) and t - self.last_access < MIN_GAP:
            self.error(f'accès VRAM trop rapide ({t - self.last_access} T, {what}) '
                       f'ligne {self.line(t)}')
        self.last_access = t

    def error(self, msg):
        pc = self.r[24]
        if len(self.errors) < 30:
            self.errors.append(f'trame {self.frame} PC ${pc:04X}{" (IRQ)" if self.in_irq else ""} : {msg}')

    def read_port(self, registers, port):
        p = port & 0xFF
        v = self.vdp
        if 0x40 <= p < 0x80:
            if p & 1:
                return (self.t() % LINE_T) * 256 // LINE_T
            ln = self.line()
            if self.lines == 262:
                return ln if ln <= 0xDA else ln - 6
            return ln if ln <= 0xF2 else ln - 57
        if 0x80 <= p < 0xC0:
            if self.in_irq and self.irq_latch_busy:
                self.error('l\'interruption lit le VDP pendant une écriture d\'adresse du programme')
            if p & 1:                                   # état
                s = v.status
                v.status &= 0x1F
                v.latch = None
                return s
            self.access('lecture')
            val = v.readbuf
            v.readbuf = v.vram[v.addr]
            v.addr = (v.addr + 1) & 0x3FFF
            v.latch = None
            return val
        if p & 1:
            return 0xFF                                 # manette 2, bouton Reset
        b = 0xFF
        for bit, key in ((0, 'U'), (1, 'D'), (2, 'L'), (3, 'R'), (4, '1'), (5, '2')):
            if key in self.joy:
                b &= ~(1 << bit)
        return b

    def write_port(self, registers, port, value, offset=0):
        p = port & 0xFF
        v = self.vdp
        if 0x80 <= p < 0xC0:
            if self.in_irq and self.irq_latch_busy:
                self.error('l\'interruption écrit au VDP pendant une écriture d\'adresse du programme')
            if p & 1:                                   # contrôle
                if v.latch is None:
                    v.latch = value
                    return
                lo, v.latch = v.latch, None
                v.code = value >> 6
                v.addr = ((value & 0x3F) << 8) | lo
                if v.code == 2:
                    if (value & 0x0F) < 11:
                        v.reg[value & 0x0F] = lo
                elif v.code == 0:
                    self.access('adresse (lecture)')
                    v.readbuf = v.vram[v.addr]
                    v.addr = (v.addr + 1) & 0x3FFF
                return
            self.access('écriture')
            if v.code == 3:
                v.cram[v.addr & 31] = value
            else:
                v.vram[v.addr] = value
            v.readbuf = value
            v.addr = (v.addr + 1) & 0x3FFF
            v.latch = None

    # --- exécution --------------------------------------------------------------
    def push_pc(self, target):
        r = self.r
        pc = r[24]
        sp = (r[12] - 2) & 0xFFFF
        r[12] = sp
        self.mem[sp] = pc & 0xFF
        self.mem[sp + 1] = pc >> 8
        r[24] = target

    def run_frames(self, n, keys=None, shots=(), on_frame=None):
        opcodes = self.sim.opcodes
        mem = self.mem
        r = self.r
        end_frame = self.frame + n
        prev_ei = False
        paused_key = False
        while self.frame < end_frame:
            pc = r[24]
            op = mem[pc]
            if self.in_irq and op == 0xED and mem[pc + 1] == 0x4D:      # RETI
                opcodes[0xED]()
                self.in_irq = False
                dt = r[25] - self.irq_start
                self.irq_times.append(dt)
                if self.irq_wrote and self.line(r[25]) < VBLANK_LINE:
                    self.irq_late += 1
            else:
                opcodes[op]()
            if mem[0xFFFF] != self.bank:                                  # mapper, page 2
                self.bank = mem[0xFFFF]
                mem[0x8000:0xC000] = self.page(self.bank)
            if r[25] >= self.next_vb:
                self.next_vb += self.frame_t
                self.frame += 1
                self.vdp.status |= 0x80
                if keys is not None:
                    self.joy = keys(self.frame)
                    if ('P' in self.joy) != paused_key:
                        paused_key = 'P' in self.joy
                        if paused_key:
                            self.nmi_pending = True
                if self.frame in shots:
                    self.screenshot(os.path.join(ROOT, 'build', f'sim_{self.frame:04d}.png'))
                if on_frame:
                    on_frame(self)
            if self.nmi_pending:
                self.nmi_pending = False
                self.push_pc(0x66)
                r[25] += 11
            elif (self.vdp.status & 0x80) and (self.vdp.reg[1] & 0x20) and r[26] \
                    and not prev_ei and not self.in_irq:
                self.irq_latch_busy = self.vdp.latch is not None
                self.in_irq = True
                self.irq_start = r[25]
                self.irq_wrote = False
                r[26] = 0
                self.push_pc(0x38)
                r[25] += 13
                self.acc_at_irq = self.vdp_accesses
            if self.in_irq and self.vdp_accesses > getattr(self, 'acc_at_irq', 0) + 1:
                self.irq_wrote = True
            prev_ei = op == 0xFB
        return self

    def check_rom(self):
        """Écritures dans la cartouche ?"""
        if self.mem[0:0x8000] != self.rom[0:0x8000]:
            bad = [a for a in range(0x8000) if self.mem[a] != self.rom[a]]
            self.errors.append(f'écriture dans la cartouche : {len(bad)} octets, dont ${bad[0]:04X}')

    # --- image -----------------------------------------------------------------
    def render(self):
        v = self.vdp
        vr = v.vram
        pal = [cram_rgb(c) for c in v.cram]
        back = pal[16 + (v.reg[7] & 15)]
        img = Image.new('RGB', (256, 192), back)
        if not (v.reg[1] & 0x40):
            return img
        px = img.load()
        name = (v.reg[2] & 0x0E) << 10
        for r in range(24):
            for c in range(32):
                a = name + (r * 32 + c) * 2
                w = vr[a] | (vr[a + 1] << 8)
                t = w & 0x1FF
                for y in range(8):
                    ty = 7 - y if w & 0x400 else y
                    b = vr[t * 32 + ty * 4:t * 32 + ty * 4 + 4]
                    for x in range(8):
                        tx = 7 - x if w & 0x200 else x
                        m = 0x80 >> tx
                        k = sum(1 << pl for pl in range(4) if b[pl] & m)
                        px[c * 8 + x, r * 8 + y] = pal[k + (16 if w & 0x800 else 0)]
        sat = (v.reg[5] & 0x7E) << 7
        base = 256 if v.reg[6] & 4 else 0
        tall = 16 if v.reg[1] & 2 else 8
        per_line = [0] * 192
        drawn = [[False] * 256 for _ in range(192)]
        for s in range(64):
            y = vr[sat + s]
            if y == 0xD0:
                break
            x = vr[sat + 0x80 + s * 2]
            t = vr[sat + 0x81 + s * 2]
            if tall == 16:
                t &= 0xFE
            y = y + 1 if y < 0xF0 else y - 255
            for dy in range(tall):
                yy = y + dy
                if not 0 <= yy < 192:
                    continue
                per_line[yy] += 1
                if per_line[yy] > 8:
                    continue
                tt = base + t + dy // 8
                b = vr[tt * 32 + (dy % 8) * 4:tt * 32 + (dy % 8) * 4 + 4]
                for dx in range(8):
                    xx = x + dx
                    if not 0 <= xx < 256 or drawn[yy][xx]:
                        continue
                    m = 0x80 >> dx
                    k = sum(1 << pl for pl in range(4) if b[pl] & m)
                    if k:
                        px[xx, yy] = pal[16 + k]
                        drawn[yy][xx] = True
        return img

    def screenshot(self, path, scale=2):
        self.render().resize((256 * scale, 192 * scale), Image.NEAREST).save(path)


def parse_keys(script):
    ev = []
    for tok in script.split():
        f, _, k = tok.partition(':')
        ev.append((int(f), set(k)))
    ev.sort(key=lambda e: e[0])

    def keys_at(frame):
        cur = set()
        for f, k in ev:
            if f <= frame:
                cur = k
        return cur
    return keys_at


def main():
    args = sys.argv[1:]
    n = 300
    shots = set()
    keys = None
    pal = False
    rom = None
    i = 0
    while i < len(args):
        if args[i] == '--shot':
            shots = {int(x) for x in args[i + 1].split(',')}
            i += 2
        elif args[i] == '--keys':
            keys = parse_keys(args[i + 1])
            i += 2
        elif args[i] == '--rom':
            rom = args[i + 1]
            i += 2
        elif args[i] == '--pal':
            pal = True
            i += 1
        else:
            n = int(args[i])
            i += 1
    m = SMS(rom, pal)
    m.run_frames(n, keys, shots)
    m.check_rom()
    t = m.irq_times
    print(f'{m.frame} trames ({"50" if pal else "60"} Hz), {len(t)} interruptions (max {max(t) if t else 0} T, '
          f'budget du retour de trame {(m.lines - VBLANK_LINE) * LINE_T} T, '
          f'{m.irq_late} finies pendant l\'affichage), {m.vdp_accesses} accès VDP')
    print('ERREURS :' if m.errors else 'accès VDP : aucune erreur')
    for e in m.errors:
        print(' ', e)
    return m


if __name__ == '__main__':
    main()
