; Fichier généré par tools/gb2m6502.py à partir de la ROM Game Boy.
; Ne pas modifier à la main : relancer le script.

G_00A9
        lda zB                        ; $00A9 push bc
        pha                           
        lda zC                        
        pha                           
        lda $FFA4                     ; $00AA ldh a,[a8]
        sta zA                        
                                      ; $00AC ld b,a
        sta zB                        
        clc                           ; $00AD add a
        lda zA                        
        adc zA                        
        sta zA                        
        clc                           ; $00AE add a
        lda zA                        
        adc zA                        
        sta zA                        
        clc                           ; $00AF add b
        lda zA                        
        adc zB                        
        sta zA                        
        clc                           ; $00B0 add d8
        lda zA                        
        adc #$0B                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $00B2 ldh [a8],a
        sta $FFA4                     
        pla                           ; $00B4 pop bc
        sta zC                        
        pla                           
        sta zB                        
        rts                           ; $00B5 ret
G_00C3
        lda zL                        ; $00C3 ld a,l
        sta zA                        
        sec                           ; $00C4 sub e
        lda zA                        
        sbc zE                        
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $00C5 ld e,a
        sta zE                        
        lda zH                        ; $00C6 ld a,h
        sta zA                        
        lda zCY                       ; $00C7 sbc d
        eor #1                        
        lsr a                         
        lda zA                        
        sbc zD                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $00C8 ld d,a
        sta zD                        
        rts                           ; $00C9 ret
G_00CA
        sec                           ; $00CA cp d8
        lda zA                        
        sbc #$64                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $00CC ret nc
        lsr a                         
        bcs _s1                       
        rts                           
_s1
        lda zA                        ; $00CD ld b,a
        sta zB                        
                                      ; $00CE srl b
        lsr a                         
        sta zB                        
        clc                           ; $00D0 add a
        lda zA                        
        adc zA                        
        sta zA                        
        clc                           ; $00D1 add b
        lda zA                        
        adc zB                        
        sta zA                        
                                      ; $00D2 ld l,a
        sta zL                        
        jsr G_00A9                    ; $00D3 call a16
        sec                           ; $00D6 cp l
        lda zA                        
        sbc zL                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zCY                       ; $00D7 ccf
        rts                           ; $00D8 ret
G_00D9
        sec                           ; $00D9 cp d8
        lda zA                        
        sbc #$64                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $00DB ret nc
        lsr a                         
        bcs _s2                       
        rts                           
_s2
        lda zA                        ; $00DC ld b,a
        sta zB                        
                                      ; $00DD srl b
        lsr a                         
        sta zB                        
        clc                           ; $00DF add a
        lda zA                        
        adc zA                        
        sta zA                        
        clc                           ; $00E0 add b
        lda zA                        
        adc zB                        
        sta zA                        
                                      ; $00E1 ld l,a
        sta zL                        
        lda $FFA4                     ; $00E2 ldh a,[a8]
        sta zA                        
        sec                           ; $00E4 cp l
        lda zA                        
        sbc zL                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zCY                       ; $00E5 ccf
        rts                           ; $00E6 ret
G_0885
        lda $C004                     ; $0885 ld a,[a16]
        sta zA                        
        clc                           ; $0888 add d8
        lda zA                        
        adc #$80                      
        sta zA                        
        rol zCY                       
        lda $C005                     ; $088A ld a,[a16]
        sta zA                        
        lda zCY                       ; $088D adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $088F ret
G_0890
        lda $C002                     ; $0890 ld a,[a16]
        sta zA                        
        clc                           ; $0893 add d8
        lda zA                        
        adc #$80                      
        sta zA                        
        rol zCY                       
        lda $C003                     ; $0895 ld a,[a16]
        sta zA                        
        lda zCY                       ; $0898 adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $089A ret
G_089B
        lda $C024                     ; $089B ld a,[a16]
        sta zA                        
        clc                           ; $089E add d8
        lda zA                        
        adc #$80                      
        sta zA                        
        rol zCY                       
        lda $C025                     ; $08A0 ld a,[a16]
        sta zA                        
        lda zCY                       ; $08A3 adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $08A5 ret
G_08A6
        lda $C022                     ; $08A6 ld a,[a16]
        sta zA                        
        clc                           ; $08A9 add d8
        lda zA                        
        adc #$80                      
        sta zA                        
        rol zCY                       
        lda $C023                     ; $08AB ld a,[a16]
        sta zA                        
        lda zCY                       ; $08AE adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $08B0 ret
G_08B1
        lda $C044                     ; $08B1 ld a,[a16]
        sta zA                        
        clc                           ; $08B4 add d8
        lda zA                        
        adc #$80                      
        sta zA                        
        rol zCY                       
        lda $C045                     ; $08B6 ld a,[a16]
        sta zA                        
        lda zCY                       ; $08B9 adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $08BB ret
G_08BC
        lda $C042                     ; $08BC ld a,[a16]
        sta zA                        
        clc                           ; $08BF add d8
        lda zA                        
        adc #$80                      
        sta zA                        
        rol zCY                       
        lda $C043                     ; $08C1 ld a,[a16]
        sta zA                        
        lda zCY                       ; $08C4 adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $08C6 ret
G_08C7
        lda zH                        ; $08C7 push hl
        pha                           
        lda zL                        
        pha                           
        lda (zL),y                    ; $08C8 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s3                       
        inc zH                        
_s3
        lda (zL),y                    ; $08C9 ld h,[hl]
        sta zH                        
        lda zA                        ; $08CA ld l,a
        sta zL                        
        lda zC                        ; $08CB bit 5,c
        and #$20                      
        sta zZ                        
                                      ; $08CD jr z,pc+r8
        bne _s4                       
        jmp G_08DF                    
_s4
        lda #<$07FF                   ; $08CF ld de,d16
        sta zE                        
        lda #>$07FF                   
        sta zD                        
        jsr G_00C3                    ; $08D2 call a16
        lda zCY                       ; $08D5 jr c,pc+r8
        lsr a                         
        bcc _s5                       
        jmp G_08F1                    
_s5
        lda zL                        ; $08D7 ld a,l
        sta zA                        
        sec                           ; $08D8 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $08D9 ld l,a
        sta zL                        
        lda zCY                       ; $08DA jr nc,pc+r8
        lsr a                         
        bcs _s6                       
        jmp G_08F1                    
_s6
        dec zH                        ; $08DC dec h
        lda zH                        
        sta zZ                        
        jmp G_08F1                    ; $08DD jr pc+r8
G_08DF
        lda zC                        ; $08DF bit 4,c
        and #$10                      
        sta zZ                        
                                      ; $08E1 jr z,pc+r8
        bne _s7                       
        jmp G_08F1                    
_s7
        lda #<$D001                   ; $08E3 ld de,d16
        sta zE                        
        lda #>$D001                   
        sta zD                        
        jsr G_00C3                    ; $08E6 call a16
        lda zCY                       ; $08E9 jr nc,pc+r8
        lsr a                         
        bcs _s8                       
        jmp G_08F1                    
_s8
        lda zL                        ; $08EB ld a,l
        sta zA                        
        clc                           ; $08EC add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $08ED ld l,a
        sta zL                        
        lda zCY                       ; $08EE jr nc,pc+r8
        lsr a                         
        bcs _s9                       
        jmp G_08F1                    
_s9
        inc zH                        ; $08F0 inc h
        lda zH                        
        sta zZ                        
G_08F1
        lda zH                        ; $08F1 push hl
        pha                           
        lda zL                        
        pha                           
        pla                           ; $08F2 pop de
        sta zE                        
        pla                           
        sta zD                        
        pla                           ; $08F3 pop hl
        sta zL                        
        pla                           
        sta zH                        
        lda zE                        ; $08F4 ld a,e
        sta zA                        
                                      ; $08F5 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s10                      
        inc zH                        
_s10
        lda zD                        ; $08F6 ld [hl],d
        sta (zL),y                    
        rts                           ; $08F7 ret
G_08F8
        lda zH                        ; $08F8 push hl
        pha                           
        lda zL                        
        pha                           
        lda (zL),y                    ; $08F9 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s11                      
        inc zH                        
_s11
        lda (zL),y                    ; $08FA ld h,[hl]
        sta zH                        
        lda zA                        ; $08FB ld l,a
        sta zL                        
        lda zC                        ; $08FC bit 6,c
        and #$40                      
        sta zZ                        
                                      ; $08FE jr z,pc+r8
        bne _s12                      
        jmp G_0924                    
_s12
        lda $FF96                     ; $0900 ldh a,[a8]
        sta zA                        
                                      ; $0902 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $0904 jr z,pc+r8
        bne _s13                      
        jmp G_0914                    
_s13
        lda #<$08FF                   ; $0906 ld de,d16
        sta zE                        
        lda #>$08FF                   
        sta zD                        
        jsr G_00C3                    ; $0909 call a16
        lda zCY                       ; $090C jr c,pc+r8
        lsr a                         
        bcc _s14                      
        jmp G_094A                    
_s14
        lda zB                        ; $090E ld a,b
        sta zA                        
        sec                           ; $090F sub d8
        lda zA                        
        sbc #$14                      
        sta zA                        
                                      ; $0911 ld b,a
        sta zB                        
        jmp G_091C                    ; $0912 jr pc+r8
G_0914
        lda #<$8500                   ; $0914 ld de,d16
        sta zE                        
        lda #>$8500                   
        sta zD                        
        jsr G_00C3                    ; $0917 call a16
        lda zCY                       ; $091A jr c,pc+r8
        lsr a                         
        bcc _s15                      
        jmp G_094A                    
_s15
G_091C
        lda zL                        ; $091C ld a,l
        sta zA                        
        sec                           ; $091D sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $091E ld l,a
        sta zL                        
        lda zCY                       ; $091F jr nc,pc+r8
        lsr a                         
        bcs _s16                      
        jmp G_094A                    
_s16
        dec zH                        ; $0921 dec h
        lda zH                        
        sta zZ                        
        jmp G_094A                    ; $0922 jr pc+r8
G_0924
        lda zC                        ; $0924 bit 7,c
        and #$80                      
        sta zZ                        
                                      ; $0926 jr z,pc+r8
        bne _s17                      
        jmp G_094A                    
_s17
        lda $FF96                     ; $0928 ldh a,[a8]
        sta zA                        
                                      ; $092A bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $092C jr nz,pc+r8
        beq _s18                      
        jmp G_093C                    
_s18
        lda #<$E701                   ; $092E ld de,d16
        sta zE                        
        lda #>$E701                   
        sta zD                        
        jsr G_00C3                    ; $0931 call a16
        lda zCY                       ; $0934 jr nc,pc+r8
        lsr a                         
        bcs _s19                      
        jmp G_094A                    
_s19
        lda zB                        ; $0936 ld a,b
        sta zA                        
        sec                           ; $0937 sub d8
        lda zA                        
        sbc #$14                      
        sta zA                        
                                      ; $0939 ld b,a
        sta zB                        
        jmp G_0944                    ; $093A jr pc+r8
G_093C
        lda #<$6B00                   ; $093C ld de,d16
        sta zE                        
        lda #>$6B00                   
        sta zD                        
        jsr G_00C3                    ; $093F call a16
        lda zCY                       ; $0942 jr nc,pc+r8
        lsr a                         
        bcs _s20                      
        jmp G_094A                    
_s20
G_0944
        lda zL                        ; $0944 ld a,l
        sta zA                        
        clc                           ; $0945 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0946 ld l,a
        sta zL                        
        lda zCY                       ; $0947 jr nc,pc+r8
        lsr a                         
        bcs _s21                      
        jmp G_094A                    
_s21
        inc zH                        ; $0949 inc h
        lda zH                        
        sta zZ                        
G_094A
        lda zH                        ; $094A push hl
        pha                           
        lda zL                        
        pha                           
        pla                           ; $094B pop de
        sta zE                        
        pla                           
        sta zD                        
        pla                           ; $094C pop hl
        sta zL                        
        pla                           
        sta zH                        
        lda zE                        ; $094D ld a,e
        sta zA                        
                                      ; $094E ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s22                      
        inc zH                        
_s22
        lda zD                        ; $094F ld [hl],d
        sta (zL),y                    
        rts                           ; $0950 ret
G_09FA
        lda (zL),y                    ; $09FA ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s23                      
        inc zH                        
_s23
        lda (zL),y                    ; $09FB ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s24                      
        inc zH                        
_s24
        lda zA                        ; $09FC ld d,a
        sta zD                        
        lda (zL),y                    ; $09FD ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s25                      
        inc zH                        
_s25
        lda (zL),y                    ; $09FE ld a,[hl]
        sta zA                        
                                      ; $09FF ld e,a
        sta zE                        
        lda #$00                      ; $0A00 ld c,d8
        sta zC                        
        lda zD                        ; $0A02 ld a,d
        sta zA                        
        sec                           ; $0A03 cp d8
        lda zA                        
        sbc #$78                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0A05 jr c,pc+r8
        lsr a                         
        bcc _s26                      
        jmp G_0A12                    
