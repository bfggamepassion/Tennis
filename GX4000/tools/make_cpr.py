"""Cartouche CPC Plus / GX4000 (.cpr) : conteneur RIFF « AMS! » et pages
« cbNN » de 16 Ko (page 0 : démarrage, vue en $0000 à la mise sous tension).

  python tools/make_cpr.py sortie.cpr page0.bin page1.bin ...
"""
import sys


def main():
    out, pages = sys.argv[1], sys.argv[2:]
    body = b'AMS!'
    n = 0
    for p in pages:
        data = open(p, 'rb').read()
        for k in range(0, max(len(data), 1), 16384):
            chunk = data[k:k + 16384].ljust(16384, b'\0')
            body += f'cb{n:02d}'.encode() + (16384).to_bytes(4, 'little') + chunk
            n += 1
    open(out, 'wb').write(b'RIFF' + len(body).to_bytes(4, 'little') + body)
    print(f'{out} : {n} pages de 16 Ko')


if __name__ == '__main__':
    main()
