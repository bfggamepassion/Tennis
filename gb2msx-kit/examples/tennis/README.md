# MSX Tennis : version MSX1 (cartouche)

Portage du Tennis Game Boy (Nintendo, 1989) pour **MSX1**, en cartouche de 32 Ko. Il repart de la version ColecoVision ([../Coleco](../Coleco)), qui a le même VDP (TMS9918A) et le même Z80. La logique du jeu est **la ROM GB traduite en Z80** (`tools/gb2z80.py`).

## Jouer

Cartouche : `build/tennis.rom`. openMSX fournit un BIOS libre (C-BIOS), il n'y a rien à installer :

```powershell
& "$env:LOCALAPPDATA\openMSX\openmsx.exe" -machine C-BIOS_MSX1_EU -cart "G:\Mon Drive\Coding\Tennis\MSX\build\tennis.rom"
```

`C-BIOS_MSX1_EU` est une machine européenne (50 Hz) ; `C-BIOS_MSX1` est à 60 Hz. Le jeu garde la même vitesse sur les deux.

**Commandes** (clavier ou joystick du port 1) :
- flèches / joystick : se déplacer ;
- ESPACE / bouton A : frapper ;
- M / bouton B : lob (mode 2 boutons, par défaut).

Menu :
- flèches : choisir une ligne et changer sa valeur (niveau 1-4, 1 ou 3 sets, 1 ou 2 boutons) ;
- `1`-`4` : niveau ;
- ESPACE : jouer.

## Différences avec la version ColecoVision

| | ColecoVision | MSX1 |
|---|---|---|
| Cartouche | `$8000-$FFFF` | `$4000-$BFFF` (la page `$8000` est ouverte au démarrage par `ENASLT`, dans le slot de la cartouche) |
| RAM GB | déplacée en `$7000` (1 Ko en tout) | `$C000` sur place ; HRAM `$FF80` -> `$C180`, `$DD00` -> `$C200` (`RAM_MAP`) |
| VDP | ports `$BE`/`$BF`, interruption = NMI | ports `$98`/`$99`, interruption normale, en IM 2 (table en `$C400`, saut en `$C5C5`) |
| Accès VDP du programme | drapeau `vdp_free` | interruptions coupées (`di`) |
| Son | SN76489 | AY-3-8910 (bruitages de la version CPC, périodes x 1,79) |
| Commandes | manette + pavé | clavier + joystick (registres 14-15 du PSG, matrice du clavier par le PPI) |
| Cadence | 60 Hz | 60 ou 50 Hz (octet `$002B` du BIOS) ; à 50 Hz, 6 pas de logique pour 5 trames |

Le registre 7 du PSG garde ses bits 7-6 à `10` : port B en sortie, port A en entrée, pour les joysticks.

La règle du VDP est la même que sur ColecoVision. La mémoire vidéo n'est modifiée que dans deux cas :
- écran éteint, pour dessiner ;
- dans l'interruption de trame, à partir de ce que la boucle a préparé.

## Vérifications

- `tools/diff_msx.py` compare pas à pas avec le jeu GB (PyBoy) : 2 755 pas identiques. Les 7 écarts relevés sont le réglage voulu des coups du joueur 1.
- `tools/msxsim.py` (MSX simulé, faux BIOS) contrôle chaque accès au VDP et le registre 7 du PSG. Sur 4 000 trames jouées par le robot, il n'a relevé aucune erreur ni aucune trame en retard, à 60 comme à 50 Hz. L'interruption la plus longue prend 11 700 cycles, pour un retour de trame d'au moins 15 960.
- openMSX (C-BIOS 50 et 60 Hz), avec l'alerte d'accès VRAM trop rapide activée : aucune alerte.

Mise au point : `sh build.sh -DAUTOPLAY` (le robot joue ; compteur de trames en retard sur le mur). Toujours reconstruire la version normale ensuite.
