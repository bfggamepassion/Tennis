' Fichier généré par tools/gen_sprites.py - ne pas modifier à la main
#ifndef GFX_SPRITES_BAS
#define GFX_SPRITES_BAS

CONST NSPRITES AS UByte = 45

' Appeler une fois au démarrage : garde les données dans le binaire.
SUB FASTCALL SpriteDataKeep()
    ASM
        ret
SprTable:
        defw Spr0
        defw Spr1
        defw Spr2
        defw Spr3
        defw Spr4
        defw Spr5
        defw Spr6
        defw Spr7
        defw Spr8
        defw Spr9
        defw Spr10
        defw Spr11
        defw Spr12
        defw Spr13
        defw Spr14
        defw Spr15
        defw Spr16
        defw Spr17
        defw Spr18
        defw Spr19
        defw Spr20
        defw Spr21
        defw Spr22
        defw Spr23
        defw Spr24
        defw Spr25
        defw Spr26
        defw Spr27
        defw Spr28
        defw Spr29
        defw Spr30
        defw Spr31
        defw Spr32
        defw Spr33
        defw Spr34
        defw Spr35
        defw Spr36
        defw Spr37
        defw Spr38
        defw Spr39
        defw Spr40
        defw Spr41
        defw Spr42
        defw Spr43
        defw Spr44
Spr0:
        defb 2, 23, 248, 233
        defb $F8, $07, $1F, $E0
        defb $E0, $1F, $0F, $F0
        defb $E0, $1F, $03, $FC
        defb $E0, $1F, $03, $FC
        defb $C0, $2F, $07, $F0
        defb $C0, $30, $07, $08
        defb $C0, $3F, $07, $F8
        defb $A0, $5F, $07, $F8
        defb $50, $AF, $0F, $F0
        defb $20, $DF, $07, $F8
        defb $40, $BD, $03, $5C
        defb $80, $7A, $01, $AE
        defb $80, $55, $01, $5A
        defb $80, $4A, $01, $A2
        defb $C0, $27, $03, $F4
        defb $E0, $1A, $07, $B8
        defb $E0, $15, $07, $58
        defb $E0, $1A, $07, $A8
        defb $C0, $25, $03, $C4
        defb $C1, $22, $83, $44
        defb $C0, $37, $03, $D4
        defb $BC, $43, $3D, $C2
        defb $80, $7F, $01, $FE
Spr1:
        defb 3, 24, 240, 232
        defb $C7, $38, $FF, $00, $FF, $00
        defb $AB, $54, $EC, $13, $0F, $F0
        defb $55, $AA, $F0, $0F, $03, $FC
        defb $2A, $D5, $F0, $0F, $01, $FE
        defb $54, $AB, $E0, $1F, $00, $C7
        defb $AA, $55, $E0, $1C, $02, $3D
        defb $D4, $2B, $E0, $13, $1B, $E4
        defb $E0, $1F, $E0, $1F, $1B, $04
        defb $FF, $00, $10, $EE, $13, $0C
        defb $FF, $00, $00, $9F, $01, $02
        defb $FF, $00, $00, $87, $03, $04
        defb $FF, $00, $80, $47, $07, $F8
        defb $FF, $00, $C0, $2E, $01, $B6
        defb $FF, $00, $E0, $1D, $00, $51
        defb $FF, $00, $E0, $1A, $00, $B9
        defb $FF, $00, $E0, $1D, $18, $67
        defb $FF, $00, $C0, $2B, $3F, $C0
        defb $FF, $00, $C0, $35, $3F, $40
        defb $FF, $00, $C0, $20, $1F, $A0
        defb $FF, $00, $E0, $10, $1F, $A0
        defb $FF, $00, $E0, $11, $3F, $C0
        defb $FF, $00, $C0, $35, $C3, $3C
        defb $FF, $00, $9F, $60, $01, $FE
        defb $FF, $00, $C0, $3F, $03, $FC
Spr2:
        defb 3, 24, 240, 232
        defb $C7, $38, $FF, $00, $FF, $00
        defb $AB, $54, $EC, $13, $0F, $F0
        defb $55, $AA, $F0, $0F, $03, $FC
        defb $2A, $D5, $F0, $0F, $01, $FE
        defb $54, $AB, $E0, $1F, $00, $C7
        defb $AA, $55, $E0, $1C, $02, $3D
        defb $D4, $2B, $E0, $13, $1B, $E4
        defb $E0, $1F, $E0, $1F, $1B, $04
        defb $FF, $00, $10, $EE, $13, $0C
        defb $FF, $00, $00, $9F, $01, $02
        defb $FF, $00, $00, $87, $03, $04
        defb $FF, $00, $80, $47, $07, $F8
        defb $FF, $00, $C0, $2E, $01, $B6
        defb $FF, $00, $E0, $1D, $00, $51
        defb $FF, $00, $E0, $1A, $00, $B9
        defb $FF, $00, $E0, $1D, $18, $67
        defb $FF, $00, $C0, $2B, $3F, $C0
        defb $FF, $00, $C0, $35, $0F, $70
        defb $FF, $00, $00, $E2, $07, $88
        defb $FF, $00, $40, $A1, $07, $08
        defb $FF, $00, $41, $A2, $03, $8C
        defb $FF, $00, $40, $87, $01, $D6
        defb $FF, $00, $60, $9F, $7D, $82
        defb $FF, $00, $00, $FF, $03, $FC
Spr3:
        defb 3, 24, 240, 232
        defb $C7, $38, $FF, $00, $FF, $00
        defb $AB, $54, $EC, $13, $0F, $F0
        defb $55, $AA, $F0, $0F, $03, $FC
        defb $2A, $D5, $F0, $0F, $01, $FE
        defb $54, $AB, $E0, $1F, $00, $C7
        defb $AA, $55, $E0, $1C, $02, $3D
        defb $D4, $2B, $E0, $13, $1B, $E4
        defb $E0, $1F, $E0, $1F, $1B, $04
        defb $FF, $00, $10, $EE, $13, $0C
        defb $FF, $00, $00, $9F, $01, $02
        defb $FF, $00, $00, $87, $03, $04
        defb $FF, $00, $80, $47, $07, $F8
        defb $FF, $00, $C0, $2E, $01, $B6
        defb $FF, $00, $E0, $1D, $00, $51
        defb $FF, $00, $E0, $1A, $00, $B9
        defb $FF, $00, $E0, $1D, $18, $67
        defb $FF, $00, $C0, $2B, $3F, $C0
        defb $FF, $00, $C0, $35, $3F, $40
        defb $FF, $00, $C0, $20, $1F, $A0
        defb $FF, $00, $E0, $10, $1F, $A0
        defb $FF, $00, $E0, $11, $3F, $C0
        defb $FF, $00, $C0, $35, $C3, $3C
        defb $FF, $00, $9F, $60, $01, $FE
        defb $FF, $00, $C0, $3F, $03, $FC
