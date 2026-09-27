; ===========================================================================
; projection.asm - projection coordonnées de court -> écran (utilisée à
; chaque image : placée en mémoire non ralentie)
;
; Repère de court = repère GB (cf. re/FICHE_JEU.md §5) : X $08-$D0 (centre
; $6C), Y $08-$E7 (filet $78). Projection GB ($095D) :
;   x = X -+ dx*dx*dy/73728   (dx = |X-$6C|, dy = |$B8-Y|), y = 28 + Y*40/47
; Spectrum : même forme, mise à l'échelle pour 256x192 :
;   sx = 128 -+ 1,25*(dx -+ décalage)       sy = 16 + 0,8*(Y - 8)
; ===========================================================================

; Entrée : D = Y, E = X (octets hauts). Sortie : B = y écran, C = x écran.
project:
        ld a,d
        ld (pj_y),a
        ld a,e
        ld (pj_x),a
        ld a,(pj_y)
        ld c,0                      ; C = 1 si derrière la ligne de fond basse
        sub $B8
        jr nc,.behind
        neg
        jr .dy
.behind:
        ld c,1
.dy:
        ld (pj_ddy),a
        ld a,(pj_x)
        ld b,0                      ; B = 1 si à droite du centre
        sub $6C
        jr nc,.right
        neg
        jr .dx
.right:
        ld b,1
.dx:
        ld (pj_ddx),a
        push bc
        ld e,a
        call mul8                   ; HL = dx*dx
        ld a,h                      ; t = (dx*dx) >> 8
        ld hl,pj_ddy
        ld e,(hl)
        call mul8                   ; HL = t*dy
        srl h                       ; décalage = ((u >> 3) * 57) >> 11
        rr l
        srl h
        rr l
        srl h
        rr l
        ld d,h
        ld e,l
        add hl,hl
        add hl,hl
        add hl,hl
        push hl
        add hl,hl
        add hl,hl
        add hl,hl
        pop bc
        or a
        sbc hl,bc
        add hl,de
        ld a,h
        srl a
        srl a
        srl a
        pop bc
        ld e,a                      ; E = décalage
        ld a,(pj_ddx)
        bit 0,c
        jr nz,.wide
        sub e                       ; devant : vers le centre
        jr nc,.s
        xor a
        jr .s
.wide:
        add a,e                     ; derrière : vers l'extérieur
        jr nc,.s
        ld a,$FF
.s:
        ld l,a                      ; s = a * 1,25
        ld h,0
        srl a
        srl a
        ld e,a
        ld d,0
        add hl,de
        bit 0,b
        jr z,.left
        ld de,128
        add hl,de
        ld a,h
        or a
        ld a,l
        jr z,.xok
        ld a,255
        jr .xok
.left:
        ex de,hl
        ld hl,128
        or a
        sbc hl,de
        ld a,l
        jr nc,.xok
        xor a
.xok:
        ld c,a
        ld a,(pj_y)                 ; sy = 16 + ((Y-8)*205) >> 8
        sub 8
        jr nc,.y0
        xor a
.y0:
        ld e,205
        push bc
        call mul8
        pop bc
        ld a,h
        add a,16
        ld b,a
        ret

; HL = A * E (non signé)
mul8:
        ld h,a
        ld l,0
        ld d,0
        ld b,8
.l:
        add hl,hl
        jr nc,.n
        add hl,de
.n:
        djnz .l
        ret

pj_x:   db 0
pj_y:   db 0
pj_ddx: db 0
pj_ddy: db 0

