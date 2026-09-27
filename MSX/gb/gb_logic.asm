; Fichier généré par tools/gb2z80.py à partir de la ROM Game Boy.
; Ne pas modifier à la main : relancer le script.

G_00A9:
        push bc                       ; $00A9
        ld a,($C1A4)                  ; $00AA
        ld b,a                        ; $00AC
        add a,a                       ; $00AD
        add a,a                       ; $00AE
        add a,b                       ; $00AF
        add a,$0B                     ; $00B0
        ld ($C1A4),a                  ; $00B2
        pop bc                        ; $00B4
        ret                           ; $00B5
G_00C3:
        ld a,l                        ; $00C3
        sub e                         ; $00C4
        ld e,a                        ; $00C5
        ld a,h                        ; $00C6
        sbc a,d                       ; $00C7
        ld d,a                        ; $00C8
        ret                           ; $00C9
G_00CA:
        cp $64                        ; $00CA
        ret nc                        ; $00CC
        ld b,a                        ; $00CD
        srl b                         ; $00CE
        add a,a                       ; $00D0
        add a,b                       ; $00D1
        ld l,a                        ; $00D2
        call G_00A9                   ; $00D3
        cp l                          ; $00D6
        ccf                           ; $00D7
        ret                           ; $00D8
G_00D9:
        cp $64                        ; $00D9
        ret nc                        ; $00DB
        ld b,a                        ; $00DC
        srl b                         ; $00DD
        add a,a                       ; $00DF
        add a,b                       ; $00E0
        ld l,a                        ; $00E1
        ld a,($C1A4)                  ; $00E2
        cp l                          ; $00E4
        ccf                           ; $00E5
        ret                           ; $00E6
G_0885:
        ld a,($C004)                  ; $0885
        add a,$80                     ; $0888
        ld a,($C005)                  ; $088A
        adc a,$00                     ; $088D
        ret                           ; $088F
G_0890:
        ld a,($C002)                  ; $0890
        add a,$80                     ; $0893
        ld a,($C003)                  ; $0895
        adc a,$00                     ; $0898
        ret                           ; $089A
G_089B:
        ld a,($C024)                  ; $089B
        add a,$80                     ; $089E
        ld a,($C025)                  ; $08A0
        adc a,$00                     ; $08A3
        ret                           ; $08A5
G_08A6:
        ld a,($C022)                  ; $08A6
        add a,$80                     ; $08A9
        ld a,($C023)                  ; $08AB
        adc a,$00                     ; $08AE
        ret                           ; $08B0
G_08B1:
        ld a,($C044)                  ; $08B1
        add a,$80                     ; $08B4
        ld a,($C045)                  ; $08B6
        adc a,$00                     ; $08B9
        ret                           ; $08BB
G_08BC:
        ld a,($C042)                  ; $08BC
        add a,$80                     ; $08BF
        ld a,($C043)                  ; $08C1
        adc a,$00                     ; $08C4
        ret                           ; $08C6
G_08C7:
        push hl                       ; $08C7
        ld a,(hl)                     ; $08C8
        inc hl                        
        ld h,(hl)                     ; $08C9
        ld l,a                        ; $08CA
        bit 5,c                       ; $08CB
        jp z,G_08DF                   ; $08CD
        ld de,$07FF                   ; $08CF
        call G_00C3                   ; $08D2
        jp c,G_08F1                   ; $08D5
        ld a,l                        ; $08D7
        sub b                         ; $08D8
        ld l,a                        ; $08D9
        jp nc,G_08F1                  ; $08DA
        dec h                         ; $08DC
        jp G_08F1                     ; $08DD
G_08DF:
        bit 4,c                       ; $08DF
        jp z,G_08F1                   ; $08E1
        ld de,$D001                   ; $08E3
        call G_00C3                   ; $08E6
        jp nc,G_08F1                  ; $08E9
        ld a,l                        ; $08EB
        add a,b                       ; $08EC
        ld l,a                        ; $08ED
        jp nc,G_08F1                  ; $08EE
        inc h                         ; $08F0
G_08F1:
        push hl                       ; $08F1
        pop de                        ; $08F2
        pop hl                        ; $08F3
        ld a,e                        ; $08F4
        ld (hl),a                     ; $08F5
        inc hl                        
        ld (hl),d                     ; $08F6
        ret                           ; $08F7
G_08F8:
        push hl                       ; $08F8
        ld a,(hl)                     ; $08F9
        inc hl                        
        ld h,(hl)                     ; $08FA
        ld l,a                        ; $08FB
        bit 6,c                       ; $08FC
        jp z,G_0924                   ; $08FE
        ld a,($C196)                  ; $0900
        bit 7,a                       ; $0902
        jp z,G_0914                   ; $0904
        ld de,$08FF                   ; $0906
        call G_00C3                   ; $0909
        jp c,G_094A                   ; $090C
        ld a,b                        ; $090E
        sub $14                       ; $090F
        ld b,a                        ; $0911
        jp G_091C                     ; $0912
G_0914:
        ld de,$8500                   ; $0914
        call G_00C3                   ; $0917
        jp c,G_094A                   ; $091A
G_091C:
        ld a,l                        ; $091C
        sub b                         ; $091D
        ld l,a                        ; $091E
        jp nc,G_094A                  ; $091F
        dec h                         ; $0921
        jp G_094A                     ; $0922
G_0924:
        bit 7,c                       ; $0924
        jp z,G_094A                   ; $0926
        ld a,($C196)                  ; $0928
        bit 7,a                       ; $092A
        jp nz,G_093C                  ; $092C
        ld de,$E701                   ; $092E
        call G_00C3                   ; $0931
        jp nc,G_094A                  ; $0934
        ld a,b                        ; $0936
        sub $14                       ; $0937
        ld b,a                        ; $0939
        jp G_0944                     ; $093A
G_093C:
        ld de,$6B00                   ; $093C
        call G_00C3                   ; $093F
        jp nc,G_094A                  ; $0942
G_0944:
        ld a,l                        ; $0944
        add a,b                       ; $0945
        ld l,a                        ; $0946
        jp nc,G_094A                  ; $0947
        inc h                         ; $0949
G_094A:
        push hl                       ; $094A
        pop de                        ; $094B
        pop hl                        ; $094C
        ld a,e                        ; $094D
        ld (hl),a                     ; $094E
        inc hl                        
        ld (hl),d                     ; $094F
        ret                           ; $0950
G_09FA:
        ld a,(hl)                     ; $09FA
        inc hl                        
        ld a,(hl)                     ; $09FB
        inc hl                        
        ld d,a                        ; $09FC
        ld a,(hl)                     ; $09FD
        inc hl                        
        ld a,(hl)                     ; $09FE
        ld e,a                        ; $09FF
        ld c,$00                      ; $0A00
        ld a,d                        ; $0A02
        cp $78                        ; $0A03
        jp c,G_0A12                   ; $0A05
        set 1,c                       ; $0A07
        cpl                           ; $0A09
        add a,$F0                     ; $0A0A
        ld d,a                        ; $0A0C
        ld a,e                        ; $0A0D
        cpl                           ; $0A0E
        add a,$D8                     ; $0A0F
        ld e,a                        ; $0A11
G_0A12:
        ld a,e                        ; $0A12
        cp $6C                        ; $0A13
        jp c,G_0A1C                   ; $0A15
        set 0,c                       ; $0A17
        cpl                           ; $0A19
        add a,$D8                     ; $0A1A
G_0A1C:
        cp $36                        ; $0A1C
        ret c                         ; $0A1E
        ld a,d                        ; $0A1F
        cp $37                        ; $0A20
        jp c,G_0A29                   ; $0A22
        set 3,c                       ; $0A24
        cp $55                        ; $0A26
        ret c                         ; $0A28
G_0A29:
        set 2,c                       ; $0A29
        ret                           ; $0A2B
G_0A2C:
        ld c,$00                      ; $0A2C
        cp $08                        ; $0A2E
        ret z                         ; $0A30
        inc c                         ; $0A31
        cp $0B                        ; $0A32
        ret z                         ; $0A34
        inc c                         ; $0A35
        cp $0E                        ; $0A36
        ret z                         ; $0A38
        inc c                         ; $0A39
        cp $10                        ; $0A3A
        ret z                         ; $0A3C
        inc c                         ; $0A3D
        cp $05                        ; $0A3E
        ret                           ; $0A40
G_0A9D:
        ld hl,$C080                   ; $0A9D
        ld b,$40                      ; $0AA0
        xor a                         ; $0AA2
G_0AA3:
        ld (hl),a                     ; $0AA3
        inc hl                        
        dec b                         ; $0AA4
        jp nz,G_0AA3                  ; $0AA5
        ld a,($C0DF)                  ; $0AA7
        dec a                         ; $0AAA
        ld ($C1C5),a                  ; $0AAB
        call G_RST18                  ; $0AAD
        db $04, $A0, $B0, $D0, $FF
        ld ($C088),a                  ; $0AB3
        ld ($C0A8),a                  ; $0AB6
        ld a,($C1C5)                  ; $0AB9
        call G_RST18                  ; $0ABB
        db $04, $90, $A0, $C0, $FF
        ld ($C089),a                  ; $0AC1
        ld ($C0A9),a                  ; $0AC4
        ld a,($C1C5)                  ; $0AC7
        ld hl,D_0B35                  ; $0AC9
        call G_3047                   ; $0ACC
        ld de,$C090                   ; $0ACF
        ld b,$10                      ; $0AD2
G_0AD4:
        ld a,(hl)                     ; $0AD4
        inc hl                        
        ld (de),a                     ; $0AD5
        inc e                         ; $0AD6
        dec b                         ; $0AD7
        jp nz,G_0AD4                  ; $0AD8
        ld a,($C1C5)                  ; $0ADA
        ld hl,D_0B35                  ; $0ADC
        call G_3047                   ; $0ADF
        ld de,$C0B0                   ; $0AE2
        ld b,$10                      ; $0AE5
G_0AE7:
        ld a,(hl)                     ; $0AE7
        inc hl                        
        ld (de),a                     ; $0AE8
        inc e                         ; $0AE9
        dec b                         ; $0AEA
        jp nz,G_0AE7                  ; $0AEB
        ld a,($C090)                  ; $0AED
        cpl                           ; $0AF0
        inc a                         ; $0AF1
        sub $10                       ; $0AF2
        ld ($C090),a                  ; $0AF4
        ld a,($C196)                  ; $0AF7
        bit 0,a                       ; $0AF9
        jp nz,G_0B25                  ; $0AFB
        ld a,($C1AF)                  ; $0AFD
        bit 7,a                       ; $0AFF
        jp nz,G_0B25                  ; $0B01
        ld hl,$C092                   ; $0B03
        call G_0B26                   ; $0B06
        ld hl,$C096                   ; $0B09
        call G_0B26                   ; $0B0C
        ld a,($C1C5)                  ; $0B0F
        call G_RST18                  ; $0B11
        db $04, $C0, $C8, $D0, $F0
        ld ($C088),a                  ; $0B17
        ld a,($C1C5)                  ; $0B1A
        call G_RST18                  ; $0B1C
        db $04, $A0, $A0, $B0, $C0
        ld ($C089),a                  ; $0B22
G_0B25:
        ret                           ; $0B25
G_0B26:
        ld a,($C0DF)                  ; $0B26
        cp $01                        ; $0B29
        ret z                         ; $0B2B
        ld a,(hl)                     ; $0B2C
        ld b,a                        ; $0B2D
        srl b                         ; $0B2E
        srl b                         ; $0B30
        sub b                         ; $0B32
        ld (hl),a                     ; $0B33
        ret                           ; $0B34
G_0B7D:
        ld hl,$C196                   ; $0B7D
        res 7,(hl)                    ; $0B80
        ld hl,$C002                   ; $0B82
        call G_09FA                   ; $0B85
        ld a,c                        ; $0B88
        ld ($C00B),a                  ; $0B89
        ld a,($C000)                  ; $0B8C
        call G_RST08                  ; $0B8F
        dw G_0BA0, G_0BD9, G_0BE2, G_0C4C, G_0C9A, G_0CB7, G_0D3D, G_0D76
G_0BA0:
        call G_0DA5                   ; $0BA0
        call G_0BCD                   ; $0BA3
        ld a,$01                      ; $0BA6
        ld ($C000),a                  ; $0BA8
        ret                           ; $0BAB
G_0BAC:
        ld a,($C191)                  ; $0BAC
        bit 1,a                       ; $0BAE
        ld a,$58                      ; $0BB0
        jp nz,G_0BB6                  ; $0BB2
        ld a,$7F                      ; $0BB4
G_0BB6:
        ld ($C005),a                  ; $0BB6
        ld a,$7F                      ; $0BB9
        jp nz,G_0BBF                  ; $0BBB
        ld a,$80                      ; $0BBD
G_0BBF:
        ld ($C004),a                  ; $0BBF
        ld a,$B9                      ; $0BC2
        ld ($C003),a                  ; $0BC4
        ld a,$80                      ; $0BC7
        ld ($C002),a                  ; $0BC9
        ret                           ; $0BCC
G_0BCD:
        ld a,($C191)                  ; $0BCD
        bit 1,a                       ; $0BCF
        ld a,$45                      ; $0BD1
        jp nz,G_0BD7                  ; $0BD3
        ld a,$92                      ; $0BD5
G_0BD7:
        jp G_0BB6                     ; $0BD7
G_0BD9:
        call G_0DB8                   ; $0BD9
        call G_0DFE                   ; $0BDC
        jp G_10A9                     ; $0BDF
G_0BE2:
        ld a,($C00A)                  ; $0BE2
        cp $06                        ; $0BE5
        jp z,G_0BF7                   ; $0BE7
        cp $09                        ; $0BE9
        jp z,G_0BF7                   ; $0BEB
        ld a,($C011)                  ; $0BED
        call G_RST18                  ; $0BF0
        db $03, $04, $08, $06
        jp G_0BFF                     ; $0BF5
G_0BF7:
        ld a,($C011)                  ; $0BF7
        call G_RST18                  ; $0BFA
        db $03, $0A, $0C, $01
G_0BFF:
        ld b,a                        ; $0BFF
        ld a,($C010)                  ; $0C00
        inc a                         ; $0C03
        ld ($C010),a                  ; $0C04
        cp b                          ; $0C07
        jp c,G_0C19                   ; $0C08
        xor a                         ; $0C0A
        ld ($C010),a                  ; $0C0B
        ld a,($C011)                  ; $0C0E
        inc a                         ; $0C11
        cp $03                        ; $0C12
        jp nc,G_0C3E                  ; $0C14
        ld ($C011),a                  ; $0C16
G_0C19:
        ld a,($C00A)                  ; $0C19
        ld b,a                        ; $0C1C
        ld a,($C011)                  ; $0C1D
        add a,b                       ; $0C20
        call G_RST18                  ; $0C21
        db $12, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0E, $0F, $10, $10, $04, $05, $06, $04, $05, $06
        ld ($C001),a                  ; $0C35
        call G_0E77                   ; $0C38
        jp G_10A9                     ; $0C3B
G_0C3E:
        xor a                         ; $0C3E
        ld ($C010),a                  ; $0C3F
        ld ($C011),a                  ; $0C42
        inc a                         ; $0C45
        ld ($C000),a                  ; $0C46
        jp G_10A9                     ; $0C49
G_0C4C:
        ld a,$03                      ; $0C4C
        ld ($C001),a                  ; $0C4E
        ld a,($C017)                  ; $0C51
        and a                         ; $0C54
        jp nz,G_0C62                  ; $0C55
        ld a,$01                      ; $0C57
        ld ($C040),a                  ; $0C59
        ld a,$0E                      ; $0C5C
        ld ($C047),a                  ; $0C5E
        xor a                         ; $0C61
G_0C62:
        inc a                         ; $0C62
        ld ($C017),a                  ; $0C63
        cp $10                        ; $0C66
        jp c,G_0C80                   ; $0C68
        sub $10                       ; $0C6A
        cp $04                        ; $0C6C
        jp c,G_0C99                   ; $0C6E
        sub $04                       ; $0C70
        cp $10                        ; $0C72
        jp c,G_0C80                   ; $0C74
        xor a                         ; $0C76
        ld ($C017),a                  ; $0C77
        ld a,$05                      ; $0C7A
        ld ($C000),a                  ; $0C7C
        ret                           ; $0C7F
G_0C80:
        sub $08                       ; $0C80
        ld a,($C047)                  ; $0C82
        jp c,G_0C8B                   ; $0C85
        inc a                         ; $0C87
        inc a                         ; $0C88
        jp G_0C8D                     ; $0C89
G_0C8B:
        dec a                         ; $0C8B
        dec a                         ; $0C8C
G_0C8D:
        ld ($C047),a                  ; $0C8D
        cp $0E                        ; $0C90
        jp nc,G_0C99                  ; $0C92
        ld a,$13                      ; $0C94
        ld ($C001),a                  ; $0C96
G_0C99:
        ret                           ; $0C99
G_0C9A:
        call G_0DA5                   ; $0C9A
        xor a                         ; $0C9D
        ld ($C1AD),a                  ; $0C9E
        ld ($C017),a                  ; $0CA0
        call G_0BAC                   ; $0CA3
        call S_RET                    ; $0CA6
        ld a,($C1BB)                  ; $0CA9
        ld ($C1A8),a                  ; $0CAB
        ld a,$30                      ; $0CAD
        ld ($C1AA),a                  ; $0CAF
        ld a,$05                      ; $0CB1
        ld ($C000),a                  ; $0CB3
        ret                           ; $0CB6
G_0CB7:
        ld a,$03                      ; $0CB7
        ld ($C001),a                  ; $0CB9
        ld a,($C19A)                  ; $0CBC
        and a                         ; $0CBE
        jp nz,G_0CD6                  ; $0CBF
        ld a,($C017)                  ; $0CC1
        inc a                         ; $0CC4
        ld ($C017),a                  ; $0CC5
        cp $B4                        ; $0CC8
        jp c,G_0D13                   ; $0CCA
        xor a                         ; $0CCC
        ld ($C017),a                  ; $0CCD
        ld a,$03                      ; $0CD0
        ld ($C000),a                  ; $0CD2
        ret                           ; $0CD5
G_0CD6:
        xor a                         ; $0CD6
        ld ($C017),a                  ; $0CD7
        ld a,($C19A)                  ; $0CDA
        ld c,a                        ; $0CDC
        ld a,($C191)                  ; $0CDD
        bit 1,a                       ; $0CDF
        ld de,$3F80                   ; $0CE1
        jp nz,G_0CE9                  ; $0CE4
        ld de,$7380                   ; $0CE6
G_0CE9:
        ld hl,$C004                   ; $0CE9
        ld a,(hl)                     ; $0CEC
        inc hl                        
        ld h,(hl)                     ; $0CED
        ld l,a                        ; $0CEE
        call G_00C3                   ; $0CEF
        jp nc,G_0CF6                  ; $0CF2
        res 5,c                       ; $0CF4
G_0CF6:
        ld a,($C191)                  ; $0CF6
        bit 1,a                       ; $0CF8
        ld de,$6480                   ; $0CFA
        jp nz,G_0D02                  ; $0CFD
        ld de,$9880                   ; $0CFF
G_0D02:
        call G_00C3                   ; $0D02
        jp c,G_0D09                   ; $0D05
        res 4,c                       ; $0D07
G_0D09:
        ld a,($C008)                  ; $0D09
        ld b,a                        ; $0D0C
        ld hl,$C004                   ; $0D0D
        call G_08C7                   ; $0D10
G_0D13:
        ld a,($C002)                  ; $0D13
        ld ($C042),a                  ; $0D16
        ld a,($C003)                  ; $0D19
        ld ($C043),a                  ; $0D1C
        ld a,($C004)                  ; $0D1F
        ld ($C044),a                  ; $0D22
        ld a,($C005)                  ; $0D25
        add a,$06                     ; $0D28
        call G_16F9                   ; $0D2A
        ld a,($C19B)                  ; $0D2D
        and $03                       ; $0D2F
        ret z                         ; $0D31
        ld a,$02                      ; $0D32
        ld ($C040),a                  ; $0D34
        ld a,$06                      ; $0D37
        ld ($C000),a                  ; $0D39
        ret                           ; $0D3C
