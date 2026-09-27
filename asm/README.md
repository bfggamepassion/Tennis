# ZX Tennis : version 100 % assembleur

Portage ZX Spectrum 48K du Tennis Game Boy (Nintendo, 1989), assemblé avec sjasmplus.

La logique du jeu (déroulement du match, joueurs, balle, IA) vient directement de la ROM Game Boy. `tools/gb2z80.py` la traduit instruction par instruction du processeur Game Boy (SM83) vers le Z80. Tout le reste est écrit à la main pour le Spectrum : démarrage, interruption, entrées, affichage et son.

## Arborescence

| Chemin | Contenu |
|---|---|
| `build.sh` | Compilation complète. Produit `build/tennis.tap`. |
| `src/main.asm` | Point d'entrée, interruption IM2, menu (sur l'écran de présentation), boucle de jeu, affichage du score, chargeur BASIC de la cassette. |
| `src/defs.asm` | Carte mémoire et variables GB lues par l'affichage. |
| `src/gb_support.asm` | Ce qu'attend la logique traduite : routines RST, remplacement du son (`$3665`) et des changements d'écran (`$016D`), début de match, pas de jeu. |
| `src/input.asm` | Clavier (Q A O P, ESPACE, M) et joystick Kempston, convertis en joypad GB. |
| `src/text.asm` | Texte, avec la police de la ROM Spectrum. |
| `src/court.asm` | Projection court → écran et tracé du court (lignes, filet). |
| `src/sprite.asm` | Moteur de sprites masqués : décalage mis en cache, dessin et restauration en boucles déroulées. |
| `src/render.asm` | Affichage des joueurs, de la balle, de l'ombre et de la marque, d'après les routines d'affichage de la ROM. |
| `src/sound.asm` | Bruitages au beeper. |
| `gb/gb_logic.asm` | **Généré** : la logique de la ROM traduite. Chaque ligne indique l'adresse GB d'origine. Ne pas modifier à la main. |
| `gfx/sprites.asm` | **Généré** : sprites tirés de la ROM (`tools/gen_sprites.py --asm`). |
| `gfx/title.scr`, `gfx/title.asm` | **Générés** : écran de présentation (`tools/gen_title.py`) : logo TENNIS de la ROM GB, « ZX » et rayures arc-en-ciel. Le `.scr` est l'écran de chargement (bloc SCREEN$ de la cassette), le `.asm` la même image compressée en RLE, affichée par le menu. |
| `build/` | Sorties : `tennis.tap`, table des symboles et listing. |

## Mémoire

| Adresses | Usage |
|---|---|
| `$6000-$7FFF` | Code froid (mémoire ralentie) : démarrage, menu, texte, score, décor, écran titre. La pile est juste en dessous. |
| `$8000-$BFFF` | Code chaud : interruption, boucle de jeu, logique traduite, sprites, son. |
| `$C000-$C0FF` | RAM Game Boy (objets, match), aux mêmes adresses que sur la console. |
| `$D400-$D84F` | Caches et tampons des sprites. |
| `$DD00` | État du son GB, testé par la logique. |
| `$E000-` | Graphismes des sprites. |
| `$FE00-$FF00` | Table d'interruption IM2. |
| `$FF80-$FFFE` | HRAM Game Boy, aux mêmes adresses. |

## Cadence

Affichage à 50 images/s. La logique garde le rythme exact du Game Boy (59,7 Hz) : 6 pas de jeu toutes les 5 trames.

## Compiler et tester

```sh
sh asm/build.sh
python tools/zxrun.py asm/build/tennis.tap --frames 1500 --keys "60-62:ENTER" --bot 0xC000 --sheet 50
```

Profilage : assembler avec `-DPROFILE` (depuis `asm/src` : `sjasmplus -DPROFILE main.asm`). La bordure change alors de couleur pendant chaque partie de la boucle, et `zxrun.py` mesure la durée de chacune.
