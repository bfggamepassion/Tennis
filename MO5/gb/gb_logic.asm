; Fichier généré par tools/gb2m6809.py à partir de la ROM Game Boy.
; Ne pas modifier à la main : relancer le script.

G_00A9
        ldx <rB                       ; $00A9 push bc
        pshs x                        
        lda $9FA4                     ; $00AA ldh a,[a8]
        sta <rB                       ; $00AC ld b,a
        lsla                          ; $00AD add a
        lsla                          ; $00AE add a
        adda <rB                      ; $00AF add b
        adda #$0B                     ; $00B0 add d8
        sta $9FA4                     ; $00B2 ldh [a8],a
        puls x                        ; $00B4 pop bc
        stx <rB                       
        rts                           ; $00B5 ret
G_00C3
        lda <rL                       ; $00C3 ld a,l
        suba <rE                      ; $00C4 sub e
        sta <rE                       ; $00C5 ld e,a
        lda <rH                       ; $00C6 ld a,h
        sbca <rD                      ; $00C7 sbc d
        sta <rD                       ; $00C8 ld d,a
        rts                           ; $00C9 ret
G_00CA
        cmpa #$64                     ; $00CA cp d8
        bcs _s1                       ; $00CC ret nc
        rts                           
_s1
        sta <rB                       ; $00CD ld b,a
        lsr <rB                       ; $00CE srl b
        lsla                          ; $00D0 add a
        adda <rB                      ; $00D1 add b
        sta <rL                       ; $00D2 ld l,a
        jsr G_00A9                    ; $00D3 call a16
        cmpa <rL                      ; $00D6 cp l
        bcs _s2                       ; $00D7 ccf
        orcc #1                       
        bra _s3                       
_s2
        andcc #$FE                    
_s3
        rts                           ; $00D8 ret
G_00D9
        cmpa #$64                     ; $00D9 cp d8
        bcs _s4                       ; $00DB ret nc
        rts                           
_s4
        sta <rB                       ; $00DC ld b,a
        lsr <rB                       ; $00DD srl b
        lsla                          ; $00DF add a
        adda <rB                      ; $00E0 add b
        sta <rL                       ; $00E1 ld l,a
        lda $9FA4                     ; $00E2 ldh a,[a8]
        cmpa <rL                      ; $00E4 cp l
        bcs _s5                       ; $00E5 ccf
        orcc #1                       
        bra _s6                       
_s5
        andcc #$FE                    
_s6
        rts                           ; $00E6 ret
G_0885
        lda $9D04                     ; $0885 ld a,[a16]
        adda #$80                     ; $0888 add d8
        lda $9D05                     ; $088A ld a,[a16]
        adca #$00                     ; $088D adc d8
        rts                           ; $088F ret
G_0890
        lda $9D02                     ; $0890 ld a,[a16]
        adda #$80                     ; $0893 add d8
        lda $9D03                     ; $0895 ld a,[a16]
        adca #$00                     ; $0898 adc d8
        rts                           ; $089A ret
G_089B
        lda $9D24                     ; $089B ld a,[a16]
        adda #$80                     ; $089E add d8
        lda $9D25                     ; $08A0 ld a,[a16]
        adca #$00                     ; $08A3 adc d8
        rts                           ; $08A5 ret
G_08A6
        lda $9D22                     ; $08A6 ld a,[a16]
        adda #$80                     ; $08A9 add d8
        lda $9D23                     ; $08AB ld a,[a16]
        adca #$00                     ; $08AE adc d8
        rts                           ; $08B0 ret
G_08B1
        lda $9D44                     ; $08B1 ld a,[a16]
        adda #$80                     ; $08B4 add d8
        lda $9D45                     ; $08B6 ld a,[a16]
        adca #$00                     ; $08B9 adc d8
        rts                           ; $08BB ret
G_08BC
        lda $9D42                     ; $08BC ld a,[a16]
        adda #$80                     ; $08BF add d8
        lda $9D43                     ; $08C1 ld a,[a16]
        adca #$00                     ; $08C4 adc d8
        rts                           ; $08C6 ret
G_08C7
        ldx <rH                       ; $08C7 push hl
        pshs x                        
        ldx <rH                       ; $08C8 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $08C9 ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $08CA ld l,a
        ldb <rC                       ; $08CB bit 5,c
        bitb #$20                     
        lbeq G_08DF                   ; $08CD jr z,pc+r8
        ldx #$07FF                    ; $08CF ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $08D2 call a16
        lbcs G_08F1                   ; $08D5 jr c,pc+r8
        lda <rL                       ; $08D7 ld a,l
        suba <rB                      ; $08D8 sub b
        sta <rL                       ; $08D9 ld l,a
        lbcc G_08F1                   ; $08DA jr nc,pc+r8
        dec <rH                       ; $08DC dec h
        jmp G_08F1                    ; $08DD jr pc+r8
G_08DF
        ldb <rC                       ; $08DF bit 4,c
        bitb #$10                     
        lbeq G_08F1                   ; $08E1 jr z,pc+r8
        ldx #$D001                    ; $08E3 ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $08E6 call a16
        lbcc G_08F1                   ; $08E9 jr nc,pc+r8
        lda <rL                       ; $08EB ld a,l
        adda <rB                      ; $08EC add b
        sta <rL                       ; $08ED ld l,a
        lbcc G_08F1                   ; $08EE jr nc,pc+r8
        inc <rH                       ; $08F0 inc h
G_08F1
        ldx <rH                       ; $08F1 push hl
        pshs x                        
        puls x                        ; $08F2 pop de
        stx <rD                       
        puls x                        ; $08F3 pop hl
        stx <rH                       
        lda <rE                       ; $08F4 ld a,e
        ldx <rH                       ; $08F5 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldb <rD                       ; $08F6 ld [hl],d
        ldx <rH                       
        stb ,x                        
        rts                           ; $08F7 ret
G_08F8
        ldx <rH                       ; $08F8 push hl
        pshs x                        
        ldx <rH                       ; $08F9 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $08FA ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $08FB ld l,a
        ldb <rC                       ; $08FC bit 6,c
        bitb #$40                     
        lbeq G_0924                   ; $08FE jr z,pc+r8
        lda $9F96                     ; $0900 ldh a,[a8]
        bita #$80                     ; $0902 bit 7,a
        lbeq G_0914                   ; $0904 jr z,pc+r8
        ldx #$08FF                    ; $0906 ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $0909 call a16
        lbcs G_094A                   ; $090C jr c,pc+r8
        lda <rB                       ; $090E ld a,b
        suba #$14                     ; $090F sub d8
        sta <rB                       ; $0911 ld b,a
        jmp G_091C                    ; $0912 jr pc+r8
G_0914
        ldx #$8500                    ; $0914 ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $0917 call a16
        lbcs G_094A                   ; $091A jr c,pc+r8
G_091C
        lda <rL                       ; $091C ld a,l
        suba <rB                      ; $091D sub b
        sta <rL                       ; $091E ld l,a
        lbcc G_094A                   ; $091F jr nc,pc+r8
        dec <rH                       ; $0921 dec h
        jmp G_094A                    ; $0922 jr pc+r8
G_0924
        ldb <rC                       ; $0924 bit 7,c
        bitb #$80                     
        lbeq G_094A                   ; $0926 jr z,pc+r8
        lda $9F96                     ; $0928 ldh a,[a8]
        bita #$80                     ; $092A bit 7,a
        lbne G_093C                   ; $092C jr nz,pc+r8
        ldx #$E701                    ; $092E ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $0931 call a16
        lbcc G_094A                   ; $0934 jr nc,pc+r8
        lda <rB                       ; $0936 ld a,b
        suba #$14                     ; $0937 sub d8
        sta <rB                       ; $0939 ld b,a
        jmp G_0944                    ; $093A jr pc+r8
G_093C
        ldx #$6B00                    ; $093C ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $093F call a16
        lbcc G_094A                   ; $0942 jr nc,pc+r8
G_0944
        lda <rL                       ; $0944 ld a,l
        adda <rB                      ; $0945 add b
        sta <rL                       ; $0946 ld l,a
        lbcc G_094A                   ; $0947 jr nc,pc+r8
        inc <rH                       ; $0949 inc h
G_094A
        ldx <rH                       ; $094A push hl
        pshs x                        
        puls x                        ; $094B pop de
        stx <rD                       
        puls x                        ; $094C pop hl
        stx <rH                       
        lda <rE                       ; $094D ld a,e
        ldx <rH                       ; $094E ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldb <rD                       ; $094F ld [hl],d
        ldx <rH                       
        stb ,x                        
        rts                           ; $0950 ret
G_09FA
        ldx <rH                       ; $09FA ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $09FB ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        sta <rD                       ; $09FC ld d,a
        ldx <rH                       ; $09FD ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $09FE ld a,[hl]
        lda ,x                        
        sta <rE                       ; $09FF ld e,a
        ldb #$00                      ; $0A00 ld c,d8
        stb <rC                       
        lda <rD                       ; $0A02 ld a,d
        cmpa #$78                     ; $0A03 cp d8
        lbcs G_0A12                   ; $0A05 jr c,pc+r8
        ldb <rC                       ; $0A07 set 1,c
        orb #$02                      
        stb <rC                       
        eora #$FF                     ; $0A09 cpl
        adda #$F0                     ; $0A0A add d8
        sta <rD                       ; $0A0C ld d,a
        lda <rE                       ; $0A0D ld a,e
        eora #$FF                     ; $0A0E cpl
        adda #$D8                     ; $0A0F add d8
        sta <rE                       ; $0A11 ld e,a
G_0A12
        lda <rE                       ; $0A12 ld a,e
        cmpa #$6C                     ; $0A13 cp d8
        lbcs G_0A1C                   ; $0A15 jr c,pc+r8
        ldb <rC                       ; $0A17 set 0,c
        orb #$01                      
        stb <rC                       
        eora #$FF                     ; $0A19 cpl
        adda #$D8                     ; $0A1A add d8
G_0A1C
        cmpa #$36                     ; $0A1C cp d8
        bcc _s7                       ; $0A1E ret c
        rts                           
_s7
        lda <rD                       ; $0A1F ld a,d
        cmpa #$37                     ; $0A20 cp d8
        lbcs G_0A29                   ; $0A22 jr c,pc+r8
        ldb <rC                       ; $0A24 set 3,c
        orb #$08                      
        stb <rC                       
        cmpa #$55                     ; $0A26 cp d8
        bcc _s8                       ; $0A28 ret c
        rts                           
_s8
G_0A29
        ldb <rC                       ; $0A29 set 2,c
        orb #$04                      
        stb <rC                       
        rts                           ; $0A2B ret
G_0A2C
        ldb #$00                      ; $0A2C ld c,d8
        stb <rC                       
        cmpa #$08                     ; $0A2E cp d8
        bne _s9                       ; $0A30 ret z
        rts                           
_s9
        inc <rC                       ; $0A31 inc c
        cmpa #$0B                     ; $0A32 cp d8
        bne _s10                      ; $0A34 ret z
        rts                           
_s10
        inc <rC                       ; $0A35 inc c
        cmpa #$0E                     ; $0A36 cp d8
        bne _s11                      ; $0A38 ret z
        rts                           
_s11
        inc <rC                       ; $0A39 inc c
        cmpa #$10                     ; $0A3A cp d8
        bne _s12                      ; $0A3C ret z
        rts                           
_s12
        inc <rC                       ; $0A3D inc c
        cmpa #$05                     ; $0A3E cp d8
        rts                           ; $0A40 ret
G_0A9D
        ldx #$9D80                    ; $0A9D ld hl,d16
        stx <rH                       
        ldb #$40                      ; $0AA0 ld b,d8
        stb <rB                       
        clra                          ; $0AA2 xor a
G_0AA3
        ldx <rH                       ; $0AA3 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        dec <rB                       ; $0AA4 dec b
        lbne G_0AA3                   ; $0AA5 jr nz,pc+r8
        lda $9DDF                     ; $0AA7 ld a,[a16]
        deca                          ; $0AAA dec a
        sta $9FC5                     ; $0AAB ldh [a8],a
        jsr G_RST18                   ; $0AAD rst vec
        fcb $04,$A0,$B0,$D0,$FF
        sta $9D88                     ; $0AB3 ld [a16],a
        sta $9DA8                     ; $0AB6 ld [a16],a
        lda $9FC5                     ; $0AB9 ldh a,[a8]
        jsr G_RST18                   ; $0ABB rst vec
        fcb $04,$90,$A0,$C0,$FF
        sta $9D89                     ; $0AC1 ld [a16],a
        sta $9DA9                     ; $0AC4 ld [a16],a
        lda $9FC5                     ; $0AC7 ldh a,[a8]
        ldx #D_0B35                   ; $0AC9 ld hl,d16
        stx <rH                       
        jsr G_3047                    ; $0ACC call a16
        ldx #$9D90                    ; $0ACF ld de,d16
        stx <rD                       
        ldb #$10                      ; $0AD2 ld b,d8
        stb <rB                       
G_0AD4
        ldx <rH                       ; $0AD4 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rD                       ; $0AD5 ld [de],a
        sta ,x                        
        inc <rE                       ; $0AD6 inc e
        dec <rB                       ; $0AD7 dec b
        lbne G_0AD4                   ; $0AD8 jr nz,pc+r8
        lda $9FC5                     ; $0ADA ldh a,[a8]
        ldx #D_0B35                   ; $0ADC ld hl,d16
        stx <rH                       
        jsr G_3047                    ; $0ADF call a16
        ldx #$9DB0                    ; $0AE2 ld de,d16
        stx <rD                       
        ldb #$10                      ; $0AE5 ld b,d8
        stb <rB                       
G_0AE7
        ldx <rH                       ; $0AE7 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rD                       ; $0AE8 ld [de],a
        sta ,x                        
        inc <rE                       ; $0AE9 inc e
        dec <rB                       ; $0AEA dec b
        lbne G_0AE7                   ; $0AEB jr nz,pc+r8
        lda $9D90                     ; $0AED ld a,[a16]
        eora #$FF                     ; $0AF0 cpl
        inca                          ; $0AF1 inc a
        suba #$10                     ; $0AF2 sub d8
        sta $9D90                     ; $0AF4 ld [a16],a
        lda $9F96                     ; $0AF7 ldh a,[a8]
        bita #$01                     ; $0AF9 bit 0,a
        lbne G_0B25                   ; $0AFB jr nz,pc+r8
        lda $9FAF                     ; $0AFD ldh a,[a8]
        bita #$80                     ; $0AFF bit 7,a
        lbne G_0B25                   ; $0B01 jr nz,pc+r8
        ldx #$9D92                    ; $0B03 ld hl,d16
        stx <rH                       
        jsr G_0B26                    ; $0B06 call a16
        ldx #$9D96                    ; $0B09 ld hl,d16
        stx <rH                       
        jsr G_0B26                    ; $0B0C call a16
        lda $9FC5                     ; $0B0F ldh a,[a8]
        jsr G_RST18                   ; $0B11 rst vec
        fcb $04,$C0,$C8,$D0,$F0
        sta $9D88                     ; $0B17 ld [a16],a
        lda $9FC5                     ; $0B1A ldh a,[a8]
        jsr G_RST18                   ; $0B1C rst vec
        fcb $04,$A0,$A0,$B0,$C0
        sta $9D89                     ; $0B22 ld [a16],a
G_0B25
        rts                           ; $0B25 ret
G_0B26
        lda $9DDF                     ; $0B26 ld a,[a16]
        cmpa #$01                     ; $0B29 cp d8
        bne _s13                      ; $0B2B ret z
        rts                           
_s13
        ldx <rH                       ; $0B2C ld a,[hl]
        lda ,x                        
        sta <rB                       ; $0B2D ld b,a
        lsr <rB                       ; $0B2E srl b
        lsr <rB                       ; $0B30 srl b
        suba <rB                      ; $0B32 sub b
        ldx <rH                       ; $0B33 ld [hl],a
        sta ,x                        
        rts                           ; $0B34 ret
G_0B7D
        ldx #$9F96                    ; $0B7D ld hl,d16
        stx <rH                       
        ldx <rH                       ; $0B80 res 7,[hl]
        ldb ,x                        
        andb #$7F                     
        stb ,x                        
        ldx #$9D02                    ; $0B82 ld hl,d16
        stx <rH                       
        jsr G_09FA                    ; $0B85 call a16
        lda <rC                       ; $0B88 ld a,c
        sta $9D0B                     ; $0B89 ld [a16],a
        lda $9D00                     ; $0B8C ld a,[a16]
        jsr G_RST08                   ; $0B8F rst vec
        fdb G_0BA0,G_0BD9,G_0BE2,G_0C4C,G_0C9A,G_0CB7,G_0D3D,G_0D76
G_0BA0
        jsr G_0DA5                    ; $0BA0 call a16
        jsr G_0BCD                    ; $0BA3 call a16
        lda #$01                      ; $0BA6 ld a,d8
        sta $9D00                     ; $0BA8 ld [a16],a
        rts                           ; $0BAB ret
G_0BAC
        lda $9F91                     ; $0BAC ldh a,[a8]
        bita #$02                     ; $0BAE bit 1,a
        pshs cc                       ; $0BB0 ld a,d8
        lda #$58                      
        puls cc                       
        lbne G_0BB6                   ; $0BB2 jr nz,pc+r8
        pshs cc                       ; $0BB4 ld a,d8
        lda #$7F                      
        puls cc                       
G_0BB6
        pshs cc                       ; $0BB6 ld [a16],a
        sta $9D05                     
        puls cc                       
        pshs cc                       ; $0BB9 ld a,d8
        lda #$7F                      
        puls cc                       
        lbne G_0BBF                   ; $0BBB jr nz,pc+r8
        lda #$80                      ; $0BBD ld a,d8
G_0BBF
        sta $9D04                     ; $0BBF ld [a16],a
        lda #$B9                      ; $0BC2 ld a,d8
        sta $9D03                     ; $0BC4 ld [a16],a
        lda #$80                      ; $0BC7 ld a,d8
        sta $9D02                     ; $0BC9 ld [a16],a
        rts                           ; $0BCC ret
G_0BCD
        lda $9F91                     ; $0BCD ldh a,[a8]
        bita #$02                     ; $0BCF bit 1,a
        pshs cc                       ; $0BD1 ld a,d8
        lda #$45                      
        puls cc                       
        lbne G_0BD7                   ; $0BD3 jr nz,pc+r8
        pshs cc                       ; $0BD5 ld a,d8
        lda #$92                      
        puls cc                       
G_0BD7
        jmp G_0BB6                    ; $0BD7 jr pc+r8
G_0BD9
        jsr G_0DB8                    ; $0BD9 call a16
        jsr G_0DFE                    ; $0BDC call a16
        jmp G_10A9                    ; $0BDF jp a16
G_0BE2
        lda $9D0A                     ; $0BE2 ld a,[a16]
        cmpa #$06                     ; $0BE5 cp d8
        lbeq G_0BF7                   ; $0BE7 jr z,pc+r8
        cmpa #$09                     ; $0BE9 cp d8
        lbeq G_0BF7                   ; $0BEB jr z,pc+r8
        lda $9D11                     ; $0BED ld a,[a16]
        jsr G_RST18                   ; $0BF0 rst vec
        fcb $03,$04,$08,$06
        jmp G_0BFF                    ; $0BF5 jr pc+r8
G_0BF7
        lda $9D11                     ; $0BF7 ld a,[a16]
        jsr G_RST18                   ; $0BFA rst vec
        fcb $03,$0A,$0C,$01
G_0BFF
        sta <rB                       ; $0BFF ld b,a
        lda $9D10                     ; $0C00 ld a,[a16]
        inca                          ; $0C03 inc a
        sta $9D10                     ; $0C04 ld [a16],a
        cmpa <rB                      ; $0C07 cp b
        lbcs G_0C19                   ; $0C08 jr c,pc+r8
        clra                          ; $0C0A xor a
        sta $9D10                     ; $0C0B ld [a16],a
        lda $9D11                     ; $0C0E ld a,[a16]
        inca                          ; $0C11 inc a
        cmpa #$03                     ; $0C12 cp d8
        lbcc G_0C3E                   ; $0C14 jr nc,pc+r8
        sta $9D11                     ; $0C16 ld [a16],a
G_0C19
        lda $9D0A                     ; $0C19 ld a,[a16]
        sta <rB                       ; $0C1C ld b,a
        lda $9D11                     ; $0C1D ld a,[a16]
        adda <rB                      ; $0C20 add b
        jsr G_RST18                   ; $0C21 rst vec
        fcb $12,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0E,$0F,$10,$10,$04,$05,$06,$04,$05,$06
        sta $9D01                     ; $0C35 ld [a16],a
        jsr G_0E77                    ; $0C38 call a16
        jmp G_10A9                    ; $0C3B jp a16
G_0C3E
        clra                          ; $0C3E xor a
        sta $9D10                     ; $0C3F ld [a16],a
        sta $9D11                     ; $0C42 ld [a16],a
        inca                          ; $0C45 inc a
        sta $9D00                     ; $0C46 ld [a16],a
        jmp G_10A9                    ; $0C49 jp a16
G_0C4C
        lda #$03                      ; $0C4C ld a,d8
        sta $9D01                     ; $0C4E ld [a16],a
        lda $9D17                     ; $0C51 ld a,[a16]
        tsta                          ; $0C54 and a
        lbne G_0C62                   ; $0C55 jr nz,pc+r8
        lda #$01                      ; $0C57 ld a,d8
        sta $9D40                     ; $0C59 ld [a16],a
        lda #$0E                      ; $0C5C ld a,d8
        sta $9D47                     ; $0C5E ld [a16],a
        clra                          ; $0C61 xor a
G_0C62
        inca                          ; $0C62 inc a
        sta $9D17                     ; $0C63 ld [a16],a
        cmpa #$10                     ; $0C66 cp d8
        lbcs G_0C80                   ; $0C68 jr c,pc+r8
        suba #$10                     ; $0C6A sub d8
        cmpa #$04                     ; $0C6C cp d8
        lbcs G_0C99                   ; $0C6E jr c,pc+r8
        suba #$04                     ; $0C70 sub d8
        cmpa #$10                     ; $0C72 cp d8
        lbcs G_0C80                   ; $0C74 jr c,pc+r8
        clra                          ; $0C76 xor a
        sta $9D17                     ; $0C77 ld [a16],a
        lda #$05                      ; $0C7A ld a,d8
        sta $9D00                     ; $0C7C ld [a16],a
        rts                           ; $0C7F ret
G_0C80
        suba #$08                     ; $0C80 sub d8
        lda $9D47                     ; $0C82 ld a,[a16]
        lbcs G_0C8B                   ; $0C85 jr c,pc+r8
        inca                          ; $0C87 inc a
        inca                          ; $0C88 inc a
        jmp G_0C8D                    ; $0C89 jr pc+r8
G_0C8B
        deca                          ; $0C8B dec a
        deca                          ; $0C8C dec a
G_0C8D
        sta $9D47                     ; $0C8D ld [a16],a
        cmpa #$0E                     ; $0C90 cp d8
        lbcc G_0C99                   ; $0C92 jr nc,pc+r8
        lda #$13                      ; $0C94 ld a,d8
        sta $9D01                     ; $0C96 ld [a16],a
G_0C99
        rts                           ; $0C99 ret
G_0C9A
        jsr G_0DA5                    ; $0C9A call a16
        clra                          ; $0C9D xor a
        sta $9FAD                     ; $0C9E ldh [a8],a
        sta $9D17                     ; $0CA0 ld [a16],a
        jsr G_0BAC                    ; $0CA3 call a16
        jsr S_RET                     ; $0CA6 call a16
        lda $9FBB                     ; $0CA9 ldh a,[a8]
        sta $9FA8                     ; $0CAB ldh [a8],a
        lda #$30                      ; $0CAD ld a,d8
        sta $9FAA                     ; $0CAF ldh [a8],a
        lda #$05                      ; $0CB1 ld a,d8
        sta $9D00                     ; $0CB3 ld [a16],a
        rts                           ; $0CB6 ret
G_0CB7
        lda #$03                      ; $0CB7 ld a,d8
        sta $9D01                     ; $0CB9 ld [a16],a
        lda $9F9A                     ; $0CBC ldh a,[a8]
        tsta                          ; $0CBE and a
        lbne G_0CD6                   ; $0CBF jr nz,pc+r8
        lda $9D17                     ; $0CC1 ld a,[a16]
        inca                          ; $0CC4 inc a
        sta $9D17                     ; $0CC5 ld [a16],a
        cmpa #$B4                     ; $0CC8 cp d8
        lbcs G_0D13                   ; $0CCA jr c,pc+r8
        clra                          ; $0CCC xor a
        sta $9D17                     ; $0CCD ld [a16],a
        lda #$03                      ; $0CD0 ld a,d8
        sta $9D00                     ; $0CD2 ld [a16],a
        rts                           ; $0CD5 ret
G_0CD6
        clra                          ; $0CD6 xor a
        sta $9D17                     ; $0CD7 ld [a16],a
        lda $9F9A                     ; $0CDA ldh a,[a8]
        sta <rC                       ; $0CDC ld c,a
        lda $9F91                     ; $0CDD ldh a,[a8]
        bita #$02                     ; $0CDF bit 1,a
        pshs cc                       ; $0CE1 ld de,d16
        ldx #$3F80                    
        stx <rD                       
        puls cc                       
        lbne G_0CE9                   ; $0CE4 jr nz,pc+r8
        ldx #$7380                    ; $0CE6 ld de,d16
        stx <rD                       
G_0CE9
        ldx #$9D04                    ; $0CE9 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $0CEC ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $0CED ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $0CEE ld l,a
        jsr G_00C3                    ; $0CEF call a16
        lbcc G_0CF6                   ; $0CF2 jr nc,pc+r8
        ldb <rC                       ; $0CF4 res 5,c
        andb #$DF                     
        stb <rC                       
G_0CF6
        lda $9F91                     ; $0CF6 ldh a,[a8]
        bita #$02                     ; $0CF8 bit 1,a
        pshs cc                       ; $0CFA ld de,d16
        ldx #$6480                    
        stx <rD                       
        puls cc                       
        lbne G_0D02                   ; $0CFD jr nz,pc+r8
        ldx #$9880                    ; $0CFF ld de,d16
        stx <rD                       
G_0D02
        jsr G_00C3                    ; $0D02 call a16
        lbcs G_0D09                   ; $0D05 jr c,pc+r8
        ldb <rC                       ; $0D07 res 4,c
        andb #$EF                     
        stb <rC                       
G_0D09
        lda $9D08                     ; $0D09 ld a,[a16]
        sta <rB                       ; $0D0C ld b,a
        ldx #$9D04                    ; $0D0D ld hl,d16
        stx <rH                       
        jsr G_08C7                    ; $0D10 call a16
G_0D13
        lda $9D02                     ; $0D13 ld a,[a16]
        sta $9D42                     ; $0D16 ld [a16],a
        lda $9D03                     ; $0D19 ld a,[a16]
        sta $9D43                     ; $0D1C ld [a16],a
        lda $9D04                     ; $0D1F ld a,[a16]
        sta $9D44                     ; $0D22 ld [a16],a
        lda $9D05                     ; $0D25 ld a,[a16]
        adda #$06                     ; $0D28 add d8
        jsr G_16F9                    ; $0D2A call a16
        lda $9F9B                     ; $0D2D ldh a,[a8]
        anda #$03                     ; $0D2F and d8
        bne _s14                      ; $0D31 ret z
        rts                           
_s14
        lda #$02                      ; $0D32 ld a,d8
        sta $9D40                     ; $0D34 ld [a16],a
        lda #$06                      ; $0D37 ld a,d8
        sta $9D00                     ; $0D39 ld [a16],a
        rts                           ; $0D3C ret
G_0D3D
        lda #$04                      ; $0D3D ld a,d8
        sta $9D01                     ; $0D3F ld [a16],a
        lda $9F9B                     ; $0D42 ldh a,[a8]
        anda #$03                     ; $0D44 and d8
        lbeq G_0D5E                   ; $0D46 jr z,pc+r8
        sta $9D13                     ; $0D48 ld [a16],a
        lda #$05                      ; $0D4B ld a,d8
        jsr S_SOUND                   ; $0D4D call a16
        clra                          ; $0D50 xor a
        sta $9D10                     ; $0D51 ld [a16],a
        sta $9D11                     ; $0D54 ld [a16],a
        lda #$07                      ; $0D57 ld a,d8
        sta $9D00                     ; $0D59 ld [a16],a
        jmp G_0D75                    ; $0D5C jr pc+r8