Spr4:
        defb 3, 24, 240, 232
        defb $FF, $00, $E0, $1F, $0F, $F0
        defb $FF, $00, $C0, $3F, $1F, $A0
        defb $FF, $00, $80, $7E, $1F, $60
        defb $FF, $00, $80, $79, $01, $FE
        defb $FF, $00, $00, $F7, $41, $32
        defb $FF, $00, $80, $6C, $61, $12
        defb $FF, $00, $80, $58, $63, $14
        defb $FF, $00, $C0, $3C, $03, $0C
        defb $FF, $00, $80, $7C, $07, $18
        defb $FF, $00, $00, $87, $07, $F8
        defb $FF, $00, $00, $83, $0F, $B0
        defb $E0, $1F, $00, $E3, $0F, $50
        defb $D4, $2B, $E0, $1E, $0F, $B0
        defb $AA, $55, $F0, $0D, $0F, $70
        defb $54, $AB, $F0, $0F, $0F, $F0
        defb $2A, $D5, $F0, $0D, $0F, $50
        defb $55, $AA, $F0, $0A, $0F, $B0
        defb $AB, $54, $F0, $0D, $0F, $30
        defb $C7, $38, $F0, $08, $1F, $60
        defb $FF, $00, $F0, $08, $1F, $60
        defb $FF, $00, $E0, $10, $1F, $A0
        defb $FF, $00, $C0, $35, $63, $9C
        defb $FF, $00, $9F, $60, $81, $7E
        defb $FF, $00, $C0, $3F, $03, $FC
Spr5:
        defb 2, 32, 248, 224
        defb $FF, $00, $C3, $3C
        defb $FF, $00, $A9, $56
        defb $FF, $00, $54, $AB
        defb $FF, $00, $2A, $D5
        defb $FF, $00, $54, $AB
        defb $FF, $00, $2A, $D5
        defb $FF, $00, $54, $AB
        defb $FF, $00, $A9, $56
        defb $F8, $07, $03, $FC
        defb $E0, $1F, $01, $F2
        defb $E0, $1F, $01, $FE
        defb $E0, $1F, $00, $F9
        defb $C0, $2F, $00, $F1
        defb $C0, $30, $00, $09
        defb $C0, $3F, $00, $F9
        defb $E0, $1F, $01, $FE
        defb $E0, $1F, $01, $FE
        defb $C0, $37, $03, $DC
        defb $C0, $3A, $03, $BC
        defb $80, $7D, $07, $58
        defb $00, $DA, $07, $A8
        defb $00, $8D, $07, $F8
        defb $08, $97, $07, $A8
        defb $90, $6D, $07, $58
        defb $F0, $0A, $07, $A8
        defb $F0, $09, $07, $58
        defb $F0, $09, $0F, $10
        defb $E0, $11, $0F, $10
        defb $E0, $1A, $0F, $90
        defb $CD, $32, $83, $7C
        defb $80, $7F, $E1, $1E
        defb $C0, $3F, $03, $FC
Spr6:
        defb 2, 23, 248, 233
        defb $F8, $07, $1F, $E0
        defb $E0, $1F, $0F, $F0
        defb $E0, $1F, $03, $FC
        defb $E0, $1F, $03, $FC
        defb $C0, $2F, $07, $F0
        defb $C0, $30, $07, $08
        defb $C0, $3F, $07, $F8
        defb $E0, $1F, $07, $F8
        defb $E0, $1D, $0F, $F0
        defb $C0, $3A, $0F, $B0
        defb $80, $75, $07, $58
        defb $00, $9A, $07, $A8
        defb $00, $97, $07, $D8
        defb $00, $9A, $0F, $F0
        defb $80, $75, $0F, $50
        defb $50, $AA, $0F, $B0
        defb $20, $DC, $0F, $D0
        defb $50, $A8, $1F, $A0
        defb $80, $78, $3F, $40
        defb $F8, $06, $3F, $C0
        defb $C3, $3C, $83, $7C
        defb $87, $78, $01, $FE
        defb $C0, $3F, $03, $FC
Spr7:
        defb 3, 24, 240, 232
        defb $C7, $38, $FF, $00, $FF, $00
        defb $AB, $54, $EC, $13, $0F, $F0
        defb $55, $AA, $F0, $0F, $03, $FC
        defb $2A, $D5, $F0, $0F, $01, $FE
        defb $54, $AB, $E0, $1F, $00, $C7
        defb $AA, $55, $E0, $1C, $02, $3D
        defb $D4, $2B, $E0, $13, $1B, $E4
        defb $E0, $1F, $E0, $1F, $1B, $04
        defb $FF, $00, $10, $EE, $13, $0C
        defb $FF, $00, $00, $9F, $01, $02
        defb $FF, $00, $00, $87, $03, $04
        defb $FF, $00, $80, $47, $07, $F8
        defb $FF, $00, $C0, $2E, $01, $B6
        defb $FF, $00, $E0, $1D, $00, $51
        defb $FF, $00, $E0, $1A, $00, $B9
        defb $FF, $00, $E0, $1D, $18, $67
        defb $FF, $00, $C0, $2B, $3F, $C0
        defb $FF, $00, $C0, $35, $3F, $40
        defb $FF, $00, $C0, $20, $1F, $A0
        defb $FF, $00, $E0, $10, $1F, $A0
        defb $FF, $00, $E0, $11, $3F, $C0
        defb $FF, $00, $C0, $35, $C3, $3C
        defb $FF, $00, $9F, $60, $01, $FE
        defb $FF, $00, $C0, $3F, $03, $FC
Spr8:
        defb 3, 23, 249, 233
        defb $D8, $27, $1F, $E0, $FF, $00
        defb $E0, $1F, $07, $F8, $FF, $00
        defb $E0, $1F, $03, $FC, $FF, $00
        defb $C0, $3F, $01, $8E, $FF, $00
        defb $C0, $38, $05, $7A, $FF, $00
        defb $C0, $27, $37, $C8, $FF, $00
        defb $C0, $3E, $37, $08, $FF, $00
        defb $E0, $1C, $27, $18, $FF, $00
        defb $F0, $0E, $03, $04, $FF, $00
        defb $C0, $3F, $07, $C8, $FF, $00
        defb $80, $5A, $0F, $F0, $07, $F8
        defb $00, $95, $06, $F9, $AB, $54
        defb $00, $AA, $01, $E6, $55, $AA
        defb $00, $F5, $00, $E3, $A9, $56
        defb $C0, $3A, $01, $FE, $55, $AA
        defb $80, $57, $7E, $81, $AB, $54
        defb $80, $6A, $7F, $80, $07, $F8
        defb $80, $41, $3F, $40, $FF, $00
        defb $C0, $21, $3F, $40, $FF, $00
        defb $C0, $23, $7F, $80, $FF, $00
        defb $81, $6A, $87, $78, $FF, $00
        defb $3E, $C1, $03, $FC, $FF, $00
        defb $80, $7F, $07, $F8, $FF, $00
