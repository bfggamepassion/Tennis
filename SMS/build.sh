#!/bin/sh
# Version Master System : traduit la logique depuis la ROM GB (Z80, RAM GB aux
# mêmes adresses, HRAM déplacée), génère les graphismes en couleurs, assemble
# avec sjasmplus -> build/tennis.sms (cartouche 64 Ko, mapper Sega).
# Assemblage dans une copie locale (hors Google Drive), comme pour le Spectrum.
# Options passées à sjasmplus, ex. : sh build.sh -DAUTOPLAY
set -e
cd "$(dirname "$0")"
SJASM="${SJASM:-$LOCALAPPDATA/sjasmplus/sjasmplus-1.24.0.win/sjasmplus.exe}"
WORK="${TENNIS_WORK:-$LOCALAPPDATA/Tennis/sms_build}"
PY="${PYTHON:-python}"
mkdir -p build
"$PY" -X utf8 tools/gb2z80.py
"$PY" -X utf8 tools/gen_smsgfx.py
"$PY" -X utf8 tools/gen_smstitle.py
"$PY" -X utf8 tools/gen_smssprites.py
rm -rf "$WORK"
mkdir -p "$WORK/build"
cp -r src gb gfx "$WORK/"
(cd "$WORK/src" && "$SJASM" --nologo --msg=war --sym=../build/tennis.sym --lst=../build/tennis.lst main.asm "$@")
cp "$WORK/build/page01.bin" "$WORK/build/page2.bin" "$WORK/build/page3.bin" \
   "$WORK/build/tennis.sym" "$WORK/build/tennis.lst" build/
"$PY" -X utf8 tools/make_rom.py
