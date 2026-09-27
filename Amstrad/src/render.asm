; ===========================================================================
; render.asm - affichage des joueurs, de la balle, de l'ombre et de la marque
;
; Comme les routines d'affichage de la ROM ($486F, $4A90, $1B50), avec la
; projection du jeu réécrite en Z80 natif (proj.asm) : position GB = projection
; + décalage de l'image. Le CPC montre tout le stade : position à l'écran =
; position GB + décalage fixe (colonnes 4-35, rangée GB 2 en haut).
; ===========================================================================

SCR_X0      equ 32              ; x écran = x GB + 32
SCR_Y0      equ 16              ; y écran = y GB - 16

; B = y GB, C = x GB, A = emplacement, E = image -> spr_prepare
prepare_at:
        push af
        ld l,b
        ld h,0
        push de
        ld de,-SCR_Y0
        add hl,de
        pop de
        push hl
        ld l,c
        ld h,0
        ld bc,SCR_X0
        add hl,bc
        ld b,h
        ld c,l
        pop hl
        pop af
        jp spr_prepare

prepare_all:
        ; joueur 2 ($4A90) : invisible si (état AND 3) = 0
        ld a,(P2_STATE)
        and 3
        jr nz,.p2
        ld a,S_P2
        call spr_hide
        jr .p1
.p2:
        ld hl,P2_Y
        call proj
        ld a,(P2_FRAME)
        add a,SPR_P2
        ld e,a
        ld a,S_P2
        call prepare_at
.p1:
        ; joueur 1 ($486F)
        ld a,(P1_STATE)
        and 3
        jr nz,.p1v
        ld a,S_P1
        call spr_hide
        jr .ball
.p1v:
        ld hl,P1_Y
        call proj
        ld a,(P1_FRAME)
        ld e,a
        ld a,S_P1
        call prepare_at
.ball:
        ; balle et ombre ($1B50)
        ld a,(B_ST)
        or a
        jr nz,.bvis
        ld a,S_BALL
        call spr_hide
        ld a,S_SHADOW
        call spr_hide
        jr .mark
.bvis:
        ld hl,B_Y
        call proj
        push bc
        ld e,SPR_SHADOW             ; ombre : au sol
        ld a,S_SHADOW
        call prepare_at
        pop bc
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
        ld a,S_BALL
        call prepare_at
.mark:
        ; marque de rebond ($0951)
        ld a,(B_MARK)
        or a
        jr nz,.mvis
        ld a,S_MARK
        jp spr_hide
.mvis:
        ld hl,B_MARKY
        call proj_mark
        ld e,SPR_MARK
        ld a,S_MARK
        jp prepare_at