_s26
        lda zC                        ; $0A07 set 1,c
        ora #$02                      
        sta zC                        
        lda zA                        ; $0A09 cpl
        eor #$FF                      
        sta zA                        
        clc                           ; $0A0A add d8
        lda zA                        
        adc #$F0                      
        sta zA                        
                                      ; $0A0C ld d,a
        sta zD                        
        lda zE                        ; $0A0D ld a,e
        sta zA                        
                                      ; $0A0E cpl
        eor #$FF                      
        sta zA                        
        clc                           ; $0A0F add d8
        lda zA                        
        adc #$D8                      
        sta zA                        
                                      ; $0A11 ld e,a
        sta zE                        
G_0A12
        lda zE                        ; $0A12 ld a,e
        sta zA                        
        sec                           ; $0A13 cp d8
        lda zA                        
        sbc #$6C                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0A15 jr c,pc+r8
        lsr a                         
        bcc _s27                      
        jmp G_0A1C                    
_s27
        lda zC                        ; $0A17 set 0,c
        ora #$01                      
        sta zC                        
        lda zA                        ; $0A19 cpl
        eor #$FF                      
        sta zA                        
        clc                           ; $0A1A add d8
        lda zA                        
        adc #$D8                      
        sta zA                        
G_0A1C
        sec                           ; $0A1C cp d8
        lda zA                        
        sbc #$36                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0A1E ret c
        lsr a                         
        bcc _s28                      
        rts                           
_s28
        lda zD                        ; $0A1F ld a,d
        sta zA                        
        sec                           ; $0A20 cp d8
        lda zA                        
        sbc #$37                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0A22 jr c,pc+r8
        lsr a                         
        bcc _s29                      
        jmp G_0A29                    
_s29
        lda zC                        ; $0A24 set 3,c
        ora #$08                      
        sta zC                        
        sec                           ; $0A26 cp d8
        lda zA                        
        sbc #$55                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0A28 ret c
        lsr a                         
        bcc _s30                      
        rts                           
_s30
G_0A29
        lda zC                        ; $0A29 set 2,c
        ora #$04                      
        sta zC                        
        rts                           ; $0A2B ret
G_0A2C
        lda #$00                      ; $0A2C ld c,d8
        sta zC                        
        sec                           ; $0A2E cp d8
        lda zA                        
        sbc #$08                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0A30 ret z
        bne _s31                      
        rts                           
_s31
        inc zC                        ; $0A31 inc c
        lda zC                        
        sec                           ; $0A32 cp d8
        lda zA                        
        sbc #$0B                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0A34 ret z
        bne _s32                      
        rts                           
_s32
        inc zC                        ; $0A35 inc c
        lda zC                        
        sec                           ; $0A36 cp d8
        lda zA                        
        sbc #$0E                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0A38 ret z
        bne _s33                      
        rts                           
_s33
        inc zC                        ; $0A39 inc c
        lda zC                        
        sec                           ; $0A3A cp d8
        lda zA                        
        sbc #$10                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0A3C ret z
        bne _s34                      
        rts                           
_s34
        inc zC                        ; $0A3D inc c
        lda zC                        
        sec                           ; $0A3E cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        rts                           ; $0A40 ret
G_0A9D
        lda #<$C080                   ; $0A9D ld hl,d16
        sta zL                        
        lda #>$C080                   
        sta zH                        
        lda #$40                      ; $0AA0 ld b,d8
        sta zB                        
        lda zA                        ; $0AA2 xor a
        eor zA                        
        sta zA                        
G_0AA3
        lda zA                        ; $0AA3 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s35                      
        inc zH                        
_s35
        dec zB                        ; $0AA4 dec b
        lda zB                        
        sta zZ                        
                                      ; $0AA5 jr nz,pc+r8
        beq _s36                      
        jmp G_0AA3                    
_s36
        lda $C0DF                     ; $0AA7 ld a,[a16]
        sta zA                        
        dec zA                        ; $0AAA dec a
        lda zA                        
        lda zA                        ; $0AAB ldh [a8],a
        sta $FFC5                     
        jsr G_RST18                   ; $0AAD rst vec
        .byte $04, $A0, $B0, $D0, $FF
        lda zA                        ; $0AB3 ld [a16],a
        sta $C088                     
        lda zA                        ; $0AB6 ld [a16],a
        sta $C0A8                     
        lda $FFC5                     ; $0AB9 ldh a,[a8]
        sta zA                        
        jsr G_RST18                   ; $0ABB rst vec
        .byte $04, $90, $A0, $C0, $FF
        lda zA                        ; $0AC1 ld [a16],a
        sta $C089                     
        lda zA                        ; $0AC4 ld [a16],a
        sta $C0A9                     
        lda $FFC5                     ; $0AC7 ldh a,[a8]
        sta zA                        
        lda #<D_0B35                  ; $0AC9 ld hl,d16
        sta zL                        
        lda #>D_0B35                  
        sta zH                        
        jsr G_3047                    ; $0ACC call a16
        lda #<$C090                   ; $0ACF ld de,d16
        sta zE                        
        lda #>$C090                   
        sta zD                        
        lda #$10                      ; $0AD2 ld b,d8
        sta zB                        
G_0AD4
        lda (zL),y                    ; $0AD4 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s37                      
        inc zH                        
_s37
        lda zA                        ; $0AD5 ld [de],a
        sta (zE),y                    
        inc zE                        ; $0AD6 inc e
        lda zE                        
        dec zB                        ; $0AD7 dec b
        lda zB                        
        sta zZ                        
                                      ; $0AD8 jr nz,pc+r8
        beq _s38                      
        jmp G_0AD4                    
_s38
        lda $FFC5                     ; $0ADA ldh a,[a8]
        sta zA                        
        lda #<D_0B35                  ; $0ADC ld hl,d16
        sta zL                        
        lda #>D_0B35                  
        sta zH                        
        jsr G_3047                    ; $0ADF call a16
        lda #<$C0B0                   ; $0AE2 ld de,d16
        sta zE                        
        lda #>$C0B0                   
        sta zD                        
        lda #$10                      ; $0AE5 ld b,d8
        sta zB                        
G_0AE7
        lda (zL),y                    ; $0AE7 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s39                      
        inc zH                        
_s39
        lda zA                        ; $0AE8 ld [de],a
        sta (zE),y                    
        inc zE                        ; $0AE9 inc e
        lda zE                        
        dec zB                        ; $0AEA dec b
        lda zB                        
        sta zZ                        
                                      ; $0AEB jr nz,pc+r8
        beq _s40                      
        jmp G_0AE7                    
_s40
        lda $C090                     ; $0AED ld a,[a16]
        sta zA                        
                                      ; $0AF0 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $0AF1 inc a
        lda zA                        
        sec                           ; $0AF2 sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $0AF4 ld [a16],a
        sta $C090                     
        lda $FF96                     ; $0AF7 ldh a,[a8]
        sta zA                        
                                      ; $0AF9 bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $0AFB jr nz,pc+r8
        beq _s41                      
        jmp G_0B25                    
_s41
        lda $FFAF                     ; $0AFD ldh a,[a8]
        sta zA                        
                                      ; $0AFF bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $0B01 jr nz,pc+r8
        beq _s42                      
        jmp G_0B25                    
_s42
        lda #<$C092                   ; $0B03 ld hl,d16
        sta zL                        
        lda #>$C092                   
        sta zH                        
        jsr G_0B26                    ; $0B06 call a16
        lda #<$C096                   ; $0B09 ld hl,d16
        sta zL                        
        lda #>$C096                   
        sta zH                        
        jsr G_0B26                    ; $0B0C call a16
        lda $FFC5                     ; $0B0F ldh a,[a8]
        sta zA                        
        jsr G_RST18                   ; $0B11 rst vec
        .byte $04, $C0, $C8, $D0, $F0
        lda zA                        ; $0B17 ld [a16],a
        sta $C088                     
        lda $FFC5                     ; $0B1A ldh a,[a8]
        sta zA                        
        jsr G_RST18                   ; $0B1C rst vec
        .byte $04, $A0, $A0, $B0, $C0
        lda zA                        ; $0B22 ld [a16],a
        sta $C089                     
G_0B25
        rts                           ; $0B25 ret
G_0B26
        lda $C0DF                     ; $0B26 ld a,[a16]
        sta zA                        
        sec                           ; $0B29 cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0B2B ret z
        bne _s43                      
        rts                           
_s43
        lda (zL),y                    ; $0B2C ld a,[hl]
        sta zA                        
                                      ; $0B2D ld b,a
        sta zB                        
                                      ; $0B2E srl b
        lsr a                         
        sta zB                        
                                      ; $0B30 srl b
        lsr a                         
        sta zB                        
        sec                           ; $0B32 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $0B33 ld [hl],a
        sta (zL),y                    
        rts                           ; $0B34 ret
G_0B7D
        lda #<$FF96                   ; $0B7D ld hl,d16
        sta zL                        
        lda #>$FF96                   
        sta zH                        
        lda (zL),y                    ; $0B80 res 7,[hl]
        and #$7F                      
        sta (zL),y                    
        lda #<$C002                   ; $0B82 ld hl,d16
        sta zL                        
        lda #>$C002                   
        sta zH                        
        jsr G_09FA                    ; $0B85 call a16
        lda zC                        ; $0B88 ld a,c
        sta zA                        
                                      ; $0B89 ld [a16],a
        sta $C00B                     
        lda $C000                     ; $0B8C ld a,[a16]
        sta zA                        
        jsr G_RST08                   ; $0B8F rst vec
        .word G_0BA0, G_0BD9, G_0BE2, G_0C4C, G_0C9A, G_0CB7, G_0D3D, G_0D76
G_0BA0
        jsr G_0DA5                    ; $0BA0 call a16
        jsr G_0BCD                    ; $0BA3 call a16
        lda #$01                      ; $0BA6 ld a,d8
        sta zA                        
                                      ; $0BA8 ld [a16],a
        sta $C000                     
        rts                           ; $0BAB ret
G_0BAC
        lda $FF91                     ; $0BAC ldh a,[a8]
        sta zA                        
                                      ; $0BAE bit 1,a
        and #$02                      
        sta zZ                        
        lda #$58                      ; $0BB0 ld a,d8
        sta zA                        
        lda zZ                        ; $0BB2 jr nz,pc+r8
        beq _s44                      
        jmp G_0BB6                    
_s44
        lda #$7F                      ; $0BB4 ld a,d8
        sta zA                        
G_0BB6
        lda zA                        ; $0BB6 ld [a16],a
        sta $C005                     
        lda #$7F                      ; $0BB9 ld a,d8
        sta zA                        
        lda zZ                        ; $0BBB jr nz,pc+r8
        beq _s45                      
        jmp G_0BBF                    
_s45
        lda #$80                      ; $0BBD ld a,d8
        sta zA                        
G_0BBF
        lda zA                        ; $0BBF ld [a16],a
        sta $C004                     
        lda #$B9                      ; $0BC2 ld a,d8
        sta zA                        
                                      ; $0BC4 ld [a16],a
        sta $C003                     
        lda #$80                      ; $0BC7 ld a,d8
        sta zA                        
                                      ; $0BC9 ld [a16],a
        sta $C002                     
        rts                           ; $0BCC ret
G_0BCD
        lda $FF91                     ; $0BCD ldh a,[a8]
        sta zA                        
                                      ; $0BCF bit 1,a
        and #$02                      
        sta zZ                        
        lda #$45                      ; $0BD1 ld a,d8
        sta zA                        
        lda zZ                        ; $0BD3 jr nz,pc+r8
        beq _s46                      
        jmp G_0BD7                    
_s46
        lda #$92                      ; $0BD5 ld a,d8
        sta zA                        
G_0BD7
        jmp G_0BB6                    ; $0BD7 jr pc+r8
G_0BD9
        jsr G_0DB8                    ; $0BD9 call a16
        jsr G_0DFE                    ; $0BDC call a16
        jmp G_10A9                    ; $0BDF jp a16
G_0BE2
        lda $C00A                     ; $0BE2 ld a,[a16]
        sta zA                        
        sec                           ; $0BE5 cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
                                      ; $0BE7 jr z,pc+r8
        bne _s47                      
        jmp G_0BF7                    
_s47
        sec                           ; $0BE9 cp d8
        lda zA                        
        sbc #$09                      
        sta zZ                        
                                      ; $0BEB jr z,pc+r8
        bne _s48                      
        jmp G_0BF7                    
_s48
        lda $C011                     ; $0BED ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0BF0 rst vec
        .byte $03, $04, $08, $06
        jmp G_0BFF                    ; $0BF5 jr pc+r8
G_0BF7
        lda $C011                     ; $0BF7 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0BFA rst vec
        .byte $03, $0A, $0C, $01
G_0BFF
        lda zA                        ; $0BFF ld b,a
        sta zB                        
        lda $C010                     ; $0C00 ld a,[a16]
        sta zA                        
        inc zA                        ; $0C03 inc a
        lda zA                        
        lda zA                        ; $0C04 ld [a16],a
        sta $C010                     
        sec                           ; $0C07 cp b
        lda zA                        
        sbc zB                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0C08 jr c,pc+r8
        lsr a                         
        bcc _s49                      
        jmp G_0C19                    
_s49
        lda zA                        ; $0C0A xor a
        eor zA                        
        sta zA                        
                                      ; $0C0B ld [a16],a
        sta $C010                     
        lda $C011                     ; $0C0E ld a,[a16]
        sta zA                        
        inc zA                        ; $0C11 inc a
        lda zA                        
        sec                           ; $0C12 cp d8
        lda zA                        
        sbc #$03                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0C14 jr nc,pc+r8
        lsr a                         
        bcs _s50                      
        jmp G_0C3E                    
_s50
        lda zA                        ; $0C16 ld [a16],a
        sta $C011                     
G_0C19
        lda $C00A                     ; $0C19 ld a,[a16]
        sta zA                        
                                      ; $0C1C ld b,a
        sta zB                        
        lda $C011                     ; $0C1D ld a,[a16]
        sta zA                        
        clc                           ; $0C20 add b
        lda zA                        
        adc zB                        
        sta zA                        
        jsr G_RST18                   ; $0C21 rst vec
        .byte $12, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0E, $0F, $10, $10, $04, $05, $06, $04, $05, $06
        lda zA                        ; $0C35 ld [a16],a
        sta $C001                     
        jsr G_0E77                    ; $0C38 call a16
        jmp G_10A9                    ; $0C3B jp a16
G_0C3E
        lda zA                        ; $0C3E xor a
        eor zA                        
        sta zA                        
        sty zCY                       
        lda zA                        ; $0C3F ld [a16],a
        sta $C010                     
        lda zA                        ; $0C42 ld [a16],a
        sta $C011                     
        inc zA                        ; $0C45 inc a
        lda zA                        
        lda zA                        ; $0C46 ld [a16],a
        sta $C000                     
        jmp G_10A9                    ; $0C49 jp a16
G_0C4C
        lda #$03                      ; $0C4C ld a,d8
        sta zA                        
                                      ; $0C4E ld [a16],a
        sta $C001                     
        lda $C017                     ; $0C51 ld a,[a16]
        sta zA                        
                                      ; $0C54 and a
        and zA                        
        sta zA                        
        sta zZ                        
                                      ; $0C55 jr nz,pc+r8
        beq _s51                      
        jmp G_0C62                    
_s51
        lda #$01                      ; $0C57 ld a,d8
        sta zA                        
                                      ; $0C59 ld [a16],a
        sta $C040                     
        lda #$0E                      ; $0C5C ld a,d8
        sta zA                        
                                      ; $0C5E ld [a16],a
        sta $C047                     
        lda zA                        ; $0C61 xor a
        eor zA                        
        sta zA                        
G_0C62
        inc zA                        ; $0C62 inc a
        lda zA                        
        lda zA                        ; $0C63 ld [a16],a
        sta $C017                     
        sec                           ; $0C66 cp d8
        lda zA                        
        sbc #$10                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0C68 jr c,pc+r8
        lsr a                         
        bcc _s52                      
        jmp G_0C80                    
_s52
        sec                           ; $0C6A sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
        sec                           ; $0C6C cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0C6E jr c,pc+r8
        lsr a                         
        bcc _s53                      
        jmp G_0C99                    
_s53
        sec                           ; $0C70 sub d8
        lda zA                        
        sbc #$04                      
        sta zA                        
        sec                           ; $0C72 cp d8
        lda zA                        
        sbc #$10                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0C74 jr c,pc+r8
        lsr a                         
        bcc _s54                      
        jmp G_0C80                    
_s54
        lda zA                        ; $0C76 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0C77 ld [a16],a
        sta $C017                     
        lda #$05                      ; $0C7A ld a,d8
        sta zA                        
                                      ; $0C7C ld [a16],a
        sta $C000                     
        rts                           ; $0C7F ret
G_0C80
        sec                           ; $0C80 sub d8
        lda zA                        
        sbc #$08                      
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda $C047                     ; $0C82 ld a,[a16]
        sta zA                        
        lda zCY                       ; $0C85 jr c,pc+r8
        lsr a                         
        bcc _s55                      
        jmp G_0C8B                    
_s55
        inc zA                        ; $0C87 inc a
        lda zA                        
        inc zA                        ; $0C88 inc a
        lda zA                        
        jmp G_0C8D                    ; $0C89 jr pc+r8
G_0C8B
        dec zA                        ; $0C8B dec a
        lda zA                        
        dec zA                        ; $0C8C dec a
        lda zA                        
G_0C8D
        lda zA                        ; $0C8D ld [a16],a
        sta $C047                     
        sec                           ; $0C90 cp d8
        lda zA                        
        sbc #$0E                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0C92 jr nc,pc+r8
        lsr a                         
        bcs _s56                      
        jmp G_0C99                    
_s56
        lda #$13                      ; $0C94 ld a,d8
        sta zA                        
                                      ; $0C96 ld [a16],a
        sta $C001                     
G_0C99
        rts                           ; $0C99 ret
G_0C9A
        jsr G_0DA5                    ; $0C9A call a16
        lda zA                        ; $0C9D xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0C9E ldh [a8],a
        sta $FFAD                     
        lda zA                        ; $0CA0 ld [a16],a
        sta $C017                     
        jsr G_0BAC                    ; $0CA3 call a16
        jsr S_RET                     ; $0CA6 call a16
        lda $FFBB                     ; $0CA9 ldh a,[a8]
        sta zA                        
                                      ; $0CAB ldh [a8],a
        sta $FFA8                     
        lda #$30                      ; $0CAD ld a,d8
        sta zA                        
                                      ; $0CAF ldh [a8],a
        sta $FFAA                     
        lda #$05                      ; $0CB1 ld a,d8
        sta zA                        
                                      ; $0CB3 ld [a16],a
        sta $C000                     
        rts                           ; $0CB6 ret
G_0CB7
        lda #$03                      ; $0CB7 ld a,d8
        sta zA                        
                                      ; $0CB9 ld [a16],a
        sta $C001                     
        lda $FF9A                     ; $0CBC ldh a,[a8]
        sta zA                        
                                      ; $0CBE and a
        and zA                        
        sta zA                        
        sta zZ                        
                                      ; $0CBF jr nz,pc+r8
        beq _s57                      
        jmp G_0CD6                    
_s57
        lda $C017                     ; $0CC1 ld a,[a16]
        sta zA                        
        inc zA                        ; $0CC4 inc a
        lda zA                        
        lda zA                        ; $0CC5 ld [a16],a
        sta $C017                     
        sec                           ; $0CC8 cp d8
        lda zA                        
        sbc #$B4                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0CCA jr c,pc+r8
        lsr a                         
        bcc _s58                      
        jmp G_0D13                    
_s58
        lda zA                        ; $0CCC xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0CCD ld [a16],a
        sta $C017                     
        lda #$03                      ; $0CD0 ld a,d8
        sta zA                        
                                      ; $0CD2 ld [a16],a
        sta $C000                     
        rts                           ; $0CD5 ret
G_0CD6
        lda zA                        ; $0CD6 xor a
        eor zA                        
        sta zA                        
        sty zCY                       
        lda zA                        ; $0CD7 ld [a16],a
        sta $C017                     
        lda $FF9A                     ; $0CDA ldh a,[a8]
        sta zA                        
                                      ; $0CDC ld c,a
        sta zC                        
        lda $FF91                     ; $0CDD ldh a,[a8]
        sta zA                        
                                      ; $0CDF bit 1,a
        and #$02                      
        sta zZ                        
        lda #<$3F80                   ; $0CE1 ld de,d16
        sta zE                        
        lda #>$3F80                   
        sta zD                        
        lda zZ                        ; $0CE4 jr nz,pc+r8
        beq _s59                      
        jmp G_0CE9                    
_s59
        lda #<$7380                   ; $0CE6 ld de,d16
        sta zE                        
        lda #>$7380                   
        sta zD                        
G_0CE9
        lda #<$C004                   ; $0CE9 ld hl,d16
        sta zL                        
        lda #>$C004                   
        sta zH                        
        lda (zL),y                    ; $0CEC ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s60                      
        inc zH                        
_s60
        lda (zL),y                    ; $0CED ld h,[hl]
        sta zH                        
        lda zA                        ; $0CEE ld l,a
        sta zL                        
        jsr G_00C3                    ; $0CEF call a16
        lda zCY                       ; $0CF2 jr nc,pc+r8
        lsr a                         
        bcs _s61                      
        jmp G_0CF6                    
_s61
        lda zC                        ; $0CF4 res 5,c
        and #$DF                      
        sta zC                        
G_0CF6
        lda $FF91                     ; $0CF6 ldh a,[a8]
        sta zA                        
                                      ; $0CF8 bit 1,a
        and #$02                      
        sta zZ                        
        lda #<$6480                   ; $0CFA ld de,d16
        sta zE                        
        lda #>$6480                   
        sta zD                        
        lda zZ                        ; $0CFD jr nz,pc+r8
        beq _s62                      
        jmp G_0D02                    
_s62
        lda #<$9880                   ; $0CFF ld de,d16
        sta zE                        
        lda #>$9880                   
        sta zD                        
G_0D02
        jsr G_00C3                    ; $0D02 call a16
        lda zCY                       ; $0D05 jr c,pc+r8
        lsr a                         
        bcc _s63                      
        jmp G_0D09                    
_s63
        lda zC                        ; $0D07 res 4,c
        and #$EF                      
        sta zC                        
G_0D09
        lda $C008                     ; $0D09 ld a,[a16]
        sta zA                        
                                      ; $0D0C ld b,a
        sta zB                        
        lda #<$C004                   ; $0D0D ld hl,d16
        sta zL                        
        lda #>$C004                   
        sta zH                        
        jsr G_08C7                    ; $0D10 call a16
G_0D13
        lda $C002                     ; $0D13 ld a,[a16]
        sta zA                        
                                      ; $0D16 ld [a16],a
        sta $C042                     
        lda $C003                     ; $0D19 ld a,[a16]
        sta zA                        
                                      ; $0D1C ld [a16],a
        sta $C043                     
        lda $C004                     ; $0D1F ld a,[a16]
        sta zA                        
                                      ; $0D22 ld [a16],a
        sta $C044                     
        lda $C005                     ; $0D25 ld a,[a16]
        sta zA                        
        clc                           ; $0D28 add d8
        lda zA                        
        adc #$06                      
        sta zA                        
        jsr G_16F9                    ; $0D2A call a16
        lda $FF9B                     ; $0D2D ldh a,[a8]
        sta zA                        
                                      ; $0D2F and d8
        and #$03                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $0D31 ret z
        bne _s64                      
        rts                           
_s64
        lda #$02                      ; $0D32 ld a,d8
        sta zA                        
                                      ; $0D34 ld [a16],a
        sta $C040                     
        lda #$06                      ; $0D37 ld a,d8
        sta zA                        
                                      ; $0D39 ld [a16],a
        sta $C000                     
        rts                           ; $0D3C ret
G_0D3D
        lda #$04                      ; $0D3D ld a,d8
        sta zA                        
                                      ; $0D3F ld [a16],a
        sta $C001                     
        lda $FF9B                     ; $0D42 ldh a,[a8]
        sta zA                        
                                      ; $0D44 and d8
        and #$03                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $0D46 jr z,pc+r8
        bne _s65                      
        jmp G_0D5E                    
_s65
        lda zA                        ; $0D48 ld [a16],a
        sta $C013                     
        lda #$05                      ; $0D4B ld a,d8
        sta zA                        
        jsr S_SOUND                   ; $0D4D call a16
        lda zA                        ; $0D50 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0D51 ld [a16],a
        sta $C010                     
        lda zA                        ; $0D54 ld [a16],a
        sta $C011                     
        lda #$07                      ; $0D57 ld a,d8
        sta zA                        
                                      ; $0D59 ld [a16],a
        sta $C000                     
        jmp G_0D75                    ; $0D5C jr pc+r8
G_0D5E
        lda $C052                     ; $0D5E ld a,[a16]
        sta zA                        
                                      ; $0D61 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $0D63 jr z,pc+r8
        bne _s66                      
        jmp G_0D75                    
_s66
        lda $C047                     ; $0D65 ld a,[a16]
        sta zA                        
        sec                           ; $0D68 cp d8
        lda zA                        
        sbc #$30                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0D6A jr nc,pc+r8
        lsr a                         
        bcs _s67                      
        jmp G_0D75                    
_s67
        lda zA                        ; $0D6C xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0D6D ld [a16],a
        sta $C017                     
        lda #$05                      ; $0D70 ld a,d8
        sta zA                        
                                      ; $0D72 ld [a16],a
        sta $C000                     
G_0D75
        rts                           ; $0D75 ret
G_0D76
        lda $C011                     ; $0D76 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0D79 rst vec
        .byte $02, $08, $0A
        lda zA                        ; $0D7D ld b,a
        sta zB                        
        lda $C010                     ; $0D7E ld a,[a16]
        sta zA                        
        inc zA                        ; $0D81 inc a
        lda zA                        
        lda zA                        ; $0D82 ld [a16],a
        sta $C010                     
        sec                           ; $0D85 cp b
        lda zA                        
        sbc zB                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0D86 jr c,pc+r8
        lsr a                         
        bcc _s68                      
        jmp G_0D98                    
_s68
        lda zA                        ; $0D88 xor a
        eor zA                        
        sta zA                        
                                      ; $0D89 ld [a16],a
        sta $C010                     
        lda $C011                     ; $0D8C ld a,[a16]
        sta zA                        
        inc zA                        ; $0D8F inc a
        lda zA                        
        sec                           ; $0D90 cp d8
        lda zA                        
        sbc #$02                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0D92 jp nc,a16
        lsr a                         
        bcs _s69                      
        jmp G_0C3E                    
_s69
        lda zA                        ; $0D95 ld [a16],a
        sta $C011                     
G_0D98
        lda $C011                     ; $0D98 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0D9B rst vec
        .byte $02, $05, $06
        lda zA                        ; $0D9F ld [a16],a
        sta $C001                     
        jmp G_0E77                    ; $0DA2 jp a16
G_0DA5
        lda $C088                     ; $0DA5 ld a,[a16]
        sta zA                        
                                      ; $0DA8 ld [a16],a
        sta $C008                     
        lda $C089                     ; $0DAB ld a,[a16]
        sta zA                        
                                      ; $0DAE ld [a16],a
        sta $C009                     
        lda $C096                     ; $0DB1 ld a,[a16]
        sta zA                        
                                      ; $0DB4 ld [a16],a
        sta $C016                     
        rts                           ; $0DB7 ret
G_0DB8
        lda $C008                     ; $0DB8 ld a,[a16]
        sta zA                        
                                      ; $0DBB ld b,a
        sta zB                        
        lda $FF9A                     ; $0DBC ldh a,[a8]
        sta zA                        
                                      ; $0DBE ld c,a
        sta zC                        
        lda #<$C004                   ; $0DBF ld hl,d16
        sta zL                        
        lda #>$C004                   
        sta zH                        
        jsr G_08C7                    ; $0DC2 call a16
        lda $C009                     ; $0DC5 ld a,[a16]
        sta zA                        
                                      ; $0DC8 ld b,a
        sta zB                        
        lda #<$C002                   ; $0DC9 ld hl,d16
        sta zL                        
        lda #>$C002                   
        sta zH                        
        jsr G_08F8                    ; $0DCC call a16
        lda $C011                     ; $0DCF ld a,[a16]
        sta zA                        
                                      ; $0DD2 and d8
        and #$04                      
        sta zA                        
                                      ; $0DD4 srl a
        lsr a                         
        sta zA                        
                                      ; $0DD6 srl a
        lsr a                         
        sta zA                        
                                      ; $0DD8 ld d,a
        sta zD                        
        lda zC                        ; $0DD9 ld a,c
        sta zA                        
                                      ; $0DDA and d8
        and #$F0                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $0DDC jr z,pc+r8
        bne _s70                      
        jmp G_0DFA                    
_s70
        lda zA                        ; $0DDE bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $0DE0 jr z,pc+r8
        bne _s71                      
        jmp G_0DE4                    
_s71
        inc zD                        ; $0DE2 inc d
        lda zD                        
        inc zD                        ; $0DE3 inc d
        lda zD                        
G_0DE4
        lda $C010                     ; $0DE4 ld a,[a16]
        sta zA                        
        clc                           ; $0DE7 add b
        lda zA                        
        adc zB                        
        sta zA                        
        rol zCY                       
        lda zA                        ; $0DE8 ld [a16],a
        sta $C010                     
        lda $C011                     ; $0DEB ld a,[a16]
        sta zA                        
        lda zCY                       ; $0DEE adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        lda zA                        ; $0DF0 ld [a16],a
        sta $C011                     
        lda zD                        ; $0DF3 ld a,d
        sta zA                        
        jsr G_RST18                   ; $0DF4 rst vec
        .byte $04, $01, $02, $11, $12
G_0DFA
        lda zA                        ; $0DFA ld [a16],a
        sta $C001                     
        rts                           ; $0DFD ret
G_0DFE
        lda $FF9B                     ; $0DFE ldh a,[a8]
        sta zA                        
                                      ; $0E00 and d8
        and #$03                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $0E02 ret z
        bne _s72                      
        rts                           
_s72
        lda zA                        ; $0E03 ld [a16],a
        sta $C013                     
        lda #$05                      ; $0E06 ld a,d8
        sta zA                        
        jsr S_SOUND                   ; $0E08 call a16
        jsr G_0890                    ; $0E0B call a16
        jsr G_1722                    ; $0E0E call a16
        lda $C004                     ; $0E11 ld a,[a16]
        sta zA                        
                                      ; $0E14 ld e,a
        sta zE                        
        lda $C005                     ; $0E15 ld a,[a16]
        sta zA                        
                                      ; $0E18 ld d,a
        sta zD                        
        jsr G_00C3                    ; $0E19 call a16
        lda #$00                      ; $0E1C ld a,d8
        sta zA                        
        lda zCY                       ; $0E1E jr nc,pc+r8
        lsr a                         
        bcs _s73                      
        jmp G_0E22                    
_s73
        lda #$03                      ; $0E20 ld a,d8
        sta zA                        
G_0E22
        lda zA                        ; $0E22 ld [a16],a
        sta $C00A                     
        lda #<$0400                   ; $0E25 ld hl,d16
        sta zL                        
        lda #>$0400                   
        sta zH                        
        clc                           ; $0E28 add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
                                      ; $0E29 ld a,h
        sta zA                        
        sec                           ; $0E2A cp d8
        lda zA                        
        sbc #$08                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0E2C jr nc,pc+r8
        lsr a                         
        bcs _s74                      
        jmp G_0E46                    
_s74
        lda $FF9A                     ; $0E2E ldh a,[a8]
        sta zA                        
                                      ; $0E30 bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $0E32 jr z,pc+r8
        bne _s75                      
        jmp G_0E38                    
_s75
        lda #$00                      ; $0E34 ld a,d8
        sta zA                        
        jmp G_0E3E                    ; $0E36 jr pc+r8
G_0E38
        lda zA                        ; $0E38 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $0E3A jr z,pc+r8
        bne _s76                      
        jmp G_0E46                    
_s76
        lda #$03                      ; $0E3C ld a,d8
        sta zA                        
G_0E3E
        lda zA                        ; $0E3E ld [a16],a
        sta $C00A                     
        lda #$FF                      ; $0E41 ld a,d8
        sta zA                        
                                      ; $0E43 ld [a16],a
        sta $C019                     
G_0E46
        lda #$00                      ; $0E46 ld b,d8
        sta zB                        
        lda $C047                     ; $0E48 ld a,[a16]
        sta zA                        
        sec                           ; $0E4B cp d8
        lda zA                        
        sbc #$40                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0E4D jr c,pc+r8
        lsr a                         
        bcc _s77                      
        jmp G_0E59                    
_s77
        lda $C00A                     ; $0E4F ld a,[a16]
        sta zA                        
        clc                           ; $0E52 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
                                      ; $0E54 ld [a16],a
        sta $C00A                     
        jmp G_0E69                    ; $0E57 jr pc+r8
G_0E59
        lda $C00B                     ; $0E59 ld a,[a16]
        sta zA                        
        sec                           ; $0E5C cp d8
        lda zA                        
        sbc #$0C                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0E5E jr c,pc+r8
        lsr a                         
        bcc _s78                      
        jmp G_0E69                    
_s78
        lda $C00A                     ; $0E60 ld a,[a16]
        sta zA                        
        clc                           ; $0E63 add d8
        lda zA                        
        adc #$06                      
        sta zA                        
                                      ; $0E65 ld [a16],a
        sta $C00A                     
        inc zB                        ; $0E68 inc b
        lda zB                        
G_0E69
        lda zB                        ; $0E69 ld a,b
        sta zA                        
                                      ; $0E6A ld [a16],a
        sta $C011                     
        lda zA                        ; $0E6D xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0E6E ld [a16],a
        sta $C010                     
        lda #$02                      ; $0E71 ld a,d8
        sta zA                        
                                      ; $0E73 ld [a16],a
        sta $C000                     
        rts                           ; $0E76 ret
G_0E77
        lda $FFAD                     ; $0E77 ldh a,[a8]
        sta zA                        
                                      ; $0E79 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $0E7B ret nz
        beq _s79                      
        rts                           
_s79
        lda zA                        ; $0E7C bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $0E7E ret nz
        beq _s80                      
        rts                           
_s80
        lda zA                        ; $0E7F bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $0E81 ret nz
        beq _s81                      
        rts                           
_s81
        lda $C043                     ; $0E82 ld a,[a16]
        sta zA                        
        sec                           ; $0E85 cp d8
        lda zA                        
        sbc #$78                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0E87 ret c
        lsr a                         
        bcc _s82                      
        rts                           
_s82
        lda $C001                     ; $0E88 ld a,[a16]
        sta zA                        
        jsr G_0A2C                    ; $0E8B call a16
        lda zZ                        ; $0E8E ret nz
        beq _s83                      
        rts                           
_s83
        lda zC                        ; $0E8F ld a,c
        sta zA                        
                                      ; $0E90 ld [a16],a
        sta $C018                     
                                      ; $0E93 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0E96 rst vec
        .byte $05, $F6, $F6, $F4, $F4, $F4
        clc                           ; $0E9D add d8
        lda zA                        
        adc #$10                      
        sta zA                        
                                      ; $0E9F ldh [a8],a
        sta $FFC5                     
        lda $C018                     ; $0EA1 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0EA4 rst vec
        .byte $05, $06, $06, $02, $02, $04
        clc                           ; $0EAB add d8
        lda zA                        
        adc #$11                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0EAD ld b,a
        sta zB                        
        lda $FFC5                     ; $0EAE ldh a,[a8]
        sta zA                        
                                      ; $0EB0 ld c,a
        sta zC                        
        lda #<$C002                   ; $0EB1 ld hl,d16
        sta zL                        
        lda #>$C002                   
        sta zH                        
        jsr G_1C05                    ; $0EB4 call a16
        lda zCY                       ; $0EB7 ret nc
        lsr a                         
        bcs _s84                      
        rts                           
_s84
        sec                           ; $0EB8 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0EB9 ret c
        lsr a                         
        bcc _s85                      
        rts                           
_s85
        lda $C018                     ; $0EBA ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0EBD rst vec
        .byte $05, $FE, $FE, $FB, $FB, $FC
        lda zA                        ; $0EC4 ld b,a
        sta zB                        
        lda $FFC5                     ; $0EC5 ldh a,[a8]
        sta zA                        
        sec                           ; $0EC7 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
                                      ; $0EC8 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $0ECA jr z,pc+r8
        bne _s86                      
        jmp G_0ED0                    
_s86
        lda zA                        ; $0ECC cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $0ECD inc a
        lda zA                        
        lda zA                        ; $0ECE set 7,a
        ora #$80                      
        sta zA                        
G_0ED0
        lda zA                        ; $0ED0 ld b,a
        sta zB                        
        lda $C018                     ; $0ED1 ld a,[a16]
        sta zA                        
                                      ; $0ED4 bit 0,a
        and #$01                      
        sta zZ                        
        lda zB                        ; $0ED6 ld a,b
        sta zA                        
        lda zZ                        ; $0ED7 jr z,pc+r8
        bne _s87                      
        jmp G_0EDB                    
_s87
        lda zA                        ; $0ED9 xor d8
        eor #$80                      
        sta zA                        
G_0EDB
        lda zA                        ; $0EDB ld [a16],a
        sta $C014                     
        lda $C018                     ; $0EDE ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0EE1 rst vec
        .byte $05, $FC, $EE, $FC, $F2, $FE
        clc                           ; $0EE8 add d8
        lda zA                        
        adc #$1E                      
        sta zA                        
                                      ; $0EEA ldh [a8],a
        sta $FFC5                     
        lda $C018                     ; $0EEC ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0EEF rst vec
        .byte $05, $12, $04, $0E, $04, $0A
        clc                           ; $0EF6 add d8
        lda zA                        
        adc #$23                      
        sta zA                        
        rol zCY                       
        lda zA                        ; $0EF8 ld b,a
        sta zB                        
        lda $FFC5                     ; $0EF9 ldh a,[a8]
        sta zA                        
                                      ; $0EFB ld c,a
        sta zC                        
        lda #<$C004                   ; $0EFC ld hl,d16
        sta zL                        
        lda #>$C004                   
        sta zH                        
        jsr G_1BEF                    ; $0EFF call a16
        clc                           ; $0F02 add d8
        lda zA                        
        adc #$20                      
        sta zA                        
        sec                           ; $0F04 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0F05 ret nc
        lsr a                         
        bcs _s88                      
        rts                           
_s88
        sec                           ; $0F06 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0F07 ret c
        lsr a                         
        bcc _s89                      
        rts                           
_s89
        lda $C018                     ; $0F08 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0F0B rst vec
        .byte $05, $02, $02, $10, $10, $30
        lda zA                        ; $0F12 ldh [a8],a
        sta $FFC5                     
        lda $C018                     ; $0F14 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0F17 rst vec
        .byte $05, $30, $30, $40, $40, $50
        lda zA                        ; $0F1E ld h,a
        sta zH                        
        lda $FFC5                     ; $0F1F ldh a,[a8]
        sta zA                        
                                      ; $0F21 ld l,a
        sta zL                        
        lda $C007                     ; $0F22 ld a,[a16]
        sta zA                        
        jsr G_1C20                    ; $0F25 call a16
        lda zCY                       ; $0F28 ret nc
        lsr a                         
        bcs _s90                      
        rts                           
_s90
        sec                           ; $0F29 cp l
        lda zA                        
        sbc zL                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0F2A ret c
        lsr a                         
        bcc _s91                      
        rts                           