G_0D5E
        lda $9D52                     ; $0D5E ld a,[a16]
        bita #$80                     ; $0D61 bit 7,a
        lbeq G_0D75                   ; $0D63 jr z,pc+r8
        lda $9D47                     ; $0D65 ld a,[a16]
        cmpa #$30                     ; $0D68 cp d8
        lbcc G_0D75                   ; $0D6A jr nc,pc+r8
        clra                          ; $0D6C xor a
        sta $9D17                     ; $0D6D ld [a16],a
        lda #$05                      ; $0D70 ld a,d8
        sta $9D00                     ; $0D72 ld [a16],a
G_0D75
        rts                           ; $0D75 ret
G_0D76
        lda $9D11                     ; $0D76 ld a,[a16]
        jsr G_RST18                   ; $0D79 rst vec
        fcb $02,$08,$0A
        sta <rB                       ; $0D7D ld b,a
        lda $9D10                     ; $0D7E ld a,[a16]
        inca                          ; $0D81 inc a
        sta $9D10                     ; $0D82 ld [a16],a
        cmpa <rB                      ; $0D85 cp b
        lbcs G_0D98                   ; $0D86 jr c,pc+r8
        clra                          ; $0D88 xor a
        sta $9D10                     ; $0D89 ld [a16],a
        lda $9D11                     ; $0D8C ld a,[a16]
        inca                          ; $0D8F inc a
        cmpa #$02                     ; $0D90 cp d8
        lbcc G_0C3E                   ; $0D92 jp nc,a16
        sta $9D11                     ; $0D95 ld [a16],a
G_0D98
        lda $9D11                     ; $0D98 ld a,[a16]
        jsr G_RST18                   ; $0D9B rst vec
        fcb $02,$05,$06
        sta $9D01                     ; $0D9F ld [a16],a
        jmp G_0E77                    ; $0DA2 jp a16
G_0DA5
        lda $9D88                     ; $0DA5 ld a,[a16]
        sta $9D08                     ; $0DA8 ld [a16],a
        lda $9D89                     ; $0DAB ld a,[a16]
        sta $9D09                     ; $0DAE ld [a16],a
        lda $9D96                     ; $0DB1 ld a,[a16]
        sta $9D16                     ; $0DB4 ld [a16],a
        rts                           ; $0DB7 ret
G_0DB8
        lda $9D08                     ; $0DB8 ld a,[a16]
        sta <rB                       ; $0DBB ld b,a
        lda $9F9A                     ; $0DBC ldh a,[a8]
        sta <rC                       ; $0DBE ld c,a
        ldx #$9D04                    ; $0DBF ld hl,d16
        stx <rH                       
        jsr G_08C7                    ; $0DC2 call a16
        lda $9D09                     ; $0DC5 ld a,[a16]
        sta <rB                       ; $0DC8 ld b,a
        ldx #$9D02                    ; $0DC9 ld hl,d16
        stx <rH                       
        jsr G_08F8                    ; $0DCC call a16
        lda $9D11                     ; $0DCF ld a,[a16]
        anda #$04                     ; $0DD2 and d8
        lsra                          ; $0DD4 srl a
        lsra                          ; $0DD6 srl a
        sta <rD                       ; $0DD8 ld d,a
        lda <rC                       ; $0DD9 ld a,c
        anda #$F0                     ; $0DDA and d8
        lbeq G_0DFA                   ; $0DDC jr z,pc+r8
        bita #$20                     ; $0DDE bit 5,a
        lbeq G_0DE4                   ; $0DE0 jr z,pc+r8
        inc <rD                       ; $0DE2 inc d
        inc <rD                       ; $0DE3 inc d
G_0DE4
        lda $9D10                     ; $0DE4 ld a,[a16]
        adda <rB                      ; $0DE7 add b
        sta $9D10                     ; $0DE8 ld [a16],a
        lda $9D11                     ; $0DEB ld a,[a16]
        adca #$00                     ; $0DEE adc d8
        sta $9D11                     ; $0DF0 ld [a16],a
        lda <rD                       ; $0DF3 ld a,d
        jsr G_RST18                   ; $0DF4 rst vec
        fcb $04,$01,$02,$11,$12
G_0DFA
        sta $9D01                     ; $0DFA ld [a16],a
        rts                           ; $0DFD ret
G_0DFE
        lda $9F9B                     ; $0DFE ldh a,[a8]
        anda #$03                     ; $0E00 and d8
        andcc #$FE                    
        bne _s15                      ; $0E02 ret z
        rts                           
_s15
        sta $9D13                     ; $0E03 ld [a16],a
        lda #$05                      ; $0E06 ld a,d8
        jsr S_SOUND                   ; $0E08 call a16
        jsr G_0890                    ; $0E0B call a16
        jsr G_1722                    ; $0E0E call a16
        lda $9D04                     ; $0E11 ld a,[a16]
        sta <rE                       ; $0E14 ld e,a
        lda $9D05                     ; $0E15 ld a,[a16]
        sta <rD                       ; $0E18 ld d,a
        jsr G_00C3                    ; $0E19 call a16
        lda #$00                      ; $0E1C ld a,d8
        lbcc G_0E22                   ; $0E1E jr nc,pc+r8
        lda #$03                      ; $0E20 ld a,d8
G_0E22
        sta $9D0A                     ; $0E22 ld [a16],a
        ldx #$0400                    ; $0E25 ld hl,d16
        stx <rH                       
        pshs a                        ; $0E28 add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
        lda <rH                       ; $0E29 ld a,h
        cmpa #$08                     ; $0E2A cp d8
        lbcc G_0E46                   ; $0E2C jr nc,pc+r8
        lda $9F9A                     ; $0E2E ldh a,[a8]
        bita #$20                     ; $0E30 bit 5,a
        lbeq G_0E38                   ; $0E32 jr z,pc+r8
        lda #$00                      ; $0E34 ld a,d8
        jmp G_0E3E                    ; $0E36 jr pc+r8
G_0E38
        bita #$10                     ; $0E38 bit 4,a
        lbeq G_0E46                   ; $0E3A jr z,pc+r8
        lda #$03                      ; $0E3C ld a,d8
G_0E3E
        sta $9D0A                     ; $0E3E ld [a16],a
        lda #$FF                      ; $0E41 ld a,d8
        sta $9D19                     ; $0E43 ld [a16],a
G_0E46
        ldb #$00                      ; $0E46 ld b,d8
        stb <rB                       
        lda $9D47                     ; $0E48 ld a,[a16]
        cmpa #$40                     ; $0E4B cp d8
        lbcs G_0E59                   ; $0E4D jr c,pc+r8
        lda $9D0A                     ; $0E4F ld a,[a16]
        adda #$0C                     ; $0E52 add d8
        sta $9D0A                     ; $0E54 ld [a16],a
        jmp G_0E69                    ; $0E57 jr pc+r8
G_0E59
        lda $9D0B                     ; $0E59 ld a,[a16]
        cmpa #$0C                     ; $0E5C cp d8
        lbcs G_0E69                   ; $0E5E jr c,pc+r8
        lda $9D0A                     ; $0E60 ld a,[a16]
        adda #$06                     ; $0E63 add d8
        sta $9D0A                     ; $0E65 ld [a16],a
        inc <rB                       ; $0E68 inc b
G_0E69
        lda <rB                       ; $0E69 ld a,b
        sta $9D11                     ; $0E6A ld [a16],a
        clra                          ; $0E6D xor a
        sta $9D10                     ; $0E6E ld [a16],a
        lda #$02                      ; $0E71 ld a,d8
        sta $9D00                     ; $0E73 ld [a16],a
        rts                           ; $0E76 ret
G_0E77
        lda $9FAD                     ; $0E77 ldh a,[a8]
        bita #$80                     ; $0E79 bit 7,a
        beq _s16                      ; $0E7B ret nz
        rts                           
_s16
        bita #$20                     ; $0E7C bit 5,a
        beq _s17                      ; $0E7E ret nz
        rts                           
_s17
        bita #$10                     ; $0E7F bit 4,a
        beq _s18                      ; $0E81 ret nz
        rts                           
_s18
        lda $9D43                     ; $0E82 ld a,[a16]
        cmpa #$78                     ; $0E85 cp d8
        bcc _s19                      ; $0E87 ret c
        rts                           
_s19
        pshs cc                       ; $0E88 ld a,[a16]
        lda $9D01                     
        puls cc                       
        jsr G_0A2C                    ; $0E8B call a16
        beq _s20                      ; $0E8E ret nz
        rts                           
_s20
        lda <rC                       ; $0E8F ld a,c
        sta $9D18                     ; $0E90 ld [a16],a
        lda $9D18                     ; $0E93 ld a,[a16]
        jsr G_RST18                   ; $0E96 rst vec
        fcb $05,$F6,$F6,$F4,$F4,$F4
        adda #$10                     ; $0E9D add d8
        sta $9FC5                     ; $0E9F ldh [a8],a
        lda $9D18                     ; $0EA1 ld a,[a16]
        jsr G_RST18                   ; $0EA4 rst vec
        fcb $05,$06,$06,$02,$02,$04
        adda #$11                     ; $0EAB add d8
        sta <rB                       ; $0EAD ld b,a
        lda $9FC5                     ; $0EAE ldh a,[a8]
        sta <rC                       ; $0EB0 ld c,a
        ldx #$9D02                    ; $0EB1 ld hl,d16
        stx <rH                       
        jsr G_1C05                    ; $0EB4 call a16
        bcs _s21                      ; $0EB7 ret nc
        rts                           
_s21
        cmpa <rC                      ; $0EB8 cp c
        bcc _s22                      ; $0EB9 ret c
        rts                           
_s22
        lda $9D18                     ; $0EBA ld a,[a16]
        jsr G_RST18                   ; $0EBD rst vec
        fcb $05,$FE,$FE,$FB,$FB,$FC
        sta <rB                       ; $0EC4 ld b,a
        lda $9FC5                     ; $0EC5 ldh a,[a8]
        suba <rB                      ; $0EC7 sub b
        bita #$80                     ; $0EC8 bit 7,a
        lbeq G_0ED0                   ; $0ECA jr z,pc+r8
        eora #$FF                     ; $0ECC cpl
        inca                          ; $0ECD inc a
        ora #$80                      ; $0ECE set 7,a
G_0ED0
        sta <rB                       ; $0ED0 ld b,a
        lda $9D18                     ; $0ED1 ld a,[a16]
        bita #$01                     ; $0ED4 bit 0,a
        pshs cc                       ; $0ED6 ld a,b
        lda <rB                       
        puls cc                       
        lbeq G_0EDB                   ; $0ED7 jr z,pc+r8
        eora #$80                     ; $0ED9 xor d8
G_0EDB
        sta $9D14                     ; $0EDB ld [a16],a
        lda $9D18                     ; $0EDE ld a,[a16]
        jsr G_RST18                   ; $0EE1 rst vec
        fcb $05,$FC,$EE,$FC,$F2,$FE
        adda #$1E                     ; $0EE8 add d8
        sta $9FC5                     ; $0EEA ldh [a8],a
        lda $9D18                     ; $0EEC ld a,[a16]
        jsr G_RST18                   ; $0EEF rst vec
        fcb $05,$12,$04,$0E,$04,$0A
        adda #$23                     ; $0EF6 add d8
        sta <rB                       ; $0EF8 ld b,a
        lda $9FC5                     ; $0EF9 ldh a,[a8]
        sta <rC                       ; $0EFB ld c,a
        ldx #$9D04                    ; $0EFC ld hl,d16
        stx <rH                       
        jsr G_1BEF                    ; $0EFF call a16
        adda #$20                     ; $0F02 add d8
        cmpa <rB                      ; $0F04 cp b
        bcs _s23                      ; $0F05 ret nc
        rts                           
_s23
        cmpa <rC                      ; $0F06 cp c
        bcc _s24                      ; $0F07 ret c
        rts                           
_s24
        lda $9D18                     ; $0F08 ld a,[a16]
        jsr G_RST18                   ; $0F0B rst vec
        fcb $05,$02,$02,$10,$10,$30
        sta $9FC5                     ; $0F12 ldh [a8],a
        lda $9D18                     ; $0F14 ld a,[a16]
        jsr G_RST18                   ; $0F17 rst vec
        fcb $05,$30,$30,$40,$40,$50
        sta <rH                       ; $0F1E ld h,a
        lda $9FC5                     ; $0F1F ldh a,[a8]
        sta <rL                       ; $0F21 ld l,a
        lda $9D07                     ; $0F22 ld a,[a16]
        jsr G_1C20                    ; $0F25 call a16
        bcs _s25                      ; $0F28 ret nc
        rts                           
_s25
        cmpa <rL                      ; $0F29 cp l
        bcc _s26                      ; $0F2A ret c
        rts                           
_s26
        lda #$01                      ; $0F2B ld a,d8
        sta $9D5C                     ; $0F2D ld [a16],a
        lda #$80                      ; $0F30 ld a,d8
        sta $9D4F                     ; $0F32 ld [a16],a
        lda $9D00                     ; $0F35 ld a,[a16]
        cmpa #$07                     ; $0F38 cp d8
        lbne G_0FCA                   ; $0F3A jp nz,a16
        lda $9D13                     ; $0F3D ld a,[a16]
        bita #$02                     ; $0F40 bit 1,a
        pshs cc                       ; $0F42 ld a,[a16]
        lda $9D92                     
        puls cc                       
        lbne G_0F55                   ; $0F45 jr nz,pc+r8
        sta $9D51                     ; $0F47 ld [a16],a
        lda $9D47                     ; $0F4A ld a,[a16]
        suba #$26                     ; $0F4D sub d8
        lsra                          ; $0F4F srl a
        adda #$0C                     ; $0F51 add d8
        jmp G_0F68                    ; $0F53 jr pc+r8
G_0F55
        jsr G_1E87                    ; $0F55 call a16
        sta $9D51                     ; $0F58 ld [a16],a
        ldx #$9D15                    ; $0F5B ld hl,d16
        stx <rH                       
        anda #$7F                     ; $0F5E and d8
        andcc #$FE                    
        pshs cc                       ; $0F60 ld [hl],a
        ldx <rH                       
        sta ,x                        
        puls cc                       
        pshs cc                       ; $0F61 ld e,d8
        ldb #$58                      
        stb <rE                       
        puls cc                       
        jsr G_1CF6                    ; $0F63 call a16
        adda #$0C                     ; $0F66 add d8
G_0F68
        sta $9D52                     ; $0F68 ld [a16],a
        lda $9F9A                     ; $0F6B ldh a,[a8]
        jsr G_1E3C                    ; $0F6D call a16
        ldx #$846C                    ; $0F70 ld de,d16
        stx <rD                       
        lda $9F91                     ; $0F73 ldh a,[a8]
        bita #$02                     ; $0F75 bit 1,a
        lbne G_0F7C                   ; $0F77 jr nz,pc+r8
        ldx #$546C                    ; $0F79 ld de,d16
        stx <rD                       
G_0F7C
        lda $9F9A                     ; $0F7C ldh a,[a8]
        bita #$20                     ; $0F7E bit 5,a
        lbeq G_0F86                   ; $0F80 jr z,pc+r8
        pshs cc                       ; $0F82 ld a,d8
        lda #$F0                      
        puls cc                       
        jmp G_0F8C                    ; $0F84 jr pc+r8
G_0F86
        bita #$10                     ; $0F86 bit 4,a
        lbeq G_0F9B                   ; $0F88 jr z,pc+r8
        pshs cc                       ; $0F8A ld a,d8
        lda #$10                      
        puls cc                       
G_0F8C
        pshs a,cc                     ; $0F8C push af
        lda $9D13                     ; $0F8D ld a,[a16]
        bita #$01                     ; $0F90 bit 0,a
        lbne G_0F98                   ; $0F92 jr nz,pc+r8
        puls a,cc                     ; $0F94 pop af
        asra                          ; $0F95 sra a
        pshs a,cc                     ; $0F97 push af
G_0F98
        puls a,cc                     ; $0F98 pop af
        adda <rD                      ; $0F99 add d
        sta <rD                       ; $0F9A ld d,a
G_0F9B
        jsr G_1D22                    ; $0F9B call a16
        eora #$80                     ; $0F9E xor d8
        sta <rB                       ; $0FA0 ld b,a
        lda $9D13                     ; $0FA1 ld a,[a16]
        bita #$02                     ; $0FA4 bit 1,a
        pshs cc                       ; $0FA6 ld c,d8
        ldb #$10                      
        stb <rC                       
        puls cc                       
        lbeq G_0FAC                   ; $0FA8 jr z,pc+r8
        ldb #$04                      ; $0FAA ld c,d8
        stb <rC                       
G_0FAC
        lda $9DDF                     ; $0FAC ld a,[a16]
        cmpa #$03                     ; $0FAF cp d8
        lbcc G_0FB7                   ; $0FB1 jr nc,pc+r8
        lsr <rC                       ; $0FB3 srl c
        lsr <rC                       ; $0FB5 srl c
G_0FB7
        lda $9F9A                     ; $0FB7 ldh a,[a8]
        jsr G_1E0D                    ; $0FB9 call a16
        lda <rB                       ; $0FBC ld a,b
        sta $9D50                     ; $0FBD ld [a16],a
        lda $9D18                     ; $0FC0 ld a,[a16]
        sta <rB                       ; $0FC3 ld b,a
        lda $9D13                     ; $0FC4 ld a,[a16]
        jmp G_165C                    ; $0FC7 jp a16
G_0FCA
        lda $9D19                     ; $0FCA ld a,[a16]
        tsta                          ; $0FCD and a
        lbeq G_0FDC                   ; $0FCE jr z,pc+r8
        lda $9D18                     ; $0FD0 ld a,[a16]
        adda #$05                     ; $0FD3 add d8
        sta $9D18                     ; $0FD5 ld [a16],a
        clra                          ; $0FD8 xor a
        sta $9D19                     ; $0FD9 ld [a16],a
G_0FDC
        lda $9D0A                     ; $0FDC ld a,[a16]
G_0FDF
        cmpa #$06                     ; $0FDF cp d8
        lbcs G_0FE7                   ; $0FE1 jr c,pc+r8
        suba #$06                     ; $0FE3 sub d8
        jmp G_0FDF                    ; $0FE5 jr pc+r8
G_0FE7
        ldb #$04                      ; $0FE7 ld b,d8
        stb <rB                       
        tsta                          ; $0FE9 and a
        lbeq G_0FEE                   ; $0FEA jr z,pc+r8
        ldb #$FC                      ; $0FEC ld b,d8
        stb <rB                       
G_0FEE
        ldx #$9D16                    ; $0FEE ld hl,d16
        stx <rH                       
        lda $9F9A                     ; $0FF1 ldh a,[a8]
        jsr G_1E9F                    ; $0FF3 call a16
        jsr G_08BC                    ; $0FF6 call a16
        suba #$B9                     ; $0FF9 sub d8
        lbcc G_1009                   ; $0FFB jr nc,pc+r8
        eora #$FF                     ; $0FFD cpl
        inca                          ; $0FFE inc a
        asra                          ; $0FFF sra a
        asra                          ; $1001 sra a
        sta <rE                       ; $1003 ld e,a
        lda #$52                      ; $1004 ld a,d8
        suba <rE                      ; $1006 sub e
        jmp G_100F                    ; $1007 jr pc+r8
G_1009
        asra                          ; $1009 sra a
        asra                          ; $100B sra a
        adda #$52                     ; $100D add d8
G_100F
        sta <rE                       ; $100F ld e,a
        ldb #$6C                      ; $1010 ld d,d8
        stb <rD                       
        lda $9D0A                     ; $1012 ld a,[a16]
        cmpa #$0C                     ; $1015 cp d8
        lbcc G_1028                   ; $1017 jr nc,pc+r8
        lda $9D18                     ; $1019 ld a,[a16]
        suba #$05                     ; $101C sub d8
        lbcs G_1028                   ; $101E jr c,pc+r8
        ldb #$5C                      ; $1020 ld d,d8
        stb <rD                       
        bita #$01                     ; $1022 bit 0,a
        lbeq G_1028                   ; $1024 jr z,pc+r8
        ldb #$7C                      ; $1026 ld d,d8
        stb <rD                       
G_1028
        lda $9D0A                     ; $1028 ld a,[a16]
        cmpa #$0C                     ; $102B cp d8
        lbcs G_1037                   ; $102D jr c,pc+r8
        ldb #$68                      ; $102F ld e,d8
        stb <rE                       
        ldx <rH                       ; $1031 ld a,[hl]
        lda ,x                        
        adda #$10                     ; $1032 add d8
        ldx <rH                       ; $1034 ld [hl],a
        sta ,x                        
        jmp G_1046                    ; $1035 jr pc+r8
G_1037
        cmpa #$06                     ; $1037 cp d8
        lbcs G_1046                   ; $1039 jr c,pc+r8
        ldb #$58                      ; $103B ld e,d8
        stb <rE                       
        ldx <rH                       ; $103D ld a,[hl]
        lda ,x                        
        suba #$10                     ; $103E sub d8
        ldx <rH                       ; $1040 ld [hl],a
        sta ,x                        
        lda #$02                      ; $1041 ld a,d8
        sta $9D5C                     ; $1043 ld [a16],a
G_1046
        lda $9D18                     ; $1046 ld a,[a16]
        cmpa #$05                     ; $1049 cp d8
        lbcc G_1055                   ; $104B jr nc,pc+r8
        pshs cc                       ; $104D push hl
        ldx <rH                       
        puls cc                       
        pshs x                        
        pshs cc                       ; $104E ld hl,d16
        ldx #$9D04                    
        stx <rH                       
        puls cc                       
        jsr G_1E6E                    ; $1051 call a16
        puls x                        ; $1054 pop hl
        pshs cc                       
        stx <rH                       
        puls cc                       
G_1055
        pshs cc                       ; $1055 ldh a,[a8]
        lda $9F9A                     
        puls cc                       
        pshs cc                       ; $1057 ld b,a
        sta <rB                       
        puls cc                       
        pshs cc                       ; $1058 ld a,[a16]
        lda $9D0A                     
        puls cc                       
        jsr G_1D71                    ; $105B call a16
        pshs cc                       ; $105E ld a,[a16]
        lda $9D0A                     
        puls cc                       
        jsr G_1D90                    ; $1061 call a16
        jsr G_1CF6                    ; $1064 call a16
        lda $9D0A                     ; $1067 ld a,[a16]
        cmpa #$0C                     ; $106A cp d8
        lbcs G_1078                   ; $106C jr c,pc+r8
        lda #$90                      ; $106E ld a,d8
        sta $9D52                     ; $1070 ld [a16],a
        lda #$22                      ; $1073 ld a,d8
        sta $9D5C                     ; $1075 ld [a16],a
G_1078
        lda $9D15                     ; $1078 ld a,[a16]
        sta <rB                       ; $107B ld b,a
        lda $9D13                     ; $107C ld a,[a16]
        jsr G_1DD9                    ; $107F call a16
        lda <rB                       ; $1082 ld a,b
        sta $9D51                     ; $1083 ld [a16],a
        lda #$80                      ; $1086 ld a,d8
        sta $9D4F                     ; $1088 ld [a16],a
        jsr G_1D22                    ; $108B call a16
        ldb #$10                      ; $108E ld c,d8
        stb <rC                       
        ldx #$9D14                    ; $1090 ld hl,d16
        stx <rH                       
        jsr G_1D57                    ; $1093 call a16
        jsr G_1CB1                    ; $1096 call a16
        lda $9D18                     ; $1099 ld a,[a16]
        cmpa #$05                     ; $109C cp d8
        lbcs G_10A2                   ; $109E jr c,pc+r8
        suba #$05                     ; $10A0 sub d8
G_10A2
        pshs cc                       ; $10A2 ld b,a
        sta <rB                       
        puls cc                       
        pshs cc                       ; $10A3 ld a,[a16]
        lda $9D13                     
        puls cc                       
        jmp S_P1SHOT                  ; $10A6 jp a16 (réglage)
G_10A9
        lda $9FAD                     ; $10A9 ldh a,[a8]
        bita #$80                     ; $10AB bit 7,a
        beq _s27                      ; $10AD ret nz
        rts                           
_s27
        bita #$10                     ; $10AE bit 4,a
        beq _s28                      ; $10B0 ret nz
        rts                           
_s28
        jsr G_0890                    ; $10B1 call a16
        sta <rB                       ; $10B4 ld b,a
        jsr G_08BC                    ; $10B5 call a16
        suba <rB                      ; $10B8 sub b
        lbcc G_10BD                   ; $10B9 jr nc,pc+r8
        eora #$FF                     ; $10BB cpl
        inca                          ; $10BC inc a
G_10BD
        cmpa #$03                     ; $10BD cp d8
        bcs _s29                      ; $10BF ret nc
        rts                           
_s29
        jsr G_0885                    ; $10C0 call a16
        sta <rB                       ; $10C3 ld b,a
        jsr G_08B1                    ; $10C4 call a16
        suba <rB                      ; $10C7 sub b
        lbcc G_10CC                   ; $10C8 jr nc,pc+r8
        eora #$FF                     ; $10CA cpl
        inca                          ; $10CB inc a
G_10CC
        cmpa #$04                     ; $10CC cp d8
        bcs _s30                      ; $10CE ret nc
        rts                           
_s30
        lda $9D47                     ; $10CF ld a,[a16]
        cmpa #$34                     ; $10D2 cp d8
        bcs _s31                      ; $10D4 ret nc
        rts                           
_s31
        lda $9FAD                     ; $10D5 ldh a,[a8]
        bita #$08                     ; $10D7 bit 3,a
        lbeq G_10DF                   ; $10D9 jr z,pc+r8
        ora #$30                      ; $10DB or d8
        jmp G_10E3                    ; $10DD jr pc+r8
G_10DF
        ora #$38                      ; $10DF or d8
        sta $9FAE                     ; $10E1 ldh [a8],a
G_10E3
        sta $9FAD                     ; $10E3 ldh [a8],a
        lda #$0D                      ; $10E5 ld a,d8
        jsr S_SOUND                   ; $10E7 call a16
        jmp G_1C84                    ; $10EA jp a16
G_10ED
        ldx #$9F96                    ; $10ED ld hl,d16
        stx <rH                       
        ldx <rH                       ; $10F0 set 7,[hl]
        ldb ,x                        
        orb #$80                      
        stb ,x                        
        ldx #$9D22                    ; $10F2 ld hl,d16
        stx <rH                       
        jsr G_09FA                    ; $10F5 call a16
        lda <rC                       ; $10F8 ld a,c
        sta $9D2B                     ; $10F9 ld [a16],a
        lda $9D20                     ; $10FC ld a,[a16]
        jsr G_RST08                   ; $10FF rst vec
        fdb G_1110,G_1149,G_1152,G_11BC,G_120A,G_1229,G_12AF,G_12E8,G_17CD
G_1110
        jsr G_1317                    ; $1110 call a16
        jsr G_113D                    ; $1113 call a16
        lda #$01                      ; $1116 ld a,d8
        sta $9D20                     ; $1118 ld [a16],a
        rts                           ; $111B ret
G_111C
        lda $9F91                     ; $111C ldh a,[a8]
        bita #$02                     ; $111E bit 1,a
        pshs cc                       ; $1120 ld a,d8
        lda #$58                      
        puls cc                       
        lbeq G_1126                   ; $1122 jr z,pc+r8
        pshs cc                       ; $1124 ld a,d8
        lda #$7F                      
        puls cc                       
G_1126
        pshs cc                       ; $1126 ld [a16],a
        sta $9D25                     
        puls cc                       
        pshs cc                       ; $1129 ld a,d8
        lda #$7F                      
        puls cc                       
        lbeq G_112F                   ; $112B jr z,pc+r8
        lda #$80                      ; $112D ld a,d8
G_112F
        sta $9D24                     ; $112F ld [a16],a
        lda #$36                      ; $1132 ld a,d8
        sta $9D23                     ; $1134 ld [a16],a
        lda #$7F                      ; $1137 ld a,d8
        sta $9D22                     ; $1139 ld [a16],a
        rts                           ; $113C ret
G_113D
        lda $9F91                     ; $113D ldh a,[a8]
        bita #$02                     ; $113F bit 1,a
        pshs cc                       ; $1141 ld a,d8
        lda #$45                      
        puls cc                       
        lbeq G_1147                   ; $1143 jr z,pc+r8
        pshs cc                       ; $1145 ld a,d8
        lda #$92                      
        puls cc                       
G_1147
        jmp G_1126                    ; $1147 jr pc+r8
G_1149
        jsr G_132A                    ; $1149 call a16
        jsr G_1370                    ; $114C call a16
        jmp G_1618                    ; $114F jp a16
G_1152
        lda $9D2A                     ; $1152 ld a,[a16]
        cmpa #$06                     ; $1155 cp d8
        lbeq G_1167                   ; $1157 jr z,pc+r8
        cmpa #$09                     ; $1159 cp d8
        lbeq G_1167                   ; $115B jr z,pc+r8
        lda $9D31                     ; $115D ld a,[a16]
        jsr G_RST18                   ; $1160 rst vec
        fcb $03,$04,$08,$06
        jmp G_116F                    ; $1165 jr pc+r8
