#!/bin/sh
# Version Amstrad CPC664 : traduit la logique depuis la ROM GB (Z80, la même
# que pour le Spectrum), génère les graphismes, assemble avec sjasmplus et
# fabrique la disquette build/tennis.dsk (RUN"TENNIS").
# Assemblage dans une copie locale (hors Google Drive), comme pour le Spectrum.
set -e
cd "$(dirname "$0")"
SJASM="${SJASM:-$LOCALAPPDATA/sjasmplus/sjasmplus-1.24.0.win/sjasmplus.exe}"
WORK="${TENNIS_WORK:-$LOCALAPPDATA/Tennis/cpc_build}"
mkdir -p build
python -X utf8 tools/gb2z80.py
python -X utf8 tools/gen_cpcgfx.py
python -X utf8 tools/gen_cpcsprites.py
python -X utf8 tools/gen_cpctitle.py
rm -rf "$WORK"
mkdir -p "$WORK/build"
cp -r src gb gfx "$WORK/"
(cd "$WORK/src" && "$SJASM" --nologo --msg=war --sym=../build/tennis.sym --lst=../build/tennis.lst main.asm "$@")
python -X utf8 tools/make_dsk.py "$WORK/build/tennis.dsk" TENNIS.BIN "$WORK/build/tennis.bin" 0x0200 0x0200
cp "$WORK/build/tennis.dsk" "$WORK/build/tennis.bin" "$WORK/build/tennis.sym" "$WORK/build/tennis.lst" build/
ls -l build/tennis.dsk