_s91
        lda #$01                      ; $0F2B ld a,d8
        sta zA                        
                                      ; $0F2D ld [a16],a
        sta $C05C                     
        lda #$80                      ; $0F30 ld a,d8
        sta zA                        
                                      ; $0F32 ld [a16],a
        sta $C04F                     
        lda $C000                     ; $0F35 ld a,[a16]
        sta zA                        
        sec                           ; $0F38 cp d8
        lda zA                        
        sbc #$07                      
        sta zZ                        
                                      ; $0F3A jp nz,a16
        beq _s92                      
        jmp G_0FCA                    
_s92
        lda $C013                     ; $0F3D ld a,[a16]
        sta zA                        
                                      ; $0F40 bit 1,a
        and #$02                      
        sta zZ                        
        lda $C092                     ; $0F42 ld a,[a16]
        sta zA                        
        lda zZ                        ; $0F45 jr nz,pc+r8
        beq _s93                      
        jmp G_0F55                    
_s93
        lda zA                        ; $0F47 ld [a16],a
        sta $C051                     
        lda $C047                     ; $0F4A ld a,[a16]
        sta zA                        
        sec                           ; $0F4D sub d8
        lda zA                        
        sbc #$26                      
        sta zA                        
                                      ; $0F4F srl a
        lsr a                         
        sta zA                        
        clc                           ; $0F51 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
        rol zCY                       
        jmp G_0F68                    ; $0F53 jr pc+r8
G_0F55
        jsr G_1E87                    ; $0F55 call a16
        lda zA                        ; $0F58 ld [a16],a
        sta $C051                     
        lda #<$C015                   ; $0F5B ld hl,d16
        sta zL                        
        lda #>$C015                   
        sta zH                        
        lda zA                        ; $0F5E and d8
        and #$7F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0F60 ld [hl],a
        sta (zL),y                    
        lda #$58                      ; $0F61 ld e,d8
        sta zE                        
        jsr G_1CF6                    ; $0F63 call a16
        clc                           ; $0F66 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
        rol zCY                       
G_0F68
        lda zA                        ; $0F68 ld [a16],a
        sta $C052                     
        lda $FF9A                     ; $0F6B ldh a,[a8]
        sta zA                        
        jsr G_1E3C                    ; $0F6D call a16
        lda #<$846C                   ; $0F70 ld de,d16
        sta zE                        
        lda #>$846C                   
        sta zD                        
        lda $FF91                     ; $0F73 ldh a,[a8]
        sta zA                        
                                      ; $0F75 bit 1,a
        and #$02                      
        sta zZ                        
                                      ; $0F77 jr nz,pc+r8
        beq _s94                      
        jmp G_0F7C                    
_s94
        lda #<$546C                   ; $0F79 ld de,d16
        sta zE                        
        lda #>$546C                   
        sta zD                        
G_0F7C
        lda $FF9A                     ; $0F7C ldh a,[a8]
        sta zA                        
                                      ; $0F7E bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $0F80 jr z,pc+r8
        bne _s95                      
        jmp G_0F86                    
_s95
        lda #$F0                      ; $0F82 ld a,d8
        sta zA                        
        jmp G_0F8C                    ; $0F84 jr pc+r8
G_0F86
        lda zA                        ; $0F86 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $0F88 jr z,pc+r8
        bne _s96                      
        jmp G_0F9B                    
_s96
        lda #$10                      ; $0F8A ld a,d8
        sta zA                        
G_0F8C
        lda zA                        ; $0F8C push af
        pha                           
        jsr G_GETF                    
        pha                           
        lda $C013                     ; $0F8D ld a,[a16]
        sta zA                        
                                      ; $0F90 bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $0F92 jr nz,pc+r8
        beq _s97                      
        jmp G_0F98                    
_s97
        pla                           ; $0F94 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
                                      ; $0F95 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0F97 push af
        pha                           
        jsr G_GETF                    
        pha                           
G_0F98
        pla                           ; $0F98 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
        clc                           ; $0F99 add d
        lda zA                        
        adc zD                        
        sta zA                        
                                      ; $0F9A ld d,a
        sta zD                        
G_0F9B
        jsr G_1D22                    ; $0F9B call a16
        lda zA                        ; $0F9E xor d8
        eor #$80                      
        sta zA                        
                                      ; $0FA0 ld b,a
        sta zB                        
        lda $C013                     ; $0FA1 ld a,[a16]
        sta zA                        
                                      ; $0FA4 bit 1,a
        and #$02                      
        sta zZ                        
        lda #$10                      ; $0FA6 ld c,d8
        sta zC                        
        lda zZ                        ; $0FA8 jr z,pc+r8
        bne _s98                      
        jmp G_0FAC                    
_s98
        lda #$04                      ; $0FAA ld c,d8
        sta zC                        
G_0FAC
        lda $C0DF                     ; $0FAC ld a,[a16]
        sta zA                        
        sec                           ; $0FAF cp d8
        lda zA                        
        sbc #$03                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0FB1 jr nc,pc+r8
        lsr a                         
        bcs _s99                      
        jmp G_0FB7                    
_s99
        lda zC                        ; $0FB3 srl c
        lsr a                         
        sta zC                        
                                      ; $0FB5 srl c
        lsr a                         
        sta zC                        
        rol zCY                       
G_0FB7
        lda $FF9A                     ; $0FB7 ldh a,[a8]
        sta zA                        
        jsr G_1E0D                    ; $0FB9 call a16
        lda zB                        ; $0FBC ld a,b
        sta zA                        
                                      ; $0FBD ld [a16],a
        sta $C050                     
        lda $C018                     ; $0FC0 ld a,[a16]
        sta zA                        
                                      ; $0FC3 ld b,a
        sta zB                        
        lda $C013                     ; $0FC4 ld a,[a16]
        sta zA                        
        jmp G_165C                    ; $0FC7 jp a16
G_0FCA
        lda $C019                     ; $0FCA ld a,[a16]
        sta zA                        
                                      ; $0FCD and a
        and zA                        
        sta zA                        
        sta zZ                        
                                      ; $0FCE jr z,pc+r8
        bne _s100                     
        jmp G_0FDC                    
_s100
        lda $C018                     ; $0FD0 ld a,[a16]
        sta zA                        
        clc                           ; $0FD3 add d8
        lda zA                        
        adc #$05                      
        sta zA                        
                                      ; $0FD5 ld [a16],a
        sta $C018                     
        lda zA                        ; $0FD8 xor a
        eor zA                        
        sta zA                        
                                      ; $0FD9 ld [a16],a
        sta $C019                     
G_0FDC
        lda $C00A                     ; $0FDC ld a,[a16]
        sta zA                        
G_0FDF
        sec                           ; $0FDF cp d8
        lda zA                        
        sbc #$06                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0FE1 jr c,pc+r8
        lsr a                         
        bcc _s101                     
        jmp G_0FE7                    
_s101
        sec                           ; $0FE3 sub d8
        lda zA                        
        sbc #$06                      
        sta zA                        
        jmp G_0FDF                    ; $0FE5 jr pc+r8
G_0FE7
        lda #$04                      ; $0FE7 ld b,d8
        sta zB                        
        lda zA                        ; $0FE9 and a
        and zA                        
        sta zA                        
        sta zZ                        
                                      ; $0FEA jr z,pc+r8
        bne _s102                     
        jmp G_0FEE                    
_s102
        lda #$FC                      ; $0FEC ld b,d8
        sta zB                        
G_0FEE
        lda #<$C016                   ; $0FEE ld hl,d16
        sta zL                        
        lda #>$C016                   
        sta zH                        
        lda $FF9A                     ; $0FF1 ldh a,[a8]
        sta zA                        
        jsr G_1E9F                    ; $0FF3 call a16
        jsr G_08BC                    ; $0FF6 call a16
        sec                           ; $0FF9 sub d8
        lda zA                        
        sbc #$B9                      
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $0FFB jr nc,pc+r8
        lsr a                         
        bcs _s103                     
        jmp G_1009                    
_s103
        lda zA                        ; $0FFD cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $0FFE inc a
        lda zA                        
        lda zA                        ; $0FFF sra a
        cmp #$80                      
        ror a                         
        sta zA                        
                                      ; $1001 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
                                      ; $1003 ld e,a
        sta zE                        
        lda #$52                      ; $1004 ld a,d8
        sta zA                        
        sec                           ; $1006 sub e
        lda zA                        
        sbc zE                        
        sta zA                        
        jmp G_100F                    ; $1007 jr pc+r8
G_1009
        lda zA                        ; $1009 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
                                      ; $100B sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        clc                           ; $100D add d8
        lda zA                        
        adc #$52                      
        sta zA                        
G_100F
        lda zA                        ; $100F ld e,a
        sta zE                        
        lda #$6C                      ; $1010 ld d,d8
        sta zD                        
        lda $C00A                     ; $1012 ld a,[a16]
        sta zA                        
        sec                           ; $1015 cp d8
        lda zA                        
        sbc #$0C                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1017 jr nc,pc+r8
        lsr a                         
        bcs _s104                     
        jmp G_1028                    
_s104
        lda $C018                     ; $1019 ld a,[a16]
        sta zA                        
        sec                           ; $101C sub d8
        lda zA                        
        sbc #$05                      
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $101E jr c,pc+r8
        lsr a                         
        bcc _s105                     
        jmp G_1028                    
_s105
        lda #$5C                      ; $1020 ld d,d8
        sta zD                        
        lda zA                        ; $1022 bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $1024 jr z,pc+r8
        bne _s106                     
        jmp G_1028                    
_s106
        lda #$7C                      ; $1026 ld d,d8
        sta zD                        
G_1028
        lda $C00A                     ; $1028 ld a,[a16]
        sta zA                        
        sec                           ; $102B cp d8
        lda zA                        
        sbc #$0C                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $102D jr c,pc+r8
        lsr a                         
        bcc _s107                     
        jmp G_1037                    
_s107
        lda #$68                      ; $102F ld e,d8
        sta zE                        
        lda (zL),y                    ; $1031 ld a,[hl]
        sta zA                        
        clc                           ; $1032 add d8
        lda zA                        
        adc #$10                      
        sta zA                        
                                      ; $1034 ld [hl],a
        sta (zL),y                    
        jmp G_1046                    ; $1035 jr pc+r8
G_1037
        sec                           ; $1037 cp d8
        lda zA                        
        sbc #$06                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1039 jr c,pc+r8
        lsr a                         
        bcc _s108                     
        jmp G_1046                    
_s108
        lda #$58                      ; $103B ld e,d8
        sta zE                        
        lda (zL),y                    ; $103D ld a,[hl]
        sta zA                        
        sec                           ; $103E sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
                                      ; $1040 ld [hl],a
        sta (zL),y                    
        lda #$02                      ; $1041 ld a,d8
        sta zA                        
                                      ; $1043 ld [a16],a
        sta $C05C                     
G_1046
        lda $C018                     ; $1046 ld a,[a16]
        sta zA                        
        sec                           ; $1049 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $104B jr nc,pc+r8
        lsr a                         
        bcs _s109                     
        jmp G_1055                    
_s109
        lda zH                        ; $104D push hl
        pha                           
        lda zL                        
        pha                           
        lda #<$C004                   ; $104E ld hl,d16
        sta zL                        
        lda #>$C004                   
        sta zH                        
        jsr G_1E6E                    ; $1051 call a16
        pla                           ; $1054 pop hl
        sta zL                        
        pla                           
        sta zH                        
G_1055
        lda $FF9A                     ; $1055 ldh a,[a8]
        sta zA                        
                                      ; $1057 ld b,a
        sta zB                        
        lda $C00A                     ; $1058 ld a,[a16]
        sta zA                        
        jsr G_1D71                    ; $105B call a16
        lda $C00A                     ; $105E ld a,[a16]
        sta zA                        
        jsr G_1D90                    ; $1061 call a16
        jsr G_1CF6                    ; $1064 call a16
        lda $C00A                     ; $1067 ld a,[a16]
        sta zA                        
        sec                           ; $106A cp d8
        lda zA                        
        sbc #$0C                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $106C jr c,pc+r8
        lsr a                         
        bcc _s110                     
        jmp G_1078                    
_s110
        lda #$90                      ; $106E ld a,d8
        sta zA                        
                                      ; $1070 ld [a16],a
        sta $C052                     
        lda #$22                      ; $1073 ld a,d8
        sta zA                        
                                      ; $1075 ld [a16],a
        sta $C05C                     
G_1078
        lda $C015                     ; $1078 ld a,[a16]
        sta zA                        
                                      ; $107B ld b,a
        sta zB                        
        lda $C013                     ; $107C ld a,[a16]
        sta zA                        
        jsr G_1DD9                    ; $107F call a16
        lda zB                        ; $1082 ld a,b
        sta zA                        
                                      ; $1083 ld [a16],a
        sta $C051                     
        lda #$80                      ; $1086 ld a,d8
        sta zA                        
                                      ; $1088 ld [a16],a
        sta $C04F                     
        jsr G_1D22                    ; $108B call a16
        lda #$10                      ; $108E ld c,d8
        sta zC                        
        lda #<$C014                   ; $1090 ld hl,d16
        sta zL                        
        lda #>$C014                   
        sta zH                        
        jsr G_1D57                    ; $1093 call a16
        jsr G_1CB1                    ; $1096 call a16
        lda $C018                     ; $1099 ld a,[a16]
        sta zA                        
        sec                           ; $109C cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $109E jr c,pc+r8
        lsr a                         
        bcc _s111                     
        jmp G_10A2                    
