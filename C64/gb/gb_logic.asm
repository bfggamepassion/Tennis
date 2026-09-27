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
        sta zZ                        
        rol zCY                       
        clc                           ; $00AE add a
        lda zA                        
        adc zA                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $00AF add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        clc                           ; $00D0 add a
        lda zA                        
        adc zA                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $00D1 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $00D2 ld l,a
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
        sta zZ                        
        rol zCY                       
        clc                           ; $00DF add a
        lda zA                        
        adc zA                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $00E0 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $00E1 ld l,a
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $0911 ld b,a
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $0939 ld b,a
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0A0C ld d,a
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0A11 ld e,a
        sta zE                        
G_0A12
        lda zE                        ; $0A12 ld a,e
        sta zA                        
        sec                           ; $0A13 cp d8
        lda zA                        
        sbc #$6C                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        sec                           ; $0AF2 sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zB                        ; $0B30 srl b
        lsr a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
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
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0BE7 jr z,pc+r8
        bne _s47                      
        jmp G_0BF7                    
_s47
        sec                           ; $0BE9 cp d8
        lda zA                        
        sbc #$09                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0BEB jr z,pc+r8
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
        sta zZ                        
        lda zA                        ; $0C04 ld [a16],a
        sta $C010                     
        sec                           ; $0C07 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0C0B ld [a16],a
        sta $C010                     
        lda $C011                     ; $0C0E ld a,[a16]
        sta zA                        
        inc zA                        ; $0C11 inc a
        lda zA                        
        sta zZ                        
        sec                           ; $0C12 cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0C3F ld [a16],a
        sta $C010                     
        lda zA                        ; $0C42 ld [a16],a
        sta $C011                     
        inc zA                        ; $0C45 inc a
        lda zA                        
        sta zZ                        
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
        sty zCY                       
        lda zZ                        ; $0C55 jr nz,pc+r8
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
        sta zZ                        
        sty zCY                       
G_0C62
        inc zA                        ; $0C62 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $0C63 ld [a16],a
        sta $C017                     
        sec                           ; $0C66 cp d8
        lda zA                        
        sbc #$10                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        sec                           ; $0C72 cp d8
        lda zA                        
        sbc #$10                      
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        inc zA                        ; $0C88 inc a
        lda zA                        
        sta zZ                        
        jmp G_0C8D                    ; $0C89 jr pc+r8
G_0C8B
        dec zA                        ; $0C8B dec a
        lda zA                        
        sta zZ                        
        dec zA                        ; $0C8C dec a
        lda zA                        
        sta zZ                        
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
        sty zCY                       
        lda zZ                        ; $0CBF jr nz,pc+r8
        beq _s57                      
        jmp G_0CD6                    
_s57
        lda $C017                     ; $0CC1 ld a,[a16]
        sta zA                        
        inc zA                        ; $0CC4 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $0CC5 ld [a16],a
        sta $C017                     
        sec                           ; $0CC8 cp d8
        lda zA                        
        sbc #$B4                      
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
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
        sta zZ                        
        lda zA                        ; $0D82 ld [a16],a
        sta $C010                     
        sec                           ; $0D85 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0D89 ld [a16],a
        sta $C010                     
        lda $C011                     ; $0D8C ld a,[a16]
        sta zA                        
        inc zA                        ; $0D8F inc a
        lda zA                        
        sta zZ                        
        sec                           ; $0D90 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0DD4 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0DD6 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0DD8 ld d,a
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
        sta zZ                        
        inc zD                        ; $0DE3 inc d
        lda zD                        
        sta zZ                        
G_0DE4
        lda $C010                     ; $0DE4 ld a,[a16]
        sta zA                        
        clc                           ; $0DE7 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
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
        rol zCY                       
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
        rol zCY                       
        lda zH                        ; $0E29 ld a,h
        sta zA                        
        sec                           ; $0E2A cp d8
        lda zA                        
        sbc #$08                      
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0E54 ld [a16],a
        sta $C00A                     
        jmp G_0E69                    ; $0E57 jr pc+r8
G_0E59
        lda $C00B                     ; $0E59 ld a,[a16]
        sta zA                        
        sec                           ; $0E5C cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0E65 ld [a16],a
        sta $C00A                     
        inc zB                        ; $0E68 inc b
        lda zB                        
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0E9F ldh [a8],a
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $0EC8 bit 7,a
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
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0EEA ldh [a8],a
        sta $FFC5                     
        lda $C018                     ; $0EEC ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $0EEF rst vec
        .byte $05, $12, $04, $0E, $04, $0A
        clc                           ; $0EF6 add d8
        lda zA                        
        adc #$23                      
        sta zA                        
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
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
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $0F3A jp nz,a16
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $0F4F srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $0F51 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0F9A ld d,a
        sta zD                        
G_0F9B
        jsr G_1D22                    ; $0F9B call a16
        lda zA                        ; $0F9E xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0FA0 ld b,a
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zC                        ; $0FB5 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
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
        sty zCY                       
        lda zZ                        ; $0FCE jr z,pc+r8
        bne _s100                     
        jmp G_0FDC                    
_s100
        lda $C018                     ; $0FD0 ld a,[a16]
        sta zA                        
        clc                           ; $0FD3 add d8
        lda zA                        
        adc #$05                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $0FD5 ld [a16],a
        sta $C018                     
        lda zA                        ; $0FD8 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $0FD9 ld [a16],a
        sta $C019                     
G_0FDC
        lda $C00A                     ; $0FDC ld a,[a16]
        sta zA                        
G_0FDF
        sec                           ; $0FDF cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        jmp G_0FDF                    ; $0FE5 jr pc+r8
G_0FE7
        lda #$04                      ; $0FE7 ld b,d8
        sta zB                        
        lda zA                        ; $0FE9 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $0FEA jr z,pc+r8
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
        sta zZ                        
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
        sta zZ                        
        lda zA                        ; $0FFF sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1001 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1003 ld e,a
        sta zE                        
        lda #$52                      ; $1004 ld a,d8
        sta zA                        
        sec                           ; $1006 sub e
        lda zA                        
        sbc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        jmp G_100F                    ; $1007 jr pc+r8
G_1009
        lda zA                        ; $1009 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $100B sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $100D add d8
        lda zA                        
        adc #$52                      
        sta zA                        
        sta zZ                        
        rol zCY                       
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1034 ld [hl],a
        sta (zL),y                    
        jmp G_1046                    ; $1035 jr pc+r8
G_1037
        sec                           ; $1037 cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1040 ld [hl],a
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
        jmp G_10E3                    ; $10DD jr pc+r8
G_10DF
        lda zA                        ; $10DF or d8
        ora #$38                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $10E1 ldh [a8],a
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
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1157 jr z,pc+r8
        bne _s123                     
        jmp G_1167                    
_s123
        sec                           ; $1159 cp d8
        lda zA                        
        sbc #$09                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $115B jr z,pc+r8
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
        sta zZ                        
        lda zA                        ; $1174 ld [a16],a
        sta $C030                     
        sec                           ; $1177 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $117B ld [a16],a
        sta $C030                     
        lda $C031                     ; $117E ld a,[a16]
        sta zA                        
        inc zA                        ; $1181 inc a
        lda zA                        
        sta zZ                        
        sec                           ; $1182 cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $11AF ld [a16],a
        sta $C030                     
        lda zA                        ; $11B2 ld [a16],a
        sta $C031                     
        inc zA                        ; $11B5 inc a
        lda zA                        
        sta zZ                        
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
        sty zCY                       
        lda zZ                        ; $11C5 jr nz,pc+r8
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
        sta zZ                        
        sty zCY                       
G_11D2
        inc zA                        ; $11D2 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $11D3 ld [a16],a
        sta $C037                     
        sec                           ; $11D6 cp d8
        lda zA                        
        sbc #$10                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        sec                           ; $11E2 cp d8
        lda zA                        
        sbc #$10                      
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        inc zA                        ; $11F8 inc a
        lda zA                        
        sta zZ                        
        jmp G_11FD                    ; $11F9 jr pc+r8
G_11FB
        dec zA                        ; $11FB dec a
        lda zA                        
        sta zZ                        
        dec zA                        ; $11FC dec a
        lda zA                        
        sta zZ                        
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
        sty zCY                       
        lda zZ                        ; $1231 jr nz,pc+r8
        beq _s133                     
        jmp G_1248                    
_s133
        lda $C037                     ; $1233 ld a,[a16]
        sta zA                        
        inc zA                        ; $1236 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $1237 ld [a16],a
        sta $C037                     
        sec                           ; $123A cp d8
        lda zA                        
        sbc #$B4                      
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
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
        sta zZ                        
        lda zA                        ; $12F4 ld [a16],a
        sta $C030                     
        sec                           ; $12F7 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $12FB ld [a16],a
        sta $C030                     
        lda $C031                     ; $12FE ld a,[a16]
        sta zA                        
        inc zA                        ; $1301 inc a
        lda zA                        
        sta zZ                        
        sec                           ; $1302 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1346 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1348 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $134A ld d,a
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
        sta zZ                        
        inc zD                        ; $1355 inc d
        lda zD                        
        sta zZ                        
G_1356
        lda $C030                     ; $1356 ld a,[a16]
        sta zA                        
        clc                           ; $1359 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
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
        rol zCY                       
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
        sta zZ                        
        sty zCY                       
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
        rol zCY                       
        lda zH                        ; $139A ld a,h
        sta zA                        
        sec                           ; $139B cp d8
        lda zA                        
        sbc #$08                      
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $13C5 ld [a16],a
        sta $C02A                     
        jmp G_13DA                    ; $13C8 jr pc+r8
G_13CA
        lda $C02B                     ; $13CA ld a,[a16]
        sta zA                        
        sec                           ; $13CD cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $13D6 ld [a16],a
        sta $C02A                     
        inc zB                        ; $13D9 inc b
        lda zB                        
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1410 ldh [a8],a
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1439 bit 7,a
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
        sta zZ                        
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
        sta zZ                        
        sty zCY                       
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $145B ldh [a8],a
        sta $FFC5                     
        lda $C038                     ; $145D ld a,[a16]
        sta zA                        
        jsr G_RST18                   ; $1460 rst vec
        .byte $05, $04, $12, $04, $0E, $02
        clc                           ; $1467 add d8
        lda zA                        
        adc #$23                      
        sta zA                        
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
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
        sta zZ                        
        sty zCY                       
        lda zA                        ; $14A2 ld [a16],a
        sta $C04F                     
        lda $C020                     ; $14A5 ld a,[a16]
        sta zA                        
        sec                           ; $14A8 cp d8
        lda zA                        
        sbc #$07                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $14AA jp nz,a16
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $14BF srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $14C1 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
        sta zZ                        
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zA                        ; $150A ld d,a
        sta zD                        
G_150B
        jsr G_1D22                    ; $150B call a16
        lda zA                        ; $150E xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1510 ld b,a
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
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1525 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
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
        sty zCY                       
        lda zZ                        ; $153E jr z,pc+r8
        bne _s176                     
        jmp G_154C                    
_s176
        lda $C038                     ; $1540 ld a,[a16]
        sta zA                        
        clc                           ; $1543 add d8
        lda zA                        
        adc #$05                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1545 ld [a16],a
        sta $C038                     
        lda zA                        ; $1548 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1549 ld [a16],a
        sta $C039                     
G_154C
        lda $C02A                     ; $154C ld a,[a16]
        sta zA                        
G_154F
        sec                           ; $154F cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
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
        sta zZ                        
        rol zCY                       
        inc zCY                       
        jmp G_154F                    ; $1555 jr pc+r8
G_1557
        lda #$04                      ; $1557 ld b,d8
        sta zB                        
        lda zA                        ; $1559 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $155A jr z,pc+r8
        bne _s178                     
        jmp G_155E                    
_s178
        lda #$FC                      ; $155C ld b,d8
        sta zB                        
G_155E
        lda #<$C036                   ; $155E ld hl,d16
        sta zL                        
        lda #>$C036                   
        sta zH                        
        lda $FF9C                     ; $1561 ldh a,[a8]
        sta zA                        
        jsr G_1EC3                    ; $1563 call a16
        jsr G_08BC                    ; $1566 call a16
        sec                           ; $1569 sub d8
        lda zA                        
        sbc #$37                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $156B jr nc,pc+r8
        lsr a                         
        bcs _s179                     
        jmp G_1579                    
_s179
        lda zA                        ; $156D cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $156E inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $156F sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1571 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1573 ld e,a
        sta zE                        
        lda #$9E                      ; $1574 ld a,d8
        sta zA                        
        sec                           ; $1576 sub e
        lda zA                        
        sbc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        jmp G_157F                    ; $1577 jr pc+r8
G_1579
        lda zA                        ; $1579 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $157B sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $157D add d8
        lda zA                        
        adc #$9E                      
        sta zA                        
        sta zZ                        
        rol zCY                       
G_157F
        lda zA                        ; $157F ld e,a
        sta zE                        
        lda #$6C                      ; $1580 ld d,d8
        sta zD                        
        lda $C02A                     ; $1582 ld a,[a16]
        sta zA                        
        sec                           ; $1585 cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1587 jr nc,pc+r8
        lsr a                         
        bcs _s180                     
        jmp G_1598                    
_s180
        lda $C038                     ; $1589 ld a,[a16]
        sta zA                        
        sec                           ; $158C sub d8
        lda zA                        
        sbc #$05                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $158E jr c,pc+r8
        lsr a                         
        bcc _s181                     
        jmp G_1598                    
_s181
        lda #$7C                      ; $1590 ld d,d8
        sta zD                        
        lda zA                        ; $1592 bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $1594 jr z,pc+r8
        bne _s182                     
        jmp G_1598                    
_s182
        lda #$5C                      ; $1596 ld d,d8
        sta zD                        
G_1598
        lda $C02A                     ; $1598 ld a,[a16]
        sta zA                        
        sec                           ; $159B cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $159D jr c,pc+r8
        lsr a                         
        bcc _s183                     
        jmp G_15A7                    
_s183
        lda #$88                      ; $159F ld e,d8
        sta zE                        
        lda (zL),y                    ; $15A1 ld a,[hl]
        sta zA                        
        clc                           ; $15A2 add d8
        lda zA                        
        adc #$10                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $15A4 ld [hl],a
        sta (zL),y                    
        jmp G_15B6                    ; $15A5 jr pc+r8
G_15A7
        sec                           ; $15A7 cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $15A9 jr c,pc+r8
        lsr a                         
        bcc _s184                     
        jmp G_15B6                    
_s184
        lda #$98                      ; $15AB ld e,d8
        sta zE                        
        lda (zL),y                    ; $15AD ld a,[hl]
        sta zA                        
        sec                           ; $15AE sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $15B0 ld [hl],a
        sta (zL),y                    
        lda #$02                      ; $15B1 ld a,d8
        sta zA                        
                                      ; $15B3 ld [a16],a
        sta $C05C                     
G_15B6
        lda $C038                     ; $15B6 ld a,[a16]
        sta zA                        
        sec                           ; $15B9 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $15BB jr nc,pc+r8
        lsr a                         
        bcs _s185                     
        jmp G_15C5                    
_s185
        lda zH                        ; $15BD push hl
        pha                           
        lda zL                        
        pha                           
        lda #<$C024                   ; $15BE ld hl,d16
        sta zL                        
        lda #>$C024                   
        sta zH                        
        jsr G_1E6E                    ; $15C1 call a16
        pla                           ; $15C4 pop hl
        sta zL                        
        pla                           
        sta zH                        
G_15C5
        lda $FF9C                     ; $15C5 ldh a,[a8]
        sta zA                        
                                      ; $15C7 ld b,a
        sta zB                        
        lda $C02A                     ; $15C8 ld a,[a16]
        sta zA                        
        jsr G_1D71                    ; $15CB call a16
        lda $C02A                     ; $15CE ld a,[a16]
        sta zA                        
        jsr G_1DB3                    ; $15D1 call a16
        jsr G_1CF6                    ; $15D4 call a16
        lda $C02A                     ; $15D7 ld a,[a16]
        sta zA                        
        sec                           ; $15DA cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $15DC jr c,pc+r8
        lsr a                         
        bcc _s186                     
        jmp G_15E8                    
_s186
        lda #$90                      ; $15DE ld a,d8
        sta zA                        
                                      ; $15E0 ld [a16],a
        sta $C052                     
        lda #$22                      ; $15E3 ld a,d8
        sta zA                        
                                      ; $15E5 ld [a16],a
        sta $C05C                     
G_15E8
        lda $C035                     ; $15E8 ld a,[a16]
        sta zA                        
                                      ; $15EB ld b,a
        sta zB                        
        lda $C033                     ; $15EC ld a,[a16]
        sta zA                        
        jsr G_1DE7                    ; $15EF call a16
        lda zB                        ; $15F2 ld a,b
        sta zA                        
                                      ; $15F3 ld [a16],a
        sta $C051                     
        lda zA                        ; $15F6 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $15F7 ld [a16],a
        sta $C04F                     
        jsr G_1D22                    ; $15FA call a16
        lda #$10                      ; $15FD ld c,d8
        sta zC                        
        lda #<$C034                   ; $15FF ld hl,d16
        sta zL                        
        lda #>$C034                   
        sta zH                        
        jsr G_1D57                    ; $1602 call a16
        jsr G_1CB1                    ; $1605 call a16
        lda $C038                     ; $1608 ld a,[a16]
        sta zA                        
        sec                           ; $160B cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $160D jr c,pc+r8
        lsr a                         
        bcc _s187                     
        jmp G_1611                    
_s187
        sec                           ; $160F sub d8
        lda zA                        
        sbc #$05                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
G_1611
        lda zA                        ; $1611 ld b,a
        sta zB                        
        lda $C033                     ; $1612 ld a,[a16]
        sta zA                        
        jmp G_165C                    ; $1615 jp a16
G_1618
        lda $FFAD                     ; $1618 ldh a,[a8]
        sta zA                        
                                      ; $161A bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $161C ret z
        bne _s188                     
        rts                           
_s188
        lda zA                        ; $161D bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $161F ret nz
        beq _s189                     
        rts                           
_s189
        jsr G_08A6                    ; $1620 call a16
        lda zA                        ; $1623 ld b,a
        sta zB                        
        jsr G_08BC                    ; $1624 call a16
        sec                           ; $1627 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1628 jr nc,pc+r8
        lsr a                         
        bcs _s190                     
        jmp G_162C                    
_s190
        lda zA                        ; $162A cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $162B inc a
        lda zA                        
        sta zZ                        
G_162C
        sec                           ; $162C cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $162E ret nc
        lsr a                         
        bcs _s191                     
        rts                           
_s191
        jsr G_089B                    ; $162F call a16
        lda zA                        ; $1632 ld b,a
        sta zB                        
        jsr G_08B1                    ; $1633 call a16
        sec                           ; $1636 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1637 jr nc,pc+r8
        lsr a                         
        bcs _s192                     
        jmp G_163B                    
_s192
        lda zA                        ; $1639 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $163A inc a
        lda zA                        
        sta zZ                        
G_163B
        sec                           ; $163B cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $163D ret nc
        lsr a                         
        bcs _s193                     
        rts                           
_s193
        lda $C047                     ; $163E ld a,[a16]
        sta zA                        
        sec                           ; $1641 cp d8
        lda zA                        
        sbc #$34                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1643 ret nc
        lsr a                         
        bcs _s194                     
        rts                           
_s194
        lda $FFAD                     ; $1644 ldh a,[a8]
        sta zA                        
                                      ; $1646 bit 3,a
        and #$08                      
        sta zZ                        
                                      ; $1648 jr z,pc+r8
        bne _s195                     
        jmp G_164E                    
_s195
        lda zA                        ; $164A or d8
        ora #$30                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        jmp G_1652                    ; $164C jr pc+r8
G_164E
        lda zA                        ; $164E or d8
        ora #$38                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1650 ldh [a8],a
        sta $FFAE                     
G_1652
        lda zA                        ; $1652 ldh [a8],a
        sta $FFAD                     
        lda #$0D                      ; $1654 ld a,d8
        sta zA                        
        jsr S_SOUND                   ; $1656 call a16
        jmp G_1C84                    ; $1659 jp a16
G_165C
        lda zA                        ; $165C ldh [a8],a
        sta $FFC5                     
        lda zB                        ; $165E ld a,b
        sta zA                        
                                      ; $165F ldh [a8],a
        sta $FFC6                     
        sec                           ; $1661 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #$06                      ; $1663 ld a,d8
        sta zA                        
        lda zCY                       ; $1665 jr c,pc+r8
        lsr a                         
        bcc _s196                     
        jmp G_1669                    
_s196
        lda #$07                      ; $1667 ld a,d8
        sta zA                        
G_1669
        jsr G_1F42                    ; $1669 call a16
        lda $FFC5                     ; $166C ldh a,[a8]
        sta zA                        
        lda #$00                      ; $166E ld c,d8
        sta zC                        
        lda zA                        ; $1670 bit 1,a
        and #$02                      
        sta zZ                        
                                      ; $1672 jr z,pc+r8
        bne _s197                     
        jmp G_1687                    
_s197
        lda $FFAD                     ; $1674 ldh a,[a8]
        sta zA                        
                                      ; $1676 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $1678 jr z,pc+r8
        bne _s198                     
        jmp G_1687                    
_s198
        lda $FFC6                     ; $167A ldh a,[a8]
        sta zA                        
        sec                           ; $167C cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $167E jr nc,pc+r8
        lsr a                         
        bcs _s199                     
        jmp G_1687                    
_s199
        lda #$2A                      ; $1680 ld a,d8
        sta zA                        
        jsr G_1F42                    ; $1682 call a16
        lda #$2B                      ; $1685 ld c,d8
        sta zC                        
G_1687
        lda zC                        ; $1687 ld a,c
        sta zA                        
                                      ; $1688 ld [a16],a
        sta $C059                     
        lda zA                        ; $168B xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $168C ld [a16],a
        sta $C04C                     
        lda zA                        ; $168F ld [a16],a
        sta $C053                     
        lda #<$C05A                   ; $1692 ld hl,d16
        sta zL                        
        lda #>$C05A                   
        sta zH                        
        lda (zL),y                    ; $1695 inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda $FFAD                     ; $1696 ldh a,[a8]
        sta zA                        
                                      ; $1698 bit 3,a
        and #$08                      
        sta zZ                        
                                      ; $169A jr nz,pc+r8
        beq _s200                     
        jmp G_16A8                    
_s200
        lda $C040                     ; $169C ld a,[a16]
        sta zA                        
        sec                           ; $169F cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $16A1 jr z,pc+r8
        bne _s201                     
        jmp G_16A5                    
_s201
        lda #$03                      ; $16A3 ld a,d8
        sta zA                        
G_16A5
        lda zA                        ; $16A5 ld [a16],a
        sta $C040                     