G_0D3D:
        ld a,$04                      ; $0D3D
        ld ($C001),a                  ; $0D3F
        ld a,($C19B)                  ; $0D42
        and $03                       ; $0D44
        jp z,G_0D5E                   ; $0D46
        ld ($C013),a                  ; $0D48
        ld a,$05                      ; $0D4B
        call S_SOUND                  ; $0D4D
        xor a                         ; $0D50
        ld ($C010),a                  ; $0D51
        ld ($C011),a                  ; $0D54
        ld a,$07                      ; $0D57
        ld ($C000),a                  ; $0D59
        jp G_0D75                     ; $0D5C
G_0D5E:
        ld a,($C052)                  ; $0D5E
        bit 7,a                       ; $0D61
        jp z,G_0D75                   ; $0D63
        ld a,($C047)                  ; $0D65
        cp $30                        ; $0D68
        jp nc,G_0D75                  ; $0D6A
        xor a                         ; $0D6C
        ld ($C017),a                  ; $0D6D
        ld a,$05                      ; $0D70
        ld ($C000),a                  ; $0D72
G_0D75:
        ret                           ; $0D75
G_0D76:
        ld a,($C011)                  ; $0D76
        call G_RST18                  ; $0D79
        db $02, $08, $0A
        ld b,a                        ; $0D7D
        ld a,($C010)                  ; $0D7E
        inc a                         ; $0D81
        ld ($C010),a                  ; $0D82
        cp b                          ; $0D85
        jp c,G_0D98                   ; $0D86
        xor a                         ; $0D88
        ld ($C010),a                  ; $0D89
        ld a,($C011)                  ; $0D8C
        inc a                         ; $0D8F
        cp $02                        ; $0D90
        jp nc,G_0C3E                  ; $0D92
        ld ($C011),a                  ; $0D95
G_0D98:
        ld a,($C011)                  ; $0D98
        call G_RST18                  ; $0D9B
        db $02, $05, $06
        ld ($C001),a                  ; $0D9F
        jp G_0E77                     ; $0DA2
G_0DA5:
        ld a,($C088)                  ; $0DA5
        ld ($C008),a                  ; $0DA8
        ld a,($C089)                  ; $0DAB
        ld ($C009),a                  ; $0DAE
        ld a,($C096)                  ; $0DB1
        ld ($C016),a                  ; $0DB4
        ret                           ; $0DB7
G_0DB8:
        ld a,($C008)                  ; $0DB8
        ld b,a                        ; $0DBB
        ld a,($C19A)                  ; $0DBC
        ld c,a                        ; $0DBE
        ld hl,$C004                   ; $0DBF
        call G_08C7                   ; $0DC2
        ld a,($C009)                  ; $0DC5
        ld b,a                        ; $0DC8
        ld hl,$C002                   ; $0DC9
        call G_08F8                   ; $0DCC
        ld a,($C011)                  ; $0DCF
        and $04                       ; $0DD2
        srl a                         ; $0DD4
        srl a                         ; $0DD6
        ld d,a                        ; $0DD8
        ld a,c                        ; $0DD9
        and $F0                       ; $0DDA
        jp z,G_0DFA                   ; $0DDC
        bit 5,a                       ; $0DDE
        jp z,G_0DE4                   ; $0DE0
        inc d                         ; $0DE2
        inc d                         ; $0DE3
G_0DE4:
        ld a,($C010)                  ; $0DE4
        add a,b                       ; $0DE7
        ld ($C010),a                  ; $0DE8
        ld a,($C011)                  ; $0DEB
        adc a,$00                     ; $0DEE
        ld ($C011),a                  ; $0DF0
        ld a,d                        ; $0DF3
        call G_RST18                  ; $0DF4
        db $04, $01, $02, $11, $12
G_0DFA:
        ld ($C001),a                  ; $0DFA
        ret                           ; $0DFD
G_0DFE:
        ld a,($C19B)                  ; $0DFE
        and $03                       ; $0E00
        ret z                         ; $0E02
        ld ($C013),a                  ; $0E03
        ld a,$05                      ; $0E06
        call S_SOUND                  ; $0E08
        call G_0890                   ; $0E0B
        call G_1722                   ; $0E0E
        ld a,($C004)                  ; $0E11
        ld e,a                        ; $0E14
        ld a,($C005)                  ; $0E15
        ld d,a                        ; $0E18
        call G_00C3                   ; $0E19
        ld a,$00                      ; $0E1C
        jp nc,G_0E22                  ; $0E1E
        ld a,$03                      ; $0E20
G_0E22:
        ld ($C00A),a                  ; $0E22
        ld hl,$0400                   ; $0E25
        add hl,de                     ; $0E28
        ld a,h                        ; $0E29
        cp $08                        ; $0E2A
        jp nc,G_0E46                  ; $0E2C
        ld a,($C19A)                  ; $0E2E
        bit 5,a                       ; $0E30
        jp z,G_0E38                   ; $0E32
        ld a,$00                      ; $0E34
        jp G_0E3E                     ; $0E36
G_0E38:
        bit 4,a                       ; $0E38
        jp z,G_0E46                   ; $0E3A
        ld a,$03                      ; $0E3C
G_0E3E:
        ld ($C00A),a                  ; $0E3E
        ld a,$FF                      ; $0E41
        ld ($C019),a                  ; $0E43
G_0E46:
        ld b,$00                      ; $0E46
        ld a,($C047)                  ; $0E48
        cp $40                        ; $0E4B
        jp c,G_0E59                   ; $0E4D
        ld a,($C00A)                  ; $0E4F
        add a,$0C                     ; $0E52
        ld ($C00A),a                  ; $0E54
        jp G_0E69                     ; $0E57
G_0E59:
        ld a,($C00B)                  ; $0E59
        cp $0C                        ; $0E5C
        jp c,G_0E69                   ; $0E5E
        ld a,($C00A)                  ; $0E60
        add a,$06                     ; $0E63
        ld ($C00A),a                  ; $0E65
        inc b                         ; $0E68
G_0E69:
        ld a,b                        ; $0E69
        ld ($C011),a                  ; $0E6A
        xor a                         ; $0E6D
        ld ($C010),a                  ; $0E6E
        ld a,$02                      ; $0E71
        ld ($C000),a                  ; $0E73
        ret                           ; $0E76
G_0E77:
        ld a,($C1AD)                  ; $0E77
        bit 7,a                       ; $0E79
        ret nz                        ; $0E7B
        bit 5,a                       ; $0E7C
        ret nz                        ; $0E7E
        bit 4,a                       ; $0E7F
        ret nz                        ; $0E81
        ld a,($C043)                  ; $0E82
        cp $78                        ; $0E85
        ret c                         ; $0E87
        ld a,($C001)                  ; $0E88
        call G_0A2C                   ; $0E8B
        ret nz                        ; $0E8E
        ld a,c                        ; $0E8F
        ld ($C018),a                  ; $0E90
        ld a,($C018)                  ; $0E93
        call G_RST18                  ; $0E96
        db $05, $F6, $F6, $F4, $F4, $F4
        add a,$10                     ; $0E9D
        ld ($C1C5),a                  ; $0E9F
        ld a,($C018)                  ; $0EA1
        call G_RST18                  ; $0EA4
        db $05, $06, $06, $02, $02, $04
        add a,$11                     ; $0EAB
        ld b,a                        ; $0EAD
        ld a,($C1C5)                  ; $0EAE
        ld c,a                        ; $0EB0
        ld hl,$C002                   ; $0EB1
        call G_1C05                   ; $0EB4
        ret nc                        ; $0EB7
        cp c                          ; $0EB8
        ret c                         ; $0EB9
        ld a,($C018)                  ; $0EBA
        call G_RST18                  ; $0EBD
        db $05, $FE, $FE, $FB, $FB, $FC
        ld b,a                        ; $0EC4
        ld a,($C1C5)                  ; $0EC5
        sub b                         ; $0EC7
        bit 7,a                       ; $0EC8
        jp z,G_0ED0                   ; $0ECA
        cpl                           ; $0ECC
        inc a                         ; $0ECD
        set 7,a                       ; $0ECE
G_0ED0:
        ld b,a                        ; $0ED0
        ld a,($C018)                  ; $0ED1
        bit 0,a                       ; $0ED4
        ld a,b                        ; $0ED6
        jp z,G_0EDB                   ; $0ED7
        xor $80                       ; $0ED9
G_0EDB:
        ld ($C014),a                  ; $0EDB
        ld a,($C018)                  ; $0EDE
        call G_RST18                  ; $0EE1
        db $05, $FC, $EE, $FC, $F2, $FE
        add a,$1E                     ; $0EE8
        ld ($C1C5),a                  ; $0EEA
        ld a,($C018)                  ; $0EEC
        call G_RST18                  ; $0EEF
        db $05, $12, $04, $0E, $04, $0A
        add a,$23                     ; $0EF6
        ld b,a                        ; $0EF8
        ld a,($C1C5)                  ; $0EF9
        ld c,a                        ; $0EFB
        ld hl,$C004                   ; $0EFC
        call G_1BEF                   ; $0EFF
        add a,$20                     ; $0F02
        cp b                          ; $0F04
        ret nc                        ; $0F05
        cp c                          ; $0F06
        ret c                         ; $0F07
        ld a,($C018)                  ; $0F08
        call G_RST18                  ; $0F0B
        db $05, $02, $02, $10, $10, $30
        ld ($C1C5),a                  ; $0F12
        ld a,($C018)                  ; $0F14
        call G_RST18                  ; $0F17
        db $05, $30, $30, $40, $40, $50
        ld h,a                        ; $0F1E
        ld a,($C1C5)                  ; $0F1F
        ld l,a                        ; $0F21
        ld a,($C007)                  ; $0F22
        call G_1C20                   ; $0F25
        ret nc                        ; $0F28
        cp l                          ; $0F29
        ret c                         ; $0F2A
        ld a,$01                      ; $0F2B
        ld ($C05C),a                  ; $0F2D
        ld a,$80                      ; $0F30
        ld ($C04F),a                  ; $0F32
        ld a,($C000)                  ; $0F35
        cp $07                        ; $0F38
        jp nz,G_0FCA                  ; $0F3A
        ld a,($C013)                  ; $0F3D
        bit 1,a                       ; $0F40
        ld a,($C092)                  ; $0F42
        jp nz,G_0F55                  ; $0F45
        ld ($C051),a                  ; $0F47
        ld a,($C047)                  ; $0F4A
        sub $26                       ; $0F4D
        srl a                         ; $0F4F
        add a,$0C                     ; $0F51
        jp G_0F68                     ; $0F53
G_0F55:
        call G_1E87                   ; $0F55
        ld ($C051),a                  ; $0F58
        ld hl,$C015                   ; $0F5B
        and $7F                       ; $0F5E
        ld (hl),a                     ; $0F60
        ld e,$58                      ; $0F61
        call G_1CF6                   ; $0F63
        add a,$0C                     ; $0F66
G_0F68:
        ld ($C052),a                  ; $0F68
        ld a,($C19A)                  ; $0F6B
        call G_1E3C                   ; $0F6D
        ld de,$846C                   ; $0F70
        ld a,($C191)                  ; $0F73
        bit 1,a                       ; $0F75
        jp nz,G_0F7C                  ; $0F77
        ld de,$546C                   ; $0F79
G_0F7C:
        ld a,($C19A)                  ; $0F7C
        bit 5,a                       ; $0F7E
        jp z,G_0F86                   ; $0F80
        ld a,$F0                      ; $0F82
        jp G_0F8C                     ; $0F84
G_0F86:
        bit 4,a                       ; $0F86
        jp z,G_0F9B                   ; $0F88
        ld a,$10                      ; $0F8A
G_0F8C:
        push af                       ; $0F8C
        ld a,($C013)                  ; $0F8D
        bit 0,a                       ; $0F90
        jp nz,G_0F98                  ; $0F92
        pop af                        ; $0F94
        sra a                         ; $0F95
        push af                       ; $0F97
G_0F98:
        pop af                        ; $0F98
        add a,d                       ; $0F99
        ld d,a                        ; $0F9A
G_0F9B:
        call G_1D22                   ; $0F9B
        xor $80                       ; $0F9E
        ld b,a                        ; $0FA0
        ld a,($C013)                  ; $0FA1
        bit 1,a                       ; $0FA4
        ld c,$10                      ; $0FA6
        jp z,G_0FAC                   ; $0FA8
        ld c,$04                      ; $0FAA
G_0FAC:
        ld a,($C0DF)                  ; $0FAC
        cp $03                        ; $0FAF
        jp nc,G_0FB7                  ; $0FB1
        srl c                         ; $0FB3
        srl c                         ; $0FB5
G_0FB7:
        ld a,($C19A)                  ; $0FB7
        call G_1E0D                   ; $0FB9
        ld a,b                        ; $0FBC
        ld ($C050),a                  ; $0FBD
        ld a,($C018)                  ; $0FC0
        ld b,a                        ; $0FC3
        ld a,($C013)                  ; $0FC4
        jp G_165C                     ; $0FC7
G_0FCA:
        ld a,($C019)                  ; $0FCA
        and a                         ; $0FCD
        jp z,G_0FDC                   ; $0FCE
        ld a,($C018)                  ; $0FD0
        add a,$05                     ; $0FD3
        ld ($C018),a                  ; $0FD5
        xor a                         ; $0FD8
        ld ($C019),a                  ; $0FD9
G_0FDC:
        ld a,($C00A)                  ; $0FDC
G_0FDF:
        cp $06                        ; $0FDF
        jp c,G_0FE7                   ; $0FE1
        sub $06                       ; $0FE3
        jp G_0FDF                     ; $0FE5
G_0FE7:
        ld b,$04                      ; $0FE7
        and a                         ; $0FE9
        jp z,G_0FEE                   ; $0FEA
        ld b,$FC                      ; $0FEC
G_0FEE:
        ld hl,$C016                   ; $0FEE
        ld a,($C19A)                  ; $0FF1
        call G_1E9F                   ; $0FF3
        call G_08BC                   ; $0FF6
        sub $B9                       ; $0FF9
        jp nc,G_1009                  ; $0FFB
        cpl                           ; $0FFD
        inc a                         ; $0FFE
        sra a                         ; $0FFF
        sra a                         ; $1001
        ld e,a                        ; $1003
        ld a,$52                      ; $1004
        sub e                         ; $1006
        jp G_100F                     ; $1007
G_1009:
        sra a                         ; $1009
        sra a                         ; $100B
        add a,$52                     ; $100D
G_100F:
        ld e,a                        ; $100F
        ld d,$6C                      ; $1010
        ld a,($C00A)                  ; $1012
        cp $0C                        ; $1015
        jp nc,G_1028                  ; $1017
        ld a,($C018)                  ; $1019
        sub $05                       ; $101C
        jp c,G_1028                   ; $101E
        ld d,$5C                      ; $1020
        bit 0,a                       ; $1022
        jp z,G_1028                   ; $1024
        ld d,$7C                      ; $1026
G_1028:
        ld a,($C00A)                  ; $1028
        cp $0C                        ; $102B
        jp c,G_1037                   ; $102D
        ld e,$68                      ; $102F
        ld a,(hl)                     ; $1031
        add a,$10                     ; $1032
        ld (hl),a                     ; $1034
        jp G_1046                     ; $1035
G_1037:
        cp $06                        ; $1037
        jp c,G_1046                   ; $1039
        ld e,$58                      ; $103B
        ld a,(hl)                     ; $103D
        sub $10                       ; $103E
        ld (hl),a                     ; $1040
        ld a,$02                      ; $1041
        ld ($C05C),a                  ; $1043
G_1046:
        ld a,($C018)                  ; $1046
        cp $05                        ; $1049
        jp nc,G_1055                  ; $104B
        push hl                       ; $104D
        ld hl,$C004                   ; $104E
        call G_1E6E                   ; $1051
        pop hl                        ; $1054
G_1055:
        ld a,($C19A)                  ; $1055
        ld b,a                        ; $1057
        ld a,($C00A)                  ; $1058
        call G_1D71                   ; $105B
        ld a,($C00A)                  ; $105E
        call G_1D90                   ; $1061
        call G_1CF6                   ; $1064
        ld a,($C00A)                  ; $1067
        cp $0C                        ; $106A
        jp c,G_1078                   ; $106C
        ld a,$90                      ; $106E
        ld ($C052),a                  ; $1070
        ld a,$22                      ; $1073
        ld ($C05C),a                  ; $1075
G_1078:
        ld a,($C015)                  ; $1078
        ld b,a                        ; $107B
        ld a,($C013)                  ; $107C
        call G_1DD9                   ; $107F
        ld a,b                        ; $1082
        ld ($C051),a                  ; $1083
        ld a,$80                      ; $1086
        ld ($C04F),a                  ; $1088
        call G_1D22                   ; $108B
        ld c,$10                      ; $108E
        ld hl,$C014                   ; $1090
        call G_1D57                   ; $1093
        call G_1CB1                   ; $1096
        ld a,($C018)                  ; $1099
        cp $05                        ; $109C
        jp c,G_10A2                   ; $109E
        sub $05                       ; $10A0
G_10A2:
        ld b,a                        ; $10A2
        ld a,($C013)                  ; $10A3
        jp S_P1SHOT                   ; $10A6 (réglage : jp a16)
G_10A9:
        ld a,($C1AD)                  ; $10A9
        bit 7,a                       ; $10AB
        ret nz                        ; $10AD
        bit 4,a                       ; $10AE
        ret nz                        ; $10B0
        call G_0890                   ; $10B1
        ld b,a                        ; $10B4
        call G_08BC                   ; $10B5
        sub b                         ; $10B8
        jp nc,G_10BD                  ; $10B9
        cpl                           ; $10BB
        inc a                         ; $10BC
G_10BD:
        cp $03                        ; $10BD
        ret nc                        ; $10BF
        call G_0885                   ; $10C0
        ld b,a                        ; $10C3
        call G_08B1                   ; $10C4
        sub b                         ; $10C7
        jp nc,G_10CC                  ; $10C8
        cpl                           ; $10CA
        inc a                         ; $10CB
G_10CC:
        cp $04                        ; $10CC
        ret nc                        ; $10CE
        ld a,($C047)                  ; $10CF
        cp $34                        ; $10D2
        ret nc                        ; $10D4
        ld a,($C1AD)                  ; $10D5
        bit 3,a                       ; $10D7
        jp z,G_10DF                   ; $10D9
        or $30                        ; $10DB
        jp G_10E3                     ; $10DD
G_10DF:
        or $38                        ; $10DF
        ld ($C1AE),a                  ; $10E1
G_10E3:
        ld ($C1AD),a                  ; $10E3
        ld a,$0D                      ; $10E5
        call S_SOUND                  ; $10E7
        jp G_1C84                     ; $10EA
G_10ED:
        ld hl,$C196                   ; $10ED
        set 7,(hl)                    ; $10F0
        ld hl,$C022                   ; $10F2
        call G_09FA                   ; $10F5
        ld a,c                        ; $10F8
        ld ($C02B),a                  ; $10F9
        ld a,($C020)                  ; $10FC
        call G_RST08                  ; $10FF
        dw G_1110, G_1149, G_1152, G_11BC, G_120A, G_1229, G_12AF, G_12E8, G_17CD
G_1110:
        call G_1317                   ; $1110
        call G_113D                   ; $1113
        ld a,$01                      ; $1116
        ld ($C020),a                  ; $1118
        ret                           ; $111B
G_111C:
        ld a,($C191)                  ; $111C
        bit 1,a                       ; $111E
        ld a,$58                      ; $1120
        jp z,G_1126                   ; $1122
        ld a,$7F                      ; $1124
G_1126:
        ld ($C025),a                  ; $1126
        ld a,$7F                      ; $1129
        jp z,G_112F                   ; $112B
        ld a,$80                      ; $112D
G_112F:
        ld ($C024),a                  ; $112F
        ld a,$36                      ; $1132
        ld ($C023),a                  ; $1134
        ld a,$7F                      ; $1137
        ld ($C022),a                  ; $1139
        ret                           ; $113C
G_113D:
        ld a,($C191)                  ; $113D
        bit 1,a                       ; $113F
        ld a,$45                      ; $1141
        jp z,G_1147                   ; $1143
        ld a,$92                      ; $1145