Spr9:
        defb 2, 23, 248, 233
        defb $F8, $07, $1F, $E0
        defb $E0, $1F, $0F, $F0
        defb $E0, $1F, $03, $FC
        defb $E0, $1F, $03, $FC
        defb $C0, $2F, $07, $F0
        defb $C0, $30, $07, $08
        defb $C0, $3F, $07, $F8
        defb $80, $7F, $07, $F8
        defb $20, $DF, $0F, $F0
        defb $50, $AF, $0F, $F0
        defb $20, $D5, $07, $58
        defb $40, $BA, $07, $B8
        defb $80, $55, $07, $58
        defb $00, $AA, $0F, $B0
        defb $80, $7D, $1F, $60
        defb $C0, $2B, $3F, $C0
        defb $C0, $35, $3F, $40
        defb $C0, $20, $1F, $A0
        defb $E0, $10, $1F, $A0
        defb $E0, $11, $3F, $C0
        defb $C0, $35, $C3, $3C
        defb $9F, $60, $01, $FE
        defb $C0, $3F, $03, $FC
Spr10:
        defb 3, 23, 248, 233
        defb $F0, $0F, $37, $C8, $FF, $00
        defb $C0, $3F, $0E, $F1, $3F, $C0
        defb $80, $7F, $0D, $F2, $5F, $A0
        defb $00, $E3, $02, $FD, $AF, $50
        defb $40, $BC, $05, $3A, $4F, $B0
        defb $D8, $27, $02, $CD, $AF, $50
        defb $D8, $20, $05, $FA, $5F, $A0
        defb $C8, $30, $02, $7D, $BF, $40
        defb $80, $40, $00, $FF, $7F, $80
        defb $C0, $20, $03, $A4, $FF, $00
        defb $E0, $1F, $03, $04, $FF, $00
        defb $E0, $18, $03, $04, $FF, $00
        defb $E0, $18, $03, $0C, $FF, $00
        defb $F0, $0C, $07, $A8, $FF, $00
        defb $F8, $05, $07, $78, $FF, $00
        defb $FC, $03, $03, $EC, $FF, $00
        defb $FC, $03, $03, $54, $FF, $00
        defb $F8, $07, $03, $0C, $FF, $00
        defb $F8, $05, $07, $08, $FF, $00
        defb $FC, $02, $07, $88, $FF, $00
        defb $C3, $3C, $03, $D4, $FF, $00
        defb $80, $7F, $F9, $06, $FF, $00
        defb $C0, $3F, $03, $FC, $FF, $00
Spr11:
        defb 3, 23, 240, 233
        defb $FF, $00, $F0, $0F, $37, $C8
        defb $FF, $00, $C0, $3F, $0F, $F0
        defb $FF, $00, $80, $7F, $0F, $F0
        defb $FF, $00, $00, $E3, $07, $F8
        defb $FF, $00, $40, $BC, $07, $38
        defb $FF, $00, $D8, $27, $07, $C8
        defb $FF, $00, $D8, $20, $07, $F8
        defb $FF, $00, $C8, $30, $0F, $70
        defb $FF, $00, $80, $40, $0F, $F0
        defb $FF, $00, $C0, $20, $1F, $E0
        defb $C1, $3E, $E0, $1F, $03, $5C
        defb $AA, $55, $C0, $3E, $01, $BA
        defb $55, $AA, $00, $CD, $00, $71
        defb $2A, $D5, $00, $86, $00, $B1
        defb $55, $AA, $04, $FB, $01, $7E
        defb $AA, $55, $FC, $03, $03, $EC
        defb $C1, $3E, $FC, $03, $03, $54
        defb $FF, $00, $F8, $07, $03, $0C
        defb $FF, $00, $F8, $05, $07, $08
        defb $FF, $00, $FC, $02, $07, $88
        defb $FF, $00, $C3, $3C, $03, $D4
        defb $FF, $00, $80, $7F, $F9, $06
        defb $FF, $00, $C0, $3F, $03, $FC
Spr12:
        defb 3, 23, 249, 233
        defb $F0, $0F, $3F, $C0, $FF, $00
        defb $C0, $3F, $1F, $E0, $C7, $38
        defb $C0, $3F, $07, $F8, $AB, $54
        defb $C0, $3F, $07, $F8, $55, $AA
        defb $80, $5F, $0E, $E1, $A9, $56
        defb $80, $60, $0E, $11, $55, $AA
        defb $80, $7F, $0E, $F1, $AB, $54
        defb $80, $7F, $0E, $F1, $57, $A8
        defb $C0, $3F, $10, $EF, $0F, $F0
        defb $E0, $1F, $01, $F2, $FF, $00
        defb $F0, $0F, $01, $A2, $FF, $00
        defb $E0, $1F, $03, $54, $FF, $00
        defb $80, $63, $07, $B8, $FF, $00
        defb $80, $43, $0F, $50, $FF, $00
        defb $80, $7E, $0F, $F0, $FF, $00
        defb $F8, $07, $07, $D8, $FF, $00
        defb $F8, $06, $07, $A8, $FF, $00
        defb $F0, $0E, $07, $18, $FF, $00
        defb $F0, $0A, $0F, $10, $FF, $00
        defb $F8, $05, $0F, $10, $FF, $00
        defb $86, $79, $07, $A8, $FF, $00
        defb $01, $FE, $F3, $0C, $FF, $00
        defb $80, $7F, $07, $F8, $FF, $00
Spr13:
        defb 3, 23, 249, 233
        defb $D8, $27, $1F, $E0, $FF, $00
        defb $E0, $1F, $07, $F8, $8F, $70
        defb $E0, $1F, $03, $FC, $57, $A8
        defb $C0, $3F, $00, $8F, $AB, $54
        defb $C0, $38, $05, $7A, $53, $AC
        defb $C0, $27, $34, $CB, $AB, $54
        defb $C0, $3E, $35, $0A, $57, $A8
        defb $E0, $1C, $24, $1B, $AF, $50
        defb $F0, $0E, $00, $07, $1F, $E0
        defb $C0, $3F, $01, $CE, $FF, $00
        defb $80, $5A, $01, $F2, $FF, $00
        defb $00, $95, $01, $E2, $FF, $00
        defb $00, $AA, $03, $E4, $FF, $00
        defb $00, $F5, $07, $F8, $FF, $00
        defb $C0, $3A, $1F, $E0, $FF, $00
        defb $80, $57, $7F, $80, $FF, $00
        defb $80, $6A, $7F, $80, $FF, $00
        defb $80, $41, $3F, $40, $FF, $00
        defb $C0, $21, $3F, $40, $FF, $00
        defb $C0, $23, $7F, $80, $FF, $00
        defb $81, $6A, $87, $78, $FF, $00
        defb $3E, $C1, $03, $FC, $FF, $00
        defb $80, $7F, $07, $F8, $FF, $00