G_16A8
        lda $C050                     ; $16A8 ld a,[a16]
        sta zA                        
                                      ; $16AB and d8
        and #$7F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16AD ld [a16],a
        sta $C054                     
        lda $C051                     ; $16B0 ld a,[a16]
        sta zA                        
                                      ; $16B3 ld [a16],a
        sta $C055                     
        lda zA                        ; $16B6 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16B7 ld [a16],a
        sta $C056                     
        lda zA                        ; $16BA ld [a16],a
        sta $C057                     
        lda $C051                     ; $16BD ld a,[a16]
        sta zA                        
                                      ; $16C0 ld h,a
        sta zH                        
        lda #$00                      ; $16C1 ld l,d8
        sta zL                        
        lda $C059                     ; $16C3 ld a,[a16]
        sta zA                        
                                      ; $16C6 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda #$48                      ; $16C7 ld a,d8
        sta zA                        
        lda zZ                        ; $16C9 jr z,pc+r8
        bne _s202                     
        jmp G_16CD                    
_s202
        lda #$28                      ; $16CB ld a,d8
        sta zA                        
G_16CD
        jsr G_3143                    ; $16CD call a16
        lda zH                        ; $16D0 ld a,h
        sta zA                        
                                      ; $16D1 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $16D2 jr nz,pc+r8
        beq _s203                     
        jmp G_16D7                    
_s203
        lda #<$00F8                   ; $16D4 ld hl,d16
        sta zL                        
        lda #>$00F8                   
        sta zH                        
G_16D7
        lda zL                        ; $16D7 ld a,l
        sta zA                        
                                      ; $16D8 ld [a16],a
        sta $C05D                     
        lda zA                        ; $16DB swap a
        asl a                         
        adc #$80                      
        rol a                         
        asl a                         
        adc #$80                      
        rol a                         
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16DD and d8
        and #$0F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16DF ld l,a
        sta zL                        
        lda zH                        ; $16E0 ld a,h
        sta zA                        
                                      ; $16E1 ld [a16],a
        sta $C05E                     
        lda zA                        ; $16E4 swap a
        asl a                         
        adc #$80                      
        rol a                         
        asl a                         
        adc #$80                      
        rol a                         
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16E6 and d8
        and #$F0                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16E8 or l
        ora zL                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16E9 ld [a16],a
        sta $C058                     
        lda zA                        ; $16EC xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16ED ld [a16],a
        sta $C05F                     
        lda $FFAD                     ; $16F0 ldh a,[a8]
        sta zA                        
                                      ; $16F2 xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $16F4 set 6,a
        ora #$40                      
        sta zA                        
                                      ; $16F6 ldh [a8],a
        sta $FFAD                     
        rts                           ; $16F8 ret
G_16F9
        lda zA                        ; $16F9 ld [a16],a
        sta $C045                     
        lda #$10                      ; $16FC ld a,d8
        sta zA                        
                                      ; $16FE ld [a16],a
        sta $C047                     
        lda zA                        ; $1701 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1702 ld [a16],a
        sta $C04C                     
        lda zA                        ; $1705 ld [a16],a
        sta $C05A                     
        lda zA                        ; $1708 ld [a16],a
        sta $C05F                     
        lda #<$C050                   ; $170B ld hl,d16
        sta zL                        
        lda #>$C050                   
        sta zH                        
        lda zA                        ; $170E ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s204                     
        inc zH                        
_s204
        lda zA                        ; $170F ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s205                     
        inc zH                        
_s205
        lda #$44                      ; $1710 ld a,d8
        sta zA                        
                                      ; $1712 ld [hl],a
        sta (zL),y                    
        lda #$14                      ; $1713 ld a,d8
        sta zA                        
                                      ; $1715 ld [a16],a
        sta $C058                     
        lda #<$C05D                   ; $1718 ld hl,d16
        sta zL                        
        lda #>$C05D                   
        sta zH                        
        lda #$40                      ; $171B ld a,d8
        sta zA                        
                                      ; $171D ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s206                     
        inc zH                        
_s206
        lda #$01                      ; $171E ld a,d8
        sta zA                        
                                      ; $1720 ld [hl],a
        sta (zL),y                    
        rts                           ; $1721 ret
G_1722
        lda zA                        ; $1722 ld b,a
        sta zB                        
        jsr G_08BC                    ; $1723 call a16
        sec                           ; $1726 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1727 jr nc,pc+r8
        lsr a                         
        bcs _s207                     
        jmp G_172B                    
_s207
        lda zA                        ; $1729 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $172A inc a
        lda zA                        
        sta zZ                        
G_172B
        lda zA                        ; $172B ld h,a
        sta zH                        
        lda #$00                      ; $172C ld l,d8
        sta zL                        
        lda #$00                      ; $172E ld d,d8
        sta zD                        
        lda $C051                     ; $1730 ld a,[a16]
        sta zA                        
                                      ; $1733 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1735 rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1737 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1739 rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $173B ld e,a
        sta zE                        
        jsr S_DIV                     ; $173C call a16
        lda #$00                      ; $173F ld d,d8
        sta zD                        
        lda $C050                     ; $1741 ld a,[a16]
        sta zA                        
                                      ; $1744 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1746 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1748 rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $174A ld e,a
        sta zE                        
        jsr G_3120                    ; $174B call a16
        lda $C050                     ; $174E ld a,[a16]
        sta zA                        
                                      ; $1751 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1753 jr nz,pc+r8
        beq _s208                     
        jmp G_1760                    
_s208
        lda $C044                     ; $1755 ld a,[a16]
        sta zA                        
        clc                           ; $1758 add l
        lda zA                        
        adc zL                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1759 ld l,a
        sta zL                        
        lda $C045                     ; $175A ld a,[a16]
        sta zA                        
        lda zCY                       ; $175D adc h
        lsr a                         
        lda zA                        
        adc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $175E ld h,a
        sta zH                        
        rts                           ; $175F ret
G_1760
        lda $C044                     ; $1760 ld a,[a16]
        sta zA                        
        sec                           ; $1763 sub l
        lda zA                        
        sbc zL                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1764 ld l,a
        sta zL                        
        lda $C045                     ; $1765 ld a,[a16]
        sta zA                        
        lda zCY                       ; $1768 sbc h
        eor #1                        
        lsr a                         
        lda zA                        
        sbc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1769 ld h,a
        sta zH                        
        rts                           ; $176A ret
G_176B
        lda $C052                     ; $176B ld a,[a16]
        sta zA                        
                                      ; $176E bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1770 jr z,pc+r8
        bne _s209                     
        jmp G_1789                    
_s209
        lda #$38                      ; $1772 ld b,d8
        sta zB                        
        lda $FF96                     ; $1774 ldh a,[a8]
        sta zA                        
                                      ; $1776 bit 7,a
        and #$80                      
        sta zZ                        
        lda $C043                     ; $1778 ld a,[a16]
        sta zA                        
        lda zZ                        ; $177B jr z,pc+r8
        bne _s210                     
        jmp G_1780                    
_s210
        lda zA                        ; $177D ld b,a
        sta zB                        
        lda #$B8                      ; $177E ld a,d8
        sta zA                        
G_1780
        sec                           ; $1780 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1781 jr nc,pc+r8
        lsr a                         
        bcs _s211                     
        jmp G_178B                    
_s211
        lda $C04C                     ; $1783 ld a,[a16]
        sta zA                        
                                      ; $1786 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1787 jr z,pc+r8
        bne _s212                     
        jmp G_179E                    
_s212
G_1789
        lda zA                        ; $1789 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        rts                           ; $178A ret
G_178B
        lda zA                        ; $178B ld h,a
        sta zH                        
        sec                           ; $178C cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $178E jr nc,pc+r8
        lsr a                         
        bcs _s213                     
        jmp G_1789                    
_s213
        lda $C04C                     ; $1790 ld a,[a16]
        sta zA                        
                                      ; $1793 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1794 jr nz,pc+r8
        beq _s214                     
        jmp G_1789                    
_s214
        lda zH                        ; $1796 sla h
        asl a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda $C047                     ; $1798 ld a,[a16]
        sta zA                        
        sec                           ; $179B cp h
        lda zA                        
        sbc zH                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $179C jr c,pc+r8
        lsr a                         
        bcc _s215                     
        jmp G_1789                    
_s215
G_179E
        lda #1                        ; $179E scf
        sta zCY                       
        rts                           ; $179F ret
G_17A0
        lda $C060                     ; $17A0 ld a,[a16]
        sta zA                        
                                      ; $17A3 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $17A4 jr z,pc+r8
        bne _s216                     
        jmp G_17AA                    
_s216
        dec zA                        ; $17A6 dec a
        lda zA                        
        sta zZ                        
        lda zA                        ; $17A7 ld [a16],a
        sta $C060                     
G_17AA
        lda $C040                     ; $17AA ld a,[a16]
        sta zA                        
        jsr G_RST08                   ; $17AD rst vec
        .word G_17C2, G_17DD, G_17EA, G_1800, G_184F, G_189B, G_18A1, G_18A7, G_18C4, G_18E1
G_17C2
        lda zA                        ; $17C2 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $17C3 ld [a16],a
        sta $C050                     
        lda zA                        ; $17C6 ld [a16],a
        sta $C051                     
        lda zA                        ; $17C9 ld [a16],a
        sta $C052                     
        lda zA                        ; $17CC ld [a16],a
        sta $C046                     
        jmp G_17CF          ; continuité du code GB
G_17CD
        lda (zL),y                    ; $17CD ld b,[hl]
        sta zB                        
        lda zZ                        ; $17CE ret nz
        beq _s217                     
        rts                           
_s217
G_17CF
        lda zA                        ; $17CF ld [a16],a
        sta $C041                     
        lda zA                        ; $17D2 ld [a16],a
        sta $C060                     
        inc zA                        ; $17D5 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $17D6 ld [a16],a
        sta $C047                     
        lda zA                        ; $17D9 ld [a16],a
        sta $C040                     
        rts                           ; $17DC ret
G_17DD
        jsr G_18F3                    ; $17DD call a16
        lda $C047                     ; $17E0 ld a,[a16]
        sta zA                        
                                      ; $17E3 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $17E4 ret nz
        beq _s218                     
        rts                           
_s218
        lda #$03                      ; $17E5 ld a,d8
        sta zA                        
        jmp G_1F42                    ; $17E7 jp a16
G_17EA
        jsr G_18E4                    ; $17EA call a16
        lda $C04C                     ; $17ED ld a,[a16]
        sta zA                        
                                      ; $17F0 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $17F1 ret z
        bne _s219                     
        rts                           
_s219
        jsr G_1EE1                    ; $17F2 call a16
        lda #<$FFAD                   ; $17F5 ld hl,d16
        sta zL                        
        lda #>$FFAD                   
        sta zH                        
        lda (zL),y                    ; $17F8 set 5,[hl]
        ora #$20                      
        sta (zL),y                    
        lda #$05                      ; $17FA ld a,d8
        sta zA                        
                                      ; $17FC ld [a16],a
        sta $C040                     
        rts                           ; $17FF ret
G_1800
        lda #<$FFAD                   ; $1800 ld hl,d16
        sta zL                        
        lda #>$FFAD                   
        sta zH                        
        lda (zL),y                    ; $1803 set 5,[hl]
        ora #$20                      
        sta (zL),y                    
        jsr G_18E4                    ; $1805 call a16
        lda $C04C                     ; $1808 ld a,[a16]
        sta zA                        
        sec                           ; $180B cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $180D ret nz
        beq _s220                     
        rts                           
_s220
        jsr G_1ECB                    ; $180E call a16
        lda $C047                     ; $1811 ld a,[a16]
        sta zA                        
                                      ; $1814 ld b,a
        sta zB                        
        lda $C046                     ; $1815 ld a,[a16]
        sta zA                        
                                      ; $1818 or b
        ora zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1819 ret nz
        beq _s221                     
        rts                           
_s221
        lda #$0E                      ; $181A ld b,d8
        sta zB                        
        lda $FFAD                     ; $181C ldh a,[a8]
        sta zA                        
                                      ; $181E bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1820 jr z,pc+r8
        bne _s222                     
        jmp G_1824                    
_s222
        lda #$0C                      ; $1822 ld b,d8
        sta zB                        
G_1824
        lda $FF91                     ; $1824 ldh a,[a8]
        sta zA                        
                                      ; $1826 bit 1,a
        and #$02                      
        sta zZ                        
                                      ; $1828 jr z,pc+r8
        bne _s223                     
        jmp G_182B                    
_s223
        inc zB                        ; $182A inc b
        lda zB                        
        sta zZ                        
G_182B
        lda $C04B                     ; $182B ld a,[a16]
        sta zA                        
                                      ; $182E ld [a16],a
        sta $C04D                     
        sec                           ; $1831 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1832 jr nz,pc+r8
        beq _s224                     
        jmp G_1844                    
_s224
        lda $C053                     ; $1834 ld a,[a16]
        sta zA                        
                                      ; $1837 bit 7,a
        and #$80                      
        sta zZ                        
        lda #$06                      ; $1839 ld a,d8
        sta zA                        
        lda zZ                        ; $183B jr nz,pc+r8
        beq _s225                     
        jmp G_1846                    
_s225
        jsr G_1EF0                    ; $183D call a16
        lda #$04                      ; $1840 ld a,d8
        sta zA                        
        jmp G_1846                    ; $1842 jr pc+r8
G_1844
        lda #$05                      ; $1844 ld a,d8
        sta zA                        
G_1846
        lda zA                        ; $1846 ld [a16],a
        sta $C040                     
        lda #<$FFAD                   ; $1849 ld hl,d16
        sta zL                        
        lda #>$FFAD                   
        sta zH                        
        lda (zL),y                    ; $184C res 5,[hl]
        and #$DF                      
        sta (zL),y                    
        rts                           ; $184E ret
G_184F
        jsr G_18E4                    ; $184F call a16
        lda $C041                     ; $1852 ld a,[a16]
        sta zA                        
                                      ; $1855 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1856 jr z,pc+r8
        bne _s226                     
        jmp G_1861                    
_s226
        dec zA                        ; $1858 dec a
        lda zA                        
        sta zZ                        
        lda zA                        ; $1859 ld [a16],a
        sta $C041                     
        lda zZ                        ; $185C ret nz
        beq _s227                     
        rts                           
_s227
        lda #$09                      ; $185D ld a,d8
        sta zA                        
        jmp G_188E                    ; $185F jr pc+r8
G_1861
        lda $C04C                     ; $1861 ld a,[a16]
        sta zA                        
        sec                           ; $1864 cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1866 jr nz,pc+r8
        beq _s228                     
        jmp G_1892                    
_s228
        lda $C047                     ; $1868 ld a,[a16]
        sta zA                        
                                      ; $186B ld b,a
        sta zB                        
        lda $C046                     ; $186C ld a,[a16]
        sta zA                        
                                      ; $186F or b
        ora zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1870 ret nz
        beq _s229                     
        rts                           
_s229
        lda $C04B                     ; $1871 ld a,[a16]
        sta zA                        
                                      ; $1874 ld [a16],a
        sta $C04D                     
        lda zA                        ; $1877 bit 1,a
        and #$02                      
        sta zZ                        
        lda #$00                      ; $1879 ld b,d8
        sta zB                        
        lda zZ                        ; $187B jr z,pc+r8
        bne _s230                     
        jmp G_187F                    
_s230
        lda #$80                      ; $187D ld b,d8
        sta zB                        
G_187F
        lda $FFAD                     ; $187F ldh a,[a8]
        sta zA                        
                                      ; $1881 xor b
        eor zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1882 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1884 jr z,pc+r8
        bne _s231                     
        jmp G_1895                    
_s231
        lda $C04D                     ; $1886 ld a,[a16]
        sta zA                        
                                      ; $1889 bit 3,a
        and #$08                      
        sta zZ                        
                                      ; $188B ret nz
        beq _s232                     
        rts                           
_s232
        lda #$07                      ; $188C ld a,d8
        sta zA                        
G_188E
        lda zA                        ; $188E ld [a16],a
        sta $C040                     
        rts                           ; $1891 ret
G_1892
        sec                           ; $1892 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1894 ret c
        lsr a                         
        bcc _s233                     
        rts                           
_s233
G_1895
        lda #$3C                      ; $1895 ld a,d8
        sta zA                        
                                      ; $1897 ld [a16],a
        sta $C041                     
        rts                           ; $189A ret
G_189B
        lda #$5A                      ; $189B ld b,d8
        sta zB                        
        lda #$C4                      ; $189D ld a,d8
        sta zA                        
        jmp G_18AB                    ; $189F jr pc+r8
G_18A1
        lda #$5A                      ; $18A1 ld b,d8
        sta zB                        
        lda #$C5                      ; $18A3 ld a,d8
        sta zA                        
        jmp G_18AB                    ; $18A5 jr pc+r8
G_18A7
        lda #$96                      ; $18A7 ld b,d8
        sta zB                        
        lda #$C6                      ; $18A9 ld a,d8
        sta zA                        
G_18AB
        lda #<$FFAD                   ; $18AB ld hl,d16
        sta zL                        
        lda #>$FFAD                   
        sta zH                        
        lda (zL),y                    ; $18AE bit 3,[hl]
        and #$08                      
        sta zZ                        
                                      ; $18B0 jr nz,pc+r8
        beq _s234                     
        jmp G_18B8                    
_s234
        lda zA                        ; $18B2 ldh [a8],a
        sta $FFC2                     
        lda (zL),y                    ; $18B4 set 3,[hl]
        ora #$08                      
        sta (zL),y                    
                                      ; $18B6 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s235                     
        inc zH                        
_s235
        lda zA                        ; $18B7 ld [hl],a
        sta (zL),y                    
G_18B8
        lda zB                        ; $18B8 ld a,b
        sta zA                        
                                      ; $18B9 ld [a16],a
        sta $C05B                     
        lda #$08                      ; $18BC ld a,d8
        sta zA                        
                                      ; $18BE ld [a16],a
        sta $C040                     
        jmp G_18E4                    ; $18C1 jp a16
G_18C4
        jsr G_18E4                    ; $18C4 call a16
        lda $C05B                     ; $18C7 ld a,[a16]
        sta zA                        
        dec zA                        ; $18CA dec a
        lda zA                        
        sta zZ                        
        lda zA                        ; $18CB ld [a16],a
        sta $C05B                     
        sec                           ; $18CE cp d8
        lda zA                        
        sbc #$1E                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $18D0 ret nc
        lsr a                         
        bcs _s236                     
        rts                           
_s236
        lda #<$FFC2                   ; $18D1 ld hl,d16
        sta zL                        
        lda #>$FFC2                   
        sta zH                        
        lda (zL),y                    ; $18D4 res 6,[hl]
        and #$BF                      
        sta (zL),y                    
        lda $C05B                     ; $18D6 ld a,[a16]
        sta zA                        
                                      ; $18D9 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $18DA ret nz
        beq _s237                     
        rts                           
_s237
        lda #$09                      ; $18DB ld a,d8
        sta zA                        
                                      ; $18DD ld [a16],a
        sta $C040                     
        rts                           ; $18E0 ret
G_18E1
        jmp G_18E4                    ; $18E1 jp a16
G_18E4
        jsr G_18FE                    ; $18E4 call a16
        jsr G_1945                    ; $18E7 call a16
        jsr G_19AC                    ; $18EA call a16
        jsr G_1B17                    ; $18ED call a16
        jsr G_1C27                    ; $18F0 call a16
G_18F3
        lda #<$C042                   ; $18F3 ld hl,d16
        sta zL                        
        lda #>$C042                   
        sta zH                        
        jsr G_09FA                    ; $18F6 call a16
        lda zC                        ; $18F9 ld a,c
        sta zA                        
                                      ; $18FA ld [a16],a
        sta $C04B                     
        rts                           ; $18FD ret
G_18FE
        lda #<$C044                   ; $18FE ld hl,d16
        sta zL                        
        lda #>$C044                   
        sta zH                        
        lda (zL),y                    ; $1901 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s238                     
        inc zH                        
_s238
        lda (zL),y                    ; $1902 ld h,[hl]
        sta zH                        
        lda zA                        ; $1903 ld l,a
        sta zL                        
        lda #$00                      ; $1904 ld b,d8
        sta zB                        
        lda $C050                     ; $1906 ld a,[a16]
        sta zA                        
                                      ; $1909 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $190B jr nz,pc+r8
        beq _s239                     
        jmp G_1926                    
_s239
        lda zA                        ; $190D sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $190F sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1911 rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1913 ld c,a
        sta zC                        
        clc                           ; $1914 add hl,bc
        lda zL                        
        adc zC                        
        sta zL                        
        lda zH                        
        adc zB                        
        sta zH                        
        rol zCY                       
        lda #<$D001                   ; $1915 ld de,d16
        sta zE                        
        lda #>$D001                   
        sta zD                        
        jsr G_00C3                    ; $1918 call a16
        lda zCY                       ; $191B jr nc,pc+r8
        lsr a                         
        bcs _s240                     
        jmp G_193B                    
_s240
G_191D
        lda zL                        ; $191D ld a,l
        sta zA                        
                                      ; $191E ld [a16],a
        sta $C044                     
        lda zH                        ; $1921 ld a,h
        sta zA                        
                                      ; $1922 ld [a16],a
        sta $C045                     
        rts                           ; $1925 ret
G_1926
        lda zA                        ; $1926 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1928 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $192A rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $192C ld c,a
        sta zC                        
        lda zL                        ; $192D ld a,l
        sta zA                        
        lda zCY                       ; $192E sbc c
        eor #1                        
        lsr a                         
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $192F ld l,a
        sta zL                        
        lda zH                        ; $1930 ld a,h
        sta zA                        
        lda zCY                       ; $1931 sbc b
        eor #1                        
        lsr a                         
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1932 ld h,a
        sta zH                        
        lda #<$07FF                   ; $1933 ld de,d16
        sta zE                        
        lda #>$07FF                   
        sta zD                        
        jsr G_00C3                    ; $1936 call a16
        lda zCY                       ; $1939 jr nc,pc+r8
        lsr a                         
        bcs _s241                     
        jmp G_191D                    
_s241
G_193B
        lda $C050                     ; $193B ld a,[a16]
        sta zA                        
                                      ; $193E xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1940 ld [a16],a
        sta $C050                     
        jmp G_1991                    ; $1943 jr pc+r8
G_1945
        lda #<$C042                   ; $1945 ld hl,d16
        sta zL                        
        lda #>$C042                   
        sta zH                        
        lda (zL),y                    ; $1948 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s242                     
        inc zH                        
_s242
        lda (zL),y                    ; $1949 ld h,[hl]
        sta zH                        
        lda zA                        ; $194A ld l,a
        sta zL                        
        lda #$00                      ; $194B ld b,d8
        sta zB                        
        lda $C04F                     ; $194D ld a,[a16]
        sta zA                        
                                      ; $1950 bit 7,a
        and #$80                      
        sta zZ                        
        lda $C051                     ; $1952 ld a,[a16]
        sta zA                        
        lda zZ                        ; $1955 jr nz,pc+r8
        beq _s243                     
        jmp G_1972                    