G_1147:
        jp G_1126                     ; $1147
G_1149:
        call G_132A                   ; $1149
        call G_1370                   ; $114C
        jp G_1618                     ; $114F
G_1152:
        ld a,($C02A)                  ; $1152
        cp $06                        ; $1155
        jp z,G_1167                   ; $1157
        cp $09                        ; $1159
        jp z,G_1167                   ; $115B
        ld a,($C031)                  ; $115D
        call G_RST18                  ; $1160
        db $03, $04, $08, $06
        jp G_116F                     ; $1165
G_1167:
        ld a,($C031)                  ; $1167
        call G_RST18                  ; $116A
        db $03, $0A, $0C, $01
G_116F:
        ld b,a                        ; $116F
        ld a,($C030)                  ; $1170
        inc a                         ; $1173
        ld ($C030),a                  ; $1174
        cp b                          ; $1177
        jp c,G_1189                   ; $1178
        xor a                         ; $117A
        ld ($C030),a                  ; $117B
        ld a,($C031)                  ; $117E
        inc a                         ; $1181
        cp $03                        ; $1182
        jp nc,G_11AE                  ; $1184
        ld ($C031),a                  ; $1186
G_1189:
        ld a,($C02A)                  ; $1189
        ld b,a                        ; $118C
        ld a,($C031)                  ; $118D
        add a,b                       ; $1190
        call G_RST18                  ; $1191
        db $12, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0E, $0F, $10, $10, $04, $05, $06, $04, $05, $06
        ld ($C021),a                  ; $11A5
        call G_13E8                   ; $11A8
        jp G_1618                     ; $11AB
G_11AE:
        xor a                         ; $11AE
        ld ($C030),a                  ; $11AF
        ld ($C031),a                  ; $11B2
        inc a                         ; $11B5
        ld ($C020),a                  ; $11B6
        jp G_1618                     ; $11B9
G_11BC:
        ld a,$03                      ; $11BC
        ld ($C021),a                  ; $11BE
        ld a,($C037)                  ; $11C1
        and a                         ; $11C4
        jp nz,G_11D2                  ; $11C5
        ld a,$01                      ; $11C7
        ld ($C040),a                  ; $11C9
        ld a,$0E                      ; $11CC
        ld ($C047),a                  ; $11CE
        xor a                         ; $11D1
G_11D2:
        inc a                         ; $11D2
        ld ($C037),a                  ; $11D3
        cp $10                        ; $11D6
        jp c,G_11F0                   ; $11D8
        sub $10                       ; $11DA
        cp $04                        ; $11DC
        jp c,G_1209                   ; $11DE
        sub $04                       ; $11E0
        cp $10                        ; $11E2
        jp c,G_11F0                   ; $11E4
        xor a                         ; $11E6
        ld ($C037),a                  ; $11E7
        ld a,$05                      ; $11EA
        ld ($C020),a                  ; $11EC
        ret                           ; $11EF
G_11F0:
        sub $08                       ; $11F0
        ld a,($C047)                  ; $11F2
        jp c,G_11FB                   ; $11F5
        inc a                         ; $11F7
        inc a                         ; $11F8
        jp G_11FD                     ; $11F9
G_11FB:
        dec a                         ; $11FB
        dec a                         ; $11FC
G_11FD:
        ld ($C047),a                  ; $11FD
        cp $0E                        ; $1200
        jp nc,G_1209                  ; $1202
        ld a,$13                      ; $1204
        ld ($C021),a                  ; $1206
G_1209:
        ret                           ; $1209
G_120A:
        call G_1317                   ; $120A
        ld a,$80                      ; $120D
        ld ($C1AD),a                  ; $120F
        xor a                         ; $1211
        ld ($C037),a                  ; $1212
        call G_111C                   ; $1215
        call S_RET                    ; $1218
        ld a,($C1BB)                  ; $121B
        ld ($C1A8),a                  ; $121D
        ld a,$28                      ; $121F
        ld ($C1AA),a                  ; $1221
        ld a,$05                      ; $1223
        ld ($C020),a                  ; $1225
        ret                           ; $1228
G_1229:
        ld a,$03                      ; $1229
        ld ($C021),a                  ; $122B
        ld a,($C19C)                  ; $122E
        and a                         ; $1230
        jp nz,G_1248                  ; $1231
        ld a,($C037)                  ; $1233
        inc a                         ; $1236
        ld ($C037),a                  ; $1237
        cp $B4                        ; $123A
        jp c,G_1285                   ; $123C
        xor a                         ; $123E
        ld ($C037),a                  ; $123F
        ld a,$03                      ; $1242
        ld ($C020),a                  ; $1244
        ret                           ; $1247
G_1248:
        xor a                         ; $1248
        ld ($C037),a                  ; $1249
        ld a,($C19C)                  ; $124C
        ld c,a                        ; $124E
        ld a,($C191)                  ; $124F
        bit 1,a                       ; $1251
        ld de,$3F80                   ; $1253
        jp z,G_125B                   ; $1256
        ld de,$7380                   ; $1258
G_125B:
        ld hl,$C024                   ; $125B
        ld a,(hl)                     ; $125E
        inc hl                        
        ld h,(hl)                     ; $125F
        ld l,a                        ; $1260
        call G_00C3                   ; $1261
        jp nc,G_1268                  ; $1264
        res 5,c                       ; $1266
G_1268:
        ld a,($C191)                  ; $1268
        bit 1,a                       ; $126A
        ld de,$6480                   ; $126C
        jp z,G_1274                   ; $126F
        ld de,$9880                   ; $1271
G_1274:
        call G_00C3                   ; $1274
        jp c,G_127B                   ; $1277
        res 4,c                       ; $1279
G_127B:
        ld a,($C028)                  ; $127B
        ld b,a                        ; $127E
        ld hl,$C024                   ; $127F
        call G_08C7                   ; $1282
G_1285:
        ld a,($C022)                  ; $1285
        ld ($C042),a                  ; $1288
        ld a,($C023)                  ; $128B
        ld ($C043),a                  ; $128E
        ld a,($C024)                  ; $1291
        ld ($C044),a                  ; $1294
        ld a,($C025)                  ; $1297
        sub $06                       ; $129A
        call G_16F9                   ; $129C
        ld a,($C19D)                  ; $129F
        and $03                       ; $12A1
        ret z                         ; $12A3
        ld a,$02                      ; $12A4
        ld ($C040),a                  ; $12A6
        ld a,$06                      ; $12A9
        ld ($C020),a                  ; $12AB
        ret                           ; $12AE
G_12AF:
        ld a,$04                      ; $12AF
        ld ($C021),a                  ; $12B1
        ld a,($C19D)                  ; $12B4
        and $03                       ; $12B6
        jp z,G_12D0                   ; $12B8
        ld ($C033),a                  ; $12BA
        ld a,$05                      ; $12BD
        call S_SOUND                  ; $12BF
        xor a                         ; $12C2
        ld ($C030),a                  ; $12C3
        ld ($C031),a                  ; $12C6
        ld a,$07                      ; $12C9
        ld ($C020),a                  ; $12CB
        jp G_12E7                     ; $12CE
G_12D0:
        ld a,($C052)                  ; $12D0
        bit 7,a                       ; $12D3
        jp z,G_12E7                   ; $12D5
        ld a,($C047)                  ; $12D7
        cp $30                        ; $12DA
        jp nc,G_12E7                  ; $12DC
        xor a                         ; $12DE
        ld ($C037),a                  ; $12DF
        ld a,$05                      ; $12E2
        ld ($C020),a                  ; $12E4
G_12E7:
        ret                           ; $12E7
G_12E8:
        ld a,($C031)                  ; $12E8
        call G_RST18                  ; $12EB
        db $02, $08, $0A
        ld b,a                        ; $12EF
        ld a,($C030)                  ; $12F0
        inc a                         ; $12F3
        ld ($C030),a                  ; $12F4
        cp b                          ; $12F7
        jp c,G_130A                   ; $12F8
        xor a                         ; $12FA
        ld ($C030),a                  ; $12FB
        ld a,($C031)                  ; $12FE
        inc a                         ; $1301
        cp $02                        ; $1302
        jp nc,G_11AE                  ; $1304
        ld ($C031),a                  ; $1307
G_130A:
        ld a,($C031)                  ; $130A
        call G_RST18                  ; $130D
        db $02, $05, $06
        ld ($C021),a                  ; $1311
        jp G_13E8                     ; $1314
G_1317:
        ld a,($C0A8)                  ; $1317
        ld ($C028),a                  ; $131A
        ld a,($C0A9)                  ; $131D
        ld ($C029),a                  ; $1320
        ld a,($C0B6)                  ; $1323
        ld ($C036),a                  ; $1326
        ret                           ; $1329
G_132A:
        ld a,($C028)                  ; $132A
        ld b,a                        ; $132D
        ld a,($C19C)                  ; $132E
        ld c,a                        ; $1330
        ld hl,$C024                   ; $1331
        call G_08C7                   ; $1334
        ld a,($C029)                  ; $1337
        ld b,a                        ; $133A
        ld hl,$C022                   ; $133B
        call G_08F8                   ; $133E
        ld a,($C031)                  ; $1341
        and $04                       ; $1344
        srl a                         ; $1346
        srl a                         ; $1348
        ld d,a                        ; $134A
        ld a,c                        ; $134B
        and $F0                       ; $134C
        jp z,G_136C                   ; $134E
        bit 4,a                       ; $1350
        jp z,G_1356                   ; $1352
        inc d                         ; $1354
        inc d                         ; $1355
G_1356:
        ld a,($C030)                  ; $1356
        add a,b                       ; $1359
        ld ($C030),a                  ; $135A
        ld a,($C031)                  ; $135D
        adc a,$00                     ; $1360
        ld ($C031),a                  ; $1362
        ld a,d                        ; $1365
        call G_RST18                  ; $1366
        db $04, $01, $02, $11, $12
G_136C:
        ld ($C021),a                  ; $136C
        ret                           ; $136F
G_1370:
        ld a,($C19D)                  ; $1370
        and $03                       ; $1372
        ret z                         ; $1374
        ld ($C033),a                  ; $1375
        ld a,$05                      ; $1378
        call S_SOUND                  ; $137A
        call G_08A6                   ; $137D
        call G_1722                   ; $1380
        ld a,($C024)                  ; $1383
        ld e,a                        ; $1386
        ld a,($C025)                  ; $1387
        ld d,a                        ; $138A
        call G_00C3                   ; $138B
        ld a,$03                      ; $138E
        jp nc,G_1393                  ; $1390
        xor a                         ; $1392
G_1393:
        ld ($C02A),a                  ; $1393
        ld hl,$0400                   ; $1396
        add hl,de                     ; $1399
        ld a,h                        ; $139A
        cp $08                        ; $139B
        jp nc,G_13B7                  ; $139D
        ld a,($C19C)                  ; $139F
        bit 5,a                       ; $13A1
        jp z,G_13A9                   ; $13A3
        ld a,$03                      ; $13A5
        jp G_13AF                     ; $13A7
G_13A9:
        bit 4,a                       ; $13A9
        jp z,G_13B7                   ; $13AB
        ld a,$00                      ; $13AD
G_13AF:
        ld ($C02A),a                  ; $13AF
        ld a,$FF                      ; $13B2
        ld ($C039),a                  ; $13B4
G_13B7:
        ld b,$00                      ; $13B7
        ld a,($C047)                  ; $13B9
        cp $40                        ; $13BC
        jp c,G_13CA                   ; $13BE
        ld a,($C02A)                  ; $13C0
        add a,$0C                     ; $13C3
        ld ($C02A),a                  ; $13C5
        jp G_13DA                     ; $13C8
G_13CA:
        ld a,($C02B)                  ; $13CA
        cp $0C                        ; $13CD
        jp c,G_13DA                   ; $13CF
        ld a,($C02A)                  ; $13D1
        add a,$06                     ; $13D4
        ld ($C02A),a                  ; $13D6
        inc b                         ; $13D9
G_13DA:
        ld a,b                        ; $13DA
        ld ($C031),a                  ; $13DB
        xor a                         ; $13DE
        ld ($C030),a                  ; $13DF
        ld a,$02                      ; $13E2
        ld ($C020),a                  ; $13E4
        ret                           ; $13E7
G_13E8:
        ld a,($C1AD)                  ; $13E8
        bit 7,a                       ; $13EA
        ret z                         ; $13EC
        bit 5,a                       ; $13ED
        ret nz                        ; $13EF
        bit 4,a                       ; $13F0
        ret nz                        ; $13F2
        ld a,($C043)                  ; $13F3
        cp $78                        ; $13F6
        ret nc                        ; $13F8
        ld a,($C021)                  ; $13F9
        call G_0A2C                   ; $13FC
        ret nz                        ; $13FF
        ld a,c                        ; $1400
        ld ($C038),a                  ; $1401
        ld a,($C038)                  ; $1404
        call G_RST18                  ; $1407
        db $05, $FA, $FA, $FE, $FE, $FC
        add a,$10                     ; $140E
        ld ($C1C5),a                  ; $1410
        ld a,($C038)                  ; $1412
        call G_RST18                  ; $1415
        db $05, $0A, $0A, $0C, $0C, $0C
        add a,$11                     ; $141C
        ld b,a                        ; $141E
        ld a,($C1C5)                  ; $141F
        ld c,a                        ; $1421
        ld hl,$C022                   ; $1422
        call G_1C05                   ; $1425
        ret nc                        ; $1428
        cp c                          ; $1429
        ret c                         ; $142A
        ld a,($C038)                  ; $142B
        call G_RST18                  ; $142E
        db $05, $02, $02, $05, $05, $04
        ld b,a                        ; $1435
        ld a,($C1C5)                  ; $1436
        sub b                         ; $1438
        bit 7,a                       ; $1439
        jp z,G_1441                   ; $143B
        cpl                           ; $143D
        inc a                         ; $143E
        set 7,a                       ; $143F
G_1441:
        ld b,a                        ; $1441
        ld a,($C038)                  ; $1442
        bit 0,a                       ; $1445
        ld a,b                        ; $1447
        jp z,G_144C                   ; $1448
        xor $80                       ; $144A
G_144C:
        ld ($C034),a                  ; $144C
        ld a,($C038)                  ; $144F
        call G_RST18                  ; $1452
        db $05, $EE, $FC, $F2, $FC, $F6
        add a,$1E                     ; $1459
        ld ($C1C5),a                  ; $145B
        ld a,($C038)                  ; $145D
        call G_RST18                  ; $1460
        db $05, $04, $12, $04, $0E, $02
        add a,$23                     ; $1467
        ld b,a                        ; $1469
        ld a,($C1C5)                  ; $146A
        ld c,a                        ; $146C
        ld hl,$C024                   ; $146D
        call G_1BEF                   ; $1470
        add a,$20                     ; $1473
        cp b                          ; $1475
        ret nc                        ; $1476
        cp c                          ; $1477
        ret c                         ; $1478
        ld a,($C038)                  ; $1479
        call G_RST18                  ; $147C
        db $05, $02, $02, $10, $10, $30
        ld ($C1C5),a                  ; $1483
        ld a,($C038)                  ; $1485
        call G_RST18                  ; $1488
        db $05, $30, $30, $40, $40, $50
        ld h,a                        ; $148F
        ld a,($C1C5)                  ; $1490
        ld l,a                        ; $1492
        ld a,($C027)                  ; $1493
        call G_1C20                   ; $1496
        ret nc                        ; $1499
        cp l                          ; $149A
        ret c                         ; $149B
        ld a,$01                      ; $149C
        ld ($C05C),a                  ; $149E
        xor a                         ; $14A1
        ld ($C04F),a                  ; $14A2
        ld a,($C020)                  ; $14A5
        cp $07                        ; $14A8
        jp nz,G_153A                  ; $14AA
        ld a,($C033)                  ; $14AD
        bit 1,a                       ; $14B0
        ld a,($C0B2)                  ; $14B2
        jp nz,G_14C5                  ; $14B5
        ld ($C051),a                  ; $14B7
        ld a,($C047)                  ; $14BA
        sub $26                       ; $14BD
        srl a                         ; $14BF
        add a,$0C                     ; $14C1
        jp G_14D8                     ; $14C3
G_14C5:
        call G_1E87                   ; $14C5
        ld ($C051),a                  ; $14C8
        ld hl,$C035                   ; $14CB
        and $7F                       ; $14CE
        ld (hl),a                     ; $14D0
        ld e,$98                      ; $14D1
        call G_1CF6                   ; $14D3
        add a,$0C                     ; $14D6
G_14D8:
        ld ($C052),a                  ; $14D8
        ld a,($C19C)                  ; $14DB
        call G_1E60                   ; $14DD
        ld de,$5484                   ; $14E0
        ld a,($C191)                  ; $14E3
        bit 1,a                       ; $14E5
        jp nz,G_14EC                  ; $14E7
        ld de,$8484                   ; $14E9
G_14EC:
        ld a,($C19C)                  ; $14EC
        bit 5,a                       ; $14EE
        jp z,G_14F6                   ; $14F0
        ld a,$F0                      ; $14F2
        jp G_14FC                     ; $14F4
G_14F6:
        bit 4,a                       ; $14F6
        jp z,G_150B                   ; $14F8
        ld a,$10                      ; $14FA
G_14FC:
        push af                       ; $14FC
        ld a,($C033)                  ; $14FD
        bit 0,a                       ; $1500
        jp nz,G_1508                  ; $1502
        pop af                        ; $1504
        sra a                         ; $1505
        push af                       ; $1507
G_1508:
        pop af                        ; $1508
        add a,d                       ; $1509
        ld d,a                        ; $150A
G_150B:
        call G_1D22                   ; $150B
        xor $80                       ; $150E
        ld b,a                        ; $1510
        ld a,($C033)                  ; $1511
        bit 1,a                       ; $1514
        ld c,$10                      ; $1516
        jp z,G_151C                   ; $1518
        ld c,$04                      ; $151A
G_151C:
        ld a,($C0DF)                  ; $151C
        cp $03                        ; $151F
        jp nc,G_1527                  ; $1521
        srl c                         ; $1523
        srl c                         ; $1525
G_1527:
        ld a,($C19C)                  ; $1527
        call G_1E0D                   ; $1529
        ld a,b                        ; $152C
        ld ($C050),a                  ; $152D
        ld a,($C038)                  ; $1530
        ld b,a                        ; $1533
        ld a,($C033)                  ; $1534
        jp G_165C                     ; $1537
G_153A:
        ld a,($C039)                  ; $153A
        and a                         ; $153D
        jp z,G_154C                   ; $153E
        ld a,($C038)                  ; $1540
        add a,$05                     ; $1543
        ld ($C038),a                  ; $1545
        xor a                         ; $1548
        ld ($C039),a                  ; $1549
G_154C:
        ld a,($C02A)                  ; $154C
G_154F:
        cp $06                        ; $154F
        jp c,G_1557                   ; $1551
        sub $06                       ; $1553
        jp G_154F                     ; $1555
G_1557:
        ld b,$04                      ; $1557
        and a                         ; $1559
        jp z,G_155E                   ; $155A
        ld b,$FC                      ; $155C
G_155E:
        ld hl,$C036                   ; $155E
        ld a,($C19C)                  ; $1561
        call G_1EC3                   ; $1563
        call G_08BC                   ; $1566
        sub $37                       ; $1569
        jp nc,G_1579                  ; $156B
        cpl                           ; $156D
        inc a                         ; $156E
        sra a                         ; $156F
        sra a                         ; $1571
        ld e,a                        ; $1573
        ld a,$9E                      ; $1574
        sub e                         ; $1576
        jp G_157F                     ; $1577
G_1579:
        sra a                         ; $1579
        sra a                         ; $157B
        add a,$9E                     ; $157D
G_157F:
        ld e,a                        ; $157F
        ld d,$6C                      ; $1580
        ld a,($C02A)                  ; $1582
        cp $0C                        ; $1585
        jp nc,G_1598                  ; $1587
        ld a,($C038)                  ; $1589
        sub $05                       ; $158C
        jp c,G_1598                   ; $158E
        ld d,$7C                      ; $1590
        bit 0,a                       ; $1592
        jp z,G_1598                   ; $1594
        ld d,$5C                      ; $1596
