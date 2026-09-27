; Disassembly of "tennis.gb"
; This file was created with:
; mgbdis v3.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $000", ROM0[$0]

RST_00::
    jp Jump_000_0150                              ; $0000: $c3 $50 $01


    rst RST_38                                    ; $0003: $ff
    rst RST_38                                    ; $0004: $ff
    rst RST_38                                    ; $0005: $ff
    rst RST_38                                    ; $0006: $ff
    rst RST_38                                    ; $0007: $ff

RST_08::
    pop hl                                        ; $0008: $e1
    add a                                         ; $0009: $87
    ld e, a                                       ; $000a: $5f
    ld d, $00                                     ; $000b: $16 $00
    add hl, de                                    ; $000d: $19
    ld a, [hl+]                                   ; $000e: $2a
    ld h, [hl]                                    ; $000f: $66

RST_10::
    ld l, a                                       ; $0010: $6f
    jp hl                                         ; $0011: $e9


    rst RST_38                                    ; $0012: $ff
    rst RST_38                                    ; $0013: $ff
    rst RST_38                                    ; $0014: $ff
    rst RST_38                                    ; $0015: $ff
    rst RST_38                                    ; $0016: $ff
    rst RST_38                                    ; $0017: $ff

RST_18::
    pop hl                                        ; $0018: $e1
    ld c, a                                       ; $0019: $4f
    ld b, $00                                     ; $001a: $06 $00
    ld a, [hl+]                                   ; $001c: $2a
    push hl                                       ; $001d: $e5
    add hl, bc                                    ; $001e: $09
    ld c, a                                       ; $001f: $4f

RST_20::
    ld a, [hl]                                    ; $0020: $7e
    pop hl                                        ; $0021: $e1
    add hl, bc                                    ; $0022: $09
    jp hl                                         ; $0023: $e9


    rst RST_38                                    ; $0024: $ff
    rst RST_38                                    ; $0025: $ff
    rst RST_38                                    ; $0026: $ff
    rst RST_38                                    ; $0027: $ff

RST_28::
    pop hl                                        ; $0028: $e1
    ld a, [hl+]                                   ; $0029: $2a
    ld b, a                                       ; $002a: $47

jr_000_002b:
    ld a, [hl+]                                   ; $002b: $2a
    ld [de], a                                    ; $002c: $12
    inc de                                        ; $002d: $13
    dec b                                         ; $002e: $05
    db $20                                        ; $002f: $20

RST_30::
    ld a, [$ffe9]                                 ; $0030: $fa $e9 $ff
    rst RST_38                                    ; $0033: $ff
    rst RST_38                                    ; $0034: $ff
    rst RST_38                                    ; $0035: $ff
    rst RST_38                                    ; $0036: $ff
    rst RST_38                                    ; $0037: $ff

RST_38::
    rst RST_38                                    ; $0038: $ff
    rst RST_38                                    ; $0039: $ff
    rst RST_38                                    ; $003a: $ff
    rst RST_38                                    ; $003b: $ff
    rst RST_38                                    ; $003c: $ff
    rst RST_38                                    ; $003d: $ff
    rst RST_38                                    ; $003e: $ff
    rst RST_38                                    ; $003f: $ff

VBlankInterrupt::
    jp Jump_000_01f2                              ; $0040: $c3 $f2 $01


    rst RST_38                                    ; $0043: $ff
    rst RST_38                                    ; $0044: $ff
    rst RST_38                                    ; $0045: $ff
    rst RST_38                                    ; $0046: $ff
    rst RST_38                                    ; $0047: $ff

LCDCInterrupt::
    jp Jump_000_0244                              ; $0048: $c3 $44 $02


    rst RST_38                                    ; $004b: $ff
    rst RST_38                                    ; $004c: $ff
    rst RST_38                                    ; $004d: $ff
    rst RST_38                                    ; $004e: $ff
    rst RST_38                                    ; $004f: $ff

TimerOverflowInterrupt::
    jp Jump_000_025f                              ; $0050: $c3 $5f $02


    rst RST_38                                    ; $0053: $ff
    rst RST_38                                    ; $0054: $ff
    rst RST_38                                    ; $0055: $ff
    rst RST_38                                    ; $0056: $ff
    rst RST_38                                    ; $0057: $ff

SerialTransferCompleteInterrupt::
    jp Jump_000_0260                              ; $0058: $c3 $60 $02


    rst RST_38                                    ; $005b: $ff
    rst RST_38                                    ; $005c: $ff
    rst RST_38                                    ; $005d: $ff
    rst RST_38                                    ; $005e: $ff
    rst RST_38                                    ; $005f: $ff

JoypadTransitionInterrupt::
    jp Jump_000_026d                              ; $0060: $c3 $6d $02


Jump_000_0063:
    ldh a, [$ff96]                                ; $0063: $f0 $96
    and $03                                       ; $0065: $e6 $03
    db $fe                                        ; $0067: $fe

    inc bc                                        ; $0068: $03
    ld a, $00                                     ; $0069: $3e $00
    jr nz, jr_000_006f                            ; $006b: $20 $02

    ld a, $10                                     ; $006d: $3e $10

jr_000_006f:
    ldh [$ffeb], a                                ; $006f: $e0 $eb
    ldh a, [$ffaa]                                ; $0071: $f0 $aa
    ld e, a                                       ; $0073: $5f
    ld a, b                                       ; $0074: $78
    sub e                                         ; $0075: $93
    add $10                                       ; $0076: $c6 $10
    ld b, a                                       ; $0078: $47
    ldh a, [$ffa8]                                ; $0079: $f0 $a8
    ld e, a                                       ; $007b: $5f
    ld a, c                                       ; $007c: $79
    sub e                                         ; $007d: $93
    add $08                                       ; $007e: $c6 $08
    ld c, a                                       ; $0080: $4f
    ld a, [$dea0]                                 ; $0081: $fa $a0 $de
    cp $a0                                        ; $0084: $fe $a0
    ret z                                         ; $0086: $c8

    ld e, a                                       ; $0087: $5f
    ld d, $de                                     ; $0088: $16 $de

jr_000_008a:
    ld a, [hl+]                                   ; $008a: $2a
    cp $80                                        ; $008b: $fe $80
    jr z, jr_000_00a4                             ; $008d: $28 $15

    add b                                         ; $008f: $80
    ld [de], a                                    ; $0090: $12
    inc e                                         ; $0091: $1c
    ld a, [hl+]                                   ; $0092: $2a
    add c                                         ; $0093: $81
    ld [de], a                                    ; $0094: $12
    inc e                                         ; $0095: $1c
    ld a, [hl+]                                   ; $0096: $2a
    ld [de], a                                    ; $0097: $12
    inc e                                         ; $0098: $1c
    ldh a, [$ffeb]                                ; $0099: $f0 $eb
    xor [hl]                                      ; $009b: $ae
    inc hl                                        ; $009c: $23
    ld [de], a                                    ; $009d: $12
    inc e                                         ; $009e: $1c
    ld a, e                                       ; $009f: $7b
    cp $a0                                        ; $00a0: $fe $a0
    jr nz, jr_000_008a                            ; $00a2: $20 $e6

jr_000_00a4:
    ld a, e                                       ; $00a4: $7b
    ld [$dea0], a                                 ; $00a5: $ea $a0 $de
    ret                                           ; $00a8: $c9


Call_000_00a9:
    push bc                                       ; $00a9: $c5
    ldh a, [$ffa4]                                ; $00aa: $f0 $a4
    ld b, a                                       ; $00ac: $47
    add a                                         ; $00ad: $87
    add a                                         ; $00ae: $87
    add b                                         ; $00af: $80
    add $0b                                       ; $00b0: $c6 $0b
    ldh [$ffa4], a                                ; $00b2: $e0 $a4
    pop bc                                        ; $00b4: $c1
    ret                                           ; $00b5: $c9


Call_000_00b6:
    ld b, $00                                     ; $00b6: $06 $00

jr_000_00b8:
    sub $0a                                       ; $00b8: $d6 $0a
    jr c, jr_000_00bf                             ; $00ba: $38 $03

    inc b                                         ; $00bc: $04
    jr jr_000_00b8                                ; $00bd: $18 $f9

jr_000_00bf:
    add $0a                                       ; $00bf: $c6 $0a
    ld c, a                                       ; $00c1: $4f
    ret                                           ; $00c2: $c9


Call_000_00c3:
    ld a, l                                       ; $00c3: $7d
    sub e                                         ; $00c4: $93
    ld e, a                                       ; $00c5: $5f
    ld a, h                                       ; $00c6: $7c
    sbc d                                         ; $00c7: $9a
    ld d, a                                       ; $00c8: $57
    ret                                           ; $00c9: $c9


Call_000_00ca:
    cp $64                                        ; $00ca: $fe $64
    ret nc                                        ; $00cc: $d0

    ld b, a                                       ; $00cd: $47
    srl b                                         ; $00ce: $cb $38
    add a                                         ; $00d0: $87
    add b                                         ; $00d1: $80
    ld l, a                                       ; $00d2: $6f
    call Call_000_00a9                            ; $00d3: $cd $a9 $00
    cp l                                          ; $00d6: $bd
    ccf                                           ; $00d7: $3f
    ret                                           ; $00d8: $c9


Call_000_00d9:
    cp $64                                        ; $00d9: $fe $64
    ret nc                                        ; $00db: $d0

    ld b, a                                       ; $00dc: $47
    srl b                                         ; $00dd: $cb $38
    add a                                         ; $00df: $87
    add b                                         ; $00e0: $80
    ld l, a                                       ; $00e1: $6f
    ldh a, [$ffa4]                                ; $00e2: $f0 $a4
    cp l                                          ; $00e4: $bd
    ccf                                           ; $00e5: $3f
    ret                                           ; $00e6: $c9


    rst RST_38                                    ; $00e7: $ff
    rst RST_38                                    ; $00e8: $ff
    rst RST_38                                    ; $00e9: $ff
    rst RST_38                                    ; $00ea: $ff
    rst RST_38                                    ; $00eb: $ff
    rst RST_38                                    ; $00ec: $ff
    rst RST_38                                    ; $00ed: $ff
    rst RST_38                                    ; $00ee: $ff
    rst RST_38                                    ; $00ef: $ff
    rst RST_38                                    ; $00f0: $ff
    rst RST_38                                    ; $00f1: $ff
    rst RST_38                                    ; $00f2: $ff
    rst RST_38                                    ; $00f3: $ff
    rst RST_38                                    ; $00f4: $ff
    rst RST_38                                    ; $00f5: $ff
    rst RST_38                                    ; $00f6: $ff
    rst RST_38                                    ; $00f7: $ff
    rst RST_38                                    ; $00f8: $ff
    rst RST_38                                    ; $00f9: $ff
    rst RST_38                                    ; $00fa: $ff
    rst RST_38                                    ; $00fb: $ff
    rst RST_38                                    ; $00fc: $ff
    rst RST_38                                    ; $00fd: $ff
    rst RST_38                                    ; $00fe: $ff
    rst RST_38                                    ; $00ff: $ff

Boot::
    nop                                           ; $0100: $00
    jp Jump_000_0150                              ; $0101: $c3 $50 $01


HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "TENNIS", $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

HeaderNewLicenseeCode::
    db $00, $00

HeaderSGBFlag::
    db $00

HeaderCartridgeType::
    db $00

HeaderROMSize::
    db $00

HeaderRAMSize::
    db $00

HeaderDestinationCode::
    db $00

HeaderOldLicenseeCode::
    db $01

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $15

HeaderGlobalChecksum::
    db $3f, $ab

Jump_000_0150:
    ld sp, $dfff                                  ; $0150: $31 $ff $df
    call Call_000_2f78                            ; $0153: $cd $78 $2f
    call Call_000_2fcb                            ; $0156: $cd $cb $2f
    call Call_000_3027                            ; $0159: $cd $27 $30
    ld a, $e4                                     ; $015c: $3e $e4
    ldh [rBGP], a                                 ; $015e: $e0 $47
    ld a, $e4                                     ; $0160: $3e $e4
    ldh [rOBP0], a                                ; $0162: $e0 $48
    ld a, $c4                                     ; $0164: $3e $c4
    ldh [rOBP1], a                                ; $0166: $e0 $49
    ld a, $01                                     ; $0168: $3e $01
    ld [$c0df], a                                 ; $016a: $ea $df $c0

Jump_000_016d:
    ld sp, $dfff                                  ; $016d: $31 $ff $df
    di                                            ; $0170: $f3
    xor a                                         ; $0171: $af
    call Call_000_2f67                            ; $0172: $cd $67 $2f
    ld a, $80                                     ; $0175: $3e $80
    ldh [rLCDC], a                                ; $0177: $e0 $40
    call Call_000_2f78                            ; $0179: $cd $78 $2f
    call Call_000_361c                            ; $017c: $cd $1c $36
    call Call_000_3001                            ; $017f: $cd $01 $30
    ld hl, $62d6                                  ; $0182: $21 $d6 $62
    ld de, $8000                                  ; $0185: $11 $00 $80
    ld bc, $0800                                  ; $0188: $01 $00 $08
    call Call_000_303e                            ; $018b: $cd $3e $30
    ld hl, $5ad6                                  ; $018e: $21 $d6 $5a
    ld bc, $0800                                  ; $0191: $01 $00 $08
    call Call_000_303e                            ; $0194: $cd $3e $30
    ld hl, $52d6                                  ; $0197: $21 $d6 $52
    ld bc, $0800                                  ; $019a: $01 $00 $08
    call Call_000_303e                            ; $019d: $cd $3e $30
    ldh a, [$ff96]                                ; $01a0: $f0 $96
    and $03                                       ; $01a2: $e6 $03
    cp $03                                        ; $01a4: $fe $03
    jr nz, jr_000_01bd                            ; $01a6: $20 $15

    ld hl, $69f6                                  ; $01a8: $21 $f6 $69
    ld de, $8000                                  ; $01ab: $11 $00 $80
    ld bc, $0220                                  ; $01ae: $01 $20 $02
    call Call_000_303e                            ; $01b1: $cd $3e $30
    ld de, $8400                                  ; $01b4: $11 $00 $84
    ld bc, $0300                                  ; $01b7: $01 $00 $03
    call Call_000_303e                            ; $01ba: $cd $3e $30

jr_000_01bd:
    call Call_000_3010                            ; $01bd: $cd $10 $30
    ld hl, $ffa6                                  ; $01c0: $21 $a6 $ff
    ld a, $03                                     ; $01c3: $3e $03
    ld [hl+], a                                   ; $01c5: $22
    xor a                                         ; $01c6: $af
    ld [hl+], a                                   ; $01c7: $22
    ld [hl+], a                                   ; $01c8: $22
    ld [hl+], a                                   ; $01c9: $22
    ld [hl], a                                    ; $01ca: $77
    ldh [$ffa1], a                                ; $01cb: $e0 $a1
    ldh [$ffa2], a                                ; $01cd: $e0 $a2
    ldh [$ffa3], a                                ; $01cf: $e0 $a3
    ldh [$ff99], a                                ; $01d1: $e0 $99
    ldh [$ff9b], a                                ; $01d3: $e0 $9b
    ldh [$ff9d], a                                ; $01d5: $e0 $9d
    ldh [$ff8d], a                                ; $01d7: $e0 $8d
    ldh a, [$ff8a]                                ; $01d9: $f0 $8a
    rst RST_08                                    ; $01db: $cf

    db $6e, $02, $e3, $02, $b4, $02, $f2, $02, $3f, $03, $32, $04, $32, $04, $9d, $04
    db $f5, $02, $a3, $03, $a3, $03

Jump_000_01f2:
    push af                                       ; $01f2: $f5
    push bc                                       ; $01f3: $c5
    push de                                       ; $01f4: $d5
    push hl                                       ; $01f5: $e5
    ldh a, [$ff8c]                                ; $01f6: $f0 $8c
    and a                                         ; $01f8: $a7
    jp nz, Jump_000_023f                          ; $01f9: $c2 $3f $02

    call Call_000_2fc8                            ; $01fc: $cd $c8 $2f
    ld a, $40                                     ; $01ff: $3e $40
    ldh [$ff8c], a                                ; $0201: $e0 $8c
    ld [$dea0], a                                 ; $0203: $ea $a0 $de
    ldh a, [$ff8b]                                ; $0206: $f0 $8b
    rst RST_08                                    ; $0208: $cf

    db $a3, $04, $ec, $05, $d2, $05, $37, $06, $37, $06, $44, $06, $47, $06

Jump_000_0217:
    ld a, [$dea0]                                 ; $0217: $fa $a0 $de
    call Call_000_3011                            ; $021a: $cd $11 $30
    call Call_000_21ed                            ; $021d: $cd $ed $21
    ldh a, [$ff8b]                                ; $0220: $f0 $8b
    cp $01                                        ; $0222: $fe $01
    jr nz, jr_000_0237                            ; $0224: $20 $11

    call Call_000_0766                            ; $0226: $cd $66 $07
    jr z, jr_000_0237                             ; $0229: $28 $0c

    ldh a, [$ff98]                                ; $022b: $f0 $98
    cp $0f                                        ; $022d: $fe $0f
    jr nz, jr_000_0237                            ; $022f: $20 $06

    ldh a, [$ff99]                                ; $0231: $f0 $99
    and a                                         ; $0233: $a7
    jp nz, Jump_000_0150                          ; $0234: $c2 $50 $01

jr_000_0237:
    xor a                                         ; $0237: $af
    ldh [$ff8c], a                                ; $0238: $e0 $8c
    pop hl                                        ; $023a: $e1
    pop de                                        ; $023b: $d1
    pop bc                                        ; $023c: $c1
    pop af                                        ; $023d: $f1
    reti                                          ; $023e: $d9


Jump_000_023f:
    pop hl                                        ; $023f: $e1
    pop de                                        ; $0240: $d1
    pop bc                                        ; $0241: $c1
    pop af                                        ; $0242: $f1
    reti                                          ; $0243: $d9


Jump_000_0244:
    push af                                       ; $0244: $f5
    ldh a, [$ff91]                                ; $0245: $f0 $91
    bit 1, a                                      ; $0247: $cb $4f
    jr nz, jr_000_025d                            ; $0249: $20 $12

jr_000_024b:
    ldh a, [rSTAT]                                ; $024b: $f0 $41
    and $03                                       ; $024d: $e6 $03
    jr z, jr_000_024b                             ; $024f: $28 $fa

jr_000_0251:
    ldh a, [rSTAT]                                ; $0251: $f0 $41
    and $03                                       ; $0253: $e6 $03
    jr nz, jr_000_0251                            ; $0255: $20 $fa

    ldh a, [rLCDC]                                ; $0257: $f0 $40
    res 5, a                                      ; $0259: $cb $af
    ldh [rLCDC], a                                ; $025b: $e0 $40

jr_000_025d:
    pop af                                        ; $025d: $f1
    reti                                          ; $025e: $d9


Jump_000_025f:
    reti                                          ; $025f: $d9


Jump_000_0260:
    push af                                       ; $0260: $f5
    push bc                                       ; $0261: $c5
    push de                                       ; $0262: $d5
    push hl                                       ; $0263: $e5
    ei                                            ; $0264: $fb
    call Call_000_076d                            ; $0265: $cd $6d $07
    pop hl                                        ; $0268: $e1
    pop de                                        ; $0269: $d1
    pop bc                                        ; $026a: $c1
    pop af                                        ; $026b: $f1
    reti                                          ; $026c: $d9


Jump_000_026d:
    reti                                          ; $026d: $d9


    ld hl, $71b4                                  ; $026e: $21 $b4 $71
    ld de, $8800                                  ; $0271: $11 $00 $88
    ld bc, $0500                                  ; $0274: $01 $00 $05
    call Call_000_303e                            ; $0277: $cd $3e $30
    ld hl, $76b4                                  ; $027a: $21 $b4 $76
    call Call_000_326b                            ; $027d: $cd $6b $32
    ld a, $12                                     ; $0280: $3e $12
    call Call_000_3665                            ; $0282: $cd $65 $36
    call Call_000_3670                            ; $0285: $cd $70 $36
    call Call_000_3670                            ; $0288: $cd $70 $36
    call Call_000_3670                            ; $028b: $cd $70 $36
    ld hl, $ffaf                                  ; $028e: $21 $af $ff
    res 7, [hl]                                   ; $0291: $cb $be
    ld a, $04                                     ; $0293: $3e $04
    ldh [$ff96], a                                ; $0295: $e0 $96
    xor a                                         ; $0297: $af
    ldh [$ff97], a                                ; $0298: $e0 $97
    ldh [$ff8b], a                                ; $029a: $e0 $8b
    ld a, $80                                     ; $029c: $3e $80
    ldh [$ff8d], a                                ; $029e: $e0 $8d
    call Call_000_2fed                            ; $02a0: $cd $ed $2f
    ld a, $08                                     ; $02a3: $3e $08
    call Call_000_2f67                            ; $02a5: $cd $67 $2f
    call Call_000_2f8b                            ; $02a8: $cd $8b $2f
    call Call_000_2f56                            ; $02ab: $cd $56 $2f

jr_000_02ae:
    halt                                          ; $02ae: $76
    call Call_000_00a9                            ; $02af: $cd $a9 $00
    jr jr_000_02ae                                ; $02b2: $18 $fa

    ld hl, $71b4                                  ; $02b4: $21 $b4 $71
    ld de, $8800                                  ; $02b7: $11 $00 $88
    ld bc, $0500                                  ; $02ba: $01 $00 $05
    call Call_000_303e                            ; $02bd: $cd $3e $30
    ld hl, $7785                                  ; $02c0: $21 $85 $77
    call Call_000_326b                            ; $02c3: $cd $6b $32
    call Call_000_0837                            ; $02c6: $cd $37 $08
    ld a, $08                                     ; $02c9: $3e $08
    call Call_000_2f67                            ; $02cb: $cd $67 $2f
    xor a                                         ; $02ce: $af
    ldh [$ff9f], a                                ; $02cf: $e0 $9f
    ldh [$ffa0], a                                ; $02d1: $e0 $a0
    ld a, $02                                     ; $02d3: $3e $02
    ldh [$ff8b], a                                ; $02d5: $e0 $8b
    call Call_000_2f8b                            ; $02d7: $cd $8b $2f
    call Call_000_2f56                            ; $02da: $cd $56 $2f

jr_000_02dd:
    halt                                          ; $02dd: $76
    call Call_000_00a9                            ; $02de: $cd $a9 $00
    jr jr_000_02dd                                ; $02e1: $18 $fa

    xor a                                         ; $02e3: $af
    ldh [$ffc4], a                                ; $02e4: $e0 $c4
    dec a                                         ; $02e6: $3d
    ldh [$ff95], a                                ; $02e7: $e0 $95
    ldh a, [$ff96]                                ; $02e9: $f0 $96
    and $02                                       ; $02eb: $e6 $02
    ldh [$ffba], a                                ; $02ed: $e0 $ba
    call Call_000_3297                            ; $02ef: $cd $97 $32
    call Call_000_2159                            ; $02f2: $cd $59 $21
    ldh a, [$ff96]                                ; $02f5: $f0 $96
    ldh [$ffc5], a                                ; $02f7: $e0 $c5
    ld a, [$c0e6]                                 ; $02f9: $fa $e6 $c0
    cp $0d                                        ; $02fc: $fe $0d
    jr c, jr_000_0315                             ; $02fe: $38 $15

    ld a, [$c0e7]                                 ; $0300: $fa $e7 $c0
    ld l, a                                       ; $0303: $6f
    ld h, $00                                     ; $0304: $26 $00
    ld a, $06                                     ; $0306: $3e $06
    call Call_000_3143                            ; $0308: $cd $43 $31
    bit 0, l                                      ; $030b: $cb $45
    jr z, jr_000_0315                             ; $030d: $28 $06

    ldh a, [$ffc5]                                ; $030f: $f0 $c5
    xor $02                                       ; $0311: $ee $02
    ldh [$ffc5], a                                ; $0313: $e0 $c5

jr_000_0315:
    ldh a, [$ffc5]                                ; $0315: $f0 $c5
    bit 1, a                                      ; $0317: $cb $4f
    ld b, $00                                     ; $0319: $06 $00
    jr z, jr_000_031f                             ; $031b: $28 $02

    ld b, $02                                     ; $031d: $06 $02

jr_000_031f:
    ldh a, [$ffba]                                ; $031f: $f0 $ba
    ldh [$ffbc], a                                ; $0321: $e0 $bc
    ld a, [$c0e6]                                 ; $0323: $fa $e6 $c0
    add b                                         ; $0326: $80
    ldh [$ffba], a                                ; $0327: $e0 $ba
    ldh a, [$ffaf]                                ; $0329: $f0 $af
    bit 7, a                                      ; $032b: $cb $7f
    jr nz, jr_000_033f                            ; $032d: $20 $10

    ld a, [$c0dc]                                 ; $032f: $fa $dc $c0
    cp $01                                        ; $0332: $fe $01
    jp nz, Jump_000_03a3                          ; $0334: $c2 $a3 $03

    ld a, $02                                     ; $0337: $3e $02
    ld [$c0ea], a                                 ; $0339: $ea $ea $c0
    jp Jump_000_03a3                              ; $033c: $c3 $a3 $03


jr_000_033f:
    ld hl, $6f16                                  ; $033f: $21 $16 $6f
    call Call_000_326b                            ; $0342: $cd $6b $32
    ldh a, [$ffba]                                ; $0345: $f0 $ba
    bit 1, a                                      ; $0347: $cb $4f
    ld hl, $515a                                  ; $0349: $21 $5a $51
    jr nz, jr_000_0351                            ; $034c: $20 $03

    ld hl, $5180                                  ; $034e: $21 $80 $51

jr_000_0351:
    call Call_000_326b                            ; $0351: $cd $6b $32
    call Call_000_3551                            ; $0354: $cd $51 $35
    ldh a, [$ff96]                                ; $0357: $f0 $96
    bit 2, a                                      ; $0359: $cb $57
    jr z, jr_000_0367                             ; $035b: $28 $0a

    xor a                                         ; $035d: $af
    call Call_000_3665                            ; $035e: $cd $65 $36
    call Call_000_3670                            ; $0361: $cd $70 $36
    call Call_000_3670                            ; $0364: $cd $70 $36

jr_000_0367:
    ldh a, [$ffba]                                ; $0367: $f0 $ba
    bit 1, a                                      ; $0369: $cb $4f
    ld a, $24                                     ; $036b: $3e $24
    jr z, jr_000_0371                             ; $036d: $28 $02

    ld a, $14                                     ; $036f: $3e $14

jr_000_0371:
    ldh [$ffbb], a                                ; $0371: $e0 $bb
    ldh [$ffa8], a                                ; $0373: $e0 $a8
    call Call_000_0837                            ; $0375: $cd $37 $08
    xor a                                         ; $0378: $af
    ldh [$ffa5], a                                ; $0379: $e0 $a5
    ldh [$ff9f], a                                ; $037b: $e0 $9f
    ldh [$ffa0], a                                ; $037d: $e0 $a0
    inc a                                         ; $037f: $3c
    ld [$c0da], a                                 ; $0380: $ea $da $c0
    ldh [$ff8b], a                                ; $0383: $e0 $8b
    ld a, $03                                     ; $0385: $3e $03
    ldh [$ffa6], a                                ; $0387: $e0 $a6
    ld a, $03                                     ; $0389: $3e $03
    ldh [$ff8a], a                                ; $038b: $e0 $8a
    ld a, $29                                     ; $038d: $3e $29
    ldh [rLYC], a                                 ; $038f: $e0 $45
    ld a, $40                                     ; $0391: $3e $40
    ldh [rSTAT], a                                ; $0393: $e0 $41
    ld a, $0a                                     ; $0395: $3e $0a
    call Call_000_2f67                            ; $0397: $cd $67 $2f
    call Call_000_2f56                            ; $039a: $cd $56 $2f

jr_000_039d:
    halt                                          ; $039d: $76
    call Call_000_00a9                            ; $039e: $cd $a9 $00
    jr jr_000_039d                                ; $03a1: $18 $fa

Jump_000_03a3:
    call Call_000_041a                            ; $03a3: $cd $1a $04
    ld hl, $7f7d                                  ; $03a6: $21 $7d $7f
    call Call_000_326b                            ; $03a9: $cd $6b $32
    ld hl, $520e                                  ; $03ac: $21 $0e $52
    call Call_000_326b                            ; $03af: $cd $6b $32
    call Call_000_5292                            ; $03b2: $cd $92 $52
    ld a, [$c0df]                                 ; $03b5: $fa $df $c0
    or $d0                                        ; $03b8: $f6 $d0
    ld [$984a], a                                 ; $03ba: $ea $4a $98
    ldh a, [$ff96]                                ; $03bd: $f0 $96
    and $03                                       ; $03bf: $e6 $03
    cp $03                                        ; $03c1: $fe $03
    ld hl, $c0e0                                  ; $03c3: $21 $e0 $c0
    jr nz, jr_000_03cb                            ; $03c6: $20 $03

    ld hl, $c0e3                                  ; $03c8: $21 $e3 $c0

jr_000_03cb:
    ld de, $988c                                  ; $03cb: $11 $8c $98
    call Call_000_0405                            ; $03ce: $cd $05 $04
    ldh a, [$ff96]                                ; $03d1: $f0 $96
    and $03                                       ; $03d3: $e6 $03
    cp $03                                        ; $03d5: $fe $03
    ld hl, $c0e3                                  ; $03d7: $21 $e3 $c0
    jr nz, jr_000_03df                            ; $03da: $20 $03

    ld hl, $c0e0                                  ; $03dc: $21 $e0 $c0

jr_000_03df:
    ld de, $98cc                                  ; $03df: $11 $cc $98
    call Call_000_0405                            ; $03e2: $cd $05 $04
    xor a                                         ; $03e5: $af
    ldh [$ff9f], a                                ; $03e6: $e0 $9f
    ldh [$ffa0], a                                ; $03e8: $e0 $a0
    ld [$c000], a                                 ; $03ea: $ea $00 $c0
    ld a, $06                                     ; $03ed: $3e $06
    ldh [$ff8b], a                                ; $03ef: $e0 $8b
    call Call_000_0837                            ; $03f1: $cd $37 $08
    ld a, $08                                     ; $03f4: $3e $08
    call Call_000_2f67                            ; $03f6: $cd $67 $2f
    call Call_000_2f8b                            ; $03f9: $cd $8b $2f
    call Call_000_2f56                            ; $03fc: $cd $56 $2f

jr_000_03ff:
    halt                                          ; $03ff: $76
    call Call_000_00a9                            ; $0400: $cd $a9 $00
    jr jr_000_03ff                                ; $0403: $18 $fa

Call_000_0405:
    ld a, [$c0db]                                 ; $0405: $fa $db $c0
    ld b, a                                       ; $0408: $47
    ldh a, [$ff8a]                                ; $0409: $f0 $8a
    cp $0a                                        ; $040b: $fe $0a
    jr nz, jr_000_0410                            ; $040d: $20 $01

    dec b                                         ; $040f: $05

jr_000_0410:
    ld a, [hl+]                                   ; $0410: $2a
    or $d0                                        ; $0411: $f6 $d0
    ld [de], a                                    ; $0413: $12
    inc de                                        ; $0414: $13
    inc de                                        ; $0415: $13
    dec b                                         ; $0416: $05
    jr nz, jr_000_0410                            ; $0417: $20 $f7

    ret                                           ; $0419: $c9


Call_000_041a:
    ld hl, $781d                                  ; $041a: $21 $1d $78
    ld de, $8000                                  ; $041d: $11 $00 $80
    ld bc, $0500                                  ; $0420: $01 $00 $05
    call Call_000_303e                            ; $0423: $cd $3e $30
    ld hl, $7cfd                                  ; $0426: $21 $fd $7c
    ld de, $9000                                  ; $0429: $11 $00 $90
    ld bc, $0300                                  ; $042c: $01 $00 $03
    jp Jump_000_303e                              ; $042f: $c3 $3e $30


    call Call_000_041a                            ; $0432: $cd $1a $04
    ld hl, $7f7d                                  ; $0435: $21 $7d $7f
    call Call_000_326b                            ; $0438: $cd $6b $32
    ld hl, $51a6                                  ; $043b: $21 $a6 $51
    ldh a, [$ff8a]                                ; $043e: $f0 $8a
    cp $06                                        ; $0440: $fe $06
    jr z, jr_000_0459                             ; $0442: $28 $15

    ld a, [$c0df]                                 ; $0444: $fa $df $c0
    ld hl, $51de                                  ; $0447: $21 $de $51
    cp $04                                        ; $044a: $fe $04
    jr z, jr_000_0459                             ; $044c: $28 $0b

    ld a, [$c0df]                                 ; $044e: $fa $df $c0
    or $d0                                        ; $0451: $f6 $d0
    ld [$9869], a                                 ; $0453: $ea $69 $98
    ld hl, $51b7                                  ; $0456: $21 $b7 $51

jr_000_0459:
    call Call_000_326b                            ; $0459: $cd $6b $32
    xor a                                         ; $045c: $af
    ld [$c000], a                                 ; $045d: $ea $00 $c0
    ldh a, [$ff8a]                                ; $0460: $f0 $8a
    sub $02                                       ; $0462: $d6 $02
    ldh [$ff8b], a                                ; $0464: $e0 $8b
    cp $04                                        ; $0466: $fe $04
    jr z, jr_000_047a                             ; $0468: $28 $10

    ld b, $21                                     ; $046a: $06 $21
    ld a, [$c0df]                                 ; $046c: $fa $df $c0
    cp $04                                        ; $046f: $fe $04
    jr z, jr_000_047c                             ; $0471: $28 $09

    ld a, $1e                                     ; $0473: $3e $1e
    call Call_000_3665                            ; $0475: $cd $65 $36
    jr jr_000_0483                                ; $0478: $18 $09

jr_000_047a:
    ld b, $16                                     ; $047a: $06 $16

jr_000_047c:
    ld a, b                                       ; $047c: $78
    call Call_000_3665                            ; $047d: $cd $65 $36
    call Call_000_3670                            ; $0480: $cd $70 $36

jr_000_0483:
    call Call_000_3670                            ; $0483: $cd $70 $36
    call Call_000_3670                            ; $0486: $cd $70 $36
    call Call_000_0837                            ; $0489: $cd $37 $08
    ld a, $08                                     ; $048c: $3e $08
    call Call_000_2f67                            ; $048e: $cd $67 $2f
    call Call_000_2f8b                            ; $0491: $cd $8b $2f
    call Call_000_2f56                            ; $0494: $cd $56 $2f

jr_000_0497:
    halt                                          ; $0497: $76
    call Call_000_00a9                            ; $0498: $cd $a9 $00
    jr jr_000_0497                                ; $049b: $18 $fa

jr_000_049d:
    halt                                          ; $049d: $76
    call Call_000_00a9                            ; $049e: $cd $a9 $00
    jr jr_000_049d                                ; $04a1: $18 $fa

    ei                                            ; $04a3: $fb
    ldh a, [$ffa1]                                ; $04a4: $f0 $a1
    and a                                         ; $04a6: $a7
    jr z, jr_000_04cc                             ; $04a7: $28 $23

    dec a                                         ; $04a9: $3d
    ldh [$ffa1], a                                ; $04aa: $e0 $a1
    jp z, Jump_000_04c5                           ; $04ac: $ca $c5 $04

    cp $10                                        ; $04af: $fe $10
    jr nz, jr_000_04bd                            ; $04b1: $20 $0a

    ldh a, [$ff96]                                ; $04b3: $f0 $96
    bit 0, a                                      ; $04b5: $cb $47
    call nz, Call_000_2fdb                        ; $04b7: $c4 $db $2f
    jp Jump_000_0598                              ; $04ba: $c3 $98 $05


jr_000_04bd:
    cp $12                                        ; $04bd: $fe $12
    call z, Call_000_2fed                         ; $04bf: $cc $ed $2f
    jp Jump_000_0598                              ; $04c2: $c3 $98 $05


Jump_000_04c5:
    ld a, $02                                     ; $04c5: $3e $02
    ldh [$ff8a], a                                ; $04c7: $e0 $8a
    jp Jump_000_016d                              ; $04c9: $c3 $6d $01


jr_000_04cc:
    ldh a, [rSC]                                  ; $04cc: $f0 $02
    bit 7, a                                      ; $04ce: $cb $7f
    jr nz, jr_000_04d9                            ; $04d0: $20 $07

    ld a, $80                                     ; $04d2: $3e $80
    ldh [$ff8d], a                                ; $04d4: $e0 $8d
    call Call_000_2fed                            ; $04d6: $cd $ed $2f

jr_000_04d9:
    ld a, [$dd2c]                                 ; $04d9: $fa $2c $dd
    cp $05                                        ; $04dc: $fe $05
    jp c, Jump_000_055e                           ; $04de: $da $5e $05

    ldh a, [$ff99]                                ; $04e1: $f0 $99
    cp $08                                        ; $04e3: $fe $08
    jr nz, jr_000_0518                            ; $04e5: $20 $31

    ldh a, [$ff97]                                ; $04e7: $f0 $97
    cp $02                                        ; $04e9: $fe $02
    jr z, jr_000_0518                             ; $04eb: $28 $2b

    ld a, $09                                     ; $04ed: $3e $09
    call Call_000_3665                            ; $04ef: $cd $65 $36
    ldh a, [$ff97]                                ; $04f2: $f0 $97
    ld b, a                                       ; $04f4: $47
    ldh a, [$ff98]                                ; $04f5: $f0 $98
    bit 0, a                                      ; $04f7: $cb $47
    ldh a, [$ff96]                                ; $04f9: $f0 $96
    jr z, jr_000_04ff                             ; $04fb: $28 $02

    set 3, a                                      ; $04fd: $cb $df

jr_000_04ff:
    and $fe                                       ; $04ff: $e6 $fe
    or b                                          ; $0501: $b0
    ldh [$ff96], a                                ; $0502: $e0 $96
    bit 0, b                                      ; $0504: $cb $40
    jr z, jr_000_050e                             ; $0506: $28 $06

    xor a                                         ; $0508: $af
    ldh [$ff8d], a                                ; $0509: $e0 $8d
    call Call_000_2fdb                            ; $050b: $cd $db $2f

jr_000_050e:
    xor a                                         ; $050e: $af
    ldh [$ffaf], a                                ; $050f: $e0 $af
    ld a, $14                                     ; $0511: $3e $14
    ldh [$ffa1], a                                ; $0513: $e0 $a1
    jp Jump_000_0598                              ; $0515: $c3 $98 $05


jr_000_0518:
    ldh a, [$ff99]                                ; $0518: $f0 $99
    and $31                                       ; $051a: $e6 $31
    jr z, jr_000_052f                             ; $051c: $28 $11

    ldh a, [$ff97]                                ; $051e: $f0 $97
    cp $02                                        ; $0520: $fe $02
    jr nz, jr_000_052f                            ; $0522: $20 $0b

    ldh a, [$ff96]                                ; $0524: $f0 $96
    xor $04                                       ; $0526: $ee $04
    ldh [$ff96], a                                ; $0528: $e0 $96
    ld a, $09                                     ; $052a: $3e $09
    call Call_000_3665                            ; $052c: $cd $65 $36

jr_000_052f:
    ldh a, [$ff99]                                ; $052f: $f0 $99
    ld b, a                                       ; $0531: $47
    ldh a, [$ff97]                                ; $0532: $f0 $97
    bit 6, b                                      ; $0534: $cb $70
    jr z, jr_000_053e                             ; $0536: $28 $06

    and a                                         ; $0538: $a7
    jr z, jr_000_055e                             ; $0539: $28 $23

    dec a                                         ; $053b: $3d
    jr jr_000_0555                                ; $053c: $18 $17

jr_000_053e:
    bit 7, b                                      ; $053e: $cb $78
    jr z, jr_000_0549                             ; $0540: $28 $07

    cp $02                                        ; $0542: $fe $02
    jr z, jr_000_055e                             ; $0544: $28 $18

    inc a                                         ; $0546: $3c
    jr jr_000_0555                                ; $0547: $18 $0c

jr_000_0549:
    bit 2, b                                      ; $0549: $cb $50
    jr z, jr_000_055e                             ; $054b: $28 $11

    and $03                                       ; $054d: $e6 $03
    inc a                                         ; $054f: $3c
    cp $03                                        ; $0550: $fe $03
    jr nz, jr_000_0555                            ; $0552: $20 $01

    xor a                                         ; $0554: $af

jr_000_0555:
    ldh [$ff97], a                                ; $0555: $e0 $97
    ld a, $08                                     ; $0557: $3e $08
    call Call_000_3665                            ; $0559: $cd $65 $36
    jr jr_000_055e                                ; $055c: $18 $00

Jump_000_055e:
jr_000_055e:
    ld a, [$dd2c]                                 ; $055e: $fa $2c $dd
    cp $ff                                        ; $0561: $fe $ff
    jr nz, jr_000_056a                            ; $0563: $20 $05

    ldh a, [$ff98]                                ; $0565: $f0 $98
    and a                                         ; $0567: $a7
    jr z, jr_000_056f                             ; $0568: $28 $05

jr_000_056a:
    xor a                                         ; $056a: $af
    ldh [$ff9f], a                                ; $056b: $e0 $9f
    ldh [$ffa0], a                                ; $056d: $e0 $a0

jr_000_056f:
    ldh a, [$ffa0]                                ; $056f: $f0 $a0
    and a                                         ; $0571: $a7
    jr z, jr_000_0598                             ; $0572: $28 $24

    ld a, $83                                     ; $0574: $3e $83
    call Call_000_2fed                            ; $0576: $cd $ed $2f
    ldh a, [$ffaf]                                ; $0579: $f0 $af
    and $03                                       ; $057b: $e6 $03
    inc a                                         ; $057d: $3c
    ld [$c0df], a                                 ; $057e: $ea $df $c0
    or $80                                        ; $0581: $f6 $80
    ldh [$ffaf], a                                ; $0583: $e0 $af
    call Call_000_0a9d                            ; $0585: $cd $9d $0a
    call Call_000_528e                            ; $0588: $cd $8e $52
    xor a                                         ; $058b: $af
    ldh [$ff96], a                                ; $058c: $e0 $96
    ldh [$ff9f], a                                ; $058e: $e0 $9f
    ldh [$ffa0], a                                ; $0590: $e0 $a0
    inc a                                         ; $0592: $3c
    ldh [$ff8a], a                                ; $0593: $e0 $8a
    jp Jump_000_016d                              ; $0595: $c3 $6d $01


Jump_000_0598:
jr_000_0598:
    ldh a, [$ff97]                                ; $0598: $f0 $97
    swap a                                        ; $059a: $cb $37
    add $60                                       ; $059c: $c6 $60
    ld b, $30                                     ; $059e: $06 $30
    call Call_000_32dd                            ; $05a0: $cd $dd $32
    ld bc, $7058                                  ; $05a3: $01 $58 $70
    ldh a, [$ff96]                                ; $05a6: $f0 $96
    bit 2, a                                      ; $05a8: $cb $57
    ld hl, $05b8                                  ; $05aa: $21 $b8 $05
    jr z, jr_000_05b2                             ; $05ad: $28 $03

    ld hl, $05c5                                  ; $05af: $21 $c5 $05

jr_000_05b2:
    call Call_000_3050                            ; $05b2: $cd $50 $30
    jp Jump_000_0217                              ; $05b5: $c3 $17 $02


    db $00, $0c, $e7, $00, $00, $14, $e8, $00, $00, $14, $e8, $00, $80, $00, $08, $f2
    db $00, $00, $10, $de, $00, $00, $18, $ec, $00, $80

    ldh a, [$ff96]                                ; $05d2: $f0 $96
    bit 0, a                                      ; $05d4: $cb $47
    call z, Call_000_070f                         ; $05d6: $cc $0f $07
    ei                                            ; $05d9: $fb
    call Call_000_081d                            ; $05da: $cd $1d $08
    ld a, [$c0df]                                 ; $05dd: $fa $df $c0
    swap a                                        ; $05e0: $cb $37
    add $28                                       ; $05e2: $c6 $28
    ld b, $36                                     ; $05e4: $06 $36
    call Call_000_32dd                            ; $05e6: $cd $dd $32
    jp Jump_000_0217                              ; $05e9: $c3 $17 $02


    call Call_000_352a                            ; $05ec: $cd $2a $35
    call Call_000_3606                            ; $05ef: $cd $06 $36
    call Call_000_2f8b                            ; $05f2: $cd $8b $2f
    ei                                            ; $05f5: $fb
    call Call_000_081d                            ; $05f6: $cd $1d $08
    call Call_000_32ee                            ; $05f9: $cd $ee $32
    call Call_000_3551                            ; $05fc: $cd $51 $35
    call Call_000_486f                            ; $05ff: $cd $6f $48
    call Call_000_1b50                            ; $0602: $cd $50 $1b
    call Call_000_4a90                            ; $0605: $cd $90 $4a
    ldh a, [$ff96]                                ; $0608: $f0 $96
    bit 0, a                                      ; $060a: $cb $47
    call z, Call_000_0680                         ; $060c: $cc $80 $06
    jp Jump_000_0217                              ; $060f: $c3 $17 $02


Call_000_0612:
    ld a, $ff                                     ; $0612: $3e $ff
    ld hl, $dd00                                  ; $0614: $21 $00 $dd
    ld de, $0016                                  ; $0617: $11 $16 $00
    ld b, $03                                     ; $061a: $06 $03

jr_000_061c:
    ld [hl], a                                    ; $061c: $77
    add hl, de                                    ; $061d: $19
    dec b                                         ; $061e: $05
    jr nz, jr_000_061c                            ; $061f: $20 $fb

    xor a                                         ; $0621: $af
    ld [$dd85], a                                 ; $0622: $ea $85 $dd

jr_000_0625:
    ld hl, $dd56                                  ; $0625: $21 $56 $dd
    ld de, $0016                                  ; $0628: $11 $16 $00
    ld b, $03                                     ; $062b: $06 $03

jr_000_062d:
    ld [hl], a                                    ; $062d: $77
    add hl, de                                    ; $062e: $19
    dec b                                         ; $062f: $05
    jr nz, jr_000_062d                            ; $0630: $20 $fb

    ret                                           ; $0632: $c9


Jump_000_0633:
    ld a, $ff                                     ; $0633: $3e $ff
    jr jr_000_0625                                ; $0635: $18 $ee

    ei                                            ; $0637: $fb
    call Call_000_081d                            ; $0638: $cd $1d $08
    call Call_000_2b33                            ; $063b: $cd $33 $2b
    call Call_000_4cb1                            ; $063e: $cd $b1 $4c
    jp Jump_000_0217                              ; $0641: $c3 $17 $02


    jp Jump_000_0217                              ; $0644: $c3 $17 $02


    call Call_000_2e24                            ; $0647: $cd $24 $2e
    ei                                            ; $064a: $fb
    call Call_000_081d                            ; $064b: $cd $1d $08
    call Call_000_2e73                            ; $064e: $cd $73 $2e
    call Call_000_2b33                            ; $0651: $cd $33 $2b
    call Call_000_4cb1                            ; $0654: $cd $b1 $4c
    call Call_000_500d                            ; $0657: $cd $0d $50
    ldh a, [$ff9f]                                ; $065a: $f0 $9f
    cp $f0                                        ; $065c: $fe $f0
    jr c, jr_000_067d                             ; $065e: $38 $1d

    ldh a, [$ff8a]                                ; $0660: $f0 $8a
    cp $0a                                        ; $0662: $fe $0a
    ld a, $04                                     ; $0664: $3e $04
    jr nz, jr_000_0671                            ; $0666: $20 $09

    ldh a, [$ff96]                                ; $0668: $f0 $96
    bit 0, a                                      ; $066a: $cb $47
    jr nz, jr_000_067d                            ; $066c: $20 $0f

    ldh a, [$ff90]                                ; $066e: $f0 $90
    dec a                                         ; $0670: $3d

jr_000_0671:
    ldh [$ff8a], a                                ; $0671: $e0 $8a
    xor a                                         ; $0673: $af
    ld [$c0ea], a                                 ; $0674: $ea $ea $c0
    dec a                                         ; $0677: $3d
    ldh [$ff95], a                                ; $0678: $e0 $95
    jp Jump_000_016d                              ; $067a: $c3 $6d $01


jr_000_067d:
    jp Jump_000_0217                              ; $067d: $c3 $17 $02


Call_000_0680:
    ldh a, [$ffa5]                                ; $0680: $f0 $a5
    and a                                         ; $0682: $a7
    jp nz, Jump_000_06db                          ; $0683: $c2 $db $06

    call Call_000_0766                            ; $0686: $cd $66 $07
    jr z, jr_000_06c5                             ; $0689: $28 $3a

    ldh a, [$ff99]                                ; $068b: $f0 $99
    bit 3, a                                      ; $068d: $cb $5f
    jr z, jr_000_06c5                             ; $068f: $28 $34

    ldh a, [$ffaf]                                ; $0691: $f0 $af
    bit 7, a                                      ; $0693: $cb $7f
    jp nz, Jump_000_227c                          ; $0695: $c2 $7c $22

    ldh a, [$ffc2]                                ; $0698: $f0 $c2
    and $07                                       ; $069a: $e6 $07
    cp $04                                        ; $069c: $fe $04
    jr nc, jr_000_06c5                            ; $069e: $30 $25

    ld de, $de00                                  ; $06a0: $11 $00 $de
    rst RST_28                                    ; $06a3: $ef

    db $14, $50, $44, $9e, $00, $50, $4c, $9f, $00, $50, $54, $a0, $00, $50, $5c, $a1
    db $00, $50, $64, $a2, $00

    ld a, $ff                                     ; $06b9: $3e $ff
    ldh [$ffa5], a                                ; $06bb: $e0 $a5
    call Call_000_0612                            ; $06bd: $cd $12 $06
    ld a, $0b                                     ; $06c0: $3e $0b
    jp Jump_000_3665                              ; $06c2: $c3 $65 $36


jr_000_06c5:
    call Call_000_0a41                            ; $06c5: $cd $41 $0a
    call Call_000_1f8e                            ; $06c8: $cd $8e $1f
    call Call_000_0b7d                            ; $06cb: $cd $7d $0b
    call Call_000_10ed                            ; $06ce: $cd $ed $10
    call Call_000_17a0                            ; $06d1: $cd $a0 $17
    call Call_000_230c                            ; $06d4: $cd $0c $23
    call Call_000_2720                            ; $06d7: $cd $20 $27
    ret                                           ; $06da: $c9


Jump_000_06db:
    call Call_000_0766                            ; $06db: $cd $66 $07
    jr z, jr_000_06fb                             ; $06de: $28 $1b

    ldh a, [$ff99]                                ; $06e0: $f0 $99
    bit 3, a                                      ; $06e2: $cb $5f
    jr z, jr_000_06fb                             ; $06e4: $28 $15

    ld hl, $de00                                  ; $06e6: $21 $00 $de
    ld b, $14                                     ; $06e9: $06 $14
    xor a                                         ; $06eb: $af
    ldh [$ffa5], a                                ; $06ec: $e0 $a5

jr_000_06ee:
    ld [hl+], a                                   ; $06ee: $22
    dec b                                         ; $06ef: $05
    jr nz, jr_000_06ee                            ; $06f0: $20 $fc

    call Call_000_32c8                            ; $06f2: $cd $c8 $32
    call Call_000_32b9                            ; $06f5: $cd $b9 $32
    jp Jump_000_0633                              ; $06f8: $c3 $33 $06


jr_000_06fb:
    ldh a, [$ff99]                                ; $06fb: $f0 $99
    bit 2, a                                      ; $06fd: $cb $57
    ret z                                         ; $06ff: $c8

    ldh a, [$ffc2]                                ; $0700: $f0 $c2
    inc a                                         ; $0702: $3c
    and $0f                                       ; $0703: $e6 $0f
    cp $04                                        ; $0705: $fe $04
    jr c, jr_000_070a                             ; $0707: $38 $01

    xor a                                         ; $0709: $af

jr_000_070a:
    or $c0                                        ; $070a: $f6 $c0
    ldh [$ffc2], a                                ; $070c: $e0 $c2
    ret                                           ; $070e: $c9


Call_000_070f:
    call Call_000_0766                            ; $070f: $cd $66 $07
    ret z                                         ; $0712: $c8

    ldh a, [$ffa1]                                ; $0713: $f0 $a1
    and a                                         ; $0715: $a7
    jr z, jr_000_0726                             ; $0716: $28 $0e

    dec a                                         ; $0718: $3d
    ldh [$ffa1], a                                ; $0719: $e0 $a1
    ret nz                                        ; $071b: $c0

    call Call_000_0a9d                            ; $071c: $cd $9d $0a
    ld a, $01                                     ; $071f: $3e $01
    ldh [$ff8a], a                                ; $0721: $e0 $8a
    jp Jump_000_016d                              ; $0723: $c3 $6d $01


jr_000_0726:
    ldh a, [$ff99]                                ; $0726: $f0 $99
    cp $08                                        ; $0728: $fe $08
    jr nz, jr_000_0735                            ; $072a: $20 $09

    ld a, $14                                     ; $072c: $3e $14
    ldh [$ffa1], a                                ; $072e: $e0 $a1
    ld a, $09                                     ; $0730: $3e $09
    jp Jump_000_3665                              ; $0732: $c3 $65 $36


jr_000_0735:
    ld a, [$c0df]                                 ; $0735: $fa $df $c0
    ld b, a                                       ; $0738: $47
    ldh a, [$ff99]                                ; $0739: $f0 $99
    cp $40                                        ; $073b: $fe $40
    jr nz, jr_000_0747                            ; $073d: $20 $08

    ld a, b                                       ; $073f: $78
    cp $01                                        ; $0740: $fe $01
    jr z, jr_000_0765                             ; $0742: $28 $21

    dec a                                         ; $0744: $3d
    jr jr_000_075d                                ; $0745: $18 $16

jr_000_0747:
    cp $80                                        ; $0747: $fe $80
    jr nz, jr_000_0753                            ; $0749: $20 $08

    ld a, b                                       ; $074b: $78
    cp $04                                        ; $074c: $fe $04
    jr z, jr_000_0765                             ; $074e: $28 $15

    inc a                                         ; $0750: $3c
    jr jr_000_075d                                ; $0751: $18 $0a

jr_000_0753:
    cp $04                                        ; $0753: $fe $04
    jr nz, jr_000_0765                            ; $0755: $20 $0e

    ld a, [$c0df]                                 ; $0757: $fa $df $c0
    and $03                                       ; $075a: $e6 $03
    inc a                                         ; $075c: $3c

jr_000_075d:
    ld [$c0df], a                                 ; $075d: $ea $df $c0
    ld a, $08                                     ; $0760: $3e $08
    call Call_000_3665                            ; $0762: $cd $65 $36

jr_000_0765:
    ret                                           ; $0765: $c9


Call_000_0766:
    ldh a, [$ffa3]                                ; $0766: $f0 $a3
    and a                                         ; $0768: $a7
    ret z                                         ; $0769: $c8

    cp $01                                        ; $076a: $fe $01
    ret                                           ; $076c: $c9


Call_000_076d:
    ldh a, [$ff8d]                                ; $076d: $f0 $8d
    bit 7, a                                      ; $076f: $cb $7f
    jr nz, jr_000_077e                            ; $0771: $20 $0b

    rst RST_08                                    ; $0773: $cf

    db $95, $07, $9a, $07, $b3, $07, $1c, $08, $13, $08

jr_000_077e:
    res 7, a                                      ; $077e: $cb $bf
    rst RST_08                                    ; $0780: $cf

    db $8b, $07, $a4, $07, $ea, $07, $1c, $08, $c2, $07

    xor a                                         ; $078b: $af
    ldh [$ffaf], a                                ; $078c: $e0 $af
    inc a                                         ; $078e: $3c
    ldh [$ff97], a                                ; $078f: $e0 $97
    ld a, $14                                     ; $0791: $3e $14
    ldh [$ffa1], a                                ; $0793: $e0 $a1
    ld hl, $ff8d                                  ; $0795: $21 $8d $ff
    inc [hl]                                      ; $0798: $34
    ret                                           ; $0799: $c9


    ldh a, [rSB]                                  ; $079a: $f0 $01
    cp $12                                        ; $079c: $fe $12
    jr z, jr_000_07ae                             ; $079e: $28 $0e

jr_000_07a0:
    xor a                                         ; $07a0: $af
    ldh [$ffa1], a                                ; $07a1: $e0 $a1
    ret                                           ; $07a3: $c9


    ldh a, [rSB]                                  ; $07a4: $f0 $01
    bit 0, a                                      ; $07a6: $cb $47
    jr z, jr_000_07a0                             ; $07a8: $28 $f6

    set 1, a                                      ; $07aa: $cb $cf
    ldh [$ff96], a                                ; $07ac: $e0 $96

jr_000_07ae:
    ld hl, $ff8d                                  ; $07ae: $21 $8d $ff
    inc [hl]                                      ; $07b1: $34
    ret                                           ; $07b2: $c9


    ldh a, [$ff9a]                                ; $07b3: $f0 $9a
    ldh [$ff98], a                                ; $07b5: $e0 $98
    ldh a, [$ff9b]                                ; $07b7: $f0 $9b
    ldh [$ff99], a                                ; $07b9: $e0 $99
    ld a, $84                                     ; $07bb: $3e $84
    ldh [$ff8d], a                                ; $07bd: $e0 $8d
    jp Jump_000_2fed                              ; $07bf: $c3 $ed $2f


    ld a, $02                                     ; $07c2: $3e $02
    ldh [$ff8d], a                                ; $07c4: $e0 $8d
    call Call_000_223e                            ; $07c6: $cd $3e $22
    ldh a, [$ff9c]                                ; $07c9: $f0 $9c
    xor c                                         ; $07cb: $a9
    and c                                         ; $07cc: $a1
    ldh [$ff9d], a                                ; $07cd: $e0 $9d
    ld a, c                                       ; $07cf: $79
    ldh [$ff9c], a                                ; $07d0: $e0 $9c

jr_000_07d2:
    ldh a, [$ff8b]                                ; $07d2: $f0 $8b
    cp $01                                        ; $07d4: $fe $01
    jr nz, jr_000_07dd                            ; $07d6: $20 $05

    call Call_000_0680                            ; $07d8: $cd $80 $06
    jr jr_000_07e4                                ; $07db: $18 $07

jr_000_07dd:
    cp $02                                        ; $07dd: $fe $02
    jr nz, jr_000_07e4                            ; $07df: $20 $03

    call Call_000_070f                            ; $07e1: $cd $0f $07

jr_000_07e4:
    call Call_000_369e                            ; $07e4: $cd $9e $36
    jp Jump_000_31ff                              ; $07e7: $c3 $ff $31


    ld a, $04                                     ; $07ea: $3e $04
    ldh [$ff8d], a                                ; $07ec: $e0 $8d
    call Call_000_223e                            ; $07ee: $cd $3e $22
    ldh a, [$ff9c]                                ; $07f1: $f0 $9c
    xor c                                         ; $07f3: $a9
    and c                                         ; $07f4: $a1
    ldh [$ff9d], a                                ; $07f5: $e0 $9d
    ldh [$ff99], a                                ; $07f7: $e0 $99
    ld a, c                                       ; $07f9: $79
    ldh [$ff9c], a                                ; $07fa: $e0 $9c
    ldh [$ff98], a                                ; $07fc: $e0 $98
    call Call_000_2fa0                            ; $07fe: $cd $a0 $2f
    call Call_000_2225                            ; $0801: $cd $25 $22
    ldh a, [$ff9a]                                ; $0804: $f0 $9a
    xor c                                         ; $0806: $a9
    and c                                         ; $0807: $a1
    ldh [$ff9b], a                                ; $0808: $e0 $9b
    ld a, c                                       ; $080a: $79
    ldh [$ff9a], a                                ; $080b: $e0 $9a
    call Call_000_086a                            ; $080d: $cd $6a $08
    jp Jump_000_2fdb                              ; $0810: $c3 $db $2f


    ld a, $82                                     ; $0813: $3e $82
    ldh [$ff8d], a                                ; $0815: $e0 $8d
    call Call_000_2fed                            ; $0817: $cd $ed $2f
    jr jr_000_07d2                                ; $081a: $18 $b6

    ret                                           ; $081c: $c9


Call_000_081d:
    ldh a, [$ff8d]                                ; $081d: $f0 $8d
    cp $02                                        ; $081f: $fe $02
    ret nz                                        ; $0821: $c0

    call Call_000_2fa0                            ; $0822: $cd $a0 $2f
    call Call_000_2225                            ; $0825: $cd $25 $22
    ldh a, [$ff9a]                                ; $0828: $f0 $9a
    xor c                                         ; $082a: $a9
    and c                                         ; $082b: $a1
    ldh [$ff9b], a                                ; $082c: $e0 $9b
    ld a, c                                       ; $082e: $79
    ldh [$ff9a], a                                ; $082f: $e0 $9a
    call Call_000_086a                            ; $0831: $cd $6a $08
    jp Jump_000_2fdb                              ; $0834: $c3 $db $2f


Call_000_0837:
    ldh a, [$ff96]                                ; $0837: $f0 $96
    bit 0, a                                      ; $0839: $cb $47
    ret z                                         ; $083b: $c8

    bit 1, a                                      ; $083c: $cb $4f
    ld a, $03                                     ; $083e: $3e $03
    jr z, jr_000_0844                             ; $0840: $28 $02

    ld a, $83                                     ; $0842: $3e $83

jr_000_0844:
    ldh [$ff8d], a                                ; $0844: $e0 $8d
    ld a, $08                                     ; $0846: $3e $08
    call Call_000_2f67                            ; $0848: $cd $67 $2f
    ei                                            ; $084b: $fb

jr_000_084c:
    ld a, $f0                                     ; $084c: $3e $f0
    call Call_000_2fed                            ; $084e: $cd $ed $2f
    ld a, $f0                                     ; $0851: $3e $f0
    call Call_000_2fdb                            ; $0853: $cd $db $2f

jr_000_0856:
    ldh a, [rSC]                                  ; $0856: $f0 $02
    bit 7, a                                      ; $0858: $cb $7f
    jr nz, jr_000_0856                            ; $085a: $20 $fa

    ldh a, [rSB]                                  ; $085c: $f0 $01
    cp $f0                                        ; $085e: $fe $f0
    jr nz, jr_000_084c                            ; $0860: $20 $ea

    di                                            ; $0862: $f3
    ld hl, $ff8d                                  ; $0863: $21 $8d $ff
    dec [hl]                                      ; $0866: $35
    jp Jump_000_2fed                              ; $0867: $c3 $ed $2f


Call_000_086a:
    ldh a, [$ff90]                                ; $086a: $f0 $90
    cp $04                                        ; $086c: $fe $04
    jr nz, jr_000_087f                            ; $086e: $20 $0f

    ldh a, [$ffec]                                ; $0870: $f0 $ec
    cp $04                                        ; $0872: $fe $04
    jr z, jr_000_087f                             ; $0874: $28 $09

    ldh a, [$ff93]                                ; $0876: $f0 $93
    and a                                         ; $0878: $a7
    ld c, $fe                                     ; $0879: $0e $fe
    jr z, jr_000_087f                             ; $087b: $28 $02

    ld c, $ff                                     ; $087d: $0e $ff

jr_000_087f:
    ldh a, [$ff90]                                ; $087f: $f0 $90
    ldh [$ffec], a                                ; $0881: $e0 $ec
    ld a, c                                       ; $0883: $79
    ret                                           ; $0884: $c9


Call_000_0885:
    ld a, [$c004]                                 ; $0885: $fa $04 $c0
    add $80                                       ; $0888: $c6 $80
    ld a, [$c005]                                 ; $088a: $fa $05 $c0
    adc $00                                       ; $088d: $ce $00
    ret                                           ; $088f: $c9


Call_000_0890:
    ld a, [$c002]                                 ; $0890: $fa $02 $c0
    add $80                                       ; $0893: $c6 $80
    ld a, [$c003]                                 ; $0895: $fa $03 $c0
    adc $00                                       ; $0898: $ce $00
    ret                                           ; $089a: $c9


Call_000_089b:
    ld a, [$c024]                                 ; $089b: $fa $24 $c0
    add $80                                       ; $089e: $c6 $80
    ld a, [$c025]                                 ; $08a0: $fa $25 $c0
    adc $00                                       ; $08a3: $ce $00
    ret                                           ; $08a5: $c9


Call_000_08a6:
    ld a, [$c022]                                 ; $08a6: $fa $22 $c0
    add $80                                       ; $08a9: $c6 $80
    ld a, [$c023]                                 ; $08ab: $fa $23 $c0
    adc $00                                       ; $08ae: $ce $00
    ret                                           ; $08b0: $c9


Call_000_08b1:
    ld a, [$c044]                                 ; $08b1: $fa $44 $c0
    add $80                                       ; $08b4: $c6 $80
    ld a, [$c045]                                 ; $08b6: $fa $45 $c0
    adc $00                                       ; $08b9: $ce $00
    ret                                           ; $08bb: $c9


Call_000_08bc:
    ld a, [$c042]                                 ; $08bc: $fa $42 $c0
    add $80                                       ; $08bf: $c6 $80
    ld a, [$c043]                                 ; $08c1: $fa $43 $c0
    adc $00                                       ; $08c4: $ce $00
    ret                                           ; $08c6: $c9


Call_000_08c7:
    push hl                                       ; $08c7: $e5
    ld a, [hl+]                                   ; $08c8: $2a
    ld h, [hl]                                    ; $08c9: $66
    ld l, a                                       ; $08ca: $6f
    bit 5, c                                      ; $08cb: $cb $69
    jr z, jr_000_08df                             ; $08cd: $28 $10

    ld de, $07ff                                  ; $08cf: $11 $ff $07
    call Call_000_00c3                            ; $08d2: $cd $c3 $00
    jr c, jr_000_08f1                             ; $08d5: $38 $1a

    ld a, l                                       ; $08d7: $7d
    sub b                                         ; $08d8: $90
    ld l, a                                       ; $08d9: $6f
    jr nc, jr_000_08f1                            ; $08da: $30 $15

    dec h                                         ; $08dc: $25
    jr jr_000_08f1                                ; $08dd: $18 $12

jr_000_08df:
    bit 4, c                                      ; $08df: $cb $61
    jr z, jr_000_08f1                             ; $08e1: $28 $0e

    ld de, $d001                                  ; $08e3: $11 $01 $d0
    call Call_000_00c3                            ; $08e6: $cd $c3 $00
    jr nc, jr_000_08f1                            ; $08e9: $30 $06

    ld a, l                                       ; $08eb: $7d
    add b                                         ; $08ec: $80
    ld l, a                                       ; $08ed: $6f
    jr nc, jr_000_08f1                            ; $08ee: $30 $01

    inc h                                         ; $08f0: $24

jr_000_08f1:
    push hl                                       ; $08f1: $e5
    pop de                                        ; $08f2: $d1
    pop hl                                        ; $08f3: $e1
    ld a, e                                       ; $08f4: $7b
    ld [hl+], a                                   ; $08f5: $22
    ld [hl], d                                    ; $08f6: $72
    ret                                           ; $08f7: $c9


Call_000_08f8:
    push hl                                       ; $08f8: $e5
    ld a, [hl+]                                   ; $08f9: $2a
    ld h, [hl]                                    ; $08fa: $66
    ld l, a                                       ; $08fb: $6f
    bit 6, c                                      ; $08fc: $cb $71
    jr z, jr_000_0924                             ; $08fe: $28 $24

    ldh a, [$ff96]                                ; $0900: $f0 $96
    bit 7, a                                      ; $0902: $cb $7f
    jr z, jr_000_0914                             ; $0904: $28 $0e

    ld de, $08ff                                  ; $0906: $11 $ff $08
    call Call_000_00c3                            ; $0909: $cd $c3 $00
    jr c, jr_000_094a                             ; $090c: $38 $3c

    ld a, b                                       ; $090e: $78
    sub $14                                       ; $090f: $d6 $14
    ld b, a                                       ; $0911: $47
    jr jr_000_091c                                ; $0912: $18 $08

jr_000_0914:
    ld de, $8500                                  ; $0914: $11 $00 $85
    call Call_000_00c3                            ; $0917: $cd $c3 $00
    jr c, jr_000_094a                             ; $091a: $38 $2e

jr_000_091c:
    ld a, l                                       ; $091c: $7d
    sub b                                         ; $091d: $90
    ld l, a                                       ; $091e: $6f
    jr nc, jr_000_094a                            ; $091f: $30 $29

    dec h                                         ; $0921: $25
    jr jr_000_094a                                ; $0922: $18 $26

jr_000_0924:
    bit 7, c                                      ; $0924: $cb $79
    jr z, jr_000_094a                             ; $0926: $28 $22

    ldh a, [$ff96]                                ; $0928: $f0 $96
    bit 7, a                                      ; $092a: $cb $7f
    jr nz, jr_000_093c                            ; $092c: $20 $0e

    ld de, $e701                                  ; $092e: $11 $01 $e7
    call Call_000_00c3                            ; $0931: $cd $c3 $00
    jr nc, jr_000_094a                            ; $0934: $30 $14

    ld a, b                                       ; $0936: $78
    sub $14                                       ; $0937: $d6 $14
    ld b, a                                       ; $0939: $47
    jr jr_000_0944                                ; $093a: $18 $08

jr_000_093c:
    ld de, $6b00                                  ; $093c: $11 $00 $6b
    call Call_000_00c3                            ; $093f: $cd $c3 $00
    jr nc, jr_000_094a                            ; $0942: $30 $06

jr_000_0944:
    ld a, l                                       ; $0944: $7d
    add b                                         ; $0945: $80
    ld l, a                                       ; $0946: $6f
    jr nc, jr_000_094a                            ; $0947: $30 $01

    inc h                                         ; $0949: $24

jr_000_094a:
    push hl                                       ; $094a: $e5
    pop de                                        ; $094b: $d1
    pop hl                                        ; $094c: $e1
    ld a, e                                       ; $094d: $7b
    ld [hl+], a                                   ; $094e: $22
    ld [hl], d                                    ; $094f: $72
    ret                                           ; $0950: $c9


Call_000_0951:
    inc hl                                        ; $0951: $23
    ld a, [hl+]                                   ; $0952: $2a
    cp $78                                        ; $0953: $fe $78
    jr nc, jr_000_0958                            ; $0955: $30 $01

    dec a                                         ; $0957: $3d

jr_000_0958:
    ld b, a                                       ; $0958: $47
    inc hl                                        ; $0959: $23
    ld a, [hl]                                    ; $095a: $7e
    jr jr_000_096a                                ; $095b: $18 $0d

Call_000_095d:
    ld a, [hl+]                                   ; $095d: $2a
    add $80                                       ; $095e: $c6 $80
    ld a, [hl+]                                   ; $0960: $2a
    adc $00                                       ; $0961: $ce $00
    ld b, a                                       ; $0963: $47
    ld a, [hl+]                                   ; $0964: $2a
    add $80                                       ; $0965: $c6 $80
    ld a, [hl]                                    ; $0967: $7e
    adc $00                                       ; $0968: $ce $00

jr_000_096a:
    ldh [$ffcc], a                                ; $096a: $e0 $cc
    ld c, a                                       ; $096c: $4f
    ld a, $6c                                     ; $096d: $3e $6c
    sub c                                         ; $096f: $91
    jr nc, jr_000_0974                            ; $0970: $30 $02

    cpl                                           ; $0972: $2f
    inc a                                         ; $0973: $3c

jr_000_0974:
    ldh [$ffce], a                                ; $0974: $e0 $ce
    ld a, b                                       ; $0976: $78
    ldh [$ffcd], a                                ; $0977: $e0 $cd
    ld a, $b8                                     ; $0979: $3e $b8
    sub b                                         ; $097b: $90
    jr nc, jr_000_0980                            ; $097c: $30 $02

    cpl                                           ; $097e: $2f
    inc a                                         ; $097f: $3c

jr_000_0980:
    ldh [$ffcf], a                                ; $0980: $e0 $cf
    ldh a, [$ffce]                                ; $0982: $f0 $ce
    ld e, a                                       ; $0984: $5f
    call Call_000_308f                            ; $0985: $cd $8f $30
    ldh a, [$ffcf]                                ; $0988: $f0 $cf
    call Call_000_30f8                            ; $098a: $cd $f8 $30
    ld l, h                                       ; $098d: $6c
    ld h, c                                       ; $098e: $61
    ld a, $48                                     ; $098f: $3e $48
    call Call_000_3143                            ; $0991: $cd $43 $31
    srl l                                         ; $0994: $cb $3d
    srl l                                         ; $0996: $cb $3d
    ldh a, [$ffcd]                                ; $0998: $f0 $cd
    cp $b8                                        ; $099a: $fe $b8
    jr c, jr_000_09a2                             ; $099c: $38 $04

    ld a, l                                       ; $099e: $7d
    cpl                                           ; $099f: $2f
    inc a                                         ; $09a0: $3c
    ld l, a                                       ; $09a1: $6f

jr_000_09a2:
    ldh a, [$ffcc]                                ; $09a2: $f0 $cc
    cp $6c                                        ; $09a4: $fe $6c
    jr nc, jr_000_09ab                            ; $09a6: $30 $03

    add l                                         ; $09a8: $85
    jr jr_000_09ac                                ; $09a9: $18 $01

jr_000_09ab:
    sub l                                         ; $09ab: $95

jr_000_09ac:
    ldh [$ffd0], a                                ; $09ac: $e0 $d0
    ldh a, [$ffcd]                                ; $09ae: $f0 $cd
    ld e, $28                                     ; $09b0: $1e $28
    call Call_000_308f                            ; $09b2: $cd $8f $30
    ld a, $2f                                     ; $09b5: $3e $2f
    call Call_000_3143                            ; $09b7: $cd $43 $31
    ld a, $1c                                     ; $09ba: $3e $1c
    add l                                         ; $09bc: $85
    ld b, a                                       ; $09bd: $47
    ldh a, [$ffd0]                                ; $09be: $f0 $d0
    ld c, a                                       ; $09c0: $4f
    ret                                           ; $09c1: $c9


Call_000_09c2:
    push bc                                       ; $09c2: $c5
    ld l, a                                       ; $09c3: $6f
    ld a, [$c040]                                 ; $09c4: $fa $40 $c0
    cp $02                                        ; $09c7: $fe $02
    jr nz, jr_000_09d4                            ; $09c9: $20 $09

    ld a, l                                       ; $09cb: $7d
    srl a                                         ; $09cc: $cb $3f
    srl a                                         ; $09ce: $cb $3f
    srl a                                         ; $09d0: $cb $3f
    add l                                         ; $09d2: $85
    ld l, a                                       ; $09d3: $6f

jr_000_09d4:
    ld a, l                                       ; $09d4: $7d
    ld e, $06                                     ; $09d5: $1e $06
    call Call_000_308f                            ; $09d7: $cd $8f $30
    ld a, $10                                     ; $09da: $3e $10
    call Call_000_3143                            ; $09dc: $cd $43 $31
    inc l                                         ; $09df: $2c
    ldh a, [$ffcd]                                ; $09e0: $f0 $cd
    cp $c8                                        ; $09e2: $fe $c8
    jr nc, jr_000_09f5                            ; $09e4: $30 $0f

    dec l                                         ; $09e6: $2d
    jr z, jr_000_09f5                             ; $09e7: $28 $0c

    cp $a8                                        ; $09e9: $fe $a8
    jr nc, jr_000_09f5                            ; $09eb: $30 $08

    dec l                                         ; $09ed: $2d
    jr z, jr_000_09f5                             ; $09ee: $28 $05

    cp $78                                        ; $09f0: $fe $78
    jr nc, jr_000_09f5                            ; $09f2: $30 $01

    dec l                                         ; $09f4: $2d

jr_000_09f5:
    pop bc                                        ; $09f5: $c1
    ld a, b                                       ; $09f6: $78
    sub l                                         ; $09f7: $95
    ld b, a                                       ; $09f8: $47
    ret                                           ; $09f9: $c9


Call_000_09fa:
    ld a, [hl+]                                   ; $09fa: $2a
    ld a, [hl+]                                   ; $09fb: $2a
    ld d, a                                       ; $09fc: $57
    ld a, [hl+]                                   ; $09fd: $2a
    ld a, [hl]                                    ; $09fe: $7e
    ld e, a                                       ; $09ff: $5f
    ld c, $00                                     ; $0a00: $0e $00
    ld a, d                                       ; $0a02: $7a
    cp $78                                        ; $0a03: $fe $78
    jr c, jr_000_0a12                             ; $0a05: $38 $0b

    set 1, c                                      ; $0a07: $cb $c9
    cpl                                           ; $0a09: $2f
    add $f0                                       ; $0a0a: $c6 $f0
    ld d, a                                       ; $0a0c: $57
    ld a, e                                       ; $0a0d: $7b
    cpl                                           ; $0a0e: $2f
    add $d8                                       ; $0a0f: $c6 $d8
    ld e, a                                       ; $0a11: $5f

jr_000_0a12:
    ld a, e                                       ; $0a12: $7b
    cp $6c                                        ; $0a13: $fe $6c
    jr c, jr_000_0a1c                             ; $0a15: $38 $05

    set 0, c                                      ; $0a17: $cb $c1
    cpl                                           ; $0a19: $2f
    add $d8                                       ; $0a1a: $c6 $d8

jr_000_0a1c:
    cp $36                                        ; $0a1c: $fe $36
    ret c                                         ; $0a1e: $d8

    ld a, d                                       ; $0a1f: $7a
    cp $37                                        ; $0a20: $fe $37
    jr c, jr_000_0a29                             ; $0a22: $38 $05

    set 3, c                                      ; $0a24: $cb $d9
    cp $55                                        ; $0a26: $fe $55
    ret c                                         ; $0a28: $d8

jr_000_0a29:
    set 2, c                                      ; $0a29: $cb $d1
    ret                                           ; $0a2b: $c9


Call_000_0a2c:
    ld c, $00                                     ; $0a2c: $0e $00
    cp $08                                        ; $0a2e: $fe $08
    ret z                                         ; $0a30: $c8

    inc c                                         ; $0a31: $0c
    cp $0b                                        ; $0a32: $fe $0b
    ret z                                         ; $0a34: $c8

    inc c                                         ; $0a35: $0c
    cp $0e                                        ; $0a36: $fe $0e
    ret z                                         ; $0a38: $c8

    inc c                                         ; $0a39: $0c
    cp $10                                        ; $0a3a: $fe $10
    ret z                                         ; $0a3c: $c8

    inc c                                         ; $0a3d: $0c
    cp $05                                        ; $0a3e: $fe $05
    ret                                           ; $0a40: $c9


Call_000_0a41:
    ld a, [$c040]                                 ; $0a41: $fa $40 $c0
    cp $03                                        ; $0a44: $fe $03
    ret c                                         ; $0a46: $d8

    cp $05                                        ; $0a47: $fe $05
    ret nc                                        ; $0a49: $d0

    ld c, $00                                     ; $0a4a: $0e $00
    ldh a, [$ffa8]                                ; $0a4c: $f0 $a8
    ld b, a                                       ; $0a4e: $47
    call Call_000_08b1                            ; $0a4f: $cd $b1 $08
    sub b                                         ; $0a52: $90
    jr c, jr_000_0a59                             ; $0a53: $38 $04

    cp $30                                        ; $0a55: $fe $30
    jr nc, jr_000_0a64                            ; $0a57: $30 $0b

jr_000_0a59:
    ld a, [$c050]                                 ; $0a59: $fa $50 $c0
    bit 7, a                                      ; $0a5c: $cb $7f
    jr z, jr_000_0a71                             ; $0a5e: $28 $11

    ld c, $20                                     ; $0a60: $0e $20
    jr jr_000_0a71                                ; $0a62: $18 $0d

jr_000_0a64:
    cp $70                                        ; $0a64: $fe $70
    jr c, jr_000_0a71                             ; $0a66: $38 $09

    ld a, [$c050]                                 ; $0a68: $fa $50 $c0
    bit 7, a                                      ; $0a6b: $cb $7f
    jr nz, jr_000_0a71                            ; $0a6d: $20 $02

    ld c, $10                                     ; $0a6f: $0e $10

jr_000_0a71:
    ldh a, [$ffaa]                                ; $0a71: $f0 $aa
    ld b, a                                       ; $0a73: $47
    call Call_000_08bc                            ; $0a74: $cd $bc $08
    sub b                                         ; $0a77: $90
    jr c, jr_000_0a7e                             ; $0a78: $38 $04

    cp $28                                        ; $0a7a: $fe $28
    jr nc, jr_000_0a8b                            ; $0a7c: $30 $0d

jr_000_0a7e:
    ld a, [$c04f]                                 ; $0a7e: $fa $4f $c0
    bit 7, a                                      ; $0a81: $cb $7f
    jr z, jr_000_0a9a                             ; $0a83: $28 $15

    ld a, c                                       ; $0a85: $79
    or $40                                        ; $0a86: $f6 $40
    ld c, a                                       ; $0a88: $4f
    jr jr_000_0a9a                                ; $0a89: $18 $0f

jr_000_0a8b:
    cp $68                                        ; $0a8b: $fe $68
    jr c, jr_000_0a9a                             ; $0a8d: $38 $0b

    ld a, [$c04f]                                 ; $0a8f: $fa $4f $c0
    bit 7, a                                      ; $0a92: $cb $7f
    jr nz, jr_000_0a9a                            ; $0a94: $20 $04

    ld a, c                                       ; $0a96: $79
    or $80                                        ; $0a97: $f6 $80
    ld c, a                                       ; $0a99: $4f

jr_000_0a9a:
    jp Jump_000_3214                              ; $0a9a: $c3 $14 $32


Call_000_0a9d:
    ld hl, $c080                                  ; $0a9d: $21 $80 $c0
    ld b, $40                                     ; $0aa0: $06 $40
    xor a                                         ; $0aa2: $af

jr_000_0aa3:
    ld [hl+], a                                   ; $0aa3: $22
    dec b                                         ; $0aa4: $05
    jr nz, jr_000_0aa3                            ; $0aa5: $20 $fc

    ld a, [$c0df]                                 ; $0aa7: $fa $df $c0
    dec a                                         ; $0aaa: $3d
    ldh [$ffc5], a                                ; $0aab: $e0 $c5
    rst RST_18                                    ; $0aad: $df

    db $04, $a0, $b0, $d0, $ff

    ld [$c088], a                                 ; $0ab3: $ea $88 $c0
    ld [$c0a8], a                                 ; $0ab6: $ea $a8 $c0
    ldh a, [$ffc5]                                ; $0ab9: $f0 $c5
    rst RST_18                                    ; $0abb: $df

    db $04, $90, $a0, $c0, $ff

    ld [$c089], a                                 ; $0ac1: $ea $89 $c0
    ld [$c0a9], a                                 ; $0ac4: $ea $a9 $c0
    ldh a, [$ffc5]                                ; $0ac7: $f0 $c5
    ld hl, $0b35                                  ; $0ac9: $21 $35 $0b
    call Call_000_3047                            ; $0acc: $cd $47 $30
    ld de, $c090                                  ; $0acf: $11 $90 $c0
    ld b, $10                                     ; $0ad2: $06 $10

jr_000_0ad4:
    ld a, [hl+]                                   ; $0ad4: $2a
    ld [de], a                                    ; $0ad5: $12
    inc e                                         ; $0ad6: $1c
    dec b                                         ; $0ad7: $05
    jr nz, jr_000_0ad4                            ; $0ad8: $20 $fa

    ldh a, [$ffc5]                                ; $0ada: $f0 $c5
    ld hl, $0b35                                  ; $0adc: $21 $35 $0b
    call Call_000_3047                            ; $0adf: $cd $47 $30
    ld de, $c0b0                                  ; $0ae2: $11 $b0 $c0
    ld b, $10                                     ; $0ae5: $06 $10

jr_000_0ae7:
    ld a, [hl+]                                   ; $0ae7: $2a
    ld [de], a                                    ; $0ae8: $12
    inc e                                         ; $0ae9: $1c
    dec b                                         ; $0aea: $05
    jr nz, jr_000_0ae7                            ; $0aeb: $20 $fa

    ld a, [$c090]                                 ; $0aed: $fa $90 $c0
    cpl                                           ; $0af0: $2f
    inc a                                         ; $0af1: $3c
    sub $10                                       ; $0af2: $d6 $10
    ld [$c090], a                                 ; $0af4: $ea $90 $c0
    ldh a, [$ff96]                                ; $0af7: $f0 $96
    bit 0, a                                      ; $0af9: $cb $47
    jr nz, jr_000_0b25                            ; $0afb: $20 $28

    ldh a, [$ffaf]                                ; $0afd: $f0 $af
    bit 7, a                                      ; $0aff: $cb $7f
    jr nz, jr_000_0b25                            ; $0b01: $20 $22

    ld hl, $c092                                  ; $0b03: $21 $92 $c0
    call Call_000_0b26                            ; $0b06: $cd $26 $0b
    ld hl, $c096                                  ; $0b09: $21 $96 $c0
    call Call_000_0b26                            ; $0b0c: $cd $26 $0b
    ldh a, [$ffc5]                                ; $0b0f: $f0 $c5
    rst RST_18                                    ; $0b11: $df

    db $04, $c0, $c8, $d0, $f0

    ld [$c088], a                                 ; $0b17: $ea $88 $c0
    ldh a, [$ffc5]                                ; $0b1a: $f0 $c5
    rst RST_18                                    ; $0b1c: $df

    db $04, $a0, $a0, $b0, $c0

    ld [$c089], a                                 ; $0b22: $ea $89 $c0

jr_000_0b25:
    ret                                           ; $0b25: $c9


Call_000_0b26:
    ld a, [$c0df]                                 ; $0b26: $fa $df $c0
    cp $01                                        ; $0b29: $fe $01
    ret z                                         ; $0b2b: $c8

    ld a, [hl]                                    ; $0b2c: $7e
    ld b, a                                       ; $0b2d: $47
    srl b                                         ; $0b2e: $cb $38
    srl b                                         ; $0b30: $cb $38
    sub b                                         ; $0b32: $90
    ld [hl], a                                    ; $0b33: $77
    ret                                           ; $0b34: $c9


    db $3d, $0b, $4d, $0b, $5d, $0b, $6d, $0b, $94, $05, $70, $00, $1e, $3c, $58, $0a
    db $14, $3c, $0a, $14, $0a, $14, $14, $05, $a0, $0a, $a0, $00, $28, $32, $80, $0a
    db $46, $0a, $0a, $1e, $0a, $14, $14, $00, $a0, $14, $c0, $00, $46, $3c, $90, $0a
    db $14, $1e, $0a, $14, $0a, $0a, $32, $05, $b0, $1e, $e0, $00, $50, $32, $a0, $05
    db $1e, $0a, $05, $14, $28, $0a, $32, $05

Call_000_0b7d:
    ld hl, $ff96                                  ; $0b7d: $21 $96 $ff
    res 7, [hl]                                   ; $0b80: $cb $be
    ld hl, $c002                                  ; $0b82: $21 $02 $c0
    call Call_000_09fa                            ; $0b85: $cd $fa $09
    ld a, c                                       ; $0b88: $79
    ld [$c00b], a                                 ; $0b89: $ea $0b $c0
    ld a, [$c000]                                 ; $0b8c: $fa $00 $c0
    rst RST_08                                    ; $0b8f: $cf

    db $a0, $0b, $d9, $0b, $e2, $0b, $4c, $0c, $9a, $0c, $b7, $0c, $3d, $0d, $76, $0d

    call Call_000_0da5                            ; $0ba0: $cd $a5 $0d
    call Call_000_0bcd                            ; $0ba3: $cd $cd $0b
    ld a, $01                                     ; $0ba6: $3e $01
    ld [$c000], a                                 ; $0ba8: $ea $00 $c0
    ret                                           ; $0bab: $c9


Call_000_0bac:
    ldh a, [$ff91]                                ; $0bac: $f0 $91
    bit 1, a                                      ; $0bae: $cb $4f
    ld a, $58                                     ; $0bb0: $3e $58
    jr nz, jr_000_0bb6                            ; $0bb2: $20 $02

    ld a, $7f                                     ; $0bb4: $3e $7f

jr_000_0bb6:
    ld [$c005], a                                 ; $0bb6: $ea $05 $c0
    ld a, $7f                                     ; $0bb9: $3e $7f
    jr nz, jr_000_0bbf                            ; $0bbb: $20 $02

    ld a, $80                                     ; $0bbd: $3e $80

jr_000_0bbf:
    ld [$c004], a                                 ; $0bbf: $ea $04 $c0
    ld a, $b9                                     ; $0bc2: $3e $b9
    ld [$c003], a                                 ; $0bc4: $ea $03 $c0
    ld a, $80                                     ; $0bc7: $3e $80
    ld [$c002], a                                 ; $0bc9: $ea $02 $c0
    ret                                           ; $0bcc: $c9


Call_000_0bcd:
    ldh a, [$ff91]                                ; $0bcd: $f0 $91
    bit 1, a                                      ; $0bcf: $cb $4f
    ld a, $45                                     ; $0bd1: $3e $45
    jr nz, jr_000_0bd7                            ; $0bd3: $20 $02

    ld a, $92                                     ; $0bd5: $3e $92

jr_000_0bd7:
    jr jr_000_0bb6                                ; $0bd7: $18 $dd

    call Call_000_0db8                            ; $0bd9: $cd $b8 $0d
    call Call_000_0dfe                            ; $0bdc: $cd $fe $0d
    jp Jump_000_10a9                              ; $0bdf: $c3 $a9 $10


    ld a, [$c00a]                                 ; $0be2: $fa $0a $c0
    cp $06                                        ; $0be5: $fe $06
    jr z, jr_000_0bf7                             ; $0be7: $28 $0e

    cp $09                                        ; $0be9: $fe $09
    jr z, jr_000_0bf7                             ; $0beb: $28 $0a

    ld a, [$c011]                                 ; $0bed: $fa $11 $c0
    rst RST_18                                    ; $0bf0: $df

    db $03, $04, $08, $06

    jr jr_000_0bff                                ; $0bf5: $18 $08

jr_000_0bf7:
    ld a, [$c011]                                 ; $0bf7: $fa $11 $c0
    rst RST_18                                    ; $0bfa: $df

    db $03, $0a, $0c, $01

jr_000_0bff:
    ld b, a                                       ; $0bff: $47
    ld a, [$c010]                                 ; $0c00: $fa $10 $c0
    inc a                                         ; $0c03: $3c
    ld [$c010], a                                 ; $0c04: $ea $10 $c0
    cp b                                          ; $0c07: $b8
    jr c, jr_000_0c19                             ; $0c08: $38 $0f

    xor a                                         ; $0c0a: $af
    ld [$c010], a                                 ; $0c0b: $ea $10 $c0
    ld a, [$c011]                                 ; $0c0e: $fa $11 $c0
    inc a                                         ; $0c11: $3c
    cp $03                                        ; $0c12: $fe $03
    jr nc, jr_000_0c3e                            ; $0c14: $30 $28

    ld [$c011], a                                 ; $0c16: $ea $11 $c0

jr_000_0c19:
    ld a, [$c00a]                                 ; $0c19: $fa $0a $c0
    ld b, a                                       ; $0c1c: $47
    ld a, [$c011]                                 ; $0c1d: $fa $11 $c0
    add b                                         ; $0c20: $80
    rst RST_18                                    ; $0c21: $df

    db $12, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0e, $0f, $10, $10, $04, $05, $06
    db $04, $05, $06

    ld [$c001], a                                 ; $0c35: $ea $01 $c0
    call Call_000_0e77                            ; $0c38: $cd $77 $0e
    jp Jump_000_10a9                              ; $0c3b: $c3 $a9 $10


Jump_000_0c3e:
jr_000_0c3e:
    xor a                                         ; $0c3e: $af
    ld [$c010], a                                 ; $0c3f: $ea $10 $c0
    ld [$c011], a                                 ; $0c42: $ea $11 $c0
    inc a                                         ; $0c45: $3c
    ld [$c000], a                                 ; $0c46: $ea $00 $c0
    jp Jump_000_10a9                              ; $0c49: $c3 $a9 $10


    ld a, $03                                     ; $0c4c: $3e $03
    ld [$c001], a                                 ; $0c4e: $ea $01 $c0
    ld a, [$c017]                                 ; $0c51: $fa $17 $c0
    and a                                         ; $0c54: $a7
    jr nz, jr_000_0c62                            ; $0c55: $20 $0b

    ld a, $01                                     ; $0c57: $3e $01
    ld [$c040], a                                 ; $0c59: $ea $40 $c0
    ld a, $0e                                     ; $0c5c: $3e $0e
    ld [$c047], a                                 ; $0c5e: $ea $47 $c0
    xor a                                         ; $0c61: $af

jr_000_0c62:
    inc a                                         ; $0c62: $3c
    ld [$c017], a                                 ; $0c63: $ea $17 $c0
    cp $10                                        ; $0c66: $fe $10
    jr c, jr_000_0c80                             ; $0c68: $38 $16

    sub $10                                       ; $0c6a: $d6 $10
    cp $04                                        ; $0c6c: $fe $04
    jr c, jr_000_0c99                             ; $0c6e: $38 $29

    sub $04                                       ; $0c70: $d6 $04
    cp $10                                        ; $0c72: $fe $10
    jr c, jr_000_0c80                             ; $0c74: $38 $0a

    xor a                                         ; $0c76: $af
    ld [$c017], a                                 ; $0c77: $ea $17 $c0
    ld a, $05                                     ; $0c7a: $3e $05
    ld [$c000], a                                 ; $0c7c: $ea $00 $c0
    ret                                           ; $0c7f: $c9


jr_000_0c80:
    sub $08                                       ; $0c80: $d6 $08
    ld a, [$c047]                                 ; $0c82: $fa $47 $c0
    jr c, jr_000_0c8b                             ; $0c85: $38 $04

    inc a                                         ; $0c87: $3c
    inc a                                         ; $0c88: $3c
    jr jr_000_0c8d                                ; $0c89: $18 $02

jr_000_0c8b:
    dec a                                         ; $0c8b: $3d
    dec a                                         ; $0c8c: $3d

jr_000_0c8d:
    ld [$c047], a                                 ; $0c8d: $ea $47 $c0
    cp $0e                                        ; $0c90: $fe $0e
    jr nc, jr_000_0c99                            ; $0c92: $30 $05

    ld a, $13                                     ; $0c94: $3e $13
    ld [$c001], a                                 ; $0c96: $ea $01 $c0

jr_000_0c99:
    ret                                           ; $0c99: $c9


    call Call_000_0da5                            ; $0c9a: $cd $a5 $0d
    xor a                                         ; $0c9d: $af
    ldh [$ffad], a                                ; $0c9e: $e0 $ad
    ld [$c017], a                                 ; $0ca0: $ea $17 $c0
    call Call_000_0bac                            ; $0ca3: $cd $ac $0b
    call Call_000_1f6b                            ; $0ca6: $cd $6b $1f
    ldh a, [$ffbb]                                ; $0ca9: $f0 $bb
    ldh [$ffa8], a                                ; $0cab: $e0 $a8
    ld a, $30                                     ; $0cad: $3e $30
    ldh [$ffaa], a                                ; $0caf: $e0 $aa
    ld a, $05                                     ; $0cb1: $3e $05
    ld [$c000], a                                 ; $0cb3: $ea $00 $c0
    ret                                           ; $0cb6: $c9


    ld a, $03                                     ; $0cb7: $3e $03
    ld [$c001], a                                 ; $0cb9: $ea $01 $c0
    ldh a, [$ff9a]                                ; $0cbc: $f0 $9a
    and a                                         ; $0cbe: $a7
    jr nz, jr_000_0cd6                            ; $0cbf: $20 $15

    ld a, [$c017]                                 ; $0cc1: $fa $17 $c0
    inc a                                         ; $0cc4: $3c
    ld [$c017], a                                 ; $0cc5: $ea $17 $c0
    cp $b4                                        ; $0cc8: $fe $b4
    jr c, jr_000_0d13                             ; $0cca: $38 $47

    xor a                                         ; $0ccc: $af
    ld [$c017], a                                 ; $0ccd: $ea $17 $c0
    ld a, $03                                     ; $0cd0: $3e $03
    ld [$c000], a                                 ; $0cd2: $ea $00 $c0
    ret                                           ; $0cd5: $c9


jr_000_0cd6:
    xor a                                         ; $0cd6: $af
    ld [$c017], a                                 ; $0cd7: $ea $17 $c0
    ldh a, [$ff9a]                                ; $0cda: $f0 $9a
    ld c, a                                       ; $0cdc: $4f
    ldh a, [$ff91]                                ; $0cdd: $f0 $91
    bit 1, a                                      ; $0cdf: $cb $4f
    ld de, $3f80                                  ; $0ce1: $11 $80 $3f
    jr nz, jr_000_0ce9                            ; $0ce4: $20 $03

    ld de, $7380                                  ; $0ce6: $11 $80 $73

jr_000_0ce9:
    ld hl, $c004                                  ; $0ce9: $21 $04 $c0
    ld a, [hl+]                                   ; $0cec: $2a
    ld h, [hl]                                    ; $0ced: $66
    ld l, a                                       ; $0cee: $6f
    call Call_000_00c3                            ; $0cef: $cd $c3 $00
    jr nc, jr_000_0cf6                            ; $0cf2: $30 $02

    res 5, c                                      ; $0cf4: $cb $a9

jr_000_0cf6:
    ldh a, [$ff91]                                ; $0cf6: $f0 $91
    bit 1, a                                      ; $0cf8: $cb $4f
    ld de, $6480                                  ; $0cfa: $11 $80 $64
    jr nz, jr_000_0d02                            ; $0cfd: $20 $03

    ld de, $9880                                  ; $0cff: $11 $80 $98

jr_000_0d02:
    call Call_000_00c3                            ; $0d02: $cd $c3 $00
    jr c, jr_000_0d09                             ; $0d05: $38 $02

    res 4, c                                      ; $0d07: $cb $a1

jr_000_0d09:
    ld a, [$c008]                                 ; $0d09: $fa $08 $c0
    ld b, a                                       ; $0d0c: $47
    ld hl, $c004                                  ; $0d0d: $21 $04 $c0
    call Call_000_08c7                            ; $0d10: $cd $c7 $08

jr_000_0d13:
    ld a, [$c002]                                 ; $0d13: $fa $02 $c0
    ld [$c042], a                                 ; $0d16: $ea $42 $c0
    ld a, [$c003]                                 ; $0d19: $fa $03 $c0
    ld [$c043], a                                 ; $0d1c: $ea $43 $c0
    ld a, [$c004]                                 ; $0d1f: $fa $04 $c0
    ld [$c044], a                                 ; $0d22: $ea $44 $c0
    ld a, [$c005]                                 ; $0d25: $fa $05 $c0
    add $06                                       ; $0d28: $c6 $06
    call Call_000_16f9                            ; $0d2a: $cd $f9 $16
    ldh a, [$ff9b]                                ; $0d2d: $f0 $9b
    and $03                                       ; $0d2f: $e6 $03
    ret z                                         ; $0d31: $c8

    ld a, $02                                     ; $0d32: $3e $02
    ld [$c040], a                                 ; $0d34: $ea $40 $c0
    ld a, $06                                     ; $0d37: $3e $06
    ld [$c000], a                                 ; $0d39: $ea $00 $c0
    ret                                           ; $0d3c: $c9


    ld a, $04                                     ; $0d3d: $3e $04
    ld [$c001], a                                 ; $0d3f: $ea $01 $c0
    ldh a, [$ff9b]                                ; $0d42: $f0 $9b
    and $03                                       ; $0d44: $e6 $03
    jr z, jr_000_0d5e                             ; $0d46: $28 $16

    ld [$c013], a                                 ; $0d48: $ea $13 $c0
    ld a, $05                                     ; $0d4b: $3e $05
    call Call_000_3665                            ; $0d4d: $cd $65 $36
    xor a                                         ; $0d50: $af
    ld [$c010], a                                 ; $0d51: $ea $10 $c0
    ld [$c011], a                                 ; $0d54: $ea $11 $c0
    ld a, $07                                     ; $0d57: $3e $07
    ld [$c000], a                                 ; $0d59: $ea $00 $c0
    jr jr_000_0d75                                ; $0d5c: $18 $17

jr_000_0d5e:
    ld a, [$c052]                                 ; $0d5e: $fa $52 $c0
    bit 7, a                                      ; $0d61: $cb $7f
    jr z, jr_000_0d75                             ; $0d63: $28 $10

    ld a, [$c047]                                 ; $0d65: $fa $47 $c0
    cp $30                                        ; $0d68: $fe $30
    jr nc, jr_000_0d75                            ; $0d6a: $30 $09

    xor a                                         ; $0d6c: $af
    ld [$c017], a                                 ; $0d6d: $ea $17 $c0
    ld a, $05                                     ; $0d70: $3e $05
    ld [$c000], a                                 ; $0d72: $ea $00 $c0

jr_000_0d75:
    ret                                           ; $0d75: $c9


    ld a, [$c011]                                 ; $0d76: $fa $11 $c0
    rst RST_18                                    ; $0d79: $df

    db $02, $08, $0a

    ld b, a                                       ; $0d7d: $47
    ld a, [$c010]                                 ; $0d7e: $fa $10 $c0
    inc a                                         ; $0d81: $3c
    ld [$c010], a                                 ; $0d82: $ea $10 $c0
    cp b                                          ; $0d85: $b8
    jr c, jr_000_0d98                             ; $0d86: $38 $10

    xor a                                         ; $0d88: $af
    ld [$c010], a                                 ; $0d89: $ea $10 $c0
    ld a, [$c011]                                 ; $0d8c: $fa $11 $c0
    inc a                                         ; $0d8f: $3c
    cp $02                                        ; $0d90: $fe $02
    jp nc, Jump_000_0c3e                          ; $0d92: $d2 $3e $0c

    ld [$c011], a                                 ; $0d95: $ea $11 $c0

jr_000_0d98:
    ld a, [$c011]                                 ; $0d98: $fa $11 $c0
    rst RST_18                                    ; $0d9b: $df

    db $02, $05, $06

    ld [$c001], a                                 ; $0d9f: $ea $01 $c0
    jp Jump_000_0e77                              ; $0da2: $c3 $77 $0e


Call_000_0da5:
    ld a, [$c088]                                 ; $0da5: $fa $88 $c0
    ld [$c008], a                                 ; $0da8: $ea $08 $c0
    ld a, [$c089]                                 ; $0dab: $fa $89 $c0
    ld [$c009], a                                 ; $0dae: $ea $09 $c0
    ld a, [$c096]                                 ; $0db1: $fa $96 $c0
    ld [$c016], a                                 ; $0db4: $ea $16 $c0
    ret                                           ; $0db7: $c9


Call_000_0db8:
    ld a, [$c008]                                 ; $0db8: $fa $08 $c0
    ld b, a                                       ; $0dbb: $47
    ldh a, [$ff9a]                                ; $0dbc: $f0 $9a
    ld c, a                                       ; $0dbe: $4f
    ld hl, $c004                                  ; $0dbf: $21 $04 $c0
    call Call_000_08c7                            ; $0dc2: $cd $c7 $08
    ld a, [$c009]                                 ; $0dc5: $fa $09 $c0
    ld b, a                                       ; $0dc8: $47
    ld hl, $c002                                  ; $0dc9: $21 $02 $c0
    call Call_000_08f8                            ; $0dcc: $cd $f8 $08
    ld a, [$c011]                                 ; $0dcf: $fa $11 $c0
    and $04                                       ; $0dd2: $e6 $04
    srl a                                         ; $0dd4: $cb $3f
    srl a                                         ; $0dd6: $cb $3f
    ld d, a                                       ; $0dd8: $57
    ld a, c                                       ; $0dd9: $79
    and $f0                                       ; $0dda: $e6 $f0
    jr z, jr_000_0dfa                             ; $0ddc: $28 $1c

    bit 5, a                                      ; $0dde: $cb $6f
    jr z, jr_000_0de4                             ; $0de0: $28 $02

    inc d                                         ; $0de2: $14
    inc d                                         ; $0de3: $14

jr_000_0de4:
    ld a, [$c010]                                 ; $0de4: $fa $10 $c0
    add b                                         ; $0de7: $80
    ld [$c010], a                                 ; $0de8: $ea $10 $c0
    ld a, [$c011]                                 ; $0deb: $fa $11 $c0
    adc $00                                       ; $0dee: $ce $00
    ld [$c011], a                                 ; $0df0: $ea $11 $c0
    ld a, d                                       ; $0df3: $7a
    rst RST_18                                    ; $0df4: $df

    db $04, $01, $02, $11, $12

jr_000_0dfa:
    ld [$c001], a                                 ; $0dfa: $ea $01 $c0
    ret                                           ; $0dfd: $c9


Call_000_0dfe:
    ldh a, [$ff9b]                                ; $0dfe: $f0 $9b
    and $03                                       ; $0e00: $e6 $03
    ret z                                         ; $0e02: $c8

    ld [$c013], a                                 ; $0e03: $ea $13 $c0
    ld a, $05                                     ; $0e06: $3e $05
    call Call_000_3665                            ; $0e08: $cd $65 $36
    call Call_000_0890                            ; $0e0b: $cd $90 $08
    call Call_000_1722                            ; $0e0e: $cd $22 $17
    ld a, [$c004]                                 ; $0e11: $fa $04 $c0
    ld e, a                                       ; $0e14: $5f
    ld a, [$c005]                                 ; $0e15: $fa $05 $c0
    ld d, a                                       ; $0e18: $57
    call Call_000_00c3                            ; $0e19: $cd $c3 $00
    ld a, $00                                     ; $0e1c: $3e $00
    jr nc, jr_000_0e22                            ; $0e1e: $30 $02

    ld a, $03                                     ; $0e20: $3e $03

jr_000_0e22:
    ld [$c00a], a                                 ; $0e22: $ea $0a $c0
    ld hl, $0400                                  ; $0e25: $21 $00 $04
    add hl, de                                    ; $0e28: $19
    ld a, h                                       ; $0e29: $7c
    cp $08                                        ; $0e2a: $fe $08
    jr nc, jr_000_0e46                            ; $0e2c: $30 $18

    ldh a, [$ff9a]                                ; $0e2e: $f0 $9a
    bit 5, a                                      ; $0e30: $cb $6f
    jr z, jr_000_0e38                             ; $0e32: $28 $04

    ld a, $00                                     ; $0e34: $3e $00
    jr jr_000_0e3e                                ; $0e36: $18 $06

jr_000_0e38:
    bit 4, a                                      ; $0e38: $cb $67
    jr z, jr_000_0e46                             ; $0e3a: $28 $0a

    ld a, $03                                     ; $0e3c: $3e $03

jr_000_0e3e:
    ld [$c00a], a                                 ; $0e3e: $ea $0a $c0
    ld a, $ff                                     ; $0e41: $3e $ff
    ld [$c019], a                                 ; $0e43: $ea $19 $c0

jr_000_0e46:
    ld b, $00                                     ; $0e46: $06 $00
    ld a, [$c047]                                 ; $0e48: $fa $47 $c0
    cp $40                                        ; $0e4b: $fe $40
    jr c, jr_000_0e59                             ; $0e4d: $38 $0a

    ld a, [$c00a]                                 ; $0e4f: $fa $0a $c0
    add $0c                                       ; $0e52: $c6 $0c
    ld [$c00a], a                                 ; $0e54: $ea $0a $c0
    jr jr_000_0e69                                ; $0e57: $18 $10

jr_000_0e59:
    ld a, [$c00b]                                 ; $0e59: $fa $0b $c0
    cp $0c                                        ; $0e5c: $fe $0c
    jr c, jr_000_0e69                             ; $0e5e: $38 $09

    ld a, [$c00a]                                 ; $0e60: $fa $0a $c0
    add $06                                       ; $0e63: $c6 $06
    ld [$c00a], a                                 ; $0e65: $ea $0a $c0
    inc b                                         ; $0e68: $04

jr_000_0e69:
    ld a, b                                       ; $0e69: $78
    ld [$c011], a                                 ; $0e6a: $ea $11 $c0
    xor a                                         ; $0e6d: $af
    ld [$c010], a                                 ; $0e6e: $ea $10 $c0
    ld a, $02                                     ; $0e71: $3e $02
    ld [$c000], a                                 ; $0e73: $ea $00 $c0
    ret                                           ; $0e76: $c9


Call_000_0e77:
Jump_000_0e77:
    ldh a, [$ffad]                                ; $0e77: $f0 $ad
    bit 7, a                                      ; $0e79: $cb $7f
    ret nz                                        ; $0e7b: $c0

    bit 5, a                                      ; $0e7c: $cb $6f
    ret nz                                        ; $0e7e: $c0

    bit 4, a                                      ; $0e7f: $cb $67
    ret nz                                        ; $0e81: $c0

    ld a, [$c043]                                 ; $0e82: $fa $43 $c0
    cp $78                                        ; $0e85: $fe $78
    ret c                                         ; $0e87: $d8

    ld a, [$c001]                                 ; $0e88: $fa $01 $c0
    call Call_000_0a2c                            ; $0e8b: $cd $2c $0a
    ret nz                                        ; $0e8e: $c0

    ld a, c                                       ; $0e8f: $79
    ld [$c018], a                                 ; $0e90: $ea $18 $c0
    ld a, [$c018]                                 ; $0e93: $fa $18 $c0
    rst RST_18                                    ; $0e96: $df

    db $05, $f6, $f6, $f4, $f4, $f4

    add $10                                       ; $0e9d: $c6 $10
    ldh [$ffc5], a                                ; $0e9f: $e0 $c5
    ld a, [$c018]                                 ; $0ea1: $fa $18 $c0
    rst RST_18                                    ; $0ea4: $df

    db $05, $06, $06, $02, $02, $04

    add $11                                       ; $0eab: $c6 $11
    ld b, a                                       ; $0ead: $47
    ldh a, [$ffc5]                                ; $0eae: $f0 $c5
    ld c, a                                       ; $0eb0: $4f
    ld hl, $c002                                  ; $0eb1: $21 $02 $c0
    call Call_000_1c05                            ; $0eb4: $cd $05 $1c
    ret nc                                        ; $0eb7: $d0

    cp c                                          ; $0eb8: $b9
    ret c                                         ; $0eb9: $d8

    ld a, [$c018]                                 ; $0eba: $fa $18 $c0
    rst RST_18                                    ; $0ebd: $df

    db $05, $fe, $fe, $fb, $fb, $fc

    ld b, a                                       ; $0ec4: $47
    ldh a, [$ffc5]                                ; $0ec5: $f0 $c5
    sub b                                         ; $0ec7: $90
    bit 7, a                                      ; $0ec8: $cb $7f
    jr z, jr_000_0ed0                             ; $0eca: $28 $04

    cpl                                           ; $0ecc: $2f
    inc a                                         ; $0ecd: $3c
    set 7, a                                      ; $0ece: $cb $ff

jr_000_0ed0:
    ld b, a                                       ; $0ed0: $47
    ld a, [$c018]                                 ; $0ed1: $fa $18 $c0
    bit 0, a                                      ; $0ed4: $cb $47
    ld a, b                                       ; $0ed6: $78
    jr z, jr_000_0edb                             ; $0ed7: $28 $02

    xor $80                                       ; $0ed9: $ee $80

jr_000_0edb:
    ld [$c014], a                                 ; $0edb: $ea $14 $c0
    ld a, [$c018]                                 ; $0ede: $fa $18 $c0
    rst RST_18                                    ; $0ee1: $df

    db $05, $fc, $ee, $fc, $f2, $fe

    add $1e                                       ; $0ee8: $c6 $1e
    ldh [$ffc5], a                                ; $0eea: $e0 $c5
    ld a, [$c018]                                 ; $0eec: $fa $18 $c0
    rst RST_18                                    ; $0eef: $df

    db $05, $12, $04, $0e, $04, $0a

    add $23                                       ; $0ef6: $c6 $23
    ld b, a                                       ; $0ef8: $47
    ldh a, [$ffc5]                                ; $0ef9: $f0 $c5
    ld c, a                                       ; $0efb: $4f
    ld hl, $c004                                  ; $0efc: $21 $04 $c0
    call Call_000_1bef                            ; $0eff: $cd $ef $1b
    add $20                                       ; $0f02: $c6 $20
    cp b                                          ; $0f04: $b8
    ret nc                                        ; $0f05: $d0

    cp c                                          ; $0f06: $b9
    ret c                                         ; $0f07: $d8

    ld a, [$c018]                                 ; $0f08: $fa $18 $c0
    rst RST_18                                    ; $0f0b: $df

    db $05, $02, $02, $10, $10, $30

    ldh [$ffc5], a                                ; $0f12: $e0 $c5
    ld a, [$c018]                                 ; $0f14: $fa $18 $c0
    rst RST_18                                    ; $0f17: $df

    db $05, $30, $30, $40, $40, $50

    ld h, a                                       ; $0f1e: $67
    ldh a, [$ffc5]                                ; $0f1f: $f0 $c5
    ld l, a                                       ; $0f21: $6f
    ld a, [$c007]                                 ; $0f22: $fa $07 $c0
    call Call_000_1c20                            ; $0f25: $cd $20 $1c
    ret nc                                        ; $0f28: $d0

    cp l                                          ; $0f29: $bd
    ret c                                         ; $0f2a: $d8

    ld a, $01                                     ; $0f2b: $3e $01
    ld [$c05c], a                                 ; $0f2d: $ea $5c $c0
    ld a, $80                                     ; $0f30: $3e $80
    ld [$c04f], a                                 ; $0f32: $ea $4f $c0
    ld a, [$c000]                                 ; $0f35: $fa $00 $c0
    cp $07                                        ; $0f38: $fe $07
    jp nz, Jump_000_0fca                          ; $0f3a: $c2 $ca $0f

    ld a, [$c013]                                 ; $0f3d: $fa $13 $c0
    bit 1, a                                      ; $0f40: $cb $4f
    ld a, [$c092]                                 ; $0f42: $fa $92 $c0
    jr nz, jr_000_0f55                            ; $0f45: $20 $0e

    ld [$c051], a                                 ; $0f47: $ea $51 $c0
    ld a, [$c047]                                 ; $0f4a: $fa $47 $c0
    sub $26                                       ; $0f4d: $d6 $26
    srl a                                         ; $0f4f: $cb $3f
    add $0c                                       ; $0f51: $c6 $0c
    jr jr_000_0f68                                ; $0f53: $18 $13

jr_000_0f55:
    call Call_000_1e87                            ; $0f55: $cd $87 $1e
    ld [$c051], a                                 ; $0f58: $ea $51 $c0
    ld hl, $c015                                  ; $0f5b: $21 $15 $c0
    and $7f                                       ; $0f5e: $e6 $7f
    ld [hl], a                                    ; $0f60: $77
    ld e, $58                                     ; $0f61: $1e $58
    call Call_000_1cf6                            ; $0f63: $cd $f6 $1c
    add $0c                                       ; $0f66: $c6 $0c

jr_000_0f68:
    ld [$c052], a                                 ; $0f68: $ea $52 $c0
    ldh a, [$ff9a]                                ; $0f6b: $f0 $9a
    call Call_000_1e3c                            ; $0f6d: $cd $3c $1e
    ld de, $846c                                  ; $0f70: $11 $6c $84
    ldh a, [$ff91]                                ; $0f73: $f0 $91
    bit 1, a                                      ; $0f75: $cb $4f
    jr nz, jr_000_0f7c                            ; $0f77: $20 $03

    ld de, $546c                                  ; $0f79: $11 $6c $54

jr_000_0f7c:
    ldh a, [$ff9a]                                ; $0f7c: $f0 $9a
    bit 5, a                                      ; $0f7e: $cb $6f
    jr z, jr_000_0f86                             ; $0f80: $28 $04

    ld a, $f0                                     ; $0f82: $3e $f0
    jr jr_000_0f8c                                ; $0f84: $18 $06

jr_000_0f86:
    bit 4, a                                      ; $0f86: $cb $67
    jr z, jr_000_0f9b                             ; $0f88: $28 $11

    ld a, $10                                     ; $0f8a: $3e $10

jr_000_0f8c:
    push af                                       ; $0f8c: $f5
    ld a, [$c013]                                 ; $0f8d: $fa $13 $c0
    bit 0, a                                      ; $0f90: $cb $47
    jr nz, jr_000_0f98                            ; $0f92: $20 $04

    pop af                                        ; $0f94: $f1
    sra a                                         ; $0f95: $cb $2f
    push af                                       ; $0f97: $f5

jr_000_0f98:
    pop af                                        ; $0f98: $f1
    add d                                         ; $0f99: $82
    ld d, a                                       ; $0f9a: $57

jr_000_0f9b:
    call Call_000_1d22                            ; $0f9b: $cd $22 $1d
    xor $80                                       ; $0f9e: $ee $80
    ld b, a                                       ; $0fa0: $47
    ld a, [$c013]                                 ; $0fa1: $fa $13 $c0
    bit 1, a                                      ; $0fa4: $cb $4f
    ld c, $10                                     ; $0fa6: $0e $10
    jr z, jr_000_0fac                             ; $0fa8: $28 $02

    ld c, $04                                     ; $0faa: $0e $04

jr_000_0fac:
    ld a, [$c0df]                                 ; $0fac: $fa $df $c0
    cp $03                                        ; $0faf: $fe $03
    jr nc, jr_000_0fb7                            ; $0fb1: $30 $04

    srl c                                         ; $0fb3: $cb $39
    srl c                                         ; $0fb5: $cb $39

jr_000_0fb7:
    ldh a, [$ff9a]                                ; $0fb7: $f0 $9a
    call Call_000_1e0d                            ; $0fb9: $cd $0d $1e
    ld a, b                                       ; $0fbc: $78
    ld [$c050], a                                 ; $0fbd: $ea $50 $c0
    ld a, [$c018]                                 ; $0fc0: $fa $18 $c0
    ld b, a                                       ; $0fc3: $47
    ld a, [$c013]                                 ; $0fc4: $fa $13 $c0
    jp Jump_000_165c                              ; $0fc7: $c3 $5c $16


Jump_000_0fca:
    ld a, [$c019]                                 ; $0fca: $fa $19 $c0
    and a                                         ; $0fcd: $a7
    jr z, jr_000_0fdc                             ; $0fce: $28 $0c

    ld a, [$c018]                                 ; $0fd0: $fa $18 $c0
    add $05                                       ; $0fd3: $c6 $05
    ld [$c018], a                                 ; $0fd5: $ea $18 $c0
    xor a                                         ; $0fd8: $af
    ld [$c019], a                                 ; $0fd9: $ea $19 $c0

jr_000_0fdc:
    ld a, [$c00a]                                 ; $0fdc: $fa $0a $c0

jr_000_0fdf:
    cp $06                                        ; $0fdf: $fe $06
    jr c, jr_000_0fe7                             ; $0fe1: $38 $04

    sub $06                                       ; $0fe3: $d6 $06
    jr jr_000_0fdf                                ; $0fe5: $18 $f8

jr_000_0fe7:
    ld b, $04                                     ; $0fe7: $06 $04
    and a                                         ; $0fe9: $a7
    jr z, jr_000_0fee                             ; $0fea: $28 $02

    ld b, $fc                                     ; $0fec: $06 $fc

jr_000_0fee:
    ld hl, $c016                                  ; $0fee: $21 $16 $c0
    ldh a, [$ff9a]                                ; $0ff1: $f0 $9a
    call Call_000_1e9f                            ; $0ff3: $cd $9f $1e
    call Call_000_08bc                            ; $0ff6: $cd $bc $08
    sub $b9                                       ; $0ff9: $d6 $b9
    jr nc, jr_000_1009                            ; $0ffb: $30 $0c

    cpl                                           ; $0ffd: $2f
    inc a                                         ; $0ffe: $3c
    sra a                                         ; $0fff: $cb $2f
    sra a                                         ; $1001: $cb $2f
    ld e, a                                       ; $1003: $5f
    ld a, $52                                     ; $1004: $3e $52
    sub e                                         ; $1006: $93
    jr jr_000_100f                                ; $1007: $18 $06

jr_000_1009:
    sra a                                         ; $1009: $cb $2f
    sra a                                         ; $100b: $cb $2f
    add $52                                       ; $100d: $c6 $52

jr_000_100f:
    ld e, a                                       ; $100f: $5f
    ld d, $6c                                     ; $1010: $16 $6c
    ld a, [$c00a]                                 ; $1012: $fa $0a $c0
    cp $0c                                        ; $1015: $fe $0c
    jr nc, jr_000_1028                            ; $1017: $30 $0f

    ld a, [$c018]                                 ; $1019: $fa $18 $c0
    sub $05                                       ; $101c: $d6 $05
    jr c, jr_000_1028                             ; $101e: $38 $08

    ld d, $5c                                     ; $1020: $16 $5c
    bit 0, a                                      ; $1022: $cb $47
    jr z, jr_000_1028                             ; $1024: $28 $02

    ld d, $7c                                     ; $1026: $16 $7c

jr_000_1028:
    ld a, [$c00a]                                 ; $1028: $fa $0a $c0
    cp $0c                                        ; $102b: $fe $0c
    jr c, jr_000_1037                             ; $102d: $38 $08

    ld e, $68                                     ; $102f: $1e $68
    ld a, [hl]                                    ; $1031: $7e
    add $10                                       ; $1032: $c6 $10
    ld [hl], a                                    ; $1034: $77
    jr jr_000_1046                                ; $1035: $18 $0f

jr_000_1037:
    cp $06                                        ; $1037: $fe $06
    jr c, jr_000_1046                             ; $1039: $38 $0b

    ld e, $58                                     ; $103b: $1e $58
    ld a, [hl]                                    ; $103d: $7e
    sub $10                                       ; $103e: $d6 $10
    ld [hl], a                                    ; $1040: $77
    ld a, $02                                     ; $1041: $3e $02
    ld [$c05c], a                                 ; $1043: $ea $5c $c0

jr_000_1046:
    ld a, [$c018]                                 ; $1046: $fa $18 $c0
    cp $05                                        ; $1049: $fe $05
    jr nc, jr_000_1055                            ; $104b: $30 $08

    push hl                                       ; $104d: $e5
    ld hl, $c004                                  ; $104e: $21 $04 $c0
    call Call_000_1e6e                            ; $1051: $cd $6e $1e
    pop hl                                        ; $1054: $e1

jr_000_1055:
    ldh a, [$ff9a]                                ; $1055: $f0 $9a
    ld b, a                                       ; $1057: $47
    ld a, [$c00a]                                 ; $1058: $fa $0a $c0
    call Call_000_1d71                            ; $105b: $cd $71 $1d
    ld a, [$c00a]                                 ; $105e: $fa $0a $c0
    call Call_000_1d90                            ; $1061: $cd $90 $1d
    call Call_000_1cf6                            ; $1064: $cd $f6 $1c
    ld a, [$c00a]                                 ; $1067: $fa $0a $c0
    cp $0c                                        ; $106a: $fe $0c
    jr c, jr_000_1078                             ; $106c: $38 $0a

    ld a, $90                                     ; $106e: $3e $90
    ld [$c052], a                                 ; $1070: $ea $52 $c0
    ld a, $22                                     ; $1073: $3e $22
    ld [$c05c], a                                 ; $1075: $ea $5c $c0

jr_000_1078:
    ld a, [$c015]                                 ; $1078: $fa $15 $c0
    ld b, a                                       ; $107b: $47
    ld a, [$c013]                                 ; $107c: $fa $13 $c0
    call Call_000_1dd9                            ; $107f: $cd $d9 $1d
    ld a, b                                       ; $1082: $78
    ld [$c051], a                                 ; $1083: $ea $51 $c0
    ld a, $80                                     ; $1086: $3e $80
    ld [$c04f], a                                 ; $1088: $ea $4f $c0
    call Call_000_1d22                            ; $108b: $cd $22 $1d
    ld c, $10                                     ; $108e: $0e $10
    ld hl, $c014                                  ; $1090: $21 $14 $c0
    call Call_000_1d57                            ; $1093: $cd $57 $1d
    call Call_000_1cb1                            ; $1096: $cd $b1 $1c
    ld a, [$c018]                                 ; $1099: $fa $18 $c0
    cp $05                                        ; $109c: $fe $05
    jr c, jr_000_10a2                             ; $109e: $38 $02

    sub $05                                       ; $10a0: $d6 $05

jr_000_10a2:
    ld b, a                                       ; $10a2: $47
    ld a, [$c013]                                 ; $10a3: $fa $13 $c0
    jp Jump_000_165c                              ; $10a6: $c3 $5c $16


Jump_000_10a9:
    ldh a, [$ffad]                                ; $10a9: $f0 $ad
    bit 7, a                                      ; $10ab: $cb $7f
    ret nz                                        ; $10ad: $c0

    bit 4, a                                      ; $10ae: $cb $67
    ret nz                                        ; $10b0: $c0

    call Call_000_0890                            ; $10b1: $cd $90 $08
    ld b, a                                       ; $10b4: $47
    call Call_000_08bc                            ; $10b5: $cd $bc $08
    sub b                                         ; $10b8: $90
    jr nc, jr_000_10bd                            ; $10b9: $30 $02

    cpl                                           ; $10bb: $2f
    inc a                                         ; $10bc: $3c

jr_000_10bd:
    cp $03                                        ; $10bd: $fe $03
    ret nc                                        ; $10bf: $d0

    call Call_000_0885                            ; $10c0: $cd $85 $08
    ld b, a                                       ; $10c3: $47
    call Call_000_08b1                            ; $10c4: $cd $b1 $08
    sub b                                         ; $10c7: $90
    jr nc, jr_000_10cc                            ; $10c8: $30 $02

    cpl                                           ; $10ca: $2f
    inc a                                         ; $10cb: $3c

jr_000_10cc:
    cp $04                                        ; $10cc: $fe $04
    ret nc                                        ; $10ce: $d0

    ld a, [$c047]                                 ; $10cf: $fa $47 $c0
    cp $34                                        ; $10d2: $fe $34
    ret nc                                        ; $10d4: $d0

    ldh a, [$ffad]                                ; $10d5: $f0 $ad
    bit 3, a                                      ; $10d7: $cb $5f
    jr z, jr_000_10df                             ; $10d9: $28 $04

    or $30                                        ; $10db: $f6 $30
    jr jr_000_10e3                                ; $10dd: $18 $04

jr_000_10df:
    or $38                                        ; $10df: $f6 $38
    ldh [$ffae], a                                ; $10e1: $e0 $ae

jr_000_10e3:
    ldh [$ffad], a                                ; $10e3: $e0 $ad
    ld a, $0d                                     ; $10e5: $3e $0d
    call Call_000_3665                            ; $10e7: $cd $65 $36
    jp Jump_000_1c84                              ; $10ea: $c3 $84 $1c


Call_000_10ed:
    ld hl, $ff96                                  ; $10ed: $21 $96 $ff
    set 7, [hl]                                   ; $10f0: $cb $fe
    ld hl, $c022                                  ; $10f2: $21 $22 $c0
    call Call_000_09fa                            ; $10f5: $cd $fa $09
    ld a, c                                       ; $10f8: $79
    ld [$c02b], a                                 ; $10f9: $ea $2b $c0
    ld a, [$c020]                                 ; $10fc: $fa $20 $c0
    rst RST_08                                    ; $10ff: $cf

    db $10, $11, $49, $11, $52, $11, $bc, $11, $0a, $12, $29, $12, $af, $12, $e8, $12

    call Call_000_1317                            ; $1110: $cd $17 $13
    call Call_000_113d                            ; $1113: $cd $3d $11
    ld a, $01                                     ; $1116: $3e $01
    ld [$c020], a                                 ; $1118: $ea $20 $c0
    ret                                           ; $111b: $c9


Call_000_111c:
    ldh a, [$ff91]                                ; $111c: $f0 $91
    bit 1, a                                      ; $111e: $cb $4f
    ld a, $58                                     ; $1120: $3e $58
    jr z, jr_000_1126                             ; $1122: $28 $02

    ld a, $7f                                     ; $1124: $3e $7f

jr_000_1126:
    ld [$c025], a                                 ; $1126: $ea $25 $c0
    ld a, $7f                                     ; $1129: $3e $7f
    jr z, jr_000_112f                             ; $112b: $28 $02

    ld a, $80                                     ; $112d: $3e $80

jr_000_112f:
    ld [$c024], a                                 ; $112f: $ea $24 $c0
    ld a, $36                                     ; $1132: $3e $36
    ld [$c023], a                                 ; $1134: $ea $23 $c0
    ld a, $7f                                     ; $1137: $3e $7f
    ld [$c022], a                                 ; $1139: $ea $22 $c0
    ret                                           ; $113c: $c9


Call_000_113d:
    ldh a, [$ff91]                                ; $113d: $f0 $91
    bit 1, a                                      ; $113f: $cb $4f
    ld a, $45                                     ; $1141: $3e $45
    jr z, jr_000_1147                             ; $1143: $28 $02

    ld a, $92                                     ; $1145: $3e $92

jr_000_1147:
    jr jr_000_1126                                ; $1147: $18 $dd

    call Call_000_132a                            ; $1149: $cd $2a $13
    call Call_000_1370                            ; $114c: $cd $70 $13
    jp Jump_000_1618                              ; $114f: $c3 $18 $16


    ld a, [$c02a]                                 ; $1152: $fa $2a $c0
    cp $06                                        ; $1155: $fe $06
    jr z, jr_000_1167                             ; $1157: $28 $0e

    cp $09                                        ; $1159: $fe $09
    jr z, jr_000_1167                             ; $115b: $28 $0a

    ld a, [$c031]                                 ; $115d: $fa $31 $c0
    rst RST_18                                    ; $1160: $df

    db $03, $04, $08, $06

    jr jr_000_116f                                ; $1165: $18 $08

jr_000_1167:
    ld a, [$c031]                                 ; $1167: $fa $31 $c0
    rst RST_18                                    ; $116a: $df

    db $03, $0a, $0c, $01

jr_000_116f:
    ld b, a                                       ; $116f: $47
    ld a, [$c030]                                 ; $1170: $fa $30 $c0
    inc a                                         ; $1173: $3c
    ld [$c030], a                                 ; $1174: $ea $30 $c0
    cp b                                          ; $1177: $b8
    jr c, jr_000_1189                             ; $1178: $38 $0f

    xor a                                         ; $117a: $af
    ld [$c030], a                                 ; $117b: $ea $30 $c0
    ld a, [$c031]                                 ; $117e: $fa $31 $c0
    inc a                                         ; $1181: $3c
    cp $03                                        ; $1182: $fe $03
    jr nc, jr_000_11ae                            ; $1184: $30 $28

    ld [$c031], a                                 ; $1186: $ea $31 $c0

jr_000_1189:
    ld a, [$c02a]                                 ; $1189: $fa $2a $c0
    ld b, a                                       ; $118c: $47
    ld a, [$c031]                                 ; $118d: $fa $31 $c0
    add b                                         ; $1190: $80
    rst RST_18                                    ; $1191: $df

    db $12, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0e, $0f, $10, $10, $04, $05, $06
    db $04, $05, $06

    ld [$c021], a                                 ; $11a5: $ea $21 $c0
    call Call_000_13e8                            ; $11a8: $cd $e8 $13
    jp Jump_000_1618                              ; $11ab: $c3 $18 $16


Jump_000_11ae:
jr_000_11ae:
    xor a                                         ; $11ae: $af
    ld [$c030], a                                 ; $11af: $ea $30 $c0
    ld [$c031], a                                 ; $11b2: $ea $31 $c0
    inc a                                         ; $11b5: $3c
    ld [$c020], a                                 ; $11b6: $ea $20 $c0
    jp Jump_000_1618                              ; $11b9: $c3 $18 $16


    ld a, $03                                     ; $11bc: $3e $03
    ld [$c021], a                                 ; $11be: $ea $21 $c0
    ld a, [$c037]                                 ; $11c1: $fa $37 $c0
    and a                                         ; $11c4: $a7
    jr nz, jr_000_11d2                            ; $11c5: $20 $0b

    ld a, $01                                     ; $11c7: $3e $01
    ld [$c040], a                                 ; $11c9: $ea $40 $c0
    ld a, $0e                                     ; $11cc: $3e $0e
    ld [$c047], a                                 ; $11ce: $ea $47 $c0
    xor a                                         ; $11d1: $af

jr_000_11d2:
    inc a                                         ; $11d2: $3c
    ld [$c037], a                                 ; $11d3: $ea $37 $c0
    cp $10                                        ; $11d6: $fe $10
    jr c, jr_000_11f0                             ; $11d8: $38 $16

    sub $10                                       ; $11da: $d6 $10
    cp $04                                        ; $11dc: $fe $04
    jr c, jr_000_1209                             ; $11de: $38 $29

    sub $04                                       ; $11e0: $d6 $04
    cp $10                                        ; $11e2: $fe $10
    jr c, jr_000_11f0                             ; $11e4: $38 $0a

    xor a                                         ; $11e6: $af
    ld [$c037], a                                 ; $11e7: $ea $37 $c0
    ld a, $05                                     ; $11ea: $3e $05
    ld [$c020], a                                 ; $11ec: $ea $20 $c0
    ret                                           ; $11ef: $c9


jr_000_11f0:
    sub $08                                       ; $11f0: $d6 $08
    ld a, [$c047]                                 ; $11f2: $fa $47 $c0
    jr c, jr_000_11fb                             ; $11f5: $38 $04

    inc a                                         ; $11f7: $3c
    inc a                                         ; $11f8: $3c
    jr jr_000_11fd                                ; $11f9: $18 $02

jr_000_11fb:
    dec a                                         ; $11fb: $3d
    dec a                                         ; $11fc: $3d

jr_000_11fd:
    ld [$c047], a                                 ; $11fd: $ea $47 $c0
    cp $0e                                        ; $1200: $fe $0e
    jr nc, jr_000_1209                            ; $1202: $30 $05

    ld a, $13                                     ; $1204: $3e $13
    ld [$c021], a                                 ; $1206: $ea $21 $c0

jr_000_1209:
    ret                                           ; $1209: $c9


    call Call_000_1317                            ; $120a: $cd $17 $13
    ld a, $80                                     ; $120d: $3e $80
    ldh [$ffad], a                                ; $120f: $e0 $ad
    xor a                                         ; $1211: $af
    ld [$c037], a                                 ; $1212: $ea $37 $c0
    call Call_000_111c                            ; $1215: $cd $1c $11
    call Call_000_1f6b                            ; $1218: $cd $6b $1f
    ldh a, [$ffbb]                                ; $121b: $f0 $bb
    ldh [$ffa8], a                                ; $121d: $e0 $a8
    ld a, $28                                     ; $121f: $3e $28
    ldh [$ffaa], a                                ; $1221: $e0 $aa
    ld a, $05                                     ; $1223: $3e $05
    ld [$c020], a                                 ; $1225: $ea $20 $c0
    ret                                           ; $1228: $c9


    ld a, $03                                     ; $1229: $3e $03
    ld [$c021], a                                 ; $122b: $ea $21 $c0
    ldh a, [$ff9c]                                ; $122e: $f0 $9c
    and a                                         ; $1230: $a7
    jr nz, jr_000_1248                            ; $1231: $20 $15

    ld a, [$c037]                                 ; $1233: $fa $37 $c0
    inc a                                         ; $1236: $3c
    ld [$c037], a                                 ; $1237: $ea $37 $c0
    cp $b4                                        ; $123a: $fe $b4
    jr c, jr_000_1285                             ; $123c: $38 $47

    xor a                                         ; $123e: $af
    ld [$c037], a                                 ; $123f: $ea $37 $c0
    ld a, $03                                     ; $1242: $3e $03
    ld [$c020], a                                 ; $1244: $ea $20 $c0
    ret                                           ; $1247: $c9


jr_000_1248:
    xor a                                         ; $1248: $af
    ld [$c037], a                                 ; $1249: $ea $37 $c0
    ldh a, [$ff9c]                                ; $124c: $f0 $9c
    ld c, a                                       ; $124e: $4f
    ldh a, [$ff91]                                ; $124f: $f0 $91
    bit 1, a                                      ; $1251: $cb $4f
    ld de, $3f80                                  ; $1253: $11 $80 $3f
    jr z, jr_000_125b                             ; $1256: $28 $03

    ld de, $7380                                  ; $1258: $11 $80 $73

jr_000_125b:
    ld hl, $c024                                  ; $125b: $21 $24 $c0
    ld a, [hl+]                                   ; $125e: $2a
    ld h, [hl]                                    ; $125f: $66
    ld l, a                                       ; $1260: $6f
    call Call_000_00c3                            ; $1261: $cd $c3 $00
    jr nc, jr_000_1268                            ; $1264: $30 $02

    res 5, c                                      ; $1266: $cb $a9

jr_000_1268:
    ldh a, [$ff91]                                ; $1268: $f0 $91
    bit 1, a                                      ; $126a: $cb $4f
    ld de, $6480                                  ; $126c: $11 $80 $64
    jr z, jr_000_1274                             ; $126f: $28 $03

    ld de, $9880                                  ; $1271: $11 $80 $98

jr_000_1274:
    call Call_000_00c3                            ; $1274: $cd $c3 $00
    jr c, jr_000_127b                             ; $1277: $38 $02

    res 4, c                                      ; $1279: $cb $a1

jr_000_127b:
    ld a, [$c028]                                 ; $127b: $fa $28 $c0
    ld b, a                                       ; $127e: $47
    ld hl, $c024                                  ; $127f: $21 $24 $c0
    call Call_000_08c7                            ; $1282: $cd $c7 $08

jr_000_1285:
    ld a, [$c022]                                 ; $1285: $fa $22 $c0
    ld [$c042], a                                 ; $1288: $ea $42 $c0
    ld a, [$c023]                                 ; $128b: $fa $23 $c0
    ld [$c043], a                                 ; $128e: $ea $43 $c0
    ld a, [$c024]                                 ; $1291: $fa $24 $c0
    ld [$c044], a                                 ; $1294: $ea $44 $c0
    ld a, [$c025]                                 ; $1297: $fa $25 $c0
    sub $06                                       ; $129a: $d6 $06
    call Call_000_16f9                            ; $129c: $cd $f9 $16
    ldh a, [$ff9d]                                ; $129f: $f0 $9d
    and $03                                       ; $12a1: $e6 $03
    ret z                                         ; $12a3: $c8

    ld a, $02                                     ; $12a4: $3e $02
    ld [$c040], a                                 ; $12a6: $ea $40 $c0
    ld a, $06                                     ; $12a9: $3e $06
    ld [$c020], a                                 ; $12ab: $ea $20 $c0
    ret                                           ; $12ae: $c9


    ld a, $04                                     ; $12af: $3e $04
    ld [$c021], a                                 ; $12b1: $ea $21 $c0
    ldh a, [$ff9d]                                ; $12b4: $f0 $9d
    and $03                                       ; $12b6: $e6 $03
    jr z, jr_000_12d0                             ; $12b8: $28 $16

    ld [$c033], a                                 ; $12ba: $ea $33 $c0
    ld a, $05                                     ; $12bd: $3e $05
    call Call_000_3665                            ; $12bf: $cd $65 $36
    xor a                                         ; $12c2: $af
    ld [$c030], a                                 ; $12c3: $ea $30 $c0
    ld [$c031], a                                 ; $12c6: $ea $31 $c0
    ld a, $07                                     ; $12c9: $3e $07
    ld [$c020], a                                 ; $12cb: $ea $20 $c0
    jr jr_000_12e7                                ; $12ce: $18 $17

jr_000_12d0:
    ld a, [$c052]                                 ; $12d0: $fa $52 $c0
    bit 7, a                                      ; $12d3: $cb $7f
    jr z, jr_000_12e7                             ; $12d5: $28 $10

    ld a, [$c047]                                 ; $12d7: $fa $47 $c0
    cp $30                                        ; $12da: $fe $30
    jr nc, jr_000_12e7                            ; $12dc: $30 $09

    xor a                                         ; $12de: $af
    ld [$c037], a                                 ; $12df: $ea $37 $c0
    ld a, $05                                     ; $12e2: $3e $05
    ld [$c020], a                                 ; $12e4: $ea $20 $c0

jr_000_12e7:
    ret                                           ; $12e7: $c9


    ld a, [$c031]                                 ; $12e8: $fa $31 $c0
    rst RST_18                                    ; $12eb: $df

    db $02, $08, $0a

    ld b, a                                       ; $12ef: $47
    ld a, [$c030]                                 ; $12f0: $fa $30 $c0
    inc a                                         ; $12f3: $3c
    ld [$c030], a                                 ; $12f4: $ea $30 $c0
    cp b                                          ; $12f7: $b8
    jr c, jr_000_130a                             ; $12f8: $38 $10

    xor a                                         ; $12fa: $af
    ld [$c030], a                                 ; $12fb: $ea $30 $c0
    ld a, [$c031]                                 ; $12fe: $fa $31 $c0
    inc a                                         ; $1301: $3c
    cp $02                                        ; $1302: $fe $02
    jp nc, Jump_000_11ae                          ; $1304: $d2 $ae $11

    ld [$c031], a                                 ; $1307: $ea $31 $c0

jr_000_130a:
    ld a, [$c031]                                 ; $130a: $fa $31 $c0
    rst RST_18                                    ; $130d: $df

    db $02, $05, $06

    ld [$c021], a                                 ; $1311: $ea $21 $c0
    jp Jump_000_13e8                              ; $1314: $c3 $e8 $13


Call_000_1317:
    ld a, [$c0a8]                                 ; $1317: $fa $a8 $c0
    ld [$c028], a                                 ; $131a: $ea $28 $c0
    ld a, [$c0a9]                                 ; $131d: $fa $a9 $c0
    ld [$c029], a                                 ; $1320: $ea $29 $c0
    ld a, [$c0b6]                                 ; $1323: $fa $b6 $c0
    ld [$c036], a                                 ; $1326: $ea $36 $c0
    ret                                           ; $1329: $c9


Call_000_132a:
    ld a, [$c028]                                 ; $132a: $fa $28 $c0
    ld b, a                                       ; $132d: $47
    ldh a, [$ff9c]                                ; $132e: $f0 $9c
    ld c, a                                       ; $1330: $4f
    ld hl, $c024                                  ; $1331: $21 $24 $c0
    call Call_000_08c7                            ; $1334: $cd $c7 $08
    ld a, [$c029]                                 ; $1337: $fa $29 $c0
    ld b, a                                       ; $133a: $47
    ld hl, $c022                                  ; $133b: $21 $22 $c0
    call Call_000_08f8                            ; $133e: $cd $f8 $08
    ld a, [$c031]                                 ; $1341: $fa $31 $c0
    and $04                                       ; $1344: $e6 $04
    srl a                                         ; $1346: $cb $3f
    srl a                                         ; $1348: $cb $3f
    ld d, a                                       ; $134a: $57
    ld a, c                                       ; $134b: $79
    and $f0                                       ; $134c: $e6 $f0
    jr z, jr_000_136c                             ; $134e: $28 $1c

    bit 4, a                                      ; $1350: $cb $67
    jr z, jr_000_1356                             ; $1352: $28 $02

    inc d                                         ; $1354: $14
    inc d                                         ; $1355: $14

jr_000_1356:
    ld a, [$c030]                                 ; $1356: $fa $30 $c0
    add b                                         ; $1359: $80
    ld [$c030], a                                 ; $135a: $ea $30 $c0
    ld a, [$c031]                                 ; $135d: $fa $31 $c0
    adc $00                                       ; $1360: $ce $00
    ld [$c031], a                                 ; $1362: $ea $31 $c0
    ld a, d                                       ; $1365: $7a
    rst RST_18                                    ; $1366: $df

    db $04, $01, $02, $11, $12

jr_000_136c:
    ld [$c021], a                                 ; $136c: $ea $21 $c0
    ret                                           ; $136f: $c9


Call_000_1370:
    ldh a, [$ff9d]                                ; $1370: $f0 $9d
    and $03                                       ; $1372: $e6 $03
    ret z                                         ; $1374: $c8

    ld [$c033], a                                 ; $1375: $ea $33 $c0
    ld a, $05                                     ; $1378: $3e $05
    call Call_000_3665                            ; $137a: $cd $65 $36
    call Call_000_08a6                            ; $137d: $cd $a6 $08
    call Call_000_1722                            ; $1380: $cd $22 $17
    ld a, [$c024]                                 ; $1383: $fa $24 $c0
    ld e, a                                       ; $1386: $5f
    ld a, [$c025]                                 ; $1387: $fa $25 $c0
    ld d, a                                       ; $138a: $57
    call Call_000_00c3                            ; $138b: $cd $c3 $00
    ld a, $03                                     ; $138e: $3e $03
    jr nc, jr_000_1393                            ; $1390: $30 $01

    xor a                                         ; $1392: $af

jr_000_1393:
    ld [$c02a], a                                 ; $1393: $ea $2a $c0
    ld hl, $0400                                  ; $1396: $21 $00 $04
    add hl, de                                    ; $1399: $19
    ld a, h                                       ; $139a: $7c
    cp $08                                        ; $139b: $fe $08
    jr nc, jr_000_13b7                            ; $139d: $30 $18

    ldh a, [$ff9c]                                ; $139f: $f0 $9c
    bit 5, a                                      ; $13a1: $cb $6f
    jr z, jr_000_13a9                             ; $13a3: $28 $04

    ld a, $03                                     ; $13a5: $3e $03
    jr jr_000_13af                                ; $13a7: $18 $06

jr_000_13a9:
    bit 4, a                                      ; $13a9: $cb $67
    jr z, jr_000_13b7                             ; $13ab: $28 $0a

    ld a, $00                                     ; $13ad: $3e $00

jr_000_13af:
    ld [$c02a], a                                 ; $13af: $ea $2a $c0
    ld a, $ff                                     ; $13b2: $3e $ff
    ld [$c039], a                                 ; $13b4: $ea $39 $c0

jr_000_13b7:
    ld b, $00                                     ; $13b7: $06 $00
    ld a, [$c047]                                 ; $13b9: $fa $47 $c0
    cp $40                                        ; $13bc: $fe $40
    jr c, jr_000_13ca                             ; $13be: $38 $0a

    ld a, [$c02a]                                 ; $13c0: $fa $2a $c0
    add $0c                                       ; $13c3: $c6 $0c
    ld [$c02a], a                                 ; $13c5: $ea $2a $c0
    jr jr_000_13da                                ; $13c8: $18 $10

jr_000_13ca:
    ld a, [$c02b]                                 ; $13ca: $fa $2b $c0
    cp $0c                                        ; $13cd: $fe $0c
    jr c, jr_000_13da                             ; $13cf: $38 $09

    ld a, [$c02a]                                 ; $13d1: $fa $2a $c0
    add $06                                       ; $13d4: $c6 $06
    ld [$c02a], a                                 ; $13d6: $ea $2a $c0
    inc b                                         ; $13d9: $04

jr_000_13da:
    ld a, b                                       ; $13da: $78
    ld [$c031], a                                 ; $13db: $ea $31 $c0
    xor a                                         ; $13de: $af
    ld [$c030], a                                 ; $13df: $ea $30 $c0
    ld a, $02                                     ; $13e2: $3e $02
    ld [$c020], a                                 ; $13e4: $ea $20 $c0
    ret                                           ; $13e7: $c9


Call_000_13e8:
Jump_000_13e8:
    ldh a, [$ffad]                                ; $13e8: $f0 $ad
    bit 7, a                                      ; $13ea: $cb $7f
    ret z                                         ; $13ec: $c8

    bit 5, a                                      ; $13ed: $cb $6f
    ret nz                                        ; $13ef: $c0

    bit 4, a                                      ; $13f0: $cb $67
    ret nz                                        ; $13f2: $c0

    ld a, [$c043]                                 ; $13f3: $fa $43 $c0
    cp $78                                        ; $13f6: $fe $78
    ret nc                                        ; $13f8: $d0

    ld a, [$c021]                                 ; $13f9: $fa $21 $c0
    call Call_000_0a2c                            ; $13fc: $cd $2c $0a
    ret nz                                        ; $13ff: $c0

    ld a, c                                       ; $1400: $79
    ld [$c038], a                                 ; $1401: $ea $38 $c0
    ld a, [$c038]                                 ; $1404: $fa $38 $c0
    rst RST_18                                    ; $1407: $df

    db $05, $fa, $fa, $fe, $fe, $fc

    add $10                                       ; $140e: $c6 $10
    ldh [$ffc5], a                                ; $1410: $e0 $c5
    ld a, [$c038]                                 ; $1412: $fa $38 $c0
    rst RST_18                                    ; $1415: $df

    db $05, $0a, $0a, $0c, $0c, $0c

    add $11                                       ; $141c: $c6 $11
    ld b, a                                       ; $141e: $47
    ldh a, [$ffc5]                                ; $141f: $f0 $c5
    ld c, a                                       ; $1421: $4f
    ld hl, $c022                                  ; $1422: $21 $22 $c0
    call Call_000_1c05                            ; $1425: $cd $05 $1c
    ret nc                                        ; $1428: $d0

    cp c                                          ; $1429: $b9
    ret c                                         ; $142a: $d8

    ld a, [$c038]                                 ; $142b: $fa $38 $c0
    rst RST_18                                    ; $142e: $df

    db $05, $02, $02, $05, $05, $04

    ld b, a                                       ; $1435: $47
    ldh a, [$ffc5]                                ; $1436: $f0 $c5
    sub b                                         ; $1438: $90
    bit 7, a                                      ; $1439: $cb $7f
    jr z, jr_000_1441                             ; $143b: $28 $04

    cpl                                           ; $143d: $2f
    inc a                                         ; $143e: $3c
    set 7, a                                      ; $143f: $cb $ff

jr_000_1441:
    ld b, a                                       ; $1441: $47
    ld a, [$c038]                                 ; $1442: $fa $38 $c0
    bit 0, a                                      ; $1445: $cb $47
    ld a, b                                       ; $1447: $78
    jr z, jr_000_144c                             ; $1448: $28 $02

    xor $80                                       ; $144a: $ee $80

jr_000_144c:
    ld [$c034], a                                 ; $144c: $ea $34 $c0
    ld a, [$c038]                                 ; $144f: $fa $38 $c0
    rst RST_18                                    ; $1452: $df

    db $05, $ee, $fc, $f2, $fc, $f6

    add $1e                                       ; $1459: $c6 $1e
    ldh [$ffc5], a                                ; $145b: $e0 $c5
    ld a, [$c038]                                 ; $145d: $fa $38 $c0
    rst RST_18                                    ; $1460: $df

    db $05, $04, $12, $04, $0e, $02

    add $23                                       ; $1467: $c6 $23
    ld b, a                                       ; $1469: $47
    ldh a, [$ffc5]                                ; $146a: $f0 $c5
    ld c, a                                       ; $146c: $4f
    ld hl, $c024                                  ; $146d: $21 $24 $c0
    call Call_000_1bef                            ; $1470: $cd $ef $1b
    add $20                                       ; $1473: $c6 $20
    cp b                                          ; $1475: $b8
    ret nc                                        ; $1476: $d0

    cp c                                          ; $1477: $b9
    ret c                                         ; $1478: $d8

    ld a, [$c038]                                 ; $1479: $fa $38 $c0
    rst RST_18                                    ; $147c: $df

    db $05, $02, $02, $10, $10, $30

    ldh [$ffc5], a                                ; $1483: $e0 $c5
    ld a, [$c038]                                 ; $1485: $fa $38 $c0
    rst RST_18                                    ; $1488: $df

    db $05, $30, $30, $40, $40, $50

    ld h, a                                       ; $148f: $67
    ldh a, [$ffc5]                                ; $1490: $f0 $c5
    ld l, a                                       ; $1492: $6f
    ld a, [$c027]                                 ; $1493: $fa $27 $c0
    call Call_000_1c20                            ; $1496: $cd $20 $1c
    ret nc                                        ; $1499: $d0

    cp l                                          ; $149a: $bd
    ret c                                         ; $149b: $d8

    ld a, $01                                     ; $149c: $3e $01
    ld [$c05c], a                                 ; $149e: $ea $5c $c0
    xor a                                         ; $14a1: $af
    ld [$c04f], a                                 ; $14a2: $ea $4f $c0
    ld a, [$c020]                                 ; $14a5: $fa $20 $c0
    cp $07                                        ; $14a8: $fe $07
    jp nz, Jump_000_153a                          ; $14aa: $c2 $3a $15

    ld a, [$c033]                                 ; $14ad: $fa $33 $c0
    bit 1, a                                      ; $14b0: $cb $4f
    ld a, [$c0b2]                                 ; $14b2: $fa $b2 $c0
    jr nz, jr_000_14c5                            ; $14b5: $20 $0e

    ld [$c051], a                                 ; $14b7: $ea $51 $c0
    ld a, [$c047]                                 ; $14ba: $fa $47 $c0
    sub $26                                       ; $14bd: $d6 $26
    srl a                                         ; $14bf: $cb $3f
    add $0c                                       ; $14c1: $c6 $0c
    jr jr_000_14d8                                ; $14c3: $18 $13

jr_000_14c5:
    call Call_000_1e87                            ; $14c5: $cd $87 $1e
    ld [$c051], a                                 ; $14c8: $ea $51 $c0
    ld hl, $c035                                  ; $14cb: $21 $35 $c0
    and $7f                                       ; $14ce: $e6 $7f
    ld [hl], a                                    ; $14d0: $77
    ld e, $98                                     ; $14d1: $1e $98
    call Call_000_1cf6                            ; $14d3: $cd $f6 $1c
    add $0c                                       ; $14d6: $c6 $0c

jr_000_14d8:
    ld [$c052], a                                 ; $14d8: $ea $52 $c0
    ldh a, [$ff9c]                                ; $14db: $f0 $9c
    call Call_000_1e60                            ; $14dd: $cd $60 $1e
    ld de, $5484                                  ; $14e0: $11 $84 $54
    ldh a, [$ff91]                                ; $14e3: $f0 $91
    bit 1, a                                      ; $14e5: $cb $4f
    jr nz, jr_000_14ec                            ; $14e7: $20 $03

    ld de, $8484                                  ; $14e9: $11 $84 $84

jr_000_14ec:
    ldh a, [$ff9c]                                ; $14ec: $f0 $9c
    bit 5, a                                      ; $14ee: $cb $6f
    jr z, jr_000_14f6                             ; $14f0: $28 $04

    ld a, $f0                                     ; $14f2: $3e $f0
    jr jr_000_14fc                                ; $14f4: $18 $06

jr_000_14f6:
    bit 4, a                                      ; $14f6: $cb $67
    jr z, jr_000_150b                             ; $14f8: $28 $11

    ld a, $10                                     ; $14fa: $3e $10

jr_000_14fc:
    push af                                       ; $14fc: $f5
    ld a, [$c033]                                 ; $14fd: $fa $33 $c0
    bit 0, a                                      ; $1500: $cb $47
    jr nz, jr_000_1508                            ; $1502: $20 $04

    pop af                                        ; $1504: $f1
    sra a                                         ; $1505: $cb $2f
    push af                                       ; $1507: $f5

jr_000_1508:
    pop af                                        ; $1508: $f1
    add d                                         ; $1509: $82
    ld d, a                                       ; $150a: $57

jr_000_150b:
    call Call_000_1d22                            ; $150b: $cd $22 $1d
    xor $80                                       ; $150e: $ee $80
    ld b, a                                       ; $1510: $47
    ld a, [$c033]                                 ; $1511: $fa $33 $c0
    bit 1, a                                      ; $1514: $cb $4f
    ld c, $10                                     ; $1516: $0e $10
    jr z, jr_000_151c                             ; $1518: $28 $02

    ld c, $04                                     ; $151a: $0e $04

jr_000_151c:
    ld a, [$c0df]                                 ; $151c: $fa $df $c0
    cp $03                                        ; $151f: $fe $03
    jr nc, jr_000_1527                            ; $1521: $30 $04

    srl c                                         ; $1523: $cb $39
    srl c                                         ; $1525: $cb $39

jr_000_1527:
    ldh a, [$ff9c]                                ; $1527: $f0 $9c
    call Call_000_1e0d                            ; $1529: $cd $0d $1e
    ld a, b                                       ; $152c: $78
    ld [$c050], a                                 ; $152d: $ea $50 $c0
    ld a, [$c038]                                 ; $1530: $fa $38 $c0
    ld b, a                                       ; $1533: $47
    ld a, [$c033]                                 ; $1534: $fa $33 $c0
    jp Jump_000_165c                              ; $1537: $c3 $5c $16


Jump_000_153a:
    ld a, [$c039]                                 ; $153a: $fa $39 $c0
    and a                                         ; $153d: $a7
    jr z, jr_000_154c                             ; $153e: $28 $0c

    ld a, [$c038]                                 ; $1540: $fa $38 $c0
    add $05                                       ; $1543: $c6 $05
    ld [$c038], a                                 ; $1545: $ea $38 $c0
    xor a                                         ; $1548: $af
    ld [$c039], a                                 ; $1549: $ea $39 $c0

jr_000_154c:
    ld a, [$c02a]                                 ; $154c: $fa $2a $c0

jr_000_154f:
    cp $06                                        ; $154f: $fe $06
    jr c, jr_000_1557                             ; $1551: $38 $04

    sub $06                                       ; $1553: $d6 $06
    jr jr_000_154f                                ; $1555: $18 $f8

jr_000_1557:
    ld b, $04                                     ; $1557: $06 $04
    and a                                         ; $1559: $a7
    jr z, jr_000_155e                             ; $155a: $28 $02

    ld b, $fc                                     ; $155c: $06 $fc

jr_000_155e:
    ld hl, $c036                                  ; $155e: $21 $36 $c0
    ldh a, [$ff9c]                                ; $1561: $f0 $9c
    call Call_000_1ec3                            ; $1563: $cd $c3 $1e
    call Call_000_08bc                            ; $1566: $cd $bc $08
    sub $37                                       ; $1569: $d6 $37
    jr nc, jr_000_1579                            ; $156b: $30 $0c

    cpl                                           ; $156d: $2f
    inc a                                         ; $156e: $3c
    sra a                                         ; $156f: $cb $2f
    sra a                                         ; $1571: $cb $2f
    ld e, a                                       ; $1573: $5f
    ld a, $9e                                     ; $1574: $3e $9e
    sub e                                         ; $1576: $93
    jr jr_000_157f                                ; $1577: $18 $06

jr_000_1579:
    sra a                                         ; $1579: $cb $2f
    sra a                                         ; $157b: $cb $2f
    add $9e                                       ; $157d: $c6 $9e

jr_000_157f:
    ld e, a                                       ; $157f: $5f
    ld d, $6c                                     ; $1580: $16 $6c
    ld a, [$c02a]                                 ; $1582: $fa $2a $c0
    cp $0c                                        ; $1585: $fe $0c
    jr nc, jr_000_1598                            ; $1587: $30 $0f

    ld a, [$c038]                                 ; $1589: $fa $38 $c0
    sub $05                                       ; $158c: $d6 $05
    jr c, jr_000_1598                             ; $158e: $38 $08

    ld d, $7c                                     ; $1590: $16 $7c
    bit 0, a                                      ; $1592: $cb $47
    jr z, jr_000_1598                             ; $1594: $28 $02

    ld d, $5c                                     ; $1596: $16 $5c

jr_000_1598:
    ld a, [$c02a]                                 ; $1598: $fa $2a $c0
    cp $0c                                        ; $159b: $fe $0c
    jr c, jr_000_15a7                             ; $159d: $38 $08

    ld e, $88                                     ; $159f: $1e $88
    ld a, [hl]                                    ; $15a1: $7e
    add $10                                       ; $15a2: $c6 $10
    ld [hl], a                                    ; $15a4: $77
    jr jr_000_15b6                                ; $15a5: $18 $0f

jr_000_15a7:
    cp $06                                        ; $15a7: $fe $06
    jr c, jr_000_15b6                             ; $15a9: $38 $0b

    ld e, $98                                     ; $15ab: $1e $98
    ld a, [hl]                                    ; $15ad: $7e
    sub $10                                       ; $15ae: $d6 $10
    ld [hl], a                                    ; $15b0: $77
    ld a, $02                                     ; $15b1: $3e $02
    ld [$c05c], a                                 ; $15b3: $ea $5c $c0

jr_000_15b6:
    ld a, [$c038]                                 ; $15b6: $fa $38 $c0
    cp $05                                        ; $15b9: $fe $05
    jr nc, jr_000_15c5                            ; $15bb: $30 $08

    push hl                                       ; $15bd: $e5
    ld hl, $c024                                  ; $15be: $21 $24 $c0
    call Call_000_1e6e                            ; $15c1: $cd $6e $1e
    pop hl                                        ; $15c4: $e1

jr_000_15c5:
    ldh a, [$ff9c]                                ; $15c5: $f0 $9c
    ld b, a                                       ; $15c7: $47
    ld a, [$c02a]                                 ; $15c8: $fa $2a $c0
    call Call_000_1d71                            ; $15cb: $cd $71 $1d
    ld a, [$c02a]                                 ; $15ce: $fa $2a $c0
    call Call_000_1db3                            ; $15d1: $cd $b3 $1d
    call Call_000_1cf6                            ; $15d4: $cd $f6 $1c
    ld a, [$c02a]                                 ; $15d7: $fa $2a $c0
    cp $0c                                        ; $15da: $fe $0c
    jr c, jr_000_15e8                             ; $15dc: $38 $0a

    ld a, $90                                     ; $15de: $3e $90
    ld [$c052], a                                 ; $15e0: $ea $52 $c0
    ld a, $22                                     ; $15e3: $3e $22
    ld [$c05c], a                                 ; $15e5: $ea $5c $c0

jr_000_15e8:
    ld a, [$c035]                                 ; $15e8: $fa $35 $c0
    ld b, a                                       ; $15eb: $47
    ld a, [$c033]                                 ; $15ec: $fa $33 $c0
    call Call_000_1de7                            ; $15ef: $cd $e7 $1d
    ld a, b                                       ; $15f2: $78
    ld [$c051], a                                 ; $15f3: $ea $51 $c0
    xor a                                         ; $15f6: $af
    ld [$c04f], a                                 ; $15f7: $ea $4f $c0
    call Call_000_1d22                            ; $15fa: $cd $22 $1d
    ld c, $10                                     ; $15fd: $0e $10
    ld hl, $c034                                  ; $15ff: $21 $34 $c0
    call Call_000_1d57                            ; $1602: $cd $57 $1d
    call Call_000_1cb1                            ; $1605: $cd $b1 $1c
    ld a, [$c038]                                 ; $1608: $fa $38 $c0
    cp $05                                        ; $160b: $fe $05
    jr c, jr_000_1611                             ; $160d: $38 $02

    sub $05                                       ; $160f: $d6 $05

jr_000_1611:
    ld b, a                                       ; $1611: $47
    ld a, [$c033]                                 ; $1612: $fa $33 $c0
    jp Jump_000_165c                              ; $1615: $c3 $5c $16


Jump_000_1618:
    ldh a, [$ffad]                                ; $1618: $f0 $ad
    bit 7, a                                      ; $161a: $cb $7f
    ret z                                         ; $161c: $c8

    bit 4, a                                      ; $161d: $cb $67
    ret nz                                        ; $161f: $c0

    call Call_000_08a6                            ; $1620: $cd $a6 $08
    ld b, a                                       ; $1623: $47
    call Call_000_08bc                            ; $1624: $cd $bc $08
    sub b                                         ; $1627: $90
    jr nc, jr_000_162c                            ; $1628: $30 $02

    cpl                                           ; $162a: $2f
    inc a                                         ; $162b: $3c

jr_000_162c:
    cp $03                                        ; $162c: $fe $03
    ret nc                                        ; $162e: $d0

    call Call_000_089b                            ; $162f: $cd $9b $08
    ld b, a                                       ; $1632: $47
    call Call_000_08b1                            ; $1633: $cd $b1 $08
    sub b                                         ; $1636: $90
    jr nc, jr_000_163b                            ; $1637: $30 $02

    cpl                                           ; $1639: $2f
    inc a                                         ; $163a: $3c

jr_000_163b:
    cp $04                                        ; $163b: $fe $04
    ret nc                                        ; $163d: $d0

    ld a, [$c047]                                 ; $163e: $fa $47 $c0
    cp $34                                        ; $1641: $fe $34
    ret nc                                        ; $1643: $d0

    ldh a, [$ffad]                                ; $1644: $f0 $ad
    bit 3, a                                      ; $1646: $cb $5f
    jr z, jr_000_164e                             ; $1648: $28 $04

    or $30                                        ; $164a: $f6 $30
    jr jr_000_1652                                ; $164c: $18 $04

jr_000_164e:
    or $38                                        ; $164e: $f6 $38
    ldh [$ffae], a                                ; $1650: $e0 $ae

jr_000_1652:
    ldh [$ffad], a                                ; $1652: $e0 $ad
    ld a, $0d                                     ; $1654: $3e $0d
    call Call_000_3665                            ; $1656: $cd $65 $36
    jp Jump_000_1c84                              ; $1659: $c3 $84 $1c


Jump_000_165c:
    ldh [$ffc5], a                                ; $165c: $e0 $c5
    ld a, b                                       ; $165e: $78
    ldh [$ffc6], a                                ; $165f: $e0 $c6
    cp $05                                        ; $1661: $fe $05
    ld a, $06                                     ; $1663: $3e $06
    jr c, jr_000_1669                             ; $1665: $38 $02

    ld a, $07                                     ; $1667: $3e $07

jr_000_1669:
    call Call_000_1f42                            ; $1669: $cd $42 $1f
    ldh a, [$ffc5]                                ; $166c: $f0 $c5
    ld c, $00                                     ; $166e: $0e $00
    bit 1, a                                      ; $1670: $cb $4f
    jr z, jr_000_1687                             ; $1672: $28 $13

    ldh a, [$ffad]                                ; $1674: $f0 $ad
    bit 6, a                                      ; $1676: $cb $77
    jr z, jr_000_1687                             ; $1678: $28 $0d

    ldh a, [$ffc6]                                ; $167a: $f0 $c6
    cp $02                                        ; $167c: $fe $02
    jr nc, jr_000_1687                            ; $167e: $30 $07

    ld a, $2a                                     ; $1680: $3e $2a
    call Call_000_1f42                            ; $1682: $cd $42 $1f
    ld c, $2b                                     ; $1685: $0e $2b

jr_000_1687:
    ld a, c                                       ; $1687: $79
    ld [$c059], a                                 ; $1688: $ea $59 $c0
    xor a                                         ; $168b: $af
    ld [$c04c], a                                 ; $168c: $ea $4c $c0
    ld [$c053], a                                 ; $168f: $ea $53 $c0
    ld hl, $c05a                                  ; $1692: $21 $5a $c0
    inc [hl]                                      ; $1695: $34
    ldh a, [$ffad]                                ; $1696: $f0 $ad
    bit 3, a                                      ; $1698: $cb $5f
    jr nz, jr_000_16a8                            ; $169a: $20 $0c

    ld a, [$c040]                                 ; $169c: $fa $40 $c0
    cp $04                                        ; $169f: $fe $04
    jr z, jr_000_16a5                             ; $16a1: $28 $02

    ld a, $03                                     ; $16a3: $3e $03

jr_000_16a5:
    ld [$c040], a                                 ; $16a5: $ea $40 $c0

jr_000_16a8:
    ld a, [$c050]                                 ; $16a8: $fa $50 $c0
    and $7f                                       ; $16ab: $e6 $7f
    ld [$c054], a                                 ; $16ad: $ea $54 $c0
    ld a, [$c051]                                 ; $16b0: $fa $51 $c0
    ld [$c055], a                                 ; $16b3: $ea $55 $c0
    xor a                                         ; $16b6: $af
    ld [$c056], a                                 ; $16b7: $ea $56 $c0
    ld [$c057], a                                 ; $16ba: $ea $57 $c0
    ld a, [$c051]                                 ; $16bd: $fa $51 $c0
    ld h, a                                       ; $16c0: $67
    ld l, $00                                     ; $16c1: $2e $00
    ld a, [$c059]                                 ; $16c3: $fa $59 $c0
    and a                                         ; $16c6: $a7
    ld a, $48                                     ; $16c7: $3e $48
    jr z, jr_000_16cd                             ; $16c9: $28 $02

    ld a, $28                                     ; $16cb: $3e $28

jr_000_16cd:
    call Call_000_3143                            ; $16cd: $cd $43 $31
    ld a, h                                       ; $16d0: $7c
    and a                                         ; $16d1: $a7
    jr nz, jr_000_16d7                            ; $16d2: $20 $03

    ld hl, $00f8                                  ; $16d4: $21 $f8 $00

jr_000_16d7:
    ld a, l                                       ; $16d7: $7d
    ld [$c05d], a                                 ; $16d8: $ea $5d $c0
    swap a                                        ; $16db: $cb $37
    and $0f                                       ; $16dd: $e6 $0f
    ld l, a                                       ; $16df: $6f
    ld a, h                                       ; $16e0: $7c
    ld [$c05e], a                                 ; $16e1: $ea $5e $c0
    swap a                                        ; $16e4: $cb $37
    and $f0                                       ; $16e6: $e6 $f0
    or l                                          ; $16e8: $b5
    ld [$c058], a                                 ; $16e9: $ea $58 $c0
    xor a                                         ; $16ec: $af
    ld [$c05f], a                                 ; $16ed: $ea $5f $c0
    ldh a, [$ffad]                                ; $16f0: $f0 $ad
    xor $80                                       ; $16f2: $ee $80
    set 6, a                                      ; $16f4: $cb $f7
    ldh [$ffad], a                                ; $16f6: $e0 $ad
    ret                                           ; $16f8: $c9


Call_000_16f9:
    ld [$c045], a                                 ; $16f9: $ea $45 $c0
    ld a, $10                                     ; $16fc: $3e $10
    ld [$c047], a                                 ; $16fe: $ea $47 $c0
    xor a                                         ; $1701: $af
    ld [$c04c], a                                 ; $1702: $ea $4c $c0
    ld [$c05a], a                                 ; $1705: $ea $5a $c0
    ld [$c05f], a                                 ; $1708: $ea $5f $c0
    ld hl, $c050                                  ; $170b: $21 $50 $c0
    ld [hl+], a                                   ; $170e: $22
    ld [hl+], a                                   ; $170f: $22
    ld a, $44                                     ; $1710: $3e $44
    ld [hl], a                                    ; $1712: $77
    ld a, $14                                     ; $1713: $3e $14
    ld [$c058], a                                 ; $1715: $ea $58 $c0
    ld hl, $c05d                                  ; $1718: $21 $5d $c0
    ld a, $40                                     ; $171b: $3e $40
    ld [hl+], a                                   ; $171d: $22
    ld a, $01                                     ; $171e: $3e $01
    ld [hl], a                                    ; $1720: $77
    ret                                           ; $1721: $c9


Call_000_1722:
    ld b, a                                       ; $1722: $47
    call Call_000_08bc                            ; $1723: $cd $bc $08
    sub b                                         ; $1726: $90
    jr nc, jr_000_172b                            ; $1727: $30 $02

    cpl                                           ; $1729: $2f
    inc a                                         ; $172a: $3c

jr_000_172b:
    ld h, a                                       ; $172b: $67
    ld l, $00                                     ; $172c: $2e $00
    ld d, $00                                     ; $172e: $16 $00
    ld a, [$c051]                                 ; $1730: $fa $51 $c0
    sla a                                         ; $1733: $cb $27
    rl d                                          ; $1735: $cb $12
    sla a                                         ; $1737: $cb $27
    rl d                                          ; $1739: $cb $12
    ld e, a                                       ; $173b: $5f
    call Call_000_31d5                            ; $173c: $cd $d5 $31
    ld d, $00                                     ; $173f: $16 $00
    ld a, [$c050]                                 ; $1741: $fa $50 $c0
    sla a                                         ; $1744: $cb $27
    sla a                                         ; $1746: $cb $27
    rl d                                          ; $1748: $cb $12
    ld e, a                                       ; $174a: $5f
    call Call_000_3120                            ; $174b: $cd $20 $31
    ld a, [$c050]                                 ; $174e: $fa $50 $c0
    bit 7, a                                      ; $1751: $cb $7f
    jr nz, jr_000_1760                            ; $1753: $20 $0b

    ld a, [$c044]                                 ; $1755: $fa $44 $c0
    add l                                         ; $1758: $85
    ld l, a                                       ; $1759: $6f
    ld a, [$c045]                                 ; $175a: $fa $45 $c0
    adc h                                         ; $175d: $8c
    ld h, a                                       ; $175e: $67
    ret                                           ; $175f: $c9


jr_000_1760:
    ld a, [$c044]                                 ; $1760: $fa $44 $c0
    sub l                                         ; $1763: $95
    ld l, a                                       ; $1764: $6f
    ld a, [$c045]                                 ; $1765: $fa $45 $c0
    sbc h                                         ; $1768: $9c
    ld h, a                                       ; $1769: $67
    ret                                           ; $176a: $c9


Call_000_176b:
    ld a, [$c052]                                 ; $176b: $fa $52 $c0
    bit 7, a                                      ; $176e: $cb $7f
    jr z, jr_000_1789                             ; $1770: $28 $17

    ld b, $38                                     ; $1772: $06 $38
    ldh a, [$ff96]                                ; $1774: $f0 $96
    bit 7, a                                      ; $1776: $cb $7f
    ld a, [$c043]                                 ; $1778: $fa $43 $c0
    jr z, jr_000_1780                             ; $177b: $28 $03

    ld b, a                                       ; $177d: $47
    ld a, $b8                                     ; $177e: $3e $b8

jr_000_1780:
    sub b                                         ; $1780: $90
    jr nc, jr_000_178b                            ; $1781: $30 $08

    ld a, [$c04c]                                 ; $1783: $fa $4c $c0
    and a                                         ; $1786: $a7
    jr z, jr_000_179e                             ; $1787: $28 $15

jr_000_1789:
    and a                                         ; $1789: $a7
    ret                                           ; $178a: $c9


jr_000_178b:
    ld h, a                                       ; $178b: $67
    cp $0c                                        ; $178c: $fe $0c
    jr nc, jr_000_1789                            ; $178e: $30 $f9

    ld a, [$c04c]                                 ; $1790: $fa $4c $c0
    and a                                         ; $1793: $a7
    jr nz, jr_000_1789                            ; $1794: $20 $f3

    sla h                                         ; $1796: $cb $24
    ld a, [$c047]                                 ; $1798: $fa $47 $c0
    cp h                                          ; $179b: $bc
    jr c, jr_000_1789                             ; $179c: $38 $eb

jr_000_179e:
    scf                                           ; $179e: $37
    ret                                           ; $179f: $c9


Call_000_17a0:
    ld a, [$c060]                                 ; $17a0: $fa $60 $c0
    and a                                         ; $17a3: $a7
    jr z, jr_000_17aa                             ; $17a4: $28 $04

    dec a                                         ; $17a6: $3d
    ld [$c060], a                                 ; $17a7: $ea $60 $c0

jr_000_17aa:
    ld a, [$c040]                                 ; $17aa: $fa $40 $c0
    rst RST_08                                    ; $17ad: $cf

    db $c2, $17, $dd, $17, $ea, $17, $00, $18, $4f, $18, $9b, $18, $a1, $18, $a7, $18
    db $c4, $18, $e1, $18

    xor a                                         ; $17c2: $af
    ld [$c050], a                                 ; $17c3: $ea $50 $c0
    ld [$c051], a                                 ; $17c6: $ea $51 $c0
    ld [$c052], a                                 ; $17c9: $ea $52 $c0
    ld [$c046], a                                 ; $17cc: $ea $46 $c0
    ld [$c041], a                                 ; $17cf: $ea $41 $c0
    ld [$c060], a                                 ; $17d2: $ea $60 $c0
    inc a                                         ; $17d5: $3c
    ld [$c047], a                                 ; $17d6: $ea $47 $c0
    ld [$c040], a                                 ; $17d9: $ea $40 $c0
    ret                                           ; $17dc: $c9


    call Call_000_18f3                            ; $17dd: $cd $f3 $18
    ld a, [$c047]                                 ; $17e0: $fa $47 $c0
    and a                                         ; $17e3: $a7
    ret nz                                        ; $17e4: $c0

    ld a, $03                                     ; $17e5: $3e $03
    jp Jump_000_1f42                              ; $17e7: $c3 $42 $1f


    call Call_000_18e4                            ; $17ea: $cd $e4 $18
    ld a, [$c04c]                                 ; $17ed: $fa $4c $c0
    and a                                         ; $17f0: $a7
    ret z                                         ; $17f1: $c8

    call Call_000_1ee1                            ; $17f2: $cd $e1 $1e
    ld hl, $ffad                                  ; $17f5: $21 $ad $ff
    set 5, [hl]                                   ; $17f8: $cb $ee
    ld a, $05                                     ; $17fa: $3e $05
    ld [$c040], a                                 ; $17fc: $ea $40 $c0
    ret                                           ; $17ff: $c9


    ld hl, $ffad                                  ; $1800: $21 $ad $ff
    set 5, [hl]                                   ; $1803: $cb $ee
    call Call_000_18e4                            ; $1805: $cd $e4 $18
    ld a, [$c04c]                                 ; $1808: $fa $4c $c0
    cp $01                                        ; $180b: $fe $01
    ret nz                                        ; $180d: $c0

    call Call_000_1ecb                            ; $180e: $cd $cb $1e
    ld a, [$c047]                                 ; $1811: $fa $47 $c0
    ld b, a                                       ; $1814: $47
    ld a, [$c046]                                 ; $1815: $fa $46 $c0
    or b                                          ; $1818: $b0
    ret nz                                        ; $1819: $c0

    ld b, $0e                                     ; $181a: $06 $0e
    ldh a, [$ffad]                                ; $181c: $f0 $ad
    bit 7, a                                      ; $181e: $cb $7f
    jr z, jr_000_1824                             ; $1820: $28 $02

    ld b, $0c                                     ; $1822: $06 $0c

jr_000_1824:
    ldh a, [$ff91]                                ; $1824: $f0 $91
    bit 1, a                                      ; $1826: $cb $4f
    jr z, jr_000_182b                             ; $1828: $28 $01

    inc b                                         ; $182a: $04

jr_000_182b:
    ld a, [$c04b]                                 ; $182b: $fa $4b $c0
    ld [$c04d], a                                 ; $182e: $ea $4d $c0
    cp b                                          ; $1831: $b8
    jr nz, jr_000_1844                            ; $1832: $20 $10

    ld a, [$c053]                                 ; $1834: $fa $53 $c0
    bit 7, a                                      ; $1837: $cb $7f
    ld a, $06                                     ; $1839: $3e $06
    jr nz, jr_000_1846                            ; $183b: $20 $09

    call Call_000_1ef0                            ; $183d: $cd $f0 $1e
    ld a, $04                                     ; $1840: $3e $04
    jr jr_000_1846                                ; $1842: $18 $02

jr_000_1844:
    ld a, $05                                     ; $1844: $3e $05

jr_000_1846:
    ld [$c040], a                                 ; $1846: $ea $40 $c0
    ld hl, $ffad                                  ; $1849: $21 $ad $ff
    res 5, [hl]                                   ; $184c: $cb $ae
    ret                                           ; $184e: $c9


    call Call_000_18e4                            ; $184f: $cd $e4 $18
    ld a, [$c041]                                 ; $1852: $fa $41 $c0
    and a                                         ; $1855: $a7
    jr z, jr_000_1861                             ; $1856: $28 $09

    dec a                                         ; $1858: $3d
    ld [$c041], a                                 ; $1859: $ea $41 $c0
    ret nz                                        ; $185c: $c0

    ld a, $09                                     ; $185d: $3e $09
    jr jr_000_188e                                ; $185f: $18 $2d

jr_000_1861:
    ld a, [$c04c]                                 ; $1861: $fa $4c $c0
    cp $01                                        ; $1864: $fe $01
    jr nz, jr_000_1892                            ; $1866: $20 $2a

    ld a, [$c047]                                 ; $1868: $fa $47 $c0
    ld b, a                                       ; $186b: $47
    ld a, [$c046]                                 ; $186c: $fa $46 $c0
    or b                                          ; $186f: $b0
    ret nz                                        ; $1870: $c0

    ld a, [$c04b]                                 ; $1871: $fa $4b $c0
    ld [$c04d], a                                 ; $1874: $ea $4d $c0
    bit 1, a                                      ; $1877: $cb $4f
    ld b, $00                                     ; $1879: $06 $00
    jr z, jr_000_187f                             ; $187b: $28 $02

    ld b, $80                                     ; $187d: $06 $80

jr_000_187f:
    ldh a, [$ffad]                                ; $187f: $f0 $ad
    xor b                                         ; $1881: $a8
    bit 7, a                                      ; $1882: $cb $7f
    jr z, jr_000_1895                             ; $1884: $28 $0f

    ld a, [$c04d]                                 ; $1886: $fa $4d $c0
    bit 3, a                                      ; $1889: $cb $5f
    ret nz                                        ; $188b: $c0

    ld a, $07                                     ; $188c: $3e $07

jr_000_188e:
    ld [$c040], a                                 ; $188e: $ea $40 $c0
    ret                                           ; $1891: $c9


jr_000_1892:
    cp $02                                        ; $1892: $fe $02
    ret c                                         ; $1894: $d8

jr_000_1895:
    ld a, $3c                                     ; $1895: $3e $3c
    ld [$c041], a                                 ; $1897: $ea $41 $c0
    ret                                           ; $189a: $c9


    ld b, $5a                                     ; $189b: $06 $5a
    ld a, $c4                                     ; $189d: $3e $c4
    jr jr_000_18ab                                ; $189f: $18 $0a

    ld b, $5a                                     ; $18a1: $06 $5a
    ld a, $c5                                     ; $18a3: $3e $c5
    jr jr_000_18ab                                ; $18a5: $18 $04

    ld b, $96                                     ; $18a7: $06 $96
    ld a, $c6                                     ; $18a9: $3e $c6

jr_000_18ab:
    ld hl, $ffad                                  ; $18ab: $21 $ad $ff
    bit 3, [hl]                                   ; $18ae: $cb $5e
    jr nz, jr_000_18b8                            ; $18b0: $20 $06

    ldh [$ffc2], a                                ; $18b2: $e0 $c2
    set 3, [hl]                                   ; $18b4: $cb $de
    ld a, [hl+]                                   ; $18b6: $2a
    ld [hl], a                                    ; $18b7: $77

jr_000_18b8:
    ld a, b                                       ; $18b8: $78
    ld [$c05b], a                                 ; $18b9: $ea $5b $c0
    ld a, $08                                     ; $18bc: $3e $08
    ld [$c040], a                                 ; $18be: $ea $40 $c0
    jp Jump_000_18e4                              ; $18c1: $c3 $e4 $18


    call Call_000_18e4                            ; $18c4: $cd $e4 $18
    ld a, [$c05b]                                 ; $18c7: $fa $5b $c0
    dec a                                         ; $18ca: $3d
    ld [$c05b], a                                 ; $18cb: $ea $5b $c0
    cp $1e                                        ; $18ce: $fe $1e
    ret nc                                        ; $18d0: $d0

    ld hl, $ffc2                                  ; $18d1: $21 $c2 $ff
    res 6, [hl]                                   ; $18d4: $cb $b6
    ld a, [$c05b]                                 ; $18d6: $fa $5b $c0
    and a                                         ; $18d9: $a7
    ret nz                                        ; $18da: $c0

    ld a, $09                                     ; $18db: $3e $09
    ld [$c040], a                                 ; $18dd: $ea $40 $c0
    ret                                           ; $18e0: $c9


    jp Jump_000_18e4                              ; $18e1: $c3 $e4 $18


Call_000_18e4:
Jump_000_18e4:
    call Call_000_18fe                            ; $18e4: $cd $fe $18
    call Call_000_1945                            ; $18e7: $cd $45 $19
    call Call_000_19ac                            ; $18ea: $cd $ac $19
    call Call_000_1b17                            ; $18ed: $cd $17 $1b
    call Call_000_1c27                            ; $18f0: $cd $27 $1c

Call_000_18f3:
    ld hl, $c042                                  ; $18f3: $21 $42 $c0
    call Call_000_09fa                            ; $18f6: $cd $fa $09
    ld a, c                                       ; $18f9: $79
    ld [$c04b], a                                 ; $18fa: $ea $4b $c0
    ret                                           ; $18fd: $c9


Call_000_18fe:
    ld hl, $c044                                  ; $18fe: $21 $44 $c0
    ld a, [hl+]                                   ; $1901: $2a
    ld h, [hl]                                    ; $1902: $66
    ld l, a                                       ; $1903: $6f
    ld b, $00                                     ; $1904: $06 $00
    ld a, [$c050]                                 ; $1906: $fa $50 $c0
    bit 7, a                                      ; $1909: $cb $7f
    jr nz, jr_000_1926                            ; $190b: $20 $19

    sla a                                         ; $190d: $cb $27
    sla a                                         ; $190f: $cb $27
    rl b                                          ; $1911: $cb $10
    ld c, a                                       ; $1913: $4f
    add hl, bc                                    ; $1914: $09
    ld de, $d001                                  ; $1915: $11 $01 $d0
    call Call_000_00c3                            ; $1918: $cd $c3 $00
    jr nc, jr_000_193b                            ; $191b: $30 $1e

jr_000_191d:
    ld a, l                                       ; $191d: $7d
    ld [$c044], a                                 ; $191e: $ea $44 $c0
    ld a, h                                       ; $1921: $7c
    ld [$c045], a                                 ; $1922: $ea $45 $c0
    ret                                           ; $1925: $c9


jr_000_1926:
    sla a                                         ; $1926: $cb $27
    sla a                                         ; $1928: $cb $27
    rl b                                          ; $192a: $cb $10
    ld c, a                                       ; $192c: $4f
    ld a, l                                       ; $192d: $7d
    sbc c                                         ; $192e: $99
    ld l, a                                       ; $192f: $6f
    ld a, h                                       ; $1930: $7c
    sbc b                                         ; $1931: $98
    ld h, a                                       ; $1932: $67
    ld de, $07ff                                  ; $1933: $11 $ff $07
    call Call_000_00c3                            ; $1936: $cd $c3 $00
    jr nc, jr_000_191d                            ; $1939: $30 $e2

jr_000_193b:
    ld a, [$c050]                                 ; $193b: $fa $50 $c0
    xor $80                                       ; $193e: $ee $80
    ld [$c050], a                                 ; $1940: $ea $50 $c0
    jr jr_000_1991                                ; $1943: $18 $4c

Call_000_1945:
    ld hl, $c042                                  ; $1945: $21 $42 $c0
    ld a, [hl+]                                   ; $1948: $2a
    ld h, [hl]                                    ; $1949: $66
    ld l, a                                       ; $194a: $6f
    ld b, $00                                     ; $194b: $06 $00
    ld a, [$c04f]                                 ; $194d: $fa $4f $c0
    bit 7, a                                      ; $1950: $cb $7f
    ld a, [$c051]                                 ; $1952: $fa $51 $c0
    jr nz, jr_000_1972                            ; $1955: $20 $1b

    sla a                                         ; $1957: $cb $27
    rl b                                          ; $1959: $cb $10
    sla a                                         ; $195b: $cb $27
    rl b                                          ; $195d: $cb $10
    ld c, a                                       ; $195f: $4f
    add hl, bc                                    ; $1960: $09
    ld de, $e701                                  ; $1961: $11 $01 $e7
    call Call_000_00c3                            ; $1964: $cd $c3 $00
    jr nc, jr_000_1989                            ; $1967: $30 $20

jr_000_1969:
    ld a, l                                       ; $1969: $7d
    ld [$c042], a                                 ; $196a: $ea $42 $c0
    ld a, h                                       ; $196d: $7c
    ld [$c043], a                                 ; $196e: $ea $43 $c0
    ret                                           ; $1971: $c9


jr_000_1972:
    sla a                                         ; $1972: $cb $27
    rl b                                          ; $1974: $cb $10
    sla a                                         ; $1976: $cb $27
    rl b                                          ; $1978: $cb $10
    ld c, a                                       ; $197a: $4f
    ld a, l                                       ; $197b: $7d
    sbc c                                         ; $197c: $99
    ld l, a                                       ; $197d: $6f
    ld a, h                                       ; $197e: $7c
    sbc b                                         ; $197f: $98
    ld h, a                                       ; $1980: $67
    ld de, $08ff                                  ; $1981: $11 $ff $08
    call Call_000_00c3                            ; $1984: $cd $c3 $00
    jr nc, jr_000_1969                            ; $1987: $30 $e0

jr_000_1989:
    ld a, [$c04f]                                 ; $1989: $fa $4f $c0
    xor $80                                       ; $198c: $ee $80
    ld [$c04f], a                                 ; $198e: $ea $4f $c0

jr_000_1991:
    ld a, [$c050]                                 ; $1991: $fa $50 $c0
    sra a                                         ; $1994: $cb $2f
    and $bf                                       ; $1996: $e6 $bf
    ld [$c050], a                                 ; $1998: $ea $50 $c0
    ld a, [$c051]                                 ; $199b: $fa $51 $c0
    srl a                                         ; $199e: $cb $3f
    ld [$c051], a                                 ; $19a0: $ea $51 $c0
    xor a                                         ; $19a3: $af
    ld [$c053], a                                 ; $19a4: $ea $53 $c0
    ld a, $04                                     ; $19a7: $3e $04
    jp Jump_000_1f42                              ; $19a9: $c3 $42 $1f


Call_000_19ac:
    ld hl, $c05d                                  ; $19ac: $21 $5d $c0
    ld a, [$c052]                                 ; $19af: $fa $52 $c0
    bit 7, a                                      ; $19b2: $cb $7f
    jr nz, jr_000_1a18                            ; $19b4: $20 $62

    ld a, [$c05f]                                 ; $19b6: $fa $5f $c0
    sub [hl]                                      ; $19b9: $96
    ld [$c05f], a                                 ; $19ba: $ea $5f $c0
    ld c, a                                       ; $19bd: $4f
    inc hl                                        ; $19be: $23
    ld a, [$c052]                                 ; $19bf: $fa $52 $c0
    sbc [hl]                                      ; $19c2: $9e
    jr nc, jr_000_19d2                            ; $19c3: $30 $0d

    ld a, $80                                     ; $19c5: $3e $80
    ld [$c052], a                                 ; $19c7: $ea $52 $c0
    ld a, [$c059]                                 ; $19ca: $fa $59 $c0
    and a                                         ; $19cd: $a7
    ret z                                         ; $19ce: $c8

    jp Jump_000_1f42                              ; $19cf: $c3 $42 $1f


jr_000_19d2:
    ld [$c052], a                                 ; $19d2: $ea $52 $c0
    ld b, $00                                     ; $19d5: $06 $00
    ld hl, $19e9                                  ; $19d7: $21 $e9 $19
    push hl                                       ; $19da: $e5
    ld a, [$c05c]                                 ; $19db: $fa $5c $c0
    swap a                                        ; $19de: $cb $37
    and $0f                                       ; $19e0: $e6 $0f
    rst RST_08                                    ; $19e2: $cf

    db $e5, $1a, $01, $1b, $0f, $1b

    ld l, a                                       ; $19e9: $6f
    ld h, b                                       ; $19ea: $60
    ld a, [$c058]                                 ; $19eb: $fa $58 $c0
    call Call_000_30d0                            ; $19ee: $cd $d0 $30
    srl c                                         ; $19f1: $cb $39
    rr h                                          ; $19f3: $cb $1c
    rr l                                          ; $19f5: $cb $1d
    srl c                                         ; $19f7: $cb $39
    rr h                                          ; $19f9: $cb $1c
    rr l                                          ; $19fb: $cb $1d
    srl c                                         ; $19fd: $cb $39
    rr h                                          ; $19ff: $cb $1c
    rr l                                          ; $1a01: $cb $1d
    srl c                                         ; $1a03: $cb $39
    rr h                                          ; $1a05: $cb $1c
    rr l                                          ; $1a07: $cb $1d
    ld a, [$c046]                                 ; $1a09: $fa $46 $c0
    add l                                         ; $1a0c: $85
    ld [$c046], a                                 ; $1a0d: $ea $46 $c0
    ld a, [$c047]                                 ; $1a10: $fa $47 $c0
    adc h                                         ; $1a13: $8c
    ld [$c047], a                                 ; $1a14: $ea $47 $c0
    ret                                           ; $1a17: $c9


jr_000_1a18:
    ld a, [$c05f]                                 ; $1a18: $fa $5f $c0
    add [hl]                                      ; $1a1b: $86
    ld [$c05f], a                                 ; $1a1c: $ea $5f $c0
    ld c, a                                       ; $1a1f: $4f
    inc hl                                        ; $1a20: $23
    ld a, [$c052]                                 ; $1a21: $fa $52 $c0
    adc [hl]                                      ; $1a24: $8e
    ld [$c052], a                                 ; $1a25: $ea $52 $c0
    ld b, $00                                     ; $1a28: $06 $00
    ld hl, $1a3a                                  ; $1a2a: $21 $3a $1a
    push hl                                       ; $1a2d: $e5
    ld a, [$c05c]                                 ; $1a2e: $fa $5c $c0
    and $0f                                       ; $1a31: $e6 $0f
    rst RST_08                                    ; $1a33: $cf

    db $e5, $1a, $cd, $1a, $c3, $1a

    ld l, a                                       ; $1a3a: $6f
    ld h, b                                       ; $1a3b: $60
    ld a, [$c058]                                 ; $1a3c: $fa $58 $c0
    call Call_000_30d0                            ; $1a3f: $cd $d0 $30
    srl c                                         ; $1a42: $cb $39
    rr h                                          ; $1a44: $cb $1c
    rr l                                          ; $1a46: $cb $1d
    srl c                                         ; $1a48: $cb $39
    rr h                                          ; $1a4a: $cb $1c
    rr l                                          ; $1a4c: $cb $1d
    srl c                                         ; $1a4e: $cb $39
    rr h                                          ; $1a50: $cb $1c
    rr l                                          ; $1a52: $cb $1d
    srl c                                         ; $1a54: $cb $39
    rr h                                          ; $1a56: $cb $1c
    rr l                                          ; $1a58: $cb $1d
    ld a, [$c046]                                 ; $1a5a: $fa $46 $c0
    sub l                                         ; $1a5d: $95
    ld [$c046], a                                 ; $1a5e: $ea $46 $c0
    ld c, a                                       ; $1a61: $4f
    ld a, [$c047]                                 ; $1a62: $fa $47 $c0
    sbc h                                         ; $1a65: $9c
    ld [$c047], a                                 ; $1a66: $ea $47 $c0
    jr c, jr_000_1a6d                             ; $1a69: $38 $02

    or c                                          ; $1a6b: $b1
    ret nz                                        ; $1a6c: $c0

jr_000_1a6d:
    xor a                                         ; $1a6d: $af
    ld [$c046], a                                 ; $1a6e: $ea $46 $c0
    ld [$c047], a                                 ; $1a71: $ea $47 $c0
    ld hl, $c04c                                  ; $1a74: $21 $4c $c0
    inc [hl]                                      ; $1a77: $34
    ld a, [hl]                                    ; $1a78: $7e
    cp $02                                        ; $1a79: $fe $02
    jr c, jr_000_1a83                             ; $1a7b: $38 $06

    ldh a, [$ffad]                                ; $1a7d: $f0 $ad
    set 5, a                                      ; $1a7f: $cb $ef
    ldh [$ffad], a                                ; $1a81: $e0 $ad

jr_000_1a83:
    xor a                                         ; $1a83: $af
    ld [$c059], a                                 ; $1a84: $ea $59 $c0
    ld a, [$c04c]                                 ; $1a87: $fa $4c $c0
    cp $04                                        ; $1a8a: $fe $04
    jr nc, jr_000_1aa6                            ; $1a8c: $30 $18

    ld a, $1c                                     ; $1a8e: $3e $1c
    ld [$c060], a                                 ; $1a90: $ea $60 $c0
    ld hl, $c042                                  ; $1a93: $21 $42 $c0
    ld de, $c062                                  ; $1a96: $11 $62 $c0
    ld b, $04                                     ; $1a99: $06 $04

jr_000_1a9b:
    ld a, [hl+]                                   ; $1a9b: $2a
    ld [de], a                                    ; $1a9c: $12
    inc e                                         ; $1a9d: $1c
    dec b                                         ; $1a9e: $05
    jr nz, jr_000_1a9b                            ; $1a9f: $20 $fa

    ld a, $03                                     ; $1aa1: $3e $03
    call Call_000_1f42                            ; $1aa3: $cd $42 $1f

jr_000_1aa6:
    ld a, [$c052]                                 ; $1aa6: $fa $52 $c0
    and $7f                                       ; $1aa9: $e6 $7f
    ld b, a                                       ; $1aab: $47
    srl a                                         ; $1aac: $cb $3f
    srl a                                         ; $1aae: $cb $3f
    ld c, a                                       ; $1ab0: $4f
    ld a, b                                       ; $1ab1: $78
    sub c                                         ; $1ab2: $91
    jr nc, jr_000_1ab6                            ; $1ab3: $30 $01

    xor a                                         ; $1ab5: $af

jr_000_1ab6:
    ld b, a                                       ; $1ab6: $47
    ld a, [$c052]                                 ; $1ab7: $fa $52 $c0
    and $80                                       ; $1aba: $e6 $80
    xor $80                                       ; $1abc: $ee $80
    or b                                          ; $1abe: $b0
    ld [$c052], a                                 ; $1abf: $ea $52 $c0
    ret                                           ; $1ac2: $c9


    call Call_000_1aef                            ; $1ac3: $cd $ef $1a
    sla c                                         ; $1ac6: $cb $21
    rl a                                          ; $1ac8: $cb $17
    rl b                                          ; $1aca: $cb $10
    ret                                           ; $1acc: $c9


    ld a, [$c052]                                 ; $1acd: $fa $52 $c0
    sla c                                         ; $1ad0: $cb $21
    rl a                                          ; $1ad2: $cb $17
    ld e, a                                       ; $1ad4: $5f
    sla c                                         ; $1ad5: $cb $21
    rl a                                          ; $1ad7: $cb $17
    rl b                                          ; $1ad9: $cb $10
    sla c                                         ; $1adb: $cb $21
    rl a                                          ; $1add: $cb $17
    rl b                                          ; $1adf: $cb $10
    add e                                         ; $1ae1: $83
    ret nc                                        ; $1ae2: $d0

    inc b                                         ; $1ae3: $04
    ret                                           ; $1ae4: $c9


    call Call_000_1b01                            ; $1ae5: $cd $01 $1b
    sla c                                         ; $1ae8: $cb $21
    rl a                                          ; $1aea: $cb $17
    rl b                                          ; $1aec: $cb $10
    ret                                           ; $1aee: $c9


Call_000_1aef:
    ld a, [$c052]                                 ; $1aef: $fa $52 $c0
    sla c                                         ; $1af2: $cb $21
    rl a                                          ; $1af4: $cb $17
    ld e, a                                       ; $1af6: $5f
    sla c                                         ; $1af7: $cb $21
    rl a                                          ; $1af9: $cb $17
    rl b                                          ; $1afb: $cb $10
    add e                                         ; $1afd: $83
    ret nc                                        ; $1afe: $d0

    inc b                                         ; $1aff: $04
    ret                                           ; $1b00: $c9


Call_000_1b01:
    ld a, [$c052]                                 ; $1b01: $fa $52 $c0
    sla c                                         ; $1b04: $cb $21
    rl a                                          ; $1b06: $cb $17
    sla c                                         ; $1b08: $cb $21
    rl a                                          ; $1b0a: $cb $17
    rl b                                          ; $1b0c: $cb $10
    ret                                           ; $1b0e: $c9


    ld a, [$c052]                                 ; $1b0f: $fa $52 $c0
    sla c                                         ; $1b12: $cb $21
    rl a                                          ; $1b14: $cb $17
    ret                                           ; $1b16: $c9


Call_000_1b17:
    ld a, [$c050]                                 ; $1b17: $fa $50 $c0
    and $7f                                       ; $1b1a: $e6 $7f
    ld b, a                                       ; $1b1c: $47
    ld a, [$c054]                                 ; $1b1d: $fa $54 $c0
    ld c, a                                       ; $1b20: $4f
    ld a, [$c056]                                 ; $1b21: $fa $56 $c0
    sub c                                         ; $1b24: $91
    ld c, a                                       ; $1b25: $4f
    ld a, b                                       ; $1b26: $78
    sbc $00                                       ; $1b27: $de $00
    jr c, jr_000_1b39                             ; $1b29: $38 $0e

    ld b, a                                       ; $1b2b: $47
    ld a, c                                       ; $1b2c: $79
    ld [$c056], a                                 ; $1b2d: $ea $56 $c0
    ld a, [$c050]                                 ; $1b30: $fa $50 $c0
    and $80                                       ; $1b33: $e6 $80
    or b                                          ; $1b35: $b0
    ld [$c050], a                                 ; $1b36: $ea $50 $c0

jr_000_1b39:
    ld a, [$c055]                                 ; $1b39: $fa $55 $c0
    ld c, a                                       ; $1b3c: $4f
    ld a, [$c057]                                 ; $1b3d: $fa $57 $c0
    sub c                                         ; $1b40: $91
    ld c, a                                       ; $1b41: $4f
    ld a, [$c051]                                 ; $1b42: $fa $51 $c0
    sbc $00                                       ; $1b45: $de $00
    ret c                                         ; $1b47: $d8

    ld [$c051], a                                 ; $1b48: $ea $51 $c0
    ld a, c                                       ; $1b4b: $79
    ld [$c057], a                                 ; $1b4c: $ea $57 $c0
    ret                                           ; $1b4f: $c9


Call_000_1b50:
    ld a, [$c040]                                 ; $1b50: $fa $40 $c0
    and a                                         ; $1b53: $a7
    ret z                                         ; $1b54: $c8

    ld hl, $c042                                  ; $1b55: $21 $42 $c0
    call Call_000_095d                            ; $1b58: $cd $5d $09
    push bc                                       ; $1b5b: $c5
    ld a, [$c047]                                 ; $1b5c: $fa $47 $c0
    call Call_000_09c2                            ; $1b5f: $cd $c2 $09
    ld hl, $1bc2                                  ; $1b62: $21 $c2 $1b
    ld a, [$c047]                                 ; $1b65: $fa $47 $c0
    cp $40                                        ; $1b68: $fe $40
    jr c, jr_000_1b76                             ; $1b6a: $38 $0a

    ld hl, $1bdb                                  ; $1b6c: $21 $db $1b
    cp $60                                        ; $1b6f: $fe $60
    jr c, jr_000_1b76                             ; $1b71: $38 $03

    ld hl, $1be5                                  ; $1b73: $21 $e5 $1b

jr_000_1b76:
    ld a, [$c043]                                 ; $1b76: $fa $43 $c0
    cp $78                                        ; $1b79: $fe $78
    jr nc, jr_000_1b8f                            ; $1b7b: $30 $12

    ld a, b                                       ; $1b7d: $78
    cp $78                                        ; $1b7e: $fe $78
    jr c, jr_000_1b8f                             ; $1b80: $38 $0d

    ld a, c                                       ; $1b82: $79
    cp $28                                        ; $1b83: $fe $28
    jr c, jr_000_1b8f                             ; $1b85: $38 $08

    cp $b0                                        ; $1b87: $fe $b0
    jr nc, jr_000_1b8f                            ; $1b89: $30 $04

    ld de, $0005                                  ; $1b8b: $11 $05 $00
    add hl, de                                    ; $1b8e: $19

jr_000_1b8f:
    call Call_000_305a                            ; $1b8f: $cd $5a $30
    pop bc                                        ; $1b92: $c1
    ld hl, $1bcc                                  ; $1b93: $21 $cc $1b
    ld a, [$c043]                                 ; $1b96: $fa $43 $c0
    cp $78                                        ; $1b99: $fe $78
    jr nc, jr_000_1bae                            ; $1b9b: $30 $11

    ld a, b                                       ; $1b9d: $78
    cp $78                                        ; $1b9e: $fe $78
    jr c, jr_000_1bae                             ; $1ba0: $38 $0c

    ld a, c                                       ; $1ba2: $79
    cp $28                                        ; $1ba3: $fe $28
    jr c, jr_000_1bae                             ; $1ba5: $38 $07

    cp $b0                                        ; $1ba7: $fe $b0
    jr nc, jr_000_1bae                            ; $1ba9: $30 $03

    ld hl, $1bd1                                  ; $1bab: $21 $d1 $1b

jr_000_1bae:
    call Call_000_305a                            ; $1bae: $cd $5a $30
    ld a, [$c060]                                 ; $1bb1: $fa $60 $c0
    and a                                         ; $1bb4: $a7
    ret z                                         ; $1bb5: $c8

    ld hl, $c062                                  ; $1bb6: $21 $62 $c0
    call Call_000_0951                            ; $1bb9: $cd $51 $09
    ld hl, $1bd6                                  ; $1bbc: $21 $d6 $1b
    jp Jump_000_305a                              ; $1bbf: $c3 $5a $30


    db $fa, $fd, $31, $00, $80, $fa, $fd, $31, $80, $80, $f8, $fd, $22, $00, $80, $f8
    db $fd, $22, $80, $80, $fb, $fd, $2f, $00, $80, $fa, $fd, $37, $00, $80, $fa, $fd
    db $37, $80, $80, $fa, $fd, $38, $00, $80, $fa, $fd, $38, $80, $80

Call_000_1bef:
    ld a, [hl+]                                   ; $1bef: $2a
    ld d, [hl]                                    ; $1bf0: $56
    ld e, a                                       ; $1bf1: $5f
    ld hl, $c044                                  ; $1bf2: $21 $44 $c0
    ld a, [hl+]                                   ; $1bf5: $2a
    ld h, [hl]                                    ; $1bf6: $66
    ld l, a                                       ; $1bf7: $6f
    call Call_000_00c3                            ; $1bf8: $cd $c3 $00
    jr nc, jr_000_1bfe                            ; $1bfb: $30 $01

    dec de                                        ; $1bfd: $1b

jr_000_1bfe:
    ld a, $80                                     ; $1bfe: $3e $80
    add e                                         ; $1c00: $83
    ld a, d                                       ; $1c01: $7a
    adc $00                                       ; $1c02: $ce $00
    ret                                           ; $1c04: $c9


Call_000_1c05:
    ld a, [hl+]                                   ; $1c05: $2a
    ld d, [hl]                                    ; $1c06: $56
    ld e, a                                       ; $1c07: $5f
    ld hl, $c042                                  ; $1c08: $21 $42 $c0
    ld a, [hl+]                                   ; $1c0b: $2a
    ld h, [hl]                                    ; $1c0c: $66
    ld l, a                                       ; $1c0d: $6f
    call Call_000_00c3                            ; $1c0e: $cd $c3 $00
    jr nc, jr_000_1c14                            ; $1c11: $30 $01

    dec de                                        ; $1c13: $1b

jr_000_1c14:
    ld a, $80                                     ; $1c14: $3e $80
    add e                                         ; $1c16: $83
    ld a, d                                       ; $1c17: $7a
    adc $00                                       ; $1c18: $ce $00
    ldh [$ffc5], a                                ; $1c1a: $e0 $c5
    add $10                                       ; $1c1c: $c6 $10
    cp b                                          ; $1c1e: $b8
    ret                                           ; $1c1f: $c9


Call_000_1c20:
    ld b, a                                       ; $1c20: $47
    ld a, [$c047]                                 ; $1c21: $fa $47 $c0
    sub b                                         ; $1c24: $90
    cp h                                          ; $1c25: $bc
    ret                                           ; $1c26: $c9


Call_000_1c27:
    ld a, [$c053]                                 ; $1c27: $fa $53 $c0
    and a                                         ; $1c2a: $a7
    ret nz                                        ; $1c2b: $c0

    call Call_000_08bc                            ; $1c2c: $cd $bc $08
    cp $76                                        ; $1c2f: $fe $76
    ret c                                         ; $1c31: $d8

    cp $7b                                        ; $1c32: $fe $7b
    ret nc                                        ; $1c34: $d0

    ld [$c053], a                                 ; $1c35: $ea $53 $c0
    call Call_000_08b1                            ; $1c38: $cd $b1 $08
    cp $2e                                        ; $1c3b: $fe $2e
    ret c                                         ; $1c3d: $d8

    cp $ab                                        ; $1c3e: $fe $ab
    ret nc                                        ; $1c40: $d0

    ld a, [$c047]                                 ; $1c41: $fa $47 $c0
    cp $1e                                        ; $1c44: $fe $1e
    ret nc                                        ; $1c46: $d0

    ld a, $0c                                     ; $1c47: $3e $0c
    call Call_000_3665                            ; $1c49: $cd $65 $36
    ld a, [$c047]                                 ; $1c4c: $fa $47 $c0
    cp $1c                                        ; $1c4f: $fe $1c
    jr c, jr_000_1c7f                             ; $1c51: $38 $2c

    ld a, [$c051]                                 ; $1c53: $fa $51 $c0
    srl a                                         ; $1c56: $cb $3f
    ld [$c051], a                                 ; $1c58: $ea $51 $c0
    ld a, [$c050]                                 ; $1c5b: $fa $50 $c0
    sra a                                         ; $1c5e: $cb $2f
    and $bf                                       ; $1c60: $e6 $bf
    ld [$c050], a                                 ; $1c62: $ea $50 $c0
    ld a, [$c052]                                 ; $1c65: $fa $52 $c0
    bit 7, a                                      ; $1c68: $cb $7f
    jr nz, jr_000_1c72                            ; $1c6a: $20 $06

    ld b, a                                       ; $1c6c: $47
    srl a                                         ; $1c6d: $cb $3f
    add b                                         ; $1c6f: $80
    jr jr_000_1c76                                ; $1c70: $18 $04

jr_000_1c72:
    and $7f                                       ; $1c72: $e6 $7f
    srl a                                         ; $1c74: $cb $3f

jr_000_1c76:
    ld [$c052], a                                 ; $1c76: $ea $52 $c0
    ld a, $ff                                     ; $1c79: $3e $ff
    ld [$c053], a                                 ; $1c7b: $ea $53 $c0
    ret                                           ; $1c7e: $c9


jr_000_1c7f:
    ld a, $fe                                     ; $1c7f: $3e $fe
    ld [$c053], a                                 ; $1c81: $ea $53 $c0

Jump_000_1c84:
    ld a, [$c050]                                 ; $1c84: $fa $50 $c0
    sra a                                         ; $1c87: $cb $2f
    sra a                                         ; $1c89: $cb $2f
    and $9f                                       ; $1c8b: $e6 $9f
    ld [$c050], a                                 ; $1c8d: $ea $50 $c0
    ld a, [$c051]                                 ; $1c90: $fa $51 $c0
    srl a                                         ; $1c93: $cb $3f
    srl a                                         ; $1c95: $cb $3f
    and $3f                                       ; $1c97: $e6 $3f
    ld [$c051], a                                 ; $1c99: $ea $51 $c0
    ld a, [$c04f]                                 ; $1c9c: $fa $4f $c0
    xor $80                                       ; $1c9f: $ee $80
    ld [$c04f], a                                 ; $1ca1: $ea $4f $c0
    ld a, [$c052]                                 ; $1ca4: $fa $52 $c0
    sra a                                         ; $1ca7: $cb $2f
    sra a                                         ; $1ca9: $cb $2f
    and $9f                                       ; $1cab: $e6 $9f
    ld [$c052], a                                 ; $1cad: $ea $52 $c0
    ret                                           ; $1cb0: $c9


Call_000_1cb1:
    ld a, b                                       ; $1cb1: $78
    ldh [$ffc5], a                                ; $1cb2: $e0 $c5
    ldh a, [$ffc6]                                ; $1cb4: $f0 $c6
    xor $80                                       ; $1cb6: $ee $80
    bit 7, a                                      ; $1cb8: $cb $7f
    jr z, jr_000_1cd7                             ; $1cba: $28 $1b

    bit 7, b                                      ; $1cbc: $cb $78
    jr nz, jr_000_1cdb                            ; $1cbe: $20 $1b

jr_000_1cc0:
    res 7, a                                      ; $1cc0: $cb $bf
    res 7, b                                      ; $1cc2: $cb $b8
    sub b                                         ; $1cc4: $90
    jr nc, jr_000_1cce                            ; $1cc5: $30 $07

    cpl                                           ; $1cc7: $2f
    inc a                                         ; $1cc8: $3c
    ld b, a                                       ; $1cc9: $47
    ldh a, [$ffc5]                                ; $1cca: $f0 $c5
    jr jr_000_1cd3                                ; $1ccc: $18 $05

jr_000_1cce:
    ld b, a                                       ; $1cce: $47
    ldh a, [$ffc6]                                ; $1ccf: $f0 $c6
    xor $80                                       ; $1cd1: $ee $80

jr_000_1cd3:
    and $80                                       ; $1cd3: $e6 $80
    jr jr_000_1cdd                                ; $1cd5: $18 $06

jr_000_1cd7:
    bit 7, b                                      ; $1cd7: $cb $78
    jr nz, jr_000_1cc0                            ; $1cd9: $20 $e5

jr_000_1cdb:
    res 7, b                                      ; $1cdb: $cb $b8

jr_000_1cdd:
    add b                                         ; $1cdd: $80
    ld [$c050], a                                 ; $1cde: $ea $50 $c0
    res 7, a                                      ; $1ce1: $cb $bf
    ld b, a                                       ; $1ce3: $47
    ld a, [$c051]                                 ; $1ce4: $fa $51 $c0
    add a                                         ; $1ce7: $87
    ret c                                         ; $1ce8: $d8

    cp b                                          ; $1ce9: $b8
    ret nc                                        ; $1cea: $d0

    ld b, a                                       ; $1ceb: $47
    ld a, [$c050]                                 ; $1cec: $fa $50 $c0
    and $80                                       ; $1cef: $e6 $80
    or b                                          ; $1cf1: $b0
    ld [$c050], a                                 ; $1cf2: $ea $50 $c0
    ret                                           ; $1cf5: $c9


Call_000_1cf6:
    call Call_000_08bc                            ; $1cf6: $cd $bc $08
    push af                                       ; $1cf9: $f5
    sub e                                         ; $1cfa: $93
    jr nc, jr_000_1cff                            ; $1cfb: $30 $02

    cpl                                           ; $1cfd: $2f
    inc a                                         ; $1cfe: $3c

jr_000_1cff:
    ld b, a                                       ; $1cff: $47
    pop af                                        ; $1d00: $f1
    add $08                                       ; $1d01: $c6 $08
    bit 7, a                                      ; $1d03: $cb $7f
    jr z, jr_000_1d09                             ; $1d05: $28 $02

    cpl                                           ; $1d07: $2f
    inc a                                         ; $1d08: $3c

jr_000_1d09:
    sub $30                                       ; $1d09: $d6 $30
    jr c, jr_000_1d13                             ; $1d0b: $38 $06

    srl a                                         ; $1d0d: $cb $3f
    srl a                                         ; $1d0f: $cb $3f
    add b                                         ; $1d11: $80
    ld b, a                                       ; $1d12: $47

jr_000_1d13:
    ld a, b                                       ; $1d13: $78
    ld hl, $c047                                  ; $1d14: $21 $47 $c0
    sub [hl]                                      ; $1d17: $96
    jr nc, jr_000_1d1c                            ; $1d18: $30 $02

    cpl                                           ; $1d1a: $2f
    inc a                                         ; $1d1b: $3c

jr_000_1d1c:
    srl a                                         ; $1d1c: $cb $3f
    ld [$c052], a                                 ; $1d1e: $ea $52 $c0
    ret                                           ; $1d21: $c9


Call_000_1d22:
    push de                                       ; $1d22: $d5
    push de                                       ; $1d23: $d5
    call Call_000_08b1                            ; $1d24: $cd $b1 $08
    sub d                                         ; $1d27: $92
    jr nc, jr_000_1d2c                            ; $1d28: $30 $02

    cpl                                           ; $1d2a: $2f
    inc a                                         ; $1d2b: $3c

jr_000_1d2c:
    ld e, a                                       ; $1d2c: $5f
    ld a, [$c051]                                 ; $1d2d: $fa $51 $c0
    call Call_000_308f                            ; $1d30: $cd $8f $30
    pop de                                        ; $1d33: $d1
    call Call_000_08bc                            ; $1d34: $cd $bc $08
    sub e                                         ; $1d37: $93
    jr nc, jr_000_1d3c                            ; $1d38: $30 $02

    cpl                                           ; $1d3a: $2f
    inc a                                         ; $1d3b: $3c

jr_000_1d3c:
    call Call_000_3143                            ; $1d3c: $cd $43 $31
    ld a, h                                       ; $1d3f: $7c
    and a                                         ; $1d40: $a7
    jr nz, jr_000_1d48                            ; $1d41: $20 $05

    ld a, l                                       ; $1d43: $7d
    cp $68                                        ; $1d44: $fe $68
    jr c, jr_000_1d4a                             ; $1d46: $38 $02

jr_000_1d48:
    ld l, $68                                     ; $1d48: $2e $68

jr_000_1d4a:
    pop de                                        ; $1d4a: $d1
    call Call_000_08b1                            ; $1d4b: $cd $b1 $08
    sub d                                         ; $1d4e: $92
    jr nc, jr_000_1d53                            ; $1d4f: $30 $02

    set 7, l                                      ; $1d51: $cb $fd

jr_000_1d53:
    ld a, l                                       ; $1d53: $7d
    ldh [$ffc6], a                                ; $1d54: $e0 $c6
    ret                                           ; $1d56: $c9


Call_000_1d57:
    ld b, $00                                     ; $1d57: $06 $00
    ld a, [hl+]                                   ; $1d59: $2a
    and $0f                                       ; $1d5a: $e6 $0f
    cp $02                                        ; $1d5c: $fe $02
    ret c                                         ; $1d5e: $d8

    ld b, $02                                     ; $1d5f: $06 $02
    cp $05                                        ; $1d61: $fe $05
    jr c, jr_000_1d67                             ; $1d63: $38 $02

    ld b, $06                                     ; $1d65: $06 $06

jr_000_1d67:
    ld a, [hl]                                    ; $1d67: $7e
    sub $04                                       ; $1d68: $d6 $04
    ld [hl-], a                                   ; $1d6a: $32
    bit 7, [hl]                                   ; $1d6b: $cb $7e
    ret z                                         ; $1d6d: $c8

    set 7, b                                      ; $1d6e: $cb $f8
    ret                                           ; $1d70: $c9


Call_000_1d71:
    ld c, $28                                     ; $1d71: $0e $28
    cp $06                                        ; $1d73: $fe $06
    jr c, jr_000_1d7d                             ; $1d75: $38 $06

    cp $0c                                        ; $1d77: $fe $0c
    jr nc, jr_000_1d7d                            ; $1d79: $30 $02

    ld c, $20                                     ; $1d7b: $0e $20

jr_000_1d7d:
    ld a, c                                       ; $1d7d: $79
    bit 5, b                                      ; $1d7e: $cb $68
    jr z, jr_000_1d86                             ; $1d80: $28 $04

    cpl                                           ; $1d82: $2f
    inc a                                         ; $1d83: $3c
    jr jr_000_1d89                                ; $1d84: $18 $03

jr_000_1d86:
    bit 4, b                                      ; $1d86: $cb $60
    ret z                                         ; $1d88: $c8

jr_000_1d89:
    add d                                         ; $1d89: $82
    ld d, a                                       ; $1d8a: $57
    ld a, [hl]                                    ; $1d8b: $7e
    sub $04                                       ; $1d8c: $d6 $04
    ld [hl], a                                    ; $1d8e: $77
    ret                                           ; $1d8f: $c9


Call_000_1d90:
    call Call_000_1dbe                            ; $1d90: $cd $be $1d
    bit 6, b                                      ; $1d93: $cb $70
    jr z, jr_000_1da6                             ; $1d95: $28 $0f

jr_000_1d97:
    add c                                         ; $1d97: $81
    add e                                         ; $1d98: $83
    ld e, a                                       ; $1d99: $5f
    ld a, [$c05c]                                 ; $1d9a: $fa $5c $c0
    cp $02                                        ; $1d9d: $fe $02
    ret z                                         ; $1d9f: $c8

    ld a, $00                                     ; $1da0: $3e $00
    ld [$c05c], a                                 ; $1da2: $ea $5c $c0
    ret                                           ; $1da5: $c9


jr_000_1da6:
    bit 7, b                                      ; $1da6: $cb $78

jr_000_1da8:
    ret z                                         ; $1da8: $c8

    cpl                                           ; $1da9: $2f
    inc a                                         ; $1daa: $3c
    add e                                         ; $1dab: $83
    ld e, a                                       ; $1dac: $5f
    ld a, $01                                     ; $1dad: $3e $01
    ld [$c05c], a                                 ; $1daf: $ea $5c $c0
    ret                                           ; $1db2: $c9


Call_000_1db3:
    call Call_000_1dbe                            ; $1db3: $cd $be $1d
    bit 7, b                                      ; $1db6: $cb $78
    jr nz, jr_000_1d97                            ; $1db8: $20 $dd

    bit 6, b                                      ; $1dba: $cb $70
    jr jr_000_1da8                                ; $1dbc: $18 $ea

Call_000_1dbe:
    ld c, $0a                                     ; $1dbe: $0e $0a
    cp $06                                        ; $1dc0: $fe $06
    jr c, jr_000_1dcc                             ; $1dc2: $38 $08

    cp $0c                                        ; $1dc4: $fe $0c
    jr nc, jr_000_1dcc                            ; $1dc6: $30 $04

    srl c                                         ; $1dc8: $cb $39
    srl c                                         ; $1dca: $cb $39

jr_000_1dcc:
    ldh a, [$ff96]                                ; $1dcc: $f0 $96
    bit 7, a                                      ; $1dce: $cb $7f
    ld a, c                                       ; $1dd0: $79
    ld c, $08                                     ; $1dd1: $0e $08
    ret nz                                        ; $1dd3: $c0

    cpl                                           ; $1dd4: $2f
    inc a                                         ; $1dd5: $3c
    ld c, $f8                                     ; $1dd6: $0e $f8
    ret                                           ; $1dd8: $c9


Call_000_1dd9:
    bit 1, a                                      ; $1dd9: $cb $4f
    ret z                                         ; $1ddb: $c8

    call Call_000_1df5                            ; $1ddc: $cd $f5 $1d
    ldh a, [$ff9a]                                ; $1ddf: $f0 $9a
    bit 6, a                                      ; $1de1: $cb $77
    ret z                                         ; $1de3: $c8

    ld b, $4c                                     ; $1de4: $06 $4c
    ret                                           ; $1de6: $c9


Call_000_1de7:
    bit 1, a                                      ; $1de7: $cb $4f
    ret z                                         ; $1de9: $c8

    call Call_000_1df5                            ; $1dea: $cd $f5 $1d
    ldh a, [$ff9c]                                ; $1ded: $f0 $9c
    bit 7, a                                      ; $1def: $cb $7f
    ret z                                         ; $1df1: $c8

    ld b, $4c                                     ; $1df2: $06 $4c
    ret                                           ; $1df4: $c9


Call_000_1df5:
    ld a, [$c052]                                 ; $1df5: $fa $52 $c0
    bit 7, a                                      ; $1df8: $cb $7f
    jr z, jr_000_1e00                             ; $1dfa: $28 $04

    ld a, $01                                     ; $1dfc: $3e $01
    jr jr_000_1e07                                ; $1dfe: $18 $07

jr_000_1e00:
    add a                                         ; $1e00: $87
    bit 7, a                                      ; $1e01: $cb $7f
    jr z, jr_000_1e07                             ; $1e03: $28 $02

    ld a, $7f                                     ; $1e05: $3e $7f

jr_000_1e07:
    ld [$c052], a                                 ; $1e07: $ea $52 $c0
    ld b, $40                                     ; $1e0a: $06 $40
    ret                                           ; $1e0c: $c9


Call_000_1e0d:
    bit 5, a                                      ; $1e0d: $cb $6f
    jr z, jr_000_1e24                             ; $1e0f: $28 $13

    ld a, c                                       ; $1e11: $79
    bit 7, b                                      ; $1e12: $cb $78
    jr nz, jr_000_1e21                            ; $1e14: $20 $0b

    sub b                                         ; $1e16: $90
    jr nc, jr_000_1e1d                            ; $1e17: $30 $04

    cpl                                           ; $1e19: $2f
    inc a                                         ; $1e1a: $3c
    ld b, a                                       ; $1e1b: $47
    ret                                           ; $1e1c: $c9


jr_000_1e1d:
    or $80                                        ; $1e1d: $f6 $80
    ld b, a                                       ; $1e1f: $47
    ret                                           ; $1e20: $c9


jr_000_1e21:
    add b                                         ; $1e21: $80
    ld b, a                                       ; $1e22: $47
    ret                                           ; $1e23: $c9


jr_000_1e24:
    bit 4, a                                      ; $1e24: $cb $67
    ret z                                         ; $1e26: $c8

    ld a, c                                       ; $1e27: $79
    bit 7, b                                      ; $1e28: $cb $78
    jr z, jr_000_1e39                             ; $1e2a: $28 $0d

    res 7, b                                      ; $1e2c: $cb $b8
    sub b                                         ; $1e2e: $90
    jr nc, jr_000_1e37                            ; $1e2f: $30 $06

    cpl                                           ; $1e31: $2f
    inc a                                         ; $1e32: $3c
    or $80                                        ; $1e33: $f6 $80
    ld b, a                                       ; $1e35: $47
    ret                                           ; $1e36: $c9


jr_000_1e37:
    ld b, a                                       ; $1e37: $47
    ret                                           ; $1e38: $c9


jr_000_1e39:
    add b                                         ; $1e39: $80
    ld b, a                                       ; $1e3a: $47
    ret                                           ; $1e3b: $c9


Call_000_1e3c:
    bit 6, a                                      ; $1e3c: $cb $77
    jr z, jr_000_1e4e                             ; $1e3e: $28 $0e

jr_000_1e40:
    ld a, [$c051]                                 ; $1e40: $fa $51 $c0
    add $10                                       ; $1e43: $c6 $10
    ld [$c051], a                                 ; $1e45: $ea $51 $c0
    ld a, $10                                     ; $1e48: $3e $10
    ld [$c05c], a                                 ; $1e4a: $ea $5c $c0
    ret                                           ; $1e4d: $c9


jr_000_1e4e:
    bit 7, a                                      ; $1e4e: $cb $7f
    jr z, jr_000_1e68                             ; $1e50: $28 $16

jr_000_1e52:
    ld a, [$c051]                                 ; $1e52: $fa $51 $c0
    sub $10                                       ; $1e55: $d6 $10
    ld [$c051], a                                 ; $1e57: $ea $51 $c0
    ld a, $11                                     ; $1e5a: $3e $11
    ld [$c05c], a                                 ; $1e5c: $ea $5c $c0
    ret                                           ; $1e5f: $c9


Call_000_1e60:
    bit 7, a                                      ; $1e60: $cb $7f
    jr nz, jr_000_1e40                            ; $1e62: $20 $dc

    bit 6, a                                      ; $1e64: $cb $77
    jr nz, jr_000_1e52                            ; $1e66: $20 $ea

jr_000_1e68:
    ld a, $01                                     ; $1e68: $3e $01
    ld [$c05c], a                                 ; $1e6a: $ea $5c $c0
    ret                                           ; $1e6d: $c9


Call_000_1e6e:
    ld a, e                                       ; $1e6e: $7b
    ldh [$ffc5], a                                ; $1e6f: $e0 $c5
    ld a, [hl+]                                   ; $1e71: $2a
    ld h, [hl]                                    ; $1e72: $66
    ld l, a                                       ; $1e73: $6f
    cp $6c                                        ; $1e74: $fe $6c
    ld e, $02                                     ; $1e76: $1e $02
    jr c, jr_000_1e7c                             ; $1e78: $38 $02

    ld e, $00                                     ; $1e7a: $1e $00

jr_000_1e7c:
    add hl, de                                    ; $1e7c: $19
    rr h                                          ; $1e7d: $cb $1c
    jr nc, jr_000_1e82                            ; $1e7f: $30 $01

    inc h                                         ; $1e81: $24

jr_000_1e82:
    ld d, h                                       ; $1e82: $54
    ldh a, [$ffc5]                                ; $1e83: $f0 $c5
    ld e, a                                       ; $1e85: $5f
    ret                                           ; $1e86: $c9


Call_000_1e87:
    ld l, a                                       ; $1e87: $6f
    sub $70                                       ; $1e88: $d6 $70
    jr nc, jr_000_1e93                            ; $1e8a: $30 $07

    cpl                                           ; $1e8c: $2f
    inc a                                         ; $1e8d: $3c
    srl a                                         ; $1e8e: $cb $3f
    add l                                         ; $1e90: $85
    jr jr_000_1e98                                ; $1e91: $18 $05

jr_000_1e93:
    srl a                                         ; $1e93: $cb $3f
    ld h, a                                       ; $1e95: $67
    ld a, l                                       ; $1e96: $7d
    sub h                                         ; $1e97: $94

jr_000_1e98:
    srl a                                         ; $1e98: $cb $3f
    ld l, a                                       ; $1e9a: $6f
    srl a                                         ; $1e9b: $cb $3f
    add l                                         ; $1e9d: $85
    ret                                           ; $1e9e: $c9


Call_000_1e9f:
    bit 6, a                                      ; $1e9f: $cb $77
    jr z, jr_000_1eb0                             ; $1ea1: $28 $0d

jr_000_1ea3:
    ld a, [hl]                                    ; $1ea3: $7e
    srl a                                         ; $1ea4: $cb $3f
    srl a                                         ; $1ea6: $cb $3f
    ld c, a                                       ; $1ea8: $4f
    srl a                                         ; $1ea9: $cb $3f
    add c                                         ; $1eab: $81
    add b                                         ; $1eac: $80
    ld b, a                                       ; $1ead: $47
    jr jr_000_1ebf                                ; $1eae: $18 $0f

jr_000_1eb0:
    bit 7, a                                      ; $1eb0: $cb $7f

jr_000_1eb2:
    jr z, jr_000_1ebf                             ; $1eb2: $28 $0b

    ld a, [hl]                                    ; $1eb4: $7e
    srl a                                         ; $1eb5: $cb $3f
    srl a                                         ; $1eb7: $cb $3f
    srl a                                         ; $1eb9: $cb $3f
    ld c, a                                       ; $1ebb: $4f
    ld a, b                                       ; $1ebc: $78
    sub c                                         ; $1ebd: $91
    ld b, a                                       ; $1ebe: $47

jr_000_1ebf:
    ld a, [hl-]                                   ; $1ebf: $3a
    add b                                         ; $1ec0: $80
    ld [hl], a                                    ; $1ec1: $77
    ret                                           ; $1ec2: $c9


Call_000_1ec3:
    bit 7, a                                      ; $1ec3: $cb $7f
    jr nz, jr_000_1ea3                            ; $1ec5: $20 $dc

    bit 6, a                                      ; $1ec7: $cb $77
    jr jr_000_1eb2                                ; $1ec9: $18 $e7

Call_000_1ecb:
    ld hl, $c082                                  ; $1ecb: $21 $82 $c0
    call Call_000_1f3a                            ; $1ece: $cd $3a $1f
    bit 7, a                                      ; $1ed1: $cb $7f
    jr nz, jr_000_1ed8                            ; $1ed3: $20 $03

    ld hl, $c0a2                                  ; $1ed5: $21 $a2 $c0

jr_000_1ed8:
    ldh a, [$ff91]                                ; $1ed8: $f0 $91
    bit 0, a                                      ; $1eda: $cb $47
    jr z, jr_000_1edf                             ; $1edc: $28 $01

    inc hl                                        ; $1ede: $23

jr_000_1edf:
    inc [hl]                                      ; $1edf: $34
    ret                                           ; $1ee0: $c9


Call_000_1ee1:
    ld hl, $c082                                  ; $1ee1: $21 $82 $c0
    call Call_000_1f3a                            ; $1ee4: $cd $3a $1f
    bit 7, a                                      ; $1ee7: $cb $7f
    jr z, jr_000_1eee                             ; $1ee9: $28 $03

    ld hl, $c0a2                                  ; $1eeb: $21 $a2 $c0

jr_000_1eee:
    jr jr_000_1ed8                                ; $1eee: $18 $e8

Call_000_1ef0:
    ld hl, $c084                                  ; $1ef0: $21 $84 $c0
    call Call_000_1f3a                            ; $1ef3: $cd $3a $1f
    bit 7, a                                      ; $1ef6: $cb $7f
    jr nz, jr_000_1efd                            ; $1ef8: $20 $03

    ld hl, $c0a4                                  ; $1efa: $21 $a4 $c0

jr_000_1efd:
    jr jr_000_1ed8                                ; $1efd: $18 $d9

Jump_000_1eff:
    ld a, [$c05a]                                 ; $1eff: $fa $5a $c0
    cp $0a                                        ; $1f02: $fe $0a
    jr nc, jr_000_1f35                            ; $1f04: $30 $2f

    ldh a, [$ff96]                                ; $1f06: $f0 $96
    bit 6, a                                      ; $1f08: $cb $77
    jr nz, jr_000_1f19                            ; $1f0a: $20 $0d

    ld hl, $c086                                  ; $1f0c: $21 $86 $c0
    ldh a, [$ff93]                                ; $1f0f: $f0 $93
    and a                                         ; $1f11: $a7
    jr z, jr_000_1f26                             ; $1f12: $28 $12

    ld hl, $c0a7                                  ; $1f14: $21 $a7 $c0
    jr jr_000_1f2e                                ; $1f17: $18 $15

jr_000_1f19:
    ld hl, $c0a6                                  ; $1f19: $21 $a6 $c0
    ldh a, [$ff93]                                ; $1f1c: $f0 $93
    and a                                         ; $1f1e: $a7
    jr nz, jr_000_1f26                            ; $1f1f: $20 $05

    ld hl, $c087                                  ; $1f21: $21 $87 $c0
    jr jr_000_1f2e                                ; $1f24: $18 $08

jr_000_1f26:
    ld a, [$c05a]                                 ; $1f26: $fa $5a $c0
    cp $01                                        ; $1f29: $fe $01
    jr z, jr_000_1f34                             ; $1f2b: $28 $07

    ret                                           ; $1f2d: $c9


jr_000_1f2e:
    ld a, [$c05a]                                 ; $1f2e: $fa $5a $c0
    cp $02                                        ; $1f31: $fe $02
    ret nz                                        ; $1f33: $c0

jr_000_1f34:
    inc [hl]                                      ; $1f34: $34

jr_000_1f35:
    ld a, $25                                     ; $1f35: $3e $25
    jp Jump_000_3665                              ; $1f37: $c3 $65 $36


Call_000_1f3a:
    ldh a, [$ffad]                                ; $1f3a: $f0 $ad
    bit 3, a                                      ; $1f3c: $cb $5f
    ret z                                         ; $1f3e: $c8

    ldh a, [$ffae]                                ; $1f3f: $f0 $ae
    ret                                           ; $1f41: $c9


Call_000_1f42:
Jump_000_1f42:
    push af                                       ; $1f42: $f5
    ldh a, [$ffc2]                                ; $1f43: $f0 $c2
    bit 6, a                                      ; $1f45: $cb $77
    jr z, jr_000_1f67                             ; $1f47: $28 $1e

    and $0f                                       ; $1f49: $e6 $0f
    cp $01                                        ; $1f4b: $fe $01
    jr nz, jr_000_1f5a                            ; $1f4d: $20 $0b

    ld a, [$c0dd]                                 ; $1f4f: $fa $dd $c0
    cp $05                                        ; $1f52: $fe $05
    jr z, jr_000_1f60                             ; $1f54: $28 $0a

    jr jr_000_1f67                                ; $1f56: $18 $0f

jr_000_1f58:
    pop af                                        ; $1f58: $f1
    ret                                           ; $1f59: $c9


jr_000_1f5a:
    sub $04                                       ; $1f5a: $d6 $04
    cp $03                                        ; $1f5c: $fe $03
    jr nc, jr_000_1f67                            ; $1f5e: $30 $07

jr_000_1f60:
    ld a, [$dd00]                                 ; $1f60: $fa $00 $dd
    cp $ff                                        ; $1f63: $fe $ff
    jr nz, jr_000_1f58                            ; $1f65: $20 $f1

jr_000_1f67:
    pop af                                        ; $1f67: $f1
    jp Jump_000_3665                              ; $1f68: $c3 $65 $36


Call_000_1f6b:
    ld a, [$dd02]                                 ; $1f6b: $fa $02 $dd
    ld b, $1a                                     ; $1f6e: $06 $1a
    cp b                                          ; $1f70: $b8
    jr nz, jr_000_1f7b                            ; $1f71: $20 $08

    ld a, [$dd03]                                 ; $1f73: $fa $03 $dd
    ld b, $48                                     ; $1f76: $06 $48
    cp b                                          ; $1f78: $b8
    jr z, jr_000_1f89                             ; $1f79: $28 $0e

jr_000_1f7b:
    ld a, [$dd02]                                 ; $1f7b: $fa $02 $dd
    ld b, $05                                     ; $1f7e: $06 $05
    cp b                                          ; $1f80: $b8
    ret nz                                        ; $1f81: $c0

    ld a, [$dd03]                                 ; $1f82: $fa $03 $dd
    ld b, $48                                     ; $1f85: $06 $48
    cp b                                          ; $1f87: $b8
    ret nz                                        ; $1f88: $c0

jr_000_1f89:
    ld a, $2c                                     ; $1f89: $3e $2c
    jp Jump_000_3665                              ; $1f8b: $c3 $65 $36


Call_000_1f8e:
    call Call_000_32b9                            ; $1f8e: $cd $b9 $32
    ldh a, [$ff90]                                ; $1f91: $f0 $90
    rst RST_08                                    ; $1f93: $cf

    db $a8, $1f, $b5, $1f, $02, $20, $0d, $20, $61, $20, $4a, $21, $19, $21, $19, $21
    db $2d, $21, $4e, $21

    call Call_000_32c8                            ; $1fa8: $cd $c8 $32
    xor a                                         ; $1fab: $af
    ld hl, $c000                                  ; $1fac: $21 $00 $c0
    ld b, $80                                     ; $1faf: $06 $80

jr_000_1fb1:
    ld [hl+], a                                   ; $1fb1: $22
    dec b                                         ; $1fb2: $05
    jr nz, jr_000_1fb1                            ; $1fb3: $20 $fc

    ldh a, [$ff96]                                ; $1fb5: $f0 $96
    ld b, a                                       ; $1fb7: $47
    ld a, [$c0db]                                 ; $1fb8: $fa $db $c0
    ld c, a                                       ; $1fbb: $4f
    ld a, [$c0e6]                                 ; $1fbc: $fa $e6 $c0
    cp $0d                                        ; $1fbf: $fe $0d
    jr c, jr_000_1fd0                             ; $1fc1: $38 $0d

    ld a, [$c0e7]                                 ; $1fc3: $fa $e7 $c0
    dec a                                         ; $1fc6: $3d
    srl a                                         ; $1fc7: $cb $3f
    bit 1, b                                      ; $1fc9: $cb $48
    jr z, jr_000_1fd8                             ; $1fcb: $28 $0b

    cpl                                           ; $1fcd: $2f
    jr jr_000_1fd8                                ; $1fce: $18 $08

jr_000_1fd0:
    ld a, [$c0e6]                                 ; $1fd0: $fa $e6 $c0
    bit 1, b                                      ; $1fd3: $cb $48
    jr z, jr_000_1fd8                             ; $1fd5: $28 $01

    cpl                                           ; $1fd7: $2f

jr_000_1fd8:
    bit 0, c                                      ; $1fd8: $cb $41
    jr nz, jr_000_1fdd                            ; $1fda: $20 $01

    cpl                                           ; $1fdc: $2f

jr_000_1fdd:
    bit 0, a                                      ; $1fdd: $cb $47
    jr z, jr_000_1fe9                             ; $1fdf: $28 $08

    res 6, b                                      ; $1fe1: $cb $b0
    ld hl, $c000                                  ; $1fe3: $21 $00 $c0
    xor a                                         ; $1fe6: $af
    jr jr_000_1ff0                                ; $1fe7: $18 $07

jr_000_1fe9:
    set 6, b                                      ; $1fe9: $cb $f0
    ld hl, $c020                                  ; $1feb: $21 $20 $c0
    ld a, $80                                     ; $1fee: $3e $80

jr_000_1ff0:
    ldh [$ffad], a                                ; $1ff0: $e0 $ad
    ld a, b                                       ; $1ff2: $78
    ldh [$ff96], a                                ; $1ff3: $e0 $96
    ld a, $04                                     ; $1ff5: $3e $04
    ld [hl], a                                    ; $1ff7: $77
    xor a                                         ; $1ff8: $af
    ldh [$ffb0], a                                ; $1ff9: $e0 $b0
    ldh [$ffb5], a                                ; $1ffb: $e0 $b5
    ld a, $02                                     ; $1ffd: $3e $02
    ldh [$ff90], a                                ; $1fff: $e0 $90
    ret                                           ; $2001: $c9


    ld a, [$c040]                                 ; $2002: $fa $40 $c0
    cp $09                                        ; $2005: $fe $09
    ret nz                                        ; $2007: $c0

    ld a, $03                                     ; $2008: $3e $03
    ldh [$ff90], a                                ; $200a: $e0 $90
    ret                                           ; $200c: $c9


    ldh a, [$ffc2]                                ; $200d: $f0 $c2
    and $0f                                       ; $200f: $e6 $0f
    sub $04                                       ; $2011: $d6 $04
    jr c, jr_000_2049                             ; $2013: $38 $34

    rst RST_08                                    ; $2015: $cf

    db $1c, $20, $29, $21, $31, $20

    ld hl, $ff91                                  ; $201c: $21 $91 $ff
    inc [hl]                                      ; $201f: $34
    bit 0, [hl]                                   ; $2020: $cb $46
    jp nz, Jump_000_2129                          ; $2022: $c2 $29 $21

    ldh a, [$ff96]                                ; $2025: $f0 $96
    bit 6, a                                      ; $2027: $cb $77
    ld a, $00                                     ; $2029: $3e $00
    jr nz, jr_000_202e                            ; $202b: $20 $01

    inc a                                         ; $202d: $3c

jr_000_202e:
    jp Jump_000_2170                              ; $202e: $c3 $70 $21


    ldh a, [$ff91]                                ; $2031: $f0 $91
    res 0, a                                      ; $2033: $cb $87
    add $02                                       ; $2035: $c6 $02
    ldh [$ff91], a                                ; $2037: $e0 $91
    call Call_000_1f3a                            ; $2039: $cd $3a $1f
    bit 7, a                                      ; $203c: $cb $7f
    ld a, $00                                     ; $203e: $3e $00
    jr z, jr_000_2043                             ; $2040: $28 $01

    inc a                                         ; $2042: $3c

jr_000_2043:
    call Call_000_2170                            ; $2043: $cd $70 $21
    jp Jump_000_1eff                              ; $2046: $c3 $ff $1e


jr_000_2049:
    ldh a, [$ff91]                                ; $2049: $f0 $91
    res 0, a                                      ; $204b: $cb $87
    add $02                                       ; $204d: $c6 $02
    ldh [$ff91], a                                ; $204f: $e0 $91
    ld a, [$c04d]                                 ; $2051: $fa $4d $c0
    bit 1, a                                      ; $2054: $cb $4f
    ld a, $00                                     ; $2056: $3e $00
    jr z, jr_000_205b                             ; $2058: $28 $01

    inc a                                         ; $205a: $3c

jr_000_205b:
    call Call_000_2170                            ; $205b: $cd $70 $21
    jp Jump_000_1eff                              ; $205e: $c3 $ff $1e


    ldh a, [$ffaf]                                ; $2061: $f0 $af
    bit 7, a                                      ; $2063: $cb $7f
    jp nz, Jump_000_227c                          ; $2065: $c2 $7c $22

    ld hl, $c0dc                                  ; $2068: $21 $dc $c0
    inc [hl]                                      ; $206b: $34
    ld hl, $c0e6                                  ; $206c: $21 $e6 $c0
    inc [hl]                                      ; $206f: $34
    ld hl, $c0e0                                  ; $2070: $21 $e0 $c0
    ld de, $c0e3                                  ; $2073: $11 $e3 $c0
    ld b, $00                                     ; $2076: $06 $00
    ldh a, [$ff93]                                ; $2078: $f0 $93
    and a                                         ; $207a: $a7
    jr z, jr_000_2085                             ; $207b: $28 $08

    ld hl, $c0e3                                  ; $207d: $21 $e3 $c0
    ld de, $c0e0                                  ; $2080: $11 $e0 $c0
    ld b, $03                                     ; $2083: $06 $03

jr_000_2085:
    ld a, [$c0db]                                 ; $2085: $fa $db $c0
    cp $01                                        ; $2088: $fe $01
    jr z, jr_000_2096                             ; $208a: $28 $0a

    inc hl                                        ; $208c: $23
    inc de                                        ; $208d: $13
    inc b                                         ; $208e: $04
    cp $02                                        ; $208f: $fe $02
    jr z, jr_000_2096                             ; $2091: $28 $03

    inc hl                                        ; $2093: $23
    inc de                                        ; $2094: $13
    inc b                                         ; $2095: $04

jr_000_2096:
    ld a, b                                       ; $2096: $78
    ldh [$ff95], a                                ; $2097: $e0 $95
    inc [hl]                                      ; $2099: $34
    ld a, [hl]                                    ; $209a: $7e
    cp $07                                        ; $209b: $fe $07
    jr z, jr_000_20b9                             ; $209d: $28 $1a

    cp $06                                        ; $209f: $fe $06
    jr nz, jr_000_2110                            ; $20a1: $20 $6d

    ld a, [de]                                    ; $20a3: $1a
    cp $05                                        ; $20a4: $fe $05
    jr c, jr_000_20b9                             ; $20a6: $38 $11

    jr z, jr_000_2110                             ; $20a8: $28 $66

    ld hl, $c0dc                                  ; $20aa: $21 $dc $c0
    dec [hl]                                      ; $20ad: $35
    xor a                                         ; $20ae: $af
    ld [$c0e7], a                                 ; $20af: $ea $e7 $c0
    ld a, $05                                     ; $20b2: $3e $05
    ld [$c0ea], a                                 ; $20b4: $ea $ea $c0
    jr jr_000_2110                                ; $20b7: $18 $57

jr_000_20b9:
    ld a, $01                                     ; $20b9: $3e $01
    ld [$c0e6], a                                 ; $20bb: $ea $e6 $c0
    ld b, $01                                     ; $20be: $06 $01
    ldh a, [$ff93]                                ; $20c0: $f0 $93
    and a                                         ; $20c2: $a7
    jr z, jr_000_20c7                             ; $20c3: $28 $02

    ld b, $ff                                     ; $20c5: $06 $ff

jr_000_20c7:
    ldh a, [$ffc4]                                ; $20c7: $f0 $c4
    add b                                         ; $20c9: $80
    ldh [$ffc4], a                                ; $20ca: $e0 $c4
    ld a, [$c0db]                                 ; $20cc: $fa $db $c0
    inc a                                         ; $20cf: $3c
    ld [$c0db], a                                 ; $20d0: $ea $db $c0
    cp $03                                        ; $20d3: $fe $03
    jr nz, jr_000_20f6                            ; $20d5: $20 $1f

    ld b, $06                                     ; $20d7: $06 $06
    ld a, $04                                     ; $20d9: $3e $04
    ld [$c0ea], a                                 ; $20db: $ea $ea $c0
    ldh a, [$ffc4]                                ; $20de: $f0 $c4
    cp $02                                        ; $20e0: $fe $02
    jr z, jr_000_20e9                             ; $20e2: $28 $05

    inc b                                         ; $20e4: $04
    cp $fe                                        ; $20e5: $fe $fe
    jr nz, jr_000_2110                            ; $20e7: $20 $27

jr_000_20e9:
    ld a, b                                       ; $20e9: $78
    ldh [$ff90], a                                ; $20ea: $e0 $90
    ld a, $96                                     ; $20ec: $3e $96
    ldh [$ff92], a                                ; $20ee: $e0 $92
    ld a, $06                                     ; $20f0: $3e $06
    ld [$c0ea], a                                 ; $20f2: $ea $ea $c0
    ret                                           ; $20f5: $c9


jr_000_20f6:
    cp $04                                        ; $20f6: $fe $04
    jr nz, jr_000_2105                            ; $20f8: $20 $0b

jr_000_20fa:
    ld b, $06                                     ; $20fa: $06 $06
    ldh a, [$ffc4]                                ; $20fc: $f0 $c4
    bit 7, a                                      ; $20fe: $cb $7f
    jr z, jr_000_20e9                             ; $2100: $28 $e7

    inc b                                         ; $2102: $04
    jr jr_000_20e9                                ; $2103: $18 $e4

jr_000_2105:
    ld a, $03                                     ; $2105: $3e $03
    ld [$c0ea], a                                 ; $2107: $ea $ea $c0
    ldh a, [$ff96]                                ; $210a: $f0 $96
    bit 3, a                                      ; $210c: $cb $5f
    jr nz, jr_000_20fa                            ; $210e: $20 $ea

jr_000_2110:
    ld a, $64                                     ; $2110: $3e $64
    ldh [$ff92], a                                ; $2112: $e0 $92
    ld a, $05                                     ; $2114: $3e $05
    ldh [$ff90], a                                ; $2116: $e0 $90
    ret                                           ; $2118: $c9


    ldh a, [$ffc3]                                ; $2119: $f0 $c3
    ldh [$ff91], a                                ; $211b: $e0 $91
    ld hl, $ff92                                  ; $211d: $21 $92 $ff
    dec [hl]                                      ; $2120: $35
    ret nz                                        ; $2121: $c0

    ld a, $0a                                     ; $2122: $3e $0a
    ldh [$ff8a], a                                ; $2124: $e0 $8a
    jp Jump_000_016d                              ; $2126: $c3 $6d $01


Jump_000_2129:
    xor a                                         ; $2129: $af
    ldh [$ff90], a                                ; $212a: $e0 $90
    ret                                           ; $212c: $c9


    xor a                                         ; $212d: $af
    ldh [$ff90], a                                ; $212e: $e0 $90
    ld a, [$c0e6]                                 ; $2130: $fa $e6 $c0
    cp $0d                                        ; $2133: $fe $0d
    ret c                                         ; $2135: $d8

    ld a, [$c0e7]                                 ; $2136: $fa $e7 $c0
    ld l, a                                       ; $2139: $6f
    ld h, $00                                     ; $213a: $26 $00
    ld a, $06                                     ; $213c: $3e $06
    call Call_000_3143                            ; $213e: $cd $43 $31
    and a                                         ; $2141: $a7
    ret nz                                        ; $2142: $c0

    ld a, $08                                     ; $2143: $3e $08
    ldh [$ff8a], a                                ; $2145: $e0 $8a
    jp Jump_000_016d                              ; $2147: $c3 $6d $01


    ldh a, [$ffc3]                                ; $214a: $f0 $c3
    ldh [$ff91], a                                ; $214c: $e0 $91
    ld hl, $ff92                                  ; $214e: $21 $92 $ff
    dec [hl]                                      ; $2151: $35
    ret nz                                        ; $2152: $c0

    xor a                                         ; $2153: $af
    ldh [$ff90], a                                ; $2154: $e0 $90
    jp Jump_000_016d                              ; $2156: $c3 $6d $01


Call_000_2159:
    xor a                                         ; $2159: $af
    ldh [$ff90], a                                ; $215a: $e0 $90
    ldh [$ff91], a                                ; $215c: $e0 $91
    ld a, [$c0e6]                                 ; $215e: $fa $e6 $c0
    cp $0d                                        ; $2161: $fe $0d
    ld a, $01                                     ; $2163: $3e $01
    jr c, jr_000_2169                             ; $2165: $38 $02

    ld a, $07                                     ; $2167: $3e $07

jr_000_2169:
    ld [$c0dd], a                                 ; $2169: $ea $dd $c0
    ld [$c0de], a                                 ; $216c: $ea $de $c0
    ret                                           ; $216f: $c9


Call_000_2170:
Jump_000_2170:
    ldh [$ff93], a                                ; $2170: $e0 $93
    and a                                         ; $2172: $a7
    ld hl, $c081                                  ; $2173: $21 $81 $c0
    jr z, jr_000_217b                             ; $2176: $28 $03

    ld hl, $c0a1                                  ; $2178: $21 $a1 $c0

jr_000_217b:
    inc [hl]                                      ; $217b: $34
    ld hl, $c0dd                                  ; $217c: $21 $dd $c0
    ld de, $c0de                                  ; $217f: $11 $de $c0
    ldh a, [$ff93]                                ; $2182: $f0 $93
    and a                                         ; $2184: $a7
    jr z, jr_000_2189                             ; $2185: $28 $02

    inc hl                                        ; $2187: $23
    dec de                                        ; $2188: $1b

jr_000_2189:
    ld a, [$c0e7]                                 ; $2189: $fa $e7 $c0
    inc a                                         ; $218c: $3c
    ld [$c0e7], a                                 ; $218d: $ea $e7 $c0
    ld a, $08                                     ; $2190: $3e $08
    ldh [$ff90], a                                ; $2192: $e0 $90
    ld a, [hl]                                    ; $2194: $7e
    cp $00                                        ; $2195: $fe $00
    jr z, jr_000_21b3                             ; $2197: $28 $1a

    cp $03                                        ; $2199: $fe $03
    jr c, jr_000_21da                             ; $219b: $38 $3d

    jr z, jr_000_21bc                             ; $219d: $28 $1d

    cp $04                                        ; $219f: $fe $04
    jr z, jr_000_21c9                             ; $21a1: $28 $26

    cp $05                                        ; $21a3: $fe $05
    jr z, jr_000_21d0                             ; $21a5: $28 $29

    cp $06                                        ; $21a7: $fe $06
    jr z, jr_000_21c9                             ; $21a9: $28 $1e

    cp $0c                                        ; $21ab: $fe $0c
    jr c, jr_000_21da                             ; $21ad: $38 $2b

    jr z, jr_000_21e0                             ; $21af: $28 $2f

    jr jr_000_21c9                                ; $21b1: $18 $16

jr_000_21b3:
    ld a, $05                                     ; $21b3: $3e $05
    ld [hl], a                                    ; $21b5: $77
    ld [de], a                                    ; $21b6: $12
    ld a, $29                                     ; $21b7: $3e $29
    jp Jump_000_3665                              ; $21b9: $c3 $65 $36


jr_000_21bc:
    ld a, [de]                                    ; $21bc: $1a
    cp $04                                        ; $21bd: $fe $04
    jr z, jr_000_21b3                             ; $21bf: $28 $f2

    ld a, $04                                     ; $21c1: $3e $04
    ld [hl], a                                    ; $21c3: $77
    ld a, $31                                     ; $21c4: $3e $31
    jp Jump_000_3665                              ; $21c6: $c3 $65 $36


jr_000_21c9:
    xor a                                         ; $21c9: $af
    ld [hl], a                                    ; $21ca: $77
    ld a, $04                                     ; $21cb: $3e $04
    ldh [$ff90], a                                ; $21cd: $e0 $90
    ret                                           ; $21cf: $c9


jr_000_21d0:
    xor a                                         ; $21d0: $af
    ld [de], a                                    ; $21d1: $12
    ld a, $06                                     ; $21d2: $3e $06
    ld [hl], a                                    ; $21d4: $77
    ld a, $31                                     ; $21d5: $3e $31
    jp Jump_000_3665                              ; $21d7: $c3 $65 $36


jr_000_21da:
    inc [hl]                                      ; $21da: $34
    ld a, $31                                     ; $21db: $3e $31
    jp Jump_000_3665                              ; $21dd: $c3 $65 $36


jr_000_21e0:
    ld a, [de]                                    ; $21e0: $1a
    cp $0d                                        ; $21e1: $fe $0d
    jr z, jr_000_21b3                             ; $21e3: $28 $ce

    ld a, $0d                                     ; $21e5: $3e $0d
    ld [hl], a                                    ; $21e7: $77
    ld a, $31                                     ; $21e8: $3e $31
    jp Jump_000_3665                              ; $21ea: $c3 $65 $36


Call_000_21ed:
    ldh a, [$ff8b]                                ; $21ed: $f0 $8b
    and a                                         ; $21ef: $a7
    jr z, jr_000_21f7                             ; $21f0: $28 $05

    ldh a, [$ff96]                                ; $21f2: $f0 $96
    bit 0, a                                      ; $21f4: $cb $47
    ret nz                                        ; $21f6: $c0

jr_000_21f7:
    call Call_000_369e                            ; $21f7: $cd $9e $36
    call Call_000_31ff                            ; $21fa: $cd $ff $31
    call Call_000_2fa0                            ; $21fd: $cd $a0 $2f
    call Call_000_2225                            ; $2200: $cd $25 $22
    ldh a, [$ffaf]                                ; $2203: $f0 $af
    bit 7, a                                      ; $2205: $cb $7f
    jr nz, jr_000_2219                            ; $2207: $20 $10

    ldh a, [$ff9e]                                ; $2209: $f0 $9e
    xor c                                         ; $220b: $a9
    and c                                         ; $220c: $a1
    ldh [$ff9b], a                                ; $220d: $e0 $9b
    ldh [$ff99], a                                ; $220f: $e0 $99
    ld a, c                                       ; $2211: $79
    ldh [$ff9a], a                                ; $2212: $e0 $9a
    ldh [$ff9e], a                                ; $2214: $e0 $9e
    ldh [$ff98], a                                ; $2216: $e0 $98
    ret                                           ; $2218: $c9


jr_000_2219:
    ldh a, [$ff98]                                ; $2219: $f0 $98
    xor c                                         ; $221b: $a9
    and c                                         ; $221c: $a1
    ldh [$ff99], a                                ; $221d: $e0 $99
    ld a, c                                       ; $221f: $79
    ldh [$ff9e], a                                ; $2220: $e0 $9e
    ldh [$ff98], a                                ; $2222: $e0 $98
    ret                                           ; $2224: $c9


Call_000_2225:
    ld a, c                                       ; $2225: $79
    and $c0                                       ; $2226: $e6 $c0
    cp $c0                                        ; $2228: $fe $c0
    jr nz, jr_000_222d                            ; $222a: $20 $01

    xor a                                         ; $222c: $af

jr_000_222d:
    ld b, a                                       ; $222d: $47
    ld a, c                                       ; $222e: $79
    and $30                                       ; $222f: $e6 $30
    cp $30                                        ; $2231: $fe $30
    jr nz, jr_000_2236                            ; $2233: $20 $01

    xor a                                         ; $2235: $af

jr_000_2236:
    or b                                          ; $2236: $b0
    ld b, a                                       ; $2237: $47
    ld a, c                                       ; $2238: $79
    and $0f                                       ; $2239: $e6 $0f
    or b                                          ; $223b: $b0
    ld c, a                                       ; $223c: $4f
    ret                                           ; $223d: $c9


Call_000_223e:
    ldh a, [rSB]                                  ; $223e: $f0 $01
    cp $fe                                        ; $2240: $fe $fe
    jr c, jr_000_2254                             ; $2242: $38 $10

    and $01                                       ; $2244: $e6 $01
    xor $01                                       ; $2246: $ee $01
    ldh [$ff93], a                                ; $2248: $e0 $93
    ld a, $04                                     ; $224a: $3e $04
    ldh [$ff90], a                                ; $224c: $e0 $90
    ldh [$ffec], a                                ; $224e: $e0 $ec
    ldh a, [$ff9c]                                ; $2250: $f0 $9c
    ld c, a                                       ; $2252: $4f
    ret                                           ; $2253: $c9


jr_000_2254:
    ldh a, [$ff8b]                                ; $2254: $f0 $8b
    cp $02                                        ; $2256: $fe $02
    ld d, $20                                     ; $2258: $16 $20
    ld e, $10                                     ; $225a: $1e $10
    ld c, $cf                                     ; $225c: $0e $cf
    jr z, jr_000_2266                             ; $225e: $28 $06

    ld d, $a0                                     ; $2260: $16 $a0
    ld e, $50                                     ; $2262: $1e $50
    ld c, $0f                                     ; $2264: $0e $0f

jr_000_2266:
    ldh a, [rSB]                                  ; $2266: $f0 $01
    rla                                           ; $2268: $17
    and d                                         ; $2269: $a2
    ld b, a                                       ; $226a: $47
    ldh a, [rSB]                                  ; $226b: $f0 $01
    rra                                           ; $226d: $1f
    and e                                         ; $226e: $a3
    or b                                          ; $226f: $b0
    ld b, a                                       ; $2270: $47
    ldh a, [rSB]                                  ; $2271: $f0 $01
    and c                                         ; $2273: $a1
    or b                                          ; $2274: $b0
    ld c, a                                       ; $2275: $4f
    ret                                           ; $2276: $c9


Call_000_2277:
    ldh a, [$ffa0]                                ; $2277: $f0 $a0
    cp $08                                        ; $2279: $fe $08
    ret c                                         ; $227b: $d8

Jump_000_227c:
    xor a                                         ; $227c: $af
    ldh [$ff8a], a                                ; $227d: $e0 $8a
    inc a                                         ; $227f: $3c
    ld [$c0df], a                                 ; $2280: $ea $df $c0
    jp Jump_000_016d                              ; $2283: $c3 $6d $01


Call_000_2286:
    call Call_000_00a9                            ; $2286: $cd $a9 $00
    and $3f                                       ; $2289: $e6 $3f
    add $20                                       ; $228b: $c6 $20
    ld b, $01                                     ; $228d: $06 $01
    ret                                           ; $228f: $c9


Call_000_2290:
    call Call_000_00a9                            ; $2290: $cd $a9 $00
    and $1f                                       ; $2293: $e6 $1f
    sub $10                                       ; $2295: $d6 $10
    ld b, $02                                     ; $2297: $06 $02
    ret                                           ; $2299: $c9


Call_000_229a:
    ld a, [$c0df]                                 ; $229a: $fa $df $c0
    cp $04                                        ; $229d: $fe $04
    ld bc, $0f48                                  ; $229f: $01 $48 $0f
    jr nz, jr_000_22a7                            ; $22a2: $20 $03

    ld bc, $0750                                  ; $22a4: $01 $50 $07

jr_000_22a7:
    call Call_000_00a9                            ; $22a7: $cd $a9 $00
    and b                                         ; $22aa: $a0
    add c                                         ; $22ab: $81
    ld c, $01                                     ; $22ac: $0e $01
    ld b, $03                                     ; $22ae: $06 $03
    ret                                           ; $22b0: $c9


Call_000_22b1:
    ldh a, [$ff91]                                ; $22b1: $f0 $91
    bit 0, a                                      ; $22b3: $cb $47
    ld c, $01                                     ; $22b5: $0e $01
    jr z, jr_000_22bb                             ; $22b7: $28 $02

    ld c, $02                                     ; $22b9: $0e $02

jr_000_22bb:
    ld a, [hl]                                    ; $22bb: $7e
    call Call_000_00ca                            ; $22bc: $cd $ca $00
    jr c, jr_000_22e1                             ; $22bf: $38 $20

    call Call_000_00a9                            ; $22c1: $cd $a9 $00
    and $f0                                       ; $22c4: $e6 $f0
    cp $c0                                        ; $22c6: $fe $c0
    ldh a, [$ff96]                                ; $22c8: $f0 $96
    ld b, a                                       ; $22ca: $47
    ldh a, [$ff91]                                ; $22cb: $f0 $91
    jr c, jr_000_22d1                             ; $22cd: $38 $02

    xor $02                                       ; $22cf: $ee $02

jr_000_22d1:
    bit 6, b                                      ; $22d1: $cb $70
    jr z, jr_000_22d7                             ; $22d3: $28 $02

    xor $02                                       ; $22d5: $ee $02

jr_000_22d7:
    bit 1, a                                      ; $22d7: $cb $4f
    ld a, $20                                     ; $22d9: $3e $20
    jr z, jr_000_22df                             ; $22db: $28 $02

    ld a, $10                                     ; $22dd: $3e $10

jr_000_22df:
    or c                                          ; $22df: $b1
    ld c, a                                       ; $22e0: $4f

jr_000_22e1:
    call Call_000_00a9                            ; $22e1: $cd $a9 $00
    bit 4, a                                      ; $22e4: $cb $67
    jr nz, jr_000_2309                            ; $22e6: $20 $21

    bit 3, a                                      ; $22e8: $cb $5f
    ld a, [$c047]                                 ; $22ea: $fa $47 $c0
    jr nz, jr_000_22f9                            ; $22ed: $20 $0a

    cp $44                                        ; $22ef: $fe $44
    jr nc, jr_000_2309                            ; $22f1: $30 $16

    ldh a, [$ff96]                                ; $22f3: $f0 $96
    xor $40                                       ; $22f5: $ee $40
    jr jr_000_22ff                                ; $22f7: $18 $06

jr_000_22f9:
    cp $3c                                        ; $22f9: $fe $3c
    jr c, jr_000_2309                             ; $22fb: $38 $0c

    ldh a, [$ff96]                                ; $22fd: $f0 $96

jr_000_22ff:
    bit 6, a                                      ; $22ff: $cb $77
    ld a, $80                                     ; $2301: $3e $80
    jr z, jr_000_2307                             ; $2303: $28 $02

    ld a, $40                                     ; $2305: $3e $40

jr_000_2307:
    or c                                          ; $2307: $b1
    ld c, a                                       ; $2308: $4f

jr_000_2309:
    ld a, $04                                     ; $2309: $3e $04
    ret                                           ; $230b: $c9


Call_000_230c:
    ldh a, [$ffaf]                                ; $230c: $f0 $af
    bit 7, a                                      ; $230e: $cb $7f
    ret z                                         ; $2310: $c8

    call Call_000_2277                            ; $2311: $cd $77 $22
    ld c, $00                                     ; $2314: $0e $00
    ldh a, [$ffad]                                ; $2316: $f0 $ad
    bit 6, a                                      ; $2318: $cb $77
    jr z, jr_000_2321                             ; $231a: $28 $05

    call Call_000_23ab                            ; $231c: $cd $ab $23
    jr jr_000_2324                                ; $231f: $18 $03

jr_000_2321:
    call Call_000_233f                            ; $2321: $cd $3f $23

jr_000_2324:
    ld a, [$c05a]                                 ; $2324: $fa $5a $c0
    cp $01                                        ; $2327: $fe $01
    jr z, jr_000_2335                             ; $2329: $28 $0a

    ldh a, [$ffad]                                ; $232b: $f0 $ad
    bit 5, a                                      ; $232d: $cb $6f
    jr z, jr_000_2335                             ; $232f: $28 $04

    res 0, c                                      ; $2331: $cb $81
    res 1, c                                      ; $2333: $cb $89

jr_000_2335:
    ldh a, [$ff9a]                                ; $2335: $f0 $9a
    xor c                                         ; $2337: $a9
    and c                                         ; $2338: $a1
    ldh [$ff9b], a                                ; $2339: $e0 $9b
    ld a, c                                       ; $233b: $79
    ldh [$ff9a], a                                ; $233c: $e0 $9a
    ret                                           ; $233e: $c9


Call_000_233f:
    ldh a, [$ff96]                                ; $233f: $f0 $96
    bit 6, a                                      ; $2341: $cb $77
    ret nz                                        ; $2343: $c0

    ldh a, [$ffb0]                                ; $2344: $f0 $b0
    rst RST_08                                    ; $2346: $cf

    db $51, $23, $60, $23, $6e, $23, $88, $23, $9d, $23

jr_000_2351:
    ld a, [$c000]                                 ; $2351: $fa $00 $c0
    cp $05                                        ; $2354: $fe $05
    ret nz                                        ; $2356: $c0

    call Call_000_2286                            ; $2357: $cd $86 $22
    ldh [$ffb1], a                                ; $235a: $e0 $b1
    ld a, b                                       ; $235c: $78
    ldh [$ffb0], a                                ; $235d: $e0 $b0
    ret                                           ; $235f: $c9


    ld hl, $ffb1                                  ; $2360: $21 $b1 $ff
    dec [hl]                                      ; $2363: $35
    ret nz                                        ; $2364: $c0

    call Call_000_2290                            ; $2365: $cd $90 $22
    ldh [$ffb1], a                                ; $2368: $e0 $b1
    ld a, b                                       ; $236a: $78
    ldh [$ffb0], a                                ; $236b: $e0 $b0
    ret                                           ; $236d: $c9


    ldh a, [$ffb1]                                ; $236e: $f0 $b1
    bit 7, a                                      ; $2370: $cb $7f
    jr nz, jr_000_2379                            ; $2372: $20 $05

    ld c, $20                                     ; $2374: $0e $20
    dec a                                         ; $2376: $3d
    jr jr_000_237c                                ; $2377: $18 $03

jr_000_2379:
    ld c, $10                                     ; $2379: $0e $10
    inc a                                         ; $237b: $3c

jr_000_237c:
    ldh [$ffb1], a                                ; $237c: $e0 $b1
    ret nz                                        ; $237e: $c0

    call Call_000_229a                            ; $237f: $cd $9a $22
    ldh [$ffb1], a                                ; $2382: $e0 $b1
    ld a, b                                       ; $2384: $78
    ldh [$ffb0], a                                ; $2385: $e0 $b0
    ret                                           ; $2387: $c9


    ld a, [$c000]                                 ; $2388: $fa $00 $c0
    cp $06                                        ; $238b: $fe $06
    jr nz, jr_000_2351                            ; $238d: $20 $c2

    ld hl, $ffb1                                  ; $238f: $21 $b1 $ff
    dec [hl]                                      ; $2392: $35
    ret nz                                        ; $2393: $c0

    ld hl, $c094                                  ; $2394: $21 $94 $c0
    call Call_000_22b1                            ; $2397: $cd $b1 $22
    ldh [$ffb0], a                                ; $239a: $e0 $b0
    ret                                           ; $239c: $c9


    ldh a, [$ff9a]                                ; $239d: $f0 $9a
    and $f0                                       ; $239f: $e6 $f0
    ld c, a                                       ; $23a1: $4f
    ldh a, [$ffad]                                ; $23a2: $f0 $ad
    bit 6, a                                      ; $23a4: $cb $77
    ret z                                         ; $23a6: $c8

    xor a                                         ; $23a7: $af
    ldh [$ffb0], a                                ; $23a8: $e0 $b0
    ret                                           ; $23aa: $c9


Call_000_23ab:
    ldh a, [$ffc2]                                ; $23ab: $f0 $c2
    bit 6, a                                      ; $23ad: $cb $77
    ret nz                                        ; $23af: $c0

    ld a, [$c04c]                                 ; $23b0: $fa $4c $c0
    cp $02                                        ; $23b3: $fe $02
    ret nc                                        ; $23b5: $d0

    ldh a, [$ffb0]                                ; $23b6: $f0 $b0
    rst RST_08                                    ; $23b8: $cf

    db $c5, $23, $6e, $24, $ae, $24, $94, $25, $50, $26, $5f, $26

    xor a                                         ; $23c5: $af
    ldh [$ffb4], a                                ; $23c6: $e0 $b4
    ldh a, [$ffad]                                ; $23c8: $f0 $ad
    bit 7, a                                      ; $23ca: $cb $7f
    jr z, jr_000_23d4                             ; $23cc: $28 $06

    ld a, [$c043]                                 ; $23ce: $fa $43 $c0
    cp $80                                        ; $23d1: $fe $80
    ret nc                                        ; $23d3: $d0

jr_000_23d4:
    ld a, [$c05a]                                 ; $23d4: $fa $5a $c0
    cp $02                                        ; $23d7: $fe $02
    jr c, jr_000_2429                             ; $23d9: $38 $4e

    ld c, $06                                     ; $23db: $0e $06
    ld a, [$c003]                                 ; $23dd: $fa $03 $c0
    cp $9a                                        ; $23e0: $fe $9a
    jr c, jr_000_23ec                             ; $23e2: $38 $08

    ld c, $03                                     ; $23e4: $0e $03
    cp $b8                                        ; $23e6: $fe $b8
    jr c, jr_000_23ec                             ; $23e8: $38 $02

    ld c, $00                                     ; $23ea: $0e $00

jr_000_23ec:
    ld b, $00                                     ; $23ec: $06 $00
    ld hl, $c097                                  ; $23ee: $21 $97 $c0
    add hl, bc                                    ; $23f1: $09
    ld d, $00                                     ; $23f2: $16 $00
    ld a, [$c0df]                                 ; $23f4: $fa $df $c0
    cp $03                                        ; $23f7: $fe $03
    jr c, jr_000_2409                             ; $23f9: $38 $0e

    ld a, [$c003]                                 ; $23fb: $fa $03 $c0
    sub $6c                                       ; $23fe: $d6 $6c
    jr nc, jr_000_2404                            ; $2400: $30 $02

    cpl                                           ; $2402: $2f
    inc a                                         ; $2403: $3c

jr_000_2404:
    srl a                                         ; $2404: $cb $3f
    srl a                                         ; $2406: $cb $3f
    ld d, a                                       ; $2408: $57

jr_000_2409:
    ld a, [hl+]                                   ; $2409: $2a
    sub d                                         ; $240a: $92
    jr nc, jr_000_240e                            ; $240b: $30 $01

    xor a                                         ; $240d: $af

jr_000_240e:
    ld d, a                                       ; $240e: $57
    push hl                                       ; $240f: $e5
    call Call_000_00ca                            ; $2410: $cd $ca $00
    pop hl                                        ; $2413: $e1
    jr nc, jr_000_2429                            ; $2414: $30 $13

    ld a, [hl+]                                   ; $2416: $2a
    add d                                         ; $2417: $82
    ld d, a                                       ; $2418: $57
    push hl                                       ; $2419: $e5
    call Call_000_00d9                            ; $241a: $cd $d9 $00
    pop hl                                        ; $241d: $e1
    jr nc, jr_000_2433                            ; $241e: $30 $13

    ld a, [hl]                                    ; $2420: $7e
    add d                                         ; $2421: $82
    call Call_000_00d9                            ; $2422: $cd $d9 $00
    jr nc, jr_000_2454                            ; $2425: $30 $2d

    jr jr_000_245c                                ; $2427: $18 $33

jr_000_2429:
    ld a, [$c005]                                 ; $2429: $fa $05 $c0
    ldh [$ffb2], a                                ; $242c: $e0 $b2
    ld a, [$c003]                                 ; $242e: $fa $03 $c0
    jr jr_000_2463                                ; $2431: $18 $30

jr_000_2433:
    call Call_000_00a9                            ; $2433: $cd $a9 $00
    and $3f                                       ; $2436: $e6 $3f
    add $4c                                       ; $2438: $c6 $4c
    ld b, a                                       ; $243a: $47
    ld a, [$c005]                                 ; $243b: $fa $05 $c0
    ld hl, $c045                                  ; $243e: $21 $45 $c0
    add [hl]                                      ; $2441: $86
    rra                                           ; $2442: $1f
    add b                                         ; $2443: $80
    rra                                           ; $2444: $1f
    ldh [$ffb2], a                                ; $2445: $e0 $b2
    ld a, [$c003]                                 ; $2447: $fa $03 $c0
    sub $20                                       ; $244a: $d6 $20
    cp $84                                        ; $244c: $fe $84
    jr nc, jr_000_2463                            ; $244e: $30 $13

    ld a, $84                                     ; $2450: $3e $84
    jr jr_000_2463                                ; $2452: $18 $0f

jr_000_2454:
    ld a, $6c                                     ; $2454: $3e $6c
    ldh [$ffb2], a                                ; $2456: $e0 $b2
    ld a, $b8                                     ; $2458: $3e $b8
    jr jr_000_2463                                ; $245a: $18 $07

jr_000_245c:
    ld a, $6c                                     ; $245c: $3e $6c
    ldh [$ffb2], a                                ; $245e: $e0 $b2
    ld a, [$c003]                                 ; $2460: $fa $03 $c0

jr_000_2463:
    ldh [$ffb3], a                                ; $2463: $e0 $b3
    ld c, $00                                     ; $2465: $0e $00
    xor a                                         ; $2467: $af
    ldh [$ffb1], a                                ; $2468: $e0 $b1
    inc a                                         ; $246a: $3c
    ldh [$ffb0], a                                ; $246b: $e0 $b0
    ret                                           ; $246d: $c9


    ld hl, $ffb2                                  ; $246e: $21 $b2 $ff
    ld a, [$c005]                                 ; $2471: $fa $05 $c0
    sub [hl]                                      ; $2474: $96
    jr z, jr_000_247d                             ; $2475: $28 $06

    ld c, $20                                     ; $2477: $0e $20
    jr nc, jr_000_247d                            ; $2479: $30 $02

    ld c, $10                                     ; $247b: $0e $10

jr_000_247d:
    inc hl                                        ; $247d: $23
    ld a, [$c003]                                 ; $247e: $fa $03 $c0
    sub [hl]                                      ; $2481: $96
    jr z, jr_000_248c                             ; $2482: $28 $08

    ld a, $40                                     ; $2484: $3e $40
    jr nc, jr_000_248a                            ; $2486: $30 $02

    ld a, $80                                     ; $2488: $3e $80

jr_000_248a:
    or c                                          ; $248a: $b1
    ld c, a                                       ; $248b: $4f

jr_000_248c:
    ldh a, [$ffad]                                ; $248c: $f0 $ad
    bit 7, a                                      ; $248e: $cb $7f
    ret nz                                        ; $2490: $c0

    ld a, [$c05a]                                 ; $2491: $fa $5a $c0
    cp $02                                        ; $2494: $fe $02
    ld a, [$c090]                                 ; $2496: $fa $90 $c0
    jr nc, jr_000_24a4                            ; $2499: $30 $09

    ld b, a                                       ; $249b: $47
    ld a, [$c051]                                 ; $249c: $fa $51 $c0
    srl a                                         ; $249f: $cb $3f
    srl a                                         ; $24a1: $cb $3f
    add b                                         ; $24a3: $80

jr_000_24a4:
    ld hl, $c043                                  ; $24a4: $21 $43 $c0
    cp [hl]                                       ; $24a7: $be
    ret nc                                        ; $24a8: $d0

    ld a, $02                                     ; $24a9: $3e $02
    ldh [$ffb0], a                                ; $24ab: $e0 $b0
    ret                                           ; $24ad: $c9


    ldh a, [$ffb1]                                ; $24ae: $f0 $b1
    and a                                         ; $24b0: $a7
    jr z, jr_000_24c2                             ; $24b1: $28 $0f

    dec a                                         ; $24b3: $3d
    ldh [$ffb1], a                                ; $24b4: $e0 $b1
    ld b, $00                                     ; $24b6: $06 $00
    jp nz, Jump_000_256a                          ; $24b8: $c2 $6a $25

    ld a, $03                                     ; $24bb: $3e $03
    ldh [$ffb0], a                                ; $24bd: $e0 $b0
    jp Jump_000_256a                              ; $24bf: $c3 $6a $25


jr_000_24c2:
    ld a, [$c051]                                 ; $24c2: $fa $51 $c0
    swap a                                        ; $24c5: $cb $37
    and $0f                                       ; $24c7: $e6 $0f
    ld b, a                                       ; $24c9: $47
    srl b                                         ; $24ca: $cb $38
    sla a                                         ; $24cc: $cb $27
    sla a                                         ; $24ce: $cb $27
    sub b                                         ; $24d0: $90
    ld b, a                                       ; $24d1: $47
    ld hl, $c043                                  ; $24d2: $21 $43 $c0
    ld a, [$c003]                                 ; $24d5: $fa $03 $c0
    sub [hl]                                      ; $24d8: $96
    cp b                                          ; $24d9: $b8
    jr nc, jr_000_2508                            ; $24da: $30 $2c

    call Call_000_0890                            ; $24dc: $cd $90 $08
    call Call_000_1722                            ; $24df: $cd $22 $17
    ld a, [$c005]                                 ; $24e2: $fa $05 $c0
    sub h                                         ; $24e5: $94
    add $14                                       ; $24e6: $c6 $14
    cp $28                                        ; $24e8: $fe $28
    jr nc, jr_000_2508                            ; $24ea: $30 $1c

    ld a, [$c047]                                 ; $24ec: $fa $47 $c0
    cp $48                                        ; $24ef: $fe $48
    jr nc, jr_000_2568                            ; $24f1: $30 $75

    ld a, [$c04b]                                 ; $24f3: $fa $4b $c0
    cp $04                                        ; $24f6: $fe $04
    jr nc, jr_000_2500                            ; $24f8: $30 $06

    ld a, [$c04c]                                 ; $24fa: $fa $4c $c0
    and a                                         ; $24fd: $a7
    jr z, jr_000_2508                             ; $24fe: $28 $08

jr_000_2500:
    call Call_000_00a9                            ; $2500: $cd $a9 $00
    and $07                                       ; $2503: $e6 $07
    inc a                                         ; $2505: $3c
    ldh [$ffb1], a                                ; $2506: $e0 $b1

jr_000_2508:
    ld a, [$c047]                                 ; $2508: $fa $47 $c0
    cp $60                                        ; $250b: $fe $60
    jr c, jr_000_251b                             ; $250d: $38 $0c

    ldh a, [$ffb4]                                ; $250f: $f0 $b4
    and a                                         ; $2511: $a7
    jr nz, jr_000_251b                            ; $2512: $20 $07

    ld a, $05                                     ; $2514: $3e $05
    ldh [$ffb0], a                                ; $2516: $e0 $b0
    ld c, $00                                     ; $2518: $0e $00
    ret                                           ; $251a: $c9


jr_000_251b:
    ld a, [$c090]                                 ; $251b: $fa $90 $c0
    ld hl, $c043                                  ; $251e: $21 $43 $c0
    cp [hl]                                       ; $2521: $be
    jr nc, jr_000_2535                            ; $2522: $30 $11

    ld a, [$c047]                                 ; $2524: $fa $47 $c0
    bit 7, a                                      ; $2527: $cb $7f
    jr nz, jr_000_2568                            ; $2529: $20 $3d

    cp $30                                        ; $252b: $fe $30
    jr nc, jr_000_2539                            ; $252d: $30 $0a

    ld a, [$c04c]                                 ; $252f: $fa $4c $c0
    and a                                         ; $2532: $a7
    jr nz, jr_000_2539                            ; $2533: $20 $04

jr_000_2535:
    ld b, $00                                     ; $2535: $06 $00
    jr jr_000_256a                                ; $2537: $18 $31

jr_000_2539:
    ld b, $80                                     ; $2539: $06 $80
    ld a, [$c05a]                                 ; $253b: $fa $5a $c0
    cp $02                                        ; $253e: $fe $02
    jr nc, jr_000_254b                            ; $2540: $30 $09

    ld a, [$c003]                                 ; $2542: $fa $03 $c0
    cp $a4                                        ; $2545: $fe $a4
    jr nc, jr_000_254b                            ; $2547: $30 $02

    ld b, $00                                     ; $2549: $06 $00

jr_000_254b:
    ld a, [$c051]                                 ; $254b: $fa $51 $c0
    srl a                                         ; $254e: $cb $3f
    srl a                                         ; $2550: $cb $3f
    srl a                                         ; $2552: $cb $3f
    ld c, a                                       ; $2554: $4f
    ld a, [$c052]                                 ; $2555: $fa $52 $c0
    bit 7, a                                      ; $2558: $cb $7f
    jr z, jr_000_255e                             ; $255a: $28 $02

    srl c                                         ; $255c: $cb $39

jr_000_255e:
    ld a, [$c043]                                 ; $255e: $fa $43 $c0
    add c                                         ; $2561: $81
    ld hl, $c003                                  ; $2562: $21 $03 $c0
    sub [hl]                                      ; $2565: $96
    jr nc, jr_000_256a                            ; $2566: $30 $02

jr_000_2568:
    ld b, $40                                     ; $2568: $06 $40

Jump_000_256a:
jr_000_256a:
    push bc                                       ; $256a: $c5
    call Call_000_0890                            ; $256b: $cd $90 $08
    call Call_000_1722                            ; $256e: $cd $22 $17
    ld a, [$c005]                                 ; $2571: $fa $05 $c0
    sub h                                         ; $2574: $94
    ld c, $20                                     ; $2575: $0e $20
    bit 7, a                                      ; $2577: $cb $7f
    jr z, jr_000_257f                             ; $2579: $28 $04

    ld c, $10                                     ; $257b: $0e $10
    cpl                                           ; $257d: $2f
    inc a                                         ; $257e: $3c

jr_000_257f:
    cp $08                                        ; $257f: $fe $08
    jr c, jr_000_258b                             ; $2581: $38 $08

    cp $10                                        ; $2583: $fe $10
    jr nc, jr_000_258f                            ; $2585: $30 $08

    ld c, $00                                     ; $2587: $0e $00
    jr jr_000_258f                                ; $2589: $18 $04

jr_000_258b:
    ld a, c                                       ; $258b: $79
    xor $30                                       ; $258c: $ee $30
    ld c, a                                       ; $258e: $4f

jr_000_258f:
    ld a, c                                       ; $258f: $79
    pop bc                                        ; $2590: $c1
    or b                                          ; $2591: $b0
    ld c, a                                       ; $2592: $4f
    ret                                           ; $2593: $c9


    call Call_000_176b                            ; $2594: $cd $6b $17
    ld c, $00                                     ; $2597: $0e $00
    jr c, jr_000_25cd                             ; $2599: $38 $32

    ld a, [$c02b]                                 ; $259b: $fa $2b $c0
    cp $08                                        ; $259e: $fe $08
    jr c, jr_000_25cb                             ; $25a0: $38 $29

    ldh a, [$ff9c]                                ; $25a2: $f0 $9c
    bit 7, a                                      ; $25a4: $cb $7f
    jr z, jr_000_25b1                             ; $25a6: $28 $09

    ld a, [$c023]                                 ; $25a8: $fa $23 $c0
    cp $50                                        ; $25ab: $fe $50
    jr c, jr_000_25b1                             ; $25ad: $38 $02

    ld c, $1e                                     ; $25af: $0e $1e

jr_000_25b1:
    ld a, [$c091]                                 ; $25b1: $fa $91 $c0
    add c                                         ; $25b4: $81
    push af                                       ; $25b5: $f5
    ld a, [$c00b]                                 ; $25b6: $fa $0b $c0
    cp $0c                                        ; $25b9: $fe $0c
    jr c, jr_000_25c3                             ; $25bb: $38 $06

    pop af                                        ; $25bd: $f1
    srl a                                         ; $25be: $cb $3f
    srl a                                         ; $25c0: $cb $3f
    push af                                       ; $25c2: $f5

jr_000_25c3:
    pop af                                        ; $25c3: $f1
    call Call_000_00ca                            ; $25c4: $cd $ca $00
    ld c, $02                                     ; $25c7: $0e $02
    jr nc, jr_000_25cd                            ; $25c9: $30 $02

jr_000_25cb:
    ld c, $01                                     ; $25cb: $0e $01

jr_000_25cd:
    ld a, [$c00b]                                 ; $25cd: $fa $0b $c0
    cp $0c                                        ; $25d0: $fe $0c
    ld a, [$c095]                                 ; $25d2: $fa $95 $c0
    jr c, jr_000_25d9                             ; $25d5: $38 $02

    add $14                                       ; $25d7: $c6 $14

jr_000_25d9:
    call Call_000_00ca                            ; $25d9: $cd $ca $00
    ld b, $00                                     ; $25dc: $06 $00
    jr c, jr_000_2616                             ; $25de: $38 $36

    ld a, [$c0df]                                 ; $25e0: $fa $df $c0
    cp $04                                        ; $25e3: $fe $04
    ld h, $03                                     ; $25e5: $26 $03
    jr nz, jr_000_25eb                            ; $25e7: $20 $02

    ld h, $01                                     ; $25e9: $26 $01

jr_000_25eb:
    call Call_000_00a9                            ; $25eb: $cd $a9 $00
    and h                                         ; $25ee: $a4
    jr nz, jr_000_25fb                            ; $25ef: $20 $0a

    ldh a, [$ff9c]                                ; $25f1: $f0 $9c
    bit 5, a                                      ; $25f3: $cb $6f
    jr nz, jr_000_2602                            ; $25f5: $20 $0b

    bit 4, a                                      ; $25f7: $cb $67
    jr nz, jr_000_260d                            ; $25f9: $20 $12

jr_000_25fb:
    ld a, [$c025]                                 ; $25fb: $fa $25 $c0
    cp $6c                                        ; $25fe: $fe $6c
    jr nc, jr_000_260d                            ; $2600: $30 $0b

jr_000_2602:
    ld a, [$c005]                                 ; $2602: $fa $05 $c0
    cp $88                                        ; $2605: $fe $88
    jr nc, jr_000_2616                            ; $2607: $30 $0d

    ld b, $10                                     ; $2609: $06 $10
    jr jr_000_2616                                ; $260b: $18 $09

jr_000_260d:
    ld a, [$c005]                                 ; $260d: $fa $05 $c0
    cp $50                                        ; $2610: $fe $50
    jr c, jr_000_2616                             ; $2612: $38 $02

    ld b, $20                                     ; $2614: $06 $20

jr_000_2616:
    ld a, b                                       ; $2616: $78
    or c                                          ; $2617: $b1
    ld c, a                                       ; $2618: $4f
    bit 1, c                                      ; $2619: $cb $49
    jr z, jr_000_2624                             ; $261b: $28 $07

    call Call_000_00a9                            ; $261d: $cd $a9 $00
    bit 4, a                                      ; $2620: $cb $67
    jr nz, jr_000_263b                            ; $2622: $20 $17

jr_000_2624:
    ld b, $00                                     ; $2624: $06 $00
    call Call_000_00a9                            ; $2626: $cd $a9 $00
    bit 0, a                                      ; $2629: $cb $47
    jr z, jr_000_2648                             ; $262b: $28 $1b

    ld a, [$c023]                                 ; $262d: $fa $23 $c0
    cp $40                                        ; $2630: $fe $40
    jr c, jr_000_263f                             ; $2632: $38 $0b

    ld a, [$c003]                                 ; $2634: $fa $03 $c0
    cp $b0                                        ; $2637: $fe $b0
    jr c, jr_000_2648                             ; $2639: $38 $0d

jr_000_263b:
    ld b, $40                                     ; $263b: $06 $40
    jr jr_000_2648                                ; $263d: $18 $09

jr_000_263f:
    ld a, [$c003]                                 ; $263f: $fa $03 $c0
    cp $b0                                        ; $2642: $fe $b0
    jr nc, jr_000_2648                            ; $2644: $30 $02

    ld b, $80                                     ; $2646: $06 $80

jr_000_2648:
    ld a, b                                       ; $2648: $78
    or c                                          ; $2649: $b1
    ld c, a                                       ; $264a: $4f
    ld a, $04                                     ; $264b: $3e $04
    ldh [$ffb0], a                                ; $264d: $e0 $b0
    ret                                           ; $264f: $c9


    ldh a, [$ff9a]                                ; $2650: $f0 $9a
    and $f0                                       ; $2652: $e6 $f0
    ld c, a                                       ; $2654: $4f
    ld a, [$c000]                                 ; $2655: $fa $00 $c0
    cp $02                                        ; $2658: $fe $02
    ret z                                         ; $265a: $c8

    xor a                                         ; $265b: $af
    ldh [$ffb0], a                                ; $265c: $e0 $b0
    ret                                           ; $265e: $c9


    ldh a, [$ffb1]                                ; $265f: $f0 $b1
    and a                                         ; $2661: $a7
    jr z, jr_000_2673                             ; $2662: $28 $0f

    dec a                                         ; $2664: $3d
    ldh [$ffb1], a                                ; $2665: $e0 $b1
    ld b, $00                                     ; $2667: $06 $00
    jp nz, Jump_000_26fe                          ; $2669: $c2 $fe $26

    ld a, $03                                     ; $266c: $3e $03
    ldh [$ffb0], a                                ; $266e: $e0 $b0
    jp Jump_000_26fe                              ; $2670: $c3 $fe $26


jr_000_2673:
    ld hl, $c043                                  ; $2673: $21 $43 $c0
    ld a, [$c003]                                 ; $2676: $fa $03 $c0
    sub [hl]                                      ; $2679: $96
    cp $0c                                        ; $267a: $fe $0c
    jr nc, jr_000_26a0                            ; $267c: $30 $22

    ld hl, $c004                                  ; $267e: $21 $04 $c0
    call Call_000_1bef                            ; $2681: $cd $ef $1b
    add $04                                       ; $2684: $c6 $04
    cp $10                                        ; $2686: $fe $10
    jr nc, jr_000_26a0                            ; $2688: $30 $16

    ld a, [$c047]                                 ; $268a: $fa $47 $c0
    cp $60                                        ; $268d: $fe $60
    jr nc, jr_000_26a0                            ; $268f: $30 $0f

    ld a, [$c052]                                 ; $2691: $fa $52 $c0
    bit 7, a                                      ; $2694: $cb $7f
    jr z, jr_000_26a0                             ; $2696: $28 $08

    call Call_000_00a9                            ; $2698: $cd $a9 $00
    and $03                                       ; $269b: $e6 $03
    inc a                                         ; $269d: $3c
    ldh [$ffb1], a                                ; $269e: $e0 $b1

jr_000_26a0:
    ld a, [$c043]                                 ; $26a0: $fa $43 $c0
    cp $90                                        ; $26a3: $fe $90
    jr nc, jr_000_26c7                            ; $26a5: $30 $20

    ld a, [$c052]                                 ; $26a7: $fa $52 $c0
    bit 7, a                                      ; $26aa: $cb $7f
    jr z, jr_000_26d0                             ; $26ac: $28 $22

    ld a, [$c005]                                 ; $26ae: $fa $05 $c0
    add $08                                       ; $26b1: $c6 $08
    ld b, a                                       ; $26b3: $47
    ld a, [$c045]                                 ; $26b4: $fa $45 $c0
    sub b                                         ; $26b7: $90
    jr nc, jr_000_26bc                            ; $26b8: $30 $02

    cpl                                           ; $26ba: $2f
    inc a                                         ; $26bb: $3c

jr_000_26bc:
    sla a                                         ; $26bc: $cb $27
    add $38                                       ; $26be: $c6 $38
    ld b, a                                       ; $26c0: $47
    ld a, [$c047]                                 ; $26c1: $fa $47 $c0
    cp b                                          ; $26c4: $b8
    jr nc, jr_000_26d0                            ; $26c5: $30 $09

jr_000_26c7:
    ld a, $02                                     ; $26c7: $3e $02
    ldh [$ffb0], a                                ; $26c9: $e0 $b0
    ldh [$ffb4], a                                ; $26cb: $e0 $b4
    ld c, $00                                     ; $26cd: $0e $00
    ret                                           ; $26cf: $c9


jr_000_26d0:
    ld a, [$c090]                                 ; $26d0: $fa $90 $c0
    ld hl, $c043                                  ; $26d3: $21 $43 $c0
    cp [hl]                                       ; $26d6: $be
    jr nc, jr_000_26fc                            ; $26d7: $30 $23

    ld b, $80                                     ; $26d9: $06 $80
    ld a, [$c003]                                 ; $26db: $fa $03 $c0
    ld hl, $c043                                  ; $26de: $21 $43 $c0
    sub [hl]                                      ; $26e1: $96
    jr c, jr_000_26fe                             ; $26e2: $38 $1a

    cp $08                                        ; $26e4: $fe $08
    jr c, jr_000_26e8                             ; $26e6: $38 $00

jr_000_26e8:
    ld b, $80                                     ; $26e8: $06 $80
    ld a, [$c003]                                 ; $26ea: $fa $03 $c0
    ld hl, $c043                                  ; $26ed: $21 $43 $c0
    sub [hl]                                      ; $26f0: $96
    cp $18                                        ; $26f1: $fe $18
    jr nc, jr_000_26fc                            ; $26f3: $30 $07

    ld a, [$c047]                                 ; $26f5: $fa $47 $c0
    bit 7, a                                      ; $26f8: $cb $7f
    jr nz, jr_000_26fe                            ; $26fa: $20 $02

jr_000_26fc:
    ld b, $00                                     ; $26fc: $06 $00

Jump_000_26fe:
jr_000_26fe:
    push bc                                       ; $26fe: $c5
    call Call_000_0890                            ; $26ff: $cd $90 $08
    call Call_000_1722                            ; $2702: $cd $22 $17
    ld a, [$c005]                                 ; $2705: $fa $05 $c0
    sub h                                         ; $2708: $94
    ld c, $20                                     ; $2709: $0e $20
    bit 7, a                                      ; $270b: $cb $7f
    jr z, jr_000_2711                             ; $270d: $28 $02

    ld c, $10                                     ; $270f: $0e $10

jr_000_2711:
    cp $fc                                        ; $2711: $fe $fc
    jr nc, jr_000_2719                            ; $2713: $30 $04

    cp $f4                                        ; $2715: $fe $f4
    jr c, jr_000_271b                             ; $2717: $38 $02

jr_000_2719:
    ld c, $00                                     ; $2719: $0e $00

jr_000_271b:
    ld a, c                                       ; $271b: $79
    pop bc                                        ; $271c: $c1
    or b                                          ; $271d: $b0
    ld c, a                                       ; $271e: $4f
    ret                                           ; $271f: $c9


Call_000_2720:
    ldh a, [$ff96]                                ; $2720: $f0 $96
    bit 0, a                                      ; $2722: $cb $47
    ret nz                                        ; $2724: $c0

    ld c, $00                                     ; $2725: $0e $00
    ldh a, [$ffad]                                ; $2727: $f0 $ad
    bit 6, a                                      ; $2729: $cb $77
    jr z, jr_000_2732                             ; $272b: $28 $05

    call Call_000_27bc                            ; $272d: $cd $bc $27
    jr jr_000_2735                                ; $2730: $18 $03

jr_000_2732:
    call Call_000_2750                            ; $2732: $cd $50 $27

jr_000_2735:
    ld a, [$c05a]                                 ; $2735: $fa $5a $c0
    cp $01                                        ; $2738: $fe $01
    jr z, jr_000_2746                             ; $273a: $28 $0a

    ldh a, [$ffad]                                ; $273c: $f0 $ad
    bit 5, a                                      ; $273e: $cb $6f
    jr z, jr_000_2746                             ; $2740: $28 $04

    res 0, c                                      ; $2742: $cb $81
    res 1, c                                      ; $2744: $cb $89

jr_000_2746:
    ldh a, [$ff9c]                                ; $2746: $f0 $9c
    xor c                                         ; $2748: $a9
    and c                                         ; $2749: $a1
    ldh [$ff9d], a                                ; $274a: $e0 $9d
    ld a, c                                       ; $274c: $79
    ldh [$ff9c], a                                ; $274d: $e0 $9c
    ret                                           ; $274f: $c9


Call_000_2750:
    ldh a, [$ff96]                                ; $2750: $f0 $96
    bit 6, a                                      ; $2752: $cb $77
    ret z                                         ; $2754: $c8

    ldh a, [$ffb5]                                ; $2755: $f0 $b5
    rst RST_08                                    ; $2757: $cf

    db $62, $27, $71, $27, $7f, $27, $99, $27, $ae, $27

jr_000_2762:
    ld a, [$c020]                                 ; $2762: $fa $20 $c0
    cp $05                                        ; $2765: $fe $05
    ret nz                                        ; $2767: $c0

    call Call_000_2286                            ; $2768: $cd $86 $22
    ldh [$ffb6], a                                ; $276b: $e0 $b6
    ld a, b                                       ; $276d: $78
    ldh [$ffb5], a                                ; $276e: $e0 $b5
    ret                                           ; $2770: $c9


    ld hl, $ffb6                                  ; $2771: $21 $b6 $ff
    dec [hl]                                      ; $2774: $35
    ret nz                                        ; $2775: $c0

    call Call_000_2290                            ; $2776: $cd $90 $22
    ldh [$ffb6], a                                ; $2779: $e0 $b6
    ld a, b                                       ; $277b: $78
    ldh [$ffb5], a                                ; $277c: $e0 $b5
    ret                                           ; $277e: $c9


    ldh a, [$ffb6]                                ; $277f: $f0 $b6
    bit 7, a                                      ; $2781: $cb $7f
    jr nz, jr_000_278a                            ; $2783: $20 $05

    ld c, $20                                     ; $2785: $0e $20
    dec a                                         ; $2787: $3d
    jr jr_000_278d                                ; $2788: $18 $03

jr_000_278a:
    ld c, $10                                     ; $278a: $0e $10
    inc a                                         ; $278c: $3c

jr_000_278d:
    ldh [$ffb6], a                                ; $278d: $e0 $b6
    ret nz                                        ; $278f: $c0

    call Call_000_229a                            ; $2790: $cd $9a $22
    ldh [$ffb6], a                                ; $2793: $e0 $b6
    ld a, b                                       ; $2795: $78
    ldh [$ffb5], a                                ; $2796: $e0 $b5
    ret                                           ; $2798: $c9


    ld a, [$c020]                                 ; $2799: $fa $20 $c0
    cp $06                                        ; $279c: $fe $06
    jr nz, jr_000_2762                            ; $279e: $20 $c2

    ld hl, $ffb6                                  ; $27a0: $21 $b6 $ff
    dec [hl]                                      ; $27a3: $35
    ret nz                                        ; $27a4: $c0

    ld hl, $c0b4                                  ; $27a5: $21 $b4 $c0
    call Call_000_22b1                            ; $27a8: $cd $b1 $22
    ldh [$ffb5], a                                ; $27ab: $e0 $b5
    ret                                           ; $27ad: $c9


    ldh a, [$ff9c]                                ; $27ae: $f0 $9c
    and $f0                                       ; $27b0: $e6 $f0
    ld c, a                                       ; $27b2: $4f
    ldh a, [$ffad]                                ; $27b3: $f0 $ad
    bit 6, a                                      ; $27b5: $cb $77
    ret z                                         ; $27b7: $c8

    xor a                                         ; $27b8: $af
    ldh [$ffb5], a                                ; $27b9: $e0 $b5
    ret                                           ; $27bb: $c9


Call_000_27bc:
    ldh a, [$ffc2]                                ; $27bc: $f0 $c2
    bit 6, a                                      ; $27be: $cb $77
    ret nz                                        ; $27c0: $c0

    ld a, [$c04c]                                 ; $27c1: $fa $4c $c0
    cp $02                                        ; $27c4: $fe $02
    ret nc                                        ; $27c6: $d0

    ldh a, [$ffb5]                                ; $27c7: $f0 $b5
    rst RST_08                                    ; $27c9: $cf

    db $d6, $27, $7f, $28, $c1, $28, $a7, $29, $63, $2a, $72, $2a

    xor a                                         ; $27d6: $af
    ldh [$ffb9], a                                ; $27d7: $e0 $b9
    ldh a, [$ffad]                                ; $27d9: $f0 $ad
    bit 7, a                                      ; $27db: $cb $7f
    jr nz, jr_000_27e5                            ; $27dd: $20 $06

    ld a, [$c043]                                 ; $27df: $fa $43 $c0
    cp $70                                        ; $27e2: $fe $70
    ret c                                         ; $27e4: $d8

jr_000_27e5:
    ld a, [$c05a]                                 ; $27e5: $fa $5a $c0
    cp $02                                        ; $27e8: $fe $02
    jr c, jr_000_283a                             ; $27ea: $38 $4e

    ld c, $00                                     ; $27ec: $0e $00
    ld a, [$c023]                                 ; $27ee: $fa $23 $c0
    cp $38                                        ; $27f1: $fe $38
    jr c, jr_000_27fd                             ; $27f3: $38 $08

    ld c, $03                                     ; $27f5: $0e $03
    cp $56                                        ; $27f7: $fe $56
    jr c, jr_000_27fd                             ; $27f9: $38 $02

    ld c, $06                                     ; $27fb: $0e $06

jr_000_27fd:
    ld b, $00                                     ; $27fd: $06 $00
    ld hl, $c0b7                                  ; $27ff: $21 $b7 $c0
    add hl, bc                                    ; $2802: $09
    ld d, $00                                     ; $2803: $16 $00
    ld a, [$c0df]                                 ; $2805: $fa $df $c0
    cp $03                                        ; $2808: $fe $03
    jr c, jr_000_281a                             ; $280a: $38 $0e

    ld a, [$c023]                                 ; $280c: $fa $23 $c0
    sub $6c                                       ; $280f: $d6 $6c
    jr nc, jr_000_2815                            ; $2811: $30 $02

    cpl                                           ; $2813: $2f
    inc a                                         ; $2814: $3c

jr_000_2815:
    srl a                                         ; $2815: $cb $3f
    srl a                                         ; $2817: $cb $3f
    ld d, a                                       ; $2819: $57

jr_000_281a:
    ld a, [hl+]                                   ; $281a: $2a
    sub d                                         ; $281b: $92
    jr nc, jr_000_281f                            ; $281c: $30 $01

    xor a                                         ; $281e: $af

jr_000_281f:
    ld d, a                                       ; $281f: $57
    push hl                                       ; $2820: $e5
    call Call_000_00ca                            ; $2821: $cd $ca $00
    pop hl                                        ; $2824: $e1
    jr nc, jr_000_283a                            ; $2825: $30 $13

    ld a, [hl+]                                   ; $2827: $2a
    add d                                         ; $2828: $82
    ld d, a                                       ; $2829: $57
    push hl                                       ; $282a: $e5
    call Call_000_00d9                            ; $282b: $cd $d9 $00
    pop hl                                        ; $282e: $e1
    jr nc, jr_000_2844                            ; $282f: $30 $13

    ld a, [hl]                                    ; $2831: $7e
    add d                                         ; $2832: $82
    call Call_000_00d9                            ; $2833: $cd $d9 $00
    jr nc, jr_000_2865                            ; $2836: $30 $2d

    jr jr_000_286d                                ; $2838: $18 $33

jr_000_283a:
    ld a, [$c025]                                 ; $283a: $fa $25 $c0
    ldh [$ffb7], a                                ; $283d: $e0 $b7
    ld a, [$c023]                                 ; $283f: $fa $23 $c0
    jr jr_000_2874                                ; $2842: $18 $30

jr_000_2844:
    call Call_000_00a9                            ; $2844: $cd $a9 $00
    and $3f                                       ; $2847: $e6 $3f
    add $4c                                       ; $2849: $c6 $4c
    ld b, a                                       ; $284b: $47
    ld a, [$c025]                                 ; $284c: $fa $25 $c0
    ld hl, $c045                                  ; $284f: $21 $45 $c0
    add [hl]                                      ; $2852: $86
    rra                                           ; $2853: $1f
    add b                                         ; $2854: $80
    rra                                           ; $2855: $1f
    ldh [$ffb7], a                                ; $2856: $e0 $b7
    ld a, [$c023]                                 ; $2858: $fa $23 $c0
    add $20                                       ; $285b: $c6 $20
    cp $6c                                        ; $285d: $fe $6c
    jr c, jr_000_2874                             ; $285f: $38 $13

    ld a, $6c                                     ; $2861: $3e $6c
    jr jr_000_2874                                ; $2863: $18 $0f

jr_000_2865:
    ld a, $6c                                     ; $2865: $3e $6c
    ldh [$ffb7], a                                ; $2867: $e0 $b7
    ld a, $38                                     ; $2869: $3e $38
    jr jr_000_2874                                ; $286b: $18 $07

jr_000_286d:
    ld a, $6c                                     ; $286d: $3e $6c
    ldh [$ffb7], a                                ; $286f: $e0 $b7
    ld a, [$c023]                                 ; $2871: $fa $23 $c0

jr_000_2874:
    ldh [$ffb8], a                                ; $2874: $e0 $b8
    ld c, $00                                     ; $2876: $0e $00
    xor a                                         ; $2878: $af
    ldh [$ffb6], a                                ; $2879: $e0 $b6
    inc a                                         ; $287b: $3c
    ldh [$ffb5], a                                ; $287c: $e0 $b5
    ret                                           ; $287e: $c9


    ld hl, $ffb7                                  ; $287f: $21 $b7 $ff
    ld a, [$c025]                                 ; $2882: $fa $25 $c0
    sub [hl]                                      ; $2885: $96
    jr z, jr_000_288e                             ; $2886: $28 $06

    ld c, $20                                     ; $2888: $0e $20
    jr nc, jr_000_288e                            ; $288a: $30 $02

    ld c, $10                                     ; $288c: $0e $10

jr_000_288e:
    inc hl                                        ; $288e: $23
    ld a, [$c023]                                 ; $288f: $fa $23 $c0
    sub [hl]                                      ; $2892: $96
    jr z, jr_000_289d                             ; $2893: $28 $08

    ld a, $40                                     ; $2895: $3e $40
    jr nc, jr_000_289b                            ; $2897: $30 $02

    ld a, $80                                     ; $2899: $3e $80

jr_000_289b:
    or c                                          ; $289b: $b1
    ld c, a                                       ; $289c: $4f

jr_000_289d:
    ldh a, [$ffad]                                ; $289d: $f0 $ad
    bit 7, a                                      ; $289f: $cb $7f
    ret z                                         ; $28a1: $c8

    ld a, [$c05a]                                 ; $28a2: $fa $5a $c0
    cp $02                                        ; $28a5: $fe $02
    ld a, [$c0b0]                                 ; $28a7: $fa $b0 $c0
    jr nc, jr_000_28b7                            ; $28aa: $30 $0b

    ld b, a                                       ; $28ac: $47
    ld a, [$c051]                                 ; $28ad: $fa $51 $c0
    srl a                                         ; $28b0: $cb $3f
    srl a                                         ; $28b2: $cb $3f
    ld l, a                                       ; $28b4: $6f
    ld a, b                                       ; $28b5: $78
    sub l                                         ; $28b6: $95

jr_000_28b7:
    ld hl, $c043                                  ; $28b7: $21 $43 $c0
    cp [hl]                                       ; $28ba: $be
    ret c                                         ; $28bb: $d8

    ld a, $02                                     ; $28bc: $3e $02
    ldh [$ffb5], a                                ; $28be: $e0 $b5
    ret                                           ; $28c0: $c9


    ldh a, [$ffb6]                                ; $28c1: $f0 $b6
    and a                                         ; $28c3: $a7
    jr z, jr_000_28d5                             ; $28c4: $28 $0f

    dec a                                         ; $28c6: $3d
    ldh [$ffb6], a                                ; $28c7: $e0 $b6
    ld b, $00                                     ; $28c9: $06 $00
    jp nz, Jump_000_297d                          ; $28cb: $c2 $7d $29

    ld a, $03                                     ; $28ce: $3e $03
    ldh [$ffb5], a                                ; $28d0: $e0 $b5
    jp Jump_000_297d                              ; $28d2: $c3 $7d $29


jr_000_28d5:
    ld a, [$c051]                                 ; $28d5: $fa $51 $c0
    swap a                                        ; $28d8: $cb $37
    and $0f                                       ; $28da: $e6 $0f
    ld b, a                                       ; $28dc: $47
    srl b                                         ; $28dd: $cb $38
    sla a                                         ; $28df: $cb $27
    sla a                                         ; $28e1: $cb $27
    sub b                                         ; $28e3: $90
    ld b, a                                       ; $28e4: $47
    ld hl, $c023                                  ; $28e5: $21 $23 $c0
    ld a, [$c043]                                 ; $28e8: $fa $43 $c0
    sub [hl]                                      ; $28eb: $96
    cp b                                          ; $28ec: $b8
    jr nc, jr_000_291b                            ; $28ed: $30 $2c

    call Call_000_08a6                            ; $28ef: $cd $a6 $08
    call Call_000_1722                            ; $28f2: $cd $22 $17
    ld a, [$c025]                                 ; $28f5: $fa $25 $c0
    sub h                                         ; $28f8: $94
    add $14                                       ; $28f9: $c6 $14
    cp $28                                        ; $28fb: $fe $28
    jr nc, jr_000_291b                            ; $28fd: $30 $1c

    ld a, [$c047]                                 ; $28ff: $fa $47 $c0
    cp $48                                        ; $2902: $fe $48
    jr nc, jr_000_297b                            ; $2904: $30 $75

    ld a, [$c04b]                                 ; $2906: $fa $4b $c0
    cp $04                                        ; $2909: $fe $04
    jr nc, jr_000_2913                            ; $290b: $30 $06

    ld a, [$c04c]                                 ; $290d: $fa $4c $c0
    and a                                         ; $2910: $a7
    jr z, jr_000_291b                             ; $2911: $28 $08

jr_000_2913:
    call Call_000_00a9                            ; $2913: $cd $a9 $00
    and $07                                       ; $2916: $e6 $07
    inc a                                         ; $2918: $3c
    ldh [$ffb6], a                                ; $2919: $e0 $b6

jr_000_291b:
    ld a, [$c047]                                 ; $291b: $fa $47 $c0
    cp $60                                        ; $291e: $fe $60
    jr c, jr_000_292e                             ; $2920: $38 $0c

    ldh a, [$ffb9]                                ; $2922: $f0 $b9
    and a                                         ; $2924: $a7
    jr nz, jr_000_292e                            ; $2925: $20 $07

    ld a, $05                                     ; $2927: $3e $05
    ldh [$ffb5], a                                ; $2929: $e0 $b5
    ld c, $00                                     ; $292b: $0e $00
    ret                                           ; $292d: $c9


jr_000_292e:
    ld a, [$c0b0]                                 ; $292e: $fa $b0 $c0
    ld hl, $c043                                  ; $2931: $21 $43 $c0
    cp [hl]                                       ; $2934: $be
    jr c, jr_000_2948                             ; $2935: $38 $11

    ld a, [$c047]                                 ; $2937: $fa $47 $c0
    bit 7, a                                      ; $293a: $cb $7f
    jr nz, jr_000_297b                            ; $293c: $20 $3d

    cp $30                                        ; $293e: $fe $30
    jr nc, jr_000_294c                            ; $2940: $30 $0a

    ld a, [$c04c]                                 ; $2942: $fa $4c $c0
    and a                                         ; $2945: $a7
    jr nz, jr_000_294c                            ; $2946: $20 $04

jr_000_2948:
    ld b, $00                                     ; $2948: $06 $00
    jr jr_000_297d                                ; $294a: $18 $31

jr_000_294c:
    ld b, $80                                     ; $294c: $06 $80
    ld a, [$c05a]                                 ; $294e: $fa $5a $c0
    cp $02                                        ; $2951: $fe $02
    jr nc, jr_000_295e                            ; $2953: $30 $09

    ld a, [$c023]                                 ; $2955: $fa $23 $c0
    cp $4c                                        ; $2958: $fe $4c
    jr c, jr_000_295e                             ; $295a: $38 $02

    ld b, $00                                     ; $295c: $06 $00

jr_000_295e:
    ld a, [$c051]                                 ; $295e: $fa $51 $c0
    srl a                                         ; $2961: $cb $3f
    srl a                                         ; $2963: $cb $3f
    srl a                                         ; $2965: $cb $3f
    ld c, a                                       ; $2967: $4f
    ld a, [$c052]                                 ; $2968: $fa $52 $c0
    bit 7, a                                      ; $296b: $cb $7f
    jr z, jr_000_2971                             ; $296d: $28 $02

    srl c                                         ; $296f: $cb $39

jr_000_2971:
    ld a, [$c043]                                 ; $2971: $fa $43 $c0
    sub c                                         ; $2974: $91
    ld hl, $c023                                  ; $2975: $21 $23 $c0
    sub [hl]                                      ; $2978: $96
    jr nc, jr_000_297d                            ; $2979: $30 $02

jr_000_297b:
    ld b, $40                                     ; $297b: $06 $40

Jump_000_297d:
jr_000_297d:
    push bc                                       ; $297d: $c5
    call Call_000_08a6                            ; $297e: $cd $a6 $08
    call Call_000_1722                            ; $2981: $cd $22 $17
    ld a, [$c025]                                 ; $2984: $fa $25 $c0
    sub h                                         ; $2987: $94
    ld c, $20                                     ; $2988: $0e $20
    bit 7, a                                      ; $298a: $cb $7f
    jr z, jr_000_2992                             ; $298c: $28 $04

    ld c, $10                                     ; $298e: $0e $10
    cpl                                           ; $2990: $2f
    inc a                                         ; $2991: $3c

jr_000_2992:
    cp $08                                        ; $2992: $fe $08
    jr c, jr_000_299e                             ; $2994: $38 $08

    cp $10                                        ; $2996: $fe $10
    jr nc, jr_000_29a2                            ; $2998: $30 $08

    ld c, $00                                     ; $299a: $0e $00
    jr jr_000_29a2                                ; $299c: $18 $04

jr_000_299e:
    ld a, c                                       ; $299e: $79
    xor $30                                       ; $299f: $ee $30
    ld c, a                                       ; $29a1: $4f

jr_000_29a2:
    ld a, c                                       ; $29a2: $79
    pop bc                                        ; $29a3: $c1
    or b                                          ; $29a4: $b0
    ld c, a                                       ; $29a5: $4f
    ret                                           ; $29a6: $c9


    call Call_000_176b                            ; $29a7: $cd $6b $17
    ld c, $00                                     ; $29aa: $0e $00
    jr c, jr_000_29e0                             ; $29ac: $38 $32

    ld a, [$c00b]                                 ; $29ae: $fa $0b $c0
    cp $08                                        ; $29b1: $fe $08
    jr c, jr_000_29de                             ; $29b3: $38 $29

    ldh a, [$ff9a]                                ; $29b5: $f0 $9a
    bit 6, a                                      ; $29b7: $cb $77
    jr z, jr_000_29c4                             ; $29b9: $28 $09

    ld a, [$c003]                                 ; $29bb: $fa $03 $c0
    cp $a0                                        ; $29be: $fe $a0
    jr nc, jr_000_29c4                            ; $29c0: $30 $02

    ld c, $1e                                     ; $29c2: $0e $1e

jr_000_29c4:
    ld a, [$c0b1]                                 ; $29c4: $fa $b1 $c0
    add c                                         ; $29c7: $81
    push af                                       ; $29c8: $f5
    ld a, [$c02b]                                 ; $29c9: $fa $2b $c0
    cp $0c                                        ; $29cc: $fe $0c
    jr c, jr_000_29d6                             ; $29ce: $38 $06

    pop af                                        ; $29d0: $f1
    srl a                                         ; $29d1: $cb $3f
    srl a                                         ; $29d3: $cb $3f
    push af                                       ; $29d5: $f5

jr_000_29d6:
    pop af                                        ; $29d6: $f1
    call Call_000_00ca                            ; $29d7: $cd $ca $00
    ld c, $02                                     ; $29da: $0e $02
    jr nc, jr_000_29e0                            ; $29dc: $30 $02

jr_000_29de:
    ld c, $01                                     ; $29de: $0e $01

jr_000_29e0:
    ld a, [$c02b]                                 ; $29e0: $fa $2b $c0
    cp $0c                                        ; $29e3: $fe $0c
    ld a, [$c0b5]                                 ; $29e5: $fa $b5 $c0
    jr c, jr_000_29ec                             ; $29e8: $38 $02

    add $14                                       ; $29ea: $c6 $14

jr_000_29ec:
    call Call_000_00ca                            ; $29ec: $cd $ca $00
    ld b, $00                                     ; $29ef: $06 $00
    jr c, jr_000_2a29                             ; $29f1: $38 $36

    ld a, [$c0df]                                 ; $29f3: $fa $df $c0
    cp $04                                        ; $29f6: $fe $04
    ld h, $03                                     ; $29f8: $26 $03
    jr nz, jr_000_29fe                            ; $29fa: $20 $02

    ld h, $01                                     ; $29fc: $26 $01

jr_000_29fe:
    call Call_000_00a9                            ; $29fe: $cd $a9 $00
    and h                                         ; $2a01: $a4
    jr nz, jr_000_2a0e                            ; $2a02: $20 $0a

    ldh a, [$ff9a]                                ; $2a04: $f0 $9a
    bit 5, a                                      ; $2a06: $cb $6f
    jr nz, jr_000_2a15                            ; $2a08: $20 $0b

    bit 4, a                                      ; $2a0a: $cb $67
    jr nz, jr_000_2a20                            ; $2a0c: $20 $12

jr_000_2a0e:
    ld a, [$c005]                                 ; $2a0e: $fa $05 $c0
    cp $6c                                        ; $2a11: $fe $6c
    jr nc, jr_000_2a20                            ; $2a13: $30 $0b

jr_000_2a15:
    ld a, [$c025]                                 ; $2a15: $fa $25 $c0
    cp $88                                        ; $2a18: $fe $88
    jr nc, jr_000_2a29                            ; $2a1a: $30 $0d

    ld b, $10                                     ; $2a1c: $06 $10
    jr jr_000_2a29                                ; $2a1e: $18 $09

jr_000_2a20:
    ld a, [$c025]                                 ; $2a20: $fa $25 $c0
    cp $50                                        ; $2a23: $fe $50
    jr c, jr_000_2a29                             ; $2a25: $38 $02

    ld b, $20                                     ; $2a27: $06 $20

jr_000_2a29:
    ld a, b                                       ; $2a29: $78
    or c                                          ; $2a2a: $b1
    ld c, a                                       ; $2a2b: $4f
    bit 1, c                                      ; $2a2c: $cb $49
    jr z, jr_000_2a37                             ; $2a2e: $28 $07

    call Call_000_00a9                            ; $2a30: $cd $a9 $00
    bit 4, a                                      ; $2a33: $cb $67
    jr nz, jr_000_2a4e                            ; $2a35: $20 $17

jr_000_2a37:
    ld b, $00                                     ; $2a37: $06 $00
    call Call_000_00a9                            ; $2a39: $cd $a9 $00
    bit 0, a                                      ; $2a3c: $cb $47
    jr z, jr_000_2a5b                             ; $2a3e: $28 $1b

    ld a, [$c003]                                 ; $2a40: $fa $03 $c0
    cp $b0                                        ; $2a43: $fe $b0
    jr nc, jr_000_2a52                            ; $2a45: $30 $0b

    ld a, [$c023]                                 ; $2a47: $fa $23 $c0
    cp $40                                        ; $2a4a: $fe $40
    jr nc, jr_000_2a5b                            ; $2a4c: $30 $0d

jr_000_2a4e:
    ld b, $80                                     ; $2a4e: $06 $80
    jr jr_000_2a5b                                ; $2a50: $18 $09

jr_000_2a52:
    ld a, [$c023]                                 ; $2a52: $fa $23 $c0
    cp $40                                        ; $2a55: $fe $40
    jr c, jr_000_2a5b                             ; $2a57: $38 $02

    ld b, $40                                     ; $2a59: $06 $40

jr_000_2a5b:
    ld a, b                                       ; $2a5b: $78
    or c                                          ; $2a5c: $b1
    ld c, a                                       ; $2a5d: $4f
    ld a, $04                                     ; $2a5e: $3e $04
    ldh [$ffb5], a                                ; $2a60: $e0 $b5
    ret                                           ; $2a62: $c9


    ldh a, [$ff9c]                                ; $2a63: $f0 $9c
    and $f0                                       ; $2a65: $e6 $f0
    ld c, a                                       ; $2a67: $4f
    ld a, [$c020]                                 ; $2a68: $fa $20 $c0
    cp $02                                        ; $2a6b: $fe $02
    ret z                                         ; $2a6d: $c8

    xor a                                         ; $2a6e: $af
    ldh [$ffb5], a                                ; $2a6f: $e0 $b5
    ret                                           ; $2a71: $c9


    ldh a, [$ffb6]                                ; $2a72: $f0 $b6
    and a                                         ; $2a74: $a7
    jr z, jr_000_2a86                             ; $2a75: $28 $0f

    dec a                                         ; $2a77: $3d
    ldh [$ffb6], a                                ; $2a78: $e0 $b6
    ld b, $00                                     ; $2a7a: $06 $00
    jp nz, Jump_000_2b11                          ; $2a7c: $c2 $11 $2b

    ld a, $03                                     ; $2a7f: $3e $03
    ldh [$ffb5], a                                ; $2a81: $e0 $b5
    jp Jump_000_2b11                              ; $2a83: $c3 $11 $2b


jr_000_2a86:
    ld hl, $c023                                  ; $2a86: $21 $23 $c0
    ld a, [$c043]                                 ; $2a89: $fa $43 $c0
    sub [hl]                                      ; $2a8c: $96
    cp $0c                                        ; $2a8d: $fe $0c
    jr nc, jr_000_2ab3                            ; $2a8f: $30 $22

    ld hl, $c024                                  ; $2a91: $21 $24 $c0
    call Call_000_1bef                            ; $2a94: $cd $ef $1b
    add $0c                                       ; $2a97: $c6 $0c
    cp $10                                        ; $2a99: $fe $10
    jr nc, jr_000_2ab3                            ; $2a9b: $30 $16

    ld a, [$c047]                                 ; $2a9d: $fa $47 $c0
    cp $60                                        ; $2aa0: $fe $60
    jr nc, jr_000_2ab3                            ; $2aa2: $30 $0f

    ld a, [$c052]                                 ; $2aa4: $fa $52 $c0
    bit 7, a                                      ; $2aa7: $cb $7f
    jr z, jr_000_2ab3                             ; $2aa9: $28 $08

    call Call_000_00a9                            ; $2aab: $cd $a9 $00
    and $03                                       ; $2aae: $e6 $03
    inc a                                         ; $2ab0: $3c
    ldh [$ffb6], a                                ; $2ab1: $e0 $b6

jr_000_2ab3:
    ld a, [$c043]                                 ; $2ab3: $fa $43 $c0
    cp $60                                        ; $2ab6: $fe $60
    jr c, jr_000_2ada                             ; $2ab8: $38 $20

    ld a, [$c052]                                 ; $2aba: $fa $52 $c0
    bit 7, a                                      ; $2abd: $cb $7f
    jr z, jr_000_2ae3                             ; $2abf: $28 $22

    ld a, [$c025]                                 ; $2ac1: $fa $25 $c0
    sub $08                                       ; $2ac4: $d6 $08
    ld b, a                                       ; $2ac6: $47
    ld a, [$c045]                                 ; $2ac7: $fa $45 $c0
    sub b                                         ; $2aca: $90
    jr nc, jr_000_2acf                            ; $2acb: $30 $02

    cpl                                           ; $2acd: $2f
    inc a                                         ; $2ace: $3c

jr_000_2acf:
    sla a                                         ; $2acf: $cb $27
    add $38                                       ; $2ad1: $c6 $38
    ld b, a                                       ; $2ad3: $47
    ld a, [$c047]                                 ; $2ad4: $fa $47 $c0
    cp b                                          ; $2ad7: $b8
    jr nc, jr_000_2ae3                            ; $2ad8: $30 $09

jr_000_2ada:
    ld a, $02                                     ; $2ada: $3e $02
    ldh [$ffb5], a                                ; $2adc: $e0 $b5
    ldh [$ffb9], a                                ; $2ade: $e0 $b9
    ld c, $00                                     ; $2ae0: $0e $00
    ret                                           ; $2ae2: $c9


jr_000_2ae3:
    ld a, [$c0b0]                                 ; $2ae3: $fa $b0 $c0
    ld hl, $c043                                  ; $2ae6: $21 $43 $c0
    cp [hl]                                       ; $2ae9: $be
    jr c, jr_000_2b0f                             ; $2aea: $38 $23

    ld b, $40                                     ; $2aec: $06 $40
    ld a, [$c043]                                 ; $2aee: $fa $43 $c0
    ld hl, $c023                                  ; $2af1: $21 $23 $c0
    sub [hl]                                      ; $2af4: $96
    jr c, jr_000_2b11                             ; $2af5: $38 $1a

    cp $08                                        ; $2af7: $fe $08
    jr c, jr_000_2afb                             ; $2af9: $38 $00

jr_000_2afb:
    ld b, $40                                     ; $2afb: $06 $40
    ld a, [$c043]                                 ; $2afd: $fa $43 $c0
    ld hl, $c023                                  ; $2b00: $21 $23 $c0
    sub [hl]                                      ; $2b03: $96
    cp $18                                        ; $2b04: $fe $18
    jr nc, jr_000_2b0f                            ; $2b06: $30 $07

    ld a, [$c047]                                 ; $2b08: $fa $47 $c0
    bit 7, a                                      ; $2b0b: $cb $7f
    jr nz, jr_000_2b11                            ; $2b0d: $20 $02

jr_000_2b0f:
    ld b, $00                                     ; $2b0f: $06 $00

Jump_000_2b11:
jr_000_2b11:
    push bc                                       ; $2b11: $c5
    call Call_000_08a6                            ; $2b12: $cd $a6 $08
    call Call_000_1722                            ; $2b15: $cd $22 $17
    ld a, [$c025]                                 ; $2b18: $fa $25 $c0
    sub h                                         ; $2b1b: $94
    ld c, $20                                     ; $2b1c: $0e $20
    bit 7, a                                      ; $2b1e: $cb $7f
    jr z, jr_000_2b24                             ; $2b20: $28 $02

    ld c, $10                                     ; $2b22: $0e $10

jr_000_2b24:
    cp $04                                        ; $2b24: $fe $04
    jr c, jr_000_2b2c                             ; $2b26: $38 $04

    cp $0c                                        ; $2b28: $fe $0c
    jr nc, jr_000_2b2e                            ; $2b2a: $30 $02

jr_000_2b2c:
    ld c, $00                                     ; $2b2c: $0e $00

jr_000_2b2e:
    ld a, c                                       ; $2b2e: $79
    pop bc                                        ; $2b2f: $c1
    or b                                          ; $2b30: $b0
    ld c, a                                       ; $2b31: $4f
    ret                                           ; $2b32: $c9


Call_000_2b33:
    ld a, [$c000]                                 ; $2b33: $fa $00 $c0
    rst RST_08                                    ; $2b36: $cf

    db $3b, $2b, $c2, $2b

    ldh a, [$ff8a]                                ; $2b3b: $f0 $8a
    cp $06                                        ; $2b3d: $fe $06
    ld hl, $2cce                                  ; $2b3f: $21 $ce $2c
    jr z, jr_000_2bb9                             ; $2b42: $28 $75

    cp $0a                                        ; $2b44: $fe $0a
    jr nz, jr_000_2b55                            ; $2b46: $20 $0d

    ld hl, $2dec                                  ; $2b48: $21 $ec $2d
    call Call_000_2cc1                            ; $2b4b: $cd $c1 $2c
    jr nz, jr_000_2bb9                            ; $2b4e: $20 $69

    ld hl, $2dfa                                  ; $2b50: $21 $fa $2d
    jr jr_000_2bb9                                ; $2b53: $18 $64

jr_000_2b55:
    ldh a, [$ff8a]                                ; $2b55: $f0 $8a
    cp $05                                        ; $2b57: $fe $05
    jr z, jr_000_2b9e                             ; $2b59: $28 $43

    ld a, [$c0e6]                                 ; $2b5b: $fa $e6 $c0
    cp $01                                        ; $2b5e: $fe $01
    jr nz, jr_000_2b6f                            ; $2b60: $20 $0d

    ld hl, $2e16                                  ; $2b62: $21 $16 $2e
    call Call_000_2cc1                            ; $2b65: $cd $c1 $2c
    jr nz, jr_000_2bb9                            ; $2b68: $20 $4f

    ld hl, $2e08                                  ; $2b6a: $21 $08 $2e
    jr jr_000_2bb9                                ; $2b6d: $18 $4a

jr_000_2b6f:
    ldh a, [$ffba]                                ; $2b6f: $f0 $ba
    ld b, a                                       ; $2b71: $47
    ldh a, [$ffbc]                                ; $2b72: $f0 $bc
    xor b                                         ; $2b74: $a8
    and $02                                       ; $2b75: $e6 $02
    jr z, jr_000_2b91                             ; $2b77: $28 $18

    ld a, [$c0ea]                                 ; $2b79: $fa $ea $c0
    and a                                         ; $2b7c: $a7
    jr nz, jr_000_2b84                            ; $2b7d: $20 $05

    ld a, $01                                     ; $2b7f: $3e $01
    ld [$c0ea], a                                 ; $2b81: $ea $ea $c0

jr_000_2b84:
    ld hl, $2dc8                                  ; $2b84: $21 $c8 $2d
    call Call_000_2cc1                            ; $2b87: $cd $c1 $2c
    jr z, jr_000_2bb9                             ; $2b8a: $28 $2d

    ld hl, $2dd6                                  ; $2b8c: $21 $d6 $2d
    jr jr_000_2bb9                                ; $2b8f: $18 $28

jr_000_2b91:
    ld hl, $2de4                                  ; $2b91: $21 $e4 $2d
    call Call_000_2cc1                            ; $2b94: $cd $c1 $2c
    jr nz, jr_000_2bb9                            ; $2b97: $20 $20

    ld hl, $2de8                                  ; $2b99: $21 $e8 $2d
    jr jr_000_2bb9                                ; $2b9c: $18 $1b

jr_000_2b9e:
    ld a, [$c0df]                                 ; $2b9e: $fa $df $c0
    ld hl, $2ce6                                  ; $2ba1: $21 $e6 $2c
    cp $01                                        ; $2ba4: $fe $01
    jr z, jr_000_2bb9                             ; $2ba6: $28 $11

    ld hl, $2cf9                                  ; $2ba8: $21 $f9 $2c
    cp $02                                        ; $2bab: $fe $02
    jr z, jr_000_2bb9                             ; $2bad: $28 $0a

    ld hl, $2d16                                  ; $2baf: $21 $16 $2d
    cp $03                                        ; $2bb2: $fe $03
    jr z, jr_000_2bb9                             ; $2bb4: $28 $03

    ld hl, $2d5b                                  ; $2bb6: $21 $5b $2d

jr_000_2bb9:
    call Call_000_2cb4                            ; $2bb9: $cd $b4 $2c
    ld a, $01                                     ; $2bbc: $3e $01
    ld [$c000], a                                 ; $2bbe: $ea $00 $c0
    ret                                           ; $2bc1: $c9


Jump_000_2bc2:
    ld a, [$c010]                                 ; $2bc2: $fa $10 $c0
    ld l, a                                       ; $2bc5: $6f
    ld a, [$c011]                                 ; $2bc6: $fa $11 $c0
    ld h, a                                       ; $2bc9: $67
    ld a, [hl+]                                   ; $2bca: $2a
    push hl                                       ; $2bcb: $e5
    rst RST_08                                    ; $2bcc: $cf

    db $dd, $2b, $e9, $2b, $47, $2c, $7c, $2c, $7c, $2c, $88, $2c, $7e, $2c, $ac, $2c

    pop hl                                        ; $2bdd: $e1
    ld a, [hl+]                                   ; $2bde: $2a
    ld [$c005], a                                 ; $2bdf: $ea $05 $c0
    ld a, [hl+]                                   ; $2be2: $2a
    ld [$c001], a                                 ; $2be3: $ea $01 $c0
    jp Jump_000_2cb4                              ; $2be6: $c3 $b4 $2c


    pop hl                                        ; $2be9: $e1
    ld a, [$c012]                                 ; $2bea: $fa $12 $c0
    and a                                         ; $2bed: $a7
    jr z, jr_000_2c19                             ; $2bee: $28 $29

jr_000_2bf0:
    dec a                                         ; $2bf0: $3d
    jr z, jr_000_2c38                             ; $2bf1: $28 $45

    ld [$c012], a                                 ; $2bf3: $ea $12 $c0
    and $03                                       ; $2bf6: $e6 $03
    ret nz                                        ; $2bf8: $c0

    ld a, [$c005]                                 ; $2bf9: $fa $05 $c0
    ld b, a                                       ; $2bfc: $47
    ld a, [$c014]                                 ; $2bfd: $fa $14 $c0
    add b                                         ; $2c00: $80
    ld [$c005], a                                 ; $2c01: $ea $05 $c0
    ld a, [$c012]                                 ; $2c04: $fa $12 $c0
    and $0f                                       ; $2c07: $e6 $0f
    ret nz                                        ; $2c09: $c0

Call_000_2c0a:
jr_000_2c0a:
    ld a, [$c013]                                 ; $2c0a: $fa $13 $c0
    ld b, a                                       ; $2c0d: $47
    ld a, [$c001]                                 ; $2c0e: $fa $01 $c0
    ld [$c013], a                                 ; $2c11: $ea $13 $c0
    ld a, b                                       ; $2c14: $78
    ld [$c001], a                                 ; $2c15: $ea $01 $c0
    ret                                           ; $2c18: $c9


jr_000_2c19:
    ld a, [hl+]                                   ; $2c19: $2a
    ld [$c001], a                                 ; $2c1a: $ea $01 $c0
    push hl                                       ; $2c1d: $e5
    cp $0b                                        ; $2c1e: $fe $0b
    jr c, jr_000_2c29                             ; $2c20: $38 $07

    cp $0e                                        ; $2c22: $fe $0e
    ld a, $0f                                     ; $2c24: $3e $0f
    call c, Call_000_3665                         ; $2c26: $dc $65 $36

jr_000_2c29:
    pop hl                                        ; $2c29: $e1
    ld a, [hl+]                                   ; $2c2a: $2a
    ld [$c013], a                                 ; $2c2b: $ea $13 $c0
    ld a, [hl+]                                   ; $2c2e: $2a
    ld [$c014], a                                 ; $2c2f: $ea $14 $c0
    ld a, [hl+]                                   ; $2c32: $2a
    ld [$c012], a                                 ; $2c33: $ea $12 $c0
    jr jr_000_2bf0                                ; $2c36: $18 $b8

jr_000_2c38:
    push hl                                       ; $2c38: $e5
    call Call_000_2c0a                            ; $2c39: $cd $0a $2c
    pop hl                                        ; $2c3c: $e1
    inc hl                                        ; $2c3d: $23
    inc hl                                        ; $2c3e: $23
    inc hl                                        ; $2c3f: $23
    inc hl                                        ; $2c40: $23
    call Call_000_2cb4                            ; $2c41: $cd $b4 $2c
    jp Jump_000_2bc2                              ; $2c44: $c3 $c2 $2b


    pop hl                                        ; $2c47: $e1
    ld a, [$c012]                                 ; $2c48: $fa $12 $c0
    and a                                         ; $2c4b: $a7
    jr z, jr_000_2c6a                             ; $2c4c: $28 $1c

jr_000_2c4e:
    dec a                                         ; $2c4e: $3d
    jr z, jr_000_2c38                             ; $2c4f: $28 $e7

    ld [$c012], a                                 ; $2c51: $ea $12 $c0
    and $03                                       ; $2c54: $e6 $03
    ret nz                                        ; $2c56: $c0

    ld a, [$c005]                                 ; $2c57: $fa $05 $c0
    ld b, a                                       ; $2c5a: $47
    ld a, [$c014]                                 ; $2c5b: $fa $14 $c0
    add b                                         ; $2c5e: $80
    ld [$c005], a                                 ; $2c5f: $ea $05 $c0
    ld a, [$c012]                                 ; $2c62: $fa $12 $c0
    and $07                                       ; $2c65: $e6 $07
    jr z, jr_000_2c0a                             ; $2c67: $28 $a1

    ret                                           ; $2c69: $c9


jr_000_2c6a:
    ld a, [hl+]                                   ; $2c6a: $2a
    ld [$c001], a                                 ; $2c6b: $ea $01 $c0
    ld a, [hl+]                                   ; $2c6e: $2a
    ld [$c013], a                                 ; $2c6f: $ea $13 $c0
    ld a, [hl+]                                   ; $2c72: $2a
    ld [$c014], a                                 ; $2c73: $ea $14 $c0
    ld a, [hl+]                                   ; $2c76: $2a
    ld [$c012], a                                 ; $2c77: $ea $12 $c0
    jr jr_000_2c4e                                ; $2c7a: $18 $d2

    pop hl                                        ; $2c7c: $e1
    ret                                           ; $2c7d: $c9


    ld a, [$c012]                                 ; $2c7e: $fa $12 $c0
    and a                                         ; $2c81: $a7
    jr nz, jr_000_2c88                            ; $2c82: $20 $04

    ld hl, $c0df                                  ; $2c84: $21 $df $c0
    inc [hl]                                      ; $2c87: $34

jr_000_2c88:
    pop hl                                        ; $2c88: $e1
    ld a, [$c012]                                 ; $2c89: $fa $12 $c0
    and a                                         ; $2c8c: $a7
    jr nz, jr_000_2ca0                            ; $2c8d: $20 $11

    ld a, $1a                                     ; $2c8f: $3e $1a
    ld [$c012], a                                 ; $2c91: $ea $12 $c0
    call Call_000_3665                            ; $2c94: $cd $65 $36
    call Call_000_3670                            ; $2c97: $cd $70 $36
    call Call_000_3670                            ; $2c9a: $cd $70 $36
    call Call_000_3670                            ; $2c9d: $cd $70 $36

jr_000_2ca0:
    ldh a, [$ff99]                                ; $2ca0: $f0 $99
    bit 3, a                                      ; $2ca2: $cb $5f
    ret z                                         ; $2ca4: $c8

    ld a, $02                                     ; $2ca5: $3e $02
    ldh [$ff8a], a                                ; $2ca7: $e0 $8a
    jp Jump_000_016d                              ; $2ca9: $c3 $6d $01


    pop hl                                        ; $2cac: $e1
    ld a, $01                                     ; $2cad: $3e $01
    ld [$c0df], a                                 ; $2caf: $ea $df $c0
    jr jr_000_2ca0                                ; $2cb2: $18 $ec

Call_000_2cb4:
Jump_000_2cb4:
    ld a, l                                       ; $2cb4: $7d
    ld [$c010], a                                 ; $2cb5: $ea $10 $c0
    ld a, h                                       ; $2cb8: $7c
    ld [$c011], a                                 ; $2cb9: $ea $11 $c0
    xor a                                         ; $2cbc: $af
    ld [$c012], a                                 ; $2cbd: $ea $12 $c0
    ret                                           ; $2cc0: $c9


Call_000_2cc1:
    ldh a, [$ff96]                                ; $2cc1: $f0 $96
    bit 1, a                                      ; $2cc3: $cb $4f
    ldh a, [$ffba]                                ; $2cc5: $f0 $ba
    jr z, jr_000_2ccb                             ; $2cc7: $28 $02

    xor $02                                       ; $2cc9: $ee $02

jr_000_2ccb:
    bit 1, a                                      ; $2ccb: $cb $4f
    ret                                           ; $2ccd: $c9


    db $00, $50, $02, $01, $02, $02, $00, $10, $01, $0e, $0f, $00, $80, $01, $10, $11
    db $ff, $f8, $01, $10, $11, $ff, $a0, $05, $00, $a8, $00, $01, $00, $01, $ff, $b8
    db $01, $00, $01, $ff, $b0, $01, $02, $02, $00, $80, $06, $00, $a8, $00, $02, $00
    db $01, $fe, $cc, $01, $00, $00, $00, $20, $02, $03, $04, $02, $18, $01, $02, $02
    db $00, $20, $01, $05, $05, $00, $40, $06, $00, $a8, $00, $01, $00, $01, $ff, $b8
    db $01, $00, $01, $ff, $b0, $01, $02, $02, $00, $20, $01, $06, $06, $00, $10, $01
    db $07, $07, $00, $14, $01, $06, $06, $00, $10, $01, $07, $07, $00, $14, $01, $02
    db $02, $00, $20, $01, $08, $08, $00, $10, $01, $09, $09, $00, $14, $01, $08, $08
    db $00, $10, $01, $09, $09, $00, $14, $01, $02, $02, $00, $40, $06, $00, $50, $02
    db $01, $02, $02, $00, $20, $01, $0b, $0b, $00, $28, $01, $02, $02, $00, $10, $02
    db $00, $01, $ff, $50, $01, $02, $02, $00, $10, $01, $0c, $0c, $00, $28, $01, $02
    db $02, $00, $10, $02, $03, $04, $01, $50, $01, $02, $02, $00, $10, $01, $0b, $0b
    db $00, $28, $01, $02, $02, $00, $10, $02, $03, $04, $01, $50, $01, $02, $02, $00
    db $10, $01, $0d, $0d, $00, $28, $01, $02, $02, $00, $10, $02, $00, $01, $ff, $50
    db $01, $02, $02, $00, $10, $01, $0b, $0b, $00, $28, $01, $02, $02, $00, $18, $01
    db $0b, $0b, $00, $28, $01, $02, $02, $00, $40, $04, $00, $30, $00, $02, $13, $14
    db $02, $f0, $02, $13, $14, $02, $f0, $04, $00, $70, $00, $02, $00, $01, $fe, $f0
    db $02, $00, $01, $fe, $f0, $04, $00, $f0, $00, $04, $00, $f0, $00, $04, $00, $30
    db $00, $01, $13, $14, $01, $64, $01, $15, $16, $00, $f0, $07, $00, $70, $00, $01
    db $00, $01, $ff, $64, $01, $17, $18, $00, $f0, $07, $00, $a0, $00, $02, $00, $01
    db $fe, $60, $01, $12, $12, $00, $70, $04, $00, $00, $00, $02, $13, $14, $02, $60
    db $01, $12, $12, $00, $70, $04

Call_000_2e24:
    ld hl, $c0eb                                  ; $2e24: $21 $eb $c0
    ld de, $9902                                  ; $2e27: $11 $02 $99
    ld b, $10                                     ; $2e2a: $06 $10

jr_000_2e2c:
    ld a, [hl+]                                   ; $2e2c: $2a
    ld [de], a                                    ; $2e2d: $12
    inc de                                        ; $2e2e: $13
    dec b                                         ; $2e2f: $05
    jr nz, jr_000_2e2c                            ; $2e30: $20 $fa

    ldh a, [$ff95]                                ; $2e32: $f0 $95
    cp $ff                                        ; $2e34: $fe $ff
    ret z                                         ; $2e36: $c8

    ldh a, [$ff96]                                ; $2e37: $f0 $96
    and $03                                       ; $2e39: $e6 $03
    cp $03                                        ; $2e3b: $fe $03
    ldh a, [$ff95]                                ; $2e3d: $f0 $95
    jr z, jr_000_2e4b                             ; $2e3f: $28 $0a

    rst RST_18                                    ; $2e41: $df

    db $06, $8c, $8e, $90, $cc, $ce, $d0

    jr jr_000_2e53                                ; $2e49: $18 $08

jr_000_2e4b:
    rst RST_18                                    ; $2e4b: $df

    db $06, $cc, $ce, $d0, $8c, $8e, $90

jr_000_2e53:
    ld e, a                                       ; $2e53: $5f
    ld d, $98                                     ; $2e54: $16 $98
    ldh a, [$ffa0]                                ; $2e56: $f0 $a0
    and a                                         ; $2e58: $a7
    ret nz                                        ; $2e59: $c0

    ldh a, [$ff9f]                                ; $2e5a: $f0 $9f
    cp $80                                        ; $2e5c: $fe $80
    ret nc                                        ; $2e5e: $d0

    and $08                                       ; $2e5f: $e6 $08
    ld a, $80                                     ; $2e61: $3e $80
    jr z, jr_000_2e71                             ; $2e63: $28 $0c

    ldh a, [$ff95]                                ; $2e65: $f0 $95
    ld c, a                                       ; $2e67: $4f
    ld b, $00                                     ; $2e68: $06 $00
    ld hl, $c0e0                                  ; $2e6a: $21 $e0 $c0
    add hl, bc                                    ; $2e6d: $09
    ld a, [hl]                                    ; $2e6e: $7e
    or $d0                                        ; $2e6f: $f6 $d0

jr_000_2e71:
    ld [de], a                                    ; $2e71: $12
    ret                                           ; $2e72: $c9


Call_000_2e73:
    ldh a, [$ffa0]                                ; $2e73: $f0 $a0
    and a                                         ; $2e75: $a7
    jr nz, jr_000_2ec7                            ; $2e76: $20 $4f

    ld a, [$c0ea]                                 ; $2e78: $fa $ea $c0
    cp $03                                        ; $2e7b: $fe $03
    jr z, jr_000_2e97                             ; $2e7d: $28 $18

    cp $04                                        ; $2e7f: $fe $04
    jr z, jr_000_2e97                             ; $2e81: $28 $14

    cp $06                                        ; $2e83: $fe $06
    jr z, jr_000_2e97                             ; $2e85: $28 $10

    ldh a, [$ff9f]                                ; $2e87: $f0 $9f
    cp $02                                        ; $2e89: $fe $02
    jr nz, jr_000_2ec7                            ; $2e8b: $20 $3a

    ld a, $10                                     ; $2e8d: $3e $10
    call Call_000_3665                            ; $2e8f: $cd $65 $36
    call Call_000_3670                            ; $2e92: $cd $70 $36
    jr jr_000_2ec7                                ; $2e95: $18 $30

jr_000_2e97:
    ldh a, [$ff9f]                                ; $2e97: $f0 $9f
    cp $02                                        ; $2e99: $fe $02
    jr nz, jr_000_2eb1                            ; $2e9b: $20 $14

    ldh a, [$ff95]                                ; $2e9d: $f0 $95
    bit 7, a                                      ; $2e9f: $cb $7f
    jr nz, jr_000_2ec7                            ; $2ea1: $20 $24

    cp $03                                        ; $2ea3: $fe $03
    ld a, $2d                                     ; $2ea5: $3e $2d
    jr c, jr_000_2eab                             ; $2ea7: $38 $02

    ld a, $2f                                     ; $2ea9: $3e $2f

jr_000_2eab:
    call Call_000_3665                            ; $2eab: $cd $65 $36
    call Call_000_3670                            ; $2eae: $cd $70 $36

jr_000_2eb1:
    ldh a, [$ff9f]                                ; $2eb1: $f0 $9f
    cp $14                                        ; $2eb3: $fe $14
    jr nz, jr_000_2ebf                            ; $2eb5: $20 $08

    ld a, $10                                     ; $2eb7: $3e $10
    call Call_000_3665                            ; $2eb9: $cd $65 $36
    call Call_000_3670                            ; $2ebc: $cd $70 $36

jr_000_2ebf:
    ldh a, [$ff9f]                                ; $2ebf: $f0 $9f
    cp $3c                                        ; $2ec1: $fe $3c
    ld a, $00                                     ; $2ec3: $3e $00
    jr c, jr_000_2ed6                             ; $2ec5: $38 $0f

jr_000_2ec7:
    ldh a, [$ff9f]                                ; $2ec7: $f0 $9f
    and $1f                                       ; $2ec9: $e6 $1f
    cp $12                                        ; $2ecb: $fe $12
    ld a, $00                                     ; $2ecd: $3e $00
    jr nc, jr_000_2ed4                            ; $2ecf: $30 $03

    ld a, [$c0ea]                                 ; $2ed1: $fa $ea $c0

jr_000_2ed4:
    swap a                                        ; $2ed4: $cb $37

jr_000_2ed6:
    ld e, a                                       ; $2ed6: $5f
    ld d, $00                                     ; $2ed7: $16 $00
    ld hl, $2ee6                                  ; $2ed9: $21 $e6 $2e
    add hl, de                                    ; $2edc: $19
    ld de, $c0eb                                  ; $2edd: $11 $eb $c0
    ld bc, $0010                                  ; $2ee0: $01 $10 $00
    jp Jump_000_303e                              ; $2ee3: $c3 $3e $30


    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $dc, $e1, $da, $e7, $e0, $de, $80, $ec, $e2, $dd, $de, $ec, $80, $80
    db $80, $80, $80, $80, $80, $d1, $80, $ec, $de, $ed, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $80, $d2, $80, $ec, $de, $ed, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $80, $d3, $80, $ec, $de, $ed, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $ed, $e2, $de, $80, $80, $db, $eb, $de, $da, $e4, $80, $80, $80
    db $80, $80, $80, $80, $80, $df, $e2, $e7, $da, $e5, $80, $80, $80, $80, $80, $80

Call_000_2f56:
    xor a                                         ; $2f56: $af
    ldh [$ff8c], a                                ; $2f57: $e0 $8c
    ldh [$ff8e], a                                ; $2f59: $e0 $8e
    ldh a, [rIE]                                  ; $2f5b: $f0 $ff
    set 0, a                                      ; $2f5d: $cb $c7
    call Call_000_2f67                            ; $2f5f: $cd $67 $2f
    call Call_000_2f6f                            ; $2f62: $cd $6f $2f
    ei                                            ; $2f65: $fb
    ret                                           ; $2f66: $c9


Call_000_2f67:
    ld b, a                                       ; $2f67: $47
    xor a                                         ; $2f68: $af
    ldh [rIF], a                                  ; $2f69: $e0 $0f
    ld a, b                                       ; $2f6b: $78
    ldh [rIE], a                                  ; $2f6c: $e0 $ff
    ret                                           ; $2f6e: $c9


Call_000_2f6f:
    ldh a, [$ffa6]                                ; $2f6f: $f0 $a6
    set 7, a                                      ; $2f71: $cb $ff
    ldh [$ffa6], a                                ; $2f73: $e0 $a6
    ldh [rLCDC], a                                ; $2f75: $e0 $40
    ret                                           ; $2f77: $c9


Call_000_2f78:
jr_000_2f78:
    ldh a, [rLY]                                  ; $2f78: $f0 $44
    cp $91                                        ; $2f7a: $fe $91
    jr nz, jr_000_2f78                            ; $2f7c: $20 $fa

    ldh a, [rLCDC]                                ; $2f7e: $f0 $40
    res 7, a                                      ; $2f80: $cb $bf
    ldh [rLCDC], a                                ; $2f82: $e0 $40
    ldh a, [$ffa6]                                ; $2f84: $f0 $a6
    res 7, a                                      ; $2f86: $cb $bf
    ldh [$ffa6], a                                ; $2f88: $e0 $a6
    ret                                           ; $2f8a: $c9


Call_000_2f8b:
    ldh a, [$ffa8]                                ; $2f8b: $f0 $a8
    ldh [rSCX], a                                 ; $2f8d: $e0 $43
    ldh a, [$ffaa]                                ; $2f8f: $f0 $aa
    ldh [rSCY], a                                 ; $2f91: $e0 $42
    ldh a, [$ffab]                                ; $2f93: $f0 $ab
    ldh [rWX], a                                  ; $2f95: $e0 $4b
    ldh a, [$ffac]                                ; $2f97: $f0 $ac
    ldh [rWY], a                                  ; $2f99: $e0 $4a
    ldh a, [$ffa6]                                ; $2f9b: $f0 $a6
    ldh [rLCDC], a                                ; $2f9d: $e0 $40
    ret                                           ; $2f9f: $c9


Call_000_2fa0:
    ld a, $20                                     ; $2fa0: $3e $20
    ldh [rP1], a                                  ; $2fa2: $e0 $00
    ldh a, [rP1]                                  ; $2fa4: $f0 $00
    ldh a, [rP1]                                  ; $2fa6: $f0 $00
    cpl                                           ; $2fa8: $2f
    and $0f                                       ; $2fa9: $e6 $0f
    swap a                                        ; $2fab: $cb $37
    ld b, a                                       ; $2fad: $47
    ld a, $10                                     ; $2fae: $3e $10
    ldh [rP1], a                                  ; $2fb0: $e0 $00
    ldh a, [rP1]                                  ; $2fb2: $f0 $00
    ldh a, [rP1]                                  ; $2fb4: $f0 $00
    ldh a, [rP1]                                  ; $2fb6: $f0 $00
    ldh a, [rP1]                                  ; $2fb8: $f0 $00
    ldh a, [rP1]                                  ; $2fba: $f0 $00
    ldh a, [rP1]                                  ; $2fbc: $f0 $00
    cpl                                           ; $2fbe: $2f
    and $0f                                       ; $2fbf: $e6 $0f
    or b                                          ; $2fc1: $b0
    ld c, a                                       ; $2fc2: $4f
    ld a, $30                                     ; $2fc3: $3e $30
    ldh [rP1], a                                  ; $2fc5: $e0 $00
    ret                                           ; $2fc7: $c9


Call_000_2fc8:
    jp $ff80                                      ; $2fc8: $c3 $80 $ff


Call_000_2fcb:
    ld de, $ff80                                  ; $2fcb: $11 $80 $ff
    rst RST_28                                    ; $2fce: $ef

    db $0a, $3e, $de, $e0, $46, $3e, $28, $3d, $20, $fd, $c9

    ret                                           ; $2fda: $c9


Call_000_2fdb:
Jump_000_2fdb:
    ld b, a                                       ; $2fdb: $47
    ldh a, [$ff8d]                                ; $2fdc: $f0 $8d
    bit 7, a                                      ; $2fde: $cb $7f
    ret nz                                        ; $2fe0: $c0

    ld a, $01                                     ; $2fe1: $3e $01
    ldh [rSC], a                                  ; $2fe3: $e0 $02
    ld a, b                                       ; $2fe5: $78
    ldh [rSB], a                                  ; $2fe6: $e0 $01
    ld a, $81                                     ; $2fe8: $3e $81
    ldh [rSC], a                                  ; $2fea: $e0 $02
    ret                                           ; $2fec: $c9


Call_000_2fed:
Jump_000_2fed:
    ld b, a                                       ; $2fed: $47
    ldh a, [$ff8d]                                ; $2fee: $f0 $8d
    bit 7, a                                      ; $2ff0: $cb $7f
    ret z                                         ; $2ff2: $c8

    di                                            ; $2ff3: $f3
    ld a, $00                                     ; $2ff4: $3e $00
    ldh [rSC], a                                  ; $2ff6: $e0 $02
    ld a, b                                       ; $2ff8: $78
    ldh [rSB], a                                  ; $2ff9: $e0 $01
    ld a, $80                                     ; $2ffb: $3e $80
    ldh [rSC], a                                  ; $2ffd: $e0 $02
    ei                                            ; $2fff: $fb
    ret                                           ; $3000: $c9


Call_000_3001:
    ld hl, $9800                                  ; $3001: $21 $00 $98
    ld bc, $0800                                  ; $3004: $01 $00 $08

jr_000_3007:
    ld a, $80                                     ; $3007: $3e $80
    ld [hl+], a                                   ; $3009: $22
    dec bc                                        ; $300a: $0b
    ld a, b                                       ; $300b: $78
    or c                                          ; $300c: $b1
    jr nz, jr_000_3007                            ; $300d: $20 $f8

    ret                                           ; $300f: $c9


Call_000_3010:
    xor a                                         ; $3010: $af

Call_000_3011:
    ld l, a                                       ; $3011: $6f
    ld h, $de                                     ; $3012: $26 $de
    ld a, $a0                                     ; $3014: $3e $a0
    sub l                                         ; $3016: $95
    ret z                                         ; $3017: $c8

    srl a                                         ; $3018: $cb $3f
    srl a                                         ; $301a: $cb $3f
    ld b, a                                       ; $301c: $47
    ld de, $0003                                  ; $301d: $11 $03 $00
    xor a                                         ; $3020: $af

jr_000_3021:
    ld [hl+], a                                   ; $3021: $22
    add hl, de                                    ; $3022: $19
    dec b                                         ; $3023: $05
    jr nz, jr_000_3021                            ; $3024: $20 $fb

    ret                                           ; $3026: $c9


Call_000_3027:
    ld hl, $c000                                  ; $3027: $21 $00 $c0
    ld bc, $1f80                                  ; $302a: $01 $80 $1f

jr_000_302d:
    xor a                                         ; $302d: $af
    ld [hl+], a                                   ; $302e: $22
    dec bc                                        ; $302f: $0b
    ld a, b                                       ; $3030: $78
    or c                                          ; $3031: $b1
    jr nz, jr_000_302d                            ; $3032: $20 $f9

    ld hl, $ff8a                                  ; $3034: $21 $8a $ff
    ld b, $74                                     ; $3037: $06 $74

jr_000_3039:
    ld [hl+], a                                   ; $3039: $22
    dec b                                         ; $303a: $05
    jr nz, jr_000_3039                            ; $303b: $20 $fc

    ret                                           ; $303d: $c9


Call_000_303e:
Jump_000_303e:
jr_000_303e:
    ld a, [hl+]                                   ; $303e: $2a
    ld [de], a                                    ; $303f: $12
    inc de                                        ; $3040: $13
    dec bc                                        ; $3041: $0b
    ld a, b                                       ; $3042: $78
    or c                                          ; $3043: $b1
    jr nz, jr_000_303e                            ; $3044: $20 $f8

    ret                                           ; $3046: $c9


Call_000_3047:
    add a                                         ; $3047: $87
    ld e, a                                       ; $3048: $5f
    ld d, $00                                     ; $3049: $16 $00
    add hl, de                                    ; $304b: $19
    ld a, [hl+]                                   ; $304c: $2a
    ld h, [hl]                                    ; $304d: $66
    ld l, a                                       ; $304e: $6f
    ret                                           ; $304f: $c9


Call_000_3050:
    ld a, b                                       ; $3050: $78
    add $10                                       ; $3051: $c6 $10
    ld b, a                                       ; $3053: $47
    ld a, c                                       ; $3054: $79
    add $08                                       ; $3055: $c6 $08
    ld c, a                                       ; $3057: $4f
    jr jr_000_306a                                ; $3058: $18 $10

Call_000_305a:
Jump_000_305a:
    ldh a, [$ffaa]                                ; $305a: $f0 $aa
    ld e, a                                       ; $305c: $5f
    ld a, b                                       ; $305d: $78
    sub e                                         ; $305e: $93
    add $10                                       ; $305f: $c6 $10
    ld b, a                                       ; $3061: $47
    ldh a, [$ffa8]                                ; $3062: $f0 $a8
    ld e, a                                       ; $3064: $5f
    ld a, c                                       ; $3065: $79
    sub e                                         ; $3066: $93
    add $08                                       ; $3067: $c6 $08
    ld c, a                                       ; $3069: $4f

jr_000_306a:
    ld a, [$dea0]                                 ; $306a: $fa $a0 $de
    cp $a0                                        ; $306d: $fe $a0
    ret z                                         ; $306f: $c8

    ld e, a                                       ; $3070: $5f
    ld d, $de                                     ; $3071: $16 $de

jr_000_3073:
    ld a, [hl+]                                   ; $3073: $2a
    cp $80                                        ; $3074: $fe $80
    jr z, jr_000_308a                             ; $3076: $28 $12

    add b                                         ; $3078: $80
    ld [de], a                                    ; $3079: $12
    inc e                                         ; $307a: $1c
    ld a, [hl+]                                   ; $307b: $2a
    add c                                         ; $307c: $81
    ld [de], a                                    ; $307d: $12
    inc e                                         ; $307e: $1c
    ld a, [hl+]                                   ; $307f: $2a
    ld [de], a                                    ; $3080: $12
    inc e                                         ; $3081: $1c
    ld a, [hl+]                                   ; $3082: $2a
    ld [de], a                                    ; $3083: $12
    inc e                                         ; $3084: $1c
    ld a, e                                       ; $3085: $7b
    cp $a0                                        ; $3086: $fe $a0
    jr nz, jr_000_3073                            ; $3088: $20 $e9

jr_000_308a:
    ld a, e                                       ; $308a: $7b
    ld [$dea0], a                                 ; $308b: $ea $a0 $de
    ret                                           ; $308e: $c9


Call_000_308f:
    ld d, $00                                     ; $308f: $16 $00
    ld hl, $0000                                  ; $3091: $21 $00 $00
    rrca                                          ; $3094: $0f
    jr nc, jr_000_3098                            ; $3095: $30 $01

    add hl, de                                    ; $3097: $19

jr_000_3098:
    sla e                                         ; $3098: $cb $23
    rl d                                          ; $309a: $cb $12
    rrca                                          ; $309c: $0f
    jr nc, jr_000_30a0                            ; $309d: $30 $01

    add hl, de                                    ; $309f: $19

jr_000_30a0:
    sla e                                         ; $30a0: $cb $23
    rl d                                          ; $30a2: $cb $12
    rrca                                          ; $30a4: $0f
    jr nc, jr_000_30a8                            ; $30a5: $30 $01

    add hl, de                                    ; $30a7: $19

jr_000_30a8:
    sla e                                         ; $30a8: $cb $23
    rl d                                          ; $30aa: $cb $12
    rrca                                          ; $30ac: $0f
    jr nc, jr_000_30b0                            ; $30ad: $30 $01

    add hl, de                                    ; $30af: $19

jr_000_30b0:
    sla e                                         ; $30b0: $cb $23
    rl d                                          ; $30b2: $cb $12
    rrca                                          ; $30b4: $0f
    jr nc, jr_000_30b8                            ; $30b5: $30 $01

    add hl, de                                    ; $30b7: $19

jr_000_30b8:
    sla e                                         ; $30b8: $cb $23
    rl d                                          ; $30ba: $cb $12
    rrca                                          ; $30bc: $0f
    jr nc, jr_000_30c0                            ; $30bd: $30 $01

    add hl, de                                    ; $30bf: $19

jr_000_30c0:
    sla e                                         ; $30c0: $cb $23
    rl d                                          ; $30c2: $cb $12
    rrca                                          ; $30c4: $0f
    jr nc, jr_000_30c8                            ; $30c5: $30 $01

    add hl, de                                    ; $30c7: $19

jr_000_30c8:
    sla e                                         ; $30c8: $cb $23
    rl d                                          ; $30ca: $cb $12
    rrca                                          ; $30cc: $0f
    ret nc                                        ; $30cd: $d0

    add hl, de                                    ; $30ce: $19
    ret                                           ; $30cf: $c9


Call_000_30d0:
    push hl                                       ; $30d0: $e5
    pop de                                        ; $30d1: $d1
    ldh [$ffc7], a                                ; $30d2: $e0 $c7
    xor a                                         ; $30d4: $af
    ldh [$ffc8], a                                ; $30d5: $e0 $c8
    ld c, a                                       ; $30d7: $4f
    ld h, a                                       ; $30d8: $67
    ld l, a                                       ; $30d9: $6f
    ldh a, [$ffc7]                                ; $30da: $f0 $c7
    ld b, $08                                     ; $30dc: $06 $08

jr_000_30de:
    rrca                                          ; $30de: $0f
    jr nc, jr_000_30eb                            ; $30df: $30 $0a

    add hl, de                                    ; $30e1: $19
    ldh [$ffc7], a                                ; $30e2: $e0 $c7
    ldh a, [$ffc8]                                ; $30e4: $f0 $c8
    adc c                                         ; $30e6: $89
    ldh [$ffc8], a                                ; $30e7: $e0 $c8
    ldh a, [$ffc7]                                ; $30e9: $f0 $c7

jr_000_30eb:
    sla e                                         ; $30eb: $cb $23
    rl d                                          ; $30ed: $cb $12
    rl c                                          ; $30ef: $cb $11
    dec b                                         ; $30f1: $05
    jr nz, jr_000_30de                            ; $30f2: $20 $ea

    ldh a, [$ffc8]                                ; $30f4: $f0 $c8
    ld c, a                                       ; $30f6: $4f
    ret                                           ; $30f7: $c9


Call_000_30f8:
    push hl                                       ; $30f8: $e5
    pop de                                        ; $30f9: $d1
    ldh [$ffd1], a                                ; $30fa: $e0 $d1
    xor a                                         ; $30fc: $af
    ldh [$ffd2], a                                ; $30fd: $e0 $d2
    ld c, a                                       ; $30ff: $4f
    ld h, a                                       ; $3100: $67
    ld l, a                                       ; $3101: $6f
    ldh a, [$ffd1]                                ; $3102: $f0 $d1
    ld b, $08                                     ; $3104: $06 $08

jr_000_3106:
    rrca                                          ; $3106: $0f
    jr nc, jr_000_3113                            ; $3107: $30 $0a

    add hl, de                                    ; $3109: $19
    ldh [$ffd1], a                                ; $310a: $e0 $d1
    ldh a, [$ffd2]                                ; $310c: $f0 $d2
    adc c                                         ; $310e: $89
    ldh [$ffd2], a                                ; $310f: $e0 $d2
    ldh a, [$ffd1]                                ; $3111: $f0 $d1

jr_000_3113:
    sla e                                         ; $3113: $cb $23
    rl d                                          ; $3115: $cb $12
    rl c                                          ; $3117: $cb $11
    dec b                                         ; $3119: $05
    jr nz, jr_000_3106                            ; $311a: $20 $ea

    ldh a, [$ffd2]                                ; $311c: $f0 $d2
    ld c, a                                       ; $311e: $4f
    ret                                           ; $311f: $c9


Call_000_3120:
    push hl                                       ; $3120: $e5
    push de                                       ; $3121: $d5
    ld a, d                                       ; $3122: $7a
    call Call_000_30d0                            ; $3123: $cd $d0 $30
    ld a, l                                       ; $3126: $7d
    ldh [$ffc9], a                                ; $3127: $e0 $c9
    ld a, h                                       ; $3129: $7c
    ldh [$ffca], a                                ; $312a: $e0 $ca
    ld a, c                                       ; $312c: $79
    ldh [$ffcb], a                                ; $312d: $e0 $cb
    pop de                                        ; $312f: $d1
    pop hl                                        ; $3130: $e1
    ld a, e                                       ; $3131: $7b
    call Call_000_30d0                            ; $3132: $cd $d0 $30
    ldh a, [$ffc9]                                ; $3135: $f0 $c9
    add h                                         ; $3137: $84
    ld h, a                                       ; $3138: $67
    ldh a, [$ffca]                                ; $3139: $f0 $ca
    adc c                                         ; $313b: $89
    ld c, a                                       ; $313c: $4f
    ldh a, [$ffcb]                                ; $313d: $f0 $cb
    adc $00                                       ; $313f: $ce $00
    ld b, a                                       ; $3141: $47
    ret                                           ; $3142: $c9


Call_000_3143:
    ld c, a                                       ; $3143: $4f
    xor a                                         ; $3144: $af
    add hl, hl                                    ; $3145: $29
    rla                                           ; $3146: $17
    jr c, jr_000_314c                             ; $3147: $38 $03

    cp c                                          ; $3149: $b9
    jr c, jr_000_314e                             ; $314a: $38 $02

jr_000_314c:
    sub c                                         ; $314c: $91
    inc l                                         ; $314d: $2c

jr_000_314e:
    add hl, hl                                    ; $314e: $29
    rla                                           ; $314f: $17
    jr c, jr_000_3155                             ; $3150: $38 $03

    cp c                                          ; $3152: $b9
    jr c, jr_000_3157                             ; $3153: $38 $02

jr_000_3155:
    sub c                                         ; $3155: $91
    inc l                                         ; $3156: $2c

jr_000_3157:
    add hl, hl                                    ; $3157: $29
    rla                                           ; $3158: $17
    jr c, jr_000_315e                             ; $3159: $38 $03

    cp c                                          ; $315b: $b9
    jr c, jr_000_3160                             ; $315c: $38 $02

jr_000_315e:
    sub c                                         ; $315e: $91
    inc l                                         ; $315f: $2c

jr_000_3160:
    add hl, hl                                    ; $3160: $29
    rla                                           ; $3161: $17
    jr c, jr_000_3167                             ; $3162: $38 $03

    cp c                                          ; $3164: $b9
    jr c, jr_000_3169                             ; $3165: $38 $02

jr_000_3167:
    sub c                                         ; $3167: $91
    inc l                                         ; $3168: $2c

jr_000_3169:
    add hl, hl                                    ; $3169: $29
    rla                                           ; $316a: $17
    jr c, jr_000_3170                             ; $316b: $38 $03

    cp c                                          ; $316d: $b9
    jr c, jr_000_3172                             ; $316e: $38 $02

jr_000_3170:
    sub c                                         ; $3170: $91
    inc l                                         ; $3171: $2c

jr_000_3172:
    add hl, hl                                    ; $3172: $29
    rla                                           ; $3173: $17
    jr c, jr_000_3179                             ; $3174: $38 $03

    cp c                                          ; $3176: $b9
    jr c, jr_000_317b                             ; $3177: $38 $02

jr_000_3179:
    sub c                                         ; $3179: $91
    inc l                                         ; $317a: $2c

jr_000_317b:
    add hl, hl                                    ; $317b: $29
    rla                                           ; $317c: $17
    jr c, jr_000_3182                             ; $317d: $38 $03

    cp c                                          ; $317f: $b9
    jr c, jr_000_3184                             ; $3180: $38 $02

jr_000_3182:
    sub c                                         ; $3182: $91
    inc l                                         ; $3183: $2c

jr_000_3184:
    add hl, hl                                    ; $3184: $29
    rla                                           ; $3185: $17
    jr c, jr_000_318b                             ; $3186: $38 $03

    cp c                                          ; $3188: $b9
    jr c, jr_000_318d                             ; $3189: $38 $02

jr_000_318b:
    sub c                                         ; $318b: $91
    inc l                                         ; $318c: $2c

jr_000_318d:
    add hl, hl                                    ; $318d: $29
    rla                                           ; $318e: $17
    jr c, jr_000_3194                             ; $318f: $38 $03

    cp c                                          ; $3191: $b9
    jr c, jr_000_3196                             ; $3192: $38 $02

jr_000_3194:
    sub c                                         ; $3194: $91
    inc l                                         ; $3195: $2c

jr_000_3196:
    add hl, hl                                    ; $3196: $29
    rla                                           ; $3197: $17
    jr c, jr_000_319d                             ; $3198: $38 $03

    cp c                                          ; $319a: $b9
    jr c, jr_000_319f                             ; $319b: $38 $02

jr_000_319d:
    sub c                                         ; $319d: $91
    inc l                                         ; $319e: $2c

jr_000_319f:
    add hl, hl                                    ; $319f: $29
    rla                                           ; $31a0: $17
    jr c, jr_000_31a6                             ; $31a1: $38 $03

    cp c                                          ; $31a3: $b9
    jr c, jr_000_31a8                             ; $31a4: $38 $02

jr_000_31a6:
    sub c                                         ; $31a6: $91
    inc l                                         ; $31a7: $2c

jr_000_31a8:
    add hl, hl                                    ; $31a8: $29
    rla                                           ; $31a9: $17
    jr c, jr_000_31af                             ; $31aa: $38 $03

    cp c                                          ; $31ac: $b9
    jr c, jr_000_31b1                             ; $31ad: $38 $02

jr_000_31af:
    sub c                                         ; $31af: $91
    inc l                                         ; $31b0: $2c

jr_000_31b1:
    add hl, hl                                    ; $31b1: $29
    rla                                           ; $31b2: $17
    jr c, jr_000_31b8                             ; $31b3: $38 $03

    cp c                                          ; $31b5: $b9
    jr c, jr_000_31ba                             ; $31b6: $38 $02

jr_000_31b8:
    sub c                                         ; $31b8: $91
    inc l                                         ; $31b9: $2c

jr_000_31ba:
    add hl, hl                                    ; $31ba: $29
    rla                                           ; $31bb: $17
    jr c, jr_000_31c1                             ; $31bc: $38 $03

    cp c                                          ; $31be: $b9
    jr c, jr_000_31c3                             ; $31bf: $38 $02

jr_000_31c1:
    sub c                                         ; $31c1: $91
    inc l                                         ; $31c2: $2c

jr_000_31c3:
    add hl, hl                                    ; $31c3: $29
    rla                                           ; $31c4: $17
    jr c, jr_000_31ca                             ; $31c5: $38 $03

    cp c                                          ; $31c7: $b9
    jr c, jr_000_31cc                             ; $31c8: $38 $02

jr_000_31ca:
    sub c                                         ; $31ca: $91
    inc l                                         ; $31cb: $2c

jr_000_31cc:
    add hl, hl                                    ; $31cc: $29
    rla                                           ; $31cd: $17
    jr c, jr_000_31d2                             ; $31ce: $38 $02

    cp c                                          ; $31d0: $b9
    ret c                                         ; $31d1: $d8

jr_000_31d2:
    sub c                                         ; $31d2: $91
    inc l                                         ; $31d3: $2c
    ret                                           ; $31d4: $c9


Call_000_31d5:
    xor a                                         ; $31d5: $af
    ld c, a                                       ; $31d6: $4f
    ldh [$ffc7], a                                ; $31d7: $e0 $c7
    ld b, $10                                     ; $31d9: $06 $10

jr_000_31db:
    add hl, hl                                    ; $31db: $29
    rl c                                          ; $31dc: $cb $11
    ldh a, [$ffc7]                                ; $31de: $f0 $c7
    rla                                           ; $31e0: $17
    ldh [$ffc7], a                                ; $31e1: $e0 $c7
    ld a, c                                       ; $31e3: $79
    sub e                                         ; $31e4: $93
    ldh [$ffc8], a                                ; $31e5: $e0 $c8
    ldh a, [$ffc7]                                ; $31e7: $f0 $c7
    sbc d                                         ; $31e9: $9a
    jr c, jr_000_31f2                             ; $31ea: $38 $06

    ldh [$ffc7], a                                ; $31ec: $e0 $c7
    ldh a, [$ffc8]                                ; $31ee: $f0 $c8
    ld c, a                                       ; $31f0: $4f
    inc l                                         ; $31f1: $2c

jr_000_31f2:
    dec b                                         ; $31f2: $05
    jr nz, jr_000_31db                            ; $31f3: $20 $e6

    ldh a, [$ffc7]                                ; $31f5: $f0 $c7
    ld b, a                                       ; $31f7: $47
    ret                                           ; $31f8: $c9


Call_000_31f9:
    ldh a, [$ffd3]                                ; $31f9: $f0 $d3
    ld b, a                                       ; $31fb: $47
    ldh a, [$ffd4]                                ; $31fc: $f0 $d4
    ret                                           ; $31fe: $c9


Call_000_31ff:
Jump_000_31ff:
    ld hl, $ffa3                                  ; $31ff: $21 $a3 $ff
    ld a, [hl]                                    ; $3202: $7e
    cp $02                                        ; $3203: $fe $02
    jr nc, jr_000_3208                            ; $3205: $30 $01

    inc [hl]                                      ; $3207: $34

jr_000_3208:
    ld hl, $ff9f                                  ; $3208: $21 $9f $ff
    ld a, [hl]                                    ; $320b: $7e
    add $01                                       ; $320c: $c6 $01
    ld [hl+], a                                   ; $320e: $22
    ld a, [hl]                                    ; $320f: $7e
    adc $00                                       ; $3210: $ce $00
    ld [hl], a                                    ; $3212: $77
    ret                                           ; $3213: $c9


Jump_000_3214:
    ldh a, [$ffc2]                                ; $3214: $f0 $c2
    bit 6, a                                      ; $3216: $cb $77
    ret nz                                        ; $3218: $c0

    ld b, $80                                     ; $3219: $06 $80
    ldh a, [$ffaa]                                ; $321b: $f0 $aa
    ld h, a                                       ; $321d: $67
    bit 6, c                                      ; $321e: $cb $71
    jr z, jr_000_322f                             ; $3220: $28 $0d

    ld a, h                                       ; $3222: $7c
    cp $10                                        ; $3223: $fe $10
    jr z, jr_000_322f                             ; $3225: $28 $08

    ldh a, [$ffa9]                                ; $3227: $f0 $a9
    sub b                                         ; $3229: $90
    ldh [$ffa9], a                                ; $322a: $e0 $a9
    jr nc, jr_000_322f                            ; $322c: $30 $01

    dec h                                         ; $322e: $25

jr_000_322f:
    bit 7, c                                      ; $322f: $cb $79
    jr z, jr_000_3240                             ; $3231: $28 $0d

    ld a, h                                       ; $3233: $7c
    cp $6f                                        ; $3234: $fe $6f
    jr z, jr_000_3240                             ; $3236: $28 $08

    ldh a, [$ffa9]                                ; $3238: $f0 $a9
    add b                                         ; $323a: $80
    ldh [$ffa9], a                                ; $323b: $e0 $a9
    jr nc, jr_000_3240                            ; $323d: $30 $01

    inc h                                         ; $323f: $24

jr_000_3240:
    ld a, h                                       ; $3240: $7c
    ldh [$ffaa], a                                ; $3241: $e0 $aa
    ldh a, [$ffa8]                                ; $3243: $f0 $a8
    ld h, a                                       ; $3245: $67
    bit 5, c                                      ; $3246: $cb $69
    jr z, jr_000_3256                             ; $3248: $28 $0c

    ld a, h                                       ; $324a: $7c
    and a                                         ; $324b: $a7
    jr z, jr_000_3256                             ; $324c: $28 $08

    ldh a, [$ffa7]                                ; $324e: $f0 $a7
    sub b                                         ; $3250: $90
    ldh [$ffa7], a                                ; $3251: $e0 $a7
    jr nc, jr_000_3256                            ; $3253: $30 $01

    dec h                                         ; $3255: $25

jr_000_3256:
    bit 4, c                                      ; $3256: $cb $61
    jr z, jr_000_3267                             ; $3258: $28 $0d

    ld a, h                                       ; $325a: $7c
    cp $5f                                        ; $325b: $fe $5f
    jr z, jr_000_3267                             ; $325d: $28 $08

    ldh a, [$ffa7]                                ; $325f: $f0 $a7
    add b                                         ; $3261: $80
    ldh [$ffa7], a                                ; $3262: $e0 $a7
    jr nc, jr_000_3267                            ; $3264: $30 $01

    inc h                                         ; $3266: $24

jr_000_3267:
    ld a, h                                       ; $3267: $7c
    ldh [$ffa8], a                                ; $3268: $e0 $a8
    ret                                           ; $326a: $c9


Call_000_326b:
jr_000_326b:
    ld a, [hl+]                                   ; $326b: $2a
    cp $f9                                        ; $326c: $fe $f9
    jr z, jr_000_3279                             ; $326e: $28 $09

    ld [de], a                                    ; $3270: $12
    ld a, e                                       ; $3271: $7b
    add c                                         ; $3272: $81
    ld e, a                                       ; $3273: $5f
    jr nc, jr_000_326b                            ; $3274: $30 $f5

    inc d                                         ; $3276: $14
    jr jr_000_326b                                ; $3277: $18 $f2

jr_000_3279:
    ld a, [hl+]                                   ; $3279: $2a
    cp $02                                        ; $327a: $fe $02
    jr z, jr_000_3287                             ; $327c: $28 $09

    and a                                         ; $327e: $a7
    ret z                                         ; $327f: $c8

    ld c, a                                       ; $3280: $4f
    ld a, [hl+]                                   ; $3281: $2a
    ld e, a                                       ; $3282: $5f
    ld a, [hl+]                                   ; $3283: $2a
    ld d, a                                       ; $3284: $57
    jr jr_000_326b                                ; $3285: $18 $e4

jr_000_3287:
    ld a, [hl+]                                   ; $3287: $2a
    ld b, a                                       ; $3288: $47

jr_000_3289:
    ld a, [hl]                                    ; $3289: $7e
    ld [de], a                                    ; $328a: $12
    ld a, e                                       ; $328b: $7b
    add c                                         ; $328c: $81
    ld e, a                                       ; $328d: $5f
    jr nc, jr_000_3291                            ; $328e: $30 $01

    inc d                                         ; $3290: $14

jr_000_3291:
    dec b                                         ; $3291: $05
    jr nz, jr_000_3289                            ; $3292: $20 $f5

    inc hl                                        ; $3294: $23
    jr jr_000_326b                                ; $3295: $18 $d4

Call_000_3297:
    ld hl, $c0db                                  ; $3297: $21 $db $c0
    ld a, $01                                     ; $329a: $3e $01
    ld [hl+], a                                   ; $329c: $22
    ld [hl+], a                                   ; $329d: $22
    ld [hl+], a                                   ; $329e: $22
    ld [hl+], a                                   ; $329f: $22
    ld [$c0e6], a                                 ; $32a0: $ea $e6 $c0
    inc hl                                        ; $32a3: $23
    xor a                                         ; $32a4: $af
    ld [hl+], a                                   ; $32a5: $22
    ld [hl+], a                                   ; $32a6: $22
    ld [hl+], a                                   ; $32a7: $22
    ld [hl+], a                                   ; $32a8: $22
    ld [hl+], a                                   ; $32a9: $22
    ld [hl+], a                                   ; $32aa: $22
    ldh a, [$ffaf]                                ; $32ab: $f0 $af
    bit 7, a                                      ; $32ad: $cb $7f
    ret z                                         ; $32af: $c8

    and $01                                       ; $32b0: $e6 $01
    ld [$c0dc], a                                 ; $32b2: $ea $dc $c0
    ld [$c0e6], a                                 ; $32b5: $ea $e6 $c0
    ret                                           ; $32b8: $c9


Call_000_32b9:
    ld a, [$c040]                                 ; $32b9: $fa $40 $c0
    sub $02                                       ; $32bc: $d6 $02
    ret c                                         ; $32be: $d8

    cp $03                                        ; $32bf: $fe $03
    ret nc                                        ; $32c1: $d0

    ld hl, $ffc2                                  ; $32c2: $21 $c2 $ff
    res 6, [hl]                                   ; $32c5: $cb $b6
    ret                                           ; $32c7: $c9


Call_000_32c8:
    ld b, $c1                                     ; $32c8: $06 $c1
    ld hl, $c0dd                                  ; $32ca: $21 $dd $c0
    ld a, [$c0de]                                 ; $32cd: $fa $de $c0
    cp [hl]                                       ; $32d0: $be
    jr nz, jr_000_32d9                            ; $32d1: $20 $06

    cp $01                                        ; $32d3: $fe $01
    jr nz, jr_000_32d9                            ; $32d5: $20 $02

    ld b, $00                                     ; $32d7: $06 $00

jr_000_32d9:
    ld a, b                                       ; $32d9: $78
    ldh [$ffc2], a                                ; $32da: $e0 $c2
    ret                                           ; $32dc: $c9


Call_000_32dd:
    ld hl, $de00                                  ; $32dd: $21 $00 $de
    ld [hl+], a                                   ; $32e0: $22
    ld a, b                                       ; $32e1: $78
    ld [hl+], a                                   ; $32e2: $22
    ld a, $f9                                     ; $32e3: $3e $f9
    ld [hl+], a                                   ; $32e5: $22
    xor a                                         ; $32e6: $af
    ld [hl], a                                    ; $32e7: $77
    ld a, $04                                     ; $32e8: $3e $04
    ld [$dea0], a                                 ; $32ea: $ea $a0 $de
    ret                                           ; $32ed: $c9


Call_000_32ee:
    ld bc, $0000                                  ; $32ee: $01 $00 $00
    ldh a, [$ffc2]                                ; $32f1: $f0 $c2
    bit 6, a                                      ; $32f3: $cb $77
    jr z, jr_000_330c                             ; $32f5: $28 $15

    call Call_000_35e7                            ; $32f7: $cd $e7 $35
    ld a, $7c                                     ; $32fa: $3e $7c
    jr nz, jr_000_3300                            ; $32fc: $20 $02

    ld a, $7d                                     ; $32fe: $3e $7d

jr_000_3300:
    ldh [$ffab], a                                ; $3300: $e0 $ab
    ld b, $60                                     ; $3302: $06 $60
    ldh a, [$ff91]                                ; $3304: $f0 $91
    bit 1, a                                      ; $3306: $cb $4f
    jr z, jr_000_330c                             ; $3308: $28 $02

    ld c, $68                                     ; $330a: $0e $68

jr_000_330c:
    ldh a, [$ffa6]                                ; $330c: $f0 $a6
    and $9f                                       ; $330e: $e6 $9f
    or b                                          ; $3310: $b0
    ldh [$ffa6], a                                ; $3311: $e0 $a6
    ld a, c                                       ; $3313: $79
    ldh [$ffac], a                                ; $3314: $e0 $ac
    ldh a, [$ffc2]                                ; $3316: $f0 $c2
    bit 7, a                                      ; $3318: $cb $7f
    ret z                                         ; $331a: $c8

    ldh a, [$ff91]                                ; $331b: $f0 $91
    ldh [$ffc3], a                                ; $331d: $e0 $c3
    ldh a, [$ffc2]                                ; $331f: $f0 $c2
    res 7, a                                      ; $3321: $cb $bf
    ldh [$ffc2], a                                ; $3323: $e0 $c2
    and $0f                                       ; $3325: $e6 $0f
    rst RST_08                                    ; $3327: $cf

    db $36, $33, $6b, $33, $03, $34, $54, $34, $be, $34, $e2, $34, $06, $35

    ld de, $c0c0                                  ; $3336: $11 $c0 $c0
    rst RST_28                                    ; $3339: $ef

    db $1a, $ff, $80, $80, $ec, $de, $ed, $e6, $da, $ed, $dc, $e1, $f7, $f7, $f7, $f7
    db $f7, $e5, $de, $ef, $de, $e5, $80, $80, $80, $80, $80

    ldh a, [$ff96]                                ; $3355: $f0 $96
    bit 3, a                                      ; $3357: $cb $5f
    ld a, $d3                                     ; $3359: $3e $d3
    jr z, jr_000_335f                             ; $335b: $28 $02

    ld a, $d1                                     ; $335d: $3e $d1

jr_000_335f:
    ld [$c0c1], a                                 ; $335f: $ea $c1 $c0
    ld a, [$c0df]                                 ; $3362: $fa $df $c0
    or $d0                                        ; $3365: $f6 $d0
    ld [$c0d7], a                                 ; $3367: $ea $d7 $c0
    ret                                           ; $336a: $c9


    ld a, [$c0dd]                                 ; $336b: $fa $dd $c0
    cp $05                                        ; $336e: $fe $05
    jr nz, jr_000_3392                            ; $3370: $20 $20

    ld de, $c0c0                                  ; $3372: $11 $c0 $c0
    rst RST_28                                    ; $3375: $ef

    db $1a, $ff, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $dd, $de, $ee, $dc
    db $de, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80

    ret                                           ; $3391: $c9


jr_000_3392:
    ld de, $c0c0                                  ; $3392: $11 $c0 $c0
    rst RST_28                                    ; $3395: $ef

    db $1a, $ff, $80, $80, $80, $80, $80, $80, $80, $f4, $80, $80, $f7, $f7, $f7, $f7
    db $f7, $80, $80, $f4, $80, $80, $80, $80, $80, $80, $80

    ld a, $dc                                     ; $33b1: $3e $dc
    ld [$c0c7], a                                 ; $33b3: $ea $c7 $c0
    ld a, $e9                                     ; $33b6: $3e $e9
    ld [$c0d1], a                                 ; $33b8: $ea $d1 $c0
    ldh a, [$ff90]                                ; $33bb: $f0 $90
    cp $04                                        ; $33bd: $fe $04
    ret nc                                        ; $33bf: $d0

    ld a, [$c0dd]                                 ; $33c0: $fa $dd $c0
    add a                                         ; $33c3: $87
    ld c, a                                       ; $33c4: $4f
    ld b, $00                                     ; $33c5: $06 $00
    ld hl, $33e7                                  ; $33c7: $21 $e7 $33
    add hl, bc                                    ; $33ca: $09
    ld a, [hl+]                                   ; $33cb: $2a
    ld [$c0d3], a                                 ; $33cc: $ea $d3 $c0
    ld a, [hl]                                    ; $33cf: $7e
    ld [$c0d4], a                                 ; $33d0: $ea $d4 $c0
    ld a, [$c0de]                                 ; $33d3: $fa $de $c0
    add a                                         ; $33d6: $87
    ld c, a                                       ; $33d7: $4f
    ld b, $00                                     ; $33d8: $06 $00
    ld hl, $33e7                                  ; $33da: $21 $e7 $33
    add hl, bc                                    ; $33dd: $09
    ld a, [hl+]                                   ; $33de: $2a
    ld [$c0c9], a                                 ; $33df: $ea $c9 $c0
    ld a, [hl]                                    ; $33e2: $7e
    ld [$c0ca], a                                 ; $33e3: $ea $ca $c0
    ret                                           ; $33e6: $c9


    db $d0, $80, $80, $d0, $d1, $d5, $d3, $d0, $d4, $d0, $dd, $80, $da, $80, $80, $d0
    db $80, $d1, $80, $d2, $80, $d3, $80, $d4, $80, $d5, $80, $d6

    ld de, $c0c0                                  ; $3403: $11 $c0 $c0
    rst RST_28                                    ; $3406: $ef

    db $1a, $ff, $80, $80, $80, $80, $80, $80, $ec, $de, $ed, $80, $80, $80, $80, $80
    db $80, $80, $e0, $da, $e6, $de, $80, $80, $80, $80, $80

    ld a, [$c0db]                                 ; $3422: $fa $db $c0
    or $d0                                        ; $3425: $f6 $d0
    ld [$c0cd], a                                 ; $3427: $ea $cd $c0
    ld a, [$c0e6]                                 ; $342a: $fa $e6 $c0
    cp $0d                                        ; $342d: $fe $0d
    jr nc, jr_000_3444                            ; $342f: $30 $13

    call Call_000_00b6                            ; $3431: $cd $b6 $00
    ld a, b                                       ; $3434: $78
    and a                                         ; $3435: $a7
    jr z, jr_000_343d                             ; $3436: $28 $05

    or $d0                                        ; $3438: $f6 $d0
    ld [$c0d6], a                                 ; $343a: $ea $d6 $c0

jr_000_343d:
    ld a, c                                       ; $343d: $79
    or $d0                                        ; $343e: $f6 $d0
    ld [$c0d7], a                                 ; $3440: $ea $d7 $c0
    ret                                           ; $3443: $c9


jr_000_3444:
    ld de, $c0cb                                  ; $3444: $11 $cb $c0
    rst RST_28                                    ; $3447: $ef

    db $0a, $80, $ed, $e2, $de, $80, $db, $eb, $de, $da, $e4

    ret                                           ; $3453: $c9


    ld de, $c0c0                                  ; $3454: $11 $c0 $c0
    rst RST_28                                    ; $3457: $ef

    db $1a, $ff, $80, $80, $80, $80, $80, $80, $f5, $d1, $d2, $d3, $f7, $f6, $f7, $f7
    db $f7, $80, $f5, $80, $80, $80, $80, $f5, $80, $80, $80

    call Call_000_31f9                            ; $3473: $cd $f9 $31
    ld [$c0d5], a                                 ; $3476: $ea $d5 $c0
    ld a, b                                       ; $3479: $78
    ld [$c0d0], a                                 ; $347a: $ea $d0 $c0
    ldh a, [$ff96]                                ; $347d: $f0 $96
    and $03                                       ; $347f: $e6 $03
    cp $03                                        ; $3481: $fe $03
    ld hl, $c0d2                                  ; $3483: $21 $d2 $c0
    jr nz, jr_000_348b                            ; $3486: $20 $03

    ld hl, $c0d7                                  ; $3488: $21 $d7 $c0

jr_000_348b:
    ld a, [$c0e0]                                 ; $348b: $fa $e0 $c0
    or $d0                                        ; $348e: $f6 $d0
    ld [hl+], a                                   ; $3490: $22
    ld a, [$c0e1]                                 ; $3491: $fa $e1 $c0
    or $d0                                        ; $3494: $f6 $d0
    ld [hl+], a                                   ; $3496: $22
    ld a, [$c0e2]                                 ; $3497: $fa $e2 $c0
    or $d0                                        ; $349a: $f6 $d0
    ld [hl], a                                    ; $349c: $77
    ldh a, [$ff96]                                ; $349d: $f0 $96
    and $03                                       ; $349f: $e6 $03
    cp $03                                        ; $34a1: $fe $03
    ld hl, $c0d7                                  ; $34a3: $21 $d7 $c0
    jr nz, jr_000_34ab                            ; $34a6: $20 $03

    ld hl, $c0d2                                  ; $34a8: $21 $d2 $c0

jr_000_34ab:
    ld a, [$c0e3]                                 ; $34ab: $fa $e3 $c0
    or $d0                                        ; $34ae: $f6 $d0
    ld [hl+], a                                   ; $34b0: $22
    ld a, [$c0e4]                                 ; $34b1: $fa $e4 $c0
    or $d0                                        ; $34b4: $f6 $d0
    ld [hl+], a                                   ; $34b6: $22
    ld a, [$c0e5]                                 ; $34b7: $fa $e5 $c0
    or $d0                                        ; $34ba: $f6 $d0
    ld [hl], a                                    ; $34bc: $77
    ret                                           ; $34bd: $c9


    ld de, $c0c0                                  ; $34be: $11 $c0 $c0
    rst RST_28                                    ; $34c1: $ef

    db $1a, $ff, $b9, $ba, $bb, $bc, $bd, $be, $bf, $c0, $c1, $c2, $b8, $ad, $ae, $af
    db $81, $96, $b0, $b1, $b2, $81, $96, $b3, $b4, $b5, $81

    ld a, $26                                     ; $34dd: $3e $26
    jp Jump_000_3665                              ; $34df: $c3 $65 $36


    ld de, $c0c0                                  ; $34e2: $11 $c0 $c0
    rst RST_28                                    ; $34e5: $ef

    db $1a, $ff, $b6, $c3, $c4, $c5, $b7, $b6, $c6, $c7, $c8, $b7, $b8, $ad, $ae, $af
    db $81, $96, $b0, $b1, $b2, $81, $96, $b3, $b4, $b5, $81

    ld a, $28                                     ; $3501: $3e $28
    jp Jump_000_3665                              ; $3503: $c3 $65 $36


    ld de, $c0c0                                  ; $3506: $11 $c0 $c0
    rst RST_28                                    ; $3509: $ef

    db $1a, $ff, $b6, $c9, $ca, $c5, $b7, $b6, $cb, $cc, $c8, $b7, $b8, $ad, $ae, $af
    db $81, $96, $b0, $b1, $b2, $81, $96, $b3, $b4, $b5, $81

    ld a, $27                                     ; $3525: $3e $27
    jp Jump_000_3665                              ; $3527: $c3 $65 $36


Call_000_352a:
    ld a, [$c0c0]                                 ; $352a: $fa $c0 $c0
    and a                                         ; $352d: $a7
    ret z                                         ; $352e: $c8

    ld hl, $c0c1                                  ; $352f: $21 $c1 $c0
    ld de, $9c00                                  ; $3532: $11 $00 $9c
    ld c, $05                                     ; $3535: $0e $05

jr_000_3537:
    ld a, [hl+]                                   ; $3537: $2a
    ld [de], a                                    ; $3538: $12
    inc e                                         ; $3539: $1c
    ld a, [hl+]                                   ; $353a: $2a
    ld [de], a                                    ; $353b: $12
    inc e                                         ; $353c: $1c
    ld a, [hl+]                                   ; $353d: $2a
    ld [de], a                                    ; $353e: $12
    inc e                                         ; $353f: $1c
    ld a, [hl+]                                   ; $3540: $2a
    ld [de], a                                    ; $3541: $12
    inc e                                         ; $3542: $1c
    ld a, [hl+]                                   ; $3543: $2a
    ld [de], a                                    ; $3544: $12
    ld a, e                                       ; $3545: $7b
    add $1c                                       ; $3546: $c6 $1c
    ld e, a                                       ; $3548: $5f
    dec c                                         ; $3549: $0d
    jr nz, jr_000_3537                            ; $354a: $20 $eb

    xor a                                         ; $354c: $af
    ld [$c0c0], a                                 ; $354d: $ea $c0 $c0
    ret                                           ; $3550: $c9


Call_000_3551:
    ld hl, $de14                                  ; $3551: $21 $14 $de
    ldh a, [$ffc2]                                ; $3554: $f0 $c2
    bit 6, a                                      ; $3556: $cb $77
    jr z, jr_000_35ad                             ; $3558: $28 $53

    ldh a, [$ff91]                                ; $355a: $f0 $91
    bit 1, a                                      ; $355c: $cb $4f
    ld c, $0a                                     ; $355e: $0e $0a
    jr z, jr_000_3564                             ; $3560: $28 $02

    ld c, $76                                     ; $3562: $0e $76

jr_000_3564:
    ld d, c                                       ; $3564: $51
    ld a, c                                       ; $3565: $79
    ld [hl+], a                                   ; $3566: $22
    add $08                                       ; $3567: $c6 $08
    ld c, a                                       ; $3569: $4f
    call Call_000_35e7                            ; $356a: $cd $e7 $35
    ld a, $7b                                     ; $356d: $3e $7b
    jr nz, jr_000_3573                            ; $356f: $20 $02

    ld a, $7c                                     ; $3571: $3e $7c

jr_000_3573:
    ld [hl+], a                                   ; $3573: $22
    ld a, $99                                     ; $3574: $3e $99
    ld b, $06                                     ; $3576: $06 $06
    jr jr_000_358b                                ; $3578: $18 $11

jr_000_357a:
    ld a, c                                       ; $357a: $79
    ld [hl+], a                                   ; $357b: $22
    add $08                                       ; $357c: $c6 $08
    ld c, a                                       ; $357e: $4f
    call Call_000_35e7                            ; $357f: $cd $e7 $35
    ld a, $75                                     ; $3582: $3e $75
    jr nz, jr_000_3588                            ; $3584: $20 $02

    ld a, $76                                     ; $3586: $3e $76

jr_000_3588:
    ld [hl+], a                                   ; $3588: $22
    ld a, $97                                     ; $3589: $3e $97

jr_000_358b:
    ld [hl+], a                                   ; $358b: $22
    xor a                                         ; $358c: $af
    ld [hl+], a                                   ; $358d: $22
    dec b                                         ; $358e: $05
    jr nz, jr_000_357a                            ; $358f: $20 $e9

    call Call_000_35e7                            ; $3591: $cd $e7 $35
    ld c, $83                                     ; $3594: $0e $83
    jr nz, jr_000_359a                            ; $3596: $20 $02

    ld c, $84                                     ; $3598: $0e $84

jr_000_359a:
    ld b, $05                                     ; $359a: $06 $05

jr_000_359c:
    ld a, d                                       ; $359c: $7a
    ld [hl+], a                                   ; $359d: $22
    ld a, c                                       ; $359e: $79
    ld [hl+], a                                   ; $359f: $22
    add $08                                       ; $35a0: $c6 $08
    ld c, a                                       ; $35a2: $4f
    ld a, $98                                     ; $35a3: $3e $98
    ld [hl+], a                                   ; $35a5: $22
    xor a                                         ; $35a6: $af
    ld [hl+], a                                   ; $35a7: $22
    dec b                                         ; $35a8: $05
    jr nz, jr_000_359c                            ; $35a9: $20 $f1

    jr jr_000_35b4                                ; $35ab: $18 $07

jr_000_35ad:
    ld b, $2c                                     ; $35ad: $06 $2c
    xor a                                         ; $35af: $af

jr_000_35b0:
    ld [hl+], a                                   ; $35b0: $22
    dec b                                         ; $35b1: $05
    jr nz, jr_000_35b0                            ; $35b2: $20 $fc

jr_000_35b4:
    ld bc, $0000                                  ; $35b4: $01 $00 $00
    ld a, [$c043]                                 ; $35b7: $fa $43 $c0
    cp $68                                        ; $35ba: $fe $68
    jr c, jr_000_35c6                             ; $35bc: $38 $08

    ld c, $04                                     ; $35be: $0e $04
    cp $88                                        ; $35c0: $fe $88
    jr c, jr_000_35c6                             ; $35c2: $38 $02

    ld c, $08                                     ; $35c4: $0e $08

jr_000_35c6:
    ld de, $ffbd                                  ; $35c6: $11 $bd $ff
    ldh a, [$ffba]                                ; $35c9: $f0 $ba
    bit 1, a                                      ; $35cb: $cb $4f
    jr z, jr_000_35d6                             ; $35cd: $28 $07

    ld a, $63                                     ; $35cf: $3e $63
    ld hl, $35ee                                  ; $35d1: $21 $ee $35
    jr jr_000_35db                                ; $35d4: $18 $05

jr_000_35d6:
    ld a, $76                                     ; $35d6: $3e $76
    ld hl, $35fa                                  ; $35d8: $21 $fa $35

jr_000_35db:
    ld [de], a                                    ; $35db: $12
    inc e                                         ; $35dc: $1c
    add hl, bc                                    ; $35dd: $09
    ld b, $04                                     ; $35de: $06 $04

jr_000_35e0:
    ld a, [hl+]                                   ; $35e0: $2a
    ld [de], a                                    ; $35e1: $12
    inc e                                         ; $35e2: $1c
    dec b                                         ; $35e3: $05
    jr nz, jr_000_35e0                            ; $35e4: $20 $fa

    ret                                           ; $35e6: $c9


Call_000_35e7:
    ldh a, [$ffa8]                                ; $35e7: $f0 $a8
    and $03                                       ; $35e9: $e6 $03
    cp $03                                        ; $35eb: $fe $03
    ret                                           ; $35ed: $c9


    db $90, $91, $92, $93, $69, $6a, $67, $68, $8c, $8d, $8e, $8f, $88, $89, $8a, $8b
    db $33, $34, $35, $36, $84, $85, $86, $87

Call_000_3606:
    ld hl, $ffbd                                  ; $3606: $21 $bd $ff
    ld a, [hl+]                                   ; $3609: $2a
    ld e, a                                       ; $360a: $5f
    ld d, $99                                     ; $360b: $16 $99
    ld a, [hl+]                                   ; $360d: $2a
    ld [de], a                                    ; $360e: $12
    inc e                                         ; $360f: $1c
    ld a, [hl+]                                   ; $3610: $2a
    ld [de], a                                    ; $3611: $12
    ld a, $1f                                     ; $3612: $3e $1f
    add e                                         ; $3614: $83
    ld e, a                                       ; $3615: $5f
    ld a, [hl+]                                   ; $3616: $2a
    ld [de], a                                    ; $3617: $12
    inc e                                         ; $3618: $1c
    ld a, [hl+]                                   ; $3619: $2a
    ld [de], a                                    ; $361a: $12
    ret                                           ; $361b: $c9


Call_000_361c:
    ld a, $80                                     ; $361c: $3e $80
    ldh [rNR52], a                                ; $361e: $e0 $26
    xor a                                         ; $3620: $af
    ldh [rNR51], a                                ; $3621: $e0 $25
    ld [$dd85], a                                 ; $3623: $ea $85 $dd
    ld a, $77                                     ; $3626: $3e $77
    ldh [rNR50], a                                ; $3628: $e0 $24
    ld hl, $dd00                                  ; $362a: $21 $00 $dd
    ld de, $0016                                  ; $362d: $11 $16 $00
    ld b, $06                                     ; $3630: $06 $06
    ld a, $ff                                     ; $3632: $3e $ff

jr_000_3634:
    ld [hl], a                                    ; $3634: $77
    add hl, de                                    ; $3635: $19
    dec b                                         ; $3636: $05
    jr nz, jr_000_3634                            ; $3637: $20 $fb

    ld hl, $dd14                                  ; $3639: $21 $14 $dd
    ld de, $0016                                  ; $363c: $11 $16 $00
    ld b, $06                                     ; $363f: $06 $06

jr_000_3641:
    ld [hl], a                                    ; $3641: $77
    add hl, de                                    ; $3642: $19
    dec b                                         ; $3643: $05
    jr nz, jr_000_3641                            ; $3644: $20 $fb

    ld de, $ff30                                  ; $3646: $11 $30 $ff
    ld hl, $3655                                  ; $3649: $21 $55 $36
    ld b, $10                                     ; $364c: $06 $10

jr_000_364e:
    ld a, [hl+]                                   ; $364e: $2a
    ld [de], a                                    ; $364f: $12
    inc e                                         ; $3650: $1c
    dec b                                         ; $3651: $05
    jr nz, jr_000_364e                            ; $3652: $20 $fa

    ret                                           ; $3654: $c9


    db $00, $01, $12, $35, $8a, $cd, $ee, $ff, $ff, $fe, $ed, $ca, $85, $32, $11, $00

Call_000_3665:
Jump_000_3665:
    ld l, a                                       ; $3665: $6f
    ld h, $00                                     ; $3666: $26 $00
    add hl, hl                                    ; $3668: $29
    add hl, hl                                    ; $3669: $29
    ld de, $3d29                                  ; $366a: $11 $29 $3d
    add hl, de                                    ; $366d: $19
    push hl                                       ; $366e: $e5
    pop de                                        ; $366f: $d1

Call_000_3670:
    ld a, [de]                                    ; $3670: $1a
    inc de                                        ; $3671: $13
    ld c, a                                       ; $3672: $4f
    ld b, $00                                     ; $3673: $06 $00
    ld hl, $dd00                                  ; $3675: $21 $00 $dd
    add hl, bc                                    ; $3678: $09
    ld a, [hl]                                    ; $3679: $7e
    cp $ff                                        ; $367a: $fe $ff
    jr z, jr_000_3692                             ; $367c: $28 $14

    inc hl                                        ; $367e: $23
    ld a, [hl-]                                   ; $367f: $3a
    and $03                                       ; $3680: $e6 $03
    inc a                                         ; $3682: $3c
    ld b, a                                       ; $3683: $47
    ld a, $77                                     ; $3684: $3e $77

jr_000_3686:
    rlca                                          ; $3686: $07
    dec b                                         ; $3687: $05
    jr nz, jr_000_3686                            ; $3688: $20 $fc

    ld b, a                                       ; $368a: $47
    ld a, [$dd85]                                 ; $368b: $fa $85 $dd
    and b                                         ; $368e: $a0
    ld [$dd85], a                                 ; $368f: $ea $85 $dd

jr_000_3692:
    xor a                                         ; $3692: $af
    ld [hl+], a                                   ; $3693: $22
    ld a, [de]                                    ; $3694: $1a
    inc de                                        ; $3695: $13
    ld [hl+], a                                   ; $3696: $22
    ld a, [de]                                    ; $3697: $1a
    inc de                                        ; $3698: $13
    ld [hl+], a                                   ; $3699: $22
    ld a, [de]                                    ; $369a: $1a
    inc de                                        ; $369b: $13
    ld [hl], a                                    ; $369c: $77
    ret                                           ; $369d: $c9


Call_000_369e:
    ldh a, [$ffaf]                                ; $369e: $f0 $af
    bit 7, a                                      ; $36a0: $cb $7f
    ret nz                                        ; $36a2: $c0

    xor a                                         ; $36a3: $af
    ld [$dd84], a                                 ; $36a4: $ea $84 $dd
    ld [$dd8b], a                                 ; $36a7: $ea $8b $dd
    ld hl, $dd8a                                  ; $36aa: $21 $8a $dd
    inc [hl]                                      ; $36ad: $34
    ld hl, $dd00                                  ; $36ae: $21 $00 $dd

Jump_000_36b1:
    push hl                                       ; $36b1: $e5
    ld de, $ffd5                                  ; $36b2: $11 $d5 $ff
    ld b, $16                                     ; $36b5: $06 $16

jr_000_36b7:
    ld a, [hl+]                                   ; $36b7: $2a
    ld [de], a                                    ; $36b8: $12
    inc e                                         ; $36b9: $1c
    dec b                                         ; $36ba: $05
    jr nz, jr_000_36b7                            ; $36bb: $20 $fa

    ldh a, [$ffd6]                                ; $36bd: $f0 $d6
    and $03                                       ; $36bf: $e6 $03
    ld [$dd86], a                                 ; $36c1: $ea $86 $dd
    ld b, a                                       ; $36c4: $47
    add a                                         ; $36c5: $87
    add a                                         ; $36c6: $87
    add b                                         ; $36c7: $80
    ld [$dd89], a                                 ; $36c8: $ea $89 $dd
    inc b                                         ; $36cb: $04
    ld a, $88                                     ; $36cc: $3e $88

jr_000_36ce:
    rlca                                          ; $36ce: $07
    dec b                                         ; $36cf: $05
    jr nz, jr_000_36ce                            ; $36d0: $20 $fc

    ld [$dd87], a                                 ; $36d2: $ea $87 $dd
    ld [$dd88], a                                 ; $36d5: $ea $88 $dd
    ldh a, [$ffe9]                                ; $36d8: $f0 $e9
    and a                                         ; $36da: $a7
    jr z, jr_000_372a                             ; $36db: $28 $4d

    ldh a, [$ffd5]                                ; $36dd: $f0 $d5
    and a                                         ; $36df: $a7
    jr z, jr_000_3741                             ; $36e0: $28 $5f

    cp $ff                                        ; $36e2: $fe $ff
    jr z, jr_000_372a                             ; $36e4: $28 $44

    call Call_000_3a0c                            ; $36e6: $cd $0c $3a
    call Call_000_398f                            ; $36e9: $cd $8f $39
    ldh a, [$ffe1]                                ; $36ec: $f0 $e1
    ld b, a                                       ; $36ee: $47
    ldh a, [$ffe2]                                ; $36ef: $f0 $e2
    inc a                                         ; $36f1: $3c
    cp b                                          ; $36f2: $b8
    jr c, jr_000_36f6                             ; $36f3: $38 $01

    ld a, b                                       ; $36f5: $78

jr_000_36f6:
    ldh [$ffe2], a                                ; $36f6: $e0 $e2
    ld hl, $ffda                                  ; $36f8: $21 $da $ff
    dec [hl]                                      ; $36fb: $35
    ld a, [hl]                                    ; $36fc: $7e
    bit 7, a                                      ; $36fd: $cb $7f
    jr z, jr_000_3712                             ; $36ff: $28 $11

    ldh a, [$ffd9]                                ; $3701: $f0 $d9
    and $0f                                       ; $3703: $e6 $0f
    ld [hl], a                                    ; $3705: $77
    call Call_000_39cc                            ; $3706: $cd $cc $39
    ld hl, $ffdc                                  ; $3709: $21 $dc $ff
    dec [hl]                                      ; $370c: $35
    jr nz, jr_000_3712                            ; $370d: $20 $03

jr_000_370f:
    call Call_000_3785                            ; $370f: $cd $85 $37

jr_000_3712:
    ld a, [$dd87]                                 ; $3712: $fa $87 $dd
    ld b, a                                       ; $3715: $47
    ld a, [$dd84]                                 ; $3716: $fa $84 $dd
    or b                                          ; $3719: $b0
    ld [$dd84], a                                 ; $371a: $ea $84 $dd
    pop hl                                        ; $371d: $e1
    push hl                                       ; $371e: $e5
    ld de, $ffd5                                  ; $371f: $11 $d5 $ff
    ld b, $16                                     ; $3722: $06 $16

jr_000_3724:
    ld a, [de]                                    ; $3724: $1a
    ld [hl+], a                                   ; $3725: $22
    inc e                                         ; $3726: $1c
    dec b                                         ; $3727: $05
    jr nz, jr_000_3724                            ; $3728: $20 $fa

jr_000_372a:
    pop hl                                        ; $372a: $e1
    ld de, $0016                                  ; $372b: $11 $16 $00
    add hl, de                                    ; $372e: $19
    ld a, [$dd8b]                                 ; $372f: $fa $8b $dd
    inc a                                         ; $3732: $3c
    ld [$dd8b], a                                 ; $3733: $ea $8b $dd
    cp $06                                        ; $3736: $fe $06
    jp c, Jump_000_36b1                           ; $3738: $da $b1 $36

    ld a, [$dd85]                                 ; $373b: $fa $85 $dd
    ldh [rNR51], a                                ; $373e: $e0 $25
    ret                                           ; $3740: $c9


jr_000_3741:
    ldh a, [$ffd7]                                ; $3741: $f0 $d7
    ld l, a                                       ; $3743: $6f
    ldh a, [$ffd8]                                ; $3744: $f0 $d8
    ld h, a                                       ; $3746: $67
    ld a, [hl+]                                   ; $3747: $2a
    and $0f                                       ; $3748: $e6 $0f
    ldh [$ffda], a                                ; $374a: $e0 $da
    ld d, a                                       ; $374c: $57
    ld a, [$dd86]                                 ; $374d: $fa $86 $dd
    cp $02                                        ; $3750: $fe $02
    jr z, jr_000_377d                             ; $3752: $28 $29

    ld a, [hl+]                                   ; $3754: $2a
    rrca                                          ; $3755: $0f
    rrca                                          ; $3756: $0f
    and $c0                                       ; $3757: $e6 $c0
    or d                                          ; $3759: $b2

jr_000_375a:
    ldh [$ffd9], a                                ; $375a: $e0 $d9
    ld a, [hl+]                                   ; $375c: $2a
    swap a                                        ; $375d: $cb $37
    ldh [$ffdb], a                                ; $375f: $e0 $db
    ld a, [$dd86]                                 ; $3761: $fa $86 $dd
    cp $02                                        ; $3764: $fe $02
    jr z, jr_000_376b                             ; $3766: $28 $03

    ld a, [hl+]                                   ; $3768: $2a
    ldh [$ffdd], a                                ; $3769: $e0 $dd

jr_000_376b:
    xor a                                         ; $376b: $af
    ldh [$ffde], a                                ; $376c: $e0 $de
    ldh [$ffdf], a                                ; $376e: $e0 $df
    ldh [$ffe0], a                                ; $3770: $e0 $e0
    ldh [$ffe3], a                                ; $3772: $e0 $e3
    dec a                                         ; $3774: $3d
    ldh [$ffea], a                                ; $3775: $e0 $ea
    ld a, $02                                     ; $3777: $3e $02
    ldh [$ffd5], a                                ; $3779: $e0 $d5
    jr jr_000_370f                                ; $377b: $18 $92

jr_000_377d:
    ld a, [hl+]                                   ; $377d: $2a
    cpl                                           ; $377e: $2f
    inc a                                         ; $377f: $3c
    ldh [$ffdd], a                                ; $3780: $e0 $dd
    ld a, d                                       ; $3782: $7a
    jr jr_000_375a                                ; $3783: $18 $d5

Call_000_3785:
Jump_000_3785:
    ldh a, [$ffd5]                                ; $3785: $f0 $d5
    ld l, a                                       ; $3787: $6f
    ld h, $00                                     ; $3788: $26 $00
    add hl, hl                                    ; $378a: $29
    ldh a, [$ffd7]                                ; $378b: $f0 $d7
    ld e, a                                       ; $378d: $5f
    ldh a, [$ffd8]                                ; $378e: $f0 $d8
    ld d, a                                       ; $3790: $57
    add hl, de                                    ; $3791: $19

Jump_000_3792:
jr_000_3792:
    ldh a, [$ffd5]                                ; $3792: $f0 $d5
    inc a                                         ; $3794: $3c
    ldh [$ffd5], a                                ; $3795: $e0 $d5
    ld a, [hl+]                                   ; $3797: $2a
    cp $d0                                        ; $3798: $fe $d0
    jr nc, jr_000_37bd                            ; $379a: $30 $21

    cp $b0                                        ; $379c: $fe $b0
    jr nc, jr_000_37fb                            ; $379e: $30 $5b

    cp $a0                                        ; $37a0: $fe $a0
    jp nc, Jump_000_3831                          ; $37a2: $d2 $31 $38

    jp Jump_000_38c0                              ; $37a5: $c3 $c0 $38


jr_000_37a8:
    cp $fd                                        ; $37a8: $fe $fd
    jr nz, jr_000_37b3                            ; $37aa: $20 $07

    ldh a, [$ffd5]                                ; $37ac: $f0 $d5
    ldh [$ffe8], a                                ; $37ae: $e0 $e8

jr_000_37b0:
    inc hl                                        ; $37b0: $23
    jr jr_000_3792                                ; $37b1: $18 $df

jr_000_37b3:
    cp $ff                                        ; $37b3: $fe $ff
    jr nz, jr_000_37b0                            ; $37b5: $20 $f9

    ldh [$ffd5], a                                ; $37b7: $e0 $d5
    call Call_000_3a35                            ; $37b9: $cd $35 $3a
    ret                                           ; $37bc: $c9


jr_000_37bd:
    cp $f0                                        ; $37bd: $fe $f0
    jr nc, jr_000_37a8                            ; $37bf: $30 $e7

    cp $e0                                        ; $37c1: $fe $e0
    jr nc, jr_000_37c9                            ; $37c3: $30 $04

    and $0f                                       ; $37c5: $e6 $0f
    jr jr_000_37cd                                ; $37c7: $18 $04

jr_000_37c9:
    and $0f                                       ; $37c9: $e6 $0f
    cpl                                           ; $37cb: $2f
    inc a                                         ; $37cc: $3c

jr_000_37cd:
    ld b, a                                       ; $37cd: $47
    ld a, [$dd86]                                 ; $37ce: $fa $86 $dd
    cp $02                                        ; $37d1: $fe $02
    jr z, jr_000_37dd                             ; $37d3: $28 $08

    ld a, b                                       ; $37d5: $78
    ldh [$ffe3], a                                ; $37d6: $e0 $e3
    ld a, [hl]                                    ; $37d8: $7e
    ldh [$ffe4], a                                ; $37d9: $e0 $e4
    ldh [$ffe5], a                                ; $37db: $e0 $e5

jr_000_37dd:
    inc hl                                        ; $37dd: $23
    jr jr_000_3792                                ; $37de: $18 $b2

jr_000_37e0:
    and $0f                                       ; $37e0: $e6 $0f
    ld b, a                                       ; $37e2: $47
    ld a, [$dd86]                                 ; $37e3: $fa $86 $dd
    cp $02                                        ; $37e6: $fe $02
    jr z, jr_000_37f8                             ; $37e8: $28 $0e

    ldh a, [$ffdb]                                ; $37ea: $f0 $db
    and $0f                                       ; $37ec: $e6 $0f
    jr nz, jr_000_37f8                            ; $37ee: $20 $08

    ld a, [hl]                                    ; $37f0: $7e
    ldh [$ffe1], a                                ; $37f1: $e0 $e1
    ld a, b                                       ; $37f3: $78
    swap a                                        ; $37f4: $cb $37
    ldh [$ffe0], a                                ; $37f6: $e0 $e0

jr_000_37f8:
    inc hl                                        ; $37f8: $23
    jr jr_000_3792                                ; $37f9: $18 $97

jr_000_37fb:
    cp $c0                                        ; $37fb: $fe $c0
    jr nc, jr_000_37e0                            ; $37fd: $30 $e1

    and $0f                                       ; $37ff: $e6 $0f
    jr z, jr_000_3826                             ; $3801: $28 $23

    ld e, a                                       ; $3803: $5f
    ld a, [hl]                                    ; $3804: $7e
    and a                                         ; $3805: $a7
    jr nz, jr_000_3818                            ; $3806: $20 $10

    ldh a, [$ffde]                                ; $3808: $f0 $de
    dec a                                         ; $380a: $3d
    ldh [$ffde], a                                ; $380b: $e0 $de
    jr z, jr_000_382e                             ; $380d: $28 $1f

    bit 7, a                                      ; $380f: $cb $7f
    jr z, jr_000_3826                             ; $3811: $28 $13

    ld a, e                                       ; $3813: $7b
    ldh [$ffde], a                                ; $3814: $e0 $de
    jr jr_000_3826                                ; $3816: $18 $0e

jr_000_3818:
    ldh a, [$ffdf]                                ; $3818: $f0 $df
    dec a                                         ; $381a: $3d
    ldh [$ffdf], a                                ; $381b: $e0 $df
    jr z, jr_000_382e                             ; $381d: $28 $0f

    bit 7, a                                      ; $381f: $cb $7f
    jr z, jr_000_3826                             ; $3821: $28 $03

    ld a, e                                       ; $3823: $7b
    ldh [$ffdf], a                                ; $3824: $e0 $df

jr_000_3826:
    ld a, [hl]                                    ; $3826: $7e
    and a                                         ; $3827: $a7
    jr nz, jr_000_382c                            ; $3828: $20 $02

    ldh a, [$ffe8]                                ; $382a: $f0 $e8

jr_000_382c:
    ldh [$ffd5], a                                ; $382c: $e0 $d5

jr_000_382e:
    jp Jump_000_3785                              ; $382e: $c3 $85 $37


Jump_000_3831:
    cp $a0                                        ; $3831: $fe $a0
    jr nz, jr_000_383d                            ; $3833: $20 $08

    ld a, [hl+]                                   ; $3835: $2a
    swap a                                        ; $3836: $cb $37
    ldh [$ffdb], a                                ; $3838: $e0 $db
    jp Jump_000_3792                              ; $383a: $c3 $92 $37


jr_000_383d:
    cp $a1                                        ; $383d: $fe $a1
    jr nz, jr_000_3847                            ; $383f: $20 $06

    ld a, [hl+]                                   ; $3841: $2a
    ldh [$ffdd], a                                ; $3842: $e0 $dd
    jp Jump_000_3792                              ; $3844: $c3 $92 $37


jr_000_3847:
    cp $a2                                        ; $3847: $fe $a2
    jr nz, jr_000_386a                            ; $3849: $20 $1f

    ld a, [$dd86]                                 ; $384b: $fa $86 $dd
    cp $02                                        ; $384e: $fe $02
    jr z, jr_000_3862                             ; $3850: $28 $10

    ld a, [hl+]                                   ; $3852: $2a
    rrca                                          ; $3853: $0f
    rrca                                          ; $3854: $0f
    and $c0                                       ; $3855: $e6 $c0
    ld d, a                                       ; $3857: $57
    ldh a, [$ffd9]                                ; $3858: $f0 $d9
    and $3f                                       ; $385a: $e6 $3f
    or d                                          ; $385c: $b2
    ldh [$ffd9], a                                ; $385d: $e0 $d9
    jp Jump_000_3792                              ; $385f: $c3 $92 $37


jr_000_3862:
    ld a, [hl+]                                   ; $3862: $2a
    cpl                                           ; $3863: $2f
    inc a                                         ; $3864: $3c
    ldh [$ffdd], a                                ; $3865: $e0 $dd
    jp Jump_000_3792                              ; $3867: $c3 $92 $37


jr_000_386a:
    cp $a3                                        ; $386a: $fe $a3
    jr nz, jr_000_3888                            ; $386c: $20 $1a

    ld a, [hl+]                                   ; $386e: $2a
    bit 7, a                                      ; $386f: $cb $7f
    jr nz, jr_000_3882                            ; $3871: $20 $0f

    and $70                                       ; $3873: $e6 $70
    ld e, a                                       ; $3875: $5f
    ldh a, [$ffd6]                                ; $3876: $f0 $d6
    and $0f                                       ; $3878: $e6 $0f
    or e                                          ; $387a: $b3
    or $80                                        ; $387b: $f6 $80

jr_000_387d:
    ldh [$ffd6], a                                ; $387d: $e0 $d6
    jp Jump_000_3792                              ; $387f: $c3 $92 $37


jr_000_3882:
    ldh a, [$ffd6]                                ; $3882: $f0 $d6
    and $0f                                       ; $3884: $e6 $0f
    jr jr_000_387d                                ; $3886: $18 $f5

jr_000_3888:
    cp $a5                                        ; $3888: $fe $a5
    jr nz, jr_000_389a                            ; $388a: $20 $0e

    ld a, [hl+]                                   ; $388c: $2a
    cp $01                                        ; $388d: $fe $01
    jr nz, jr_000_3895                            ; $388f: $20 $04

    ldh a, [$ffea]                                ; $3891: $f0 $ea
    swap a                                        ; $3893: $cb $37

jr_000_3895:
    ldh [$ffea], a                                ; $3895: $e0 $ea
    jp Jump_000_3792                              ; $3897: $c3 $92 $37


jr_000_389a:
    cp $a6                                        ; $389a: $fe $a6
    jr nz, jr_000_38a4                            ; $389c: $20 $06

    ld a, [hl+]                                   ; $389e: $2a
    ldh [rNR50], a                                ; $389f: $e0 $24
    jp Jump_000_3792                              ; $38a1: $c3 $92 $37


jr_000_38a4:
    cp $af                                        ; $38a4: $fe $af
    jr nz, jr_000_38b8                            ; $38a6: $20 $10

    ld a, [hl+]                                   ; $38a8: $2a
    and $0f                                       ; $38a9: $e6 $0f
    ldh [$ffda], a                                ; $38ab: $e0 $da
    ld b, a                                       ; $38ad: $47
    ldh a, [$ffd9]                                ; $38ae: $f0 $d9
    and $f0                                       ; $38b0: $e6 $f0
    or b                                          ; $38b2: $b0
    ldh [$ffd9], a                                ; $38b3: $e0 $d9
    jp Jump_000_3792                              ; $38b5: $c3 $92 $37


jr_000_38b8:
    inc hl                                        ; $38b8: $23
    jp Jump_000_3792                              ; $38b9: $c3 $92 $37


jr_000_38bc:
    call Call_000_3a35                            ; $38bc: $cd $35 $3a
    ret                                           ; $38bf: $c9


Jump_000_38c0:
    ld b, a                                       ; $38c0: $47
    ld a, [hl]                                    ; $38c1: $7e
    ldh [$ffdc], a                                ; $38c2: $e0 $dc
    ld a, [$dd86]                                 ; $38c4: $fa $86 $dd
    cp $03                                        ; $38c7: $fe $03
    jr nz, jr_000_38e5                            ; $38c9: $20 $1a

    ld a, b                                       ; $38cb: $78
    ld l, $44                                     ; $38cc: $2e $44
    cp $80                                        ; $38ce: $fe $80
    jr z, jr_000_38e1                             ; $38d0: $28 $0f

    cp $10                                        ; $38d2: $fe $10
    jr nc, jr_000_38bc                            ; $38d4: $30 $e6

    bit 3, a                                      ; $38d6: $cb $5f
    jr z, jr_000_38de                             ; $38d8: $28 $04

    and $07                                       ; $38da: $e6 $07
    add $50                                       ; $38dc: $c6 $50

jr_000_38de:
    add $10                                       ; $38de: $c6 $10
    ld l, a                                       ; $38e0: $6f

jr_000_38e1:
    ld h, $00                                     ; $38e1: $26 $00
    jr jr_000_38f8                                ; $38e3: $18 $13

jr_000_38e5:
    ld a, b                                       ; $38e5: $78
    and $0f                                       ; $38e6: $e6 $0f
    cp $0c                                        ; $38e8: $fe $0c
    jr nc, jr_000_38bc                            ; $38ea: $30 $d0

    ld a, b                                       ; $38ec: $78
    add a                                         ; $38ed: $87
    ld e, a                                       ; $38ee: $5f
    ld d, $00                                     ; $38ef: $16 $00
    ld hl, $3a59                                  ; $38f1: $21 $59 $3a
    add hl, de                                    ; $38f4: $19
    ld a, [hl+]                                   ; $38f5: $2a
    ld h, [hl]                                    ; $38f6: $66
    ld l, a                                       ; $38f7: $6f

jr_000_38f8:
    xor a                                         ; $38f8: $af
    ldh [$ffe2], a                                ; $38f9: $e0 $e2
    call Call_000_3a45                            ; $38fb: $cd $45 $3a
    ld a, [$dd86]                                 ; $38fe: $fa $86 $dd
    cp $02                                        ; $3901: $fe $02
    jr nz, jr_000_390c                            ; $3903: $20 $07

    xor a                                         ; $3905: $af
    ldh [rNR30], a                                ; $3906: $e0 $1a
    ld a, $80                                     ; $3908: $3e $80
    ldh [rNR30], a                                ; $390a: $e0 $1a

jr_000_390c:
    push hl                                       ; $390c: $e5
    call Call_000_3974                            ; $390d: $cd $74 $39
    pop hl                                        ; $3910: $e1
    ld a, [$dd86]                                 ; $3911: $fa $86 $dd
    and a                                         ; $3914: $a7
    jr nz, jr_000_391e                            ; $3915: $20 $07

    ldh a, [$ffdd]                                ; $3917: $f0 $dd
    ld c, $10                                     ; $3919: $0e $10
    call z, Call_000_3a50                         ; $391b: $cc $50 $3a

jr_000_391e:
    ld a, l                                       ; $391e: $7d
    ld c, $13                                     ; $391f: $0e $13
    call Call_000_3a50                            ; $3921: $cd $50 $3a
    ld a, l                                       ; $3924: $7d
    cp $02                                        ; $3925: $fe $02
    jr c, jr_000_3931                             ; $3927: $38 $08

    cp $fe                                        ; $3929: $fe $fe
    jr c, jr_000_3933                             ; $392b: $38 $06

    ld a, $fd                                     ; $392d: $3e $fd
    jr jr_000_3933                                ; $392f: $18 $02

jr_000_3931:
    ld a, $02                                     ; $3931: $3e $02

jr_000_3933:
    ldh [$ffe6], a                                ; $3933: $e0 $e6
    ld a, [$dd86]                                 ; $3935: $fa $86 $dd
    cp $02                                        ; $3938: $fe $02
    jr z, jr_000_3969                             ; $393a: $28 $2d

    cp $02                                        ; $393c: $fe $02
    jr nc, jr_000_3949                            ; $393e: $30 $09

    ldh a, [$ffd9]                                ; $3940: $f0 $d9
    and $c0                                       ; $3942: $e6 $c0
    ld c, $11                                     ; $3944: $0e $11
    call Call_000_3a50                            ; $3946: $cd $50 $3a

jr_000_3949:
    ld a, h                                       ; $3949: $7c
    and $07                                       ; $394a: $e6 $07
    or $80                                        ; $394c: $f6 $80

jr_000_394e:
    ldh [$ffe7], a                                ; $394e: $e0 $e7
    ld c, $14                                     ; $3950: $0e $14
    call Call_000_3a50                            ; $3952: $cd $50 $3a
    ld a, [$dd88]                                 ; $3955: $fa $88 $dd
    ld b, a                                       ; $3958: $47
    xor $ff                                       ; $3959: $ee $ff
    ld c, a                                       ; $395b: $4f
    ldh a, [$ffea]                                ; $395c: $f0 $ea
    and b                                         ; $395e: $a0
    ld b, a                                       ; $395f: $47
    ld a, [$dd85]                                 ; $3960: $fa $85 $dd
    and c                                         ; $3963: $a1
    or b                                          ; $3964: $b0
    ld [$dd85], a                                 ; $3965: $ea $85 $dd
    ret                                           ; $3968: $c9


jr_000_3969:
    ldh a, [$ffdd]                                ; $3969: $f0 $dd
    ldh [rNR31], a                                ; $396b: $e0 $1b
    ld a, h                                       ; $396d: $7c
    and $07                                       ; $396e: $e6 $07
    or $c0                                        ; $3970: $f6 $c0
    jr jr_000_394e                                ; $3972: $18 $da

Call_000_3974:
    ld a, [$dd86]                                 ; $3974: $fa $86 $dd
    cp $02                                        ; $3977: $fe $02
    jr z, jr_000_3980                             ; $3979: $28 $05

    ldh a, [$ffe0]                                ; $397b: $f0 $e0
    and a                                         ; $397d: $a7
    jr nz, jr_000_399c                            ; $397e: $20 $1c

jr_000_3980:
    ldh a, [$ffdb]                                ; $3980: $f0 $db

Jump_000_3982:
jr_000_3982:
    ld c, $12                                     ; $3982: $0e $12
    call Call_000_3a50                            ; $3984: $cd $50 $3a
    ldh a, [$ffe7]                                ; $3987: $f0 $e7
    ld c, $14                                     ; $3989: $0e $14
    call Call_000_3a50                            ; $398b: $cd $50 $3a
    ret                                           ; $398e: $c9


Call_000_398f:
    ldh a, [$ffe0]                                ; $398f: $f0 $e0
    and a                                         ; $3991: $a7
    ret z                                         ; $3992: $c8

    ld a, [$dd86]                                 ; $3993: $fa $86 $dd
    cp $02                                        ; $3996: $fe $02
    ret z                                         ; $3998: $c8

    call Call_000_3a45                            ; $3999: $cd $45 $3a

jr_000_399c:
    ld e, $00                                     ; $399c: $1e $00
    ldh a, [$ffe1]                                ; $399e: $f0 $e1
    ld c, a                                       ; $39a0: $4f
    ldh a, [$ffe2]                                ; $39a1: $f0 $e2
    ld b, $04                                     ; $39a3: $06 $04

jr_000_39a5:
    sla a                                         ; $39a5: $cb $27
    cp c                                          ; $39a7: $b9
    jr c, jr_000_39ab                             ; $39a8: $38 $01

    sub c                                         ; $39aa: $91

jr_000_39ab:
    ccf                                           ; $39ab: $3f
    rl e                                          ; $39ac: $cb $13
    dec b                                         ; $39ae: $05
    jr nz, jr_000_39a5                            ; $39af: $20 $f4

    ldh a, [$ffe0]                                ; $39b1: $f0 $e0
    or e                                          ; $39b3: $b3
    ld e, a                                       ; $39b4: $5f
    ld d, $00                                     ; $39b5: $16 $00
    ld hl, $3b89                                  ; $39b7: $21 $89 $3b
    add hl, de                                    ; $39ba: $19
    ld a, [hl]                                    ; $39bb: $7e
    ld b, a                                       ; $39bc: $47
    ldh a, [$ffdb]                                ; $39bd: $f0 $db
    swap a                                        ; $39bf: $cb $37
    and $0f                                       ; $39c1: $e6 $0f
    or b                                          ; $39c3: $b0
    ld e, a                                       ; $39c4: $5f
    ld hl, $3c29                                  ; $39c5: $21 $29 $3c
    add hl, de                                    ; $39c8: $19
    ld a, [hl]                                    ; $39c9: $7e
    jr jr_000_3982                                ; $39ca: $18 $b6

Call_000_39cc:
    ld a, [$dd86]                                 ; $39cc: $fa $86 $dd
    cp $02                                        ; $39cf: $fe $02
    ret z                                         ; $39d1: $c8

    ldh a, [$ffe3]                                ; $39d2: $f0 $e3
    and a                                         ; $39d4: $a7
    ret z                                         ; $39d5: $c8

    ld hl, $ffe5                                  ; $39d6: $21 $e5 $ff
    dec [hl]                                      ; $39d9: $35
    ret nz                                        ; $39da: $c0

    ldh a, [$ffdb]                                ; $39db: $f0 $db
    swap a                                        ; $39dd: $cb $37
    cp $10                                        ; $39df: $fe $10
    ret nc                                        ; $39e1: $d0

    and $0f                                       ; $39e2: $e6 $0f
    ld b, a                                       ; $39e4: $47
    ldh a, [$ffe4]                                ; $39e5: $f0 $e4
    ldh [$ffe5], a                                ; $39e7: $e0 $e5
    ld hl, $ffe3                                  ; $39e9: $21 $e3 $ff
    ld a, [hl]                                    ; $39ec: $7e
    bit 7, a                                      ; $39ed: $cb $7f
    jr nz, jr_000_39ff                            ; $39ef: $20 $0e

    dec [hl]                                      ; $39f1: $35
    ld a, b                                       ; $39f2: $78
    cp $0f                                        ; $39f3: $fe $0f
    ret z                                         ; $39f5: $c8

    ldh a, [$ffdb]                                ; $39f6: $f0 $db
    add $10                                       ; $39f8: $c6 $10
    ldh [$ffdb], a                                ; $39fa: $e0 $db
    jp Jump_000_3982                              ; $39fc: $c3 $82 $39


jr_000_39ff:
    inc [hl]                                      ; $39ff: $34
    ld a, b                                       ; $3a00: $78
    and a                                         ; $3a01: $a7
    ret z                                         ; $3a02: $c8

    ldh a, [$ffdb]                                ; $3a03: $f0 $db
    sub $10                                       ; $3a05: $d6 $10
    ldh [$ffdb], a                                ; $3a07: $e0 $db
    jp Jump_000_3982                              ; $3a09: $c3 $82 $39


Call_000_3a0c:
    call Call_000_3a45                            ; $3a0c: $cd $45 $3a
    ld a, [$dd86]                                 ; $3a0f: $fa $86 $dd
    cp $03                                        ; $3a12: $fe $03
    ret z                                         ; $3a14: $c8

    ldh a, [$ffd6]                                ; $3a15: $f0 $d6
    bit 7, a                                      ; $3a17: $cb $7f
    ret z                                         ; $3a19: $c8

    and $70                                       ; $3a1a: $e6 $70
    ld b, a                                       ; $3a1c: $47
    ld a, [$dd8a]                                 ; $3a1d: $fa $8a $dd
    and $0f                                       ; $3a20: $e6 $0f
    or b                                          ; $3a22: $b0
    ld e, a                                       ; $3a23: $5f
    ld d, $00                                     ; $3a24: $16 $00
    ld hl, $3b19                                  ; $3a26: $21 $19 $3b
    add hl, de                                    ; $3a29: $19
    ld a, [hl]                                    ; $3a2a: $7e
    ld b, a                                       ; $3a2b: $47
    ldh a, [$ffe6]                                ; $3a2c: $f0 $e6
    add b                                         ; $3a2e: $80
    ld c, $13                                     ; $3a2f: $0e $13
    call Call_000_3a50                            ; $3a31: $cd $50 $3a
    ret                                           ; $3a34: $c9


Call_000_3a35:
    call Call_000_3a45                            ; $3a35: $cd $45 $3a
    ld a, [$dd87]                                 ; $3a38: $fa $87 $dd
    cpl                                           ; $3a3b: $2f
    ld b, a                                       ; $3a3c: $47
    ld a, [$dd85]                                 ; $3a3d: $fa $85 $dd
    and b                                         ; $3a40: $a0
    ld [$dd85], a                                 ; $3a41: $ea $85 $dd
    ret                                           ; $3a44: $c9


Call_000_3a45:
    ld a, [$dd87]                                 ; $3a45: $fa $87 $dd
    ld b, a                                       ; $3a48: $47
    ld a, [$dd84]                                 ; $3a49: $fa $84 $dd
    and b                                         ; $3a4c: $a0
    ret z                                         ; $3a4d: $c8

    pop af                                        ; $3a4e: $f1
    ret                                           ; $3a4f: $c9


Call_000_3a50:
    ld b, a                                       ; $3a50: $47
    ld a, [$dd89]                                 ; $3a51: $fa $89 $dd
    add c                                         ; $3a54: $81
    ld c, a                                       ; $3a55: $4f
    ld a, b                                       ; $3a56: $78
    ldh [c], a                                    ; $3a57: $e2
    ret                                           ; $3a58: $c9


    db $2c, $00, $9c, $00, $07, $01, $6b, $01, $c9, $01, $23, $02, $77, $02, $c6, $02
    db $10, $03, $58, $03, $9b, $03, $da, $03, $00, $00, $00, $00, $00, $00, $00, $00
    db $16, $04, $4e, $04, $83, $04, $b5, $04, $e4, $04, $11, $05, $3b, $05, $63, $05
    db $88, $05, $ac, $05, $cd, $05, $ed, $05, $00, $00, $00, $00, $00, $00, $00, $00
    db $0b, $06, $27, $06, $42, $06, $5b, $06, $72, $06, $89, $06, $9e, $06, $b1, $06
    db $c4, $06, $d6, $06, $e7, $06, $f5, $06, $00, $00, $00, $00, $00, $00, $00, $00
    db $05, $07, $13, $07, $21, $07, $2d, $07, $39, $07, $44, $07, $4f, $07, $59, $07
    db $62, $07, $6b, $07, $73, $07, $7b, $07, $00, $00, $00, $00, $00, $00, $00, $00
    db $83, $07, $8a, $07, $90, $07, $97, $07, $9d, $07, $a2, $07, $a7, $07, $ac, $07
    db $b1, $07, $b5, $07, $ba, $07, $be, $07, $00, $00, $00, $00, $00, $00, $00, $00
    db $c1, $07, $c5, $07, $c8, $07, $cb, $07, $ce, $07, $d1, $07, $d4, $07, $d6, $07
    db $d8, $07, $db, $07, $dd, $07, $df, $07, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $01, $01, $00, $00, $ff, $ff, $00, $00, $01, $01, $00, $00, $ff, $ff
    db $00, $00, $00, $00, $01, $01, $01, $01, $00, $00, $00, $00, $ff, $ff, $ff, $ff
    db $00, $01, $02, $01, $00, $ff, $fe, $ff, $00, $01, $02, $01, $00, $ff, $fe, $ff
    db $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $fe, $fe, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    db $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe
    db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
    db $f0, $e0, $d0, $c0, $b0, $a0, $90, $80, $70, $60, $50, $40, $30, $20, $10, $00
    db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
    db $f0, $e0, $d0, $c0, $b0, $a0, $90, $80, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
    db $80, $90, $a0, $b0, $c0, $d0, $e0, $f0, $f0, $e0, $d0, $c0, $b0, $a0, $90, $80
    db $f0, $d0, $b0, $90, $70, $50, $30, $10, $e0, $c0, $a0, $80, $60, $40, $20, $00
    db $f0, $e0, $d0, $c0, $c0, $d0, $e0, $d0, $c0, $a0, $80, $60, $40, $20, $10, $00
    db $f0, $d0, $b0, $90, $a0, $b0, $90, $70, $60, $50, $40, $30, $20, $10, $10, $00
    db $40, $40, $40, $40, $40, $40, $40, $60, $60, $70, $80, $a0, $c0, $f0, $b0, $80
    db $f0, $f0, $a0, $80, $f0, $f0, $a0, $80, $70, $70, $60, $60, $50, $50, $40, $20
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $10, $10, $10, $10, $10, $10, $10, $10
    db $00, $00, $00, $00, $10, $10, $10, $10, $10, $10, $10, $10, $20, $20, $20, $20
    db $00, $00, $00, $10, $10, $10, $10, $10, $20, $20, $20, $20, $20, $30, $30, $30
    db $00, $00, $10, $10, $10, $10, $20, $20, $20, $20, $30, $30, $30, $30, $40, $40
    db $00, $00, $10, $10, $10, $20, $20, $20, $30, $30, $30, $40, $40, $40, $50, $50
    db $00, $00, $10, $10, $20, $20, $20, $30, $30, $40, $40, $40, $50, $50, $60, $60
    db $00, $00, $10, $10, $20, $20, $30, $30, $40, $40, $50, $50, $60, $60, $70, $70
    db $00, $10, $10, $20, $20, $30, $30, $40, $40, $50, $50, $60, $60, $70, $70, $80
    db $00, $10, $10, $20, $20, $30, $40, $40, $50, $50, $60, $70, $70, $80, $80, $90
    db $00, $10, $10, $20, $30, $30, $40, $50, $50, $60, $70, $70, $80, $90, $90, $a0
    db $00, $10, $10, $20, $30, $40, $40, $50, $60, $70, $70, $80, $90, $a0, $a0, $b0
    db $00, $10, $20, $20, $30, $40, $50, $60, $60, $70, $80, $90, $a0, $a0, $b0, $c0
    db $00, $10, $20, $30, $30, $40, $50, $60, $70, $80, $90, $a0, $a0, $b0, $c0, $d0
    db $00, $10, $20, $30, $40, $50, $60, $70, $70, $80, $90, $a0, $b0, $c0, $d0, $e0
    db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
    db $42, $01, $f1, $3d, $58, $02, $b0, $3e, $6e, $03, $05, $40, $16, $00, $5c, $40
    db $16, $00, $63, $40, $2c, $03, $6a, $40, $00, $00, $71, $40, $00, $00, $80, $40
    db $16, $02, $8f, $40, $16, $02, $96, $40, $16, $00, $a3, $40, $00, $00, $aa, $40
    db $2c, $03, $bd, $40, $2c, $03, $ca, $40, $16, $01, $d5, $40, $16, $01, $e0, $40
    db $00, $00, $ed, $40, $2c, $03, $1a, $41, $2c, $00, $25, $41, $42, $01, $e6, $41
    db $58, $02, $97, $42, $6e, $03, $10, $43, $2c, $00, $51, $43, $42, $01, $7a, $43
    db $58, $02, $a3, $43, $6e, $03, $cc, $43, $2c, $00, $f5, $43, $42, $01, $0c, $44
    db $58, $02, $25, $44, $6e, $03, $3c, $44, $42, $00, $55, $44, $58, $02, $ac, $44
    db $6e, $03, $db, $44, $2c, $00, $0e, $45, $42, $01, $b5, $45, $58, $02, $5a, $46
    db $6e, $03, $4f, $47, $2c, $03, $c8, $47, $00, $00, $d3, $47, $00, $00, $e0, $47
    db $00, $00, $ed, $47, $00, $00, $fa, $47, $00, $00, $05, $48, $00, $00, $1a, $48
    db $00, $00, $6a, $48, $42, $00, $21, $48, $58, $01, $30, $48, $42, $00, $41, $48
    db $58, $01, $50, $48, $00, $00, $5f, $48, $08, $02, $36, $00, $1f, $08, $fd, $fe
    db $1f, $02, $30, $02, $30, $02, $30, $01, $32, $03, $30, $02, $32, $02, $34, $01
    db $29, $04, $29, $01, $30, $01, $32, $02, $35, $03, $34, $02, $32, $01, $30, $03
    db $29, $04, $30, $01, $32, $02, $27, $05, $30, $01, $32, $02, $25, $08, $27, $02
    db $27, $01, $29, $02, $34, $01, $32, $03, $1f, $02, $30, $02, $30, $02, $30, $01
    db $32, $03, $30, $02, $32, $01, $34, $02, $29, $05, $30, $01, $32, $03, $35, $02
    db $34, $02, $32, $01, $30, $03, $32, $04, $32, $01, $32, $01, $32, $01, $34, $01
    db $35, $02, $35, $02, $37, $01, $34, $02, $30, $09, $1f, $0a, $a0, $66, $a3, $21
    db $a2, $01, $29, $01, $1f, $01, $29, $04, $2b, $01, $29, $02, $2b, $05, $1f, $02
    db $2b, $01, $1f, $01, $2b, $04, $30, $01, $2b, $02, $30, $05, $1f, $02, $30, $02
    db $2b, $01, $30, $02, $35, $03, $34, $02, $30, $01, $32, $03, $1f, $02, $33, $02
    db $32, $01, $33, $03, $38, $02, $37, $02, $33, $01, $35, $03, $37, $08, $a0, $36
    db $a3, $80, $a2, $02, $b0, $00, $ff, $08, $15, $02, $00, $a3, $21, $1f, $01, $30
    db $01, $27, $02, $35, $01, $34, $01, $30, $01, $32, $01, $a5, $f0, $fd, $fe, $20
    db $01, $30, $01, $a5, $01, $b3, $00, $fd, $fe, $1b, $01, $2b, $01, $a5, $01, $b3
    db $00, $fd, $fe, $19, $01, $29, $01, $a5, $01, $b3, $00, $17, $01, $a5, $01, $27
    db $01, $a5, $01, $17, $01, $a5, $01, $27, $01, $a5, $01, $24, $01, $a5, $01, $34
    db $01, $a5, $01, $24, $01, $a5, $01, $34, $01, $fd, $fe, $25, $01, $35, $01, $a5
    db $01, $b3, $00, $fd, $fe, $24, $01, $34, $01, $a5, $01, $b3, $00, $fd, $fe, $22
    db $01, $32, $01, $a5, $01, $b3, $00, $fd, $fe, $27, $01, $37, $01, $a5, $01, $b3
    db $00, $fd, $fe, $20, $01, $30, $01, $a5, $01, $b3, $00, $fd, $fe, $1b, $01, $2b
    db $01, $a5, $01, $b3, $00, $fd, $fe, $19, $01, $29, $01, $a5, $01, $b3, $00, $17
    db $01, $a5, $01, $27, $01, $a5, $01, $17, $01, $a5, $01, $27, $01, $a5, $01, $24
    db $01, $a5, $01, $34, $01, $a5, $01, $24, $01, $a5, $01, $34, $01, $fd, $fe, $22
    db $01, $32, $01, $a5, $01, $b2, $00, $22, $01, $a5, $01, $24, $01, $a5, $01, $25
    db $01, $a5, $01, $35, $01, $a5, $01, $25, $01, $a5, $01, $35, $01, $a5, $01, $27
    db $01, $a5, $01, $37, $01, $a5, $01, $27, $01, $a5, $01, $37, $01, $a5, $01, $fd
    db $fe, $20, $01, $30, $01, $a5, $01, $b3, $00, $fd, $fe, $1a, $01, $2a, $01, $a5
    db $01, $b3, $00, $fd, $fe, $25, $01, $a5, $01, $b7, $00, $a5, $01, $fd, $fe, $27
    db $01, $a5, $01, $b6, $00, $a5, $01, $25, $01, $a5, $01, $fd, $fe, $24, $01, $a5
    db $01, $b7, $00, $a5, $01, $fd, $fe, $29, $01, $a5, $01, $b5, $00, $27, $01, $a5
    db $01, $37, $01, $a5, $01, $fd, $fe, $25, $01, $a5, $01, $b7, $00, $a5, $01, $fd
    db $fe, $27, $01, $b7, $00, $a5, $01, $fd, $fe, $28, $01, $a5, $01, $b7, $00, $a5
    db $01, $fd, $fe, $2a, $01, $a5, $01

    db $b7

    db $00, $b0, $02, $ff, $08, $00, $14, $00, $0e, $01, $07, $01, $07, $02, $03, $01
    db $07, $01, $07, $01, $09, $01, $fd, $fe, $0e, $01, $03, $01, $07, $01, $03, $01
    db $0e, $01, $0e, $01, $07, $01, $0e, $01, $1f, $01, $0e, $01, $07, $01, $03, $01
    db $0e, $01, $03, $01, $08, $01, $0e, $01, $0e, $01, $03, $01, $07, $01, $03, $01
    db $0e, $01, $03, $01, $07, $01, $0a, $01, $0e, $01, $05, $01, $06, $01, $07, $01
    db $08, $01, $09, $01, $0a, $01, $0b, $01, $b0, $02, $ff, $00, $02, $2b, $4d, $3a
    db $02, $ff, $00, $02, $2f, $25, $37, $04, $ff, $00, $00, $ad, $00, $01, $02, $ff
    db $00, $02, $0f, $2b, $ef, $01, $fd, $fe, $40, $01, $1f, $01, $b7, $00, $ff, $00
    db $02, $0d, $8a, $ef, $01, $fd, $fe, $37, $01, $1f, $01, $b7, $00, $ff, $01, $15
    db $02, $00, $47, $02, $ff, $02, $15, $02, $00, $47, $01, $57, $01, $1f, $01, $57
    db $02, $ff, $01, $02, $0f, $9a, $19, $01, $ff, $00, $02, $0f, $00, $1f, $02, $ef
    db $01, $fd, $fe, $30, $01, $34, $01, $37, $01, $b5, $00, $ff, $00, $00, $0f, $00
    db $c2, $01, $0d, $02, $c9, $03, $09, $0a, $ff, $00, $00, $0f, $00, $09, $01, $0c
    db $01, $0e, $01, $ff, $00, $02, $05, $00, $c9, $01, $30, $01, $40, $02, $ff, $00
    db $02, $08, $da, $a3, $20, $30, $02, $35, $02, $40, $06, $ff, $03, $01, $0d, $a6
    db $1f, $02, $40, $02, $1f, $01, $40, $05, $1f, $01, $a5, $0f, $42, $02, $1f, $02
    db $42, $04, $a5, $f0, $fd, $fe, $40, $01, $1f, $01, $40, $04, $1f, $02, $b1, $00
    db $a5, $0f, $42, $02, $1f, $01, $42, $04, $ff, $00, $00, $d2, $00, $80, $80, $a0
    db $7d, $80, $50, $ff, $07, $02, $68, $00, $a3, $01, $1f, $02, $40, $01, $1f, $01
    db $40, $01, $37, $02, $35, $02, $34, $01, $34, $01, $35, $01, $37, $01, $30, $05
    db $29, $01, $30, $01, $1f, $01, $34, $02, $32, $03, $2a, $01, $32, $01, $1f, $01
    db $37, $02, $40, $03, $b1, $04, $a0, $1f, $a5, $f0, $22, $01, $22, $01, $22, $01
    db $22, $01, $1f, $01, $a2, $02, $a5, $ff, $a0, $68, $2a, $01, $1f, $01, $32, $01
    db $34, $01, $35, $01, $1f, $01, $39, $02, $37, $03, $a2, $00, $a5, $0f, $a0, $1f
    db $24, $01, $24, $01, $24, $01, $1f, $02, $a5, $ff, $a0, $68, $a2, $03, $40, $01
    db $37, $01, $3a, $01, $37, $01, $3a, $01, $40, $01, $45, $05, $a5, $f0, $a0, $1f
    db $a2, $03, $22, $01, $22, $01, $1f, $01, $22, $01, $a0, $66, $a5, $ff, $1f, $01
    db $37, $01, $39, $01, $3a, $01, $40, $01, $42, $01, $1f, $01, $44, $01, $1f, $01
    db $45, $01, $47, $02, $a0, $6c, $a5, $f0, $33, $03, $35, $03, $44, $01, $44, $01
    db $1f, $01, $a1, $82, $a0, $1f, $50, $01, $50, $02, $46, $01, $46, $01, $39, $01
    db $36, $01, $a1, $00, $ff, $07, $02, $76, $00, $1f, $02, $1f, $01, $a3, $01, $40
    db $01, $1f, $01, $40, $01, $37, $02, $35, $02, $34, $01, $34, $01, $35, $01, $37
    db $01, $30, $05, $29, $01, $30, $01, $1f, $01, $34, $02, $32, $03, $2a, $01, $32
    db $01, $1f, $01, $37, $02, $40, $02, $b1, $03, $a0, $1f, $a5, $f0, $25, $01, $25
    db $01, $25, $01, $25, $01, $1f, $02, $a2, $02, $a5, $ff, $a0, $76, $2a, $01, $1f
    db $01, $32, $01, $34, $01, $35, $01, $1f, $01, $39, $02, $37, $02, $a2, $00, $a5
    db $0f, $a0, $1f, $27, $01, $27, $01, $27, $01, $1f, $03, $a5, $ff, $a0, $76, $a2
    db $03, $40, $01, $37, $01, $3a, $01, $37, $01, $3a, $01, $40, $01, $45, $04, $a5
    db $f0, $a0, $1f, $a2, $02, $25, $01, $25, $01, $1f, $01, $25, $01, $a0, $75, $a5
    db $ff, $1f, $02, $37, $01, $39, $01, $3a, $01, $40, $01, $42, $01, $1f, $01, $44
    db $01, $1f, $01, $45, $01, $47, $01, $a0, $6c, $a5, $0f, $40, $03, $42, $03, $47
    db $01, $47, $01, $1f, $08, $ff, $07, $16, $02, $00, $1f, $02, $fd, $fe, $a5, $0f
    db $20, $02, $20, $01, $20, $02, $20, $01, $a5, $f0, $20, $01, $20, $01, $20, $01
    db $20, $01, $20, $01, $20, $02, $20, $01, $20, $01, $24, $01, $a5, $0f, $25, $01
    db $25, $01, $1f, $01, $27, $02, $27, $01, $a5, $f0, $32, $01, $29, $01, $2a, $01
    db $2a, $01, $1f, $01, $30, $02, $30, $01, $27, $01, $27, $01, $b1, $00, $a5, $f0
    db $a0, $02, $2a, $01, $2a, $01, $2a, $01, $2a, $01, $1f, $0c, $a5, $0f, $30, $01
    db $30, $01, $30, $02, $1f, $0c, $a5, $f0, $2a, $01, $2a, $01, $1f, $01, $2a, $01
    db $1f, $0c, $a5, $ff, $28, $03, $2a, $03, $30, $01, $30, $01, $1f, $08, $ff, $07
    db $00, $24, $00, $1f, $02, $fd, $fe, $0e, $02, $07, $01, $0e, $02, $0e, $01, $07
    db $02, $0e, $01, $0e, $01, $07, $01, $0e, $01, $1f, $01, $0e, $01, $07, $02, $b6
    db $00, $07, $01, $0e, $01, $0e, $01, $07, $01, $0e, $01, $0e, $01, $07, $01, $0e
    db $01, $0e, $01, $07, $01, $07, $02, $0a, $01, $06, $01, $09, $01, $0a, $01, $ff
    db $05, $00, $0f, $00, $c1, $30, $a3, $21, $30, $01, $25, $01, $29, $01, $30, $01
    db $32, $01, $2b, $02, $2a, $01, $1f, $01, $32, $01, $35, $01, $39, $01, $30, $02
    db $34, $01, $37, $01, $40, $01, $40, $02, $ff, $05, $03, $0f, $00, $c1, $30, $a3
    db $21, $29, $01, $20, $01, $25, $01, $29, $01, $2b, $01, $27, $02, $27, $01, $1f
    db $01, $2a, $01, $32, $01, $35, $01, $27, $02, $30, $01, $34, $01, $37, $01, $37
    db $02, $ff, $05, $10, $04, $00, $a5, $0f, $30, $01, $25, $01, $29, $01, $30, $01
    db $32, $01, $2b, $01, $1f, $01, $2a, $01, $1f, $01, $32, $01, $35, $01, $39, $01
    db $30, $02, $34, $01, $37, $01, $20, $01, $20, $02, $ff, $05, $00, $0a, $00, $a5
    db $f0, $c9, $02, $07, $01, $07, $01, $07, $01, $07, $01, $0a, $01, $0a, $02, $0c
    db $01, $1f, $01, $0c, $01, $0c, $01, $0c, $01, $07, $02, $07, $01, $07, $01, $05
    db $01, $05, $02, $ff, $04, $00, $0f, $00, $c1, $10, $3a, $01, $40, $01, $1f, $01
    db $3a, $01, $40, $01, $1f, $01, $50, $01, $50, $02, $ff, $04, $00, $0f, $00, $c1
    db $10, $a3, $21, $33, $01, $35, $01, $1f, $01, $33, $01, $35, $01, $1f, $01, $37
    db $01, $37, $02, $ff, $04, $10, $04, $00, $a5, $f0, $2a, $01, $30, $01, $1f, $01
    db $2a, $01, $30, $01, $1f, $01, $20, $01, $20, $01, $ff, $04, $00, $0a, $00, $a5
    db $0f, $c9, $02, $07, $01, $07, $01, $03, $01, $0e, $01, $0e, $01, $03, $01, $07
    db $01, $07, $02, $ff, $06, $01, $24, $00, $a3, $21, $38, $01, $3b, $01, $1f, $02
    db $38, $01, $3b, $01, $1f, $02, $38, $01, $34, $01, $1f, $01, $36, $03, $34, $02
    db $38, $01, $3b, $01, $1f, $02, $38, $01, $3b, $01, $1f, $02, $31, $01, $34, $01
    db $1f, $01, $36, $03, $34, $02, $38, $01, $3b, $01, $1f, $02, $38, $01, $3b, $01
    db $1f, $02, $38, $01, $34, $01, $1f, $01, $36, $03, $34, $02, $29, $03, $29, $03
    db $29, $03, $29, $03, $29, $02, $2a, $02, $b0, $02, $ff, $06, $15, $04, $00, $fd
    db $fe, $24, $01, $24, $01, $1f, $01, $24, $01, $28, $02, $2b, $02, $21, $03, $23
    db $03, $23, $02, $b2, $00, $fd, $fe, $22, $01, $22, $01, $1f, $02, $b2, $00, $22
    db $01, $22, $01, $23, $01, $23, $01, $b0, $02, $ff, $06, $00, $14, $00, $fd, $fe
    db $a5, $f0, $0e, $01, $a5, $0f, $03, $01, $07, $02, $a5, $01, $0e, $01, $0e, $01
    db $a5, $0f, $07, $02, $a5, $f0, $0e, $01, $a5, $0f, $03, $01, $07, $01, $a5, $f0
    db $0e, $01, $1f, $01, $0e, $01, $a5, $0f, $07, $02, $b0, $00, $ff, $08, $02, $59
    db $00, $a3, $11, $1f, $01, $2a, $01, $29, $02, $27, $01, $29, $01, $2a, $01, $30
    db $01, $fd, $fe, $34, $02, $34, $01, $35, $02, $34, $03, $35, $01, $37, $02, $40
    db $05, $b1, $00, $42, $02, $40, $01, $42, $05, $45, $02, $44, $02, $40, $02, $42
    db $02, $44, $08, $54, $04, $52, $04, $34, $02, $34, $01, $35, $02, $34, $03, $35
    db $01, $37, $02, $40, $05, $34, $02, $34, $01, $35, $02, $34, $03, $35, $01, $34
    db $01, $37, $01, $40, $05, $42, $02, $40, $01, $42, $05, $45, $02, $44, $02, $40
    db $02, $42, $02, $a0, $5a, $40, $08, $1f, $0a, $44, $02, $44, $02, $44, $02, $47
    db $01, $40, $02, $44, $05, $1f, $02, $44, $02, $39, $02, $40, $02, $47, $01, $45
    db $02, $44, $05, $1f, $02, $50, $02, $50, $01, $50, $03, $50, $02, $4b, $02, $50
    db $01, $52, $03, $47, $08, $a0, $5b, $a5, $f0, $1f, $01, $47, $07, $a5, $ff, $a0
    db $59, $b0, $02, $ff, $08, $02, $d1, $00, $c2, $03, $a3, $11, $1f, $08, $fd, $fe
    db $1f, $01, $34, $02, $34, $01, $35, $02, $34, $03, $35, $01, $37, $02, $40, $03
    db $1f, $01, $b1, $00, $42, $02, $40, $01, $42, $05, $45, $02, $44, $02, $40, $02
    db $42, $02, $44, $04, $1f, $04, $54, $04, $52, $04, $34, $02, $34, $01, $35, $02
    db $34, $03, $35, $01, $37, $02, $40, $03, $1f, $02, $34, $02, $34, $01, $35, $02
    db $34, $03, $35, $01, $34, $01, $37, $01, $40, $03, $1f, $02, $42, $02, $40, $01
    db $42, $05, $45, $02, $44, $02, $40, $02, $42, $02, $40, $04, $1f, $0e, $a0, $59
    db $40, $02, $40, $02, $40, $02, $44, $01, $40, $02, $40, $05, $1f, $02, $40, $02
    db $35, $02, $39, $02, $40, $01, $40, $02, $40, $05, $1f, $02, $45, $02, $45, $01
    db $45, $03, $49, $02, $47, $02, $49, $01, $4b, $03, $42, $08, $a5, $0f, $a0, $5b
    db $37, $08, $a0, $d1, $a5, $ff, $b0, $02, $ff, $08, $20, $02, $00, $20, $01, $2a
    db $01, $29, $02, $27, $01, $29, $01, $2a, $01, $fd, $fe, $a5, $f0, $20, $02, $a5
    db $0f, $20, $01, $20, $01, $20, $01, $20, $01, $20, $01, $20, $01, $a5, $f0, $20
    db $02, $a5, $0f, $20, $01, $20, $01, $20, $01, $20, $01, $20, $01, $24, $01, $a5
    db $f0, $25, $02, $a5, $0f, $25, $01, $25, $01, $25, $01, $25, $01, $25, $01, $25
    db $01, $a5, $f0, $25, $02, $a5, $0f, $25, $01, $25, $01, $25, $01, $25, $01, $25
    db $01, $25, $01, $a5, $f0, $22, $02, $a5, $0f, $22, $01, $22, $01, $22, $01, $22
    db $01, $22, $01, $25, $01, $a5, $f0, $27, $02, $a5, $0f, $27, $01, $27, $01, $27
    db $01, $27, $01, $27, $01, $27, $01, $a5, $f0, $20, $02, $a5, $0f, $20, $01, $20
    db $01, $20, $01, $20, $01, $20, $01, $20, $01, $a5, $f0, $20, $02, $a5, $01, $20
    db $01, $a5, $01, $2a, $01, $a5, $01, $27, $01, $a5, $01, $25, $01, $a5, $01, $26
    db $01, $a5, $01, $27, $01, $a5, $f0, $b1, $00, $2a, $01, $fd, $fe, $29, $01, $39
    db $01, $b5, $00, $27, $01, $27, $01, $27, $01, $27, $01, $fd, $fe, $25, $01, $35
    db $01, $b5, $00, $24, $01, $34, $01, $24, $01, $34, $01, $fd, $fe, $22, $01, $32
    db $01, $b5, $00, $22, $01, $24, $01, $25, $01, $26, $01, $fd, $fe, $27, $01, $37
    db $01, $b3, $00, $fd, $fe, $32, $01, $42, $01, $b3, $00, $b0, $02, $ff, $08, $00
    db $15, $00, $a5, $f0, $0e, $01, $a5, $0f, $07, $01, $a5, $f0, $07, $01, $a5, $0f
    db $0a, $01, $a5, $f0, $05, $01, $a5, $0f, $07, $01, $a5, $f0, $09, $01, $a5, $0f
    db $07, $01, $a5, $ff, $fd, $fe, $03, $01, $0e, $01, $07, $02, $0e, $01, $03, $01
    db $08, $01, $0e, $01, $bf, $00, $fd, $fe, $a5, $f0, $07, $01, $a5, $0f, $03, $01
    db $a5, $f0, $07, $01, $a5, $0f, $03, $01, $a5, $f0, $07, $01, $a5, $0f, $03, $01
    db $a5, $f0, $07, $01, $a5, $0f, $03, $01, $a5, $f0, $07, $01, $a5, $0f, $03, $01
    db $a5, $f0, $07, $01, $a5, $0f, $03, $01, $a5, $ff, $05, $01, $05, $01, $05, $01
    db $05, $01, $b3, $00, $b0, $02, $ff, $00, $00, $a2, $00, $80, $38, $a0, $4c, $80
    db $68, $ff, $03, $02, $1f, $2e, $1f, $06, $40, $02, $44, $02, $47, $03, $ff, $03
    db $01, $0f, $2c, $1f, $06, $fd, $fe, $30, $01, $b4, $00, $ff, $03, $02, $1f, $2e
    db $1f, $06, $30, $02, $34, $02, $37, $03, $ff, $02, $01, $1f, $47, $1f, $06, $40
    db $04, $35, $02, $ff, $00, $02, $0d, $8a, $ef, $01, $fd, $fe, $2a, $01, $1f, $01
    db $b7, $00, $a0, $05, $a1, $77, $19, $66, $ff, $00, $02, $05, $6f, $30, $40, $ff
    db $05, $01, $2d, $00, $2b, $01, $27, $01, $2b, $01, $30, $01, $37, $04, $ff, $05
    db $01, $2a, $00, $27, $01, $22, $01, $27, $01, $29, $01, $2b, $01, $37, $03, $ff
    db $05, $00, $1d, $00, $27, $01, $26, $01, $25, $01, $22, $01, $17, $04, $ff, $05
    db $00, $1a, $00, $22, $01, $21, $01, $22, $01, $1b, $01, $12, $04, $ff, $02, $02
    db $0c, $37, $1f, $06, $40, $02, $40, $02, $ff, $00, $00, $00, $00, $ff

Call_000_486f:
    ld a, [$c000]                                 ; $486f: $fa $00 $c0
    and $03                                       ; $4872: $e6 $03
    ret z                                         ; $4874: $c8

    ld hl, $c002                                  ; $4875: $21 $02 $c0
    call Call_000_095d                            ; $4878: $cd $5d $09
    ld a, [$c001]                                 ; $487b: $fa $01 $c0
    ld hl, $4887                                  ; $487e: $21 $87 $48
    call Call_000_3047                            ; $4881: $cd $47 $30
    jp Jump_000_0063                              ; $4884: $c3 $63 $00


    db $af, $48, $c8, $48, $e5, $48, $c8, $48, $02, $49, $1f, $49, $3c, $49, $c8, $48
    db $55, $49, $72, $49, $8b, $49, $a8, $49, $c5, $49, $e2, $49, $ff, $49, $1c, $4a
    db $39, $4a, $8b, $49, $56, $4a, $73, $4a, $e8, $f8, $40, $00, $e8, $00, $41, $00
    db $f0, $f8, $50, $00, $f0, $00, $51, $00, $f8, $f8, $60, $00, $f8, $00, $61, $00
    db $80, $e8, $f0, $33, $20, $e8, $f8, $42, $00, $e8, $00, $43, $00, $f0, $f8, $52
    db $00, $f0, $00, $53, $00, $f8, $f8, $62, $00, $f8, $00, $63, $00, $80, $e8, $f0
    db $33, $20, $e8, $f8, $42, $00, $e8, $00, $43, $00, $f0, $f8, $52, $00, $f0, $00
    db $53, $00, $f8, $f8, $4a, $00, $f8, $00, $4b, $00, $80, $e8, $f8, $44, $00, $e8
    db $00, $45, $00, $f0, $f8, $54, $00, $f0, $00, $55, $00, $f3, $f0, $33, $60, $f8
    db $f8, $64, $00, $f8, $00, $65, $00, $80, $e0, $00, $30, $00, $e8, $f8, $46, $00
    db $e8, $00, $47, $00, $f0, $f8, $56, $00, $f0, $00, $57, $00, $f8, $f8, $66, $00
    db $f8, $00, $67, $00, $80, $e8, $f8, $40, $00, $e8, $00, $41, $00, $f0, $f8, $58
    db $00, $f0, $00, $59, $00, $f8, $f8, $68, $00, $f8, $00, $69, $00, $80, $e8, $f8
    db $42, $00, $e8, $00, $43, $00, $f0, $f8, $48, $00, $f0, $00, $49, $00, $f2, $08
    db $34, $20, $f8, $f8, $62, $00, $f8, $00, $63, $00, $80, $e8, $f8, $40, $00, $e8
    db $00, $41, $00, $f0, $f8, $5a, $00, $f0, $00, $5b, $00, $f8, $f8, $62, $00, $f8
    db $00, $63, $00, $80, $e8, $f8, $43, $20, $e8, $00, $42, $20, $ea, $04, $33, $00
    db $f0, $f8, $6a, $00, $f0, $00, $6b, $00, $f8, $f8, $63, $20, $f8, $00, $62, $20
    db $80, $e8, $f8, $43, $20, $e8, $00, $42, $20, $f0, $f8, $4c, $00, $f0, $00, $4d
    db $00, $f2, $f0, $34, $00, $f8, $f8, $63, $20, $f8, $00, $62, $20, $80, $e8, $f8
    db $40, $00, $e8, $00, $41, $00, $ea, $08, $33, $00, $f0, $f8, $5c, $00, $f0, $00
    db $5d, $00, $f8, $f8, $63, $20, $f8, $00, $62, $20, $80, $e8, $f8, $42, $00, $e8
    db $00, $43, $00, $ea, $07, $33, $00, $f0, $f8, $48, $00, $f0, $00, $4e, $00, $f8
    db $f8, $62, $00, $f8, $00, $63, $00, $80, $e8, $f8, $42, $00, $e8, $00, $43, $00
    db $ee, $06, $33, $00, $f0, $f8, $48, $00, $f0, $00, $5e, $00, $f8, $f8, $62, $00
    db $f8, $00, $63, $00, $80, $e8, $f8, $43, $20, $e8, $00, $42, $20, $ea, $f0, $33
    db $20, $f0, $f8, $6d, $00, $f0, $00, $4d, $00, $f8, $f8, $63, $20, $f8, $00, $62
    db $20, $80, $e8, $f8, $43, $20, $e8, $00, $42, $20, $ee, $f2, $33, $20, $f0, $f8
    db $6c, $00, $f0, $00, $4d, $00, $f8, $f8, $63, $20, $f8, $00, $62, $20, $80, $e8
    db $f8, $43, $20, $e8, $00, $42, $20, $ea, $04, $33, $00, $f0, $f8, $6a, $00, $f0
    db $00, $6b, $00, $f8, $f8, $4b, $20, $f8, $00, $4a, $20, $80, $e8, $f0, $33, $20
    db $e8, $f8, $42, $00, $e8, $00, $43, $00, $f0, $f8, $52, $00, $f0, $00, $6e, $00
    db $f8, $f8, $62, $00, $f8, $00, $4f, $00, $80

Call_000_4a90:
    ld a, [$c020]                                 ; $4a90: $fa $20 $c0
    and $03                                       ; $4a93: $e6 $03
    ret z                                         ; $4a95: $c8

    ld hl, $c022                                  ; $4a96: $21 $22 $c0
    call Call_000_095d                            ; $4a99: $cd $5d $09
    ld a, [$c021]                                 ; $4a9c: $fa $21 $c0
    ld hl, $4aa8                                  ; $4a9f: $21 $a8 $4a
    call Call_000_3047                            ; $4aa2: $cd $47 $30
    jp Jump_000_0063                              ; $4aa5: $c3 $63 $00


    db $d0, $4a, $e9, $4a, $06, $4b, $e9, $4a, $23, $4b, $40, $4b, $5d, $4b, $e9, $4a
    db $76, $4b, $93, $4b, $ac, $4b, $c9, $4b, $e6, $4b, $03, $4c, $20, $4c, $3d, $4c
    db $5a, $4c, $ac, $4b, $77, $4c, $94, $4c, $e8, $f8, $00, $10, $e8, $00, $01, $10
    db $f0, $f8, $10, $10, $f0, $00, $11, $10, $f8, $f8, $27, $10, $f8, $00, $28, $10
    db $80, $e8, $f8, $03, $10, $e8, $00, $04, $10, $eb, $08, $33, $10, $f0, $f8, $13
    db $10, $f0, $00, $14, $10, $f8, $f8, $23, $10, $f8, $00, $24, $10, $80, $e8, $f8
    db $03, $10, $e8, $00, $04, $10, $eb, $08, $33, $10, $f0, $f8, $13, $10, $f0, $00
    db $14, $10, $f8, $f8, $25, $10, $f8, $00, $26, $10, $80, $e8, $f8, $0b, $10, $e8
    db $00, $0c, $10, $f0, $f8, $1b, $10, $f0, $00, $1c, $10, $f2, $08, $33, $50, $f8
    db $f8, $2b, $10, $f8, $00, $2c, $10, $80, $e0, $f8, $30, $10, $e8, $f8, $0d, $10
    db $e8, $00, $0e, $10, $f0, $f8, $1d, $10, $f0, $00, $1e, $10, $f8, $f8, $2d, $10
    db $f8, $00, $2e, $10, $80, $e8, $f8, $00, $10, $e8, $00, $01, $10, $f0, $f8, $19
    db $10, $f0, $00, $1a, $10, $f8, $f8, $29, $10, $f8, $00, $2a, $10, $80, $e8, $f8
    db $03, $10, $e8, $00, $04, $10, $f0, $f0, $34, $10, $f0, $f8, $07, $10, $f0, $00
    db $08, $10, $f8, $f8, $23, $10, $f8, $00, $24, $10, $80, $e8, $f8, $00, $10, $e8
    db $00, $01, $10, $f0, $fa, $0f, $10, $f0, $02, $1f, $10, $f8, $f8, $23, $10, $f8
    db $00, $24, $10, $80, $e8, $f8, $04, $30, $e8, $00, $03, $30, $eb, $f4, $33, $30
    db $f0, $f8, $17, $10, $f0, $00, $18, $10, $f8, $f8, $26, $30, $f8, $00, $25, $30
    db $80, $e8, $f8, $04, $30, $e8, $00, $03, $30, $f0, $f8, $20, $10, $f0, $00, $21
    db $10, $f1, $08, $34, $30, $f8, $f8, $26, $30, $f8, $00, $25, $30, $80, $e8, $f8
    db $00, $10, $e8, $00, $01, $10, $e9, $f1, $33, $30, $f0, $f8, $15, $10, $f0, $00
    db $16, $10, $f8, $f8, $26, $30, $f8, $00, $25, $30, $80, $e8, $f8, $03, $10, $e8
    db $00, $04, $10, $ea, $f1, $33, $30, $f0, $f8, $12, $10, $f0, $00, $08, $10, $f8
    db $f8, $23, $10, $f8, $00, $24, $10, $80, $e8, $f8, $03, $10, $e8, $00, $04, $10
    db $ee, $f1, $33, $30, $f0, $f8, $07, $10, $f0, $00, $08, $10, $f8, $f8, $23, $10
    db $f8, $00, $24, $10, $80, $e8, $f8, $04, $30, $e8, $00, $03, $30, $eb, $06, $33
    db $10, $f0, $f8, $09, $10, $f0, $00, $0a, $10, $f8, $f8, $24, $30, $f8, $00, $23
    db $30, $80, $e8, $f8, $04, $30, $e8, $00, $03, $30, $ed, $07, $33, $10, $f0, $f8
    db $20, $10, $f0, $00, $21, $10, $f8, $f8, $24, $30, $f8, $00, $23, $30, $80, $e8
    db $f8, $04, $30, $e8, $00, $03, $30, $eb, $f4, $33, $30, $f0, $f8, $17, $10, $f0
    db $00, $18, $10, $f8, $f8, $24, $30, $f8, $00, $23, $30, $80, $e8, $f8, $03, $10
    db $e8, $00, $04, $10, $eb, $08, $33, $10, $f0, $f8, $02, $10, $f0, $00, $14, $10
    db $f8, $f8, $32, $10, $f8, $00, $24, $10, $80

Call_000_4cb1:
    ld b, $88                                     ; $4cb1: $06 $88
    ld a, [$c005]                                 ; $4cb3: $fa $05 $c0
    ld c, a                                       ; $4cb6: $4f
    ld a, [$c001]                                 ; $4cb7: $fa $01 $c0
    ld hl, $4cc3                                  ; $4cba: $21 $c3 $4c
    call Call_000_3047                            ; $4cbd: $cd $47 $30
    jp Jump_000_305a                              ; $4cc0: $c3 $5a $30


    db $f5, $4c, $12, $4d, $2f, $4d, $4c, $4d, $69, $4d, $86, $4d, $ab, $4d, $c8, $4d
    db $e9, $4d, $06, $4e, $27, $4e, $27, $4e, $5c, $4e, $8d, $4e, $be, $4e, $e3, $4e
    db $00, $4f, $1d, $4f, $42, $4f, $5f, $4f, $7c, $4f, $99, $4f, $b6, $4f, $d3, $4f
    db $f0, $4f, $e8, $f8, $0b, $00, $e8, $00, $0c, $00, $ef, $f2, $32, $20, $f0, $f8
    db $0d, $80, $f0, $00, $0e, $80, $f8, $f8, $0f, $80, $f8, $00, $10, $80, $80, $e8
    db $f8, $0b, $00, $e8, $00, $0c, $00, $f0, $f8, $11, $80, $f0, $00, $12, $80, $f2
    db $f7, $31, $80, $f8, $f8, $13, $80, $f8, $00, $14, $80, $80, $e8, $f8, $00, $00
    db $e8, $00, $01, $00, $f0, $f8, $02, $00, $f0, $00, $02, $20, $f0, $08, $32, $00
    db $f8, $f8, $03, $00, $f8, $00, $03, $20, $80, $e8, $f8, $0c, $20, $e8, $00, $0b
    db $20, $f2, $fe, $31, $20, $f0, $f8, $0e, $20, $f0, $00, $0d, $20, $f8, $f8, $10
    db $20, $f8, $00, $0f, $20, $80, $e8, $f8, $0c, $20, $e8, $00, $0b, $20, $ef, $05
    db $32, $00, $f0, $f8, $12, $20, $f0, $00, $11, $20, $f8, $f8, $14, $20, $f8, $00
    db $13, $20, $80, $e8, $f8, $1e, $00, $e8, $00, $1f, $00, $e9, $08, $32, $00, $f0
    db $f0, $20, $00, $f0, $f8, $21, $00, $f0, $00, $22, $00, $f0, $08, $20, $20, $f8
    db $f8, $23, $00, $f8, $00, $23, $20, $80, $e8, $f8, $15, $00, $e8, $00, $16, $00
    db $f0, $f8, $17, $00, $f0, $00, $18, $00, $f0, $07, $32, $00, $f8, $f8, $03, $00
    db $f8, $00, $03, $20, $80, $e6, $07, $32, $00, $e8, $f8, $19, $00, $e8, $00, $1a
    db $00, $ec, $f0, $1d, $00, $f0, $f8, $1b, $00, $f0, $00, $1c, $00, $f8, $f8, $08
    db $00, $f8, $00, $08, $20, $80, $e8, $f8, $16, $20, $e8, $00, $15, $20, $f0, $f8
    db $18, $20, $f0, $00, $17, $20, $f0, $08, $32, $00, $f8, $f8, $03, $00, $f8, $00
    db $03, $20, $80, $e7, $09, $32, $00, $e8, $f8, $1a, $20, $e8, $00, $19, $20, $ec
    db $08, $1d, $20, $f0, $f8, $1c, $20, $f0, $00, $1b, $20, $f8, $f8, $08, $00, $f8
    db $00, $08, $20, $80, $db, $09, $32, $00, $de, $f8, $33, $00, $de, $00, $24, $00
    db $e0, $f0, $25, $20, $e0, $08, $25, $00, $e6, $f8, $26, $20, $e6, $00, $26, $00
    db $ee, $f0, $27, $00, $ee, $f8, $28, $00, $ee, $00, $28, $20, $ee, $08, $27, $20
    db $f8, $f8, $29, $00, $f8, $00, $29, $20, $80, $dd, $07, $32, $00, $de, $f8, $19
    db $00, $de, $00, $1a, $00, $e1, $f0, $1d, $00, $e6, $f8, $1b, $00, $e6, $00, $1c
    db $00, $ee, $f0, $27, $00, $ee, $f8, $28, $00, $ee, $00, $28, $20, $ee, $08, $27
    db $20, $f8, $f8, $29, $00, $f8, $00, $29, $20, $80, $dd, $09, $32, $00, $de, $f8
    db $1a, $20, $de, $00, $19, $20, $e2, $08, $1d, $20, $e6, $f8, $1c, $20, $e6, $00
    db $1b, $20, $ee, $f0, $27, $00, $ee, $f8, $28, $00, $ee, $00, $28, $20, $ee, $08
    db $27, $20, $f8, $f8, $29, $00, $f8, $00, $29, $20, $80, $e8, $f0, $09, $20, $e8
    db $f8, $04, $00, $e8, $00, $05, $00, $e8, $08, $09, $00, $f0, $f8, $06, $00, $f0
    db $00, $07, $00, $f8, $f8, $08, $00, $f8, $00, $03, $20, $f8, $08, $32, $40, $80
    db $e8, $f8, $04, $00, $e8, $00, $05, $00, $f0, $f8, $34, $00, $f0, $00, $35, $00
    db $f8, $f8, $08, $00, $f8, $00, $03, $20, $f8, $08, $32, $40, $80, $e8, $f8, $2a
    db $00, $e8, $00, $2b, $00, $f0, $f8, $2c, $00, $f0, $00, $2d, $00, $f8, $f8, $36
    db $00, $f8, $00, $0a, $00, $f8, $05, $32, $40, $80, $e0, $00, $09, $00, $e8, $f8
    db $2a, $00, $e8, $00, $2b, $00, $e8, $08, $09, $00, $f0, $f8, $2e, $00, $f0, $00
    db $2f, $00, $f8, $f8, $13, $00, $f8, $00, $14, $00, $f8, $05, $32, $40, $80, $e8
    db $f8, $3d, $00, $e8, $00, $3e, $00, $f0, $f8, $3f, $00, $f0, $00, $40, $00, $f8
    db $f0, $32, $60, $f8, $f8, $41, $00, $f8, $00, $41, $20, $80, $e8, $f8, $0c, $20
    db $e8, $00, $0b, $20, $ee, $06, $32, $00, $f0, $f8, $0e, $a0, $f0, $00, $0d, $a0
    db $f8, $f8, $10, $a0, $f8, $00, $0f, $a0, $80, $e8, $f8, $0c, $20, $e8, $00, $0b
    db $20, $f0, $f8, $12, $a0, $f0, $00, $11, $a0, $f7, $fd, $32, $c0, $f8, $f8, $14
    db $a0, $f8, $00, $13, $a0, $80, $e8, $f8, $0c, $20, $e8, $00, $0b, $20, $f1, $00
    db $46, $00, $f0, $f8, $0e, $20, $f0, $00, $0d, $20, $f8, $f8, $10, $20, $f8, $00
    db $0f, $20, $80, $e8, $f8, $0c, $20, $e8, $00, $0b, $20, $f1, $00, $48, $00, $f0
    db $f8, $0e, $20, $f0, $00, $0d, $20, $f8, $f8, $10, $20, $f8, $00, $0f, $20, $80
    db $e8, $f8, $0b, $00, $e8, $00, $0c, $00, $f1, $f8, $4b, $00, $f0, $f8, $0d, $00
    db $f0, $00, $0e, $00, $f8, $f8, $0f, $00, $f8, $00, $10, $00, $80, $e8, $f8, $0b
    db $00, $e8, $00, $0c, $00, $f1, $f8, $4d, $00, $f0, $f8, $0d, $00, $f0, $00, $0e
    db $00, $f8, $f8, $0f, $00, $f8, $00, $10, $00, $80

Call_000_500d:
    ld b, $88                                     ; $500d: $06 $88
    ld a, [$c005]                                 ; $500f: $fa $05 $c0
    cpl                                           ; $5012: $2f
    inc a                                         ; $5013: $3c
    sub $60                                       ; $5014: $d6 $60
    ld c, a                                       ; $5016: $4f
    ld a, [$c001]                                 ; $5017: $fa $01 $c0
    ld hl, $5023                                  ; $501a: $21 $23 $50
    call Call_000_3047                            ; $501d: $cd $47 $30
    jp Jump_000_305a                              ; $5020: $c3 $5a $30


    db $ac, $50, $c9, $50, $2f, $4d, $4c, $4d, $69, $4d, $86, $4d, $ab, $4d, $c8, $4d
    db $e9, $4d, $06, $4e, $27, $4e, $27, $4e, $5c, $4e, $8d, $4e, $be, $4e, $e3, $4e
    db $00, $4f, $1d, $4f, $8f, $50, $55, $50, $72, $50, $e6, $50, $03, $51, $20, $51
    db $3d, $51, $e8, $f8, $37, $10, $e8, $00, $38, $10, $ef, $f2, $32, $30, $f0, $f8
    db $3b, $90, $f0, $00, $3c, $90, $f8, $f8, $0f, $90, $f8, $00, $10, $90, $80, $e8
    db $f8, $37, $10, $e8, $00, $38, $10, $f0, $f8, $39, $90, $f0, $00, $3a, $90, $f2
    db $f7, $31, $90, $f8, $f8, $13, $90, $f8, $00, $14, $90, $80, $e8, $f8, $42, $10
    db $e8, $00, $43, $10, $f0, $f8, $44, $10, $f0, $00, $45, $10, $f8, $f0, $32, $70
    db $f8, $f8, $41, $10, $f8, $00, $41, $30, $80, $e8, $f8, $38, $30, $e8, $00, $37
    db $30, $ee, $06, $32, $10, $f0, $f8, $3c, $b0, $f0, $00, $3b, $b0, $f8, $f8, $10
    db $b0, $f8, $00, $0f, $b0, $80, $e8, $f8, $38, $30, $e8, $00, $37, $30, $f0, $f8
    db $3a, $b0, $f0, $00, $39, $b0, $f7, $fd, $32, $d0, $f8, $f8, $14, $b0, $f8, $00
    db $13, $b0, $80, $e8, $f8, $37, $10, $e8, $00, $38, $10, $f1, $f8, $47, $10, $f0
    db $f8, $3b, $10, $f0, $00, $3c, $10, $f8, $f8, $0f, $10, $f8, $00, $10, $10, $80
    db $e8, $f8, $37, $10, $e8, $00, $38, $10, $f1, $f8, $49, $10, $f0, $f8, $3b, $10
    db $f0, $00, $3c, $10, $f8, $f8, $0f, $10, $f8, $00, $10, $10, $80, $e8, $f8, $38
    db $30, $e8, $00, $37, $30, $f1, $00, $4a, $10, $f0, $f8, $3c, $30, $f0, $00, $3b
    db $30, $f8, $f8, $10, $30, $f8, $00, $0f, $30, $80, $e8, $f8, $38, $30, $e8, $00
    db $37, $30, $f1, $00, $4c, $10, $f0, $f8, $3c, $30, $f0, $00, $3b, $30, $f8, $f8
    db $10, $30, $f8, $00, $0f, $30, $80, $f9, $20, $63, $99, $69, $67, $65, $6b, $6d
    db $f9, $20, $64, $99, $6a, $68, $66, $6c, $6e, $f9, $20, $76, $99, $80, $80, $80
    db $80, $80, $f9, $20, $77, $99, $80, $80, $80, $80, $80, $f9, $00, $f9, $20, $63
    db $99, $80, $80, $80, $80, $80, $f9, $20, $64, $99, $80, $80, $80, $80, $80, $f9
    db $20, $76, $99, $33, $35, $37, $3a, $3d, $f9, $20, $77, $99, $34, $36, $38, $3b
    db $3e, $f9, $00, $f9, $01, $84, $98, $e9, $e5, $da, $f2, $80, $da, $e0, $da, $e2
    db $e7, $cd, $f9, $00, $f9, $01, $63, $98, $e5, $de, $ef, $de, $e5, $f9, $01, $6b
    db $98, $dc, $e1, $da, $e6, $e9, $cd, $f9, $01, $c3, $98, $ed, $eb, $f2, $80, $e7
    db $de, $f1, $ed, $80, $e5, $de, $ef, $de, $e5, $f9, $00, $f9, $01, $46, $98, $f2
    db $e8, $ee, $80, $da, $eb, $de, $f9, $01, $84, $98, $ed, $e1, $de, $80, $e0, $eb
    db $de, $da, $ed, $de, $ec, $ed, $f9, $01, $c3, $98, $ed, $de, $e7, $e7, $e2, $ec
    db $80, $e9, $e5, $da, $f2, $de, $eb, $cd, $cd, $f9, $00, $f9, $01, $23, $98, $f9
    db $02, $0e, $27, $f9, $01, $63, $98, $f9, $02, $0e, $27, $f9, $01, $a3, $98, $f9
    db $02, $0e, $27, $f9, $01, $e3, $98, $f9, $02, $0e, $27, $f9, $20, $22, $98, $1b
    db $25, $1c, $25, $1c, $25, $1d, $f9, $20, $2b, $98, $1e, $25, $26, $25, $26, $25
    db $1f, $f9, $20, $2d, $98, $1e, $25, $26, $25, $26, $25, $1f, $f9, $20, $2f, $98
    db $1e, $25, $26, $25, $26, $25, $1f, $f9, $20, $31, $98, $20, $25, $21, $25, $21
    db $25, $22, $f9, $01, $44, $98, $e5, $de, $ef, $de, $e5, $f9, $01, $4c, $98, $d1
    db $25, $d2, $25, $d3, $f9, $20, $49, $99, $11, $13, $15, $17, $19, $80, $23, $24
    db $f9, $20, $4a, $99, $12, $14, $16, $18, $1a, $f9, $00

Call_000_528e:
    ld b, $ff                                     ; $528e: $06 $ff
    jr jr_000_5294                                ; $5290: $18 $02

Call_000_5292:
    ld b, $00                                     ; $5292: $06 $00

jr_000_5294:
    ld de, $9884                                  ; $5294: $11 $84 $98
    ldh a, [$ff96]                                ; $5297: $f0 $96
    and $03                                       ; $5299: $e6 $03
    cp $03                                        ; $529b: $fe $03
    jr z, jr_000_52bb                             ; $529d: $28 $1c

    ld hl, $52c9                                  ; $529f: $21 $c9 $52
    ld a, [hl]                                    ; $52a2: $7e
    ldh [$ffd3], a                                ; $52a3: $e0 $d3
    call Call_000_52b1                            ; $52a5: $cd $b1 $52
    ld hl, $52d0                                  ; $52a8: $21 $d0 $52

jr_000_52ab:
    ld a, [hl]                                    ; $52ab: $7e
    ldh [$ffd4], a                                ; $52ac: $e0 $d4
    ld de, $98c4                                  ; $52ae: $11 $c4 $98

Call_000_52b1:
jr_000_52b1:
    bit 7, b                                      ; $52b1: $cb $78
    ret nz                                        ; $52b3: $c0

    ld a, [hl+]                                   ; $52b4: $2a
    and a                                         ; $52b5: $a7
    ret z                                         ; $52b6: $c8

    ld [de], a                                    ; $52b7: $12
    inc de                                        ; $52b8: $13
    jr jr_000_52b1                                ; $52b9: $18 $f6

jr_000_52bb:
    ld hl, $52d0                                  ; $52bb: $21 $d0 $52
    ld a, [hl]                                    ; $52be: $7e
    ldh [$ffd3], a                                ; $52bf: $e0 $d3
    call Call_000_52b1                            ; $52c1: $cd $b1 $52
    ld hl, $52c9                                  ; $52c4: $21 $c9 $52
    jr jr_000_52ab                                ; $52c7: $18 $e2

    db $e9, $e5, $da, $f2, $de, $eb, $00, $dc, $e8, $e6, $e9, $cf, $00, $00, $00, $ff
    db $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $06, $00, $06
    db $00, $06, $00, $06, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $30, $00, $30
    db $00, $30, $00, $3f, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30
    db $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30, $00, $30
    db $00, $30, $00, $30, $00, $30, $00, $30, $00, $ff, $00, $ff, $00, $00, $ff, $40
    db $aa, $00, $ff, $40, $aa, $00, $ff, $40, $aa, $00, $ff, $9f, $ff, $60, $00, $60
    db $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60, $00, $60
    db $00, $60, $00, $60, $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $c0
    db $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $c0
    db $00, $c0, $00, $ff, $00, $ff, $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $c0
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $80, $00, $80
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $0c, $00, $0c
    db $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $80, $00, $80
    db $00, $80, $00, $80, $00, $80, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $00, $00, $ff
    db $00, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $ff, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18
    db $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $00, $18, $00, $18
    db $00, $18, $00, $18, $00, $18, $00, $00, $18, $ff, $00, $ff, $00, $00, $ff, $00
    db $aa, $00, $ff, $00, $aa, $00, $ff, $00, $aa, $00, $ff, $ff, $ff, $18, $e7, $18
    db $a2, $18, $e7, $18, $a2, $18, $e7, $18, $a2, $18, $e7, $e7, $ff, $00, $00, $00
    db $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00
    db $00, $00, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $18, $00, $18
    db $00, $18, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $0c, $00, $0c
    db $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $00, $00, $00
    db $00, $00, $00, $18, $00, $18, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $ff
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $c0, $00, $c0
    db $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $fc, $00, $fa, $01, $0c, $00, $0c
    db $00, $0c, $00, $fc, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c
    db $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c
    db $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $ff, $00, $ff, $00, $00, $ff, $04
    db $aa, $00, $ff, $04, $aa, $00, $ff, $04, $aa, $00, $ff, $f9, $ff, $06, $00, $06
    db $00, $06, $00, $06, $00, $06, $00, $06, $00, $06, $00, $06, $00, $06, $00, $06
    db $00, $06, $00, $06, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03
    db $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03
    db $00, $03, $00, $ff, $00, $ff, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $ff, $42
    db $b1, $02, $f1, $42, $b1, $02, $f1, $42, $b1, $02, $fd, $9e, $fd, $60, $00, $60
    db $00, $60, $00, $60, $00, $30, $00, $30, $00, $30, $00, $30, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $01, $00, $ff, $00, $ff, $00, $00, $00, $30, $00, $30
    db $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18, $00, $18
    db $00, $18, $00, $18, $00, $18, $00, $f8, $00, $f8, $00, $00, $00, $03, $00, $03
    db $00, $03, $00, $03, $00, $03, $00, $03, $00, $3f, $00, $9f, $40, $18, $00, $18
    db $00, $18, $00, $18, $00, $18, $00, $1f, $00, $1f, $00, $00, $00, $40, $ff, $84
    db $4a, $80, $4f, $84, $4a, $80, $4f, $84, $4a, $80, $7f, $b9, $7f, $00, $00, $00
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $07, $ff, $07
    db $ff, $0f, $ff, $0f, $ff, $0b, $ff, $0b, $ff, $11, $ff, $55, $ff, $00, $00, $00
    db $00, $07, $07, $08, $0b, $38, $39, $42, $7f, $1d, $1f, $13, $13, $00, $00, $00
    db $00, $c0, $c0, $20, $e0, $18, $f8, $06, $fe, $01, $ff, $01, $ff, $7b, $78, $ff
    db $80, $ff, $8e, $7f, $7e, $1f, $10, $0f, $0f, $0a, $0b, $34, $37, $fa, $fe, $fc
    db $64, $fc, $04, $f8, $18, $fc, $3c, $e4, $e2, $1e, $f1, $8e, $f9, $74, $57, $33
    db $33, $53, $52, $db, $da, $a3, $e1, $63, $60, $9b, $fb, $84, $fc, $e6, $fd, $ea
    db $39, $f2, $11, $f2, $31, $ce, $c1, $fe, $01, $e2, $e1, $02, $01, $ff, $00, $00
    db $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $78, $0e
    db $01, $06, $09, $07, $08, $06, $09, $06, $09, $0e, $01, $06, $09, $fe, $01, $06
    db $09, $06, $09, $fe, $01, $06, $09, $06, $f9, $06, $09, $06, $09, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fc, $00, $f0, $00, $c0, $07, $08, $06
    db $09, $0e, $01, $06, $09, $0e, $09, $06, $01, $07, $00, $06, $01, $fe, $01, $06
    db $09, $06, $f9, $06, $09, $fe, $f9, $fe, $f9, $fe, $01, $fe, $f9, $e8, $f7, $e0
    db $ff, $f4, $fb, $f4, $eb, $f0, $df, $ec, $db, $c4, $bf, $d5, $ff, $0f, $ff, $0f
    db $ff, $07, $ff, $c7, $3f, $27, $df, $2f, $df, $3f, $ff, $bf, $ff, $bf, $1f, $bf
    db $1f, $bf, $1f, $bf, $1f, $df, $0f, $df, $0f, $df, $0f, $ef, $07, $ef, $07, $ef
    db $07, $ef, $07, $f7, $03, $f7, $03, $f7, $03, $f7, $03, $fb, $01, $fb, $01, $fb
    db $01, $fb, $01, $fd, $00, $fd, $00, $fd, $00, $7d, $00, $7e, $00, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f, $7e, $00, $7e
    db $00, $7e, $00, $7f, $00, $3f, $00, $3f, $00, $3f, $00, $3f, $00, $3f, $00, $3f
    db $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $1f, $00, $ff, $7f, $ff
    db $7f, $ff, $7f, $7f, $3f, $7f, $3f, $7f, $3f, $7f, $3f, $bf, $1f, $0f, $00, $0f
    db $00, $0f, $00, $0f, $00, $0f, $00, $0f, $00, $07, $00, $07, $00, $bf, $1f, $bf
    db $1f, $bf, $1f, $df, $0f, $df, $0f, $df, $0f, $df, $0f, $ef, $07, $07, $00, $07
    db $00, $07, $00, $07, $00, $03, $00, $03, $00, $03, $00, $03, $00, $ef, $07, $ef
    db $07, $ef, $07, $f7, $03, $f7, $03, $f7, $03, $f7, $03, $fb, $01, $03, $00, $03
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $fb, $01, $fb
    db $01, $fb, $01, $fd, $00, $fd, $00, $fd, $00, $fd, $00, $fe, $00, $ff, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $7f, $00, $fe, $00, $fe
    db $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $3f, $00, $0f, $00, $03, $7f, $00, $7f
    db $00, $7f, $00, $7f, $00, $3f, $00, $3f, $00, $3f, $00, $3f, $00, $fd, $f8, $fd
    db $f8, $fd, $f8, $fd, $f8, $fb, $f0, $fb, $f0, $fb, $f0, $f7, $e0, $f7, $e0, $f7
    db $e0, $f7, $e0, $ef, $c0, $ef, $c0, $ef, $c0, $ef, $c0, $df, $80, $df, $80, $df
    db $80, $df, $80, $bf, $00, $bf, $00, $bf, $00, $be, $00, $7e, $00, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $7e, $00, $7e
    db $00, $7e, $00, $fe, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
    db $00, $f8, $00, $f8, $00, $f8, $00, $f8, $00, $f8, $00, $f8, $00, $ff, $fe, $ff
    db $fe, $ff, $fe, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $f8, $f0, $00, $f0
    db $00, $f0, $00, $f0, $00, $f0, $00, $f0, $00, $e0, $00, $e0, $00, $fd, $f8, $fd
    db $f8, $fd, $f8, $fb, $f0, $fb, $f0, $fb, $f0, $fb, $f0, $f7, $e0, $e0, $00, $e0
    db $00, $e0, $00, $e0, $00, $c0, $00, $c0, $00, $c0, $00, $c0, $00, $f7, $e0, $f7
    db $e0, $f7, $e0, $ef, $c0, $ef, $c0, $ef, $c0, $ef, $c0, $df, $80, $c0, $00, $c0
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $df, $80, $df
    db $80, $df, $80, $bf, $00, $bf, $00, $bf, $00, $bf, $00, $7f, $00, $ff, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $00, $fe, $00, $7f, $00, $7f
    db $00, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $00, $fe
    db $00, $fe, $00, $fe, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $ff, $fe, $fe
    db $fd, $fc, $fb, $f8, $f7, $f0, $ef, $e0, $df, $c0, $bf, $80, $7f, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $fc, $03, $f3, $0f, $cf, $3f, $3f, $00, $fc, $03
    db $f3, $0f, $cf, $3f, $3f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $e7, $3f, $d7
    db $3c, $cf, $38, $cf, $3c, $f3, $03, $ff, $00, $c7, $37, $c0, $20, $2e, $ea, $cc
    db $cc, $ca, $4a, $db, $5b, $c5, $87, $c6, $06, $d9, $df, $21, $3f, $5f, $7f, $3f
    db $26, $3f, $20, $1f, $18, $3f, $3c, $27, $47, $78, $8f, $71, $9f, $de, $1e, $ff
    db $01, $ff, $71, $fe, $7e, $f8, $08, $f0, $f0, $50, $d0, $2c, $ec, $00, $00, $00
    db $00, $03, $03, $04, $07, $18, $1f, $60, $7f, $80, $ff, $80, $ff, $00, $00, $00
    db $00, $e0, $e0, $10, $d0, $1c, $9c, $42, $fe, $b8, $f8, $c8, $c8, $ff, $00, $c0
    db $30, $c0, $30, $ff, $00, $c0, $30, $c0, $3f, $c0, $30, $c0, $30, $fe, $1e, $70
    db $80, $60, $90, $e0, $10, $60, $90, $60, $90, $70, $80, $60, $90, $ff, $00, $c0
    db $30, $c0, $3f, $c0, $30, $df, $3f, $df, $3f, $ff, $00, $ff, $3f, $e0, $10, $60
    db $90, $70, $80, $60, $90, $f0, $90, $e0, $80, $e0, $00, $60, $80, $ff, $00, $00
    db $00, $00, $ff, $55, $ff, $aa, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $07, $ff, $0f
    db $ff, $1f, $ff, $27, $ff, $63, $df, $c3, $3f, $01, $ff, $55, $ff, $00, $3f, $c0
    db $cf, $f0, $f3, $fc, $fc, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $3f, $c0, $cf, $f0, $f3, $fc, $fc, $ff, $7f, $7f
    db $bf, $3f, $df, $1f, $ef, $0f, $f7, $07, $fb, $03, $fd, $01, $fe, $e3, $ff, $c0
    db $ff, $84, $fb, $aa, $d5, $ff, $c1, $ff, $e3, $aa, $ff, $ff, $ff, $ff, $ff, $f8
    db $f7, $e0, $df, $e0, $df, $c0, $bf, $cc, $f3, $f6, $e9, $f7, $c8, $ff, $ff, $7f
    db $ff, $3f, $ff, $1f, $ff, $1f, $ff, $1f, $ff, $1f, $ff, $9f, $7f, $ff, $e0, $ef
    db $f0, $f8, $f9, $e4, $db, $c9, $be, $c2, $bd, $b2, $4d, $ba, $6f, $bf, $7f, $7f
    db $ff, $7f, $ff, $1f, $ff, $1f, $ff, $1f, $ff, $3f, $ff, $bf, $ff, $ff, $ff, $fe
    db $ff, $fe, $fd, $fc, $fb, $fc, $fb, $f8, $ff, $f8, $ff, $f9, $fe, $ff, $ff, $0f
    db $ff, $03, $ff, $03, $ff, $01, $ff, $33, $cf, $6f, $97, $ef, $13, $fd, $fe, $fe
    db $ff, $ff, $fe, $fe, $f9, $fc, $fb, $fc, $fb, $fe, $fd, $fd, $ff, $ff, $07, $f7
    db $0f, $1f, $9f, $27, $df, $93, $ff, $43, $ff, $4d, $f3, $5d, $f7, $ff, $ff, $ff
    db $ff, $fc, $ff, $f4, $fb, $e8, $f7, $e0, $ff, $e8, $f7, $e0, $ff, $ff, $ff, $ff
    db $ff, $3f, $ff, $0f, $ff, $07, $ff, $87, $ff, $c7, $ff, $07, $ff, $e0, $ff, $f0
    db $ff, $f8, $ff, $f4, $ef, $e6, $db, $e3, $dc, $c0, $bf, $d5, $ff, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00
    db $00, $0f, $0f, $10, $13, $3e, $3f, $40, $7f, $5f, $7f, $34, $30, $00, $00, $00
    db $00, $80, $80, $60, $e0, $10, $f0, $8c, $fc, $42, $fe, $c2, $fe, $1e, $1a, $3f
    db $20, $3f, $21, $3f, $3f, $1f, $18, $0f, $0f, $0a, $0b, $34, $37, $fc, $3c, $fc
    db $34, $fc, $84, $f8, $98, $fc, $3c, $e4, $e2, $1e, $f1, $8e, $f9, $00, $00, $00
    db $00, $0f, $0f, $10, $17, $70, $77, $40, $7f, $1c, $1f, $17, $13, $00, $00, $00
    db $00, $80, $80, $60, $e0, $18, $f8, $06, $fe, $01, $ff, $01, $ff, $3f, $39, $7f
    db $41, $7f, $58, $3f, $38, $1f, $10, $0f, $0f, $0a, $0b, $34, $37, $c2, $fe, $fc
    db $3c, $fc, $3c, $f8, $78, $fc, $fc, $e4, $e2, $1e, $f1, $8e, $f9, $00, $00, $00
    db $00, $01, $01, $06, $07, $08, $0f, $31, $3f, $42, $7f, $43, $7f, $00, $00, $00
    db $00, $f0, $f0, $08, $c8, $7c, $fc, $02, $fe, $fa, $fe, $2c, $0c, $3f, $3c, $3f
    db $2c, $3f, $21, $1f, $19, $3f, $3c, $27, $47, $78, $8f, $71, $9f, $78, $58, $fc
    db $04, $fc, $84, $fc, $fc, $f8, $18, $f0, $f0, $50, $d0, $2c, $ec, $00, $00, $00
    db $00, $01, $01, $06, $07, $18, $1f, $60, $7f, $80, $ff, $80, $ff, $00, $00, $00
    db $00, $f0, $f0, $08, $e8, $0e, $ee, $02, $fe, $38, $f8, $e8, $c8, $43, $7f, $3f
    db $3c, $3f, $3c, $1f, $1e, $3f, $3f, $27, $47, $78, $8f, $71, $9f, $fc, $9c, $fe
    db $82, $fe, $1a, $fc, $1c, $f8, $08, $f0, $f0, $50, $d0, $2c, $ec, $1e, $00, $3f
    db $00, $3f, $00, $3f, $00, $1e, $00, $18, $00, $20, $00, $00, $00, $78, $00, $fc
    db $00, $fc, $00, $fc, $00, $78, $00, $18, $00, $04, $00, $00, $00, $ff, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $03, $03, $03
    db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $ff, $ff, $ff
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff
    db $ff, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $00, $00, $01
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $00, $00, $80
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $00, $00, $00, $fc, $fc, $fe
    db $82, $ff, $99, $ff, $99, $fe, $82, $fc, $9c, $f0, $90, $f0, $f0, $18, $18, $3c
    db $24, $7e, $42, $ff, $99, $ff, $81, $ff, $99, $ff, $99, $e7, $e7, $66, $66, $ff
    db $99, $ff, $99, $ff, $99, $ff, $99, $ff, $99, $7e, $42, $3c, $3c, $3c, $3c, $7e
    db $42, $ff, $99, $7e, $46, $7e, $72, $ff, $99, $7e, $42, $3c, $3c, $fe, $fe, $ff
    db $81, $ff, $9f, $fe, $82, $fc, $9c, $fe, $9e, $ff, $81, $ff, $ff, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $fc, $07, $fc
    db $07, $ff, $07, $f8, $1f, $e0, $3f, $c7, $7f, $c7, $7e, $c6, $7c, $00, $ff, $70
    db $ff, $e8, $cf, $3c, $ff, $03, $ff, $fc, $ff, $ff, $9f, $f3, $00, $7f, $c0, $3f
    db $e0, $3f, $e0, $1f, $f0, $0f, $f8, $c7, $fc, $23, $fe, $e1, $ff, $e4, $3c, $fd
    db $1d, $ff, $07, $ff, $08, $ff, $10, $ff, $10, $ff, $10, $ff, $18, $63, $00, $ef
    db $8c, $6b, $08, $ef, $8c, $ff, $40, $ff, $03, $ff, $3f, $ff, $fe, $e1, $7f, $f9
    db $7f, $ff, $e6, $ff, $ea, $ff, $52, $ff, $12, $ff, $04, $ff, $18, $ff, $1f, $ff
    db $0b, $07, $24, $03, $23, $1c, $2c, $14, $3c, $14, $3c, $24, $3c, $ff, $fc, $87
    db $84, $87, $fc, $ff, $7b, $ff, $83, $ff, $ff, $ff, $ff, $81, $81, $ff, $20, $ff
    db $20, $c0, $c9, $e0, $e9, $30, $39, $28, $39, $28, $39, $24, $3d, $e0, $00, $c0
    db $00, $80, $00, $80, $00, $80, $00, $80, $00, $c0, $00, $e0, $00, $03, $00, $01
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $03, $00, $f0, $00, $f1
    db $00, $f9, $00, $fd, $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $e0, $00, $c0
    db $00, $8f, $0f, $86, $06, $86, $06, $86, $06, $c6, $06, $e7, $07, $00, $00, $00
    db $00, $cc, $cc, $4c, $4c, $16, $16, $16, $16, $96, $96, $96, $96, $00, $00, $00
    db $00, $7b, $7b, $31, $31, $31, $31, $31, $31, $31, $31, $31, $31, $00, $00, $00
    db $00, $bd, $bd, $19, $19, $18, $18, $18, $18, $18, $18, $18, $18, $03, $00, $01
    db $00, $fe, $fe, $32, $32, $30, $30, $30, $30, $31, $30, $33, $30, $e6, $06, $c6
    db $06, $86, $06, $86, $06, $86, $06, $8f, $0f, $c0, $00, $e0, $00, $bf, $bf, $23
    db $23, $23, $23, $23, $23, $23, $23, $77, $77, $00, $00, $00, $00, $31, $31, $31
    db $31, $31, $31, $31, $31, $31, $31, $9e, $9e, $00, $00, $00, $00, $18, $18, $18
    db $18, $18, $18, $18, $18, $19, $19, $3f, $3f, $00, $00, $00, $00, $33, $30, $31
    db $30, $30, $30, $30, $30, $30, $30, $78, $78, $01, $00, $03, $00, $00, $00, $00
    db $00, $f0, $f0, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $00, $00, $00
    db $00, $fe, $fe, $62, $62, $60, $60, $60, $60, $64, $64, $7c, $7c, $00, $00, $00
    db $00, $ff, $ff, $99, $99, $18, $18, $18, $18, $18, $18, $18, $18, $60, $60, $60
    db $60, $60, $60, $60, $60, $62, $62, $fe, $fe, $00, $00, $00, $00, $64, $64, $60
    db $60, $60, $60, $60, $60, $62, $62, $fe, $fe, $00, $00, $00, $00, $18, $18, $18
    db $18, $18, $18, $18, $18, $18, $18, $3c, $3c, $00, $00, $00, $00, $00, $00, $00
    db $00, $38, $38, $44, $44, $c6, $c6, $c6, $c6, $c6, $c6, $c6, $c6, $00, $00, $00
    db $00, $f7, $f7, $62, $62, $62, $62, $62, $62, $62, $62, $62, $62, $c6, $c6, $c6
    db $c6, $c6, $c6, $c6, $c6, $44, $44, $38, $38, $00, $00, $00, $00, $62, $62, $62
    db $62, $62, $62, $62, $62, $62, $62, $3c, $3c, $00, $00, $00, $00, $00, $00, $06
    db $06, $0e, $0e, $0c, $0c, $08, $08, $00, $00, $30, $30, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $0e, $0e, $08, $08, $00, $00, $18, $18, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $18, $18, $18, $18, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $66, $66, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $18
    db $18, $38, $38, $18, $18, $18, $18, $18, $18, $3c, $3c, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $0c, $0c, $38, $38, $60, $60, $7e, $7e, $00, $00, $00, $00, $7e
    db $7e, $08, $08, $3c, $3c, $06, $06, $66, $66, $3c, $3c, $00, $00, $00, $00, $1c
    db $1c, $2c, $2c, $4c, $4c, $7e, $7e, $0c, $0c, $0c, $0c, $00, $00, $00, $00, $7c
    db $7c, $40, $40, $7c, $7c, $06, $06, $66, $66, $3c, $3c, $00, $00, $00, $00, $3c
    db $3c, $60, $60, $7c, $7c, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $7e
    db $7e, $66, $66, $0c, $0c, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $3c, $3c, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $66, $66, $3e, $3e, $06, $06, $3c, $3c, $00, $00, $00, $00, $18
    db $18, $3c, $3c, $66, $66, $7e, $7e, $66, $66, $66, $66, $00, $00, $00, $00, $7c
    db $7c, $66, $66, $7c, $7c, $66, $66, $66, $66, $7e, $7e, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $60, $60, $60, $60, $66, $66, $3c, $3c, $00, $00, $00, $00, $7c
    db $7c, $66, $66, $66, $66, $66, $66, $66, $66, $7c, $7c, $00, $00, $00, $00, $7e
    db $7e, $60, $60, $7c, $7c, $60, $60, $60, $60, $7e, $7e, $00, $00, $00, $00, $7e
    db $7e, $60, $60, $7c, $7c, $60, $60, $60, $60, $60, $60, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $60, $60, $6e, $6e, $66, $66, $3e, $3e, $00, $00, $00, $00, $66
    db $66, $66, $66, $7e, $7e, $66, $66, $66, $66, $66, $66, $00, $00, $00, $00, $3c
    db $3c, $18, $18, $18, $18, $18, $18, $18, $18, $3c, $3c, $00, $00, $00, $00, $1e
    db $1e, $0c, $0c, $0c, $0c, $0c, $0c, $6c, $6c, $38, $38, $00, $00, $00, $00, $66
    db $66, $6c, $6c, $78, $78, $7c, $7c, $6e, $6e, $66, $66, $00, $00, $00, $00, $60
    db $60, $60, $60, $60, $60, $60, $60, $60, $60, $7e, $7e, $00, $00, $00, $00, $62
    db $62, $76, $76, $7e, $7e, $6a, $6a, $62, $62, $62, $62, $00, $00, $00, $00, $66
    db $66, $76, $76, $7e, $7e, $6e, $6e, $66, $66, $66, $66, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $66, $66, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $7c
    db $7c, $66, $66, $66, $66, $7c, $7c, $60, $60, $60, $60, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $66, $66, $7e, $7e, $64, $64, $3a, $3a, $00, $00, $00, $00, $7c
    db $7c, $66, $66, $66, $66, $7c, $7c, $66, $66, $66, $66, $00, $00, $00, $00, $3c
    db $3c, $66, $66, $38, $38, $0c, $0c, $66, $66, $3c, $3c, $00, $00, $00, $00, $7e
    db $7e, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00, $66
    db $66, $66, $66, $66, $66, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $62
    db $62, $62, $62, $62, $62, $62, $62, $34, $34, $18, $18, $00, $00, $00, $00, $62
    db $62, $6a, $6a, $6a, $6a, $6a, $6a, $7e, $7e, $34, $34, $00, $00, $00, $00, $62
    db $62, $74, $74, $38, $38, $1c, $1c, $2e, $2e, $46, $46, $00, $00, $00, $00, $62
    db $62, $76, $76, $3c, $3c, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00, $7e
    db $7e, $0c, $0c, $18, $18, $30, $30, $60, $60, $7e, $7e, $00, $00, $00, $00, $00
    db $00, $7e, $7e, $00, $00, $00, $00, $7e, $7e, $00, $00, $00, $00, $10, $10, $10
    db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10
    db $10, $10, $10, $10, $10, $ff, $ff, $10, $10, $10, $10, $10, $10, $00, $00, $00
    db $00, $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $1c, $1c, $22
    db $22, $5d, $5d, $51, $51, $5d, $5d, $22, $22, $1c, $1c, $00, $00, $78, $78, $d4
    db $d4, $ac, $ac, $d4, $d4, $ac, $ac, $7a, $7a, $07, $07, $03, $03, $c6, $c6, $e6
    db $e6, $e6, $e6, $d6, $d6, $d6, $d6, $ce, $ce, $ce, $ce, $c6, $c6, $c0, $c0, $c0
    db $c0, $00, $00, $db, $db, $dd, $dd, $d9, $d9, $d9, $d9, $d9, $d9, $00, $00, $30
    db $30, $78, $78, $33, $33, $b6, $b6, $b7, $b7, $b6, $b6, $b3, $b3, $00, $00, $00
    db $00, $00, $00, $cd, $cd, $6e, $6e, $ec, $ec, $0c, $0c, $ec, $ec, $01, $01, $01
    db $01, $01, $01, $8f, $8f, $d9, $d9, $d9, $d9, $d9, $d9, $cf, $cf, $80, $80, $80
    db $80, $80, $80, $9e, $9e, $b3, $b3, $b3, $b3, $b3, $b3, $9e, $9e, $00, $00, $00
    db $00, $00, $00, $07, $07, $1f, $1f, $1f, $1f, $3f, $3f, $39, $38, $00, $00, $00
    db $00, $00, $00, $e0, $e0, $f0, $f0, $f8, $f8, $f8, $b8, $98, $18, $16, $10, $1f
    db $19, $1f, $14, $1f, $10, $0f, $0f, $04, $07, $1f, $18, $3f, $21, $00, $00, $00
    db $00, $00, $00, $07, $07, $1f, $1f, $3f, $3f, $3f, $3e, $36, $30, $00, $00, $00
    db $00, $00, $00, $e0, $e0, $e0, $e0, $f8, $f8, $f8, $78, $78, $38, $19, $10, $1b
    db $12, $1f, $11, $ff, $f0, $ff, $9f, $f8, $8f, $7c, $47, $38, $3f, $98, $08, $d8
    db $48, $f8, $08, $f0, $10, $f0, $f0, $38, $e8, $fc, $c4, $fc, $84, $16, $10, $1f
    db $19, $1f, $14, $bf, $b0, $ff, $cf, $fc, $87, $7a, $7b, $02, $03, $78, $18, $78
    db $38, $f0, $30, $f8, $38, $dc, $e4, $1c, $f4, $7c, $c4, $7c, $c4, $1e, $18, $1e
    db $1c, $0f, $0c, $0f, $0f, $08, $0f, $10, $1f, $10, $1f, $10, $1f, $68, $08, $f8
    db $98, $fc, $2c, $fe, $0a, $fe, $f2, $3c, $e4, $38, $e8, $70, $f0, $00, $00, $00
    db $00, $03, $03, $07, $07, $0f, $0f, $1f, $1f, $1f, $19, $0f, $09, $00, $00, $00
    db $00, $f0, $f0, $f0, $f0, $fc, $fc, $fc, $fc, $bc, $9c, $3c, $1c, $3c, $3c, $1b
    db $1b, $3f, $2f, $3f, $2f, $7f, $4f, $7c, $4c, $7c, $48, $3d, $29, $00, $00, $f0
    db $f0, $f8, $f8, $fc, $fc, $fc, $9c, $cc, $0c, $cc, $04, $ec, $24, $66, $40, $6f
    db $49, $7f, $44, $7f, $41, $3e, $3f, $5e, $73, $5f, $71, $3e, $3f, $19, $10, $1b
    db $12, $1f, $11, $1f, $10, $0f, $0f, $1c, $1f, $1e, $13, $1f, $10, $98, $08, $dc
    db $5c, $fe, $2a, $fd, $55, $fb, $ab, $d5, $fd, $ba, $ea, $fc, $d4, $16, $10, $7f
    db $79, $7f, $54, $7f, $50, $3f, $2f, $1c, $1f, $02, $03, $03, $03, $16, $10, $1f
    db $19, $1f, $14, $1f, $10, $0f, $0f, $1f, $19, $3f, $20, $1f, $1f, $78, $18, $78
    db $38, $f7, $37, $ff, $f9, $1f, $f1, $0e, $fa, $8c, $fc, $08, $f8, $19, $10, $fb
    db $f2, $ff, $90, $ff, $98, $f7, $df, $30, $3f, $10, $1f, $10, $1f, $98, $08, $d8
    db $48, $f8, $88, $f8, $08, $f0, $f0, $38, $e8, $7c, $c4, $3c, $fc, $1e, $18, $1e
    db $1c, $0f, $0c, $1f, $1f, $28, $3f, $28, $3f, $30, $3f, $10, $1f, $68, $08, $f8
    db $98, $f8, $28, $f8, $88, $70, $f0, $38, $e8, $38, $e8, $30, $f0, $19, $10, $1b
    db $12, $1f, $11, $1f, $18, $3f, $27, $3f, $21, $3f, $23, $1e, $1b, $98, $08, $d8
    db $48, $f8, $08, $f8, $08, $f0, $f0, $f8, $f8, $5c, $f4, $be, $ea, $0f, $09, $07
    db $04, $07, $05, $02, $03, $04, $07, $04, $07, $04, $07, $03, $03, $3c, $04, $fe
    db $8e, $7f, $f9, $1f, $ff, $10, $f0, $10, $f0, $10, $f0, $f0, $f0, $3f, $3c, $17
    db $1c, $0b, $0f, $08, $0f, $08, $0f, $0c, $0f, $13, $1f, $10, $1f, $fc, $84, $fc
    db $04, $f8, $f8, $04, $fc, $1e, $fa, $1e, $f2, $df, $f1, $2e, $ee, $7c, $7c, $56
    db $56, $eb, $ab, $d5, $75, $ab, $fb, $56, $fe, $ac, $fc, $f8, $f8, $1e, $18, $1e
    db $1c, $0f, $0c, $0f, $0f, $38, $3f, $70, $5f, $f0, $9f, $70, $7f, $68, $08, $f8
    db $98, $f8, $28, $f8, $08, $fd, $fd, $7f, $c3, $7f, $c3, $7c, $fc, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $38, $38, $7c, $7c, $38, $38, $01, $01, $01
    db $01, $03, $03, $03, $02, $03, $02, $1f, $1f, $3c, $3c, $1f, $1f, $f8, $f8, $08
    db $f8, $88, $f8, $d0, $70, $f8, $28, $ec, $ec, $3e, $3e, $f8, $f8, $03, $03, $04
    db $07, $0e, $0f, $1f, $13, $1f, $11, $1f, $1f, $21, $21, $1f, $1f, $f8, $f8, $08
    db $f8, $18, $f8, $ff, $ef, $7d, $45, $fd, $e5, $fd, $fd, $ff, $ff, $0f, $08, $0b
    db $0c, $10, $1f, $1d, $17, $3e, $22, $3f, $3f, $23, $23, $1f, $1f, $f8, $f8, $90
    db $70, $08, $f8, $b8, $e8, $7c, $44, $fc, $fc, $c4, $c4, $f8, $f8, $0f, $0f, $0a
    db $0f, $09, $0f, $05, $07, $07, $04, $1f, $1f, $3c, $3c, $1f, $1f, $5e, $f6, $ac
    db $ec, $54, $f4, $a8, $e8, $f0, $70, $d8, $d8, $3c, $3c, $f8, $f8, $02, $03, $02
    db $03, $03, $03, $03, $03, $01, $01, $1e, $1e, $3f, $3f, $1f, $1f, $08, $f8, $08
    db $f8, $f0, $f0, $f0, $10, $f8, $88, $f8, $f8, $0c, $0c, $fe, $fe, $1e, $1f, $1f
    db $13, $0f, $0a, $0f, $0f, $09, $09, $1f, $1f, $3f, $3f, $1f, $1f, $20, $e0, $e0
    db $e0, $f0, $30, $f0, $10, $d0, $d0, $38, $38, $fc, $fc, $f8, $f8, $00, $00, $00
    db $00, $00, $00, $00, $18, $00, $24, $00, $18, $00, $00, $00, $00, $3c, $3c, $56
    db $56, $ab, $ab, $d5, $d5, $ab, $ab, $d5, $d5, $ab, $ab, $56, $56, $00, $00, $38
    db $38, $54, $6c, $7c, $44, $54, $6c, $38, $38, $00, $00, $00, $00, $1f, $1f, $01
    db $01, $02, $03, $03, $02, $03, $02, $1e, $1f, $3c, $3c, $1f, $1f, $1c, $1c, $2a
    db $2a, $55, $55, $ab, $ab, $d5, $d5, $aa, $aa, $d4, $d4, $f8, $f8, $00, $00, $3e
    db $3e, $55, $55, $aa, $aa, $d5, $d5, $aa, $aa, $55, $55, $3e, $3e, $0f, $0f, $08
    db $0f, $08, $0f, $08, $0f, $0f, $09, $19, $19, $3f, $3f, $1f, $1f, $f0, $f0, $10
    db $f0, $10, $f0, $f0, $90, $f8, $88, $88, $f8, $8c, $8c, $f8, $f8, $30, $30, $78
    db $48, $fc, $84, $fc, $84, $78, $48, $30, $30, $00, $00, $00, $00, $38, $38, $7c
    db $44, $fe, $82, $fe, $82, $fe, $82, $7c, $44, $38, $38, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07
    db $07, $1f, $1f, $1f, $1f, $1f, $1f, $3f, $2f, $3f, $30, $3f, $3f, $00, $00, $e0
    db $e0, $f0, $f0, $fc, $fc, $fc, $fc, $f8, $f0, $f8, $08, $f8, $f8, $00, $00, $13
    db $13, $0f, $0f, $0f, $0f, $1f, $1f, $1f, $1c, $1f, $13, $1f, $1f, $00, $00, $f0
    db $f0, $fc, $fc, $fe, $fe, $ff, $c7, $fd, $3d, $e4, $e4, $e4, $04, $1f, $1f, $3f
    db $3f, $7f, $7e, $7f, $79, $ff, $f7, $7f, $6c, $7f, $58, $3f, $3c, $f0, $f0, $e0
    db $a0, $e0, $60, $fe, $fe, $be, $32, $9e, $12, $9c, $14, $fc, $0c, $07, $07, $1f
    db $1f, $1f, $1f, $1f, $1f, $3f, $2f, $3f, $30, $3f, $3f, $1f, $1f, $fc, $fc, $fe
    db $f2, $fe, $fe, $ff, $f9, $ff, $f1, $ff, $09, $ff, $f9, $fe, $fe, $0f, $0e, $07
    db $07, $1f, $1f, $3c, $2f, $78, $4f, $70, $5f, $70, $7f, $1c, $1f, $ec, $0c, $fe
    db $02, $fc, $e4, $38, $f8, $7c, $fc, $7f, $f3, $7f, $f1, $3f, $ff, $23, $3f, $20
    db $3f, $f8, $e7, $bd, $a3, $9e, $a2, $9f, $a7, $9f, $9f, $ff, $ff, $c0, $c0, $30
    db $f0, $38, $c8, $78, $88, $fc, $8c, $c6, $fe, $82, $82, $fc, $fc, $37, $30, $7f
    db $40, $3f, $20, $1f, $1f, $3c, $3f, $fc, $cf, $fc, $87, $fa, $fb, $f0, $70, $f0
    db $f0, $e0, $e0, $1c, $fc, $3e, $fa, $3f, $f1, $1f, $f1, $3e, $fe, $ec, $0c, $ff
    db $03, $ff, $e7, $3f, $f9, $7f, $f1, $7e, $f2, $7c, $fc, $30, $f0, $c6, $c6, $40
    db $c0, $a0, $e0, $e0, $a0, $40, $c0, $3c, $3c, $fe, $fe, $fc, $fc, $5f, $5f, $af
    db $af, $df, $df, $b8, $bf, $70, $7f, $70, $5f, $70, $4f, $37, $2f, $f8, $f8, $f0
    db $f0, $f8, $f8, $1c, $fc, $0e, $fe, $0e, $fa, $0e, $f2, $ec, $f4, $ef, $ee, $ff
    db $9f, $ff, $87, $7e, $47, $3e, $2f, $1c, $1f, $10, $1f, $1c, $1f, $ec, $0c, $fe
    db $02, $fc, $04, $f8, $f8, $1e, $f6, $1f, $f1, $1f, $f9, $27, $e7, $7f, $7c, $ff
    db $87, $ff, $83, $ff, $e3, $1e, $1f, $08, $0f, $0f, $0f, $08, $0f, $f8, $18, $f8
    db $f8, $30, $f0, $10, $f0, $10, $f0, $30, $f0, $d0, $f0, $10, $f0, $1f, $1f, $37
    db $3f, $30, $3f, $78, $7f, $f8, $df, $f8, $8f, $f7, $97, $68, $6f, $fe, $fe, $dc
    db $fc, $1c, $fc, $08, $f8, $08, $f8, $f8, $f8, $08, $f8, $08, $f8, $1f, $1f, $18
    db $1f, $30, $3f, $70, $7f, $f0, $9f, $f7, $9f, $f8, $9f, $70, $7f, $f8, $f8, $f0
    db $f0, $10, $f0, $08, $f8, $08, $f8, $88, $f8, $70, $f0, $10, $f0, $7f, $7f, $df
    db $df, $af, $af, $d0, $df, $b0, $bf, $70, $5f, $e0, $bf, $7c, $7f, $f8, $f8, $f0
    db $f0, $f0, $f0, $18, $f8, $18, $f8, $18, $f8, $10, $f0, $20, $e0, $3f, $3f, $1f
    db $1f, $0f, $0f, $07, $07, $0f, $0f, $3f, $31, $3f, $21, $3e, $3f, $f8, $f8, $f7
    db $f7, $ff, $f9, $9f, $f1, $8e, $fa, $8c, $fc, $08, $f8, $78, $f8, $ec, $0c, $fe
    db $02, $fc, $e4, $18, $f8, $3f, $ff, $3e, $fa, $3c, $f4, $38, $f8, $1f, $1f, $0f
    db $0f, $1f, $1f, $18, $1f, $30, $3f, $30, $3f, $30, $2f, $37, $2f, $18, $1f, $10
    db $1f, $10, $1f, $39, $27, $3e, $22, $23, $3f, $43, $43, $7f, $7f, $18, $f8, $08
    db $f8, $08, $f8, $9c, $e4, $7c, $44, $c4, $fc, $c2, $c2, $fe, $fe, $23, $3f, $20
    db $3f, $2f, $30, $1f, $10, $1f, $11, $21, $3f, $60, $60, $3f, $3f, $c0, $c0, $40
    db $c0, $a0, $e0, $e0, $a0, $40, $c0, $3c, $3c, $fe, $fe, $fc, $fc, $08, $0f, $08
    db $0f, $0f, $08, $0f, $08, $1f, $10, $30, $3f, $60, $60, $3f, $3f, $30, $f0, $70
    db $b0, $e0, $60, $e0, $60, $a0, $e0, $9c, $9c, $7e, $7e, $fc, $fc, $08, $0f, $0f
    db $09, $0f, $09, $1f, $11, $12, $1f, $32, $32, $7f, $7f, $3f, $3f, $08, $f8, $08
    db $f8, $f0, $10, $f0, $10, $70, $90, $3c, $7c, $1e, $1e, $fc, $fc, $a8, $af, $db
    db $dc, $af, $a8, $7f, $78, $04, $07, $3c, $3c, $78, $78, $3f, $3f, $10, $f0, $90
    db $f0, $e0, $a0, $c0, $40, $40, $c0, $7c, $7c, $fe, $fe, $fc, $fc, $37, $30, $7f
    db $40, $3f, $20, $1f, $1f, $1f, $18, $1f, $18, $0f, $0c, $04, $07, $f0, $70, $fe
    db $fe, $bc, $e4, $fc, $04, $fc, $04, $dc, $2c, $08, $f8, $38, $f8, $37, $30, $7f
    db $40, $3f, $20, $1f, $1f, $7c, $7f, $3c, $27, $3c, $37, $0e, $0f, $37, $30, $ff
    db $c0, $ff, $a0, $ff, $9f, $fc, $ef, $1c, $1f, $04, $07, $02, $03, $ec, $0c, $fe
    db $02, $fc, $04, $f8, $f8, $1c, $f4, $1e, $f2, $1f, $f1, $2f, $e9, $f8, $f8, $f0
    db $f0, $fc, $fc, $1f, $ff, $0f, $fd, $0f, $f9, $0e, $fe, $e8, $f8, $18, $1f, $10
    db $1f, $10, $1f, $1f, $11, $11, $11, $31, $31, $71, $71, $3f, $3f, $18, $f8, $08
    db $f8, $08, $f8, $98, $e8, $f8, $88, $8c, $fc, $86, $86, $fc, $fc, $00, $00, $00
    db $00, $07, $07, $0f, $0f, $3f, $3f, $3f, $31, $1f, $0f, $19, $18, $00, $00, $00
    db $00, $c0, $c0, $f0, $f0, $f8, $f8, $f8, $08, $f8, $f0, $98, $98, $16, $10, $1f
    db $19, $1b, $14, $1f, $10, $0f, $0f, $07, $07, $1f, $18, $3f, $21, $00, $00, $00
    db $00, $03, $03, $0f, $0f, $1f, $1f, $3f, $38, $3f, $3f, $56, $50, $00, $00, $00
    db $00, $c8, $c8, $f0, $f0, $f0, $f0, $f8, $38, $f8, $c8, $78, $70, $39, $30, $3b
    db $22, $1e, $11, $ff, $f0, $ff, $9f, $f8, $9f, $78, $4f, $38, $3f, $98, $08, $dc
    db $44, $f8, $08, $f0, $10, $f0, $f0, $78, $e8, $7c, $84, $7c, $84, $16, $10, $1f
    db $19, $1b, $14, $bf, $b0, $ff, $cf, $fe, $87, $7a, $7b, $02, $03, $78, $38, $78
    db $18, $f0, $30, $f8, $38, $fc, $e4, $3c, $e4, $3c, $c4, $3c, $c4, $1e, $1c, $1e
    db $18, $0f, $0c, $0f, $0f, $08, $0f, $10, $1f, $10, $1f, $10, $1f, $68, $08, $f8
    db $98, $dc, $2c, $fe, $0a, $fe, $f2, $fc, $e4, $78, $e8, $70, $f0, $00, $00, $00
    db $00, $07, $07, $1f, $1c, $07, $07, $0f, $0f, $0f, $09, $0f, $09, $00, $00, $00
    db $00, $f4, $f4, $f8, $18, $fc, $ec, $fc, $f4, $bc, $98, $3c, $1c, $3c, $3c, $1b
    db $1b, $3f, $2f, $3f, $2c, $7f, $4b, $7c, $4c, $7c, $48, $3d, $29, $00, $00, $f0
    db $f0, $f8, $f8, $fc, $8c, $fc, $f4, $cc, $48, $cc, $04, $ee, $22, $e6, $c0, $ef
    db $89, $7b, $44, $7f, $41, $3e, $3f, $7e, $63, $7f, $61, $3e, $3f, $39, $30, $3b
    db $22, $1e, $11, $1f, $10, $0f, $0f, $1c, $1f, $1e, $13, $1f, $10, $98, $08, $dc
    db $5c, $fa, $2a, $fd, $55, $fb, $ab, $d5, $fd, $ba, $ea, $fc, $d4, $16, $10, $7f
    db $79, $7b, $54, $7f, $50, $3f, $2f, $1e, $1f, $02, $03, $02, $03, $16, $10, $1f
    db $19, $1b, $14, $1f, $10, $0f, $0f, $1f, $19, $3f, $20, $1f, $1f, $78, $38, $78
    db $18, $f7, $37, $ff, $f9, $df, $f9, $ce, $fa, $cc, $fc, $88, $f8, $39, $30, $fb
    db $e2, $ff, $90, $ff, $98, $ff, $df, $38, $3f, $10, $1f, $10, $1f, $98, $08, $dc
    db $44, $78, $88, $f8, $08, $f0, $f0, $38, $f8, $3c, $e4, $7c, $fc, $1e, $1c, $1e
    db $18, $0f, $0c, $1f, $1f, $38, $3f, $38, $3f, $30, $3f, $10, $1f, $68, $08, $f8
    db $98, $d8, $28, $f8, $88, $70, $f0, $78, $e8, $78, $e8, $30, $f0, $39, $30, $3b
    db $22, $1e, $11, $1f, $18, $3f, $27, $3f, $21, $3f, $23, $1e, $1b, $98, $08, $dc
    db $44, $f8, $08, $f8, $08, $f0, $f0, $f8, $f8, $7c, $f4, $be, $ea, $0f, $09, $07
    db $04, $07, $05, $03, $03, $05, $07, $04, $07, $04, $07, $03, $03, $3c, $04, $fe
    db $8e, $ff, $f9, $df, $ff, $90, $f0, $10, $f0, $10, $f0, $f0, $f0, $3f, $3c, $1f
    db $1c, $0f, $0f, $08, $0f, $08, $0f, $0c, $0f, $13, $1f, $10, $1f, $7c, $84, $fc
    db $04, $f8, $f8, $3c, $fc, $1e, $f2, $0e, $f2, $df, $f1, $2e, $ee, $7c, $7c, $56
    db $56, $eb, $ab, $d5, $75, $ab, $fb, $56, $fe, $ac, $fc, $f8, $f8, $1e, $1c, $1e
    db $18, $0f, $0c, $0f, $0f, $39, $3f, $70, $5f, $f0, $9f, $70, $7f, $68, $08, $f8
    db $98, $d8, $28, $f8, $08, $fd, $fd, $ff, $c3, $ff, $c3, $7c, $fc, $00, $00, $07
    db $07, $0f, $0f, $1f, $1f, $1f, $1f, $3f, $3f, $3f, $3f, $3f, $3f, $00, $00, $e0
    db $e0, $f8, $f8, $f8, $f8, $fc, $fc, $fc, $fc, $f8, $f8, $f8, $f8, $00, $00, $01
    db $01, $03, $03, $0f, $0f, $0f, $0f, $1f, $1f, $1f, $1f, $1f, $1e, $00, $00, $e0
    db $e0, $f8, $f8, $fc, $fc, $fe, $fe, $fe, $f6, $e6, $86, $e4, $04, $0f, $0f, $3f
    db $3f, $3f, $3f, $3f, $3f, $7f, $7f, $7f, $7c, $7f, $78, $3f, $3c, $e0, $e0, $f8
    db $f8, $f8, $f8, $fe, $de, $be, $32, $9e, $12, $9c, $14, $fc, $0c, $07, $07, $0f
    db $0f, $1f, $1f, $1f, $1f, $3f, $3f, $3f, $3f, $3f, $3f, $1f, $1f, $fc, $fc, $fe
    db $f2, $fe, $fe, $ff, $fd, $ff, $fd, $ff, $f9, $ff, $f9, $ff, $ff, $0f, $0f, $07
    db $07, $1f, $1f, $34, $2f, $78, $4f, $70, $5f, $70, $7f, $1c, $1f, $ec, $0c, $fe
    db $02, $fc, $e4, $18, $f8, $1c, $f4, $1f, $f3, $7f, $e1, $3f, $ff, $23, $3f, $20
    db $3f, $f8, $ff, $bd, $a7, $be, $a2, $bf, $a7, $9f, $9f, $ff, $ff, $c0, $c0, $30
    db $f0, $38, $e8, $78, $c8, $fc, $8c, $fe, $fe, $82, $82, $fc, $fc, $37, $30, $7f
    db $40, $3f, $20, $1f, $1f, $30, $3f, $f8, $cf, $fc, $87, $fa, $fb, $f0, $f0, $f0
    db $f0, $e0, $e0, $1c, $fc, $0e, $fa, $1f, $f1, $1f, $f1, $3e, $fe, $ec, $0c, $ff
    db $03, $ff, $e7, $1f, $f9, $1f, $f1, $1e, $f2, $0c, $fc, $30, $f0, $c6, $c6, $40
    db $c0, $a0, $e0, $e0, $a0, $40, $c0, $3c, $3c, $fe, $fe, $fc, $fc, $5f, $5f, $af
    db $af, $df, $df, $a0, $bf, $70, $5f, $78, $4f, $78, $4f, $37, $2f, $f0, $f0, $f0
    db $f0, $f8, $f8, $04, $fc, $0e, $fa, $1e, $f2, $1e, $f2, $ec, $f4, $ef, $ef, $ff
    db $9f, $fb, $8f, $7c, $47, $38, $2f, $10, $1f, $10, $1f, $1c, $1f, $ec, $0c, $fe
    db $02, $fc, $04, $f8, $f8, $1e, $f6, $1f, $f1, $1f, $f9, $27, $e7, $7f, $7c, $ff
    db $87, $fe, $83, $fe, $e3, $1c, $1f, $08, $0f, $0f, $0f, $08, $0f, $f8, $18, $e8
    db $f8, $10, $f0, $10, $f0, $10, $f0, $30, $f0, $d0, $f0, $10, $f0, $0f, $0f, $17
    db $1f, $20, $3f, $60, $7f, $f8, $df, $f8, $8f, $f7, $97, $68, $6f, $f2, $fe, $c2
    db $fe, $0c, $fc, $08, $f8, $08, $f8, $f8, $f8, $08, $f8, $08, $f8, $1f, $1f, $18
    db $1f, $20, $3f, $50, $7f, $f0, $9f, $f7, $9f, $f8, $9f, $70, $7f, $f8, $f8, $f0
    db $f0, $10, $f0, $08, $f8, $08, $f8, $88, $f8, $70, $f0, $10, $f0, $7f, $7f, $df
    db $df, $af, $af, $d0, $df, $b0, $bf, $70, $5f, $e0, $bf, $7c, $7f, $f8, $f8, $f0
    db $f0, $f0, $f0, $08, $f8, $08, $f8, $08, $f8, $10, $f0, $20, $e0, $3f, $3f, $1f
    db $1f, $0f, $0f, $06, $07, $08, $0f, $3e, $37, $3f, $21, $3e, $3f, $f8, $f8, $f7
    db $f7, $ff, $f9, $1f, $f1, $0e, $fa, $0c, $fc, $08, $f8, $78, $f8, $ec, $0c, $fe
    db $02, $fc, $e4, $18, $f8, $07, $ff, $0e, $fa, $1c, $f4, $38, $f8, $1f, $1f, $0f
    db $0f, $1f, $1f, $10, $1f, $20, $3f, $30, $3f, $38, $2f, $37, $2f, $18, $1f, $10
    db $1f, $18, $1f, $3d, $27, $3e, $22, $3f, $3f, $43, $43, $7f, $7f, $18, $f8, $08
    db $f8, $18, $f8, $bc, $e4, $7c, $44, $fc, $fc, $c2, $c2, $fe, $fe, $23, $3f, $20
    db $3f, $2f, $3f, $1f, $10, $1f, $11, $3f, $3f, $60, $60, $3f, $3f, $c0, $c0, $40
    db $c0, $20, $e0, $e0, $a0, $40, $c0, $3c, $3c, $fe, $fe, $fc, $fc, $08, $0f, $08
    db $0f, $0f, $0f, $0f, $08, $1f, $10, $3f, $3f, $60, $60, $3f, $3f, $30, $f0, $70
    db $f0, $e0, $a0, $e0, $60, $a0, $e0, $9c, $9c, $7e, $7e, $fc, $fc, $0e, $0f, $0f
    db $09, $0f, $09, $1f, $11, $1f, $1f, $32, $32, $7f, $7f, $3f, $3f, $08, $f8, $e8
    db $f8, $f0, $10, $f0, $10, $f0, $90, $7c, $7c, $1e, $1e, $fc, $fc, $ab, $af, $df
    db $dc, $af, $a8, $7f, $78, $07, $07, $3c, $3c, $78, $78, $3f, $3f, $10, $f0, $90
    db $f0, $e0, $a0, $c0, $40, $c0, $c0, $7c, $7c, $fe, $fe, $fc, $fc, $37, $30, $7f
    db $40, $3f, $20, $1f, $1f, $17, $1c, $17, $1c, $0b, $0e, $07, $07, $f0, $f0, $ee
    db $fe, $9c, $e4, $fc, $04, $fc, $04, $fc, $3c, $c8, $f8, $38, $f8, $37, $30, $7f
    db $40, $3f, $20, $1f, $1f, $78, $7f, $3c, $27, $3c, $37, $0e, $0f, $37, $30, $ff
    db $c0, $ff, $a0, $ff, $9f, $f0, $ef, $18, $1f, $04, $07, $02, $03, $ec, $0c, $fe
    db $02, $fc, $04, $f8, $f8, $1c, $f4, $1e, $f2, $1f, $f1, $2f, $e9, $f8, $f8, $f0
    db $f0, $fc, $fc, $03, $ff, $07, $fd, $0f, $f9, $0e, $fe, $e8, $f8, $f9, $01, $00
    db $98, $82, $82, $73, $f9, $02, $15, $74, $62, $82, $82, $82, $63, $64, $83, $75
    db $72, $82, $82, $73, $f9, $02, $13, $74, $62, $82, $82, $63, $64, $83, $75, $76
    db $77, $7a, $71, $72, $82, $f9, $02, $13, $39, $82, $63, $64, $83, $75, $76, $77
    db $78, $83, $7c, $83, $52, $50, $f9, $02, $13, $81, $3c, $41, $75, $76, $77, $78
    db $83, $75, $76, $79, $7a, $53, $f9, $01, $98, $98, $42, $77, $40, $83, $75, $76
    db $77, $78, $7b, $7c, $54, $f9, $01, $b8, $98, $43, $44, $75, $76, $77, $40, $75
    db $76, $7a, $58, $56, $f9, $01, $d8, $98, $45, $47, $77, $78, $75, $76, $77, $40
    db $7c, $5a, $57, $f9, $01, $f8, $98, $46, $49, $75, $76, $77, $78, $83, $75, $7a
    db $5c, $59, $f9, $01, $18, $99, $48, $4b, $77, $78, $83, $75, $76, $77, $7c, $5e
    db $5b, $80, $80, $9a, $ac, $00, $ab, $ab, $ab, $ab, $ab, $10, $ab, $ab, $ab, $ab
    db $ab, $00, $1e, $9b, $80, $80, $4a, $4d, $44, $75, $76, $77, $78, $75, $58, $60
    db $5d, $80, $80, $0b, $0c, $13, $f9, $01, $53, $99, $13, $0b, $0c, $80, $80, $4c
    db $4f, $47, $77, $40, $75, $76, $77, $5a, $5f, $80, $80, $80, $0b, $0c, $13, $f9
    db $01, $73, $99, $13, $0b, $0c, $80, $80, $80, $4e, $49, $75, $76, $77, $78, $83
    db $5c, $61, $80, $80, $80, $26, $80, $02, $f9, $02, $0b, $11, $20, $80, $08, $80
    db $80, $80, $51, $4b, $77, $78, $83, $75, $76, $5e, $57, $80, $80, $80, $26, $80
    db $03, $f9, $01, $b3, $99, $21, $80, $08, $80, $80, $80, $46, $4d, $44, $75, $76
    db $77, $40, $60, $59, $80, $80, $80, $2e, $14, $04, $f9, $02, $0b, $14, $22, $14
    db $1f, $80, $80, $80, $48, $4f, $47, $77, $40, $75, $76, $81, $5b, $80, $80, $80
    db $30, $16, $05, $f9, $02, $0b, $16, $23, $16, $29, $80, $80, $80, $4a, $81, $49
    db $75, $76, $77, $78, $81, $5d, $80, $80, $80, $24, $80, $06, $f9, $01, $19, $9a
    db $4c, $81, $4b, $77, $78, $83, $75, $5f, $80, $80, $80, $80, $01, $80, $07, $f9
    db $01, $3a, $9a, $4e, $4d, $44, $75, $76, $77, $61, $80, $80, $80, $80, $21, $80
    db $08, $f9, $01, $5a, $9a, $51, $4f, $47, $77, $40, $75, $57, $80, $80, $80, $80
    db $21, $80, $09, $f9, $02, $0b, $1a, $f9, $01, $7a, $9a, $46, $81, $49, $75, $76
    db $77, $59, $80, $80, $80, $80, $0d, $0f, $0a, $f9, $20, $13, $9a, $24, $25, $26
    db $27, $f9, $20, $15, $9a, $06, $2a, $03, $03, $f9, $20, $8d, $99, $12, $13, $15
    db $17, $13, $13, $13, $1b, $f9, $01, $93, $9a, $28, $31, $2c, $80, $80, $80, $80
    db $48, $81, $4b, $77, $40, $83, $5b, $80, $80, $80, $80, $13, $0b, $0c, $f9, $01
    db $b3, $9a, $0b, $0c, $13, $80, $80, $80, $80, $4a, $81, $4d, $44, $75, $76, $5d
    db $80, $80, $80, $80, $2f, $2b, $0e, $9c, $9c, $9c, $9c, $9c, $1d, $9c, $9c, $9c
    db $9c, $9c, $2b, $0e, $2d, $80, $80, $80, $80, $4c, $81, $4f, $47, $77, $78, $f9
    db $01, $fb, $9a, $4e, $81, $49, $75, $76, $f9, $01, $1b, $9b, $51, $81, $4b, $77
    db $40, $f9, $01, $3b, $9b, $46, $81, $4d, $44, $75, $f9, $01, $5b, $9b, $48, $81
    db $4f, $47, $77, $f9, $01, $7b, $9b, $4a, $81, $81, $49, $75, $f9, $02, $1f, $6f
    db $77, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d
    db $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d
    db $7e, $7f, $70, $7f, $70, $3f, $32, $7f, $70, $3f, $32, $7f, $70, $7f, $70, $3f
    db $32, $7f, $70, $3f, $32, $7f, $70, $7f, $70, $3f, $32, $3f, $32, $7f, $70, $7f
    db $70, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d
    db $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d, $7e, $7d
    db $7e, $f9, $01, $a0, $9c, $f9, $02, $06, $98, $f9, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $80, $80, $80
    db $bf, $80, $bf, $80, $b8, $87, $87, $ff, $ff, $ff, $f8, $ff, $ff, $00, $00, $00
    db $ff, $00, $ff, $00, $3c, $81, $bd, $81, $bd, $81, $bd, $ff, $ff, $01, $01, $01
    db $fd, $01, $fd, $01, $0d, $f1, $f1, $ff, $ff, $ff, $1f, $81, $bd, $81, $bd, $81
    db $bd, $81, $bd, $81, $bd, $81, $bd, $81, $bd, $81, $bd, $ff, $80, $7f, $c0, $3f
    db $e0, $9f, $f0, $1f, $30, $9f, $b0, $1f, $30, $9f, $b0, $81, $bd, $81, $bd, $81
    db $bd, $00, $3c, $00, $7e, $00, $00, $ff, $ff, $ff, $ff, $ff, $00, $ff, $00, $ff
    db $00, $ff, $80, $ff, $80, $ff, $80, $ff, $80, $ff, $80, $ff, $ff, $80, $80, $80
    db $bf, $80, $9f, $c0, $de, $c0, $de, $c0, $5e, $c0, $5e, $ff, $ff, $00, $00, $00
    db $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff, $ff, $80, $c0, $5e, $c0, $5e, $c0
    db $5e, $c0, $5e, $c0, $5e, $c0, $5e, $c0, $5e, $c0, $5f, $ff, $80, $ff, $80, $ff
    db $80, $ff, $80, $ff, $80, $ff, $ff, $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff
    db $00, $ff, $f8, $8f, $88, $8f, $a8, $0f, $28, $0f, $e8, $c0, $5f, $c0, $5e, $c0
    db $5e, $c0, $5e, $c0, $5e, $c0, $5e, $c0, $5e, $c0, $5e, $00, $ff, $00, $00, $ff
    db $ff, $ff, $ff, $ff, $80, $ff, $80, $ff, $80, $ff, $80, $0f, $e8, $0f, $28, $8f
    db $a8, $8f, $88, $ff, $f8, $ff, $f8, $ff, $00, $ff, $00, $c0, $5e, $c0, $5e, $c0
    db $5e, $80, $9f, $80, $bf, $80, $80, $ff, $ff, $ff, $ff, $ff, $80, $ff, $ff, $00
    db $00, $00, $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff, $ff, $1f, $f1, $f1, $01
    db $0d, $01, $fd, $01, $fd, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $80, $80, $80
    db $be, $80, $9f, $c0, $df, $c0, $df, $c0, $5f, $c0, $5f, $ff, $81, $ff, $81, $ff
    db $81, $7f, $41, $7f, $41, $3f, $a1, $3f, $a0, $1f, $d0, $ff, $ff, $01, $01, $01
    db $7d, $01, $39, $83, $bb, $83, $bb, $83, $ba, $83, $ba, $c0, $5f, $c0, $5f, $c0
    db $5f, $c0, $5c, $c0, $5c, $c1, $5d, $c1, $5d, $c1, $5d, $1f, $d0, $0f, $e8, $0f
    db $e8, $07, $f4, $07, $f4, $03, $7a, $03, $7a, $81, $bd, $83, $ba, $83, $ba, $83
    db $ba, $83, $ba, $83, $ba, $83, $ba, $83, $ba, $83, $ba, $c1, $5d, $c1, $5d, $c1
    db $5d, $c1, $5d, $c1, $5d, $c1, $5d, $c1, $5d, $c1, $5d, $81, $bd, $c0, $de, $c0
    db $de, $e0, $6f, $e0, $6f, $f0, $37, $f0, $37, $f8, $1b, $83, $ba, $83, $ba, $83
    db $ba, $03, $3a, $03, $3a, $03, $ba, $03, $ba, $03, $fa, $c1, $5d, $c1, $5d, $c1
    db $5d, $80, $9c, $80, $be, $80, $80, $ff, $ff, $ff, $ff, $f8, $1b, $fc, $0d, $fc
    db $0d, $fe, $86, $fe, $86, $ff, $83, $ff, $83, $ff, $83, $03, $fa, $03, $fa, $03
    db $fa, $01, $f9, $01, $fd, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $80, $80, $80
    db $bf, $80, $9e, $c0, $de, $c0, $de, $c0, $5e, $c0, $5e, $ff, $c0, $7f, $40, $7f
    db $43, $7c, $44, $f8, $cb, $f0, $d7, $f0, $97, $e0, $af, $ff, $3f, $c0, $c0, $00
    db $3f, $00, $ff, $00, $ff, $00, $e1, $1e, $de, $3f, $bf, $ff, $00, $ff, $c0, $3f
    db $30, $0f, $c8, $07, $f4, $03, $fa, $01, $fd, $03, $7b, $c0, $5e, $c0, $5e, $c0
    db $5e, $c0, $5e, $c0, $5e, $c0, $5e, $c0, $5e, $c0, $5e, $e0, $af, $e0, $af, $e0
    db $af, $e0, $af, $f0, $b7, $f0, $b7, $f8, $9b, $fc, $9c, $7f, $73, $7f, $61, $3f
    db $a1, $1f, $d8, $07, $e6, $01, $f9, $00, $fe, $00, $ff, $87, $b6, $8f, $ac, $df
    db $d8, $ff, $f0, $ff, $60, $ff, $80, $7f, $60, $1f, $98, $ff, $8f, $ff, $87, $ff
    db $81, $ff, $82, $fd, $85, $f8, $8a, $f0, $96, $e0, $af, $00, $3f, $c0, $cf, $f0
    db $f1, $fe, $7e, $ff, $1f, $ff, $87, $ff, $81, $7f, $41, $07, $e4, $03, $fa, $03
    db $fa, $01, $7d, $01, $7d, $81, $bd, $81, $bd, $81, $bd, $c0, $5e, $c0, $5e, $c0
    db $5e, $80, $9e, $80, $bf, $80, $80, $ff, $ff, $ff, $ff, $c0, $df, $e0, $ef, $f0
    db $f7, $78, $79, $7e, $5e, $7f, $47, $ff, $c3, $ff, $c1, $3f, $bf, $00, $c0, $00
    db $ff, $00, $ff, $00, $7f, $80, $80, $ff, $ff, $ff, $ff, $01, $7d, $02, $fb, $04
    db $ff, $08, $fe, $10, $dc, $32, $3a, $e0, $f8, $ea, $fa, $ff, $ff, $00, $00, $ff
    db $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $ff, $00
    db $00, $ff, $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff, $ff, $00, $fc, $00, $f3
    db $03, $ef, $0c, $dc, $10, $b3, $23, $ff, $0c, $ff, $00, $ff, $00, $ff, $0c, $f3
    db $12, $e9, $21, $69, $21, $f3, $92, $ff, $0c, $ff, $00, $ff, $01, $fe, $03, $fc
    db $07, $f9, $0f, $f8, $0c, $f9, $0d, $f8, $0c, $f9, $0d, $00, $ff, $54, $d5, $00
    db $00, $55, $55, $00, $00, $55, $55, $00, $00, $55, $55, $ff, $80, $7f, $c0, $3f
    db $e0, $1f, $71, $0f, $39, $4f, $59, $07, $1d, $57, $5d, $f8, $0c, $f9, $0d, $f8
    db $0c, $f9, $0f, $fc, $07, $fe, $03, $ff, $01, $ff, $00, $00, $00, $55, $55, $00
    db $00, $55, $55, $00, $00, $55, $d5, $00, $c0, $95, $f5, $07, $0c, $57, $5c, $07
    db $0c, $53, $5e, $03, $0e, $43, $5e, $0b, $1e, $1d, $77, $c0, $7f, $fe, $ff, $01
    db $01, $ff, $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff, $3d, $e7, $1e, $fb, $e6
    db $ff, $f8, $ff, $0f, $fe, $01, $01, $ff, $ff, $ff, $ff, $ff, $00, $ff, $ff, $80
    db $80, $ff, $7f, $e0, $3f, $f0, $50, $ff, $8f, $ff, $c7, $fe, $e2, $7e, $72, $3e
    db $3e, $1c, $1c, $00, $00, $00, $00, $00, $00, $00, $00, $7f, $47, $7e, $4e, $7c
    db $7c, $38, $38, $00, $00, $00, $00, $00, $00, $00, $00, $e0, $30, $ea, $3a, $e0
    db $30, $ca, $7a, $c0, $70, $c2, $7a, $d0, $78, $b8, $ee, $00, $00, $aa, $aa, $00
    db $00, $aa, $aa, $00, $00, $aa, $ab, $00, $03, $a9, $af, $1f, $30, $9f, $b0, $1f
    db $30, $9f, $f0, $3f, $e0, $7f, $c0, $ff, $80, $ff, $00, $ff, $00, $ff, $ff, $01
    db $01, $ff, $fe, $07, $fc, $0f, $0a, $ff, $f1, $ff, $e3, $bc, $e7, $78, $df, $67
    db $ff, $1f, $ff, $f0, $7f, $80, $80, $ff, $ff, $ff, $ff, $03, $fe, $7f, $ff, $80
    db $80, $ff, $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff, $ff, $00, $ff, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $2a, $ab, $00
    db $00, $aa, $aa, $00, $00, $aa, $aa, $00, $00, $aa, $aa, $00, $00, $ff, $00, $00
    db $00, $ff, $00, $ff, $00, $00, $00, $ff, $00, $ff, $00, $ff, $01, $fe, $03, $fc
    db $07, $f8, $0e, $f0, $1c, $f2, $1a, $e0, $38, $ea, $3a, $ff, $80, $7f, $c0, $3f
    db $e0, $1f, $70, $0f, $38, $4f, $58, $07, $1c, $57, $5c, $ff, $00, $ff, $00, $00
    db $00, $ff, $00, $ff, $00, $00, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06, $0e
    db $0e, $0c, $0c, $08, $08, $00, $00, $30, $30, $00, $00, $00, $00, $3c, $3c, $66
    db $66, $0e, $0e, $08, $08, $00, $00, $18, $18, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $18, $18, $18, $18, $00, $00, $f9, $01, $20, $98, $f9
    db $02, $14, $b1, $f9, $01, $40, $98, $f9, $02, $06, $81, $b3, $b4, $f9, $02, $0c
    db $81, $f9, $01, $60, $98, $81, $81, $84, $85, $86, $8b, $8c, $86, $96, $97, $98
    db $96, $97, $98, $a2, $a3, $a4, $a5, $81, $81, $f9, $01, $80, $98, $81, $81, $81
    db $87, $81, $8d, $8e, $8f, $99, $9a, $9b, $99, $9a, $9b, $a6, $a7, $a8, $a9, $81
    db $81, $f9, $01, $a0, $98, $81, $c6, $81, $87, $81, $90, $91, $92, $9c, $9d, $9e
    db $9c, $9d, $9e, $a6, $aa, $ab, $ac, $c6, $81, $f9, $01, $c0, $98, $b5, $b6, $b7
    db $89, $8a, $93, $94, $95, $9f, $a0, $a1, $9f, $a0, $a1, $ad, $ae, $af, $b0, $c7
    db $88, $f9, $01, $e0, $98, $b8, $b9, $ba, $f9, $02, $0e, $81, $c0, $c1, $c2, $f9
    db $01, $00, $99, $b2, $bb, $bc, $bd, $f9, $02, $0c, $b2, $c3, $c4, $c5, $b2, $f9
    db $01, $23, $99, $be, $f9, $01, $30, $99, $bf, $f9, $01, $46, $99, $d1, $80, $e9
    db $e5, $da, $f2, $de, $eb, $f9, $01, $86, $99, $d2, $80, $e9, $e5, $da, $f2, $de
    db $eb, $f9, $01, $c6, $99, $e6, $ee, $ec, $e2, $dc, $f9, $01, $04, $9a, $f8, $d1
    db $d9, $d8, $d9, $80, $fa, $fb, $fc, $fd, $fe, $ff, $f9, $00, $f9, $01, $00, $98
    db $f9, $02, $14, $b1, $f9, $01, $20, $98, $f9, $02, $14, $81, $f9, $01, $40, $98
    db $f9, $02, $14, $81, $f9, $01, $60, $98, $f9, $02, $14, $cb, $f9, $01, $a7, $98
    db $e5, $de, $ef, $de, $e5, $80, $d1, $f9, $01, $e7, $98, $e5, $de, $ef, $de, $e5
    db $80, $d2, $f9, $01, $27, $99, $e5, $de, $ef, $de, $e5, $80, $d3, $f9, $01, $67
    db $99, $e5, $de, $ef, $de, $e5, $80, $d4, $f9, $01, $a0, $99, $f9, $02, $14, $c8
    db $f9, $01, $c0, $99, $81, $81, $c6, $f9, $02, $0e, $81, $c6, $81, $81, $f9, $01
    db $e0, $99, $81, $b5, $b6, $ca, $b3, $b4, $f9, $02, $0a, $81, $c9, $c7, $88, $81
    db $f9, $01, $00, $9a, $81, $b8, $b9, $ba, $f9, $02, $0c, $81, $c0, $c1, $c2, $81
    db $f9, $01, $20, $9a, $b2, $b2, $bb, $bc, $bd, $f9, $02, $0a, $b2, $c3, $c4, $c5
    db $b2, $b2, $f9, $00, $03, $03, $1f, $1f, $1f, $1f, $1f, $1f, $3f, $2f, $3f, $30
    db $3f, $3f, $1f, $1f, $f0, $f0, $f8, $f8, $fe, $fe, $fe, $fe, $fc, $f8, $fc, $04
    db $fc, $fc, $fc, $fc, $1f, $1f, $0f, $0f, $0f, $0f, $1c, $1f, $38, $3f, $78, $7f
    db $70, $5f, $f0, $9f, $ff, $9f, $70, $7f, $10, $1f, $13, $1f, $1f, $11, $11, $1f
    db $21, $21, $3f, $3f, $00, $00, $03, $03, $1f, $1f, $1f, $10, $3f, $3f, $3f, $2f
    db $3f, $3f, $3f, $3f, $00, $00, $e0, $e0, $f0, $f0, $fc, $1c, $fe, $ee, $fe, $f6
    db $fc, $fc, $fc, $fc, $7f, $7f, $ff, $9c, $ff, $bf, $f8, $ff, $f8, $ff, $30, $3f
    db $10, $1f, $10, $1f, $fc, $fc, $f8, $38, $f0, $f0, $38, $f8, $1c, $fc, $1e, $fe
    db $0e, $fa, $0f, $f9, $1f, $1f, $10, $1f, $10, $1f, $13, $1f, $1f, $11, $11, $1f
    db $21, $21, $3f, $3f, $00, $00, $00, $18, $00, $38, $00, $30, $00, $00, $00, $86
    db $00, $06, $00, $00, $fc, $fc, $10, $f0, $10, $f0, $20, $e0, $e0, $20, $3c, $fc
    db $3e, $3e, $fc, $fc, $0f, $0f, $3f, $3f, $7f, $7f, $ff, $e3, $bf, $bc, $27, $27
    db $27, $20, $37, $30, $c8, $c8, $f0, $f0, $f0, $f0, $f8, $f8, $f8, $38, $f8, $c8
    db $f8, $f8, $f0, $70, $7f, $40, $3f, $20, $1f, $1f, $05, $07, $0d, $0f, $0c, $0f
    db $1c, $17, $1c, $17, $f0, $f0, $e0, $e0, $e0, $e0, $f0, $d0, $f8, $88, $fc, $84
    db $3c, $c4, $3c, $cc, $0f, $0f, $04, $07, $04, $07, $04, $07, $07, $04, $38, $3f
    db $70, $70, $3f, $3f, $f0, $f0, $10, $f0, $10, $f0, $20, $e0, $e0, $20, $3c, $fc
    db $3e, $3e, $fc, $fc, $7f, $40, $3f, $20, $1f, $1f, $07, $07, $1f, $1b, $3f, $20
    db $3f, $20, $1e, $11, $f0, $f0, $e0, $e0, $e0, $e0, $e0, $e0, $b0, $f0, $90, $f0
    db $10, $f0, $10, $f0, $0f, $0f, $d0, $df, $b8, $a7, $9c, $a3, $4f, $53, $23, $2f
    db $77, $77, $3f, $3f, $f0, $f0, $10, $f0, $1e, $ee, $39, $c5, $f9, $85, $e2, $fa
    db $c6, $c6, $fc, $fc, $0f, $0f, $3f, $3f, $7f, $7f, $5f, $5f, $1f, $0f, $3f, $30
    db $3f, $3f, $3f, $2f, $e4, $e4, $f8, $f8, $f8, $f8, $fc, $fc, $fc, $f8, $fc, $04
    db $fc, $fc, $fc, $fc, $1f, $0f, $0f, $0f, $1f, $1f, $3e, $3f, $3c, $3f, $7c, $7f
    db $f8, $8f, $f8, $8f, $f8, $f8, $f0, $f0, $f8, $f8, $1c, $fc, $1c, $fc, $0e, $fa
    db $0e, $fa, $0f, $f9, $0f, $0f, $3f, $3f, $7f, $7f, $5f, $5f, $1f, $0f, $3f, $30
    db $ff, $ff, $ff, $6f, $e4, $e4, $f8, $f8, $f8, $f8, $fc, $fc, $fc, $f8, $fe, $06
    db $ff, $ff, $ff, $fd, $ff, $2f, $ff, $3f, $ff, $bf, $7c, $7f, $3c, $3f, $38, $3f
    db $10, $1f, $10, $1f, $ff, $f9, $ff, $f1, $de, $fa, $1c, $fc, $1c, $fc, $08, $f8
    db $08, $f8, $08, $f8, $00, $00, $00, $00, $00, $00, $01, $01, $03, $02, $03, $02
    db $01, $01, $01, $01, $00, $00, $03, $03, $1f, $1f, $1f, $1f, $1f, $1f, $3f, $2f
    db $3f, $30, $3f, $3f, $00, $00, $f0, $f0, $f8, $f8, $fe, $fe, $fe, $fe, $fc, $f8
    db $fc, $04, $fc, $fc, $00, $00, $01, $01, $03, $02, $03, $02, $03, $02, $03, $03
    db $00, $00, $00, $00, $df, $df, $df, $5f, $cf, $4f, $ff, $3f, $fc, $3f, $f8, $3f
    db $f8, $ff, $10, $1f, $ff, $ff, $fb, $fa, $f3, $f2, $ff, $fe, $3f, $fc, $1f, $fc
    db $1f, $ff, $08, $f8, $10, $1f, $1f, $1f, $20, $3f, $60, $5f, $73, $4f, $44, $7c
    db $87, $87, $ff, $ff, $00, $00, $f0, $f0, $f8, $f8, $fe, $fe, $fe, $fe, $fd, $f9
    db $ff, $06, $ff, $fc, $00, $00, $00, $00, $00, $00, $c0, $c0, $c0, $40, $c0, $40
    db $c0, $40, $80, $80, $ff, $fc, $ff, $f8, $ff, $fd, $1e, $fe, $1e, $fe, $0c, $fc
    db $08, $f8, $08, $f8, $06, $06, $05, $05, $04, $04, $02, $02, $01, $01, $00, $00
    db $00, $00, $00, $00, $10, $1f, $ff, $ff, $60, $9f, $60, $9f, $30, $4f, $9f, $bf
    db $60, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3f, $3f
    db $ff, $ff, $3f, $3f, $02, $02, $1f, $1f, $3f, $3f, $7f, $7c, $7f, $73, $ff, $ef
    db $ff, $df, $ff, $ff, $00, $00, $80, $80, $e0, $e0, $e0, $60, $f0, $f0, $f0, $f0
    db $f0, $f0, $f0, $f0, $ff, $eb, $7f, $73, $ff, $9f, $ff, $87, $7f, $47, $3f, $37
    db $0e, $0f, $04, $07, $f0, $f0, $e0, $a0, $e0, $e0, $a0, $e0, $90, $f0, $98, $f8
    db $18, $f8, $1c, $f4, $ff, $eb, $7f, $73, $ff, $8f, $7f, $47, $3f, $27, $1f, $17
    db $0e, $0f, $04, $07, $f0, $f0, $e0, $e0, $a0, $e0, $90, $f0, $90, $f0, $98, $f8
    db $18, $f8, $1c, $f4, $38, $38, $54, $54, $aa, $aa, $d6, $d6, $aa, $aa, $d6, $d6
    db $aa, $aa, $54, $54, $00, $00, $3e, $3e, $55, $55, $aa, $aa, $d5, $d5, $aa, $aa
    db $55, $55, $3e, $3e, $1c, $1c, $2a, $2a, $55, $55, $ab, $ab, $d5, $d5, $aa, $aa
    db $d4, $d4, $f8, $f8, $00, $00, $03, $03, $1f, $1f, $1f, $1f, $1f, $1f, $bf, $af
    db $ff, $70, $ff, $3f, $7f, $7f, $ff, $9f, $f8, $bf, $f8, $ff, $f8, $ff, $30, $3f
    db $10, $1f, $10, $1f, $fc, $fc, $f8, $f8, $38, $f8, $1c, $fc, $1e, $fe, $0e, $fa
    db $0f, $f9, $0f, $f9, $07, $07, $04, $07, $04, $07, $04, $07, $07, $04, $38, $3f
    db $70, $70, $3f, $3f, $07, $07, $3f, $3f, $7f, $7f, $7f, $7f, $7f, $6f, $27, $27
    db $27, $20, $37, $30, $c0, $c0, $e0, $e0, $e0, $e0, $f0, $f0, $f8, $f8, $f8, $f8
    db $f8, $f8, $f0, $70, $7f, $40, $3f, $20, $1f, $1f, $04, $07, $1c, $1b, $3f, $20
    db $3f, $20, $1e, $11, $f0, $f0, $e0, $e0, $e0, $e0, $20, $e0, $10, $f0, $10, $f0
    db $10, $f0, $10, $f0, $7f, $40, $3f, $20, $1f, $1f, $04, $07, $0c, $0f, $0c, $0f
    db $1c, $17, $1c, $17, $f0, $f0, $e0, $e0, $20, $e0, $30, $d0, $78, $88, $7c, $84
    db $3c, $c4, $38, $c8, $07, $07, $0f, $0f, $3f, $3f, $3f, $31, $1f, $0f, $19, $10
    db $39, $30, $3b, $22, $e0, $e0, $f0, $f0, $f8, $f8, $f8, $08, $fc, $f4, $9c, $8c
    db $9c, $0c, $dc, $44, $1e, $11, $1f, $10, $0f, $0f, $1c, $1f, $38, $3f, $78, $7f
    db $70, $5f, $f0, $9f, $f8, $08, $f8, $08, $f0, $f0, $38, $f8, $1c, $fc, $1e, $fe
    db $0e, $fa, $0f, $f9, $ff, $9f, $70, $7f, $10, $1f, $11, $1f, $1f, $11, $11, $1f
    db $21, $21, $3f, $3f, $07, $07, $1f, $1f, $1f, $1f, $3f, $3f, $3f, $3f, $39, $38
    db $19, $10, $1b, $12, $c0, $c0, $e0, $e0, $f8, $f8, $f8, $f8, $f8, $b8, $98, $18
    db $98, $08, $d8, $48, $1f, $11, $1f, $10, $0f, $0f, $10, $1f, $20, $3f, $50, $7f
    db $70, $5f, $f0, $9f, $f8, $08, $f0, $10, $f0, $f0, $08, $f8, $04, $fc, $0a, $fe
    db $0e, $fa, $0f, $f9, $fc, $04, $f8, $f8, $f0, $f0, $fc, $fc, $ff, $e3, $ff, $c0
    db $3f, $e1, $fe, $fe, $3f, $20, $1f, $1f, $04, $07, $1c, $1f, $f4, $ef, $fc, $87
    db $fc, $87, $7f, $7f, $fc, $04, $f8, $f8, $ff, $ff, $ff, $e0, $ff, $c0, $ff, $e3
    db $3c, $fc, $f8, $e0, $3f, $20, $1f, $1f, $7c, $7f, $f4, $8f, $f4, $8f, $fc, $e7
    db $1c, $1f, $1f, $07, $fc, $04, $f8, $f8, $10, $f0, $0c, $fc, $1f, $e3, $3f, $c0
    db $3f, $e1, $fe, $fe, $3f, $20, $1f, $1f, $05, $07, $1d, $1f, $fc, $ef, $fc, $87
    db $fc, $87, $7f, $7f, $fc, $04, $f8, $f8, $3f, $ff, $1f, $e0, $3f, $c0, $1f, $e3
    db $3c, $fc, $f8, $e0, $3f, $20, $1f, $1f, $7d, $7f, $fd, $8f, $fc, $8f, $fc, $e7
    db $1c, $1f, $1f, $07, $24, $1c, $24, $1c, $ff, $04, $24, $df, $24, $df, $ff, $ff
    db $24, $1c, $24, $1c, $00, $00, $00, $00, $ff, $00, $00, $ff, $00, $ff, $ff, $ff
    db $00, $00, $00, $00, $24, $1c, $24, $1c, $ff, $04, $24, $df, $24, $df, $ff, $ff
    db $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c
    db $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c, $24, $1c
    db $24, $1c, $24, $1c, $24, $1c, $24, $1c, $ff, $04, $24, $df, $24, $df, $ff, $ff
    db $24, $1c, $24, $1c, $00, $00, $00, $00, $ff, $00, $00, $ff, $00, $ff, $ff, $ff
    db $00, $00, $00, $00, $24, $1c, $24, $1c, $ff, $04, $24, $df, $24, $df, $ff, $ff
    db $24, $1c, $24, $1c, $00, $00, $00, $0f, $00, $3f, $00, $7f, $00, $7f, $03, $7c
    db $1b, $64, $3b, $44, $00, $07, $00, $8f, $00, $ef, $00, $ef, $01, $ee, $01, $ee
    db $4d, $a2, $4f, $80, $00, $c0, $00, $f3, $00, $f3, $00, $f7, $c0, $37, $60, $97
    db $61, $92, $e1, $1a, $00, $70, $00, $f8, $00, $fe, $00, $fe, $00, $ff, $f8, $07
    db $ac, $53, $fc, $02, $1f, $20, $1f, $00, $0f, $00, $06, $39, $00, $7f, $10, $7f
    db $00, $ff, $00, $00, $c7, $18, $c3, $1c, $81, $18, $03, $b0, $40, $f0, $20, $f0
    db $00, $ff, $00, $00, $c1, $38, $80, $70, $00, $33, $80, $13, $00, $17, $01, $17
    db $00, $ff, $00, $00, $fc, $00, $f8, $00, $20, $de, $00, $fe, $02, $ff, $02, $ff
    db $00, $ff, $00, $00, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
    db $ff, $00, $ff, $00, $07, $07, $08, $0e, $0f, $8f, $10, $df, $2f, $ff, $19, $f8
    db $4f, $ae, $5f, $b0, $c0, $c0, $30, $f1, $88, $f9, $64, $ff, $e2, $ff, $3b, $1e
    db $bf, $94, $fd, $16, $df, $10, $9f, $1f, $37, $0c, $3f, $8f, $3b, $9a, $2b, $bb
    db $68, $fe, $f0, $96, $f9, $c8, $f8, $c8, $fc, $12, $fc, $fa, $d4, $5e, $d2, $de
    db $16, $7e, $0f, $69, $f8, $88, $fc, $9c, $72, $f2, $8c, $fc, $e6, $fe, $f3, $ff
    db $fa, $7f, $fd, $3e, $1f, $11, $3f, $39, $4e, $4f, $31, $3f, $67, $7f, $cf, $ff
    db $df, $7e, $fd, $3e, $b0, $08, $b7, $08, $b0, $0f, $b7, $08, $b7, $08, $b0, $08
    db $b7, $08, $b0, $0f, $0d, $02, $fd, $02, $0d, $f2, $ed, $02, $ed, $02, $0d, $02
    db $fd, $02, $0d, $f2, $30, $08, $30, $08, $30, $08, $30, $08, $37, $08, $30, $0f
    db $30, $08, $30, $08, $0c, $02, $0c, $02, $0c, $02, $0c, $02, $fc, $02, $0c, $f2
    db $0c, $02, $0c, $02, $00, $00, $00, $00, $07, $07, $09, $08, $13, $17, $1e, $16
    db $14, $14, $1c, $14, $1c, $14, $1c, $14, $1f, $17, $1b, $14, $1f, $17, $1c, $14
    db $1c, $14, $1c, $14, $1c, $14, $1e, $16, $1b, $17, $0f, $08, $07, $07, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $00, $f7, $ff, $1c, $14
    db $1c, $14, $1c, $14, $1c, $14, $1c, $14, $f7, $f7, $ff, $00, $ff, $ff, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $f0, $f0, $f8, $08, $ec, $e4, $3c, $34
    db $1c, $14, $1c, $14, $1c, $14, $1c, $14, $fc, $f4, $ec, $04, $fc, $f4, $1c, $14
    db $1c, $14, $1c, $14, $14, $1c, $3c, $34, $e4, $ec, $c8, $38, $f0, $f0, $00, $00
    db $00, $00, $00, $00, $07, $01, $07, $03, $0f, $03, $0f, $03, $0b, $03, $1b, $07
    db $1b, $03, $1b, $07, $33, $0b, $33, $0f, $33, $0b, $63, $1f, $63, $0b, $63, $1f
    db $c3, $2b, $c3, $3f, $1c, $14, $1c, $14, $1c, $14, $1c, $14, $1c, $14, $1c, $14
    db $1c, $14, $1c, $14, $1c, $14, $1c, $14, $ff, $f7, $eb, $04, $ff, $f7, $1c, $14
    db $1c, $14, $1c, $14, $00, $00, $00, $00, $ff, $ff, $ff, $00, $ff, $ff, $00, $00
    db $00, $00, $00, $00, $f9, $01, $00, $98, $00, $f9, $02, $12, $01, $02, $f9, $20
    db $20, $98, $f9, $02, $08, $03, $f9, $20, $33, $98, $f9, $02, $08, $04, $f9, $01
    db $20, $99, $05, $f9, $02, $12, $06, $07, $f9, $01, $40, $99, $08, $09, $0a, $0b
    db $08, $09, $0a, $0b, $08, $09, $0a, $0b, $08, $09, $0a, $0b, $08, $09, $0a, $0b
    db $f9, $01, $60, $99, $0c, $0d, $0e, $0f, $0c, $0d, $0e, $0f, $0c, $0d, $0e, $0f
    db $0c, $0d, $0e, $0f, $0c, $0d, $0e, $0f, $f9, $01, $80, $99, $f9, $02, $14, $10
    db $f9, $01, $a0, $99, $f9, $02, $14, $81, $f9, $00, $ff, $ff, $ff, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff
