; ===========================================================================
; render.asm - affichage des objets GB (joueurs, balle, ombre, marque)
; Reprend la logique d'affichage de la ROM, avec le moteur de sprites Spectrum :
;   $486F / $4A90 : joueur, invisible si (état AND 3) = 0 ; image = $C001/$C021
;   $1B50 : balle (taille selon la hauteur), ombre au sol, marque de rebond
;   $09C2 : hauteur de la balle à l'écran
;   $0951 : position de la marque (Y - 1 devant le filet)
; ===========================================================================

; Octet haut arrondi de la valeur 16 bits en (HL) : A = (v + $80) >> 8
round_hi:
        ld a,(hl)
        add a,$80
        inc hl
        ld a,(hl)
        adc a,0
        ret

; Projette l'objet dont Y (8.8) est en HL (X suit) -> B = y, C = x écran
project_obj:
        push hl
        call round_hi
        ld d,a
        pop hl
        inc hl
        inc hl
        call round_hi
        ld e,a
        jp project

; A = slot, E = sprite, B = y écran, C = x écran
prepare_at:
        ld l,b
        ld h,0
        jp spr_prepare

prepare_all:
        call prepare_p2
        call prepare_p1
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
        call project_obj
        ld (ball_scr),bc
        ld e,SPR_SHADOW
        ld a,S_SHADOW
        call prepare_at
        ; taille : hauteur < $40, < $60, sinon grande
        ld a,(B_Z)
        ld e,SPR_BALL
        cp $40
        jr c,.sz
        inc e
        cp $60
        jr c,.sz
        inc e
.sz:
        push de
        call ball_lift
        ld e,a
        ld d,0
        ld bc,(ball_scr)
        ld l,b
        ld h,0
        or a
        sbc hl,de                   ; y écran - hauteur (peut être négatif)
        pop de
        ld a,S_BALL
        call spr_prepare
.mark:
        ; marque de rebond ($0951)
        ld a,(B_MARK)
        or a
        jr nz,.mvis
        ld a,S_MARK
        jp spr_hide
.mvis:
        ld a,(B_MARKY+1)
        cp $78
        jr nc,.my
        dec a
.my:
        ld d,a
        ld a,(B_MARKX+1)
        ld e,a
        call project
        ld e,SPR_MARK
        ld a,S_MARK
        jp prepare_at

ball_scr:     dw 0

; joueur 2 ($4A90) : invisible si (état AND 3) = 0
prepare_p2:
        ld a,(P2_STATE)
        and 3
        jr nz,.p2
        ld a,S_P2
        jp spr_hide
.p2:
        ld hl,P2_Y
        call project_obj
        ld a,(P2_FRAME)
        add a,SPR_P2
        ld e,a
        ld a,S_P2
        jp prepare_at

; joueur 1 ($486F)
prepare_p1:
        ld a,(P1_STATE)
        and 3
        jr nz,.p1
        ld a,S_P1
        jp spr_hide
.p1:
        ld hl,P1_Y
        call project_obj
        ld a,(P1_FRAME)
        ld e,a
        ld a,S_P1
        jp prepare_at

; $09C2 : hauteur de la balle à l'écran (pixels GB), mise à l'échelle Spectrum
ball_lift:
        ld a,(B_Z)
        ld l,a
        ld a,(B_ST)
        cp 2
        ld a,l
        jr nz,.n
        srl a
        srl a
        srl a
        add a,l
        ld l,a
.n:
        ld a,l                      ; l = z*6/16 + 1
        ld h,0
        add hl,hl
        ld d,h
        ld e,l
        add hl,hl
        add hl,de                   ; *6
        ld a,l
        srl h
        rra
        srl h
        rra
        srl h
        rra
        srl h
        rra
        inc a
        ld l,a
        ld a,(B_Y+1)                ; moins 0 à 3 pixels vers le fond
        ld h,a
        ld a,(B_Y)
        add a,$80
        ld a,h
        adc a,0
        cp $C8
        jr nc,.done
        dec l
        jr z,.done
        cp $A8
        jr nc,.done
        dec l
        jr z,.done
        cp $78
        jr nc,.done
        dec l
.done:
        ld a,l                      ; échelle Spectrum : x 15/16
        ld h,0
        ld e,l
        ld d,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        or a
        sbc hl,de
        ld a,l
        srl h
        rra
        srl h
        rra
        srl h
        rra
        srl h
        rra
        ret

; Juste après l'interruption : effacer (ordre inverse) puis redessiner
draw_all:
        ld a,S_BALL
        call spr_restore
        ld a,S_P1
        call spr_restore
        ld a,S_P2
        call spr_restore
        ld a,S_SHADOW
        call spr_restore
        ld a,S_MARK
        call spr_restore
        ld a,S_MARK
        call spr_draw
        ld a,S_SHADOW
        call spr_draw
        ld a,S_P2
        call spr_draw
        ld a,S_P1
        call spr_draw
        ld a,S_BALL
        jp spr_draw
