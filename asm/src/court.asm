; ===========================================================================
; court.asm - dessin du court et du décor (public, arbitre)
;
; Tracé une seule fois au début du match (zone mémoire lente $6000-$7FFF).
; La projection est dans projection.asm.
; ===========================================================================

; --- Tracé ---------------------------------------------------------------------

; Allume le pixel (C = x, B = y)
plot:
        ld a,b
        cp 192
        ret nc
        and 7
        or $40
        ld h,a
        ld a,b
        rra
        rra
        rra
        and $18
        or h
        ld h,a
        ld a,b
        rla
        rla
        and $E0
        ld l,a
        ld a,c
        rra
        rra
        rra
        and $1F
        or l
        ld l,a
        ld a,c
        and 7
        ld b,a
        ld a,$80
        jr z,.set
.sh:
        rrca
        djnz .sh
.set:
        or (hl)
        ld (hl),a
        ret

; Segment de (ln_x1, ln_y1) à (ln_x2, ln_y2), algorithme de Bresenham
line:
        ld a,(ln_x2)
        ld hl,ln_x1
        sub (hl)
        ld c,1                      ; pas en x
        jr nc,.dxp
        neg
        ld c,-1
.dxp:
        ld (ln_dx),a
        ld a,c
        ld (ln_sx),a
        ld a,(ln_y2)
        ld hl,ln_y1
        sub (hl)
        ld c,1
        jr nc,.dyp
        neg
        ld c,-1
.dyp:
        ld (ln_dy),a
        ld a,c
        ld (ln_sy),a
        ; err = dx - dy (16 bits signés)
        ld a,(ln_dx)
        ld l,a
        ld h,0
        ld a,(ln_dy)
        ld e,a
        ld d,0
        or a
        sbc hl,de
        ld (ln_err),hl
.loop:
        ld a,(ln_x1)
        ld c,a
        ld a,(ln_y1)
        ld b,a
        call plot
        ld a,(ln_x1)
        ld hl,ln_x2
        cp (hl)
        jr nz,.step
        ld a,(ln_y1)
        ld hl,ln_y2
        cp (hl)
        ret z
.step:
        ld hl,(ln_err)
        add hl,hl                   ; e2 = 2*err
        push hl
        ; si e2 > -dy : err -= dy, x += sx
        ld a,(ln_dy)
        ld e,a
        ld d,0
        add hl,de                   ; e2 + dy > 0 ?
        bit 7,h
        jr nz,.noX
        ld a,h
        or l
        jr z,.noX
        ld hl,(ln_err)
        or a
        sbc hl,de
        ld (ln_err),hl
        ld a,(ln_sx)
        ld hl,ln_x1
        add a,(hl)
        ld (hl),a
.noX:
        pop hl
        ; si e2 < dx : err += dx, y += sy
        ld a,(ln_dx)
        ld e,a
        ld d,0
        or a
        sbc hl,de                   ; e2 - dx < 0 ?
        bit 7,h
        jr z,.loop
        ld hl,(ln_err)
        add hl,de
        ld (ln_err),hl
        ld a,(ln_sy)
        ld hl,ln_y1
        add a,(hl)
        ld (hl),a
        jr .loop

ln_x1:  db 0
ln_y1:  db 0
ln_x2:  db 0
ln_y2:  db 0
ln_dx:  db 0
ln_dy:  db 0
ln_sx:  db 0
ln_sy:  db 0
ln_err: dw 0

; Segment entre deux points du court : (D, E) -> (H, L) en (Y, X) de court
court_line:
        push hl
        call project
        ld a,c
        ld (ln_x1),a
        ld a,b
        ld (ln_y1),a
        pop de
        call project
        ld a,c
        ld (ln_x2),a
        ld a,b
        ld (ln_y2),a
        jp line

CX       equ $6C
NETY     equ $78
BASEFAR  equ $37
BASENEAR equ $B8
SERVFAR  equ $55
SERVNEAR equ $9A
SGLHALF  equ 54
DBLHALF  equ 64

; Lignes du court : (Y1, X1, Y2, X2)
court_lines:
        db BASEFAR,  CX-DBLHALF, BASEFAR,  CX+DBLHALF   ; lignes de fond
        db BASENEAR, CX-DBLHALF, BASENEAR, CX+DBLHALF
        db BASEFAR,  CX-DBLHALF, BASENEAR, CX-DBLHALF   ; couloirs (double)
        db BASEFAR,  CX+DBLHALF, BASENEAR, CX+DBLHALF
        db BASEFAR,  CX-SGLHALF, BASENEAR, CX-SGLHALF   ; simple
        db BASEFAR,  CX+SGLHALF, BASENEAR, CX+SGLHALF
        db SERVFAR,  CX-SGLHALF, SERVFAR,  CX+SGLHALF   ; lignes de service
        db SERVNEAR, CX-SGLHALF, SERVNEAR, CX+SGLHALF
        db SERVFAR,  CX,         SERVNEAR, CX           ; ligne médiane
        db BASEFAR,  CX,         BASEFAR+3, CX          ; marques centrales
        db BASENEAR-3, CX,       BASENEAR, CX
        db 0