G_1598:
        ld a,($C02A)                  ; $1598
        cp $0C                        ; $159B
        jp c,G_15A7                   ; $159D
        ld e,$88                      ; $159F
        ld a,(hl)                     ; $15A1
        add a,$10                     ; $15A2
        ld (hl),a                     ; $15A4
        jp G_15B6                     ; $15A5
G_15A7:
        cp $06                        ; $15A7
        jp c,G_15B6                   ; $15A9
        ld e,$98                      ; $15AB
        ld a,(hl)                     ; $15AD
        sub $10                       ; $15AE
        ld (hl),a                     ; $15B0
        ld a,$02                      ; $15B1
        ld ($C05C),a                  ; $15B3
G_15B6:
        ld a,($C038)                  ; $15B6
        cp $05                        ; $15B9
        jp nc,G_15C5                  ; $15BB
        push hl                       ; $15BD
        ld hl,$C024                   ; $15BE
        call G_1E6E                   ; $15C1
        pop hl                        ; $15C4
G_15C5:
        ld a,($C19C)                  ; $15C5
        ld b,a                        ; $15C7
        ld a,($C02A)                  ; $15C8
        call G_1D71                   ; $15CB
        ld a,($C02A)                  ; $15CE
        call G_1DB3                   ; $15D1
        call G_1CF6                   ; $15D4
        ld a,($C02A)                  ; $15D7
        cp $0C                        ; $15DA
        jp c,G_15E8                   ; $15DC
        ld a,$90                      ; $15DE
        ld ($C052),a                  ; $15E0
        ld a,$22                      ; $15E3
        ld ($C05C),a                  ; $15E5
G_15E8:
        ld a,($C035)                  ; $15E8
        ld b,a                        ; $15EB
        ld a,($C033)                  ; $15EC
        call G_1DE7                   ; $15EF
        ld a,b                        ; $15F2
        ld ($C051),a                  ; $15F3
        xor a                         ; $15F6
        ld ($C04F),a                  ; $15F7
        call G_1D22                   ; $15FA
        ld c,$10                      ; $15FD
        ld hl,$C034                   ; $15FF
        call G_1D57                   ; $1602
        call G_1CB1                   ; $1605
        ld a,($C038)                  ; $1608
        cp $05                        ; $160B
        jp c,G_1611                   ; $160D
        sub $05                       ; $160F
G_1611:
        ld b,a                        ; $1611
        ld a,($C033)                  ; $1612
        jp G_165C                     ; $1615
G_1618:
        ld a,($C1AD)                  ; $1618
        bit 7,a                       ; $161A
        ret z                         ; $161C
        bit 4,a                       ; $161D
        ret nz                        ; $161F
        call G_08A6                   ; $1620
        ld b,a                        ; $1623
        call G_08BC                   ; $1624
        sub b                         ; $1627
        jp nc,G_162C                  ; $1628
        cpl                           ; $162A
        inc a                         ; $162B
G_162C:
        cp $03                        ; $162C
        ret nc                        ; $162E
        call G_089B                   ; $162F
        ld b,a                        ; $1632
        call G_08B1                   ; $1633
        sub b                         ; $1636
        jp nc,G_163B                  ; $1637
        cpl                           ; $1639
        inc a                         ; $163A
G_163B:
        cp $04                        ; $163B
        ret nc                        ; $163D
        ld a,($C047)                  ; $163E
        cp $34                        ; $1641
        ret nc                        ; $1643
        ld a,($C1AD)                  ; $1644
        bit 3,a                       ; $1646
        jp z,G_164E                   ; $1648
        or $30                        ; $164A
        jp G_1652                     ; $164C
G_164E:
        or $38                        ; $164E
        ld ($C1AE),a                  ; $1650
G_1652:
        ld ($C1AD),a                  ; $1652
        ld a,$0D                      ; $1654
        call S_SOUND                  ; $1656
        jp G_1C84                     ; $1659
G_165C:
        ld ($C1C5),a                  ; $165C
        ld a,b                        ; $165E
        ld ($C1C6),a                  ; $165F
        cp $05                        ; $1661
        ld a,$06                      ; $1663
        jp c,G_1669                   ; $1665
        ld a,$07                      ; $1667
G_1669:
        call G_1F42                   ; $1669
        ld a,($C1C5)                  ; $166C
        ld c,$00                      ; $166E
        bit 1,a                       ; $1670
        jp z,G_1687                   ; $1672
        ld a,($C1AD)                  ; $1674
        bit 6,a                       ; $1676
        jp z,G_1687                   ; $1678
        ld a,($C1C6)                  ; $167A
        cp $02                        ; $167C
        jp nc,G_1687                  ; $167E
        ld a,$2A                      ; $1680
        call G_1F42                   ; $1682
        ld c,$2B                      ; $1685
G_1687:
        ld a,c                        ; $1687
        ld ($C059),a                  ; $1688
        xor a                         ; $168B
        ld ($C04C),a                  ; $168C
        ld ($C053),a                  ; $168F
        ld hl,$C05A                   ; $1692
        inc (hl)                      ; $1695
        ld a,($C1AD)                  ; $1696
        bit 3,a                       ; $1698
        jp nz,G_16A8                  ; $169A
        ld a,($C040)                  ; $169C
        cp $04                        ; $169F
        jp z,G_16A5                   ; $16A1
        ld a,$03                      ; $16A3
G_16A5:
        ld ($C040),a                  ; $16A5
G_16A8:
        ld a,($C050)                  ; $16A8
        and $7F                       ; $16AB
        ld ($C054),a                  ; $16AD
        ld a,($C051)                  ; $16B0
        ld ($C055),a                  ; $16B3
        xor a                         ; $16B6
        ld ($C056),a                  ; $16B7
        ld ($C057),a                  ; $16BA
        ld a,($C051)                  ; $16BD
        ld h,a                        ; $16C0
        ld l,$00                      ; $16C1
        ld a,($C059)                  ; $16C3
        and a                         ; $16C6
        ld a,$48                      ; $16C7
        jp z,G_16CD                   ; $16C9
        ld a,$28                      ; $16CB
G_16CD:
        call G_3143                   ; $16CD
        ld a,h                        ; $16D0
        and a                         ; $16D1
        jp nz,G_16D7                  ; $16D2
        ld hl,$00F8                   ; $16D4
G_16D7:
        ld a,l                        ; $16D7
        ld ($C05D),a                  ; $16D8
        rrca                          ; $16DB
        rrca                          
        rrca                          
        rrca                          
        or a                          
        and $0F                       ; $16DD
        ld l,a                        ; $16DF
        ld a,h                        ; $16E0
        ld ($C05E),a                  ; $16E1
        rrca                          ; $16E4
        rrca                          
        rrca                          
        rrca                          
        or a                          
        and $F0                       ; $16E6
        or l                          ; $16E8
        ld ($C058),a                  ; $16E9
        xor a                         ; $16EC
        ld ($C05F),a                  ; $16ED
        ld a,($C1AD)                  ; $16F0
        xor $80                       ; $16F2
        set 6,a                       ; $16F4
        ld ($C1AD),a                  ; $16F6
        ret                           ; $16F8
G_16F9:
        ld ($C045),a                  ; $16F9
        ld a,$10                      ; $16FC
        ld ($C047),a                  ; $16FE
        xor a                         ; $1701
        ld ($C04C),a                  ; $1702
        ld ($C05A),a                  ; $1705
        ld ($C05F),a                  ; $1708
        ld hl,$C050                   ; $170B
        ld (hl),a                     ; $170E
        inc hl                        
        ld (hl),a                     ; $170F
        inc hl                        
        ld a,$44                      ; $1710
        ld (hl),a                     ; $1712
        ld a,$14                      ; $1713
        ld ($C058),a                  ; $1715
        ld hl,$C05D                   ; $1718
        ld a,$40                      ; $171B
        ld (hl),a                     ; $171D
        inc hl                        
        ld a,$01                      ; $171E
        ld (hl),a                     ; $1720
        ret                           ; $1721
G_1722:
        ld b,a                        ; $1722
        call G_08BC                   ; $1723
        sub b                         ; $1726
        jp nc,G_172B                  ; $1727
        cpl                           ; $1729
        inc a                         ; $172A
G_172B:
        ld h,a                        ; $172B
        ld l,$00                      ; $172C
        ld d,$00                      ; $172E
        ld a,($C051)                  ; $1730
        sla a                         ; $1733
        rl d                          ; $1735
        sla a                         ; $1737
        rl d                          ; $1739
        ld e,a                        ; $173B
        call G_31D5                   ; $173C
        ld d,$00                      ; $173F
        ld a,($C050)                  ; $1741
        sla a                         ; $1744
        sla a                         ; $1746
        rl d                          ; $1748
        ld e,a                        ; $174A
        call G_3120                   ; $174B
        ld a,($C050)                  ; $174E
        bit 7,a                       ; $1751
        jp nz,G_1760                  ; $1753
        ld a,($C044)                  ; $1755
        add a,l                       ; $1758
        ld l,a                        ; $1759
        ld a,($C045)                  ; $175A
        adc a,h                       ; $175D
        ld h,a                        ; $175E
        ret                           ; $175F
G_1760:
        ld a,($C044)                  ; $1760
        sub l                         ; $1763
        ld l,a                        ; $1764
        ld a,($C045)                  ; $1765
        sbc a,h                       ; $1768
        ld h,a                        ; $1769
        ret                           ; $176A
G_176B:
        ld a,($C052)                  ; $176B
        bit 7,a                       ; $176E
        jp z,G_1789                   ; $1770
        ld b,$38                      ; $1772
        ld a,($C196)                  ; $1774
        bit 7,a                       ; $1776
        ld a,($C043)                  ; $1778
        jp z,G_1780                   ; $177B
        ld b,a                        ; $177D
        ld a,$B8                      ; $177E
G_1780:
        sub b                         ; $1780
        jp nc,G_178B                  ; $1781
        ld a,($C04C)                  ; $1783
        and a                         ; $1786
        jp z,G_179E                   ; $1787
G_1789:
        and a                         ; $1789
        ret                           ; $178A
G_178B:
        ld h,a                        ; $178B
        cp $0C                        ; $178C
        jp nc,G_1789                  ; $178E
        ld a,($C04C)                  ; $1790
        and a                         ; $1793
        jp nz,G_1789                  ; $1794
        sla h                         ; $1796
        ld a,($C047)                  ; $1798
        cp h                          ; $179B
        jp c,G_1789                   ; $179C
G_179E:
        scf                           ; $179E
        ret                           ; $179F
G_17A0:
        ld a,($C060)                  ; $17A0
        and a                         ; $17A3
        jp z,G_17AA                   ; $17A4
        dec a                         ; $17A6
        ld ($C060),a                  ; $17A7
G_17AA:
        ld a,($C040)                  ; $17AA
        call G_RST08                  ; $17AD
        dw G_17C2, G_17DD, G_17EA, G_1800, G_184F, G_189B, G_18A1, G_18A7, G_18C4, G_18E1
G_17C2:
        xor a                         ; $17C2
        ld ($C050),a                  ; $17C3
        ld ($C051),a                  ; $17C6
        ld ($C052),a                  ; $17C9
        ld ($C046),a                  ; $17CC
        jp G_17CF          ; continuité du code GB
G_17CD:
        ld b,(hl)                     ; $17CD
        ret nz                        ; $17CE
G_17CF:
        ld ($C041),a                  ; $17CF
        ld ($C060),a                  ; $17D2
        inc a                         ; $17D5
        ld ($C047),a                  ; $17D6
        ld ($C040),a                  ; $17D9
        ret                           ; $17DC
G_17DD:
        call G_18F3                   ; $17DD
        ld a,($C047)                  ; $17E0
        and a                         ; $17E3
        ret nz                        ; $17E4
        ld a,$03                      ; $17E5
        jp G_1F42                     ; $17E7
G_17EA:
        call G_18E4                   ; $17EA
        ld a,($C04C)                  ; $17ED
        and a                         ; $17F0
        ret z                         ; $17F1
        call G_1EE1                   ; $17F2
        ld hl,$C1AD                   ; $17F5
        set 5,(hl)                    ; $17F8
        ld a,$05                      ; $17FA
        ld ($C040),a                  ; $17FC
        ret                           ; $17FF
G_1800:
        ld hl,$C1AD                   ; $1800
        set 5,(hl)                    ; $1803
        call G_18E4                   ; $1805
        ld a,($C04C)                  ; $1808
        cp $01                        ; $180B
        ret nz                        ; $180D
        call G_1ECB                   ; $180E
        ld a,($C047)                  ; $1811
        ld b,a                        ; $1814
        ld a,($C046)                  ; $1815
        or b                          ; $1818
        ret nz                        ; $1819
        ld b,$0E                      ; $181A
        ld a,($C1AD)                  ; $181C
        bit 7,a                       ; $181E
        jp z,G_1824                   ; $1820
        ld b,$0C                      ; $1822
G_1824:
        ld a,($C191)                  ; $1824
        bit 1,a                       ; $1826
        jp z,G_182B                   ; $1828
        inc b                         ; $182A
G_182B:
        ld a,($C04B)                  ; $182B
        ld ($C04D),a                  ; $182E
        cp b                          ; $1831
        jp nz,G_1844                  ; $1832
        ld a,($C053)                  ; $1834
        bit 7,a                       ; $1837
        ld a,$06                      ; $1839
        jp nz,G_1846                  ; $183B
        call G_1EF0                   ; $183D
        ld a,$04                      ; $1840
        jp G_1846                     ; $1842
G_1844:
        ld a,$05                      ; $1844
G_1846:
        ld ($C040),a                  ; $1846
        ld hl,$C1AD                   ; $1849
        res 5,(hl)                    ; $184C
        ret                           ; $184E
G_184F:
        call G_18E4                   ; $184F
        ld a,($C041)                  ; $1852
        and a                         ; $1855
        jp z,G_1861                   ; $1856
        dec a                         ; $1858
        ld ($C041),a                  ; $1859
        ret nz                        ; $185C
        ld a,$09                      ; $185D
        jp G_188E                     ; $185F
G_1861:
        ld a,($C04C)                  ; $1861
        cp $01                        ; $1864
        jp nz,G_1892                  ; $1866
        ld a,($C047)                  ; $1868
        ld b,a                        ; $186B
        ld a,($C046)                  ; $186C
        or b                          ; $186F
        ret nz                        ; $1870
        ld a,($C04B)                  ; $1871
        ld ($C04D),a                  ; $1874
        bit 1,a                       ; $1877
        ld b,$00                      ; $1879
        jp z,G_187F                   ; $187B
        ld b,$80                      ; $187D
G_187F:
        ld a,($C1AD)                  ; $187F
        xor b                         ; $1881
        bit 7,a                       ; $1882
        jp z,G_1895                   ; $1884
        ld a,($C04D)                  ; $1886
        bit 3,a                       ; $1889
        ret nz                        ; $188B
        ld a,$07                      ; $188C
G_188E:
        ld ($C040),a                  ; $188E
        ret                           ; $1891
G_1892:
        cp $02                        ; $1892
        ret c                         ; $1894
G_1895:
        ld a,$3C                      ; $1895
        ld ($C041),a                  ; $1897
        ret                           ; $189A
G_189B:
        ld b,$5A                      ; $189B
        ld a,$C4                      ; $189D
        jp G_18AB                     ; $189F
G_18A1:
        ld b,$5A                      ; $18A1
        ld a,$C5                      ; $18A3
        jp G_18AB                     ; $18A5
G_18A7:
        ld b,$96                      ; $18A7
        ld a,$C6                      ; $18A9
G_18AB:
        ld hl,$C1AD                   ; $18AB
        bit 3,(hl)                    ; $18AE
        jp nz,G_18B8                  ; $18B0
        ld ($C1C2),a                  ; $18B2
        set 3,(hl)                    ; $18B4
        ld a,(hl)                     ; $18B6
        inc hl                        
        ld (hl),a                     ; $18B7
G_18B8:
        ld a,b                        ; $18B8
        ld ($C05B),a                  ; $18B9
        ld a,$08                      ; $18BC
        ld ($C040),a                  ; $18BE
        jp G_18E4                     ; $18C1
G_18C4:
        call G_18E4                   ; $18C4
        ld a,($C05B)                  ; $18C7
        dec a                         ; $18CA
        ld ($C05B),a                  ; $18CB
        cp $1E                        ; $18CE
        ret nc                        ; $18D0
        ld hl,$C1C2                   ; $18D1
        res 6,(hl)                    ; $18D4
        ld a,($C05B)                  ; $18D6
        and a                         ; $18D9
        ret nz                        ; $18DA
        ld a,$09                      ; $18DB
        ld ($C040),a                  ; $18DD
        ret                           ; $18E0
G_18E1:
        jp G_18E4                     ; $18E1
G_18E4:
        call G_18FE                   ; $18E4
        call G_1945                   ; $18E7
        call G_19AC                   ; $18EA
        call G_1B17                   ; $18ED
        call G_1C27                   ; $18F0
G_18F3:
        ld hl,$C042                   ; $18F3
        call G_09FA                   ; $18F6
        ld a,c                        ; $18F9
        ld ($C04B),a                  ; $18FA
        ret                           ; $18FD
G_18FE:
        ld hl,$C044                   ; $18FE
        ld a,(hl)                     ; $1901
        inc hl                        
        ld h,(hl)                     ; $1902
        ld l,a                        ; $1903
        ld b,$00                      ; $1904
        ld a,($C050)                  ; $1906
        bit 7,a                       ; $1909
        jp nz,G_1926                  ; $190B
        sla a                         ; $190D
        sla a                         ; $190F
        rl b                          ; $1911
        ld c,a                        ; $1913
        add hl,bc                     ; $1914
        ld de,$D001                   ; $1915
        call G_00C3                   ; $1918
        jp nc,G_193B                  ; $191B
G_191D:
        ld a,l                        ; $191D
        ld ($C044),a                  ; $191E
        ld a,h                        ; $1921
        ld ($C045),a                  ; $1922
        ret                           ; $1925
G_1926:
        sla a                         ; $1926
        sla a                         ; $1928
        rl b                          ; $192A
        ld c,a                        ; $192C
        ld a,l                        ; $192D
        sbc a,c                       ; $192E
        ld l,a                        ; $192F
        ld a,h                        ; $1930
        sbc a,b                       ; $1931
        ld h,a                        ; $1932
        ld de,$07FF                   ; $1933
        call G_00C3                   ; $1936
        jp nc,G_191D                  ; $1939
G_193B:
        ld a,($C050)                  ; $193B
        xor $80                       ; $193E
        ld ($C050),a                  ; $1940
        jp G_1991                     ; $1943
G_1945:
        ld hl,$C042                   ; $1945
        ld a,(hl)                     ; $1948
        inc hl                        
        ld h,(hl)                     ; $1949
        ld l,a                        ; $194A
        ld b,$00                      ; $194B
        ld a,($C04F)                  ; $194D
        bit 7,a                       ; $1950
        ld a,($C051)                  ; $1952
        jp nz,G_1972                  ; $1955
        sla a                         ; $1957
        rl b                          ; $1959
        sla a                         ; $195B
        rl b                          ; $195D
        ld c,a                        ; $195F
        add hl,bc                     ; $1960
        ld de,$E701                   ; $1961
        call G_00C3                   ; $1964
        jp nc,G_1989                  ; $1967
G_1969:
        ld a,l                        ; $1969
        ld ($C042),a                  ; $196A
        ld a,h                        ; $196D
        ld ($C043),a                  ; $196E
        ret                           ; $1971
G_1972:
        sla a                         ; $1972
        rl b                          ; $1974
        sla a                         ; $1976
        rl b                          ; $1978
        ld c,a                        ; $197A
        ld a,l                        ; $197B
        sbc a,c                       ; $197C
        ld l,a                        ; $197D
        ld a,h                        ; $197E
        sbc a,b                       ; $197F
        ld h,a                        ; $1980
        ld de,$08FF                   ; $1981
        call G_00C3                   ; $1984
        jp nc,G_1969                  ; $1987
G_1989:
        ld a,($C04F)                  ; $1989
        xor $80                       ; $198C
        ld ($C04F),a                  ; $198E