G_1167
        lda $9D31                     ; $1167 ld a,[a16]
        jsr G_RST18                   ; $116A rst vec
        fcb $03,$0A,$0C,$01
G_116F
        sta <rB                       ; $116F ld b,a
        lda $9D30                     ; $1170 ld a,[a16]
        inca                          ; $1173 inc a
        sta $9D30                     ; $1174 ld [a16],a
        cmpa <rB                      ; $1177 cp b
        lbcs G_1189                   ; $1178 jr c,pc+r8
        clra                          ; $117A xor a
        sta $9D30                     ; $117B ld [a16],a
        lda $9D31                     ; $117E ld a,[a16]
        inca                          ; $1181 inc a
        cmpa #$03                     ; $1182 cp d8
        lbcc G_11AE                   ; $1184 jr nc,pc+r8
        sta $9D31                     ; $1186 ld [a16],a
G_1189
        lda $9D2A                     ; $1189 ld a,[a16]
        sta <rB                       ; $118C ld b,a
        lda $9D31                     ; $118D ld a,[a16]
        adda <rB                      ; $1190 add b
        jsr G_RST18                   ; $1191 rst vec
        fcb $12,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0E,$0F,$10,$10,$04,$05,$06,$04,$05,$06
        sta $9D21                     ; $11A5 ld [a16],a
        jsr G_13E8                    ; $11A8 call a16
        jmp G_1618                    ; $11AB jp a16
G_11AE
        clra                          ; $11AE xor a
        sta $9D30                     ; $11AF ld [a16],a
        sta $9D31                     ; $11B2 ld [a16],a
        inca                          ; $11B5 inc a
        sta $9D20                     ; $11B6 ld [a16],a
        jmp G_1618                    ; $11B9 jp a16
G_11BC
        lda #$03                      ; $11BC ld a,d8
        sta $9D21                     ; $11BE ld [a16],a
        lda $9D37                     ; $11C1 ld a,[a16]
        tsta                          ; $11C4 and a
        lbne G_11D2                   ; $11C5 jr nz,pc+r8
        lda #$01                      ; $11C7 ld a,d8
        sta $9D40                     ; $11C9 ld [a16],a
        lda #$0E                      ; $11CC ld a,d8
        sta $9D47                     ; $11CE ld [a16],a
        clra                          ; $11D1 xor a
G_11D2
        inca                          ; $11D2 inc a
        sta $9D37                     ; $11D3 ld [a16],a
        cmpa #$10                     ; $11D6 cp d8
        lbcs G_11F0                   ; $11D8 jr c,pc+r8
        suba #$10                     ; $11DA sub d8
        cmpa #$04                     ; $11DC cp d8
        lbcs G_1209                   ; $11DE jr c,pc+r8
        suba #$04                     ; $11E0 sub d8
        cmpa #$10                     ; $11E2 cp d8
        lbcs G_11F0                   ; $11E4 jr c,pc+r8
        clra                          ; $11E6 xor a
        sta $9D37                     ; $11E7 ld [a16],a
        lda #$05                      ; $11EA ld a,d8
        sta $9D20                     ; $11EC ld [a16],a
        rts                           ; $11EF ret
G_11F0
        suba #$08                     ; $11F0 sub d8
        lda $9D47                     ; $11F2 ld a,[a16]
        lbcs G_11FB                   ; $11F5 jr c,pc+r8
        inca                          ; $11F7 inc a
        inca                          ; $11F8 inc a
        jmp G_11FD                    ; $11F9 jr pc+r8
G_11FB
        deca                          ; $11FB dec a
        deca                          ; $11FC dec a
G_11FD
        sta $9D47                     ; $11FD ld [a16],a
        cmpa #$0E                     ; $1200 cp d8
        lbcc G_1209                   ; $1202 jr nc,pc+r8
        lda #$13                      ; $1204 ld a,d8
        sta $9D21                     ; $1206 ld [a16],a
G_1209
        rts                           ; $1209 ret
G_120A
        jsr G_1317                    ; $120A call a16
        lda #$80                      ; $120D ld a,d8
        sta $9FAD                     ; $120F ldh [a8],a
        clra                          ; $1211 xor a
        sta $9D37                     ; $1212 ld [a16],a
        jsr G_111C                    ; $1215 call a16
        jsr S_RET                     ; $1218 call a16
        lda $9FBB                     ; $121B ldh a,[a8]
        sta $9FA8                     ; $121D ldh [a8],a
        lda #$28                      ; $121F ld a,d8
        sta $9FAA                     ; $1221 ldh [a8],a
        lda #$05                      ; $1223 ld a,d8
        sta $9D20                     ; $1225 ld [a16],a
        rts                           ; $1228 ret
G_1229
        lda #$03                      ; $1229 ld a,d8
        sta $9D21                     ; $122B ld [a16],a
        lda $9F9C                     ; $122E ldh a,[a8]
        tsta                          ; $1230 and a
        lbne G_1248                   ; $1231 jr nz,pc+r8
        lda $9D37                     ; $1233 ld a,[a16]
        inca                          ; $1236 inc a
        sta $9D37                     ; $1237 ld [a16],a
        cmpa #$B4                     ; $123A cp d8
        lbcs G_1285                   ; $123C jr c,pc+r8
        clra                          ; $123E xor a
        sta $9D37                     ; $123F ld [a16],a
        lda #$03                      ; $1242 ld a,d8
        sta $9D20                     ; $1244 ld [a16],a
        rts                           ; $1247 ret
G_1248
        clra                          ; $1248 xor a
        sta $9D37                     ; $1249 ld [a16],a
        lda $9F9C                     ; $124C ldh a,[a8]
        sta <rC                       ; $124E ld c,a
        lda $9F91                     ; $124F ldh a,[a8]
        bita #$02                     ; $1251 bit 1,a
        pshs cc                       ; $1253 ld de,d16
        ldx #$3F80                    
        stx <rD                       
        puls cc                       
        lbeq G_125B                   ; $1256 jr z,pc+r8
        ldx #$7380                    ; $1258 ld de,d16
        stx <rD                       
G_125B
        ldx #$9D24                    ; $125B ld hl,d16
        stx <rH                       
        ldx <rH                       ; $125E ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $125F ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $1260 ld l,a
        jsr G_00C3                    ; $1261 call a16
        lbcc G_1268                   ; $1264 jr nc,pc+r8
        ldb <rC                       ; $1266 res 5,c
        andb #$DF                     
        stb <rC                       
G_1268
        lda $9F91                     ; $1268 ldh a,[a8]
        bita #$02                     ; $126A bit 1,a
        pshs cc                       ; $126C ld de,d16
        ldx #$6480                    
        stx <rD                       
        puls cc                       
        lbeq G_1274                   ; $126F jr z,pc+r8
        ldx #$9880                    ; $1271 ld de,d16
        stx <rD                       
G_1274
        jsr G_00C3                    ; $1274 call a16
        lbcs G_127B                   ; $1277 jr c,pc+r8
        ldb <rC                       ; $1279 res 4,c
        andb #$EF                     
        stb <rC                       
G_127B
        lda $9D28                     ; $127B ld a,[a16]
        sta <rB                       ; $127E ld b,a
        ldx #$9D24                    ; $127F ld hl,d16
        stx <rH                       
        jsr G_08C7                    ; $1282 call a16
G_1285
        lda $9D22                     ; $1285 ld a,[a16]
        sta $9D42                     ; $1288 ld [a16],a
        lda $9D23                     ; $128B ld a,[a16]
        sta $9D43                     ; $128E ld [a16],a
        lda $9D24                     ; $1291 ld a,[a16]
        sta $9D44                     ; $1294 ld [a16],a
        lda $9D25                     ; $1297 ld a,[a16]
        suba #$06                     ; $129A sub d8
        jsr G_16F9                    ; $129C call a16
        lda $9F9D                     ; $129F ldh a,[a8]
        anda #$03                     ; $12A1 and d8
        bne _s32                      ; $12A3 ret z
        rts                           
_s32
        lda #$02                      ; $12A4 ld a,d8
        sta $9D40                     ; $12A6 ld [a16],a
        lda #$06                      ; $12A9 ld a,d8
        sta $9D20                     ; $12AB ld [a16],a
        rts                           ; $12AE ret
G_12AF
        lda #$04                      ; $12AF ld a,d8
        sta $9D21                     ; $12B1 ld [a16],a
        lda $9F9D                     ; $12B4 ldh a,[a8]
        anda #$03                     ; $12B6 and d8
        lbeq G_12D0                   ; $12B8 jr z,pc+r8
        sta $9D33                     ; $12BA ld [a16],a
        lda #$05                      ; $12BD ld a,d8
        jsr S_SOUND                   ; $12BF call a16
        clra                          ; $12C2 xor a
        sta $9D30                     ; $12C3 ld [a16],a
        sta $9D31                     ; $12C6 ld [a16],a
        lda #$07                      ; $12C9 ld a,d8
        sta $9D20                     ; $12CB ld [a16],a
        jmp G_12E7                    ; $12CE jr pc+r8
G_12D0
        lda $9D52                     ; $12D0 ld a,[a16]
        bita #$80                     ; $12D3 bit 7,a
        lbeq G_12E7                   ; $12D5 jr z,pc+r8
        lda $9D47                     ; $12D7 ld a,[a16]
        cmpa #$30                     ; $12DA cp d8
        lbcc G_12E7                   ; $12DC jr nc,pc+r8
        clra                          ; $12DE xor a
        sta $9D37                     ; $12DF ld [a16],a
        lda #$05                      ; $12E2 ld a,d8
        sta $9D20                     ; $12E4 ld [a16],a
G_12E7
        rts                           ; $12E7 ret
G_12E8
        lda $9D31                     ; $12E8 ld a,[a16]
        jsr G_RST18                   ; $12EB rst vec
        fcb $02,$08,$0A
        sta <rB                       ; $12EF ld b,a
        lda $9D30                     ; $12F0 ld a,[a16]
        inca                          ; $12F3 inc a
        sta $9D30                     ; $12F4 ld [a16],a
        cmpa <rB                      ; $12F7 cp b
        lbcs G_130A                   ; $12F8 jr c,pc+r8
        clra                          ; $12FA xor a
        sta $9D30                     ; $12FB ld [a16],a
        lda $9D31                     ; $12FE ld a,[a16]
        inca                          ; $1301 inc a
        cmpa #$02                     ; $1302 cp d8
        lbcc G_11AE                   ; $1304 jp nc,a16
        sta $9D31                     ; $1307 ld [a16],a
G_130A
        lda $9D31                     ; $130A ld a,[a16]
        jsr G_RST18                   ; $130D rst vec
        fcb $02,$05,$06
        sta $9D21                     ; $1311 ld [a16],a
        jmp G_13E8                    ; $1314 jp a16
G_1317
        lda $9DA8                     ; $1317 ld a,[a16]
        sta $9D28                     ; $131A ld [a16],a
        lda $9DA9                     ; $131D ld a,[a16]
        sta $9D29                     ; $1320 ld [a16],a
        lda $9DB6                     ; $1323 ld a,[a16]
        sta $9D36                     ; $1326 ld [a16],a
        rts                           ; $1329 ret
G_132A
        lda $9D28                     ; $132A ld a,[a16]
        sta <rB                       ; $132D ld b,a
        lda $9F9C                     ; $132E ldh a,[a8]
        sta <rC                       ; $1330 ld c,a
        ldx #$9D24                    ; $1331 ld hl,d16
        stx <rH                       
        jsr G_08C7                    ; $1334 call a16
        lda $9D29                     ; $1337 ld a,[a16]
        sta <rB                       ; $133A ld b,a
        ldx #$9D22                    ; $133B ld hl,d16
        stx <rH                       
        jsr G_08F8                    ; $133E call a16
        lda $9D31                     ; $1341 ld a,[a16]
        anda #$04                     ; $1344 and d8
        lsra                          ; $1346 srl a
        lsra                          ; $1348 srl a
        sta <rD                       ; $134A ld d,a
        lda <rC                       ; $134B ld a,c
        anda #$F0                     ; $134C and d8
        lbeq G_136C                   ; $134E jr z,pc+r8
        bita #$10                     ; $1350 bit 4,a
        lbeq G_1356                   ; $1352 jr z,pc+r8
        inc <rD                       ; $1354 inc d
        inc <rD                       ; $1355 inc d
G_1356
        lda $9D30                     ; $1356 ld a,[a16]
        adda <rB                      ; $1359 add b
        sta $9D30                     ; $135A ld [a16],a
        lda $9D31                     ; $135D ld a,[a16]
        adca #$00                     ; $1360 adc d8
        sta $9D31                     ; $1362 ld [a16],a
        lda <rD                       ; $1365 ld a,d
        jsr G_RST18                   ; $1366 rst vec
        fcb $04,$01,$02,$11,$12
G_136C
        sta $9D21                     ; $136C ld [a16],a
        rts                           ; $136F ret
G_1370
        lda $9F9D                     ; $1370 ldh a,[a8]
        anda #$03                     ; $1372 and d8
        andcc #$FE                    
        bne _s33                      ; $1374 ret z
        rts                           
_s33
        sta $9D33                     ; $1375 ld [a16],a
        lda #$05                      ; $1378 ld a,d8
        jsr S_SOUND                   ; $137A call a16
        jsr G_08A6                    ; $137D call a16
        jsr G_1722                    ; $1380 call a16
        lda $9D24                     ; $1383 ld a,[a16]
        sta <rE                       ; $1386 ld e,a
        lda $9D25                     ; $1387 ld a,[a16]
        sta <rD                       ; $138A ld d,a
        jsr G_00C3                    ; $138B call a16
        lda #$03                      ; $138E ld a,d8
        lbcc G_1393                   ; $1390 jr nc,pc+r8
        clra                          ; $1392 xor a
G_1393
        sta $9D2A                     ; $1393 ld [a16],a
        ldx #$0400                    ; $1396 ld hl,d16
        stx <rH                       
        pshs a                        ; $1399 add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
        lda <rH                       ; $139A ld a,h
        cmpa #$08                     ; $139B cp d8
        lbcc G_13B7                   ; $139D jr nc,pc+r8
        lda $9F9C                     ; $139F ldh a,[a8]
        bita #$20                     ; $13A1 bit 5,a
        lbeq G_13A9                   ; $13A3 jr z,pc+r8
        lda #$03                      ; $13A5 ld a,d8
        jmp G_13AF                    ; $13A7 jr pc+r8
G_13A9
        bita #$10                     ; $13A9 bit 4,a
        lbeq G_13B7                   ; $13AB jr z,pc+r8
        lda #$00                      ; $13AD ld a,d8
G_13AF
        sta $9D2A                     ; $13AF ld [a16],a
        lda #$FF                      ; $13B2 ld a,d8
        sta $9D39                     ; $13B4 ld [a16],a
G_13B7
        ldb #$00                      ; $13B7 ld b,d8
        stb <rB                       
        lda $9D47                     ; $13B9 ld a,[a16]
        cmpa #$40                     ; $13BC cp d8
        lbcs G_13CA                   ; $13BE jr c,pc+r8
        lda $9D2A                     ; $13C0 ld a,[a16]
        adda #$0C                     ; $13C3 add d8
        sta $9D2A                     ; $13C5 ld [a16],a
        jmp G_13DA                    ; $13C8 jr pc+r8
G_13CA
        lda $9D2B                     ; $13CA ld a,[a16]
        cmpa #$0C                     ; $13CD cp d8
        lbcs G_13DA                   ; $13CF jr c,pc+r8
        lda $9D2A                     ; $13D1 ld a,[a16]
        adda #$06                     ; $13D4 add d8
        sta $9D2A                     ; $13D6 ld [a16],a
        inc <rB                       ; $13D9 inc b
G_13DA
        lda <rB                       ; $13DA ld a,b
        sta $9D31                     ; $13DB ld [a16],a
        clra                          ; $13DE xor a
        sta $9D30                     ; $13DF ld [a16],a
        lda #$02                      ; $13E2 ld a,d8
        sta $9D20                     ; $13E4 ld [a16],a
        rts                           ; $13E7 ret
G_13E8
        lda $9FAD                     ; $13E8 ldh a,[a8]
        bita #$80                     ; $13EA bit 7,a
        bne _s34                      ; $13EC ret z
        rts                           
_s34
        bita #$20                     ; $13ED bit 5,a
        beq _s35                      ; $13EF ret nz
        rts                           
_s35
        bita #$10                     ; $13F0 bit 4,a
        beq _s36                      ; $13F2 ret nz
        rts                           
_s36
        lda $9D43                     ; $13F3 ld a,[a16]
        cmpa #$78                     ; $13F6 cp d8
        bcs _s37                      ; $13F8 ret nc
        rts                           
_s37
        pshs cc                       ; $13F9 ld a,[a16]
        lda $9D21                     
        puls cc                       
        jsr G_0A2C                    ; $13FC call a16
        beq _s38                      ; $13FF ret nz
        rts                           
_s38
        lda <rC                       ; $1400 ld a,c
        sta $9D38                     ; $1401 ld [a16],a
        lda $9D38                     ; $1404 ld a,[a16]
        jsr G_RST18                   ; $1407 rst vec
        fcb $05,$FA,$FA,$FE,$FE,$FC
        adda #$10                     ; $140E add d8
        sta $9FC5                     ; $1410 ldh [a8],a
        lda $9D38                     ; $1412 ld a,[a16]
        jsr G_RST18                   ; $1415 rst vec
        fcb $05,$0A,$0A,$0C,$0C,$0C
        adda #$11                     ; $141C add d8
        sta <rB                       ; $141E ld b,a
        lda $9FC5                     ; $141F ldh a,[a8]
        sta <rC                       ; $1421 ld c,a
        ldx #$9D22                    ; $1422 ld hl,d16
        stx <rH                       
        jsr G_1C05                    ; $1425 call a16
        bcs _s39                      ; $1428 ret nc
        rts                           
_s39
        cmpa <rC                      ; $1429 cp c
        bcc _s40                      ; $142A ret c
        rts                           
_s40
        lda $9D38                     ; $142B ld a,[a16]
        jsr G_RST18                   ; $142E rst vec
        fcb $05,$02,$02,$05,$05,$04
        sta <rB                       ; $1435 ld b,a
        lda $9FC5                     ; $1436 ldh a,[a8]
        suba <rB                      ; $1438 sub b
        bita #$80                     ; $1439 bit 7,a
        lbeq G_1441                   ; $143B jr z,pc+r8
        eora #$FF                     ; $143D cpl
        inca                          ; $143E inc a
        ora #$80                      ; $143F set 7,a
G_1441
        sta <rB                       ; $1441 ld b,a
        lda $9D38                     ; $1442 ld a,[a16]
        bita #$01                     ; $1445 bit 0,a
        pshs cc                       ; $1447 ld a,b
        lda <rB                       
        puls cc                       
        lbeq G_144C                   ; $1448 jr z,pc+r8
        eora #$80                     ; $144A xor d8
G_144C
        sta $9D34                     ; $144C ld [a16],a
        lda $9D38                     ; $144F ld a,[a16]
        jsr G_RST18                   ; $1452 rst vec
        fcb $05,$EE,$FC,$F2,$FC,$F6
        adda #$1E                     ; $1459 add d8
        sta $9FC5                     ; $145B ldh [a8],a
        lda $9D38                     ; $145D ld a,[a16]
        jsr G_RST18                   ; $1460 rst vec
        fcb $05,$04,$12,$04,$0E,$02
        adda #$23                     ; $1467 add d8
        sta <rB                       ; $1469 ld b,a
        lda $9FC5                     ; $146A ldh a,[a8]
        sta <rC                       ; $146C ld c,a
        ldx #$9D24                    ; $146D ld hl,d16
        stx <rH                       
        jsr G_1BEF                    ; $1470 call a16
        adda #$20                     ; $1473 add d8
        cmpa <rB                      ; $1475 cp b
        bcs _s41                      ; $1476 ret nc
        rts                           
_s41
        cmpa <rC                      ; $1477 cp c
        bcc _s42                      ; $1478 ret c
        rts                           
_s42
        lda $9D38                     ; $1479 ld a,[a16]
        jsr G_RST18                   ; $147C rst vec
        fcb $05,$02,$02,$10,$10,$30
        sta $9FC5                     ; $1483 ldh [a8],a
        lda $9D38                     ; $1485 ld a,[a16]
        jsr G_RST18                   ; $1488 rst vec
        fcb $05,$30,$30,$40,$40,$50
        sta <rH                       ; $148F ld h,a
        lda $9FC5                     ; $1490 ldh a,[a8]
        sta <rL                       ; $1492 ld l,a
        lda $9D27                     ; $1493 ld a,[a16]
        jsr G_1C20                    ; $1496 call a16
        bcs _s43                      ; $1499 ret nc
        rts                           
_s43
        cmpa <rL                      ; $149A cp l
        bcc _s44                      ; $149B ret c
        rts                           
_s44
        lda #$01                      ; $149C ld a,d8
        sta $9D5C                     ; $149E ld [a16],a
        clra                          ; $14A1 xor a
        sta $9D4F                     ; $14A2 ld [a16],a
        lda $9D20                     ; $14A5 ld a,[a16]
        cmpa #$07                     ; $14A8 cp d8
        lbne G_153A                   ; $14AA jp nz,a16
        lda $9D33                     ; $14AD ld a,[a16]
        bita #$02                     ; $14B0 bit 1,a
        pshs cc                       ; $14B2 ld a,[a16]
        lda $9DB2                     
        puls cc                       
        lbne G_14C5                   ; $14B5 jr nz,pc+r8
        sta $9D51                     ; $14B7 ld [a16],a
        lda $9D47                     ; $14BA ld a,[a16]
        suba #$26                     ; $14BD sub d8
        lsra                          ; $14BF srl a
        adda #$0C                     ; $14C1 add d8
        jmp G_14D8                    ; $14C3 jr pc+r8
G_14C5
        jsr G_1E87                    ; $14C5 call a16
        sta $9D51                     ; $14C8 ld [a16],a
        ldx #$9D35                    ; $14CB ld hl,d16
        stx <rH                       
        anda #$7F                     ; $14CE and d8
        andcc #$FE                    
        pshs cc                       ; $14D0 ld [hl],a
        ldx <rH                       
        sta ,x                        
        puls cc                       
        pshs cc                       ; $14D1 ld e,d8
        ldb #$98                      
        stb <rE                       
        puls cc                       
        jsr G_1CF6                    ; $14D3 call a16
        adda #$0C                     ; $14D6 add d8
G_14D8
        sta $9D52                     ; $14D8 ld [a16],a
        lda $9F9C                     ; $14DB ldh a,[a8]
        jsr G_1E60                    ; $14DD call a16
        ldx #$5484                    ; $14E0 ld de,d16
        stx <rD                       
        lda $9F91                     ; $14E3 ldh a,[a8]
        bita #$02                     ; $14E5 bit 1,a
        lbne G_14EC                   ; $14E7 jr nz,pc+r8
        ldx #$8484                    ; $14E9 ld de,d16
        stx <rD                       
G_14EC
        lda $9F9C                     ; $14EC ldh a,[a8]
        bita #$20                     ; $14EE bit 5,a
        lbeq G_14F6                   ; $14F0 jr z,pc+r8
        pshs cc                       ; $14F2 ld a,d8
        lda #$F0                      
        puls cc                       
        jmp G_14FC                    ; $14F4 jr pc+r8
G_14F6
        bita #$10                     ; $14F6 bit 4,a
        lbeq G_150B                   ; $14F8 jr z,pc+r8
        pshs cc                       ; $14FA ld a,d8
        lda #$10                      
        puls cc                       
G_14FC
        pshs a,cc                     ; $14FC push af
        lda $9D33                     ; $14FD ld a,[a16]
        bita #$01                     ; $1500 bit 0,a
        lbne G_1508                   ; $1502 jr nz,pc+r8
        puls a,cc                     ; $1504 pop af
        asra                          ; $1505 sra a
        pshs a,cc                     ; $1507 push af
G_1508
        puls a,cc                     ; $1508 pop af
        adda <rD                      ; $1509 add d
        sta <rD                       ; $150A ld d,a
G_150B
        jsr G_1D22                    ; $150B call a16
        eora #$80                     ; $150E xor d8
        sta <rB                       ; $1510 ld b,a
        lda $9D33                     ; $1511 ld a,[a16]
        bita #$02                     ; $1514 bit 1,a
        pshs cc                       ; $1516 ld c,d8
        ldb #$10                      
        stb <rC                       
        puls cc                       
        lbeq G_151C                   ; $1518 jr z,pc+r8
        ldb #$04                      ; $151A ld c,d8
        stb <rC                       
G_151C
        lda $9DDF                     ; $151C ld a,[a16]
        cmpa #$03                     ; $151F cp d8
        lbcc G_1527                   ; $1521 jr nc,pc+r8
        lsr <rC                       ; $1523 srl c
        lsr <rC                       ; $1525 srl c
G_1527
        lda $9F9C                     ; $1527 ldh a,[a8]
        jsr G_1E0D                    ; $1529 call a16
        lda <rB                       ; $152C ld a,b
        sta $9D50                     ; $152D ld [a16],a
        lda $9D38                     ; $1530 ld a,[a16]
        sta <rB                       ; $1533 ld b,a
        lda $9D33                     ; $1534 ld a,[a16]
        jmp G_165C                    ; $1537 jp a16
G_153A
        lda $9D39                     ; $153A ld a,[a16]
        tsta                          ; $153D and a
        lbeq G_154C                   ; $153E jr z,pc+r8
        lda $9D38                     ; $1540 ld a,[a16]
        adda #$05                     ; $1543 add d8
        sta $9D38                     ; $1545 ld [a16],a
        clra                          ; $1548 xor a
        sta $9D39                     ; $1549 ld [a16],a
G_154C
        lda $9D2A                     ; $154C ld a,[a16]
G_154F
        cmpa #$06                     ; $154F cp d8
        lbcs G_1557                   ; $1551 jr c,pc+r8
        suba #$06                     ; $1553 sub d8
        jmp G_154F                    ; $1555 jr pc+r8
G_1557
        ldb #$04                      ; $1557 ld b,d8
        stb <rB                       
        tsta                          ; $1559 and a
        lbeq G_155E                   ; $155A jr z,pc+r8
        ldb #$FC                      ; $155C ld b,d8
        stb <rB                       
G_155E
        ldx #$9D36                    ; $155E ld hl,d16
        stx <rH                       
        lda $9F9C                     ; $1561 ldh a,[a8]
        jsr G_1EC3                    ; $1563 call a16
        jsr G_08BC                    ; $1566 call a16
        suba #$37                     ; $1569 sub d8
        lbcc G_1579                   ; $156B jr nc,pc+r8
        eora #$FF                     ; $156D cpl
        inca                          ; $156E inc a
        asra                          ; $156F sra a
        asra                          ; $1571 sra a
        sta <rE                       ; $1573 ld e,a
        lda #$9E                      ; $1574 ld a,d8
        suba <rE                      ; $1576 sub e
        jmp G_157F                    ; $1577 jr pc+r8
G_1579
        asra                          ; $1579 sra a
        asra                          ; $157B sra a
        adda #$9E                     ; $157D add d8
G_157F
        sta <rE                       ; $157F ld e,a
        ldb #$6C                      ; $1580 ld d,d8
        stb <rD                       
        lda $9D2A                     ; $1582 ld a,[a16]
        cmpa #$0C                     ; $1585 cp d8
        lbcc G_1598                   ; $1587 jr nc,pc+r8
        lda $9D38                     ; $1589 ld a,[a16]
        suba #$05                     ; $158C sub d8
        lbcs G_1598                   ; $158E jr c,pc+r8
        ldb #$7C                      ; $1590 ld d,d8
        stb <rD                       
        bita #$01                     ; $1592 bit 0,a
        lbeq G_1598                   ; $1594 jr z,pc+r8
        ldb #$5C                      ; $1596 ld d,d8
        stb <rD                       
G_1598
        lda $9D2A                     ; $1598 ld a,[a16]
        cmpa #$0C                     ; $159B cp d8
        lbcs G_15A7                   ; $159D jr c,pc+r8
        ldb #$88                      ; $159F ld e,d8
        stb <rE                       
        ldx <rH                       ; $15A1 ld a,[hl]
        lda ,x                        
        adda #$10                     ; $15A2 add d8
        ldx <rH                       ; $15A4 ld [hl],a
        sta ,x                        
        jmp G_15B6                    ; $15A5 jr pc+r8
G_15A7
        cmpa #$06                     ; $15A7 cp d8
        lbcs G_15B6                   ; $15A9 jr c,pc+r8
        ldb #$98                      ; $15AB ld e,d8
        stb <rE                       
        ldx <rH                       ; $15AD ld a,[hl]
        lda ,x                        
        suba #$10                     ; $15AE sub d8
        ldx <rH                       ; $15B0 ld [hl],a
        sta ,x                        
        lda #$02                      ; $15B1 ld a,d8
        sta $9D5C                     ; $15B3 ld [a16],a