_s243
        lda zA                        ; $1957 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1959 rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $195B sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $195D rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $195F ld c,a
        sta zC                        
        clc                           ; $1960 add hl,bc
        lda zL                        
        adc zC                        
        sta zL                        
        lda zH                        
        adc zB                        
        sta zH                        
        rol zCY                       
        lda #<$E701                   ; $1961 ld de,d16
        sta zE                        
        lda #>$E701                   
        sta zD                        
        jsr G_00C3                    ; $1964 call a16
        lda zCY                       ; $1967 jr nc,pc+r8
        lsr a                         
        bcs _s244                     
        jmp G_1989                    
_s244
G_1969
        lda zL                        ; $1969 ld a,l
        sta zA                        
                                      ; $196A ld [a16],a
        sta $C042                     
        lda zH                        ; $196D ld a,h
        sta zA                        
                                      ; $196E ld [a16],a
        sta $C043                     
        rts                           ; $1971 ret
G_1972
        lda zA                        ; $1972 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1974 rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1976 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1978 rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $197A ld c,a
        sta zC                        
        lda zL                        ; $197B ld a,l
        sta zA                        
        lda zCY                       ; $197C sbc c
        eor #1                        
        lsr a                         
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $197D ld l,a
        sta zL                        
        lda zH                        ; $197E ld a,h
        sta zA                        
        lda zCY                       ; $197F sbc b
        eor #1                        
        lsr a                         
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1980 ld h,a
        sta zH                        
        lda #<$08FF                   ; $1981 ld de,d16
        sta zE                        
        lda #>$08FF                   
        sta zD                        
        jsr G_00C3                    ; $1984 call a16
        lda zCY                       ; $1987 jr nc,pc+r8
        lsr a                         
        bcs _s245                     
        jmp G_1969                    
_s245
G_1989
        lda $C04F                     ; $1989 ld a,[a16]
        sta zA                        
                                      ; $198C xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $198E ld [a16],a
        sta $C04F                     
G_1991
        lda $C050                     ; $1991 ld a,[a16]
        sta zA                        
                                      ; $1994 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1996 and d8
        and #$BF                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1998 ld [a16],a
        sta $C050                     
        lda $C051                     ; $199B ld a,[a16]
        sta zA                        
                                      ; $199E srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $19A0 ld [a16],a
        sta $C051                     
        lda zA                        ; $19A3 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $19A4 ld [a16],a
        sta $C053                     
        lda #$04                      ; $19A7 ld a,d8
        sta zA                        
        jmp G_1F42                    ; $19A9 jp a16
G_19AC
        lda #<$C05D                   ; $19AC ld hl,d16
        sta zL                        
        lda #>$C05D                   
        sta zH                        
        lda $C052                     ; $19AF ld a,[a16]
        sta zA                        
                                      ; $19B2 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $19B4 jr nz,pc+r8
        beq _s246                     
        jmp G_1A18                    
_s246
        lda $C05F                     ; $19B6 ld a,[a16]
        sta zA                        
        sec                           ; $19B9 sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $19BA ld [a16],a
        sta $C05F                     
        lda zA                        ; $19BD ld c,a
        sta zC                        
        inc zL                        ; $19BE inc hl
        bne _s247                     
        inc zH                        
_s247
        lda $C052                     ; $19BF ld a,[a16]
        sta zA                        
        lda zCY                       ; $19C2 sbc [hl]
        eor #1                        
        lsr a                         
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $19C3 jr nc,pc+r8
        lsr a                         
        bcs _s248                     
        jmp G_19D2                    
_s248
        lda #$80                      ; $19C5 ld a,d8
        sta zA                        
                                      ; $19C7 ld [a16],a
        sta $C052                     
        lda $C059                     ; $19CA ld a,[a16]
        sta zA                        
                                      ; $19CD and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $19CE ret z
        bne _s249                     
        rts                           
_s249
        jmp G_1F42                    ; $19CF jp a16
G_19D2
        lda zA                        ; $19D2 ld [a16],a
        sta $C052                     
        lda #$00                      ; $19D5 ld b,d8
        sta zB                        
        lda #<(G_19E9-1)              ; $19D7 ld hl,d16
        sta zL                        
        lda #>(G_19E9-1)              
        sta zH                        
                                      ; $19DA push hl
        pha                           
        lda zL                        
        pha                           
        lda $C05C                     ; $19DB ld a,[a16]
        sta zA                        
                                      ; $19DE swap a
        asl a                         
        adc #$80                      
        rol a                         
        asl a                         
        adc #$80                      
        rol a                         
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $19E0 and d8
        and #$0F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        jsr G_RST08                   ; $19E2 rst vec
        .word G_1AE5, G_1B01, G_1B0F
G_19E9
        lda zA                        ; $19E9 ld l,a
        sta zL                        
        lda zB                        ; $19EA ld h,b
        sta zH                        
        lda $C058                     ; $19EB ld a,[a16]
        sta zA                        
        jsr S_MUL                     ; $19EE call a16
        lda zC                        ; $19F1 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $19F3 rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $19F5 rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $19F7 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $19F9 rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $19FB rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $19FD srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $19FF rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A01 rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1A03 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A05 rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A07 rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda $C046                     ; $1A09 ld a,[a16]
        sta zA                        
        clc                           ; $1A0C add l
        lda zA                        
        adc zL                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1A0D ld [a16],a
        sta $C046                     
        lda $C047                     ; $1A10 ld a,[a16]
        sta zA                        
        lda zCY                       ; $1A13 adc h
        lsr a                         
        lda zA                        
        adc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1A14 ld [a16],a
        sta $C047                     
        rts                           ; $1A17 ret
G_1A18
        lda $C05F                     ; $1A18 ld a,[a16]
        sta zA                        
        clc                           ; $1A1B add [hl]
        lda zA                        
        adc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1A1C ld [a16],a
        sta $C05F                     
        lda zA                        ; $1A1F ld c,a
        sta zC                        
        inc zL                        ; $1A20 inc hl
        bne _s250                     
        inc zH                        
_s250
        lda $C052                     ; $1A21 ld a,[a16]
        sta zA                        
        lda zCY                       ; $1A24 adc [hl]
        lsr a                         
        lda zA                        
        adc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1A25 ld [a16],a
        sta $C052                     
        lda #$00                      ; $1A28 ld b,d8
        sta zB                        
        lda #<(G_1A3A-1)              ; $1A2A ld hl,d16
        sta zL                        
        lda #>(G_1A3A-1)              
        sta zH                        
                                      ; $1A2D push hl
        pha                           
        lda zL                        
        pha                           
        lda $C05C                     ; $1A2E ld a,[a16]
        sta zA                        
                                      ; $1A31 and d8
        and #$0F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        jsr G_RST08                   ; $1A33 rst vec
        .word G_1AE5, G_1ACD, G_1AC3
G_1A3A
        lda zA                        ; $1A3A ld l,a
        sta zL                        
        lda zB                        ; $1A3B ld h,b
        sta zH                        
        lda $C058                     ; $1A3C ld a,[a16]
        sta zA                        
        jsr S_MUL                     ; $1A3F call a16
        lda zC                        ; $1A42 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A44 rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A46 rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1A48 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A4A rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A4C rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1A4E srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A50 rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A52 rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1A54 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A56 rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1A58 rr l
        lsr a                         
        lda zL                        
        ror a                         
        sta zL                        
        sta zZ                        
        rol zCY                       
        lda $C046                     ; $1A5A ld a,[a16]
        sta zA                        
        sec                           ; $1A5D sub l
        lda zA                        
        sbc zL                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1A5E ld [a16],a
        sta $C046                     
        lda zA                        ; $1A61 ld c,a
        sta zC                        
        lda $C047                     ; $1A62 ld a,[a16]
        sta zA                        
        lda zCY                       ; $1A65 sbc h
        eor #1                        
        lsr a                         
        lda zA                        
        sbc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1A66 ld [a16],a
        sta $C047                     
        lda zCY                       ; $1A69 jr c,pc+r8
        lsr a                         
        bcc _s251                     
        jmp G_1A6D                    
_s251
        lda zA                        ; $1A6B or c
        ora zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1A6C ret nz
        beq _s252                     
        rts                           
_s252
G_1A6D
        lda zA                        ; $1A6D xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1A6E ld [a16],a
        sta $C046                     
        lda zA                        ; $1A71 ld [a16],a
        sta $C047                     
        lda #<$C04C                   ; $1A74 ld hl,d16
        sta zL                        
        lda #>$C04C                   
        sta zH                        
        lda (zL),y                    ; $1A77 inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda (zL),y                    ; $1A78 ld a,[hl]
        sta zA                        
        sec                           ; $1A79 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1A7B jr c,pc+r8
        lsr a                         
        bcc _s253                     
        jmp G_1A83                    
_s253
        lda $FFAD                     ; $1A7D ldh a,[a8]
        sta zA                        
                                      ; $1A7F set 5,a
        ora #$20                      
        sta zA                        
                                      ; $1A81 ldh [a8],a
        sta $FFAD                     
G_1A83
        lda zA                        ; $1A83 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1A84 ld [a16],a
        sta $C059                     
        lda $C04C                     ; $1A87 ld a,[a16]
        sta zA                        
        sec                           ; $1A8A cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1A8C jr nc,pc+r8
        lsr a                         
        bcs _s254                     
        jmp G_1AA6                    
_s254
        lda #$1C                      ; $1A8E ld a,d8
        sta zA                        
                                      ; $1A90 ld [a16],a
        sta $C060                     
        lda #<$C042                   ; $1A93 ld hl,d16
        sta zL                        
        lda #>$C042                   
        sta zH                        
        lda #<$C062                   ; $1A96 ld de,d16
        sta zE                        
        lda #>$C062                   
        sta zD                        
        lda #$04                      ; $1A99 ld b,d8
        sta zB                        
G_1A9B
        lda (zL),y                    ; $1A9B ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s255                     
        inc zH                        
_s255
        lda zA                        ; $1A9C ld [de],a
        sta (zE),y                    
        inc zE                        ; $1A9D inc e
        lda zE                        
        sta zZ                        
        dec zB                        ; $1A9E dec b
        lda zB                        
        sta zZ                        
                                      ; $1A9F jr nz,pc+r8
        beq _s256                     
        jmp G_1A9B                    
_s256
        lda #$03                      ; $1AA1 ld a,d8
        sta zA                        
        jsr G_1F42                    ; $1AA3 call a16
G_1AA6
        lda $C052                     ; $1AA6 ld a,[a16]
        sta zA                        
                                      ; $1AA9 and d8
        and #$7F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1AAB ld b,a
        sta zB                        
        lda zA                        ; $1AAC srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1AAE srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1AB0 ld c,a
        sta zC                        
        lda zB                        ; $1AB1 ld a,b
        sta zA                        
        sec                           ; $1AB2 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1AB3 jr nc,pc+r8
        lsr a                         
        bcs _s257                     
        jmp G_1AB6                    
_s257
        lda zA                        ; $1AB5 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
G_1AB6
        lda zA                        ; $1AB6 ld b,a
        sta zB                        
        lda $C052                     ; $1AB7 ld a,[a16]
        sta zA                        
                                      ; $1ABA and d8
        and #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1ABC xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1ABE or b
        ora zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1ABF ld [a16],a
        sta $C052                     
        rts                           ; $1AC2 ret
G_1AC3
        jsr G_1AEF                    ; $1AC3 call a16
        lda zC                        ; $1AC6 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AC8 rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1ACA rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        rts                           ; $1ACC ret
G_1ACD
        lda $C052                     ; $1ACD ld a,[a16]
        sta zA                        
        lda zC                        ; $1AD0 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AD2 rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1AD4 ld e,a
        sta zE                        
        lda zC                        ; $1AD5 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AD7 rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AD9 rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1ADB sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1ADD rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1ADF rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1AE1 add e
        lda zA                        
        adc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AE2 ret nc
        lsr a                         
        bcs _s258                     
        rts                           
_s258
        inc zB                        ; $1AE3 inc b
        lda zB                        
        sta zZ                        
        rts                           ; $1AE4 ret
G_1AE5
        jsr G_1B01                    ; $1AE5 call a16
        lda zC                        ; $1AE8 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AEA rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AEC rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        rts                           ; $1AEE ret
G_1AEF
        lda $C052                     ; $1AEF ld a,[a16]
        sta zA                        
        lda zC                        ; $1AF2 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AF4 rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1AF6 ld e,a
        sta zE                        
        lda zC                        ; $1AF7 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AF9 rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AFB rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1AFD add e
        lda zA                        
        adc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1AFE ret nc
        lsr a                         
        bcs _s259                     
        rts                           
_s259
        inc zB                        ; $1AFF inc b
        lda zB                        
        sta zZ                        
        rts                           ; $1B00 ret
G_1B01
        lda $C052                     ; $1B01 ld a,[a16]
        sta zA                        
        lda zC                        ; $1B04 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1B06 rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1B08 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1B0A rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1B0C rl b
        lsr a                         
        lda zB                        
        rol a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        rts                           ; $1B0E ret
G_1B0F
        lda $C052                     ; $1B0F ld a,[a16]
        sta zA                        
        lda zC                        ; $1B12 sla c
        asl a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1B14 rl a
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $1B16 ret
G_1B17
        lda $C050                     ; $1B17 ld a,[a16]
        sta zA                        
                                      ; $1B1A and d8
        and #$7F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1B1C ld b,a
        sta zB                        
        lda $C054                     ; $1B1D ld a,[a16]
        sta zA                        
                                      ; $1B20 ld c,a
        sta zC                        
        lda $C056                     ; $1B21 ld a,[a16]
        sta zA                        
        sec                           ; $1B24 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1B25 ld c,a
        sta zC                        
        lda zB                        ; $1B26 ld a,b
        sta zA                        
        lda zCY                       ; $1B27 sbc d8
        eor #1                        
        lsr a                         
        lda zA                        
        sbc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1B29 jr c,pc+r8
        lsr a                         
        bcc _s260                     
        jmp G_1B39                    
_s260
        lda zA                        ; $1B2B ld b,a
        sta zB                        
        lda zC                        ; $1B2C ld a,c
        sta zA                        
                                      ; $1B2D ld [a16],a
        sta $C056                     
        lda $C050                     ; $1B30 ld a,[a16]
        sta zA                        
                                      ; $1B33 and d8
        and #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1B35 or b
        ora zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1B36 ld [a16],a
        sta $C050                     
G_1B39
        lda $C055                     ; $1B39 ld a,[a16]
        sta zA                        
                                      ; $1B3C ld c,a
        sta zC                        
        lda $C057                     ; $1B3D ld a,[a16]
        sta zA                        
        sec                           ; $1B40 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1B41 ld c,a
        sta zC                        
        lda $C051                     ; $1B42 ld a,[a16]
        sta zA                        
        lda zCY                       ; $1B45 sbc d8
        eor #1                        
        lsr a                         
        lda zA                        
        sbc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1B47 ret c
        lsr a                         
        bcc _s261                     
        rts                           
_s261
        lda zA                        ; $1B48 ld [a16],a
        sta $C051                     
        lda zC                        ; $1B4B ld a,c
        sta zA                        
                                      ; $1B4C ld [a16],a
        sta $C057                     
        rts                           ; $1B4F ret
G_1BEF
        lda (zL),y                    ; $1BEF ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s262                     
        inc zH                        
_s262
        lda (zL),y                    ; $1BF0 ld d,[hl]
        sta zD                        
        lda zA                        ; $1BF1 ld e,a
        sta zE                        
        lda #<$C044                   ; $1BF2 ld hl,d16
        sta zL                        
        lda #>$C044                   
        sta zH                        
        lda (zL),y                    ; $1BF5 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s263                     
        inc zH                        
_s263
        lda (zL),y                    ; $1BF6 ld h,[hl]
        sta zH                        
        lda zA                        ; $1BF7 ld l,a
        sta zL                        
        jsr G_00C3                    ; $1BF8 call a16
        lda zCY                       ; $1BFB jr nc,pc+r8
        lsr a                         
        bcs _s264                     
        jmp G_1BFE                    
_s264
        lda zE                        ; $1BFD dec de
        bne _s265                     
        dec zD                        
_s265
        dec zE                        
G_1BFE
        lda #$80                      ; $1BFE ld a,d8
        sta zA                        
        clc                           ; $1C00 add e
        lda zA                        
        adc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zD                        ; $1C01 ld a,d
        sta zA                        
        lda zCY                       ; $1C02 adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $1C04 ret
G_1C05
        lda (zL),y                    ; $1C05 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s266                     
        inc zH                        
_s266
        lda (zL),y                    ; $1C06 ld d,[hl]
        sta zD                        
        lda zA                        ; $1C07 ld e,a
        sta zE                        
        lda #<$C042                   ; $1C08 ld hl,d16
        sta zL                        
        lda #>$C042                   
        sta zH                        
        lda (zL),y                    ; $1C0B ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s267                     
        inc zH                        
_s267
        lda (zL),y                    ; $1C0C ld h,[hl]
        sta zH                        
        lda zA                        ; $1C0D ld l,a
        sta zL                        
        jsr G_00C3                    ; $1C0E call a16
        lda zCY                       ; $1C11 jr nc,pc+r8
        lsr a                         
        bcs _s268                     
        jmp G_1C14                    
_s268
        lda zE                        ; $1C13 dec de
        bne _s269                     
        dec zD                        
_s269
        dec zE                        
G_1C14
        lda #$80                      ; $1C14 ld a,d8
        sta zA                        
        clc                           ; $1C16 add e
        lda zA                        
        adc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zD                        ; $1C17 ld a,d
        sta zA                        
        lda zCY                       ; $1C18 adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1C1A ldh [a8],a
        sta $FFC5                     
        clc                           ; $1C1C add d8
        lda zA                        
        adc #$10                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        sec                           ; $1C1E cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        rts                           ; $1C1F ret
G_1C20
        lda zA                        ; $1C20 ld b,a
        sta zB                        
        lda $C047                     ; $1C21 ld a,[a16]
        sta zA                        
        sec                           ; $1C24 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        sec                           ; $1C25 cp h
        lda zA                        
        sbc zH                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        rts                           ; $1C26 ret
G_1C27
        lda $C053                     ; $1C27 ld a,[a16]
        sta zA                        
                                      ; $1C2A and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1C2B ret nz
        beq _s270                     
        rts                           
_s270
        jsr G_08BC                    ; $1C2C call a16
        sec                           ; $1C2F cp d8
        lda zA                        
        sbc #$76                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1C31 ret c
        lsr a                         
        bcc _s271                     
        rts                           
_s271
        sec                           ; $1C32 cp d8
        lda zA                        
        sbc #$7B                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1C34 ret nc
        lsr a                         
        bcs _s272                     
        rts                           
_s272
        lda zA                        ; $1C35 ld [a16],a
        sta $C053                     
        jsr G_08B1                    ; $1C38 call a16
        sec                           ; $1C3B cp d8
        lda zA                        
        sbc #$2E                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1C3D ret c
        lsr a                         
        bcc _s273                     
        rts                           
_s273
        sec                           ; $1C3E cp d8
        lda zA                        
        sbc #$AB                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1C40 ret nc
        lsr a                         
        bcs _s274                     
        rts                           
_s274
        lda $C047                     ; $1C41 ld a,[a16]
        sta zA                        
        sec                           ; $1C44 cp d8
        lda zA                        
        sbc #$1E                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1C46 ret nc
        lsr a                         
        bcs _s275                     
        rts                           
_s275
        lda #$0C                      ; $1C47 ld a,d8
        sta zA                        
        jsr S_SOUND                   ; $1C49 call a16
        lda $C047                     ; $1C4C ld a,[a16]
        sta zA                        
        sec                           ; $1C4F cp d8
        lda zA                        
        sbc #$1C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1C51 jr c,pc+r8
        lsr a                         
        bcc _s276                     
        jmp G_1C7F                    
_s276
        lda $C051                     ; $1C53 ld a,[a16]
        sta zA                        
                                      ; $1C56 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1C58 ld [a16],a
        sta $C051                     
        lda $C050                     ; $1C5B ld a,[a16]
        sta zA                        
                                      ; $1C5E sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1C60 and d8
        and #$BF                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1C62 ld [a16],a
        sta $C050                     
        lda $C052                     ; $1C65 ld a,[a16]
        sta zA                        
                                      ; $1C68 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1C6A jr nz,pc+r8
        beq _s277                     
        jmp G_1C72                    
_s277
        lda zA                        ; $1C6C ld b,a
        sta zB                        
        lda zA                        ; $1C6D srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1C6F add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        jmp G_1C76                    ; $1C70 jr pc+r8
G_1C72
        lda zA                        ; $1C72 and d8
        and #$7F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1C74 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
G_1C76
        lda zA                        ; $1C76 ld [a16],a
        sta $C052                     
        lda #$FF                      ; $1C79 ld a,d8
        sta zA                        
                                      ; $1C7B ld [a16],a
        sta $C053                     
        rts                           ; $1C7E ret
G_1C7F
        lda #$FE                      ; $1C7F ld a,d8
        sta zA                        
                                      ; $1C81 ld [a16],a
        sta $C053                     
G_1C84
        lda $C050                     ; $1C84 ld a,[a16]
        sta zA                        
                                      ; $1C87 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1C89 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1C8B and d8
        and #$9F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1C8D ld [a16],a
        sta $C050                     
        lda $C051                     ; $1C90 ld a,[a16]
        sta zA                        
                                      ; $1C93 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1C95 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1C97 and d8
        and #$3F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1C99 ld [a16],a
        sta $C051                     
        lda $C04F                     ; $1C9C ld a,[a16]
        sta zA                        
                                      ; $1C9F xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1CA1 ld [a16],a
        sta $C04F                     
        lda $C052                     ; $1CA4 ld a,[a16]
        sta zA                        
                                      ; $1CA7 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1CA9 sra a
        cmp #$80                      
        ror a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1CAB and d8
        and #$9F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1CAD ld [a16],a
        sta $C052                     
        rts                           ; $1CB0 ret
G_1CB1
        lda zB                        ; $1CB1 ld a,b
        sta zA                        
                                      ; $1CB2 ldh [a8],a
        sta $FFC5                     
        lda $FFC6                     ; $1CB4 ldh a,[a8]
        sta zA                        
                                      ; $1CB6 xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1CB8 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1CBA jr z,pc+r8
        bne _s278                     
        jmp G_1CD7                    
_s278
        lda zB                        ; $1CBC bit 7,b
        and #$80                      
        sta zZ                        
                                      ; $1CBE jr nz,pc+r8
        beq _s279                     
        jmp G_1CDB                    
_s279
G_1CC0
        lda zA                        ; $1CC0 res 7,a
        and #$7F                      
        sta zA                        
        lda zB                        ; $1CC2 res 7,b
        and #$7F                      
        sta zB                        
        sec                           ; $1CC4 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1CC5 jr nc,pc+r8
        lsr a                         
        bcs _s280                     
        jmp G_1CCE                    
