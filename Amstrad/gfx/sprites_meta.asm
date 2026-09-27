; Fichier généré par tools/gen_cpcsprites.py : sprites (mode 1).

NSPRITES    equ 45
SPR_AREA_B_SIZE equ 3440
spr_raw_tab                     ; image non décalée (utilisée au démarrage)
        dw spr_raw0
        dw spr_raw1
        dw spr_raw2
        dw spr_raw3
        dw spr_raw4
        dw spr_raw5
        dw spr_raw6
        dw spr_raw7
        dw spr_raw8
        dw spr_raw9
        dw spr_raw10
        dw spr_raw11
        dw spr_raw12
        dw spr_raw13
        dw spr_raw14
        dw spr_raw15
        dw spr_raw16
        dw spr_raw17
        dw spr_raw18
        dw spr_raw19
        dw spr_raw20
        dw spr_raw21
        dw spr_raw22
        dw spr_raw23
        dw spr_raw24
        dw spr_raw25
        dw spr_raw26
        dw spr_raw27
        dw spr_raw28
        dw spr_raw29
        dw spr_raw30
        dw spr_raw31
        dw spr_raw32
        dw spr_raw33
        dw spr_raw34
        dw spr_raw35
        dw spr_raw36
        dw spr_raw37
        dw spr_raw38
        dw spr_raw39
        dw spr_raw40
        dw spr_raw41
        dw spr_raw42
        dw spr_raw43
        dw spr_raw44
spr_ptr                         ; image décalée : [numéro x 4 + décalage]
        dw $A600, $A686, $A708, $A789
        dw $A80A, $A8A0, $A936, $A9CA
        dw $AA64, $AAFD, $AB99, $AC35
        dw $ACD6, $AD6C, $AE02, $AE96
        dw $AF30, $AFC1, $B058, $B0F2
        dw $B188, $B231, $B2DF, $B38C
        dw $B439, $B4B6, $B535, $B5B1
        dw $B62D, $B6C3, $B759, $B7ED
        dw $B887, $B91A, $B9AA, $BA37
        dw $BAC5, $BB43, $BBC0, $BC3A
        dw $BCB6, $BD40, $BDCA, $BE4D
        dw $BED5, $BF64, $D000, $D08F
        dw $D11D, $D1AA, $D23A, $D2CB
        dw $D355, $D3E4, $D472, $D4FD
        dw $D589, $D616, $D6A3, $D72C
        dw $D7B4, $D841, $D8D2, $D95F
        dw $D9EC, $DA75, $DAFF, $DB8A
        dw $DC19, $DE00, $DE8A, $DF0D
        dw $DF95, $E022, $E0B3, $E13E
        dw $E1CC, $E263, $E2F9, $E38E
        dw $E429, $E497, $E509, $E580
        dw $E5F0, $E66D, $E6ED, $E773
        dw $E7F4, $E879, $E8FF, $E988
        dw $EA10, $EA8D, $EB0D, $EB93
        dw $EC14, $EC91, $ED10, $ED8F
        dw $EE10, $EEB1, $EF54, $EFF7
        dw $F0A0, $F10B, $F177, $F1EB
        dw $F259, $F2D6, $F356, $F3DC
        dw $F45D, $F4DF, $F55D, $F5D5
        dw $F64F, $F6BC, $F72C, $F7A4
        dw $F814, $F894, $F911, $F98B
        dw $FA08, $FA8D, $FB0E, $FB92
        dw $FC18, $FCA1, $FD2C, $FDB3
        dw $FE3A, $FEB4, spr_area_b+0, spr_area_b+127
        dw spr_area_b+248, spr_area_b+368, spr_area_b+498, spr_area_b+623
        dw spr_area_b+743, spr_area_b+867, spr_area_b+994, spr_area_b+1111
        dw spr_area_b+1230, spr_area_b+1360, spr_area_b+1483, spr_area_b+1608
        dw spr_area_b+1735, spr_area_b+1863, spr_area_b+1988, spr_area_b+2110
        dw spr_area_b+2235, spr_area_b+2360, spr_area_b+2479, spr_area_b+2593
        dw spr_area_b+2711, spr_area_b+2837, spr_area_b+2965, spr_area_b+3099
        dw $DCA3, $DCB5, $DCC9, $DCDD
        dw $FF38, $FF4E, $FF66, spr_area_b+3229
        dw spr_area_b+3251, spr_area_b+3279, spr_area_b+3307, spr_area_b+3336
        dw $DCEF, spr_area_b+3365, spr_area_b+3377, spr_area_b+3389
        dw spr_area_b+3399, spr_area_b+3408, spr_area_b+3418, spr_area_b+3430
spr_wtab                        ; largeur en octets : [numéro x 4 + décalage]
        db 4, 5, 5, 5
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 4, 5, 5, 5
        db 4, 5, 5, 5
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 4, 5, 5, 5
        db 5, 6, 6, 6
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 5, 6, 6, 6
        db 5, 6, 6, 6
        db 6, 7, 7, 7
        db 4, 5, 5, 5
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 4, 5, 5, 5
        db 4, 5, 5, 5
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 4, 5, 5, 5
        db 5, 6, 6, 6
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 6, 7, 7, 7
        db 5, 6, 6, 6
        db 5, 6, 6, 6
        db 6, 7, 7, 7
        db 2, 3, 3, 3
        db 2, 3, 3, 3
        db 2, 3, 3, 3
        db 2, 3, 3, 3
        db 1, 2, 2, 2
spr_htab
        db 23, 24, 24, 24, 24, 32, 23, 24, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 21, 21, 21, 21, 22, 32, 21, 21, 21, 21, 21, 21, 23, 22, 21, 21, 21, 21, 21, 21, 5, 6, 7, 3, 3
spr_x0tab                       ; décalage signé depuis le point d'ancrage
        db 248, 240, 240, 240, 240, 248, 248, 240, 249, 248, 248, 240, 249, 249, 249, 240, 242, 248, 248, 240, 250, 250, 250, 250, 250, 248, 250, 250, 240, 250, 244, 248, 241, 241, 241, 249, 248, 244, 244, 250, 254, 253, 253, 254, 255
spr_y0tab
        db 233, 232, 232, 232, 232, 224, 233, 232, 233, 233, 233, 233, 233, 233, 233, 233, 233, 233, 233, 232, 235, 235, 235, 235, 234, 224, 235, 235, 235, 235, 235, 235, 233, 234, 235, 235, 235, 235, 235, 235, 251, 250, 250, 253, 254