G_15B6
        lda $9D38                     ; $15B6 ld a,[a16]
        cmpa #$05                     ; $15B9 cp d8
        lbcc G_15C5                   ; $15BB jr nc,pc+r8
        pshs cc                       ; $15BD push hl
        ldx <rH                       
        puls cc                       
        pshs x                        
        pshs cc                       ; $15BE ld hl,d16
        ldx #$9D24                    
        stx <rH                       
        puls cc                       
        jsr G_1E6E                    ; $15C1 call a16
        puls x                        ; $15C4 pop hl
        pshs cc                       
        stx <rH                       
        puls cc                       
G_15C5
        pshs cc                       ; $15C5 ldh a,[a8]
        lda $9F9C                     
        puls cc                       
        pshs cc                       ; $15C7 ld b,a
        sta <rB                       
        puls cc                       
        pshs cc                       ; $15C8 ld a,[a16]
        lda $9D2A                     
        puls cc                       
        jsr G_1D71                    ; $15CB call a16
        pshs cc                       ; $15CE ld a,[a16]
        lda $9D2A                     
        puls cc                       
        jsr G_1DB3                    ; $15D1 call a16
        jsr G_1CF6                    ; $15D4 call a16
        lda $9D2A                     ; $15D7 ld a,[a16]
        cmpa #$0C                     ; $15DA cp d8
        lbcs G_15E8                   ; $15DC jr c,pc+r8
        lda #$90                      ; $15DE ld a,d8
        sta $9D52                     ; $15E0 ld [a16],a
        lda #$22                      ; $15E3 ld a,d8
        sta $9D5C                     ; $15E5 ld [a16],a
G_15E8
        lda $9D35                     ; $15E8 ld a,[a16]
        sta <rB                       ; $15EB ld b,a
        lda $9D33                     ; $15EC ld a,[a16]
        jsr G_1DE7                    ; $15EF call a16
        lda <rB                       ; $15F2 ld a,b
        sta $9D51                     ; $15F3 ld [a16],a
        clra                          ; $15F6 xor a
        sta $9D4F                     ; $15F7 ld [a16],a
        jsr G_1D22                    ; $15FA call a16
        ldb #$10                      ; $15FD ld c,d8
        stb <rC                       
        ldx #$9D34                    ; $15FF ld hl,d16
        stx <rH                       
        jsr G_1D57                    ; $1602 call a16
        jsr G_1CB1                    ; $1605 call a16
        lda $9D38                     ; $1608 ld a,[a16]
        cmpa #$05                     ; $160B cp d8
        lbcs G_1611                   ; $160D jr c,pc+r8
        suba #$05                     ; $160F sub d8
G_1611
        sta <rB                       ; $1611 ld b,a
        lda $9D33                     ; $1612 ld a,[a16]
        jmp G_165C                    ; $1615 jp a16
G_1618
        lda $9FAD                     ; $1618 ldh a,[a8]
        bita #$80                     ; $161A bit 7,a
        bne _s45                      ; $161C ret z
        rts                           
_s45
        bita #$10                     ; $161D bit 4,a
        beq _s46                      ; $161F ret nz
        rts                           
_s46
        jsr G_08A6                    ; $1620 call a16
        sta <rB                       ; $1623 ld b,a
        jsr G_08BC                    ; $1624 call a16
        suba <rB                      ; $1627 sub b
        lbcc G_162C                   ; $1628 jr nc,pc+r8
        eora #$FF                     ; $162A cpl
        inca                          ; $162B inc a
G_162C
        cmpa #$03                     ; $162C cp d8
        bcs _s47                      ; $162E ret nc
        rts                           
_s47
        jsr G_089B                    ; $162F call a16
        sta <rB                       ; $1632 ld b,a
        jsr G_08B1                    ; $1633 call a16
        suba <rB                      ; $1636 sub b
        lbcc G_163B                   ; $1637 jr nc,pc+r8
        eora #$FF                     ; $1639 cpl
        inca                          ; $163A inc a
G_163B
        cmpa #$04                     ; $163B cp d8
        bcs _s48                      ; $163D ret nc
        rts                           
_s48
        lda $9D47                     ; $163E ld a,[a16]
        cmpa #$34                     ; $1641 cp d8
        bcs _s49                      ; $1643 ret nc
        rts                           
_s49
        lda $9FAD                     ; $1644 ldh a,[a8]
        bita #$08                     ; $1646 bit 3,a
        lbeq G_164E                   ; $1648 jr z,pc+r8
        ora #$30                      ; $164A or d8
        jmp G_1652                    ; $164C jr pc+r8
G_164E
        ora #$38                      ; $164E or d8
        sta $9FAE                     ; $1650 ldh [a8],a
G_1652
        sta $9FAD                     ; $1652 ldh [a8],a
        lda #$0D                      ; $1654 ld a,d8
        jsr S_SOUND                   ; $1656 call a16
        jmp G_1C84                    ; $1659 jp a16
G_165C
        sta $9FC5                     ; $165C ldh [a8],a
        lda <rB                       ; $165E ld a,b
        sta $9FC6                     ; $165F ldh [a8],a
        cmpa #$05                     ; $1661 cp d8
        pshs cc                       ; $1663 ld a,d8
        lda #$06                      
        puls cc                       
        lbcs G_1669                   ; $1665 jr c,pc+r8
        pshs cc                       ; $1667 ld a,d8
        lda #$07                      
        puls cc                       
G_1669
        jsr G_1F42                    ; $1669 call a16
        lda $9FC5                     ; $166C ldh a,[a8]
        ldb #$00                      ; $166E ld c,d8
        stb <rC                       
        bita #$02                     ; $1670 bit 1,a
        lbeq G_1687                   ; $1672 jr z,pc+r8
        lda $9FAD                     ; $1674 ldh a,[a8]
        bita #$40                     ; $1676 bit 6,a
        lbeq G_1687                   ; $1678 jr z,pc+r8
        lda $9FC6                     ; $167A ldh a,[a8]
        cmpa #$02                     ; $167C cp d8
        lbcc G_1687                   ; $167E jr nc,pc+r8
        pshs cc                       ; $1680 ld a,d8
        lda #$2A                      
        puls cc                       
        jsr G_1F42                    ; $1682 call a16
        ldb #$2B                      ; $1685 ld c,d8
        stb <rC                       
G_1687
        lda <rC                       ; $1687 ld a,c
        sta $9D59                     ; $1688 ld [a16],a
        clra                          ; $168B xor a
        sta $9D4C                     ; $168C ld [a16],a
        sta $9D53                     ; $168F ld [a16],a
        ldx #$9D5A                    ; $1692 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1695 inc [hl]
        inc ,x                        
        lda $9FAD                     ; $1696 ldh a,[a8]
        bita #$08                     ; $1698 bit 3,a
        lbne G_16A8                   ; $169A jr nz,pc+r8
        lda $9D40                     ; $169C ld a,[a16]
        cmpa #$04                     ; $169F cp d8
        lbeq G_16A5                   ; $16A1 jr z,pc+r8
        lda #$03                      ; $16A3 ld a,d8
G_16A5
        sta $9D40                     ; $16A5 ld [a16],a
G_16A8
        lda $9D50                     ; $16A8 ld a,[a16]
        anda #$7F                     ; $16AB and d8
        sta $9D54                     ; $16AD ld [a16],a
        lda $9D51                     ; $16B0 ld a,[a16]
        sta $9D55                     ; $16B3 ld [a16],a
        clra                          ; $16B6 xor a
        sta $9D56                     ; $16B7 ld [a16],a
        sta $9D57                     ; $16BA ld [a16],a
        lda $9D51                     ; $16BD ld a,[a16]
        sta <rH                       ; $16C0 ld h,a
        ldb #$00                      ; $16C1 ld l,d8
        stb <rL                       
        lda $9D59                     ; $16C3 ld a,[a16]
        tsta                          ; $16C6 and a
        pshs cc                       ; $16C7 ld a,d8
        lda #$48                      
        puls cc                       
        lbeq G_16CD                   ; $16C9 jr z,pc+r8
        lda #$28                      ; $16CB ld a,d8
G_16CD
        jsr G_3143                    ; $16CD call a16
        lda <rH                       ; $16D0 ld a,h
        tsta                          ; $16D1 and a
        lbne G_16D7                   ; $16D2 jr nz,pc+r8
        ldx #$00F8                    ; $16D4 ld hl,d16
        stx <rH                       
G_16D7
        lda <rL                       ; $16D7 ld a,l
        sta $9D5D                     ; $16D8 ld [a16],a
        pshs a                        ; $16DB swap a
        lsla                          
        lsla                          
        lsla                          
        lsla                          
        ldb ,s+                       
        lsrb                          
        lsrb                          
        lsrb                          
        lsrb                          
        pshs b                        
        ora ,s+                       
        anda #$0F                     ; $16DD and d8
        sta <rL                       ; $16DF ld l,a
        lda <rH                       ; $16E0 ld a,h
        sta $9D5E                     ; $16E1 ld [a16],a
        pshs a                        ; $16E4 swap a
        lsla                          
        lsla                          
        lsla                          
        lsla                          
        ldb ,s+                       
        lsrb                          
        lsrb                          
        lsrb                          
        lsrb                          
        pshs b                        
        ora ,s+                       
        anda #$F0                     ; $16E6 and d8
        ora <rL                       ; $16E8 or l
        sta $9D58                     ; $16E9 ld [a16],a
        clra                          ; $16EC xor a
        sta $9D5F                     ; $16ED ld [a16],a
        lda $9FAD                     ; $16F0 ldh a,[a8]
        eora #$80                     ; $16F2 xor d8
        ora #$40                      ; $16F4 set 6,a
        sta $9FAD                     ; $16F6 ldh [a8],a
        rts                           ; $16F8 ret
G_16F9
        sta $9D45                     ; $16F9 ld [a16],a
        lda #$10                      ; $16FC ld a,d8
        sta $9D47                     ; $16FE ld [a16],a
        clra                          ; $1701 xor a
        sta $9D4C                     ; $1702 ld [a16],a
        sta $9D5A                     ; $1705 ld [a16],a
        sta $9D5F                     ; $1708 ld [a16],a
        ldx #$9D50                    ; $170B ld hl,d16
        stx <rH                       
        ldx <rH                       ; $170E ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $170F ld [hl+],a
        sta ,x+                       
        stx <rH                       
        lda #$44                      ; $1710 ld a,d8
        ldx <rH                       ; $1712 ld [hl],a
        sta ,x                        
        lda #$14                      ; $1713 ld a,d8
        sta $9D58                     ; $1715 ld [a16],a
        ldx #$9D5D                    ; $1718 ld hl,d16
        stx <rH                       
        lda #$40                      ; $171B ld a,d8
        ldx <rH                       ; $171D ld [hl+],a
        sta ,x+                       
        stx <rH                       
        lda #$01                      ; $171E ld a,d8
        ldx <rH                       ; $1720 ld [hl],a
        sta ,x                        
        rts                           ; $1721 ret
G_1722
        sta <rB                       ; $1722 ld b,a
        jsr G_08BC                    ; $1723 call a16
        suba <rB                      ; $1726 sub b
        lbcc G_172B                   ; $1727 jr nc,pc+r8
        eora #$FF                     ; $1729 cpl
        inca                          ; $172A inc a
G_172B
        sta <rH                       ; $172B ld h,a
        ldb #$00                      ; $172C ld l,d8
        stb <rL                       
        ldb #$00                      ; $172E ld d,d8
        stb <rD                       
        lda $9D51                     ; $1730 ld a,[a16]
        lsla                          ; $1733 sla a
        rol <rD                       ; $1735 rl d
        lsla                          ; $1737 sla a
        rol <rD                       ; $1739 rl d
        sta <rE                       ; $173B ld e,a
        jsr G_31D5                    ; $173C call a16
        ldb #$00                      ; $173F ld d,d8
        stb <rD                       
        lda $9D50                     ; $1741 ld a,[a16]
        lsla                          ; $1744 sla a
        lsla                          ; $1746 sla a
        rol <rD                       ; $1748 rl d
        sta <rE                       ; $174A ld e,a
        jsr G_3120                    ; $174B call a16
        lda $9D50                     ; $174E ld a,[a16]
        bita #$80                     ; $1751 bit 7,a
        lbne G_1760                   ; $1753 jr nz,pc+r8
        lda $9D44                     ; $1755 ld a,[a16]
        adda <rL                      ; $1758 add l
        sta <rL                       ; $1759 ld l,a
        lda $9D45                     ; $175A ld a,[a16]
        adca <rH                      ; $175D adc h
        sta <rH                       ; $175E ld h,a
        rts                           ; $175F ret
G_1760
        lda $9D44                     ; $1760 ld a,[a16]
        suba <rL                      ; $1763 sub l
        sta <rL                       ; $1764 ld l,a
        lda $9D45                     ; $1765 ld a,[a16]
        sbca <rH                      ; $1768 sbc h
        sta <rH                       ; $1769 ld h,a
        rts                           ; $176A ret
G_176B
        lda $9D52                     ; $176B ld a,[a16]
        bita #$80                     ; $176E bit 7,a
        lbeq G_1789                   ; $1770 jr z,pc+r8
        ldb #$38                      ; $1772 ld b,d8
        stb <rB                       
        lda $9F96                     ; $1774 ldh a,[a8]
        bita #$80                     ; $1776 bit 7,a
        pshs cc                       ; $1778 ld a,[a16]
        lda $9D43                     
        puls cc                       
        lbeq G_1780                   ; $177B jr z,pc+r8
        sta <rB                       ; $177D ld b,a
        lda #$B8                      ; $177E ld a,d8
G_1780
        suba <rB                      ; $1780 sub b
        lbcc G_178B                   ; $1781 jr nc,pc+r8
        lda $9D4C                     ; $1783 ld a,[a16]
        tsta                          ; $1786 and a
        lbeq G_179E                   ; $1787 jr z,pc+r8
G_1789
        tsta                          ; $1789 and a
        andcc #$FE                    
        rts                           ; $178A ret
G_178B
        sta <rH                       ; $178B ld h,a
        cmpa #$0C                     ; $178C cp d8
        lbcc G_1789                   ; $178E jr nc,pc+r8
        lda $9D4C                     ; $1790 ld a,[a16]
        tsta                          ; $1793 and a
        lbne G_1789                   ; $1794 jr nz,pc+r8
        lsl <rH                       ; $1796 sla h
        lda $9D47                     ; $1798 ld a,[a16]
        cmpa <rH                      ; $179B cp h
        lbcs G_1789                   ; $179C jr c,pc+r8
G_179E
        orcc #1                       ; $179E scf
        rts                           ; $179F ret
G_17A0
        lda $9D60                     ; $17A0 ld a,[a16]
        tsta                          ; $17A3 and a
        lbeq G_17AA                   ; $17A4 jr z,pc+r8
        deca                          ; $17A6 dec a
        sta $9D60                     ; $17A7 ld [a16],a
G_17AA
        lda $9D40                     ; $17AA ld a,[a16]
        jsr G_RST08                   ; $17AD rst vec
        fdb G_17C2,G_17DD,G_17EA,G_1800,G_184F,G_189B,G_18A1,G_18A7,G_18C4,G_18E1
G_17C2
        clra                          ; $17C2 xor a
        sta $9D50                     ; $17C3 ld [a16],a
        sta $9D51                     ; $17C6 ld [a16],a
        sta $9D52                     ; $17C9 ld [a16],a
        sta $9D46                     ; $17CC ld [a16],a
        jmp G_17CF          ; continuité du code GB
G_17CD
        pshs cc                       ; $17CD ld b,[hl]
        ldx <rH                       
        ldb ,x                        
        stb <rB                       
        puls cc                       
        beq _s50                      ; $17CE ret nz
        rts                           
_s50
G_17CF
        sta $9D41                     ; $17CF ld [a16],a
        sta $9D60                     ; $17D2 ld [a16],a
        inca                          ; $17D5 inc a
        sta $9D47                     ; $17D6 ld [a16],a
        sta $9D40                     ; $17D9 ld [a16],a
        rts                           ; $17DC ret
G_17DD
        jsr G_18F3                    ; $17DD call a16
        lda $9D47                     ; $17E0 ld a,[a16]
        tsta                          ; $17E3 and a
        andcc #$FE                    
        beq _s51                      ; $17E4 ret nz
        rts                           
_s51
        pshs cc                       ; $17E5 ld a,d8
        lda #$03                      
        puls cc                       
        jmp G_1F42                    ; $17E7 jp a16
G_17EA
        jsr G_18E4                    ; $17EA call a16
        lda $9D4C                     ; $17ED ld a,[a16]
        tsta                          ; $17F0 and a
        bne _s52                      ; $17F1 ret z
        rts                           
_s52
        jsr G_1EE1                    ; $17F2 call a16
        ldx #$9FAD                    ; $17F5 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $17F8 set 5,[hl]
        ldb ,x                        
        orb #$20                      
        stb ,x                        
        lda #$05                      ; $17FA ld a,d8
        sta $9D40                     ; $17FC ld [a16],a
        rts                           ; $17FF ret
G_1800
        ldx #$9FAD                    ; $1800 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1803 set 5,[hl]
        ldb ,x                        
        orb #$20                      
        stb ,x                        
        jsr G_18E4                    ; $1805 call a16
        lda $9D4C                     ; $1808 ld a,[a16]
        cmpa #$01                     ; $180B cp d8
        beq _s53                      ; $180D ret nz
        rts                           
_s53
        jsr G_1ECB                    ; $180E call a16
        lda $9D47                     ; $1811 ld a,[a16]
        sta <rB                       ; $1814 ld b,a
        lda $9D46                     ; $1815 ld a,[a16]
        ora <rB                       ; $1818 or b
        beq _s54                      ; $1819 ret nz
        rts                           
_s54
        ldb #$0E                      ; $181A ld b,d8
        stb <rB                       
        lda $9FAD                     ; $181C ldh a,[a8]
        bita #$80                     ; $181E bit 7,a
        lbeq G_1824                   ; $1820 jr z,pc+r8
        ldb #$0C                      ; $1822 ld b,d8
        stb <rB                       
G_1824
        lda $9F91                     ; $1824 ldh a,[a8]
        bita #$02                     ; $1826 bit 1,a
        lbeq G_182B                   ; $1828 jr z,pc+r8
        inc <rB                       ; $182A inc b
G_182B
        lda $9D4B                     ; $182B ld a,[a16]
        sta $9D4D                     ; $182E ld [a16],a
        cmpa <rB                      ; $1831 cp b
        lbne G_1844                   ; $1832 jr nz,pc+r8
        lda $9D53                     ; $1834 ld a,[a16]
        bita #$80                     ; $1837 bit 7,a
        pshs cc                       ; $1839 ld a,d8
        lda #$06                      
        puls cc                       
        lbne G_1846                   ; $183B jr nz,pc+r8
        jsr G_1EF0                    ; $183D call a16
        lda #$04                      ; $1840 ld a,d8
        jmp G_1846                    ; $1842 jr pc+r8
G_1844
        lda #$05                      ; $1844 ld a,d8
G_1846
        sta $9D40                     ; $1846 ld [a16],a
        ldx #$9FAD                    ; $1849 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $184C res 5,[hl]
        ldb ,x                        
        andb #$DF                     
        stb ,x                        
        rts                           ; $184E ret
G_184F
        jsr G_18E4                    ; $184F call a16
        lda $9D41                     ; $1852 ld a,[a16]
        tsta                          ; $1855 and a
        lbeq G_1861                   ; $1856 jr z,pc+r8
        deca                          ; $1858 dec a
        pshs cc                       ; $1859 ld [a16],a
        sta $9D41                     
        puls cc                       
        beq _s55                      ; $185C ret nz
        rts                           
_s55
        lda #$09                      ; $185D ld a,d8
        jmp G_188E                    ; $185F jr pc+r8
G_1861
        lda $9D4C                     ; $1861 ld a,[a16]
        cmpa #$01                     ; $1864 cp d8
        lbne G_1892                   ; $1866 jr nz,pc+r8
        lda $9D47                     ; $1868 ld a,[a16]
        sta <rB                       ; $186B ld b,a
        lda $9D46                     ; $186C ld a,[a16]
        ora <rB                       ; $186F or b
        beq _s56                      ; $1870 ret nz
        rts                           
_s56
        lda $9D4B                     ; $1871 ld a,[a16]
        sta $9D4D                     ; $1874 ld [a16],a
        bita #$02                     ; $1877 bit 1,a
        pshs cc                       ; $1879 ld b,d8
        ldb #$00                      
        stb <rB                       
        puls cc                       
        lbeq G_187F                   ; $187B jr z,pc+r8
        ldb #$80                      ; $187D ld b,d8
        stb <rB                       
G_187F
        lda $9FAD                     ; $187F ldh a,[a8]
        eora <rB                      ; $1881 xor b
        bita #$80                     ; $1882 bit 7,a
        lbeq G_1895                   ; $1884 jr z,pc+r8
        lda $9D4D                     ; $1886 ld a,[a16]
        bita #$08                     ; $1889 bit 3,a
        beq _s57                      ; $188B ret nz
        rts                           
_s57
        lda #$07                      ; $188C ld a,d8
G_188E
        sta $9D40                     ; $188E ld [a16],a
        rts                           ; $1891 ret
G_1892
        cmpa #$02                     ; $1892 cp d8
        bcc _s58                      ; $1894 ret c
        rts                           
_s58
G_1895
        lda #$3C                      ; $1895 ld a,d8
        sta $9D41                     ; $1897 ld [a16],a
        rts                           ; $189A ret
G_189B
        ldb #$5A                      ; $189B ld b,d8
        stb <rB                       
        lda #$C4                      ; $189D ld a,d8
        jmp G_18AB                    ; $189F jr pc+r8
G_18A1
        ldb #$5A                      ; $18A1 ld b,d8
        stb <rB                       
        lda #$C5                      ; $18A3 ld a,d8
        jmp G_18AB                    ; $18A5 jr pc+r8
G_18A7
        ldb #$96                      ; $18A7 ld b,d8
        stb <rB                       
        lda #$C6                      ; $18A9 ld a,d8
G_18AB
        ldx #$9FAD                    ; $18AB ld hl,d16
        stx <rH                       
        ldx <rH                       ; $18AE bit 3,[hl]
        ldb ,x                        
        bitb #$08                     
        lbne G_18B8                   ; $18B0 jr nz,pc+r8
        sta $9FC2                     ; $18B2 ldh [a8],a
        ldx <rH                       ; $18B4 set 3,[hl]
        ldb ,x                        
        orb #$08                      
        stb ,x                        
        ldx <rH                       ; $18B6 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $18B7 ld [hl],a
        sta ,x                        
G_18B8
        lda <rB                       ; $18B8 ld a,b
        sta $9D5B                     ; $18B9 ld [a16],a
        lda #$08                      ; $18BC ld a,d8
        sta $9D40                     ; $18BE ld [a16],a
        jmp G_18E4                    ; $18C1 jp a16
G_18C4
        jsr G_18E4                    ; $18C4 call a16
        lda $9D5B                     ; $18C7 ld a,[a16]
        deca                          ; $18CA dec a
        sta $9D5B                     ; $18CB ld [a16],a
        cmpa #$1E                     ; $18CE cp d8
        bcs _s59                      ; $18D0 ret nc
        rts                           
_s59
        ldx #$9FC2                    ; $18D1 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $18D4 res 6,[hl]
        ldb ,x                        
        andb #$BF                     
        stb ,x                        
        lda $9D5B                     ; $18D6 ld a,[a16]
        tsta                          ; $18D9 and a
        beq _s60                      ; $18DA ret nz
        rts                           
_s60
        lda #$09                      ; $18DB ld a,d8
        sta $9D40                     ; $18DD ld [a16],a
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
        ldx #$9D42                    ; $18F3 ld hl,d16
        stx <rH                       
        jsr G_09FA                    ; $18F6 call a16
        lda <rC                       ; $18F9 ld a,c
        sta $9D4B                     ; $18FA ld [a16],a
        rts                           ; $18FD ret
G_18FE
        ldx #$9D44                    ; $18FE ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1901 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $1902 ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $1903 ld l,a
        ldb #$00                      ; $1904 ld b,d8
        stb <rB                       
        lda $9D50                     ; $1906 ld a,[a16]
        bita #$80                     ; $1909 bit 7,a
        lbne G_1926                   ; $190B jr nz,pc+r8
        lsla                          ; $190D sla a
        lsla                          ; $190F sla a
        rol <rB                       ; $1911 rl b
        sta <rC                       ; $1913 ld c,a
        pshs a                        ; $1914 add hl,bc
        ldd <rH                       
        addd <rB                      
        std <rH                       
        puls a                        
        ldx #$D001                    ; $1915 ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $1918 call a16
        lbcc G_193B                   ; $191B jr nc,pc+r8
G_191D
        lda <rL                       ; $191D ld a,l
        sta $9D44                     ; $191E ld [a16],a
        lda <rH                       ; $1921 ld a,h
        sta $9D45                     ; $1922 ld [a16],a
        rts                           ; $1925 ret
G_1926
        lsla                          ; $1926 sla a
        lsla                          ; $1928 sla a
        rol <rB                       ; $192A rl b
        sta <rC                       ; $192C ld c,a
        lda <rL                       ; $192D ld a,l
        sbca <rC                      ; $192E sbc c
        sta <rL                       ; $192F ld l,a
        lda <rH                       ; $1930 ld a,h
        sbca <rB                      ; $1931 sbc b
        sta <rH                       ; $1932 ld h,a
        ldx #$07FF                    ; $1933 ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $1936 call a16
        lbcc G_191D                   ; $1939 jr nc,pc+r8
G_193B
        lda $9D50                     ; $193B ld a,[a16]
        eora #$80                     ; $193E xor d8
        sta $9D50                     ; $1940 ld [a16],a
        jmp G_1991                    ; $1943 jr pc+r8
G_1945
        ldx #$9D42                    ; $1945 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1948 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $1949 ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $194A ld l,a
        ldb #$00                      ; $194B ld b,d8
        stb <rB                       
        lda $9D4F                     ; $194D ld a,[a16]
        bita #$80                     ; $1950 bit 7,a
        pshs cc                       ; $1952 ld a,[a16]
        lda $9D51                     
        puls cc                       
        lbne G_1972                   ; $1955 jr nz,pc+r8
        lsla                          ; $1957 sla a
        rol <rB                       ; $1959 rl b
        lsla                          ; $195B sla a
        rol <rB                       ; $195D rl b
        sta <rC                       ; $195F ld c,a
        pshs a                        ; $1960 add hl,bc
        ldd <rH                       
        addd <rB                      
        std <rH                       
        puls a                        
        ldx #$E701                    ; $1961 ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $1964 call a16
        lbcc G_1989                   ; $1967 jr nc,pc+r8
G_1969
        lda <rL                       ; $1969 ld a,l
        sta $9D42                     ; $196A ld [a16],a
        lda <rH                       ; $196D ld a,h
        sta $9D43                     ; $196E ld [a16],a
        rts                           ; $1971 ret
G_1972
        lsla                          ; $1972 sla a
        rol <rB                       ; $1974 rl b
        lsla                          ; $1976 sla a
        rol <rB                       ; $1978 rl b
        sta <rC                       ; $197A ld c,a
        lda <rL                       ; $197B ld a,l
        sbca <rC                      ; $197C sbc c
        sta <rL                       ; $197D ld l,a
        lda <rH                       ; $197E ld a,h
        sbca <rB                      ; $197F sbc b
        sta <rH                       ; $1980 ld h,a
        ldx #$08FF                    ; $1981 ld de,d16
        stx <rD                       
        jsr G_00C3                    ; $1984 call a16
        lbcc G_1969                   ; $1987 jr nc,pc+r8
G_1989
        lda $9D4F                     ; $1989 ld a,[a16]
        eora #$80                     ; $198C xor d8
        sta $9D4F                     ; $198E ld [a16],a
G_1991
        lda $9D50                     ; $1991 ld a,[a16]
        asra                          ; $1994 sra a
        anda #$BF                     ; $1996 and d8
        sta $9D50                     ; $1998 ld [a16],a
        lda $9D51                     ; $199B ld a,[a16]
        lsra                          ; $199E srl a
        sta $9D51                     ; $19A0 ld [a16],a
        clra                          ; $19A3 xor a
        pshs cc                       ; $19A4 ld [a16],a
        sta $9D53                     
        puls cc                       
        pshs cc                       ; $19A7 ld a,d8
        lda #$04                      
        puls cc                       
        jmp G_1F42                    ; $19A9 jp a16
