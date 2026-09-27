#!/bin/sh
# Version assembleur : traduit la logique depuis la ROM GB, génère les sprites
# et le décor, assemble avec sjasmplus -> asm/build/tennis.tap (+ .sym, .lst)
#
# L'assemblage se fait dans une copie locale (hors Google Drive) : écrire la
# cassette bloc par bloc directement dans le Drive la corrompait. Les fichiers
# produits sont ensuite recopiés d'un coup dans asm/build/.
set -e
cd "$(dirname "$0")"
SJASM="${SJASM:-$LOCALAPPDATA/sjasmplus/sjasmplus-1.24.0.win/sjasmplus.exe}"
WORK="${TENNIS_WORK:-$LOCALAPPDATA/Tennis/asm_build}"
mkdir -p build
python -X utf8 ../tools/gb2z80.py
python -X utf8 ../tools/gen_sprites.py --asm
python -X utf8 ../tools/gen_scenery.py
python -X utf8 ../tools/gen_title.py
rm -rf "$WORK"
mkdir -p "$WORK/build"
cp -r src gb gfx "$WORK/"
(cd "$WORK/src" && "$SJASM" --nologo --msg=war --sym=../build/tennis.sym --lst=../build/tennis.lst main.asm "$@")
cp "$WORK/build/tennis.tap" "$WORK/build/tennis.sym" "$WORK/build/tennis.lst" build/
ls -l build/tennis.tap
