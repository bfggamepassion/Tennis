# Exemple : CPC Tennis

`port_config.py` est la configuration du portage CPC de Tennis. La logique Z80 est identique à celle du Spectrum.
Elle pointe vers la ROM du repo Tennis (`../re/tennis.gb` depuis `Amstrad/`).

Le code propre à Tennis, à consulter comme exemple, est dans le repo Tennis, dossier `Amstrad/` :

| Fichier | Intérêt |
|---|---|
| `src/render.asm`, `src/proj.asm` | Places des objets d'après les routines d'affichage de la ROM ; projection native (tables) |
| `src/menu.asm`, `tools/gen_cpctitle.py` | Titre en mode 0 : tuiles mode 1 converties avec une palette par rangée |
| `src/input.asm` | Choix 1/2 boutons, lob automatique |
| `src/text.asm` | Score dans les colonnes latérales, annonces sur le mur du fond |
| `src/gb_support.asm` | Code de liaison réel (repris du Spectrum) |
| `src/autoplay.asm` | Robot de test, compteur de trames en retard |
| `tools/gen_cpcgfx.py`, `gen_cpcsprites.py` | Stade et sprites tirés de la ROM |
| `tools/prof_cpc.py`, `test_proj.py`, `cpc_frames.py` | Profilage, vérification de la projection, simulation image par image |
