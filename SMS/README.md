# Master Tennis : version Sega Master System (cartouche)

Portage du Tennis Game Boy (Nintendo, 1989) pour la **Sega Master System**. Comme les versions Spectrum, CPC et ColecoVision, la logique du jeu est **la ROM GB traduite en Z80** (`tools/gb2z80.py`). L'affichage, le son et la manette sont écrits à la main. La version ColecoVision a servi de base : même processeur, même puce son, même règle d'accès au VDP.

Ce que la Master System apporte :
- **le stade en couleurs**, en mode 4 (16 couleurs par tuile, 2 palettes de 16) ;
- **des joueurs en couleurs**, avec des sprites 8×16 en 16 couleurs, 8 par ligne ;
- **deux boutons** : bouton 1 pour frapper, bouton 2 pour le lob ;
- le **bouton Pause** de la console ;
- la **même vitesse de jeu à 50 Hz** (consoles européennes) et à 60 Hz.

## Jouer

Cartouche : `build/tennis.sms` (64 Ko, mapper Sega). Elle marche dans tout émulateur Master System : Emulicious, MEKA, ou RetroArch avec le cœur Genesis Plus GX. Elle marche aussi sur une vraie console avec une cartouche flash. L'en-tête `TMR SEGA` a sa somme de contrôle : le BIOS des consoles européennes et américaines lance le jeu.

Emulicious sait signaler les accès VRAM trop rapides (options de son débogueur) : c'est utile pour vérifier la règle du VDP décrite plus bas.

**Menu, à la manette :**
- haut/bas : choisir la ligne ;
- gauche/droite : changer la valeur (niveau 1-4, 1 ou 3 sets) ;
- bouton 1 ou 2 : jouer.

**En match :**
- bouton 1 : frapper (et servir) ;
- bouton 2 : lob ;
- **Pause** (sur la console) : pause, « PAUSE » s'affiche sur le mur du fond.

## Les couleurs

`tools/gen_smsgfx.py` part du stade GB (4 teintes) et donne à chaque pixel une couleur **selon sa zone**. Les zones sont trouvées d'après la forme du stade :

| Zone | Comment elle est trouvée | Couleurs |
|---|---|---|
| Public | au-delà du dernier pixel noir de chaque ligne, à gauche et à droite | fond bleu nuit. Chaque spectateur (groupe de pixels reliés) reçoit ses couleurs : cheveux, peau, col blanc, vêtements (deux tons) |
| Murs | liseré clair juste après le public, puis la bande jusqu'au sol | vert sombre, liseré vert clair |
| Sol | remplissage depuis les bords du sol, arrêté par les lignes | autour du court : vert ; court (zone fermée par les lignes) : bleu ; lignes : blanc |
| Filet | rectangle | bande blanche, mailles grises, poteaux noirs, sol visible entre les mailles |
| Mario (arbitre) | rectangle, rangées casquette / visage / corps | casquette rouge à écusson blanc, visage, yeux blancs, manches rouges, salopette bleue, chaussures brunes |
| Chaise | rectangles : échelle, montant, siège, dossier | bois orange et brun (le sol se voit entre les barreaux) |

Le hasard des spectateurs est tiré avec une graine fixe : le public est toujours le même.

Les tuiles qui ne diffèrent que par un retournement sont partagées (le VDP sait les retourner). Chaque tuile prend la palette du décor si elle lui suffit, sinon celle des sprites : c'est le cas du public, qui y trouve déjà la peau, les rouges, les bleus, le blanc et le jaune.

**Joueurs** (`tools/gen_smssprites.py`) : la couleur dépend de la tuile GB d'où vient le pixel.
- Les tuiles en damier sont la raquette : toujours noire.
- Rangée du haut = tête, rangée du bas = jambes, entre les deux = corps.
- Teinte 1 = peau, teinte 3 = contour noir, teinte 2 = couleur du joueur.
- Yeux : les pixels transparents enfermés dans les 12 premières lignes (la tête) deviennent blancs. Les trous en damier du cordage restent transparents.



