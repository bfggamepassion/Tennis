"""Traceur récursif pour la ROM Tennis (GB, 32 Ko, sans banking).

Suit le flot d'exécution depuis les vecteurs, en gérant les conventions
propres au jeu :
  rst $08 : suivi d'une table de sauts (dw), indexée par A
  rst $18 : suivi de "db N" puis N octets (lookup), reprise après
  rst $28 : suivi de "db N" puis N octets copiés vers [de], reprise après
Produit tennis.sym (blocs .code/.data pour mgbdis) et un rapport.
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools', 'mgbdis'))
from instruction_set import instructions  # noqa: E402

ROM = open(os.path.join(os.path.dirname(__file__), 'tennis.gb'), 'rb').read()
SIZE = len(ROM)

# Adresses de sauts indirects résolues à la main (jp hl, etc.) : ajoutées au fil de l'analyse.
EXTRA_ENTRIES = [int(x, 16) for x in sys.argv[1:]]

# Longueur imposée pour les tables rst $08 dont la fin ne se devine pas.
TABLE_LEN = {0x19e3: 3, 0x1a34: 3}


def length(op):
    if op == 0xCB:
        return 2
    m = instructions[op]
    if 'd16' in m or 'a16' in m:
        return 3
    if 'd8' in m or 'r8' in m or 'a8' in m:
        return 2
    return 1


code = bytearray(SIZE)       # 1 = octet d'instruction, 2 = données en ligne
starts = set()               # débuts d'instructions
jumptables = {}              # adresse table -> liste de cibles
jphl = []                    # sites jp hl non résolus
callers_pop = set()          # routines appelées qui commencent par pop hl
todo = [0x0100, 0x0040, 0x0048, 0x0050, 0x0058, 0x0060] + EXTRA_ENTRIES
branch_targets = set(todo)


def w(a):
    return ROM[a] | (ROM[a + 1] << 8)


def trace(pc):
    while 0 <= pc < SIZE:
        if pc in starts:
            return
        if code[pc]:
            print(f'! chevauchement à {pc:04x}')
            return
        op = ROM[pc]
        if op not in instructions or instructions[op].startswith('ILLEGAL'):
            print(f'! opcode illégal {op:02x} à {pc:04x}')
            return
        n = length(op)
        starts.add(pc)
        for i in range(n):
            code[pc + i] = 1
        m = instructions[op]
        nxt = pc + n

        if op == 0xCF:  # rst $08 : table de sauts
            jumptables[nxt] = []
            return
        if op in (0xDF, 0xEF):  # rst $18 / rst $28 : données en ligne
            cnt = ROM[nxt]
            for i in range(1 + cnt):
                code[nxt + i] = 2
            pc = nxt + 1 + cnt
            continue
        if op == 0xE9:  # jp hl
            jphl.append(pc)
            return
        if op in (0xC3, 0xCA, 0xC2, 0xDA, 0xD2, 0xCD, 0xC4, 0xCC, 0xD4, 0xDC):
            t = w(pc + 1)
            add(t)
            if op == 0xCD and ROM[t] == 0xE1:
                callers_pop.add(t)
        if op in (0x18, 0x20, 0x28, 0x30, 0x38):
            r = ROM[pc + 1]
            add(nxt + (r - 256 if r > 127 else r))
        if op in (0xC7, 0xD7, 0xE7, 0xF7, 0xFF, 0xCF, 0xDF, 0xEF):
            pass
        if op in (0xC3, 0x18, 0xC9, 0xD9):  # fin inconditionnelle
            return
        if op == 0xC7:  # rst $00 = reset
            return
        if op == 0xFF:  # rst $38 = piège
            return
        pc = nxt


def add(t):
    if t < SIZE and t not in starts:
        branch_targets.add(t)
        todo.append(t)


def extend_tables():
    """Étend chaque table de sauts tant que les entrées sont plausibles."""
    changed = False
    for tb, targets in jumptables.items():
        a = tb + 2 * len(targets)
        while a + 1 < SIZE and len(targets) < TABLE_LEN.get(tb, 999):
            if a in starts or a in branch_targets or code[a] or code[a + 1]:
                break
            t = w(a)
            if not (0x0150 <= t < 0x8000):
                break
            code[a] = code[a + 1] = 2
            targets.append(t)
            add(t)
            changed = True
            a += 2
    return changed


while True:
    while todo:
        trace(todo.pop())
    if not extend_tables():
        break
    # les nouvelles cibles sont tracées au tour suivant

ncode = sum(1 for b in code if b == 1)
ninl = sum(1 for b in code if b == 2)
print(f'code: {ncode} octets, données en ligne: {ninl}, reste: {SIZE - ncode - ninl}')
print(f'tables rst08: {len(jumptables)}')
for tb, t in sorted(jumptables.items()):
    print(f'  {tb:04x}: ' + ' '.join(f'{x:04x}' for x in t))
print('jp hl non résolus: ' + ' '.join(f'{x:04x}' for x in sorted(set(jphl))))
print('routines appelées commençant par pop hl: ' + ' '.join(f'{x:04x}' for x in sorted(callers_pop)))

# Blocs pour mgbdis
with open(os.path.join(os.path.dirname(__file__), 'tennis.sym'), 'w') as f:
    a = 0x0150
    while a < SIZE:
        kind = 'code' if code[a] == 1 else 'data'
        b = a
        while b < SIZE and b != 0x4000 and (('code' if code[b] == 1 else 'data') == kind):
            b += 1
        if b == a:
            b += 1
        if True:
            bank = 0
            f.write(f'{bank:02x}:{a:04x} .{kind}:{b - a:x}\n')
        a = b

# Plages de données (hors en ligne) pour la suite
with open(os.path.join(os.path.dirname(__file__), 'data_ranges.txt'), 'w') as f:
    a = 0x0150
    while a < SIZE:
        if code[a] == 0:
            b = a
            while b < SIZE and code[b] == 0:
                b += 1
            f.write(f'{a:04x}-{b - 1:04x} ({b - a} octets)\n')
            a = b
        else:
            a += 1