Spr14:
        defb 3, 23, 249, 233
        defb $D8, $27, $1F, $E0, $FF, $00
        defb $E0, $1F, $07, $F8, $FF, $00
        defb $E0, $1F, $03, $FC, $FF, $00
        defb $C0, $3F, $01, $8E, $FF, $00
        defb $C0, $38, $05, $7A, $FF, $00
        defb $C0, $27, $37, $C8, $1F, $E0
        defb $C0, $3E, $36, $09, $AF, $50
        defb $E0, $1C, $25, $1A, $57, $A8
        defb $F0, $0E, $02, $05, $A7, $58
        defb $C0, $3F, $01, $CE, $57, $A8
        defb $80, $5A, $0A, $B5, $AF, $50
        defb $00, $95, $01, $7E, $5F, $A0
        defb $00, $AA, $00, $F7, $3F, $C0
        defb $00, $F5, $07, $68, $FF, $00
        defb $C0, $3A, $0F, $F0, $FF, $00
        defb $80, $57, $7F, $80, $FF, $00
        defb $80, $6A, $7F, $80, $FF, $00
        defb $80, $41, $3F, $40, $FF, $00
        defb $C0, $21, $3F, $40, $FF, $00
        defb $C0, $23, $7F, $80, $FF, $00
        defb $81, $6A, $87, $78, $FF, $00
        defb $3E, $C1, $03, $FC, $FF, $00
        defb $80, $7F, $07, $F8, $FF, $00
Spr15:
        defb 3, 23, 240, 233
        defb $FF, $00, $F0, $0F, $37, $C8
        defb $C7, $38, $C0, $3F, $0F, $F0
        defb $AB, $54, $80, $7F, $0F, $F0
        defb $55, $AA, $00, $E3, $07, $F8
        defb $2A, $D5, $40, $BC, $07, $38
        defb $54, $AB, $D8, $27, $07, $C8
        defb $AA, $55, $D8, $20, $07, $F8
        defb $D4, $2B, $C8, $30, $0F, $70
        defb $E0, $1F, $00, $C0, $0F, $F0
        defb $FF, $00, $00, $A0, $1F, $E0
        defb $FF, $00, $00, $9F, $03, $5C
        defb $FF, $00, $00, $EE, $01, $BA
        defb $FF, $00, $E0, $1D, $00, $71
        defb $FF, $00, $F8, $06, $00, $B1
        defb $FF, $00, $FC, $03, $01, $7E
        defb $FF, $00, $FC, $03, $03, $EC
        defb $FF, $00, $FC, $03, $03, $54
        defb $FF, $00, $F8, $07, $03, $0C
        defb $FF, $00, $F8, $05, $07, $08
        defb $FF, $00, $FC, $02, $07, $88
        defb $FF, $00, $C3, $3C, $03, $D4
        defb $FF, $00, $80, $7F, $F9, $06
        defb $FF, $00, $C0, $3F, $03, $FC
Spr16:
        defb 3, 23, 242, 233
        defb $FF, $00, $C0, $3F, $DF, $20
        defb $FF, $00, $00, $FF, $3F, $C0
        defb $FE, $01, $00, $FF, $3F, $C0
        defb $FC, $03, $00, $8F, $1F, $E0
        defb $FD, $02, $00, $F0, $1F, $E0
        defb $C7, $38, $60, $9F, $1F, $20
        defb $AB, $54, $60, $83, $1F, $E0
        defb $55, $AA, $20, $C1, $3F, $C0
        defb $2A, $D5, $00, $03, $3F, $C0
        defb $54, $AB, $00, $83, $7F, $80
        defb $AA, $55, $80, $7D, $0F, $70
        defb $D4, $2B, $00, $FA, $07, $E8
        defb $E0, $1F, $00, $95, $03, $C4
        defb $FF, $00, $00, $DA, $03, $C4
        defb $FF, $00, $C0, $3D, $07, $F8
        defb $FF, $00, $F0, $0F, $0F, $B0
        defb $FF, $00, $F0, $0D, $0F, $50
        defb $FF, $00, $E0, $1C, $0F, $30
        defb $FF, $00, $E0, $14, $1F, $20
        defb $FF, $00, $F0, $0A, $1F, $20
        defb $FF, $00, $0C, $F3, $0F, $50
        defb $FE, $01, $03, $FC, $E7, $18
        defb $FF, $00, $00, $FF, $0F, $F0
Spr17:
        defb 3, 23, 248, 233
        defb $F0, $0F, $37, $C8, $FF, $00
        defb $C0, $3F, $0E, $F1, $3F, $C0
        defb $80, $7F, $0D, $F2, $5F, $A0
        defb $00, $E3, $02, $FD, $AF, $50
        defb $40, $BC, $05, $3A, $4F, $B0
        defb $D8, $27, $02, $CD, $AF, $50
        defb $D8, $20, $05, $FA, $5F, $A0
        defb $C8, $30, $02, $7D, $BF, $40
        defb $80, $40, $00, $FF, $7F, $80
        defb $C0, $20, $03, $A4, $FF, $00
        defb $E0, $1F, $03, $04, $FF, $00
        defb $E0, $18, $03, $04, $FF, $00
        defb $E0, $18, $03, $0C, $FF, $00
        defb $F0, $0C, $07, $A8, $FF, $00
        defb $F8, $05, $07, $78, $FF, $00
        defb $FC, $03, $03, $EC, $FF, $00
        defb $FC, $03, $03, $54, $FF, $00
        defb $F8, $07, $03, $0C, $FF, $00
        defb $F8, $05, $07, $08, $FF, $00
        defb $FC, $02, $07, $88, $FF, $00
        defb $C3, $3C, $03, $D4, $FF, $00
        defb $80, $7F, $F9, $06, $FF, $00
        defb $C0, $3F, $03, $FC, $FF, $00
Spr18:
        defb 3, 23, 248, 233
        defb $F0, $0F, $37, $C8, $FF, $00
        defb $C0, $3F, $0E, $F1, $3F, $C0
        defb $80, $7F, $0D, $F2, $5F, $A0
        defb $00, $E3, $02, $FD, $AF, $50
        defb $40, $BC, $05, $3A, $4F, $B0
        defb $D8, $27, $02, $CD, $AF, $50
        defb $D8, $20, $05, $FA, $5F, $A0
        defb $C8, $30, $02, $7D, $BF, $40
        defb $80, $40, $00, $FF, $7F, $80
        defb $C0, $20, $03, $A4, $FF, $00
        defb $E0, $1F, $03, $04, $FF, $00
        defb $E0, $18, $03, $04, $FF, $00
        defb $E0, $18, $03, $0C, $FF, $00
        defb $F0, $0C, $07, $A8, $FF, $00
        defb $F8, $05, $07, $78, $FF, $00
        defb $FC, $03, $03, $EC, $FF, $00
        defb $F0, $0D, $03, $54, $FF, $00
        defb $E0, $12, $00, $A7, $FF, $00
        defb $E0, $11, $02, $C5, $FF, $00
        defb $C0, $31, $82, $41, $FF, $00
        defb $80, $77, $02, $E5, $FF, $00
        defb $BE, $41, $06, $F9, $FF, $00
        defb $C0, $3F, $00, $FF, $FF, $00