_s280
        lda zA                        ; $1CC7 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1CC8 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $1CC9 ld b,a
        sta zB                        
        lda $FFC5                     ; $1CCA ldh a,[a8]
        sta zA                        
        jmp G_1CD3                    ; $1CCC jr pc+r8
G_1CCE
        lda zA                        ; $1CCE ld b,a
        sta zB                        
        lda $FFC6                     ; $1CCF ldh a,[a8]
        sta zA                        
                                      ; $1CD1 xor d8
        eor #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
G_1CD3
        lda zA                        ; $1CD3 and d8
        and #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        jmp G_1CDD                    ; $1CD5 jr pc+r8
G_1CD7
        lda zB                        ; $1CD7 bit 7,b
        and #$80                      
        sta zZ                        
                                      ; $1CD9 jr nz,pc+r8
        beq _s281                     
        jmp G_1CC0                    
_s281
G_1CDB
        lda zB                        ; $1CDB res 7,b
        and #$7F                      
        sta zB                        
G_1CDD
        clc                           ; $1CDD add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1CDE ld [a16],a
        sta $C050                     
        lda zA                        ; $1CE1 res 7,a
        and #$7F                      
        sta zA                        
                                      ; $1CE3 ld b,a
        sta zB                        
        lda $C051                     ; $1CE4 ld a,[a16]
        sta zA                        
        clc                           ; $1CE7 add a
        lda zA                        
        adc zA                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1CE8 ret c
        lsr a                         
        bcc _s282                     
        rts                           
_s282
        sec                           ; $1CE9 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1CEA ret nc
        lsr a                         
        bcs _s283                     
        rts                           
_s283
        lda zA                        ; $1CEB ld b,a
        sta zB                        
        lda $C050                     ; $1CEC ld a,[a16]
        sta zA                        
                                      ; $1CEF and d8
        and #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1CF1 or b
        ora zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1CF2 ld [a16],a
        sta $C050                     
        rts                           ; $1CF5 ret
G_1CF6
        jsr G_08BC                    ; $1CF6 call a16
        lda zA                        ; $1CF9 push af
        pha                           
        jsr G_GETF                    
        pha                           
        sec                           ; $1CFA sub e
        lda zA                        
        sbc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1CFB jr nc,pc+r8
        lsr a                         
        bcs _s284                     
        jmp G_1CFF                    
_s284
        lda zA                        ; $1CFD cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1CFE inc a
        lda zA                        
        sta zZ                        
G_1CFF
        lda zA                        ; $1CFF ld b,a
        sta zB                        
        pla                           ; $1D00 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
        clc                           ; $1D01 add d8
        lda zA                        
        adc #$08                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1D03 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1D05 jr z,pc+r8
        bne _s285                     
        jmp G_1D09                    
_s285
        lda zA                        ; $1D07 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1D08 inc a
        lda zA                        
        sta zZ                        
G_1D09
        sec                           ; $1D09 sub d8
        lda zA                        
        sbc #$30                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D0B jr c,pc+r8
        lsr a                         
        bcc _s286                     
        jmp G_1D13                    
_s286
        lda zA                        ; $1D0D srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1D0F srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1D11 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1D12 ld b,a
        sta zB                        
G_1D13
        lda zB                        ; $1D13 ld a,b
        sta zA                        
        lda #<$C047                   ; $1D14 ld hl,d16
        sta zL                        
        lda #>$C047                   
        sta zH                        
        sec                           ; $1D17 sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D18 jr nc,pc+r8
        lsr a                         
        bcs _s287                     
        jmp G_1D1C                    
_s287
        lda zA                        ; $1D1A cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1D1B inc a
        lda zA                        
        sta zZ                        
G_1D1C
        lda zA                        ; $1D1C srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1D1E ld [a16],a
        sta $C052                     
        rts                           ; $1D21 ret
G_1D22
        lda zD                        ; $1D22 push de
        pha                           
        lda zE                        
        pha                           
        lda zD                        ; $1D23 push de
        pha                           
        lda zE                        
        pha                           
        jsr G_08B1                    ; $1D24 call a16
        sec                           ; $1D27 sub d
        lda zA                        
        sbc zD                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D28 jr nc,pc+r8
        lsr a                         
        bcs _s288                     
        jmp G_1D2C                    
_s288
        lda zA                        ; $1D2A cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1D2B inc a
        lda zA                        
        sta zZ                        
G_1D2C
        lda zA                        ; $1D2C ld e,a
        sta zE                        
        lda $C051                     ; $1D2D ld a,[a16]
        sta zA                        
        jsr G_308F                    ; $1D30 call a16
        pla                           ; $1D33 pop de
        sta zE                        
        pla                           
        sta zD                        
        jsr G_08BC                    ; $1D34 call a16
        sec                           ; $1D37 sub e
        lda zA                        
        sbc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D38 jr nc,pc+r8
        lsr a                         
        bcs _s289                     
        jmp G_1D3C                    
_s289
        lda zA                        ; $1D3A cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1D3B inc a
        lda zA                        
        sta zZ                        
G_1D3C
        jsr G_3143                    ; $1D3C call a16
        lda zH                        ; $1D3F ld a,h
        sta zA                        
                                      ; $1D40 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1D41 jr nz,pc+r8
        beq _s290                     
        jmp G_1D48                    
_s290
        lda zL                        ; $1D43 ld a,l
        sta zA                        
        sec                           ; $1D44 cp d8
        lda zA                        
        sbc #$68                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D46 jr c,pc+r8
        lsr a                         
        bcc _s291                     
        jmp G_1D4A                    
_s291
G_1D48
        lda #$68                      ; $1D48 ld l,d8
        sta zL                        
G_1D4A
        pla                           ; $1D4A pop de
        sta zE                        
        pla                           
        sta zD                        
        jsr G_08B1                    ; $1D4B call a16
        sec                           ; $1D4E sub d
        lda zA                        
        sbc zD                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D4F jr nc,pc+r8
        lsr a                         
        bcs _s292                     
        jmp G_1D53                    
_s292
        lda zL                        ; $1D51 set 7,l
        ora #$80                      
        sta zL                        
G_1D53
        lda zL                        ; $1D53 ld a,l
        sta zA                        
                                      ; $1D54 ldh [a8],a
        sta $FFC6                     
        rts                           ; $1D56 ret
G_1D57
        lda #$00                      ; $1D57 ld b,d8
        sta zB                        
        lda (zL),y                    ; $1D59 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s293                     
        inc zH                        
_s293
        lda zA                        ; $1D5A and d8
        and #$0F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        sec                           ; $1D5C cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D5E ret c
        lsr a                         
        bcc _s294                     
        rts                           
_s294
        lda #$02                      ; $1D5F ld b,d8
        sta zB                        
        sec                           ; $1D61 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D63 jr c,pc+r8
        lsr a                         
        bcc _s295                     
        jmp G_1D67                    
_s295
        lda #$06                      ; $1D65 ld b,d8
        sta zB                        
G_1D67
        lda (zL),y                    ; $1D67 ld a,[hl]
        sta zA                        
        sec                           ; $1D68 sub d8
        lda zA                        
        sbc #$04                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1D6A ld [hl-],a
        sta (zL),y                    
        lda zL                        
        bne _s296                     
        dec zH                        
_s296
        dec zL                        
        lda (zL),y                    ; $1D6B bit 7,[hl]
        and #$80                      
        sta zZ                        
                                      ; $1D6D ret z
        bne _s297                     
        rts                           
_s297
        lda zB                        ; $1D6E set 7,b
        ora #$80                      
        sta zB                        
        rts                           ; $1D70 ret
G_1D71
        lda #$28                      ; $1D71 ld c,d8
        sta zC                        
        sec                           ; $1D73 cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D75 jr c,pc+r8
        lsr a                         
        bcc _s298                     
        jmp G_1D7D                    
_s298
        sec                           ; $1D77 cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1D79 jr nc,pc+r8
        lsr a                         
        bcs _s299                     
        jmp G_1D7D                    
_s299
        lda #$20                      ; $1D7B ld c,d8
        sta zC                        
G_1D7D
        lda zC                        ; $1D7D ld a,c
        sta zA                        
        lda zB                        ; $1D7E bit 5,b
        and #$20                      
        sta zZ                        
                                      ; $1D80 jr z,pc+r8
        bne _s300                     
        jmp G_1D86                    
_s300
        lda zA                        ; $1D82 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1D83 inc a
        lda zA                        
        sta zZ                        
        jmp G_1D89                    ; $1D84 jr pc+r8
G_1D86
        lda zB                        ; $1D86 bit 4,b
        and #$10                      
        sta zZ                        
                                      ; $1D88 ret z
        bne _s301                     
        rts                           
_s301
G_1D89
        clc                           ; $1D89 add d
        lda zA                        
        adc zD                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1D8A ld d,a
        sta zD                        
        lda (zL),y                    ; $1D8B ld a,[hl]
        sta zA                        
        sec                           ; $1D8C sub d8
        lda zA                        
        sbc #$04                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1D8E ld [hl],a
        sta (zL),y                    
        rts                           ; $1D8F ret
G_1D90
        jsr G_1DBE                    ; $1D90 call a16
        lda zB                        ; $1D93 bit 6,b
        and #$40                      
        sta zZ                        
                                      ; $1D95 jr z,pc+r8
        bne _s302                     
        jmp G_1DA6                    
_s302
G_1D97
        clc                           ; $1D97 add c
        lda zA                        
        adc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1D98 add e
        lda zA                        
        adc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1D99 ld e,a
        sta zE                        
        lda $C05C                     ; $1D9A ld a,[a16]
        sta zA                        
        sec                           ; $1D9D cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1D9F ret z
        bne _s303                     
        rts                           
_s303
        lda #$00                      ; $1DA0 ld a,d8
        sta zA                        
                                      ; $1DA2 ld [a16],a
        sta $C05C                     
        rts                           ; $1DA5 ret
G_1DA6
        lda zB                        ; $1DA6 bit 7,b
        and #$80                      
        sta zZ                        
G_1DA8
        lda zZ                        ; $1DA8 ret z
        bne _s304                     
        rts                           
_s304
        lda zA                        ; $1DA9 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1DAA inc a
        lda zA                        
        sta zZ                        
        clc                           ; $1DAB add e
        lda zA                        
        adc zE                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1DAC ld e,a
        sta zE                        
        lda #$01                      ; $1DAD ld a,d8
        sta zA                        
                                      ; $1DAF ld [a16],a
        sta $C05C                     
        rts                           ; $1DB2 ret
G_1DB3
        jsr G_1DBE                    ; $1DB3 call a16
        lda zB                        ; $1DB6 bit 7,b
        and #$80                      
        sta zZ                        
                                      ; $1DB8 jr nz,pc+r8
        beq _s305                     
        jmp G_1D97                    
_s305
        lda zB                        ; $1DBA bit 6,b
        and #$40                      
        sta zZ                        
        jmp G_1DA8                    ; $1DBC jr pc+r8
G_1DBE
        lda #$0A                      ; $1DBE ld c,d8
        sta zC                        
        sec                           ; $1DC0 cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1DC2 jr c,pc+r8
        lsr a                         
        bcc _s306                     
        jmp G_1DCC                    
_s306
        sec                           ; $1DC4 cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1DC6 jr nc,pc+r8
        lsr a                         
        bcs _s307                     
        jmp G_1DCC                    
_s307
        lda zC                        ; $1DC8 srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
        lda zC                        ; $1DCA srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
G_1DCC
        lda $FF96                     ; $1DCC ldh a,[a8]
        sta zA                        
                                      ; $1DCE bit 7,a
        and #$80                      
        sta zZ                        
        lda zC                        ; $1DD0 ld a,c
        sta zA                        
        lda #$08                      ; $1DD1 ld c,d8
        sta zC                        
        lda zZ                        ; $1DD3 ret nz
        beq _s308                     
        rts                           
_s308
        lda zA                        ; $1DD4 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1DD5 inc a
        lda zA                        
        sta zZ                        
        lda #$F8                      ; $1DD6 ld c,d8
        sta zC                        
        rts                           ; $1DD8 ret
G_1DD9
        lda zA                        ; $1DD9 bit 1,a
        and #$02                      
        sta zZ                        
                                      ; $1DDB ret z
        bne _s309                     
        rts                           
_s309
        jsr G_1DF5                    ; $1DDC call a16
        lda $FF9A                     ; $1DDF ldh a,[a8]
        sta zA                        
                                      ; $1DE1 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $1DE3 ret z
        bne _s310                     
        rts                           
_s310
        lda #$4C                      ; $1DE4 ld b,d8
        sta zB                        
        rts                           ; $1DE6 ret
G_1DE7
        lda zA                        ; $1DE7 bit 1,a
        and #$02                      
        sta zZ                        
                                      ; $1DE9 ret z
        bne _s311                     
        rts                           
_s311
        jsr G_1DF5                    ; $1DEA call a16
        lda $FF9C                     ; $1DED ldh a,[a8]
        sta zA                        
                                      ; $1DEF bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1DF1 ret z
        bne _s312                     
        rts                           
_s312
        lda #$4C                      ; $1DF2 ld b,d8
        sta zB                        
        rts                           ; $1DF4 ret
G_1DF5
        lda $C052                     ; $1DF5 ld a,[a16]
        sta zA                        
                                      ; $1DF8 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1DFA jr z,pc+r8
        bne _s313                     
        jmp G_1E00                    
_s313
        lda #$01                      ; $1DFC ld a,d8
        sta zA                        
        jmp G_1E07                    ; $1DFE jr pc+r8
G_1E00
        clc                           ; $1E00 add a
        lda zA                        
        adc zA                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1E01 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1E03 jr z,pc+r8
        bne _s314                     
        jmp G_1E07                    
_s314
        lda #$7F                      ; $1E05 ld a,d8
        sta zA                        
G_1E07
        lda zA                        ; $1E07 ld [a16],a
        sta $C052                     
        lda #$40                      ; $1E0A ld b,d8
        sta zB                        
        rts                           ; $1E0C ret
G_1E0D
        lda zA                        ; $1E0D bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $1E0F jr z,pc+r8
        bne _s315                     
        jmp G_1E24                    
_s315
        lda zC                        ; $1E11 ld a,c
        sta zA                        
        lda zB                        ; $1E12 bit 7,b
        and #$80                      
        sta zZ                        
                                      ; $1E14 jr nz,pc+r8
        beq _s316                     
        jmp G_1E21                    
_s316
        sec                           ; $1E16 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1E17 jr nc,pc+r8
        lsr a                         
        bcs _s317                     
        jmp G_1E1D                    
_s317
        lda zA                        ; $1E19 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1E1A inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $1E1B ld b,a
        sta zB                        
        rts                           ; $1E1C ret
G_1E1D
        lda zA                        ; $1E1D or d8
        ora #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1E1F ld b,a
        sta zB                        
        rts                           ; $1E20 ret
G_1E21
        clc                           ; $1E21 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1E22 ld b,a
        sta zB                        
        rts                           ; $1E23 ret
G_1E24
        lda zA                        ; $1E24 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $1E26 ret z
        bne _s318                     
        rts                           
_s318
        lda zC                        ; $1E27 ld a,c
        sta zA                        
        lda zB                        ; $1E28 bit 7,b
        and #$80                      
        sta zZ                        
                                      ; $1E2A jr z,pc+r8
        bne _s319                     
        jmp G_1E39                    
_s319
        lda zB                        ; $1E2C res 7,b
        and #$7F                      
        sta zB                        
        sec                           ; $1E2E sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1E2F jr nc,pc+r8
        lsr a                         
        bcs _s320                     
        jmp G_1E37                    
_s320
        lda zA                        ; $1E31 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1E32 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $1E33 or d8
        ora #$80                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1E35 ld b,a
        sta zB                        
        rts                           ; $1E36 ret
G_1E37
        lda zA                        ; $1E37 ld b,a
        sta zB                        
        rts                           ; $1E38 ret
G_1E39
        clc                           ; $1E39 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1E3A ld b,a
        sta zB                        
        rts                           ; $1E3B ret
G_1E3C
        lda zA                        ; $1E3C bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $1E3E jr z,pc+r8
        bne _s321                     
        jmp G_1E4E                    
_s321
G_1E40
        lda $C051                     ; $1E40 ld a,[a16]
        sta zA                        
        clc                           ; $1E43 add d8
        lda zA                        
        adc #$10                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1E45 ld [a16],a
        sta $C051                     
        lda #$10                      ; $1E48 ld a,d8
        sta zA                        
                                      ; $1E4A ld [a16],a
        sta $C05C                     
        rts                           ; $1E4D ret
G_1E4E
        lda zA                        ; $1E4E bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1E50 jr z,pc+r8
        bne _s322                     
        jmp G_1E68                    
_s322
G_1E52
        lda $C051                     ; $1E52 ld a,[a16]
        sta zA                        
        sec                           ; $1E55 sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1E57 ld [a16],a
        sta $C051                     
        lda #$11                      ; $1E5A ld a,d8
        sta zA                        
                                      ; $1E5C ld [a16],a
        sta $C05C                     
        rts                           ; $1E5F ret
G_1E60
        lda zA                        ; $1E60 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1E62 jr nz,pc+r8
        beq _s323                     
        jmp G_1E40                    
_s323
        lda zA                        ; $1E64 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $1E66 jr nz,pc+r8
        beq _s324                     
        jmp G_1E52                    
_s324
G_1E68
        lda #$01                      ; $1E68 ld a,d8
        sta zA                        
                                      ; $1E6A ld [a16],a
        sta $C05C                     
        rts                           ; $1E6D ret
G_1E6E
        lda zE                        ; $1E6E ld a,e
        sta zA                        
                                      ; $1E6F ldh [a8],a
        sta $FFC5                     
        lda (zL),y                    ; $1E71 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s325                     
        inc zH                        
_s325
        lda (zL),y                    ; $1E72 ld h,[hl]
        sta zH                        
        lda zA                        ; $1E73 ld l,a
        sta zL                        
        sec                           ; $1E74 cp d8
        lda zA                        
        sbc #$6C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #$02                      ; $1E76 ld e,d8
        sta zE                        
        lda zCY                       ; $1E78 jr c,pc+r8
        lsr a                         
        bcc _s326                     
        jmp G_1E7C                    
_s326
        lda #$00                      ; $1E7A ld e,d8
        sta zE                        
G_1E7C
        clc                           ; $1E7C add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $1E7D rr h
        lsr a                         
        lda zH                        
        ror a                         
        sta zH                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $1E7F jr nc,pc+r8
        lsr a                         
        bcs _s327                     
        jmp G_1E82                    
_s327
        inc zH                        ; $1E81 inc h
        lda zH                        
        sta zZ                        
G_1E82
        lda zH                        ; $1E82 ld d,h
        sta zD                        
        lda $FFC5                     ; $1E83 ldh a,[a8]
        sta zA                        
                                      ; $1E85 ld e,a
        sta zE                        
        rts                           ; $1E86 ret
G_1E87
        lda zA                        ; $1E87 ld l,a
        sta zL                        
        sec                           ; $1E88 sub d8
        lda zA                        
        sbc #$70                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1E8A jr nc,pc+r8
        lsr a                         
        bcs _s328                     
        jmp G_1E93                    
_s328
        lda zA                        ; $1E8C cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $1E8D inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $1E8E srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1E90 add l
        lda zA                        
        adc zL                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        jmp G_1E98                    ; $1E91 jr pc+r8
G_1E93
        lda zA                        ; $1E93 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1E95 ld h,a
        sta zH                        
        lda zL                        ; $1E96 ld a,l
        sta zA                        
        sec                           ; $1E97 sub h
        lda zA                        
        sbc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
G_1E98
        lda zA                        ; $1E98 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1E9A ld l,a
        sta zL                        
        lda zA                        ; $1E9B srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1E9D add l
        lda zA                        
        adc zL                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        rts                           ; $1E9E ret
G_1E9F
        lda zA                        ; $1E9F bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $1EA1 jr z,pc+r8
        bne _s329                     
        jmp G_1EB0                    
_s329
G_1EA3
        lda (zL),y                    ; $1EA3 ld a,[hl]
        sta zA                        
                                      ; $1EA4 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1EA6 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1EA8 ld c,a
        sta zC                        
        lda zA                        ; $1EA9 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1EAB add c
        lda zA                        
        adc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $1EAC add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1EAD ld b,a
        sta zB                        
        jmp G_1EBF                    ; $1EAE jr pc+r8
G_1EB0
        lda zA                        ; $1EB0 bit 7,a
        and #$80                      
        sta zZ                        
G_1EB2
        lda zZ                        ; $1EB2 jr z,pc+r8
        bne _s330                     
        jmp G_1EBF                    
_s330
        lda (zL),y                    ; $1EB4 ld a,[hl]
        sta zA                        
                                      ; $1EB5 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1EB7 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1EB9 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1EBB ld c,a
        sta zC                        
        lda zB                        ; $1EBC ld a,b
        sta zA                        
        sec                           ; $1EBD sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $1EBE ld b,a
        sta zB                        
G_1EBF
        lda (zL),y                    ; $1EBF ld a,[hl-]
        sta zA                        
        lda zL                        
        bne _s331                     
        dec zH                        
_s331
        dec zL                        
        clc                           ; $1EC0 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $1EC1 ld [hl],a
        sta (zL),y                    
        rts                           ; $1EC2 ret
G_1EC3
        lda zA                        ; $1EC3 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1EC5 jr nz,pc+r8
        beq _s332                     
        jmp G_1EA3                    
_s332
        lda zA                        ; $1EC7 bit 6,a
        and #$40                      
        sta zZ                        
        jmp G_1EB2                    ; $1EC9 jr pc+r8
G_1ECB
        lda #<$C082                   ; $1ECB ld hl,d16
        sta zL                        
        lda #>$C082                   
        sta zH                        
        jsr G_1F3A                    ; $1ECE call a16
        lda zA                        ; $1ED1 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1ED3 jr nz,pc+r8
        beq _s333                     
        jmp G_1ED8                    
_s333
        lda #<$C0A2                   ; $1ED5 ld hl,d16
        sta zL                        
        lda #>$C0A2                   
        sta zH                        
G_1ED8
        lda $FF91                     ; $1ED8 ldh a,[a8]
        sta zA                        
                                      ; $1EDA bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $1EDC jr z,pc+r8
        bne _s334                     
        jmp G_1EDF                    
_s334
        inc zL                        ; $1EDE inc hl
        bne _s335                     
        inc zH                        
_s335
G_1EDF
        lda (zL),y                    ; $1EDF inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        rts                           ; $1EE0 ret
G_1EE1
        lda #<$C082                   ; $1EE1 ld hl,d16
        sta zL                        
        lda #>$C082                   
        sta zH                        
        jsr G_1F3A                    ; $1EE4 call a16
        lda zA                        ; $1EE7 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1EE9 jr z,pc+r8
        bne _s336                     
        jmp G_1EEE                    
