# Tennis (Game Boy, 1989) : fiche de fonctionnement

Rétro-ingénierie de `Tennis (World).gb` (MD5 `7d621dcbbce12b73574c42f40deec275`), en vue du portage ZX Spectrum en Boriel Basic.

Toutes les adresses sont celles de la ROM. Les variables sont en RAM (`$Cxxx`) ou en HRAM (`$FFxx`). Ce qui n'a pas été vérifié ligne à ligne est marqué **(à confirmer)** ; le reste a été lu dans le code.

---

## 1. Outils et fichiers produits

| Fichier | Rôle |
|---|---|
| `re/trace.py` | Traceur récursif : sépare code et données, gère les `rst` à données en ligne, génère `tennis.sym` |
| `re/tennis.sym` | Blocs code/données pour mgbdis |
| `re/disassembly/bank_000.asm` | Désassemblage complet (mgbdis `--tiny`) |
| `re/code.asm` | Même chose, code seulement, format compact `adresse  instruction` |
| `re/data_ranges.txt` | Plages de données restantes |
| `re/extract_gfx.py` | Extraction des tuiles et reconstitution des écrans en PNG |
| `re/gfx/*.png` | Planches de tuiles et écrans reconstitués |

Commandes :

```sh
cd re
python trace.py                      # régénère tennis.sym
python ../tools/mgbdis/mgbdis.py tennis.gb --tiny --print-hex --overwrite
python extract_gfx.py                # régénère gfx/
```

---

## 2. Carte de la ROM (32 Ko, sans mapper)

| Plage | Contenu |
|---|---|
| `$0000-$00FF` | Vecteurs RST et interruptions, utilitaires (RNG, probas, soustraction 16 bits) |
| `$0150-$3A58` | **Tout le code du jeu** (≈13,4 Ko) |
| `$3A59-$52D5` | Données : tables d'animation, sprites (listes OAM), musique/sons **(à confirmer)**, 5 petites routines en `$486F`, `$4A90`, `$4CB1`, `$500D`, `$528E` |
| `$52D6-$6AD5` | Tuiles du jeu (6 Ko, 2bpp, non compressées) |
| `$69F6-$6F15` | Jeu de sprites alternatif (mode 2 joueurs, console esclave) |
| `$6F16-...` | Tilemap du court |
| `$71B4-$76B3` | Tuiles du titre et de la sélection de niveau |
| `$76B4`, `$7785` | Tilemaps du titre et de la sélection de niveau |
| `$781D-$7FFF` | Tuiles et tilemap de l'écran tableau d'affichage (scores entre les jeux) |

### Conventions RST (important pour lire le code)

- `rst $08` : saut indexé. Il est suivi d'une table `dw`, et A donne l'index. C'est ce qui sert pour toutes les machines à états.
- `rst $18` : lecture indexée. Il est suivi de `db N` puis de N octets ; il renvoie `A = table[A]` et le code reprend après la table.
- `rst $28` : copie en ligne. Il est suivi de `db N` puis de N octets, copiés vers `[DE]`.

### Utilitaires notables

- **RNG** `$00A9` : `x = 5x + 11 (mod 256)` dans `$FFA4`. Il est appelé en boucle pendant l'attente de VBlank, donc le hasard dépend du temps libre de chaque trame.
- **Probabilité** `$00CA` : l'entrée A est un pourcentage. Le carry est **à 0** avec une probabilité de A % (le test compare le RNG à `2,5×A`). Pour A ≥ 100, il est toujours à 0.
- `$308F` multiplication, `$3143` division HL/A, `$3120` et `$31D5` arithmétique 16 bits **(à confirmer)**.
- `$326B` : décodeur de tilemap. C'est un flux d'octets écrits avec un pas C. L'échappement `$F9` est suivi de `00` = fin, de `02 n v` = n fois la valeur v, ou de `pas, adresse(16 bits)` = nouveau pas et nouvelle destination.

---

## 3. Architecture générale