G_1991:
        ld a,($C050)                  ; $1991
        sra a                         ; $1994
        and $BF                       ; $1996
        ld ($C050),a                  ; $1998
        ld a,($C051)                  ; $199B
        srl a                         ; $199E
        ld ($C051),a                  ; $19A0
        xor a                         ; $19A3
        ld ($C053),a                  ; $19A4
        ld a,$04                      ; $19A7
        jp G_1F42                     ; $19A9
G_19AC:
        ld hl,$C05D                   ; $19AC
        ld a,($C052)                  ; $19AF
        bit 7,a                       ; $19B2
        jp nz,G_1A18                  ; $19B4
        ld a,($C05F)                  ; $19B6
        sub (hl)                      ; $19B9
        ld ($C05F),a                  ; $19BA
        ld c,a                        ; $19BD
        inc hl                        ; $19BE
        ld a,($C052)                  ; $19BF
        sbc a,(hl)                    ; $19C2
        jp nc,G_19D2                  ; $19C3
        ld a,$80                      ; $19C5
        ld ($C052),a                  ; $19C7
        ld a,($C059)                  ; $19CA
        and a                         ; $19CD
        ret z                         ; $19CE
        jp G_1F42                     ; $19CF
G_19D2:
        ld ($C052),a                  ; $19D2
        ld b,$00                      ; $19D5
        ld hl,G_19E9                  ; $19D7
        push hl                       ; $19DA
        ld a,($C05C)                  ; $19DB
        rrca                          ; $19DE
        rrca                          
        rrca                          
        rrca                          
        or a                          
        and $0F                       ; $19E0
        call G_RST08                  ; $19E2
        dw G_1AE5, G_1B01, G_1B0F
G_19E9:
        ld l,a                        ; $19E9
        ld h,b                        ; $19EA
        ld a,($C058)                  ; $19EB
        call G_30D0                   ; $19EE
        srl c                         ; $19F1
        rr h                          ; $19F3
        rr l                          ; $19F5
        srl c                         ; $19F7
        rr h                          ; $19F9
        rr l                          ; $19FB
        srl c                         ; $19FD
        rr h                          ; $19FF
        rr l                          ; $1A01
        srl c                         ; $1A03
        rr h                          ; $1A05
        rr l                          ; $1A07
        ld a,($C046)                  ; $1A09
        add a,l                       ; $1A0C
        ld ($C046),a                  ; $1A0D
        ld a,($C047)                  ; $1A10
        adc a,h                       ; $1A13
        ld ($C047),a                  ; $1A14
        ret                           ; $1A17
G_1A18:
        ld a,($C05F)                  ; $1A18
        add a,(hl)                    ; $1A1B
        ld ($C05F),a                  ; $1A1C
        ld c,a                        ; $1A1F
        inc hl                        ; $1A20
        ld a,($C052)                  ; $1A21
        adc a,(hl)                    ; $1A24
        ld ($C052),a                  ; $1A25
        ld b,$00                      ; $1A28
        ld hl,G_1A3A                  ; $1A2A
        push hl                       ; $1A2D
        ld a,($C05C)                  ; $1A2E
        and $0F                       ; $1A31
        call G_RST08                  ; $1A33
        dw G_1AE5, G_1ACD, G_1AC3
G_1A3A:
        ld l,a                        ; $1A3A
        ld h,b                        ; $1A3B
        ld a,($C058)                  ; $1A3C
        call G_30D0                   ; $1A3F
        srl c                         ; $1A42
        rr h                          ; $1A44
        rr l                          ; $1A46
        srl c                         ; $1A48
        rr h                          ; $1A4A
        rr l                          ; $1A4C
        srl c                         ; $1A4E
        rr h                          ; $1A50
        rr l                          ; $1A52
        srl c                         ; $1A54
        rr h                          ; $1A56
        rr l                          ; $1A58
        ld a,($C046)                  ; $1A5A
        sub l                         ; $1A5D
        ld ($C046),a                  ; $1A5E
        ld c,a                        ; $1A61
        ld a,($C047)                  ; $1A62
        sbc a,h                       ; $1A65
        ld ($C047),a                  ; $1A66
        jp c,G_1A6D                   ; $1A69
        or c                          ; $1A6B
        ret nz                        ; $1A6C
G_1A6D:
        xor a                         ; $1A6D
        ld ($C046),a                  ; $1A6E
        ld ($C047),a                  ; $1A71
        ld hl,$C04C                   ; $1A74
        inc (hl)                      ; $1A77
        ld a,(hl)                     ; $1A78
        cp $02                        ; $1A79
        jp c,G_1A83                   ; $1A7B
        ld a,($C1AD)                  ; $1A7D
        set 5,a                       ; $1A7F
        ld ($C1AD),a                  ; $1A81
G_1A83:
        xor a                         ; $1A83
        ld ($C059),a                  ; $1A84
        ld a,($C04C)                  ; $1A87
        cp $04                        ; $1A8A
        jp nc,G_1AA6                  ; $1A8C
        ld a,$1C                      ; $1A8E
        ld ($C060),a                  ; $1A90
        ld hl,$C042                   ; $1A93
        ld de,$C062                   ; $1A96
        ld b,$04                      ; $1A99
G_1A9B:
        ld a,(hl)                     ; $1A9B
        inc hl                        
        ld (de),a                     ; $1A9C
        inc e                         ; $1A9D
        dec b                         ; $1A9E
        jp nz,G_1A9B                  ; $1A9F
        ld a,$03                      ; $1AA1
        call G_1F42                   ; $1AA3
G_1AA6:
        ld a,($C052)                  ; $1AA6
        and $7F                       ; $1AA9
        ld b,a                        ; $1AAB
        srl a                         ; $1AAC
        srl a                         ; $1AAE
        ld c,a                        ; $1AB0
        ld a,b                        ; $1AB1
        sub c                         ; $1AB2
        jp nc,G_1AB6                  ; $1AB3
        xor a                         ; $1AB5
G_1AB6:
        ld b,a                        ; $1AB6
        ld a,($C052)                  ; $1AB7
        and $80                       ; $1ABA
        xor $80                       ; $1ABC
        or b                          ; $1ABE
        ld ($C052),a                  ; $1ABF
        ret                           ; $1AC2
G_1AC3:
        call G_1AEF                   ; $1AC3
        sla c                         ; $1AC6
        rl a                          ; $1AC8
        rl b                          ; $1ACA
        ret                           ; $1ACC
G_1ACD:
        ld a,($C052)                  ; $1ACD
        sla c                         ; $1AD0
        rl a                          ; $1AD2
        ld e,a                        ; $1AD4
        sla c                         ; $1AD5
        rl a                          ; $1AD7
        rl b                          ; $1AD9
        sla c                         ; $1ADB
        rl a                          ; $1ADD
        rl b                          ; $1ADF
        add a,e                       ; $1AE1
        ret nc                        ; $1AE2
        inc b                         ; $1AE3
        ret                           ; $1AE4
G_1AE5:
        call G_1B01                   ; $1AE5
        sla c                         ; $1AE8
        rl a                          ; $1AEA
        rl b                          ; $1AEC
        ret                           ; $1AEE
G_1AEF:
        ld a,($C052)                  ; $1AEF
        sla c                         ; $1AF2
        rl a                          ; $1AF4
        ld e,a                        ; $1AF6
        sla c                         ; $1AF7
        rl a                          ; $1AF9
        rl b                          ; $1AFB
        add a,e                       ; $1AFD
        ret nc                        ; $1AFE
        inc b                         ; $1AFF
        ret                           ; $1B00
G_1B01:
        ld a,($C052)                  ; $1B01
        sla c                         ; $1B04
        rl a                          ; $1B06
        sla c                         ; $1B08
        rl a                          ; $1B0A
        rl b                          ; $1B0C
        ret                           ; $1B0E
G_1B0F:
        ld a,($C052)                  ; $1B0F
        sla c                         ; $1B12
        rl a                          ; $1B14
        ret                           ; $1B16
G_1B17:
        ld a,($C050)                  ; $1B17
        and $7F                       ; $1B1A
        ld b,a                        ; $1B1C
        ld a,($C054)                  ; $1B1D
        ld c,a                        ; $1B20
        ld a,($C056)                  ; $1B21
        sub c                         ; $1B24
        ld c,a                        ; $1B25
        ld a,b                        ; $1B26
        sbc a,$00                     ; $1B27
        jp c,G_1B39                   ; $1B29
        ld b,a                        ; $1B2B
        ld a,c                        ; $1B2C
        ld ($C056),a                  ; $1B2D
        ld a,($C050)                  ; $1B30
        and $80                       ; $1B33
        or b                          ; $1B35
        ld ($C050),a                  ; $1B36
G_1B39:
        ld a,($C055)                  ; $1B39
        ld c,a                        ; $1B3C
        ld a,($C057)                  ; $1B3D
        sub c                         ; $1B40
        ld c,a                        ; $1B41
        ld a,($C051)                  ; $1B42
        sbc a,$00                     ; $1B45
        ret c                         ; $1B47
        ld ($C051),a                  ; $1B48
        ld a,c                        ; $1B4B
        ld ($C057),a                  ; $1B4C
        ret                           ; $1B4F
G_1BEF:
        ld a,(hl)                     ; $1BEF
        inc hl                        
        ld d,(hl)                     ; $1BF0
        ld e,a                        ; $1BF1
        ld hl,$C044                   ; $1BF2
        ld a,(hl)                     ; $1BF5
        inc hl                        
        ld h,(hl)                     ; $1BF6
        ld l,a                        ; $1BF7
        call G_00C3                   ; $1BF8
        jp nc,G_1BFE                  ; $1BFB
        dec de                        ; $1BFD
G_1BFE:
        ld a,$80                      ; $1BFE
        add a,e                       ; $1C00
        ld a,d                        ; $1C01
        adc a,$00                     ; $1C02
        ret                           ; $1C04
G_1C05:
        ld a,(hl)                     ; $1C05
        inc hl                        
        ld d,(hl)                     ; $1C06
        ld e,a                        ; $1C07
        ld hl,$C042                   ; $1C08
        ld a,(hl)                     ; $1C0B
        inc hl                        
        ld h,(hl)                     ; $1C0C
        ld l,a                        ; $1C0D
        call G_00C3                   ; $1C0E
        jp nc,G_1C14                  ; $1C11
        dec de                        ; $1C13
G_1C14:
        ld a,$80                      ; $1C14
        add a,e                       ; $1C16
        ld a,d                        ; $1C17
        adc a,$00                     ; $1C18
        ld ($C1C5),a                  ; $1C1A
        add a,$10                     ; $1C1C
        cp b                          ; $1C1E
        ret                           ; $1C1F
G_1C20:
        ld b,a                        ; $1C20
        ld a,($C047)                  ; $1C21
        sub b                         ; $1C24
        cp h                          ; $1C25
        ret                           ; $1C26
G_1C27:
        ld a,($C053)                  ; $1C27
        and a                         ; $1C2A
        ret nz                        ; $1C2B
        call G_08BC                   ; $1C2C
        cp $76                        ; $1C2F
        ret c                         ; $1C31
        cp $7B                        ; $1C32
        ret nc                        ; $1C34
        ld ($C053),a                  ; $1C35
        call G_08B1                   ; $1C38
        cp $2E                        ; $1C3B
        ret c                         ; $1C3D
        cp $AB                        ; $1C3E
        ret nc                        ; $1C40
        ld a,($C047)                  ; $1C41
        cp $1E                        ; $1C44
        ret nc                        ; $1C46
        ld a,$0C                      ; $1C47
        call S_SOUND                  ; $1C49
        ld a,($C047)                  ; $1C4C
        cp $1C                        ; $1C4F
        jp c,G_1C7F                   ; $1C51
        ld a,($C051)                  ; $1C53
        srl a                         ; $1C56
        ld ($C051),a                  ; $1C58
        ld a,($C050)                  ; $1C5B
        sra a                         ; $1C5E
        and $BF                       ; $1C60
        ld ($C050),a                  ; $1C62
        ld a,($C052)                  ; $1C65
        bit 7,a                       ; $1C68
        jp nz,G_1C72                  ; $1C6A
        ld b,a                        ; $1C6C
        srl a                         ; $1C6D
        add a,b                       ; $1C6F
        jp G_1C76                     ; $1C70
G_1C72:
        and $7F                       ; $1C72
        srl a                         ; $1C74
G_1C76:
        ld ($C052),a                  ; $1C76
        ld a,$FF                      ; $1C79
        ld ($C053),a                  ; $1C7B
        ret                           ; $1C7E
G_1C7F:
        ld a,$FE                      ; $1C7F
        ld ($C053),a                  ; $1C81
G_1C84:
        ld a,($C050)                  ; $1C84
        sra a                         ; $1C87
        sra a                         ; $1C89
        and $9F                       ; $1C8B
        ld ($C050),a                  ; $1C8D
        ld a,($C051)                  ; $1C90
        srl a                         ; $1C93
        srl a                         ; $1C95
        and $3F                       ; $1C97
        ld ($C051),a                  ; $1C99
        ld a,($C04F)                  ; $1C9C
        xor $80                       ; $1C9F
        ld ($C04F),a                  ; $1CA1
        ld a,($C052)                  ; $1CA4
        sra a                         ; $1CA7
        sra a                         ; $1CA9
        and $9F                       ; $1CAB
        ld ($C052),a                  ; $1CAD
        ret                           ; $1CB0
G_1CB1:
        ld a,b                        ; $1CB1
        ld ($C1C5),a                  ; $1CB2
        ld a,($C1C6)                  ; $1CB4
        xor $80                       ; $1CB6
        bit 7,a                       ; $1CB8
        jp z,G_1CD7                   ; $1CBA
        bit 7,b                       ; $1CBC
        jp nz,G_1CDB                  ; $1CBE
G_1CC0:
        res 7,a                       ; $1CC0
        res 7,b                       ; $1CC2
        sub b                         ; $1CC4
        jp nc,G_1CCE                  ; $1CC5
        cpl                           ; $1CC7
        inc a                         ; $1CC8
        ld b,a                        ; $1CC9
        ld a,($C1C5)                  ; $1CCA
        jp G_1CD3                     ; $1CCC
G_1CCE:
        ld b,a                        ; $1CCE
        ld a,($C1C6)                  ; $1CCF
        xor $80                       ; $1CD1
G_1CD3:
        and $80                       ; $1CD3
        jp G_1CDD                     ; $1CD5
G_1CD7:
        bit 7,b                       ; $1CD7
        jp nz,G_1CC0                  ; $1CD9
G_1CDB:
        res 7,b                       ; $1CDB
G_1CDD:
        add a,b                       ; $1CDD
        ld ($C050),a                  ; $1CDE
        res 7,a                       ; $1CE1
        ld b,a                        ; $1CE3
        ld a,($C051)                  ; $1CE4
        add a,a                       ; $1CE7
        ret c                         ; $1CE8
        cp b                          ; $1CE9
        ret nc                        ; $1CEA
        ld b,a                        ; $1CEB
        ld a,($C050)                  ; $1CEC
        and $80                       ; $1CEF
        or b                          ; $1CF1
        ld ($C050),a                  ; $1CF2
        ret                           ; $1CF5
G_1CF6:
        call G_08BC                   ; $1CF6
        push af                       ; $1CF9
        sub e                         ; $1CFA
        jp nc,G_1CFF                  ; $1CFB
        cpl                           ; $1CFD
        inc a                         ; $1CFE
G_1CFF:
        ld b,a                        ; $1CFF
        pop af                        ; $1D00
        add a,$08                     ; $1D01
        bit 7,a                       ; $1D03
        jp z,G_1D09                   ; $1D05
        cpl                           ; $1D07
        inc a                         ; $1D08
G_1D09:
        sub $30                       ; $1D09
        jp c,G_1D13                   ; $1D0B
        srl a                         ; $1D0D
        srl a                         ; $1D0F
        add a,b                       ; $1D11
        ld b,a                        ; $1D12
G_1D13:
        ld a,b                        ; $1D13
        ld hl,$C047                   ; $1D14
        sub (hl)                      ; $1D17
        jp nc,G_1D1C                  ; $1D18
        cpl                           ; $1D1A
        inc a                         ; $1D1B
G_1D1C:
        srl a                         ; $1D1C
        ld ($C052),a                  ; $1D1E
        ret                           ; $1D21
G_1D22:
        push de                       ; $1D22
        push de                       ; $1D23
        call G_08B1                   ; $1D24
        sub d                         ; $1D27
        jp nc,G_1D2C                  ; $1D28
        cpl                           ; $1D2A
        inc a                         ; $1D2B
G_1D2C:
        ld e,a                        ; $1D2C
        ld a,($C051)                  ; $1D2D
        call G_308F                   ; $1D30
        pop de                        ; $1D33
        call G_08BC                   ; $1D34
        sub e                         ; $1D37
        jp nc,G_1D3C                  ; $1D38
        cpl                           ; $1D3A
        inc a                         ; $1D3B
G_1D3C:
        call G_3143                   ; $1D3C
        ld a,h                        ; $1D3F
        and a                         ; $1D40
        jp nz,G_1D48                  ; $1D41
        ld a,l                        ; $1D43
        cp $68                        ; $1D44
        jp c,G_1D4A                   ; $1D46
G_1D48:
        ld l,$68                      ; $1D48
G_1D4A:
        pop de                        ; $1D4A
        call G_08B1                   ; $1D4B
        sub d                         ; $1D4E
        jp nc,G_1D53                  ; $1D4F
        set 7,l                       ; $1D51
G_1D53:
        ld a,l                        ; $1D53
        ld ($C1C6),a                  ; $1D54
        ret                           ; $1D56
G_1D57:
        ld b,$00                      ; $1D57
        ld a,(hl)                     ; $1D59
        inc hl                        
        and $0F                       ; $1D5A
        cp $02                        ; $1D5C
        ret c                         ; $1D5E
        ld b,$02                      ; $1D5F
        cp $05                        ; $1D61
        jp c,G_1D67                   ; $1D63
        ld b,$06                      ; $1D65
G_1D67:
        ld a,(hl)                     ; $1D67
        sub $04                       ; $1D68
        ld (hl),a                     ; $1D6A
        dec hl                        
        bit 7,(hl)                    ; $1D6B
        ret z                         ; $1D6D
        set 7,b                       ; $1D6E
        ret                           ; $1D70
G_1D71:
        ld c,$28                      ; $1D71
        cp $06                        ; $1D73
        jp c,G_1D7D                   ; $1D75
        cp $0C                        ; $1D77
        jp nc,G_1D7D                  ; $1D79
        ld c,$20                      ; $1D7B
G_1D7D:
        ld a,c                        ; $1D7D
        bit 5,b                       ; $1D7E
        jp z,G_1D86                   ; $1D80
        cpl                           ; $1D82
        inc a                         ; $1D83
        jp G_1D89                     ; $1D84
G_1D86:
        bit 4,b                       ; $1D86
        ret z                         ; $1D88
G_1D89:
        add a,d                       ; $1D89
        ld d,a                        ; $1D8A
        ld a,(hl)                     ; $1D8B
        sub $04                       ; $1D8C
        ld (hl),a                     ; $1D8E
        ret                           ; $1D8F
G_1D90:
        call G_1DBE                   ; $1D90
        bit 6,b                       ; $1D93
        jp z,G_1DA6                   ; $1D95
G_1D97:
        add a,c                       ; $1D97
        add a,e                       ; $1D98
        ld e,a                        ; $1D99
        ld a,($C05C)                  ; $1D9A
        cp $02                        ; $1D9D
        ret z                         ; $1D9F
        ld a,$00                      ; $1DA0
        ld ($C05C),a                  ; $1DA2
        ret                           ; $1DA5
G_1DA6:
        bit 7,b                       ; $1DA6
G_1DA8:
        ret z                         ; $1DA8
        cpl                           ; $1DA9
        inc a                         ; $1DAA
        add a,e                       ; $1DAB
        ld e,a                        ; $1DAC
        ld a,$01                      ; $1DAD
        ld ($C05C),a                  ; $1DAF
        ret                           ; $1DB2
G_1DB3:
        call G_1DBE                   ; $1DB3
        bit 7,b                       ; $1DB6
        jp nz,G_1D97                  ; $1DB8
        bit 6,b                       ; $1DBA
        jp G_1DA8                     ; $1DBC
