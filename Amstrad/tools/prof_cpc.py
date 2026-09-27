"""Profilage (cycles Z80) des parties de la boucle de jeu CPC, sur des états
réels du jeu GB (PyBoy + robot), dans le simulateur Z80 de SkoolKit.

Cycles « T » du Z80 ; un CPC arrondit chaque accès mémoire au multiple de 4 :
compter ~+15 % de temps réel. Budget d'une trame CPC : 19 968 µs = 79 872 T
à 4 MHz (soit ~69 000 T « utiles » avec les arrondis).

Usage : python tools/prof_cpc.py [trames GB]
"""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, '..', 'tools'))
import diff_gb  # noqa: E402  (état GB : PyBoy + robot)
from sim64 import Simulator  # noqa: E402  (SkoolKit, 64 Ko de RAM)

STOP = 0x0100


class Tracer:
    border = 0

    def read_port(self, registers, port):
        return 0xFF

    def write_port(self, registers, port, value, offset=0):
        pass


def symbols():
    sym = open(os.path.join(ROOT, 'build', 'tennis.sym')).read()
    return {m.group(1): int(m.group(2), 16)
            for m in re.finditer(r'^(\S+):\s+EQU\s+0x([0-9A-F]+)', sym, re.M)}


def make_sim():
    mem = bytearray(65536)
    binf = open(os.path.join(ROOT, 'build', 'tennis.bin'), 'rb').read()
    mem[0x200:0x200 + len(binf)] = binf
    sim = Simulator(mem, {'SP': 0x0200})
    sim.set_tracer(Tracer())
    return sim


def call(sim, addr, a=None, max_ops=3_000_000):
    m = sim.memory
    sp = 0x01F0
    m[sp], m[sp + 1] = STOP & 0xFF, STOP >> 8
    r = sim.registers
    r[12] = sp
    r[24] = addr
    r[26] = 0
    if a is not None:
        r[0] = a
    t0 = r[25]
    sim.run(addr, STOP)
    return r[25] - t0


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 800
    s = symbols()
    sim = make_sim()
    m = sim.memory
    # démarrage : bloc déplacé, images décalées
    reloc = s['reloc_end'] - 0xC100
    m[0xC100:0xC100 + reloc] = m[0x4000:0x4000 + reloc]
    print('init_sprites :', call(sim, s['init_sprites']), 'T (une fois)', flush=True)
    call(sim, s['spr_init'])
    states = diff_gb.run_gb(n)
    tot = {'gb_tick': [], 'prepare_all': [], 'draw_all': [], 'show_score': []}
    for st in states[200::7]:
        if st is None:
            continue
        for a, v in st.items():
            m[a] = v
        for name in ('prepare_all', 'draw_all', 'show_score'):
            tot[name].append(call(sim, s[name]))
        for a, v in st.items():
            m[a] = v
        tot['gb_tick'].append(call(sim, s['gb_tick']))
    for k, v in tot.items():
        if v:
            print(f'{k:12s} moyenne {sum(v) // len(v):6d} T   max {max(v):6d} T')


if __name__ == '__main__':
    main()
