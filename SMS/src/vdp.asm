; ===========================================================================
; vdp.asm - accès au VDP de la Master System (mode 4)
;
; Deux façons d'écrire dans la mémoire vidéo, et seulement deux :
;   1. écran éteint (screen_off ... screen_on) : interruptions coupées, on
;      écrit à pleine vitesse (vdp_write, vdp_fill) ;
;   2. dans l'interruption de trame (vblank_update), pendant le retour de
;      trame : motifs des sprites qui changent, table des sprites, textes.
; La boucle principale ne touche jamais au VDP écran allumé.
; ===========================================================================

; A = valeur, C = numéro de registre
vdp_reg:
        out (VDP_CTRL),a
        ld a,c
        or $80
        out (VDP_CTRL),a
        ret

; HL = adresse VRAM (écriture)
vdp_waddr:
        ld a,l
        out (VDP_CTRL),a
        ld a,h
        or $40
        out (VDP_CTRL),a
        ret

; HL = source, DE = adresse VRAM, BC = nombre d'octets (écran éteint)
vdp_write:
        ex de,hl
        call vdp_waddr
        ex de,hl
.l:
        ld a,(hl)
        out (VDP_DATA),a
        inc hl
        dec bc
        ld a,b
        or c
        jr nz,.l
        ret

; HL = adresse VRAM, BC = nombre d'octets, E = valeur (écran éteint)
vdp_fill:
        call vdp_waddr
.l:
        ld a,e
        out (VDP_DATA),a
        dec bc
        ld a,b
        or c
        jr nz,.l
        ret

; Écran éteint, interruptions coupées : la boucle principale peut écrire en VRAM.
screen_off:
        di
        ld a,R1_OFF
        ld c,1
        jp vdp_reg