draw_court:
        ld ix,court_lines
.next:
        ld a,(ix+0)
        or a
        jr z,draw_net
        ld d,a
        ld e,(ix+1)
        ld h,(ix+2)
        ld l,(ix+3)
        call court_line
        ld bc,4
        add ix,bc
        jr .next

; Filet : câble (2 lignes), maillage un pixel sur deux, bas, poteaux
draw_net:
        ld de,NETY*256 + CX-DBLHALF-4
        call project
        ld a,c
        ld (net_x1),a
        ld a,b
        ld (net_y),a
        ld de,NETY*256 + CX+DBLHALF+4
        call project
        ld a,c
        ld (net_x2),a
        ld a,(net_y)
        sub 6
        call net_hline
        ld a,(net_y)
        sub 5
        call net_hline
        ld a,(net_y)
        call net_hline
        ; maillage : lignes y-4, y-2 (décalée), y
        ld a,(net_y)
        sub 4
        ld e,0
        call net_mesh
        ld a,(net_y)
        sub 2
        ld e,1
        call net_mesh
        ; poteaux : 9 pixels de haut
        ld a,(net_x1)
        call net_post
        ld a,(net_x2)
        jp net_post

net_hline:
        ld (ln_y1),a
        ld (ln_y2),a
        ld a,(net_x1)
        ld (ln_x1),a
        ld a,(net_x2)
        ld (ln_x2),a
        jp line

; A = y, E = décalage (0/1) : un pixel sur deux
net_mesh:
        ld b,a
        ld a,(net_x1)
        add a,e
        ld c,a
.p:
        push bc
        call plot
        pop bc
        inc c
        inc c
        ld a,(net_x2)
        cp c
        jr nc,.p
        ret

net_post:
        ld (ln_x1),a
        ld (ln_x2),a
        ld a,(net_y)
        sub 8
        ld (ln_y1),a
        ld a,(net_y)
        inc a
        ld (ln_y2),a
        jp line

net_x1: db 0
net_x2: db 0
net_y:  db 0

; --- Décor : public et arbitre (gfx/scenery.asm, tiré des tuiles de la ROM) -------
; Pour chaque bloc : pixels, attributs (un par case), ligne, colonne, hauteur,
; largeur (en cases).
draw_scenery:
        ld ix,scenery_table
.block:
        ld l,(ix+0)
        ld h,(ix+1)
        ld a,h
        or l
        ret z
        ld (sc_src),hl
        ld l,(ix+2)
        ld h,(ix+3)
        ld (sc_attr),hl
        ld b,(ix+4)                 ; ligne (cases)
        ld c,(ix+5)                 ; colonne
        ld a,(ix+6)
        ld (sc_h),a
        ld a,(ix+7)
        ld (sc_w),a
        ; attributs
        push bc
        ld l,b
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl                   ; ligne * 32
        ld e,c
        ld d,0
        add hl,de
        ld de,ATTRS
        add hl,de
        ex de,hl                    ; DE = premier attribut à l'écran
        ld hl,(sc_attr)
        ld a,(sc_h)
        ld b,a
.arow:
        push bc
        push de
        ld a,(sc_w)
        ld c,a
        ld b,0
        ldir
        pop de
        ex de,hl
        ld bc,32
        add hl,bc
        ex de,hl
        pop bc
        djnz .arow
        pop bc
        ; pixels : 8 lignes par rangée de cases
        ld hl,(sc_src)
        ld a,(sc_h)
        ld e,a
.crow:
        push de
        push bc
        call text_at                ; adresse écran de (ligne B, colonne C)
        ld de,(txt_pos)
        ld c,8
.prow:
        push de
        ld a,(sc_w)
        ld b,a
.pcol:
        ld a,(hl)
        ld (de),a
        inc hl
        inc e
        djnz .pcol
        pop de
        inc d
        dec c
        jr nz,.prow
        pop bc
        pop de
        inc b
        dec e
        jr nz,.crow
        ld de,8
        add ix,de
        jp .block

sc_src:  dw 0
sc_attr: dw 0
sc_h:    db 0
sc_w:    db 0
