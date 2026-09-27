"""Assemble la cartouche Master System : pages 0-1 (build/page01.bin), page 2
(build/page2.bin) et page 3 (build/page3.bin) -> build/tennis.sms (64 Ko), et
écrit la somme de contrôle de l'en-tête « TMR SEGA » ($7FFA : somme des
octets $0000-$7FEF, code de taille $C = 32 Ko en $7FFF).
Usage : python tools/make_rom.py [sortie]
"""
import os
import sys

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
BUILD = os.path.join(ROOT, 'build')


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else os.path.join(BUILD, 'tennis.sms')
    rom = bytearray()
    for name, size in (('page01.bin', 0x8000), ('page2.bin', 0x4000), ('page3.bin', 0x4000)):
        data = open(os.path.join(BUILD, name), 'rb').read()
        assert len(data) == size, f'{name} : {len(data)} octets'
        rom += data
    assert rom[0x7FF0:0x7FF8] == b'TMR SEGA'
    s = sum(rom[:0x7FF0]) & 0xFFFF
    rom[0x7FFA] = s & 0xFF
    rom[0x7FFB] = s >> 8
    open(out, 'wb').write(rom)
    print(f'cartouche : {out} ({len(rom) // 1024} Ko, somme ${s:04X})')


if __name__ == '__main__':
    main()
