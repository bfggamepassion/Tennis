---
name: gb-to-cpc-port
description: Port a Game Boy game to the Amstrad CPC (664/6128) by translating the GB ROM (SM83) to Z80 assembly (sjasmplus), using the kit and lessons from the CPC Tennis port. Use when the user wants to port, convert or adapt a Game Boy (GB/DMG) game to the Amstrad CPC, or asks about CPC software sprites, mode 0/1 conversion of GB graphics, AY sound, disk images or Caprice32 testing for such a port.
---

# Game Boy → Amstrad CPC port

The user already ported Tennis (Game Boy, Nintendo 1989) to the Amstrad CPC 664 as **CPC Tennis**. They also made a ZX Spectrum version (skill `gb-to-zx-port`) and a C64 version (skill `gb-to-c64-port`). Reuse that work.

## Where everything is

- Kit: `G:\Mon Drive\Coding\Tennis\gb2cpc664-kit\`
  - `PORTING.md`: **the CPC method. Read it fully first.** It covers:
    - the 64K memory plan: screen moved to $4000, firmware off, startup-only data in the file's $4000 window;
    - software sprites: all XOR, trimmed rows, 4 pre-shifts built at startup, redraw only changed sprites in beam order, sync on the VSYNC edge read from the PPI;
    - mode 0 title with a per-row palette, keyboard/joystick through the PSG, AY sound;
    - Caprice32 automation, pitfalls and reference numbers.
  - `template/`: tools (`gb2z80.py` is the same Z80 translator as the Spectrum, `cpcgfx.py`, `make_dsk.py`, `cpcshot.sh`, `sim64.py`) and a sjasmplus skeleton that boots in Caprice32 and moves a demo sprite.
- Common reverse-engineering and verification steps: `G:\Mon Drive\Coding\Tennis\gb2zx-kit\PORTING.md` §4-6. The Z80 logic translation is verified with the Spectrum `diff_gb.py`.
- The full CPC Tennis project is `G:\Mon Drive\Coding\Tennis\Amstrad\`:
  - `src/render.asm` and `proj.asm`: native projection with tables;
  - `src/menu.asm`: mode 0 title and menu;
  - `src/input.asm`: 1/2-button option and auto lob;
  - `tools/gen_cpcgfx.py`, `gen_cpcsprites.py`, `gen_cpctitle.py`;
  - `tools/prof_cpc.py`, `test_proj.py`, `cpc_frames.py`.

## How to start

1. Read `gb2cpc664-kit/PORTING.md`.
2. Ask the user the decisions: target model, graphics mode, 1 or 2 buttons, name, text language.
3. Copy `template/*` into the new repo and put the ROM in `re/game.gb`. Fill `port_config.py`, then translate and verify as in the Spectrum guide.
4. Replace the demo graphics with the game's own, using `cpcgfx.py`. Write `render.asm` from the ROM's OAM routines, and write the menu.
5. After each visible step, take one quick Caprice32 capture, then launch Caprice32 for the user. Always leave the **normal** build (not the autoplay/profile build) in `build/`.

## Non-negotiables

- The logic comes from the **ROM**, translated. Never hand-edit `gb/gb_logic.asm`. Any hand-written replacement of ROM code must be verified against the translated ROM.
- Watch the part A and part B `ASSERT`s; memory is tight on a 664.
- Draw sprites right after the VSYNC edge polled on the PPI. Never find VSYNC by counting interrupts.
- The user tests visually. Keep automated emulator loops short.
- Talk to the user in French. In-game texts are in English.

## Other kits

Sibling kits and skills: gb2zx-kit (`gb-to-zx-port`), gb2cpc664-kit (`gb-to-cpc-port`), gb2c64-kit (`gb-to-c64-port`), gb2coleco-kit (`gb-to-coleco-port`), gb2msx-kit (`gb-to-msx-port`), gb2mo5-kit (`gb-to-mo5-port`, SM83->6809). The Z80 translator `gb2z80.py` now supports `RAM_MAP` (GB RAM relocation).
