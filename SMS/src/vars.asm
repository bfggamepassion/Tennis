; ===========================================================================
; vars.asm - variables en RAM (après la RAM GB $C000-$C0FF)
; Toute la RAM est mise à zéro au démarrage.
; ===========================================================================

MAX_JOBS    equ 10
SAT_MAX     equ 24              ; balle, ombre, marque, 2 x 6 (joueurs), marge

        ORG $C100
frames:         ds 1            ; trames écoulées (interruption de trame)
frame_ready:    ds 1            ; 1 : sprites, motifs et textes prêts pour l'interruption
paused:         ds 1            ; bouton Pause (NMI) : 1 = en pause
was_paused:     ds 1
is_pal:         ds 1            ; 1 : console à 50 Hz
pal_acc:        ds 1            ; 50 Hz : un pas de jeu de plus toutes les 5 trames
wn_last:        ds 1
last_frame:     ds 1
ticks_due:      ds 1
pad_now:        ds 1
tick_sp:        ds 2
sfx_req:        ds 1
match_over:     ds 1
sets:           ds 1            ; 1 ou 3 sets
cur_img:        ds 5            ; image affichée de chaque objet ($FE : aucune)
up_img:         ds 5            ; image dont les motifs sont à recopier ($FF : rien)
up_budget:      ds 2            ; octets de motifs encore permis pour cette trame
sat_n:          ds 1            ; sprites dans sat_y / sat_xn
spr_dir:        ds 1
po_obj:         ds 1
po_n:           ds 1
po_k:           ds 1
po_pat:         ds 1
po_base:        ds 2
po_x:           ds 2
po_y:           ds 2
ps_x:           ds 1
pj_b:           ds 1            ; b : lu par lift ($FFCD dans la ROM)
pj_c:           ds 1
job_n:          ds 1
sb_ptr:         ds 2
shown_score:    ds 8
shown_ann:      ds 1
sfx_vol:        ds 2            ; son : volume (voie son, bruit)
sfx_decay:      ds 2
sfx_frac:       ds 2
menu_sel:       ds 1
menu_prev:      ds 1
lag_count:      ds 2
total_count:    ds 2
bot_cool:       ds 1
bot_serve:      ds 1
jobs:           ds 5 * MAX_JOBS ; textes : adresse VRAM, source, longueur (octets)
sat_y:          ds SAT_MAX
sat_xn:         ds 2 * SAT_MAX
score_buf:      ds 2 * 5 * 7    ; cadre du score : 5 rangées x 7 colonnes (mots)
ann_buf:        ds 2 * 16       ; annonces : rangée 1, colonnes 8-23
menu_buf:       ds 2 * 4        ; menu : 2 curseurs, 2 valeurs
vars_end:
        ASSERT vars_end <= GB_SNDRAM, "variables : trop grandes"
