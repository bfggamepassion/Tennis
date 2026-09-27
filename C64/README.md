# C64 Tennis : portage Commodore 64 en assembleur

Portage C64 du Tennis Game Boy (Nintendo, 1989). Même principe que la version Spectrum ([../asm](../asm)) : **la logique du jeu est la ROM Game Boy traduite automatiquement**, ici en 6502. On écrit à la main tout ce qui touche au matériel : affichage, sons, entrées.

## État

| Étape | État |
|---|---|
| 1. Traducteur SM83 → 6502 et code de liaison | **Fait, vérifié** : 2755 pas de logique comparés au vrai jeu GB, 0 différence (version `GB_EXACT`) |
| 2. Optimisation | **Fait** : calculs de la ROM réécrits en 6502 (vérifiés), projection native (vérifiée), indicateurs inutiles retirés |
| 3. Affichage : stade entier à l'échelle 1 (tuiles GB → caractères), sprites matériels, score | **Fait** |
| 4. Sons SID, joystick port 2 + clavier, lob automatique, réglage des coups (-10 %), menu, écran titre | **Fait** |

Vitesse mesurée dans VICE (exact au cycle) : ~88 % des trames à l'heure (~44 images/s), la logique gardant le rythme exact du GB.

## Jouer

```
x64sc -autostart build/tennis.prg
```

Menu : `1`-`4` niveau, `S` nombre de sets (3 ou 1), feu / RETURN / ESPACE pour jouer.
En jeu : joystick port 2, ou `Q` `A` `O` `P` + `ESPACE`. Un seul bouton : le lob part tout seul quand le CPU est au filet.

## Structure

| Chemin | Contenu |
|---|---|
| `build.sh` | Traduction et assemblage. Produit `build/tennis.prg` (+ étiquettes `tennis.lbl`, listing `tennis.lst`). |
| `port_config.py` | Paramètres de la traduction (racines, stubs, pointeurs...), les mêmes que pour la version Spectrum. |
| `tools/gb2m6502.py` | Traducteur SM83 → 6502 (64tass). |
| `tools/diff_gb6502.py` | Comparaison pas à pas : PyBoy (vrai jeu GB) contre py65 (logique 6502), avec le coût en cycles. |
| `tools/gbrom.py`, `gb_closure.py`, `gb_trace.py`, `mgbdis/` | Outils communs, repris de [gb2zx-kit](../gb2zx-kit). |
| `src/main.asm` | Démarrage, carte mémoire, interruption raster, boucle de jeu (rythme GB), joystick, lob automatique. |
| `src/render.asm` | Sprites (joueurs, balle, ombre, marque) et projection court → écran en 6502 natif. |
| `src/text.asm` | Police (recopiée de la ROM du C64), score, annonces. |
| `src/sound.asm` | Bruitages au SID. |
| `src/menu.asm` | Écran titre, menu, clavier. |
| `src/autoplay.asm` | Robot joueur 1 pour les tests (`sh build.sh -D AUTOPLAY=1`), avec compteur de trames en retard. |
| `tools/gen_c64gfx.py`, `gen_c64sprites.py`, `gen_c64title.py` | Décor, sprites et écran titre tirés de la ROM GB. |
| `tools/test_math.py`, `tools/test_proj.py` | Vérification des routines de calcul et de la projection réécrites, contre la ROM traduite. |
| `src/zp.asm` | Registres du GB en page zéro. |
| `src/gb_support.asm` | RST de la ROM, registre F, stubs (son, changement d'écran), `gb_tick`. |
| `gb/gb_logic_1.asm`, `gb_logic_2.asm` | **Générés** : la logique traduite, en deux morceaux (zones `$0801-` et `$8000-`). Ne pas modifier à la main. |

## Modèle de traduction

- **Registres** : les registres GB sont en page zéro (`zA`, `zB`...), rangés par paires pour servir de pointeurs. `[hl]` devient `(zL),y`, avec **Y = 0 en permanence**.
- **Indicateurs** : seuls Z et C servent (la logique n'utilise pas DAA). Ils sont gardés dans `zZ` (Z du GB ⇔ `zZ` = 0) et `zCY` (bit 0). Seules les instructions GB qui modifient un indicateur les écrivent, ce qui évite les pièges du 6502, où `LDA` modifie Z. La retenue des soustractions est inversée sur 6502 : elle est remise dans le sens du GB par `INC zCY`.
- **Pile** : la pile du GB est celle du 6502. `CALL` devient `JSR`, `RET` devient `RTS`. Comme `JSR` empile « adresse de retour − 1 », les adresses de retour empilées par la ROM sont traduites en « étiquette − 1 », et les routines RST ajoutent 1 à l'adresse dépilée.
- **Mémoire** : la RAM GB garde ses adresses (`$C000-$C0FF`, `$DD00`, `$FF80-$FFCB`). Sur C64, la logique tourne avec toute la RAM visible (`$01 = $34`), puisque `$D000-$DFFF` recouvre les entrées/sorties. Les vecteurs du 6502 (`$FFFA-$FFFF`) restent libres, car la HRAM s'arrête à `$FFCB`.

## Coût mesuré (avant optimisation)

Le coût d'un pas de logique varie : 8 700 cycles en moyenne, 7 000 en médiane, 19 600 au maximum. Un C64 PAL dispose d'environ 19 650 cycles par trame, et le rythme du GB demande 1,2 pas par trame. La moyenne tient donc, mais les pas les plus lourds débordent. Deux routines de calcul de la ROM prennent ~35 % du temps : la multiplication `$30D0` et la division `$31D5`. Elles ont été réécrites à la main en 6502 (stubs), puis revérifiées par la comparaison : aujourd'hui ~6 100 cycles en moyenne, 12 300 au maximum.

## Outils

| Outil | Rôle | Installation / emplacement |
|---|---|---|
| **64tass 1.60** | Assembleur | `%LOCALAPPDATA%\64tass\64tass-1.60.3243\64tass.exe` |
| **VICE 3.10** | Émulateur C64 (`x64sc`) | `%LOCALAPPDATA%\VICE\GTK3VICE-3.10-win64\bin\x64sc.exe` |
| **py65** | Simulateur 6502 en Python | `pip install py65` |
| **PyBoy** | Émulateur GB piloté en Python | `pip install pyboy` |

Commandes :

```sh
sh C64/build.sh
python -X utf8 C64/tools/diff_gb6502.py 3000
```
