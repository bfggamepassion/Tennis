"""Police du jeu (la GX4000 n'a pas de ROM système) : chiffres et lettres de
la police du Tennis GB (tuiles de l'écran titre, $D0-$D9 et $DA-$F3), plus
quelques signes dessinés ici. 64 caractères (codes 32-95), 8 octets chacun
(1 bit par pixel, comme la police de la ROM du CPC).
Sortie : gfx/font.asm (étiquette font)
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen_cpctitle as t  # noqa: E402

ROOT = os.path.join(HERE, '..')
EXTRA = {                       # signes absents de la police GB (8 lignes de 8 pixels)
    '-': ['', '', '', '######', '', '', '', ''],
    '/': ['      #', '     #', '    #', '   #', '  #', ' #', '#', ''],
    ':': ['', '  ##', '  ##', '', '', '  ##', '  ##', ''],
    '.': ['', '', '', '', '', '  ##', '  ##', ''],
    ',': ['', '', '', '', '', '  ##', '  ##', ' ##'],
    '!': ['  ##', '  ##', '  ##', '  ##', '  ##', '', '  ##', ''],
    '>': [' #', '  #', '   #', '    #', '   #', '  #', ' #', ''],
    '+': ['', '   #', '   #', ' #####', '   #', '   #', '', ''],
    '(': ['   #', '  #', ' #', ' #', ' #', '  #', '   #', ''],
    ')': [' #', '  #', '   #', '   #', '   #', '  #', ' #', ''],
    "'": ['  #', '  #', ' #', '', '', '', '', ''],
}


def main():
    v = t.title_vram()
    out = ['; Fichier généré par tools/gen_font.py : police (codes 32-95), 1 bit par pixel.', 'font']
    for code in range(32, 96):
        ch = chr(code)
        rows = [0] * 8
        if ch.isdigit() or ('A' <= ch <= 'Z'):
            tile = 0xD0 + int(ch) if ch.isdigit() else 0xDA + ord(ch) - ord('A')
            px = v.tile(tile)
            rows = [sum(0x80 >> x for x in range(8) if px[y][x]) for y in range(8)]
        elif ch in EXTRA:
            rows = [sum(0x80 >> x for x, c in enumerate(r) if c == '#') for r in EXTRA[ch]]
        out.append('        db ' + ', '.join(f'${b:02X}' for b in rows) + f'   ; {ch!r}')
    open(os.path.join(ROOT, 'gfx', 'font.asm'), 'w', encoding='utf-8').write('\n'.join(out) + '\n')
    print('police : 64 caractères')


if __name__ == '__main__':
    main()