G_1DBE:
        ld c,$0A                      ; $1DBE
        cp $06                        ; $1DC0
        jp c,G_1DCC                   ; $1DC2
        cp $0C                        ; $1DC4
        jp nc,G_1DCC                  ; $1DC6
        srl c                         ; $1DC8
        srl c                         ; $1DCA
G_1DCC:
        ld a,($C196)                  ; $1DCC
        bit 7,a                       ; $1DCE
        ld a,c                        ; $1DD0
        ld c,$08                      ; $1DD1
        ret nz                        ; $1DD3
        cpl                           ; $1DD4
        inc a                         ; $1DD5
        ld c,$F8                      ; $1DD6
        ret                           ; $1DD8
G_1DD9:
        bit 1,a                       ; $1DD9
        ret z                         ; $1DDB
        call G_1DF5                   ; $1DDC
        ld a,($C19A)                  ; $1DDF
        bit 6,a                       ; $1DE1
        ret z                         ; $1DE3
        ld b,$4C                      ; $1DE4
        ret                           ; $1DE6
G_1DE7:
        bit 1,a                       ; $1DE7
        ret z                         ; $1DE9
        call G_1DF5                   ; $1DEA
        ld a,($C19C)                  ; $1DED
        bit 7,a                       ; $1DEF
        ret z                         ; $1DF1
        ld b,$4C                      ; $1DF2
        ret                           ; $1DF4
G_1DF5:
        ld a,($C052)                  ; $1DF5
        bit 7,a                       ; $1DF8
        jp z,G_1E00                   ; $1DFA
        ld a,$01                      ; $1DFC
        jp G_1E07                     ; $1DFE
G_1E00:
        add a,a                       ; $1E00
        bit 7,a                       ; $1E01
        jp z,G_1E07                   ; $1E03
        ld a,$7F                      ; $1E05
G_1E07:
        ld ($C052),a                  ; $1E07
        ld b,$40                      ; $1E0A
        ret                           ; $1E0C
G_1E0D:
        bit 5,a                       ; $1E0D
        jp z,G_1E24                   ; $1E0F
        ld a,c                        ; $1E11
        bit 7,b                       ; $1E12
        jp nz,G_1E21                  ; $1E14
        sub b                         ; $1E16
        jp nc,G_1E1D                  ; $1E17
        cpl                           ; $1E19
        inc a                         ; $1E1A
        ld b,a                        ; $1E1B
        ret                           ; $1E1C
G_1E1D:
        or $80                        ; $1E1D
        ld b,a                        ; $1E1F
        ret                           ; $1E20
G_1E21:
        add a,b                       ; $1E21
        ld b,a                        ; $1E22
        ret                           ; $1E23
G_1E24:
        bit 4,a                       ; $1E24
        ret z                         ; $1E26
        ld a,c                        ; $1E27
        bit 7,b                       ; $1E28
        jp z,G_1E39                   ; $1E2A
        res 7,b                       ; $1E2C
        sub b                         ; $1E2E
        jp nc,G_1E37                  ; $1E2F
        cpl                           ; $1E31
        inc a                         ; $1E32
        or $80                        ; $1E33
        ld b,a                        ; $1E35
        ret                           ; $1E36
G_1E37:
        ld b,a                        ; $1E37
        ret                           ; $1E38
G_1E39:
        add a,b                       ; $1E39
        ld b,a                        ; $1E3A
        ret                           ; $1E3B
G_1E3C:
        bit 6,a                       ; $1E3C
        jp z,G_1E4E                   ; $1E3E
G_1E40:
        ld a,($C051)                  ; $1E40
        add a,$10                     ; $1E43
        ld ($C051),a                  ; $1E45
        ld a,$10                      ; $1E48
        ld ($C05C),a                  ; $1E4A
        ret                           ; $1E4D
G_1E4E:
        bit 7,a                       ; $1E4E
        jp z,G_1E68                   ; $1E50
G_1E52:
        ld a,($C051)                  ; $1E52
        sub $10                       ; $1E55
        ld ($C051),a                  ; $1E57
        ld a,$11                      ; $1E5A
        ld ($C05C),a                  ; $1E5C
        ret                           ; $1E5F
G_1E60:
        bit 7,a                       ; $1E60
        jp nz,G_1E40                  ; $1E62
        bit 6,a                       ; $1E64
        jp nz,G_1E52                  ; $1E66
G_1E68:
        ld a,$01                      ; $1E68
        ld ($C05C),a                  ; $1E6A
        ret                           ; $1E6D
G_1E6E:
        ld a,e                        ; $1E6E
        ld ($C1C5),a                  ; $1E6F
        ld a,(hl)                     ; $1E71
        inc hl                        
        ld h,(hl)                     ; $1E72
        ld l,a                        ; $1E73
        cp $6C                        ; $1E74
        ld e,$02                      ; $1E76
        jp c,G_1E7C                   ; $1E78
        ld e,$00                      ; $1E7A
G_1E7C:
        add hl,de                     ; $1E7C
        rr h                          ; $1E7D
        jp nc,G_1E82                  ; $1E7F
        inc h                         ; $1E81
G_1E82:
        ld d,h                        ; $1E82
        ld a,($C1C5)                  ; $1E83
        ld e,a                        ; $1E85
        ret                           ; $1E86
G_1E87:
        ld l,a                        ; $1E87
        sub $70                       ; $1E88
        jp nc,G_1E93                  ; $1E8A
        cpl                           ; $1E8C
        inc a                         ; $1E8D
        srl a                         ; $1E8E
        add a,l                       ; $1E90
        jp G_1E98                     ; $1E91
G_1E93:
        srl a                         ; $1E93
        ld h,a                        ; $1E95
        ld a,l                        ; $1E96
        sub h                         ; $1E97
G_1E98:
        srl a                         ; $1E98
        ld l,a                        ; $1E9A
        srl a                         ; $1E9B
        add a,l                       ; $1E9D
        ret                           ; $1E9E
G_1E9F:
        bit 6,a                       ; $1E9F
        jp z,G_1EB0                   ; $1EA1
G_1EA3:
        ld a,(hl)                     ; $1EA3
        srl a                         ; $1EA4
        srl a                         ; $1EA6
        ld c,a                        ; $1EA8
        srl a                         ; $1EA9
        add a,c                       ; $1EAB
        add a,b                       ; $1EAC
        ld b,a                        ; $1EAD
        jp G_1EBF                     ; $1EAE
G_1EB0:
        bit 7,a                       ; $1EB0
G_1EB2:
        jp z,G_1EBF                   ; $1EB2
        ld a,(hl)                     ; $1EB4
        srl a                         ; $1EB5
        srl a                         ; $1EB7
        srl a                         ; $1EB9
        ld c,a                        ; $1EBB
        ld a,b                        ; $1EBC
        sub c                         ; $1EBD
        ld b,a                        ; $1EBE
G_1EBF:
        ld a,(hl)                     ; $1EBF
        dec hl                        
        add a,b                       ; $1EC0
        ld (hl),a                     ; $1EC1
        ret                           ; $1EC2
G_1EC3:
        bit 7,a                       ; $1EC3
        jp nz,G_1EA3                  ; $1EC5
        bit 6,a                       ; $1EC7
        jp G_1EB2                     ; $1EC9
G_1ECB:
        ld hl,$C082                   ; $1ECB
        call G_1F3A                   ; $1ECE
        bit 7,a                       ; $1ED1
        jp nz,G_1ED8                  ; $1ED3
        ld hl,$C0A2                   ; $1ED5
G_1ED8:
        ld a,($C191)                  ; $1ED8
        bit 0,a                       ; $1EDA
        jp z,G_1EDF                   ; $1EDC
        inc hl                        ; $1EDE
G_1EDF:
        inc (hl)                      ; $1EDF
        ret                           ; $1EE0
G_1EE1:
        ld hl,$C082                   ; $1EE1
        call G_1F3A                   ; $1EE4
        bit 7,a                       ; $1EE7
        jp z,G_1EEE                   ; $1EE9
        ld hl,$C0A2                   ; $1EEB
G_1EEE:
        jp G_1ED8                     ; $1EEE
G_1EF0:
        ld hl,$C084                   ; $1EF0
        call G_1F3A                   ; $1EF3
        bit 7,a                       ; $1EF6
        jp nz,G_1EFD                  ; $1EF8
        ld hl,$C0A4                   ; $1EFA
G_1EFD:
        jp G_1ED8                     ; $1EFD
G_1EFF:
        ld a,($C05A)                  ; $1EFF
        cp $0A                        ; $1F02
        jp nc,G_1F35                  ; $1F04
        ld a,($C196)                  ; $1F06
        bit 6,a                       ; $1F08
        jp nz,G_1F19                  ; $1F0A
        ld hl,$C086                   ; $1F0C
        ld a,($C193)                  ; $1F0F
        and a                         ; $1F11
        jp z,G_1F26                   ; $1F12
        ld hl,$C0A7                   ; $1F14
        jp G_1F2E                     ; $1F17
G_1F19:
        ld hl,$C0A6                   ; $1F19
        ld a,($C193)                  ; $1F1C
        and a                         ; $1F1E
        jp nz,G_1F26                  ; $1F1F
        ld hl,$C087                   ; $1F21
        jp G_1F2E                     ; $1F24
G_1F26:
        ld a,($C05A)                  ; $1F26
        cp $01                        ; $1F29
        jp z,G_1F34                   ; $1F2B
        ret                           ; $1F2D
G_1F2E:
        ld a,($C05A)                  ; $1F2E
        cp $02                        ; $1F31
        ret nz                        ; $1F33
G_1F34:
        inc (hl)                      ; $1F34
G_1F35:
        ld a,$25                      ; $1F35
        jp S_SOUND                    ; $1F37
G_1F3A:
        ld a,($C1AD)                  ; $1F3A
        bit 3,a                       ; $1F3C
        ret z                         ; $1F3E
        ld a,($C1AE)                  ; $1F3F
        ret                           ; $1F41
G_1F42:
        push af                       ; $1F42
        ld a,($C1C2)                  ; $1F43
        bit 6,a                       ; $1F45
        jp z,G_1F67                   ; $1F47
        and $0F                       ; $1F49
        cp $01                        ; $1F4B
        jp nz,G_1F5A                  ; $1F4D
        ld a,($C0DD)                  ; $1F4F
        cp $05                        ; $1F52
        jp z,G_1F60                   ; $1F54
        jp G_1F67                     ; $1F56
G_1F58:
        pop af                        ; $1F58
        ret                           ; $1F59
G_1F5A:
        sub $04                       ; $1F5A
        cp $03                        ; $1F5C
        jp nc,G_1F67                  ; $1F5E
G_1F60:
        ld a,($C200)                  ; $1F60
        cp $FF                        ; $1F63
        jp nz,G_1F58                  ; $1F65
G_1F67:
        pop af                        ; $1F67
        jp S_SOUND                    ; $1F68
G_1F8E:
        call G_32B9                   ; $1F8E
        ld a,($C190)                  ; $1F91
        call G_RST08                  ; $1F93
        dw G_1FA8, G_1FB5, G_2002, G_200D, G_2061, G_214A, G_2119, G_2119, G_212D, G_214E
G_1FA8:
        call G_32C8                   ; $1FA8
        xor a                         ; $1FAB
        ld hl,$C000                   ; $1FAC
        ld b,$80                      ; $1FAF
G_1FB1:
        ld (hl),a                     ; $1FB1
        inc hl                        
        dec b                         ; $1FB2
        jp nz,G_1FB1                  ; $1FB3
G_1FB5:
        ld a,($C196)                  ; $1FB5
        ld b,a                        ; $1FB7
        ld a,($C0DB)                  ; $1FB8
        ld c,a                        ; $1FBB
        ld a,($C0E6)                  ; $1FBC
        cp $0D                        ; $1FBF
        jp c,G_1FD0                   ; $1FC1
        ld a,($C0E7)                  ; $1FC3
        dec a                         ; $1FC6
        srl a                         ; $1FC7
        bit 1,b                       ; $1FC9
        jp z,G_1FD8                   ; $1FCB
        cpl                           ; $1FCD
        jp G_1FD8                     ; $1FCE
G_1FD0:
        ld a,($C0E6)                  ; $1FD0
        bit 1,b                       ; $1FD3
        jp z,G_1FD8                   ; $1FD5
        cpl                           ; $1FD7
G_1FD8:
        bit 0,c                       ; $1FD8
        jp nz,G_1FDD                  ; $1FDA
        cpl                           ; $1FDC
G_1FDD:
        bit 0,a                       ; $1FDD
        jp z,G_1FE9                   ; $1FDF
        res 6,b                       ; $1FE1
        ld hl,$C000                   ; $1FE3
        xor a                         ; $1FE6
        jp G_1FF0                     ; $1FE7
G_1FE9:
        set 6,b                       ; $1FE9
        ld hl,$C020                   ; $1FEB
        ld a,$80                      ; $1FEE
G_1FF0:
        ld ($C1AD),a                  ; $1FF0
        ld a,b                        ; $1FF2
        ld ($C196),a                  ; $1FF3
        ld a,$04                      ; $1FF5
        ld (hl),a                     ; $1FF7
        xor a                         ; $1FF8
        ld ($C1B0),a                  ; $1FF9
        ld ($C1B5),a                  ; $1FFB
        ld a,$02                      ; $1FFD
        ld ($C190),a                  ; $1FFF
        ret                           ; $2001
G_2002:
        ld a,($C040)                  ; $2002
        cp $09                        ; $2005
        ret nz                        ; $2007
        ld a,$03                      ; $2008
        ld ($C190),a                  ; $200A
        ret                           ; $200C
G_200D:
        ld a,($C1C2)                  ; $200D
        and $0F                       ; $200F
        sub $04                       ; $2011
        jp c,G_2049                   ; $2013
        call G_RST08                  ; $2015
        dw G_201C, G_2129, G_2031
G_201C:
        ld hl,$C191                   ; $201C
        inc (hl)                      ; $201F
        bit 0,(hl)                    ; $2020
        jp nz,G_2129                  ; $2022
        ld a,($C196)                  ; $2025
        bit 6,a                       ; $2027
        ld a,$00                      ; $2029
        jp nz,G_202E                  ; $202B
        inc a                         ; $202D
G_202E:
        jp G_2170                     ; $202E
G_2031:
        ld a,($C191)                  ; $2031
        res 0,a                       ; $2033
        add a,$02                     ; $2035
        ld ($C191),a                  ; $2037
        call G_1F3A                   ; $2039
        bit 7,a                       ; $203C
        ld a,$00                      ; $203E
        jp z,G_2043                   ; $2040
        inc a                         ; $2042
G_2043:
        call G_2170                   ; $2043
        jp G_1EFF                     ; $2046
G_2049:
        ld a,($C191)                  ; $2049
        res 0,a                       ; $204B
        add a,$02                     ; $204D
        ld ($C191),a                  ; $204F
        ld a,($C04D)                  ; $2051
        bit 1,a                       ; $2054
        ld a,$00                      ; $2056
        jp z,G_205B                   ; $2058
        inc a                         ; $205A
G_205B:
        call G_2170                   ; $205B
        jp G_1EFF                     ; $205E
G_2061:
        ld a,($C1AF)                  ; $2061
        bit 7,a                       ; $2063
        jp nz,S_RET                   ; $2065
        ld hl,$C0DC                   ; $2068
        inc (hl)                      ; $206B
        ld hl,$C0E6                   ; $206C
        inc (hl)                      ; $206F
        ld hl,$C0E0                   ; $2070
        ld de,$C0E3                   ; $2073
        ld b,$00                      ; $2076
        ld a,($C193)                  ; $2078
        and a                         ; $207A
        jp z,G_2085                   ; $207B
        ld hl,$C0E3                   ; $207D
        ld de,$C0E0                   ; $2080
        ld b,$03                      ; $2083
G_2085:
        ld a,($C0DB)                  ; $2085
        cp $01                        ; $2088
        jp z,G_2096                   ; $208A
        inc hl                        ; $208C
        inc de                        ; $208D
        inc b                         ; $208E
        cp $02                        ; $208F
        jp z,G_2096                   ; $2091
        inc hl                        ; $2093
        inc de                        ; $2094
        inc b                         ; $2095
G_2096:
        ld a,b                        ; $2096
        ld ($C195),a                  ; $2097
        inc (hl)                      ; $2099
        ld a,(hl)                     ; $209A
        cp $07                        ; $209B
        jp z,G_20B9                   ; $209D
        cp $06                        ; $209F
        jp nz,G_2110                  ; $20A1
        ld a,(de)                     ; $20A3
        cp $05                        ; $20A4
        jp c,G_20B9                   ; $20A6
        jp z,G_2110                   ; $20A8
        ld hl,$C0DC                   ; $20AA
        dec (hl)                      ; $20AD
        xor a                         ; $20AE
        ld ($C0E7),a                  ; $20AF
        ld a,$05                      ; $20B2
        ld ($C0EA),a                  ; $20B4
        jp G_2110                     ; $20B7
G_20B9:
        ld a,$01                      ; $20B9
        ld ($C0E6),a                  ; $20BB
        ld b,$01                      ; $20BE
        ld a,($C193)                  ; $20C0
        and a                         ; $20C2
        jp z,G_20C7                   ; $20C3
        ld b,$FF                      ; $20C5
G_20C7:
        ld a,($C1C4)                  ; $20C7
        add a,b                       ; $20C9
        ld ($C1C4),a                  ; $20CA
        ld a,($C0DB)                  ; $20CC
        inc a                         ; $20CF
        ld ($C0DB),a                  ; $20D0
        cp $03                        ; $20D3
        jp nz,G_20F6                  ; $20D5
        ld b,$06                      ; $20D7
        ld a,$04                      ; $20D9
        ld ($C0EA),a                  ; $20DB
        ld a,($C1C4)                  ; $20DE
        cp $02                        ; $20E0
        jp z,G_20E9                   ; $20E2
        inc b                         ; $20E4
        cp $FE                        ; $20E5
        jp nz,G_2110                  ; $20E7
G_20E9:
        ld a,b                        ; $20E9
        ld ($C190),a                  ; $20EA
        ld a,$96                      ; $20EC
        ld ($C192),a                  ; $20EE
        ld a,$06                      ; $20F0
        ld ($C0EA),a                  ; $20F2
        ret                           ; $20F5
G_20F6:
        cp $04                        ; $20F6
        jp nz,G_2105                  ; $20F8
G_20FA:
        ld b,$06                      ; $20FA
        ld a,($C1C4)                  ; $20FC
        bit 7,a                       ; $20FE
        jp z,G_20E9                   ; $2100
        inc b                         ; $2102
        jp G_20E9                     ; $2103
G_2105:
        ld a,$03                      ; $2105
        ld ($C0EA),a                  ; $2107
        ld a,($C196)                  ; $210A
        bit 3,a                       ; $210C
        jp nz,G_20FA                  ; $210E
G_2110:
        ld a,$64                      ; $2110
        ld ($C192),a                  ; $2112
        ld a,$05                      ; $2114
        ld ($C190),a                  ; $2116
        ret                           ; $2118
G_2119:
        ld a,($C1C3)                  ; $2119
        ld ($C191),a                  ; $211B
        ld hl,$C192                   ; $211D
        dec (hl)                      ; $2120
        ret nz                        ; $2121
        ld a,$0A                      ; $2122
        ld ($C18A),a                  ; $2124
        jp S_SCREEN                   ; $2126
G_2129:
        xor a                         ; $2129
        ld ($C190),a                  ; $212A
        ret                           ; $212C
G_212D:
        xor a                         ; $212D
        ld ($C190),a                  ; $212E
        ld a,($C0E6)                  ; $2130
        cp $0D                        ; $2133
        ret c                         ; $2135
        ld a,($C0E7)                  ; $2136
        ld l,a                        ; $2139
        ld h,$00                      ; $213A
        ld a,$06                      ; $213C
        call G_3143                   ; $213E
        and a                         ; $2141
        ret nz                        ; $2142
        ld a,$08                      ; $2143
        ld ($C18A),a                  ; $2145
        jp S_SCREEN                   ; $2147
G_214A:
        ld a,($C1C3)                  ; $214A
        ld ($C191),a                  ; $214C