| Joueur | Maillot (et bandeau) | Short |
|---|---|---|
| J1 (vous) | rouge | blanc |
| J2 (CPU) | bleu ciel | bleu marine |

Balle jaune, ombre noire, marque de rebond grise.

**Titre** (`tools/gen_smstitle.py`) : « MASTER » en grandes lettres (police GB ×3, dégradé blanc, jaune, orange, rouge, brun), au-dessus de la bande TENNIS du Game Boy, sur fond bleu.

Aperçus : `build/court_preview.png`, `build/sprites_preview.png`, `build/title_preview.png`.

## Mémoire vidéo : la règle du VDP

Comme sur ColecoVision : pendant l'affichage, deux accès à la VRAM trop rapprochés sont perdus. La VRAM n'est donc modifiée qu'à deux moments :
1. **écran éteint et interruptions coupées** (`screen_off` … `screen_on`) : dessin du titre, du menu et du stade ;
2. **dans l'interruption de trame** (IM 1, `$0038`), pendant le retour de trame, dans cet ordre :
   - les motifs des sprites qui changent ;
   - la table des sprites ;
   - les textes (score, annonces, valeurs du menu).

La boucle principale prépare tout cela en RAM, puis met `frame_ready` à 1. L'interruption l'envoie. Sur Master System, l'interruption de trame est masquable : il suffit que la boucle principale ne touche au VDP qu'**interruptions coupées**. Ainsi, l'interruption ne coupe jamais une écriture d'adresse (deux octets sur le port de contrôle).

**Budget** : recopier l'image d'un joueur coûte 64 octets par sprite 8×16, soit 384 octets au plus. `prepare_all` permet 512 octets par trame. Au-delà, l'objet garde son image précédente une trame de plus. L'interruption dure ainsi au plus ~11 200 cycles, pour un retour de trame de 15 960 à 60 Hz.

`tools/smssim.py` simule la console et vérifie **chaque accès** :
- écart entre accès pendant l'affichage ;
- interruption qui toucherait au VDP au milieu d'une adresse ;
- interruption qui écrit encore en VRAM une fois l'affichage commencé ;
- écriture dans la cartouche.

Mesures, robot aux commandes (`-DAUTOPLAY`) :
- 60 Hz : 5 000 trames sans erreur, aucune trame en retard ;
- 50 Hz : 3 000 trames sans erreur.

La cartouche a aussi été lancée dans Genesis Plus GX (cœur libretro) :
- images identiques à celles du simulateur ;
- boutons vérifiés dans la RAM (bouton 1 → A du GB, bouton 2 → B) ;
- 50 Hz détecté.

## Choix techniques

- **RAM** (8 Ko en `$C000-$DFFF`) : elle est à la même place que la RAM de travail du GB. Aucun déplacement, sauf la HRAM :

  | Adresse | Contenu |
  |---|---|
  | `$C000-$C0FF` | RAM GB `$C000` (inchangée) |
  | `$C100-…` | variables (`vars.asm`) |
  | `$DD00` | son GB `$DD00` (inchangé) |
  | `$DE00-$DE7F` | HRAM GB `$FF80` (déplacée : en `$FFxx`, la Master System n'a qu'un miroir de sa RAM, et `$FFFC-$FFFF` sont les registres de pages) |
  | `…-$DFEF` | pile |

  `tools/diff_sms.py` compare pas à pas avec le jeu GB (PyBoy) : 2 755 pas identiques. Les 7 écarts relevés sont le réglage voulu des coups du joueur 1, comme sur les autres versions.

