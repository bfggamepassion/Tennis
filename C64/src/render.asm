; ===========================================================================
; render.asm - sprites : joueurs, balle, ombre, marque de rebond
;
; Comme les routines d'affichage de la ROM ($486F, $4A90, $1B50), avec la
; projection du jeu traduite (G_095D, G_09C2, G_0951) : position à l'écran
; GB = projection + décalage de l'image. Le C64 montrant tout le stade, la
; position C64 = position GB + décalage fixe (pas de défilement).
;
; Sprites matériels (le plus petit numéro passe devant) :
;   0 balle, contour (noir)   1 balle, intérieur (blanc)
;   2-3 joueur 1 (haut, bas)  4-5 joueur 2 (haut, bas)   multicolores
;   6 ombre (noir)            7 marque de rebond (noir)
; render remplit des registres fantômes ; l'interruption les recopie dans
; le VIC pendant le bas de l'écran (vbl_sprites).
; ===========================================================================

SPR_X0      = 24 + 32           ; X sprite = x GB + 56 (colonnes C64 4-35 = GB 0-31)
SPR_Y0      = 50 - 16           ; Y sprite = y GB + 34 (rangée C64 0 = rangée GB 2)

spr_x       .fill 8
spr_y       .fill 8
spr_ptr     .fill 8
spr_xhi     .byte 0
spr_on      .byte 0
spr_pri     .byte 0
bitmask     .byte 1, 2, 4, 8, 16, 32, 64, 128
ball_b      .byte 0             ; projection de la balle (avant la hauteur)
ball_c      .byte 0
ball_pri    .byte 0

sprites_init
        lda #0                      ; noir, blanc : couleurs communes (multicolore)
        sta $D025
        lda #1
        sta $D026
        ldx #7
-       lda spr_colors,x
        sta $D027,x
        dex
        bpl -
        lda #%00111100              ; joueurs multicolores
        sta $D01C
        lda #0
        sta $D017
        sta $D01D
        sta spr_on
        rts

spr_colors  .byte 0, 1, 2, 2, 6, 6, 0, 0

; Pendant l'interruption du bas de l'écran : registres fantômes -> VIC
vbl_sprites
        ldx #7
-       txa
        asl a
        tay
        lda spr_x,x
        sta $D000,y
        lda spr_y,x
        sta $D001,y
        lda spr_ptr,x
        sta SPRPTR,x
        dex
        bpl -
        lda spr_xhi
        sta $D010
        lda spr_pri
        sta $D01B
        lda spr_on
        sta $D015
        rts

; Place le sprite X : position GB (zC, zB) + décalage signé (zW, zW+1)
place   ldy #0
        lda zW
        bpl +
        dey
+       clc
        lda zC
        adc #SPR_X0
        sta zT
        lda #0
        adc #0
        sta zT+1
        clc
        lda zT
        adc zW
        sta spr_x,x
        tya
        adc zT+1
        lsr a                       ; bit 8 de X -> C
        lda bitmask,x
        bcc +
        ora spr_xhi
        sta spr_xhi
        jmp _y
+       eor #$FF
        and spr_xhi
        sta spr_xhi
_y      ldy #0
        lda zW+1
        bpl +
        dey
+       clc
        lda zB
        adc #SPR_Y0
        sta zT
        lda #0
        adc #0
        sta zT+1
        clc
        lda zT
        adc zW+1
        sta zT
        tya
        adc zT+1
        beq +
        lda #0                      ; hors de l'écran : caché dans la bordure
        sta zT
+       lda zT
        sta spr_y,x
        ldy #0
        rts

; Allume (A = masque) ou éteint des sprites
spr_show
        ora spr_on
        sta spr_on
        rts
spr_hide
        eor #$FF
        and spr_on
        sta spr_on
        rts

render  ldy #0
        ; --- joueur 1 ($486F) : invisible si (état AND 3) = 0 ---
        lda $C000
        and #3
        bne +
        lda #%00001100
        jsr spr_hide
        jmp _p2
+       lda #<$C002
        sta zL
        lda #>$C002
        sta zH
        jsr proj
        ldx $C001
        lda p1_top,x
        sta spr_ptr+2
        lda p1_bot,x
        sta spr_ptr+3
        lda p1_dx,x
        sta zW
        lda p1_dy,x
        sta zW+1
        ldx #2
        jsr place
        lda zW+1
        clc
        adc #21
        sta zW+1
        ldx #3
        jsr place
        lda #%00001100
        jsr spr_show
        ; --- joueur 2 ($4A90) ---
_p2     lda $C020
        and #3
        bne +
        lda #%00110000
        jsr spr_hide
        jmp _ball
+       lda #<$C022
        sta zL
        lda #>$C022
        sta zH
        jsr proj
        ldx $C021
        lda p2_top,x
        sta spr_ptr+4
        lda p2_bot,x
        sta spr_ptr+5
        lda p2_dx,x
        sta zW
        lda p2_dy,x
        sta zW+1
        ldx #4
        jsr place
        lda zW+1
        clc
        adc #21
        sta zW+1
        ldx #5
        jsr place
        lda #%00110000
        jsr spr_show
        ; --- balle et ombre ($1B50) ---
_ball   lda $C040
        bne +
        lda #%01000011
        jsr spr_hide
        jmp _mark
+       lda #<$C042
        sta zL
        lda #>$C042
        sta zH
        jsr proj
        lda zB
        sta ball_b
        lda zC
        sta ball_c
        jsr lift                    ; hauteur -> y de la balle ($09C2)
        jsr behind_net              ; derrière le filet : sous le décor
        sta ball_pri
        lda $C047                   ; taille : hauteur < $40, < $60, sinon grande
        ldx #0
        cmp #$40
        bcc +
        inx
        cmp #$60
        bcc +
        inx
