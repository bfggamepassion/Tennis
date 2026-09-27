---
name: gb-to-zx-port
description: Port a Game Boy game to the ZX Spectrum by translating the GB ROM (SM83) to Z80 assembly (sjasmplus), using the kit and lessons from the ZX Tennis port. Use when the user wants to port, convert or adapt a Game Boy (GB/DMG) game to the ZX Spectrum, or asks about SM83→Z80 translation, Spectrum sprite engines, or beeper sound for such a port.
---

# Game Boy → ZX Spectrum port

The user already ported Tennis (Game Boy, Nintendo 1989) to the ZX Spectrum 48K as **ZX Tennis**. Reuse that work instead of starting from scratch.

## Where everything is

- Kit: `G:\Mon Drive\Coding\Tennis\gb2zx-kit\`
  - `PORTING.md`: **the method. Read it fully before doing anything.** It covers the steps, the SM83/Z80 differences, the sprite engine, timing, memory map, known pitfalls, and the user's preferences.
  - `template/`: the starting point for a new port. It holds:
    - generic tools, all driven by `port_config.py`: `gb_trace.py`, `gb_closure.py`, `gb2z80.py`, `diff_gb.py`, `zxrun.py`, `gbgfx.py`, `mono_sprite.py`, `zxscreen.py`;
    - an asm skeleton that assembles and runs: IM2 interrupt, 60→50 Hz timing, masked sprite engine, beeper, RLE title screen, and a BASIC loader with `SCREEN$`.
  - `examples/tennis/port_config.py`: a complete, verified config. With it, `gb2z80.py` reproduces Tennis's `gb_logic.asm` byte for byte.
- The full Tennis project, for game-specific examples, is `G:\Mon Drive\Coding\Tennis\`:
  - `asm/src/`: render, projection, court, menu and score code;
  - `re/FICHE_JEU.md`: an example of a reverse-engineering write-up;
  - `tools/gen_*.py`: the sprite, scenery and title generators.

## How to start a new port

1. Read `gb2zx-kit/PORTING.md`.
2. Ask the user the "Étape 0" decisions: fidelity, 48K or 128K, sound, colours, modes, controls, one-button mapping, and text language.
3. Copy `gb2zx-kit/template/*` into the new repo. Put the ROM in `re/game.gb`.
4. Follow the steps in order:
   - trace, then disassemble;
   - write the game write-up;
   - find the logic roots, then fill in `port_config.py`;
   - run `gb_closure.py`, then `gb2z80.py`;
   - write `gb_support.asm`;
   - **validate with `diff_gb.py`**;
   - do the graphics, sprites, input, sound, title screen and menu.
5. After each visible step, capture the result with `zxrun.py`. Then relaunch ZEsarUX for the user with the command in PORTING.md §2. The user tests by playing.

## Non-negotiables learned on Tennis

- The game logic comes from the **ROM**, translated. It is never rewritten from observing the game. Regenerate `gb_logic.asm`; never hand-edit it. Intentional gameplay tweaks go in `PATCHES`, isolated and documented.
- Use assembly (sjasmplus), not Boriel Basic.
- Build in a local copy outside Google Drive, because Drive corrupted `.tap` files. `build.sh` already does this.
- Smooth sprite motion comes before speed tricks. Keep the one-button mapping simple and automatic. The user rejected button combos and "arming" schemes.
- Talk to the user in French. In-game texts are in English unless the user decides otherwise.

## Other kits

Sibling kits and skills: gb2zx-kit (`gb-to-zx-port`), gb2cpc664-kit (`gb-to-cpc-port`), gb2c64-kit (`gb-to-c64-port`), gb2coleco-kit (`gb-to-coleco-port`), gb2msx-kit (`gb-to-msx-port`), gb2mo5-kit (`gb-to-mo5-port`, SM83->6809). The Z80 translator `gb2z80.py` now supports `RAM_MAP` (GB RAM relocation).
