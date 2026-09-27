# Coleco Tennis : version ColecoVision (cartouche)

Portage du Tennis Game Boy (Nintendo, 1989) pour la **ColecoVision**. Comme les versions Spectrum et CPC, la logique du jeu est **la ROM GB traduite en Z80** (`tools/gb2z80.py`). Seule différence : la RAM GB est déplacée dans le 1 Ko de la console. L'affichage, le son et la manette sont écrits à la main.

## Jouer

Cartouche : `build/tennis.rom` (32 Ko). Avec openMSX (le BIOS `COLECO.ROM` doit être dans `Documents\openMSX\share\systemroms`) :

```powershell
& "$env:LOCALAPPDATA\openMSX\openmsx.exe" -machine ColecoVision -carta "G:\Mon Drive\Coding\Tennis\Coleco\build\tennis.rom"
```

**Menu, à la manette :**
- haut/bas : choisir la ligne ;
- gauche/droite : changer la valeur (niveau 1-4, 1 ou 3 sets, 1 ou 2 boutons) ;
- pavé `1`-`4` : niveau ;
- un bouton : jouer.

**En match :**
- mode 2 boutons (par défaut) : bouton gauche = frapper, bouton droit = lob ;
- mode 1 bouton : les deux boutons frappent, avec un lob automatique quand l'adversaire est au filet.

## Mémoire vidéo : la règle du VDP

Sur une vraie console, le TMS9918A perd les accès trop rapprochés pendant l'affichage (il faut 8 µs entre deux accès). Ici, la VRAM n'est modifiée qu'à deux moments :
1. **écran éteint et NMI coupée** : dessin du titre, du menu et du stade (`screen_off` … `screen_on`) ;
2. **dans la NMI, pendant le retour de trame** : motifs des sprites qui changent, table des sprites, textes (score, annonces, valeurs du menu).

La boucle principale prépare tout cela en RAM, puis lève `frame_ready`, et la NMI l'envoie. Le drapeau `vdp_free` empêche la NMI de toucher au VDP pendant que le programme écrit un registre (deux octets sur le port de contrôle).

`tools/cvsim.py` simule la console et vérifie **chaque accès** :
- écart entre accès pendant l'affichage ;
- NMI tombant au milieu d'une écriture d'adresse ;
- durée de la NMI.

Mesures : aucune erreur, NMI de 9 600 cycles au plus pour un retour de trame de 15 960, et aucune trame en retard sur 5 000 trames jouées par le robot.

## Choix techniques

- **RAM** (1 Ko) :

  | Adresse | Contenu |
  |---|---|
  | `$7000-$70FF` | RAM GB `$C000` |
  | `$7100-$717F` | variables |
  | `$7180-$71FF` | HRAM GB `$FF80` |
  | `$7200` | son GB `$DD00` |
  | reste | variables, tampons, pile |

  Le traducteur fait le déplacement (`RAM_MAP` dans `port_config.py`). `tools/diff_cv.py` compare pas à pas avec le jeu GB (PyBoy) : 2 755 pas identiques. Les 7 écarts relevés sont le réglage voulu des coups du joueur 1, comme sur les autres versions.
- **Écran** : mode graphique 2 (256×192, 2 couleurs par ligne de 8 pixels).
  - Le stade GB fait 256 pixels de large et remplit l'écran : rangées GB 2 à 25.
  - Les 4 teintes deviennent 4 verts (vert clair, vert, vert foncé, noir).
  - Le score est dans le public, en haut à droite ; les annonces sont sur le mur du fond.
- **Sprites** (16×16, une couleur, 4 par ligne) :
  - un joueur = 2 couches : contour rouge (J1) ou bleu (J2), et parties claires en blanc. Cela fait jusqu'à 8 sprites, et 4 au plus sur une ligne ;
  - balle blanche, ombre noire, marque vert foncé ;
  - les motifs d'un joueur sont recopiés quand son image change ;
  - balle et ombre sont prioritaires. L'ordre des joueurs s'inverse à chaque trame : un dépassement de 4 sprites clignote au lieu d'effacer toujours le même morceau.
- **Son** : SN76489. Ce sont les bruitages de la version CPC, avec les périodes converties.
- **Cadence** : 60 Hz, un pas de logique par trame (59,7 Hz sur GB).

## Structure

| Chemin | Contenu |
|---|---|
| `build.sh` | Traduction, graphismes, assemblage (`-DAUTOPLAY` : le robot joue, compteur de trames en retard) |
| `src/main.asm` | En-tête de cartouche, démarrage, NMI, boucle de jeu |
| `src/vdp.asm` | Accès au VDP (écran éteint / retour de trame), travaux de texte |
| `src/render.asm`, `src/proj.asm` | Stade, sprites (projection native, reprise du CPC) |
| `src/text.asm`, `menu.asm`, `input.asm`, `sound.asm`, `gb_support.asm` | Score, menu, manette, son, liens avec la logique |
| `src/vars.asm`, `src/defs.asm` | RAM, adresses GB déplacées, VDP |
| `tools/gen_cvgfx.py`, `gen_cvtitle.py`, `gen_cvsprites.py` | Stade + police, titre, sprites |
| `tools/cvsim.py` | ColecoVision simulée + contrôle des accès VDP + captures |
| `tools/diff_cv.py` | Comparaison pas à pas avec le jeu GB |

Toujours reconstruire la version normale après un essai `-DAUTOPLAY`.