G_19AC
        ldx #$9D5D                    ; $19AC ld hl,d16
        stx <rH                       
        lda $9D52                     ; $19AF ld a,[a16]
        bita #$80                     ; $19B2 bit 7,a
        lbne G_1A18                   ; $19B4 jr nz,pc+r8
        lda $9D5F                     ; $19B6 ld a,[a16]
        ldx <rH                       ; $19B9 sub [hl]
        suba ,x                       
        sta $9D5F                     ; $19BA ld [a16],a
        sta <rC                       ; $19BD ld c,a
        ldx <rH                       ; $19BE inc hl
        leax 1,x                      
        stx <rH                       
        lda $9D52                     ; $19BF ld a,[a16]
        ldx <rH                       ; $19C2 sbc [hl]
        sbca ,x                       
        lbcc G_19D2                   ; $19C3 jr nc,pc+r8
        lda #$80                      ; $19C5 ld a,d8
        sta $9D52                     ; $19C7 ld [a16],a
        lda $9D59                     ; $19CA ld a,[a16]
        tsta                          ; $19CD and a
        andcc #$FE                    
        bne _s61                      ; $19CE ret z
        rts                           
_s61
        jmp G_1F42                    ; $19CF jp a16
G_19D2
        sta $9D52                     ; $19D2 ld [a16],a
        ldb #$00                      ; $19D5 ld b,d8
        stb <rB                       
        ldx #G_19E9                   ; $19D7 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $19DA push hl
        pshs x                        
        lda $9D5C                     ; $19DB ld a,[a16]
        pshs a                        ; $19DE swap a
        lsla                          
        lsla                          
        lsla                          
        lsla                          
        ldb ,s+                       
        lsrb                          
        lsrb                          
        lsrb                          
        lsrb                          
        pshs b                        
        ora ,s+                       
        anda #$0F                     ; $19E0 and d8
        jsr G_RST08                   ; $19E2 rst vec
        fdb G_1AE5,G_1B01,G_1B0F
G_19E9
        sta <rL                       ; $19E9 ld l,a
        ldb <rB                       ; $19EA ld h,b
        stb <rH                       
        lda $9D58                     ; $19EB ld a,[a16]
        jsr G_30D0                    ; $19EE call a16
        lsr <rC                       ; $19F1 srl c
        ror <rH                       ; $19F3 rr h
        ror <rL                       ; $19F5 rr l
        lsr <rC                       ; $19F7 srl c
        ror <rH                       ; $19F9 rr h
        ror <rL                       ; $19FB rr l
        lsr <rC                       ; $19FD srl c
        ror <rH                       ; $19FF rr h
        ror <rL                       ; $1A01 rr l
        lsr <rC                       ; $1A03 srl c
        ror <rH                       ; $1A05 rr h
        ror <rL                       ; $1A07 rr l
        lda $9D46                     ; $1A09 ld a,[a16]
        adda <rL                      ; $1A0C add l
        sta $9D46                     ; $1A0D ld [a16],a
        lda $9D47                     ; $1A10 ld a,[a16]
        adca <rH                      ; $1A13 adc h
        pshs cc                       ; $1A14 ld [a16],a
        sta $9D47                     
        puls cc                       
        rts                           ; $1A17 ret
G_1A18
        lda $9D5F                     ; $1A18 ld a,[a16]
        ldx <rH                       ; $1A1B add [hl]
        adda ,x                       
        sta $9D5F                     ; $1A1C ld [a16],a
        sta <rC                       ; $1A1F ld c,a
        ldx <rH                       ; $1A20 inc hl
        leax 1,x                      
        stx <rH                       
        lda $9D52                     ; $1A21 ld a,[a16]
        ldx <rH                       ; $1A24 adc [hl]
        adca ,x                       
        sta $9D52                     ; $1A25 ld [a16],a
        ldb #$00                      ; $1A28 ld b,d8
        stb <rB                       
        ldx #G_1A3A                   ; $1A2A ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1A2D push hl
        pshs x                        
        lda $9D5C                     ; $1A2E ld a,[a16]
        anda #$0F                     ; $1A31 and d8
        jsr G_RST08                   ; $1A33 rst vec
        fdb G_1AE5,G_1ACD,G_1AC3
G_1A3A
        sta <rL                       ; $1A3A ld l,a
        ldb <rB                       ; $1A3B ld h,b
        stb <rH                       
        lda $9D58                     ; $1A3C ld a,[a16]
        jsr G_30D0                    ; $1A3F call a16
        lsr <rC                       ; $1A42 srl c
        ror <rH                       ; $1A44 rr h
        ror <rL                       ; $1A46 rr l
        lsr <rC                       ; $1A48 srl c
        ror <rH                       ; $1A4A rr h
        ror <rL                       ; $1A4C rr l
        lsr <rC                       ; $1A4E srl c
        ror <rH                       ; $1A50 rr h
        ror <rL                       ; $1A52 rr l
        lsr <rC                       ; $1A54 srl c
        ror <rH                       ; $1A56 rr h
        ror <rL                       ; $1A58 rr l
        lda $9D46                     ; $1A5A ld a,[a16]
        suba <rL                      ; $1A5D sub l
        sta $9D46                     ; $1A5E ld [a16],a
        sta <rC                       ; $1A61 ld c,a
        lda $9D47                     ; $1A62 ld a,[a16]
        sbca <rH                      ; $1A65 sbc h
        sta $9D47                     ; $1A66 ld [a16],a
        lbcs G_1A6D                   ; $1A69 jr c,pc+r8
        ora <rC                       ; $1A6B or c
        andcc #$FE                    
        beq _s62                      ; $1A6C ret nz
        rts                           
_s62
G_1A6D
        clra                          ; $1A6D xor a
        sta $9D46                     ; $1A6E ld [a16],a
        sta $9D47                     ; $1A71 ld [a16],a
        ldx #$9D4C                    ; $1A74 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1A77 inc [hl]
        inc ,x                        
        ldx <rH                       ; $1A78 ld a,[hl]
        lda ,x                        
        cmpa #$02                     ; $1A79 cp d8
        lbcs G_1A83                   ; $1A7B jr c,pc+r8
        lda $9FAD                     ; $1A7D ldh a,[a8]
        ora #$20                      ; $1A7F set 5,a
        sta $9FAD                     ; $1A81 ldh [a8],a
G_1A83
        clra                          ; $1A83 xor a
        sta $9D59                     ; $1A84 ld [a16],a
        lda $9D4C                     ; $1A87 ld a,[a16]
        cmpa #$04                     ; $1A8A cp d8
        lbcc G_1AA6                   ; $1A8C jr nc,pc+r8
        lda #$1C                      ; $1A8E ld a,d8
        sta $9D60                     ; $1A90 ld [a16],a
        ldx #$9D42                    ; $1A93 ld hl,d16
        stx <rH                       
        ldx #$9D62                    ; $1A96 ld de,d16
        stx <rD                       
        ldb #$04                      ; $1A99 ld b,d8
        stb <rB                       
G_1A9B
        ldx <rH                       ; $1A9B ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rD                       ; $1A9C ld [de],a
        sta ,x                        
        inc <rE                       ; $1A9D inc e
        dec <rB                       ; $1A9E dec b
        lbne G_1A9B                   ; $1A9F jr nz,pc+r8
        pshs cc                       ; $1AA1 ld a,d8
        lda #$03                      
        puls cc                       
        jsr G_1F42                    ; $1AA3 call a16
G_1AA6
        lda $9D52                     ; $1AA6 ld a,[a16]
        anda #$7F                     ; $1AA9 and d8
        sta <rB                       ; $1AAB ld b,a
        lsra                          ; $1AAC srl a
        lsra                          ; $1AAE srl a
        sta <rC                       ; $1AB0 ld c,a
        lda <rB                       ; $1AB1 ld a,b
        suba <rC                      ; $1AB2 sub c
        lbcc G_1AB6                   ; $1AB3 jr nc,pc+r8
        clra                          ; $1AB5 xor a
G_1AB6
        sta <rB                       ; $1AB6 ld b,a
        lda $9D52                     ; $1AB7 ld a,[a16]
        anda #$80                     ; $1ABA and d8
        eora #$80                     ; $1ABC xor d8
        ora <rB                       ; $1ABE or b
        andcc #$FE                    
        pshs cc                       ; $1ABF ld [a16],a
        sta $9D52                     
        puls cc                       
        rts                           ; $1AC2 ret
G_1AC3
        jsr G_1AEF                    ; $1AC3 call a16
        lsl <rC                       ; $1AC6 sla c
        rola                          ; $1AC8 rl a
        rol <rB                       ; $1ACA rl b
        rts                           ; $1ACC ret
G_1ACD
        lda $9D52                     ; $1ACD ld a,[a16]
        lsl <rC                       ; $1AD0 sla c
        rola                          ; $1AD2 rl a
        sta <rE                       ; $1AD4 ld e,a
        lsl <rC                       ; $1AD5 sla c
        rola                          ; $1AD7 rl a
        rol <rB                       ; $1AD9 rl b
        lsl <rC                       ; $1ADB sla c
        rola                          ; $1ADD rl a
        rol <rB                       ; $1ADF rl b
        adda <rE                      ; $1AE1 add e
        bcs _s63                      ; $1AE2 ret nc
        rts                           
_s63
        inc <rB                       ; $1AE3 inc b
        rts                           ; $1AE4 ret
G_1AE5
        jsr G_1B01                    ; $1AE5 call a16
        lsl <rC                       ; $1AE8 sla c
        rola                          ; $1AEA rl a
        rol <rB                       ; $1AEC rl b
        rts                           ; $1AEE ret
G_1AEF
        lda $9D52                     ; $1AEF ld a,[a16]
        lsl <rC                       ; $1AF2 sla c
        rola                          ; $1AF4 rl a
        sta <rE                       ; $1AF6 ld e,a
        lsl <rC                       ; $1AF7 sla c
        rola                          ; $1AF9 rl a
        rol <rB                       ; $1AFB rl b
        adda <rE                      ; $1AFD add e
        bcs _s64                      ; $1AFE ret nc
        rts                           
_s64
        inc <rB                       ; $1AFF inc b
        rts                           ; $1B00 ret
G_1B01
        lda $9D52                     ; $1B01 ld a,[a16]
        lsl <rC                       ; $1B04 sla c
        rola                          ; $1B06 rl a
        lsl <rC                       ; $1B08 sla c
        rola                          ; $1B0A rl a
        rol <rB                       ; $1B0C rl b
        rts                           ; $1B0E ret
G_1B0F
        lda $9D52                     ; $1B0F ld a,[a16]
        lsl <rC                       ; $1B12 sla c
        rola                          ; $1B14 rl a
        rts                           ; $1B16 ret
G_1B17
        lda $9D50                     ; $1B17 ld a,[a16]
        anda #$7F                     ; $1B1A and d8
        sta <rB                       ; $1B1C ld b,a
        lda $9D54                     ; $1B1D ld a,[a16]
        sta <rC                       ; $1B20 ld c,a
        lda $9D56                     ; $1B21 ld a,[a16]
        suba <rC                      ; $1B24 sub c
        sta <rC                       ; $1B25 ld c,a
        lda <rB                       ; $1B26 ld a,b
        sbca #$00                     ; $1B27 sbc d8
        lbcs G_1B39                   ; $1B29 jr c,pc+r8
        sta <rB                       ; $1B2B ld b,a
        lda <rC                       ; $1B2C ld a,c
        sta $9D56                     ; $1B2D ld [a16],a
        lda $9D50                     ; $1B30 ld a,[a16]
        anda #$80                     ; $1B33 and d8
        ora <rB                       ; $1B35 or b
        sta $9D50                     ; $1B36 ld [a16],a
G_1B39
        lda $9D55                     ; $1B39 ld a,[a16]
        sta <rC                       ; $1B3C ld c,a
        lda $9D57                     ; $1B3D ld a,[a16]
        suba <rC                      ; $1B40 sub c
        sta <rC                       ; $1B41 ld c,a
        lda $9D51                     ; $1B42 ld a,[a16]
        sbca #$00                     ; $1B45 sbc d8
        bcc _s65                      ; $1B47 ret c
        rts                           
_s65
        sta $9D51                     ; $1B48 ld [a16],a
        lda <rC                       ; $1B4B ld a,c
        sta $9D57                     ; $1B4C ld [a16],a
        rts                           ; $1B4F ret
G_1BEF
        ldx <rH                       ; $1BEF ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $1BF0 ld d,[hl]
        ldb ,x                        
        stb <rD                       
        sta <rE                       ; $1BF1 ld e,a
        ldx #$9D44                    ; $1BF2 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1BF5 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $1BF6 ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $1BF7 ld l,a
        jsr G_00C3                    ; $1BF8 call a16
        lbcc G_1BFE                   ; $1BFB jr nc,pc+r8
        ldx <rD                       ; $1BFD dec de
        leax -1,x                     
        stx <rD                       
G_1BFE
        lda #$80                      ; $1BFE ld a,d8
        adda <rE                      ; $1C00 add e
        lda <rD                       ; $1C01 ld a,d
        adca #$00                     ; $1C02 adc d8
        rts                           ; $1C04 ret
G_1C05
        ldx <rH                       ; $1C05 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $1C06 ld d,[hl]
        ldb ,x                        
        stb <rD                       
        sta <rE                       ; $1C07 ld e,a
        ldx #$9D42                    ; $1C08 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1C0B ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $1C0C ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $1C0D ld l,a
        jsr G_00C3                    ; $1C0E call a16
        lbcc G_1C14                   ; $1C11 jr nc,pc+r8
        ldx <rD                       ; $1C13 dec de
        leax -1,x                     
        stx <rD                       
G_1C14
        lda #$80                      ; $1C14 ld a,d8
        adda <rE                      ; $1C16 add e
        lda <rD                       ; $1C17 ld a,d
        adca #$00                     ; $1C18 adc d8
        sta $9FC5                     ; $1C1A ldh [a8],a
        adda #$10                     ; $1C1C add d8
        cmpa <rB                      ; $1C1E cp b
        rts                           ; $1C1F ret
G_1C20
        sta <rB                       ; $1C20 ld b,a
        lda $9D47                     ; $1C21 ld a,[a16]
        suba <rB                      ; $1C24 sub b
        cmpa <rH                      ; $1C25 cp h
        rts                           ; $1C26 ret
G_1C27
        lda $9D53                     ; $1C27 ld a,[a16]
        tsta                          ; $1C2A and a
        beq _s66                      ; $1C2B ret nz
        rts                           
_s66
        jsr G_08BC                    ; $1C2C call a16
        cmpa #$76                     ; $1C2F cp d8
        bcc _s67                      ; $1C31 ret c
        rts                           
_s67
        cmpa #$7B                     ; $1C32 cp d8
        bcs _s68                      ; $1C34 ret nc
        rts                           
_s68
        sta $9D53                     ; $1C35 ld [a16],a
        jsr G_08B1                    ; $1C38 call a16
        cmpa #$2E                     ; $1C3B cp d8
        bcc _s69                      ; $1C3D ret c
        rts                           
_s69
        cmpa #$AB                     ; $1C3E cp d8
        bcs _s70                      ; $1C40 ret nc
        rts                           
_s70
        lda $9D47                     ; $1C41 ld a,[a16]
        cmpa #$1E                     ; $1C44 cp d8
        bcs _s71                      ; $1C46 ret nc
        rts                           
_s71
        lda #$0C                      ; $1C47 ld a,d8
        jsr S_SOUND                   ; $1C49 call a16
        lda $9D47                     ; $1C4C ld a,[a16]
        cmpa #$1C                     ; $1C4F cp d8
        lbcs G_1C7F                   ; $1C51 jr c,pc+r8
        lda $9D51                     ; $1C53 ld a,[a16]
        lsra                          ; $1C56 srl a
        sta $9D51                     ; $1C58 ld [a16],a
        lda $9D50                     ; $1C5B ld a,[a16]
        asra                          ; $1C5E sra a
        anda #$BF                     ; $1C60 and d8
        sta $9D50                     ; $1C62 ld [a16],a
        lda $9D52                     ; $1C65 ld a,[a16]
        bita #$80                     ; $1C68 bit 7,a
        lbne G_1C72                   ; $1C6A jr nz,pc+r8
        sta <rB                       ; $1C6C ld b,a
        lsra                          ; $1C6D srl a
        adda <rB                      ; $1C6F add b
        jmp G_1C76                    ; $1C70 jr pc+r8
G_1C72
        anda #$7F                     ; $1C72 and d8
        lsra                          ; $1C74 srl a
G_1C76
        sta $9D52                     ; $1C76 ld [a16],a
        lda #$FF                      ; $1C79 ld a,d8
        sta $9D53                     ; $1C7B ld [a16],a
        rts                           ; $1C7E ret
G_1C7F
        lda #$FE                      ; $1C7F ld a,d8
        sta $9D53                     ; $1C81 ld [a16],a
G_1C84
        lda $9D50                     ; $1C84 ld a,[a16]
        asra                          ; $1C87 sra a
        asra                          ; $1C89 sra a
        anda #$9F                     ; $1C8B and d8
        sta $9D50                     ; $1C8D ld [a16],a
        lda $9D51                     ; $1C90 ld a,[a16]
        lsra                          ; $1C93 srl a
        lsra                          ; $1C95 srl a
        anda #$3F                     ; $1C97 and d8
        sta $9D51                     ; $1C99 ld [a16],a
        lda $9D4F                     ; $1C9C ld a,[a16]
        eora #$80                     ; $1C9F xor d8
        sta $9D4F                     ; $1CA1 ld [a16],a
        lda $9D52                     ; $1CA4 ld a,[a16]
        asra                          ; $1CA7 sra a
        asra                          ; $1CA9 sra a
        anda #$9F                     ; $1CAB and d8
        sta $9D52                     ; $1CAD ld [a16],a
        rts                           ; $1CB0 ret
G_1CB1
        lda <rB                       ; $1CB1 ld a,b
        sta $9FC5                     ; $1CB2 ldh [a8],a
        lda $9FC6                     ; $1CB4 ldh a,[a8]
        eora #$80                     ; $1CB6 xor d8
        bita #$80                     ; $1CB8 bit 7,a
        lbeq G_1CD7                   ; $1CBA jr z,pc+r8
        ldb <rB                       ; $1CBC bit 7,b
        bitb #$80                     
        lbne G_1CDB                   ; $1CBE jr nz,pc+r8
G_1CC0
        anda #$7F                     ; $1CC0 res 7,a
        ldb <rB                       ; $1CC2 res 7,b
        andb #$7F                     
        stb <rB                       
        suba <rB                      ; $1CC4 sub b
        lbcc G_1CCE                   ; $1CC5 jr nc,pc+r8
        eora #$FF                     ; $1CC7 cpl
        inca                          ; $1CC8 inc a
        sta <rB                       ; $1CC9 ld b,a
        lda $9FC5                     ; $1CCA ldh a,[a8]
        jmp G_1CD3                    ; $1CCC jr pc+r8
G_1CCE
        sta <rB                       ; $1CCE ld b,a
        lda $9FC6                     ; $1CCF ldh a,[a8]
        eora #$80                     ; $1CD1 xor d8
G_1CD3
        anda #$80                     ; $1CD3 and d8
        jmp G_1CDD                    ; $1CD5 jr pc+r8
G_1CD7
        ldb <rB                       ; $1CD7 bit 7,b
        bitb #$80                     
        lbne G_1CC0                   ; $1CD9 jr nz,pc+r8
G_1CDB
        ldb <rB                       ; $1CDB res 7,b
        andb #$7F                     
        stb <rB                       
G_1CDD
        adda <rB                      ; $1CDD add b
        sta $9D50                     ; $1CDE ld [a16],a
        anda #$7F                     ; $1CE1 res 7,a
        sta <rB                       ; $1CE3 ld b,a
        lda $9D51                     ; $1CE4 ld a,[a16]
        lsla                          ; $1CE7 add a
        bcc _s72                      ; $1CE8 ret c
        rts                           
_s72
        cmpa <rB                      ; $1CE9 cp b
        bcs _s73                      ; $1CEA ret nc
        rts                           
_s73
        sta <rB                       ; $1CEB ld b,a
        lda $9D50                     ; $1CEC ld a,[a16]
        anda #$80                     ; $1CEF and d8
        ora <rB                       ; $1CF1 or b
        sta $9D50                     ; $1CF2 ld [a16],a
        rts                           ; $1CF5 ret
G_1CF6
        jsr G_08BC                    ; $1CF6 call a16
        pshs a,cc                     ; $1CF9 push af
        suba <rE                      ; $1CFA sub e
        lbcc G_1CFF                   ; $1CFB jr nc,pc+r8
        eora #$FF                     ; $1CFD cpl
        inca                          ; $1CFE inc a
G_1CFF
        sta <rB                       ; $1CFF ld b,a
        puls a,cc                     ; $1D00 pop af
        adda #$08                     ; $1D01 add d8
        bita #$80                     ; $1D03 bit 7,a
        lbeq G_1D09                   ; $1D05 jr z,pc+r8
        eora #$FF                     ; $1D07 cpl
        inca                          ; $1D08 inc a
G_1D09
        suba #$30                     ; $1D09 sub d8
        lbcs G_1D13                   ; $1D0B jr c,pc+r8
        lsra                          ; $1D0D srl a
        lsra                          ; $1D0F srl a
        adda <rB                      ; $1D11 add b
        sta <rB                       ; $1D12 ld b,a
G_1D13
        lda <rB                       ; $1D13 ld a,b
        ldx #$9D47                    ; $1D14 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $1D17 sub [hl]
        suba ,x                       
        lbcc G_1D1C                   ; $1D18 jr nc,pc+r8
        eora #$FF                     ; $1D1A cpl
        inca                          ; $1D1B inc a
G_1D1C
        lsra                          ; $1D1C srl a
        sta $9D52                     ; $1D1E ld [a16],a
        rts                           ; $1D21 ret
G_1D22
        ldx <rD                       ; $1D22 push de
        pshs x                        
        ldx <rD                       ; $1D23 push de
        pshs x                        
        jsr G_08B1                    ; $1D24 call a16
        suba <rD                      ; $1D27 sub d
        lbcc G_1D2C                   ; $1D28 jr nc,pc+r8
        eora #$FF                     ; $1D2A cpl
        inca                          ; $1D2B inc a
G_1D2C
        sta <rE                       ; $1D2C ld e,a
        lda $9D51                     ; $1D2D ld a,[a16]
        jsr G_308F                    ; $1D30 call a16
        puls x                        ; $1D33 pop de
        stx <rD                       
        jsr G_08BC                    ; $1D34 call a16
        suba <rE                      ; $1D37 sub e
        lbcc G_1D3C                   ; $1D38 jr nc,pc+r8
        eora #$FF                     ; $1D3A cpl
        inca                          ; $1D3B inc a
G_1D3C
        jsr G_3143                    ; $1D3C call a16
        lda <rH                       ; $1D3F ld a,h
        tsta                          ; $1D40 and a
        lbne G_1D48                   ; $1D41 jr nz,pc+r8
        lda <rL                       ; $1D43 ld a,l
        cmpa #$68                     ; $1D44 cp d8
        lbcs G_1D4A                   ; $1D46 jr c,pc+r8
G_1D48
        ldb #$68                      ; $1D48 ld l,d8
        stb <rL                       
G_1D4A
        puls x                        ; $1D4A pop de
        stx <rD                       
        jsr G_08B1                    ; $1D4B call a16
        suba <rD                      ; $1D4E sub d
        lbcc G_1D53                   ; $1D4F jr nc,pc+r8
        ldb <rL                       ; $1D51 set 7,l
        orb #$80                      
        stb <rL                       
G_1D53
        lda <rL                       ; $1D53 ld a,l
        sta $9FC6                     ; $1D54 ldh [a8],a
        rts                           ; $1D56 ret
G_1D57
        ldb #$00                      ; $1D57 ld b,d8
        stb <rB                       
        ldx <rH                       ; $1D59 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        anda #$0F                     ; $1D5A and d8
        cmpa #$02                     ; $1D5C cp d8
        bcc _s74                      ; $1D5E ret c
        rts                           
_s74
        ldb #$02                      ; $1D5F ld b,d8
        stb <rB                       
        cmpa #$05                     ; $1D61 cp d8
        lbcs G_1D67                   ; $1D63 jr c,pc+r8
        ldb #$06                      ; $1D65 ld b,d8
        stb <rB                       
G_1D67
        ldx <rH                       ; $1D67 ld a,[hl]
        lda ,x                        
        suba #$04                     ; $1D68 sub d8
        ldx <rH                       ; $1D6A ld [hl-],a
        sta ,x                        
        leax -1,x                     
        stx <rH                       
        ldx <rH                       ; $1D6B bit 7,[hl]
        ldb ,x                        
        bitb #$80                     
        bne _s75                      ; $1D6D ret z
        rts                           
_s75
        ldb <rB                       ; $1D6E set 7,b
        orb #$80                      
        stb <rB                       
        rts                           ; $1D70 ret
G_1D71
        ldb #$28                      ; $1D71 ld c,d8
        stb <rC                       
        cmpa #$06                     ; $1D73 cp d8
        lbcs G_1D7D                   ; $1D75 jr c,pc+r8
        cmpa #$0C                     ; $1D77 cp d8
        lbcc G_1D7D                   ; $1D79 jr nc,pc+r8
        ldb #$20                      ; $1D7B ld c,d8
        stb <rC                       
G_1D7D
        lda <rC                       ; $1D7D ld a,c
        ldb <rB                       ; $1D7E bit 5,b
        bitb #$20                     
        lbeq G_1D86                   ; $1D80 jr z,pc+r8
        eora #$FF                     ; $1D82 cpl
        inca                          ; $1D83 inc a
        jmp G_1D89                    ; $1D84 jr pc+r8
G_1D86
        ldb <rB                       ; $1D86 bit 4,b
        bitb #$10                     
        bne _s76                      ; $1D88 ret z
        rts                           
_s76
G_1D89
        adda <rD                      ; $1D89 add d
        sta <rD                       ; $1D8A ld d,a
        ldx <rH                       ; $1D8B ld a,[hl]
        lda ,x                        
        suba #$04                     ; $1D8C sub d8
        pshs cc                       ; $1D8E ld [hl],a
        ldx <rH                       
        sta ,x                        
        puls cc                       
        rts                           ; $1D8F ret
G_1D90
        jsr G_1DBE                    ; $1D90 call a16
        ldb <rB                       ; $1D93 bit 6,b
        bitb #$40                     
        lbeq G_1DA6                   ; $1D95 jr z,pc+r8
G_1D97
        adda <rC                      ; $1D97 add c
        adda <rE                      ; $1D98 add e
        sta <rE                       ; $1D99 ld e,a
        lda $9D5C                     ; $1D9A ld a,[a16]
        cmpa #$02                     ; $1D9D cp d8
        bne _s77                      ; $1D9F ret z
        rts                           
_s77
        pshs cc                       ; $1DA0 ld a,d8
        lda #$00                      
        puls cc                       
        pshs cc                       ; $1DA2 ld [a16],a
        sta $9D5C                     
        puls cc                       
        rts                           ; $1DA5 ret
G_1DA6
        ldb <rB                       ; $1DA6 bit 7,b
        bitb #$80                     
G_1DA8
        bne _s78                      ; $1DA8 ret z
        rts                           
_s78
        eora #$FF                     ; $1DA9 cpl
        inca                          ; $1DAA inc a
        adda <rE                      ; $1DAB add e
        pshs cc                       ; $1DAC ld e,a
        sta <rE                       
        puls cc                       
        pshs cc                       ; $1DAD ld a,d8
        lda #$01                      
        puls cc                       
        pshs cc                       ; $1DAF ld [a16],a
        sta $9D5C                     
        puls cc                       
        rts                           ; $1DB2 ret
G_1DB3
        jsr G_1DBE                    ; $1DB3 call a16
        ldb <rB                       ; $1DB6 bit 7,b
        bitb #$80                     
        lbne G_1D97                   ; $1DB8 jr nz,pc+r8
        ldb <rB                       ; $1DBA bit 6,b
        bitb #$40                     
        jmp G_1DA8                    ; $1DBC jr pc+r8
G_1DBE
        ldb #$0A                      ; $1DBE ld c,d8
        stb <rC                       
        cmpa #$06                     ; $1DC0 cp d8
        lbcs G_1DCC                   ; $1DC2 jr c,pc+r8
        cmpa #$0C                     ; $1DC4 cp d8
        lbcc G_1DCC                   ; $1DC6 jr nc,pc+r8
        lsr <rC                       ; $1DC8 srl c
        lsr <rC                       ; $1DCA srl c
G_1DCC
        lda $9F96                     ; $1DCC ldh a,[a8]
        bita #$80                     ; $1DCE bit 7,a
        pshs cc                       ; $1DD0 ld a,c
        lda <rC                       
        puls cc                       
        pshs cc                       ; $1DD1 ld c,d8
        ldb #$08                      
        stb <rC                       
        puls cc                       
        beq _s79                      ; $1DD3 ret nz
        rts                           
