; ===========================================================================
; ZX Tennis C64 - portage Commodore 64 du Tennis Game Boy (Nintendo, 1989)
; Assembleur : 64tass. La logique du jeu est la ROM GB traduite en 6502
; (gb/gb_logic_*.asm, générés par tools/gb2m6502.py).
;
; Carte mémoire :
;   $0002-$0010  registres GB (zp.asm)
;   $0801-$3FFF  programme : démarrage, boucle, affichage, entrées, sons,
;                code de liaison, 1er morceau de la logique traduite
;   $4000-$7FFF  banque VIC 1 : écran $4000, caractères $4800, sprites $5000-
;   $8000-$BFFF  2e morceau de la logique traduite
;   $C000-$C0FF  RAM GB (objets, match) ; $DD00 : octet son GB (sous les E/S)
;   $FF80-$FFCB  HRAM GB ; $FFFA-$FFFF vecteurs 6502 (ROM du C64 coupées)
; La logique tourne avec toute la RAM visible ($01 = $34) : la RAM GB en
; $DD00 est sous les entrées/sorties. Le reste du temps, $01 = $35.
;
; Cadence : 50 trames/s (PAL). La logique garde le rythme du GB (59,7 Hz) :
; 6 pas toutes les 5 trames (motif 2,1,1,1,1).
; ===========================================================================
        .cpu "6502"
        .include "zp.asm"
        .include "../gfx/court.asm"         ; couleurs de fond du décor
        .include "../gfx/title.asm"

SCREEN      = $4000
CHARSET     = $4800
SPRITES     = $5000
SPRPTR      = SCREEN + $3F8
COLRAM      = $D800
MEM_IO      = $35               ; RAM + entrées/sorties
MEM_RAM     = $34               ; RAM partout (pour la logique)

H_SCREEN    = $FF8A             ; écran GB (3 = court, $0A = fin de match)
H_OPT       = $FF96
H_PAD1      = $FF9A
H_PRS1      = $FF9B
H_PADPREV   = $FF9E
H_SETS      = $FFC4
W_LEVEL     = $C0DF
PAD_A       = $01
PAD_B       = $02
PAD_R       = $10
PAD_L       = $20
PAD_U       = $40
PAD_D       = $80
        .weak
AUTOPLAY    = 0                 ; 1 : le robot joue le joueur 1 (tests : -D AUTOPLAY=1)
GB_EXACT    = 0                 ; 1 : sans réglage de jouabilité (vérification)
        .endweak

        * = $0801                   ; ligne BASIC : 10 SYS start
        .word (+), 10
        .null $9e, format("%d", start)
+       .word 0

start   sei
        cld
        ldx #$FF
        txs
        lda #MEM_IO                 ; coupe BASIC et KERNAL
        sta $01
        lda #<nmi                   ; vecteurs en RAM
        sta $FFFA
        lda #>nmi
        sta $FFFB
        lda #<irq
        sta $FFFE
        lda #>irq
        sta $FFFF
        lda #$7F                    ; coupe les interruptions des CIA
        sta $DC0D
        sta $DD0D
        lda $DC0D
        lda $DD0D
        jsr video_bank
        jsr sprites_init
        jsr font_init
        jsr sound_init
        lda #$01                    ; interruption raster, ligne 250
        sta $D01A
        lda #250
        sta $D012
        lda $D011
        and #$7F
        sta $D011
        lsr $D019
        ldy #0
        cli
        lda #1
        sta W_LEVEL
-
        .if !AUTOPLAY
        jsr menu
        .endif
        jsr play_match
        jmp -

nmi     rti

; Interruption raster : compte les trames. Peut arriver pendant la logique
; ($01 = $34) : on remet les entrées/sorties le temps de la traiter.
irq     pha
        lda $01
        pha
        lda #MEM_IO
        sta $01
        inc frames
        txa
        pha
        tya
        pha
        jsr vbl_sprites
        pla
        tay
        pla
        tax
        lsr $D019
        pla
        sta $01
        pla
        rti

frames  .byte 0

wait_frame
        lda frames
-       cmp frames
        beq -
        rts

; --- Vidéo ----------------------------------------------------------------------
video_bank
        lda $DD02                   ; banque VIC 1 ($4000-$7FFF)
        ora #3
        sta $DD02
        lda $DD00
        and #$FC
        ora #2
        sta $DD00
        lda #$18                    ; multicolore, 40 colonnes
        sta $D016
        rts

video_court
        lda #$0B                    ; écran éteint pendant l'installation
        sta $D011
        lda #$02                    ; écran $4000, caractères $4800
        sta $D018
        lda #0
        sta $D020
        lda #COURT_BG0
        sta $D021
        lda #COURT_BG1
        sta $D022
        lda #COURT_BG2
        sta $D023
        ldx #0                      ; couleurs du décor
-       lda court_colors,x
        sta COLRAM,x
        lda court_colors+250,x
        sta COLRAM+250,x
        lda court_colors+500,x
        sta COLRAM+500,x
        lda court_colors+750,x
        sta COLRAM+750,x
        inx
        cpx #250
        bne -
        jsr ann_init
        lda #$1B                    ; écran allumé, 25 rangées
        sta $D011
        rts

; --- Match -------------------------------------------------------------------------
tick_pattern .byte 2, 1, 1, 1, 1
tick_phase  .byte 0
ticks_due   .byte 0
last_frame  .byte 0
pad_now     .byte 0

play_match
        jsr video_court
        jsr gb_new_match
        lda #$FF
        sta shown_ann
        jsr show_score_force
        lda frames
        sta last_frame