- **Tout le jeu tourne dans l'interruption VBlank** (`$01F2`). La boucle principale se contente de `halt` suivi d'un appel au RNG, à l'infini.
- Le jeu tourne à **59,7 Hz**, contre **50 Hz** sur le Spectrum. Voir la section 11.
- Deux niveaux de machine à états :
  - `$FF8A` = **écran courant**. Il sert à la mise en place et passe par un reset partiel (`$016D`) qui recharge les tuiles et le tilemap.
  - `$FF8B` = **traitement par trame**, via la table en `$0209`.

### Écrans (`$FF8A`, table `$01DC`)

| Val | Routine | Écran |
|---|---|---|
| 0 | `$026E` | Titre : 1 PLAYER / 2 PLAYER / MUSIC |
| 1 | `$02E3` | Début de match : remise à zéro des scores, puis enchaîne sur 3 |
| 2 | `$02B4` | Sélection du niveau 1 à 4 |
| 3 | `$02F2` | Nouveau jeu : remise à zéro des points |
| 4 | `$033F` | **Court** : place les joueurs, `$FF8B = 1` |
| 5, 6 | `$0432` | Écrans de fin de match / cérémonie **(à confirmer)** |
| 8 | `$02F5` | Changement de côté (tie-break) |
| 9, 10 | `$03A3` | **Tableau d'affichage** des scores par set, entre les jeux |

### Traitement par trame (`$FF8B`, table `$0209`)

| Val | Routine | Rôle |
|---|---|---|
| 0 | `$04A3` | Menu titre, démo, lien série |
| 1 | `$05EC` | **Match** : entrées, logique (`$0680`), affichage |
| 2 | `$05D2` | Sélection de niveau (haut/bas/select, puis Start) |
| 3, 4 | `$0637` | Écrans de fin |
| 6 | `$0647` | Tableau d'affichage (temporisation `$FF9F`, puis retour au court) |

### Logique d'une trame de match (`$0680`)

Dans l'ordre :

1. `$0A41` : aide au placement **(à confirmer)**
2. `$1F8E` : **déroulement du point** (service, point gagné, jeu)
3. `$0B7D` : **joueur 1** (`$C000`)
4. `$10ED` : **joueur 2** (`$C020`)
5. `$17A0` : **balle** (`$C040`)
6. `$230C` : **IA du joueur 1**, en mode démo seulement
7. `$2720` : **IA du joueur 2**, en mode 1 joueur

### Démo

Si rien n'est pressé sur le titre, le jeu lance un match démo : `$FFAF` bit 7 à 1, et le niveau tourne de 1 à 4. Le joueur 1 est alors piloté par `$230C`, et un appui sur Start ramène au titre (`$227C`).

---

## 4. Entrées : le joypad virtuel

La lecture du joypad (`$2FA0`) renvoie un octet :

| Bit | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|---|
| Touche | A | B | Select | Start | Droite | Gauche | Haut | Bas |

`$2225` annule les directions opposées (haut+bas, gauche+droite).

| Variable | Contenu |
|---|---|
| `$FF9A` / `$FF9B` | Joueur 1 : touches **maintenues** / **nouvellement pressées** |
| `$FF9C` / `$FF9D` | Joueur 2 : idem |

**Point clé pour le portage :** les joueurs ne lisent jamais le joypad directement, seulement ces variables. Selon le mode, `$FF9C/9D` est rempli :

- par l'**IA** (`$2720`) en mode 1 joueur ;
- par le **câble link** (`$223E`) en mode 2 joueurs ;
- en mode démo, l'IA `$230C` remplit aussi `$FF9A/9B`.

Sur Spectrum, il suffit de remplir ces deux paires depuis le clavier ou le joystick, et le mode 2 joueurs sur un seul clavier vient sans effort.

`$FF96` regroupe les options : bit 0 = mode link, bit 1 = console maître/esclave, bit 2 = musique activée, bit 3 = match en 1 set **(à confirmer)**, bit 6 = le joueur 2 sert, bit 7 = drapeau temporaire (« je traite le joueur 2 »).

---

## 5. Le court : coordonnées et projection

Toute la logique travaille dans un **repère « court » vu de dessus**, en virgule fixe 8.8 sur 16 bits. L'écran n'est qu'une projection.

