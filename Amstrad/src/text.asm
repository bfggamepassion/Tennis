; ===========================================================================
; text.asm - texte (police de la ROM du CPC, lue au démarrage) et score
;   print_at : B = rangée (0-24), C = colonne (0-39), HL = chaîne (0 à la fin)
;   Caractères 32-95 (majuscules, chiffres, ponctuation), 8x8 en mode 1.
;   Couleurs : txt_fg / txt_bg = motif d'une encre (encre 0 $00, 1 $F0,
;   2 $0F, 3 $FF).
; ===========================================================================

INK0        equ $00
INK1        equ $F0
INK2        equ $0F
INK3        equ $FF

txt_pos:    dw 0                ; adresse écran du prochain caractère
txt_fg:     db INK0             ; lettres vert clair
txt_bg:     db INK3             ; sur fond noir

; B = rangée, C = colonne -> txt_pos
text_at:
        ld a,b
        add a,a
        add a,a
        add a,a
        push bc
        call line_addr
        pop bc
        ld a,c
        add a,a
        ld e,a
        ld d,0
        add hl,de
        ld (txt_pos),hl
        ret

print_at:
        push hl
        call text_at
        pop hl
print_str:
        ld a,(hl)
        or a
        ret z
        push hl
        call print_char
        pop hl
        inc hl
        jr print_str

; A = caractère (32-95)
print_char:
        sub 32
        ld l,a
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        ld de,font
        add hl,de
        ex de,hl                    ; DE = motif
        ld hl,(txt_pos)
        ld b,8
.row:
        push bc
        ld a,(de)
        inc de
        push af
        rrca                        ; 4 pixels de gauche
        rrca
        rrca
        rrca
        call .conv
        ld (hl),a
        inc hl
        pop af
        call .conv                  ; 4 pixels de droite
        ld (hl),a
        dec hl
        ld a,h
        add a,8
        ld h,a
        pop bc
        djnz .row
        ld hl,(txt_pos)
        inc hl
        inc hl
        ld (txt_pos),hl
        ret
; A (bits 0-3) = 4 pixels -> octet mode 1 en txt_fg / txt_bg
.conv:
        and $0F
        ld b,a
        rlca
        rlca
        rlca
        rlca
        or b                        ; masque des pixels allumés
        ld c,a
        ld a,(txt_fg)
        and c
        ld b,a
        ld a,c
        cpl
        ld c,a
        ld a,(txt_bg)
        and c
        or b
        ret

; A = nombre 0-99, sans zéro de tête
print_num:
        ld b,'0'-1
.tens:
        inc b
        sub 10
        jr nc,.tens
        add a,10+'0'
        push af
        ld a,b
        cp '0'
        call nz,print_char
        pop af
        jp print_char

; --- Score ------------------------------------------------------------------------
ANN_ROW     equ 1               ; rangée des annonces (mur du fond)

shown_score: ds 8
shown_ann:   db 0

show_score:
        ld hl,W_PTS1
        ld de,shown_score
        ld b,2
.c1:
        ld a,(de)
        cp (hl)
        jr nz,show_score_force
        inc hl
        inc de
        djnz .c1
        ld hl,W_GAMES1
        ld b,6
.c2:
        ld a,(de)
        cp (hl)
        jr nz,show_score_force
        inc hl
        inc de
        djnz .c2
        jr show_ann
show_score_force:
        ld hl,W_PTS1
        ld de,shown_score
        ldi
        ldi
        ld hl,W_GAMES1
        ld bc,6
        ldir
        ld bc,1*256 + 0
        ld hl,txt_you
        call print_at
        ld bc,1*256 + 36
        ld hl,txt_cpu
        call print_at
        ld hl,W_GAMES1
        ld c,1
        call print_games
        ld hl,W_GAMES2
        ld c,37
        call print_games
        ld bc,7*256 + 0
        call text_at
        ld a,(W_PTS1)
        call print_points
        ld bc,7*256 + 36
        call text_at
        ld a,(W_PTS2)
        call print_points
show_ann:
        ld a,(H_ANN)
        bit 6,a
        jr nz,.a
        xor a
.a:
        ld hl,shown_ann
        cp (hl)
        ret z
        ld (hl),a
        push af
        ld a,ANN_ROW                ; efface : on redessine le mur
        call draw_court_row
        pop af
        or a
        ret z
        and $0F
        ld hl,txt_fault
        ld bc,ANN_ROW*256 + 16
        cp 4
        jr z,.p
        ld hl,txt_let
        ld bc,ANN_ROW*256 + 17
        cp 5
        jr z,.p
        ld hl,txt_out
        cp 6
        jr z,.p
        cp 1
        ret nz
        ld a,(W_PTS1)
        ld c,a
        ld a,(W_PTS2)
        cp 6
        jr z,.adv
        ld b,a
        ld a,c
        cp 6
        jr z,.adv
        cp 5
        ret nz
        ld a,b
        cp 5
        ret nz
        ld hl,txt_deuce
        ld bc,ANN_ROW*256 + 16
        jr .p
.adv:
        ld hl,txt_adv
        ld bc,ANN_ROW*256 + 14
.p:
        jp print_at

; HL = 3 compteurs de jeux, C = colonne : rangées 3 à 5
print_games:
        ld b,3
.g:
        push bc
        push hl
        ld a,6
        sub b                       ; rangées 3, 4, 5
        ld b,a
        call text_at
        ld a,' '
        call print_char
        pop hl
        push hl
        ld a,(hl)
        call print_num
        ld a,' '
        call print_char
        pop hl
        pop bc
        inc hl
        djnz .g
        ret

; A = code de points GB -> texte (1:0 2:15 3:30 4/5:40 6:AD 0:40 ; >= 7 tie-break)
print_points:
        push af
        ld a,' '
        call print_char
        pop af
        cp 7
        jr c,.n
        sub 7
        call print_num
        jr .sp
.n:
        add a,a
        ld l,a
        ld h,0
        ld de,points_txt
        add hl,de
        ld a,(hl)
        push hl
        call print_char
        pop hl
        inc hl
        ld a,(hl)
        call print_char
.sp:
        ld a,' '
        jp print_char

points_txt: db "40", " 0", "15", "30", "40", "40", "AD"
txt_you:    db " YOU",0
txt_cpu:    db " CPU",0
txt_fault:  db " FAULT ",0
txt_let:    db " LET ",0
txt_out:    db " OUT ",0
txt_deuce:  db " DEUCE ",0
txt_adv:    db " ADVANTAGE ",0