_s336
        lda #<$C0A2                   ; $1EEB ld hl,d16
        sta zL                        
        lda #>$C0A2                   
        sta zH                        
G_1EEE
        jmp G_1ED8                    ; $1EEE jr pc+r8
G_1EF0
        lda #<$C084                   ; $1EF0 ld hl,d16
        sta zL                        
        lda #>$C084                   
        sta zH                        
        jsr G_1F3A                    ; $1EF3 call a16
        lda zA                        ; $1EF6 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $1EF8 jr nz,pc+r8
        beq _s337                     
        jmp G_1EFD                    
_s337
        lda #<$C0A4                   ; $1EFA ld hl,d16
        sta zL                        
        lda #>$C0A4                   
        sta zH                        
G_1EFD
        jmp G_1ED8                    ; $1EFD jr pc+r8
G_1EFF
        lda $C05A                     ; $1EFF ld a,[a16]
        sta zA                        
        sec                           ; $1F02 cp d8
        lda zA                        
        sbc #$0A                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1F04 jr nc,pc+r8
        lsr a                         
        bcs _s338                     
        jmp G_1F35                    
_s338
        lda $FF96                     ; $1F06 ldh a,[a8]
        sta zA                        
                                      ; $1F08 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $1F0A jr nz,pc+r8
        beq _s339                     
        jmp G_1F19                    
_s339
        lda #<$C086                   ; $1F0C ld hl,d16
        sta zL                        
        lda #>$C086                   
        sta zH                        
        lda $FF93                     ; $1F0F ldh a,[a8]
        sta zA                        
                                      ; $1F11 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1F12 jr z,pc+r8
        bne _s340                     
        jmp G_1F26                    
_s340
        lda #<$C0A7                   ; $1F14 ld hl,d16
        sta zL                        
        lda #>$C0A7                   
        sta zH                        
        jmp G_1F2E                    ; $1F17 jr pc+r8
G_1F19
        lda #<$C0A6                   ; $1F19 ld hl,d16
        sta zL                        
        lda #>$C0A6                   
        sta zH                        
        lda $FF93                     ; $1F1C ldh a,[a8]
        sta zA                        
                                      ; $1F1E and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $1F1F jr nz,pc+r8
        beq _s341                     
        jmp G_1F26                    
_s341
        lda #<$C087                   ; $1F21 ld hl,d16
        sta zL                        
        lda #>$C087                   
        sta zH                        
        jmp G_1F2E                    ; $1F24 jr pc+r8
G_1F26
        lda $C05A                     ; $1F26 ld a,[a16]
        sta zA                        
        sec                           ; $1F29 cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1F2B jr z,pc+r8
        bne _s342                     
        jmp G_1F34                    
_s342
        rts                           ; $1F2D ret
G_1F2E
        lda $C05A                     ; $1F2E ld a,[a16]
        sta zA                        
        sec                           ; $1F31 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1F33 ret nz
        beq _s343                     
        rts                           
_s343
G_1F34
        lda (zL),y                    ; $1F34 inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
G_1F35
        lda #$25                      ; $1F35 ld a,d8
        sta zA                        
        jmp S_SOUND                   ; $1F37 jp a16
G_1F3A
        lda $FFAD                     ; $1F3A ldh a,[a8]
        sta zA                        
                                      ; $1F3C bit 3,a
        and #$08                      
        sta zZ                        
                                      ; $1F3E ret z
        bne _s344                     
        rts                           
_s344
        lda $FFAE                     ; $1F3F ldh a,[a8]
        sta zA                        
        rts                           ; $1F41 ret
G_1F42
        lda zA                        ; $1F42 push af
        pha                           
        jsr G_GETF                    
        pha                           
        lda $FFC2                     ; $1F43 ldh a,[a8]
        sta zA                        
                                      ; $1F45 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $1F47 jr z,pc+r8
        bne _s345                     
        jmp G_1F67                    
_s345
        lda zA                        ; $1F49 and d8
        and #$0F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        sec                           ; $1F4B cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1F4D jr nz,pc+r8
        beq _s346                     
        jmp G_1F5A                    
_s346
        lda $C0DD                     ; $1F4F ld a,[a16]
        sta zA                        
        sec                           ; $1F52 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1F54 jr z,pc+r8
        bne _s347                     
        jmp G_1F60                    
_s347
        jmp G_1F67                    ; $1F56 jr pc+r8
G_1F58
        pla                           ; $1F58 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
        rts                           ; $1F59 ret
G_1F5A
        sec                           ; $1F5A sub d8
        lda zA                        
        sbc #$04                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        sec                           ; $1F5C cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1F5E jr nc,pc+r8
        lsr a                         
        bcs _s348                     
        jmp G_1F67                    
_s348
G_1F60
        lda $DD00                     ; $1F60 ld a,[a16]
        sta zA                        
        sec                           ; $1F63 cp d8
        lda zA                        
        sbc #$FF                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $1F65 jr nz,pc+r8
        beq _s349                     
        jmp G_1F58                    
_s349
G_1F67
        pla                           ; $1F67 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
        jmp S_SOUND                   ; $1F68 jp a16
G_1F8E
        jsr G_32B9                    ; $1F8E call a16
        lda $FF90                     ; $1F91 ldh a,[a8]
        sta zA                        
        jsr G_RST08                   ; $1F93 rst vec
        .word G_1FA8, G_1FB5, G_2002, G_200D, G_2061, G_214A, G_2119, G_2119, G_212D, G_214E
G_1FA8
        jsr G_32C8                    ; $1FA8 call a16
        lda zA                        ; $1FAB xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda #<$C000                   ; $1FAC ld hl,d16
        sta zL                        
        lda #>$C000                   
        sta zH                        
        lda #$80                      ; $1FAF ld b,d8
        sta zB                        
G_1FB1
        lda zA                        ; $1FB1 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s350                     
        inc zH                        
_s350
        dec zB                        ; $1FB2 dec b
        lda zB                        
        sta zZ                        
                                      ; $1FB3 jr nz,pc+r8
        beq _s351                     
        jmp G_1FB1                    
_s351
G_1FB5
        lda $FF96                     ; $1FB5 ldh a,[a8]
        sta zA                        
                                      ; $1FB7 ld b,a
        sta zB                        
        lda $C0DB                     ; $1FB8 ld a,[a16]
        sta zA                        
                                      ; $1FBB ld c,a
        sta zC                        
        lda $C0E6                     ; $1FBC ld a,[a16]
        sta zA                        
        sec                           ; $1FBF cp d8
        lda zA                        
        sbc #$0D                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $1FC1 jr c,pc+r8
        lsr a                         
        bcc _s352                     
        jmp G_1FD0                    
_s352
        lda $C0E7                     ; $1FC3 ld a,[a16]
        sta zA                        
        dec zA                        ; $1FC6 dec a
        lda zA                        
        sta zZ                        
        lda zA                        ; $1FC7 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zB                        ; $1FC9 bit 1,b
        and #$02                      
        sta zZ                        
                                      ; $1FCB jr z,pc+r8
        bne _s353                     
        jmp G_1FD8                    
_s353
        lda zA                        ; $1FCD cpl
        eor #$FF                      
        sta zA                        
        jmp G_1FD8                    ; $1FCE jr pc+r8
G_1FD0
        lda $C0E6                     ; $1FD0 ld a,[a16]
        sta zA                        
        lda zB                        ; $1FD3 bit 1,b
        and #$02                      
        sta zZ                        
                                      ; $1FD5 jr z,pc+r8
        bne _s354                     
        jmp G_1FD8                    
_s354
        lda zA                        ; $1FD7 cpl
        eor #$FF                      
        sta zA                        
G_1FD8
        lda zC                        ; $1FD8 bit 0,c
        and #$01                      
        sta zZ                        
                                      ; $1FDA jr nz,pc+r8
        beq _s355                     
        jmp G_1FDD                    
_s355
        lda zA                        ; $1FDC cpl
        eor #$FF                      
        sta zA                        
G_1FDD
        lda zA                        ; $1FDD bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $1FDF jr z,pc+r8
        bne _s356                     
        jmp G_1FE9                    
_s356
        lda zB                        ; $1FE1 res 6,b
        and #$BF                      
        sta zB                        
        lda #<$C000                   ; $1FE3 ld hl,d16
        sta zL                        
        lda #>$C000                   
        sta zH                        
        lda zA                        ; $1FE6 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        jmp G_1FF0                    ; $1FE7 jr pc+r8
G_1FE9
        lda zB                        ; $1FE9 set 6,b
        ora #$40                      
        sta zB                        
        lda #<$C020                   ; $1FEB ld hl,d16
        sta zL                        
        lda #>$C020                   
        sta zH                        
        lda #$80                      ; $1FEE ld a,d8
        sta zA                        
G_1FF0
        lda zA                        ; $1FF0 ldh [a8],a
        sta $FFAD                     
        lda zB                        ; $1FF2 ld a,b
        sta zA                        
                                      ; $1FF3 ldh [a8],a
        sta $FF96                     
        lda #$04                      ; $1FF5 ld a,d8
        sta zA                        
                                      ; $1FF7 ld [hl],a
        sta (zL),y                    
        lda zA                        ; $1FF8 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $1FF9 ldh [a8],a
        sta $FFB0                     
        lda zA                        ; $1FFB ldh [a8],a
        sta $FFB5                     
        lda #$02                      ; $1FFD ld a,d8
        sta zA                        
                                      ; $1FFF ldh [a8],a
        sta $FF90                     
        rts                           ; $2001 ret
G_2002
        lda $C040                     ; $2002 ld a,[a16]
        sta zA                        
        sec                           ; $2005 cp d8
        lda zA                        
        sbc #$09                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $2007 ret nz
        beq _s357                     
        rts                           
_s357
        lda #$03                      ; $2008 ld a,d8
        sta zA                        
                                      ; $200A ldh [a8],a
        sta $FF90                     
        rts                           ; $200C ret
G_200D
        lda $FFC2                     ; $200D ldh a,[a8]
        sta zA                        
                                      ; $200F and d8
        and #$0F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        sec                           ; $2011 sub d8
        lda zA                        
        sbc #$04                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2013 jr c,pc+r8
        lsr a                         
        bcc _s358                     
        jmp G_2049                    
_s358
        jsr G_RST08                   ; $2015 rst vec
        .word G_201C, G_2129, G_2031
G_201C
        lda #<$FF91                   ; $201C ld hl,d16
        sta zL                        
        lda #>$FF91                   
        sta zH                        
        lda (zL),y                    ; $201F inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda (zL),y                    ; $2020 bit 0,[hl]
        and #$01                      
        sta zZ                        
                                      ; $2022 jp nz,a16
        beq _s359                     
        jmp G_2129                    
_s359
        lda $FF96                     ; $2025 ldh a,[a8]
        sta zA                        
                                      ; $2027 bit 6,a
        and #$40                      
        sta zZ                        
        lda #$00                      ; $2029 ld a,d8
        sta zA                        
        lda zZ                        ; $202B jr nz,pc+r8
        beq _s360                     
        jmp G_202E                    
_s360
        inc zA                        ; $202D inc a
        lda zA                        
        sta zZ                        
G_202E
        jmp G_2170                    ; $202E jp a16
G_2031
        lda $FF91                     ; $2031 ldh a,[a8]
        sta zA                        
                                      ; $2033 res 0,a
        and #$FE                      
        sta zA                        
        clc                           ; $2035 add d8
        lda zA                        
        adc #$02                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2037 ldh [a8],a
        sta $FF91                     
        jsr G_1F3A                    ; $2039 call a16
        lda zA                        ; $203C bit 7,a
        and #$80                      
        sta zZ                        
        lda #$00                      ; $203E ld a,d8
        sta zA                        
        lda zZ                        ; $2040 jr z,pc+r8
        bne _s361                     
        jmp G_2043                    
_s361
        inc zA                        ; $2042 inc a
        lda zA                        
        sta zZ                        
G_2043
        jsr G_2170                    ; $2043 call a16
        jmp G_1EFF                    ; $2046 jp a16
G_2049
        lda $FF91                     ; $2049 ldh a,[a8]
        sta zA                        
                                      ; $204B res 0,a
        and #$FE                      
        sta zA                        
        clc                           ; $204D add d8
        lda zA                        
        adc #$02                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $204F ldh [a8],a
        sta $FF91                     
        lda $C04D                     ; $2051 ld a,[a16]
        sta zA                        
                                      ; $2054 bit 1,a
        and #$02                      
        sta zZ                        
        lda #$00                      ; $2056 ld a,d8
        sta zA                        
        lda zZ                        ; $2058 jr z,pc+r8
        bne _s362                     
        jmp G_205B                    
_s362
        inc zA                        ; $205A inc a
        lda zA                        
        sta zZ                        
G_205B
        jsr G_2170                    ; $205B call a16
        jmp G_1EFF                    ; $205E jp a16
G_2061
        lda $FFAF                     ; $2061 ldh a,[a8]
        sta zA                        
                                      ; $2063 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $2065 jp nz,a16
        beq _s363                     
        jmp S_RET                     
_s363
        lda #<$C0DC                   ; $2068 ld hl,d16
        sta zL                        
        lda #>$C0DC                   
        sta zH                        
        lda (zL),y                    ; $206B inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda #<$C0E6                   ; $206C ld hl,d16
        sta zL                        
        lda #>$C0E6                   
        sta zH                        
        lda (zL),y                    ; $206F inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda #<$C0E0                   ; $2070 ld hl,d16
        sta zL                        
        lda #>$C0E0                   
        sta zH                        
        lda #<$C0E3                   ; $2073 ld de,d16
        sta zE                        
        lda #>$C0E3                   
        sta zD                        
        lda #$00                      ; $2076 ld b,d8
        sta zB                        
        lda $FF93                     ; $2078 ldh a,[a8]
        sta zA                        
                                      ; $207A and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $207B jr z,pc+r8
        bne _s364                     
        jmp G_2085                    
_s364
        lda #<$C0E3                   ; $207D ld hl,d16
        sta zL                        
        lda #>$C0E3                   
        sta zH                        
        lda #<$C0E0                   ; $2080 ld de,d16
        sta zE                        
        lda #>$C0E0                   
        sta zD                        
        lda #$03                      ; $2083 ld b,d8
        sta zB                        
G_2085
        lda $C0DB                     ; $2085 ld a,[a16]
        sta zA                        
        sec                           ; $2088 cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $208A jr z,pc+r8
        bne _s365                     
        jmp G_2096                    
_s365
        inc zL                        ; $208C inc hl
        bne _s366                     
        inc zH                        
_s366
        inc zE                        ; $208D inc de
        bne _s367                     
        inc zD                        
_s367
        inc zB                        ; $208E inc b
        lda zB                        
        sta zZ                        
        sec                           ; $208F cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $2091 jr z,pc+r8
        bne _s368                     
        jmp G_2096                    
_s368
        inc zL                        ; $2093 inc hl
        bne _s369                     
        inc zH                        
_s369
        inc zE                        ; $2094 inc de
        bne _s370                     
        inc zD                        
_s370
        inc zB                        ; $2095 inc b
        lda zB                        
        sta zZ                        
G_2096
        lda zB                        ; $2096 ld a,b
        sta zA                        
                                      ; $2097 ldh [a8],a
        sta $FF95                     
        lda (zL),y                    ; $2099 inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda (zL),y                    ; $209A ld a,[hl]
        sta zA                        
        sec                           ; $209B cp d8
        lda zA                        
        sbc #$07                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $209D jr z,pc+r8
        bne _s371                     
        jmp G_20B9                    
_s371
        sec                           ; $209F cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $20A1 jr nz,pc+r8
        beq _s372                     
        jmp G_2110                    
_s372
        lda (zE),y                    ; $20A3 ld a,[de]
        sta zA                        
        sec                           ; $20A4 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $20A6 jr c,pc+r8
        lsr a                         
        bcc _s373                     
        jmp G_20B9                    
_s373
        lda zZ                        ; $20A8 jr z,pc+r8
        bne _s374                     
        jmp G_2110                    
_s374
        lda #<$C0DC                   ; $20AA ld hl,d16
        sta zL                        
        lda #>$C0DC                   
        sta zH                        
        lda (zL),y                    ; $20AD dec [hl]
        sec                           
        sbc #1                        
        sta (zL),y                    
        sta zZ                        
        lda zA                        ; $20AE xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $20AF ld [a16],a
        sta $C0E7                     
        lda #$05                      ; $20B2 ld a,d8
        sta zA                        
                                      ; $20B4 ld [a16],a
        sta $C0EA                     
        jmp G_2110                    ; $20B7 jr pc+r8
G_20B9
        lda #$01                      ; $20B9 ld a,d8
        sta zA                        
                                      ; $20BB ld [a16],a
        sta $C0E6                     
        lda #$01                      ; $20BE ld b,d8
        sta zB                        
        lda $FF93                     ; $20C0 ldh a,[a8]
        sta zA                        
                                      ; $20C2 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $20C3 jr z,pc+r8
        bne _s375                     
        jmp G_20C7                    
_s375
        lda #$FF                      ; $20C5 ld b,d8
        sta zB                        
G_20C7
        lda $FFC4                     ; $20C7 ldh a,[a8]
        sta zA                        
        clc                           ; $20C9 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $20CA ldh [a8],a
        sta $FFC4                     
        lda $C0DB                     ; $20CC ld a,[a16]
        sta zA                        
        inc zA                        ; $20CF inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $20D0 ld [a16],a
        sta $C0DB                     
        sec                           ; $20D3 cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $20D5 jr nz,pc+r8
        beq _s376                     
        jmp G_20F6                    
_s376
        lda #$06                      ; $20D7 ld b,d8
        sta zB                        
        lda #$04                      ; $20D9 ld a,d8
        sta zA                        
                                      ; $20DB ld [a16],a
        sta $C0EA                     
        lda $FFC4                     ; $20DE ldh a,[a8]
        sta zA                        
        sec                           ; $20E0 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $20E2 jr z,pc+r8
        bne _s377                     
        jmp G_20E9                    
_s377
        inc zB                        ; $20E4 inc b
        lda zB                        
        sta zZ                        
        sec                           ; $20E5 cp d8
        lda zA                        
        sbc #$FE                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $20E7 jr nz,pc+r8
        beq _s378                     
        jmp G_2110                    
_s378
G_20E9
        lda zB                        ; $20E9 ld a,b
        sta zA                        
                                      ; $20EA ldh [a8],a
        sta $FF90                     
        lda #$96                      ; $20EC ld a,d8
        sta zA                        
                                      ; $20EE ldh [a8],a
        sta $FF92                     
        lda #$06                      ; $20F0 ld a,d8
        sta zA                        
                                      ; $20F2 ld [a16],a
        sta $C0EA                     
        rts                           ; $20F5 ret
G_20F6
        sec                           ; $20F6 cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $20F8 jr nz,pc+r8
        beq _s379                     
        jmp G_2105                    
_s379
G_20FA
        lda #$06                      ; $20FA ld b,d8
        sta zB                        
        lda $FFC4                     ; $20FC ldh a,[a8]
        sta zA                        
                                      ; $20FE bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $2100 jr z,pc+r8
        bne _s380                     
        jmp G_20E9                    
_s380
        inc zB                        ; $2102 inc b
        lda zB                        
        sta zZ                        
        jmp G_20E9                    ; $2103 jr pc+r8
G_2105
        lda #$03                      ; $2105 ld a,d8
        sta zA                        
                                      ; $2107 ld [a16],a
        sta $C0EA                     
        lda $FF96                     ; $210A ldh a,[a8]
        sta zA                        
                                      ; $210C bit 3,a
        and #$08                      
        sta zZ                        
                                      ; $210E jr nz,pc+r8
        beq _s381                     
        jmp G_20FA                    
_s381
G_2110
        lda #$64                      ; $2110 ld a,d8
        sta zA                        
                                      ; $2112 ldh [a8],a
        sta $FF92                     
        lda #$05                      ; $2114 ld a,d8
        sta zA                        
                                      ; $2116 ldh [a8],a
        sta $FF90                     
        rts                           ; $2118 ret
G_2119
        lda $FFC3                     ; $2119 ldh a,[a8]
        sta zA                        
                                      ; $211B ldh [a8],a
        sta $FF91                     
        lda #<$FF92                   ; $211D ld hl,d16
        sta zL                        
        lda #>$FF92                   
        sta zH                        
        lda (zL),y                    ; $2120 dec [hl]
        sec                           
        sbc #1                        
        sta (zL),y                    
        sta zZ                        
                                      ; $2121 ret nz
        beq _s382                     
        rts                           
_s382
        lda #$0A                      ; $2122 ld a,d8
        sta zA                        
                                      ; $2124 ldh [a8],a
        sta $FF8A                     
        jmp S_SCREEN                  ; $2126 jp a16
G_2129
        lda zA                        ; $2129 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $212A ldh [a8],a
        sta $FF90                     
        rts                           ; $212C ret
G_212D
        lda zA                        ; $212D xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $212E ldh [a8],a
        sta $FF90                     
        lda $C0E6                     ; $2130 ld a,[a16]
        sta zA                        
        sec                           ; $2133 cp d8
        lda zA                        
        sbc #$0D                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2135 ret c
        lsr a                         
        bcc _s383                     
        rts                           
_s383
        lda $C0E7                     ; $2136 ld a,[a16]
        sta zA                        
                                      ; $2139 ld l,a
        sta zL                        
        lda #$00                      ; $213A ld h,d8
        sta zH                        
        lda #$06                      ; $213C ld a,d8
        sta zA                        
        jsr G_3143                    ; $213E call a16
        lda zA                        ; $2141 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $2142 ret nz
        beq _s384                     
        rts                           
_s384
        lda #$08                      ; $2143 ld a,d8
        sta zA                        
                                      ; $2145 ldh [a8],a
        sta $FF8A                     
        jmp S_SCREEN                  ; $2147 jp a16
G_214A
        lda $FFC3                     ; $214A ldh a,[a8]
        sta zA                        
                                      ; $214C ldh [a8],a
        sta $FF91                     
G_214E
        lda #<$FF92                   ; $214E ld hl,d16
        sta zL                        
        lda #>$FF92                   
        sta zH                        
        lda (zL),y                    ; $2151 dec [hl]
        sec                           
        sbc #1                        
        sta (zL),y                    
        sta zZ                        
                                      ; $2152 ret nz
        beq _s385                     
        rts                           
_s385
        lda zA                        ; $2153 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2154 ldh [a8],a
        sta $FF90                     
        jmp S_SCREEN                  ; $2156 jp a16
G_2159
        lda zA                        ; $2159 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $215A ldh [a8],a
        sta $FF90                     
        lda zA                        ; $215C ldh [a8],a
        sta $FF91                     
        lda $C0E6                     ; $215E ld a,[a16]
        sta zA                        
        sec                           ; $2161 cp d8
        lda zA                        
        sbc #$0D                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #$01                      ; $2163 ld a,d8
        sta zA                        
        lda zCY                       ; $2165 jr c,pc+r8
        lsr a                         
        bcc _s386                     
        jmp G_2169                    
