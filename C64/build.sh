#!/bin/sh
# Version C64 : traduit la logique depuis la ROM GB (6502), assemble avec
# 64tass -> build/tennis.prg (+ étiquettes VICE build/tennis.lbl, listing).
set -e
cd "$(dirname "$0")"
TASS="${TASS:-$LOCALAPPDATA/64tass/64tass-1.60.3243/64tass.exe}"
mkdir -p build
python -X utf8 tools/gb2m6502.py
python -X utf8 tools/gen_c64gfx.py
python -X utf8 tools/gen_c64sprites.py
python -X utf8 tools/gen_c64title.py
(cd src && "$TASS" -q -a -B -C -o ../build/tennis.prg --vice-labels -l ../build/tennis.lbl -L ../build/tennis.lst main.asm "$@")
ls -l build/tennis.prg
