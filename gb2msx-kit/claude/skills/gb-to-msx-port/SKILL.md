---
name: gb-to-msx-port
description: Port a Game Boy game to MSX1 (cartridge) by translating the GB ROM (SM83) to Z80 assembly (sjasmplus), using the kit and lessons from the MSX Tennis port. Use when the user wants to port, convert or adapt a Game Boy (GB/DMG) game to the MSX, or asks about MSX cartridge setup (ENASLT, IM 2), TMS9918 VRAM timing, AY register 7, MSX keyboard/joystick reading, 50/60 Hz handling or openMSX/C-BIOS testing for such a port.
---

# Game Boy → MSX1 port

The user already ported Tennis (Game Boy, Nintendo 1989) to MSX1 as **MSX Tennis**. It was derived from the ColecoVision version (skill `gb-to-coleco-port`), which has the same VDP. Other versions:
- ZX Spectrum: `gb-to-zx-port`;
- C64: `gb-to-c64-port`;
- Amstrad CPC: `gb-to-cpc-port`;
- Thomson MO5: `gb-to-mo5-port`.

## Where everything is

- Kit: `G:\Mon Drive\Coding\Tennis\gb2msx-kit\`
  - `PORTING.md`: the MSX-specific method. Read `gb2coleco-kit\PORTING.md` first, for the VDP golden rule, mode 2, sprite layers and `RAM_MAP`.
  - `template/`: the MSX Tennis tools and sources, self-contained (ROM in `re/game.gb`). With the Tennis ROM it rebuilds the exact cartridge.
- Common reverse-engineering and verification steps: `G:\Mon Drive\Coding\Tennis\gb2zx-kit\PORTING.md` §4-6.
- The full project is `G:\Mon Drive\Coding\Tennis\MSX\`.

## How to start

1. Read `gb2coleco-kit/PORTING.md`, then `gb2msx-kit/PORTING.md`.
2. Ask the user the decisions: name, controls, text language.
3. Copy `template/*` into the new repo and put the ROM in `re/game.gb`. Fill `port_config.py`, including `RAM_MAP` for the HRAM, then verify with `tools/diff_msx.py`.
4. Adapt the graphics scripts and `render.asm`. Check with `tools/msxsim.py`, at both 60 Hz and 50 Hz (`--50`).
5. Test in openMSX with `C-BIOS_MSX1_EU` and `C-BIOS_MSX1`; no BIOS is needed. For scripted screenshots, do not use `throttle off`.

## Non-negotiables

- The logic comes from the **ROM**, translated. Never hand-edit `gb/gb_logic.asm`.
- VRAM is written only with the screen off and interrupts off, or inside the frame interrupt. PSG register 7 always keeps bits 7-6 = 10.
- The user tests visually. Keep automated emulator loops short. Always leave the **normal** (non-autoplay) build in `build/`.
- Talk to the user in French. In-game texts are in English.
