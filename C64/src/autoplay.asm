; ===========================================================================
; autoplay.asm - robot joueur 1 (build de test : sh build.sh -D AUTOPLAY=1)
; Même logique que le robot des outils Python (port_config.Bot) : servir,
; se placer sous la balle qui arrive, frapper, revenir au centre.
; Sortie : A = joypad GB.
; ===========================================================================
bot_cool    .byte 0
bot_serve   .byte 0

bot_pad lda bot_cool
        beq +
        dec bot_cool
+       lda $C000                   ; état du joueur 1
        cmp #5                      ; service : frapper après 20 trames
        bne _s6
        inc bot_serve
        lda bot_serve
        cmp #20
        bne _none
        lda #PAD_A
        rts
_s6     cmp #6                      ; balle lancée : frapper quand elle redescend
        bne _rally
        lda $C052
        bpl _none
        lda $C047
        cmp #$50
        bcs _none
        lda bot_cool
        bne _none
        lda #10
        sta bot_cool
        lda #PAD_A
        rts
_none   lda #0
        rts
_rally  lda #0
        sta bot_serve
        sta zW+2                    ; touches
        lda $C040                   ; balle en jeu et qui vient vers nous ?
        cmp #3
        beq +
        cmp #4
        bne _center
+       lda $C04F
        bmi _center
        lda $C043
        cmp #$60
        bcc _center
        lda $C045                   ; cible x = balle - 10
        sec
        sbc #10
        sta zW+3
        lda $C005
        clc
        adc #2
        cmp zW+3
        bcs +
        lda #PAD_R
        sta zW+2
        jmp _hit
+       lda $C005
        sec
        sbc #2
        cmp zW+3
        bcc _hit
        beq _hit
        lda #PAD_L
        sta zW+2
_hit    lda $C000
        cmp #1
        bne _out
        lda bot_cool
        bne _out
        lda $C003                   ; 0 < y joueur - y balle < 16
        sec
        sbc $C043
        beq _out
        cmp #16
        bcs _out
        lda #12
        sta bot_cool
        lda zW+2
        ora #PAD_A
        rts
_center lda $C000
        cmp #1
        bne _out
        lda $C005
        cmp #$68
        bcs +
        lda #PAD_R
        sta zW+2
        jmp _back
+       cmp #$71
        bcc _back
        lda #PAD_L
        sta zW+2
_back   lda $C003
        cmp #$BB
        bcc _out
        lda zW+2
        ora #PAD_U
        sta zW+2
_out    lda zW+2
        rts
