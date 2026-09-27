"""Test de la projection réécrite en 6502 natif (src/render.asm : proj, lift,
proj_mark) contre la projection de la ROM traduite (G_095D, G_09C2, G_0951),
sur des positions tirées au hasard. Construit une version de référence
(REF_PROJ=1) qui contient les deux, puis reconstruit la version normale.

Usage : python tools/test_proj.py [nombre]
"""
import os
import random
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, '..')
from py65.devices.mpu6502 import MPU  # noqa: E402

STOP = 0x0300


def build(env_extra):
    env = dict(os.environ, **env_extra)
    subprocess.run(['sh', 'build.sh'], cwd=ROOT, env=env, check=True, stdout=subprocess.DEVNULL)


def load():
    prg = open(os.path.join(ROOT, 'build', 'tennis.prg'), 'rb').read()
    lab = {}
    for line in open(os.path.join(ROOT, 'build', 'tennis.lbl')):
        p = line.split()
        lab[p[2].lstrip('.')] = int(p[1], 16)
    mpu = MPU()
    load_addr = prg[0] | (prg[1] << 8)
    mpu.memory[load_addr:load_addr + len(prg) - 2] = list(prg[2:])
    return mpu, lab


def call(mpu, addr):
    mpu.memory[0x1FF] = (STOP - 1) >> 8
    mpu.memory[0x1FE] = (STOP - 1) & 0xFF
    mpu.sp, mpu.pc, mpu.y = 0xFD, addr, 0
    c0 = mpu.processorCycles
    while mpu.pc != STOP:
        mpu.step()
    return mpu.processorCycles - c0


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 5000
    build({'REF_PROJ': '1'})
    mpu, lab = load()
    m = mpu.memory
    rnd = random.Random(2)
    bad = 0
    cyc = [0, 0]
    for i in range(n):
        obj = [rnd.randrange(256) for _ in range(6)]
        z, st = rnd.randrange(256), rnd.choice((2, 3, 4))
        res = []
        for native in (False, True):
            m[0xC042:0xC048] = obj
            m[0xC047], m[0xC040] = z, st
            m[0x02], m[0x03] = 0x42, 0xC0
            mark = i % 3 == 0
            if native:
                cyc[1] += call(mpu, lab['proj_mark' if mark else 'proj'])
                if not mark:
                    cyc[1] += call(mpu, lab['lift'])
            else:
                cyc[0] += call(mpu, lab['G_0951' if mark else 'G_095D'])
                if not mark:
                    m[0x08] = z
                    cyc[0] += call(mpu, lab['G_09C2'])
            res.append((m[0x05], m[0x04]))          # zB, zC
        if res[0] != res[1]:
            bad += 1
            if bad < 6:
                print('différence', obj, z, st, 'ROM', res[0], 'natif', res[1])
    print(f'{n} projections, {bad} différentes ; cycles : ROM traduite {cyc[0] // n}, natif {cyc[1] // n}')
    build({})


if __name__ == '__main__':
    main()