_s79
        eora #$FF                     ; $1DD4 cpl
        inca                          ; $1DD5 inc a
        ldb #$F8                      ; $1DD6 ld c,d8
        stb <rC                       
        rts                           ; $1DD8 ret
G_1DD9
        bita #$02                     ; $1DD9 bit 1,a
        bne _s80                      ; $1DDB ret z
        rts                           
_s80
        jsr G_1DF5                    ; $1DDC call a16
        lda $9F9A                     ; $1DDF ldh a,[a8]
        bita #$40                     ; $1DE1 bit 6,a
        bne _s81                      ; $1DE3 ret z
        rts                           
_s81
        ldb #$4C                      ; $1DE4 ld b,d8
        stb <rB                       
        rts                           ; $1DE6 ret
G_1DE7
        bita #$02                     ; $1DE7 bit 1,a
        bne _s82                      ; $1DE9 ret z
        rts                           
_s82
        jsr G_1DF5                    ; $1DEA call a16
        lda $9F9C                     ; $1DED ldh a,[a8]
        bita #$80                     ; $1DEF bit 7,a
        bne _s83                      ; $1DF1 ret z
        rts                           
_s83
        ldb #$4C                      ; $1DF2 ld b,d8
        stb <rB                       
        rts                           ; $1DF4 ret
G_1DF5
        lda $9D52                     ; $1DF5 ld a,[a16]
        bita #$80                     ; $1DF8 bit 7,a
        lbeq G_1E00                   ; $1DFA jr z,pc+r8
        lda #$01                      ; $1DFC ld a,d8
        jmp G_1E07                    ; $1DFE jr pc+r8
G_1E00
        lsla                          ; $1E00 add a
        bita #$80                     ; $1E01 bit 7,a
        lbeq G_1E07                   ; $1E03 jr z,pc+r8
        lda #$7F                      ; $1E05 ld a,d8
G_1E07
        sta $9D52                     ; $1E07 ld [a16],a
        ldb #$40                      ; $1E0A ld b,d8
        stb <rB                       
        rts                           ; $1E0C ret
G_1E0D
        bita #$20                     ; $1E0D bit 5,a
        lbeq G_1E24                   ; $1E0F jr z,pc+r8
        lda <rC                       ; $1E11 ld a,c
        ldb <rB                       ; $1E12 bit 7,b
        bitb #$80                     
        lbne G_1E21                   ; $1E14 jr nz,pc+r8
        suba <rB                      ; $1E16 sub b
        lbcc G_1E1D                   ; $1E17 jr nc,pc+r8
        eora #$FF                     ; $1E19 cpl
        inca                          ; $1E1A inc a
        sta <rB                       ; $1E1B ld b,a
        rts                           ; $1E1C ret
G_1E1D
        ora #$80                      ; $1E1D or d8
        sta <rB                       ; $1E1F ld b,a
        rts                           ; $1E20 ret
G_1E21
        adda <rB                      ; $1E21 add b
        sta <rB                       ; $1E22 ld b,a
        rts                           ; $1E23 ret
G_1E24
        bita #$10                     ; $1E24 bit 4,a
        bne _s84                      ; $1E26 ret z
        rts                           
_s84
        lda <rC                       ; $1E27 ld a,c
        ldb <rB                       ; $1E28 bit 7,b
        bitb #$80                     
        lbeq G_1E39                   ; $1E2A jr z,pc+r8
        ldb <rB                       ; $1E2C res 7,b
        andb #$7F                     
        stb <rB                       
        suba <rB                      ; $1E2E sub b
        lbcc G_1E37                   ; $1E2F jr nc,pc+r8
        eora #$FF                     ; $1E31 cpl
        inca                          ; $1E32 inc a
        ora #$80                      ; $1E33 or d8
        sta <rB                       ; $1E35 ld b,a
        rts                           ; $1E36 ret
G_1E37
        sta <rB                       ; $1E37 ld b,a
        rts                           ; $1E38 ret
G_1E39
        adda <rB                      ; $1E39 add b
        sta <rB                       ; $1E3A ld b,a
        rts                           ; $1E3B ret
G_1E3C
        bita #$40                     ; $1E3C bit 6,a
        lbeq G_1E4E                   ; $1E3E jr z,pc+r8
G_1E40
        lda $9D51                     ; $1E40 ld a,[a16]
        adda #$10                     ; $1E43 add d8
        sta $9D51                     ; $1E45 ld [a16],a
        lda #$10                      ; $1E48 ld a,d8
        sta $9D5C                     ; $1E4A ld [a16],a
        rts                           ; $1E4D ret
G_1E4E
        bita #$80                     ; $1E4E bit 7,a
        lbeq G_1E68                   ; $1E50 jr z,pc+r8
G_1E52
        lda $9D51                     ; $1E52 ld a,[a16]
        suba #$10                     ; $1E55 sub d8
        sta $9D51                     ; $1E57 ld [a16],a
        lda #$11                      ; $1E5A ld a,d8
        sta $9D5C                     ; $1E5C ld [a16],a
        rts                           ; $1E5F ret
G_1E60
        bita #$80                     ; $1E60 bit 7,a
        lbne G_1E40                   ; $1E62 jr nz,pc+r8
        bita #$40                     ; $1E64 bit 6,a
        lbne G_1E52                   ; $1E66 jr nz,pc+r8
G_1E68
        lda #$01                      ; $1E68 ld a,d8
        sta $9D5C                     ; $1E6A ld [a16],a
        rts                           ; $1E6D ret
G_1E6E
        lda <rE                       ; $1E6E ld a,e
        sta $9FC5                     ; $1E6F ldh [a8],a
        ldx <rH                       ; $1E71 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $1E72 ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $1E73 ld l,a
        cmpa #$6C                     ; $1E74 cp d8
        ldb #$02                      ; $1E76 ld e,d8
        stb <rE                       
        lbcs G_1E7C                   ; $1E78 jr c,pc+r8
        ldb #$00                      ; $1E7A ld e,d8
        stb <rE                       
G_1E7C
        pshs a                        ; $1E7C add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
        ror <rH                       ; $1E7D rr h
        lbcc G_1E82                   ; $1E7F jr nc,pc+r8
        inc <rH                       ; $1E81 inc h
G_1E82
        pshs cc                       ; $1E82 ld d,h
        ldb <rH                       
        stb <rD                       
        puls cc                       
        pshs cc                       ; $1E83 ldh a,[a8]
        lda $9FC5                     
        puls cc                       
        pshs cc                       ; $1E85 ld e,a
        sta <rE                       
        puls cc                       
        rts                           ; $1E86 ret
G_1E87
        sta <rL                       ; $1E87 ld l,a
        suba #$70                     ; $1E88 sub d8
        lbcc G_1E93                   ; $1E8A jr nc,pc+r8
        eora #$FF                     ; $1E8C cpl
        inca                          ; $1E8D inc a
        lsra                          ; $1E8E srl a
        adda <rL                      ; $1E90 add l
        jmp G_1E98                    ; $1E91 jr pc+r8
G_1E93
        lsra                          ; $1E93 srl a
        sta <rH                       ; $1E95 ld h,a
        lda <rL                       ; $1E96 ld a,l
        suba <rH                      ; $1E97 sub h
G_1E98
        lsra                          ; $1E98 srl a
        sta <rL                       ; $1E9A ld l,a
        lsra                          ; $1E9B srl a
        adda <rL                      ; $1E9D add l
        rts                           ; $1E9E ret
G_1E9F
        bita #$40                     ; $1E9F bit 6,a
        lbeq G_1EB0                   ; $1EA1 jr z,pc+r8
G_1EA3
        ldx <rH                       ; $1EA3 ld a,[hl]
        lda ,x                        
        lsra                          ; $1EA4 srl a
        lsra                          ; $1EA6 srl a
        sta <rC                       ; $1EA8 ld c,a
        lsra                          ; $1EA9 srl a
        adda <rC                      ; $1EAB add c
        adda <rB                      ; $1EAC add b
        sta <rB                       ; $1EAD ld b,a
        jmp G_1EBF                    ; $1EAE jr pc+r8
G_1EB0
        bita #$80                     ; $1EB0 bit 7,a
G_1EB2
        lbeq G_1EBF                   ; $1EB2 jr z,pc+r8
        ldx <rH                       ; $1EB4 ld a,[hl]
        lda ,x                        
        lsra                          ; $1EB5 srl a
        lsra                          ; $1EB7 srl a
        lsra                          ; $1EB9 srl a
        sta <rC                       ; $1EBB ld c,a
        lda <rB                       ; $1EBC ld a,b
        suba <rC                      ; $1EBD sub c
        sta <rB                       ; $1EBE ld b,a
G_1EBF
        ldx <rH                       ; $1EBF ld a,[hl-]
        lda ,x                        
        leax -1,x                     
        stx <rH                       
        adda <rB                      ; $1EC0 add b
        ldx <rH                       ; $1EC1 ld [hl],a
        sta ,x                        
        rts                           ; $1EC2 ret
G_1EC3
        bita #$80                     ; $1EC3 bit 7,a
        lbne G_1EA3                   ; $1EC5 jr nz,pc+r8
        bita #$40                     ; $1EC7 bit 6,a
        jmp G_1EB2                    ; $1EC9 jr pc+r8
G_1ECB
        ldx #$9D82                    ; $1ECB ld hl,d16
        stx <rH                       
        jsr G_1F3A                    ; $1ECE call a16
        bita #$80                     ; $1ED1 bit 7,a
        lbne G_1ED8                   ; $1ED3 jr nz,pc+r8
        ldx #$9DA2                    ; $1ED5 ld hl,d16
        stx <rH                       
G_1ED8
        lda $9F91                     ; $1ED8 ldh a,[a8]
        bita #$01                     ; $1EDA bit 0,a
        lbeq G_1EDF                   ; $1EDC jr z,pc+r8
        ldx <rH                       ; $1EDE inc hl
        leax 1,x                      
        stx <rH                       
G_1EDF
        ldx <rH                       ; $1EDF inc [hl]
        inc ,x                        
        rts                           ; $1EE0 ret
G_1EE1
        ldx #$9D82                    ; $1EE1 ld hl,d16
        stx <rH                       
        jsr G_1F3A                    ; $1EE4 call a16
        bita #$80                     ; $1EE7 bit 7,a
        lbeq G_1EEE                   ; $1EE9 jr z,pc+r8
        ldx #$9DA2                    ; $1EEB ld hl,d16
        stx <rH                       
G_1EEE
        jmp G_1ED8                    ; $1EEE jr pc+r8
G_1EF0
        ldx #$9D84                    ; $1EF0 ld hl,d16
        stx <rH                       
        jsr G_1F3A                    ; $1EF3 call a16
        bita #$80                     ; $1EF6 bit 7,a
        lbne G_1EFD                   ; $1EF8 jr nz,pc+r8
        ldx #$9DA4                    ; $1EFA ld hl,d16
        stx <rH                       
G_1EFD
        jmp G_1ED8                    ; $1EFD jr pc+r8
G_1EFF
        lda $9D5A                     ; $1EFF ld a,[a16]
        cmpa #$0A                     ; $1F02 cp d8
        lbcc G_1F35                   ; $1F04 jr nc,pc+r8
        lda $9F96                     ; $1F06 ldh a,[a8]
        bita #$40                     ; $1F08 bit 6,a
        lbne G_1F19                   ; $1F0A jr nz,pc+r8
        ldx #$9D86                    ; $1F0C ld hl,d16
        stx <rH                       
        lda $9F93                     ; $1F0F ldh a,[a8]
        tsta                          ; $1F11 and a
        lbeq G_1F26                   ; $1F12 jr z,pc+r8
        ldx #$9DA7                    ; $1F14 ld hl,d16
        stx <rH                       
        jmp G_1F2E                    ; $1F17 jr pc+r8
G_1F19
        ldx #$9DA6                    ; $1F19 ld hl,d16
        stx <rH                       
        lda $9F93                     ; $1F1C ldh a,[a8]
        tsta                          ; $1F1E and a
        lbne G_1F26                   ; $1F1F jr nz,pc+r8
        ldx #$9D87                    ; $1F21 ld hl,d16
        stx <rH                       
        jmp G_1F2E                    ; $1F24 jr pc+r8
G_1F26
        lda $9D5A                     ; $1F26 ld a,[a16]
        cmpa #$01                     ; $1F29 cp d8
        lbeq G_1F34                   ; $1F2B jr z,pc+r8
        rts                           ; $1F2D ret
G_1F2E
        lda $9D5A                     ; $1F2E ld a,[a16]
        cmpa #$02                     ; $1F31 cp d8
        beq _s85                      ; $1F33 ret nz
        rts                           
_s85
G_1F34
        ldx <rH                       ; $1F34 inc [hl]
        inc ,x                        
G_1F35
        lda #$25                      ; $1F35 ld a,d8
        jmp S_SOUND                   ; $1F37 jp a16
G_1F3A
        lda $9FAD                     ; $1F3A ldh a,[a8]
        bita #$08                     ; $1F3C bit 3,a
        bne _s86                      ; $1F3E ret z
        rts                           
_s86
        lda $9FAE                     ; $1F3F ldh a,[a8]
        rts                           ; $1F41 ret
G_1F42
        pshs a,cc                     ; $1F42 push af
        lda $9FC2                     ; $1F43 ldh a,[a8]
        bita #$40                     ; $1F45 bit 6,a
        lbeq G_1F67                   ; $1F47 jr z,pc+r8
        anda #$0F                     ; $1F49 and d8
        cmpa #$01                     ; $1F4B cp d8
        lbne G_1F5A                   ; $1F4D jr nz,pc+r8
        lda $9DDD                     ; $1F4F ld a,[a16]
        cmpa #$05                     ; $1F52 cp d8
        lbeq G_1F60                   ; $1F54 jr z,pc+r8
        jmp G_1F67                    ; $1F56 jr pc+r8
G_1F58
        puls a,cc                     ; $1F58 pop af
        rts                           ; $1F59 ret
G_1F5A
        suba #$04                     ; $1F5A sub d8
        cmpa #$03                     ; $1F5C cp d8
        lbcc G_1F67                   ; $1F5E jr nc,pc+r8
G_1F60
        lda $9E00                     ; $1F60 ld a,[a16]
        cmpa #$FF                     ; $1F63 cp d8
        lbne G_1F58                   ; $1F65 jr nz,pc+r8
G_1F67
        puls a,cc                     ; $1F67 pop af
        jmp S_SOUND                   ; $1F68 jp a16
G_1F8E
        jsr G_32B9                    ; $1F8E call a16
        lda $9F90                     ; $1F91 ldh a,[a8]
        jsr G_RST08                   ; $1F93 rst vec
        fdb G_1FA8,G_1FB5,G_2002,G_200D,G_2061,G_214A,G_2119,G_2119,G_212D,G_214E
G_1FA8
        jsr G_32C8                    ; $1FA8 call a16
        clra                          ; $1FAB xor a
        ldx #$9D00                    ; $1FAC ld hl,d16
        stx <rH                       
        ldb #$80                      ; $1FAF ld b,d8
        stb <rB                       
G_1FB1
        ldx <rH                       ; $1FB1 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        dec <rB                       ; $1FB2 dec b
        lbne G_1FB1                   ; $1FB3 jr nz,pc+r8
G_1FB5
        lda $9F96                     ; $1FB5 ldh a,[a8]
        sta <rB                       ; $1FB7 ld b,a
        lda $9DDB                     ; $1FB8 ld a,[a16]
        sta <rC                       ; $1FBB ld c,a
        lda $9DE6                     ; $1FBC ld a,[a16]
        cmpa #$0D                     ; $1FBF cp d8
        lbcs G_1FD0                   ; $1FC1 jr c,pc+r8
        lda $9DE7                     ; $1FC3 ld a,[a16]
        deca                          ; $1FC6 dec a
        lsra                          ; $1FC7 srl a
        ldb <rB                       ; $1FC9 bit 1,b
        bitb #$02                     
        lbeq G_1FD8                   ; $1FCB jr z,pc+r8
        eora #$FF                     ; $1FCD cpl
        jmp G_1FD8                    ; $1FCE jr pc+r8
G_1FD0
        lda $9DE6                     ; $1FD0 ld a,[a16]
        ldb <rB                       ; $1FD3 bit 1,b
        bitb #$02                     
        lbeq G_1FD8                   ; $1FD5 jr z,pc+r8
        eora #$FF                     ; $1FD7 cpl
G_1FD8
        ldb <rC                       ; $1FD8 bit 0,c
        bitb #$01                     
        lbne G_1FDD                   ; $1FDA jr nz,pc+r8
        eora #$FF                     ; $1FDC cpl
G_1FDD
        bita #$01                     ; $1FDD bit 0,a
        lbeq G_1FE9                   ; $1FDF jr z,pc+r8
        ldb <rB                       ; $1FE1 res 6,b
        andb #$BF                     
        stb <rB                       
        ldx #$9D00                    ; $1FE3 ld hl,d16
        stx <rH                       
        clra                          ; $1FE6 xor a
        jmp G_1FF0                    ; $1FE7 jr pc+r8
G_1FE9
        ldb <rB                       ; $1FE9 set 6,b
        orb #$40                      
        stb <rB                       
        ldx #$9D20                    ; $1FEB ld hl,d16
        stx <rH                       
        lda #$80                      ; $1FEE ld a,d8
G_1FF0
        sta $9FAD                     ; $1FF0 ldh [a8],a
        lda <rB                       ; $1FF2 ld a,b
        sta $9F96                     ; $1FF3 ldh [a8],a
        lda #$04                      ; $1FF5 ld a,d8
        ldx <rH                       ; $1FF7 ld [hl],a
        sta ,x                        
        clra                          ; $1FF8 xor a
        sta $9FB0                     ; $1FF9 ldh [a8],a
        sta $9FB5                     ; $1FFB ldh [a8],a
        lda #$02                      ; $1FFD ld a,d8
        sta $9F90                     ; $1FFF ldh [a8],a
        rts                           ; $2001 ret
G_2002
        lda $9D40                     ; $2002 ld a,[a16]
        cmpa #$09                     ; $2005 cp d8
        beq _s87                      ; $2007 ret nz
        rts                           
_s87
        lda #$03                      ; $2008 ld a,d8
        sta $9F90                     ; $200A ldh [a8],a
        rts                           ; $200C ret
G_200D
        lda $9FC2                     ; $200D ldh a,[a8]
        anda #$0F                     ; $200F and d8
        suba #$04                     ; $2011 sub d8
        lbcs G_2049                   ; $2013 jr c,pc+r8
        jsr G_RST08                   ; $2015 rst vec
        fdb G_201C,G_2129,G_2031
G_201C
        ldx #$9F91                    ; $201C ld hl,d16
        stx <rH                       
        ldx <rH                       ; $201F inc [hl]
        inc ,x                        
        ldx <rH                       ; $2020 bit 0,[hl]
        ldb ,x                        
        bitb #$01                     
        lbne G_2129                   ; $2022 jp nz,a16
        lda $9F96                     ; $2025 ldh a,[a8]
        bita #$40                     ; $2027 bit 6,a
        pshs cc                       ; $2029 ld a,d8
        lda #$00                      
        puls cc                       
        lbne G_202E                   ; $202B jr nz,pc+r8
        inca                          ; $202D inc a
G_202E
        jmp G_2170                    ; $202E jp a16
G_2031
        lda $9F91                     ; $2031 ldh a,[a8]
        anda #$FE                     ; $2033 res 0,a
        adda #$02                     ; $2035 add d8
        sta $9F91                     ; $2037 ldh [a8],a
        jsr G_1F3A                    ; $2039 call a16
        bita #$80                     ; $203C bit 7,a
        pshs cc                       ; $203E ld a,d8
        lda #$00                      
        puls cc                       
        lbeq G_2043                   ; $2040 jr z,pc+r8
        inca                          ; $2042 inc a
G_2043
        jsr G_2170                    ; $2043 call a16
        jmp G_1EFF                    ; $2046 jp a16
G_2049
        lda $9F91                     ; $2049 ldh a,[a8]
        anda #$FE                     ; $204B res 0,a
        adda #$02                     ; $204D add d8
        sta $9F91                     ; $204F ldh [a8],a
        lda $9D4D                     ; $2051 ld a,[a16]
        bita #$02                     ; $2054 bit 1,a
        pshs cc                       ; $2056 ld a,d8
        lda #$00                      
        puls cc                       
        lbeq G_205B                   ; $2058 jr z,pc+r8
        inca                          ; $205A inc a
G_205B
        jsr G_2170                    ; $205B call a16
        jmp G_1EFF                    ; $205E jp a16
G_2061
        lda $9FAF                     ; $2061 ldh a,[a8]
        bita #$80                     ; $2063 bit 7,a
        lbne S_RET                    ; $2065 jp nz,a16
        ldx #$9DDC                    ; $2068 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $206B inc [hl]
        inc ,x                        
        ldx #$9DE6                    ; $206C ld hl,d16
        stx <rH                       
        ldx <rH                       ; $206F inc [hl]
        inc ,x                        
        ldx #$9DE0                    ; $2070 ld hl,d16
        stx <rH                       
        ldx #$9DE3                    ; $2073 ld de,d16
        stx <rD                       
        ldb #$00                      ; $2076 ld b,d8
        stb <rB                       
        lda $9F93                     ; $2078 ldh a,[a8]
        tsta                          ; $207A and a
        lbeq G_2085                   ; $207B jr z,pc+r8
        ldx #$9DE3                    ; $207D ld hl,d16
        stx <rH                       
        ldx #$9DE0                    ; $2080 ld de,d16
        stx <rD                       
        ldb #$03                      ; $2083 ld b,d8
        stb <rB                       
G_2085
        lda $9DDB                     ; $2085 ld a,[a16]
        cmpa #$01                     ; $2088 cp d8
        lbeq G_2096                   ; $208A jr z,pc+r8
        ldx <rH                       ; $208C inc hl
        leax 1,x                      
        stx <rH                       
        ldx <rD                       ; $208D inc de
        leax 1,x                      
        stx <rD                       
        inc <rB                       ; $208E inc b
        cmpa #$02                     ; $208F cp d8
        lbeq G_2096                   ; $2091 jr z,pc+r8
        ldx <rH                       ; $2093 inc hl
        leax 1,x                      
        stx <rH                       
        ldx <rD                       ; $2094 inc de
        leax 1,x                      
        stx <rD                       
        inc <rB                       ; $2095 inc b
G_2096
        lda <rB                       ; $2096 ld a,b
        sta $9F95                     ; $2097 ldh [a8],a
        ldx <rH                       ; $2099 inc [hl]
        inc ,x                        
        ldx <rH                       ; $209A ld a,[hl]
        lda ,x                        
        cmpa #$07                     ; $209B cp d8
        lbeq G_20B9                   ; $209D jr z,pc+r8
        cmpa #$06                     ; $209F cp d8
        lbne G_2110                   ; $20A1 jr nz,pc+r8
        ldx <rD                       ; $20A3 ld a,[de]
        lda ,x                        
        cmpa #$05                     ; $20A4 cp d8
        lbcs G_20B9                   ; $20A6 jr c,pc+r8
        lbeq G_2110                   ; $20A8 jr z,pc+r8
        ldx #$9DDC                    ; $20AA ld hl,d16
        stx <rH                       
        ldx <rH                       ; $20AD dec [hl]
        dec ,x                        
        clra                          ; $20AE xor a
        sta $9DE7                     ; $20AF ld [a16],a
        lda #$05                      ; $20B2 ld a,d8
        sta $9DEA                     ; $20B4 ld [a16],a
        jmp G_2110                    ; $20B7 jr pc+r8
G_20B9
        lda #$01                      ; $20B9 ld a,d8
        sta $9DE6                     ; $20BB ld [a16],a
        ldb #$01                      ; $20BE ld b,d8
        stb <rB                       
        lda $9F93                     ; $20C0 ldh a,[a8]
        tsta                          ; $20C2 and a
        lbeq G_20C7                   ; $20C3 jr z,pc+r8
        ldb #$FF                      ; $20C5 ld b,d8
        stb <rB                       
G_20C7
        lda $9FC4                     ; $20C7 ldh a,[a8]
        adda <rB                      ; $20C9 add b
        sta $9FC4                     ; $20CA ldh [a8],a
        lda $9DDB                     ; $20CC ld a,[a16]
        inca                          ; $20CF inc a
        sta $9DDB                     ; $20D0 ld [a16],a
        cmpa #$03                     ; $20D3 cp d8
        lbne G_20F6                   ; $20D5 jr nz,pc+r8
        ldb #$06                      ; $20D7 ld b,d8
        stb <rB                       
        lda #$04                      ; $20D9 ld a,d8
        sta $9DEA                     ; $20DB ld [a16],a
        lda $9FC4                     ; $20DE ldh a,[a8]
        cmpa #$02                     ; $20E0 cp d8
        lbeq G_20E9                   ; $20E2 jr z,pc+r8
        inc <rB                       ; $20E4 inc b
        cmpa #$FE                     ; $20E5 cp d8
        lbne G_2110                   ; $20E7 jr nz,pc+r8
G_20E9
        lda <rB                       ; $20E9 ld a,b
        sta $9F90                     ; $20EA ldh [a8],a
        lda #$96                      ; $20EC ld a,d8
        sta $9F92                     ; $20EE ldh [a8],a
        lda #$06                      ; $20F0 ld a,d8
        sta $9DEA                     ; $20F2 ld [a16],a
        rts                           ; $20F5 ret
G_20F6
        cmpa #$04                     ; $20F6 cp d8
        lbne G_2105                   ; $20F8 jr nz,pc+r8
G_20FA
        ldb #$06                      ; $20FA ld b,d8
        stb <rB                       
        lda $9FC4                     ; $20FC ldh a,[a8]
        bita #$80                     ; $20FE bit 7,a
        lbeq G_20E9                   ; $2100 jr z,pc+r8
        inc <rB                       ; $2102 inc b
        jmp G_20E9                    ; $2103 jr pc+r8
G_2105
        lda #$03                      ; $2105 ld a,d8
        sta $9DEA                     ; $2107 ld [a16],a
        lda $9F96                     ; $210A ldh a,[a8]
        bita #$08                     ; $210C bit 3,a
        lbne G_20FA                   ; $210E jr nz,pc+r8
G_2110
        lda #$64                      ; $2110 ld a,d8
        sta $9F92                     ; $2112 ldh [a8],a
        lda #$05                      ; $2114 ld a,d8
        sta $9F90                     ; $2116 ldh [a8],a
        rts                           ; $2118 ret
G_2119
        lda $9FC3                     ; $2119 ldh a,[a8]
        sta $9F91                     ; $211B ldh [a8],a
        ldx #$9F92                    ; $211D ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2120 dec [hl]
        dec ,x                        
        beq _s88                      ; $2121 ret nz
        rts                           
_s88
        lda #$0A                      ; $2122 ld a,d8
        sta $9F8A                     ; $2124 ldh [a8],a
        jmp S_SCREEN                  ; $2126 jp a16
G_2129
        clra                          ; $2129 xor a
        sta $9F90                     ; $212A ldh [a8],a
        rts                           ; $212C ret
G_212D
        clra                          ; $212D xor a
        sta $9F90                     ; $212E ldh [a8],a
        lda $9DE6                     ; $2130 ld a,[a16]
        cmpa #$0D                     ; $2133 cp d8
        bcc _s89                      ; $2135 ret c
        rts                           
_s89
        lda $9DE7                     ; $2136 ld a,[a16]
        sta <rL                       ; $2139 ld l,a
        ldb #$00                      ; $213A ld h,d8
        stb <rH                       
        lda #$06                      ; $213C ld a,d8
        jsr G_3143                    ; $213E call a16
        tsta                          ; $2141 and a
        beq _s90                      ; $2142 ret nz
        rts                           
_s90
        lda #$08                      ; $2143 ld a,d8
        sta $9F8A                     ; $2145 ldh [a8],a
        jmp S_SCREEN                  ; $2147 jp a16
G_214A
        lda $9FC3                     ; $214A ldh a,[a8]
        sta $9F91                     ; $214C ldh [a8],a
G_214E
        ldx #$9F92                    ; $214E ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2151 dec [hl]
        dec ,x                        
        beq _s91                      ; $2152 ret nz
        rts                           
_s91
        clra                          ; $2153 xor a
        sta $9F90                     ; $2154 ldh [a8],a
        jmp S_SCREEN                  ; $2156 jp a16
G_2159
        clra                          ; $2159 xor a
        sta $9F90                     ; $215A ldh [a8],a
        sta $9F91                     ; $215C ldh [a8],a
        lda $9DE6                     ; $215E ld a,[a16]
        cmpa #$0D                     ; $2161 cp d8
        lda #$01                      ; $2163 ld a,d8
        lbcs G_2169                   ; $2165 jr c,pc+r8
        lda #$07                      ; $2167 ld a,d8
