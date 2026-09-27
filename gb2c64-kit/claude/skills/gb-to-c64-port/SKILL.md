---
name: gb-to-c64-port
description: Port a Game Boy game to the Commodore 64 by translating the GB ROM (SM83) to 6502 assembly (64tass), using the kit and lessons from the C64 Tennis port. Use when the user wants to port, convert or adapt a Game Boy (GB/DMG) game to the C64 / Commodore 64, or asks about SM83→6502 translation, C64 character/sprite conversion of GB graphics, SID sound or VICE testing for such a port.
---

# Game Boy → Commodore 64 port

The user already ported Tennis (Game Boy, Nintendo 1989) to the C64 as **C64 Tennis**. They had first ported it to the ZX Spectrum as ZX Tennis (see the `gb-to-zx-port` skill). Reuse that work instead of starting from scratch.

## Where everything is

- Kit: `G:\Mon Drive\Coding\Tennis\gb2c64-kit\`
  - `PORTING.md`: **the C64 method. Read it fully before doing anything.** It covers:
    - the translation model: zero-page registers, zZ/zCY flags, the 6502 stack with JSR -1, `$01` banking;
    - verification and optimisation;
    - 1:1 display with GB tiles as chars (mixed MC/hires) and hardware sprites;
    - SID, input, title screen;
    - pitfalls and reference numbers.
  - `template/`: the starting point. It holds:
    - generic config-driven tools: `gb2m6502.py`, `diff_gb6502.py`, `c64gfx.py`, `gb_trace.py`, `gb_closure.py`, `gbgfx.py`;
    - a 64tass skeleton that assembles and runs in VICE.
  - `examples/tennis/port_config.py`: a complete, verified config. With it, `gb2m6502.py` reproduces the Tennis 6502 logic byte for byte.
- The common reverse-engineering steps (trace, disassemble, find the logic roots, fill the config) are in `G:\Mon Drive\Coding\Tennis\gb2zx-kit\PORTING.md` §4-5.
- The full C64 Tennis project, for game-specific examples, is `G:\Mon Drive\Coding\Tennis\C64\`:
  - `src/render.asm`: native projection with tables;
  - `src/text.asm`, `src/menu.asm`, `src/sound.asm`;
  - `tools/gen_c64gfx.py`: stadium, crowd colouring;
  - `tools/gen_c64sprites.py`, `tools/gen_c64title.py`;
  - `tools/test_math.py`, `tools/test_proj.py`.

## How to start a new port

1. Read `gb2c64-kit/PORTING.md`.
2. Ask the user the decisions: fidelity, PAL/NTSC, controls, one-button mapping, name, text language.
3. Copy `gb2c64-kit/template/*` into the new repo. Put the ROM in `re/game.gb`.
4. Follow the steps in order:
   - trace, then disassemble;
   - find the logic roots, then fill `port_config.py`;
   - run `gb2m6502.py`;
   - write `gb_support.asm`;
   - **prove fidelity with `diff_gb6502.py`** (0 diffs);
   - profile, then write fast native stubs for the hot spots, each verified against the translated ROM;
   - do the display, sprites, SID, input and menu.
5. After each visible step, capture a screenshot with headless VICE (`-limitcycles`, `-exitscreenshot`). Then launch VICE for the user with `-autostart build/game.prg`. The user tests by playing.

## Non-negotiables learned on the GB ports

- The game logic comes from the **ROM**, translated. Never hand-edit the generated `gb/gb_logic_*.asm`. Gameplay tweaks go under `.if !GB_EXACT`, and verification builds with `-D GB_EXACT=1`.
- Any hand-written replacement of ROM code must be verified against the translated ROM with random inputs.
- Always assemble with 64tass `-C`, and keep Y = 0 in all code called by the translated logic.
- Measure real speed in VICE with an autoplay build and a late-frame counter; don't guess.
- Smooth motion comes before speed tricks. Keep the one-button mapping simple and automatic.
- Talk to the user in French. In-game texts are in English unless the user decides otherwise.

## Other kits

Sibling kits and skills: gb2zx-kit (`gb-to-zx-port`), gb2cpc664-kit (`gb-to-cpc-port`), gb2c64-kit (`gb-to-c64-port`), gb2coleco-kit (`gb-to-coleco-port`), gb2msx-kit (`gb-to-msx-port`), gb2mo5-kit (`gb-to-mo5-port`, SM83->6809). The Z80 translator `gb2z80.py` now supports `RAM_MAP` (GB RAM relocation).