_s111
        sec                           ; $10A0 sub d8
        lda zA                        
        sbc #$05                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
G_10A2
        lda zA                        ; $10A2 ld b,a
        sta zB                        
        lda $C013                     ; $10A3 ld a,[a16]
        sta zA                        
        jmp S_P1SHOT                  ; $10A6 jp a16 (réglage)
G_10A9
        lda $FFAD                     ; $10A9 ldh a,[a8]
        sta zA                        
                                      ; $10AB bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $10AD ret nz
        beq _s112                     
        rts                           
_s112
        lda zA                        ; $10AE bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $10B0 ret nz
        beq _s113                     
        rts                           
_s113
        jsr G_0890                    ; $10B1 call a16
        lda zA                        ; $10B4 ld b,a
        sta zB                        
        jsr G_08BC                    ; $10B5 call a16
        sec                           ; $10B8 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $10B9 jr nc,pc+r8
        lsr a                         
        bcs _s114                     
        jmp G_10BD                    
_s114
        lda zA                        ; $10BB cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $10BC inc a
        lda zA                        
G_10BD
        sec                           ; $10BD cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $10BF ret nc
        lsr a                         
        bcs _s115                     
        rts                           
_s115
        jsr G_0885                    ; $10C0 call a16
        lda zA                        ; $10C3 ld b,a
        sta zB                        
        jsr G_08B1                    ; $10C4 call a16
        sec                           ; $10C7 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $10C8 jr nc,pc+r8
        lsr a                         
        bcs _s116                     
        jmp G_10CC                    
_s116
        lda zA                        ; $10CA cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $10CB inc a
        lda zA                        
G_10CC
        sec                           ; $10CC cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $10CE ret nc
        lsr a                         
        bcs _s117                     
        rts                           
_s117
        lda $C047                     ; $10CF ld a,[a16]
        sta zA                        
        sec                           ; $10D2 cp d8
        lda zA                        
        sbc #$34                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $10D4 ret nc
        lsr a                         
        bcs _s118                     
        rts                           
_s118
        lda $FFAD                     ; $10D5 ldh a,[a8]
        sta zA                        
                                      ; $10D7 bit 3,a
        and #$08                      
        sta zZ                        
                                      ; $10D9 jr z,pc+r8
        bne _s119                     
        jmp G_10DF                    
_s119
        lda zA                        ; $10DB or d8
        ora #$30                      
        sta zA                        
        jmp G_10E3                    ; $10DD jr pc+r8
G_10DF
        lda zA                        ; $10DF or d8
        ora #$38                      
        sta zA                        
                                      ; $10E1 ldh [a8],a
        sta $FFAE                     
G_10E3
        lda zA                        ; $10E3 ldh [a8],a
        sta $FFAD                     
        lda #$0D                      ; $10E5 ld a,d8
        sta zA                        
        jsr S_SOUND                   ; $10E7 call a16
        jmp G_1C84                    ; $10EA jp a16
G_10ED
        lda #<$FF96                   ; $10ED ld hl,d16
        sta zL                        
        lda #>$FF96                   
        sta zH                        
        lda (zL),y                    ; $10F0 set 7,[hl]
        ora #$80                      
        sta (zL),y                    
        lda #<$C022                   ; $10F2 ld hl,d16
        sta zL                        
        lda #>$C022                   
        sta zH                        
        jsr G_09FA                    ; $10F5 call a16
        lda zC                        ; $10F8 ld a,c
        sta zA                        
                                      ; $10F9 ld [a16],a
        sta $C02B                     
        lda $C020                     ; $10FC ld a,[a16]
        sta zA                        
        jsr G_RST08                   ; $10FF rst vec
        .word G_1110, G_1149, G_1152, G_11BC, G_120A, G_1229, G_12AF, G_12E8, G_17CD
G_1110
        jsr G_1317                    ; $1110 call a16
        jsr G_113D                    ; $1113 call a16
        lda #$01                      ; $1116 ld a,d8
        sta zA                        
                                      ; $1118 ld [a16],a
        sta $C020                     
        rts                           ; $111B ret
G_111C
        lda $FF91                     ; $111C ldh a,[a8]
        sta zA                        
                                      ; $111E bit 1,a
        and #$02                      
        sta zZ                        
        lda #$58                      ; $1120 ld a,d8
        sta zA                        
        lda zZ                        ; $1122 jr z,pc+r8
        bne _s120                     
        jmp G_1126                    
_s120
        lda #$7F                      ; $1124 ld a,d8
        sta zA                        
G_1126
        lda zA                        ; $1126 ld [a16],a
        sta $C025                     
        lda #$7F                      ; $1129 ld a,d8
        sta zA                        
        lda zZ                        ; $112B jr z,pc+r8
        bne _s121                     
        jmp G_112F                    
_s121
        lda #$80                      ; $112D ld a,d8
        sta zA                        
G_112F
        lda zA                        ; $112F ld [a16],a
        sta $C024                     
        lda #$36                      ; $1132 ld a,d8
        sta zA                        
                                      ; $1134 ld [a16],a
        sta $C023                     
        lda #$7F                      ; $1137 ld a,d8
        sta zA                        
                                      ; $1139 ld [a16],a
        sta $C022                     
        rts                           ; $113C ret
G_113D
        lda $FF91                     ; $113D ldh a,[a8]
        sta zA                        
                                      ; $113F bit 1,a
        and #$02                      
        sta zZ                        
        lda #$45                      ; $1141 ld a,d8
        sta zA                        
        lda zZ                        ; $1143 jr z,pc+r8
        bne _s122                     
        jmp G_1147                    
_s122
        lda #$92                      ; $1145 ld a,d8
        sta zA                        
G_1147
        jmp G_1126                    ; $1147 jr pc+r8
G_1149
        jsr G_132A                    ; $1149 call a16
        jsr G_1370                    ; $114C call a16
        jmp G_1618                    ; $114F jp a16
G_1152
        lda $C02A                     ; $1152 ld a,[a16]
        sta zA                        
        sec                           ; $1155 cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
                                      ; $1157 jr z,pc+r8
        bne _s123                     
        jmp G_1167                    
_s123
        sec                           ; $1159 cp d8
        lda zA                        
        sbc #$09                      
        sta zZ                        
                                      ; $115B jr z,pc+r8
        bne _s124                     
        jmp G_1167                    
_s124
        lda $C031                     ; $115D ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $1160 rst vec
        .byte $03, $04, $08, $06
        jmp G_116F                    ; $1165 jr pc+r8
G_1167
        lda $C031                     ; $1167 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $116A rst vec
        .byte $03, $0A, $0C, $01
G_116F
        lda zA                        ; $116F ld b,a
        sta zB                        
        lda $C030                     ; $1170 ld a,[a16]
        sta zA                        
        inc zA                        ; $1173 inc a
        lda zA                        
        lda zA                        ; $1174 ld [a16],a
        sta $C030                     
        sec                           ; $1177 cp b
        lda zA                        
        sbc zB                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1178 jr c,pc+r8
        lsr a                         
        bcc _s125                     
        jmp G_1189                    
_s125
        lda zA                        ; $117A xor a
        eor zA                        
        sta zA                        
                                      ; $117B ld [a16],a
        sta $C030                     
        lda $C031                     ; $117E ld a,[a16]
        sta zA                        
        inc zA                        ; $1181 inc a
        lda zA                        
        sec                           ; $1182 cp d8
        lda zA                        
        sbc #$03                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1184 jr nc,pc+r8
        lsr a                         
        bcs _s126                     
        jmp G_11AE                    
_s126
        lda zA                        ; $1186 ld [a16],a
        sta $C031                     
G_1189
        lda $C02A                     ; $1189 ld a,[a16]
        sta zA                        
                                      ; $118C ld b,a
        sta zB                        
        lda $C031                     ; $118D ld a,[a16]
        sta zA                        
        clc                           ; $1190 add b
        lda zA                        
        adc zB                        
        sta zA                        
        jsr G_RST18                   ; $1191 rst vec
        .byte $12, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0E, $0F, $10, $10, $04, $05, $06, $04, $05, $06
        lda zA                        ; $11A5 ld [a16],a
        sta $C021                     
        jsr G_13E8                    ; $11A8 call a16
        jmp G_1618                    ; $11AB jp a16
G_11AE
        lda zA                        ; $11AE xor a
        eor zA                        
        sta zA                        
        sty zCY                       
        lda zA                        ; $11AF ld [a16],a
        sta $C030                     
        lda zA                        ; $11B2 ld [a16],a
        sta $C031                     
        inc zA                        ; $11B5 inc a
        lda zA                        
        lda zA                        ; $11B6 ld [a16],a
        sta $C020                     
        jmp G_1618                    ; $11B9 jp a16
G_11BC
        lda #$03                      ; $11BC ld a,d8
        sta zA                        
                                      ; $11BE ld [a16],a
        sta $C021                     
        lda $C037                     ; $11C1 ld a,[a16]
        sta zA                        
                                      ; $11C4 and a
        and zA                        
        sta zA                        
        sta zZ                        
                                      ; $11C5 jr nz,pc+r8
        beq _s127                     
        jmp G_11D2                    
_s127
        lda #$01                      ; $11C7 ld a,d8
        sta zA                        
                                      ; $11C9 ld [a16],a
        sta $C040                     
        lda #$0E                      ; $11CC ld a,d8
        sta zA                        
                                      ; $11CE ld [a16],a
        sta $C047                     
        lda zA                        ; $11D1 xor a
        eor zA                        
        sta zA                        
G_11D2
        inc zA                        ; $11D2 inc a
        lda zA                        
        lda zA                        ; $11D3 ld [a16],a
        sta $C037                     
        sec                           ; $11D6 cp d8
        lda zA                        
        sbc #$10                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $11D8 jr c,pc+r8
        lsr a                         
        bcc _s128                     
        jmp G_11F0                    
_s128
        sec                           ; $11DA sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
        sec                           ; $11DC cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $11DE jr c,pc+r8
        lsr a                         
        bcc _s129                     
        jmp G_1209                    
_s129
        sec                           ; $11E0 sub d8
        lda zA                        
        sbc #$04                      
        sta zA                        
        sec                           ; $11E2 cp d8
        lda zA                        
        sbc #$10                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $11E4 jr c,pc+r8
        lsr a                         
        bcc _s130                     
        jmp G_11F0                    
_s130
        lda zA                        ; $11E6 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $11E7 ld [a16],a
        sta $C037                     
        lda #$05                      ; $11EA ld a,d8
        sta zA                        
                                      ; $11EC ld [a16],a
        sta $C020                     
        rts                           ; $11EF ret
G_11F0
        sec                           ; $11F0 sub d8
        lda zA                        
        sbc #$08                      
        sta zA                        
        rol zCY                       
        inc zCY                       
        lda $C047                     ; $11F2 ld a,[a16]
        sta zA                        
        lda zCY                       ; $11F5 jr c,pc+r8
        lsr a                         
        bcc _s131                     
        jmp G_11FB                    
_s131
        inc zA                        ; $11F7 inc a
        lda zA                        
        inc zA                        ; $11F8 inc a
        lda zA                        
        jmp G_11FD                    ; $11F9 jr pc+r8
G_11FB
        dec zA                        ; $11FB dec a
        lda zA                        
        dec zA                        ; $11FC dec a
        lda zA                        
G_11FD
        lda zA                        ; $11FD ld [a16],a
        sta $C047                     
        sec                           ; $1200 cp d8
        lda zA                        
        sbc #$0E                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1202 jr nc,pc+r8
        lsr a                         
        bcs _s132                     
        jmp G_1209                    
_s132
        lda #$13                      ; $1204 ld a,d8
        sta zA                        
                                      ; $1206 ld [a16],a
        sta $C021                     
G_1209
        rts                           ; $1209 ret
G_120A
        jsr G_1317                    ; $120A call a16
        lda #$80                      ; $120D ld a,d8
        sta zA                        
                                      ; $120F ldh [a8],a
        sta $FFAD                     
        lda zA                        ; $1211 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1212 ld [a16],a
        sta $C037                     
        jsr G_111C                    ; $1215 call a16
        jsr S_RET                     ; $1218 call a16
        lda $FFBB                     ; $121B ldh a,[a8]
        sta zA                        
                                      ; $121D ldh [a8],a
        sta $FFA8                     
        lda #$28                      ; $121F ld a,d8
        sta zA                        
                                      ; $1221 ldh [a8],a
        sta $FFAA                     
        lda #$05                      ; $1223 ld a,d8
        sta zA                        
                                      ; $1225 ld [a16],a
        sta $C020                     
        rts                           ; $1228 ret
G_1229
        lda #$03                      ; $1229 ld a,d8
        sta zA                        
                                      ; $122B ld [a16],a
        sta $C021                     
        lda $FF9C                     ; $122E ldh a,[a8]
        sta zA                        
                                      ; $1230 and a
        and zA                        
        sta zA                        
        sta zZ                        
                                      ; $1231 jr nz,pc+r8
        beq _s133                     
        jmp G_1248                    
