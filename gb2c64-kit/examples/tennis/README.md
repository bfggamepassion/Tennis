# Exemple : C64 Tennis

`port_config.py` est la configuration complète du portage C64 de Tennis (Game Boy, Nintendo 1989).
Elle pointe vers les fichiers du repo Tennis (`../../../re/tennis.gb`, `../../../C64/build/`).

Le code propre à Tennis, à consulter comme exemple, est dans le repo Tennis, dossier `C64/` :

| Fichier | Intérêt |
|---|---|
| `src/gb_support.asm` | Code de liaison réel : RST, calculs réécrits (S_MUL, S_DIV...), S_SCREEN, S_P1SHOT, gb_new_match |
| `src/render.asm` | Sprites d'après les routines d'affichage de la ROM ; projection native avec tables |
| `src/main.asm` | Boucle de jeu, lob automatique à un bouton |
| `src/text.asm`, `src/menu.asm` | Score, annonces, écran titre, menu, clavier |
| `src/sound.asm` | Bruitages SID |
| `src/autoplay.asm` | Robot de test et compteur de trames en retard |
| `tools/gen_c64gfx.py` | Stade GB → caractères C64, public coloré par spectateur |
| `tools/gen_c64sprites.py`, `gen_c64title.py` | Sprites des joueurs et de la balle ; écran titre |
| `tools/test_math.py`, `test_proj.py` | Vérification des routines réécrites contre la ROM traduite |
