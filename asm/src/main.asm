; ===========================================================================
; ZX TENNIS - portage ZX Spectrum 48K du Tennis Game Boy (Nintendo, 1989)
; Version 100 % assembleur (sjasmplus).
;
; La logique du jeu (déroulement du match, joueurs, balle, IA) est la ROM
; Game Boy traduite instruction par instruction en Z80 par tools/gb2z80.py
; (gb/gb_logic.asm). Ce fichier et les modules de src/ fournissent le reste :
; démarrage, interruption, entrées, affichage, son.
;
; Cadence : affichage à 50 images/s. La logique garde le rythme du Game Boy
; (59,7 Hz) : 6 pas de jeu toutes les 5 trames (2,1,1,1,1).
;
; Mémoire : $6000-$7FFF (ralentie par l'affichage) : démarrage, menu, texte,
; score, décor. $8000-$BFFF et $E000-$FDFC (non ralenties) : tout ce qui
; tourne à chaque image, et les graphismes des sprites.
; ===========================================================================

        DEVICE ZXSPECTRUM48
        INCLUDE "defs.asm"

; Profilage (assembler avec -DPROFILE) : couleur de bordure pendant chaque
; partie de la boucle, mesurée par tools/zxrun.py. Sinon, bordure verte unie.
        MACRO PROF col
        IFDEF PROFILE
        ld a,col
        out ($FE),a
        ENDIF
        ENDM

        ORG CODE_START
start:
        di
        ld sp,CODE_START
        ; interruption IM2 : un simple compteur de trames
        ld hl,IM2_TABLE
        ld de,IM2_TABLE+1
        ld bc,256
        ld (hl),IM2_ISR >> 8
        ldir
        ld a,$C3
        ld (IM2_ISR),a
        ld hl,isr
        ld (IM2_ISR+1),hl
        ld a,IM2_TABLE >> 8
        ld i,a
        im 2
        ei
        ld a,1
        ld (W_LEVEL),a
.loop:
        call menu
        call play_match
        jr .loop

; --- Écran ---------------------------------------------------------------------

cls:
        ld hl,SCREEN
        ld de,SCREEN+1
        ld bc,6143
        ld (hl),0
        ldir
        ld hl,ATTRS
        ld de,ATTRS+1
        ld bc,767
        ld (hl),ATTR_COURT
        ldir
        ld a,BORDER_COL
        out ($FE),a
        ret

; --- Menu ------------------------------------------------------------------------

menu:
        call show_title
        ld bc,14*256 + 6
        ld hl,txt_level
        call print_at
        ld bc,15*256 + 6
        ld hl,txt_sets
        call print_at
        ld bc,16*256 + 6
        ld hl,txt_keys
        call print_at
        ld bc,17*256 + 6
        ld hl,txt_kemp
        call print_at
        ld bc,18*256 + 6
        ld hl,txt_move
        call print_at
        ld bc,19*256 + 6
        ld hl,txt_hit
        call print_at
        ld bc,20*256 + 4
        ld hl,txt_lob1
        call print_at
        ld bc,21*256 + 4
        ld hl,txt_lob2
        call print_at
        ld bc,22*256 + 6
        ld hl,txt_play
        call print_at
        call show_level
        call show_sets
        call show_ctrl
.wait:
        call wait_frame
        call read_menu_key
        or a
        jr z,.wait
        cp 13
        ret z
        cp 'K'
        jr nz,.nk
        xor a
        ld (use_kempston),a
        call show_ctrl
        jr .wait
.nk:
        cp 'J'
        jr nz,.nj
        ld a,1
        ld (use_kempston),a
        call show_ctrl
        jr .wait
.nj:
        cp 'S'
        jr nz,.ns
        ld a,(one_set)
        xor 1
        ld (one_set),a
        call show_sets
.rel:
        call wait_frame             ; attendre le relâchement de S
        call read_menu_key
        cp 'S'
        jr z,.rel
        jr .wait
.ns:
        sub '0'
        ld (W_LEVEL),a
        call show_level
        jr .wait

show_level:
        ld bc,14*256 + 21
        call text_at
        ld a,(W_LEVEL)
        jp print_num

show_sets:
        ld bc,15*256 + 21
        call text_at
        ld a,(one_set)
        or a
        ld a,'3'
        jr z,.n
        ld a,'1'
.n:
        jp print_char

one_set:    db 0                    ; 0 = 3 sets (défaut), 1 = 1 set

show_ctrl:
        ld a,(use_kempston)
        ld hl,txt_mark
        ld de,txt_blank
        or a
        jr z,.k
        ex de,hl
.k:
        push de
        ld bc,16*256 + 4
        call print_at
        pop hl
        ld bc,17*256 + 4
        jp print_at

txt_level:  db "1-4 : level",0
txt_sets:   db "S   : sets",0
txt_keys:   db "K : keyboard",0
txt_kemp:   db "J : Kempston joystick",0
txt_move:   db "Q A O P : move",0
txt_hit:    db "SPACE / fire : hit",0
txt_lob1:   db "automatic lob when your",0
txt_lob2:   db "opponent comes to the net",0
txt_play:   db "ENTER : play",0
txt_mark:   db ">",0
txt_blank:  db " ",0

; Écran de présentation : décompresse title_rle (gfx/title.asm) sur l'écran.
; Paquets : n (1-127) + n octets, ou $80+n + octet répété n fois ; 0 = fin.
show_title:
        xor a
        out ($FE),a                 ; bordure noire
        ld hl,title_rle
        ld de,SCREEN
.pkt:
        ld a,(hl)
        inc hl
        or a
        ret z
        ld c,a
        ld b,0
        jp m,.run
        ldir                        ; n octets littéraux
        jr .pkt
.run:
        and $7F
        ld b,a
        ld a,(hl)
        inc hl
.rep:
        ld (de),a
        inc de
        djnz .rep
        jr .pkt

; --- Score -------------------------------------------------------------------------

shown_score: ds 8
shown_ann:   db 0

; Réaffiche le score si les points ou les jeux ont changé
show_score:
        ld hl,W_PTS1
        ld de,shown_score
        ld a,(hl)
        ex de,hl
        cp (hl)
        jr nz,show_score_force
        ex de,hl
        inc hl
        inc de
        ld a,(de)
        cp (hl)
        jr nz,show_score_force
        ld hl,W_GAMES1
        ld de,shown_score+2
        ld b,6
.c:
        ld a,(de)
        cp (hl)
        jr nz,show_score_force
        inc hl
        inc de
        djnz .c
        jr show_ann
show_score_force:
        ld hl,W_PTS1
        ld de,shown_score
        ldi
        ldi
        ld hl,W_GAMES1
        ld bc,6
        ldir
        ld bc,0*256 + 0
        ld hl,txt_you
        call print_at
        ld hl,W_GAMES1
        call print_games
        ld bc,0*256 + 12
        call text_at
        ld a,(W_PTS1)
        call print_points
        ld a,'-'
        call print_char
        ld a,(W_PTS2)
        call print_points
        ld hl,txt_spaces
        call print_str
        ld bc,0*256 + 22
        ld hl,txt_cpu
        call print_at
        ld hl,W_GAMES2
        call print_games
show_ann:
        ld a,(H_ANN)
        bit 6,a
        jr nz,.a
        xor a
.a:
        ld hl,shown_ann
        cp (hl)
        ret z
        ld (hl),a
        push af
        ld bc,1*256 + 10
        ld hl,txt_clear
        call print_at
        pop af
        or a
        ret z
        and $0F
        ld hl,txt_fault
        ld bc,1*256 + 13
        cp 4
        jr z,.p
        ld hl,txt_let
        ld bc,1*256 + 14
        cp 5
        jr z,.p
        ld hl,txt_out
        cp 6
        jr z,.p
        cp 1
        ret nz
        ld a,(W_PTS1)
        ld c,a
        ld a,(W_PTS2)
        cp 6
        jr z,.adv
        ld b,a
        ld a,c
        cp 6
        jr z,.adv
        cp 5
        ret nz
        ld a,b
        cp 5
        ret nz
        ld hl,txt_deuce
        ld bc,1*256 + 13
        jr .p
.adv:
        ld hl,txt_adv
        ld bc,1*256 + 11
.p:
        jp print_at

; HL = 3 compteurs de jeux
print_games:
        ld b,3
.g:
        push bc
        push hl
        ld a,(hl)
        call print_num
        ld a,' '
        call print_char
        pop hl
        pop bc
        inc hl
        djnz .g
        ret

; A = code de points GB -> texte (1:0 2:15 3:30 4/5:40 6:AD 0:40 ; >=7 tie-break)
print_points:
        cp 7
        jr c,.n
        sub 7
        jp print_num
.n:
        ld l,a
        ld h,0
        add hl,hl
        ld de,points_txt
        add hl,de
        ld a,(hl)
        inc hl
        ld e,(hl)
        ld d,0
        ex de,hl                    ; HL = 2e caractère
        push hl
        call print_char
        pop hl
        ld a,l
        or a
        ret z
        jp print_char

points_txt: db "40", "0",0, "15", "30", "40", "40", "AD"

txt_you:    db "YOU  ",0
txt_cpu:    db "CPU ",0
txt_spaces: db "   ",0
txt_clear:  db "            ",0
txt_fault:  db "FAULT",0
txt_let:    db "LET",0
txt_out:    db "OUT",0
txt_deuce:  db "DEUCE",0
txt_adv:    db "ADVANTAGE",0

; --- Modules lents (menu, texte, décor) --------------------------------------------

        INCLUDE "text.asm"
        INCLUDE "court.asm"
        INCLUDE "../gfx/scenery.asm"
        INCLUDE "../gfx/title.asm"
cold_end:
        ASSERT cold_end <= HOT_START    ; la zone lente ne doit pas déborder

; =====================================================================================
; Zone rapide $8000-$BFFF : tout ce qui tourne à chaque image
; =====================================================================================
        ORG HOT_START
hot_start:

isr:
        push af
        ld a,(frames)
        inc a
        ld (frames),a
        pop af
        ei
        reti

frames:     db 0

; Attend la prochaine trame en faisant tourner le hasard du jeu (comme la
; boucle principale du GB, qui appelle $00A9 en attendant l'interruption)
wait_frame:
        ld a,(frames)
        ld b,a
.w:
        call G_00A9
        ld a,(frames)
        cp b
        jr z,.w
        ret

; --- Match -------------------------------------------------------------------------

tick_pattern: db 2, 1, 1, 1, 1
tick_phase:   db 0
ticks_due:    db 0
last_frame:   db 0

play_match:
        call cls
        call draw_scenery
        call draw_court
        call spr_init
        call gb_new_match
        xor a
        ld (fire_mode),a
        ld a,$FF
        ld (shown_ann),a
        call show_score_force
        ld a,(frames)
        ld (last_frame),a
.frame:
        call wait_frame
        PROF 2
        call draw_all
        PROF 1
        ; pas de jeu dus pour les trames écoulées (rythme GB exact)
        ld a,(frames)
        ld hl,last_frame
        sub (hl)
        cp 7                        ; au plus 6 trames de retard rattrapées
        jr c,.lag
        ld a,6
.lag:
        ld b,a
        ld a,(frames)
        ld (hl),a
.due:
        ld a,(tick_phase)
        ld e,a
        ld d,0
        ld hl,tick_pattern
        add hl,de
        ld a,(ticks_due)
        add a,(hl)
        ld (ticks_due),a
        ld a,e
        inc a
        cp 5
        jr c,.ph
        xor a
.ph:
        ld (tick_phase),a
        djnz .due
        call read_pad
        call apply_fire
        ld (pad_now),a
.tick:
        ld a,(ticks_due)
        or a
        jr z,.ticked
        dec a
        ld (ticks_due),a
        ld a,(pad_now)
        call gb_set_pad
        call gb_tick
        jr .tick
.ticked:
        PROF 3
        call prepare_all
        PROF 5
        call show_score
        PROF BORDER_COL
        call play_sfx
        ld a,(match_over)
        or a
        jr z,.frame
        ; fin du match
        ld a,(H_SETS)
        bit 7,a
        ld hl,txt_win
        jr z,.w
        ld hl,txt_lose
.w:
        ld bc,11*256 + 12
        call print_at
        ld b,150
.p:
        push bc
        call wait_frame
        pop bc
        djnz .p
        ret

pad_now:  db 0
txt_win:  db "YOU WIN!",0
txt_lose: db "CPU WINS",0

        INCLUDE "gb_support.asm"
        INCLUDE "input.asm"
        INCLUDE "projection.asm"
        INCLUDE "sprite.asm"
        INCLUDE "render.asm"
        INCLUDE "sound.asm"
        INCLUDE "../gb/gb_logic.asm"
hot_end:
        ASSERT hot_end <= GB_WRAM       ; ne pas déborder sur la RAM GB ($C000)

; =====================================================================================
; Graphismes des sprites en $E000 (mémoire non ralentie, libre côté GB)
; =====================================================================================
        ORG GFX_START
gfx_start:
        INCLUDE "../gfx/sprites.asm"
gfx_end:
        ASSERT gfx_end <= IM2_ISR       ; ni sur l'interruption ($FDFD)
        ASSERT gfx_end <= basic         ; ni sur le chargeur BASIC assemblé en $F800

; --- Cassette : chargeur BASIC + écran de présentation + code --------------------
;   10 CLEAR VAL "24575": LOAD ""SCREEN$ : POKE VAL "23739",VAL "111":
;      LOAD ""CODE : LOAD ""CODE : LOAD ""CODE : RANDOMIZE USR VAL "24576"
; Le POKE (CURCHL) coupe l'affichage des en-têtes "Bytes:" par-dessus l'écran.
; Trois blocs de code : zone lente ($6000), zone rapide ($8000), sprites ($E000).
        ORG $F800
basic:
        db 0, 10                    ; numéro de ligne
        dw basic_end - basic_line
basic_line:
        db $FD, $B0, '"24575"', ':'             ; CLEAR VAL "24575":
        db $EF, '""', $AA, ':'                  ; LOAD ""SCREEN$ :
        db $F4, $B0, '"23739"', ',', $B0, '"111"', ':'  ; POKE VAL "23739",VAL "111":
        db $EF, '""', $AF, ':'                  ; LOAD ""CODE :
        db $EF, '""', $AF, ':'                  ; LOAD ""CODE :
        db $EF, '""', $AF, ':'                  ; LOAD ""CODE :
        db $F9, $C0, $B0, '"24576"', $0D        ; RANDOMIZE USR VAL "24576"
basic_end:

        ORG SCREEN                  ; écran de chargement (mémoire de l'assembleur seulement)
        INCBIN "../gfx/title.scr"

        EMPTYTAP "../build/tennis.tap"
        SAVETAP "../build/tennis.tap", BASIC, "ZX Tennis", basic, basic_end - basic, 10
        SAVETAP "../build/tennis.tap", CODE, "title", SCREEN, 6912
        SAVETAP "../build/tennis.tap", CODE, "zxtennis1", CODE_START, cold_end - CODE_START
        SAVETAP "../build/tennis.tap", CODE, "zxtennis2", HOT_START, hot_end - HOT_START
        SAVETAP "../build/tennis.tap", CODE, "zxtennis3", GFX_START, gfx_end - GFX_START