_s133
        lda $C037                     ; $1233 ld a,[a16]
        sta zA                        
        inc zA                        ; $1236 inc a
        lda zA                        
        lda zA                        ; $1237 ld [a16],a
        sta $C037                     
        sec                           ; $123A cp d8
        lda zA                        
        sbc #$B4                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $123C jr c,pc+r8
        lsr a                         
        bcc _s134                     
        jmp G_1285                    
_s134
        lda zA                        ; $123E xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $123F ld [a16],a
        sta $C037                     
        lda #$03                      ; $1242 ld a,d8
        sta zA                        
                                      ; $1244 ld [a16],a
        sta $C020                     
        rts                           ; $1247 ret
G_1248
        lda zA                        ; $1248 xor a
        eor zA                        
        sta zA                        
        sty zCY                       
        lda zA                        ; $1249 ld [a16],a
        sta $C037                     
        lda $FF9C                     ; $124C ldh a,[a8]
        sta zA                        
                                      ; $124E ld c,a
        sta zC                        
        lda $FF91                     ; $124F ldh a,[a8]
        sta zA                        
                                      ; $1251 bit 1,a
        and #$02                      
        sta zZ                        
        lda #<$3F80                   ; $1253 ld de,d16
        sta zE                        
        lda #>$3F80                   
        sta zD                        
        lda zZ                        ; $1256 jr z,pc+r8
        bne _s135                     
        jmp G_125B                    
_s135
        lda #<$7380                   ; $1258 ld de,d16
        sta zE                        
        lda #>$7380                   
        sta zD                        
G_125B
        lda #<$C024                   ; $125B ld hl,d16
        sta zL                        
        lda #>$C024                   
        sta zH                        
        lda (zL),y                    ; $125E ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s136                     
        inc zH                        
_s136
        lda (zL),y                    ; $125F ld h,[hl]
        sta zH                        
        lda zA                        ; $1260 ld l,a
        sta zL                        
        jsr G_00C3                    ; $1261 call a16
        lda zCY                       ; $1264 jr nc,pc+r8
        lsr a                         
        bcs _s137                     
        jmp G_1268                    
_s137
        lda zC                        ; $1266 res 5,c
        and #$DF                      
        sta zC                        
G_1268
        lda $FF91                     ; $1268 ldh a,[a8]
        sta zA                        
                                      ; $126A bit 1,a
        and #$02                      
        sta zZ                        
        lda #<$6480                   ; $126C ld de,d16
        sta zE                        
        lda #>$6480                   
        sta zD                        
        lda zZ                        ; $126F jr z,pc+r8
        bne _s138                     
        jmp G_1274                    
_s138
        lda #<$9880                   ; $1271 ld de,d16
        sta zE                        
        lda #>$9880                   
        sta zD                        
G_1274
        jsr G_00C3                    ; $1274 call a16
        lda zCY                       ; $1277 jr c,pc+r8
        lsr a                         
        bcc _s139                     
        jmp G_127B                    
_s139
        lda zC                        ; $1279 res 4,c
        and #$EF                      
        sta zC                        
G_127B
        lda $C028                     ; $127B ld a,[a16]
        sta zA                        
                                      ; $127E ld b,a
        sta zB                        
        lda #<$C024                   ; $127F ld hl,d16
        sta zL                        
        lda #>$C024                   
        sta zH                        
        jsr G_08C7                    ; $1282 call a16
G_1285
        lda $C022                     ; $1285 ld a,[a16]
        sta zA                        
                                      ; $1288 ld [a16],a
        sta $C042                     
        lda $C023                     ; $128B ld a,[a16]
        sta zA                        
                                      ; $128E ld [a16],a
        sta $C043                     
        lda $C024                     ; $1291 ld a,[a16]
        sta zA                        
                                      ; $1294 ld [a16],a
        sta $C044                     
        lda $C025                     ; $1297 ld a,[a16]
        sta zA                        
        sec                           ; $129A sub d8
        lda zA                        
        sbc #$06                      
        sta zA                        
        jsr G_16F9                    ; $129C call a16
        lda $FF9D                     ; $129F ldh a,[a8]
        sta zA                        
                                      ; $12A1 and d8
        and #$03                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $12A3 ret z
        bne _s140                     
        rts                           
_s140
        lda #$02                      ; $12A4 ld a,d8
        sta zA                        
                                      ; $12A6 ld [a16],a
        sta $C040                     
        lda #$06                      ; $12A9 ld a,d8
        sta zA                        
                                      ; $12AB ld [a16],a
        sta $C020                     
        rts                           ; $12AE ret
G_12AF
        lda #$04                      ; $12AF ld a,d8
        sta zA                        
                                      ; $12B1 ld [a16],a
        sta $C021                     
        lda $FF9D                     ; $12B4 ldh a,[a8]
        sta zA                        
                                      ; $12B6 and d8
        and #$03                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $12B8 jr z,pc+r8
        bne _s141                     
        jmp G_12D0                    
_s141
        lda zA                        ; $12BA ld [a16],a
        sta $C033                     
        lda #$05                      ; $12BD ld a,d8
        sta zA                        
        jsr S_SOUND                   ; $12BF call a16
        lda zA                        ; $12C2 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $12C3 ld [a16],a
        sta $C030                     
        lda zA                        ; $12C6 ld [a16],a
        sta $C031                     
        lda #$07                      ; $12C9 ld a,d8
        sta zA                        
                                      ; $12CB ld [a16],a
        sta $C020                     
        jmp G_12E7                    ; $12CE jr pc+r8
G_12D0
        lda $C052                     ; $12D0 ld a,[a16]
        sta zA                        
                                      ; $12D3 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $12D5 jr z,pc+r8
        bne _s142                     
        jmp G_12E7                    
_s142
        lda $C047                     ; $12D7 ld a,[a16]
        sta zA                        
        sec                           ; $12DA cp d8
        lda zA                        
        sbc #$30                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $12DC jr nc,pc+r8
        lsr a                         
        bcs _s143                     
        jmp G_12E7                    
_s143
        lda zA                        ; $12DE xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $12DF ld [a16],a
        sta $C037                     
        lda #$05                      ; $12E2 ld a,d8
        sta zA                        
                                      ; $12E4 ld [a16],a
        sta $C020                     
G_12E7
        rts                           ; $12E7 ret
G_12E8
        lda $C031                     ; $12E8 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $12EB rst vec
        .byte $02, $08, $0A
        lda zA                        ; $12EF ld b,a
        sta zB                        
        lda $C030                     ; $12F0 ld a,[a16]
        sta zA                        
        inc zA                        ; $12F3 inc a
        lda zA                        
        lda zA                        ; $12F4 ld [a16],a
        sta $C030                     
        sec                           ; $12F7 cp b
        lda zA                        
        sbc zB                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $12F8 jr c,pc+r8
        lsr a                         
        bcc _s144                     
        jmp G_130A                    
_s144
        lda zA                        ; $12FA xor a
        eor zA                        
        sta zA                        
                                      ; $12FB ld [a16],a
        sta $C030                     
        lda $C031                     ; $12FE ld a,[a16]
        sta zA                        
        inc zA                        ; $1301 inc a
        lda zA                        
        sec                           ; $1302 cp d8
        lda zA                        
        sbc #$02                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1304 jp nc,a16
        lsr a                         
        bcs _s145                     
        jmp G_11AE                    
_s145
        lda zA                        ; $1307 ld [a16],a
        sta $C031                     
G_130A
        lda $C031                     ; $130A ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $130D rst vec
        .byte $02, $05, $06
        lda zA                        ; $1311 ld [a16],a
        sta $C021                     
        jmp G_13E8                    ; $1314 jp a16
G_1317
        lda $C0A8                     ; $1317 ld a,[a16]
        sta zA                        
                                      ; $131A ld [a16],a
        sta $C028                     
        lda $C0A9                     ; $131D ld a,[a16]
        sta zA                        
                                      ; $1320 ld [a16],a
        sta $C029                     
        lda $C0B6                     ; $1323 ld a,[a16]
        sta zA                        
                                      ; $1326 ld [a16],a
        sta $C036                     
        rts                           ; $1329 ret
G_132A
        lda $C028                     ; $132A ld a,[a16]
        sta zA                        
                                      ; $132D ld b,a
        sta zB                        
        lda $FF9C                     ; $132E ldh a,[a8]
        sta zA                        
                                      ; $1330 ld c,a
        sta zC                        
        lda #<$C024                   ; $1331 ld hl,d16
        sta zL                        
        lda #>$C024                   
        sta zH                        
        jsr G_08C7                    ; $1334 call a16
        lda $C029                     ; $1337 ld a,[a16]
        sta zA                        
                                      ; $133A ld b,a
        sta zB                        
        lda #<$C022                   ; $133B ld hl,d16
        sta zL                        
        lda #>$C022                   
        sta zH                        
        jsr G_08F8                    ; $133E call a16
        lda $C031                     ; $1341 ld a,[a16]
        sta zA                        
                                      ; $1344 and d8
        and #$04                      
        sta zA                        
                                      ; $1346 srl a
        lsr a                         
        sta zA                        
                                      ; $1348 srl a
        lsr a                         
        sta zA                        
                                      ; $134A ld d,a
        sta zD                        
        lda zC                        ; $134B ld a,c
        sta zA                        
                                      ; $134C and d8
        and #$F0                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $134E jr z,pc+r8
        bne _s146                     
        jmp G_136C                    
_s146
        lda zA                        ; $1350 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $1352 jr z,pc+r8
        bne _s147                     
        jmp G_1356                    
_s147
        inc zD                        ; $1354 inc d
        lda zD                        
        inc zD                        ; $1355 inc d
        lda zD                        
G_1356
        lda $C030                     ; $1356 ld a,[a16]
        sta zA                        
        clc                           ; $1359 add b
        lda zA                        
        adc zB                        
        sta zA                        
        rol zCY                       
        lda zA                        ; $135A ld [a16],a
        sta $C030                     
        lda $C031                     ; $135D ld a,[a16]
        sta zA                        
        lda zCY                       ; $1360 adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        lda zA                        ; $1362 ld [a16],a
        sta $C031                     
        lda zD                        ; $1365 ld a,d
        sta zA                        
        jsr G_RST18                   ; $1366 rst vec
        .byte $04, $01, $02, $11, $12
G_136C
        lda zA                        ; $136C ld [a16],a
        sta $C021                     
        rts                           ; $136F ret
G_1370
        lda $FF9D                     ; $1370 ldh a,[a8]
        sta zA                        
                                      ; $1372 and d8
        and #$03                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1374 ret z
        bne _s148                     
        rts                           
_s148
        lda zA                        ; $1375 ld [a16],a
        sta $C033                     
        lda #$05                      ; $1378 ld a,d8
        sta zA                        
        jsr S_SOUND                   ; $137A call a16
        jsr G_08A6                    ; $137D call a16
        jsr G_1722                    ; $1380 call a16
        lda $C024                     ; $1383 ld a,[a16]
        sta zA                        
                                      ; $1386 ld e,a
        sta zE                        
        lda $C025                     ; $1387 ld a,[a16]
        sta zA                        
                                      ; $138A ld d,a
        sta zD                        
        jsr G_00C3                    ; $138B call a16
        lda #$03                      ; $138E ld a,d8
        sta zA                        
        lda zCY                       ; $1390 jr nc,pc+r8
        lsr a                         
        bcs _s149                     
        jmp G_1393                    
_s149
        lda zA                        ; $1392 xor a
        eor zA                        
        sta zA                        
G_1393
        lda zA                        ; $1393 ld [a16],a
        sta $C02A                     
        lda #<$0400                   ; $1396 ld hl,d16
        sta zL                        
        lda #>$0400                   
        sta zH                        
        clc                           ; $1399 add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
                                      ; $139A ld a,h
        sta zA                        
        sec                           ; $139B cp d8
        lda zA                        
        sbc #$08                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $139D jr nc,pc+r8
        lsr a                         
        bcs _s150                     
        jmp G_13B7                    
_s150
        lda $FF9C                     ; $139F ldh a,[a8]
        sta zA                        
                                      ; $13A1 bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $13A3 jr z,pc+r8
        bne _s151                     
        jmp G_13A9                    
_s151
        lda #$03                      ; $13A5 ld a,d8
        sta zA                        
        jmp G_13AF                    ; $13A7 jr pc+r8
G_13A9
        lda zA                        ; $13A9 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $13AB jr z,pc+r8
        bne _s152                     
        jmp G_13B7                    
_s152
        lda #$00                      ; $13AD ld a,d8
        sta zA                        
G_13AF
        lda zA                        ; $13AF ld [a16],a
        sta $C02A                     
        lda #$FF                      ; $13B2 ld a,d8
        sta zA                        
                                      ; $13B4 ld [a16],a
        sta $C039                     
G_13B7
        lda #$00                      ; $13B7 ld b,d8
        sta zB                        
        lda $C047                     ; $13B9 ld a,[a16]
        sta zA                        
        sec                           ; $13BC cp d8
        lda zA                        
        sbc #$40                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $13BE jr c,pc+r8
        lsr a                         
        bcc _s153                     
        jmp G_13CA                    
