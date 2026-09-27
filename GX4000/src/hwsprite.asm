; ===========================================================================
; hwsprite.asm - sprites matériels de l'ASIC (CPC Plus / GX4000)
;
; 16 sprites de 16x16 pixels en 15 couleurs, sans aucun dessin par le
; processeur : plus de XOR, plus de clignotement, couleurs exactes.
; Agrandissement horizontal x2 (MAG = %1001) : un pixel de sprite = un
; pixel du mode 1 (coordonnée X de l'ASIC en pixels du mode 2).
;
; Objets -> sprites ASIC (le plus petit numéro passe devant) :
;   balle : 0        joueur 1 : 1-4 (image 32x32 : 4 sprites)
;   joueur 2 : 5-8   ombre : 9       marque : 10
;   arbitre (Mario, posé sur son dessin du décor pour le colorer) : 11-14
; hw_prepare (après la logique) retient l'image et la place ; hw_commit
; (juste après le VSYNC) recopie les images qui ont changé depuis la
; cartouche (ROM haute, page de l'image) vers l'ASIC, puis écrit les places.
; Registres de l'ASIC, visibles en $4000-$7FFF quand RMR2 = $B8 :
;   $4000 + 256 x n : pixels du sprite n ; $6000 + 8 x n : X, Y (16 bits), MAG ;
;   $6400 : palette (2 octets par encre : %RRRRBBBB, %0000GGGG).
; ===========================================================================

OBJ_BALL    equ 0
OBJ_P1      equ 1
OBJ_P2      equ 2
OBJ_SHADOW  equ 3
OBJ_MARK    equ 4
OBJ_UMPIRE  equ 5
NOBJ        equ 6

SPR_P1      equ 0               ; numéros d'images (gfx/plus_sprites.asm)
SPR_P2      equ 20
SPR_BALL    equ 40
SPR_SHADOW  equ 43
SPR_MARK    equ 44
SPR_UMPIRE  equ 45


rmr2:       db ASIC_OFF
GA_UROM     equ %10000101       ; mode 1, ROM basse coupée, ROM haute visible
MAG_X2      equ %00001001       ; X x2, Y x1

obj_first:  db 0, 1, 5, 9, 10, 11 ; premier sprite ASIC de l'objet
obj_count:  db 1, 4, 4, 1, 1, 4   ; nombre de sprites
obj_on:     ds NOBJ             ; à afficher
obj_img:    ds NOBJ             ; image voulue
obj_cur:    ds NOBJ             ; image présente dans l'ASIC ($FF : aucune)
obj_x:      ds 2 * NOBJ         ; X ASIC (pixels du mode 2) du coin haut-gauche
obj_y:      ds 2 * NOBJ         ; Y (lignes)

hw_init:
        ld hl,obj_on
        ld b,NOBJ
.a:
        ld (hl),0
        inc hl
        djnz .a
        ld hl,obj_cur
        ld b,NOBJ
.b:
        ld (hl),$FF
        inc hl
        djnz .b
        ret

; A = objet
hw_hide:
        ld e,a
        ld d,0
        ld hl,obj_on
        add hl,de
        ld (hl),0
        ret

; A = objet, E = image, HL = ancrage y (lignes écran, signé), BC = ancrage x
; (pixels du mode 1)
hw_prepare:
        push hl
        push bc
        ld (.o),a
        ld l,a
        ld h,0
        push de
        ld de,obj_on
        add hl,de
        ld (hl),1
        pop de
        ld a,(.o)                   ; image voulue
        ld l,a
        ld h,0
        push de
        ld de,obj_img
        add hl,de
        pop de
        ld (hl),e
        ld d,0                      ; x = (ancrage + x0) x 2
        ld hl,img_x0
        add hl,de
        ld a,(hl)
        ld l,a
        rla
        sbc a,a
        ld h,a
        pop bc
        add hl,bc
        add hl,hl
        push hl
        ld a,(.o)
        add a,a
        ld c,a
        ld b,0
        ld hl,obj_x
        add hl,bc
        pop bc
        ld (hl),c
        inc hl
        ld (hl),b
        ld hl,img_y0                ; y = ancrage + y0
        add hl,de
        ld a,(hl)
        ld l,a
        rla
        sbc a,a
        ld h,a
        pop bc
        add hl,bc
        push hl
        ld a,(.o)
        add a,a
        ld c,a
        ld b,0
        ld hl,obj_y
        add hl,bc
        pop bc
        ld (hl),c
        inc hl
        ld (hl),b
        ret
.o:     db 0

; Juste après le VSYNC : images qui ont changé, puis places de tous les sprites
hw_commit:
        xor a
.up:
        ld (.o),a
        ld e,a
        ld d,0
        ld hl,obj_on
        add hl,de
        ld a,(hl)
        or a
        jr z,.nu
        ld hl,obj_img
        add hl,de
        ld a,(hl)
        ld hl,obj_cur
        add hl,de
        cp (hl)
        jr z,.nu
        ld (hl),a                   ; nouvelle image : la recopier dans l'ASIC
        ld c,a
        ld a,(.o)
        call upload
.nu:
        ld a,(.o)
        inc a
        cp NOBJ
        jr c,.up
        ASIC_MAP                    ; places
        xor a
.pos:
        ld (.o),a
        ld e,a
        ld d,0
        ld hl,obj_first
        add hl,de
        ld a,(hl)
        ld (.s),a
        ld hl,obj_count
        add hl,de
        ld a,(hl)
        ld (.n),a
        ld hl,obj_on
        add hl,de
        ld a,(hl)
        or a
        jr z,.hide
        ld hl,obj_x                 ; X, Y du coin haut-gauche
        add hl,de
        add hl,de
        ld c,(hl)
        inc hl
        ld b,(hl)
        ld (.x),bc
        ld hl,obj_y
        add hl,de
        add hl,de
        ld c,(hl)
        inc hl
        ld b,(hl)
        ld (.y),bc
        xor a                       ; k = 0..n-1 : décalage (k AND 1) x 32, (k / 2) x 16
.k:
        ld (.kk),a
        call .attr                  ; HL = attributs du sprite (.s)
        ld a,(.kk)
        and 1
        ld de,(.x)
        jr z,.x0
        ld a,e
        add a,32
        ld e,a
        jr nc,.x0
        inc d
.x0:
        ld (hl),e
        inc hl
        ld (hl),d
        inc hl
        ld a,(.kk)
        and 2
        ld de,(.y)
        jr z,.y0
        ld a,e
        add a,16
        ld e,a
        jr nc,.y0
        inc d
.y0:
        ld (hl),e
        inc hl
        ld (hl),d
        inc hl
        ld (hl),MAG_X2
        ld a,(.s)
        inc a
        ld (.s),a
        ld a,(.kk)
        inc a
        ld hl,.n
        cp (hl)
        jp c,.k
        jr .next
.hide:
        call .attr                  ; objet caché : MAG = 0
        ld de,4
        add hl,de
        ld (hl),0
        ld a,(.s)
        inc a
        ld (.s),a
        ld hl,.n
        dec (hl)
        jr nz,.hide
.next:
        ld a,(.o)
        inc a
        cp NOBJ
        jp c,.pos
        ASIC_UNMAP
        ret
; HL = $6000 + 8 x (.s)
.attr:
        ld a,(.s)
        ld l,a
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        ld de,$6000
        add hl,de
        ret
.o:     db 0
.s:     db 0
.n:     db 0
.kk:    db 0
.x:     dw 0
.y:     dw 0

; A = objet, C = image : recopie ses sprites (256 octets chacun) depuis la
; cartouche (page de l'image, vue en ROM haute) vers l'ASIC
upload:
        ld e,a
        ld d,0
        ld hl,obj_first
        add hl,de
        ld a,(hl)                   ; destination : $4000 + 256 x premier sprite
        add a,$40
        ld (.dst+2),a
        ld hl,obj_count
        add hl,de
        ld a,(hl)                   ; longueur : 256 x nombre
        ld (.len+2),a
        ld e,c
        ld hl,img_page
        add hl,de
        ld a,(hl)
        or $80                      ; ROM haute = page de cartouche
        ld c,a
        ld b,$DF
        out (c),c
        ld hl,img_addr
        add hl,de
        add hl,de
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        ld bc,$7F00 + GA_UROM
        out (c),c
        ASIC_MAP
.dst:   ld de,$4000                 ; (octet haut modifié)
.len:   ld bc,$0100                 ; (octet haut modifié)
        ld c,0
        ldir
        ASIC_UNMAP
        ld bc,$7F00 + GA_MODE1      ; ROM coupées
        out (c),c
        ret

; Palette de l'ASIC : A = première encre, HL = couleurs (2 octets), B = nombre
set_pens:
        push af
        push bc
        push hl
        ASIC_MAP
        pop hl
        pop bc
        pop af
        add a,a
        ld e,a
        ld d,$64
        ld a,b
        add a,a
        ld c,a
        ld b,0
        ldir
        ASIC_UNMAP
        ret