- **Y** (profondeur) : de `$08` (fond, en haut) à `$E7` (fond, en bas). **Filet en `$78`.**
- **X** (latéral) : de `$08` à `$D0`, **centre en `$6C`**.
- **Z** (hauteur de la balle) : un octet, sol = 0.

### Lignes, déduites de la classification de zone `$09FA`

La routine replie la position sur le demi-court du haut et la moitié gauche, puis la classe :

| Élément | Coordonnée |
|---|---|
| Ligne de fond | Y = `$37` (en bas : `$B8`) |
| Ligne de service | Y = `$55` (en bas : `$9A`) |
| Couloirs, simple | X de `$36` à `$A1` |

Le **code de zone** est rangé en `$C00B`, `$C02B` et `$C04B` :

- bit 0 = moitié droite ;
- bit 1 = demi-court du bas ;
- bits 2-3 : `00` = dehors en largeur, `04` = dehors en longueur, `08` = fond de court, `0C` = carré de service.

Le service est bon si la zone au premier rebond vaut exactement le carré attendu : `$0C` ou `$0E`, plus le bit droite/gauche selon la parité du point (`$1811-$1846`).

### Projection à l'écran (`$095D`)

C'est une perspective simple :

- **y écran** ≈ `$1C + Y × 40/47`
- **x écran** = `$6C ± |X − $6C| × f(Y)`, où f diminue vers le fond. Le court est donc un trapèze.
- La hauteur Z est retranchée du y (`$09C2`), et l'ombre est dessinée au sol.

Le tilemap du court fait environ **28 × 28 tuiles** (224 × 224 px), gradins compris. En match, le Game Boy n'en affiche qu'une fenêtre de 160 × 144 : au service, SCX = `$24` et SCY = `$30`, soit le court et l'arbitre, sans les gradins (voir `gfx/court_vue_ecran.png`). Le défilement suit ensuite l'action **(à confirmer)**.

---

## 6. Les joueurs (`$C000` = J1 en bas, `$C020` = J2 en haut)

### Structure (0x20 octets)

| Offset | Contenu |
|---|---|
| +0 | État (index `rst $08`) |
| +1 | Image d'animation |
| +2/+3 | Y (8.8) |
| +4/+5 | X (8.8) |
| +8/+9 | Vitesses X/Y (ajoutées à la partie fractionnaire à chaque trame) |
| +A | Type de coup, qui sert d'index d'animation |
| +B | Zone |
| +10/+11 | Compteurs d'animation |
| +13 | Bouton de frappe (1 = A, 2 = B) |
| +14, +15, +16 | Paramètres du coup en cours |
| +17 | Temporisation (lancer du service, attente) |

### États du joueur 1 (table `$0B90`, J2 symétrique en `$1100`)

| Val | Rôle |
|---|---|
| 0 | Initialisation |
| 1 | **Déplacement libre** (`$0DB8`) ; A ou B déclenche la frappe (`$0DFE`) |
| 2 | **Frappe en cours** : animation, test d'impact (`$0E77`) |
| 3 | Lancer de balle du service (monte et descend la balle) |
| 4 | Mise en place du service (position de départ) |
| 5 | **Attente du service** : déplacement latéral, A/B lance la balle (3 s sans appui = lancer automatique) |
| 6 | Balle lancée, en attente de la frappe |
| 7 | **Service** |

### Vitesses de déplacement, en 1/256 px par trame (`$0AAD`, `$0B11`)

| Niveau | CPU X | CPU Y | Humain X | Humain Y |
|---|---|---|---|---|
| 1 | `$A0` | `$90` | `$C0` | `$A0` |
| 2 | `$B0` | `$A0` | `$C8` | `$A0` |
| 3 | `$D0` | `$C0` | `$D0` | `$B0` |
| 4 | `$FF` | `$FF` | `$F0` | `$C0` |

Limites : X de `$08` à `$D0`. Y de `$85` à `$E7` pour J1, de `$08` à `$6B` pour J2 : on ne franchit pas le filet.

### Frappe (`$0DFE`, `$0E77`, `$165C`)

1. **Choix du coup à l'appui**, selon la position relative de la balle : coup droit ou revers (balle à droite ou à gauche), puis :
   - `+$0C` si la balle est haute (Z ≥ `$40`) : **smash** ;
   - `+$06` si le joueur est au filet (zone ≥ `$0C`) : **volée**.
