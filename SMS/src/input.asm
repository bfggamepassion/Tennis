; ===========================================================================
; input.asm - manette 1 de la Master System -> joypad GB
;
; Port $DC (bits à 0 = appuyé) : bits 0-3 haut, bas, gauche, droite ;
; bit 4 bouton 1, bit 5 bouton 2.
;   bouton 1 = bouton A du GB : frapper (et servir) ;
;   bouton 2 = bouton B du GB : lob.
; Octet GB : bit0 A, bit1 B, bit4 droite, bit5 gauche, bit6 haut, bit7 bas.
; ===========================================================================

; Sortie : A = joypad GB, directions opposées annulées ($2225)
read_pad:
        in a,(PORT_AB)
        cpl
        ld c,a
        and $0F
        ld l,a
        ld h,0
        ld de,joy_map
        add hl,de
        ld e,(hl)
        bit 4,c                     ; bouton 1 : frapper
        jr z,.n1
        set 0,e
.n1:
        bit 5,c                     ; bouton 2 : lob
        jr z,.n2
        set 1,e
.n2:
        ld a,e                      ; directions opposées annulées
        and $C0
        cp $C0
        jr nz,.v
        ld a,e
        and $3F
        ld e,a
.v:
        ld a,e
        and $30
        cp $30
        jr nz,.h
        ld a,e
        and $CF
        ld e,a
.h:
        ld a,e
        ret

; manette bits 0-3 (haut bas gauche droite) -> joypad GB
joy_map:
        db $00, $40, $80, $C0, $20, $60, $A0, $E0
        db $10, $50, $90, $D0, $30, $70, $B0, $F0