Spr19:
        defb 3, 24, 240, 232
        defb $C7, $38, $FF, $00, $FF, $00
        defb $AB, $54, $EC, $13, $0F, $F0
        defb $55, $AA, $F0, $0F, $03, $FC
        defb $2A, $D5, $F0, $0F, $01, $FE
        defb $54, $AB, $E0, $1F, $00, $C7
        defb $AA, $55, $E0, $1C, $02, $3D
        defb $D4, $2B, $E0, $13, $1B, $E4
        defb $E0, $1F, $E0, $1F, $1B, $04
        defb $FF, $00, $10, $EE, $13, $0C
        defb $FF, $00, $00, $9F, $01, $02
        defb $FF, $00, $00, $87, $03, $04
        defb $FF, $00, $80, $47, $07, $F8
        defb $FF, $00, $C0, $2E, $03, $B4
        defb $FF, $00, $E0, $1D, $01, $52
        defb $FF, $00, $E0, $1A, $00, $B1
        defb $FF, $00, $E0, $1D, $10, $69
        defb $FF, $00, $C0, $2B, $39, $C6
        defb $FF, $00, $C0, $35, $3F, $40
        defb $FF, $00, $C0, $20, $1F, $A0
        defb $FF, $00, $E0, $10, $1F, $A0
        defb $FF, $00, $E0, $11, $3F, $C0
        defb $FF, $00, $C0, $35, $C3, $3C
        defb $FF, $00, $9F, $60, $01, $FE
        defb $FF, $00, $C0, $3F, $03, $FC
Spr20:
        defb 2, 21, 250, 235
        defb $E0, $1F, $7F, $80
        defb $80, $7F, $3F, $C0
        defb $80, $7F, $1F, $E0
        defb $00, $FE, $1F, $E0
        defb $19, $E0, $9F, $60
        defb $99, $40, $9F, $20
        defb $90, $49, $8F, $70
        defb $80, $44, $07, $A8
        defb $80, $41, $0B, $54
        defb $C0, $3E, $13, $AC
        defb $80, $77, $0B, $54
        defb $80, $4A, $17, $A8
        defb $80, $43, $0F, $50
        defb $C0, $23, $1F, $E0
        defb $C0, $31, $3F, $40
        defb $80, $6A, $1F, $A0
        defb $80, $57, $1F, $A0
        defb $06, $89, $0F, $10
        defb $00, $FF, $0F, $F0
        defb $70, $8F, $EF, $10
        defb $80, $7F, $1F, $E0
Spr21:
        defb 3, 21, 250, 235
        defb $E0, $1F, $7F, $80, $8F, $70
        defb $80, $7F, $7F, $80, $57, $A8
        defb $00, $FF, $1E, $E1, $AB, $54
        defb $00, $F9, $1D, $E2, $53, $AC
        defb $26, $C0, $1C, $E3, $AB, $54
        defb $A6, $40, $1D, $62, $57, $A8
        defb $82, $64, $1C, $E3, $AF, $50
        defb $80, $50, $20, $DF, $1F, $E0
        defb $80, $43, $03, $E4, $FF, $00
        defb $C0, $3E, $03, $C4, $FF, $00
        defb $80, $65, $07, $68, $FF, $00
        defb $00, $82, $0F, $B0, $FF, $00
        defb $80, $7D, $1F, $60, $FF, $00
        defb $F8, $07, $1F, $E0, $FF, $00
        defb $F8, $05, $1F, $60, $FF, $00
        defb $F0, $0E, $1F, $A0, $FF, $00
        defb $F0, $09, $3F, $40, $FF, $00
        defb $F0, $08, $1F, $A0, $FF, $00
        defb $80, $7F, $4F, $B0, $FF, $00
        defb $0F, $F0, $07, $F8, $FF, $00
        defb $80, $7F, $1F, $E0, $FF, $00
Spr22:
        defb 3, 21, 250, 235
        defb $E0, $1F, $7F, $80, $8F, $70
        defb $80, $7F, $7F, $80, $57, $A8
        defb $00, $FF, $1E, $E1, $AB, $54
        defb $00, $F9, $1D, $E2, $53, $AC
        defb $26, $C0, $1C, $E3, $AB, $54
        defb $A6, $40, $1D, $62, $57, $A8
        defb $82, $64, $1C, $E3, $AF, $50
        defb $80, $50, $20, $DF, $1F, $E0
        defb $80, $43, $03, $E4, $FF, $00
        defb $C0, $3E, $03, $C4, $FF, $00
        defb $80, $65, $07, $68, $FF, $00
        defb $00, $82, $0F, $B0, $FF, $00
        defb $80, $7D, $1F, $60, $FF, $00
        defb $F0, $0F, $1F, $E0, $FF, $00
        defb $E0, $15, $1F, $60, $FF, $00
        defb $C0, $3A, $1F, $E0, $FF, $00
        defb $80, $4F, $03, $BC, $FF, $00
        defb $82, $45, $0B, $14, $FF, $00
        defb $80, $7F, $0B, $94, $FF, $00
        defb $78, $87, $0B, $F4, $FF, $00
        defb $80, $7F, $03, $FC, $FF, $00
Spr23:
        defb 3, 21, 250, 235
        defb $E0, $1F, $7F, $80, $8F, $70
        defb $80, $7F, $7F, $80, $57, $A8
        defb $00, $FF, $1E, $E1, $AB, $54
        defb $00, $F9, $1D, $E2, $53, $AC
        defb $26, $C0, $1C, $E3, $AB, $54
        defb $A6, $40, $1D, $62, $57, $A8
        defb $82, $64, $1C, $E3, $AF, $50
        defb $80, $50, $20, $DF, $1F, $E0
        defb $80, $43, $03, $E4, $FF, $00
        defb $C0, $3E, $03, $C4, $FF, $00
        defb $80, $65, $07, $68, $FF, $00
        defb $00, $82, $0F, $B0, $FF, $00
        defb $80, $7D, $1F, $60, $FF, $00
        defb $F8, $07, $1F, $E0, $FF, $00
        defb $F8, $05, $1F, $60, $FF, $00
        defb $F0, $0E, $1F, $A0, $FF, $00
        defb $F0, $09, $3F, $40, $FF, $00
        defb $F0, $08, $1F, $A0, $FF, $00
        defb $80, $7F, $4F, $B0, $FF, $00
        defb $0F, $F0, $07, $F8, $FF, $00
        defb $80, $7F, $1F, $E0, $FF, $00
Spr24:
        defb 3, 22, 250, 234
        defb $F0, $0F, $3F, $C0, $FF, $00
        defb $E0, $1F, $3F, $C0, $FF, $00
        defb $C0, $3F, $0F, $F0, $FF, $00
        defb $80, $7F, $0F, $F0, $FF, $00
        defb $81, $66, $0F, $70, $FF, $00
        defb $C3, $24, $0F, $70, $FF, $00
        defb $C3, $24, $0F, $10, $FF, $00
        defb $E0, $12, $07, $38, $FF, $00
        defb $E0, $17, $00, $E7, $1F, $E0
        defb $F0, $0D, $00, $7F, $AF, $50
        defb $E0, $1A, $3D, $C2, $57, $A8
        defb $E0, $15, $3C, $43, $AB, $54
        defb $E0, $1A, $3D, $C2, $53, $AC
        defb $F0, $0F, $3E, $C1, $AB, $54
        defb $F0, $0A, $1F, $A0, $57, $A8
        defb $F0, $0D, $1F, $60, $8F, $70
        defb $F0, $0F, $3F, $C0, $FF, $00
        defb $F0, $0C, $3F, $40, $FF, $00
        defb $F8, $06, $1F, $20, $FF, $00
        defb $84, $7B, $1F, $E0, $FF, $00
        defb $03, $FC, $CF, $30, $FF, $00
        defb $80, $7F, $07, $F8, $FF, $00
