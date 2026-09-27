# CPC Tennis : portage Amstrad CPC664 en assembleur

Portage Amstrad CPC664 du Tennis Game Boy (Nintendo, 1989). Même principe que les versions Spectrum ([../asm](../asm)) et C64 ([../C64](../C64)) : **la logique du jeu est la ROM Game Boy traduite automatiquement**. Le CPC a un Z80 comme le Spectrum : la logique traduite est **la même** que celle du Spectrum (`gb/gb_logic.asm` identique), déjà vérifiée pas à pas contre le vrai jeu. On écrit à la main tout ce qui touche au matériel : affichage, sons, entrées.

## Jouer

Disquette : `build/tennis.dsk`. Sur CPC664 (ou 6128) : `RUN"TENNIS"`.

```powershell
cd "$env:LOCALAPPDATA\Caprice32\cap32-win64"
.\cap32.exe -O system.model=1 -a "run`"tennis`n" "G:\Mon Drive\Coding\Tennis\Amstrad\build\tennis.dsk"
```

**Menu :**
- `1`-`4` : niveau ;
- `S` : nombre de sets (3 ou 1) ;
- `B` : boutons (1 ou 2) ;
- tir, `ESPACE` ou `RETURN` : jouer.

**En jeu :** joystick, ou `Q` `A` `O` `P` + `ESPACE`.
- **1 bouton** : les deux tirs frappent. Le lob part tout seul quand le CPU est au filet, comme sur Spectrum et C64.
- **2 boutons** : tir 1 (ou `ESPACE`) = coup normal, tir 2 (ou `M`) = lob, comme les boutons A et B du Game Boy.

## Affichage

**Titre et menu en mode 0** (160×200, 16 couleurs). L'écran titre du Game Boy fait 160 pixels de large : la bande TENNIS occupe exactement la largeur de l'écran. Les tuiles restent au format mode 1 (4 teintes). Au dessin, une table construite en `$CD00` les convertit en mode 0, avec une palette de 4 encres par rangée : « CPC » en rouge, vert et bleu vifs, logo TENNIS blanc sur la bande verte. Les textes font 20 caractères par ligne, en couleurs. Au lancement du match, le jeu repasse en mode 1.

**Mode 1** (320×200, 4 encres) : les 4 teintes du Game Boy deviennent les 4 encres du CPC, **sans aucune perte**. L'écran est déplacé en `$4000`, pour laisser libre la RAM GB (`$C000`, `$DD00`, `$FF80`). Le stade GB entier est affiché à l'échelle 1 : 109 tuiles, colonnes 4-35. Le score occupe les colonnes latérales, et les annonces le mur du fond.

**Sprites logiciels :**
- Les 4 décalages au pixel près de chaque image sont **fabriqués au démarrage**, dans la RAM libérée par le firmware. Le fichier ne contient que les images de base, placées là où sera l'écran.
- Chaque ligne est **rognée** : seuls les octets utiles sont traités.
- Tous les sprites sont dessinés **en XOR**. Redessiner au même endroit efface : pas de sauvegarde du décor, et l'ordre ne compte pas. Les couleurs se mêlent là où un sprite passe sur une ligne ou un autre sprite.
- **Contre le clignotement :**
  - le dessin démarre **au début du signal VSYNC**, lu directement sur le PPI, soit ~72 lignes avant que le faisceau n'atteigne l'image ;
  - chaque sprite qui a changé est effacé puis aussitôt redessiné, **dans l'ordre du balayage** (`src/update.asm`) ;
  - les interruptions (300 Hz) ne servent qu'à compter le temps écoulé : une image toutes les 6 interruptions.

**Vitesse** mesurée dans Caprice32 avec le robot : ~89 % des trames à l'heure (~45 images/s). La logique garde le rythme exact du GB : 6 pas pour 5 trames.

## Carte mémoire

| Adresses | Contenu |
|---|---|
| `$0000-$01FF` | Vecteurs (IM 1 : `$0038`), pile |
| `$0200-$3FFF` | Partie A : démarrage, boucle, texte, son, menu, sprites, logique traduite, écran titre |
| `$4000-$7FFF` | Écran. Dans le fichier : bloc de données déplacé en `$C100` (tuiles, carte, lignes), images de base et tables de décalage lues au démarrage |
| `$8000-$A3FF` | Partie B : police, projection, images décalées (une partie), table des masques |
| `$A600-$BFFF`, `$D000-$DCFF`, `$DE00-$FF7F` | Images décalées, fabriquées au démarrage |
| `$C000-$C0FF`, `$DD00`, `$FF80-$FFFE` | RAM Game Boy |

## Structure

| Chemin | Contenu |
|---|---|
| `build.sh` | Traduction, génération des graphismes, assemblage (sjasmplus), disquette `build/tennis.dsk` |
| `port_config.py` | Paramètres de la traduction (les mêmes que pour le Spectrum) |
| `src/main.asm` | Démarrage (firmware coupé, écran en `$4000`), interruption, boucle de jeu |
| `src/defs.asm` | Carte mémoire, variables GB |
| `src/gb_support.asm` | Code de liaison, repris de la version Spectrum |
| `src/sprite.asm`, `src/render.asm`, `src/proj.asm` | Moteur de sprites, affichage des objets, projection native |
| `src/input.asm` | Clavier et joystick (matrice par le PSG), 1 ou 2 boutons |
| `src/text.asm`, `src/sound.asm`, `src/menu.asm` | Texte et score, bruitages AY, titre et menu |
| `src/autoplay.asm` | Robot de test (`sh build.sh -DAUTOPLAY`), compteur de trames en retard |
| `tools/gen_cpcgfx.py`, `gen_cpcsprites.py`, `gen_cpctitle.py` | Décor, sprites, écran titre tirés de la ROM GB |
| `tools/make_dsk.py` | Image disquette (format DATA, en-tête AMSDOS) |
| `tools/cpcshot.sh` | Capture d'écran automatique dans Caprice32 |
| `tools/prof_cpc.py`, `tools/sim64.py` | Profilage en cycles Z80 (simulateur SkoolKit avec 64 Ko de RAM) |
| `tools/test_proj.py` | Vérification de la projection native contre la ROM traduite (0 différence sur 2 000 cas) |

## Outils

| Outil | Emplacement |
|---|---|
| sjasmplus 1.24 | `%LOCALAPPDATA%\sjasmplus\sjasmplus-1.24.0.win\sjasmplus.exe` |
| Caprice32 | `%LOCALAPPDATA%\Caprice32\cap32-win64\cap32.exe`. Lancer depuis son dossier (ROM) ; `-O system.model=1` = 664 |