G_214E:
        ld hl,$C192                   ; $214E
        dec (hl)                      ; $2151
        ret nz                        ; $2152
        xor a                         ; $2153
        ld ($C190),a                  ; $2154
        jp S_SCREEN                   ; $2156
G_2159:
        xor a                         ; $2159
        ld ($C190),a                  ; $215A
        ld ($C191),a                  ; $215C
        ld a,($C0E6)                  ; $215E
        cp $0D                        ; $2161
        ld a,$01                      ; $2163
        jp c,G_2169                   ; $2165
        ld a,$07                      ; $2167
G_2169:
        ld ($C0DD),a                  ; $2169
        ld ($C0DE),a                  ; $216C
        ret                           ; $216F
G_2170:
        ld ($C193),a                  ; $2170
        and a                         ; $2172
        ld hl,$C081                   ; $2173
        jp z,G_217B                   ; $2176
        ld hl,$C0A1                   ; $2178
G_217B:
        inc (hl)                      ; $217B
        ld hl,$C0DD                   ; $217C
        ld de,$C0DE                   ; $217F
        ld a,($C193)                  ; $2182
        and a                         ; $2184
        jp z,G_2189                   ; $2185
        inc hl                        ; $2187
        dec de                        ; $2188
G_2189:
        ld a,($C0E7)                  ; $2189
        inc a                         ; $218C
        ld ($C0E7),a                  ; $218D
        ld a,$08                      ; $2190
        ld ($C190),a                  ; $2192
        ld a,(hl)                     ; $2194
        cp $00                        ; $2195
        jp z,G_21B3                   ; $2197
        cp $03                        ; $2199
        jp c,G_21DA                   ; $219B
        jp z,G_21BC                   ; $219D
        cp $04                        ; $219F
        jp z,G_21C9                   ; $21A1
        cp $05                        ; $21A3
        jp z,G_21D0                   ; $21A5
        cp $06                        ; $21A7
        jp z,G_21C9                   ; $21A9
        cp $0C                        ; $21AB
        jp c,G_21DA                   ; $21AD
        jp z,G_21E0                   ; $21AF
        jp G_21C9                     ; $21B1
G_21B3:
        ld a,$05                      ; $21B3
        ld (hl),a                     ; $21B5
        ld (de),a                     ; $21B6
        ld a,$29                      ; $21B7
        jp S_SOUND                    ; $21B9
G_21BC:
        ld a,(de)                     ; $21BC
        cp $04                        ; $21BD
        jp z,G_21B3                   ; $21BF
        ld a,$04                      ; $21C1
        ld (hl),a                     ; $21C3
        ld a,$31                      ; $21C4
        jp S_SOUND                    ; $21C6
G_21C9:
        xor a                         ; $21C9
        ld (hl),a                     ; $21CA
        ld a,$04                      ; $21CB
        ld ($C190),a                  ; $21CD
        ret                           ; $21CF
G_21D0:
        xor a                         ; $21D0
        ld (de),a                     ; $21D1
        ld a,$06                      ; $21D2
        ld (hl),a                     ; $21D4
        ld a,$31                      ; $21D5
        jp S_SOUND                    ; $21D7
G_21DA:
        inc (hl)                      ; $21DA
        ld a,$31                      ; $21DB
        jp S_SOUND                    ; $21DD
G_21E0:
        ld a,(de)                     ; $21E0
        cp $0D                        ; $21E1
        jp z,G_21B3                   ; $21E3
        ld a,$0D                      ; $21E5
        ld (hl),a                     ; $21E7
        ld a,$31                      ; $21E8
        jp S_SOUND                    ; $21EA
G_2286:
        call G_00A9                   ; $2286
        and $3F                       ; $2289
        add a,$20                     ; $228B
        ld b,$01                      ; $228D
        ret                           ; $228F
G_2290:
        call G_00A9                   ; $2290
        and $1F                       ; $2293
        sub $10                       ; $2295
        ld b,$02                      ; $2297
        ret                           ; $2299
G_229A:
        ld a,($C0DF)                  ; $229A
        cp $04                        ; $229D
        ld bc,$0F48                   ; $229F
        jp nz,G_22A7                  ; $22A2
        ld bc,$0750                   ; $22A4
G_22A7:
        call G_00A9                   ; $22A7
        and b                         ; $22AA
        add a,c                       ; $22AB
        ld c,$01                      ; $22AC
        ld b,$03                      ; $22AE
        ret                           ; $22B0
G_22B1:
        ld a,($C191)                  ; $22B1
        bit 0,a                       ; $22B3
        ld c,$01                      ; $22B5
        jp z,G_22BB                   ; $22B7
        ld c,$02                      ; $22B9
G_22BB:
        ld a,(hl)                     ; $22BB
        call G_00CA                   ; $22BC
        jp c,G_22E1                   ; $22BF
        call G_00A9                   ; $22C1
        and $F0                       ; $22C4
        cp $C0                        ; $22C6
        ld a,($C196)                  ; $22C8
        ld b,a                        ; $22CA
        ld a,($C191)                  ; $22CB
        jp c,G_22D1                   ; $22CD
        xor $02                       ; $22CF
G_22D1:
        bit 6,b                       ; $22D1
        jp z,G_22D7                   ; $22D3
        xor $02                       ; $22D5
G_22D7:
        bit 1,a                       ; $22D7
        ld a,$20                      ; $22D9
        jp z,G_22DF                   ; $22DB
        ld a,$10                      ; $22DD
G_22DF:
        or c                          ; $22DF
        ld c,a                        ; $22E0
G_22E1:
        call G_00A9                   ; $22E1
        bit 4,a                       ; $22E4
        jp nz,G_2309                  ; $22E6
        bit 3,a                       ; $22E8
        ld a,($C047)                  ; $22EA
        jp nz,G_22F9                  ; $22ED
        cp $44                        ; $22EF
        jp nc,G_2309                  ; $22F1
        ld a,($C196)                  ; $22F3
        xor $40                       ; $22F5
        jp G_22FF                     ; $22F7
G_22F9:
        cp $3C                        ; $22F9
        jp c,G_2309                   ; $22FB
        ld a,($C196)                  ; $22FD
G_22FF:
        bit 6,a                       ; $22FF
        ld a,$80                      ; $2301
        jp z,G_2307                   ; $2303
        ld a,$40                      ; $2305
G_2307:
        or c                          ; $2307
        ld c,a                        ; $2308
G_2309:
        ld a,$04                      ; $2309
        ret                           ; $230B
G_2720:
        ld a,($C196)                  ; $2720
        bit 0,a                       ; $2722
        ret nz                        ; $2724
        ld c,$00                      ; $2725
        ld a,($C1AD)                  ; $2727
        bit 6,a                       ; $2729
        jp z,G_2732                   ; $272B
        call G_27BC                   ; $272D
        jp G_2735                     ; $2730
G_2732:
        call G_2750                   ; $2732
G_2735:
        ld a,($C05A)                  ; $2735
        cp $01                        ; $2738
        jp z,G_2746                   ; $273A
        ld a,($C1AD)                  ; $273C
        bit 5,a                       ; $273E
        jp z,G_2746                   ; $2740
        res 0,c                       ; $2742
        res 1,c                       ; $2744
G_2746:
        ld a,($C19C)                  ; $2746
        xor c                         ; $2748
        and c                         ; $2749
        ld ($C19D),a                  ; $274A
        ld a,c                        ; $274C
        ld ($C19C),a                  ; $274D
        ret                           ; $274F
G_2750:
        ld a,($C196)                  ; $2750
        bit 6,a                       ; $2752
        ret z                         ; $2754
        ld a,($C1B5)                  ; $2755
        call G_RST08                  ; $2757
        dw G_2762, G_2771, G_277F, G_2799, G_27AE, G_20FA
G_2762:
        ld a,($C020)                  ; $2762
        cp $05                        ; $2765
        ret nz                        ; $2767
        call G_2286                   ; $2768
        ld ($C1B6),a                  ; $276B
        ld a,b                        ; $276D
        ld ($C1B5),a                  ; $276E
        ret                           ; $2770
G_2771:
        ld hl,$C1B6                   ; $2771
        dec (hl)                      ; $2774
        ret nz                        ; $2775
        call G_2290                   ; $2776
        ld ($C1B6),a                  ; $2779
        ld a,b                        ; $277B
        ld ($C1B5),a                  ; $277C
        ret                           ; $277E
G_277F:
        ld a,($C1B6)                  ; $277F
        bit 7,a                       ; $2781
        jp nz,G_278A                  ; $2783
        ld c,$20                      ; $2785
        dec a                         ; $2787
        jp G_278D                     ; $2788
G_278A:
        ld c,$10                      ; $278A
        inc a                         ; $278C
G_278D:
        ld ($C1B6),a                  ; $278D
        ret nz                        ; $278F
        call G_229A                   ; $2790
        ld ($C1B6),a                  ; $2793
        ld a,b                        ; $2795
        ld ($C1B5),a                  ; $2796
        ret                           ; $2798
G_2799:
        ld a,($C020)                  ; $2799
        cp $06                        ; $279C
        jp nz,G_2762                  ; $279E
        ld hl,$C1B6                   ; $27A0
        dec (hl)                      ; $27A3
        ret nz                        ; $27A4
        ld hl,$C0B4                   ; $27A5
        call G_22B1                   ; $27A8
        ld ($C1B5),a                  ; $27AB
        ret                           ; $27AD
G_27AE:
        ld a,($C19C)                  ; $27AE
        and $F0                       ; $27B0
        ld c,a                        ; $27B2
        ld a,($C1AD)                  ; $27B3
        bit 6,a                       ; $27B5
        ret z                         ; $27B7
        xor a                         ; $27B8
        ld ($C1B5),a                  ; $27B9
        ret                           ; $27BB
G_27BC:
        ld a,($C1C2)                  ; $27BC
        bit 6,a                       ; $27BE
        ret nz                        ; $27C0
        ld a,($C04C)                  ; $27C1
        cp $02                        ; $27C4
        ret nc                        ; $27C6
        ld a,($C1B5)                  ; $27C7
        call G_RST08                  ; $27C9
        dw G_27D6, G_287F, G_28C1, G_29A7, G_2A63, G_2A72
G_27D6:
        xor a                         ; $27D6
        ld ($C1B9),a                  ; $27D7
        ld a,($C1AD)                  ; $27D9
        bit 7,a                       ; $27DB
        jp nz,G_27E5                  ; $27DD
        ld a,($C043)                  ; $27DF
        cp $70                        ; $27E2
        ret c                         ; $27E4
G_27E5:
        ld a,($C05A)                  ; $27E5
        cp $02                        ; $27E8
        jp c,G_283A                   ; $27EA
        ld c,$00                      ; $27EC
        ld a,($C023)                  ; $27EE
        cp $38                        ; $27F1
        jp c,G_27FD                   ; $27F3
        ld c,$03                      ; $27F5
        cp $56                        ; $27F7
        jp c,G_27FD                   ; $27F9
        ld c,$06                      ; $27FB
G_27FD:
        ld b,$00                      ; $27FD
        ld hl,$C0B7                   ; $27FF
        add hl,bc                     ; $2802
        ld d,$00                      ; $2803
        ld a,($C0DF)                  ; $2805
        cp $03                        ; $2808
        jp c,G_281A                   ; $280A
        ld a,($C023)                  ; $280C
        sub $6C                       ; $280F
        jp nc,G_2815                  ; $2811
        cpl                           ; $2813
        inc a                         ; $2814
G_2815:
        srl a                         ; $2815
        srl a                         ; $2817
        ld d,a                        ; $2819
G_281A:
        ld a,(hl)                     ; $281A
        inc hl                        
        sub d                         ; $281B
        jp nc,G_281F                  ; $281C
        xor a                         ; $281E
G_281F:
        ld d,a                        ; $281F
        push hl                       ; $2820
        call G_00CA                   ; $2821
        pop hl                        ; $2824
        jp nc,G_283A                  ; $2825
        ld a,(hl)                     ; $2827
        inc hl                        
        add a,d                       ; $2828
        ld d,a                        ; $2829
        push hl                       ; $282A
        call G_00D9                   ; $282B
        pop hl                        ; $282E
        jp nc,G_2844                  ; $282F
        ld a,(hl)                     ; $2831
        add a,d                       ; $2832
        call G_00D9                   ; $2833
        jp nc,G_2865                  ; $2836
        jp G_286D                     ; $2838
G_283A:
        ld a,($C025)                  ; $283A
        ld ($C1B7),a                  ; $283D
        ld a,($C023)                  ; $283F
        jp G_2874                     ; $2842
G_2844:
        call G_00A9                   ; $2844
        and $3F                       ; $2847
        add a,$4C                     ; $2849
        ld b,a                        ; $284B
        ld a,($C025)                  ; $284C
        ld hl,$C045                   ; $284F
        add a,(hl)                    ; $2852
        rra                           ; $2853
        add a,b                       ; $2854
        rra                           ; $2855
        ld ($C1B7),a                  ; $2856
        ld a,($C023)                  ; $2858
        add a,$20                     ; $285B
        cp $6C                        ; $285D
        jp c,G_2874                   ; $285F
        ld a,$6C                      ; $2861
        jp G_2874                     ; $2863
G_2865:
        ld a,$6C                      ; $2865
        ld ($C1B7),a                  ; $2867
        ld a,$38                      ; $2869
        jp G_2874                     ; $286B
G_286D:
        ld a,$6C                      ; $286D
        ld ($C1B7),a                  ; $286F
        ld a,($C023)                  ; $2871
G_2874:
        ld ($C1B8),a                  ; $2874
        ld c,$00                      ; $2876
        xor a                         ; $2878
        ld ($C1B6),a                  ; $2879
        inc a                         ; $287B
        ld ($C1B5),a                  ; $287C
        ret                           ; $287E
G_287F:
        ld hl,$C1B7                   ; $287F
        ld a,($C025)                  ; $2882
        sub (hl)                      ; $2885
        jp z,G_288E                   ; $2886
        ld c,$20                      ; $2888
        jp nc,G_288E                  ; $288A
        ld c,$10                      ; $288C
G_288E:
        inc hl                        ; $288E
        ld a,($C023)                  ; $288F
        sub (hl)                      ; $2892
        jp z,G_289D                   ; $2893
        ld a,$40                      ; $2895
        jp nc,G_289B                  ; $2897
        ld a,$80                      ; $2899
G_289B:
        or c                          ; $289B
        ld c,a                        ; $289C
G_289D:
        ld a,($C1AD)                  ; $289D
        bit 7,a                       ; $289F
        ret z                         ; $28A1
        ld a,($C05A)                  ; $28A2
        cp $02                        ; $28A5
        ld a,($C0B0)                  ; $28A7
        jp nc,G_28B7                  ; $28AA
        ld b,a                        ; $28AC
        ld a,($C051)                  ; $28AD
        srl a                         ; $28B0
        srl a                         ; $28B2
        ld l,a                        ; $28B4
        ld a,b                        ; $28B5
        sub l                         ; $28B6
G_28B7:
        ld hl,$C043                   ; $28B7
        cp (hl)                       ; $28BA
        ret c                         ; $28BB
        ld a,$02                      ; $28BC
        ld ($C1B5),a                  ; $28BE
        ret                           ; $28C0
G_28C1:
        ld a,($C1B6)                  ; $28C1
        and a                         ; $28C3
        jp z,G_28D5                   ; $28C4
        dec a                         ; $28C6
        ld ($C1B6),a                  ; $28C7
        ld b,$00                      ; $28C9
        jp nz,G_297D                  ; $28CB
        ld a,$03                      ; $28CE
        ld ($C1B5),a                  ; $28D0
        jp G_297D                     ; $28D2
G_28D5:
        ld a,($C051)                  ; $28D5
        rrca                          ; $28D8
        rrca                          
        rrca                          
        rrca                          
        or a                          
        and $0F                       ; $28DA
        ld b,a                        ; $28DC
        srl b                         ; $28DD
        sla a                         ; $28DF
        sla a                         ; $28E1
        sub b                         ; $28E3
        ld b,a                        ; $28E4
        ld hl,$C023                   ; $28E5
        ld a,($C043)                  ; $28E8
        sub (hl)                      ; $28EB
        cp b                          ; $28EC
        jp nc,G_291B                  ; $28ED
        call G_08A6                   ; $28EF
        call G_1722                   ; $28F2
        ld a,($C025)                  ; $28F5
        sub h                         ; $28F8
        add a,$14                     ; $28F9
        cp $28                        ; $28FB
        jp nc,G_291B                  ; $28FD
        ld a,($C047)                  ; $28FF
        cp $48                        ; $2902
        jp nc,G_297B                  ; $2904
        ld a,($C04B)                  ; $2906
        cp $04                        ; $2909
        jp nc,G_2913                  ; $290B
        ld a,($C04C)                  ; $290D
        and a                         ; $2910
        jp z,G_291B                   ; $2911
G_2913:
        call G_00A9                   ; $2913
        and $07                       ; $2916
        inc a                         ; $2918
        ld ($C1B6),a                  ; $2919
G_291B:
        ld a,($C047)                  ; $291B
        cp $60                        ; $291E
        jp c,G_292E                   ; $2920
        ld a,($C1B9)                  ; $2922
        and a                         ; $2924
        jp nz,G_292E                  ; $2925
        ld a,$05                      ; $2927
        ld ($C1B5),a                  ; $2929
        ld c,$00                      ; $292B
        ret                           ; $292D
G_292E:
        ld a,($C0B0)                  ; $292E
        ld hl,$C043                   ; $2931
        cp (hl)                       ; $2934
        jp c,G_2948                   ; $2935
        ld a,($C047)                  ; $2937
        bit 7,a                       ; $293A
        jp nz,G_297B                  ; $293C
        cp $30                        ; $293E
        jp nc,G_294C                  ; $2940
        ld a,($C04C)                  ; $2942
        and a                         ; $2945
        jp nz,G_294C                  ; $2946
G_2948:
        ld b,$00                      ; $2948
        jp G_297D                     ; $294A
G_294C:
        ld b,$80                      ; $294C
        ld a,($C05A)                  ; $294E
        cp $02                        ; $2951
        jp nc,G_295E                  ; $2953
        ld a,($C023)                  ; $2955
        cp $4C                        ; $2958
        jp c,G_295E                   ; $295A
        ld b,$00                      ; $295C
G_295E:
        ld a,($C051)                  ; $295E
        srl a                         ; $2961
        srl a                         ; $2963
        srl a                         ; $2965
        ld c,a                        ; $2967
        ld a,($C052)                  ; $2968
        bit 7,a                       ; $296B
        jp z,G_2971                   ; $296D
        srl c                         ; $296F
G_2971:
        ld a,($C043)                  ; $2971
        sub c                         ; $2974
        ld hl,$C023                   ; $2975
        sub (hl)                      ; $2978
        jp nc,G_297D                  ; $2979
G_297B:
        ld b,$40                      ; $297B
G_297D:
        push bc                       ; $297D
        call G_08A6                   ; $297E
        call G_1722                   ; $2981
        ld a,($C025)                  ; $2984
        sub h                         ; $2987
        ld c,$20                      ; $2988
        bit 7,a                       ; $298A
        jp z,G_2992                   ; $298C
        ld c,$10                      ; $298E
        cpl                           ; $2990
        inc a                         ; $2991
G_2992:
        cp $08                        ; $2992
        jp c,G_299E                   ; $2994
        cp $10                        ; $2996
        jp nc,G_29A2                  ; $2998
        ld c,$00                      ; $299A
        jp G_29A2                     ; $299C
G_299E:
        ld a,c                        ; $299E
        xor $30                       ; $299F
        ld c,a                        ; $29A1
G_29A2:
        ld a,c                        ; $29A2
        pop bc                        ; $29A3
        or b                          ; $29A4
        ld c,a                        ; $29A5
        ret                           ; $29A6
G_29A7:
        call G_176B                   ; $29A7
        ld c,$00                      ; $29AA
        jp c,G_29E0                   ; $29AC
        ld a,($C00B)                  ; $29AE
        cp $08                        ; $29B1
        jp c,G_29DE                   ; $29B3
        ld a,($C19A)                  ; $29B5
        bit 6,a                       ; $29B7
        jp z,G_29C4                   ; $29B9
        ld a,($C003)                  ; $29BB
        cp $A0                        ; $29BE
        jp nc,G_29C4                  ; $29C0
        ld c,$1E                      ; $29C2