Spr25:
        defb 2, 32, 248, 224
        defb $C3, $3C, $FF, $00
        defb $A9, $56, $FF, $00
        defb $54, $AB, $FF, $00
        defb $2A, $D5, $FF, $00
        defb $54, $AB, $FF, $00
        defb $2A, $D5, $FF, $00
        defb $54, $AB, $FF, $00
        defb $A9, $56, $FF, $00
        defb $C3, $3C, $FF, $00
        defb $E4, $1B, $0F, $F0
        defb $C0, $2F, $07, $F8
        defb $C0, $2F, $03, $FC
        defb $80, $4F, $03, $9C
        defb $83, $4C, $33, $0C
        defb $83, $48, $33, $04
        defb $C2, $29, $13, $24
        defb $C0, $3C, $03, $84
        defb $E0, $14, $03, $04
        defb $F0, $0B, $07, $F8
        defb $F0, $0D, $03, $54
        defb $F0, $0A, $01, $BA
        defb $F0, $0D, $01, $52
        defb $E0, $1B, $00, $F1
        defb $E0, $15, $11, $6E
        defb $E0, $1E, $1F, $A0
        defb $E0, $13, $1F, $E0
        defb $F0, $0A, $0F, $30
        defb $F0, $0F, $0F, $10
        defb $F6, $09, $2F, $D0
        defb $E0, $1F, $C7, $38
        defb $C0, $3F, $03, $FC
        defb $E0, $1F, $07, $F8
Spr26:
        defb 2, 21, 250, 235
        defb $E0, $1F, $7F, $80
        defb $80, $7F, $3F, $C0
        defb $80, $7F, $1F, $E0
        defb $00, $FE, $1F, $E0
        defb $19, $E0, $9F, $60
        defb $99, $40, $9F, $20
        defb $90, $49, $9F, $20
        defb $80, $44, $1F, $20
        defb $80, $60, $1F, $20
        defb $00, $9F, $3F, $C0
        defb $00, $87, $1F, $E0
        defb $00, $8F, $0F, $D0
        defb $80, $6F, $07, $A8
        defb $C0, $3F, $07, $D8
        defb $C0, $3F, $4F, $B0
        defb $C0, $2F, $2F, $D0
        defb $E0, $17, $5F, $A0
        defb $E0, $11, $3F, $C0
        defb $80, $7F, $9F, $60
        defb $0F, $F0, $0F, $F0
        defb $80, $7F, $1F, $E0
Spr27:
        defb 3, 21, 250, 235
        defb $E0, $1F, $7F, $80, $8F, $70
        defb $80, $7F, $7F, $80, $57, $A8
        defb $00, $FF, $1E, $E1, $AB, $54
        defb $00, $F9, $1D, $E2, $53, $AC
        defb $26, $C0, $1C, $E3, $AB, $54
        defb $A6, $40, $1D, $62, $57, $A8
        defb $82, $64, $1C, $E3, $AF, $50
        defb $80, $50, $20, $DF, $1F, $E0
        defb $80, $43, $03, $E4, $FF, $00
        defb $C0, $3E, $03, $C4, $FF, $00
        defb $80, $65, $07, $68, $FF, $00
        defb $00, $82, $0F, $B0, $FF, $00
        defb $80, $7D, $1F, $60, $FF, $00
        defb $F8, $07, $1F, $E0, $FF, $00
        defb $F8, $05, $1F, $60, $FF, $00
        defb $F0, $0E, $1F, $A0, $FF, $00
        defb $F0, $09, $3F, $40, $FF, $00
        defb $F0, $08, $1F, $A0, $FF, $00
        defb $80, $7F, $4F, $B0, $FF, $00
        defb $0F, $F0, $07, $F8, $FF, $00
        defb $80, $7F, $1F, $E0, $FF, $00
Spr28:
        defb 3, 21, 240, 235
        defb $FF, $00, $F8, $07, $1F, $E0
        defb $FF, $00, $E0, $1F, $1F, $E0
        defb $FF, $00, $C0, $3F, $07, $F8
        defb $FF, $00, $C0, $3E, $07, $78
        defb $FF, $00, $C9, $30, $87, $38
        defb $FF, $00, $E9, $10, $87, $18
        defb $C1, $3E, $E0, $19, $87, $38
        defb $AA, $55, $E0, $14, $0F, $30
        defb $55, $AA, $40, $B0, $07, $38
        defb $2A, $D5, $00, $CF, $03, $E4
        defb $55, $AA, $00, $85, $03, $54
        defb $AA, $55, $84, $7A, $03, $C4
        defb $C1, $3E, $FC, $03, $03, $44
        defb $FF, $00, $FE, $01, $07, $F8
        defb $FF, $00, $FE, $01, $07, $58
        defb $FF, $00, $FC, $03, $07, $A8
        defb $FF, $00, $FC, $02, $0F, $50
        defb $FF, $00, $FC, $02, $07, $28
        defb $FF, $00, $E0, $1F, $13, $EC
        defb $FF, $00, $C3, $3C, $C1, $3E
        defb $FF, $00, $E0, $1F, $07, $F8
Spr29:
        defb 2, 21, 250, 235
        defb $E0, $1F, $7F, $80
        defb $80, $7F, $3F, $C0
        defb $80, $7F, $1F, $E0
        defb $00, $FE, $1F, $E0
        defb $19, $E0, $9F, $60
        defb $99, $40, $83, $7C
        defb $90, $49, $A9, $56
        defb $80, $44, $14, $AB
        defb $80, $41, $0A, $55
        defb $C0, $3E, $04, $AB
        defb $80, $53, $01, $56
        defb $80, $71, $03, $AC
        defb $C0, $3F, $07, $F8
        defb $F8, $07, $1F, $E0
        defb $F8, $05, $1F, $60
        defb $F0, $0E, $1F, $A0
        defb $F0, $09, $3F, $40
        defb $F0, $08, $1F, $A0
        defb $80, $7F, $4F, $B0
        defb $0F, $F0, $07, $F8
        defb $80, $7F, $1F, $E0
