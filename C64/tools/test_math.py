"""Test des routines de calcul réécrites en 6502 (S_MUL, S_MUL2, S_MUL8, S_DIV,
S_DIV8) : la projection du jeu (G_095D, G_09C2) est exécutée avec elles et
avec la ROM traduite telle quelle (REF_MATH=1), sur des positions tirées au
hasard ; registres, indicateurs et octets de travail HRAM doivent coïncider.

Usage : python tools/test_math.py [nombre]
"""
import os
import random
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
sys.path.insert(0, HERE)
from py65.devices.mpu6502 import MPU  # noqa: E402

STOP = 0x0300
REGS = range(0x02, 0x0B)                   # zL..zCY
HRAM = range(0xFFC5, 0xFFD6)


def build(ref):
    env = dict(os.environ)
    if ref:
        env['REF_MATH'] = '1'
    subprocess.run(['sh', 'build.sh', '-D', 'GB_EXACT=1'], cwd=ROOT, env=env, check=True,
                   stdout=subprocess.DEVNULL)
    prg = open(os.path.join(ROOT, 'build', 'tennis.prg'), 'rb').read()
    lab = {}
    for line in open(os.path.join(ROOT, 'build', 'tennis.lbl')):
        p = line.split()
        lab[p[2].lstrip('.')] = int(p[1], 16)
    return prg, lab


def run(prg, lab, name, setup):
    mpu = MPU()
    load = prg[0] | (prg[1] << 8)
    mpu.memory[load:load + len(prg) - 2] = list(prg[2:])
    for a, v in setup.items():
        mpu.memory[a] = v
    mpu.memory[0x1FF] = (STOP - 1) >> 8
    mpu.memory[0x1FE] = (STOP - 1) & 0xFF
    mpu.sp, mpu.pc, mpu.y = 0xFD, lab[name], 0
    c0 = mpu.processorCycles
    while mpu.pc != STOP:
        mpu.step()
    zz, zc = mpu.memory[0x09], mpu.memory[0x0A]
    out = [mpu.memory[a] for a in REGS if a not in (0x09, 0x0A)] + [mpu.memory[a] for a in HRAM]
    return out + [zz == 0, zc & 1], mpu.processorCycles - c0


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 3000
    ref = build(True)
    fast = build(False)
    rnd = random.Random(1)
    bad = 0
    cyc = {False: 0, True: 0}
    for i in range(n):
        setup = {0xC000 + k: rnd.randrange(256) for k in range(0x100)}
        setup[0x02], setup[0x03] = 0x02 + rnd.choice((0, 0x20, 0x40)), 0xC0   # HL -> objet
        setup[0x08] = rnd.randrange(256)                                     # A : hauteur
        for name in ('G_095D', 'G_09C2'):
            if name == 'G_09C2':
                setup[0xFFCD] = rnd.randrange(256)
            a, ca = run(*ref, name, setup)
            b, cb = run(*fast, name, setup)
            cyc[False] += ca
            cyc[True] += cb
            if a != b:
                bad += 1
                if bad < 5:
                    print('différence', name, a, b)
    print(f'{2 * n} appels, {bad} différents ; cycles : ROM traduite {cyc[False] // (2 * n)}, '
          f'calculs réécrits {cyc[True] // (2 * n)} par appel')
    build(False)


if __name__ == '__main__':
    main()
