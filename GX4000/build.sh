#!/bin/sh
# Version CPC Plus / GX4000 : traduit la logique depuis la ROM GB (Z80, la même
# que pour le Spectrum et le CPC), génère les graphismes et les sprites
# matériels, assemble (sjasmplus) le programme puis la page de démarrage, et
# fabrique la cartouche build/tennis.cpr.
# Assemblage dans une copie locale (hors Google Drive), comme les autres versions.
set -e
cd "$(dirname "$0")"
SJASM="${SJASM:-$LOCALAPPDATA/sjasmplus/sjasmplus-1.24.0.win/sjasmplus.exe}"
WORK="${TENNIS_WORK:-$LOCALAPPDATA/Tennis/gx_build}"
mkdir -p build
python -X utf8 tools/gb2z80.py
python -X utf8 tools/gen_cpcgfx.py
python -X utf8 tools/gen_cpctitle.py
python -X utf8 tools/gen_font.py
python -X utf8 tools/gen_plus_sprites.py
rm -rf "$WORK"
mkdir -p "$WORK/build"
cp -r src gb gfx "$WORK/"
(cd "$WORK/src" && "$SJASM" --nologo --msg=war --sym=../build/tennis.sym --lst=../build/tennis.lst main.asm "$@")
BOOT2=$(grep -i "^boot2:" "$WORK/build/tennis.sym" | sed 's/.*0x0*\([0-9A-Fa-f]*\).*/\1/')
(cd "$WORK/src" && "$SJASM" --nologo --msg=war -DBOOT2=0x$BOOT2 boot.asm)
python -X utf8 tools/make_cpr.py "$WORK/build/tennis.cpr" "$WORK/build/page0.bin" "$WORK/build/page1.bin" "$WORK/build/page2.bin" build/sprite_pages.bin
cp "$WORK/build/tennis.cpr" "$WORK/build/tennis.sym" "$WORK/build/tennis.lst" build/
ls -l build/tennis.cpr
