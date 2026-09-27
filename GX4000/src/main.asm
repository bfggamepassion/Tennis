; ===========================================================================
; CPC Tennis Plus - portage CPC Plus / GX4000 (cartouche) du Tennis Game Boy
; (Nintendo, 1989). Sprites matériels de l'ASIC, palette 4096 couleurs.
; Assembleur : sjasmplus. La logique du jeu est la ROM GB traduite en Z80
; (gb/gb_logic.asm, la même que pour le Spectrum, vérifiée pas à pas contre
; le vrai jeu). Ce fichier : démarrage, interruption, écran, boucle de jeu.
;
; Écran : mode 1 (320x200, 4 encres = les 4 teintes du GB), déplacé en $4000
; pour laisser la RAM GB ($C000-$FFFF) libre. Le stade GB entier est affiché
; à l'échelle 1 (colonnes 4-35 en caractères de 8 pixels).
; Cadence : 50 trames/s. La logique garde le rythme du GB (59,7 Hz) : 6 pas
; toutes les 5 trames (motif 2,1,1,1,1).
; ===========================================================================

        DEVICE NOSLOT64K
        INCLUDE "defs.asm"

        MACRO DBG col                   ; repère de mise au point (-DDEBUG) : bordure
        IFDEF DEBUG
        ld bc,$7F10
        out (c),c
        ld c,col
        out (c),c
        ENDIF
        ENDM

        MACRO PROF col                  ; profilage : couleur de bordure (-DPROFILE)
        IFDEF PROFILE
        ld bc,$7F10
        out (c),c
        ld a,col
        out (c),a
        ENDIF
        ENDM

; =====================================================================================
; Partie A : $0200-$3FFF
; =====================================================================================
        ORG LOAD_ADDR
start:                              ; (depuis boot2 : ROM coupées, ASIC déverrouillé)
        di
        ld sp,LOAD_ADDR             ; pile en $0100-$01FF
        ld bc,$7F00 + GA_MODE1      ; mode 1, ROM coupées
        out (c),c
        DBG $4C
        ASIC_MAP                    ; ASIC : pas d'interruption raster, sprites cachés
        xor a
        ld ($6800),a
        ld hl,$6000
        ld b,128