2. **Test d'impact.** Pendant l'animation, certaines images (`$0A2C`) ouvrent une fenêtre de frappe. Des boîtes relatives au joueur en Y, X et Z sont lues dans des tables `rst $18`. Si la balle est dedans, le coup part.
3. **Direction et puissance, choisies au moment de l'impact :**
   - **A = coup normal. B = lob :** la vitesse verticale double et la vitesse de profondeur tombe à `$40`, ou `$4C` si haut est tenu.
   - **Haut / bas** au moment de l'impact = coup plus long ou plus court (vitesse ±`$10`, `$1E3C`).
   - **Gauche / droite** = croisé ou décroisé : la cible X est décalée de ±`$10`, ou de ±`$08` pour un coup A (`$0F7C`).
   - La routine `$1D22` calcule la vitesse latérale vers la cible, et `$1CF6` la vitesse verticale pour atterrir à la profondeur voulue.
4. **Service :** avec A, la vitesse vient de la table du niveau (`$C092`), et le service est plus fort aux niveaux élevés. Avec B, le service est plus lent et plus haut.

---

## 7. La balle (`$C040`)

### Structure

| Adresse | Contenu |
|---|---|
| `$C040` | État |
| `$C042/43` | Y (8.8) |
| `$C044/45` | X (8.8) |
| `$C047` | Hauteur Z |
| `$C04B` | Zone courante |
| `$C04C` | **Nombre de rebonds** |
| `$C04D` | Zone du premier rebond |
| `$C04F` | Bit 7 = sens en Y |
| `$C050` | Vitesse X, en **signe-module** (bit 7 = signe) |
| `$C051` | Vitesse Y (module) |
| `$C052` | Vitesse verticale (signe-module) |
| `$C054/55` | Freinage X/Y par trame |
| `$C05D/5E` | Gravité (16 bits) |
| `$C05C` | Profil de trajectoire (normal, lob, smash) |
| `$C05A` | Nombre d'échanges dans le point |

### Mouvement par trame (`$18E4`)

