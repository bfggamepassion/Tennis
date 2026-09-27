# MO5 Tennis : version Thomson MO5 (cassette)

Portage du Tennis Game Boy (Nintendo, 1989) pour le **Thomson MO5**. La logique du jeu est **la ROM GB traduite en 6809** par `tools/gb2m6809.py`, un traducteur écrit pour cette version. Elle est vérifiée pas à pas contre le vrai jeu. L'affichage, le son et le clavier sont écrits à la main.

## Jouer

Cassette : `build/tennis.k7`. Dans DCMOTO (`%LOCALAPPDATA%\dcmoto\dcmoto-64\dcmoto.exe`) :
1. choisir la machine MO5 ;
2. « Supports amovibles », « Charger une cassette » : `build/tennis.k7` ;
3. au BASIC, taper `LOADM"",,R` puis ENTRÉE (le programme se charge en `$3000` et démarre seul).

**Menu :**
- `1`-`4` : niveau ;
- `S` : 1 ou 3 sets ;
- `B` : 1 ou 2 boutons ;
- ESPACE : jouer.

**En match :**
- flèches : se déplacer ;
- ESPACE : frapper ;
- `M` : lob (mode 2 boutons, par défaut).

En mode 1 bouton, le lob est automatique quand l'adversaire est au filet.

## Comment c'est fait

- **Traduction SM83 → 6809** (`tools/gb2m6809.py`) :
  - le A du GB est le A du 6809 ; B, C, D, E, H, L sont en page directe (`$9F00-$9F05`, paires dans l'ordre du 6809, donc `ldx <rH` charge HL) ;
  - les indicateurs Z et C du 6809 ont le même sens que ceux du GB. Les LD et ST du 6809 modifient Z, et AND, OR, XOR ne remettent pas C à zéro. Une analyse de durée de vie des indicateurs, interprocédurale, n'ajoute les correctifs (`andcc`, `pshs cc`/`puls cc`) que là où l'indicateur est lu ensuite : 86 sauvegardes seulement ;
  - la RAM GB est déplacée : `$C000` en `$9D00`, `$DD00` en `$9E00`, HRAM en `$9F80`.
- **Vérifications :**
  - `tools/diff_mo5.py` : 2 755 pas de jeu comparés au jeu GB (PyBoy). Les 7 écarts relevés sont le réglage voulu des coups du joueur 1, comme sur les autres versions. Un pas coûte en moyenne 4 600 cycles, 9 700 au pire (une trame dure 19 968 cycles) ;
  - `tools/m6809.py` : émulateur 6809 écrit pour ce projet, vérifié contre l'émulateur MC6809 (`tools/test_m6809.py`) ;
  - `tools/mo5sim.py` : MO5 simulé (écran, PIA, clavier) pour les images et les mesures.
- **Écran** : 320×200, 2 couleurs par groupe de 8 pixels.
  - Comme sur CPC, le stade GB entier occupe les colonnes 4-35 et le score les marges.
  - Les teintes GB deviennent vert clair, vert, gris et noir.
- **Sprites** : il n'y en a pas de matériels sur MO5, donc l'écran est recomposé par cases de 8×8.
  - Seules les cases touchées par un objet qui bouge sont redessinées.
  - Chaque case est écrite d'un seul coup : tuile du stade, masque et encre des objets, puis 8 octets de forme et 8 de couleur. Il n'y a jamais d'état effacé à l'écran, donc pas de clignotement.
  - Les joueurs sont dessinés en couleur (J1 rouge, J2 bleu) sur le fond de la case, la balle en blanc.
- **Cadence** : l'indicateur de 50 Hz du PIA système est lu sans interruption. La logique garde le rythme du GB : 6 pas pour 5 trames. Au simulateur, avec le robot, on mesure 45 images par seconde en moyenne.
- **Son** : le buzzer (1 bit), avec des bruitages courts de 2 à 4 ms.

## Construire

```sh
sh build.sh            # traduction, graphismes, assemblage, cassette
sh build.sh AUTOPLAY   # le robot joue (test)
```

Toujours reconstruire la version normale ensuite.

Outils : asm6809 (`%LOCALAPPDATA%\asm6809`), Python (Pillow, PyBoy pour les comparaisons).

| Chemin | Contenu |
|---|---|
| `src/main.asm` | Démarrage, trames, boucle de match |
| `src/render.asm`, `proj.asm` | Stade, objets, recomposition par cases, projection |
| `src/gb_support.asm` | RST du GB, liens avec la logique, pas de jeu |
| `src/text.asm`, `menu.asm`, `input.asm`, `sound.asm` | Score, menu, clavier, buzzer |
| `tools/gen_mo5gfx.py` | Tuiles du stade, police, sprites (masque, encre), tables |
| `tools/make_k7.py` | Cassette `.k7` (blocs MO5) |