_s386
        lda #$07                      ; $2167 ld a,d8
        sta zA                        
G_2169
        lda zA                        ; $2169 ld [a16],a
        sta $C0DD                     
        lda zA                        ; $216C ld [a16],a
        sta $C0DE                     
        rts                           ; $216F ret
G_2170
        lda zA                        ; $2170 ldh [a8],a
        sta $FF93                     
        lda zA                        ; $2172 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda #<$C081                   ; $2173 ld hl,d16
        sta zL                        
        lda #>$C081                   
        sta zH                        
        lda zZ                        ; $2176 jr z,pc+r8
        bne _s387                     
        jmp G_217B                    
_s387
        lda #<$C0A1                   ; $2178 ld hl,d16
        sta zL                        
        lda #>$C0A1                   
        sta zH                        
G_217B
        lda (zL),y                    ; $217B inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda #<$C0DD                   ; $217C ld hl,d16
        sta zL                        
        lda #>$C0DD                   
        sta zH                        
        lda #<$C0DE                   ; $217F ld de,d16
        sta zE                        
        lda #>$C0DE                   
        sta zD                        
        lda $FF93                     ; $2182 ldh a,[a8]
        sta zA                        
                                      ; $2184 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $2185 jr z,pc+r8
        bne _s388                     
        jmp G_2189                    
_s388
        inc zL                        ; $2187 inc hl
        bne _s389                     
        inc zH                        
_s389
        lda zE                        ; $2188 dec de
        bne _s390                     
        dec zD                        
_s390
        dec zE                        
G_2189
        lda $C0E7                     ; $2189 ld a,[a16]
        sta zA                        
        inc zA                        ; $218C inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $218D ld [a16],a
        sta $C0E7                     
        lda #$08                      ; $2190 ld a,d8
        sta zA                        
                                      ; $2192 ldh [a8],a
        sta $FF90                     
        lda (zL),y                    ; $2194 ld a,[hl]
        sta zA                        
        sec                           ; $2195 cp d8
        lda zA                        
        sbc #$00                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $2197 jr z,pc+r8
        bne _s391                     
        jmp G_21B3                    
_s391
        sec                           ; $2199 cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $219B jr c,pc+r8
        lsr a                         
        bcc _s392                     
        jmp G_21DA                    
_s392
        lda zZ                        ; $219D jr z,pc+r8
        bne _s393                     
        jmp G_21BC                    
_s393
        sec                           ; $219F cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $21A1 jr z,pc+r8
        bne _s394                     
        jmp G_21C9                    
_s394
        sec                           ; $21A3 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $21A5 jr z,pc+r8
        bne _s395                     
        jmp G_21D0                    
_s395
        sec                           ; $21A7 cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $21A9 jr z,pc+r8
        bne _s396                     
        jmp G_21C9                    
_s396
        sec                           ; $21AB cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $21AD jr c,pc+r8
        lsr a                         
        bcc _s397                     
        jmp G_21DA                    
_s397
        lda zZ                        ; $21AF jr z,pc+r8
        bne _s398                     
        jmp G_21E0                    
_s398
        jmp G_21C9                    ; $21B1 jr pc+r8
G_21B3
        lda #$05                      ; $21B3 ld a,d8
        sta zA                        
                                      ; $21B5 ld [hl],a
        sta (zL),y                    
        lda zA                        ; $21B6 ld [de],a
        sta (zE),y                    
        lda #$29                      ; $21B7 ld a,d8
        sta zA                        
        jmp S_SOUND                   ; $21B9 jp a16
G_21BC
        lda (zE),y                    ; $21BC ld a,[de]
        sta zA                        
        sec                           ; $21BD cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $21BF jr z,pc+r8
        bne _s399                     
        jmp G_21B3                    
_s399
        lda #$04                      ; $21C1 ld a,d8
        sta zA                        
                                      ; $21C3 ld [hl],a
        sta (zL),y                    
        lda #$31                      ; $21C4 ld a,d8
        sta zA                        
        jmp S_SOUND                   ; $21C6 jp a16
G_21C9
        lda zA                        ; $21C9 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $21CA ld [hl],a
        sta (zL),y                    
        lda #$04                      ; $21CB ld a,d8
        sta zA                        
                                      ; $21CD ldh [a8],a
        sta $FF90                     
        rts                           ; $21CF ret
G_21D0
        lda zA                        ; $21D0 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $21D1 ld [de],a
        sta (zE),y                    
        lda #$06                      ; $21D2 ld a,d8
        sta zA                        
                                      ; $21D4 ld [hl],a
        sta (zL),y                    
        lda #$31                      ; $21D5 ld a,d8
        sta zA                        
        jmp S_SOUND                   ; $21D7 jp a16
G_21DA
        lda (zL),y                    ; $21DA inc [hl]
        clc                           
        adc #1                        
        sta (zL),y                    
        sta zZ                        
        lda #$31                      ; $21DB ld a,d8
        sta zA                        
        jmp S_SOUND                   ; $21DD jp a16
G_21E0
        lda (zE),y                    ; $21E0 ld a,[de]
        sta zA                        
        sec                           ; $21E1 cp d8
        lda zA                        
        sbc #$0D                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $21E3 jr z,pc+r8
        bne _s400                     
        jmp G_21B3                    
_s400
        lda #$0D                      ; $21E5 ld a,d8
        sta zA                        
                                      ; $21E7 ld [hl],a
        sta (zL),y                    
        lda #$31                      ; $21E8 ld a,d8
        sta zA                        
        jmp S_SOUND                   ; $21EA jp a16
G_2286
        jsr G_00A9                    ; $2286 call a16
        lda zA                        ; $2289 and d8
        and #$3F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        clc                           ; $228B add d8
        lda zA                        
        adc #$20                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda #$01                      ; $228D ld b,d8
        sta zB                        
        rts                           ; $228F ret
G_2290
        jsr G_00A9                    ; $2290 call a16
        lda zA                        ; $2293 and d8
        and #$1F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        sec                           ; $2295 sub d8
        lda zA                        
        sbc #$10                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #$02                      ; $2297 ld b,d8
        sta zB                        
        rts                           ; $2299 ret
G_229A
        lda $C0DF                     ; $229A ld a,[a16]
        sta zA                        
        sec                           ; $229D cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #<$0F48                   ; $229F ld bc,d16
        sta zC                        
        lda #>$0F48                   
        sta zB                        
        lda zZ                        ; $22A2 jr nz,pc+r8
        beq _s401                     
        jmp G_22A7                    
_s401
        lda #<$0750                   ; $22A4 ld bc,d16
        sta zC                        
        lda #>$0750                   
        sta zB                        
G_22A7
        jsr G_00A9                    ; $22A7 call a16
        lda zA                        ; $22AA and b
        and zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        clc                           ; $22AB add c
        lda zA                        
        adc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda #$01                      ; $22AC ld c,d8
        sta zC                        
        lda #$03                      ; $22AE ld b,d8
        sta zB                        
        rts                           ; $22B0 ret
G_22B1
        lda $FF91                     ; $22B1 ldh a,[a8]
        sta zA                        
                                      ; $22B3 bit 0,a
        and #$01                      
        sta zZ                        
        lda #$01                      ; $22B5 ld c,d8
        sta zC                        
        lda zZ                        ; $22B7 jr z,pc+r8
        bne _s402                     
        jmp G_22BB                    
_s402
        lda #$02                      ; $22B9 ld c,d8
        sta zC                        
G_22BB
        lda (zL),y                    ; $22BB ld a,[hl]
        sta zA                        
        jsr G_00CA                    ; $22BC call a16
        lda zCY                       ; $22BF jr c,pc+r8
        lsr a                         
        bcc _s403                     
        jmp G_22E1                    
_s403
        jsr G_00A9                    ; $22C1 call a16
        lda zA                        ; $22C4 and d8
        and #$F0                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        sec                           ; $22C6 cp d8
        lda zA                        
        sbc #$C0                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda $FF96                     ; $22C8 ldh a,[a8]
        sta zA                        
                                      ; $22CA ld b,a
        sta zB                        
        lda $FF91                     ; $22CB ldh a,[a8]
        sta zA                        
        lda zCY                       ; $22CD jr c,pc+r8
        lsr a                         
        bcc _s404                     
        jmp G_22D1                    
_s404
        lda zA                        ; $22CF xor d8
        eor #$02                      
        sta zA                        
        sta zZ                        
        sty zCY                       
G_22D1
        lda zB                        ; $22D1 bit 6,b
        and #$40                      
        sta zZ                        
                                      ; $22D3 jr z,pc+r8
        bne _s405                     
        jmp G_22D7                    
_s405
        lda zA                        ; $22D5 xor d8
        eor #$02                      
        sta zA                        
        sta zZ                        
        sty zCY                       
G_22D7
        lda zA                        ; $22D7 bit 1,a
        and #$02                      
        sta zZ                        
        lda #$20                      ; $22D9 ld a,d8
        sta zA                        
        lda zZ                        ; $22DB jr z,pc+r8
        bne _s406                     
        jmp G_22DF                    
_s406
        lda #$10                      ; $22DD ld a,d8
        sta zA                        
G_22DF
        lda zA                        ; $22DF or c
        ora zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $22E0 ld c,a
        sta zC                        
G_22E1
        jsr G_00A9                    ; $22E1 call a16
        lda zA                        ; $22E4 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $22E6 jr nz,pc+r8
        beq _s407                     
        jmp G_2309                    
_s407
        lda zA                        ; $22E8 bit 3,a
        and #$08                      
        sta zZ                        
        lda $C047                     ; $22EA ld a,[a16]
        sta zA                        
        lda zZ                        ; $22ED jr nz,pc+r8
        beq _s408                     
        jmp G_22F9                    
_s408
        sec                           ; $22EF cp d8
        lda zA                        
        sbc #$44                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $22F1 jr nc,pc+r8
        lsr a                         
        bcs _s409                     
        jmp G_2309                    
_s409
        lda $FF96                     ; $22F3 ldh a,[a8]
        sta zA                        
                                      ; $22F5 xor d8
        eor #$40                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        jmp G_22FF                    ; $22F7 jr pc+r8
G_22F9
        sec                           ; $22F9 cp d8
        lda zA                        
        sbc #$3C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $22FB jr c,pc+r8
        lsr a                         
        bcc _s410                     
        jmp G_2309                    
_s410
        lda $FF96                     ; $22FD ldh a,[a8]
        sta zA                        
G_22FF
        lda zA                        ; $22FF bit 6,a
        and #$40                      
        sta zZ                        
        lda #$80                      ; $2301 ld a,d8
        sta zA                        
        lda zZ                        ; $2303 jr z,pc+r8
        bne _s411                     
        jmp G_2307                    
_s411
        lda #$40                      ; $2305 ld a,d8
        sta zA                        
G_2307
        lda zA                        ; $2307 or c
        ora zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2308 ld c,a
        sta zC                        
G_2309
        lda #$04                      ; $2309 ld a,d8
        sta zA                        
        rts                           ; $230B ret
G_2720
        lda $FF96                     ; $2720 ldh a,[a8]
        sta zA                        
                                      ; $2722 bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $2724 ret nz
        beq _s412                     
        rts                           
_s412
        lda #$00                      ; $2725 ld c,d8
        sta zC                        
        lda $FFAD                     ; $2727 ldh a,[a8]
        sta zA                        
                                      ; $2729 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $272B jr z,pc+r8
        bne _s413                     
        jmp G_2732                    
_s413
        jsr G_27BC                    ; $272D call a16
        jmp G_2735                    ; $2730 jr pc+r8
G_2732
        jsr G_2750                    ; $2732 call a16
G_2735
        lda $C05A                     ; $2735 ld a,[a16]
        sta zA                        
        sec                           ; $2738 cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $273A jr z,pc+r8
        bne _s414                     
        jmp G_2746                    
_s414
        lda $FFAD                     ; $273C ldh a,[a8]
        sta zA                        
                                      ; $273E bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $2740 jr z,pc+r8
        bne _s415                     
        jmp G_2746                    
_s415
        lda zC                        ; $2742 res 0,c
        and #$FE                      
        sta zC                        
                                      ; $2744 res 1,c
        and #$FD                      
        sta zC                        
G_2746
        lda $FF9C                     ; $2746 ldh a,[a8]
        sta zA                        
                                      ; $2748 xor c
        eor zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2749 and c
        and zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $274A ldh [a8],a
        sta $FF9D                     
        lda zC                        ; $274C ld a,c
        sta zA                        
                                      ; $274D ldh [a8],a
        sta $FF9C                     
        rts                           ; $274F ret
G_2750
        lda $FF96                     ; $2750 ldh a,[a8]
        sta zA                        
                                      ; $2752 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $2754 ret z
        bne _s416                     
        rts                           
_s416
        lda $FFB5                     ; $2755 ldh a,[a8]
        sta zA                        
        jsr G_RST08                   ; $2757 rst vec
        .word G_2762, G_2771, G_277F, G_2799, G_27AE, G_20FA
G_2762
        lda $C020                     ; $2762 ld a,[a16]
        sta zA                        
        sec                           ; $2765 cp d8
        lda zA                        
        sbc #$05                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $2767 ret nz
        beq _s417                     
        rts                           
_s417
        jsr G_2286                    ; $2768 call a16
        lda zA                        ; $276B ldh [a8],a
        sta $FFB6                     
        lda zB                        ; $276D ld a,b
        sta zA                        
                                      ; $276E ldh [a8],a
        sta $FFB5                     
        rts                           ; $2770 ret
G_2771
        lda #<$FFB6                   ; $2771 ld hl,d16
        sta zL                        
        lda #>$FFB6                   
        sta zH                        
        lda (zL),y                    ; $2774 dec [hl]
        sec                           
        sbc #1                        
        sta (zL),y                    
        sta zZ                        
                                      ; $2775 ret nz
        beq _s418                     
        rts                           
_s418
        jsr G_2290                    ; $2776 call a16
        lda zA                        ; $2779 ldh [a8],a
        sta $FFB6                     
        lda zB                        ; $277B ld a,b
        sta zA                        
                                      ; $277C ldh [a8],a
        sta $FFB5                     
        rts                           ; $277E ret
G_277F
        lda $FFB6                     ; $277F ldh a,[a8]
        sta zA                        
                                      ; $2781 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $2783 jr nz,pc+r8
        beq _s419                     
        jmp G_278A                    
_s419
        lda #$20                      ; $2785 ld c,d8
        sta zC                        
        dec zA                        ; $2787 dec a
        lda zA                        
        sta zZ                        
        jmp G_278D                    ; $2788 jr pc+r8
G_278A
        lda #$10                      ; $278A ld c,d8
        sta zC                        
        inc zA                        ; $278C inc a
        lda zA                        
        sta zZ                        
G_278D
        lda zA                        ; $278D ldh [a8],a
        sta $FFB6                     
        lda zZ                        ; $278F ret nz
        beq _s420                     
        rts                           
_s420
        jsr G_229A                    ; $2790 call a16
        lda zA                        ; $2793 ldh [a8],a
        sta $FFB6                     
        lda zB                        ; $2795 ld a,b
        sta zA                        
                                      ; $2796 ldh [a8],a
        sta $FFB5                     
        rts                           ; $2798 ret
G_2799
        lda $C020                     ; $2799 ld a,[a16]
        sta zA                        
        sec                           ; $279C cp d8
        lda zA                        
        sbc #$06                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $279E jr nz,pc+r8
        beq _s421                     
        jmp G_2762                    
_s421
        lda #<$FFB6                   ; $27A0 ld hl,d16
        sta zL                        
        lda #>$FFB6                   
        sta zH                        
        lda (zL),y                    ; $27A3 dec [hl]
        sec                           
        sbc #1                        
        sta (zL),y                    
        sta zZ                        
                                      ; $27A4 ret nz
        beq _s422                     
        rts                           
_s422
        lda #<$C0B4                   ; $27A5 ld hl,d16
        sta zL                        
        lda #>$C0B4                   
        sta zH                        
        jsr G_22B1                    ; $27A8 call a16
        lda zA                        ; $27AB ldh [a8],a
        sta $FFB5                     
        rts                           ; $27AD ret
G_27AE
        lda $FF9C                     ; $27AE ldh a,[a8]
        sta zA                        
                                      ; $27B0 and d8
        and #$F0                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $27B2 ld c,a
        sta zC                        
        lda $FFAD                     ; $27B3 ldh a,[a8]
        sta zA                        
                                      ; $27B5 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $27B7 ret z
        bne _s423                     
        rts                           
_s423
        lda zA                        ; $27B8 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $27B9 ldh [a8],a
        sta $FFB5                     
        rts                           ; $27BB ret
G_27BC
        lda $FFC2                     ; $27BC ldh a,[a8]
        sta zA                        
                                      ; $27BE bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $27C0 ret nz
        beq _s424                     
        rts                           
_s424
        lda $C04C                     ; $27C1 ld a,[a16]
        sta zA                        
        sec                           ; $27C4 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $27C6 ret nc
        lsr a                         
        bcs _s425                     
        rts                           
_s425
        lda $FFB5                     ; $27C7 ldh a,[a8]
        sta zA                        
        jsr G_RST08                   ; $27C9 rst vec
        .word G_27D6, G_287F, G_28C1, G_29A7, G_2A63, G_2A72
G_27D6
        lda zA                        ; $27D6 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $27D7 ldh [a8],a
        sta $FFB9                     
        lda $FFAD                     ; $27D9 ldh a,[a8]
        sta zA                        
                                      ; $27DB bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $27DD jr nz,pc+r8
        beq _s426                     
        jmp G_27E5                    
_s426
        lda $C043                     ; $27DF ld a,[a16]
        sta zA                        
        sec                           ; $27E2 cp d8
        lda zA                        
        sbc #$70                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $27E4 ret c
        lsr a                         
        bcc _s427                     
        rts                           
_s427
G_27E5
        lda $C05A                     ; $27E5 ld a,[a16]
        sta zA                        
        sec                           ; $27E8 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $27EA jr c,pc+r8
        lsr a                         
        bcc _s428                     
        jmp G_283A                    
_s428
        lda #$00                      ; $27EC ld c,d8
        sta zC                        
        lda $C023                     ; $27EE ld a,[a16]
        sta zA                        
        sec                           ; $27F1 cp d8
        lda zA                        
        sbc #$38                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $27F3 jr c,pc+r8
        lsr a                         
        bcc _s429                     
        jmp G_27FD                    
_s429
        lda #$03                      ; $27F5 ld c,d8
        sta zC                        
        sec                           ; $27F7 cp d8
        lda zA                        
        sbc #$56                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $27F9 jr c,pc+r8
        lsr a                         
        bcc _s430                     
        jmp G_27FD                    
_s430
        lda #$06                      ; $27FB ld c,d8
        sta zC                        
G_27FD
        lda #$00                      ; $27FD ld b,d8
        sta zB                        
        lda #<$C0B7                   ; $27FF ld hl,d16
        sta zL                        
        lda #>$C0B7                   
        sta zH                        
        clc                           ; $2802 add hl,bc
        lda zL                        
        adc zC                        
        sta zL                        
        lda zH                        
        adc zB                        
        sta zH                        
        rol zCY                       
        lda #$00                      ; $2803 ld d,d8
        sta zD                        
        lda $C0DF                     ; $2805 ld a,[a16]
        sta zA                        
        sec                           ; $2808 cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $280A jr c,pc+r8
        lsr a                         
        bcc _s431                     
        jmp G_281A                    
_s431
        lda $C023                     ; $280C ld a,[a16]
        sta zA                        
        sec                           ; $280F sub d8
        lda zA                        
        sbc #$6C                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2811 jr nc,pc+r8
        lsr a                         
        bcs _s432                     
        jmp G_2815                    
_s432
        lda zA                        ; $2813 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $2814 inc a
        lda zA                        
        sta zZ                        
G_2815
        lda zA                        ; $2815 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2817 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2819 ld d,a
        sta zD                        
G_281A
        lda (zL),y                    ; $281A ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s433                     
        inc zH                        
_s433
        sec                           ; $281B sub d
        lda zA                        
        sbc zD                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $281C jr nc,pc+r8
        lsr a                         
        bcs _s434                     
        jmp G_281F                    
_s434
        lda zA                        ; $281E xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
G_281F
        lda zA                        ; $281F ld d,a
        sta zD                        
        lda zH                        ; $2820 push hl
        pha                           
        lda zL                        
        pha                           
        jsr G_00CA                    ; $2821 call a16
        pla                           ; $2824 pop hl
        sta zL                        
        pla                           
        sta zH                        
        lda zCY                       ; $2825 jr nc,pc+r8
        lsr a                         
        bcs _s435                     
        jmp G_283A                    
_s435
        lda (zL),y                    ; $2827 ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s436                     
        inc zH                        
_s436
        clc                           ; $2828 add d
        lda zA                        
        adc zD                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2829 ld d,a
        sta zD                        
        lda zH                        ; $282A push hl
        pha                           
        lda zL                        
        pha                           
        jsr G_00D9                    ; $282B call a16
        pla                           ; $282E pop hl
        sta zL                        
        pla                           
        sta zH                        
        lda zCY                       ; $282F jr nc,pc+r8
        lsr a                         
        bcs _s437                     
        jmp G_2844                    
_s437
        lda (zL),y                    ; $2831 ld a,[hl]
        sta zA                        
        clc                           ; $2832 add d
        lda zA                        
        adc zD                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        jsr G_00D9                    ; $2833 call a16
        lda zCY                       ; $2836 jr nc,pc+r8
        lsr a                         
        bcs _s438                     
        jmp G_2865                    
_s438
        jmp G_286D                    ; $2838 jr pc+r8
G_283A
        lda $C025                     ; $283A ld a,[a16]
        sta zA                        
                                      ; $283D ldh [a8],a
        sta $FFB7                     
        lda $C023                     ; $283F ld a,[a16]
        sta zA                        
        jmp G_2874                    ; $2842 jr pc+r8
G_2844
        jsr G_00A9                    ; $2844 call a16
        lda zA                        ; $2847 and d8
        and #$3F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        clc                           ; $2849 add d8
        lda zA                        
        adc #$4C                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $284B ld b,a
        sta zB                        
        lda $C025                     ; $284C ld a,[a16]
        sta zA                        
        lda #<$C045                   ; $284F ld hl,d16
        sta zL                        
        lda #>$C045                   
        sta zH                        
        clc                           ; $2852 add [hl]
        lda zA                        
        adc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $2853 rra
        lsr a                         
        lda zA                        
        ror a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        clc                           ; $2854 add b
        lda zA                        
        adc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $2855 rra
        lsr a                         
        lda zA                        
        ror a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zA                        ; $2856 ldh [a8],a
        sta $FFB7                     
        lda $C023                     ; $2858 ld a,[a16]
        sta zA                        
        clc                           ; $285B add d8
        lda zA                        
        adc #$20                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        sec                           ; $285D cp d8
        lda zA                        
        sbc #$6C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $285F jr c,pc+r8
        lsr a                         
        bcc _s439                     
        jmp G_2874                    