; Écran allumé, interruption de trame en marche. L'état du VDP est lu avant
; (indicateur de trame effacé) : pas d'interruption tout de suite.
screen_on:
        xor a
        ld (frame_ready),a
        ld (job_n),a
        ld a,SPR_BANK0              ; page des sprites (l'interruption la lit)
        ld (MAPPER_SLOT2),a
        in a,(VDP_CTRL)
        ld a,R1_ON_IRQ
        ld c,1
        call vdp_reg
        ei
        ret

vdp_regs:
        db $04                      ; R0 : mode 4
        db R1_OFF                   ; R1 : écran éteint, sprites 8x16
        db $FF                      ; R2 : carte en $3800
        db $FF                      ; R3 : (toujours $FF)
        db $FF                      ; R4 : (toujours $FF)
        db $FF                      ; R5 : attributs des sprites en $3F00
        db $FF                      ; R6 : motifs des sprites en $2000 (tuiles 256+)
        db $F1                      ; R7 : bordure = couleur 1 des sprites (noir)
        db $00                      ; R8 : défilement horizontal
        db $00                      ; R9 : défilement vertical
        db $FF                      ; R10 : pas d'interruption de ligne
VDP_NREGS   equ $ - vdp_regs

vdp_init:
        ld hl,vdp_regs
        ld c,0
.r:
        ld a,(hl)
        call vdp_reg
        inc hl
        inc c
        ld a,c
        cp VDP_NREGS
        jr nz,.r
        ld hl,0                     ; VRAM à zéro
        ld bc,$4000
        ld e,0
        call vdp_fill
        call no_sprites
        ; (suite dans load_palettes)

; Les deux palettes (32 octets de CRAM), écran éteint
load_palettes:
        xor a
        out (VDP_CTRL),a
        ld a,$C0
        out (VDP_CTRL),a
        ld hl,pal_bg
        ld b,32
        ld c,VDP_DATA
        otir
        ret

; Police : 64 tuiles (codes 32-95) en encre PAL_TEXT sur couleur 0, écran éteint.
; Chaque ligne de 8 pixels (1 bit par pixel) donne ses 4 plans.
load_font:
        ld hl,VR_FONT
        call vdp_waddr
        ld hl,font
        ld de,64 * 8
.l:
        ld c,(hl)
        ld b,4
        ld a,PAL_TEXT
.p:
        rrca
        push af
        ld a,c
        jr c,.on
        xor a
.on:
        out (VDP_DATA),a
        pop af
        djnz .p
        inc hl
        dec de
        ld a,d
        or e
        jr nz,.l
        ret

; Carte entière : espaces (écran éteint)
clear_names:
        ld hl,VR_NAME
        call vdp_waddr
        ld bc,32 * 24
.l:
        ld a,(' ' - 32 + FONT_TILE) & $FF
        out (VDP_DATA),a
        ld a,(' ' - 32 + FONT_TILE) >> 8
        out (VDP_DATA),a
        dec bc
        ld a,b
        or c
        jr nz,.l
        ret

; Aucun sprite (écran éteint)
no_sprites:
        ld hl,VR_SAT
        ld bc,1
        ld e,$D0
        jp vdp_fill

; HL = tuiles (page GFX_BANK), DE = adresse VRAM, BC = octets (écran éteint)
bank_write:
        ld a,GFX_BANK
        ld (MAPPER_SLOT2),a
        call vdp_write
        ld a,SPR_BANK0
        ld (MAPPER_SLOT2),a
        ret

; --- Travaux de texte : copie RAM -> carte, faite par l'interruption --------------
; HL = adresse VRAM, DE = source, B = longueur en octets. À appeler quand
; frame_ready = 0.
add_job:
        ld a,(job_n)
        cp MAX_JOBS
        ret nc
        push hl                     ; VRAM
        ld l,a                      ; 5 octets par travail
        add a,a
        add a,a
        add a,l
        ld l,a
        ld h,0
        push de
        ld de,jobs
        add hl,de
        pop de
        ex (sp),hl                  ; HL = VRAM, (SP) = case
        ld c,l
        ld a,h
        pop hl
        ld (hl),c
        inc hl
        ld (hl),a
        inc hl
        ld (hl),e
        inc hl
        ld (hl),d
        inc hl
        ld (hl),b
        ld hl,job_n
        inc (hl)
        ret

; --- Retour de trame (appelé par l'interruption) ------------------------------------
; Budget : 70 lignes x 228 cycles (~15 900 T à 60 Hz) avant le haut de l'image.
vblank_update:
        ; 1. motifs des sprites dont l'image a changé
        ld b,0
.obj:
        ld hl,up_img
        ld a,b
        add a,l
        ld l,a
        adc a,h
        sub l
        ld h,a
        ld a,(hl)
        cp $FF
        jr z,.next
        ld (hl),$FF
        push bc
        ld hl,obj_slot
        ld c,b
        ld b,0
        add hl,bc
        ld e,(hl)
        call up_image
        pop bc
.next:
        inc b
        ld a,b
        cp NOBJ
        jr nz,.obj
        ; 2. table des sprites : les Y (fin de liste $D0), puis X et tuile
        ld hl,VR_SAT
        call vdp_waddr
        ld c,VDP_DATA
        ld a,(sat_n)
        or a
        jr z,.yend
        ld b,a
        ld hl,sat_y
        otir
.yend:
        ld a,$D0
        out (VDP_DATA),a
        ld a,(sat_n)
        or a
        jr z,.jobs
        add a,a
        ld b,a
        ld hl,VR_SAT + $80
        call vdp_waddr
        ld hl,sat_xn
        otir
.jobs:
        ; 3. textes
        ld a,(job_n)
        or a
        ret z
        ld hl,jobs
.j:
        push af
        ld e,(hl)
        inc hl
        ld d,(hl)
        inc hl
        ex de,hl
        call vdp_waddr
        ex de,hl
        ld e,(hl)
        inc hl
        ld d,(hl)
        inc hl
        ld b,(hl)
        inc hl
        push hl
        ex de,hl
        ld c,VDP_DATA
        otir
        pop hl
        pop af
        dec a
        jr nz,.j
        ld (job_n),a
        ret

; A = image, E = première tuile de l'objet (depuis la tuile 256) : recopie ses motifs
up_image:
        ld l,a
        ld h,0
        add hl,hl
        ld bc,spr_img
        add hl,bc
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a                      ; HL = image : n, page, motifs
        push hl
        ld l,e                      ; VRAM = VR_SPR + tuile x 32
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        ld de,VR_SPR
        add hl,de
        call vdp_waddr
        pop hl
        ld d,(hl)                   ; nombre de sprites (64 octets chacun)
        inc hl
        ld a,(hl)                   ; page
        ld (MAPPER_SLOT2),a
        inc hl
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        ld c,VDP_DATA
.s:
        DUP 64
        outi
        EDUP
        dec d
        jp nz,.s
        ret
