; ===========================================================================
; text.asm - texte et score
;
; Police : recopiée au démarrage depuis la ROM de caractères du C64 (codes
; écran 0-63), inversée, en caractères 128-191 : lettres vert clair ($D021)
; sur fond noir (couleur de case 0), comme les colonnes latérales.
; Chaînes : codage écran de 64tass (.enc "c64txt"), terminées par 0.
; ===========================================================================

; Codage des chaînes : codes écran 0-63 du C64 (majuscules = $01-$1A)
        .enc "c64txt"
        .cdef " ?", $20
        .cdef "AZ", $01
        .enc "none"

TXT_SCR     = zW                ; pointeur écran du prochain caractère
TXT_COL     = zW+2              ; pointeur couleur
FONT        = CHARSET + 128 * 8

font_init
        sei
        lda #$33                    ; ROM de caractères visible en $D000
        sta $01
        ldx #0
-       lda $D000,x                 ; titre : normale (lettres = couleur de case)
        sta TITLE_FONT,x
        eor #$FF                    ; court : inversée (lettres = fond $D021)
        sta FONT,x
        lda $D100,x
        sta TITLE_FONT+$100,x
        eor #$FF
        sta FONT+$100,x
        inx
        bne -
        lda #MEM_IO
        sta $01
        cli
        rts

; Après l'installation du décor : rangée des annonces d'origine
ann_init
        ldx #39
-       lda SCREEN+ANN_ROW*40,x
        sta ann_save,x
        lda COLRAM+ANN_ROW*40,x
        sta ann_save_col,x
        dex
        bpl -
        rts

ann_save     .fill 40
ann_save_col .fill 40

; X = rangée, A = colonne
text_at clc
        adc row_lo,x
        sta TXT_SCR
        sta TXT_COL
        lda row_hi,x
        adc #0
        pha
        adc txt_page
        sta TXT_SCR+1
        pla
        clc
        adc #>COLRAM
        sta TXT_COL+1
        rts

row_lo  .for r := 0, r < 25, r += 1
        .byte <(r * 40)
        .next
row_hi  .for r := 0, r < 25, r += 1
        .byte >(r * 40)
        .next

; A = code écran (0-63)
txt_page    .byte >SCREEN       ; écran où l'on écrit
txt_ink     .byte 0             ; couleur des cases de texte

print_char
        ldy #0
        ora #$80
        sta (TXT_SCR),y
        lda txt_ink
        sta (TXT_COL),y
        inc TXT_SCR
        inc TXT_COL
        bne +
        inc TXT_SCR+1
        inc TXT_COL+1
+       rts

; zL/zH = chaîne
print_str
        ldy #0
        lda (zL),y
        beq +
        jsr print_char
        inc zL
        bne print_str
        inc zH
        jmp print_str
+       rts

; X = rangée, A = colonne, zL/zH = chaîne
print_at
        jsr text_at
        jmp print_str

; A = nombre 0-99, sans zéro de tête
print_num
        ldx #$2F
        sec
-       inx
        sbc #10
        bcs -
        adc #$3A
        pha
        txa
        cmp #$30
        beq +
        jsr print_char
+       pla
        jmp print_char

; --- Score ------------------------------------------------------------------------
W_PTS1      = $C0DD             ; points (codes GB)
W_PTS2      = $C0DE
W_GAMES1    = $C0E0             ; jeux par set (3 sets)
W_GAMES2    = $C0E3
H_ANN       = $FFC2             ; annonce ($C1 score, $C4 faute, $C5 let, $C6 dehors)
ANN_ROW     = 1                 ; rangée des annonces (mur du fond)

shown_score .fill 8
shown_ann   .byte 0

prt         .macro row, col, text
        lda #<_s
        sta zL
        lda #>_s
        sta zH
        ldx #\row
        lda #\col
        jsr print_at
        jmp _e
        .enc "c64txt"
_s      .null \text
        .enc "none"
_e
        .endm

; Réaffiche le score si les points ou les jeux ont changé, puis l'annonce
show_score
        ldx #1
-       lda W_PTS1,x
        cmp shown_score,x
        bne show_score_force
        dex
        bpl -
        ldx #5
-       lda W_GAMES1,x
        cmp shown_score+2,x
        bne show_score_force
        dex
        bpl -
        jmp show_ann
show_score_force
        ldx #1
-       lda W_PTS1,x
        sta shown_score,x
        dex
        bpl -
        ldx #5
-       lda W_GAMES1,x
        sta shown_score+2,x
        dex
        bpl -
        #prt 1, 0, " YOU"
        #prt 1, 36, " CPU"
        lda #0
        sta zA
        lda #1
        jsr print_games
        lda #3
        sta zA
        lda #37
        jsr print_games
        ldx #7
        lda #1
        jsr text_at
        lda W_PTS1
        jsr print_points
        ldx #7
        lda #37
        jsr text_at
        lda W_PTS2
        jsr print_points
show_ann
        lda H_ANN
        and #$40
        beq +
        lda H_ANN
+       cmp shown_ann
        bne +
        rts
+       sta shown_ann
        pha
        ldx #35                     ; efface : décor d'origine (colonnes du stade)
-       lda ann_save,x
        sta SCREEN+ANN_ROW*40,x
        lda ann_save_col,x
        sta COLRAM+ANN_ROW*40,x
        dex
        cpx #4
        bcs -
        pla
        beq _r
        and #$0F
        cmp #4
        bne +
        #prt ANN_ROW, 17, " FAULT "
        rts
+       cmp #5
        bne +
        #prt ANN_ROW, 18, " LET "
        rts
+       cmp #6
        bne +
        #prt ANN_ROW, 18, " OUT "
        rts
+       cmp #1
        bne _r
        lda W_PTS2                  ; égalité / avantage
        cmp #6
        beq _adv
        lda W_PTS1
        cmp #6
        beq _adv
        cmp #5
        bne _r
        lda W_PTS2
        cmp #5
        bne _r
        #prt ANN_ROW, 17, " DEUCE "
_r      rts
_adv    #prt ANN_ROW, 15, " ADVANTAGE "
        rts

; zA = index du joueur (0 ou 3 : W_GAMES1 / W_GAMES2), A = colonne :
; jeux des 3 sets, rangées 3 à 5
print_games
        sta zB
        lda #3
        sta zC
-       ldx zC
        lda zB
        jsr text_at
        lda #$20
        jsr print_char
        ldx zA
        lda W_GAMES1,x
        jsr print_num
        lda #$20
        jsr print_char
        inc zA
        inc zC
        lda zC
        cmp #6
        bne -
        rts

; A = code de points GB -> texte (1:0 2:15 3:30 4/5:40 6:AD 0:40 ; >= 7 tie-break)
print_points
        pha
        lda #$20
        jsr print_char
        pla
        cmp #7
        bcc +
        sbc #7
        jsr print_num
        jmp _sp
+       asl a
        tax
        lda points_txt,x
        jsr print_char
        lda points_txt+1,x
        jsr print_char
_sp     lda #$20
        jmp print_char

        .enc "c64txt"
points_txt .text "40 0153040404AD"
        .enc "none"