_s439
        lda #$6C                      ; $2861 ld a,d8
        sta zA                        
        jmp G_2874                    ; $2863 jr pc+r8
G_2865
        lda #$6C                      ; $2865 ld a,d8
        sta zA                        
                                      ; $2867 ldh [a8],a
        sta $FFB7                     
        lda #$38                      ; $2869 ld a,d8
        sta zA                        
        jmp G_2874                    ; $286B jr pc+r8
G_286D
        lda #$6C                      ; $286D ld a,d8
        sta zA                        
                                      ; $286F ldh [a8],a
        sta $FFB7                     
        lda $C023                     ; $2871 ld a,[a16]
        sta zA                        
G_2874
        lda zA                        ; $2874 ldh [a8],a
        sta $FFB8                     
        lda #$00                      ; $2876 ld c,d8
        sta zC                        
        lda zA                        ; $2878 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2879 ldh [a8],a
        sta $FFB6                     
        inc zA                        ; $287B inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $287C ldh [a8],a
        sta $FFB5                     
        rts                           ; $287E ret
G_287F
        lda #<$FFB7                   ; $287F ld hl,d16
        sta zL                        
        lda #>$FFB7                   
        sta zH                        
        lda $C025                     ; $2882 ld a,[a16]
        sta zA                        
        sec                           ; $2885 sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $2886 jr z,pc+r8
        bne _s440                     
        jmp G_288E                    
_s440
        lda #$20                      ; $2888 ld c,d8
        sta zC                        
        lda zCY                       ; $288A jr nc,pc+r8
        lsr a                         
        bcs _s441                     
        jmp G_288E                    
_s441
        lda #$10                      ; $288C ld c,d8
        sta zC                        
G_288E
        inc zL                        ; $288E inc hl
        bne _s442                     
        inc zH                        
_s442
        lda $C023                     ; $288F ld a,[a16]
        sta zA                        
        sec                           ; $2892 sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $2893 jr z,pc+r8
        bne _s443                     
        jmp G_289D                    
_s443
        lda #$40                      ; $2895 ld a,d8
        sta zA                        
        lda zCY                       ; $2897 jr nc,pc+r8
        lsr a                         
        bcs _s444                     
        jmp G_289B                    
_s444
        lda #$80                      ; $2899 ld a,d8
        sta zA                        
G_289B
        lda zA                        ; $289B or c
        ora zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $289C ld c,a
        sta zC                        
G_289D
        lda $FFAD                     ; $289D ldh a,[a8]
        sta zA                        
                                      ; $289F bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $28A1 ret z
        bne _s445                     
        rts                           
_s445
        lda $C05A                     ; $28A2 ld a,[a16]
        sta zA                        
        sec                           ; $28A5 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda $C0B0                     ; $28A7 ld a,[a16]
        sta zA                        
        lda zCY                       ; $28AA jr nc,pc+r8
        lsr a                         
        bcs _s446                     
        jmp G_28B7                    
_s446
        lda zA                        ; $28AC ld b,a
        sta zB                        
        lda $C051                     ; $28AD ld a,[a16]
        sta zA                        
                                      ; $28B0 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $28B2 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $28B4 ld l,a
        sta zL                        
        lda zB                        ; $28B5 ld a,b
        sta zA                        
        sec                           ; $28B6 sub l
        lda zA                        
        sbc zL                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
G_28B7
        lda #<$C043                   ; $28B7 ld hl,d16
        sta zL                        
        lda #>$C043                   
        sta zH                        
        sec                           ; $28BA cp [hl]
        lda zA                        
        sbc (zL),y                    
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $28BB ret c
        lsr a                         
        bcc _s447                     
        rts                           
_s447
        lda #$02                      ; $28BC ld a,d8
        sta zA                        
                                      ; $28BE ldh [a8],a
        sta $FFB5                     
        rts                           ; $28C0 ret
G_28C1
        lda $FFB6                     ; $28C1 ldh a,[a8]
        sta zA                        
                                      ; $28C3 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $28C4 jr z,pc+r8
        bne _s448                     
        jmp G_28D5                    
_s448
        dec zA                        ; $28C6 dec a
        lda zA                        
        sta zZ                        
        lda zA                        ; $28C7 ldh [a8],a
        sta $FFB6                     
        lda #$00                      ; $28C9 ld b,d8
        sta zB                        
        lda zZ                        ; $28CB jp nz,a16
        beq _s449                     
        jmp G_297D                    
_s449
        lda #$03                      ; $28CE ld a,d8
        sta zA                        
                                      ; $28D0 ldh [a8],a
        sta $FFB5                     
        jmp G_297D                    ; $28D2 jp a16
G_28D5
        lda $C051                     ; $28D5 ld a,[a16]
        sta zA                        
                                      ; $28D8 swap a
        asl a                         
        adc #$80                      
        rol a                         
        asl a                         
        adc #$80                      
        rol a                         
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $28DA and d8
        and #$0F                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $28DC ld b,a
        sta zB                        
                                      ; $28DD srl b
        lsr a                         
        sta zB                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $28DF sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $28E1 sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        sec                           ; $28E3 sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $28E4 ld b,a
        sta zB                        
        lda #<$C023                   ; $28E5 ld hl,d16
        sta zL                        
        lda #>$C023                   
        sta zH                        
        lda $C043                     ; $28E8 ld a,[a16]
        sta zA                        
        sec                           ; $28EB sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        sec                           ; $28EC cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $28ED jr nc,pc+r8
        lsr a                         
        bcs _s450                     
        jmp G_291B                    
_s450
        jsr G_08A6                    ; $28EF call a16
        jsr G_1722                    ; $28F2 call a16
        lda $C025                     ; $28F5 ld a,[a16]
        sta zA                        
        sec                           ; $28F8 sub h
        lda zA                        
        sbc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        clc                           ; $28F9 add d8
        lda zA                        
        adc #$14                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        sec                           ; $28FB cp d8
        lda zA                        
        sbc #$28                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $28FD jr nc,pc+r8
        lsr a                         
        bcs _s451                     
        jmp G_291B                    
_s451
        lda $C047                     ; $28FF ld a,[a16]
        sta zA                        
        sec                           ; $2902 cp d8
        lda zA                        
        sbc #$48                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2904 jr nc,pc+r8
        lsr a                         
        bcs _s452                     
        jmp G_297B                    
_s452
        lda $C04B                     ; $2906 ld a,[a16]
        sta zA                        
        sec                           ; $2909 cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $290B jr nc,pc+r8
        lsr a                         
        bcs _s453                     
        jmp G_2913                    
_s453
        lda $C04C                     ; $290D ld a,[a16]
        sta zA                        
                                      ; $2910 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $2911 jr z,pc+r8
        bne _s454                     
        jmp G_291B                    
_s454
G_2913
        jsr G_00A9                    ; $2913 call a16
        lda zA                        ; $2916 and d8
        and #$07                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        inc zA                        ; $2918 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $2919 ldh [a8],a
        sta $FFB6                     
G_291B
        lda $C047                     ; $291B ld a,[a16]
        sta zA                        
        sec                           ; $291E cp d8
        lda zA                        
        sbc #$60                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2920 jr c,pc+r8
        lsr a                         
        bcc _s455                     
        jmp G_292E                    
_s455
        lda $FFB9                     ; $2922 ldh a,[a8]
        sta zA                        
                                      ; $2924 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $2925 jr nz,pc+r8
        beq _s456                     
        jmp G_292E                    
_s456
        lda #$05                      ; $2927 ld a,d8
        sta zA                        
                                      ; $2929 ldh [a8],a
        sta $FFB5                     
        lda #$00                      ; $292B ld c,d8
        sta zC                        
        rts                           ; $292D ret
G_292E
        lda $C0B0                     ; $292E ld a,[a16]
        sta zA                        
        lda #<$C043                   ; $2931 ld hl,d16
        sta zL                        
        lda #>$C043                   
        sta zH                        
        sec                           ; $2934 cp [hl]
        lda zA                        
        sbc (zL),y                    
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2935 jr c,pc+r8
        lsr a                         
        bcc _s457                     
        jmp G_2948                    
_s457
        lda $C047                     ; $2937 ld a,[a16]
        sta zA                        
                                      ; $293A bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $293C jr nz,pc+r8
        beq _s458                     
        jmp G_297B                    
_s458
        sec                           ; $293E cp d8
        lda zA                        
        sbc #$30                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2940 jr nc,pc+r8
        lsr a                         
        bcs _s459                     
        jmp G_294C                    
_s459
        lda $C04C                     ; $2942 ld a,[a16]
        sta zA                        
                                      ; $2945 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $2946 jr nz,pc+r8
        beq _s460                     
        jmp G_294C                    
_s460
G_2948
        lda #$00                      ; $2948 ld b,d8
        sta zB                        
        jmp G_297D                    ; $294A jr pc+r8
G_294C
        lda #$80                      ; $294C ld b,d8
        sta zB                        
        lda $C05A                     ; $294E ld a,[a16]
        sta zA                        
        sec                           ; $2951 cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2953 jr nc,pc+r8
        lsr a                         
        bcs _s461                     
        jmp G_295E                    
_s461
        lda $C023                     ; $2955 ld a,[a16]
        sta zA                        
        sec                           ; $2958 cp d8
        lda zA                        
        sbc #$4C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $295A jr c,pc+r8
        lsr a                         
        bcc _s462                     
        jmp G_295E                    
_s462
        lda #$00                      ; $295C ld b,d8
        sta zB                        
G_295E
        lda $C051                     ; $295E ld a,[a16]
        sta zA                        
                                      ; $2961 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2963 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2965 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2967 ld c,a
        sta zC                        
        lda $C052                     ; $2968 ld a,[a16]
        sta zA                        
                                      ; $296B bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $296D jr z,pc+r8
        bne _s463                     
        jmp G_2971                    
_s463
        lda zC                        ; $296F srl c
        lsr a                         
        sta zC                        
        sta zZ                        
        rol zCY                       
G_2971
        lda $C043                     ; $2971 ld a,[a16]
        sta zA                        
        sec                           ; $2974 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #<$C023                   ; $2975 ld hl,d16
        sta zL                        
        lda #>$C023                   
        sta zH                        
        sec                           ; $2978 sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2979 jr nc,pc+r8
        lsr a                         
        bcs _s464                     
        jmp G_297D                    
_s464
G_297B
        lda #$40                      ; $297B ld b,d8
        sta zB                        
G_297D
        lda zB                        ; $297D push bc
        pha                           
        lda zC                        
        pha                           
        jsr G_08A6                    ; $297E call a16
        jsr G_1722                    ; $2981 call a16
        lda $C025                     ; $2984 ld a,[a16]
        sta zA                        
        sec                           ; $2987 sub h
        lda zA                        
        sbc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #$20                      ; $2988 ld c,d8
        sta zC                        
        lda zA                        ; $298A bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $298C jr z,pc+r8
        bne _s465                     
        jmp G_2992                    
_s465
        lda #$10                      ; $298E ld c,d8
        sta zC                        
        lda zA                        ; $2990 cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $2991 inc a
        lda zA                        
        sta zZ                        
G_2992
        sec                           ; $2992 cp d8
        lda zA                        
        sbc #$08                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2994 jr c,pc+r8
        lsr a                         
        bcc _s466                     
        jmp G_299E                    
_s466
        sec                           ; $2996 cp d8
        lda zA                        
        sbc #$10                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2998 jr nc,pc+r8
        lsr a                         
        bcs _s467                     
        jmp G_29A2                    
_s467
        lda #$00                      ; $299A ld c,d8
        sta zC                        
        jmp G_29A2                    ; $299C jr pc+r8
G_299E
        lda zC                        ; $299E ld a,c
        sta zA                        
                                      ; $299F xor d8
        eor #$30                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $29A1 ld c,a
        sta zC                        
G_29A2
        lda zC                        ; $29A2 ld a,c
        sta zA                        
        pla                           ; $29A3 pop bc
        sta zC                        
        pla                           
        sta zB                        
        lda zA                        ; $29A4 or b
        ora zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $29A5 ld c,a
        sta zC                        
        rts                           ; $29A6 ret
G_29A7
        jsr G_176B                    ; $29A7 call a16
        lda #$00                      ; $29AA ld c,d8
        sta zC                        
        lda zCY                       ; $29AC jr c,pc+r8
        lsr a                         
        bcc _s468                     
        jmp G_29E0                    
_s468
        lda $C00B                     ; $29AE ld a,[a16]
        sta zA                        
        sec                           ; $29B1 cp d8
        lda zA                        
        sbc #$08                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $29B3 jr c,pc+r8
        lsr a                         
        bcc _s469                     
        jmp G_29DE                    
_s469
        lda $FF9A                     ; $29B5 ldh a,[a8]
        sta zA                        
                                      ; $29B7 bit 6,a
        and #$40                      
        sta zZ                        
                                      ; $29B9 jr z,pc+r8
        bne _s470                     
        jmp G_29C4                    
_s470
        lda $C003                     ; $29BB ld a,[a16]
        sta zA                        
        sec                           ; $29BE cp d8
        lda zA                        
        sbc #$A0                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $29C0 jr nc,pc+r8
        lsr a                         
        bcs _s471                     
        jmp G_29C4                    
_s471
        lda #$1E                      ; $29C2 ld c,d8
        sta zC                        
G_29C4
        lda $C0B1                     ; $29C4 ld a,[a16]
        sta zA                        
        clc                           ; $29C7 add c
        lda zA                        
        adc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $29C8 push af
        pha                           
        jsr G_GETF                    
        pha                           
        lda $C02B                     ; $29C9 ld a,[a16]
        sta zA                        
        sec                           ; $29CC cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $29CE jr c,pc+r8
        lsr a                         
        bcc _s472                     
        jmp G_29D6                    
_s472
        pla                           ; $29D0 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
                                      ; $29D1 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $29D3 srl a
        lsr a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $29D5 push af
        pha                           
        jsr G_GETF                    
        pha                           
G_29D6
        pla                           ; $29D6 pop af
        jsr G_SETF                    
        pla                           
        sta zA                        
        jsr G_00CA                    ; $29D7 call a16
        lda #$02                      ; $29DA ld c,d8
        sta zC                        
        lda zCY                       ; $29DC jr nc,pc+r8
        lsr a                         
        bcs _s473                     
        jmp G_29E0                    
_s473
G_29DE
        lda #$01                      ; $29DE ld c,d8
        sta zC                        
G_29E0
        lda $C02B                     ; $29E0 ld a,[a16]
        sta zA                        
        sec                           ; $29E3 cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda $C0B5                     ; $29E5 ld a,[a16]
        sta zA                        
        lda zCY                       ; $29E8 jr c,pc+r8
        lsr a                         
        bcc _s474                     
        jmp G_29EC                    
_s474
        clc                           ; $29EA add d8
        lda zA                        
        adc #$14                      
        sta zA                        
        sta zZ                        
        rol zCY                       
G_29EC
        jsr G_00CA                    ; $29EC call a16
        lda #$00                      ; $29EF ld b,d8
        sta zB                        
        lda zCY                       ; $29F1 jr c,pc+r8
        lsr a                         
        bcc _s475                     
        jmp G_2A29                    
_s475
        lda $C0DF                     ; $29F3 ld a,[a16]
        sta zA                        
        sec                           ; $29F6 cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #$03                      ; $29F8 ld h,d8
        sta zH                        
        lda zZ                        ; $29FA jr nz,pc+r8
        beq _s476                     
        jmp G_29FE                    
_s476
        lda #$01                      ; $29FC ld h,d8
        sta zH                        
G_29FE
        jsr G_00A9                    ; $29FE call a16
        lda zA                        ; $2A01 and h
        and zH                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $2A02 jr nz,pc+r8
        beq _s477                     
        jmp G_2A0E                    
_s477
        lda $FF9A                     ; $2A04 ldh a,[a8]
        sta zA                        
                                      ; $2A06 bit 5,a
        and #$20                      
        sta zZ                        
                                      ; $2A08 jr nz,pc+r8
        beq _s478                     
        jmp G_2A15                    
_s478
        lda zA                        ; $2A0A bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $2A0C jr nz,pc+r8
        beq _s479                     
        jmp G_2A20                    
_s479
G_2A0E
        lda $C005                     ; $2A0E ld a,[a16]
        sta zA                        
        sec                           ; $2A11 cp d8
        lda zA                        
        sbc #$6C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A13 jr nc,pc+r8
        lsr a                         
        bcs _s480                     
        jmp G_2A20                    
_s480
G_2A15
        lda $C025                     ; $2A15 ld a,[a16]
        sta zA                        
        sec                           ; $2A18 cp d8
        lda zA                        
        sbc #$88                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A1A jr nc,pc+r8
        lsr a                         
        bcs _s481                     
        jmp G_2A29                    
_s481
        lda #$10                      ; $2A1C ld b,d8
        sta zB                        
        jmp G_2A29                    ; $2A1E jr pc+r8
G_2A20
        lda $C025                     ; $2A20 ld a,[a16]
        sta zA                        
        sec                           ; $2A23 cp d8
        lda zA                        
        sbc #$50                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A25 jr c,pc+r8
        lsr a                         
        bcc _s482                     
        jmp G_2A29                    
_s482
        lda #$20                      ; $2A27 ld b,d8
        sta zB                        
G_2A29
        lda zB                        ; $2A29 ld a,b
        sta zA                        
                                      ; $2A2A or c
        ora zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2A2B ld c,a
        sta zC                        
                                      ; $2A2C bit 1,c
        and #$02                      
        sta zZ                        
                                      ; $2A2E jr z,pc+r8
        bne _s483                     
        jmp G_2A37                    
_s483
        jsr G_00A9                    ; $2A30 call a16
        lda zA                        ; $2A33 bit 4,a
        and #$10                      
        sta zZ                        
                                      ; $2A35 jr nz,pc+r8
        beq _s484                     
        jmp G_2A4E                    
_s484
G_2A37
        lda #$00                      ; $2A37 ld b,d8
        sta zB                        
        jsr G_00A9                    ; $2A39 call a16
        lda zA                        ; $2A3C bit 0,a
        and #$01                      
        sta zZ                        
                                      ; $2A3E jr z,pc+r8
        bne _s485                     
        jmp G_2A5B                    
_s485
        lda $C003                     ; $2A40 ld a,[a16]
        sta zA                        
        sec                           ; $2A43 cp d8
        lda zA                        
        sbc #$B0                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A45 jr nc,pc+r8
        lsr a                         
        bcs _s486                     
        jmp G_2A52                    
_s486
        lda $C023                     ; $2A47 ld a,[a16]
        sta zA                        
        sec                           ; $2A4A cp d8
        lda zA                        
        sbc #$40                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A4C jr nc,pc+r8
        lsr a                         
        bcs _s487                     
        jmp G_2A5B                    
_s487
G_2A4E
        lda #$80                      ; $2A4E ld b,d8
        sta zB                        
        jmp G_2A5B                    ; $2A50 jr pc+r8
G_2A52
        lda $C023                     ; $2A52 ld a,[a16]
        sta zA                        
        sec                           ; $2A55 cp d8
        lda zA                        
        sbc #$40                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A57 jr c,pc+r8
        lsr a                         
        bcc _s488                     
        jmp G_2A5B                    
_s488
        lda #$40                      ; $2A59 ld b,d8
        sta zB                        
G_2A5B
        lda zB                        ; $2A5B ld a,b
        sta zA                        
                                      ; $2A5C or c
        ora zC                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2A5D ld c,a
        sta zC                        
        lda #$04                      ; $2A5E ld a,d8
        sta zA                        
                                      ; $2A60 ldh [a8],a
        sta $FFB5                     
        rts                           ; $2A62 ret
G_2A63
        lda $FF9C                     ; $2A63 ldh a,[a8]
        sta zA                        
                                      ; $2A65 and d8
        and #$F0                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2A67 ld c,a
        sta zC                        
        lda $C020                     ; $2A68 ld a,[a16]
        sta zA                        
        sec                           ; $2A6B cp d8
        lda zA                        
        sbc #$02                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $2A6D ret z
        bne _s489                     
        rts                           
_s489
        lda zA                        ; $2A6E xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2A6F ldh [a8],a
        sta $FFB5                     
        rts                           ; $2A71 ret
G_2A72
        lda $FFB6                     ; $2A72 ldh a,[a8]
        sta zA                        
                                      ; $2A74 and a
        and zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zZ                        ; $2A75 jr z,pc+r8
        bne _s490                     
        jmp G_2A86                    
_s490
        dec zA                        ; $2A77 dec a
        lda zA                        
        sta zZ                        
        lda zA                        ; $2A78 ldh [a8],a
        sta $FFB6                     
        lda #$00                      ; $2A7A ld b,d8
        sta zB                        
        lda zZ                        ; $2A7C jp nz,a16
        beq _s491                     
        jmp G_2B11                    
_s491
        lda #$03                      ; $2A7F ld a,d8
        sta zA                        
                                      ; $2A81 ldh [a8],a
        sta $FFB5                     
        jmp G_2B11                    ; $2A83 jp a16
G_2A86
        lda #<$C023                   ; $2A86 ld hl,d16
        sta zL                        
        lda #>$C023                   
        sta zH                        
        lda $C043                     ; $2A89 ld a,[a16]
        sta zA                        
        sec                           ; $2A8C sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        sec                           ; $2A8D cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A8F jr nc,pc+r8
        lsr a                         
        bcs _s492                     
        jmp G_2AB3                    
_s492
        lda #<$C024                   ; $2A91 ld hl,d16
        sta zL                        
        lda #>$C024                   
        sta zH                        
        jsr G_1BEF                    ; $2A94 call a16
        clc                           ; $2A97 add d8
        lda zA                        
        adc #$0C                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        sec                           ; $2A99 cp d8
        lda zA                        
        sbc #$10                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2A9B jr nc,pc+r8
        lsr a                         
        bcs _s493                     
        jmp G_2AB3                    
_s493
        lda $C047                     ; $2A9D ld a,[a16]
        sta zA                        
        sec                           ; $2AA0 cp d8
        lda zA                        
        sbc #$60                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2AA2 jr nc,pc+r8
        lsr a                         
        bcs _s494                     
        jmp G_2AB3                    
_s494
        lda $C052                     ; $2AA4 ld a,[a16]
        sta zA                        
                                      ; $2AA7 bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $2AA9 jr z,pc+r8
        bne _s495                     
        jmp G_2AB3                    
_s495
        jsr G_00A9                    ; $2AAB call a16
        lda zA                        ; $2AAE and d8
        and #$03                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        inc zA                        ; $2AB0 inc a
        lda zA                        
        sta zZ                        
        lda zA                        ; $2AB1 ldh [a8],a
        sta $FFB6                     
