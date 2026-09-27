---
name: gb-to-mo5-port
description: Port a Game Boy game to the Thomson MO5 (cassette) by translating the GB ROM (SM83) to 6809 assembly (asm6809), using the SM83->6809 translator, 6809 emulator and lessons from the MO5 Tennis port. Use when the user wants to port, convert or adapt a Game Boy (GB/DMG) game to a Thomson MO5 (or MO6/TO7-family 6809 machines), or asks about SM83 to 6809 translation, MO5 video/keyboard/cassette details, software sprites by cell recomposition or DCMOTO testing for such a port.
---

# Game Boy → Thomson MO5 port

The user already ported Tennis (Game Boy, Nintendo 1989) to the Thomson MO5 as **MO5 Tennis** (cassette `.k7`). Other versions, each with its own skill:
- Z80 machines: `gb-to-zx-port`, `gb-to-cpc-port`, `gb-to-coleco-port`, `gb-to-msx-port`;
- 6502: `gb-to-c64-port`.

## Where everything is

- Kit: `G:\Mon Drive\Coding\Tennis\gb2mo5-kit\`
  - `PORTING.md`: **the method. Read it fully first.** It covers:
    - the 6809 translator model: GB regs in the direct page, native Z/C, interprocedural flag liveness;
    - the verification gaps (initialisation, replaying real inputs);
    - MO5 hardware facts from MAME: video banks, colour byte, keyboard codes, `$A7E7` frame sync;
    - cell recomposition instead of sprites, the `.k7` format, the buzzer, gameplay feedback.
  - `template/`: the MO5 Tennis tools and sources, self-contained (ROM in `re/game.gb`). With the Tennis ROM it rebuilds the exact cassette. It includes:
    - `gb2m6809.py`, the translator;
    - `m6809.py`, an own 6809 emulator, and `test_m6809.py`;
    - `mo5sim.py`, `diff_mo5.py`, `make_k7.py`, `gen_mo5gfx.py`.
- Common reverse-engineering steps: `G:\Mon Drive\Coding\Tennis\gb2zx-kit\PORTING.md` §4-6.
- The full project is `G:\Mon Drive\Coding\Tennis\MO5\`.

## How to start

1. Read `gb2mo5-kit/PORTING.md`.
2. Ask the user the decisions: MO5 only or MO6 too, cassette or disk, controls (1 button?), name, text language.
3. Copy `template/*` into the new repo and put the ROM in `re/game.gb`. Fill `port_config.py`, then check PUSH AF/POP AF pairing and DATA_BLOCKS pointer tables (they must stay little-endian).
4. Verify the logic with `diff_mo5.py`. Also compare the initialisation against the Z80 version, and replay real inputs.
5. Adapt `gen_mo5gfx.py` and `render.asm`. Check with `mo5sim.py`. The user tests in DCMOTO; it has no command line, so tell them to use "Simuler le clavier" for `LOADM"",,R`.

## Non-negotiables

- The logic comes from the **ROM**, translated. Never hand-edit `gb/gb_logic.asm`.
- Count frames from `$A7E7` bit 7 falling edges, not from the PIA 50 Hz flag.
- Never publish claims about real-hardware behaviour: it has only been tested in DCMOTO.
- The user tests visually. Keep automated loops short. Always leave the **normal** (non-autoplay) build in `build/`.
- Talk to the user in French. In-game texts are in English.