Spr30:
        defb 3, 21, 244, 235
        defb $C7, $38, $81, $7E, $FF, $00
        defb $AB, $54, $80, $7F, $7F, $80
        defb $54, $AB, $00, $FF, $3F, $C0
        defb $2A, $D5, $00, $E7, $3F, $C0
        defb $54, $AB, $19, $C0, $3F, $C0
        defb $AA, $55, $19, $80, $7F, $80
        defb $D4, $2B, $10, $C9, $7F, $80
        defb $E0, $1F, $00, $C2, $7F, $80
        defb $FE, $01, $00, $F8, $7F, $80
        defb $FC, $02, $00, $AF, $FF, $00
        defb $FC, $03, $00, $D6, $7F, $80
        defb $FC, $03, $00, $AA, $7F, $80
        defb $FE, $01, $00, $57, $FF, $00
        defb $FE, $01, $03, $FC, $FF, $00
        defb $FE, $01, $01, $56, $FF, $00
        defb $FE, $01, $00, $AF, $FF, $00
        defb $F0, $0F, $00, $7C, $7F, $80
        defb $F4, $0A, $10, $28, $7F, $80
        defb $F4, $0A, $00, $7F, $7F, $80
        defb $F4, $0B, $07, $F8, $BF, $40
        defb $F0, $0F, $00, $FF, $7F, $80
Spr31:
        defb 3, 21, 248, 235
        defb $F8, $07, $1F, $E0, $FF, $00
        defb $F8, $07, $07, $F8, $FF, $00
        defb $E0, $1F, $03, $FC, $FF, $00
        defb $E0, $1E, $03, $7C, $FF, $00
        defb $E1, $1C, $93, $0C, $FF, $00
        defb $E1, $18, $97, $08, $FF, $00
        defb $E1, $1C, $07, $98, $FF, $00
        defb $F0, $0C, $07, $28, $83, $7C
        defb $F0, $0F, $07, $08, $55, $AA
        defb $C0, $3A, $02, $FD, $AA, $55
        defb $80, $55, $00, $43, $54, $AB
        defb $00, $9A, $00, $C3, $AA, $55
        defb $80, $75, $03, $7C, $55, $AA
        defb $E0, $1F, $3F, $C0, $83, $7C
        defb $E0, $15, $1F, $60, $FF, $00
        defb $E0, $1A, $0F, $F0, $FF, $00
        defb $00, $F7, $07, $C8, $FF, $00
        defb $41, $A2, $07, $88, $FF, $00
        defb $40, $A7, $07, $F8, $FF, $00
        defb $40, $BF, $7B, $84, $FF, $00
        defb $00, $FF, $07, $F8, $FF, $00
Spr32:
        defb 3, 23, 241, 233
        defb $C7, $38, $FF, $00, $FF, $00
        defb $AB, $54, $FF, $00, $FF, $00
        defb $55, $AA, $F0, $0F, $3F, $C0
        defb $2A, $D5, $C0, $3F, $1F, $E0
        defb $54, $AB, $C0, $3F, $0F, $F0
        defb $AA, $55, $80, $7F, $0F, $70
        defb $D4, $2B, $8C, $70, $CF, $30
        defb $E0, $1F, $CC, $20, $CF, $10
        defb $FE, $01, $08, $E4, $4F, $90
        defb $FE, $01, $00, $21, $0F, $10
        defb $FE, $01, $00, $30, $0F, $10
        defb $FE, $01, $00, $BF, $1F, $E0
        defb $FF, $00, $80, $6A, $0F, $D0
        defb $FF, $00, $C0, $35, $07, $88
        defb $FF, $00, $C0, $2A, $07, $F8
        defb $FF, $00, $C0, $3F, $7F, $80
        defb $FF, $00, $C0, $2A, $3F, $C0
        defb $FF, $00, $C0, $35, $1F, $E0
        defb $FE, $01, $00, $EF, $0F, $90
        defb $FE, $01, $82, $45, $0F, $10
        defb $FE, $01, $80, $4F, $0F, $F0
        defb $FE, $01, $80, $7F, $F7, $08
        defb $FE, $01, $00, $FF, $0F, $F0
Spr33:
        defb 3, 22, 241, 234
        defb $C7, $38, $FF, $00, $FF, $00
        defb $AB, $54, $F0, $0F, $3F, $C0
        defb $55, $AA, $C0, $3F, $3F, $C0
        defb $2A, $D5, $80, $7F, $0F, $F0
        defb $54, $AB, $80, $7C, $0F, $F0
        defb $AA, $55, $93, $60, $0F, $70
        defb $D4, $2B, $D3, $20, $0F, $30
        defb $E0, $1F, $01, $F2, $0F, $70
        defb $FF, $00, $00, $A8, $1F, $60
        defb $FF, $00, $00, $A0, $0F, $70
        defb $FF, $00, $80, $5F, $07, $C8
        defb $FF, $00, $C0, $3A, $07, $A8
        defb $FF, $00, $F8, $05, $07, $88
        defb $FF, $00, $F8, $06, $07, $88
        defb $FF, $00, $FC, $03, $0F, $F0
        defb $FF, $00, $FC, $02, $0F, $B0
        defb $FF, $00, $F8, $07, $0F, $50
        defb $FF, $00, $F8, $04, $1F, $A0
        defb $FF, $00, $F8, $04, $0F, $50
        defb $FF, $00, $C0, $3F, $27, $D8
        defb $FF, $00, $87, $78, $83, $7C
        defb $FF, $00, $C0, $3F, $0F, $F0
Spr34:
        defb 3, 21, 241, 235
        defb $FF, $00, $F0, $0F, $3F, $C0
        defb $FF, $00, $C0, $3F, $3F, $C0
        defb $FF, $00, $80, $7F, $0F, $F0
        defb $C7, $38, $80, $7C, $0F, $F0
        defb $AB, $54, $93, $60, $0F, $70
        defb $55, $AA, $D3, $20, $0F, $30
        defb $2A, $D5, $C1, $32, $0F, $70
        defb $54, $AB, $C0, $28, $1F, $60
        defb $AA, $55, $80, $60, $0F, $70
        defb $D4, $2B, $00, $9F, $07, $C8
        defb $E0, $1F, $00, $0A, $07, $A8
        defb $FF, $00, $08, $F5, $07, $88
        defb $FF, $00, $F8, $06, $07, $88
        defb $FF, $00, $FC, $03, $0F, $F0
        defb $FF, $00, $FC, $02, $0F, $B0
        defb $FF, $00, $F8, $07, $0F, $50
        defb $FF, $00, $F8, $04, $1F, $A0
        defb $FF, $00, $F8, $04, $0F, $50
        defb $FF, $00, $C0, $3F, $27, $D8
        defb $FF, $00, $87, $78, $83, $7C
        defb $FF, $00, $C0, $3F, $0F, $F0
