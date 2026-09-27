# Super CPC Tennis : version CPC Plus / GX4000 (cartouche)

Portage du Tennis Game Boy (Nintendo, 1989) pour les **Amstrad CPC 464+ / 6128+ et la console GX4000**, en cartouche. Il repart de la version CPC664 ([../Amstrad](../Amstrad)) :
- même logique traduite (Z80, identique au Spectrum et au CPC) ;
- même décor et même son ;
- mais **les sprites matériels de l'ASIC** remplacent les sprites logiciels.

## Jouer

Cartouche : `build/tennis.cpr`. Avec Caprice32 (6128+) :

```powershell
cd "$env:LOCALAPPDATA\Caprice32\cap32-win64"
.\cap32.exe -O system.model=3 "G:\Mon Drive\Coding\Tennis\GX4000\build\tennis.cpr"
```

**Menu, à la manette** (la GX4000 n'a pas de clavier) :
- haut/bas : choisir la ligne (niveau, sets, boutons) ;
- gauche/droite : changer la valeur ;
- tir : jouer.

Sur 6128+, les touches `1`-`4`, `S`, `B`, `ESPACE` et `RETURN` marchent aussi. **2 boutons par défaut** (tir 1 : frapper, tir 2 : lob), comme sur la manette GX4000. Le mode 1 bouton, avec lob automatique, reste disponible.

## Ce que l'ASIC apporte

- **Sprites matériels** : 16×16 pixels, 15 couleurs, affichés sans calcul du processeur. Plus de XOR, plus de clignotement, et **aucune trame en retard** (mesuré avec le robot).
- **Joueurs en couleurs** (rouge contre bleu), balle jaune, ombre et marque vertes. Un joueur (32×32 au plus) = 4 sprites ; balle, ombre, marque = 1 chacune.
- **Mario en couleurs** : 4 sprites posés exactement sur son dessin du décor (casquette et maillot rouges, peau, bleu nuit). La chaise garde ses couleurs. Total : 15 sprites sur 16.
- **Palette 12 bits** (4096 couleurs) : des verts plus doux pour le court.
- **Écran titre « SUPER CPC TENNIS »** : « SUPER » et « CPC » en grandes lettres (police GB), au-dessus de la bande TENNIS du Game Boy, en mode 0.

Un essai de public en couleurs (couleur changée toutes les 8 lignes par interruption raster) a été fait puis retiré à la demande de l'utilisateur. La technique est décrite dans le kit ([../gb2cpc664-kit/PORTING.md](../gb2cpc664-kit/PORTING.md) §10).

## Cartouche

| Page | Contenu |
|---|---|
| 0 | Démarrage (`src/boot.asm`) : déverrouille l'ASIC, recopie les pages 1 et 2 en RAM, saute en RAM |
| 1 | RAM `$0000-$3FFF` (programme, partie A) |
| 2 | RAM `$8000-$BFFF` (partie B : menu, titre, décor, police, tables) |
| 3-5 | Images des sprites (256 octets chacune), recopiées dans l'ASIC quand l'image d'un objet change (Mario : une fois) |

## Points techniques (appris ici)

- **Démarrage à nu** : il n'y a pas de ROM système. Il faut initialiser les **14 registres du CRTC**, faute de quoi l'écran ne montre que la bordure, ainsi que le **PPI** (`&F782`). La **police** est celle du Game Boy (`tools/gen_font.py`).
- **ASIC** :
  - déverrouillage par 17 octets envoyés au CRTC ;
  - RMR2 = `&B8` : registres visibles en `&4000-&7FFF` (le temps d'une mise à jour, puisque l'écran est à la même adresse) ; `&A0` : les masquer.
  - Registres : pixels des sprites en `&4000 + 256n` (1 octet par pixel) ; X, Y (16 bits) et agrandissement en `&6000 + 8n` ; palette en `&6400`, 2 octets par encre (`%RRRRBBBB`, `%0000GGGG`) ; bordure = encre 16, encres des sprites = 17-31.
  - **Agrandissement %1001** (X ×2, Y ×1) : X est en pixels du mode 2, donc un pixel de sprite = un pixel du mode 1, et les images GB restent à l'échelle 1.
- **Pages de cartouche** : `&DF80 + n` place la page n en ROM haute (`&C000`). Les images des sprites y sont lues à la volée.
- Tout est mis à jour **juste après le VSYNC** : d'abord les images qui ont changé, puis les places.

## Structure

| Chemin | Contenu |
|---|---|
| `build.sh` | Traduction, graphismes, sprites, assemblage (programme puis page de démarrage), cartouche |
| `src/boot.asm` | Page 0 de la cartouche |
| `src/main.asm` | Démarrage (CRTC, PPI, ASIC, IM 1), VSYNC, boucle de jeu, palette |
| `src/hwsprite.asm` | Sprites matériels : objets → sprites ASIC, recopie des images, places |
| `src/render.asm`, `src/proj.asm` | Places des objets (projection native, vérifiée sur la version CPC) |
| `src/menu.asm` | Titre en mode 0 (16 couleurs), menu à la manette |
| `src/input.asm`, `text.asm`, `sound.asm`, `gb_support.asm` | Repris de la version CPC |
| `tools/gen_plus_sprites.py` | Sprites ASIC (couleurs par objet) → pages de cartouche + table |
| `tools/gen_font.py` | Police tirée des tuiles GB |
| `tools/make_cpr.py` | Cartouche `.cpr` (RIFF « AMS! », pages `cbNN` de 16 Ko) |

Mise au point :
- `sh build.sh -DDEBUG` : repères de couleur dans la bordure à chaque étape du démarrage ;
- `-DAUTOPLAY` : le robot joue, avec un compteur de trames en retard (en bas à gauche).

Toujours reconstruire la version normale ensuite.