_s153
        lda $C02A                     ; $13C0 ld a,[a16]
        sta zA                        
        clc                           ; $13C3 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
                                      ; $13C5 ld [a16],a
        sta $C02A                     
        jmp G_13DA                    ; $13C8 jr pc+r8
G_13CA
        lda $C02B                     ; $13CA ld a,[a16]
        sta zA                        
        sec                           ; $13CD cp d8
        lda zA                        
        sbc #$0C                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $13CF jr c,pc+r8
        lsr a                         
        bcc _s154                     
        jmp G_13DA                    
_s154
        lda $C02A                     ; $13D1 ld a,[a16]
        sta zA                        
        clc                           ; $13D4 add d8
        lda zA                        
        adc #$06                      
        sta zA                        
                                      ; $13D6 ld [a16],a
        sta $C02A                     
        inc zB                        ; $13D9 inc b
        lda zB                        
G_13DA
        lda zB                        ; $13DA ld a,b
        sta zA                        
                                      ; $13DB ld [a16],a
        sta $C031                     
        lda zA                        ; $13DE xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $13DF ld [a16],a
        sta $C030                     
        lda #$02                      ; $13E2 ld a,d8
        sta zA                        
                                      ; $13E4 ld [a16],a
        sta $C020                     
        rts                           ; $13E7 ret
G_13E8
        lda $FFAD                     ; $13E8 ldh a,[a8]
        sta zA                        
                                      ; $13EA bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $13EC ret z
        bne _s155                     
        rts                           
_s155
        lda zA                        ; $13ED bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $13EF ret nz
        beq _s156                     
        rts                           
_s156
        lda zA                        ; $13F0 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $13F2 ret nz
        beq _s157                     
        rts                           
_s157
        lda $C043                     ; $13F3 ld a,[a16]
        sta zA                        
        sec                           ; $13F6 cp d8
        lda zA                        
        sbc #$78                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $13F8 ret nc
        lsr a                         
        bcs _s158                     
        rts                           
_s158
        lda $C021                     ; $13F9 ld a,[a16]
        sta zA                        
        jsr G_0A2C                    ; $13FC call a16
        lda zZ                        ; $13FF ret nz
        beq _s159                     
        rts                           
_s159
        lda zC                        ; $1400 ld a,c
        sta zA                        
                                      ; $1401 ld [a16],a
        sta $C038                     
                                      ; $1404 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $1407 rst vec
        .byte $05, $FA, $FA, $FE, $FE, $FC
        clc                           ; $140E add d8
        lda zA                        
        adc #$10                      
        sta zA                        
                                      ; $1410 ldh [a8],a
        sta $FFC5                     
        lda $C038                     ; $1412 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $1415 rst vec
        .byte $05, $0A, $0A, $0C, $0C, $0C
        clc                           ; $141C add d8
        lda zA                        
        adc #$11                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $141E ld b,a
        sta zB                        
        lda $FFC5                     ; $141F ldh a,[a8]
        sta zA                        
                                      ; $1421 ld c,a
        sta zC                        
        lda #<$C022                   ; $1422 ld hl,d16
        sta zL                        
        lda #>$C022                   
        sta zH                        
        jsr G_1C05                    ; $1425 call a16
        lda zCY                       ; $1428 ret nc
        lsr a                         
        bcs _s160                     
        rts                           
_s160
        sec                           ; $1429 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $142A ret c
        lsr a                         
        bcc _s161                     
        rts                           
_s161
        lda $C038                     ; $142B ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $142E rst vec
        .byte $05, $02, $02, $05, $05, $04
        lda zA                        ; $1435 ld b,a
        sta zB                        
        lda $FFC5                     ; $1436 ldh a,[a8]
        sta zA                        
        sec                           ; $1438 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
                                      ; $1439 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $143B jr z,pc+r8
        bne _s162                     
        jmp G_1441                    
_s162
        lda zA                        ; $143D cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $143E inc a
        lda zA                        
        lda zA                        ; $143F set 7,a
        ora #$80                      
        sta zA                        
G_1441
        lda zA                        ; $1441 ld b,a
        sta zB                        
        lda $C038                     ; $1442 ld a,[a16]
        sta zA                        
                                      ; $1445 bit 0,a
        and #$01                      
        sta zZ                        
        lda zB                        ; $1447 ld a,b
        sta zA                        
        lda zZ                        ; $1448 jr z,pc+r8
        bne _s163                     
        jmp G_144C                    
_s163
        lda zA                        ; $144A xor d8
        eor #$80                      
        sta zA                        
G_144C
        lda zA                        ; $144C ld [a16],a
        sta $C034                     
        lda $C038                     ; $144F ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $1452 rst vec
        .byte $05, $EE, $FC, $F2, $FC, $F6
        clc                           ; $1459 add d8
        lda zA                        
        adc #$1E                      
        sta zA                        
                                      ; $145B ldh [a8],a
        sta $FFC5                     
        lda $C038                     ; $145D ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $1460 rst vec
        .byte $05, $04, $12, $04, $0E, $02
        clc                           ; $1467 add d8
        lda zA                        
        adc #$23                      
        sta zA                        
        rol zCY                       
        lda zA                        ; $1469 ld b,a
        sta zB                        
        lda $FFC5                     ; $146A ldh a,[a8]
        sta zA                        
                                      ; $146C ld c,a
        sta zC                        
        lda #<$C024                   ; $146D ld hl,d16
        sta zL                        
        lda #>$C024                   
        sta zH                        
        jsr G_1BEF                    ; $1470 call a16
        clc                           ; $1473 add d8
        lda zA                        
        adc #$20                      
        sta zA                        
        sec                           ; $1475 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1476 ret nc
        lsr a                         
        bcs _s164                     
        rts                           
_s164
        sec                           ; $1477 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1478 ret c
        lsr a                         
        bcc _s165                     
        rts                           
_s165
        lda $C038                     ; $1479 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $147C rst vec
        .byte $05, $02, $02, $10, $10, $30
        lda zA                        ; $1483 ldh [a8],a
        sta $FFC5                     
        lda $C038                     ; $1485 ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $1488 rst vec
        .byte $05, $30, $30, $40, $40, $50
        lda zA                        ; $148F ld h,a
        sta zH                        
        lda $FFC5                     ; $1490 ldh a,[a8]
        sta zA                        
                                      ; $1492 ld l,a
        sta zL                        
        lda $C027                     ; $1493 ld a,[a16]
        sta zA                        
        jsr G_1C20                    ; $1496 call a16
        lda zCY                       ; $1499 ret nc
        lsr a                         
        bcs _s166                     
        rts                           
_s166
        sec                           ; $149A cp l
        lda zA                        
        sbc zL                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $149B ret c
        lsr a                         
        bcc _s167                     
        rts                           
_s167
        lda #$01                      ; $149C ld a,d8
        sta zA                        
                                      ; $149E ld [a16],a
        sta $C05C                     
        lda zA                        ; $14A1 xor a
        eor zA                        
        sta zA                        
                                      ; $14A2 ld [a16],a
        sta $C04F                     
        lda $C020                     ; $14A5 ld a,[a16]
        sta zA                        
        sec                           ; $14A8 cp d8
        lda zA                        
        sbc #$07                      
        sta zZ                        
                                      ; $14AA jp nz,a16
        beq _s168                     
        jmp G_153A                    
_s168
        lda $C033                     ; $14AD ld a,[a16]
        sta zA                        
                                      ; $14B0 bit 1,a
        and #$02                      
        sta zZ                        
        lda $C0B2                     ; $14B2 ld a,[a16]
        sta zA                        
        lda zZ                        ; $14B5 jr nz,pc+r8
        beq _s169                     
        jmp G_14C5                    
_s169
        lda zA                        ; $14B7 ld [a16],a
        sta $C051                     
        lda $C047                     ; $14BA ld a,[a16]
        sta zA                        
        sec                           ; $14BD sub d8
        lda zA                        
        sbc #$26                      
        sta zA                        
                                      ; $14BF srl a
        lsr a                         
        sta zA                        
        clc                           ; $14C1 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
        rol zCY                       
        jmp G_14D8                    ; $14C3 jr pc+r8
G_14C5
        jsr G_1E87                    ; $14C5 call a16
        lda zA                        ; $14C8 ld [a16],a
        sta $C051                     
        lda #<$C035                   ; $14CB ld hl,d16
        sta zL                        
        lda #>$C035                   
        sta zH                        
        lda zA                        ; $14CE and d8
        and #$7F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $14D0 ld [hl],a
        sta (zL),y                    
        lda #$98                      ; $14D1 ld e,d8
        sta zE                        
        jsr G_1CF6                    ; $14D3 call a16
        clc                           ; $14D6 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
        rol zCY                       
G_14D8
        lda zA                        ; $14D8 ld [a16],a
        sta $C052                     
        lda $FF9C                     ; $14DB ldh a,[a8]
        sta zA                        
        jsr G_1E60                    ; $14DD call a16
        lda #<$5484                   ; $14E0 ld de,d16
        sta zE                        
        lda #>$5484                   
        sta zD                        
        lda $FF91                     ; $14E3 ldh a,[a8]
        sta zA                        
                                      ; $14E5 bit 1,a
        and #$02                      
        sta zZ                        
                                      ; $14E7 jr nz,pc+r8
        beq _s170                     
        jmp G_14EC                    
_s170
        lda #<$8484                   ; $14E9 ld de,d16
        sta zE                        
        lda #>$8484                   
        sta zD                        
G_14EC
        lda $FF9C                     ; $14EC ldh a,[a8]
        sta zA                        
                                      ; $14EE bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $14F0 jr z,pc+r8
        bne _s171                     
        jmp G_14F6                    
_s171
        lda #$F0                      ; $14F2 ld a,d8
        sta zA                        
        jmp G_14FC                    ; $14F4 jr pc+r8
G_14F6
        lda zA                        ; $14F6 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $14F8 jr z,pc+r8
        bne _s172                     
        jmp G_150B                    
_s172
        lda #$10                      ; $14FA ld a,d8
        sta zA                        
G_14FC
        lda zA                        ; $14FC push af
        pha                           
        jsr G_GETF                    
        pha                           
        lda $C033                     ; $14FD ld a,[a16]
        sta zA                        
                                      ; $1500 bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $1502 jr nz,pc+r8
        beq _s173                     
        jmp G_1508                    
_s173
        pla                           ; $1504 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
                                      ; $1505 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1507 push af
        pha                           
        jsr G_GETF                    
        pha                           
G_1508
        pla                           ; $1508 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
        clc                           ; $1509 add d
        lda zA                        
        adc zD                        
        sta zA                        
                                      ; $150A ld d,a
        sta zD                        
G_150B
        jsr G_1D22                    ; $150B call a16
        lda zA                        ; $150E xor d8
        eor #$80                      
        sta zA                        
                                      ; $1510 ld b,a
        sta zB                        
        lda $C033                     ; $1511 ld a,[a16]
        sta zA                        
                                      ; $1514 bit 1,a
        and #$02                      
        sta zZ                        
        lda #$10                      ; $1516 ld c,d8
        sta zC                        
        lda zZ                        ; $1518 jr z,pc+r8
        bne _s174                     
        jmp G_151C                    
_s174
        lda #$04                      ; $151A ld c,d8
        sta zC                        
G_151C
        lda $C0DF                     ; $151C ld a,[a16]
        sta zA                        
        sec                           ; $151F cp d8
        lda zA                        
        sbc #$03                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1521 jr nc,pc+r8
        lsr a                         
        bcs _s175                     
        jmp G_1527                    
_s175
        lda zC                        ; $1523 srl c
        lsr a                         
        sta zC                        
                                      ; $1525 srl c
        lsr a                         
        sta zC                        
        rol zCY                       
G_1527
        lda $FF9C                     ; $1527 ldh a,[a8]
        sta zA                        
        jsr G_1E0D                    ; $1529 call a16
        lda zB                        ; $152C ld a,b
        sta zA                        
                                      ; $152D ld [a16],a
        sta $C050                     
        lda $C038                     ; $1530 ld a,[a16]
        sta zA                        
                                      ; $1533 ld b,a
        sta zB                        
        lda $C033                     ; $1534 ld a,[a16]
        sta zA                        
        jmp G_165C                    ; $1537 jp a16
G_153A
        lda $C039                     ; $153A ld a,[a16]
        sta zA                        
                                      ; $153D and a
        and zA                        
        sta zA                        
        sta zZ                        
                                      ; $153E jr z,pc+r8
        bne _s176                     
        jmp G_154C                    
_s176
        lda $C038                     ; $1540 ld a,[a16]
        sta zA                        
        clc                           ; $1543 add d8
        lda zA                        
        adc #$05                      
        sta zA                        
                                      ; $1545 ld [a16],a
        sta $C038                     
        lda zA                        ; $1548 xor a
        eor zA                        
        sta zA                        
                                      ; $1549 ld [a16],a
        sta $C039                     
G_154C
        lda $C02A                     ; $154C ld a,[a16]
        sta zA                        
G_154F
        sec                           ; $154F cp d8
        lda zA                        
        sbc #$06                      
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1551 jr c,pc+r8
        lsr a                         
        bcc _s177                     
        jmp G_1557                    
_s177
        sec                           ; $1553 sub d8
        lda zA                        
        sbc #$06                      
        sta zA                        
        jmp G_154F                    ; $1555 jr pc+r8