.clr:
        ld (hl),a
        inc hl
        djnz .clr
        ASIC_UNMAP
        DBG $4A
        ld a,$C3                    ; IM 1 : saut en $0038 vers isr
        ld ($0038),a
        ld hl,isr
        ld ($0039),hl
        im 1
        ld hl,crtc_regs             ; CRTC : format standard du CPC (une cartouche
        xor a                       ; démarre sans ROM système pour l'initialiser),
.crtc:                              ; écran en $4000 (R12 = $10)
        ld b,$BC
        out (c),a
        ld c,(hl)
        ld b,$BD
        out (c),c
        inc hl
        inc a
        cp 14
        jr c,.crtc
        ld bc,$F782                 ; PPI : port A sortie, B entrée (VSYNC), C sortie
        out (c),c
        call sound_init
        ld a,1
        ld (W_LEVEL),a
        ld (two_buttons),a          ; manette à 2 boutons : réglage par défaut
        ei
.loop:
        DBG $55
        IFNDEF AUTOPLAY
        call menu
        ENDIF
        call play_match
        jr .loop

crtc_regs:  db 63, 40, 46, $8E, 38, 0, 25, 30, 0, 7, 0, 0, $10, 0

; --- Interruption (300 Hz, 6 par trame) : compte le temps écoulé -------------
; (le début du dessin, lui, se cale sur le signal VSYNC : voir wait_frame)
isr:
        push af
        ld a,(int6)
        inc a
        cp 6
        jr c,.s
        ld a,(frames)
        inc a
        ld (frames),a
        xor a
.s:
        ld (int6),a
        pop af
        ei
        ret

frames: db 0
int6:   db 0


; Attend le début du signal VSYNC (PPI port B, bit 0), en faisant tourner le
; hasard du jeu (comme la boucle principale du GB, qui appelle $00A9 en
; attendant l'interruption). Le dessin commence alors en haut de la bordure,
; ~72 lignes avant que le faisceau n'atteigne l'image.
wait_frame:
        ld b,$F5
        in a,(c)
        rra
        ret c                       ; déjà dans le VSYNC (en retard de peu) : y aller
.w:
        call G_00A9
        ld b,$F5
        in a,(c)
        rra
        jr nc,.w
        ret

; Cale le compteur de trames sur le VSYNC : l'interruption qui suit le début
; du VSYNC (2 lignes après) devient la 1re des 6, et frames avance donc juste
; après chaque début de VSYNC, avant que la boucle de jeu ne le lise.
sync_frames:
        ld b,$F5
.a:
        in a,(c)
        rra
        jr c,.a                     ; attendre la fin du VSYNC en cours
.b:
        in a,(c)
        rra
        jr nc,.b                    ; puis le début du suivant
        xor a
        ld (int6),a
        ret

; --- Écran ------------------------------------------------------------------------

; Palette du jeu (ASIC, 12 bits) : court, bordure, sprites
set_inks:
        xor a
        ld hl,court_pens
        ld b,4
        call set_pens
        ld a,16                     ; bordure
        ld hl,border_pen
        ld b,1
        call set_pens
        ld a,17                     ; encres 1-15 des sprites
        ld hl,spr_pens
        ld b,15
        jp set_pens
; teintes GB 0-3 du court : %RRRRBBBB, %0000GGGG
court_pens:
        db $B9, $0F                 ; vert tendre
        db $64, $0D                 ; vert
        db $32, $09                 ; vert foncé
        db $02, $03                 ; presque noir
border_pen:
        db $00, $00

; A = y (0-199) -> HL = adresse écran de la ligne
line_addr:
        ld l,a
        ld h,0
        add hl,hl
        ld de,line_tab
        add hl,de
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        ret

; Écran noir (encre 3) puis stade : 25 rangées x 32 tuiles, colonnes 4-35
draw_court:
        ld hl,SCREEN
        ld de,SCREEN+1
        ld bc,$3FFF
        ld (hl),$FF
        ldir
        xor a
.r:
        push af
        call draw_court_row
        pop af
        inc a
        cp 25
        jr nz,.r
        ret

; A = rangée (0-24) : redessine les 32 tuiles du stade de cette rangée
draw_court_row:
        ld l,a                      ; IX = court_map + rangée x 32
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        ld de,court_map
        add hl,de
        push hl
        pop ix
        add a,a
        add a,a
        add a,a
        call line_addr
        ld de,8                     ; colonne 4 = octet 8
        add hl,de
        ld b,32
.col:
        push bc
        push hl
        ld l,(ix+0)
        inc ix
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        ld de,court_tiles
        add hl,de
        ex de,hl
        pop hl
        push hl
        ld b,8
.ln:
        ld a,(de)
        ld (hl),a
        inc de
        inc hl
        ld a,(de)
        ld (hl),a
        inc de
        dec hl
        ld a,h
        add a,8
        ld h,a
        djnz .ln
        pop hl
        inc hl
        inc hl
        pop bc
        djnz .col
        ret

; --- Match -------------------------------------------------------------------------

tick_pattern: db 2, 1, 1, 1, 1
tick_phase:   db 0
ticks_due:    db 0
last_frame:   db 0
pad_now:      db 0
elapsed:      db 0
one_set:      db 0

play_match:
        ld bc,$7F00 + GA_MODE1      ; mode 1 et encres du court (le menu est en mode 0)
        out (c),c
        call set_inks
        call draw_court
        call hw_init
        call gb_new_match
        xor a
        ld (fire_mode),a
        ld a,$FF
        ld (shown_ann),a
        call show_score_force
        call sync_frames
        ld a,(frames)
        ld (last_frame),a
.frame:
        call wait_frame
        PROF $4C
        call hw_commit              ; sprites matériels : juste après le VSYNC
        PROF $54
        ; pas de logique dus pour les trames écoulées (rythme GB exact)
        ld a,(frames)
        ld hl,last_frame
        sub (hl)
        cp 7                        ; au plus 6 trames de retard rattrapées
        jr c,.lag
        ld a,6
.lag:
        ld b,a
        ld (elapsed),a
        ld a,(frames)
        ld (hl),a
        inc b                       ; aucune trame écoulée : rien à ajouter
        dec b                       ; (sinon djnz ferait 256 tours)
        jr z,.nodue
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
.nodue:
        IFDEF AUTOPLAY
        ld a,(elapsed)
        cp 2                        ; test : trames en retard
        jr c,.ontime
        ld hl,(lag_count)
        inc hl
        ld (lag_count),hl
.ontime:
        call bot_pad
        ELSE
        call read_pad
        call apply_fire
        ENDIF
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
        call prepare_all
        call show_score
        call play_sfx
        IFDEF AUTOPLAY
        call show_lag
        ENDIF
        ld a,(match_over)
        or a
        jp z,.frame
        ; fin du match
        ld a,(H_SETS)
        bit 7,a
        ld hl,txt_win
        jr z,.w
        ld hl,txt_lose
.w:
        ld bc,11*256 + 15
        call print_at
        ld b,150
.p:
        push bc
        call wait_frame
        pop bc
        djnz .p
        ret

txt_win:  db " YOU WIN! ",0
txt_lose: db " CPU WINS ",0

        IFDEF AUTOPLAY
lag_count:   dw 0
total_count: dw 0
; Test : trames en retard / 256 trames, en bas à gauche
show_lag:
        ld hl,(total_count)
        inc hl
        ld (total_count),hl
        ld a,l                      ; affiché toutes les 64 trames seulement
        and 63
        ret nz
        ld bc,22*256 + 0
        call text_at
        ld a,(lag_count+1)
        call print_num
        ld a,'/'
        call print_char
        ld a,(total_count+1)
        jp print_num
        INCLUDE "autoplay.asm"
        ENDIF

        INCLUDE "gb_support.asm"
        INCLUDE "render.asm"
        INCLUDE "hwsprite.asm"
        INCLUDE "input.asm"
        INCLUDE "text.asm"
        INCLUDE "sound.asm"
        INCLUDE "../gb/gb_logic.asm"
part_a_end:
        ASSERT part_a_end <= SCREEN, "partie A pleine"

; =====================================================================================
; Partie B : $8000-$BFFF
; =====================================================================================
        ORG $8000
; Entrée depuis la page 0 de la cartouche : couper les ROM (le code de
; démarrage tourne en ROM basse), puis lancer le jeu.
boot2:
        ld bc,$7F00 + GA_MODE1
        out (c),c
        jp start

        IFNDEF AUTOPLAY                     ; (version de test : pas de menu)
        INCLUDE "menu.asm"
        INCLUDE "../gfx/title.asm"
        ENDIF
        INCLUDE "proj.asm"
        INCLUDE "../gfx/court.asm"
        INCLUDE "../gfx/lines.asm"
        INCLUDE "../gfx/font.asm"
        INCLUDE "../gfx/plus_sprites.asm"
part_b_end:
        ASSERT part_b_end <= $C000, "partie B pleine"

        SAVEBIN "../build/page1.bin", $0000, $4000
        SAVEBIN "../build/page2.bin", $8000, $4000
