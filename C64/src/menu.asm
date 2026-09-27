; ===========================================================================
; menu.asm - écran de présentation et menu, entrées clavier
;
; Titre : écran $6400, caractères $6800 (gfx/title_*.asm, tools/gen_c64title.py)
; Menu : 1-4 niveau, S nombre de sets, feu, RETURN ou ESPACE pour jouer.
; Commandes en jeu : joystick port 2 et clavier (Q A O P, ESPACE) ensemble.
; ===========================================================================
TITLE_SCREEN = $6400
TITLE_CHARS  = $6800
TITLE_FONT   = TITLE_CHARS + 128 * 8
TITLE_COLORS = $6E00

menu    jsr video_title
        lda #>TITLE_SCREEN
        sta txt_page
        lda #1                      ; blanc
        sta txt_ink
        #prt 16, 8, "1-4   LEVEL"
        #prt 17, 8, "S     SETS"
        lda #3                      ; cyan
        sta txt_ink
        #prt 19, 3, "JOYSTICK PORT 2 OR Q A O P + SPACE"
        #prt 20, 0, "AUTOMATIC LOB WHEN THE CPU IS AT THE NET"
        lda #7                      ; jaune
        sta txt_ink
        #prt 22, 9, "FIRE OR RETURN TO PLAY"
        lda #5                      ; vert
        sta txt_ink
        #prt 24, 8, "BASED ON NINTENDO, 1989"
        lda #1
        sta txt_ink
_show   ldx #16
        lda #24
        jsr text_at
        lda W_LEVEL
        jsr print_num
        ldx #17
        lda #24
        jsr text_at
        lda one_set                 ; 0 -> 3 sets, 1 -> 1 set
        eor #1
        asl a
        ora #1
        jsr print_num
_rel    jsr wait_frame              ; attendre que tout soit relâché
        jsr menu_key
        bne _rel
_wait   jsr wait_frame
        jsr menu_key
        beq _wait
        cmp #KEY_PLAY
        beq _play
        cmp #KEY_SETS
        bne +
        lda one_set
        eor #1
        sta one_set
        jmp _show
+       sta W_LEVEL                 ; 1 à 4
        jmp _show
_play   jsr wait_frame              ; attendre le relâchement avant de jouer
        jsr menu_key
        bne _play
        lda #>SCREEN                ; retour au texte du court
        sta txt_page
        lda #0
        sta txt_ink
        rts

KEY_SETS    = 5
KEY_PLAY    = 6

; Touche du menu : A = 1-4 (niveau), KEY_SETS, KEY_PLAY (feu, RETURN,
; ESPACE) ou 0 ; Z selon A
menu_key
        lda $DC00                   ; feu du joystick (port 2)
        and #$10
        beq _p
        ldx #0
-       lda key_row,x
        sta $DC00
        lda $DC01
        and key_bit,x
        beq _k
        inx
        cpx #7
        bne -
        lda #$FF
        sta $DC00
        lda #0
        rts
_k      lda #$FF
        sta $DC00
        lda key_code,x
        rts
_p      lda #KEY_PLAY
        rts
;               1    2    3    4    S    RETURN ESPACE
key_row     .byte $7F, $7F, $FD, $FD, $FD, $FE, $7F
key_bit     .byte $01, $08, $01, $08, $20, $02, $10
key_code    .byte 1, 2, 3, 4, KEY_SETS, KEY_PLAY, KEY_PLAY

; Clavier en jeu : Q A O P ESPACE -> joypad GB
read_keys
        lda #0
        sta zW
        ldx #4
-       lda pk_row,x
        sta $DC00
        lda $DC01
        and pk_bit,x
        bne +
        lda zW
        ora pk_pad,x
        sta zW
+       dex
        bpl -
        lda #$FF
        sta $DC00
        lda zW
        rts
;           Q    A    O    P    ESPACE
pk_row  .byte $7F, $FD, $EF, $DF, $7F
pk_bit  .byte $40, $04, $40, $02, $10
pk_pad  .byte PAD_U, PAD_D, PAD_L, PAD_R, PAD_A

video_title
        lda #$0B                    ; écran éteint pendant l'installation
        sta $D011
        lda #0
        sta $D015                   ; pas de sprites
        sta spr_on
        sta $D020
        lda #TITLE_BG0
        sta $D021
        lda #TITLE_BG1
        sta $D022
        lda #TITLE_BG2
        sta $D023
        lda #$9A                    ; écran $6400, caractères $6800
        sta $D018
        ldx #0
-       lda TITLE_COLORS,x
        sta COLRAM,x
        lda TITLE_COLORS+250,x
        sta COLRAM+250,x
        lda TITLE_COLORS+500,x
        sta COLRAM+500,x
        lda TITLE_COLORS+750,x
        sta COLRAM+750,x
        inx
        cpx #250
        bne -
        lda #$1B
        sta $D011
        rts