G_2169
        sta $9DDD                     ; $2169 ld [a16],a
        sta $9DDE                     ; $216C ld [a16],a
        rts                           ; $216F ret
G_2170
        sta $9F93                     ; $2170 ldh [a8],a
        tsta                          ; $2172 and a
        pshs cc                       ; $2173 ld hl,d16
        ldx #$9D81                    
        stx <rH                       
        puls cc                       
        lbeq G_217B                   ; $2176 jr z,pc+r8
        ldx #$9DA1                    ; $2178 ld hl,d16
        stx <rH                       
G_217B
        ldx <rH                       ; $217B inc [hl]
        inc ,x                        
        ldx #$9DDD                    ; $217C ld hl,d16
        stx <rH                       
        ldx #$9DDE                    ; $217F ld de,d16
        stx <rD                       
        lda $9F93                     ; $2182 ldh a,[a8]
        tsta                          ; $2184 and a
        lbeq G_2189                   ; $2185 jr z,pc+r8
        ldx <rH                       ; $2187 inc hl
        leax 1,x                      
        stx <rH                       
        ldx <rD                       ; $2188 dec de
        leax -1,x                     
        stx <rD                       
G_2189
        lda $9DE7                     ; $2189 ld a,[a16]
        inca                          ; $218C inc a
        sta $9DE7                     ; $218D ld [a16],a
        lda #$08                      ; $2190 ld a,d8
        sta $9F90                     ; $2192 ldh [a8],a
        ldx <rH                       ; $2194 ld a,[hl]
        lda ,x                        
        cmpa #$00                     ; $2195 cp d8
        lbeq G_21B3                   ; $2197 jr z,pc+r8
        cmpa #$03                     ; $2199 cp d8
        lbcs G_21DA                   ; $219B jr c,pc+r8
        lbeq G_21BC                   ; $219D jr z,pc+r8
        cmpa #$04                     ; $219F cp d8
        lbeq G_21C9                   ; $21A1 jr z,pc+r8
        cmpa #$05                     ; $21A3 cp d8
        lbeq G_21D0                   ; $21A5 jr z,pc+r8
        cmpa #$06                     ; $21A7 cp d8
        lbeq G_21C9                   ; $21A9 jr z,pc+r8
        cmpa #$0C                     ; $21AB cp d8
        lbcs G_21DA                   ; $21AD jr c,pc+r8
        lbeq G_21E0                   ; $21AF jr z,pc+r8
        jmp G_21C9                    ; $21B1 jr pc+r8
G_21B3
        lda #$05                      ; $21B3 ld a,d8
        ldx <rH                       ; $21B5 ld [hl],a
        sta ,x                        
        ldx <rD                       ; $21B6 ld [de],a
        sta ,x                        
        lda #$29                      ; $21B7 ld a,d8
        jmp S_SOUND                   ; $21B9 jp a16
G_21BC
        ldx <rD                       ; $21BC ld a,[de]
        lda ,x                        
        cmpa #$04                     ; $21BD cp d8
        lbeq G_21B3                   ; $21BF jr z,pc+r8
        lda #$04                      ; $21C1 ld a,d8
        ldx <rH                       ; $21C3 ld [hl],a
        sta ,x                        
        lda #$31                      ; $21C4 ld a,d8
        jmp S_SOUND                   ; $21C6 jp a16
G_21C9
        clra                          ; $21C9 xor a
        ldx <rH                       ; $21CA ld [hl],a
        sta ,x                        
        lda #$04                      ; $21CB ld a,d8
        sta $9F90                     ; $21CD ldh [a8],a
        rts                           ; $21CF ret
G_21D0
        clra                          ; $21D0 xor a
        ldx <rD                       ; $21D1 ld [de],a
        sta ,x                        
        lda #$06                      ; $21D2 ld a,d8
        ldx <rH                       ; $21D4 ld [hl],a
        sta ,x                        
        lda #$31                      ; $21D5 ld a,d8
        jmp S_SOUND                   ; $21D7 jp a16
G_21DA
        ldx <rH                       ; $21DA inc [hl]
        inc ,x                        
        lda #$31                      ; $21DB ld a,d8
        jmp S_SOUND                   ; $21DD jp a16
G_21E0
        ldx <rD                       ; $21E0 ld a,[de]
        lda ,x                        
        cmpa #$0D                     ; $21E1 cp d8
        lbeq G_21B3                   ; $21E3 jr z,pc+r8
        lda #$0D                      ; $21E5 ld a,d8
        ldx <rH                       ; $21E7 ld [hl],a
        sta ,x                        
        lda #$31                      ; $21E8 ld a,d8
        jmp S_SOUND                   ; $21EA jp a16
G_2286
        jsr G_00A9                    ; $2286 call a16
        anda #$3F                     ; $2289 and d8
        adda #$20                     ; $228B add d8
        ldb #$01                      ; $228D ld b,d8
        stb <rB                       
        rts                           ; $228F ret
G_2290
        jsr G_00A9                    ; $2290 call a16
        anda #$1F                     ; $2293 and d8
        suba #$10                     ; $2295 sub d8
        ldb #$02                      ; $2297 ld b,d8
        stb <rB                       
        rts                           ; $2299 ret
G_229A
        lda $9DDF                     ; $229A ld a,[a16]
        cmpa #$04                     ; $229D cp d8
        pshs cc                       ; $229F ld bc,d16
        ldx #$0F48                    
        stx <rB                       
        puls cc                       
        lbne G_22A7                   ; $22A2 jr nz,pc+r8
        ldx #$0750                    ; $22A4 ld bc,d16
        stx <rB                       
G_22A7
        jsr G_00A9                    ; $22A7 call a16
        anda <rB                      ; $22AA and b
        adda <rC                      ; $22AB add c
        ldb #$01                      ; $22AC ld c,d8
        stb <rC                       
        ldb #$03                      ; $22AE ld b,d8
        stb <rB                       
        rts                           ; $22B0 ret
G_22B1
        lda $9F91                     ; $22B1 ldh a,[a8]
        bita #$01                     ; $22B3 bit 0,a
        pshs cc                       ; $22B5 ld c,d8
        ldb #$01                      
        stb <rC                       
        puls cc                       
        lbeq G_22BB                   ; $22B7 jr z,pc+r8
        ldb #$02                      ; $22B9 ld c,d8
        stb <rC                       
G_22BB
        ldx <rH                       ; $22BB ld a,[hl]
        lda ,x                        
        jsr G_00CA                    ; $22BC call a16
        lbcs G_22E1                   ; $22BF jr c,pc+r8
        jsr G_00A9                    ; $22C1 call a16
        anda #$F0                     ; $22C4 and d8
        cmpa #$C0                     ; $22C6 cp d8
        lda $9F96                     ; $22C8 ldh a,[a8]
        sta <rB                       ; $22CA ld b,a
        lda $9F91                     ; $22CB ldh a,[a8]
        lbcs G_22D1                   ; $22CD jr c,pc+r8
        eora #$02                     ; $22CF xor d8
G_22D1
        ldb <rB                       ; $22D1 bit 6,b
        bitb #$40                     
        lbeq G_22D7                   ; $22D3 jr z,pc+r8
        eora #$02                     ; $22D5 xor d8
G_22D7
        bita #$02                     ; $22D7 bit 1,a
        pshs cc                       ; $22D9 ld a,d8
        lda #$20                      
        puls cc                       
        lbeq G_22DF                   ; $22DB jr z,pc+r8
        lda #$10                      ; $22DD ld a,d8
G_22DF
        ora <rC                       ; $22DF or c
        sta <rC                       ; $22E0 ld c,a
G_22E1
        jsr G_00A9                    ; $22E1 call a16
        bita #$10                     ; $22E4 bit 4,a
        lbne G_2309                   ; $22E6 jr nz,pc+r8
        bita #$08                     ; $22E8 bit 3,a
        pshs cc                       ; $22EA ld a,[a16]
        lda $9D47                     
        puls cc                       
        lbne G_22F9                   ; $22ED jr nz,pc+r8
        cmpa #$44                     ; $22EF cp d8
        lbcc G_2309                   ; $22F1 jr nc,pc+r8
        lda $9F96                     ; $22F3 ldh a,[a8]
        eora #$40                     ; $22F5 xor d8
        jmp G_22FF                    ; $22F7 jr pc+r8
G_22F9
        cmpa #$3C                     ; $22F9 cp d8
        lbcs G_2309                   ; $22FB jr c,pc+r8
        lda $9F96                     ; $22FD ldh a,[a8]
G_22FF
        bita #$40                     ; $22FF bit 6,a
        pshs cc                       ; $2301 ld a,d8
        lda #$80                      
        puls cc                       
        lbeq G_2307                   ; $2303 jr z,pc+r8
        lda #$40                      ; $2305 ld a,d8
G_2307
        ora <rC                       ; $2307 or c
        sta <rC                       ; $2308 ld c,a
G_2309
        lda #$04                      ; $2309 ld a,d8
        rts                           ; $230B ret
G_2720
        lda $9F96                     ; $2720 ldh a,[a8]
        bita #$01                     ; $2722 bit 0,a
        beq _s92                      ; $2724 ret nz
        rts                           
_s92
        ldb #$00                      ; $2725 ld c,d8
        stb <rC                       
        lda $9FAD                     ; $2727 ldh a,[a8]
        bita #$40                     ; $2729 bit 6,a
        lbeq G_2732                   ; $272B jr z,pc+r8
        jsr G_27BC                    ; $272D call a16
        jmp G_2735                    ; $2730 jr pc+r8
G_2732
        jsr G_2750                    ; $2732 call a16
G_2735
        lda $9D5A                     ; $2735 ld a,[a16]
        cmpa #$01                     ; $2738 cp d8
        lbeq G_2746                   ; $273A jr z,pc+r8
        lda $9FAD                     ; $273C ldh a,[a8]
        bita #$20                     ; $273E bit 5,a
        lbeq G_2746                   ; $2740 jr z,pc+r8
        ldb <rC                       ; $2742 res 0,c
        andb #$FE                     
        stb <rC                       
        ldb <rC                       ; $2744 res 1,c
        andb #$FD                     
        stb <rC                       
G_2746
        lda $9F9C                     ; $2746 ldh a,[a8]
        eora <rC                      ; $2748 xor c
        anda <rC                      ; $2749 and c
        sta $9F9D                     ; $274A ldh [a8],a
        lda <rC                       ; $274C ld a,c
        sta $9F9C                     ; $274D ldh [a8],a
        rts                           ; $274F ret
G_2750
        lda $9F96                     ; $2750 ldh a,[a8]
        bita #$40                     ; $2752 bit 6,a
        bne _s93                      ; $2754 ret z
        rts                           
_s93
        lda $9FB5                     ; $2755 ldh a,[a8]
        jsr G_RST08                   ; $2757 rst vec
        fdb G_2762,G_2771,G_277F,G_2799,G_27AE,G_20FA
G_2762
        lda $9D20                     ; $2762 ld a,[a16]
        cmpa #$05                     ; $2765 cp d8
        beq _s94                      ; $2767 ret nz
        rts                           
_s94
        jsr G_2286                    ; $2768 call a16
        sta $9FB6                     ; $276B ldh [a8],a
        lda <rB                       ; $276D ld a,b
        sta $9FB5                     ; $276E ldh [a8],a
        rts                           ; $2770 ret
G_2771
        ldx #$9FB6                    ; $2771 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2774 dec [hl]
        dec ,x                        
        beq _s95                      ; $2775 ret nz
        rts                           
_s95
        jsr G_2290                    ; $2776 call a16
        sta $9FB6                     ; $2779 ldh [a8],a
        lda <rB                       ; $277B ld a,b
        sta $9FB5                     ; $277C ldh [a8],a
        rts                           ; $277E ret
G_277F
        lda $9FB6                     ; $277F ldh a,[a8]
        bita #$80                     ; $2781 bit 7,a
        lbne G_278A                   ; $2783 jr nz,pc+r8
        ldb #$20                      ; $2785 ld c,d8
        stb <rC                       
        deca                          ; $2787 dec a
        jmp G_278D                    ; $2788 jr pc+r8
G_278A
        ldb #$10                      ; $278A ld c,d8
        stb <rC                       
        inca                          ; $278C inc a
G_278D
        pshs cc                       ; $278D ldh [a8],a
        sta $9FB6                     
        puls cc                       
        beq _s96                      ; $278F ret nz
        rts                           
_s96
        jsr G_229A                    ; $2790 call a16
        sta $9FB6                     ; $2793 ldh [a8],a
        lda <rB                       ; $2795 ld a,b
        sta $9FB5                     ; $2796 ldh [a8],a
        rts                           ; $2798 ret
G_2799
        lda $9D20                     ; $2799 ld a,[a16]
        cmpa #$06                     ; $279C cp d8
        lbne G_2762                   ; $279E jr nz,pc+r8
        ldx #$9FB6                    ; $27A0 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $27A3 dec [hl]
        dec ,x                        
        beq _s97                      ; $27A4 ret nz
        rts                           
_s97
        ldx #$9DB4                    ; $27A5 ld hl,d16
        stx <rH                       
        jsr G_22B1                    ; $27A8 call a16
        sta $9FB5                     ; $27AB ldh [a8],a
        rts                           ; $27AD ret
G_27AE
        lda $9F9C                     ; $27AE ldh a,[a8]
        anda #$F0                     ; $27B0 and d8
        sta <rC                       ; $27B2 ld c,a
        lda $9FAD                     ; $27B3 ldh a,[a8]
        bita #$40                     ; $27B5 bit 6,a
        bne _s98                      ; $27B7 ret z
        rts                           
_s98
        clra                          ; $27B8 xor a
        sta $9FB5                     ; $27B9 ldh [a8],a
        rts                           ; $27BB ret
G_27BC
        lda $9FC2                     ; $27BC ldh a,[a8]
        bita #$40                     ; $27BE bit 6,a
        beq _s99                      ; $27C0 ret nz
        rts                           
_s99
        lda $9D4C                     ; $27C1 ld a,[a16]
        cmpa #$02                     ; $27C4 cp d8
        bcs _s100                     ; $27C6 ret nc
        rts                           
_s100
        lda $9FB5                     ; $27C7 ldh a,[a8]
        jsr G_RST08                   ; $27C9 rst vec
        fdb G_27D6,G_287F,G_28C1,G_29A7,G_2A63,G_2A72
G_27D6
        clra                          ; $27D6 xor a
        sta $9FB9                     ; $27D7 ldh [a8],a
        lda $9FAD                     ; $27D9 ldh a,[a8]
        bita #$80                     ; $27DB bit 7,a
        lbne G_27E5                   ; $27DD jr nz,pc+r8
        lda $9D43                     ; $27DF ld a,[a16]
        cmpa #$70                     ; $27E2 cp d8
        bcc _s101                     ; $27E4 ret c
        rts                           
_s101
G_27E5
        lda $9D5A                     ; $27E5 ld a,[a16]
        cmpa #$02                     ; $27E8 cp d8
        lbcs G_283A                   ; $27EA jr c,pc+r8
        ldb #$00                      ; $27EC ld c,d8
        stb <rC                       
        lda $9D23                     ; $27EE ld a,[a16]
        cmpa #$38                     ; $27F1 cp d8
        lbcs G_27FD                   ; $27F3 jr c,pc+r8
        ldb #$03                      ; $27F5 ld c,d8
        stb <rC                       
        cmpa #$56                     ; $27F7 cp d8
        lbcs G_27FD                   ; $27F9 jr c,pc+r8
        ldb #$06                      ; $27FB ld c,d8
        stb <rC                       
G_27FD
        ldb #$00                      ; $27FD ld b,d8
        stb <rB                       
        ldx #$9DB7                    ; $27FF ld hl,d16
        stx <rH                       
        pshs a                        ; $2802 add hl,bc
        ldd <rH                       
        addd <rB                      
        std <rH                       
        puls a                        
        ldb #$00                      ; $2803 ld d,d8
        stb <rD                       
        lda $9DDF                     ; $2805 ld a,[a16]
        cmpa #$03                     ; $2808 cp d8
        lbcs G_281A                   ; $280A jr c,pc+r8
        lda $9D23                     ; $280C ld a,[a16]
        suba #$6C                     ; $280F sub d8
        lbcc G_2815                   ; $2811 jr nc,pc+r8
        eora #$FF                     ; $2813 cpl
        inca                          ; $2814 inc a
G_2815
        lsra                          ; $2815 srl a
        lsra                          ; $2817 srl a
        sta <rD                       ; $2819 ld d,a
G_281A
        ldx <rH                       ; $281A ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        suba <rD                      ; $281B sub d
        lbcc G_281F                   ; $281C jr nc,pc+r8
        clra                          ; $281E xor a
G_281F
        sta <rD                       ; $281F ld d,a
        ldx <rH                       ; $2820 push hl
        pshs x                        
        jsr G_00CA                    ; $2821 call a16
        puls x                        ; $2824 pop hl
        stx <rH                       
        lbcc G_283A                   ; $2825 jr nc,pc+r8
        ldx <rH                       ; $2827 ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        adda <rD                      ; $2828 add d
        sta <rD                       ; $2829 ld d,a
        ldx <rH                       ; $282A push hl
        pshs x                        
        jsr G_00D9                    ; $282B call a16
        puls x                        ; $282E pop hl
        stx <rH                       
        lbcc G_2844                   ; $282F jr nc,pc+r8
        ldx <rH                       ; $2831 ld a,[hl]
        lda ,x                        
        adda <rD                      ; $2832 add d
        jsr G_00D9                    ; $2833 call a16
        lbcc G_2865                   ; $2836 jr nc,pc+r8
        jmp G_286D                    ; $2838 jr pc+r8
G_283A
        lda $9D25                     ; $283A ld a,[a16]
        sta $9FB7                     ; $283D ldh [a8],a
        lda $9D23                     ; $283F ld a,[a16]
        jmp G_2874                    ; $2842 jr pc+r8
G_2844
        jsr G_00A9                    ; $2844 call a16
        anda #$3F                     ; $2847 and d8
        adda #$4C                     ; $2849 add d8
        sta <rB                       ; $284B ld b,a
        lda $9D25                     ; $284C ld a,[a16]
        ldx #$9D45                    ; $284F ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2852 add [hl]
        adda ,x                       
        rora                          ; $2853 rra
        adda <rB                      ; $2854 add b
        rora                          ; $2855 rra
        sta $9FB7                     ; $2856 ldh [a8],a
        lda $9D23                     ; $2858 ld a,[a16]
        adda #$20                     ; $285B add d8
        cmpa #$6C                     ; $285D cp d8
        lbcs G_2874                   ; $285F jr c,pc+r8
        lda #$6C                      ; $2861 ld a,d8
        jmp G_2874                    ; $2863 jr pc+r8
G_2865
        lda #$6C                      ; $2865 ld a,d8
        sta $9FB7                     ; $2867 ldh [a8],a
        lda #$38                      ; $2869 ld a,d8
        jmp G_2874                    ; $286B jr pc+r8
G_286D
        lda #$6C                      ; $286D ld a,d8
        sta $9FB7                     ; $286F ldh [a8],a
        lda $9D23                     ; $2871 ld a,[a16]
G_2874
        sta $9FB8                     ; $2874 ldh [a8],a
        ldb #$00                      ; $2876 ld c,d8
        stb <rC                       
        clra                          ; $2878 xor a
        sta $9FB6                     ; $2879 ldh [a8],a
        inca                          ; $287B inc a
        sta $9FB5                     ; $287C ldh [a8],a
        rts                           ; $287E ret
G_287F
        ldx #$9FB7                    ; $287F ld hl,d16
        stx <rH                       
        lda $9D25                     ; $2882 ld a,[a16]
        ldx <rH                       ; $2885 sub [hl]
        suba ,x                       
        lbeq G_288E                   ; $2886 jr z,pc+r8
        ldb #$20                      ; $2888 ld c,d8
        stb <rC                       
        lbcc G_288E                   ; $288A jr nc,pc+r8
        ldb #$10                      ; $288C ld c,d8
        stb <rC                       
G_288E
        ldx <rH                       ; $288E inc hl
        leax 1,x                      
        stx <rH                       
        lda $9D23                     ; $288F ld a,[a16]
        ldx <rH                       ; $2892 sub [hl]
        suba ,x                       
        lbeq G_289D                   ; $2893 jr z,pc+r8
        lda #$40                      ; $2895 ld a,d8
        lbcc G_289B                   ; $2897 jr nc,pc+r8
        lda #$80                      ; $2899 ld a,d8
G_289B
        ora <rC                       ; $289B or c
        sta <rC                       ; $289C ld c,a
G_289D
        lda $9FAD                     ; $289D ldh a,[a8]
        bita #$80                     ; $289F bit 7,a
        bne _s102                     ; $28A1 ret z
        rts                           
_s102
        lda $9D5A                     ; $28A2 ld a,[a16]
        cmpa #$02                     ; $28A5 cp d8
        lda $9DB0                     ; $28A7 ld a,[a16]
        lbcc G_28B7                   ; $28AA jr nc,pc+r8
        sta <rB                       ; $28AC ld b,a
        lda $9D51                     ; $28AD ld a,[a16]
        lsra                          ; $28B0 srl a
        lsra                          ; $28B2 srl a
        sta <rL                       ; $28B4 ld l,a
        lda <rB                       ; $28B5 ld a,b
        suba <rL                      ; $28B6 sub l
G_28B7
        ldx #$9D43                    ; $28B7 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $28BA cp [hl]
        cmpa ,x                       
        bcc _s103                     ; $28BB ret c
        rts                           
_s103
        lda #$02                      ; $28BC ld a,d8
        sta $9FB5                     ; $28BE ldh [a8],a
        rts                           ; $28C0 ret
G_28C1
        lda $9FB6                     ; $28C1 ldh a,[a8]
        tsta                          ; $28C3 and a
        lbeq G_28D5                   ; $28C4 jr z,pc+r8
        deca                          ; $28C6 dec a
        pshs cc                       ; $28C7 ldh [a8],a
        sta $9FB6                     
        puls cc                       
        pshs cc                       ; $28C9 ld b,d8
        ldb #$00                      
        stb <rB                       
        puls cc                       
        lbne G_297D                   ; $28CB jp nz,a16
        lda #$03                      ; $28CE ld a,d8
        sta $9FB5                     ; $28D0 ldh [a8],a
        jmp G_297D                    ; $28D2 jp a16
G_28D5
        lda $9D51                     ; $28D5 ld a,[a16]
        pshs a                        ; $28D8 swap a
        lsla                          
        lsla                          
        lsla                          
        lsla                          
        ldb ,s+                       
        lsrb                          
        lsrb                          
        lsrb                          
        lsrb                          
        pshs b                        
        ora ,s+                       
        anda #$0F                     ; $28DA and d8
        sta <rB                       ; $28DC ld b,a
        lsr <rB                       ; $28DD srl b
        lsla                          ; $28DF sla a
        lsla                          ; $28E1 sla a
        suba <rB                      ; $28E3 sub b
        sta <rB                       ; $28E4 ld b,a
        ldx #$9D23                    ; $28E5 ld hl,d16
        stx <rH                       
        lda $9D43                     ; $28E8 ld a,[a16]
        ldx <rH                       ; $28EB sub [hl]
        suba ,x                       
        cmpa <rB                      ; $28EC cp b
        lbcc G_291B                   ; $28ED jr nc,pc+r8
        jsr G_08A6                    ; $28EF call a16
        jsr G_1722                    ; $28F2 call a16
        lda $9D25                     ; $28F5 ld a,[a16]
        suba <rH                      ; $28F8 sub h
        adda #$14                     ; $28F9 add d8
        cmpa #$28                     ; $28FB cp d8
        lbcc G_291B                   ; $28FD jr nc,pc+r8
        lda $9D47                     ; $28FF ld a,[a16]
        cmpa #$48                     ; $2902 cp d8
        lbcc G_297B                   ; $2904 jr nc,pc+r8
        lda $9D4B                     ; $2906 ld a,[a16]
        cmpa #$04                     ; $2909 cp d8
        lbcc G_2913                   ; $290B jr nc,pc+r8
        lda $9D4C                     ; $290D ld a,[a16]
        tsta                          ; $2910 and a
        lbeq G_291B                   ; $2911 jr z,pc+r8
G_2913
        jsr G_00A9                    ; $2913 call a16
        anda #$07                     ; $2916 and d8
        inca                          ; $2918 inc a
        sta $9FB6                     ; $2919 ldh [a8],a
G_291B
        lda $9D47                     ; $291B ld a,[a16]
        cmpa #$60                     ; $291E cp d8
        lbcs G_292E                   ; $2920 jr c,pc+r8
        lda $9FB9                     ; $2922 ldh a,[a8]
        tsta                          ; $2924 and a
        lbne G_292E                   ; $2925 jr nz,pc+r8
        lda #$05                      ; $2927 ld a,d8
        sta $9FB5                     ; $2929 ldh [a8],a
        ldb #$00                      ; $292B ld c,d8
        stb <rC                       
        rts                           ; $292D ret
G_292E
        lda $9DB0                     ; $292E ld a,[a16]
        ldx #$9D43                    ; $2931 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2934 cp [hl]
        cmpa ,x                       
        lbcs G_2948                   ; $2935 jr c,pc+r8
        lda $9D47                     ; $2937 ld a,[a16]
        bita #$80                     ; $293A bit 7,a
        lbne G_297B                   ; $293C jr nz,pc+r8
        cmpa #$30                     ; $293E cp d8
        lbcc G_294C                   ; $2940 jr nc,pc+r8
        lda $9D4C                     ; $2942 ld a,[a16]
        tsta                          ; $2945 and a
        lbne G_294C                   ; $2946 jr nz,pc+r8
G_2948
        ldb #$00                      ; $2948 ld b,d8
        stb <rB                       
        jmp G_297D                    ; $294A jr pc+r8
G_294C
        ldb #$80                      ; $294C ld b,d8
        stb <rB                       
        lda $9D5A                     ; $294E ld a,[a16]
        cmpa #$02                     ; $2951 cp d8
        lbcc G_295E                   ; $2953 jr nc,pc+r8
        lda $9D23                     ; $2955 ld a,[a16]
        cmpa #$4C                     ; $2958 cp d8
        lbcs G_295E                   ; $295A jr c,pc+r8
        ldb #$00                      ; $295C ld b,d8
        stb <rB                       
G_295E
        lda $9D51                     ; $295E ld a,[a16]
        lsra                          ; $2961 srl a
        lsra                          ; $2963 srl a
        lsra                          ; $2965 srl a
        sta <rC                       ; $2967 ld c,a
        lda $9D52                     ; $2968 ld a,[a16]
        bita #$80                     ; $296B bit 7,a
        lbeq G_2971                   ; $296D jr z,pc+r8
        lsr <rC                       ; $296F srl c
G_2971
        lda $9D43                     ; $2971 ld a,[a16]
        suba <rC                      ; $2974 sub c
        ldx #$9D23                    ; $2975 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2978 sub [hl]
        suba ,x                       
        lbcc G_297D                   ; $2979 jr nc,pc+r8
G_297B
        ldb #$40                      ; $297B ld b,d8
        stb <rB                       
G_297D
        ldx <rB                       ; $297D push bc
        pshs x                        
        jsr G_08A6                    ; $297E call a16
        jsr G_1722                    ; $2981 call a16
        lda $9D25                     ; $2984 ld a,[a16]
        suba <rH                      ; $2987 sub h
        ldb #$20                      ; $2988 ld c,d8
        stb <rC                       
        bita #$80                     ; $298A bit 7,a
        lbeq G_2992                   ; $298C jr z,pc+r8
        ldb #$10                      ; $298E ld c,d8
        stb <rC                       
        eora #$FF                     ; $2990 cpl
        inca                          ; $2991 inc a
G_2992
        cmpa #$08                     ; $2992 cp d8
        lbcs G_299E                   ; $2994 jr c,pc+r8
        cmpa #$10                     ; $2996 cp d8
        lbcc G_29A2                   ; $2998 jr nc,pc+r8
        ldb #$00                      ; $299A ld c,d8
        stb <rC                       
        jmp G_29A2                    ; $299C jr pc+r8
G_299E
        lda <rC                       ; $299E ld a,c
        eora #$30                     ; $299F xor d8
        sta <rC                       ; $29A1 ld c,a
G_29A2
        lda <rC                       ; $29A2 ld a,c
        puls x                        ; $29A3 pop bc
        stx <rB                       
        ora <rB                       ; $29A4 or b
        sta <rC                       ; $29A5 ld c,a
        rts                           ; $29A6 ret
