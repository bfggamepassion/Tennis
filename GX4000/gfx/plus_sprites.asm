; Fichier généré par tools/gen_plus_sprites.py : sprites matériels (ASIC).

NIMAGES     equ 46
SPR_PAGES   equ 3      ; pages de cartouche, à partir de 3
img_page    ; page de cartouche de chaque image
        db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
img_addr    ; adresse dans la page (vue en $C000)
        dw $C000, $C400, $C800, $CC00, $D000, $D400, $D800, $DC00
        dw $E000, $E400, $E800, $EC00, $F000, $F400, $F800, $FC00
        dw $C000, $C400, $C800, $CC00, $D000, $D400, $D800, $DC00
        dw $E000, $E400, $E800, $EC00, $F000, $F400, $F800, $FC00
        dw $C000, $C400, $C800, $CC00, $D000, $D400, $D800, $DC00
        dw $E000, $E100, $E200, $E300, $E400, $E500
img_x0      ; décalage du coin haut-gauche depuis le point d'ancrage (signé)
        db 248, 240, 240, 240, 240, 248, 248, 240, 249, 248, 248, 240, 249, 249, 249, 240, 242, 248, 248, 240, 250, 250, 250, 250, 250, 248, 250, 250, 240, 250, 244, 248, 241, 241, 241, 249, 248, 244, 244, 250, 253, 253, 253, 253, 253, 0
img_y0
        db 233, 232, 232, 232, 232, 224, 233, 232, 233, 233, 233, 233, 233, 233, 233, 233, 233, 233, 233, 232, 235, 235, 235, 235, 234, 224, 235, 235, 235, 235, 235, 235, 233, 234, 235, 235, 235, 235, 235, 235, 250, 250, 250, 248, 251, 0
spr_pens    ; encres 1-15 des sprites : %RRRRBBBB, %0000GGGG
        db $FA, $0C
        db $E2, $02
        db $12, $01
        db $FB, $0D
        db $2F, $05
        db $F9, $0F
        db $72, $07
        db $11, $05
        db $22, $06
        db $F8, $0B
        db $E1, $01
        db $15, $01
        db $00, $00
        db $00, $00
        db $00, $00
