"""Test de la projection réécrite en Z80 natif (src/proj.asm : proj, lift,
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
sys.path.insert(0, HERE)
import prof_cpc  # noqa: E402


def build(env_extra):
    env = dict(os.environ, **env_extra)
    subprocess.run(['sh', 'build.sh'], cwd=ROOT, env=env, check=True, stdout=subprocess.DEVNULL)


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 3000
    build({'REF_PROJ': '1'})
    s = prof_cpc.symbols()
    sim = prof_cpc.make_sim()
    m = sim.memory
    r = sim.registers
    rnd = random.Random(3)
    bad = 0
    cyc = [0, 0]
    for i in range(n):
        obj = [rnd.randrange(256) for _ in range(6)]
        z, st = rnd.randrange(256), rnd.choice((2, 3, 4))
        mark = i % 3 == 0
        res = []
        for native in (False, True):
            m[0xC042:0xC048] = bytes(obj)
            m[0xC047], m[0xC040] = z, st
            base = 0xC062 if mark else 0xC042
            if mark:
                m[0xC062:0xC066] = bytes(obj[:4])
            r[6], r[7] = base >> 8, base & 0xFF          # H, L
            if native:
                cyc[1] += prof_cpc.call(sim, s['proj_mark' if mark else 'proj'])
                if not mark:
                    cyc[1] += prof_cpc.call(sim, s['lift'])
            else:
                cyc[0] += prof_cpc.call(sim, s['G_0951' if mark else 'G_095D'])
                if not mark:
                    r[0] = z                             # A
                    cyc[0] += prof_cpc.call(sim, s['G_09C2'])
            res.append((r[2], r[3]))                     # B, C
        if res[0] != res[1]:
            bad += 1
            if bad < 6:
                print('différence', obj, z, st, mark, 'ROM', res[0], 'natif', res[1])
    print(f'{n} projections, {bad} différentes ; cycles : ROM traduite {cyc[0] // n}, natif {cyc[1] // n}')
    build({})


if __name__ == '__main__':
    main()
