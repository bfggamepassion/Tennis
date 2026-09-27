---
name: gb-to-coleco-port
description: Port a Game Boy game to the ColecoVision by translating the GB ROM (SM83) to Z80 assembly (sjasmplus), using the kit and lessons from the Coleco Tennis port. Use when the user wants to port, convert or adapt a Game Boy (GB/DMG) game to the ColecoVision, or asks about TMS9918 VRAM timing rules, NMI-driven VDP updates, mode 2 conversion of GB graphics, 1 KB RAM remapping, SN76489 sound or openMSX testing for such a port.
---

# Game Boy → ColecoVision port

The user already ported Tennis (Game Boy, Nintendo 1989) to the ColecoVision as **Coleco Tennis**. Other versions exist, each with its own skill:
- ZX Spectrum: `gb-to-zx-port`;
- C64: `gb-to-c64-port`;
- Amstrad CPC and GX4000: `gb-to-cpc-port`;
- MSX1: `gb-to-msx-port`;
- Thomson MO5: `gb-to-mo5-port`.

Reuse that work.

## Where everything is

- Kit: `G:\Mon Drive\Coding\Tennis\gb2coleco-kit\`
  - `PORTING.md`: **the method. Read it fully first.** It covers:
    - the 1 KB RAM and `RAM_MAP` in `gb2z80.py`;
    - **the VDP golden rule**: VRAM is written only with the screen off and the NMI off, or inside the NMI from RAM buffers (`frame_ready`, `vdp_free`);
    - mode 2 thirds, sprites as 2 one-colour layers, the 4-per-line limit and priority rotation;
    - SN76489, controller and keypad reading, pitfalls, numbers.
  - `template/`: the Coleco Tennis tools and sources, self-contained (ROM in `re/game.gb`). With the Tennis ROM it rebuilds the exact cartridge.
- Common reverse-engineering and verification steps: `G:\Mon Drive\Coding\Tennis\gb2zx-kit\PORTING.md` §4-6.
- The full project is `G:\Mon Drive\Coding\Tennis\Coleco\`.

## How to start

1. Read `gb2coleco-kit/PORTING.md`.
2. Ask the user the decisions: name, controls, text language.
3. Copy `template/*` into the new repo and put the ROM in `re/game.gb`.
4. Measure the GB RAM the logic uses and write `RAM_MAP`. Translate, then verify with `tools/diff_cv.py`.
5. Adapt the `gen_*.py` graphics scripts to the game, and write `render.asm` from the ROM's OAM routines.
6. After each visible step, run `tools/cvsim.py` (VDP access check and screenshots), then launch openMSX for the user.

## Non-negotiables

- The logic comes from the **ROM**, translated. Never hand-edit `gb/gb_logic.asm`.
- Never touch VRAM with the display on outside the NMI. `cvsim.py` must report no VDP errors.
- The BIOS (`COLECO.ROM`) is not distributed. The user copies it into `Documents\openMSX\share\systemroms`.
- The user tests visually. Keep automated emulator loops short. Always leave the **normal** (non-autoplay) build in `build/`.
- Talk to the user in French. In-game texts are in English.