- **Cartouche** (64 Ko, mapper Sega) :

  | Page | Contenu |
  |---|---|
  | 0-1 (`$0000-$7FFF`, fixes) | code, logique traduite, cartes du stade, police, description des sprites, en-tête `TMR SEGA` en `$7FF0`. Environ 15,5 Ko utilisés |
  | 2 (`$8000`) | motifs des sprites (12,9 Ko), lus par l'interruption |
  | 3 (`$8000`, le temps d'une copie écran éteint) | tuiles du stade (126) et du titre (101) |

- **Écran** : mode 4, 256×192. Le stade GB fait 256 pixels de large et remplit l'écran : rangées GB 2 à 25, comme sur ColecoVision.
  - Le score est dans le public, en haut à droite.
  - Les annonces sont sur le mur du fond.

  VRAM :

  | Adresse | Contenu |
  |---|---|
  | `$0000` | tuiles du décor (0-255) |
  | `$2000` | motifs des sprites (tuiles 256-285) |
  | `$3000` | police (tuiles 384-447), dépliée en 4 plans au chargement |
  | `$3800` | carte 32×24 (2 octets par case) |
  | `$3F00` | table des sprites |

  Registres : `04 82 FF FF FF FF FF F1 00 00 FF` (`R1 = $82` écran éteint, `$E2` allumé + interruption de trame).
- **Sprites** : 8×16, 16 couleurs, 8 par ligne.
  - Un joueur = 6 sprites au plus (une colonne de 8 pixels à la fois, sans les sprites vides). Une seule couche suffit, là où la ColecoVision en demandait deux.
  - Balle et ombre passent en premier. L'ordre des joueurs s'inverse à chaque trame : un dépassement de 8 sprites sur une ligne clignote au lieu d'effacer toujours le même morceau.
- **Son** : SN76489 (port `$7F`), à la même horloge que sur ColecoVision. Ce sont les bruitages de la version Coleco.
- **Cadence** : un pas de logique par trame à 60 Hz (59,7 Hz sur GB). Au démarrage, la durée d'une trame est mesurée : une boucle de 35 cycles tourne ~1 700 fois à 60 Hz et ~2 030 fois à 50 Hz. À 50 Hz, un pas de plus est fait toutes les 5 trames : le jeu garde sa vitesse.
- **Pause** : le bouton Pause déclenche la NMI (`$0066`), qui bascule un drapeau. La boucle de match arrête alors la logique et le son.

## Construire

Outils : **sjasmplus 1.24** (avec Lua), Python 3 avec Pillow. Pour `diff_sms.py` : PyBoy et SkoolKit.

```sh
sh build.sh                  # -> build/tennis.sms
sh build.sh -DAUTOPLAY       # le robot joue, trames en retard affichées sur le mur
python tools/smssim.py 400 --keys "100:1 106:" --shot 100,399   # captures build/sim_NNNN.png
python tools/smssim.py 3000 --pal
python tools/diff_sms.py 3000
```

Variables de `build.sh` : `SJASM` (assembleur), `TENNIS_WORK` (dossier d'assemblage hors Google Drive), `PYTHON`.

Toujours reconstruire la version normale après un essai `-DAUTOPLAY`.

## Structure

| Chemin | Contenu |
|---|---|
| `build.sh` | Traduction, graphismes, assemblage, cartouche |
| `port_config.py` | Paramètres du traducteur (`RAM_MAP` : HRAM seule) |
| `src/main.asm` | Vecteurs (`$0000`, IRQ `$0038`, Pause `$0066`), démarrage, 50/60 Hz, boucle de match, pages de la cartouche, en-tête |
| `src/vdp.asm` | VDP : écran éteint / retour de trame, palettes, police, textes, recopie des motifs |
| `src/render.asm`, `src/proj.asm` | Stade, sprites (budget de recopie, ordre alterné), projection native |
| `src/input.asm`, `text.asm`, `menu.asm`, `sound.asm`, `gb_support.asm` | Manette, score, menu, son, liens avec la logique |
| `src/vars.asm`, `src/defs.asm` | RAM, adresses GB, VDP, ports |
| `tools/sms.py` | Couleurs, tuiles 4 plans, dédoublonnage avec retournements |
| `tools/gen_smsgfx.py`, `gen_smstitle.py`, `gen_smssprites.py` | Stade en couleurs + police, titre, sprites |
| `tools/make_rom.py` | Assemble les pages, somme de contrôle de l'en-tête |
| `tools/smssim.py` | Master System simulée + contrôle des accès VDP + captures |
| `tools/diff_sms.py` | Comparaison pas à pas avec le jeu GB |