G_29A7
        jsr G_176B                    ; $29A7 call a16
        ldb #$00                      ; $29AA ld c,d8
        stb <rC                       
        lbcs G_29E0                   ; $29AC jr c,pc+r8
        lda $9D0B                     ; $29AE ld a,[a16]
        cmpa #$08                     ; $29B1 cp d8
        lbcs G_29DE                   ; $29B3 jr c,pc+r8
        lda $9F9A                     ; $29B5 ldh a,[a8]
        bita #$40                     ; $29B7 bit 6,a
        lbeq G_29C4                   ; $29B9 jr z,pc+r8
        lda $9D03                     ; $29BB ld a,[a16]
        cmpa #$A0                     ; $29BE cp d8
        lbcc G_29C4                   ; $29C0 jr nc,pc+r8
        ldb #$1E                      ; $29C2 ld c,d8
        stb <rC                       
G_29C4
        lda $9DB1                     ; $29C4 ld a,[a16]
        adda <rC                      ; $29C7 add c
        pshs a,cc                     ; $29C8 push af
        lda $9D2B                     ; $29C9 ld a,[a16]
        cmpa #$0C                     ; $29CC cp d8
        lbcs G_29D6                   ; $29CE jr c,pc+r8
        puls a,cc                     ; $29D0 pop af
        lsra                          ; $29D1 srl a
        lsra                          ; $29D3 srl a
        pshs a,cc                     ; $29D5 push af
G_29D6
        puls a,cc                     ; $29D6 pop af
        jsr G_00CA                    ; $29D7 call a16
        ldb #$02                      ; $29DA ld c,d8
        stb <rC                       
        lbcc G_29E0                   ; $29DC jr nc,pc+r8
G_29DE
        ldb #$01                      ; $29DE ld c,d8
        stb <rC                       
G_29E0
        lda $9D2B                     ; $29E0 ld a,[a16]
        cmpa #$0C                     ; $29E3 cp d8
        lda $9DB5                     ; $29E5 ld a,[a16]
        lbcs G_29EC                   ; $29E8 jr c,pc+r8
        adda #$14                     ; $29EA add d8
G_29EC
        jsr G_00CA                    ; $29EC call a16
        ldb #$00                      ; $29EF ld b,d8
        stb <rB                       
        lbcs G_2A29                   ; $29F1 jr c,pc+r8
        lda $9DDF                     ; $29F3 ld a,[a16]
        cmpa #$04                     ; $29F6 cp d8
        pshs cc                       ; $29F8 ld h,d8
        ldb #$03                      
        stb <rH                       
        puls cc                       
        lbne G_29FE                   ; $29FA jr nz,pc+r8
        ldb #$01                      ; $29FC ld h,d8
        stb <rH                       
G_29FE
        jsr G_00A9                    ; $29FE call a16
        anda <rH                      ; $2A01 and h
        lbne G_2A0E                   ; $2A02 jr nz,pc+r8
        lda $9F9A                     ; $2A04 ldh a,[a8]
        bita #$20                     ; $2A06 bit 5,a
        lbne G_2A15                   ; $2A08 jr nz,pc+r8
        bita #$10                     ; $2A0A bit 4,a
        lbne G_2A20                   ; $2A0C jr nz,pc+r8
G_2A0E
        lda $9D05                     ; $2A0E ld a,[a16]
        cmpa #$6C                     ; $2A11 cp d8
        lbcc G_2A20                   ; $2A13 jr nc,pc+r8
G_2A15
        lda $9D25                     ; $2A15 ld a,[a16]
        cmpa #$88                     ; $2A18 cp d8
        lbcc G_2A29                   ; $2A1A jr nc,pc+r8
        ldb #$10                      ; $2A1C ld b,d8
        stb <rB                       
        jmp G_2A29                    ; $2A1E jr pc+r8
G_2A20
        lda $9D25                     ; $2A20 ld a,[a16]
        cmpa #$50                     ; $2A23 cp d8
        lbcs G_2A29                   ; $2A25 jr c,pc+r8
        ldb #$20                      ; $2A27 ld b,d8
        stb <rB                       
G_2A29
        lda <rB                       ; $2A29 ld a,b
        ora <rC                       ; $2A2A or c
        sta <rC                       ; $2A2B ld c,a
        ldb <rC                       ; $2A2C bit 1,c
        bitb #$02                     
        lbeq G_2A37                   ; $2A2E jr z,pc+r8
        jsr G_00A9                    ; $2A30 call a16
        bita #$10                     ; $2A33 bit 4,a
        lbne G_2A4E                   ; $2A35 jr nz,pc+r8
G_2A37
        ldb #$00                      ; $2A37 ld b,d8
        stb <rB                       
        jsr G_00A9                    ; $2A39 call a16
        bita #$01                     ; $2A3C bit 0,a
        lbeq G_2A5B                   ; $2A3E jr z,pc+r8
        lda $9D03                     ; $2A40 ld a,[a16]
        cmpa #$B0                     ; $2A43 cp d8
        lbcc G_2A52                   ; $2A45 jr nc,pc+r8
        lda $9D23                     ; $2A47 ld a,[a16]
        cmpa #$40                     ; $2A4A cp d8
        lbcc G_2A5B                   ; $2A4C jr nc,pc+r8
G_2A4E
        ldb #$80                      ; $2A4E ld b,d8
        stb <rB                       
        jmp G_2A5B                    ; $2A50 jr pc+r8
G_2A52
        lda $9D23                     ; $2A52 ld a,[a16]
        cmpa #$40                     ; $2A55 cp d8
        lbcs G_2A5B                   ; $2A57 jr c,pc+r8
        ldb #$40                      ; $2A59 ld b,d8
        stb <rB                       
G_2A5B
        lda <rB                       ; $2A5B ld a,b
        ora <rC                       ; $2A5C or c
        sta <rC                       ; $2A5D ld c,a
        lda #$04                      ; $2A5E ld a,d8
        sta $9FB5                     ; $2A60 ldh [a8],a
        rts                           ; $2A62 ret
G_2A63
        lda $9F9C                     ; $2A63 ldh a,[a8]
        anda #$F0                     ; $2A65 and d8
        sta <rC                       ; $2A67 ld c,a
        lda $9D20                     ; $2A68 ld a,[a16]
        cmpa #$02                     ; $2A6B cp d8
        bne _s104                     ; $2A6D ret z
        rts                           
_s104
        clra                          ; $2A6E xor a
        sta $9FB5                     ; $2A6F ldh [a8],a
        rts                           ; $2A71 ret
G_2A72
        lda $9FB6                     ; $2A72 ldh a,[a8]
        tsta                          ; $2A74 and a
        lbeq G_2A86                   ; $2A75 jr z,pc+r8
        deca                          ; $2A77 dec a
        pshs cc                       ; $2A78 ldh [a8],a
        sta $9FB6                     
        puls cc                       
        pshs cc                       ; $2A7A ld b,d8
        ldb #$00                      
        stb <rB                       
        puls cc                       
        lbne G_2B11                   ; $2A7C jp nz,a16
        lda #$03                      ; $2A7F ld a,d8
        sta $9FB5                     ; $2A81 ldh [a8],a
        jmp G_2B11                    ; $2A83 jp a16
G_2A86
        ldx #$9D23                    ; $2A86 ld hl,d16
        stx <rH                       
        lda $9D43                     ; $2A89 ld a,[a16]
        ldx <rH                       ; $2A8C sub [hl]
        suba ,x                       
        cmpa #$0C                     ; $2A8D cp d8
        lbcc G_2AB3                   ; $2A8F jr nc,pc+r8
        ldx #$9D24                    ; $2A91 ld hl,d16
        stx <rH                       
        jsr G_1BEF                    ; $2A94 call a16
        adda #$0C                     ; $2A97 add d8
        cmpa #$10                     ; $2A99 cp d8
        lbcc G_2AB3                   ; $2A9B jr nc,pc+r8
        lda $9D47                     ; $2A9D ld a,[a16]
        cmpa #$60                     ; $2AA0 cp d8
        lbcc G_2AB3                   ; $2AA2 jr nc,pc+r8
        lda $9D52                     ; $2AA4 ld a,[a16]
        bita #$80                     ; $2AA7 bit 7,a
        lbeq G_2AB3                   ; $2AA9 jr z,pc+r8
        jsr G_00A9                    ; $2AAB call a16
        anda #$03                     ; $2AAE and d8
        inca                          ; $2AB0 inc a
        sta $9FB6                     ; $2AB1 ldh [a8],a
G_2AB3
        lda $9D43                     ; $2AB3 ld a,[a16]
        cmpa #$60                     ; $2AB6 cp d8
        lbcs G_2ADA                   ; $2AB8 jr c,pc+r8
        lda $9D52                     ; $2ABA ld a,[a16]
        bita #$80                     ; $2ABD bit 7,a
        lbeq G_2AE3                   ; $2ABF jr z,pc+r8
        lda $9D25                     ; $2AC1 ld a,[a16]
        suba #$08                     ; $2AC4 sub d8
        sta <rB                       ; $2AC6 ld b,a
        lda $9D45                     ; $2AC7 ld a,[a16]
        suba <rB                      ; $2ACA sub b
        lbcc G_2ACF                   ; $2ACB jr nc,pc+r8
        eora #$FF                     ; $2ACD cpl
        inca                          ; $2ACE inc a
G_2ACF
        lsla                          ; $2ACF sla a
        adda #$38                     ; $2AD1 add d8
        sta <rB                       ; $2AD3 ld b,a
        lda $9D47                     ; $2AD4 ld a,[a16]
        cmpa <rB                      ; $2AD7 cp b
        lbcc G_2AE3                   ; $2AD8 jr nc,pc+r8
G_2ADA
        lda #$02                      ; $2ADA ld a,d8
        sta $9FB5                     ; $2ADC ldh [a8],a
        sta $9FB9                     ; $2ADE ldh [a8],a
        ldb #$00                      ; $2AE0 ld c,d8
        stb <rC                       
        rts                           ; $2AE2 ret
G_2AE3
        lda $9DB0                     ; $2AE3 ld a,[a16]
        ldx #$9D43                    ; $2AE6 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2AE9 cp [hl]
        cmpa ,x                       
        lbcs G_2B0F                   ; $2AEA jr c,pc+r8
        ldb #$40                      ; $2AEC ld b,d8
        stb <rB                       
        lda $9D43                     ; $2AEE ld a,[a16]
        ldx #$9D23                    ; $2AF1 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2AF4 sub [hl]
        suba ,x                       
        lbcs G_2B11                   ; $2AF5 jr c,pc+r8
        cmpa #$08                     ; $2AF7 cp d8
        lbcs G_2AFB                   ; $2AF9 jr c,pc+r8
G_2AFB
        ldb #$40                      ; $2AFB ld b,d8
        stb <rB                       
        lda $9D43                     ; $2AFD ld a,[a16]
        ldx #$9D23                    ; $2B00 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $2B03 sub [hl]
        suba ,x                       
        cmpa #$18                     ; $2B04 cp d8
        lbcc G_2B0F                   ; $2B06 jr nc,pc+r8
        lda $9D47                     ; $2B08 ld a,[a16]
        bita #$80                     ; $2B0B bit 7,a
        lbne G_2B11                   ; $2B0D jr nz,pc+r8
G_2B0F
        ldb #$00                      ; $2B0F ld b,d8
        stb <rB                       
G_2B11
        ldx <rB                       ; $2B11 push bc
        pshs x                        
        jsr G_08A6                    ; $2B12 call a16
        jsr G_1722                    ; $2B15 call a16
        lda $9D25                     ; $2B18 ld a,[a16]
        suba <rH                      ; $2B1B sub h
        ldb #$20                      ; $2B1C ld c,d8
        stb <rC                       
        bita #$80                     ; $2B1E bit 7,a
        lbeq G_2B24                   ; $2B20 jr z,pc+r8
        ldb #$10                      ; $2B22 ld c,d8
        stb <rC                       
G_2B24
        cmpa #$04                     ; $2B24 cp d8
        lbcs G_2B2C                   ; $2B26 jr c,pc+r8
        cmpa #$0C                     ; $2B28 cp d8
        lbcc G_2B2E                   ; $2B2A jr nc,pc+r8
G_2B2C
        ldb #$00                      ; $2B2C ld c,d8
        stb <rC                       
G_2B2E
        lda <rC                       ; $2B2E ld a,c
        puls x                        ; $2B2F pop bc
        stx <rB                       
        ora <rB                       ; $2B30 or b
        sta <rC                       ; $2B31 ld c,a
        rts                           ; $2B32 ret
G_3047
        lsla                          ; $3047 add a
        sta <rE                       ; $3048 ld e,a
        ldb #$00                      ; $3049 ld d,d8
        stb <rD                       
        pshs a                        ; $304B add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
        ldx <rH                       ; $304C ld a,[hl+]
        lda ,x+                       
        stx <rH                       
        ldx <rH                       ; $304D ld h,[hl]
        ldb ,x                        
        stb <rH                       
        sta <rL                       ; $304E ld l,a
        rts                           ; $304F ret
G_308F
        ldb #$00                      ; $308F ld d,d8
        stb <rD                       
        ldx #$0000                    ; $3091 ld hl,d16
        stx <rH                       
        lsra                          ; $3094 rrca
        bcc _s105                     
        ora #$80                      
_s105
        lbcc G_3098                   ; $3095 jr nc,pc+r8
        pshs a                        ; $3097 add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
G_3098
        lsl <rE                       ; $3098 sla e
        rol <rD                       ; $309A rl d
        lsra                          ; $309C rrca
        bcc _s106                     
        ora #$80                      
_s106
        lbcc G_30A0                   ; $309D jr nc,pc+r8
        pshs a                        ; $309F add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
G_30A0
        lsl <rE                       ; $30A0 sla e
        rol <rD                       ; $30A2 rl d
        lsra                          ; $30A4 rrca
        bcc _s107                     
        ora #$80                      
_s107
        lbcc G_30A8                   ; $30A5 jr nc,pc+r8
        pshs a                        ; $30A7 add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
G_30A8
        lsl <rE                       ; $30A8 sla e
        rol <rD                       ; $30AA rl d
        lsra                          ; $30AC rrca
        bcc _s108                     
        ora #$80                      
_s108
        lbcc G_30B0                   ; $30AD jr nc,pc+r8
        pshs a                        ; $30AF add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
G_30B0
        lsl <rE                       ; $30B0 sla e
        rol <rD                       ; $30B2 rl d
        lsra                          ; $30B4 rrca
        bcc _s109                     
        ora #$80                      
_s109
        lbcc G_30B8                   ; $30B5 jr nc,pc+r8
        pshs a                        ; $30B7 add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
G_30B8
        lsl <rE                       ; $30B8 sla e
        rol <rD                       ; $30BA rl d
        lsra                          ; $30BC rrca
        bcc _s110                     
        ora #$80                      
_s110
        lbcc G_30C0                   ; $30BD jr nc,pc+r8
        pshs a                        ; $30BF add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
G_30C0
        lsl <rE                       ; $30C0 sla e
        rol <rD                       ; $30C2 rl d
        lsra                          ; $30C4 rrca
        bcc _s111                     
        ora #$80                      
_s111
        lbcc G_30C8                   ; $30C5 jr nc,pc+r8
        pshs a                        ; $30C7 add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
G_30C8
        lsl <rE                       ; $30C8 sla e
        rol <rD                       ; $30CA rl d
        lsra                          ; $30CC rrca
        bcc _s112                     
        ora #$80                      
_s112
        bcs _s113                     ; $30CD ret nc
        rts                           
_s113
        pshs a                        ; $30CE add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
        rts                           ; $30CF ret
G_30D0
        ldx <rH                       ; $30D0 push hl
        pshs x                        
        puls x                        ; $30D1 pop de
        stx <rD                       
        sta $9FC7                     ; $30D2 ldh [a8],a
        clra                          ; $30D4 xor a
        sta $9FC8                     ; $30D5 ldh [a8],a
        sta <rC                       ; $30D7 ld c,a
        sta <rH                       ; $30D8 ld h,a
        sta <rL                       ; $30D9 ld l,a
        lda $9FC7                     ; $30DA ldh a,[a8]
        ldb #$08                      ; $30DC ld b,d8
        stb <rB                       
G_30DE
        lsra                          ; $30DE rrca
        bcc _s114                     
        ora #$80                      
_s114
        lbcc G_30EB                   ; $30DF jr nc,pc+r8
        pshs a                        ; $30E1 add hl,de
        ldd <rH                       
        addd <rD                      
        std <rH                       
        puls a                        
        sta $9FC7                     ; $30E2 ldh [a8],a
        lda $9FC8                     ; $30E4 ldh a,[a8]
        adca <rC                      ; $30E6 adc c
        sta $9FC8                     ; $30E7 ldh [a8],a
        lda $9FC7                     ; $30E9 ldh a,[a8]
G_30EB
        lsl <rE                       ; $30EB sla e
        rol <rD                       ; $30ED rl d
        rol <rC                       ; $30EF rl c
        dec <rB                       ; $30F1 dec b
        lbne G_30DE                   ; $30F2 jr nz,pc+r8
        lda $9FC8                     ; $30F4 ldh a,[a8]
        sta <rC                       ; $30F6 ld c,a
        rts                           ; $30F7 ret
G_3120
        ldx <rH                       ; $3120 push hl
        pshs x                        
        ldx <rD                       ; $3121 push de
        pshs x                        
        lda <rD                       ; $3122 ld a,d
        jsr G_30D0                    ; $3123 call a16
        lda <rL                       ; $3126 ld a,l
        sta $9FC9                     ; $3127 ldh [a8],a
        lda <rH                       ; $3129 ld a,h
        sta $9FCA                     ; $312A ldh [a8],a
        lda <rC                       ; $312C ld a,c
        sta $9FCB                     ; $312D ldh [a8],a
        puls x                        ; $312F pop de
        stx <rD                       
        puls x                        ; $3130 pop hl
        stx <rH                       
        lda <rE                       ; $3131 ld a,e
        jsr G_30D0                    ; $3132 call a16
        lda $9FC9                     ; $3135 ldh a,[a8]
        adda <rH                      ; $3137 add h
        sta <rH                       ; $3138 ld h,a
        lda $9FCA                     ; $3139 ldh a,[a8]
        adca <rC                      ; $313B adc c
        sta <rC                       ; $313C ld c,a
        lda $9FCB                     ; $313D ldh a,[a8]
        adca #$00                     ; $313F adc d8
        sta <rB                       ; $3141 ld b,a
        rts                           ; $3142 ret
G_3143
        sta <rC                       ; $3143 ld c,a
        clra                          ; $3144 xor a
        pshs a                        ; $3145 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $3146 rla
        lbcs G_314C                   ; $3147 jr c,pc+r8
        cmpa <rC                      ; $3149 cp c
        lbcs G_314E                   ; $314A jr c,pc+r8
G_314C
        suba <rC                      ; $314C sub c
        inc <rL                       ; $314D inc l
G_314E
        pshs a                        ; $314E add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $314F rla
        lbcs G_3155                   ; $3150 jr c,pc+r8
        cmpa <rC                      ; $3152 cp c
        lbcs G_3157                   ; $3153 jr c,pc+r8
G_3155
        suba <rC                      ; $3155 sub c
        inc <rL                       ; $3156 inc l
G_3157
        pshs a                        ; $3157 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $3158 rla
        lbcs G_315E                   ; $3159 jr c,pc+r8
        cmpa <rC                      ; $315B cp c
        lbcs G_3160                   ; $315C jr c,pc+r8
G_315E
        suba <rC                      ; $315E sub c
        inc <rL                       ; $315F inc l
G_3160
        pshs a                        ; $3160 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $3161 rla
        lbcs G_3167                   ; $3162 jr c,pc+r8
        cmpa <rC                      ; $3164 cp c
        lbcs G_3169                   ; $3165 jr c,pc+r8
G_3167
        suba <rC                      ; $3167 sub c
        inc <rL                       ; $3168 inc l
G_3169
        pshs a                        ; $3169 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $316A rla
        lbcs G_3170                   ; $316B jr c,pc+r8
        cmpa <rC                      ; $316D cp c
        lbcs G_3172                   ; $316E jr c,pc+r8
G_3170
        suba <rC                      ; $3170 sub c
        inc <rL                       ; $3171 inc l
G_3172
        pshs a                        ; $3172 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $3173 rla
        lbcs G_3179                   ; $3174 jr c,pc+r8
        cmpa <rC                      ; $3176 cp c
        lbcs G_317B                   ; $3177 jr c,pc+r8
G_3179
        suba <rC                      ; $3179 sub c
        inc <rL                       ; $317A inc l
G_317B
        pshs a                        ; $317B add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $317C rla
        lbcs G_3182                   ; $317D jr c,pc+r8
        cmpa <rC                      ; $317F cp c
        lbcs G_3184                   ; $3180 jr c,pc+r8
G_3182
        suba <rC                      ; $3182 sub c
        inc <rL                       ; $3183 inc l
G_3184
        pshs a                        ; $3184 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $3185 rla
        lbcs G_318B                   ; $3186 jr c,pc+r8
        cmpa <rC                      ; $3188 cp c
        lbcs G_318D                   ; $3189 jr c,pc+r8
G_318B
        suba <rC                      ; $318B sub c
        inc <rL                       ; $318C inc l
G_318D
        pshs a                        ; $318D add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $318E rla
        lbcs G_3194                   ; $318F jr c,pc+r8
        cmpa <rC                      ; $3191 cp c
        lbcs G_3196                   ; $3192 jr c,pc+r8
G_3194
        suba <rC                      ; $3194 sub c
        inc <rL                       ; $3195 inc l
G_3196
        pshs a                        ; $3196 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $3197 rla
        lbcs G_319D                   ; $3198 jr c,pc+r8
        cmpa <rC                      ; $319A cp c
        lbcs G_319F                   ; $319B jr c,pc+r8
G_319D
        suba <rC                      ; $319D sub c
        inc <rL                       ; $319E inc l
G_319F
        pshs a                        ; $319F add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $31A0 rla
        lbcs G_31A6                   ; $31A1 jr c,pc+r8
        cmpa <rC                      ; $31A3 cp c
        lbcs G_31A8                   ; $31A4 jr c,pc+r8
G_31A6
        suba <rC                      ; $31A6 sub c
        inc <rL                       ; $31A7 inc l
G_31A8
        pshs a                        ; $31A8 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $31A9 rla
        lbcs G_31AF                   ; $31AA jr c,pc+r8
        cmpa <rC                      ; $31AC cp c
        lbcs G_31B1                   ; $31AD jr c,pc+r8
G_31AF
        suba <rC                      ; $31AF sub c
        inc <rL                       ; $31B0 inc l
G_31B1
        pshs a                        ; $31B1 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $31B2 rla
        lbcs G_31B8                   ; $31B3 jr c,pc+r8
        cmpa <rC                      ; $31B5 cp c
        lbcs G_31BA                   ; $31B6 jr c,pc+r8
G_31B8
        suba <rC                      ; $31B8 sub c
        inc <rL                       ; $31B9 inc l
G_31BA
        pshs a                        ; $31BA add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $31BB rla
        lbcs G_31C1                   ; $31BC jr c,pc+r8
        cmpa <rC                      ; $31BE cp c
        lbcs G_31C3                   ; $31BF jr c,pc+r8
G_31C1
        suba <rC                      ; $31C1 sub c
        inc <rL                       ; $31C2 inc l
G_31C3
        pshs a                        ; $31C3 add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $31C4 rla
        lbcs G_31CA                   ; $31C5 jr c,pc+r8
        cmpa <rC                      ; $31C7 cp c
        lbcs G_31CC                   ; $31C8 jr c,pc+r8
G_31CA
        suba <rC                      ; $31CA sub c
        inc <rL                       ; $31CB inc l
G_31CC
        pshs a                        ; $31CC add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rola                          ; $31CD rla
        lbcs G_31D2                   ; $31CE jr c,pc+r8
        cmpa <rC                      ; $31D0 cp c
        bcc _s115                     ; $31D1 ret c
        rts                           
_s115
G_31D2
        suba <rC                      ; $31D2 sub c
        inc <rL                       ; $31D3 inc l
        rts                           ; $31D4 ret
G_31D5
        clra                          ; $31D5 xor a
        sta <rC                       ; $31D6 ld c,a
        sta $9FC7                     ; $31D7 ldh [a8],a
        ldb #$10                      ; $31D9 ld b,d8
        stb <rB                       
G_31DB
        pshs a                        ; $31DB add hl,hl
        ldd <rH                       
        addd <rH                      
        std <rH                       
        puls a                        
        rol <rC                       ; $31DC rl c
        lda $9FC7                     ; $31DE ldh a,[a8]
        rola                          ; $31E0 rla
        sta $9FC7                     ; $31E1 ldh [a8],a
        lda <rC                       ; $31E3 ld a,c
        suba <rE                      ; $31E4 sub e
        sta $9FC8                     ; $31E5 ldh [a8],a
        lda $9FC7                     ; $31E7 ldh a,[a8]
        sbca <rD                      ; $31E9 sbc d
        lbcs G_31F2                   ; $31EA jr c,pc+r8
        sta $9FC7                     ; $31EC ldh [a8],a
        lda $9FC8                     ; $31EE ldh a,[a8]
        sta <rC                       ; $31F0 ld c,a
        inc <rL                       ; $31F1 inc l
G_31F2
        dec <rB                       ; $31F2 dec b
        lbne G_31DB                   ; $31F3 jr nz,pc+r8
        lda $9FC7                     ; $31F5 ldh a,[a8]
        sta <rB                       ; $31F7 ld b,a
        rts                           ; $31F8 ret
G_3297
        ldx #$9DDB                    ; $3297 ld hl,d16
        stx <rH                       
        lda #$01                      ; $329A ld a,d8
        ldx <rH                       ; $329C ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $329D ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $329E ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $329F ld [hl+],a
        sta ,x+                       
        stx <rH                       
        sta $9DE6                     ; $32A0 ld [a16],a
        ldx <rH                       ; $32A3 inc hl
        leax 1,x                      
        stx <rH                       
        clra                          ; $32A4 xor a
        ldx <rH                       ; $32A5 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $32A6 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $32A7 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $32A8 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $32A9 ld [hl+],a
        sta ,x+                       
        stx <rH                       
        ldx <rH                       ; $32AA ld [hl+],a
        sta ,x+                       
        stx <rH                       
        lda $9FAF                     ; $32AB ldh a,[a8]
        bita #$80                     ; $32AD bit 7,a
        bne _s116                     ; $32AF ret z
        rts                           
_s116
        anda #$01                     ; $32B0 and d8
        sta $9DDC                     ; $32B2 ld [a16],a
        sta $9DE6                     ; $32B5 ld [a16],a
        rts                           ; $32B8 ret
G_32B9
        lda $9D40                     ; $32B9 ld a,[a16]
        suba #$02                     ; $32BC sub d8
        bcc _s117                     ; $32BE ret c
        rts                           
_s117
        cmpa #$03                     ; $32BF cp d8
        bcs _s118                     ; $32C1 ret nc
        rts                           
_s118
        ldx #$9FC2                    ; $32C2 ld hl,d16
        stx <rH                       
        ldx <rH                       ; $32C5 res 6,[hl]
        ldb ,x                        
        andb #$BF                     
        stb ,x                        
        rts                           ; $32C7 ret
G_32C8
        ldb #$C1                      ; $32C8 ld b,d8
        stb <rB                       
        ldx #$9DDD                    ; $32CA ld hl,d16
        stx <rH                       
        lda $9DDE                     ; $32CD ld a,[a16]
        ldx <rH                       ; $32D0 cp [hl]
        cmpa ,x                       
        lbne G_32D9                   ; $32D1 jr nz,pc+r8
        cmpa #$01                     ; $32D3 cp d8
        lbne G_32D9                   ; $32D5 jr nz,pc+r8
        ldb #$00                      ; $32D7 ld b,d8
        stb <rB                       
G_32D9
        lda <rB                       ; $32D9 ld a,b
        sta $9FC2                     ; $32DA ldh [a8],a
        rts                           ; $32DC ret

; --- Données de la ROM lues par la logique ---
D_0B35
        fcb (D_0B3D)&255,(D_0B3D)>>8
        fcb (D_0B4D)&255,(D_0B4D)>>8
        fcb (D_0B5D)&255,(D_0B5D)>>8
        fcb (D_0B6D)&255,(D_0B6D)>>8
D_0B3D
        fcb $94,$05,$70,$00,$1E,$3C,$58,$0A,$14,$3C,$0A,$14,$0A,$14,$14,$05
D_0B4D
        fcb $A0,$0A,$A0,$00,$28,$32,$80,$0A,$46,$0A,$0A,$1E,$0A,$14,$14,$00
D_0B5D
        fcb $A0,$14,$C0,$00,$46,$3C,$90,$0A,$14,$1E,$0A,$14,$0A,$0A,$32,$05
D_0B6D
        fcb $B0,$1E,$E0,$00,$50,$32,$A0,$05,$1E,$0A,$05,$14,$28,$0A,$32,$05