G_29C4:
        ld a,($C0B1)                  ; $29C4
        add a,c                       ; $29C7
        push af                       ; $29C8
        ld a,($C02B)                  ; $29C9
        cp $0C                        ; $29CC
        jp c,G_29D6                   ; $29CE
        pop af                        ; $29D0
        srl a                         ; $29D1
        srl a                         ; $29D3
        push af                       ; $29D5
G_29D6:
        pop af                        ; $29D6
        call G_00CA                   ; $29D7
        ld c,$02                      ; $29DA
        jp nc,G_29E0                  ; $29DC
G_29DE:
        ld c,$01                      ; $29DE
G_29E0:
        ld a,($C02B)                  ; $29E0
        cp $0C                        ; $29E3
        ld a,($C0B5)                  ; $29E5
        jp c,G_29EC                   ; $29E8
        add a,$14                     ; $29EA
G_29EC:
        call G_00CA                   ; $29EC
        ld b,$00                      ; $29EF
        jp c,G_2A29                   ; $29F1
        ld a,($C0DF)                  ; $29F3
        cp $04                        ; $29F6
        ld h,$03                      ; $29F8
        jp nz,G_29FE                  ; $29FA
        ld h,$01                      ; $29FC
G_29FE:
        call G_00A9                   ; $29FE
        and h                         ; $2A01
        jp nz,G_2A0E                  ; $2A02
        ld a,($C19A)                  ; $2A04
        bit 5,a                       ; $2A06
        jp nz,G_2A15                  ; $2A08
        bit 4,a                       ; $2A0A
        jp nz,G_2A20                  ; $2A0C
G_2A0E:
        ld a,($C005)                  ; $2A0E
        cp $6C                        ; $2A11
        jp nc,G_2A20                  ; $2A13
G_2A15:
        ld a,($C025)                  ; $2A15
        cp $88                        ; $2A18
        jp nc,G_2A29                  ; $2A1A
        ld b,$10                      ; $2A1C
        jp G_2A29                     ; $2A1E
G_2A20:
        ld a,($C025)                  ; $2A20
        cp $50                        ; $2A23
        jp c,G_2A29                   ; $2A25
        ld b,$20                      ; $2A27
G_2A29:
        ld a,b                        ; $2A29
        or c                          ; $2A2A
        ld c,a                        ; $2A2B
        bit 1,c                       ; $2A2C
        jp z,G_2A37                   ; $2A2E
        call G_00A9                   ; $2A30
        bit 4,a                       ; $2A33
        jp nz,G_2A4E                  ; $2A35
G_2A37:
        ld b,$00                      ; $2A37
        call G_00A9                   ; $2A39
        bit 0,a                       ; $2A3C
        jp z,G_2A5B                   ; $2A3E
        ld a,($C003)                  ; $2A40
        cp $B0                        ; $2A43
        jp nc,G_2A52                  ; $2A45
        ld a,($C023)                  ; $2A47
        cp $40                        ; $2A4A
        jp nc,G_2A5B                  ; $2A4C
G_2A4E:
        ld b,$80                      ; $2A4E
        jp G_2A5B                     ; $2A50
G_2A52:
        ld a,($C023)                  ; $2A52
        cp $40                        ; $2A55
        jp c,G_2A5B                   ; $2A57
        ld b,$40                      ; $2A59
G_2A5B:
        ld a,b                        ; $2A5B
        or c                          ; $2A5C
        ld c,a                        ; $2A5D
        ld a,$04                      ; $2A5E
        ld ($C1B5),a                  ; $2A60
        ret                           ; $2A62
G_2A63:
        ld a,($C19C)                  ; $2A63
        and $F0                       ; $2A65
        ld c,a                        ; $2A67
        ld a,($C020)                  ; $2A68
        cp $02                        ; $2A6B
        ret z                         ; $2A6D
        xor a                         ; $2A6E
        ld ($C1B5),a                  ; $2A6F
        ret                           ; $2A71
G_2A72:
        ld a,($C1B6)                  ; $2A72
        and a                         ; $2A74
        jp z,G_2A86                   ; $2A75
        dec a                         ; $2A77
        ld ($C1B6),a                  ; $2A78
        ld b,$00                      ; $2A7A
        jp nz,G_2B11                  ; $2A7C
        ld a,$03                      ; $2A7F
        ld ($C1B5),a                  ; $2A81
        jp G_2B11                     ; $2A83
G_2A86:
        ld hl,$C023                   ; $2A86
        ld a,($C043)                  ; $2A89
        sub (hl)                      ; $2A8C
        cp $0C                        ; $2A8D
        jp nc,G_2AB3                  ; $2A8F
        ld hl,$C024                   ; $2A91
        call G_1BEF                   ; $2A94
        add a,$0C                     ; $2A97
        cp $10                        ; $2A99
        jp nc,G_2AB3                  ; $2A9B
        ld a,($C047)                  ; $2A9D
        cp $60                        ; $2AA0
        jp nc,G_2AB3                  ; $2AA2
        ld a,($C052)                  ; $2AA4
        bit 7,a                       ; $2AA7
        jp z,G_2AB3                   ; $2AA9
        call G_00A9                   ; $2AAB
        and $03                       ; $2AAE
        inc a                         ; $2AB0
        ld ($C1B6),a                  ; $2AB1
G_2AB3:
        ld a,($C043)                  ; $2AB3
        cp $60                        ; $2AB6
        jp c,G_2ADA                   ; $2AB8
        ld a,($C052)                  ; $2ABA
        bit 7,a                       ; $2ABD
        jp z,G_2AE3                   ; $2ABF
        ld a,($C025)                  ; $2AC1
        sub $08                       ; $2AC4
        ld b,a                        ; $2AC6
        ld a,($C045)                  ; $2AC7
        sub b                         ; $2ACA
        jp nc,G_2ACF                  ; $2ACB
        cpl                           ; $2ACD
        inc a                         ; $2ACE
G_2ACF:
        sla a                         ; $2ACF
        add a,$38                     ; $2AD1
        ld b,a                        ; $2AD3
        ld a,($C047)                  ; $2AD4
        cp b                          ; $2AD7
        jp nc,G_2AE3                  ; $2AD8
G_2ADA:
        ld a,$02                      ; $2ADA
        ld ($C1B5),a                  ; $2ADC
        ld ($C1B9),a                  ; $2ADE
        ld c,$00                      ; $2AE0
        ret                           ; $2AE2
G_2AE3:
        ld a,($C0B0)                  ; $2AE3
        ld hl,$C043                   ; $2AE6
        cp (hl)                       ; $2AE9
        jp c,G_2B0F                   ; $2AEA
        ld b,$40                      ; $2AEC
        ld a,($C043)                  ; $2AEE
        ld hl,$C023                   ; $2AF1
        sub (hl)                      ; $2AF4
        jp c,G_2B11                   ; $2AF5
        cp $08                        ; $2AF7
        jp c,G_2AFB                   ; $2AF9
G_2AFB:
        ld b,$40                      ; $2AFB
        ld a,($C043)                  ; $2AFD
        ld hl,$C023                   ; $2B00
        sub (hl)                      ; $2B03
        cp $18                        ; $2B04
        jp nc,G_2B0F                  ; $2B06
        ld a,($C047)                  ; $2B08
        bit 7,a                       ; $2B0B
        jp nz,G_2B11                  ; $2B0D
G_2B0F:
        ld b,$00                      ; $2B0F
G_2B11:
        push bc                       ; $2B11
        call G_08A6                   ; $2B12
        call G_1722                   ; $2B15
        ld a,($C025)                  ; $2B18
        sub h                         ; $2B1B
        ld c,$20                      ; $2B1C
        bit 7,a                       ; $2B1E
        jp z,G_2B24                   ; $2B20
        ld c,$10                      ; $2B22
G_2B24:
        cp $04                        ; $2B24
        jp c,G_2B2C                   ; $2B26
        cp $0C                        ; $2B28
        jp nc,G_2B2E                  ; $2B2A
G_2B2C:
        ld c,$00                      ; $2B2C
G_2B2E:
        ld a,c                        ; $2B2E
        pop bc                        ; $2B2F
        or b                          ; $2B30
        ld c,a                        ; $2B31
        ret                           ; $2B32
G_3047:
        add a,a                       ; $3047
        ld e,a                        ; $3048
        ld d,$00                      ; $3049
        add hl,de                     ; $304B
        ld a,(hl)                     ; $304C
        inc hl                        
        ld h,(hl)                     ; $304D
        ld l,a                        ; $304E
        ret                           ; $304F
G_308F:
        ld d,$00                      ; $308F
        ld hl,$0000                   ; $3091
        rrca                          ; $3094
        jp nc,G_3098                  ; $3095
        add hl,de                     ; $3097
G_3098:
        sla e                         ; $3098
        rl d                          ; $309A
        rrca                          ; $309C
        jp nc,G_30A0                  ; $309D
        add hl,de                     ; $309F
G_30A0:
        sla e                         ; $30A0
        rl d                          ; $30A2
        rrca                          ; $30A4
        jp nc,G_30A8                  ; $30A5
        add hl,de                     ; $30A7
G_30A8:
        sla e                         ; $30A8
        rl d                          ; $30AA
        rrca                          ; $30AC
        jp nc,G_30B0                  ; $30AD
        add hl,de                     ; $30AF
G_30B0:
        sla e                         ; $30B0
        rl d                          ; $30B2
        rrca                          ; $30B4
        jp nc,G_30B8                  ; $30B5
        add hl,de                     ; $30B7
G_30B8:
        sla e                         ; $30B8
        rl d                          ; $30BA
        rrca                          ; $30BC
        jp nc,G_30C0                  ; $30BD
        add hl,de                     ; $30BF
G_30C0:
        sla e                         ; $30C0
        rl d                          ; $30C2
        rrca                          ; $30C4
        jp nc,G_30C8                  ; $30C5
        add hl,de                     ; $30C7
G_30C8:
        sla e                         ; $30C8
        rl d                          ; $30CA
        rrca                          ; $30CC
        ret nc                        ; $30CD
        add hl,de                     ; $30CE
        ret                           ; $30CF
G_30D0:
        push hl                       ; $30D0
        pop de                        ; $30D1
        ld ($C1C7),a                  ; $30D2
        xor a                         ; $30D4
        ld ($C1C8),a                  ; $30D5
        ld c,a                        ; $30D7
        ld h,a                        ; $30D8
        ld l,a                        ; $30D9
        ld a,($C1C7)                  ; $30DA
        ld b,$08                      ; $30DC
G_30DE:
        rrca                          ; $30DE
        jp nc,G_30EB                  ; $30DF
        add hl,de                     ; $30E1
        ld ($C1C7),a                  ; $30E2
        ld a,($C1C8)                  ; $30E4
        adc a,c                       ; $30E6
        ld ($C1C8),a                  ; $30E7
        ld a,($C1C7)                  ; $30E9
G_30EB:
        sla e                         ; $30EB
        rl d                          ; $30ED
        rl c                          ; $30EF
        dec b                         ; $30F1
        jp nz,G_30DE                  ; $30F2
        ld a,($C1C8)                  ; $30F4
        ld c,a                        ; $30F6
        ret                           ; $30F7
G_3120:
        push hl                       ; $3120
        push de                       ; $3121
        ld a,d                        ; $3122
        call G_30D0                   ; $3123
        ld a,l                        ; $3126
        ld ($C1C9),a                  ; $3127
        ld a,h                        ; $3129
        ld ($C1CA),a                  ; $312A
        ld a,c                        ; $312C
        ld ($C1CB),a                  ; $312D
        pop de                        ; $312F
        pop hl                        ; $3130
        ld a,e                        ; $3131
        call G_30D0                   ; $3132
        ld a,($C1C9)                  ; $3135
        add a,h                       ; $3137
        ld h,a                        ; $3138
        ld a,($C1CA)                  ; $3139
        adc a,c                       ; $313B
        ld c,a                        ; $313C
        ld a,($C1CB)                  ; $313D
        adc a,$00                     ; $313F
        ld b,a                        ; $3141
        ret                           ; $3142
G_3143:
        ld c,a                        ; $3143
        xor a                         ; $3144
        add hl,hl                     ; $3145
        rla                           ; $3146
        jp c,G_314C                   ; $3147
        cp c                          ; $3149
        jp c,G_314E                   ; $314A
G_314C:
        sub c                         ; $314C
        inc l                         ; $314D
G_314E:
        add hl,hl                     ; $314E
        rla                           ; $314F
        jp c,G_3155                   ; $3150
        cp c                          ; $3152
        jp c,G_3157                   ; $3153
G_3155:
        sub c                         ; $3155
        inc l                         ; $3156
G_3157:
        add hl,hl                     ; $3157
        rla                           ; $3158
        jp c,G_315E                   ; $3159
        cp c                          ; $315B
        jp c,G_3160                   ; $315C
G_315E:
        sub c                         ; $315E
        inc l                         ; $315F
G_3160:
        add hl,hl                     ; $3160
        rla                           ; $3161
        jp c,G_3167                   ; $3162
        cp c                          ; $3164
        jp c,G_3169                   ; $3165
G_3167:
        sub c                         ; $3167
        inc l                         ; $3168
G_3169:
        add hl,hl                     ; $3169
        rla                           ; $316A
        jp c,G_3170                   ; $316B
        cp c                          ; $316D
        jp c,G_3172                   ; $316E
G_3170:
        sub c                         ; $3170
        inc l                         ; $3171
G_3172:
        add hl,hl                     ; $3172
        rla                           ; $3173
        jp c,G_3179                   ; $3174
        cp c                          ; $3176
        jp c,G_317B                   ; $3177
G_3179:
        sub c                         ; $3179
        inc l                         ; $317A
G_317B:
        add hl,hl                     ; $317B
        rla                           ; $317C
        jp c,G_3182                   ; $317D
        cp c                          ; $317F
        jp c,G_3184                   ; $3180
G_3182:
        sub c                         ; $3182
        inc l                         ; $3183
G_3184:
        add hl,hl                     ; $3184
        rla                           ; $3185
        jp c,G_318B                   ; $3186
        cp c                          ; $3188
        jp c,G_318D                   ; $3189
G_318B:
        sub c                         ; $318B
        inc l                         ; $318C
G_318D:
        add hl,hl                     ; $318D
        rla                           ; $318E
        jp c,G_3194                   ; $318F
        cp c                          ; $3191
        jp c,G_3196                   ; $3192
G_3194:
        sub c                         ; $3194
        inc l                         ; $3195
G_3196:
        add hl,hl                     ; $3196
        rla                           ; $3197
        jp c,G_319D                   ; $3198
        cp c                          ; $319A
        jp c,G_319F                   ; $319B
G_319D:
        sub c                         ; $319D
        inc l                         ; $319E
G_319F:
        add hl,hl                     ; $319F
        rla                           ; $31A0
        jp c,G_31A6                   ; $31A1
        cp c                          ; $31A3
        jp c,G_31A8                   ; $31A4
G_31A6:
        sub c                         ; $31A6
        inc l                         ; $31A7
G_31A8:
        add hl,hl                     ; $31A8
        rla                           ; $31A9
        jp c,G_31AF                   ; $31AA
        cp c                          ; $31AC
        jp c,G_31B1                   ; $31AD
G_31AF:
        sub c                         ; $31AF
        inc l                         ; $31B0
G_31B1:
        add hl,hl                     ; $31B1
        rla                           ; $31B2
        jp c,G_31B8                   ; $31B3
        cp c                          ; $31B5
        jp c,G_31BA                   ; $31B6
G_31B8:
        sub c                         ; $31B8
        inc l                         ; $31B9
G_31BA:
        add hl,hl                     ; $31BA
        rla                           ; $31BB
        jp c,G_31C1                   ; $31BC
        cp c                          ; $31BE
        jp c,G_31C3                   ; $31BF
G_31C1:
        sub c                         ; $31C1
        inc l                         ; $31C2
G_31C3:
        add hl,hl                     ; $31C3
        rla                           ; $31C4
        jp c,G_31CA                   ; $31C5
        cp c                          ; $31C7
        jp c,G_31CC                   ; $31C8
G_31CA:
        sub c                         ; $31CA
        inc l                         ; $31CB
G_31CC:
        add hl,hl                     ; $31CC
        rla                           ; $31CD
        jp c,G_31D2                   ; $31CE
        cp c                          ; $31D0
        ret c                         ; $31D1
G_31D2:
        sub c                         ; $31D2
        inc l                         ; $31D3
        ret                           ; $31D4
G_31D5:
        xor a                         ; $31D5
        ld c,a                        ; $31D6
        ld ($C1C7),a                  ; $31D7
        ld b,$10                      ; $31D9
G_31DB:
        add hl,hl                     ; $31DB
        rl c                          ; $31DC
        ld a,($C1C7)                  ; $31DE
        rla                           ; $31E0
        ld ($C1C7),a                  ; $31E1
        ld a,c                        ; $31E3
        sub e                         ; $31E4
        ld ($C1C8),a                  ; $31E5
        ld a,($C1C7)                  ; $31E7
        sbc a,d                       ; $31E9
        jp c,G_31F2                   ; $31EA
        ld ($C1C7),a                  ; $31EC
        ld a,($C1C8)                  ; $31EE
        ld c,a                        ; $31F0
        inc l                         ; $31F1
G_31F2:
        dec b                         ; $31F2
        jp nz,G_31DB                  ; $31F3
        ld a,($C1C7)                  ; $31F5
        ld b,a                        ; $31F7
        ret                           ; $31F8
G_3297:
        ld hl,$C0DB                   ; $3297
        ld a,$01                      ; $329A
        ld (hl),a                     ; $329C
        inc hl                        
        ld (hl),a                     ; $329D
        inc hl                        
        ld (hl),a                     ; $329E
        inc hl                        
        ld (hl),a                     ; $329F
        inc hl                        
        ld ($C0E6),a                  ; $32A0
        inc hl                        ; $32A3
        xor a                         ; $32A4
        ld (hl),a                     ; $32A5
        inc hl                        
        ld (hl),a                     ; $32A6
        inc hl                        
        ld (hl),a                     ; $32A7
        inc hl                        
        ld (hl),a                     ; $32A8
        inc hl                        
        ld (hl),a                     ; $32A9
        inc hl                        
        ld (hl),a                     ; $32AA
        inc hl                        
        ld a,($C1AF)                  ; $32AB
        bit 7,a                       ; $32AD
        ret z                         ; $32AF
        and $01                       ; $32B0
        ld ($C0DC),a                  ; $32B2
        ld ($C0E6),a                  ; $32B5
        ret                           ; $32B8
G_32B9:
        ld a,($C040)                  ; $32B9
        sub $02                       ; $32BC
        ret c                         ; $32BE
        cp $03                        ; $32BF
        ret nc                        ; $32C1
        ld hl,$C1C2                   ; $32C2
        res 6,(hl)                    ; $32C5
        ret                           ; $32C7
G_32C8:
        ld b,$C1                      ; $32C8
        ld hl,$C0DD                   ; $32CA
        ld a,($C0DE)                  ; $32CD
        cp (hl)                       ; $32D0
        jp nz,G_32D9                  ; $32D1
        cp $01                        ; $32D3
        jp nz,G_32D9                  ; $32D5
        ld b,$00                      ; $32D7
G_32D9:
        ld a,b                        ; $32D9
        ld ($C1C2),a                  ; $32DA
        ret                           ; $32DC

; --- Données de la ROM lues par la logique ---
D_0B35:
        dw D_0B3D, D_0B4D, D_0B5D, D_0B6D
D_0B3D:
        db $94, $05, $70, $00, $1E, $3C, $58, $0A, $14, $3C, $0A, $14, $0A, $14, $14, $05
D_0B4D:
        db $A0, $0A, $A0, $00, $28, $32, $80, $0A, $46, $0A, $0A, $1E, $0A, $14, $14, $00
D_0B5D:
        db $A0, $14, $C0, $00, $46, $3C, $90, $0A, $14, $1E, $0A, $14, $0A, $0A, $32, $05
D_0B6D:
        db $B0, $1E, $E0, $00, $50, $32, $A0, $05, $1E, $0A, $05, $14, $28, $0A, $32, $05