+       lda ball_out,x
        sta spr_ptr+0
        lda ball_in,x
        sta spr_ptr+1
        lda #-3
        sta zW
        lda #-6
        sta zW+1
        ldx #0
        jsr place
        ldx #1
        jsr place
        lda ball_b                  ; ombre : au sol
        sta zB
        lda ball_c
        sta zC
        jsr behind_net
        beq +
        lda #%01000000
+       ora ball_pri
        sta spr_pri
        lda #SPR_SHADOW
        sta spr_ptr+6
        lda #-8
        sta zW+1
        ldx #6
        jsr place
        lda #%01000011
        jsr spr_show
        ; --- marque de rebond ($0951) ---
_mark   lda $C060
        bne +
        lda #%10000000
        jmp spr_hide
+       lda #<$C062
        sta zL
        lda #>$C062
        sta zH
        jsr proj_mark
        lda #SPR_MARK
        sta spr_ptr+7
        lda #-3
        sta zW
        lda #-5
        sta zW+1
        ldx #7
        jsr place
        lda #%10000000
        jmp spr_show

; --- Projection court -> écran GB ($095D), en 6502 natif ------------------------
; Entrée : zL/zH -> Y (8.8), X (8.8). Sortie : zB = y, zC = x (pixels GB).
;   b = Y arrondi, c = X arrondi, dx = |$6C - c|, dy = |$B8 - b|
;   l = ((dx² x dy) / 256 / 72) / 4, opposé si b >= $B8
;   x = c + l si c < $6C, sinon c - l ;  y = $1C + b x 40 / 47
; Mêmes résultats que la ROM (vérifié par tools/test_proj.py).
pj_b    .byte 0                     ; b : lu par lift ($FFCD dans la ROM)
pj_c    .byte 0

proj    ldy #0
        lda (zL),y                  ; b = Y arrondi
        asl a
        iny
        lda (zL),y
        adc #0
        sta pj_b
        iny
        lda (zL),y                  ; c = X arrondi
        asl a
        iny
        lda (zL),y
        adc #0
        ldy #0
        sta pj_c
        jmp proj_bc

; $0951 : marque de rebond (Y et X sans arrondi, Y - 1 devant le filet)
proj_mark
        ldy #1
        lda (zL),y
        cmp #$78
        bcs +
        sbc #0                      ; (C = 0 : -1)
+       sta pj_b
        ldy #3
        lda (zL),y
        ldy #0
        sta pj_c

; b = pj_b, c = pj_c
proj_bc lda #$6C                    ; dx = |$6C - c|
        sec
        sbc pj_c
        bcs +
        eor #$FF
        adc #1
+       tax
        lda #$B8                    ; dy = |$B8 - b|
        sec
        sbc pj_b
        bcs +
        eor #$FF
        adc #1
+       sta zW+3
        lda sq_lo,x                 ; P = dx² (16 bits) x dy : 24 bits dans A:zT:zW
        sta zW+1
        lda sq_hi,x
        sta zW+2
        lda #0
        sta zT
        ldx #8
-       lsr zW+3
        bcc +
        tay
        clc
        lda zT
        adc zW+1
        sta zT
        tya
        adc zW+2
+       ror a
        ror zT
        ror zW
        dex
        bne -
        ldy #0
        ; A:zT = P >> 8 (< 72 x 256) ; quotient par 72 sur 8 bits -> zT
        ldx #8
-       asl zT
        rol a
        cmp #72
        bcc +
        sbc #72
        inc zT
+       dex
        bne -
        lda zT                      ; l = quotient / 4
        lsr a
        lsr a
        ldx pj_b                    ; b >= $B8 : l = -l
        cpx #$B8
        bcc +
        eor #$FF
        adc #0                      ; (C = 1 : +1)
+       sta zT
        lda pj_c                    ; x = c + l si c < $6C, sinon c - l
        cmp #$6C
        bcs +
        adc zT
        jmp ++
+       sbc zT
+       sta zC
        ldx pj_b                    ; y = $1C + b x 40 / 47
        lda ytab,x
        sta zB
        rts

; $09C2 : hauteur de la balle ($C047) -> zB = y écran - hauteur
;   z' = z + z/8 si la balle est au service (état 2) ; l = z' x 6 / 16 + 1,
;   moins 1 à 3 pixels vers le fond (b < $C8, < $A8, < $78), sans passer 0.
lift    lda $C047
        ldx $C040
        cpx #2
        bne +
        lsr a
        lsr a
        lsr a
        clc
        adc $C047
+       tax
        ldy lifttab,x               ; z' x 6 / 16
        iny
        lda pj_b
        cmp #$C8
        bcs _l
        dey
        beq _l
        cmp #$A8
        bcs _l
        dey
        beq _l
        cmp #$78
        bcs _l
        dey
_l      sty zT
        ldy #0
        lda zB
        sec
        sbc zT
        sta zB
        rts

sq_lo   .byte <(range(256) ** 2)
sq_hi   .byte >(range(256) ** 2)
ytab    .byte $1C + range(256) * 40 / 47
lifttab .byte range(256) * 6 / 16

; Balle derrière le filet ($1B76) : Y court < $78, y écran >= $78,
; x écran dans [$28, $B0[. Sortie : A = %00000011 (priorité) ou 0, Z selon A.
behind_net
        lda $C043
        cmp #$78
        bcs _no
        lda zB
        cmp #$78
        bcc _no
        lda zC
        cmp #$28
        bcc _no
        cmp #$B0
        bcs _no
        lda #%00000011
        rts
_no     lda #0
        rts

        .include "../gfx/sprite_tables.asm"