Spr35:
        defb 3, 21, 249, 235
        defb $F0, $0F, $3F, $C0, $1F, $E0
        defb $F0, $0F, $0E, $F1, $AF, $50
        defb $C0, $3F, $05, $FA, $57, $A8
        defb $C0, $3C, $02, $FD, $A7, $58
        defb $C3, $38, $21, $1E, $57, $A8
        defb $C3, $30, $2A, $15, $AF, $50
        defb $C2, $39, $09, $36, $5F, $A0
        defb $E0, $18, $00, $5F, $3F, $C0
        defb $E0, $1E, $03, $14, $FF, $00
        defb $E0, $15, $03, $E4, $FF, $00
        defb $C0, $2A, $07, $C8, $FF, $00
        defb $C0, $35, $0F, $50, $FF, $00
        defb $C0, $2A, $1F, $E0, $FF, $00
        defb $C0, $3F, $FF, $00, $FF, $00
        defb $C0, $2B, $FF, $00, $FF, $00
        defb $C0, $37, $7F, $80, $FF, $00
        defb $E0, $1C, $7F, $80, $FF, $00
        defb $C0, $28, $7F, $80, $FF, $00
        defb $90, $6F, $0F, $F0, $FF, $00
        defb $07, $F8, $87, $78, $FF, $00
        defb $C0, $3F, $0F, $F0, $FF, $00
Spr36:
        defb 3, 21, 248, 235
        defb $F8, $07, $1F, $E0, $FF, $00
        defb $F8, $07, $07, $F8, $FF, $00
        defb $E0, $1F, $03, $FC, $C7, $38
        defb $E0, $1E, $03, $7C, $AB, $54
        defb $E1, $1C, $93, $0C, $55, $AA
        defb $E1, $18, $96, $09, $A9, $56
        defb $E1, $1C, $06, $99, $55, $AA
        defb $F0, $0C, $06, $29, $AB, $54
        defb $F0, $0F, $06, $09, $57, $A8
        defb $C0, $3A, $02, $FD, $0F, $F0
        defb $80, $55, $00, $43, $FF, $00
        defb $00, $9A, $00, $C3, $FF, $00
        defb $80, $75, $03, $7C, $FF, $00
        defb $E0, $1F, $7F, $80, $FF, $00
        defb $E0, $15, $7F, $80, $FF, $00
        defb $E0, $1B, $3F, $C0, $FF, $00
        defb $F0, $0E, $3F, $40, $FF, $00
        defb $E0, $14, $3F, $40, $FF, $00
        defb $C8, $37, $07, $F8, $FF, $00
        defb $83, $7C, $C3, $3C, $FF, $00
        defb $E0, $1F, $07, $F8, $FF, $00
Spr37:
        defb 3, 21, 244, 235
        defb $C7, $38, $81, $7E, $FF, $00
        defb $AB, $54, $80, $7F, $7F, $80
        defb $54, $AB, $00, $FF, $3F, $C0
        defb $2A, $D5, $00, $E7, $3F, $C0
        defb $54, $AB, $19, $C0, $3F, $C0
        defb $AA, $55, $19, $80, $7F, $80
        defb $D4, $2B, $10, $C9, $7F, $80
        defb $E0, $1F, $00, $C2, $7F, $80
        defb $FE, $01, $00, $F8, $7F, $80
        defb $FC, $02, $00, $AF, $FF, $00
        defb $FC, $03, $00, $D6, $7F, $80
        defb $FC, $03, $00, $AA, $7F, $80
        defb $FE, $01, $00, $57, $FF, $00
        defb $FE, $01, $03, $FC, $FF, $00
        defb $FE, $01, $01, $56, $FF, $00
        defb $FE, $01, $00, $AF, $FF, $00
        defb $F0, $0F, $00, $7C, $7F, $80
        defb $F4, $0A, $10, $28, $7F, $80
        defb $F4, $0A, $00, $7F, $7F, $80
        defb $F4, $0B, $07, $F8, $BF, $40
        defb $F0, $0F, $00, $FF, $7F, $80
Spr38:
        defb 3, 21, 244, 235
        defb $C7, $38, $81, $7E, $FF, $00
        defb $AB, $54, $80, $7F, $7F, $80
        defb $54, $AB, $00, $FF, $3F, $C0
        defb $2A, $D5, $00, $E7, $3F, $C0
        defb $54, $AB, $19, $C0, $3F, $C0
        defb $AA, $55, $19, $80, $7F, $80
        defb $D4, $2B, $10, $C9, $7F, $80
        defb $E0, $1F, $00, $C2, $7F, $80
        defb $FE, $01, $00, $F8, $7F, $80
        defb $FC, $02, $00, $AF, $FF, $00
        defb $FC, $03, $00, $D6, $7F, $80
        defb $FC, $03, $00, $AA, $7F, $80
        defb $FE, $01, $00, $57, $FF, $00
        defb $FE, $01, $07, $F8, $FF, $00
        defb $FE, $01, $07, $58, $FF, $00
        defb $FE, $01, $03, $BC, $FF, $00
        defb $FF, $00, $03, $E4, $FF, $00
        defb $FE, $01, $03, $44, $FF, $00
        defb $FC, $03, $80, $7F, $7F, $80
        defb $F8, $07, $3C, $C3, $3F, $C0
        defb $FE, $01, $00, $FF, $7F, $80
Spr39:
        defb 3, 21, 250, 235
        defb $E0, $1F, $7F, $80, $8F, $70
        defb $80, $7F, $7F, $80, $57, $A8
        defb $00, $FF, $1E, $E1, $AB, $54
        defb $00, $F9, $1D, $E2, $53, $AC
        defb $26, $C0, $1C, $E3, $AB, $54
        defb $A6, $40, $1D, $62, $57, $A8
        defb $82, $64, $1C, $E3, $AF, $50
        defb $80, $50, $20, $DF, $1F, $E0
        defb $80, $43, $03, $E4, $FF, $00
        defb $C0, $3E, $03, $C4, $FF, $00
        defb $E0, $15, $07, $68, $FF, $00
        defb $80, $62, $0F, $B0, $FF, $00
        defb $00, $85, $1F, $60, $FF, $00
        defb $80, $7F, $1F, $E0, $FF, $00
        defb $F8, $05, $1F, $60, $FF, $00
        defb $F0, $0A, $1F, $A0, $FF, $00
        defb $F0, $09, $3F, $40, $FF, $00
        defb $F0, $08, $1F, $A0, $FF, $00
        defb $80, $7F, $4F, $B0, $FF, $00
        defb $0F, $F0, $07, $F8, $FF, $00
        defb $80, $7F, $1F, $E0, $FF, $00
Spr40:
        defb 1, 5, 254, 251
        defb $8F, $70
        defb $07, $88
        defb $07, $88
        defb $07, $88
        defb $8F, $70
Spr41:
        defb 1, 6, 253, 250
        defb $CF, $30
        defb $87, $48
        defb $03, $84
        defb $03, $84
        defb $87, $48
        defb $CF, $30
Spr42:
        defb 1, 7, 253, 250
        defb $C7, $38
        defb $83, $44
        defb $01, $82
        defb $01, $82
        defb $01, $82
        defb $83, $44
        defb $C7, $38
Spr43:
        defb 1, 3, 254, 253
        defb $8F, $70
        defb $07, $F8
        defb $8F, $70
Spr44:
        defb 1, 3, 255, 254
        defb $9F, $40
        defb $6F, $80
        defb $9F, $40
    END ASM
END SUB

#endif
