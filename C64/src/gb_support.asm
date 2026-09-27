; ===========================================================================
; gb_support.asm - ce que la logique GB traduite (gb/gb_logic.asm) attend
;
;   Registres GB en page zéro (voir zp.asm), Y = 0 en permanence.
;   G_RST08 / G_RST18 / G_RST28 : les routines RST de la ROM ($0008-$0023),
;     appelées par JSR (l'adresse dépilée vaut « suite - 1 » : on ajoute 1).
;     Mêmes effets sur les registres et indicateurs que sur GB.
;   G_GETF / G_SETF : registre F du GB (PUSH AF / POP AF).
;   S_SOUND, S_RET, S_SCREEN, S_P1SHOT : remplaçants des routines de la ROM.
;   gb_tick : un pas de logique.
; ===========================================================================

; HL = HL + 1 (A conservé)
inc_hl  inc zL
        bne +
        inc zH
+       rts

; Dépile l'adresse de retour dans HL, + 1
pop_ret .macro
        pla
        sta zL
        pla
        sta zH
        jsr inc_hl
        .endm

; $0008 : saut indexé. A = index, table de .word juste après le JSR.
;   pop hl / add a / ld e,a / ld d,0 / add hl,de / ld a,[hl+] / ld h,[hl] / ld l,a / jp hl
G_RST08 #pop_ret
        lda zA                      ; add a
        asl a
        sta zA
        sta zZ
        sta zE                      ; ld e,a / ld d,0
        sty zD
        clc                         ; add hl,de
        adc zL
        sta zL
        lda zH
        adc #0
        sta zH
        lda #0
        rol a
        sta zCY
        lda (zL),y                  ; ld a,[hl+] / ld h,[hl] / ld l,a
        sta zA
        iny
        lda (zL),y
        ldy #0
        sta zH
        lda zA
        sta zL
        jmp (zL)

; $0018 : lecture indexée. Après le JSR : .byte N puis N octets.
; Renvoie A = octet[A] et reprend après la table.
;   pop hl / ld c,a / ld b,0 / ld a,[hl+] / push hl / add hl,bc / ld c,a
;   ld a,[hl] / pop hl / add hl,bc / jp hl
G_RST18 #pop_ret
        lda zA
        sta zC
        sty zB
        lda (zL),y
        sta zA
        jsr inc_hl
        clc
        lda zL
        adc zC
        sta zT
        lda zH
        adc #0
        sta zT+1
        lda zA
        sta zC
        lda (zT),y
        sta zA
        clc
        lda zL
        adc zC
        sta zL
        lda zH
        adc #0
        sta zH
        lda #0
        rol a
        sta zCY
        jmp (zL)

; $0028 : copie en ligne. Après le JSR : .byte N puis N octets copiés vers (DE).
;   pop hl / ld a,[hl+] / ld b,a / boucle : ld a,[hl+] / ld [de],a / inc de
;   dec b / jr nz / jp hl
G_RST28 #pop_ret
        lda (zL),y
        sta zB
        jsr inc_hl
-       lda (zL),y
        sta zA
        sta (zE),y
        jsr inc_hl
        inc zE
        bne +
        inc zD
+       dec zB
        bne -
        sty zZ                      ; Z = 1
        jmp (zL)

; F du GB : bit 7 = Z, bit 4 = C. Sortie : A = F (Y conservé)
G_GETF  lda zCY
        and #1
        asl a
        asl a
        asl a
        asl a
        ldx zZ
        bne +
        ora #$80
+       rts

; A = F du GB -> zZ, zCY
G_SETF  tax
        lsr a
        lsr a
        lsr a
        lsr a
        sta zCY
        txa
        and #$80
        eor #$80
        sta zZ
        rts

; $3665 : demande de son (A = numéro GB), jouée après l'affichage
S_SOUND lda zA
        sta sfx_req
S_RET   rts

; $016D : changement d'écran selon $FF8A. Comme sur GB (qui repart de zéro),
; le reste du pas de logique est abandonné : retour direct à l'appelant de
; gb_tick. 3 : fin d'un jeu -> nouveau jeu ($2159) ; $0A : fin du match.
S_SCREEN
        ldx tick_sp
        txs
        lda $FF8A
        cmp #$0A
        beq +
        cmp #3
        bne S_RET
        jmp G_2159
+       lda #1
        sta match_over
        rts

; --- Réglage de jouabilité (hors ROM, comme la version Spectrum) -------------
; $10A6 : coup du joueur 1 en échange, avant le lancement de la balle ($165C).
; Avec gauche, droite ou haut tenu à l'impact : vitesse latérale ($C050) et
; vitesse de montée ($C052) x SHOT_SCALE/256 (coups croisés / longs moins
; forts, ~ -10 %). Assembler avec -D GB_EXACT=1 pour le comportement GB exact
; (c'est ce que vérifie tools/diff_gb6502.py).
SHOT_SCALE  = 230
S_P1SHOT
        .if !GB_EXACT
        lda H_PAD1
        and #PAD_L | PAD_R | PAD_U
        beq _go
        lda $C050                   ; vx (signe-module)
        pha
        and #$7F
        jsr mul_shot
        sta zW
        pla
        and #$80
        ora zW
        sta $C050
        lda $C052                   ; vz, si la balle monte (pas le smash)
        bmi _go
        jsr mul_shot
        sta $C052
_go
        .endif
        jmp G_165C

; A = A * SHOT_SCALE / 256
mul_shot
        sta zW+1
        lda #0
        ldx #8
        lsr zW+1
-       bcc +
        clc
        adc #SHOT_SCALE
+       ror a
        ror zW+1
        dex
        bne -
        rts

; --- Calculs de la ROM, réécrits en 6502 (mêmes résultats, registres,
; indicateurs et octets de travail $FFC7/$FFC8 que la ROM) ------------------

; $30D0 / $30F8 : HL x A (16 x 8 bits). Sortie : produit sur 24 bits dans
; C:H:L, A = C = [T2] = octet haut, D = ancien L, E = 0, B = 0, Z = 1, C = 0.
; [T1] = multiplicateur tourné jusqu'à amener son bit fort en bit 7 (ce que
; laisse la boucle de la ROM). T1/T2 : $FFC7/$FFC8 ($30D0), $FFD1/$FFD2 ($30F8).
mul16x8 .macro T1, T2
        lda zA
        beq +
        bmi +
-       asl a
        adc #0
        bpl -
+       sta \T1
        lda zL                      ; multiplicande sur 24 bits
        sta zW
        sta zD
        lda zH
        sta zW+1
        lda zA
        sta zW+3                    ; multiplicateur
        sty zW+2
        sty zL
        sty zH
        sty zC
        sty zE
        sty zB
-       lsr zW+3
        bcc +
        clc
        lda zL
        adc zW
        sta zL
        lda zH
        adc zW+1
        sta zH
        lda zC
        adc zW+2
        sta zC
+       lda zW+3
        beq +
        asl zW
        rol zW+1
        rol zW+2
        jmp -
+       lda zC
        sta zA
        sta \T2
        sty zZ
        sty zCY
        rts
        .endm

S_MUL   #mul16x8 $FFC7, $FFC8
S_MUL2  #mul16x8 $FFD1, $FFD2

; $308F : A x E (8 x 8 bits) -> HL. A conservé, DE = E << 7, Z = 0, C = 0.
S_MUL8  lda zE
        sta zW
        sty zW+1
        lda zA
        sta zW+2
        sty zL
        sty zH
        ldx #8
-       lsr zW+2
        bcc +
        clc
        lda zL
        adc zW
        sta zL
        lda zH
        adc zW+1
        sta zH
+       dex
        beq +
        asl zW
        rol zW+1
        jmp -
+       lda zW
        sta zE
        lda zW+1
        sta zD
        lda #1
        sta zZ
        sty zCY
        rts

; $3143 : HL / A (16 / 8 bits, déroulée dans la ROM). Sortie : HL = quotient,
; A = reste, C = diviseur, Z = 0, C = emprunt de la dernière soustraction
; (ou de la comparaison, si elle a échoué).
S_DIV8  lda zA
        sta zC
        lda #0
        ldx #16
_d8     asl zL
        rol zH
        rol a
        bcs _ovf
        cmp zC
        bcc _no
        sbc zC                      ; (C = 1 : pas d'emprunt)
        inc zL
        sty zW
        jmp _nx
_ovf    sec                         ; dépassement : on soustrait toujours
        sbc zC
        inc zL
        sty zW
        bcs _nx
        inc zW                      ; emprunt sur 8 bits (comme le GB)
        jmp _nx
_no     sty zW
        inc zW
_nx     dex
        bne _d8
        sta zA
        lda zW
        sta zCY
        lda #1
        sta zZ
        rts

; $31D5 : HL / DE (16 / 16 bits, division avec restauration).
; Sortie : HL = quotient, B:C = reste (A = B = [$FFC7] = octet haut),
; [$FFC8] = dernier essai de soustraction (octet bas), Z = 1,
; C = 1 si la dernière soustraction a été refusée.
S_DIV   sty zC
        sty zW                      ; reste, octet haut
        ldx #16
-       asl zL
        rol zH
        rol zC
        rol zW
        sec
        lda zC
        sbc zE
        sta zW+1
        lda zW
        sbc zD
        bcc +
        sta zW
        lda zW+1
        sta zC
        inc zL
+       dex
        bne -
        lda #0
        rol a
        eor #1
        sta zCY
        lda zW+1
        sta $FFC8
        lda zW
        sta $FFC7
        sta zB
        sta zA
        sty zZ
        rts

; Nouveau match : séquence de la ROM après la sélection du niveau
; ($0574 : $0A9D, puis $02E3 : $FFC4, $FF95, $3297, puis $02F2 : $2159).
; Tourne avec toute la RAM visible (octet son GB en $DD00).
gb_new_match
        lda #MEM_RAM
        sta $01
        lda W_LEVEL
        pha
        lda #0
        tax
-       sta $C000,x                 ; RAM GB à zéro ($3027)
        inx
        bne -
        ldx #$4F
-       sta $FF80,x                 ; HRAM à zéro (vecteurs 6502 en $FFFA épargnés)
        dex
        bpl -
        pla
        sta W_LEVEL
        lda #$FF                    ; son : canaux libres ($361C)
        sta $DD00
        lda one_set                 ; options après l'écran titre ($0293) :
        beq +                       ; bit 2 musique, bit 3 match en 1 set ($2105)
        lda #8
+       ora #4
        sta H_OPT
        ldy #0
        tsx
        stx tick_sp
        jsr G_0A9D                  ; fiche de niveau
        lda #0
        sta H_SETS
        lda #$FF
        sta $FF95
        jsr G_3297                  ; remise à zéro du match
        jsr G_2159                  ; nouveau jeu
        lda #3                      ; écran : court ($038B)
        sta H_SCREEN
        lda #0
        sta match_over
        lda #MEM_IO
        sta $01
        rts

one_set .byte 0                     ; 0 = 3 sets (défaut), 1 = 1 set

; Joypad : même mise à jour que $21ED (A = touches du moment)
gb_set_pad
        sta zW
        eor H_PADPREV
        and zW
        sta H_PRS1
        sta $FF99
        lda zW
        sta H_PAD1
        sta H_PADPREV
        sta $FF98
        rts

; Un pas de logique : les appels de $0680 (déroulement du match, J1, J2,
; balle, IA). Sortie anticipée possible par S_SCREEN.
gb_tick ldy #0
        tsx
        stx tick_sp
        jsr G_1F8E
        jsr G_0B7D
        jsr G_10ED
        jsr G_17A0
        jmp G_2720

tick_sp     .byte 0
sfx_req     .byte 0
match_over  .byte 0