_frame  jsr wait_frame
        jsr render                  ; sprites d'après l'état du dernier pas
        jsr show_score
        jsr play_sfx
        .if AUTOPLAY
        jsr show_lag
        .endif
        ; pas de logique dus pour les trames écoulées (rythme GB exact)
        lda frames
        sec
        sbc last_frame
        cmp #7                      ; au plus 6 trames de retard rattrapées
        bcc +
        lda #6
+       tax
        .if AUTOPLAY
        cpx #2                      ; test : trames en retard
        bcc +
        inc lag_count
        bne +
        inc lag_count+1
+
        .endif
        lda frames
        sta last_frame
_due    ldy tick_phase
        lda ticks_due
        clc
        adc tick_pattern,y
        sta ticks_due
        iny
        cpy #5
        bcc +
        ldy #0
+       sty tick_phase
        dex
        bne _due
        ldy #0
        jsr read_pad
        jsr apply_fire
        sta pad_now
_tick   lda ticks_due
        beq _ticked
        dec ticks_due
        lda pad_now
        jsr gb_set_pad
        lda #MEM_RAM
        sta $01
        jsr gb_tick
        lda #MEM_IO
        sta $01
        jmp _tick
_ticked lda match_over
        bne +
        jmp _frame
+       ldx #39                     ; fin du match : message sur le court
-       lda SCREEN+11*40,x
        sta row_save,x
        lda COLRAM+11*40,x
        sta row_save_col,x
        dex
        bpl -
        lda H_SETS                  ; bit 7 = le CPU a gagné
        bmi +
        #prt 11, 16, " YOU WIN! "
        jmp _wait
+       #prt 11, 16, " CPU WINS "
_wait   ldx #150
-       jsr wait_frame
        dex
        bne -
        ldx #39                     ; le court retrouve son décor
-       lda row_save,x
        sta SCREEN+11*40,x
        lda row_save_col,x
        sta COLRAM+11*40,x
        dex
        bpl -
        rts

row_save     .fill 40
row_save_col .fill 40

; Joystick port 2 -> joypad GB (bit0 A, bit4 droite, bit5 gauche, bit6 haut, bit7 bas)
read_pad
        .if AUTOPLAY
        jmp bot_pad
        .endif
        jsr read_keys
        sta zW+1
        lda $DC00
        eor #$FF
        and #$1F
        tax
        lda pad_map,x
        ora zW+1
        rts

; Un seul bouton. Lob automatique : quand l'adversaire est au filet (zone
; « carré de service » calculée par la ROM, $C02B) et que le joueur n'y est
; pas lui-même ($C00B), le feu devient le bouton B du GB (lob). Sinon, et
; toujours au service, c'est le bouton A. Choix fait à l'appui, tenu
; jusqu'au relâchement.
P1_ZONE     = $C00B
P2_ZONE     = $C02B
ZONE_NET    = $0C
fire_mode   .byte 0             ; 0 relâché, 1 bouton A, 2 bouton B

apply_fire
        sta zW
        and #PAD_A
        bne +
        sta fire_mode
        lda zW
        rts
+       lda fire_mode
        bne _out
        ldx #1
        lda $C000                   ; en échange seulement
        cmp #1
        bne _set
        lda P2_ZONE
        and #ZONE_NET
        cmp #ZONE_NET
        bne _set
        lda P1_ZONE
        and #ZONE_NET
        cmp #ZONE_NET
        beq _set
        ldx #2
_set    stx fire_mode
_out    lda zW
        and #$FC
        ora fire_mode               ; 1 = PAD_A, 2 = PAD_B
        rts

pad_map .for i := 0, i < 32, i += 1
        .byte ((i & 1) << 6) | ((i & 2) << 6) | ((i & 4) << 3) | ((i & 8) << 1) | ((i & 16) >> 4)
        .next

        .include "gb_support.asm"
        .include "render.asm"
        .include "text.asm"
        .include "sound.asm"
        .include "menu.asm"
        .if AUTOPLAY
        .include "autoplay.asm"
lag_count .word 0
total_frames .word 0
; Test : trames en retard / 256 trames, en bas à gauche
show_lag
        inc total_frames
        bne +
        inc total_frames+1
+       ldx #22
        lda #0
        jsr text_at
        lda lag_count+1
        jsr print_num
        lda #$2F                    ; /
        jsr print_char
        lda total_frames+1
        jmp print_num
        .endif
        .include "../gfx/court_colors.asm"
        .include "../gb/gb_logic_1.asm"
part1_end
        .cerror part1_end > SCREEN, "zone $0801-$3FFF pleine : ", part1_end

; =====================================================================================
; Banque VIC 1 : écran, jeu de caractères, sprites
; =====================================================================================
        * = SCREEN
        .include "../gfx/court_screen.asm"
        * = CHARSET
        .include "../gfx/court_charset.asm"
        * = SPRITES
        .include "../gfx/sprites.asm"
        .cerror * > TITLE_SCREEN, "sprites trop nombreux"
        * = TITLE_SCREEN
        .include "../gfx/title_screen.asm"
        * = TITLE_CHARS
        .include "../gfx/title_charset.asm"
        * = TITLE_COLORS
        .include "../gfx/title_colors.asm"
        .cerror * > $8000, "banque VIC pleine"

; =====================================================================================
; $8000-$BFFF : 2e morceau de la logique traduite
; =====================================================================================
        * = $8000
        .include "../gb/gb_logic_2.asm"
part2_end
        .cerror part2_end > $C000, "zone $8000-$BFFF pleine : ", part2_end
