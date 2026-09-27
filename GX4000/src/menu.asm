; ===========================================================================
; menu.asm - écran de présentation et menu, en mode 0 (160x200, 16 couleurs)
; À la manette (la GX4000 n'a pas de clavier) : haut/bas choisit la ligne,
; gauche/droite change la valeur, tir 1 : jouer. Au clavier (6128+) :
; 1-4 niveau, S sets, B boutons, ESPACE ou RETURN : jouer.
; Titre : gfx/title.asm (tools/gen_cpctitle.py), rangées 0-13, 20 colonnes.
; Les tuiles sont au format mode 1 (4 teintes) : chaque rangée a sa palette
; de 4 encres (title_rowpal -> title_pals) ; une table CONV, construite pour
; la palette de la rangée, donne les 2 octets mode 0 de chaque octet mode 1.
; Le texte (police de la ROM) fait 20 caractères par ligne.
; ===========================================================================

CONV_L      equ $CD00           ; octet mode 1 -> octet mode 0 de gauche
CONV_R      equ $CE00           ; ... et de droite (libre après le bloc déplacé)
GA_MODE0    equ %10001100       ; mode 0, ROM coupées

; Encres du mode 0 (couleurs matérielles)
title_inks:
        db $54, $59, $52, $4B       ; 0 noir, 1 vert pâle, 2 vert vif, 3 blanc vif
        db $4C, $52, $55, $4A       ; 4 rouge vif, 5 vert vif, 6 bleu vif, 7 jaune vif
        db $53, $4E, $40, $47       ; 8 cyan vif, 9 orange, 10 blanc, 11 rose
        db $57, $43, $4D, $5A       ; 12 bleu ciel, 13 jaune pâle, 14 magenta vif, 15 citron
; palettes des rangées du titre : encre de chaque teinte GB (0 à 3)
title_pals:
        db 1, 2, 3, 0               ; 0 : bande GB (fond vert, logo blanc)
        db 0, 4, 0, 0               ; 1 : « CPC », rouge
        db 0, 5, 0, 0               ; 2 : vert
        db 0, 6, 0, 0               ; 3 : bleu
; octet mode 0 d'un pixel d'encre n, à gauche / à droite
enc_left:
        LUA ALLPASS
        for i = 0, 15 do
            _pc(string.format("db %d", ((i & 1) << 7) | ((i & 2) << 2) | ((i & 4) << 3) | ((i & 8) >> 2)))
        end
        ENDLUA
enc_right:
        LUA ALLPASS
        for i = 0, 15 do
            _pc(string.format("db %d", ((i & 1) << 6) | ((i & 2) << 1) | ((i & 4) << 2) | ((i & 8) >> 3)))
        end
        ENDLUA

menu:
        call hw_init                ; sprites matériels cachés
        call hw_commit
        call video_title
        call draw_title
        DBG $4B
        ld a,3                      ; blanc
        ld (txt_ink0),a
        ld bc,15*256 + 2
        ld hl,txt_level
        call print_at0
        ld bc,16*256 + 2
        ld hl,txt_sets
        call print_at0
        ld bc,17*256 + 2
        ld hl,txt_buttons
        call print_at0
        ld a,8                      ; cyan : commandes
        ld (txt_ink0),a
        ld bc,19*256 + 2
        ld hl,txt_ctrl1
        call print_at0
        ld bc,20*256 + 1
        ld hl,txt_ctrl2
        call print_at0
        ld a,7                      ; jaune
        ld (txt_ink0),a
        ld bc,23*256 + 1
        ld hl,txt_play
        call print_at0
        ld a,9                      ; orange
        ld (txt_ink0),a
        ld bc,24*256 + 1
        ld hl,txt_credit
        call print_at0
.show:
        ld a,7                      ; curseur (jaune) sur la ligne choisie
        ld (txt_ink0),a
        ld b,15
.cur:
        push bc
        ld c,0
        call text_at0
        pop bc
        ld a,(cursor)
        add a,15
        cp b
        ld a,'>'
        jr z,.cm
        ld a,' '
.cm:
        push bc
        call print_char0
        pop bc
        inc b
        ld a,b
        cp 18
        jr nz,.cur
        ld a,13                     ; valeurs en jaune pâle
        ld (txt_ink0),a
        ld bc,15*256 + 17
        call text_at0
        ld a,(W_LEVEL)
        add a,'0'
        call print_char0
        ld bc,16*256 + 17
        call text_at0
        ld a,(one_set)              ; 0 -> 3 sets, 1 -> 1 set
        or a
        ld a,'3'
        jr z,.s
        ld a,'1'
.s:
        call print_char0
        ld bc,17*256 + 17
        call text_at0
        ld a,(two_buttons)
        add a,'1'
        call print_char0
        ld a,8                      ; aide du lob selon le réglage
        ld (txt_ink0),a
        ld bc,21*256 + 1
        ld hl,txt_lob2
        ld a,(two_buttons)
        or a
        jr nz,.h
        ld hl,txt_lob1
.h:
        call print_at0
.rel:
        call wait_frame             ; attendre que tout soit relâché
        call menu_key
        or a
        jr nz,.rel
.wait:
        call wait_frame
        call menu_key
        or a
        jr z,.wait
        cp KEY_PLAY
        jp z,.play
        cp KEY_UP                   ; manette : ligne précédente / suivante
        jr nz,.nu
        ld a,(cursor)
        or a
        jp z,.show
        dec a
        ld (cursor),a
        jp .show
.nu:
        cp KEY_DOWN
        jr nz,.nd
        ld a,(cursor)
        cp 2
        jp z,.show
        inc a
        ld (cursor),a
        jp .show
.nd:
        cp KEY_LEFT
        jr z,.chg
        cp KEY_RIGHT
        jr nz,.keys
.chg:
        ld c,a                      ; manette : changer la valeur de la ligne
        ld a,(cursor)
        or a
        jr nz,.cs
        ld a,(W_LEVEL)              ; niveau 1-4, en boucle
        dec a
        ld b,a
        ld a,c
        cp KEY_RIGHT
        ld a,b
        jr z,.lr
        dec a
        jr .lm
.lr:
        inc a
.lm:
        and 3
        inc a
        ld (W_LEVEL),a
        jp .show
.cs:
        cp 1
        ld a,KEY_SETS
        jr z,.keys
        ld a,KEY_BUTTONS
.keys:
        cp KEY_SETS
        jr nz,.nsets
        ld a,(one_set)
        xor 1
        ld (one_set),a
        jp .show
.nsets:
        cp KEY_BUTTONS
        jr nz,.nb
        ld a,(two_buttons)
        xor 1
        ld (two_buttons),a
        jp .show
.nb:
        ld (W_LEVEL),a              ; 1 à 4
        jp .show
.play:
        call wait_frame             ; attendre le relâchement avant de jouer
        call menu_key
        or a
        jr nz,.play
        ret

KEY_SETS    equ 5
KEY_BUTTONS equ 6
KEY_PLAY    equ 7
KEY_UP      equ 8
KEY_DOWN    equ 9
KEY_LEFT    equ 10
KEY_RIGHT   equ 11
cursor:     db 0                ; ligne choisie : 0 niveau, 1 sets, 2 boutons

; Touche du menu : A = 1-4 (niveau), KEY_SETS, KEY_BUTTONS, KEY_PLAY ou 0
menu_key:
        ld hl,menu_keys
.k:
        ld a,(hl)
        cp $FF
        jr z,.none
        push hl
        call read_line
        pop hl
        inc hl
        and (hl)
        inc hl
        jr z,.hit
        inc hl
        jr .k
.hit:
        ld a,(hl)
        ret
.none:
        xor a
        ret
;               ligne, bit, code
menu_keys:  db 8, $01, 1                ; 1
            db 8, $02, 2                ; 2
            db 7, $02, 3                ; 3
            db 7, $01, 4                ; 4
            db 7, $10, KEY_SETS         ; S
            db 6, $40, KEY_BUTTONS      ; B
            db 5, $80, KEY_PLAY         ; ESPACE
            db 2, $04, KEY_PLAY         ; RETURN
            db 9, $20, KEY_PLAY         ; tir 1
            db 9, $10, KEY_PLAY         ; tir 2
            db 9, $01, KEY_UP           ; manette
            db 9, $02, KEY_DOWN
            db 9, $04, KEY_LEFT
            db 9, $08, KEY_RIGHT
            db $FF

; Mode 0 et encres du titre
video_title:
        ld bc,$7F00 + GA_MODE0
        out (c),c
        ld hl,title_inks
        ld c,0
.l:
        ld b,GA
        out (c),c
        ld a,(hl)
        out (c),a
        inc hl
        inc c
        ld a,c
        cp 16
        jr nz,.l
        ret

; Table CONV pour la palette A (index dans title_pals)
build_conv:
        add a,a
        add a,a
        ld e,a
        ld d,0
        ld hl,title_pals
        add hl,de                   ; HL = 4 encres
        ld de,.lr                   ; .lr : octet gauche / droit de chaque teinte
        ld b,4
.p:
        push bc
        push hl
        ld c,(hl)
        ld b,0
        ld hl,enc_left
        add hl,bc
        ld a,(hl)
        ld (de),a
        inc de
        ld hl,enc_right
        add hl,bc
        ld a,(hl)
        ld (de),a
        inc de
        pop hl
        inc hl
        pop bc
        djnz .p
        ld e,0                      ; E = octet mode 1
.b:
        ld a,e                      ; teintes des pixels 0 et 1 -> octet de gauche
        call .px0
        ld (CONV_L),a               ; (adresse modifiée ci-dessous)
.stl:   equ $-2
        ld a,e
        call .px2                   ; pixels 2 et 3 -> octet de droite
        ld (CONV_R),a
.str:   equ $-2
        ld hl,.stl
        inc (hl)
        ld hl,.str
        inc (hl)
        inc e
        jr nz,.b
        ret
; A = octet mode 1 -> A = octet mode 0 (pixels 0-1)
.px0:
        ld d,a
        rlca                        ; bit 7 -> 0
        and 1
        ld c,a
        ld a,d
        rrca                        ; bit 3 -> 1 (après rrca x2)
        rrca
        and 2
        or c                        ; teinte du pixel 0
        call .left
        ld c,a
        ld a,d
        rlca                        ; bit 6 -> 0
        rlca
        and 1
        ld b,a
        ld a,d
        rrca                        ; bit 2 -> 1
        and 2
        or b                        ; teinte du pixel 1
        call .right
        or c
        ret
.px2:
        ld d,a
        rlca                        ; bit 5 -> 0
        rlca
        rlca
        and 1
        ld c,a
        ld a,d                      ; bit 1 -> 1
        and 2
        or c                        ; teinte du pixel 2
        call .left
        ld c,a
        ld a,d
        rrca                        ; bit 4 -> 0
        rrca
        rrca
        rrca
        and 1
        ld b,a
        ld a,d                      ; bit 0 -> 1
        add a,a
        and 2
        or b                        ; teinte du pixel 3
        call .right
        or c
        ret
.left:                              ; A = teinte -> octet de gauche
        add a,a
        jr .lk
.right:
        add a,a
        inc a
.lk:
        push hl
        ld hl,.lr
        add a,l
        ld l,a
        jr nc,.nc
        inc h
.nc:
        ld a,(hl)
        pop hl
        ret
.lr:    ds 8

; Écran titre : fond noir, rangées 0 à TITLE_ROWS-1 d'après title_map
draw_title:
        ld hl,SCREEN
        ld de,SCREEN+1
        ld bc,$3FFF
        ld (hl),0
        ldir
        ld ix,title_map
        ld a,$FF
        ld (.pal),a
        xor a
.row:
        ld (.r),a
        ld e,a                      ; palette de la rangée
        ld d,0
        ld hl,title_rowpal
        add hl,de
        ld a,(hl)
        ld hl,.pal
        cp (hl)
        jr z,.same
        ld (hl),a
        ld hl,CONV_L                ; remet les adresses d'écriture de build_conv
        ld (build_conv.stl),hl
        ld hl,CONV_R
        ld (build_conv.str),hl
        call build_conv
.same:
        ld a,(.r)
        add a,a
        add a,a
        add a,a
        call line_addr
        ld b,20
.col:
        push bc
        push hl
        ld a,(ix+0)
        inc ix
        cp $FF
        jr z,.skip
        ld l,a
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        ld de,title_tiles
        add hl,de
        ex de,hl                    ; DE = tuile (mode 1)
        pop hl
        push hl
        ld b,8
.ln:
        push hl
        ld c,2                      ; 2 octets mode 1 -> 4 octets mode 0
.by:
        ld a,(de)
        inc de
        push de
        ld e,a
        ld d,CONV_L >> 8
        ld a,(de)
        ld (hl),a
        inc hl
        inc d
        ld a,(de)
        ld (hl),a
        inc hl
        pop de
        dec c
        jr nz,.by
        pop hl
        ld a,h
        add a,8
        ld h,a
        djnz .ln
.skip:
        pop hl
        ld de,4
        add hl,de
        pop bc
        djnz .col
        ld a,(.r)
        inc a
        cp TITLE_ROWS
        jr nz,.row
        ret
.r:     db 0
.pal:   db 0

; --- Texte en mode 0 (20 caractères par ligne) -------------------------------------
txt_ink0:   db 3

; B = rangée, C = colonne (0-19) -> txt_pos
text_at0:
        ld a,b
        add a,a
        add a,a
        add a,a
        push bc
        call line_addr
        pop bc
        ld a,c
        add a,a
        add a,a
        ld e,a
        ld d,0
        add hl,de
        ld (txt_pos),hl
        ret

print_at0:
        push hl
        call text_at0
        pop hl
.l:
        ld a,(hl)
        or a
        ret z
        push hl
        call print_char0
        pop hl
        inc hl
        jr .l

; A = caractère (32-95), encre txt_ink0 sur fond noir (encre 0)
print_char0:
        sub 32
        ld l,a
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        ld de,font
        add hl,de
        push hl
        ld a,(txt_ink0)             ; octets d'un pixel allumé, à gauche / à droite
        ld e,a
        ld d,0
        ld hl,enc_left
        add hl,de
        ld a,(hl)
        ld (.l+1),a
        ld hl,enc_right
        add hl,de
        ld a,(hl)
        ld (.r+1),a
        pop de                      ; DE = motif
        ld hl,(txt_pos)
        ld b,8
.row:
        push bc
        push hl
        ld a,(de)
        inc de
        ld c,a
        ld b,4                      ; 4 octets de 2 pixels
.px:
        xor a
        rl c
        jr nc,.nl
.l:     or 0
.nl:
        rl c
        jr nc,.nr
.r:     or 0
.nr:
        ld (hl),a
        inc hl
        djnz .px
        pop hl
        ld a,h
        add a,8
        ld h,a
        pop bc
        djnz .row
        ld hl,(txt_pos)
        ld de,4
        add hl,de
        ld (txt_pos),hl
        ret

txt_level:   db "LEVEL",0
txt_sets:    db "SETS",0
txt_buttons: db "BUTTONS",0
txt_ctrl1:   db "PAD : CHOOSE",0
txt_ctrl2:   db "FIRE 1 : HIT",0
txt_lob1:    db "AUTO LOB AT NET",0
txt_lob2:    db "FIRE 2 : LOB   ",0
txt_play:    db "PRESS FIRE TO PLAY",0
txt_credit:  db "BASED ON NINTENDO",0
