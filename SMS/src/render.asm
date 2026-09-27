; ===========================================================================
; render.asm - décor du stade et sprites (joueurs, balle, ombre, marque)
;
; Comme les routines d'affichage de la ROM ($486F, $4A90, $1B50), avec la
; projection du jeu réécrite en Z80 natif (proj.asm). L'écran montre le stade
; GB à partir de la rangée 2 : x écran = x GB, y écran = y GB - 16.
;
; prepare_all remplit sat_y / sat_xn (table des sprites, envoyée par
; l'interruption) et demande la recopie des motifs d'un objet quand son image
; change (up_img). Recopier une image coûte 64 octets par sprite 8x16 : au
; plus UPLOAD_MAX octets par trame (le retour de trame est court). Au-delà,
; l'objet garde son image précédente une trame de plus.
; Sprites : 8 au plus par ligne. Balle et ombre passent en premier (toujours
; visibles) ; l'ordre des joueurs et de leurs sprites s'inverse à chaque trame,
; pour qu'un dépassement clignote au lieu de faire disparaître toujours le
; même morceau.
; ===========================================================================

OBJ_BALL    equ 0
OBJ_SHADOW  equ 1
OBJ_MARK    equ 2
OBJ_P1      equ 3
OBJ_P2      equ 4
NOBJ        equ 5
SPR_P2      equ 20              ; images : 0-19 J1, 20-39 J2, 40-42 balle, 43 ombre, 44 marque
SPR_BALL    equ 40
SPR_SHADOW  equ 43
SPR_MARK    equ 44
UPLOAD_MAX  equ 512             ; octets de motifs recopiés par trame, au plus

; première tuile (depuis la tuile 256) des motifs de chaque objet
; (joueurs : 6 sprites 8x16 au plus = 12 tuiles)
obj_slot:   db 24, 26, 28, 0, 12

; --- Décor (écran éteint) ------------------------------------------------------------
court_screen:
        call screen_off
        ld hl,court_tiles
        ld de,VR_TILES
        ld bc,COURT_NT * 32
        call bank_write
        call load_font
        ld hl,VR_NAME
        call vdp_waddr
        ld hl,court_map
        ld bc,32 * 24 * 2
.m:
        ld a,(hl)
        out (VDP_DATA),a
        inc hl
        dec bc
        ld a,b
        or c
        jr nz,.m
        call no_sprites
        call spr_reset
        jp screen_on

; Aucun objet affiché, toutes les images à recopier
spr_reset:
        ld hl,cur_img
        ld b,NOBJ
.c:
        ld (hl),$FE
        inc hl
        djnz .c
        ld b,NOBJ                   ; up_img suit cur_img
.u:
        ld (hl),$FF
        inc hl
        djnz .u
        xor a
        ld (sat_n),a
        ret

; --- Sprites d'une trame -------------------------------------------------------------
prepare_all:
        ld hl,UPLOAD_MAX
        ld (up_budget),hl
        xor a
        ld (sat_n),a
        ld a,(frames)
        and 1
        ld (spr_dir),a
        ; balle et ombre ($1B50)
        ld a,(B_ST)
        or a
        jr z,.mark
        ld hl,B_Y
        call proj
        push bc                     ; ombre : au sol
        call lift                   ; balle : moins la hauteur ($09C2)
        ld a,(B_Z)                  ; taille : hauteur < $40, < $60, sinon grande
        ld e,SPR_BALL
        cp $40
        jr c,.sz
        inc e
        cp $60
        jr c,.sz
        inc e
.sz:
        ld a,OBJ_BALL
        call put_obj
        pop bc
        ld e,SPR_SHADOW
        ld a,OBJ_SHADOW
        call put_obj
.mark:
        ; marque de rebond ($0951)
        ld a,(B_MARK)
        or a
        jr z,.pl
        ld hl,B_MARKY
        call proj_mark
        ld e,SPR_MARK
        ld a,OBJ_MARK
        call put_obj
.pl:
        ld a,(spr_dir)
        or a
        jr nz,.p21
        call put_p1
        jp put_p2
.p21:
        call put_p2
        jp put_p1

; joueur 1 ($486F) : invisible si (état AND 3) = 0
put_p1:
        ld a,(P1_STATE)
        and 3
        ret z
        ld hl,P1_Y
        call proj
        ld a,(P1_FRAME)
        ld e,a
        ld a,OBJ_P1
        jr put_obj

; joueur 2 ($4A90)
put_p2:
        ld a,(P2_STATE)
        and 3
        ret z
        ld hl,P2_Y
        call proj
        ld a,(P2_FRAME)
        add a,SPR_P2
        ld e,a
        ld a,OBJ_P2
        ; (suite dans put_obj)

; A = objet, E = image, B = y GB, C = x GB (point d'ancrage)
put_obj:
        ld (po_obj),a
        ld l,b                      ; y écran = y GB - 16
        ld h,0
        ld a,c
        ld bc,-16
        add hl,bc
        ld (po_y),hl
        ld l,a
        ld h,0
        ld (po_x),hl
        ld a,(po_obj)               ; image affichée de l'objet
        ld hl,cur_img
        add a,l
        ld l,a
        adc a,h
        sub l
        ld h,a
        ld a,(hl)
        cp e
        jr z,.draw
        push hl                     ; image changée : motifs à recopier, si le budget le permet
        call img_rec
        ld a,(hl)                   ; n sprites x 64 octets
        rrca
        rrca
        ld d,a
        and $C0
        ld c,a
        ld a,d
        and $3F
        ld b,a
        ld hl,(up_budget)
        or a
        sbc hl,bc
        jr c,.keep
        ld (up_budget),hl
        pop hl
        ld (hl),e
        ld a,l                      ; up_img suit cur_img
        add a,NOBJ
        ld l,a
        adc a,h
        sub l
        ld h,a
        ld (hl),e
        jr .draw
.keep:
        pop hl
        ld e,(hl)                   ; plus de budget : l'image précédente
        ld a,e
        cp $FE
        ret z                       ; (aucune encore : pas affiché)
.draw:
        ld a,(po_obj)               ; 1re tuile de l'objet
        ld hl,obj_slot
        add a,l
        ld l,a
        adc a,h
        sub l
        ld h,a
        ld a,(hl)
        ld (po_pat),a
        call img_rec
        ld a,(hl)                   ; nombre de sprites
        or a
        ret z
        ld (po_n),a
        inc hl                      ; page, motifs
        inc hl
        inc hl
        inc hl
        ld (po_base),hl
        ld a,(spr_dir)              ; sens de parcours : k croissant ou décroissant
        or a
        ld a,0
        jr z,.k
        ld a,(po_n)
        dec a
.k:
        ld (po_k),a
.each:
        ld a,(po_k)                 ; HL = sprite k (2 octets)
        add a,a
        ld l,a
        ld h,0
        ld de,(po_base)
        add hl,de
        call put_spr
        ld a,(spr_dir)
        or a
        ld a,(po_k)
        jr nz,.dec
        inc a
        jr .nx
.dec:
        dec a
.nx:
        ld (po_k),a
        ld hl,po_n
        dec (hl)
        jr nz,.each
        ret

; E = image -> HL = sa description (n, page, motifs, n x (dx, dy))
img_rec:
        push de
        ld l,e
        ld h,0
        add hl,hl
        ld de,spr_img
        add hl,de
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        pop de
        ret

; HL = sprite (dx, dy) de l'objet en cours, po_k = son rang
; -> une entrée de plus dans sat_y / sat_xn, s'il est visible
put_spr:
        ld a,(sat_n)
        cp SAT_MAX
        ret nc
        ld a,(hl)                   ; x = ancrage + dx
        inc hl
        ld e,a
        add a,a
        sbc a,a
        ld d,a
        push hl
        ld hl,(po_x)
        add hl,de
        ld a,h
        or a
        jr nz,.skip                 ; hors de l'écran (x < 0 ou x > 255)
        ld a,l
        ld (ps_x),a
        pop hl
        ld a,(hl)                   ; y = ancrage + dy
        ld e,a
        add a,a
        sbc a,a
        ld d,a
        ld hl,(po_y)
        add hl,de
        ld a,h
        or a
        jr nz,.neg
        ld a,l
        cp 192
        ret nc                      ; sous l'écran
        jr .yok
.neg:
        inc a
        ret nz
        ld a,l
        cp $F1                      ; y >= -15 : en partie visible
        ret c
.yok:
        dec l                       ; le VDP affiche le sprite à la ligne Y + 1
        ld a,(sat_n)
        ld e,a
        ld d,0
        ld a,l
        ld hl,sat_y
        add hl,de
        ld (hl),a
        ld hl,sat_xn
        add hl,de
        add hl,de
        ld a,(ps_x)
        ld (hl),a
        inc hl
        ld a,(po_k)                 ; tuile = 1re tuile de l'objet + 2k
        add a,a
        ld d,a
        ld a,(po_pat)
        add a,d
        ld (hl),a
        ld hl,sat_n
        inc (hl)
        ret
.skip:
        pop hl
        ret
