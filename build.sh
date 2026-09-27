#!/bin/sh
# Compile src/tennis.bas en build/tennis.tap (Spectrum 48K, chargeur BASIC inclus)
set -e
cd "$(dirname "$0")"
ZXBC="${ZXBC:-$APPDATA/Python/Python314/Scripts/zxbc.exe}"
mkdir -p build
"$ZXBC" src/tennis.bas -f tap -B -a -O2 --org 24100 --heap-size 1024 -M build/tennis.map -o build/tennis.tap "$@"
ls -l build/tennis.tap
