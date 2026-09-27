; ===========================================================================
; menu.asm - écran de présentation et menu, à la manette
;   haut/bas : choisir la ligne (niveau, sets)
;   gauche/droite : changer la valeur
;   bouton 1 ou 2 : jouer
; Le titre est dessiné écran éteint ; les valeurs qui changent passent par
; l'interruption de trame (add_job).
; ===========================================================================

MENU_ROW    equ 15              ; 1re ligne du menu
MENU_LINES  equ 2
CURSOR_COL  equ 9
VALUE_COL   equ 21

menu:
        call screen_off
        call spr_reset
        call clear_names
        call load_font
        ld hl,title_tiles
        ld de,VR_TILES
        ld bc,TITLE_NT * 32
        call bank_write
        ld hl,title_map
        ld de,VR_NAME
        ld bc,TITLE_ROWS * 64
        call bank_write
        ld hl,menu_text             ; textes fixes : rangée, colonne, chaîne
.t:
        ld a,(hl)
        cp $FF
        jr z,.tdone
        inc hl
        ld e,(hl)                   ; HL = VR_NAME + (rangée x 32 + colonne) x 2
        inc hl
        push hl
        ld l,a
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        ld d,0
        add hl,de
        add hl,hl
        ld de,VR_NAME
        add hl,de
        call vdp_waddr
        pop hl
.c:
        ld a,(hl)
        inc hl
        or a
        jr z,.t
        add a,(FONT_TILE - 32) & $FF
        out (VDP_DATA),a
        ld a,FONT_TILE >> 8
        out (VDP_DATA),a
        jr .c
.tdone:
        call no_sprites
        call screen_on
        xor a
        ld (menu_sel),a
        ld a,$FF                    ; attendre qu'on relâche tout
        ld (menu_prev),a
        call menu_refresh
.loop:
        ld a,1
        ld (frame_ready),a
        call wait_frame
        call read_pad
        ld c,a
        ld a,(menu_prev)
        cpl
        and c                       ; B = nouvellement appuyé
        ld b,a
        ld a,c
        ld (menu_prev),a
        ld a,b
        and PAD_A | PAD_B
        jr nz,.play
        ld a,b
        and PAD_U | PAD_D           ; haut ou bas : l'autre ligne
        jr z,.nud
        ld a,(menu_sel)
        xor 1
        ld (menu_sel),a
.nud:
        ld a,b
        and PAD_L | PAD_R
        jr z,.done
        ld c,a
        ld a,(menu_sel)
        or a
        jr nz,.m1
        ld a,(W_LEVEL)              ; niveau 1-4
        bit 4,c
        jr z,.ll
        inc a
        cp 5
        jr c,.ls
        ld a,1
        jr .ls
.ll:
        dec a
        jr nz,.ls
        ld a,4
.ls:
        ld (W_LEVEL),a
        jr .done
.m1:
        ld a,(sets)                 ; 1 ou 3 sets
        xor 2
        ld (sets),a
.done:
        call menu_refresh
        jp .loop
.play:
        ret

; Curseur et valeurs -> menu_buf, envoyés par l'interruption
menu_refresh:
        ld hl,menu_buf
        ld (sb_ptr),hl
        ld a,(menu_sel)
        ld c,a
        ld b,0
.cur:
        ld a,b
        cp c
        ld a,'>'
        jr z,.on
        ld a,' '
.on:
        call sb_char
        inc b
        ld a,b
        cp MENU_LINES
        jr nz,.cur
        ld a,(W_LEVEL)
        add a,'0'
        call sb_char
        ld a,(sets)
        add a,'0'
        call sb_char
        ld hl,VR_NAME + (MENU_ROW * 32 + CURSOR_COL) * 2
        ld de,menu_buf
        ld c,0
.j:
        push bc
        push hl
        push de
        ld b,2                      ; curseur
        call add_job
        pop de
        pop hl
        push hl
        push de
        ld bc,(VALUE_COL - CURSOR_COL) * 2
        add hl,bc
        ld bc,MENU_LINES * 2
        ex de,hl
        add hl,bc
        ex de,hl
        ld b,2                      ; valeur
        call add_job
        pop de
        pop hl
        ld bc,64
        add hl,bc
        inc de
        inc de
        pop bc
        inc c
        ld a,c
        cp MENU_LINES
        jr nz,.j
        ret

;           rangée, colonne, texte
menu_text:
        db MENU_ROW, CURSOR_COL + 2, "LEVEL", 0
        db MENU_ROW + 1, CURSOR_COL + 2, "SETS", 0
        db 18, 7, "BUTTON 1 : HIT", 0
        db 19, 7, "BUTTON 2 : LOB", 0
        db 20, 7, "PAUSE    : PAUSE", 0
        db 22, 6, "PRESS BUTTON TO PLAY", 0
        db 23, 4, "BASED ON NINTENDO TENNIS", 0
        db $FF