G_2AB3
        lda $C043                     ; $2AB3 ld a,[a16]
        sta zA                        
        sec                           ; $2AB6 cp d8
        lda zA                        
        sbc #$60                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2AB8 jr c,pc+r8
        lsr a                         
        bcc _s496                     
        jmp G_2ADA                    
_s496
        lda $C052                     ; $2ABA ld a,[a16]
        sta zA                        
                                      ; $2ABD bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $2ABF jr z,pc+r8
        bne _s497                     
        jmp G_2AE3                    
_s497
        lda $C025                     ; $2AC1 ld a,[a16]
        sta zA                        
        sec                           ; $2AC4 sub d8
        lda zA                        
        sbc #$08                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zA                        ; $2AC6 ld b,a
        sta zB                        
        lda $C045                     ; $2AC7 ld a,[a16]
        sta zA                        
        sec                           ; $2ACA sub b
        lda zA                        
        sbc zB                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2ACB jr nc,pc+r8
        lsr a                         
        bcs _s498                     
        jmp G_2ACF                    
_s498
        lda zA                        ; $2ACD cpl
        eor #$FF                      
        sta zA                        
        inc zA                        ; $2ACE inc a
        lda zA                        
        sta zZ                        
G_2ACF
        lda zA                        ; $2ACF sla a
        asl a                         
        sta zA                        
        sta zZ                        
        rol zCY                       
        clc                           ; $2AD1 add d8
        lda zA                        
        adc #$38                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $2AD3 ld b,a
        sta zB                        
        lda $C047                     ; $2AD4 ld a,[a16]
        sta zA                        
        sec                           ; $2AD7 cp b
        lda zA                        
        sbc zB                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2AD8 jr nc,pc+r8
        lsr a                         
        bcs _s499                     
        jmp G_2AE3                    
_s499
G_2ADA
        lda #$02                      ; $2ADA ld a,d8
        sta zA                        
                                      ; $2ADC ldh [a8],a
        sta $FFB5                     
        lda zA                        ; $2ADE ldh [a8],a
        sta $FFB9                     
        lda #$00                      ; $2AE0 ld c,d8
        sta zC                        
        rts                           ; $2AE2 ret
G_2AE3
        lda $C0B0                     ; $2AE3 ld a,[a16]
        sta zA                        
        lda #<$C043                   ; $2AE6 ld hl,d16
        sta zL                        
        lda #>$C043                   
        sta zH                        
        sec                           ; $2AE9 cp [hl]
        lda zA                        
        sbc (zL),y                    
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2AEA jr c,pc+r8
        lsr a                         
        bcc _s500                     
        jmp G_2B0F                    
_s500
        lda #$40                      ; $2AEC ld b,d8
        sta zB                        
        lda $C043                     ; $2AEE ld a,[a16]
        sta zA                        
        lda #<$C023                   ; $2AF1 ld hl,d16
        sta zL                        
        lda #>$C023                   
        sta zH                        
        sec                           ; $2AF4 sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2AF5 jr c,pc+r8
        lsr a                         
        bcc _s501                     
        jmp G_2B11                    
_s501
        sec                           ; $2AF7 cp d8
        lda zA                        
        sbc #$08                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2AF9 jr c,pc+r8
        lsr a                         
        bcc _s502                     
        jmp G_2AFB                    
_s502
G_2AFB
        lda #$40                      ; $2AFB ld b,d8
        sta zB                        
        lda $C043                     ; $2AFD ld a,[a16]
        sta zA                        
        lda #<$C023                   ; $2B00 ld hl,d16
        sta zL                        
        lda #>$C023                   
        sta zH                        
        sec                           ; $2B03 sub [hl]
        lda zA                        
        sbc (zL),y                    
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        sec                           ; $2B04 cp d8
        lda zA                        
        sbc #$18                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2B06 jr nc,pc+r8
        lsr a                         
        bcs _s503                     
        jmp G_2B0F                    
_s503
        lda $C047                     ; $2B08 ld a,[a16]
        sta zA                        
                                      ; $2B0B bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $2B0D jr nz,pc+r8
        beq _s504                     
        jmp G_2B11                    
_s504
G_2B0F
        lda #$00                      ; $2B0F ld b,d8
        sta zB                        
G_2B11
        lda zB                        ; $2B11 push bc
        pha                           
        lda zC                        
        pha                           
        jsr G_08A6                    ; $2B12 call a16
        jsr G_1722                    ; $2B15 call a16
        lda $C025                     ; $2B18 ld a,[a16]
        sta zA                        
        sec                           ; $2B1B sub h
        lda zA                        
        sbc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda #$20                      ; $2B1C ld c,d8
        sta zC                        
        lda zA                        ; $2B1E bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $2B20 jr z,pc+r8
        bne _s505                     
        jmp G_2B24                    
_s505
        lda #$10                      ; $2B22 ld c,d8
        sta zC                        
G_2B24
        sec                           ; $2B24 cp d8
        lda zA                        
        sbc #$04                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2B26 jr c,pc+r8
        lsr a                         
        bcc _s506                     
        jmp G_2B2C                    
_s506
        sec                           ; $2B28 cp d8
        lda zA                        
        sbc #$0C                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $2B2A jr nc,pc+r8
        lsr a                         
        bcs _s507                     
        jmp G_2B2E                    
_s507
G_2B2C
        lda #$00                      ; $2B2C ld c,d8
        sta zC                        
G_2B2E
        lda zC                        ; $2B2E ld a,c
        sta zA                        
        pla                           ; $2B2F pop bc
        sta zC                        
        pla                           
        sta zB                        
        lda zA                        ; $2B30 or b
        ora zB                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $2B31 ld c,a
        sta zC                        
        rts                           ; $2B32 ret
G_3047
        clc                           ; $3047 add a
        lda zA                        
        adc zA                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $3048 ld e,a
        sta zE                        
        lda #$00                      ; $3049 ld d,d8
        sta zD                        
        clc                           ; $304B add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
        lda (zL),y                    ; $304C ld a,[hl+]
        sta zA                        
        inc zL                        
        bne _s508                     
        inc zH                        
_s508
        lda (zL),y                    ; $304D ld h,[hl]
        sta zH                        
        lda zA                        ; $304E ld l,a
        sta zL                        
        rts                           ; $304F ret
G_308F
        lda #$00                      ; $308F ld d,d8
        sta zD                        
        lda #<$0000                   ; $3091 ld hl,d16
        sta zL                        
        lda #>$0000                   
        sta zH                        
        lda zA                        ; $3094 rrca
        lsr a                         
        bcc _s509                     
        ora #$80                      
_s509
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3095 jr nc,pc+r8
        lsr a                         
        bcs _s510                     
        jmp G_3098                    
_s510
        clc                           ; $3097 add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
G_3098
        lda zE                        ; $3098 sla e
        asl a                         
        sta zE                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $309A rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $309C rrca
        lsr a                         
        bcc _s511                     
        ora #$80                      
_s511
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $309D jr nc,pc+r8
        lsr a                         
        bcs _s512                     
        jmp G_30A0                    
_s512
        clc                           ; $309F add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
G_30A0
        lda zE                        ; $30A0 sla e
        asl a                         
        sta zE                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $30A2 rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $30A4 rrca
        lsr a                         
        bcc _s513                     
        ora #$80                      
_s513
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $30A5 jr nc,pc+r8
        lsr a                         
        bcs _s514                     
        jmp G_30A8                    
_s514
        clc                           ; $30A7 add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
G_30A8
        lda zE                        ; $30A8 sla e
        asl a                         
        sta zE                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $30AA rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $30AC rrca
        lsr a                         
        bcc _s515                     
        ora #$80                      
_s515
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $30AD jr nc,pc+r8
        lsr a                         
        bcs _s516                     
        jmp G_30B0                    
_s516
        clc                           ; $30AF add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
G_30B0
        lda zE                        ; $30B0 sla e
        asl a                         
        sta zE                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $30B2 rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $30B4 rrca
        lsr a                         
        bcc _s517                     
        ora #$80                      
_s517
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $30B5 jr nc,pc+r8
        lsr a                         
        bcs _s518                     
        jmp G_30B8                    
_s518
        clc                           ; $30B7 add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
G_30B8
        lda zE                        ; $30B8 sla e
        asl a                         
        sta zE                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $30BA rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $30BC rrca
        lsr a                         
        bcc _s519                     
        ora #$80                      
_s519
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $30BD jr nc,pc+r8
        lsr a                         
        bcs _s520                     
        jmp G_30C0                    
_s520
        clc                           ; $30BF add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
G_30C0
        lda zE                        ; $30C0 sla e
        asl a                         
        sta zE                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $30C2 rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $30C4 rrca
        lsr a                         
        bcc _s521                     
        ora #$80                      
_s521
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $30C5 jr nc,pc+r8
        lsr a                         
        bcs _s522                     
        jmp G_30C8                    
_s522
        clc                           ; $30C7 add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
G_30C8
        lda zE                        ; $30C8 sla e
        asl a                         
        sta zE                        
        sta zZ                        
        rol zCY                       
        lda zCY                       ; $30CA rl d
        lsr a                         
        lda zD                        
        rol a                         
        sta zD                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $30CC rrca
        lsr a                         
        bcc _s523                     
        ora #$80                      
_s523
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $30CD ret nc
        lsr a                         
        bcs _s524                     
        rts                           
_s524
        clc                           ; $30CE add hl,de
        lda zL                        
        adc zE                        
        sta zL                        
        lda zH                        
        adc zD                        
        sta zH                        
        rol zCY                       
        rts                           ; $30CF ret
G_3120
        lda zH                        ; $3120 push hl
        pha                           
        lda zL                        
        pha                           
        lda zD                        ; $3121 push de
        pha                           
        lda zE                        
        pha                           
        lda zD                        ; $3122 ld a,d
        sta zA                        
        jsr S_MUL                     ; $3123 call a16
        lda zL                        ; $3126 ld a,l
        sta zA                        
                                      ; $3127 ldh [a8],a
        sta $FFC9                     
        lda zH                        ; $3129 ld a,h
        sta zA                        
                                      ; $312A ldh [a8],a
        sta $FFCA                     
        lda zC                        ; $312C ld a,c
        sta zA                        
                                      ; $312D ldh [a8],a
        sta $FFCB                     
        pla                           ; $312F pop de
        sta zE                        
        pla                           
        sta zD                        
        pla                           ; $3130 pop hl
        sta zL                        
        pla                           
        sta zH                        
        lda zE                        ; $3131 ld a,e
        sta zA                        
        jsr S_MUL                     ; $3132 call a16
        lda $FFC9                     ; $3135 ldh a,[a8]
        sta zA                        
        clc                           ; $3137 add h
        lda zA                        
        adc zH                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $3138 ld h,a
        sta zH                        
        lda $FFCA                     ; $3139 ldh a,[a8]
        sta zA                        
        lda zCY                       ; $313B adc c
        lsr a                         
        lda zA                        
        adc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $313C ld c,a
        sta zC                        
        lda $FFCB                     ; $313D ldh a,[a8]
        sta zA                        
        lda zCY                       ; $313F adc d8
        lsr a                         
        lda zA                        
        adc #$00                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        lda zA                        ; $3141 ld b,a
        sta zB                        
        rts                           ; $3142 ret
G_3143
        lda zA                        ; $3143 ld c,a
        sta zC                        
        lda zA                        ; $3144 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        clc                           ; $3145 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $3146 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3147 jr c,pc+r8
        lsr a                         
        bcc _s525                     
        jmp G_314C                    
_s525
        sec                           ; $3149 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $314A jr c,pc+r8
        lsr a                         
        bcc _s526                     
        jmp G_314E                    
_s526
G_314C
        sec                           ; $314C sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $314D inc l
        lda zL                        
        sta zZ                        
G_314E
        clc                           ; $314E add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $314F rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3150 jr c,pc+r8
        lsr a                         
        bcc _s527                     
        jmp G_3155                    
_s527
        sec                           ; $3152 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $3153 jr c,pc+r8
        lsr a                         
        bcc _s528                     
        jmp G_3157                    
_s528
G_3155
        sec                           ; $3155 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $3156 inc l
        lda zL                        
        sta zZ                        
G_3157
        clc                           ; $3157 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $3158 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3159 jr c,pc+r8
        lsr a                         
        bcc _s529                     
        jmp G_315E                    
_s529
        sec                           ; $315B cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $315C jr c,pc+r8
        lsr a                         
        bcc _s530                     
        jmp G_3160                    
_s530
G_315E
        sec                           ; $315E sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $315F inc l
        lda zL                        
        sta zZ                        
G_3160
        clc                           ; $3160 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $3161 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3162 jr c,pc+r8
        lsr a                         
        bcc _s531                     
        jmp G_3167                    
_s531
        sec                           ; $3164 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $3165 jr c,pc+r8
        lsr a                         
        bcc _s532                     
        jmp G_3169                    
_s532
G_3167
        sec                           ; $3167 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $3168 inc l
        lda zL                        
        sta zZ                        
G_3169
        clc                           ; $3169 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $316A rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $316B jr c,pc+r8
        lsr a                         
        bcc _s533                     
        jmp G_3170                    
_s533
        sec                           ; $316D cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $316E jr c,pc+r8
        lsr a                         
        bcc _s534                     
        jmp G_3172                    
_s534
G_3170
        sec                           ; $3170 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $3171 inc l
        lda zL                        
        sta zZ                        
G_3172
        clc                           ; $3172 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $3173 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3174 jr c,pc+r8
        lsr a                         
        bcc _s535                     
        jmp G_3179                    
_s535
        sec                           ; $3176 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $3177 jr c,pc+r8
        lsr a                         
        bcc _s536                     
        jmp G_317B                    
_s536
G_3179
        sec                           ; $3179 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $317A inc l
        lda zL                        
        sta zZ                        
G_317B
        clc                           ; $317B add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $317C rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $317D jr c,pc+r8
        lsr a                         
        bcc _s537                     
        jmp G_3182                    
_s537
        sec                           ; $317F cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $3180 jr c,pc+r8
        lsr a                         
        bcc _s538                     
        jmp G_3184                    
_s538
G_3182
        sec                           ; $3182 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $3183 inc l
        lda zL                        
        sta zZ                        
G_3184
        clc                           ; $3184 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $3185 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3186 jr c,pc+r8
        lsr a                         
        bcc _s539                     
        jmp G_318B                    
_s539
        sec                           ; $3188 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $3189 jr c,pc+r8
        lsr a                         
        bcc _s540                     
        jmp G_318D                    
_s540
G_318B
        sec                           ; $318B sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $318C inc l
        lda zL                        
        sta zZ                        
G_318D
        clc                           ; $318D add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $318E rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $318F jr c,pc+r8
        lsr a                         
        bcc _s541                     
        jmp G_3194                    
_s541
        sec                           ; $3191 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $3192 jr c,pc+r8
        lsr a                         
        bcc _s542                     
        jmp G_3196                    
_s542
G_3194
        sec                           ; $3194 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $3195 inc l
        lda zL                        
        sta zZ                        
G_3196
        clc                           ; $3196 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $3197 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $3198 jr c,pc+r8
        lsr a                         
        bcc _s543                     
        jmp G_319D                    
_s543
        sec                           ; $319A cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $319B jr c,pc+r8
        lsr a                         
        bcc _s544                     
        jmp G_319F                    
_s544
G_319D
        sec                           ; $319D sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $319E inc l
        lda zL                        
        sta zZ                        
G_319F
        clc                           ; $319F add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $31A0 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $31A1 jr c,pc+r8
        lsr a                         
        bcc _s545                     
        jmp G_31A6                    
_s545
        sec                           ; $31A3 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $31A4 jr c,pc+r8
        lsr a                         
        bcc _s546                     
        jmp G_31A8                    
_s546
G_31A6
        sec                           ; $31A6 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $31A7 inc l
        lda zL                        
        sta zZ                        
G_31A8
        clc                           ; $31A8 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $31A9 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $31AA jr c,pc+r8
        lsr a                         
        bcc _s547                     
        jmp G_31AF                    
_s547
        sec                           ; $31AC cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $31AD jr c,pc+r8
        lsr a                         
        bcc _s548                     
        jmp G_31B1                    
_s548
G_31AF
        sec                           ; $31AF sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $31B0 inc l
        lda zL                        
        sta zZ                        
G_31B1
        clc                           ; $31B1 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $31B2 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $31B3 jr c,pc+r8
        lsr a                         
        bcc _s549                     
        jmp G_31B8                    
_s549
        sec                           ; $31B5 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $31B6 jr c,pc+r8
        lsr a                         
        bcc _s550                     
        jmp G_31BA                    
_s550
G_31B8
        sec                           ; $31B8 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $31B9 inc l
        lda zL                        
        sta zZ                        
G_31BA
        clc                           ; $31BA add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $31BB rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $31BC jr c,pc+r8
        lsr a                         
        bcc _s551                     
        jmp G_31C1                    
_s551
        sec                           ; $31BE cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $31BF jr c,pc+r8
        lsr a                         
        bcc _s552                     
        jmp G_31C3                    
_s552
G_31C1
        sec                           ; $31C1 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $31C2 inc l
        lda zL                        
        sta zZ                        
G_31C3
        clc                           ; $31C3 add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $31C4 rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $31C5 jr c,pc+r8
        lsr a                         
        bcc _s553                     
        jmp G_31CA                    
_s553
        sec                           ; $31C7 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $31C8 jr c,pc+r8
        lsr a                         
        bcc _s554                     
        jmp G_31CC                    
_s554
G_31CA
        sec                           ; $31CA sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $31CB inc l
        lda zL                        
        sta zZ                        
G_31CC
        clc                           ; $31CC add hl,hl
        lda zL                        
        adc zL                        
        sta zL                        
        lda zH                        
        adc zH                        
        sta zH                        
        rol zCY                       
        lda zCY                       ; $31CD rla
        lsr a                         
        lda zA                        
        rol a                         
        sta zA                        
        rol zCY                       
        lda #1                        
        sta zZ                        
        lda zCY                       ; $31CE jr c,pc+r8
        lsr a                         
        bcc _s555                     
        jmp G_31D2                    
_s555
        sec                           ; $31D0 cp c
        lda zA                        
        sbc zC                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $31D1 ret c
        lsr a                         
        bcc _s556                     
        rts                           
_s556
G_31D2
        sec                           ; $31D2 sub c
        lda zA                        
        sbc zC                        
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        inc zL                        ; $31D3 inc l
        lda zL                        
        sta zZ                        
        rts                           ; $31D4 ret
G_3297
        lda #<$C0DB                   ; $3297 ld hl,d16
        sta zL                        
        lda #>$C0DB                   
        sta zH                        
        lda #$01                      ; $329A ld a,d8
        sta zA                        
                                      ; $329C ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s557                     
        inc zH                        
_s557
        lda zA                        ; $329D ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s558                     
        inc zH                        
_s558
        lda zA                        ; $329E ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s559                     
        inc zH                        
_s559
        lda zA                        ; $329F ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s560                     
        inc zH                        
_s560
        lda zA                        ; $32A0 ld [a16],a
        sta $C0E6                     
        inc zL                        ; $32A3 inc hl
        bne _s561                     
        inc zH                        
_s561
        lda zA                        ; $32A4 xor a
        eor zA                        
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $32A5 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s562                     
        inc zH                        
_s562
        lda zA                        ; $32A6 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s563                     
        inc zH                        
_s563
        lda zA                        ; $32A7 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s564                     
        inc zH                        
_s564
        lda zA                        ; $32A8 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s565                     
        inc zH                        
_s565
        lda zA                        ; $32A9 ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s566                     
        inc zH                        
_s566
        lda zA                        ; $32AA ld [hl+],a
        sta (zL),y                    
        inc zL                        
        bne _s567                     
        inc zH                        
_s567
        lda $FFAF                     ; $32AB ldh a,[a8]
        sta zA                        
                                      ; $32AD bit 7,a
        and #$80                      
        sta zZ                        
                                      ; $32AF ret z
        bne _s568                     
        rts                           
_s568
        lda zA                        ; $32B0 and d8
        and #$01                      
        sta zA                        
        sta zZ                        
        sty zCY                       
        lda zA                        ; $32B2 ld [a16],a
        sta $C0DC                     
        lda zA                        ; $32B5 ld [a16],a
        sta $C0E6                     
        rts                           ; $32B8 ret
G_32B9
        lda $C040                     ; $32B9 ld a,[a16]
        sta zA                        
        sec                           ; $32BC sub d8
        lda zA                        
        sbc #$02                      
        sta zA                        
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $32BE ret c
        lsr a                         
        bcc _s569                     
        rts                           
_s569
        sec                           ; $32BF cp d8
        lda zA                        
        sbc #$03                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zCY                       ; $32C1 ret nc
        lsr a                         
        bcs _s570                     
        rts                           
_s570
        lda #<$FFC2                   ; $32C2 ld hl,d16
        sta zL                        
        lda #>$FFC2                   
        sta zH                        
        lda (zL),y                    ; $32C5 res 6,[hl]
        and #$BF                      
        sta (zL),y                    
        rts                           ; $32C7 ret
G_32C8
        lda #$C1                      ; $32C8 ld b,d8
        sta zB                        
        lda #<$C0DD                   ; $32CA ld hl,d16
        sta zL                        
        lda #>$C0DD                   
        sta zH                        
        lda $C0DE                     ; $32CD ld a,[a16]
        sta zA                        
        sec                           ; $32D0 cp [hl]
        lda zA                        
        sbc (zL),y                    
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $32D1 jr nz,pc+r8
        beq _s571                     
        jmp G_32D9                    
_s571
        sec                           ; $32D3 cp d8
        lda zA                        
        sbc #$01                      
        sta zZ                        
        rol zCY                       
        inc zCY                       
        lda zZ                        ; $32D5 jr nz,pc+r8
        beq _s572                     
        jmp G_32D9                    
_s572
        lda #$00                      ; $32D7 ld b,d8
        sta zB                        
G_32D9
        lda zB                        ; $32D9 ld a,b
        sta zA                        
                                      ; $32DA ldh [a8],a
        sta $FFC2                     
        rts                           ; $32DC ret

; --- Données de la ROM lues par la logique ---
D_0B35
        .word D_0B3D, D_0B4D, D_0B5D, D_0B6D
D_0B3D
        .byte $94, $05, $70, $00, $1E, $3C, $58, $0A, $14, $3C, $0A, $14, $0A, $14, $14, $05
D_0B4D
        .byte $A0, $0A, $A0, $00, $28, $32, $80, $0A, $46, $0A, $0A, $1E, $0A, $14, $14, $00
D_0B5D
        .byte $A0, $14, $C0, $00, $46, $3C, $90, $0A, $14, $1E, $0A, $14, $0A, $0A, $32, $05
D_0B6D
        .byte $B0, $1E, $E0, $00, $50, $32, $A0, $05, $1E, $0A, $05, $14, $28, $0A, $32, $05