1. `X += vx × 4 / 256` et `Y += vy × 4 / 256`. Aux bords du terrain (murs invisibles), la balle repart en sens inverse et perd la moitié de sa vitesse.
2. Les vitesses diminuent de `$C054/55` à chaque trame (freinage de l'air).
3. `vz` diminue de la gravité. La hauteur Z suit, avec une mise à l'échelle qui dépend du profil `$C05C` (tables `$19E3` et `$1A34`).
4. **Rebond :** quand Z repasse à 0 en descente, `$C04C` augmente et la vitesse verticale est amortie.
5. **Filet (`$1C27`)** : balle au niveau de Y ≈ `$76-$7A`, entre les poteaux (X de `$2E` à `$AB`) et plus basse que `$1E` :
   - Z ≥ `$1C` : **bande**. La balle passe, mais ralentie de moitié.
   - Sinon : la balle **reste dans le filet**. Elle repart dans l'autre sens, à un quart de sa vitesse.

6. **Balle sur un joueur (`$10A9`, `$1618`)** : balle à moins de 3 unités en Y et 4 en X, plus basse que `$34`. Elle rebondit sur le joueur, ce qui fait perdre le point.

La gravité au moment de la frappe vaut `(vy × 256) / $48`, ou `/ $28` pour un smash (`$16C3`). Le temps de vol est donc réglé par la vitesse de profondeur.

### États de la balle (table `$17AE`)

| Val | Rôle |
|---|---|
| 0 | Remise à zéro |
| 1 | Dans la main du serveur |
| 2 | Lancer du service |
| 3 | **En jeu** |
| 4, 5 | Après rebond : test de validité (service dans le carré ? balle dehors ?) |
| 6, 7 | Faute, double rebond |
| 8 | Point terminé : annonce (`$C4`, `$C5` ou `$C6` dans `$FFC2`), pause de 90 ou 150 trames |
| 9 | Fin, qui déclenche la suite du déroulement |

---

## 8. Règles et score (`$1F8E`, `$2061`, `$2170`)

### Points (`$C0DD` = J1, `$C0DE` = J2)

| Code | Signification |
|---|---|
| 1 | 0 |
| 2 | 15 |
| 3 | 30 |
| 4 | 40 |
| 5 | Égalité |
| 6 | Avantage |
| 0 | Désavantage |

- 40 contre moins de 40, puis un point gagné : **jeu**.
- 40-40 : les deux passent à 5 (égalité). À l'égalité, le gagnant du point passe à 6 et l'autre à 0.
- Un point gagné par le joueur à 0 ramène les deux à l'égalité.

**Tie-break :** les codes partent de 7 (0 point) au lieu de 1. On gagne à 7 points. À 6-6, le jeu repasse en égalité/avantage. On change de côté tous les 6 points (`$212D`).

### Jeux et sets

- `$C0E0-$C0E2` = jeux de J1 dans chacun des 3 sets, `$C0E3-$C0E5` = jeux de J2.
- `$C0DB` = numéro du set en cours. `$C0E6` = nombre de jeux joués dans le set, plus 1 (≥ 13 = tie-break).
- **Set gagné :** à 6 jeux avec 2 d'écart, ou à 7-5, ou au tie-break à 6-6.
- **Match : au meilleur des 3 sets.** `$FFC4` tient la différence de sets gagnés ; le match est gagné à ±2. Une option à 1 set existe (`$FF96` bit 3) **(à confirmer)**.

### Service et côtés

- **Service :** alterne à chaque jeu, et tous les 2 points au tie-break (`$1FB5`).
- **Côté de service** (droite/gauche) : `$FF91` bit 0, qui bascule à chaque point.
- **Changement de côté :** aux jeux impairs (`$FF91` bit 1). Il inverse les positions de départ et les carrés de service.

### Déroulement d'un point (`$FF90`, table `$1F94`)

| Val | Rôle |
|---|---|
| 0 | Mise en place : désigne le serveur, les joueurs passent à l'état 4 |
| 2 | Point en cours ; attend l'état 9 de la balle |
| 3 | Analyse de l'annonce (`$FFC2`) : faute, let, double faute, point pour J1 ou J2 |
| 4 | Jeu gagné |
| 5 | Pause, puis tableau d'affichage |
| 6, 7 | Match gagné |
| 8 | Mise à jour du score |

---

## 9. IA (`$2720` pour J2 ; `$230C` pour J1 en démo)

L'IA écrit dans le joypad virtuel. Elle n'a aucun privilège : même vitesse de base, mêmes coups qu'un humain.

### Au service (`$2750`)

1. Attente aléatoire, puis déplacement latéral aléatoire.
2. Lancer de balle.
3. Frappe à la bonne hauteur. Le service est visé dans un coin avec la probabilité « précision du service » du niveau (`$22B1`).

### En échange (`$27BC`, sous-états `$FFB0`)

| Val | Rôle |
|---|---|
| 0 | **Choix d'une position cible** : rester au fond, monter au filet ou se placer au centre. Les probabilités (`$C097+`) dépendent de la position de l'adversaire. |
| 1 | Rejoindre la cible (`$FFB2/B3`) |
| 2 | **Suivre la balle** : prédit le X de la balle à la profondeur du joueur (`$1722`) et s'y déplace. Délai de réaction aléatoire de 1 à 8 trames. |
| 3 | **Décision de frappe** : lob avec la probabilité du niveau (plus fréquent si l'adversaire est au filet) ; direction choisie pour éloigner la balle de l'adversaire |
| 4 | Frappe en cours |
| 5 | Balle haute : se replacer pour le smash |

### Paramètres par niveau (table `$0B35`, 16 octets, copiés en `$C090` et `$C0B0`)

| Octet | Rôle probable | N1 | N2 | N3 | N4 |
|---|---|---|---|---|---|
| +0 | Profondeur de montée au filet | `$94` | `$A0` | `$A0` | `$B0` |
| +1 | % de lob | 5 | 10 | 20 | 30 |
| +2 | Vitesse du service | `$70` | `$A0` | `$C0` | `$E0` |
| +4 | % service visé dans un coin | 30 | 40 | 70 | 80 |
| +5 | % coup visé loin de l'adversaire | 60 | 50 | 60 | 50 |
| +6 | Puissance de frappe | `$58` | `$80` | `$90` | `$A0` |
| +7..+F | Probabilités de placement (3 × 3) | `0a 14 3c 0a 14 0a 14 14 05` | `0a 46 0a 0a 1e 0a 14 14 00` | `0a 14 1e 0a 14 0a 0a 32 05` | `05 1e 0a 05 14 28 0a 32 05` |

En mode 1 joueur, l'humain reçoit le même enregistrement que le CPU, avec la vitesse de service et la puissance réduites de 25 % aux niveaux 2 à 4 (`$0B26`).

Le niveau 4 est sélectionnable dans le menu (LEVEL 1 à 4), et un tableau d'affichage spécifique lui est associé.

---

## 10. Graphismes et son

- **Sprites** (`gfx/tiles_62d6_sprites_8000.png`) : 2 joueurs vus de dos et de face, avec de nombreuses images (déplacement, coup droit, revers, volée, smash, service). S'y ajoutent Mario en arbitre, la balle et son ombre. Les listes de sprites par image sont dans les données du banc 1 (`$305A` les affiche).
- **Fond** : le court en perspective, le public (animé pendant les applaudissements), la chaise d'arbitre et le tableau d'affichage.
- **Fenêtre GB** : bandeau de score en haut. Une interruption LCD à la ligne `$29` la coupe.
- **Son** : `$3665` lance un effet ou une musique à partir d'un numéro, `$369E` est le pilote appelé à chaque trame. Numéros observés :

| N° | Son |
|---|---|
| `$05` | Frappe |
| `$08` | Déplacement du curseur de menu |
| `$09` | Validation |
| `$0C` | Filet |
| `$0D` | Balle qui touche le corps d'un joueur (`$10A9`) : point perdu |
| `$12` | Musique du titre |
| `$1E` / `$21` / `$16` | Musiques des tableaux d'affichage |
| `$25` | Applaudissements après un long échange **(à confirmer)** |
| `$29`, `$31` | Annonces du score |

  Les données musicales restent à localiser et à décoder.
- **Rendu vérifié contre l'émulateur PyBoy** : les tuiles et le tilemap du court correspondent octet pour octet à la VRAM réelle. Au démarrage, le jeu remplit les tilemaps avec la tuile `$80` (vide, routine `$3001`). La seule différence restante est la tête de l'arbitre, animée pendant le match.

---

## 11. Conséquences pour le portage

1. **La logique se porte telle quelle, en coordonnées de court.** Elle ne dépend pas de l'écran. Seules la projection (`$095D`) et le dessin changent. Sur Spectrum (256 × 192), le court tient **en entier en largeur**. En hauteur, soit on resserre la projection (y ≈ `Y × 0,7`), soit on défile.
2. **Les entrées passent par le joypad virtuel**, ce qui donne gratuitement le mode 2 joueurs sur un clavier.
3. **Fréquence :** le GB tourne à 59,7 Hz, le Spectrum à 50 Hz. Il faut soit accepter un jeu 17 % plus lent, soit multiplier toutes les vitesses, gravités et temporisations par 1,2. Je recommande la seconde option : il suffit d'ajuster les tables de constantes.
4. **Budget CPU :** le GB fait tout dans le VBlank avec des sprites matériels. Sur Spectrum, il faut des sprites logiciels : 2 joueurs d'environ 16 × 24 px, plus la balle et son ombre. Le rendu doit être écrit en assembleur inline. La logique (entiers 8 et 16 bits, pas de flottants) s'écrit directement en Boriel Basic avec des `UByte` et `UInteger`.
5. **Le hasard** doit rester un LCG `5x+11` : les pourcentages de l'IA en dépendent. On peut le faire avancer une fois par trame et dans l'attente du VBlank.
6. **Les données de niveau** (section 9) et les tables d'animation et de hitbox se recopient telles quelles.
7. **Reste à décoder :**
   - les tables de hitbox et d'animation lues par `rst $18` dans `$0E77` ;
   - les listes de sprites (`$305A`) ;
   - le pilote son et les partitions ;
   - la cérémonie de fin de match (`$2B33`).
