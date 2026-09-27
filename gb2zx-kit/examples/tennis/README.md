# Exemple : ZX Tennis

`port_config.py` est la configuration complète du portage de Tennis (Game Boy, Nintendo 1989).
Elle pointe vers les fichiers du repo Tennis (`../../../re/tennis.gb`, `../../../asm/build/`).

Le code propre à Tennis, à consulter comme exemple, est dans le repo Tennis :

| Fichier | Intérêt |
|---|---|
| `re/FICHE_JEU.md` | Exemple de fiche de rétro-ingénierie (ROM, RAM, états, formules) |
| `re/extract_gfx.py`, `re/extract_sprites.py` | Extraction des graphismes en rejouant la VRAM et les listes OAM |
| `tools/gen_sprites.py`, `gen_scenery.py`, `gen_title.py` | Générateurs : sprites, décor coloré (public, arbitre), écran titre |
| `asm/src/gb_support.asm` | Code de liaison réel (S_SCREEN, S_P1SHOT, gb_new_match) |
| `asm/src/render.asm`, `projection.asm` | Affichage des objets d'après les routines de la ROM, projection court -> écran |
| `asm/src/input.asm` | Lob automatique (un seul bouton) |
| `asm/src/court.asm`, `main.asm` | Tracé du court, décor, menu, score |
| `tools/test_smash.py` | Test ciblé avec visualisation en temps réel |
