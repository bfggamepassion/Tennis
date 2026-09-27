; ===========================================================================
; sound.asm - bruitages beeper (48K) pour les numéros de son de la ROM ($3665)
;   3 rebond  4 mur  5 élan  6/7 frappe  $0C filet  $0D corps
;   $25 applaudissements  $29/$31 annonce du score
; Chaque son ne bloque le processeur que quelques millisecondes.
; ===========================================================================

; Joue le son demandé par la logique (sfx_req), puis l'efface
play_sfx:
        ld a,(sfx_req)
        or a
        ret z
        ld c,a
        xor a
        ld (sfx_req),a
        ld hl,sfx_table
.find:
        ld a,(hl)
        or a
        ret z
        cp c
        jr z,.found
        inc hl
        inc hl
        inc hl
        inc hl
        jr .find
.found:
        inc hl
        ld a,(hl)                   ; période (0 = bruit)
        inc hl
        ld e,(hl)
        inc hl
        ld d,(hl)                   ; nombre de demi-périodes
        or a
        jr z,noise
; A = période, DE = demi-périodes
beep:
        ld c,a
        ld a,BORDER_COL
.l:
        xor $10
        out ($FE),a
        ld b,c
.w:
        djnz .w
        dec de
        ld h,a
        ld a,d
        or e
        ld a,h
        jr nz,.l
        and $EF
        out ($FE),a
        ret

; Bruit : demi-périodes tirées des octets de la ROM
noise:
        ld hl,0
        ld a,BORDER_COL
.l:
        ld b,a
        ld a,(hl)
        and $1F
        or 1
        inc hl
        ld c,a
        ld a,b
        xor $10
        out ($FE),a
        ld b,c
.w:
        djnz .w
        dec de
        ld b,a
        ld a,d
        or e
        ld a,b
        jr nz,.l
        and $EF
        out ($FE),a
        ret

; numéro GB, période, nombre de demi-périodes (16 bits)
sfx_table:
        db $03, 90
        dw 16
        db $04, 120
        dw 10
        db $05, 200
        dw 6
        db $06, 40
        dw 40
        db $07, 40
        dw 40
        db $0C, 0
        dw 40
        db $0D, 150
        dw 20
        db $25, 0
        dw 250
        db $29, 60
        dw 30
        db $31, 60
        dw 30
        db 0
