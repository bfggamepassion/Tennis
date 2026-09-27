RST_00::
0000  jp Jump_000_0150
0003  rst RST_38
0004  rst RST_38
0005  rst RST_38
0006  rst RST_38
0007  rst RST_38
RST_08::
0008  pop hl
0009  add a
000a  ld e, a
000b  ld d, $00
000d  add hl, de
000e  ld a, [hl+]
000f  ld h, [hl]
RST_10::
0010  ld l, a
0011  jp hl
0012  rst RST_38
0013  rst RST_38
0014  rst RST_38
0015  rst RST_38
0016  rst RST_38
0017  rst RST_38
RST_18::
0018  pop hl
0019  ld c, a
001a  ld b, $00
001c  ld a, [hl+]
001d  push hl
001e  add hl, bc
001f  ld c, a
RST_20::
0020  ld a, [hl]
0021  pop hl
0022  add hl, bc
0023  jp hl
0024  rst RST_38
0025  rst RST_38
0026  rst RST_38
0027  rst RST_38
RST_28::
0028  pop hl
0029  ld a, [hl+]
002a  ld b, a
jr_000_002b:
002b  ld a, [hl+]
002c  ld [de], a
002d  inc de
002e  dec b
RST_30::
0030  ld a, [$ffe9]
0033  rst RST_38
0034  rst RST_38
0035  rst RST_38
0036  rst RST_38
0037  rst RST_38
RST_38::
0038  rst RST_38
0039  rst RST_38
003a  rst RST_38
003b  rst RST_38
003c  rst RST_38
003d  rst RST_38
003e  rst RST_38
003f  rst RST_38
VBlankInterrupt::
0040  jp Jump_000_01f2
0043  rst RST_38
0044  rst RST_38
0045  rst RST_38
0046  rst RST_38
0047  rst RST_38
LCDCInterrupt::
0048  jp Jump_000_0244
004b  rst RST_38
004c  rst RST_38
004d  rst RST_38
004e  rst RST_38
004f  rst RST_38
TimerOverflowInterrupt::
0050  jp Jump_000_025f
0053  rst RST_38
0054  rst RST_38
0055  rst RST_38
0056  rst RST_38
0057  rst RST_38
SerialTransferCompleteInterrupt::
0058  jp Jump_000_0260
005b  rst RST_38
005c  rst RST_38
005d  rst RST_38
005e  rst RST_38
005f  rst RST_38
JoypadTransitionInterrupt::
0060  jp Jump_000_026d
Jump_000_0063:
0063  ldh a, [$ff96]
0065  and $03
0068  inc bc
0069  ld a, $00
006b  jr nz, jr_000_006f
006d  ld a, $10
jr_000_006f:
006f  ldh [$ffeb], a
0071  ldh a, [$ffaa]
0073  ld e, a
0074  ld a, b
0075  sub e
0076  add $10
0078  ld b, a
0079  ldh a, [$ffa8]
007b  ld e, a
007c  ld a, c
007d  sub e
007e  add $08
0080  ld c, a
0081  ld a, [$dea0]
0084  cp $a0
0086  ret z
0087  ld e, a
0088  ld d, $de
jr_000_008a:
008a  ld a, [hl+]
008b  cp $80
008d  jr z, jr_000_00a4
008f  add b
0090  ld [de], a
0091  inc e
0092  ld a, [hl+]
0093  add c
0094  ld [de], a
0095  inc e
0096  ld a, [hl+]
0097  ld [de], a
0098  inc e
0099  ldh a, [$ffeb]
009b  xor [hl]
009c  inc hl
009d  ld [de], a
009e  inc e
009f  ld a, e
00a0  cp $a0
00a2  jr nz, jr_000_008a
jr_000_00a4:
00a4  ld a, e
00a5  ld [$dea0], a
00a8  ret
Call_000_00a9:
00a9  push bc
00aa  ldh a, [$ffa4]
00ac  ld b, a
00ad  add a
00ae  add a
00af  add b
00b0  add $0b
00b2  ldh [$ffa4], a
00b4  pop bc
00b5  ret
Call_000_00b6:
00b6  ld b, $00
jr_000_00b8:
00b8  sub $0a
00ba  jr c, jr_000_00bf
00bc  inc b
00bd  jr jr_000_00b8
jr_000_00bf:
00bf  add $0a
00c1  ld c, a
00c2  ret
Call_000_00c3:
00c3  ld a, l
00c4  sub e
00c5  ld e, a
00c6  ld a, h
00c7  sbc d
00c8  ld d, a
00c9  ret
Call_000_00ca:
00ca  cp $64
00cc  ret nc
00cd  ld b, a
00ce  srl b
00d0  add a
00d1  add b
00d2  ld l, a
00d3  call Call_000_00a9
00d6  cp l
00d7  ccf
00d8  ret
Call_000_00d9:
00d9  cp $64
00db  ret nc
00dc  ld b, a
00dd  srl b
00df  add a
00e0  add b
00e1  ld l, a
00e2  ldh a, [$ffa4]
00e4  cp l
00e5  ccf
00e6  ret
00e7  rst RST_38
00e8  rst RST_38
00e9  rst RST_38
00ea  rst RST_38
00eb  rst RST_38
00ec  rst RST_38
00ed  rst RST_38
00ee  rst RST_38
00ef  rst RST_38
00f0  rst RST_38
00f1  rst RST_38
00f2  rst RST_38
00f3  rst RST_38
00f4  rst RST_38
00f5  rst RST_38
00f6  rst RST_38
00f7  rst RST_38
00f8  rst RST_38
00f9  rst RST_38
00fa  rst RST_38
00fb  rst RST_38
00fc  rst RST_38
00fd  rst RST_38
00fe  rst RST_38
00ff  rst RST_38
Boot::
0100  nop
0101  jp Jump_000_0150
HeaderLogo::
HeaderTitle::
HeaderNewLicenseeCode::
HeaderSGBFlag::
HeaderCartridgeType::
HeaderROMSize::
HeaderRAMSize::
HeaderDestinationCode::
HeaderOldLicenseeCode::
HeaderMaskROMVersion::
HeaderComplementCheck::
HeaderGlobalChecksum::
Jump_000_0150:
0150  ld sp, $dfff
0153  call Call_000_2f78
0156  call Call_000_2fcb
0159  call Call_000_3027
015c  ld a, $e4
015e  ldh [rBGP], a
0160  ld a, $e4
0162  ldh [rOBP0], a
0164  ld a, $c4
0166  ldh [rOBP1], a
0168  ld a, $01
016a  ld [$c0df], a
Jump_000_016d:
016d  ld sp, $dfff
0170  di
0171  xor a
0172  call Call_000_2f67
0175  ld a, $80
0177  ldh [rLCDC], a
0179  call Call_000_2f78
017c  call Call_000_361c
017f  call Call_000_3001
0182  ld hl, $62d6
0185  ld de, $8000
0188  ld bc, $0800
018b  call Call_000_303e
018e  ld hl, $5ad6
0191  ld bc, $0800
0194  call Call_000_303e
0197  ld hl, $52d6
019a  ld bc, $0800
019d  call Call_000_303e
01a0  ldh a, [$ff96]
01a2  and $03
01a4  cp $03
01a6  jr nz, jr_000_01bd
01a8  ld hl, $69f6
01ab  ld de, $8000
01ae  ld bc, $0220
01b1  call Call_000_303e
01b4  ld de, $8400
01b7  ld bc, $0300
01ba  call Call_000_303e
jr_000_01bd:
01bd  call Call_000_3010
01c0  ld hl, $ffa6
01c3  ld a, $03
01c5  ld [hl+], a
01c6  xor a
01c7  ld [hl+], a
01c8  ld [hl+], a
01c9  ld [hl+], a
01ca  ld [hl], a
01cb  ldh [$ffa1], a
01cd  ldh [$ffa2], a
01cf  ldh [$ffa3], a
01d1  ldh [$ff99], a
01d3  ldh [$ff9b], a
01d5  ldh [$ff9d], a
01d7  ldh [$ff8d], a
01d9  ldh a, [$ff8a]
01db  rst RST_08
Jump_000_01f2:
01f2  push af
01f3  push bc
01f4  push de
01f5  push hl
01f6  ldh a, [$ff8c]
01f8  and a
01f9  jp nz, Jump_000_023f
01fc  call Call_000_2fc8
01ff  ld a, $40
0201  ldh [$ff8c], a
0203  ld [$dea0], a
0206  ldh a, [$ff8b]
0208  rst RST_08
Jump_000_0217:
0217  ld a, [$dea0]
021a  call Call_000_3011
021d  call Call_000_21ed
0220  ldh a, [$ff8b]
0222  cp $01
0224  jr nz, jr_000_0237
0226  call Call_000_0766
0229  jr z, jr_000_0237
022b  ldh a, [$ff98]
022d  cp $0f
022f  jr nz, jr_000_0237
0231  ldh a, [$ff99]
0233  and a
0234  jp nz, Jump_000_0150
jr_000_0237:
0237  xor a
0238  ldh [$ff8c], a
023a  pop hl
023b  pop de
023c  pop bc
023d  pop af
023e  reti
Jump_000_023f:
023f  pop hl
0240  pop de
0241  pop bc
0242  pop af
0243  reti
Jump_000_0244:
0244  push af
0245  ldh a, [$ff91]
0247  bit 1, a
0249  jr nz, jr_000_025d
jr_000_024b:
024b  ldh a, [rSTAT]
024d  and $03
024f  jr z, jr_000_024b
jr_000_0251:
0251  ldh a, [rSTAT]
0253  and $03
0255  jr nz, jr_000_0251
0257  ldh a, [rLCDC]
0259  res 5, a
025b  ldh [rLCDC], a
jr_000_025d:
025d  pop af
025e  reti
Jump_000_025f:
025f  reti
Jump_000_0260:
0260  push af
0261  push bc
0262  push de
0263  push hl
0264  ei
0265  call Call_000_076d
0268  pop hl
0269  pop de
026a  pop bc
026b  pop af
026c  reti
Jump_000_026d:
026d  reti
026e  ld hl, $71b4
0271  ld de, $8800
0274  ld bc, $0500
0277  call Call_000_303e
027a  ld hl, $76b4
027d  call Call_000_326b
0280  ld a, $12
0282  call Call_000_3665
0285  call Call_000_3670
0288  call Call_000_3670
028b  call Call_000_3670
028e  ld hl, $ffaf
0291  res 7, [hl]
0293  ld a, $04
0295  ldh [$ff96], a
0297  xor a
0298  ldh [$ff97], a
029a  ldh [$ff8b], a
029c  ld a, $80
029e  ldh [$ff8d], a
02a0  call Call_000_2fed
02a3  ld a, $08
02a5  call Call_000_2f67
02a8  call Call_000_2f8b
02ab  call Call_000_2f56
jr_000_02ae:
02ae  halt
02af  call Call_000_00a9
02b2  jr jr_000_02ae
02b4  ld hl, $71b4
02b7  ld de, $8800
02ba  ld bc, $0500
02bd  call Call_000_303e
02c0  ld hl, $7785
02c3  call Call_000_326b
02c6  call Call_000_0837
02c9  ld a, $08
02cb  call Call_000_2f67
02ce  xor a
02cf  ldh [$ff9f], a
02d1  ldh [$ffa0], a
02d3  ld a, $02
02d5  ldh [$ff8b], a
02d7  call Call_000_2f8b
02da  call Call_000_2f56
jr_000_02dd:
02dd  halt
02de  call Call_000_00a9
02e1  jr jr_000_02dd
02e3  xor a
02e4  ldh [$ffc4], a
02e6  dec a
02e7  ldh [$ff95], a
02e9  ldh a, [$ff96]
02eb  and $02
02ed  ldh [$ffba], a
02ef  call Call_000_3297
02f2  call Call_000_2159
02f5  ldh a, [$ff96]
02f7  ldh [$ffc5], a
02f9  ld a, [$c0e6]
02fc  cp $0d
02fe  jr c, jr_000_0315
0300  ld a, [$c0e7]
0303  ld l, a
0304  ld h, $00
0306  ld a, $06
0308  call Call_000_3143
030b  bit 0, l
030d  jr z, jr_000_0315
030f  ldh a, [$ffc5]
0311  xor $02
0313  ldh [$ffc5], a
jr_000_0315:
0315  ldh a, [$ffc5]
0317  bit 1, a
0319  ld b, $00
031b  jr z, jr_000_031f
031d  ld b, $02
jr_000_031f:
031f  ldh a, [$ffba]
0321  ldh [$ffbc], a
0323  ld a, [$c0e6]
0326  add b
0327  ldh [$ffba], a
0329  ldh a, [$ffaf]
032b  bit 7, a
032d  jr nz, jr_000_033f
032f  ld a, [$c0dc]
0332  cp $01
0334  jp nz, Jump_000_03a3
0337  ld a, $02
0339  ld [$c0ea], a
033c  jp Jump_000_03a3
jr_000_033f:
033f  ld hl, $6f16
0342  call Call_000_326b
0345  ldh a, [$ffba]
0347  bit 1, a
0349  ld hl, $515a
034c  jr nz, jr_000_0351
034e  ld hl, $5180
jr_000_0351:
0351  call Call_000_326b
0354  call Call_000_3551
0357  ldh a, [$ff96]
0359  bit 2, a
035b  jr z, jr_000_0367
035d  xor a
035e  call Call_000_3665
0361  call Call_000_3670
0364  call Call_000_3670
jr_000_0367:
0367  ldh a, [$ffba]
0369  bit 1, a
036b  ld a, $24
036d  jr z, jr_000_0371
036f  ld a, $14
jr_000_0371:
0371  ldh [$ffbb], a
0373  ldh [$ffa8], a
0375  call Call_000_0837
0378  xor a
0379  ldh [$ffa5], a
037b  ldh [$ff9f], a
037d  ldh [$ffa0], a
037f  inc a
0380  ld [$c0da], a
0383  ldh [$ff8b], a
0385  ld a, $03
0387  ldh [$ffa6], a
0389  ld a, $03
038b  ldh [$ff8a], a
038d  ld a, $29
038f  ldh [rLYC], a
0391  ld a, $40
0393  ldh [rSTAT], a
0395  ld a, $0a
0397  call Call_000_2f67
039a  call Call_000_2f56
jr_000_039d:
039d  halt
039e  call Call_000_00a9
03a1  jr jr_000_039d
Jump_000_03a3:
03a3  call Call_000_041a
03a6  ld hl, $7f7d
03a9  call Call_000_326b
03ac  ld hl, $520e
03af  call Call_000_326b
03b2  call Call_000_5292
03b5  ld a, [$c0df]
03b8  or $d0
03ba  ld [$984a], a
03bd  ldh a, [$ff96]
03bf  and $03
03c1  cp $03
03c3  ld hl, $c0e0
03c6  jr nz, jr_000_03cb
03c8  ld hl, $c0e3
jr_000_03cb:
03cb  ld de, $988c
03ce  call Call_000_0405
03d1  ldh a, [$ff96]
03d3  and $03
03d5  cp $03
03d7  ld hl, $c0e3
03da  jr nz, jr_000_03df
03dc  ld hl, $c0e0
jr_000_03df:
03df  ld de, $98cc
03e2  call Call_000_0405
03e5  xor a
03e6  ldh [$ff9f], a
03e8  ldh [$ffa0], a
03ea  ld [$c000], a
03ed  ld a, $06
03ef  ldh [$ff8b], a
03f1  call Call_000_0837
03f4  ld a, $08
03f6  call Call_000_2f67
03f9  call Call_000_2f8b
03fc  call Call_000_2f56
jr_000_03ff:
03ff  halt
0400  call Call_000_00a9
0403  jr jr_000_03ff
Call_000_0405:
0405  ld a, [$c0db]
0408  ld b, a
0409  ldh a, [$ff8a]
040b  cp $0a
040d  jr nz, jr_000_0410
040f  dec b
jr_000_0410:
0410  ld a, [hl+]
0411  or $d0
0413  ld [de], a
0414  inc de
0415  inc de
0416  dec b
0417  jr nz, jr_000_0410
0419  ret
Call_000_041a:
041a  ld hl, $781d
041d  ld de, $8000
0420  ld bc, $0500
0423  call Call_000_303e
0426  ld hl, $7cfd
0429  ld de, $9000
042c  ld bc, $0300
042f  jp Jump_000_303e
0432  call Call_000_041a
0435  ld hl, $7f7d
0438  call Call_000_326b
043b  ld hl, $51a6
043e  ldh a, [$ff8a]
0440  cp $06
0442  jr z, jr_000_0459
0444  ld a, [$c0df]
0447  ld hl, $51de
044a  cp $04
044c  jr z, jr_000_0459
044e  ld a, [$c0df]
0451  or $d0
0453  ld [$9869], a
0456  ld hl, $51b7
jr_000_0459:
0459  call Call_000_326b
045c  xor a
045d  ld [$c000], a
0460  ldh a, [$ff8a]
0462  sub $02
0464  ldh [$ff8b], a
0466  cp $04
0468  jr z, jr_000_047a
046a  ld b, $21
046c  ld a, [$c0df]
046f  cp $04
0471  jr z, jr_000_047c
0473  ld a, $1e
0475  call Call_000_3665
0478  jr jr_000_0483
jr_000_047a:
047a  ld b, $16
jr_000_047c:
047c  ld a, b
047d  call Call_000_3665
0480  call Call_000_3670
jr_000_0483:
0483  call Call_000_3670
0486  call Call_000_3670
0489  call Call_000_0837
048c  ld a, $08
048e  call Call_000_2f67
0491  call Call_000_2f8b
0494  call Call_000_2f56
jr_000_0497:
0497  halt
0498  call Call_000_00a9
049b  jr jr_000_0497
jr_000_049d:
049d  halt
049e  call Call_000_00a9
04a1  jr jr_000_049d
04a3  ei
04a4  ldh a, [$ffa1]
04a6  and a
04a7  jr z, jr_000_04cc
04a9  dec a
04aa  ldh [$ffa1], a
04ac  jp z, Jump_000_04c5
04af  cp $10
04b1  jr nz, jr_000_04bd
04b3  ldh a, [$ff96]
04b5  bit 0, a
04b7  call nz, Call_000_2fdb
04ba  jp Jump_000_0598
jr_000_04bd:
04bd  cp $12
04bf  call z, Call_000_2fed
04c2  jp Jump_000_0598
Jump_000_04c5:
04c5  ld a, $02
04c7  ldh [$ff8a], a
04c9  jp Jump_000_016d
jr_000_04cc:
04cc  ldh a, [rSC]
04ce  bit 7, a
04d0  jr nz, jr_000_04d9
04d2  ld a, $80
04d4  ldh [$ff8d], a
04d6  call Call_000_2fed
jr_000_04d9:
04d9  ld a, [$dd2c]
04dc  cp $05
04de  jp c, Jump_000_055e
04e1  ldh a, [$ff99]
04e3  cp $08
04e5  jr nz, jr_000_0518
04e7  ldh a, [$ff97]
04e9  cp $02
04eb  jr z, jr_000_0518
04ed  ld a, $09
04ef  call Call_000_3665
04f2  ldh a, [$ff97]
04f4  ld b, a
04f5  ldh a, [$ff98]
04f7  bit 0, a
04f9  ldh a, [$ff96]
04fb  jr z, jr_000_04ff
04fd  set 3, a
jr_000_04ff:
04ff  and $fe
0501  or b
0502  ldh [$ff96], a
0504  bit 0, b
0506  jr z, jr_000_050e
0508  xor a
0509  ldh [$ff8d], a
050b  call Call_000_2fdb
jr_000_050e:
050e  xor a
050f  ldh [$ffaf], a
0511  ld a, $14
0513  ldh [$ffa1], a
0515  jp Jump_000_0598
jr_000_0518:
0518  ldh a, [$ff99]
051a  and $31
051c  jr z, jr_000_052f
051e  ldh a, [$ff97]
0520  cp $02
0522  jr nz, jr_000_052f
0524  ldh a, [$ff96]
0526  xor $04
0528  ldh [$ff96], a
052a  ld a, $09
052c  call Call_000_3665
jr_000_052f:
052f  ldh a, [$ff99]
0531  ld b, a
0532  ldh a, [$ff97]
0534  bit 6, b
0536  jr z, jr_000_053e
0538  and a
0539  jr z, jr_000_055e
053b  dec a
053c  jr jr_000_0555
jr_000_053e:
053e  bit 7, b
0540  jr z, jr_000_0549
0542  cp $02
0544  jr z, jr_000_055e
0546  inc a
0547  jr jr_000_0555
jr_000_0549:
0549  bit 2, b
054b  jr z, jr_000_055e
054d  and $03
054f  inc a
0550  cp $03
0552  jr nz, jr_000_0555
0554  xor a
jr_000_0555:
0555  ldh [$ff97], a
0557  ld a, $08
0559  call Call_000_3665
055c  jr jr_000_055e
Jump_000_055e:
jr_000_055e:
055e  ld a, [$dd2c]
0561  cp $ff
0563  jr nz, jr_000_056a
0565  ldh a, [$ff98]
0567  and a
0568  jr z, jr_000_056f
jr_000_056a:
056a  xor a
056b  ldh [$ff9f], a
056d  ldh [$ffa0], a
jr_000_056f:
056f  ldh a, [$ffa0]
0571  and a
0572  jr z, jr_000_0598
0574  ld a, $83
0576  call Call_000_2fed
0579  ldh a, [$ffaf]
057b  and $03
057d  inc a
057e  ld [$c0df], a
0581  or $80
0583  ldh [$ffaf], a
0585  call Call_000_0a9d
0588  call Call_000_528e
058b  xor a
058c  ldh [$ff96], a
058e  ldh [$ff9f], a
0590  ldh [$ffa0], a
0592  inc a
0593  ldh [$ff8a], a
0595  jp Jump_000_016d
Jump_000_0598:
jr_000_0598:
0598  ldh a, [$ff97]
059a  swap a
059c  add $60
059e  ld b, $30
05a0  call Call_000_32dd
05a3  ld bc, $7058
05a6  ldh a, [$ff96]
05a8  bit 2, a
05aa  ld hl, $05b8
05ad  jr z, jr_000_05b2
05af  ld hl, $05c5
jr_000_05b2:
05b2  call Call_000_3050
05b5  jp Jump_000_0217
05d2  ldh a, [$ff96]
05d4  bit 0, a
05d6  call z, Call_000_070f
05d9  ei
05da  call Call_000_081d
05dd  ld a, [$c0df]
05e0  swap a
05e2  add $28
05e4  ld b, $36
05e6  call Call_000_32dd
05e9  jp Jump_000_0217
05ec  call Call_000_352a
05ef  call Call_000_3606
05f2  call Call_000_2f8b
05f5  ei
05f6  call Call_000_081d
05f9  call Call_000_32ee
05fc  call Call_000_3551
05ff  call Call_000_486f
0602  call Call_000_1b50
0605  call Call_000_4a90
0608  ldh a, [$ff96]
060a  bit 0, a
060c  call z, Call_000_0680
060f  jp Jump_000_0217
Call_000_0612:
0612  ld a, $ff
0614  ld hl, $dd00
0617  ld de, $0016
061a  ld b, $03
jr_000_061c:
061c  ld [hl], a
061d  add hl, de
061e  dec b
061f  jr nz, jr_000_061c
0621  xor a
0622  ld [$dd85], a
jr_000_0625:
0625  ld hl, $dd56
0628  ld de, $0016
062b  ld b, $03
jr_000_062d:
062d  ld [hl], a
062e  add hl, de
062f  dec b
0630  jr nz, jr_000_062d
0632  ret
Jump_000_0633:
0633  ld a, $ff
0635  jr jr_000_0625
0637  ei
0638  call Call_000_081d
063b  call Call_000_2b33
063e  call Call_000_4cb1
0641  jp Jump_000_0217
0644  jp Jump_000_0217
0647  call Call_000_2e24
064a  ei
064b  call Call_000_081d
064e  call Call_000_2e73
0651  call Call_000_2b33
0654  call Call_000_4cb1
0657  call Call_000_500d
065a  ldh a, [$ff9f]
065c  cp $f0
065e  jr c, jr_000_067d
0660  ldh a, [$ff8a]
0662  cp $0a
0664  ld a, $04
0666  jr nz, jr_000_0671
0668  ldh a, [$ff96]
066a  bit 0, a
066c  jr nz, jr_000_067d
066e  ldh a, [$ff90]
0670  dec a
jr_000_0671:
0671  ldh [$ff8a], a
0673  xor a
0674  ld [$c0ea], a
0677  dec a
0678  ldh [$ff95], a
067a  jp Jump_000_016d
jr_000_067d:
067d  jp Jump_000_0217
Call_000_0680:
0680  ldh a, [$ffa5]
0682  and a
0683  jp nz, Jump_000_06db
0686  call Call_000_0766
0689  jr z, jr_000_06c5
068b  ldh a, [$ff99]
068d  bit 3, a
068f  jr z, jr_000_06c5
0691  ldh a, [$ffaf]
0693  bit 7, a
0695  jp nz, Jump_000_227c
0698  ldh a, [$ffc2]
069a  and $07
069c  cp $04
069e  jr nc, jr_000_06c5
06a0  ld de, $de00
06a3  rst RST_28
06b9  ld a, $ff
06bb  ldh [$ffa5], a
06bd  call Call_000_0612
06c0  ld a, $0b
06c2  jp Jump_000_3665
jr_000_06c5:
06c5  call Call_000_0a41
06c8  call Call_000_1f8e
06cb  call Call_000_0b7d
06ce  call Call_000_10ed
06d1  call Call_000_17a0
06d4  call Call_000_230c
06d7  call Call_000_2720
06da  ret
Jump_000_06db:
06db  call Call_000_0766
06de  jr z, jr_000_06fb
06e0  ldh a, [$ff99]
06e2  bit 3, a
06e4  jr z, jr_000_06fb
06e6  ld hl, $de00
06e9  ld b, $14
06eb  xor a
06ec  ldh [$ffa5], a
jr_000_06ee:
06ee  ld [hl+], a
06ef  dec b
06f0  jr nz, jr_000_06ee
06f2  call Call_000_32c8
06f5  call Call_000_32b9
06f8  jp Jump_000_0633
jr_000_06fb:
06fb  ldh a, [$ff99]
06fd  bit 2, a
06ff  ret z
0700  ldh a, [$ffc2]
0702  inc a
0703  and $0f
0705  cp $04
0707  jr c, jr_000_070a
0709  xor a
jr_000_070a:
070a  or $c0
070c  ldh [$ffc2], a
070e  ret
Call_000_070f:
070f  call Call_000_0766
0712  ret z
0713  ldh a, [$ffa1]
0715  and a
0716  jr z, jr_000_0726
0718  dec a
0719  ldh [$ffa1], a
071b  ret nz
071c  call Call_000_0a9d
071f  ld a, $01
0721  ldh [$ff8a], a
0723  jp Jump_000_016d
jr_000_0726:
0726  ldh a, [$ff99]
0728  cp $08
072a  jr nz, jr_000_0735
072c  ld a, $14
072e  ldh [$ffa1], a
0730  ld a, $09
0732  jp Jump_000_3665
jr_000_0735:
0735  ld a, [$c0df]
0738  ld b, a
0739  ldh a, [$ff99]
073b  cp $40
073d  jr nz, jr_000_0747
073f  ld a, b
0740  cp $01
0742  jr z, jr_000_0765
0744  dec a
0745  jr jr_000_075d
jr_000_0747:
0747  cp $80
0749  jr nz, jr_000_0753
074b  ld a, b
074c  cp $04
074e  jr z, jr_000_0765
0750  inc a
0751  jr jr_000_075d
jr_000_0753:
0753  cp $04
0755  jr nz, jr_000_0765
0757  ld a, [$c0df]
075a  and $03
075c  inc a
jr_000_075d:
075d  ld [$c0df], a
0760  ld a, $08
0762  call Call_000_3665
jr_000_0765:
0765  ret
Call_000_0766:
0766  ldh a, [$ffa3]
0768  and a
0769  ret z
076a  cp $01
076c  ret
Call_000_076d:
076d  ldh a, [$ff8d]
076f  bit 7, a
0771  jr nz, jr_000_077e
0773  rst RST_08
jr_000_077e:
077e  res 7, a
0780  rst RST_08
078b  xor a
078c  ldh [$ffaf], a
078e  inc a
078f  ldh [$ff97], a
0791  ld a, $14
0793  ldh [$ffa1], a
0795  ld hl, $ff8d
0798  inc [hl]
0799  ret
079a  ldh a, [rSB]
079c  cp $12
079e  jr z, jr_000_07ae
jr_000_07a0:
07a0  xor a
07a1  ldh [$ffa1], a
07a3  ret
07a4  ldh a, [rSB]
07a6  bit 0, a
07a8  jr z, jr_000_07a0
07aa  set 1, a
07ac  ldh [$ff96], a
jr_000_07ae:
07ae  ld hl, $ff8d
07b1  inc [hl]
07b2  ret
07b3  ldh a, [$ff9a]
07b5  ldh [$ff98], a
07b7  ldh a, [$ff9b]
07b9  ldh [$ff99], a
07bb  ld a, $84
07bd  ldh [$ff8d], a
07bf  jp Jump_000_2fed
07c2  ld a, $02
07c4  ldh [$ff8d], a
07c6  call Call_000_223e
07c9  ldh a, [$ff9c]
07cb  xor c
07cc  and c
07cd  ldh [$ff9d], a
07cf  ld a, c
07d0  ldh [$ff9c], a
jr_000_07d2:
07d2  ldh a, [$ff8b]
07d4  cp $01
07d6  jr nz, jr_000_07dd
07d8  call Call_000_0680
07db  jr jr_000_07e4
jr_000_07dd:
07dd  cp $02
07df  jr nz, jr_000_07e4
07e1  call Call_000_070f
jr_000_07e4:
07e4  call Call_000_369e
07e7  jp Jump_000_31ff
07ea  ld a, $04
07ec  ldh [$ff8d], a
07ee  call Call_000_223e
07f1  ldh a, [$ff9c]
07f3  xor c
07f4  and c
07f5  ldh [$ff9d], a
07f7  ldh [$ff99], a
07f9  ld a, c
07fa  ldh [$ff9c], a
07fc  ldh [$ff98], a
07fe  call Call_000_2fa0
0801  call Call_000_2225
0804  ldh a, [$ff9a]
0806  xor c
0807  and c
0808  ldh [$ff9b], a
080a  ld a, c
080b  ldh [$ff9a], a
080d  call Call_000_086a
0810  jp Jump_000_2fdb
0813  ld a, $82
0815  ldh [$ff8d], a
0817  call Call_000_2fed
081a  jr jr_000_07d2
081c  ret
Call_000_081d:
081d  ldh a, [$ff8d]
081f  cp $02
0821  ret nz
0822  call Call_000_2fa0
0825  call Call_000_2225
0828  ldh a, [$ff9a]
082a  xor c
082b  and c
082c  ldh [$ff9b], a
082e  ld a, c
082f  ldh [$ff9a], a
0831  call Call_000_086a
0834  jp Jump_000_2fdb
Call_000_0837:
0837  ldh a, [$ff96]
0839  bit 0, a
083b  ret z
083c  bit 1, a
083e  ld a, $03
0840  jr z, jr_000_0844
0842  ld a, $83
jr_000_0844:
0844  ldh [$ff8d], a
0846  ld a, $08
0848  call Call_000_2f67
084b  ei
jr_000_084c:
084c  ld a, $f0
084e  call Call_000_2fed
0851  ld a, $f0
0853  call Call_000_2fdb
jr_000_0856:
0856  ldh a, [rSC]
0858  bit 7, a
085a  jr nz, jr_000_0856
085c  ldh a, [rSB]
085e  cp $f0
0860  jr nz, jr_000_084c
0862  di
0863  ld hl, $ff8d
0866  dec [hl]
0867  jp Jump_000_2fed
Call_000_086a:
086a  ldh a, [$ff90]
086c  cp $04
086e  jr nz, jr_000_087f
0870  ldh a, [$ffec]
0872  cp $04
0874  jr z, jr_000_087f
0876  ldh a, [$ff93]
0878  and a
0879  ld c, $fe
087b  jr z, jr_000_087f
087d  ld c, $ff
jr_000_087f:
087f  ldh a, [$ff90]
0881  ldh [$ffec], a
0883  ld a, c
0884  ret
Call_000_0885:
0885  ld a, [$c004]
0888  add $80
088a  ld a, [$c005]
088d  adc $00
088f  ret
Call_000_0890:
0890  ld a, [$c002]
0893  add $80
0895  ld a, [$c003]
0898  adc $00
089a  ret
Call_000_089b:
089b  ld a, [$c024]
089e  add $80
08a0  ld a, [$c025]
08a3  adc $00
08a5  ret
Call_000_08a6:
08a6  ld a, [$c022]
08a9  add $80
08ab  ld a, [$c023]
08ae  adc $00
08b0  ret
Call_000_08b1:
08b1  ld a, [$c044]
08b4  add $80
08b6  ld a, [$c045]
08b9  adc $00
08bb  ret
Call_000_08bc:
08bc  ld a, [$c042]
08bf  add $80
08c1  ld a, [$c043]
08c4  adc $00
08c6  ret
Call_000_08c7:
08c7  push hl
08c8  ld a, [hl+]
08c9  ld h, [hl]
08ca  ld l, a
08cb  bit 5, c
08cd  jr z, jr_000_08df
08cf  ld de, $07ff
08d2  call Call_000_00c3
08d5  jr c, jr_000_08f1
08d7  ld a, l
08d8  sub b
08d9  ld l, a
08da  jr nc, jr_000_08f1
08dc  dec h
08dd  jr jr_000_08f1
jr_000_08df:
08df  bit 4, c
08e1  jr z, jr_000_08f1
08e3  ld de, $d001
08e6  call Call_000_00c3
08e9  jr nc, jr_000_08f1
08eb  ld a, l
08ec  add b
08ed  ld l, a
08ee  jr nc, jr_000_08f1
08f0  inc h
jr_000_08f1:
08f1  push hl
08f2  pop de
08f3  pop hl
08f4  ld a, e
08f5  ld [hl+], a
08f6  ld [hl], d
08f7  ret
Call_000_08f8:
08f8  push hl
08f9  ld a, [hl+]
08fa  ld h, [hl]
08fb  ld l, a
08fc  bit 6, c
08fe  jr z, jr_000_0924
0900  ldh a, [$ff96]
0902  bit 7, a
0904  jr z, jr_000_0914
0906  ld de, $08ff
0909  call Call_000_00c3
090c  jr c, jr_000_094a
090e  ld a, b
090f  sub $14
0911  ld b, a
0912  jr jr_000_091c
jr_000_0914:
0914  ld de, $8500
0917  call Call_000_00c3
091a  jr c, jr_000_094a
jr_000_091c:
091c  ld a, l
091d  sub b
091e  ld l, a
091f  jr nc, jr_000_094a
0921  dec h
0922  jr jr_000_094a
jr_000_0924:
0924  bit 7, c
0926  jr z, jr_000_094a
0928  ldh a, [$ff96]
092a  bit 7, a
092c  jr nz, jr_000_093c
092e  ld de, $e701
0931  call Call_000_00c3
0934  jr nc, jr_000_094a
0936  ld a, b
0937  sub $14
0939  ld b, a
093a  jr jr_000_0944
jr_000_093c:
093c  ld de, $6b00
093f  call Call_000_00c3
0942  jr nc, jr_000_094a
jr_000_0944:
0944  ld a, l
0945  add b
0946  ld l, a
0947  jr nc, jr_000_094a
0949  inc h
jr_000_094a:
094a  push hl
094b  pop de
094c  pop hl
094d  ld a, e
094e  ld [hl+], a
094f  ld [hl], d
0950  ret
Call_000_0951:
0951  inc hl
0952  ld a, [hl+]
0953  cp $78
0955  jr nc, jr_000_0958
0957  dec a
jr_000_0958:
0958  ld b, a
0959  inc hl
095a  ld a, [hl]
095b  jr jr_000_096a
Call_000_095d:
095d  ld a, [hl+]
095e  add $80
0960  ld a, [hl+]
0961  adc $00
0963  ld b, a
0964  ld a, [hl+]
0965  add $80
0967  ld a, [hl]
0968  adc $00
jr_000_096a:
096a  ldh [$ffcc], a
096c  ld c, a
096d  ld a, $6c
096f  sub c
0970  jr nc, jr_000_0974
0972  cpl
0973  inc a
jr_000_0974:
0974  ldh [$ffce], a
0976  ld a, b
0977  ldh [$ffcd], a
0979  ld a, $b8
097b  sub b
097c  jr nc, jr_000_0980
097e  cpl
097f  inc a
jr_000_0980:
0980  ldh [$ffcf], a
0982  ldh a, [$ffce]
0984  ld e, a
0985  call Call_000_308f
0988  ldh a, [$ffcf]
098a  call Call_000_30f8
098d  ld l, h
098e  ld h, c
098f  ld a, $48
0991  call Call_000_3143
0994  srl l
0996  srl l
0998  ldh a, [$ffcd]
099a  cp $b8
099c  jr c, jr_000_09a2
099e  ld a, l
099f  cpl
09a0  inc a
09a1  ld l, a
jr_000_09a2:
09a2  ldh a, [$ffcc]
09a4  cp $6c
09a6  jr nc, jr_000_09ab
09a8  add l
09a9  jr jr_000_09ac
jr_000_09ab:
09ab  sub l
jr_000_09ac:
09ac  ldh [$ffd0], a
09ae  ldh a, [$ffcd]
09b0  ld e, $28
09b2  call Call_000_308f
09b5  ld a, $2f
09b7  call Call_000_3143
09ba  ld a, $1c
09bc  add l
09bd  ld b, a
09be  ldh a, [$ffd0]
09c0  ld c, a
09c1  ret
Call_000_09c2:
09c2  push bc
09c3  ld l, a
09c4  ld a, [$c040]
09c7  cp $02
09c9  jr nz, jr_000_09d4
09cb  ld a, l
09cc  srl a
09ce  srl a
09d0  srl a
09d2  add l
09d3  ld l, a
jr_000_09d4:
09d4  ld a, l
09d5  ld e, $06
09d7  call Call_000_308f
09da  ld a, $10
09dc  call Call_000_3143
09df  inc l
09e0  ldh a, [$ffcd]
09e2  cp $c8
09e4  jr nc, jr_000_09f5
09e6  dec l
09e7  jr z, jr_000_09f5
09e9  cp $a8
09eb  jr nc, jr_000_09f5
09ed  dec l
09ee  jr z, jr_000_09f5
09f0  cp $78
09f2  jr nc, jr_000_09f5
09f4  dec l
jr_000_09f5:
09f5  pop bc
09f6  ld a, b
09f7  sub l
09f8  ld b, a
09f9  ret
Call_000_09fa:
09fa  ld a, [hl+]
09fb  ld a, [hl+]
09fc  ld d, a
09fd  ld a, [hl+]
09fe  ld a, [hl]
09ff  ld e, a
0a00  ld c, $00
0a02  ld a, d
0a03  cp $78
0a05  jr c, jr_000_0a12
0a07  set 1, c
0a09  cpl
0a0a  add $f0
0a0c  ld d, a
0a0d  ld a, e
0a0e  cpl
0a0f  add $d8
0a11  ld e, a
jr_000_0a12:
0a12  ld a, e
0a13  cp $6c
0a15  jr c, jr_000_0a1c
0a17  set 0, c
0a19  cpl
0a1a  add $d8
jr_000_0a1c:
0a1c  cp $36
0a1e  ret c
0a1f  ld a, d
0a20  cp $37
0a22  jr c, jr_000_0a29
0a24  set 3, c
0a26  cp $55
0a28  ret c
jr_000_0a29:
0a29  set 2, c
0a2b  ret
Call_000_0a2c:
0a2c  ld c, $00
0a2e  cp $08
0a30  ret z
0a31  inc c
0a32  cp $0b
0a34  ret z
0a35  inc c
0a36  cp $0e
0a38  ret z
0a39  inc c
0a3a  cp $10
0a3c  ret z
0a3d  inc c
0a3e  cp $05
0a40  ret
Call_000_0a41:
0a41  ld a, [$c040]
0a44  cp $03
0a46  ret c
0a47  cp $05
0a49  ret nc
0a4a  ld c, $00
0a4c  ldh a, [$ffa8]
0a4e  ld b, a
0a4f  call Call_000_08b1
0a52  sub b
0a53  jr c, jr_000_0a59
0a55  cp $30
0a57  jr nc, jr_000_0a64
jr_000_0a59:
0a59  ld a, [$c050]
0a5c  bit 7, a
0a5e  jr z, jr_000_0a71
0a60  ld c, $20
0a62  jr jr_000_0a71
jr_000_0a64:
0a64  cp $70
0a66  jr c, jr_000_0a71
0a68  ld a, [$c050]
0a6b  bit 7, a
0a6d  jr nz, jr_000_0a71
0a6f  ld c, $10
jr_000_0a71:
0a71  ldh a, [$ffaa]
0a73  ld b, a
0a74  call Call_000_08bc
0a77  sub b
0a78  jr c, jr_000_0a7e
0a7a  cp $28
0a7c  jr nc, jr_000_0a8b
jr_000_0a7e:
0a7e  ld a, [$c04f]
0a81  bit 7, a
0a83  jr z, jr_000_0a9a
0a85  ld a, c
0a86  or $40
0a88  ld c, a
0a89  jr jr_000_0a9a
jr_000_0a8b:
0a8b  cp $68
0a8d  jr c, jr_000_0a9a
0a8f  ld a, [$c04f]
0a92  bit 7, a
0a94  jr nz, jr_000_0a9a
0a96  ld a, c
0a97  or $80
0a99  ld c, a
jr_000_0a9a:
0a9a  jp Jump_000_3214
Call_000_0a9d:
0a9d  ld hl, $c080
0aa0  ld b, $40
0aa2  xor a
jr_000_0aa3:
0aa3  ld [hl+], a
0aa4  dec b
0aa5  jr nz, jr_000_0aa3
0aa7  ld a, [$c0df]
0aaa  dec a
0aab  ldh [$ffc5], a
0aad  rst RST_18
0ab3  ld [$c088], a
0ab6  ld [$c0a8], a
0ab9  ldh a, [$ffc5]
0abb  rst RST_18
0ac1  ld [$c089], a
0ac4  ld [$c0a9], a
0ac7  ldh a, [$ffc5]
0ac9  ld hl, $0b35
0acc  call Call_000_3047
0acf  ld de, $c090
0ad2  ld b, $10
jr_000_0ad4:
0ad4  ld a, [hl+]
0ad5  ld [de], a
0ad6  inc e
0ad7  dec b
0ad8  jr nz, jr_000_0ad4
0ada  ldh a, [$ffc5]
0adc  ld hl, $0b35
0adf  call Call_000_3047
0ae2  ld de, $c0b0
0ae5  ld b, $10
jr_000_0ae7:
0ae7  ld a, [hl+]
0ae8  ld [de], a
0ae9  inc e
0aea  dec b
0aeb  jr nz, jr_000_0ae7
0aed  ld a, [$c090]
0af0  cpl
0af1  inc a
0af2  sub $10
0af4  ld [$c090], a
0af7  ldh a, [$ff96]
0af9  bit 0, a
0afb  jr nz, jr_000_0b25
0afd  ldh a, [$ffaf]
0aff  bit 7, a
0b01  jr nz, jr_000_0b25
0b03  ld hl, $c092
0b06  call Call_000_0b26
0b09  ld hl, $c096
0b0c  call Call_000_0b26
0b0f  ldh a, [$ffc5]
0b11  rst RST_18
0b17  ld [$c088], a
0b1a  ldh a, [$ffc5]
0b1c  rst RST_18
0b22  ld [$c089], a
jr_000_0b25:
0b25  ret
Call_000_0b26:
0b26  ld a, [$c0df]
0b29  cp $01
0b2b  ret z
0b2c  ld a, [hl]
0b2d  ld b, a
0b2e  srl b
0b30  srl b
0b32  sub b
0b33  ld [hl], a
0b34  ret
Call_000_0b7d:
0b7d  ld hl, $ff96
0b80  res 7, [hl]
0b82  ld hl, $c002
0b85  call Call_000_09fa
0b88  ld a, c
0b89  ld [$c00b], a
0b8c  ld a, [$c000]
0b8f  rst RST_08
0ba0  call Call_000_0da5
0ba3  call Call_000_0bcd
0ba6  ld a, $01
0ba8  ld [$c000], a
0bab  ret
Call_000_0bac:
0bac  ldh a, [$ff91]
0bae  bit 1, a
0bb0  ld a, $58
0bb2  jr nz, jr_000_0bb6
0bb4  ld a, $7f
jr_000_0bb6:
0bb6  ld [$c005], a
0bb9  ld a, $7f
0bbb  jr nz, jr_000_0bbf
0bbd  ld a, $80
jr_000_0bbf:
0bbf  ld [$c004], a
0bc2  ld a, $b9
0bc4  ld [$c003], a
0bc7  ld a, $80
0bc9  ld [$c002], a
0bcc  ret
Call_000_0bcd:
0bcd  ldh a, [$ff91]
0bcf  bit 1, a
0bd1  ld a, $45
0bd3  jr nz, jr_000_0bd7
0bd5  ld a, $92
jr_000_0bd7:
0bd7  jr jr_000_0bb6
0bd9  call Call_000_0db8
0bdc  call Call_000_0dfe
0bdf  jp Jump_000_10a9
0be2  ld a, [$c00a]
0be5  cp $06
0be7  jr z, jr_000_0bf7
0be9  cp $09
0beb  jr z, jr_000_0bf7
0bed  ld a, [$c011]
0bf0  rst RST_18
0bf5  jr jr_000_0bff
jr_000_0bf7:
0bf7  ld a, [$c011]
0bfa  rst RST_18
jr_000_0bff:
0bff  ld b, a
0c00  ld a, [$c010]
0c03  inc a
0c04  ld [$c010], a
0c07  cp b
0c08  jr c, jr_000_0c19
0c0a  xor a
0c0b  ld [$c010], a
0c0e  ld a, [$c011]
0c11  inc a
0c12  cp $03
0c14  jr nc, jr_000_0c3e
0c16  ld [$c011], a
jr_000_0c19:
0c19  ld a, [$c00a]
0c1c  ld b, a
0c1d  ld a, [$c011]
0c20  add b
0c21  rst RST_18
0c35  ld [$c001], a
0c38  call Call_000_0e77
0c3b  jp Jump_000_10a9
Jump_000_0c3e:
jr_000_0c3e:
0c3e  xor a
0c3f  ld [$c010], a
0c42  ld [$c011], a
0c45  inc a
0c46  ld [$c000], a
0c49  jp Jump_000_10a9
0c4c  ld a, $03
0c4e  ld [$c001], a
0c51  ld a, [$c017]
0c54  and a
0c55  jr nz, jr_000_0c62
0c57  ld a, $01
0c59  ld [$c040], a
0c5c  ld a, $0e
0c5e  ld [$c047], a
0c61  xor a
jr_000_0c62:
0c62  inc a
0c63  ld [$c017], a
0c66  cp $10
0c68  jr c, jr_000_0c80
0c6a  sub $10
0c6c  cp $04
0c6e  jr c, jr_000_0c99
0c70  sub $04
0c72  cp $10
0c74  jr c, jr_000_0c80
0c76  xor a
0c77  ld [$c017], a
0c7a  ld a, $05
0c7c  ld [$c000], a
0c7f  ret
jr_000_0c80:
0c80  sub $08
0c82  ld a, [$c047]
0c85  jr c, jr_000_0c8b
0c87  inc a
0c88  inc a
0c89  jr jr_000_0c8d
jr_000_0c8b:
0c8b  dec a
0c8c  dec a
jr_000_0c8d:
0c8d  ld [$c047], a
0c90  cp $0e
0c92  jr nc, jr_000_0c99
0c94  ld a, $13
0c96  ld [$c001], a
jr_000_0c99:
0c99  ret
0c9a  call Call_000_0da5
0c9d  xor a
0c9e  ldh [$ffad], a
0ca0  ld [$c017], a
0ca3  call Call_000_0bac
0ca6  call Call_000_1f6b
0ca9  ldh a, [$ffbb]
0cab  ldh [$ffa8], a
0cad  ld a, $30
0caf  ldh [$ffaa], a
0cb1  ld a, $05
0cb3  ld [$c000], a
0cb6  ret
0cb7  ld a, $03
0cb9  ld [$c001], a
0cbc  ldh a, [$ff9a]
0cbe  and a
0cbf  jr nz, jr_000_0cd6
0cc1  ld a, [$c017]
0cc4  inc a
0cc5  ld [$c017], a
0cc8  cp $b4
0cca  jr c, jr_000_0d13
0ccc  xor a
0ccd  ld [$c017], a
0cd0  ld a, $03
0cd2  ld [$c000], a
0cd5  ret
jr_000_0cd6:
0cd6  xor a
0cd7  ld [$c017], a
0cda  ldh a, [$ff9a]
0cdc  ld c, a
0cdd  ldh a, [$ff91]
0cdf  bit 1, a
0ce1  ld de, $3f80
0ce4  jr nz, jr_000_0ce9
0ce6  ld de, $7380
jr_000_0ce9:
0ce9  ld hl, $c004
0cec  ld a, [hl+]
0ced  ld h, [hl]
0cee  ld l, a
0cef  call Call_000_00c3
0cf2  jr nc, jr_000_0cf6
0cf4  res 5, c
jr_000_0cf6:
0cf6  ldh a, [$ff91]
0cf8  bit 1, a
0cfa  ld de, $6480
0cfd  jr nz, jr_000_0d02
0cff  ld de, $9880
jr_000_0d02:
0d02  call Call_000_00c3
0d05  jr c, jr_000_0d09
0d07  res 4, c
jr_000_0d09:
0d09  ld a, [$c008]
0d0c  ld b, a
0d0d  ld hl, $c004
0d10  call Call_000_08c7
jr_000_0d13:
0d13  ld a, [$c002]
0d16  ld [$c042], a
0d19  ld a, [$c003]
0d1c  ld [$c043], a
0d1f  ld a, [$c004]
0d22  ld [$c044], a
0d25  ld a, [$c005]
0d28  add $06
0d2a  call Call_000_16f9
0d2d  ldh a, [$ff9b]
0d2f  and $03
0d31  ret z
0d32  ld a, $02
0d34  ld [$c040], a
0d37  ld a, $06
0d39  ld [$c000], a
0d3c  ret
0d3d  ld a, $04
0d3f  ld [$c001], a
0d42  ldh a, [$ff9b]
0d44  and $03
0d46  jr z, jr_000_0d5e
0d48  ld [$c013], a
0d4b  ld a, $05
0d4d  call Call_000_3665
0d50  xor a
0d51  ld [$c010], a
0d54  ld [$c011], a
0d57  ld a, $07
0d59  ld [$c000], a
0d5c  jr jr_000_0d75
jr_000_0d5e:
0d5e  ld a, [$c052]
0d61  bit 7, a
0d63  jr z, jr_000_0d75
0d65  ld a, [$c047]
0d68  cp $30
0d6a  jr nc, jr_000_0d75
0d6c  xor a
0d6d  ld [$c017], a
0d70  ld a, $05
0d72  ld [$c000], a
jr_000_0d75:
0d75  ret
0d76  ld a, [$c011]
0d79  rst RST_18
0d7d  ld b, a
0d7e  ld a, [$c010]
0d81  inc a
0d82  ld [$c010], a
0d85  cp b
0d86  jr c, jr_000_0d98
0d88  xor a
0d89  ld [$c010], a
0d8c  ld a, [$c011]
0d8f  inc a
0d90  cp $02
0d92  jp nc, Jump_000_0c3e
0d95  ld [$c011], a
jr_000_0d98:
0d98  ld a, [$c011]
0d9b  rst RST_18
0d9f  ld [$c001], a
0da2  jp Jump_000_0e77
Call_000_0da5:
0da5  ld a, [$c088]
0da8  ld [$c008], a
0dab  ld a, [$c089]
0dae  ld [$c009], a
0db1  ld a, [$c096]
0db4  ld [$c016], a
0db7  ret
Call_000_0db8:
0db8  ld a, [$c008]
0dbb  ld b, a
0dbc  ldh a, [$ff9a]
0dbe  ld c, a
0dbf  ld hl, $c004
0dc2  call Call_000_08c7
0dc5  ld a, [$c009]
0dc8  ld b, a
0dc9  ld hl, $c002
0dcc  call Call_000_08f8
0dcf  ld a, [$c011]
0dd2  and $04
0dd4  srl a
0dd6  srl a
0dd8  ld d, a
0dd9  ld a, c
0dda  and $f0
0ddc  jr z, jr_000_0dfa
0dde  bit 5, a
0de0  jr z, jr_000_0de4
0de2  inc d
0de3  inc d
jr_000_0de4:
0de4  ld a, [$c010]
0de7  add b
0de8  ld [$c010], a
0deb  ld a, [$c011]
0dee  adc $00
0df0  ld [$c011], a
0df3  ld a, d
0df4  rst RST_18
jr_000_0dfa:
0dfa  ld [$c001], a
0dfd  ret
Call_000_0dfe:
0dfe  ldh a, [$ff9b]
0e00  and $03
0e02  ret z
0e03  ld [$c013], a
0e06  ld a, $05
0e08  call Call_000_3665
0e0b  call Call_000_0890
0e0e  call Call_000_1722
0e11  ld a, [$c004]
0e14  ld e, a
0e15  ld a, [$c005]
0e18  ld d, a
0e19  call Call_000_00c3
0e1c  ld a, $00
0e1e  jr nc, jr_000_0e22
0e20  ld a, $03
jr_000_0e22:
0e22  ld [$c00a], a
0e25  ld hl, $0400
0e28  add hl, de
0e29  ld a, h
0e2a  cp $08
0e2c  jr nc, jr_000_0e46
0e2e  ldh a, [$ff9a]
0e30  bit 5, a
0e32  jr z, jr_000_0e38
0e34  ld a, $00
0e36  jr jr_000_0e3e
jr_000_0e38:
0e38  bit 4, a
0e3a  jr z, jr_000_0e46
0e3c  ld a, $03
jr_000_0e3e:
0e3e  ld [$c00a], a
0e41  ld a, $ff
0e43  ld [$c019], a
jr_000_0e46:
0e46  ld b, $00
0e48  ld a, [$c047]
0e4b  cp $40
0e4d  jr c, jr_000_0e59
0e4f  ld a, [$c00a]
0e52  add $0c
0e54  ld [$c00a], a
0e57  jr jr_000_0e69
jr_000_0e59:
0e59  ld a, [$c00b]
0e5c  cp $0c
0e5e  jr c, jr_000_0e69
0e60  ld a, [$c00a]
0e63  add $06
0e65  ld [$c00a], a
0e68  inc b
jr_000_0e69:
0e69  ld a, b
0e6a  ld [$c011], a
0e6d  xor a
0e6e  ld [$c010], a
0e71  ld a, $02
0e73  ld [$c000], a
0e76  ret
Call_000_0e77:
Jump_000_0e77:
0e77  ldh a, [$ffad]
0e79  bit 7, a
0e7b  ret nz
0e7c  bit 5, a
0e7e  ret nz
0e7f  bit 4, a
0e81  ret nz
0e82  ld a, [$c043]
0e85  cp $78
0e87  ret c
0e88  ld a, [$c001]
0e8b  call Call_000_0a2c
0e8e  ret nz
0e8f  ld a, c
0e90  ld [$c018], a
0e93  ld a, [$c018]
0e96  rst RST_18
0e9d  add $10
0e9f  ldh [$ffc5], a
0ea1  ld a, [$c018]
0ea4  rst RST_18
0eab  add $11
0ead  ld b, a
0eae  ldh a, [$ffc5]
0eb0  ld c, a
0eb1  ld hl, $c002
0eb4  call Call_000_1c05
0eb7  ret nc
0eb8  cp c
0eb9  ret c
0eba  ld a, [$c018]
0ebd  rst RST_18
0ec4  ld b, a
0ec5  ldh a, [$ffc5]
0ec7  sub b
0ec8  bit 7, a
0eca  jr z, jr_000_0ed0
0ecc  cpl
0ecd  inc a
0ece  set 7, a
jr_000_0ed0:
0ed0  ld b, a
0ed1  ld a, [$c018]
0ed4  bit 0, a
0ed6  ld a, b
0ed7  jr z, jr_000_0edb
0ed9  xor $80
jr_000_0edb:
0edb  ld [$c014], a
0ede  ld a, [$c018]
0ee1  rst RST_18
0ee8  add $1e
0eea  ldh [$ffc5], a
0eec  ld a, [$c018]
0eef  rst RST_18
0ef6  add $23
0ef8  ld b, a
0ef9  ldh a, [$ffc5]
0efb  ld c, a
0efc  ld hl, $c004
0eff  call Call_000_1bef
0f02  add $20
0f04  cp b
0f05  ret nc
0f06  cp c
0f07  ret c
0f08  ld a, [$c018]
0f0b  rst RST_18
0f12  ldh [$ffc5], a
0f14  ld a, [$c018]
0f17  rst RST_18
0f1e  ld h, a
0f1f  ldh a, [$ffc5]
0f21  ld l, a
0f22  ld a, [$c007]
0f25  call Call_000_1c20
0f28  ret nc
0f29  cp l
0f2a  ret c
0f2b  ld a, $01
0f2d  ld [$c05c], a
0f30  ld a, $80
0f32  ld [$c04f], a
0f35  ld a, [$c000]
0f38  cp $07
0f3a  jp nz, Jump_000_0fca
0f3d  ld a, [$c013]
0f40  bit 1, a
0f42  ld a, [$c092]
0f45  jr nz, jr_000_0f55
0f47  ld [$c051], a
0f4a  ld a, [$c047]
0f4d  sub $26
0f4f  srl a
0f51  add $0c
0f53  jr jr_000_0f68
jr_000_0f55:
0f55  call Call_000_1e87
0f58  ld [$c051], a
0f5b  ld hl, $c015
0f5e  and $7f
0f60  ld [hl], a
0f61  ld e, $58
0f63  call Call_000_1cf6
0f66  add $0c
jr_000_0f68:
0f68  ld [$c052], a
0f6b  ldh a, [$ff9a]
0f6d  call Call_000_1e3c
0f70  ld de, $846c
0f73  ldh a, [$ff91]
0f75  bit 1, a
0f77  jr nz, jr_000_0f7c
0f79  ld de, $546c
jr_000_0f7c:
0f7c  ldh a, [$ff9a]
0f7e  bit 5, a
0f80  jr z, jr_000_0f86
0f82  ld a, $f0
0f84  jr jr_000_0f8c
jr_000_0f86:
0f86  bit 4, a
0f88  jr z, jr_000_0f9b
0f8a  ld a, $10
jr_000_0f8c:
0f8c  push af
0f8d  ld a, [$c013]
0f90  bit 0, a
0f92  jr nz, jr_000_0f98
0f94  pop af
0f95  sra a
0f97  push af
jr_000_0f98:
0f98  pop af
0f99  add d
0f9a  ld d, a
jr_000_0f9b:
0f9b  call Call_000_1d22
0f9e  xor $80
0fa0  ld b, a
0fa1  ld a, [$c013]
0fa4  bit 1, a
0fa6  ld c, $10
0fa8  jr z, jr_000_0fac
0faa  ld c, $04
jr_000_0fac:
0fac  ld a, [$c0df]
0faf  cp $03
0fb1  jr nc, jr_000_0fb7
0fb3  srl c
0fb5  srl c
jr_000_0fb7:
0fb7  ldh a, [$ff9a]
0fb9  call Call_000_1e0d
0fbc  ld a, b
0fbd  ld [$c050], a
0fc0  ld a, [$c018]
0fc3  ld b, a
0fc4  ld a, [$c013]
0fc7  jp Jump_000_165c
Jump_000_0fca:
0fca  ld a, [$c019]
0fcd  and a
0fce  jr z, jr_000_0fdc
0fd0  ld a, [$c018]
0fd3  add $05
0fd5  ld [$c018], a
0fd8  xor a
0fd9  ld [$c019], a
jr_000_0fdc:
0fdc  ld a, [$c00a]
jr_000_0fdf:
0fdf  cp $06
0fe1  jr c, jr_000_0fe7
0fe3  sub $06
0fe5  jr jr_000_0fdf
jr_000_0fe7:
0fe7  ld b, $04
0fe9  and a
0fea  jr z, jr_000_0fee
0fec  ld b, $fc
jr_000_0fee:
0fee  ld hl, $c016
0ff1  ldh a, [$ff9a]
0ff3  call Call_000_1e9f
0ff6  call Call_000_08bc
0ff9  sub $b9
0ffb  jr nc, jr_000_1009
0ffd  cpl
0ffe  inc a
0fff  sra a
1001  sra a
1003  ld e, a
1004  ld a, $52
1006  sub e
1007  jr jr_000_100f
jr_000_1009:
1009  sra a
100b  sra a
100d  add $52
jr_000_100f:
100f  ld e, a
1010  ld d, $6c
1012  ld a, [$c00a]
1015  cp $0c
1017  jr nc, jr_000_1028
1019  ld a, [$c018]
101c  sub $05
101e  jr c, jr_000_1028
1020  ld d, $5c
1022  bit 0, a
1024  jr z, jr_000_1028
1026  ld d, $7c
jr_000_1028:
1028  ld a, [$c00a]
102b  cp $0c
102d  jr c, jr_000_1037
102f  ld e, $68
1031  ld a, [hl]
1032  add $10
1034  ld [hl], a
1035  jr jr_000_1046
jr_000_1037:
1037  cp $06
1039  jr c, jr_000_1046
103b  ld e, $58
103d  ld a, [hl]
103e  sub $10
1040  ld [hl], a
1041  ld a, $02
1043  ld [$c05c], a
jr_000_1046:
1046  ld a, [$c018]
1049  cp $05
104b  jr nc, jr_000_1055
104d  push hl
104e  ld hl, $c004
1051  call Call_000_1e6e
1054  pop hl
jr_000_1055:
1055  ldh a, [$ff9a]
1057  ld b, a
1058  ld a, [$c00a]
105b  call Call_000_1d71
105e  ld a, [$c00a]
1061  call Call_000_1d90
1064  call Call_000_1cf6
1067  ld a, [$c00a]
106a  cp $0c
106c  jr c, jr_000_1078
106e  ld a, $90
1070  ld [$c052], a
1073  ld a, $22
1075  ld [$c05c], a
jr_000_1078:
1078  ld a, [$c015]
107b  ld b, a
107c  ld a, [$c013]
107f  call Call_000_1dd9
1082  ld a, b
1083  ld [$c051], a
1086  ld a, $80
1088  ld [$c04f], a
108b  call Call_000_1d22
108e  ld c, $10
1090  ld hl, $c014
1093  call Call_000_1d57
1096  call Call_000_1cb1
1099  ld a, [$c018]
109c  cp $05
109e  jr c, jr_000_10a2
10a0  sub $05
jr_000_10a2:
10a2  ld b, a
10a3  ld a, [$c013]
10a6  jp Jump_000_165c
Jump_000_10a9:
10a9  ldh a, [$ffad]
10ab  bit 7, a
10ad  ret nz
10ae  bit 4, a
10b0  ret nz
10b1  call Call_000_0890
10b4  ld b, a
10b5  call Call_000_08bc
10b8  sub b
10b9  jr nc, jr_000_10bd
10bb  cpl
10bc  inc a
jr_000_10bd:
10bd  cp $03
10bf  ret nc
10c0  call Call_000_0885
10c3  ld b, a
10c4  call Call_000_08b1
10c7  sub b
10c8  jr nc, jr_000_10cc
10ca  cpl
10cb  inc a
jr_000_10cc:
10cc  cp $04
10ce  ret nc
10cf  ld a, [$c047]
10d2  cp $34
10d4  ret nc
10d5  ldh a, [$ffad]
10d7  bit 3, a
10d9  jr z, jr_000_10df
10db  or $30
10dd  jr jr_000_10e3
jr_000_10df:
10df  or $38
10e1  ldh [$ffae], a
jr_000_10e3:
10e3  ldh [$ffad], a
10e5  ld a, $0d
10e7  call Call_000_3665
10ea  jp Jump_000_1c84
Call_000_10ed:
10ed  ld hl, $ff96
10f0  set 7, [hl]
10f2  ld hl, $c022
10f5  call Call_000_09fa
10f8  ld a, c
10f9  ld [$c02b], a
10fc  ld a, [$c020]
10ff  rst RST_08
1110  call Call_000_1317
1113  call Call_000_113d
1116  ld a, $01
1118  ld [$c020], a
111b  ret
Call_000_111c:
111c  ldh a, [$ff91]
111e  bit 1, a
1120  ld a, $58
1122  jr z, jr_000_1126
1124  ld a, $7f
jr_000_1126:
1126  ld [$c025], a
1129  ld a, $7f
112b  jr z, jr_000_112f
112d  ld a, $80
jr_000_112f:
112f  ld [$c024], a
1132  ld a, $36
1134  ld [$c023], a
1137  ld a, $7f
1139  ld [$c022], a
113c  ret
Call_000_113d:
113d  ldh a, [$ff91]
113f  bit 1, a
1141  ld a, $45
1143  jr z, jr_000_1147
1145  ld a, $92
jr_000_1147:
1147  jr jr_000_1126
1149  call Call_000_132a
114c  call Call_000_1370
114f  jp Jump_000_1618
1152  ld a, [$c02a]
1155  cp $06
1157  jr z, jr_000_1167
1159  cp $09
115b  jr z, jr_000_1167
115d  ld a, [$c031]
1160  rst RST_18
1165  jr jr_000_116f
jr_000_1167:
1167  ld a, [$c031]
116a  rst RST_18
jr_000_116f:
116f  ld b, a
1170  ld a, [$c030]
1173  inc a
1174  ld [$c030], a
1177  cp b
1178  jr c, jr_000_1189
117a  xor a
117b  ld [$c030], a
117e  ld a, [$c031]
1181  inc a
1182  cp $03
1184  jr nc, jr_000_11ae
1186  ld [$c031], a
jr_000_1189:
1189  ld a, [$c02a]
118c  ld b, a
118d  ld a, [$c031]
1190  add b
1191  rst RST_18
11a5  ld [$c021], a
11a8  call Call_000_13e8
11ab  jp Jump_000_1618
Jump_000_11ae:
jr_000_11ae:
11ae  xor a
11af  ld [$c030], a
11b2  ld [$c031], a
11b5  inc a
11b6  ld [$c020], a
11b9  jp Jump_000_1618
11bc  ld a, $03
11be  ld [$c021], a
11c1  ld a, [$c037]
11c4  and a
11c5  jr nz, jr_000_11d2
11c7  ld a, $01
11c9  ld [$c040], a
11cc  ld a, $0e
11ce  ld [$c047], a
11d1  xor a
jr_000_11d2:
11d2  inc a
11d3  ld [$c037], a
11d6  cp $10
11d8  jr c, jr_000_11f0
11da  sub $10
11dc  cp $04
11de  jr c, jr_000_1209
11e0  sub $04
11e2  cp $10
11e4  jr c, jr_000_11f0
11e6  xor a
11e7  ld [$c037], a
11ea  ld a, $05
11ec  ld [$c020], a
11ef  ret
jr_000_11f0:
11f0  sub $08
11f2  ld a, [$c047]
11f5  jr c, jr_000_11fb
11f7  inc a
11f8  inc a
11f9  jr jr_000_11fd
jr_000_11fb:
11fb  dec a
11fc  dec a
jr_000_11fd:
11fd  ld [$c047], a
1200  cp $0e
1202  jr nc, jr_000_1209
1204  ld a, $13
1206  ld [$c021], a
jr_000_1209:
1209  ret
120a  call Call_000_1317
120d  ld a, $80
120f  ldh [$ffad], a
1211  xor a
1212  ld [$c037], a
1215  call Call_000_111c
1218  call Call_000_1f6b
121b  ldh a, [$ffbb]
121d  ldh [$ffa8], a
121f  ld a, $28
1221  ldh [$ffaa], a
1223  ld a, $05
1225  ld [$c020], a
1228  ret
1229  ld a, $03
122b  ld [$c021], a
122e  ldh a, [$ff9c]
1230  and a
1231  jr nz, jr_000_1248
1233  ld a, [$c037]
1236  inc a
1237  ld [$c037], a
123a  cp $b4
123c  jr c, jr_000_1285
123e  xor a
123f  ld [$c037], a
1242  ld a, $03
1244  ld [$c020], a
1247  ret
jr_000_1248:
1248  xor a
1249  ld [$c037], a
124c  ldh a, [$ff9c]
124e  ld c, a
124f  ldh a, [$ff91]
1251  bit 1, a
1253  ld de, $3f80
1256  jr z, jr_000_125b
1258  ld de, $7380
jr_000_125b:
125b  ld hl, $c024
125e  ld a, [hl+]
125f  ld h, [hl]
1260  ld l, a
1261  call Call_000_00c3
1264  jr nc, jr_000_1268
1266  res 5, c
jr_000_1268:
1268  ldh a, [$ff91]
126a  bit 1, a
126c  ld de, $6480
126f  jr z, jr_000_1274
1271  ld de, $9880
jr_000_1274:
1274  call Call_000_00c3
1277  jr c, jr_000_127b
1279  res 4, c
jr_000_127b:
127b  ld a, [$c028]
127e  ld b, a
127f  ld hl, $c024
1282  call Call_000_08c7
jr_000_1285:
1285  ld a, [$c022]
1288  ld [$c042], a
128b  ld a, [$c023]
128e  ld [$c043], a
1291  ld a, [$c024]
1294  ld [$c044], a
1297  ld a, [$c025]
129a  sub $06
129c  call Call_000_16f9
129f  ldh a, [$ff9d]
12a1  and $03
12a3  ret z
12a4  ld a, $02
12a6  ld [$c040], a
12a9  ld a, $06
12ab  ld [$c020], a
12ae  ret
12af  ld a, $04
12b1  ld [$c021], a
12b4  ldh a, [$ff9d]
12b6  and $03
12b8  jr z, jr_000_12d0
12ba  ld [$c033], a
12bd  ld a, $05
12bf  call Call_000_3665
12c2  xor a
12c3  ld [$c030], a
12c6  ld [$c031], a
12c9  ld a, $07
12cb  ld [$c020], a
12ce  jr jr_000_12e7
jr_000_12d0:
12d0  ld a, [$c052]
12d3  bit 7, a
12d5  jr z, jr_000_12e7
12d7  ld a, [$c047]
12da  cp $30
12dc  jr nc, jr_000_12e7
12de  xor a
12df  ld [$c037], a
12e2  ld a, $05
12e4  ld [$c020], a
jr_000_12e7:
12e7  ret
12e8  ld a, [$c031]
12eb  rst RST_18
12ef  ld b, a
12f0  ld a, [$c030]
12f3  inc a
12f4  ld [$c030], a
12f7  cp b
12f8  jr c, jr_000_130a
12fa  xor a
12fb  ld [$c030], a
12fe  ld a, [$c031]
1301  inc a
1302  cp $02
1304  jp nc, Jump_000_11ae
1307  ld [$c031], a
jr_000_130a:
130a  ld a, [$c031]
130d  rst RST_18
1311  ld [$c021], a
1314  jp Jump_000_13e8
Call_000_1317:
1317  ld a, [$c0a8]
131a  ld [$c028], a
131d  ld a, [$c0a9]
1320  ld [$c029], a
1323  ld a, [$c0b6]
1326  ld [$c036], a
1329  ret
Call_000_132a:
132a  ld a, [$c028]
132d  ld b, a
132e  ldh a, [$ff9c]
1330  ld c, a
1331  ld hl, $c024
1334  call Call_000_08c7
1337  ld a, [$c029]
133a  ld b, a
133b  ld hl, $c022
133e  call Call_000_08f8
1341  ld a, [$c031]
1344  and $04
1346  srl a
1348  srl a
134a  ld d, a
134b  ld a, c
134c  and $f0
134e  jr z, jr_000_136c
1350  bit 4, a
1352  jr z, jr_000_1356
1354  inc d
1355  inc d
jr_000_1356:
1356  ld a, [$c030]
1359  add b
135a  ld [$c030], a
135d  ld a, [$c031]
1360  adc $00
1362  ld [$c031], a
1365  ld a, d
1366  rst RST_18
jr_000_136c:
136c  ld [$c021], a
136f  ret
Call_000_1370:
1370  ldh a, [$ff9d]
1372  and $03
1374  ret z
1375  ld [$c033], a
1378  ld a, $05
137a  call Call_000_3665
137d  call Call_000_08a6
1380  call Call_000_1722
1383  ld a, [$c024]
1386  ld e, a
1387  ld a, [$c025]
138a  ld d, a
138b  call Call_000_00c3
138e  ld a, $03
1390  jr nc, jr_000_1393
1392  xor a
jr_000_1393:
1393  ld [$c02a], a
1396  ld hl, $0400
1399  add hl, de
139a  ld a, h
139b  cp $08
139d  jr nc, jr_000_13b7
139f  ldh a, [$ff9c]
13a1  bit 5, a
13a3  jr z, jr_000_13a9
13a5  ld a, $03
13a7  jr jr_000_13af
jr_000_13a9:
13a9  bit 4, a
13ab  jr z, jr_000_13b7
13ad  ld a, $00
jr_000_13af:
13af  ld [$c02a], a
13b2  ld a, $ff
13b4  ld [$c039], a
jr_000_13b7:
13b7  ld b, $00
13b9  ld a, [$c047]
13bc  cp $40
13be  jr c, jr_000_13ca
13c0  ld a, [$c02a]
13c3  add $0c
13c5  ld [$c02a], a
13c8  jr jr_000_13da
jr_000_13ca:
13ca  ld a, [$c02b]
13cd  cp $0c
13cf  jr c, jr_000_13da
13d1  ld a, [$c02a]
13d4  add $06
13d6  ld [$c02a], a
13d9  inc b
jr_000_13da:
13da  ld a, b
13db  ld [$c031], a
13de  xor a
13df  ld [$c030], a
13e2  ld a, $02
13e4  ld [$c020], a
13e7  ret
Call_000_13e8:
Jump_000_13e8:
13e8  ldh a, [$ffad]
13ea  bit 7, a
13ec  ret z
13ed  bit 5, a
13ef  ret nz
13f0  bit 4, a
13f2  ret nz
13f3  ld a, [$c043]
13f6  cp $78
13f8  ret nc
13f9  ld a, [$c021]
13fc  call Call_000_0a2c
13ff  ret nz
1400  ld a, c
1401  ld [$c038], a
1404  ld a, [$c038]
1407  rst RST_18
140e  add $10
1410  ldh [$ffc5], a
1412  ld a, [$c038]
1415  rst RST_18
141c  add $11
141e  ld b, a
141f  ldh a, [$ffc5]
1421  ld c, a
1422  ld hl, $c022
1425  call Call_000_1c05
1428  ret nc
1429  cp c
142a  ret c
142b  ld a, [$c038]
142e  rst RST_18
1435  ld b, a
1436  ldh a, [$ffc5]
1438  sub b
1439  bit 7, a
143b  jr z, jr_000_1441
143d  cpl
143e  inc a
143f  set 7, a
jr_000_1441:
1441  ld b, a
1442  ld a, [$c038]
1445  bit 0, a
1447  ld a, b
1448  jr z, jr_000_144c
144a  xor $80
jr_000_144c:
144c  ld [$c034], a
144f  ld a, [$c038]
1452  rst RST_18
1459  add $1e
145b  ldh [$ffc5], a
145d  ld a, [$c038]
1460  rst RST_18
1467  add $23
1469  ld b, a
146a  ldh a, [$ffc5]
146c  ld c, a
146d  ld hl, $c024
1470  call Call_000_1bef
1473  add $20
1475  cp b
1476  ret nc
1477  cp c
1478  ret c
1479  ld a, [$c038]
147c  rst RST_18
1483  ldh [$ffc5], a
1485  ld a, [$c038]
1488  rst RST_18
148f  ld h, a
1490  ldh a, [$ffc5]
1492  ld l, a
1493  ld a, [$c027]
1496  call Call_000_1c20
1499  ret nc
149a  cp l
149b  ret c
149c  ld a, $01
149e  ld [$c05c], a
14a1  xor a
14a2  ld [$c04f], a
14a5  ld a, [$c020]
14a8  cp $07
14aa  jp nz, Jump_000_153a
14ad  ld a, [$c033]
14b0  bit 1, a
14b2  ld a, [$c0b2]
14b5  jr nz, jr_000_14c5
14b7  ld [$c051], a
14ba  ld a, [$c047]
14bd  sub $26
14bf  srl a
14c1  add $0c
14c3  jr jr_000_14d8
jr_000_14c5:
14c5  call Call_000_1e87
14c8  ld [$c051], a
14cb  ld hl, $c035
14ce  and $7f
14d0  ld [hl], a
14d1  ld e, $98
14d3  call Call_000_1cf6
14d6  add $0c
jr_000_14d8:
14d8  ld [$c052], a
14db  ldh a, [$ff9c]
14dd  call Call_000_1e60
14e0  ld de, $5484
14e3  ldh a, [$ff91]
14e5  bit 1, a
14e7  jr nz, jr_000_14ec
14e9  ld de, $8484
jr_000_14ec:
14ec  ldh a, [$ff9c]
14ee  bit 5, a
14f0  jr z, jr_000_14f6
14f2  ld a, $f0
14f4  jr jr_000_14fc
jr_000_14f6:
14f6  bit 4, a
14f8  jr z, jr_000_150b
14fa  ld a, $10
jr_000_14fc:
14fc  push af
14fd  ld a, [$c033]
1500  bit 0, a
1502  jr nz, jr_000_1508
1504  pop af
1505  sra a
1507  push af
jr_000_1508:
1508  pop af
1509  add d
150a  ld d, a
jr_000_150b:
150b  call Call_000_1d22
150e  xor $80
1510  ld b, a
1511  ld a, [$c033]
1514  bit 1, a
1516  ld c, $10
1518  jr z, jr_000_151c
151a  ld c, $04
jr_000_151c:
151c  ld a, [$c0df]
151f  cp $03
1521  jr nc, jr_000_1527
1523  srl c
1525  srl c
jr_000_1527:
1527  ldh a, [$ff9c]
1529  call Call_000_1e0d
152c  ld a, b
152d  ld [$c050], a
1530  ld a, [$c038]
1533  ld b, a
1534  ld a, [$c033]
1537  jp Jump_000_165c
Jump_000_153a:
153a  ld a, [$c039]
153d  and a
153e  jr z, jr_000_154c
1540  ld a, [$c038]
1543  add $05
1545  ld [$c038], a
1548  xor a
1549  ld [$c039], a
jr_000_154c:
154c  ld a, [$c02a]
jr_000_154f:
154f  cp $06
1551  jr c, jr_000_1557
1553  sub $06
1555  jr jr_000_154f
jr_000_1557:
1557  ld b, $04
1559  and a
155a  jr z, jr_000_155e
155c  ld b, $fc
jr_000_155e:
155e  ld hl, $c036
1561  ldh a, [$ff9c]
1563  call Call_000_1ec3
1566  call Call_000_08bc
1569  sub $37
156b  jr nc, jr_000_1579
156d  cpl
156e  inc a
156f  sra a
1571  sra a
1573  ld e, a
1574  ld a, $9e
1576  sub e
1577  jr jr_000_157f
jr_000_1579:
1579  sra a
157b  sra a
157d  add $9e
jr_000_157f:
157f  ld e, a
1580  ld d, $6c
1582  ld a, [$c02a]
1585  cp $0c
1587  jr nc, jr_000_1598
1589  ld a, [$c038]
158c  sub $05
158e  jr c, jr_000_1598
1590  ld d, $7c
1592  bit 0, a
1594  jr z, jr_000_1598
1596  ld d, $5c
jr_000_1598:
1598  ld a, [$c02a]
159b  cp $0c
159d  jr c, jr_000_15a7
159f  ld e, $88
15a1  ld a, [hl]
15a2  add $10
15a4  ld [hl], a
15a5  jr jr_000_15b6
jr_000_15a7:
15a7  cp $06
15a9  jr c, jr_000_15b6
15ab  ld e, $98
15ad  ld a, [hl]
15ae  sub $10
15b0  ld [hl], a
15b1  ld a, $02
15b3  ld [$c05c], a
jr_000_15b6:
15b6  ld a, [$c038]
15b9  cp $05
15bb  jr nc, jr_000_15c5
15bd  push hl
15be  ld hl, $c024
15c1  call Call_000_1e6e
15c4  pop hl
jr_000_15c5:
15c5  ldh a, [$ff9c]
15c7  ld b, a
15c8  ld a, [$c02a]
15cb  call Call_000_1d71
15ce  ld a, [$c02a]
15d1  call Call_000_1db3
15d4  call Call_000_1cf6
15d7  ld a, [$c02a]
15da  cp $0c
15dc  jr c, jr_000_15e8
15de  ld a, $90
15e0  ld [$c052], a
15e3  ld a, $22
15e5  ld [$c05c], a
jr_000_15e8:
15e8  ld a, [$c035]
15eb  ld b, a
15ec  ld a, [$c033]
15ef  call Call_000_1de7
15f2  ld a, b
15f3  ld [$c051], a
15f6  xor a
15f7  ld [$c04f], a
15fa  call Call_000_1d22
15fd  ld c, $10
15ff  ld hl, $c034
1602  call Call_000_1d57
1605  call Call_000_1cb1
1608  ld a, [$c038]
160b  cp $05
160d  jr c, jr_000_1611
160f  sub $05
jr_000_1611:
1611  ld b, a
1612  ld a, [$c033]
1615  jp Jump_000_165c
Jump_000_1618:
1618  ldh a, [$ffad]
161a  bit 7, a
161c  ret z
161d  bit 4, a
161f  ret nz
1620  call Call_000_08a6
1623  ld b, a
1624  call Call_000_08bc
1627  sub b
1628  jr nc, jr_000_162c
162a  cpl
162b  inc a
jr_000_162c:
162c  cp $03
162e  ret nc
162f  call Call_000_089b
1632  ld b, a
1633  call Call_000_08b1
1636  sub b
1637  jr nc, jr_000_163b
1639  cpl
163a  inc a
jr_000_163b:
163b  cp $04
163d  ret nc
163e  ld a, [$c047]
1641  cp $34
1643  ret nc
1644  ldh a, [$ffad]
1646  bit 3, a
1648  jr z, jr_000_164e
164a  or $30
164c  jr jr_000_1652
jr_000_164e:
164e  or $38
1650  ldh [$ffae], a
jr_000_1652:
1652  ldh [$ffad], a
1654  ld a, $0d
1656  call Call_000_3665
1659  jp Jump_000_1c84
Jump_000_165c:
165c  ldh [$ffc5], a
165e  ld a, b
165f  ldh [$ffc6], a
1661  cp $05
1663  ld a, $06
1665  jr c, jr_000_1669
1667  ld a, $07
jr_000_1669:
1669  call Call_000_1f42
166c  ldh a, [$ffc5]
166e  ld c, $00
1670  bit 1, a
1672  jr z, jr_000_1687
1674  ldh a, [$ffad]
1676  bit 6, a
1678  jr z, jr_000_1687
167a  ldh a, [$ffc6]
167c  cp $02
167e  jr nc, jr_000_1687
1680  ld a, $2a
1682  call Call_000_1f42
1685  ld c, $2b
jr_000_1687:
1687  ld a, c
1688  ld [$c059], a
168b  xor a
168c  ld [$c04c], a
168f  ld [$c053], a
1692  ld hl, $c05a
1695  inc [hl]
1696  ldh a, [$ffad]
1698  bit 3, a
169a  jr nz, jr_000_16a8
169c  ld a, [$c040]
169f  cp $04
16a1  jr z, jr_000_16a5
16a3  ld a, $03
jr_000_16a5:
16a5  ld [$c040], a
jr_000_16a8:
16a8  ld a, [$c050]
16ab  and $7f
16ad  ld [$c054], a
16b0  ld a, [$c051]
16b3  ld [$c055], a
16b6  xor a
16b7  ld [$c056], a
16ba  ld [$c057], a
16bd  ld a, [$c051]
16c0  ld h, a
16c1  ld l, $00
16c3  ld a, [$c059]
16c6  and a
16c7  ld a, $48
16c9  jr z, jr_000_16cd
16cb  ld a, $28
jr_000_16cd:
16cd  call Call_000_3143
16d0  ld a, h
16d1  and a
16d2  jr nz, jr_000_16d7
16d4  ld hl, $00f8
jr_000_16d7:
16d7  ld a, l
16d8  ld [$c05d], a
16db  swap a
16dd  and $0f
16df  ld l, a
16e0  ld a, h
16e1  ld [$c05e], a
16e4  swap a
16e6  and $f0
16e8  or l
16e9  ld [$c058], a
16ec  xor a
16ed  ld [$c05f], a
16f0  ldh a, [$ffad]
16f2  xor $80
16f4  set 6, a
16f6  ldh [$ffad], a
16f8  ret
Call_000_16f9:
16f9  ld [$c045], a
16fc  ld a, $10
16fe  ld [$c047], a
1701  xor a
1702  ld [$c04c], a
1705  ld [$c05a], a
1708  ld [$c05f], a
170b  ld hl, $c050
170e  ld [hl+], a
170f  ld [hl+], a
1710  ld a, $44
1712  ld [hl], a
1713  ld a, $14
1715  ld [$c058], a
1718  ld hl, $c05d
171b  ld a, $40
171d  ld [hl+], a
171e  ld a, $01
1720  ld [hl], a
1721  ret
Call_000_1722:
1722  ld b, a
1723  call Call_000_08bc
1726  sub b
1727  jr nc, jr_000_172b
1729  cpl
172a  inc a
jr_000_172b:
172b  ld h, a
172c  ld l, $00
172e  ld d, $00
1730  ld a, [$c051]
1733  sla a
1735  rl d
1737  sla a
1739  rl d
173b  ld e, a
173c  call Call_000_31d5
173f  ld d, $00
1741  ld a, [$c050]
1744  sla a
1746  sla a
1748  rl d
174a  ld e, a
174b  call Call_000_3120
174e  ld a, [$c050]
1751  bit 7, a
1753  jr nz, jr_000_1760
1755  ld a, [$c044]
1758  add l
1759  ld l, a
175a  ld a, [$c045]
175d  adc h
175e  ld h, a
175f  ret
jr_000_1760:
1760  ld a, [$c044]
1763  sub l
1764  ld l, a
1765  ld a, [$c045]
1768  sbc h
1769  ld h, a
176a  ret
Call_000_176b:
176b  ld a, [$c052]
176e  bit 7, a
1770  jr z, jr_000_1789
1772  ld b, $38
1774  ldh a, [$ff96]
1776  bit 7, a
1778  ld a, [$c043]
177b  jr z, jr_000_1780
177d  ld b, a
177e  ld a, $b8
jr_000_1780:
1780  sub b
1781  jr nc, jr_000_178b
1783  ld a, [$c04c]
1786  and a
1787  jr z, jr_000_179e
jr_000_1789:
1789  and a
178a  ret
jr_000_178b:
178b  ld h, a
178c  cp $0c
178e  jr nc, jr_000_1789
1790  ld a, [$c04c]
1793  and a
1794  jr nz, jr_000_1789
1796  sla h
1798  ld a, [$c047]
179b  cp h
179c  jr c, jr_000_1789
jr_000_179e:
179e  scf
179f  ret
Call_000_17a0:
17a0  ld a, [$c060]
17a3  and a
17a4  jr z, jr_000_17aa
17a6  dec a
17a7  ld [$c060], a
jr_000_17aa:
17aa  ld a, [$c040]
17ad  rst RST_08
17c2  xor a
17c3  ld [$c050], a
17c6  ld [$c051], a
17c9  ld [$c052], a
17cc  ld [$c046], a
17cf  ld [$c041], a
17d2  ld [$c060], a
17d5  inc a
17d6  ld [$c047], a
17d9  ld [$c040], a
17dc  ret
17dd  call Call_000_18f3
17e0  ld a, [$c047]
17e3  and a
17e4  ret nz
17e5  ld a, $03
17e7  jp Jump_000_1f42
17ea  call Call_000_18e4
17ed  ld a, [$c04c]
17f0  and a
17f1  ret z
17f2  call Call_000_1ee1
17f5  ld hl, $ffad
17f8  set 5, [hl]
17fa  ld a, $05
17fc  ld [$c040], a
17ff  ret
1800  ld hl, $ffad
1803  set 5, [hl]
1805  call Call_000_18e4
1808  ld a, [$c04c]
180b  cp $01
180d  ret nz
180e  call Call_000_1ecb
1811  ld a, [$c047]
1814  ld b, a
1815  ld a, [$c046]
1818  or b
1819  ret nz
181a  ld b, $0e
181c  ldh a, [$ffad]
181e  bit 7, a
1820  jr z, jr_000_1824
1822  ld b, $0c
jr_000_1824:
1824  ldh a, [$ff91]
1826  bit 1, a
1828  jr z, jr_000_182b
182a  inc b
jr_000_182b:
182b  ld a, [$c04b]
182e  ld [$c04d], a
1831  cp b
1832  jr nz, jr_000_1844
1834  ld a, [$c053]
1837  bit 7, a
1839  ld a, $06
183b  jr nz, jr_000_1846
183d  call Call_000_1ef0
1840  ld a, $04
1842  jr jr_000_1846
jr_000_1844:
1844  ld a, $05
jr_000_1846:
1846  ld [$c040], a
1849  ld hl, $ffad
184c  res 5, [hl]
184e  ret
184f  call Call_000_18e4
1852  ld a, [$c041]
1855  and a
1856  jr z, jr_000_1861
1858  dec a
1859  ld [$c041], a
185c  ret nz
185d  ld a, $09
185f  jr jr_000_188e
jr_000_1861:
1861  ld a, [$c04c]
1864  cp $01
1866  jr nz, jr_000_1892
1868  ld a, [$c047]
186b  ld b, a
186c  ld a, [$c046]
186f  or b
1870  ret nz
1871  ld a, [$c04b]
1874  ld [$c04d], a
1877  bit 1, a
1879  ld b, $00
187b  jr z, jr_000_187f
187d  ld b, $80
jr_000_187f:
187f  ldh a, [$ffad]
1881  xor b
1882  bit 7, a
1884  jr z, jr_000_1895
1886  ld a, [$c04d]
1889  bit 3, a
188b  ret nz
188c  ld a, $07
jr_000_188e:
188e  ld [$c040], a
1891  ret
jr_000_1892:
1892  cp $02
1894  ret c
jr_000_1895:
1895  ld a, $3c
1897  ld [$c041], a
189a  ret
189b  ld b, $5a
189d  ld a, $c4
189f  jr jr_000_18ab
18a1  ld b, $5a
18a3  ld a, $c5
18a5  jr jr_000_18ab
18a7  ld b, $96
18a9  ld a, $c6
jr_000_18ab:
18ab  ld hl, $ffad
18ae  bit 3, [hl]
18b0  jr nz, jr_000_18b8
18b2  ldh [$ffc2], a
18b4  set 3, [hl]
18b6  ld a, [hl+]
18b7  ld [hl], a
jr_000_18b8:
18b8  ld a, b
18b9  ld [$c05b], a
18bc  ld a, $08
18be  ld [$c040], a
18c1  jp Jump_000_18e4
18c4  call Call_000_18e4
18c7  ld a, [$c05b]
18ca  dec a
18cb  ld [$c05b], a
18ce  cp $1e
18d0  ret nc
18d1  ld hl, $ffc2
18d4  res 6, [hl]
18d6  ld a, [$c05b]
18d9  and a
18da  ret nz
18db  ld a, $09
18dd  ld [$c040], a
18e0  ret
18e1  jp Jump_000_18e4
Call_000_18e4:
Jump_000_18e4:
18e4  call Call_000_18fe
18e7  call Call_000_1945
18ea  call Call_000_19ac
18ed  call Call_000_1b17
18f0  call Call_000_1c27
Call_000_18f3:
18f3  ld hl, $c042
18f6  call Call_000_09fa
18f9  ld a, c
18fa  ld [$c04b], a
18fd  ret
Call_000_18fe:
18fe  ld hl, $c044
1901  ld a, [hl+]
1902  ld h, [hl]
1903  ld l, a
1904  ld b, $00
1906  ld a, [$c050]
1909  bit 7, a
190b  jr nz, jr_000_1926
190d  sla a
190f  sla a
1911  rl b
1913  ld c, a
1914  add hl, bc
1915  ld de, $d001
1918  call Call_000_00c3
191b  jr nc, jr_000_193b
jr_000_191d:
191d  ld a, l
191e  ld [$c044], a
1921  ld a, h
1922  ld [$c045], a
1925  ret
jr_000_1926:
1926  sla a
1928  sla a
192a  rl b
192c  ld c, a
192d  ld a, l
192e  sbc c
192f  ld l, a
1930  ld a, h
1931  sbc b
1932  ld h, a
1933  ld de, $07ff
1936  call Call_000_00c3
1939  jr nc, jr_000_191d
jr_000_193b:
193b  ld a, [$c050]
193e  xor $80
1940  ld [$c050], a
1943  jr jr_000_1991
Call_000_1945:
1945  ld hl, $c042
1948  ld a, [hl+]
1949  ld h, [hl]
194a  ld l, a
194b  ld b, $00
194d  ld a, [$c04f]
1950  bit 7, a
1952  ld a, [$c051]
1955  jr nz, jr_000_1972
1957  sla a
1959  rl b
195b  sla a
195d  rl b
195f  ld c, a
1960  add hl, bc
1961  ld de, $e701
1964  call Call_000_00c3
1967  jr nc, jr_000_1989
jr_000_1969:
1969  ld a, l
196a  ld [$c042], a
196d  ld a, h
196e  ld [$c043], a
1971  ret
jr_000_1972:
1972  sla a
1974  rl b
1976  sla a
1978  rl b
197a  ld c, a
197b  ld a, l
197c  sbc c
197d  ld l, a
197e  ld a, h
197f  sbc b
1980  ld h, a
1981  ld de, $08ff
1984  call Call_000_00c3
1987  jr nc, jr_000_1969
jr_000_1989:
1989  ld a, [$c04f]
198c  xor $80
198e  ld [$c04f], a
jr_000_1991:
1991  ld a, [$c050]
1994  sra a
1996  and $bf
1998  ld [$c050], a
199b  ld a, [$c051]
199e  srl a
19a0  ld [$c051], a
19a3  xor a
19a4  ld [$c053], a
19a7  ld a, $04
19a9  jp Jump_000_1f42
Call_000_19ac:
19ac  ld hl, $c05d
19af  ld a, [$c052]
19b2  bit 7, a
19b4  jr nz, jr_000_1a18
19b6  ld a, [$c05f]
19b9  sub [hl]
19ba  ld [$c05f], a
19bd  ld c, a
19be  inc hl
19bf  ld a, [$c052]
19c2  sbc [hl]
19c3  jr nc, jr_000_19d2
19c5  ld a, $80
19c7  ld [$c052], a
19ca  ld a, [$c059]
19cd  and a
19ce  ret z
19cf  jp Jump_000_1f42
jr_000_19d2:
19d2  ld [$c052], a
19d5  ld b, $00
19d7  ld hl, $19e9
19da  push hl
19db  ld a, [$c05c]
19de  swap a
19e0  and $0f
19e2  rst RST_08
19e9  ld l, a
19ea  ld h, b
19eb  ld a, [$c058]
19ee  call Call_000_30d0
19f1  srl c
19f3  rr h
19f5  rr l
19f7  srl c
19f9  rr h
19fb  rr l
19fd  srl c
19ff  rr h
1a01  rr l
1a03  srl c
1a05  rr h
1a07  rr l
1a09  ld a, [$c046]
1a0c  add l
1a0d  ld [$c046], a
1a10  ld a, [$c047]
1a13  adc h
1a14  ld [$c047], a
1a17  ret
jr_000_1a18:
1a18  ld a, [$c05f]
1a1b  add [hl]
1a1c  ld [$c05f], a
1a1f  ld c, a
1a20  inc hl
1a21  ld a, [$c052]
1a24  adc [hl]
1a25  ld [$c052], a
1a28  ld b, $00
1a2a  ld hl, $1a3a
1a2d  push hl
1a2e  ld a, [$c05c]
1a31  and $0f
1a33  rst RST_08
1a3a  ld l, a
1a3b  ld h, b
1a3c  ld a, [$c058]
1a3f  call Call_000_30d0
1a42  srl c
1a44  rr h
1a46  rr l
1a48  srl c
1a4a  rr h
1a4c  rr l
1a4e  srl c
1a50  rr h
1a52  rr l
1a54  srl c
1a56  rr h
1a58  rr l
1a5a  ld a, [$c046]
1a5d  sub l
1a5e  ld [$c046], a
1a61  ld c, a
1a62  ld a, [$c047]
1a65  sbc h
1a66  ld [$c047], a
1a69  jr c, jr_000_1a6d
1a6b  or c
1a6c  ret nz
jr_000_1a6d:
1a6d  xor a
1a6e  ld [$c046], a
1a71  ld [$c047], a
1a74  ld hl, $c04c
1a77  inc [hl]
1a78  ld a, [hl]
1a79  cp $02
1a7b  jr c, jr_000_1a83
1a7d  ldh a, [$ffad]
1a7f  set 5, a
1a81  ldh [$ffad], a
jr_000_1a83:
1a83  xor a
1a84  ld [$c059], a
1a87  ld a, [$c04c]
1a8a  cp $04
1a8c  jr nc, jr_000_1aa6
1a8e  ld a, $1c
1a90  ld [$c060], a
1a93  ld hl, $c042
1a96  ld de, $c062
1a99  ld b, $04
jr_000_1a9b:
1a9b  ld a, [hl+]
1a9c  ld [de], a
1a9d  inc e
1a9e  dec b
1a9f  jr nz, jr_000_1a9b
1aa1  ld a, $03
1aa3  call Call_000_1f42
jr_000_1aa6:
1aa6  ld a, [$c052]
1aa9  and $7f
1aab  ld b, a
1aac  srl a
1aae  srl a
1ab0  ld c, a
1ab1  ld a, b
1ab2  sub c
1ab3  jr nc, jr_000_1ab6
1ab5  xor a
jr_000_1ab6:
1ab6  ld b, a
1ab7  ld a, [$c052]
1aba  and $80
1abc  xor $80
1abe  or b
1abf  ld [$c052], a
1ac2  ret
1ac3  call Call_000_1aef
1ac6  sla c
1ac8  rl a
1aca  rl b
1acc  ret
1acd  ld a, [$c052]
1ad0  sla c
1ad2  rl a
1ad4  ld e, a
1ad5  sla c
1ad7  rl a
1ad9  rl b
1adb  sla c
1add  rl a
1adf  rl b
1ae1  add e
1ae2  ret nc
1ae3  inc b
1ae4  ret
1ae5  call Call_000_1b01
1ae8  sla c
1aea  rl a
1aec  rl b
1aee  ret
Call_000_1aef:
1aef  ld a, [$c052]
1af2  sla c
1af4  rl a
1af6  ld e, a
1af7  sla c
1af9  rl a
1afb  rl b
1afd  add e
1afe  ret nc
1aff  inc b
1b00  ret
Call_000_1b01:
1b01  ld a, [$c052]
1b04  sla c
1b06  rl a
1b08  sla c
1b0a  rl a
1b0c  rl b
1b0e  ret
1b0f  ld a, [$c052]
1b12  sla c
1b14  rl a
1b16  ret
Call_000_1b17:
1b17  ld a, [$c050]
1b1a  and $7f
1b1c  ld b, a
1b1d  ld a, [$c054]
1b20  ld c, a
1b21  ld a, [$c056]
1b24  sub c
1b25  ld c, a
1b26  ld a, b
1b27  sbc $00
1b29  jr c, jr_000_1b39
1b2b  ld b, a
1b2c  ld a, c
1b2d  ld [$c056], a
1b30  ld a, [$c050]
1b33  and $80
1b35  or b
1b36  ld [$c050], a
jr_000_1b39:
1b39  ld a, [$c055]
1b3c  ld c, a
1b3d  ld a, [$c057]
1b40  sub c
1b41  ld c, a
1b42  ld a, [$c051]
1b45  sbc $00
1b47  ret c
1b48  ld [$c051], a
1b4b  ld a, c
1b4c  ld [$c057], a
1b4f  ret
Call_000_1b50:
1b50  ld a, [$c040]
1b53  and a
1b54  ret z
1b55  ld hl, $c042
1b58  call Call_000_095d
1b5b  push bc
1b5c  ld a, [$c047]
1b5f  call Call_000_09c2
1b62  ld hl, $1bc2
1b65  ld a, [$c047]
1b68  cp $40
1b6a  jr c, jr_000_1b76
1b6c  ld hl, $1bdb
1b6f  cp $60
1b71  jr c, jr_000_1b76
1b73  ld hl, $1be5
jr_000_1b76:
1b76  ld a, [$c043]
1b79  cp $78
1b7b  jr nc, jr_000_1b8f
1b7d  ld a, b
1b7e  cp $78
1b80  jr c, jr_000_1b8f
1b82  ld a, c
1b83  cp $28
1b85  jr c, jr_000_1b8f
1b87  cp $b0
1b89  jr nc, jr_000_1b8f
1b8b  ld de, $0005
1b8e  add hl, de
jr_000_1b8f:
1b8f  call Call_000_305a
1b92  pop bc
1b93  ld hl, $1bcc
1b96  ld a, [$c043]
1b99  cp $78
1b9b  jr nc, jr_000_1bae
1b9d  ld a, b
1b9e  cp $78
1ba0  jr c, jr_000_1bae
1ba2  ld a, c
1ba3  cp $28
1ba5  jr c, jr_000_1bae
1ba7  cp $b0
1ba9  jr nc, jr_000_1bae
1bab  ld hl, $1bd1
jr_000_1bae:
1bae  call Call_000_305a
1bb1  ld a, [$c060]
1bb4  and a
1bb5  ret z
1bb6  ld hl, $c062
1bb9  call Call_000_0951
1bbc  ld hl, $1bd6
1bbf  jp Jump_000_305a
Call_000_1bef:
1bef  ld a, [hl+]
1bf0  ld d, [hl]
1bf1  ld e, a
1bf2  ld hl, $c044
1bf5  ld a, [hl+]
1bf6  ld h, [hl]
1bf7  ld l, a
1bf8  call Call_000_00c3
1bfb  jr nc, jr_000_1bfe
1bfd  dec de
jr_000_1bfe:
1bfe  ld a, $80
1c00  add e
1c01  ld a, d
1c02  adc $00
1c04  ret
Call_000_1c05:
1c05  ld a, [hl+]
1c06  ld d, [hl]
1c07  ld e, a
1c08  ld hl, $c042
1c0b  ld a, [hl+]
1c0c  ld h, [hl]
1c0d  ld l, a
1c0e  call Call_000_00c3
1c11  jr nc, jr_000_1c14
1c13  dec de
jr_000_1c14:
1c14  ld a, $80
1c16  add e
1c17  ld a, d
1c18  adc $00
1c1a  ldh [$ffc5], a
1c1c  add $10
1c1e  cp b
1c1f  ret
Call_000_1c20:
1c20  ld b, a
1c21  ld a, [$c047]
1c24  sub b
1c25  cp h
1c26  ret
Call_000_1c27:
1c27  ld a, [$c053]
1c2a  and a
1c2b  ret nz
1c2c  call Call_000_08bc
1c2f  cp $76
1c31  ret c
1c32  cp $7b
1c34  ret nc
1c35  ld [$c053], a
1c38  call Call_000_08b1
1c3b  cp $2e
1c3d  ret c
1c3e  cp $ab
1c40  ret nc
1c41  ld a, [$c047]
1c44  cp $1e
1c46  ret nc
1c47  ld a, $0c
1c49  call Call_000_3665
1c4c  ld a, [$c047]
1c4f  cp $1c
1c51  jr c, jr_000_1c7f
1c53  ld a, [$c051]
1c56  srl a
1c58  ld [$c051], a
1c5b  ld a, [$c050]
1c5e  sra a
1c60  and $bf
1c62  ld [$c050], a
1c65  ld a, [$c052]
1c68  bit 7, a
1c6a  jr nz, jr_000_1c72
1c6c  ld b, a
1c6d  srl a
1c6f  add b
1c70  jr jr_000_1c76
jr_000_1c72:
1c72  and $7f
1c74  srl a
jr_000_1c76:
1c76  ld [$c052], a
1c79  ld a, $ff
1c7b  ld [$c053], a
1c7e  ret
jr_000_1c7f:
1c7f  ld a, $fe
1c81  ld [$c053], a
Jump_000_1c84:
1c84  ld a, [$c050]
1c87  sra a
1c89  sra a
1c8b  and $9f
1c8d  ld [$c050], a
1c90  ld a, [$c051]
1c93  srl a
1c95  srl a
1c97  and $3f
1c99  ld [$c051], a
1c9c  ld a, [$c04f]
1c9f  xor $80
1ca1  ld [$c04f], a
1ca4  ld a, [$c052]
1ca7  sra a
1ca9  sra a
1cab  and $9f
1cad  ld [$c052], a
1cb0  ret
Call_000_1cb1:
1cb1  ld a, b
1cb2  ldh [$ffc5], a
1cb4  ldh a, [$ffc6]
1cb6  xor $80
1cb8  bit 7, a
1cba  jr z, jr_000_1cd7
1cbc  bit 7, b
1cbe  jr nz, jr_000_1cdb
jr_000_1cc0:
1cc0  res 7, a
1cc2  res 7, b
1cc4  sub b
1cc5  jr nc, jr_000_1cce
1cc7  cpl
1cc8  inc a
1cc9  ld b, a
1cca  ldh a, [$ffc5]
1ccc  jr jr_000_1cd3
jr_000_1cce:
1cce  ld b, a
1ccf  ldh a, [$ffc6]
1cd1  xor $80
jr_000_1cd3:
1cd3  and $80
1cd5  jr jr_000_1cdd
jr_000_1cd7:
1cd7  bit 7, b
1cd9  jr nz, jr_000_1cc0
jr_000_1cdb:
1cdb  res 7, b
jr_000_1cdd:
1cdd  add b
1cde  ld [$c050], a
1ce1  res 7, a
1ce3  ld b, a
1ce4  ld a, [$c051]
1ce7  add a
1ce8  ret c
1ce9  cp b
1cea  ret nc
1ceb  ld b, a
1cec  ld a, [$c050]
1cef  and $80
1cf1  or b
1cf2  ld [$c050], a
1cf5  ret
Call_000_1cf6:
1cf6  call Call_000_08bc
1cf9  push af
1cfa  sub e
1cfb  jr nc, jr_000_1cff
1cfd  cpl
1cfe  inc a
jr_000_1cff:
1cff  ld b, a
1d00  pop af
1d01  add $08
1d03  bit 7, a
1d05  jr z, jr_000_1d09
1d07  cpl
1d08  inc a
jr_000_1d09:
1d09  sub $30
1d0b  jr c, jr_000_1d13
1d0d  srl a
1d0f  srl a
1d11  add b
1d12  ld b, a
jr_000_1d13:
1d13  ld a, b
1d14  ld hl, $c047
1d17  sub [hl]
1d18  jr nc, jr_000_1d1c
1d1a  cpl
1d1b  inc a
jr_000_1d1c:
1d1c  srl a
1d1e  ld [$c052], a
1d21  ret
Call_000_1d22:
1d22  push de
1d23  push de
1d24  call Call_000_08b1
1d27  sub d
1d28  jr nc, jr_000_1d2c
1d2a  cpl
1d2b  inc a
jr_000_1d2c:
1d2c  ld e, a
1d2d  ld a, [$c051]
1d30  call Call_000_308f
1d33  pop de
1d34  call Call_000_08bc
1d37  sub e
1d38  jr nc, jr_000_1d3c
1d3a  cpl
1d3b  inc a
jr_000_1d3c:
1d3c  call Call_000_3143
1d3f  ld a, h
1d40  and a
1d41  jr nz, jr_000_1d48
1d43  ld a, l
1d44  cp $68
1d46  jr c, jr_000_1d4a
jr_000_1d48:
1d48  ld l, $68
jr_000_1d4a:
1d4a  pop de
1d4b  call Call_000_08b1
1d4e  sub d
1d4f  jr nc, jr_000_1d53
1d51  set 7, l
jr_000_1d53:
1d53  ld a, l
1d54  ldh [$ffc6], a
1d56  ret
Call_000_1d57:
1d57  ld b, $00
1d59  ld a, [hl+]
1d5a  and $0f
1d5c  cp $02
1d5e  ret c
1d5f  ld b, $02
1d61  cp $05
1d63  jr c, jr_000_1d67
1d65  ld b, $06
jr_000_1d67:
1d67  ld a, [hl]
1d68  sub $04
1d6a  ld [hl-], a
1d6b  bit 7, [hl]
1d6d  ret z
1d6e  set 7, b
1d70  ret
Call_000_1d71:
1d71  ld c, $28
1d73  cp $06
1d75  jr c, jr_000_1d7d
1d77  cp $0c
1d79  jr nc, jr_000_1d7d
1d7b  ld c, $20
jr_000_1d7d:
1d7d  ld a, c
1d7e  bit 5, b
1d80  jr z, jr_000_1d86
1d82  cpl
1d83  inc a
1d84  jr jr_000_1d89
jr_000_1d86:
1d86  bit 4, b
1d88  ret z
jr_000_1d89:
1d89  add d
1d8a  ld d, a
1d8b  ld a, [hl]
1d8c  sub $04
1d8e  ld [hl], a
1d8f  ret
Call_000_1d90:
1d90  call Call_000_1dbe
1d93  bit 6, b
1d95  jr z, jr_000_1da6
jr_000_1d97:
1d97  add c
1d98  add e
1d99  ld e, a
1d9a  ld a, [$c05c]
1d9d  cp $02
1d9f  ret z
1da0  ld a, $00
1da2  ld [$c05c], a
1da5  ret
jr_000_1da6:
1da6  bit 7, b
jr_000_1da8:
1da8  ret z
1da9  cpl
1daa  inc a
1dab  add e
1dac  ld e, a
1dad  ld a, $01
1daf  ld [$c05c], a
1db2  ret
Call_000_1db3:
1db3  call Call_000_1dbe
1db6  bit 7, b
1db8  jr nz, jr_000_1d97
1dba  bit 6, b
1dbc  jr jr_000_1da8
Call_000_1dbe:
1dbe  ld c, $0a
1dc0  cp $06
1dc2  jr c, jr_000_1dcc
1dc4  cp $0c
1dc6  jr nc, jr_000_1dcc
1dc8  srl c
1dca  srl c
jr_000_1dcc:
1dcc  ldh a, [$ff96]
1dce  bit 7, a
1dd0  ld a, c
1dd1  ld c, $08
1dd3  ret nz
1dd4  cpl
1dd5  inc a
1dd6  ld c, $f8
1dd8  ret
Call_000_1dd9:
1dd9  bit 1, a
1ddb  ret z
1ddc  call Call_000_1df5
1ddf  ldh a, [$ff9a]
1de1  bit 6, a
1de3  ret z
1de4  ld b, $4c
1de6  ret
Call_000_1de7:
1de7  bit 1, a
1de9  ret z
1dea  call Call_000_1df5
1ded  ldh a, [$ff9c]
1def  bit 7, a
1df1  ret z
1df2  ld b, $4c
1df4  ret
Call_000_1df5:
1df5  ld a, [$c052]
1df8  bit 7, a
1dfa  jr z, jr_000_1e00
1dfc  ld a, $01
1dfe  jr jr_000_1e07
jr_000_1e00:
1e00  add a
1e01  bit 7, a
1e03  jr z, jr_000_1e07
1e05  ld a, $7f
jr_000_1e07:
1e07  ld [$c052], a
1e0a  ld b, $40
1e0c  ret
Call_000_1e0d:
1e0d  bit 5, a
1e0f  jr z, jr_000_1e24
1e11  ld a, c
1e12  bit 7, b
1e14  jr nz, jr_000_1e21
1e16  sub b
1e17  jr nc, jr_000_1e1d
1e19  cpl
1e1a  inc a
1e1b  ld b, a
1e1c  ret
jr_000_1e1d:
1e1d  or $80
1e1f  ld b, a
1e20  ret
jr_000_1e21:
1e21  add b
1e22  ld b, a
1e23  ret
jr_000_1e24:
1e24  bit 4, a
1e26  ret z
1e27  ld a, c
1e28  bit 7, b
1e2a  jr z, jr_000_1e39
1e2c  res 7, b
1e2e  sub b
1e2f  jr nc, jr_000_1e37
1e31  cpl
1e32  inc a
1e33  or $80
1e35  ld b, a
1e36  ret
jr_000_1e37:
1e37  ld b, a
1e38  ret
jr_000_1e39:
1e39  add b
1e3a  ld b, a
1e3b  ret
Call_000_1e3c:
1e3c  bit 6, a
1e3e  jr z, jr_000_1e4e
jr_000_1e40:
1e40  ld a, [$c051]
1e43  add $10
1e45  ld [$c051], a
1e48  ld a, $10
1e4a  ld [$c05c], a
1e4d  ret
jr_000_1e4e:
1e4e  bit 7, a
1e50  jr z, jr_000_1e68
jr_000_1e52:
1e52  ld a, [$c051]
1e55  sub $10
1e57  ld [$c051], a
1e5a  ld a, $11
1e5c  ld [$c05c], a
1e5f  ret
Call_000_1e60:
1e60  bit 7, a
1e62  jr nz, jr_000_1e40
1e64  bit 6, a
1e66  jr nz, jr_000_1e52
jr_000_1e68:
1e68  ld a, $01
1e6a  ld [$c05c], a
1e6d  ret
Call_000_1e6e:
1e6e  ld a, e
1e6f  ldh [$ffc5], a
1e71  ld a, [hl+]
1e72  ld h, [hl]
1e73  ld l, a
1e74  cp $6c
1e76  ld e, $02
1e78  jr c, jr_000_1e7c
1e7a  ld e, $00
jr_000_1e7c:
1e7c  add hl, de
1e7d  rr h
1e7f  jr nc, jr_000_1e82
1e81  inc h
jr_000_1e82:
1e82  ld d, h
1e83  ldh a, [$ffc5]
1e85  ld e, a
1e86  ret
Call_000_1e87:
1e87  ld l, a
1e88  sub $70
1e8a  jr nc, jr_000_1e93
1e8c  cpl
1e8d  inc a
1e8e  srl a
1e90  add l
1e91  jr jr_000_1e98
jr_000_1e93:
1e93  srl a
1e95  ld h, a
1e96  ld a, l
1e97  sub h
jr_000_1e98:
1e98  srl a
1e9a  ld l, a
1e9b  srl a
1e9d  add l
1e9e  ret
Call_000_1e9f:
1e9f  bit 6, a
1ea1  jr z, jr_000_1eb0
jr_000_1ea3:
1ea3  ld a, [hl]
1ea4  srl a
1ea6  srl a
1ea8  ld c, a
1ea9  srl a
1eab  add c
1eac  add b
1ead  ld b, a
1eae  jr jr_000_1ebf
jr_000_1eb0:
1eb0  bit 7, a
jr_000_1eb2:
1eb2  jr z, jr_000_1ebf
1eb4  ld a, [hl]
1eb5  srl a
1eb7  srl a
1eb9  srl a
1ebb  ld c, a
1ebc  ld a, b
1ebd  sub c
1ebe  ld b, a
jr_000_1ebf:
1ebf  ld a, [hl-]
1ec0  add b
1ec1  ld [hl], a
1ec2  ret
Call_000_1ec3:
1ec3  bit 7, a
1ec5  jr nz, jr_000_1ea3
1ec7  bit 6, a
1ec9  jr jr_000_1eb2
Call_000_1ecb:
1ecb  ld hl, $c082
1ece  call Call_000_1f3a
1ed1  bit 7, a
1ed3  jr nz, jr_000_1ed8
1ed5  ld hl, $c0a2
jr_000_1ed8:
1ed8  ldh a, [$ff91]
1eda  bit 0, a
1edc  jr z, jr_000_1edf
1ede  inc hl
jr_000_1edf:
1edf  inc [hl]
1ee0  ret
Call_000_1ee1:
1ee1  ld hl, $c082
1ee4  call Call_000_1f3a
1ee7  bit 7, a
1ee9  jr z, jr_000_1eee
1eeb  ld hl, $c0a2
jr_000_1eee:
1eee  jr jr_000_1ed8
Call_000_1ef0:
1ef0  ld hl, $c084
1ef3  call Call_000_1f3a
1ef6  bit 7, a
1ef8  jr nz, jr_000_1efd
1efa  ld hl, $c0a4
jr_000_1efd:
1efd  jr jr_000_1ed8
Jump_000_1eff:
1eff  ld a, [$c05a]
1f02  cp $0a
1f04  jr nc, jr_000_1f35
1f06  ldh a, [$ff96]
1f08  bit 6, a
1f0a  jr nz, jr_000_1f19
1f0c  ld hl, $c086
1f0f  ldh a, [$ff93]
1f11  and a
1f12  jr z, jr_000_1f26
1f14  ld hl, $c0a7
1f17  jr jr_000_1f2e
jr_000_1f19:
1f19  ld hl, $c0a6
1f1c  ldh a, [$ff93]
1f1e  and a
1f1f  jr nz, jr_000_1f26
1f21  ld hl, $c087
1f24  jr jr_000_1f2e
jr_000_1f26:
1f26  ld a, [$c05a]
1f29  cp $01
1f2b  jr z, jr_000_1f34
1f2d  ret
jr_000_1f2e:
1f2e  ld a, [$c05a]
1f31  cp $02
1f33  ret nz
jr_000_1f34:
1f34  inc [hl]
jr_000_1f35:
1f35  ld a, $25
1f37  jp Jump_000_3665
Call_000_1f3a:
1f3a  ldh a, [$ffad]
1f3c  bit 3, a
1f3e  ret z
1f3f  ldh a, [$ffae]
1f41  ret
Call_000_1f42:
Jump_000_1f42:
1f42  push af
1f43  ldh a, [$ffc2]
1f45  bit 6, a
1f47  jr z, jr_000_1f67
1f49  and $0f
1f4b  cp $01
1f4d  jr nz, jr_000_1f5a
1f4f  ld a, [$c0dd]
1f52  cp $05
1f54  jr z, jr_000_1f60
1f56  jr jr_000_1f67
jr_000_1f58:
1f58  pop af
1f59  ret
jr_000_1f5a:
1f5a  sub $04
1f5c  cp $03
1f5e  jr nc, jr_000_1f67
jr_000_1f60:
1f60  ld a, [$dd00]
1f63  cp $ff
1f65  jr nz, jr_000_1f58
jr_000_1f67:
1f67  pop af
1f68  jp Jump_000_3665
Call_000_1f6b:
1f6b  ld a, [$dd02]
1f6e  ld b, $1a
1f70  cp b
1f71  jr nz, jr_000_1f7b
1f73  ld a, [$dd03]
1f76  ld b, $48
1f78  cp b
1f79  jr z, jr_000_1f89
jr_000_1f7b:
1f7b  ld a, [$dd02]
1f7e  ld b, $05
1f80  cp b
1f81  ret nz
1f82  ld a, [$dd03]
1f85  ld b, $48
1f87  cp b
1f88  ret nz
jr_000_1f89:
1f89  ld a, $2c
1f8b  jp Jump_000_3665
Call_000_1f8e:
1f8e  call Call_000_32b9
1f91  ldh a, [$ff90]
1f93  rst RST_08
1fa8  call Call_000_32c8
1fab  xor a
1fac  ld hl, $c000
1faf  ld b, $80
jr_000_1fb1:
1fb1  ld [hl+], a
1fb2  dec b
1fb3  jr nz, jr_000_1fb1
1fb5  ldh a, [$ff96]
1fb7  ld b, a
1fb8  ld a, [$c0db]
1fbb  ld c, a
1fbc  ld a, [$c0e6]
1fbf  cp $0d
1fc1  jr c, jr_000_1fd0
1fc3  ld a, [$c0e7]
1fc6  dec a
1fc7  srl a
1fc9  bit 1, b
1fcb  jr z, jr_000_1fd8
1fcd  cpl
1fce  jr jr_000_1fd8
jr_000_1fd0:
1fd0  ld a, [$c0e6]
1fd3  bit 1, b
1fd5  jr z, jr_000_1fd8
1fd7  cpl
jr_000_1fd8:
1fd8  bit 0, c
1fda  jr nz, jr_000_1fdd
1fdc  cpl
jr_000_1fdd:
1fdd  bit 0, a
1fdf  jr z, jr_000_1fe9
1fe1  res 6, b
1fe3  ld hl, $c000
1fe6  xor a
1fe7  jr jr_000_1ff0
jr_000_1fe9:
1fe9  set 6, b
1feb  ld hl, $c020
1fee  ld a, $80
jr_000_1ff0:
1ff0  ldh [$ffad], a
1ff2  ld a, b
1ff3  ldh [$ff96], a
1ff5  ld a, $04
1ff7  ld [hl], a
1ff8  xor a
1ff9  ldh [$ffb0], a
1ffb  ldh [$ffb5], a
1ffd  ld a, $02
1fff  ldh [$ff90], a
2001  ret
2002  ld a, [$c040]
2005  cp $09
2007  ret nz
2008  ld a, $03
200a  ldh [$ff90], a
200c  ret
200d  ldh a, [$ffc2]
200f  and $0f
2011  sub $04
2013  jr c, jr_000_2049
2015  rst RST_08
201c  ld hl, $ff91
201f  inc [hl]
2020  bit 0, [hl]
2022  jp nz, Jump_000_2129
2025  ldh a, [$ff96]
2027  bit 6, a
2029  ld a, $00
202b  jr nz, jr_000_202e
202d  inc a
jr_000_202e:
202e  jp Jump_000_2170
2031  ldh a, [$ff91]
2033  res 0, a
2035  add $02
2037  ldh [$ff91], a
2039  call Call_000_1f3a
203c  bit 7, a
203e  ld a, $00
2040  jr z, jr_000_2043
2042  inc a
jr_000_2043:
2043  call Call_000_2170
2046  jp Jump_000_1eff
jr_000_2049:
2049  ldh a, [$ff91]
204b  res 0, a
204d  add $02
204f  ldh [$ff91], a
2051  ld a, [$c04d]
2054  bit 1, a
2056  ld a, $00
2058  jr z, jr_000_205b
205a  inc a
jr_000_205b:
205b  call Call_000_2170
205e  jp Jump_000_1eff
2061  ldh a, [$ffaf]
2063  bit 7, a
2065  jp nz, Jump_000_227c
2068  ld hl, $c0dc
206b  inc [hl]
206c  ld hl, $c0e6
206f  inc [hl]
2070  ld hl, $c0e0
2073  ld de, $c0e3
2076  ld b, $00
2078  ldh a, [$ff93]
207a  and a
207b  jr z, jr_000_2085
207d  ld hl, $c0e3
2080  ld de, $c0e0
2083  ld b, $03
jr_000_2085:
2085  ld a, [$c0db]
2088  cp $01
208a  jr z, jr_000_2096
208c  inc hl
208d  inc de
208e  inc b
208f  cp $02
2091  jr z, jr_000_2096
2093  inc hl
2094  inc de
2095  inc b
jr_000_2096:
2096  ld a, b
2097  ldh [$ff95], a
2099  inc [hl]
209a  ld a, [hl]
209b  cp $07
209d  jr z, jr_000_20b9
209f  cp $06
20a1  jr nz, jr_000_2110
20a3  ld a, [de]
20a4  cp $05
20a6  jr c, jr_000_20b9
20a8  jr z, jr_000_2110
20aa  ld hl, $c0dc
20ad  dec [hl]
20ae  xor a
20af  ld [$c0e7], a
20b2  ld a, $05
20b4  ld [$c0ea], a
20b7  jr jr_000_2110
jr_000_20b9:
20b9  ld a, $01
20bb  ld [$c0e6], a
20be  ld b, $01
20c0  ldh a, [$ff93]
20c2  and a
20c3  jr z, jr_000_20c7
20c5  ld b, $ff
jr_000_20c7:
20c7  ldh a, [$ffc4]
20c9  add b
20ca  ldh [$ffc4], a
20cc  ld a, [$c0db]
20cf  inc a
20d0  ld [$c0db], a
20d3  cp $03
20d5  jr nz, jr_000_20f6
20d7  ld b, $06
20d9  ld a, $04
20db  ld [$c0ea], a
20de  ldh a, [$ffc4]
20e0  cp $02
20e2  jr z, jr_000_20e9
20e4  inc b
20e5  cp $fe
20e7  jr nz, jr_000_2110
jr_000_20e9:
20e9  ld a, b
20ea  ldh [$ff90], a
20ec  ld a, $96
20ee  ldh [$ff92], a
20f0  ld a, $06
20f2  ld [$c0ea], a
20f5  ret
jr_000_20f6:
20f6  cp $04
20f8  jr nz, jr_000_2105
jr_000_20fa:
20fa  ld b, $06
20fc  ldh a, [$ffc4]
20fe  bit 7, a
2100  jr z, jr_000_20e9
2102  inc b
2103  jr jr_000_20e9
jr_000_2105:
2105  ld a, $03
2107  ld [$c0ea], a
210a  ldh a, [$ff96]
210c  bit 3, a
210e  jr nz, jr_000_20fa
jr_000_2110:
2110  ld a, $64
2112  ldh [$ff92], a
2114  ld a, $05
2116  ldh [$ff90], a
2118  ret
2119  ldh a, [$ffc3]
211b  ldh [$ff91], a
211d  ld hl, $ff92
2120  dec [hl]
2121  ret nz
2122  ld a, $0a
2124  ldh [$ff8a], a
2126  jp Jump_000_016d
Jump_000_2129:
2129  xor a
212a  ldh [$ff90], a
212c  ret
212d  xor a
212e  ldh [$ff90], a
2130  ld a, [$c0e6]
2133  cp $0d
2135  ret c
2136  ld a, [$c0e7]
2139  ld l, a
213a  ld h, $00
213c  ld a, $06
213e  call Call_000_3143
2141  and a
2142  ret nz
2143  ld a, $08
2145  ldh [$ff8a], a
2147  jp Jump_000_016d
214a  ldh a, [$ffc3]
214c  ldh [$ff91], a
214e  ld hl, $ff92
2151  dec [hl]
2152  ret nz
2153  xor a
2154  ldh [$ff90], a
2156  jp Jump_000_016d
Call_000_2159:
2159  xor a
215a  ldh [$ff90], a
215c  ldh [$ff91], a
215e  ld a, [$c0e6]
2161  cp $0d
2163  ld a, $01
2165  jr c, jr_000_2169
2167  ld a, $07
jr_000_2169:
2169  ld [$c0dd], a
216c  ld [$c0de], a
216f  ret
Call_000_2170:
Jump_000_2170:
2170  ldh [$ff93], a
2172  and a
2173  ld hl, $c081
2176  jr z, jr_000_217b
2178  ld hl, $c0a1
jr_000_217b:
217b  inc [hl]
217c  ld hl, $c0dd
217f  ld de, $c0de
2182  ldh a, [$ff93]
2184  and a
2185  jr z, jr_000_2189
2187  inc hl
2188  dec de
jr_000_2189:
2189  ld a, [$c0e7]
218c  inc a
218d  ld [$c0e7], a
2190  ld a, $08
2192  ldh [$ff90], a
2194  ld a, [hl]
2195  cp $00
2197  jr z, jr_000_21b3
2199  cp $03
219b  jr c, jr_000_21da
219d  jr z, jr_000_21bc
219f  cp $04
21a1  jr z, jr_000_21c9
21a3  cp $05
21a5  jr z, jr_000_21d0
21a7  cp $06
21a9  jr z, jr_000_21c9
21ab  cp $0c
21ad  jr c, jr_000_21da
21af  jr z, jr_000_21e0
21b1  jr jr_000_21c9
jr_000_21b3:
21b3  ld a, $05
21b5  ld [hl], a
21b6  ld [de], a
21b7  ld a, $29
21b9  jp Jump_000_3665
jr_000_21bc:
21bc  ld a, [de]
21bd  cp $04
21bf  jr z, jr_000_21b3
21c1  ld a, $04
21c3  ld [hl], a
21c4  ld a, $31
21c6  jp Jump_000_3665
jr_000_21c9:
21c9  xor a
21ca  ld [hl], a
21cb  ld a, $04
21cd  ldh [$ff90], a
21cf  ret
jr_000_21d0:
21d0  xor a
21d1  ld [de], a
21d2  ld a, $06
21d4  ld [hl], a
21d5  ld a, $31
21d7  jp Jump_000_3665
jr_000_21da:
21da  inc [hl]
21db  ld a, $31
21dd  jp Jump_000_3665
jr_000_21e0:
21e0  ld a, [de]
21e1  cp $0d
21e3  jr z, jr_000_21b3
21e5  ld a, $0d
21e7  ld [hl], a
21e8  ld a, $31
21ea  jp Jump_000_3665
Call_000_21ed:
21ed  ldh a, [$ff8b]
21ef  and a
21f0  jr z, jr_000_21f7
21f2  ldh a, [$ff96]
21f4  bit 0, a
21f6  ret nz
jr_000_21f7:
21f7  call Call_000_369e
21fa  call Call_000_31ff
21fd  call Call_000_2fa0
2200  call Call_000_2225
2203  ldh a, [$ffaf]
2205  bit 7, a
2207  jr nz, jr_000_2219
2209  ldh a, [$ff9e]
220b  xor c
220c  and c
220d  ldh [$ff9b], a
220f  ldh [$ff99], a
2211  ld a, c
2212  ldh [$ff9a], a
2214  ldh [$ff9e], a
2216  ldh [$ff98], a
2218  ret
jr_000_2219:
2219  ldh a, [$ff98]
221b  xor c
221c  and c
221d  ldh [$ff99], a
221f  ld a, c
2220  ldh [$ff9e], a
2222  ldh [$ff98], a
2224  ret
Call_000_2225:
2225  ld a, c
2226  and $c0
2228  cp $c0
222a  jr nz, jr_000_222d
222c  xor a
jr_000_222d:
222d  ld b, a
222e  ld a, c
222f  and $30
2231  cp $30
2233  jr nz, jr_000_2236
2235  xor a
jr_000_2236:
2236  or b
2237  ld b, a
2238  ld a, c
2239  and $0f
223b  or b
223c  ld c, a
223d  ret
Call_000_223e:
223e  ldh a, [rSB]
2240  cp $fe
2242  jr c, jr_000_2254
2244  and $01
2246  xor $01
2248  ldh [$ff93], a
224a  ld a, $04
224c  ldh [$ff90], a
224e  ldh [$ffec], a
2250  ldh a, [$ff9c]
2252  ld c, a
2253  ret
jr_000_2254:
2254  ldh a, [$ff8b]
2256  cp $02
2258  ld d, $20
225a  ld e, $10
225c  ld c, $cf
225e  jr z, jr_000_2266
2260  ld d, $a0
2262  ld e, $50
2264  ld c, $0f
jr_000_2266:
2266  ldh a, [rSB]
2268  rla
2269  and d
226a  ld b, a
226b  ldh a, [rSB]
226d  rra
226e  and e
226f  or b
2270  ld b, a
2271  ldh a, [rSB]
2273  and c
2274  or b
2275  ld c, a
2276  ret
Call_000_2277:
2277  ldh a, [$ffa0]
2279  cp $08
227b  ret c
Jump_000_227c:
227c  xor a
227d  ldh [$ff8a], a
227f  inc a
2280  ld [$c0df], a
2283  jp Jump_000_016d
Call_000_2286:
2286  call Call_000_00a9
2289  and $3f
228b  add $20
228d  ld b, $01
228f  ret
Call_000_2290:
2290  call Call_000_00a9
2293  and $1f
2295  sub $10
2297  ld b, $02
2299  ret
Call_000_229a:
229a  ld a, [$c0df]
229d  cp $04
229f  ld bc, $0f48
22a2  jr nz, jr_000_22a7
22a4  ld bc, $0750
jr_000_22a7:
22a7  call Call_000_00a9
22aa  and b
22ab  add c
22ac  ld c, $01
22ae  ld b, $03
22b0  ret
Call_000_22b1:
22b1  ldh a, [$ff91]
22b3  bit 0, a
22b5  ld c, $01
22b7  jr z, jr_000_22bb
22b9  ld c, $02
jr_000_22bb:
22bb  ld a, [hl]
22bc  call Call_000_00ca
22bf  jr c, jr_000_22e1
22c1  call Call_000_00a9
22c4  and $f0
22c6  cp $c0
22c8  ldh a, [$ff96]
22ca  ld b, a
22cb  ldh a, [$ff91]
22cd  jr c, jr_000_22d1
22cf  xor $02
jr_000_22d1:
22d1  bit 6, b
22d3  jr z, jr_000_22d7
22d5  xor $02
jr_000_22d7:
22d7  bit 1, a
22d9  ld a, $20
22db  jr z, jr_000_22df
22dd  ld a, $10
jr_000_22df:
22df  or c
22e0  ld c, a
jr_000_22e1:
22e1  call Call_000_00a9
22e4  bit 4, a
22e6  jr nz, jr_000_2309
22e8  bit 3, a
22ea  ld a, [$c047]
22ed  jr nz, jr_000_22f9
22ef  cp $44
22f1  jr nc, jr_000_2309
22f3  ldh a, [$ff96]
22f5  xor $40
22f7  jr jr_000_22ff
jr_000_22f9:
22f9  cp $3c
22fb  jr c, jr_000_2309
22fd  ldh a, [$ff96]
jr_000_22ff:
22ff  bit 6, a
2301  ld a, $80
2303  jr z, jr_000_2307
2305  ld a, $40
jr_000_2307:
2307  or c
2308  ld c, a
jr_000_2309:
2309  ld a, $04
230b  ret
Call_000_230c:
230c  ldh a, [$ffaf]
230e  bit 7, a
2310  ret z
2311  call Call_000_2277
2314  ld c, $00
2316  ldh a, [$ffad]
2318  bit 6, a
231a  jr z, jr_000_2321
231c  call Call_000_23ab
231f  jr jr_000_2324
jr_000_2321:
2321  call Call_000_233f
jr_000_2324:
2324  ld a, [$c05a]
2327  cp $01
2329  jr z, jr_000_2335
232b  ldh a, [$ffad]
232d  bit 5, a
232f  jr z, jr_000_2335
2331  res 0, c
2333  res 1, c
jr_000_2335:
2335  ldh a, [$ff9a]
2337  xor c
2338  and c
2339  ldh [$ff9b], a
233b  ld a, c
233c  ldh [$ff9a], a
233e  ret
Call_000_233f:
233f  ldh a, [$ff96]
2341  bit 6, a
2343  ret nz
2344  ldh a, [$ffb0]
2346  rst RST_08
jr_000_2351:
2351  ld a, [$c000]
2354  cp $05
2356  ret nz
2357  call Call_000_2286
235a  ldh [$ffb1], a
235c  ld a, b
235d  ldh [$ffb0], a
235f  ret
2360  ld hl, $ffb1
2363  dec [hl]
2364  ret nz
2365  call Call_000_2290
2368  ldh [$ffb1], a
236a  ld a, b
236b  ldh [$ffb0], a
236d  ret
236e  ldh a, [$ffb1]
2370  bit 7, a
2372  jr nz, jr_000_2379
2374  ld c, $20
2376  dec a
2377  jr jr_000_237c
jr_000_2379:
2379  ld c, $10
237b  inc a
jr_000_237c:
237c  ldh [$ffb1], a
237e  ret nz
237f  call Call_000_229a
2382  ldh [$ffb1], a
2384  ld a, b
2385  ldh [$ffb0], a
2387  ret
2388  ld a, [$c000]
238b  cp $06
238d  jr nz, jr_000_2351
238f  ld hl, $ffb1
2392  dec [hl]
2393  ret nz
2394  ld hl, $c094
2397  call Call_000_22b1
239a  ldh [$ffb0], a
239c  ret
239d  ldh a, [$ff9a]
239f  and $f0
23a1  ld c, a
23a2  ldh a, [$ffad]
23a4  bit 6, a
23a6  ret z
23a7  xor a
23a8  ldh [$ffb0], a
23aa  ret
Call_000_23ab:
23ab  ldh a, [$ffc2]
23ad  bit 6, a
23af  ret nz
23b0  ld a, [$c04c]
23b3  cp $02
23b5  ret nc
23b6  ldh a, [$ffb0]
23b8  rst RST_08
23c5  xor a
23c6  ldh [$ffb4], a
23c8  ldh a, [$ffad]
23ca  bit 7, a
23cc  jr z, jr_000_23d4
23ce  ld a, [$c043]
23d1  cp $80
23d3  ret nc
jr_000_23d4:
23d4  ld a, [$c05a]
23d7  cp $02
23d9  jr c, jr_000_2429
23db  ld c, $06
23dd  ld a, [$c003]
23e0  cp $9a
23e2  jr c, jr_000_23ec
23e4  ld c, $03
23e6  cp $b8
23e8  jr c, jr_000_23ec
23ea  ld c, $00
jr_000_23ec:
23ec  ld b, $00
23ee  ld hl, $c097
23f1  add hl, bc
23f2  ld d, $00
23f4  ld a, [$c0df]
23f7  cp $03
23f9  jr c, jr_000_2409
23fb  ld a, [$c003]
23fe  sub $6c
2400  jr nc, jr_000_2404
2402  cpl
2403  inc a
jr_000_2404:
2404  srl a
2406  srl a
2408  ld d, a
jr_000_2409:
2409  ld a, [hl+]
240a  sub d
240b  jr nc, jr_000_240e
240d  xor a
jr_000_240e:
240e  ld d, a
240f  push hl
2410  call Call_000_00ca
2413  pop hl
2414  jr nc, jr_000_2429
2416  ld a, [hl+]
2417  add d
2418  ld d, a
2419  push hl
241a  call Call_000_00d9
241d  pop hl
241e  jr nc, jr_000_2433
2420  ld a, [hl]
2421  add d
2422  call Call_000_00d9
2425  jr nc, jr_000_2454
2427  jr jr_000_245c
jr_000_2429:
2429  ld a, [$c005]
242c  ldh [$ffb2], a
242e  ld a, [$c003]
2431  jr jr_000_2463
jr_000_2433:
2433  call Call_000_00a9
2436  and $3f
2438  add $4c
243a  ld b, a
243b  ld a, [$c005]
243e  ld hl, $c045
2441  add [hl]
2442  rra
2443  add b
2444  rra
2445  ldh [$ffb2], a
2447  ld a, [$c003]
244a  sub $20
244c  cp $84
244e  jr nc, jr_000_2463
2450  ld a, $84
2452  jr jr_000_2463
jr_000_2454:
2454  ld a, $6c
2456  ldh [$ffb2], a
2458  ld a, $b8
245a  jr jr_000_2463
jr_000_245c:
245c  ld a, $6c
245e  ldh [$ffb2], a
2460  ld a, [$c003]
jr_000_2463:
2463  ldh [$ffb3], a
2465  ld c, $00
2467  xor a
2468  ldh [$ffb1], a
246a  inc a
246b  ldh [$ffb0], a
246d  ret
246e  ld hl, $ffb2
2471  ld a, [$c005]
2474  sub [hl]
2475  jr z, jr_000_247d
2477  ld c, $20
2479  jr nc, jr_000_247d
247b  ld c, $10
jr_000_247d:
247d  inc hl
247e  ld a, [$c003]
2481  sub [hl]
2482  jr z, jr_000_248c
2484  ld a, $40
2486  jr nc, jr_000_248a
2488  ld a, $80
jr_000_248a:
248a  or c
248b  ld c, a
jr_000_248c:
248c  ldh a, [$ffad]
248e  bit 7, a
2490  ret nz
2491  ld a, [$c05a]
2494  cp $02
2496  ld a, [$c090]
2499  jr nc, jr_000_24a4
249b  ld b, a
249c  ld a, [$c051]
249f  srl a
24a1  srl a
24a3  add b
jr_000_24a4:
24a4  ld hl, $c043
24a7  cp [hl]
24a8  ret nc
24a9  ld a, $02
24ab  ldh [$ffb0], a
24ad  ret
24ae  ldh a, [$ffb1]
24b0  and a
24b1  jr z, jr_000_24c2
24b3  dec a
24b4  ldh [$ffb1], a
24b6  ld b, $00
24b8  jp nz, Jump_000_256a
24bb  ld a, $03
24bd  ldh [$ffb0], a
24bf  jp Jump_000_256a
jr_000_24c2:
24c2  ld a, [$c051]
24c5  swap a
24c7  and $0f
24c9  ld b, a
24ca  srl b
24cc  sla a
24ce  sla a
24d0  sub b
24d1  ld b, a
24d2  ld hl, $c043
24d5  ld a, [$c003]
24d8  sub [hl]
24d9  cp b
24da  jr nc, jr_000_2508
24dc  call Call_000_0890
24df  call Call_000_1722
24e2  ld a, [$c005]
24e5  sub h
24e6  add $14
24e8  cp $28
24ea  jr nc, jr_000_2508
24ec  ld a, [$c047]
24ef  cp $48
24f1  jr nc, jr_000_2568
24f3  ld a, [$c04b]
24f6  cp $04
24f8  jr nc, jr_000_2500
24fa  ld a, [$c04c]
24fd  and a
24fe  jr z, jr_000_2508
jr_000_2500:
2500  call Call_000_00a9
2503  and $07
2505  inc a
2506  ldh [$ffb1], a
jr_000_2508:
2508  ld a, [$c047]
250b  cp $60
250d  jr c, jr_000_251b
250f  ldh a, [$ffb4]
2511  and a
2512  jr nz, jr_000_251b
2514  ld a, $05
2516  ldh [$ffb0], a
2518  ld c, $00
251a  ret
jr_000_251b:
251b  ld a, [$c090]
251e  ld hl, $c043
2521  cp [hl]
2522  jr nc, jr_000_2535
2524  ld a, [$c047]
2527  bit 7, a
2529  jr nz, jr_000_2568
252b  cp $30
252d  jr nc, jr_000_2539
252f  ld a, [$c04c]
2532  and a
2533  jr nz, jr_000_2539
jr_000_2535:
2535  ld b, $00
2537  jr jr_000_256a
jr_000_2539:
2539  ld b, $80
253b  ld a, [$c05a]
253e  cp $02
2540  jr nc, jr_000_254b
2542  ld a, [$c003]
2545  cp $a4
2547  jr nc, jr_000_254b
2549  ld b, $00
jr_000_254b:
254b  ld a, [$c051]
254e  srl a
2550  srl a
2552  srl a
2554  ld c, a
2555  ld a, [$c052]
2558  bit 7, a
255a  jr z, jr_000_255e
255c  srl c
jr_000_255e:
255e  ld a, [$c043]
2561  add c
2562  ld hl, $c003
2565  sub [hl]
2566  jr nc, jr_000_256a
jr_000_2568:
2568  ld b, $40
Jump_000_256a:
jr_000_256a:
256a  push bc
256b  call Call_000_0890
256e  call Call_000_1722
2571  ld a, [$c005]
2574  sub h
2575  ld c, $20
2577  bit 7, a
2579  jr z, jr_000_257f
257b  ld c, $10
257d  cpl
257e  inc a
jr_000_257f:
257f  cp $08
2581  jr c, jr_000_258b
2583  cp $10
2585  jr nc, jr_000_258f
2587  ld c, $00
2589  jr jr_000_258f
jr_000_258b:
258b  ld a, c
258c  xor $30
258e  ld c, a
jr_000_258f:
258f  ld a, c
2590  pop bc
2591  or b
2592  ld c, a
2593  ret
2594  call Call_000_176b
2597  ld c, $00
2599  jr c, jr_000_25cd
259b  ld a, [$c02b]
259e  cp $08
25a0  jr c, jr_000_25cb
25a2  ldh a, [$ff9c]
25a4  bit 7, a
25a6  jr z, jr_000_25b1
25a8  ld a, [$c023]
25ab  cp $50
25ad  jr c, jr_000_25b1
25af  ld c, $1e
jr_000_25b1:
25b1  ld a, [$c091]
25b4  add c
25b5  push af
25b6  ld a, [$c00b]
25b9  cp $0c
25bb  jr c, jr_000_25c3
25bd  pop af
25be  srl a
25c0  srl a
25c2  push af
jr_000_25c3:
25c3  pop af
25c4  call Call_000_00ca
25c7  ld c, $02
25c9  jr nc, jr_000_25cd
jr_000_25cb:
25cb  ld c, $01
jr_000_25cd:
25cd  ld a, [$c00b]
25d0  cp $0c
25d2  ld a, [$c095]
25d5  jr c, jr_000_25d9
25d7  add $14
jr_000_25d9:
25d9  call Call_000_00ca
25dc  ld b, $00
25de  jr c, jr_000_2616
25e0  ld a, [$c0df]
25e3  cp $04
25e5  ld h, $03
25e7  jr nz, jr_000_25eb
25e9  ld h, $01
jr_000_25eb:
25eb  call Call_000_00a9
25ee  and h
25ef  jr nz, jr_000_25fb
25f1  ldh a, [$ff9c]
25f3  bit 5, a
25f5  jr nz, jr_000_2602
25f7  bit 4, a
25f9  jr nz, jr_000_260d
jr_000_25fb:
25fb  ld a, [$c025]
25fe  cp $6c
2600  jr nc, jr_000_260d
jr_000_2602:
2602  ld a, [$c005]
2605  cp $88
2607  jr nc, jr_000_2616
2609  ld b, $10
260b  jr jr_000_2616
jr_000_260d:
260d  ld a, [$c005]
2610  cp $50
2612  jr c, jr_000_2616
2614  ld b, $20
jr_000_2616:
2616  ld a, b
2617  or c
2618  ld c, a
2619  bit 1, c
261b  jr z, jr_000_2624
261d  call Call_000_00a9
2620  bit 4, a
2622  jr nz, jr_000_263b
jr_000_2624:
2624  ld b, $00
2626  call Call_000_00a9
2629  bit 0, a
262b  jr z, jr_000_2648
262d  ld a, [$c023]
2630  cp $40
2632  jr c, jr_000_263f
2634  ld a, [$c003]
2637  cp $b0
2639  jr c, jr_000_2648
jr_000_263b:
263b  ld b, $40
263d  jr jr_000_2648
jr_000_263f:
263f  ld a, [$c003]
2642  cp $b0
2644  jr nc, jr_000_2648
2646  ld b, $80
jr_000_2648:
2648  ld a, b
2649  or c
264a  ld c, a
264b  ld a, $04
264d  ldh [$ffb0], a
264f  ret
2650  ldh a, [$ff9a]
2652  and $f0
2654  ld c, a
2655  ld a, [$c000]
2658  cp $02
265a  ret z
265b  xor a
265c  ldh [$ffb0], a
265e  ret
265f  ldh a, [$ffb1]
2661  and a
2662  jr z, jr_000_2673
2664  dec a
2665  ldh [$ffb1], a
2667  ld b, $00
2669  jp nz, Jump_000_26fe
266c  ld a, $03
266e  ldh [$ffb0], a
2670  jp Jump_000_26fe
jr_000_2673:
2673  ld hl, $c043
2676  ld a, [$c003]
2679  sub [hl]
267a  cp $0c
267c  jr nc, jr_000_26a0
267e  ld hl, $c004
2681  call Call_000_1bef
2684  add $04
2686  cp $10
2688  jr nc, jr_000_26a0
268a  ld a, [$c047]
268d  cp $60
268f  jr nc, jr_000_26a0
2691  ld a, [$c052]
2694  bit 7, a
2696  jr z, jr_000_26a0
2698  call Call_000_00a9
269b  and $03
269d  inc a
269e  ldh [$ffb1], a
jr_000_26a0:
26a0  ld a, [$c043]
26a3  cp $90
26a5  jr nc, jr_000_26c7
26a7  ld a, [$c052]
26aa  bit 7, a
26ac  jr z, jr_000_26d0
26ae  ld a, [$c005]
26b1  add $08
26b3  ld b, a
26b4  ld a, [$c045]
26b7  sub b
26b8  jr nc, jr_000_26bc
26ba  cpl
26bb  inc a
jr_000_26bc:
26bc  sla a
26be  add $38
26c0  ld b, a
26c1  ld a, [$c047]
26c4  cp b
26c5  jr nc, jr_000_26d0
jr_000_26c7:
26c7  ld a, $02
26c9  ldh [$ffb0], a
26cb  ldh [$ffb4], a
26cd  ld c, $00
26cf  ret
jr_000_26d0:
26d0  ld a, [$c090]
26d3  ld hl, $c043
26d6  cp [hl]
26d7  jr nc, jr_000_26fc
26d9  ld b, $80
26db  ld a, [$c003]
26de  ld hl, $c043
26e1  sub [hl]
26e2  jr c, jr_000_26fe
26e4  cp $08
26e6  jr c, jr_000_26e8
jr_000_26e8:
26e8  ld b, $80
26ea  ld a, [$c003]
26ed  ld hl, $c043
26f0  sub [hl]
26f1  cp $18
26f3  jr nc, jr_000_26fc
26f5  ld a, [$c047]
26f8  bit 7, a
26fa  jr nz, jr_000_26fe
jr_000_26fc:
26fc  ld b, $00
Jump_000_26fe:
jr_000_26fe:
26fe  push bc
26ff  call Call_000_0890
2702  call Call_000_1722
2705  ld a, [$c005]
2708  sub h
2709  ld c, $20
270b  bit 7, a
270d  jr z, jr_000_2711
270f  ld c, $10
jr_000_2711:
2711  cp $fc
2713  jr nc, jr_000_2719
2715  cp $f4
2717  jr c, jr_000_271b
jr_000_2719:
2719  ld c, $00
jr_000_271b:
271b  ld a, c
271c  pop bc
271d  or b
271e  ld c, a
271f  ret
Call_000_2720:
2720  ldh a, [$ff96]
2722  bit 0, a
2724  ret nz
2725  ld c, $00
2727  ldh a, [$ffad]
2729  bit 6, a
272b  jr z, jr_000_2732
272d  call Call_000_27bc
2730  jr jr_000_2735
jr_000_2732:
2732  call Call_000_2750
jr_000_2735:
2735  ld a, [$c05a]
2738  cp $01
273a  jr z, jr_000_2746
273c  ldh a, [$ffad]
273e  bit 5, a
2740  jr z, jr_000_2746
2742  res 0, c
2744  res 1, c
jr_000_2746:
2746  ldh a, [$ff9c]
2748  xor c
2749  and c
274a  ldh [$ff9d], a
274c  ld a, c
274d  ldh [$ff9c], a
274f  ret
Call_000_2750:
2750  ldh a, [$ff96]
2752  bit 6, a
2754  ret z
2755  ldh a, [$ffb5]
2757  rst RST_08
jr_000_2762:
2762  ld a, [$c020]
2765  cp $05
2767  ret nz
2768  call Call_000_2286
276b  ldh [$ffb6], a
276d  ld a, b
276e  ldh [$ffb5], a
2770  ret
2771  ld hl, $ffb6
2774  dec [hl]
2775  ret nz
2776  call Call_000_2290
2779  ldh [$ffb6], a
277b  ld a, b
277c  ldh [$ffb5], a
277e  ret
277f  ldh a, [$ffb6]
2781  bit 7, a
2783  jr nz, jr_000_278a
2785  ld c, $20
2787  dec a
2788  jr jr_000_278d
jr_000_278a:
278a  ld c, $10
278c  inc a
jr_000_278d:
278d  ldh [$ffb6], a
278f  ret nz
2790  call Call_000_229a
2793  ldh [$ffb6], a
2795  ld a, b
2796  ldh [$ffb5], a
2798  ret
2799  ld a, [$c020]
279c  cp $06
279e  jr nz, jr_000_2762
27a0  ld hl, $ffb6
27a3  dec [hl]
27a4  ret nz
27a5  ld hl, $c0b4
27a8  call Call_000_22b1
27ab  ldh [$ffb5], a
27ad  ret
27ae  ldh a, [$ff9c]
27b0  and $f0
27b2  ld c, a
27b3  ldh a, [$ffad]
27b5  bit 6, a
27b7  ret z
27b8  xor a
27b9  ldh [$ffb5], a
27bb  ret
Call_000_27bc:
27bc  ldh a, [$ffc2]
27be  bit 6, a
27c0  ret nz
27c1  ld a, [$c04c]
27c4  cp $02
27c6  ret nc
27c7  ldh a, [$ffb5]
27c9  rst RST_08
27d6  xor a
27d7  ldh [$ffb9], a
27d9  ldh a, [$ffad]
27db  bit 7, a
27dd  jr nz, jr_000_27e5
27df  ld a, [$c043]
27e2  cp $70
27e4  ret c
jr_000_27e5:
27e5  ld a, [$c05a]
27e8  cp $02
27ea  jr c, jr_000_283a
27ec  ld c, $00
27ee  ld a, [$c023]
27f1  cp $38
27f3  jr c, jr_000_27fd
27f5  ld c, $03
27f7  cp $56
27f9  jr c, jr_000_27fd
27fb  ld c, $06
jr_000_27fd:
27fd  ld b, $00
27ff  ld hl, $c0b7
2802  add hl, bc
2803  ld d, $00
2805  ld a, [$c0df]
2808  cp $03
280a  jr c, jr_000_281a
280c  ld a, [$c023]
280f  sub $6c
2811  jr nc, jr_000_2815
2813  cpl
2814  inc a
jr_000_2815:
2815  srl a
2817  srl a
2819  ld d, a
jr_000_281a:
281a  ld a, [hl+]
281b  sub d
281c  jr nc, jr_000_281f
281e  xor a
jr_000_281f:
281f  ld d, a
2820  push hl
2821  call Call_000_00ca
2824  pop hl
2825  jr nc, jr_000_283a
2827  ld a, [hl+]
2828  add d
2829  ld d, a
282a  push hl
282b  call Call_000_00d9
282e  pop hl
282f  jr nc, jr_000_2844
2831  ld a, [hl]
2832  add d
2833  call Call_000_00d9
2836  jr nc, jr_000_2865
2838  jr jr_000_286d
jr_000_283a:
283a  ld a, [$c025]
283d  ldh [$ffb7], a
283f  ld a, [$c023]
2842  jr jr_000_2874
jr_000_2844:
2844  call Call_000_00a9
2847  and $3f
2849  add $4c
284b  ld b, a
284c  ld a, [$c025]
284f  ld hl, $c045
2852  add [hl]
2853  rra
2854  add b
2855  rra
2856  ldh [$ffb7], a
2858  ld a, [$c023]
285b  add $20
285d  cp $6c
285f  jr c, jr_000_2874
2861  ld a, $6c
2863  jr jr_000_2874
jr_000_2865:
2865  ld a, $6c
2867  ldh [$ffb7], a
2869  ld a, $38
286b  jr jr_000_2874
jr_000_286d:
286d  ld a, $6c
286f  ldh [$ffb7], a
2871  ld a, [$c023]
jr_000_2874:
2874  ldh [$ffb8], a
2876  ld c, $00
2878  xor a
2879  ldh [$ffb6], a
287b  inc a
287c  ldh [$ffb5], a
287e  ret
287f  ld hl, $ffb7
2882  ld a, [$c025]
2885  sub [hl]
2886  jr z, jr_000_288e
2888  ld c, $20
288a  jr nc, jr_000_288e
288c  ld c, $10
jr_000_288e:
288e  inc hl
288f  ld a, [$c023]
2892  sub [hl]
2893  jr z, jr_000_289d
2895  ld a, $40
2897  jr nc, jr_000_289b
2899  ld a, $80
jr_000_289b:
289b  or c
289c  ld c, a
jr_000_289d:
289d  ldh a, [$ffad]
289f  bit 7, a
28a1  ret z
28a2  ld a, [$c05a]
28a5  cp $02
28a7  ld a, [$c0b0]
28aa  jr nc, jr_000_28b7
28ac  ld b, a
28ad  ld a, [$c051]
28b0  srl a
28b2  srl a
28b4  ld l, a
28b5  ld a, b
28b6  sub l
jr_000_28b7:
28b7  ld hl, $c043
28ba  cp [hl]
28bb  ret c
28bc  ld a, $02
28be  ldh [$ffb5], a
28c0  ret
28c1  ldh a, [$ffb6]
28c3  and a
28c4  jr z, jr_000_28d5
28c6  dec a
28c7  ldh [$ffb6], a
28c9  ld b, $00
28cb  jp nz, Jump_000_297d
28ce  ld a, $03
28d0  ldh [$ffb5], a
28d2  jp Jump_000_297d
jr_000_28d5:
28d5  ld a, [$c051]
28d8  swap a
28da  and $0f
28dc  ld b, a
28dd  srl b
28df  sla a
28e1  sla a
28e3  sub b
28e4  ld b, a
28e5  ld hl, $c023
28e8  ld a, [$c043]
28eb  sub [hl]
28ec  cp b
28ed  jr nc, jr_000_291b
28ef  call Call_000_08a6
28f2  call Call_000_1722
28f5  ld a, [$c025]
28f8  sub h
28f9  add $14
28fb  cp $28
28fd  jr nc, jr_000_291b
28ff  ld a, [$c047]
2902  cp $48
2904  jr nc, jr_000_297b
2906  ld a, [$c04b]
2909  cp $04
290b  jr nc, jr_000_2913
290d  ld a, [$c04c]
2910  and a
2911  jr z, jr_000_291b
jr_000_2913:
2913  call Call_000_00a9
2916  and $07
2918  inc a
2919  ldh [$ffb6], a
jr_000_291b:
291b  ld a, [$c047]
291e  cp $60
2920  jr c, jr_000_292e
2922  ldh a, [$ffb9]
2924  and a
2925  jr nz, jr_000_292e
2927  ld a, $05
2929  ldh [$ffb5], a
292b  ld c, $00
292d  ret
jr_000_292e:
292e  ld a, [$c0b0]
2931  ld hl, $c043
2934  cp [hl]
2935  jr c, jr_000_2948
2937  ld a, [$c047]
293a  bit 7, a
293c  jr nz, jr_000_297b
293e  cp $30
2940  jr nc, jr_000_294c
2942  ld a, [$c04c]
2945  and a
2946  jr nz, jr_000_294c
jr_000_2948:
2948  ld b, $00
294a  jr jr_000_297d
jr_000_294c:
294c  ld b, $80
294e  ld a, [$c05a]
2951  cp $02
2953  jr nc, jr_000_295e
2955  ld a, [$c023]
2958  cp $4c
295a  jr c, jr_000_295e
295c  ld b, $00
jr_000_295e:
295e  ld a, [$c051]
2961  srl a
2963  srl a
2965  srl a
2967  ld c, a
2968  ld a, [$c052]
296b  bit 7, a
296d  jr z, jr_000_2971
296f  srl c
jr_000_2971:
2971  ld a, [$c043]
2974  sub c
2975  ld hl, $c023
2978  sub [hl]
2979  jr nc, jr_000_297d
jr_000_297b:
297b  ld b, $40
Jump_000_297d:
jr_000_297d:
297d  push bc
297e  call Call_000_08a6
2981  call Call_000_1722
2984  ld a, [$c025]
2987  sub h
2988  ld c, $20
298a  bit 7, a
298c  jr z, jr_000_2992
298e  ld c, $10
2990  cpl
2991  inc a
jr_000_2992:
2992  cp $08
2994  jr c, jr_000_299e
2996  cp $10
2998  jr nc, jr_000_29a2
299a  ld c, $00
299c  jr jr_000_29a2
jr_000_299e:
299e  ld a, c
299f  xor $30
29a1  ld c, a
jr_000_29a2:
29a2  ld a, c
29a3  pop bc
29a4  or b
29a5  ld c, a
29a6  ret
29a7  call Call_000_176b
29aa  ld c, $00
29ac  jr c, jr_000_29e0
29ae  ld a, [$c00b]
29b1  cp $08
29b3  jr c, jr_000_29de
29b5  ldh a, [$ff9a]
29b7  bit 6, a
29b9  jr z, jr_000_29c4
29bb  ld a, [$c003]
29be  cp $a0
29c0  jr nc, jr_000_29c4
29c2  ld c, $1e
jr_000_29c4:
29c4  ld a, [$c0b1]
29c7  add c
29c8  push af
29c9  ld a, [$c02b]
29cc  cp $0c
29ce  jr c, jr_000_29d6
29d0  pop af
29d1  srl a
29d3  srl a
29d5  push af
jr_000_29d6:
29d6  pop af
29d7  call Call_000_00ca
29da  ld c, $02
29dc  jr nc, jr_000_29e0
jr_000_29de:
29de  ld c, $01
jr_000_29e0:
29e0  ld a, [$c02b]
29e3  cp $0c
29e5  ld a, [$c0b5]
29e8  jr c, jr_000_29ec
29ea  add $14
jr_000_29ec:
29ec  call Call_000_00ca
29ef  ld b, $00
29f1  jr c, jr_000_2a29
29f3  ld a, [$c0df]
29f6  cp $04
29f8  ld h, $03
29fa  jr nz, jr_000_29fe
29fc  ld h, $01
jr_000_29fe:
29fe  call Call_000_00a9
2a01  and h
2a02  jr nz, jr_000_2a0e
2a04  ldh a, [$ff9a]
2a06  bit 5, a
2a08  jr nz, jr_000_2a15
2a0a  bit 4, a
2a0c  jr nz, jr_000_2a20
jr_000_2a0e:
2a0e  ld a, [$c005]
2a11  cp $6c
2a13  jr nc, jr_000_2a20
jr_000_2a15:
2a15  ld a, [$c025]
2a18  cp $88
2a1a  jr nc, jr_000_2a29
2a1c  ld b, $10
2a1e  jr jr_000_2a29
jr_000_2a20:
2a20  ld a, [$c025]
2a23  cp $50
2a25  jr c, jr_000_2a29
2a27  ld b, $20
jr_000_2a29:
2a29  ld a, b
2a2a  or c
2a2b  ld c, a
2a2c  bit 1, c
2a2e  jr z, jr_000_2a37
2a30  call Call_000_00a9
2a33  bit 4, a
2a35  jr nz, jr_000_2a4e
jr_000_2a37:
2a37  ld b, $00
2a39  call Call_000_00a9
2a3c  bit 0, a
2a3e  jr z, jr_000_2a5b
2a40  ld a, [$c003]
2a43  cp $b0
2a45  jr nc, jr_000_2a52
2a47  ld a, [$c023]
2a4a  cp $40
2a4c  jr nc, jr_000_2a5b
jr_000_2a4e:
2a4e  ld b, $80
2a50  jr jr_000_2a5b
jr_000_2a52:
2a52  ld a, [$c023]
2a55  cp $40
2a57  jr c, jr_000_2a5b
2a59  ld b, $40
jr_000_2a5b:
2a5b  ld a, b
2a5c  or c
2a5d  ld c, a
2a5e  ld a, $04
2a60  ldh [$ffb5], a
2a62  ret
2a63  ldh a, [$ff9c]
2a65  and $f0
2a67  ld c, a
2a68  ld a, [$c020]
2a6b  cp $02
2a6d  ret z
2a6e  xor a
2a6f  ldh [$ffb5], a
2a71  ret
2a72  ldh a, [$ffb6]
2a74  and a
2a75  jr z, jr_000_2a86
2a77  dec a
2a78  ldh [$ffb6], a
2a7a  ld b, $00
2a7c  jp nz, Jump_000_2b11
2a7f  ld a, $03
2a81  ldh [$ffb5], a
2a83  jp Jump_000_2b11
jr_000_2a86:
2a86  ld hl, $c023
2a89  ld a, [$c043]
2a8c  sub [hl]
2a8d  cp $0c
2a8f  jr nc, jr_000_2ab3
2a91  ld hl, $c024
2a94  call Call_000_1bef
2a97  add $0c
2a99  cp $10
2a9b  jr nc, jr_000_2ab3
2a9d  ld a, [$c047]
2aa0  cp $60
2aa2  jr nc, jr_000_2ab3
2aa4  ld a, [$c052]
2aa7  bit 7, a
2aa9  jr z, jr_000_2ab3
2aab  call Call_000_00a9
2aae  and $03
2ab0  inc a
2ab1  ldh [$ffb6], a
jr_000_2ab3:
2ab3  ld a, [$c043]
2ab6  cp $60
2ab8  jr c, jr_000_2ada
2aba  ld a, [$c052]
2abd  bit 7, a
2abf  jr z, jr_000_2ae3
2ac1  ld a, [$c025]
2ac4  sub $08
2ac6  ld b, a
2ac7  ld a, [$c045]
2aca  sub b
2acb  jr nc, jr_000_2acf
2acd  cpl
2ace  inc a
jr_000_2acf:
2acf  sla a
2ad1  add $38
2ad3  ld b, a
2ad4  ld a, [$c047]
2ad7  cp b
2ad8  jr nc, jr_000_2ae3
jr_000_2ada:
2ada  ld a, $02
2adc  ldh [$ffb5], a
2ade  ldh [$ffb9], a
2ae0  ld c, $00
2ae2  ret
jr_000_2ae3:
2ae3  ld a, [$c0b0]
2ae6  ld hl, $c043
2ae9  cp [hl]
2aea  jr c, jr_000_2b0f
2aec  ld b, $40
2aee  ld a, [$c043]
2af1  ld hl, $c023
2af4  sub [hl]
2af5  jr c, jr_000_2b11
2af7  cp $08
2af9  jr c, jr_000_2afb
jr_000_2afb:
2afb  ld b, $40
2afd  ld a, [$c043]
2b00  ld hl, $c023
2b03  sub [hl]
2b04  cp $18
2b06  jr nc, jr_000_2b0f
2b08  ld a, [$c047]
2b0b  bit 7, a
2b0d  jr nz, jr_000_2b11
jr_000_2b0f:
2b0f  ld b, $00
Jump_000_2b11:
jr_000_2b11:
2b11  push bc
2b12  call Call_000_08a6
2b15  call Call_000_1722
2b18  ld a, [$c025]
2b1b  sub h
2b1c  ld c, $20
2b1e  bit 7, a
2b20  jr z, jr_000_2b24
2b22  ld c, $10
jr_000_2b24:
2b24  cp $04
2b26  jr c, jr_000_2b2c
2b28  cp $0c
2b2a  jr nc, jr_000_2b2e
jr_000_2b2c:
2b2c  ld c, $00
jr_000_2b2e:
2b2e  ld a, c
2b2f  pop bc
2b30  or b
2b31  ld c, a
2b32  ret
Call_000_2b33:
2b33  ld a, [$c000]
2b36  rst RST_08
2b3b  ldh a, [$ff8a]
2b3d  cp $06
2b3f  ld hl, $2cce
2b42  jr z, jr_000_2bb9
2b44  cp $0a
2b46  jr nz, jr_000_2b55
2b48  ld hl, $2dec
2b4b  call Call_000_2cc1
2b4e  jr nz, jr_000_2bb9
2b50  ld hl, $2dfa
2b53  jr jr_000_2bb9
jr_000_2b55:
2b55  ldh a, [$ff8a]
2b57  cp $05
2b59  jr z, jr_000_2b9e
2b5b  ld a, [$c0e6]
2b5e  cp $01
2b60  jr nz, jr_000_2b6f
2b62  ld hl, $2e16
2b65  call Call_000_2cc1
2b68  jr nz, jr_000_2bb9
2b6a  ld hl, $2e08
2b6d  jr jr_000_2bb9
jr_000_2b6f:
2b6f  ldh a, [$ffba]
2b71  ld b, a
2b72  ldh a, [$ffbc]
2b74  xor b
2b75  and $02
2b77  jr z, jr_000_2b91
2b79  ld a, [$c0ea]
2b7c  and a
2b7d  jr nz, jr_000_2b84
2b7f  ld a, $01
2b81  ld [$c0ea], a
jr_000_2b84:
2b84  ld hl, $2dc8
2b87  call Call_000_2cc1
2b8a  jr z, jr_000_2bb9
2b8c  ld hl, $2dd6
2b8f  jr jr_000_2bb9
jr_000_2b91:
2b91  ld hl, $2de4
2b94  call Call_000_2cc1
2b97  jr nz, jr_000_2bb9
2b99  ld hl, $2de8
2b9c  jr jr_000_2bb9
jr_000_2b9e:
2b9e  ld a, [$c0df]
2ba1  ld hl, $2ce6
2ba4  cp $01
2ba6  jr z, jr_000_2bb9
2ba8  ld hl, $2cf9
2bab  cp $02
2bad  jr z, jr_000_2bb9
2baf  ld hl, $2d16
2bb2  cp $03
2bb4  jr z, jr_000_2bb9
2bb6  ld hl, $2d5b
jr_000_2bb9:
2bb9  call Call_000_2cb4
2bbc  ld a, $01
2bbe  ld [$c000], a
2bc1  ret
Jump_000_2bc2:
2bc2  ld a, [$c010]
2bc5  ld l, a
2bc6  ld a, [$c011]
2bc9  ld h, a
2bca  ld a, [hl+]
2bcb  push hl
2bcc  rst RST_08
2bdd  pop hl
2bde  ld a, [hl+]
2bdf  ld [$c005], a
2be2  ld a, [hl+]
2be3  ld [$c001], a
2be6  jp Jump_000_2cb4
2be9  pop hl
2bea  ld a, [$c012]
2bed  and a
2bee  jr z, jr_000_2c19
jr_000_2bf0:
2bf0  dec a
2bf1  jr z, jr_000_2c38
2bf3  ld [$c012], a
2bf6  and $03
2bf8  ret nz
2bf9  ld a, [$c005]
2bfc  ld b, a
2bfd  ld a, [$c014]
2c00  add b
2c01  ld [$c005], a
2c04  ld a, [$c012]
2c07  and $0f
2c09  ret nz
Call_000_2c0a:
jr_000_2c0a:
2c0a  ld a, [$c013]
2c0d  ld b, a
2c0e  ld a, [$c001]
2c11  ld [$c013], a
2c14  ld a, b
2c15  ld [$c001], a
2c18  ret
jr_000_2c19:
2c19  ld a, [hl+]
2c1a  ld [$c001], a
2c1d  push hl
2c1e  cp $0b
2c20  jr c, jr_000_2c29
2c22  cp $0e
2c24  ld a, $0f
2c26  call c, Call_000_3665
jr_000_2c29:
2c29  pop hl
2c2a  ld a, [hl+]
2c2b  ld [$c013], a
2c2e  ld a, [hl+]
2c2f  ld [$c014], a
2c32  ld a, [hl+]
2c33  ld [$c012], a
2c36  jr jr_000_2bf0
jr_000_2c38:
2c38  push hl
2c39  call Call_000_2c0a
2c3c  pop hl
2c3d  inc hl
2c3e  inc hl
2c3f  inc hl
2c40  inc hl
2c41  call Call_000_2cb4
2c44  jp Jump_000_2bc2
2c47  pop hl
2c48  ld a, [$c012]
2c4b  and a
2c4c  jr z, jr_000_2c6a
jr_000_2c4e:
2c4e  dec a
2c4f  jr z, jr_000_2c38
2c51  ld [$c012], a
2c54  and $03
2c56  ret nz
2c57  ld a, [$c005]
2c5a  ld b, a
2c5b  ld a, [$c014]
2c5e  add b
2c5f  ld [$c005], a
2c62  ld a, [$c012]
2c65  and $07
2c67  jr z, jr_000_2c0a
2c69  ret
jr_000_2c6a:
2c6a  ld a, [hl+]
2c6b  ld [$c001], a
2c6e  ld a, [hl+]
2c6f  ld [$c013], a
2c72  ld a, [hl+]
2c73  ld [$c014], a
2c76  ld a, [hl+]
2c77  ld [$c012], a
2c7a  jr jr_000_2c4e
2c7c  pop hl
2c7d  ret
2c7e  ld a, [$c012]
2c81  and a
2c82  jr nz, jr_000_2c88
2c84  ld hl, $c0df
2c87  inc [hl]
jr_000_2c88:
2c88  pop hl
2c89  ld a, [$c012]
2c8c  and a
2c8d  jr nz, jr_000_2ca0
2c8f  ld a, $1a
2c91  ld [$c012], a
2c94  call Call_000_3665
2c97  call Call_000_3670
2c9a  call Call_000_3670
2c9d  call Call_000_3670
jr_000_2ca0:
2ca0  ldh a, [$ff99]
2ca2  bit 3, a
2ca4  ret z
2ca5  ld a, $02
2ca7  ldh [$ff8a], a
2ca9  jp Jump_000_016d
2cac  pop hl
2cad  ld a, $01
2caf  ld [$c0df], a
2cb2  jr jr_000_2ca0
Call_000_2cb4:
Jump_000_2cb4:
2cb4  ld a, l
2cb5  ld [$c010], a
2cb8  ld a, h
2cb9  ld [$c011], a
2cbc  xor a
2cbd  ld [$c012], a
2cc0  ret
Call_000_2cc1:
2cc1  ldh a, [$ff96]
2cc3  bit 1, a
2cc5  ldh a, [$ffba]
2cc7  jr z, jr_000_2ccb
2cc9  xor $02
jr_000_2ccb:
2ccb  bit 1, a
2ccd  ret
Call_000_2e24:
2e24  ld hl, $c0eb
2e27  ld de, $9902
2e2a  ld b, $10
jr_000_2e2c:
2e2c  ld a, [hl+]
2e2d  ld [de], a
2e2e  inc de
2e2f  dec b
2e30  jr nz, jr_000_2e2c
2e32  ldh a, [$ff95]
2e34  cp $ff
2e36  ret z
2e37  ldh a, [$ff96]
2e39  and $03
2e3b  cp $03
2e3d  ldh a, [$ff95]
2e3f  jr z, jr_000_2e4b
2e41  rst RST_18
2e49  jr jr_000_2e53
jr_000_2e4b:
2e4b  rst RST_18
jr_000_2e53:
2e53  ld e, a
2e54  ld d, $98
2e56  ldh a, [$ffa0]
2e58  and a
2e59  ret nz
2e5a  ldh a, [$ff9f]
2e5c  cp $80
2e5e  ret nc
2e5f  and $08
2e61  ld a, $80
2e63  jr z, jr_000_2e71
2e65  ldh a, [$ff95]
2e67  ld c, a
2e68  ld b, $00
2e6a  ld hl, $c0e0
2e6d  add hl, bc
2e6e  ld a, [hl]
2e6f  or $d0
jr_000_2e71:
2e71  ld [de], a
2e72  ret
Call_000_2e73:
2e73  ldh a, [$ffa0]
2e75  and a
2e76  jr nz, jr_000_2ec7
2e78  ld a, [$c0ea]
2e7b  cp $03
2e7d  jr z, jr_000_2e97
2e7f  cp $04
2e81  jr z, jr_000_2e97
2e83  cp $06
2e85  jr z, jr_000_2e97
2e87  ldh a, [$ff9f]
2e89  cp $02
2e8b  jr nz, jr_000_2ec7
2e8d  ld a, $10
2e8f  call Call_000_3665
2e92  call Call_000_3670
2e95  jr jr_000_2ec7
jr_000_2e97:
2e97  ldh a, [$ff9f]
2e99  cp $02
2e9b  jr nz, jr_000_2eb1
2e9d  ldh a, [$ff95]
2e9f  bit 7, a
2ea1  jr nz, jr_000_2ec7
2ea3  cp $03
2ea5  ld a, $2d
2ea7  jr c, jr_000_2eab
2ea9  ld a, $2f
jr_000_2eab:
2eab  call Call_000_3665
2eae  call Call_000_3670
jr_000_2eb1:
2eb1  ldh a, [$ff9f]
2eb3  cp $14
2eb5  jr nz, jr_000_2ebf
2eb7  ld a, $10
2eb9  call Call_000_3665
2ebc  call Call_000_3670
jr_000_2ebf:
2ebf  ldh a, [$ff9f]
2ec1  cp $3c
2ec3  ld a, $00
2ec5  jr c, jr_000_2ed6
jr_000_2ec7:
2ec7  ldh a, [$ff9f]
2ec9  and $1f
2ecb  cp $12
2ecd  ld a, $00
2ecf  jr nc, jr_000_2ed4
2ed1  ld a, [$c0ea]
jr_000_2ed4:
2ed4  swap a
jr_000_2ed6:
2ed6  ld e, a
2ed7  ld d, $00
2ed9  ld hl, $2ee6
2edc  add hl, de
2edd  ld de, $c0eb
2ee0  ld bc, $0010
2ee3  jp Jump_000_303e
Call_000_2f56:
2f56  xor a
2f57  ldh [$ff8c], a
2f59  ldh [$ff8e], a
2f5b  ldh a, [rIE]
2f5d  set 0, a
2f5f  call Call_000_2f67
2f62  call Call_000_2f6f
2f65  ei
2f66  ret
Call_000_2f67:
2f67  ld b, a
2f68  xor a
2f69  ldh [rIF], a
2f6b  ld a, b
2f6c  ldh [rIE], a
2f6e  ret
Call_000_2f6f:
2f6f  ldh a, [$ffa6]
2f71  set 7, a
2f73  ldh [$ffa6], a
2f75  ldh [rLCDC], a
2f77  ret
Call_000_2f78:
jr_000_2f78:
2f78  ldh a, [rLY]
2f7a  cp $91
2f7c  jr nz, jr_000_2f78
2f7e  ldh a, [rLCDC]
2f80  res 7, a
2f82  ldh [rLCDC], a
2f84  ldh a, [$ffa6]
2f86  res 7, a
2f88  ldh [$ffa6], a
2f8a  ret
Call_000_2f8b:
2f8b  ldh a, [$ffa8]
2f8d  ldh [rSCX], a
2f8f  ldh a, [$ffaa]
2f91  ldh [rSCY], a
2f93  ldh a, [$ffab]
2f95  ldh [rWX], a
2f97  ldh a, [$ffac]
2f99  ldh [rWY], a
2f9b  ldh a, [$ffa6]
2f9d  ldh [rLCDC], a
2f9f  ret
Call_000_2fa0:
2fa0  ld a, $20
2fa2  ldh [rP1], a
2fa4  ldh a, [rP1]
2fa6  ldh a, [rP1]
2fa8  cpl
2fa9  and $0f
2fab  swap a
2fad  ld b, a
2fae  ld a, $10
2fb0  ldh [rP1], a
2fb2  ldh a, [rP1]
2fb4  ldh a, [rP1]
2fb6  ldh a, [rP1]
2fb8  ldh a, [rP1]
2fba  ldh a, [rP1]
2fbc  ldh a, [rP1]
2fbe  cpl
2fbf  and $0f
2fc1  or b
2fc2  ld c, a
2fc3  ld a, $30
2fc5  ldh [rP1], a
2fc7  ret
Call_000_2fc8:
2fc8  jp $ff80
Call_000_2fcb:
2fcb  ld de, $ff80
2fce  rst RST_28
2fda  ret
Call_000_2fdb:
Jump_000_2fdb:
2fdb  ld b, a
2fdc  ldh a, [$ff8d]
2fde  bit 7, a
2fe0  ret nz
2fe1  ld a, $01
2fe3  ldh [rSC], a
2fe5  ld a, b
2fe6  ldh [rSB], a
2fe8  ld a, $81
2fea  ldh [rSC], a
2fec  ret
Call_000_2fed:
Jump_000_2fed:
2fed  ld b, a
2fee  ldh a, [$ff8d]
2ff0  bit 7, a
2ff2  ret z
2ff3  di
2ff4  ld a, $00
2ff6  ldh [rSC], a
2ff8  ld a, b
2ff9  ldh [rSB], a
2ffb  ld a, $80
2ffd  ldh [rSC], a
2fff  ei
3000  ret
Call_000_3001:
3001  ld hl, $9800
3004  ld bc, $0800
jr_000_3007:
3007  ld a, $80
3009  ld [hl+], a
300a  dec bc
300b  ld a, b
300c  or c
300d  jr nz, jr_000_3007
300f  ret
Call_000_3010:
3010  xor a
Call_000_3011:
3011  ld l, a
3012  ld h, $de
3014  ld a, $a0
3016  sub l
3017  ret z
3018  srl a
301a  srl a
301c  ld b, a
301d  ld de, $0003
3020  xor a
jr_000_3021:
3021  ld [hl+], a
3022  add hl, de
3023  dec b
3024  jr nz, jr_000_3021
3026  ret
Call_000_3027:
3027  ld hl, $c000
302a  ld bc, $1f80
jr_000_302d:
302d  xor a
302e  ld [hl+], a
302f  dec bc
3030  ld a, b
3031  or c
3032  jr nz, jr_000_302d
3034  ld hl, $ff8a
3037  ld b, $74
jr_000_3039:
3039  ld [hl+], a
303a  dec b
303b  jr nz, jr_000_3039
303d  ret
Call_000_303e:
Jump_000_303e:
jr_000_303e:
303e  ld a, [hl+]
303f  ld [de], a
3040  inc de
3041  dec bc
3042  ld a, b
3043  or c
3044  jr nz, jr_000_303e
3046  ret
Call_000_3047:
3047  add a
3048  ld e, a
3049  ld d, $00
304b  add hl, de
304c  ld a, [hl+]
304d  ld h, [hl]
304e  ld l, a
304f  ret
Call_000_3050:
3050  ld a, b
3051  add $10
3053  ld b, a
3054  ld a, c
3055  add $08
3057  ld c, a
3058  jr jr_000_306a
Call_000_305a:
Jump_000_305a:
305a  ldh a, [$ffaa]
305c  ld e, a
305d  ld a, b
305e  sub e
305f  add $10
3061  ld b, a
3062  ldh a, [$ffa8]
3064  ld e, a
3065  ld a, c
3066  sub e
3067  add $08
3069  ld c, a
jr_000_306a:
306a  ld a, [$dea0]
306d  cp $a0
306f  ret z
3070  ld e, a
3071  ld d, $de
jr_000_3073:
3073  ld a, [hl+]
3074  cp $80
3076  jr z, jr_000_308a
3078  add b
3079  ld [de], a
307a  inc e
307b  ld a, [hl+]
307c  add c
307d  ld [de], a
307e  inc e
307f  ld a, [hl+]
3080  ld [de], a
3081  inc e
3082  ld a, [hl+]
3083  ld [de], a
3084  inc e
3085  ld a, e
3086  cp $a0
3088  jr nz, jr_000_3073
jr_000_308a:
308a  ld a, e
308b  ld [$dea0], a
308e  ret
Call_000_308f:
308f  ld d, $00
3091  ld hl, $0000
3094  rrca
3095  jr nc, jr_000_3098
3097  add hl, de
jr_000_3098:
3098  sla e
309a  rl d
309c  rrca
309d  jr nc, jr_000_30a0
309f  add hl, de
jr_000_30a0:
30a0  sla e
30a2  rl d
30a4  rrca
30a5  jr nc, jr_000_30a8
30a7  add hl, de
jr_000_30a8:
30a8  sla e
30aa  rl d
30ac  rrca
30ad  jr nc, jr_000_30b0
30af  add hl, de
jr_000_30b0:
30b0  sla e
30b2  rl d
30b4  rrca
30b5  jr nc, jr_000_30b8
30b7  add hl, de
jr_000_30b8:
30b8  sla e
30ba  rl d
30bc  rrca
30bd  jr nc, jr_000_30c0
30bf  add hl, de
jr_000_30c0:
30c0  sla e
30c2  rl d
30c4  rrca
30c5  jr nc, jr_000_30c8
30c7  add hl, de
jr_000_30c8:
30c8  sla e
30ca  rl d
30cc  rrca
30cd  ret nc
30ce  add hl, de
30cf  ret
Call_000_30d0:
30d0  push hl
30d1  pop de
30d2  ldh [$ffc7], a
30d4  xor a
30d5  ldh [$ffc8], a
30d7  ld c, a
30d8  ld h, a
30d9  ld l, a
30da  ldh a, [$ffc7]
30dc  ld b, $08
jr_000_30de:
30de  rrca
30df  jr nc, jr_000_30eb
30e1  add hl, de
30e2  ldh [$ffc7], a
30e4  ldh a, [$ffc8]
30e6  adc c
30e7  ldh [$ffc8], a
30e9  ldh a, [$ffc7]
jr_000_30eb:
30eb  sla e
30ed  rl d
30ef  rl c
30f1  dec b
30f2  jr nz, jr_000_30de
30f4  ldh a, [$ffc8]
30f6  ld c, a
30f7  ret
Call_000_30f8:
30f8  push hl
30f9  pop de
30fa  ldh [$ffd1], a
30fc  xor a
30fd  ldh [$ffd2], a
30ff  ld c, a
3100  ld h, a
3101  ld l, a
3102  ldh a, [$ffd1]
3104  ld b, $08
jr_000_3106:
3106  rrca
3107  jr nc, jr_000_3113
3109  add hl, de
310a  ldh [$ffd1], a
310c  ldh a, [$ffd2]
310e  adc c
310f  ldh [$ffd2], a
3111  ldh a, [$ffd1]
jr_000_3113:
3113  sla e
3115  rl d
3117  rl c
3119  dec b
311a  jr nz, jr_000_3106
311c  ldh a, [$ffd2]
311e  ld c, a
311f  ret
Call_000_3120:
3120  push hl
3121  push de
3122  ld a, d
3123  call Call_000_30d0
3126  ld a, l
3127  ldh [$ffc9], a
3129  ld a, h
312a  ldh [$ffca], a
312c  ld a, c
312d  ldh [$ffcb], a
312f  pop de
3130  pop hl
3131  ld a, e
3132  call Call_000_30d0
3135  ldh a, [$ffc9]
3137  add h
3138  ld h, a
3139  ldh a, [$ffca]
313b  adc c
313c  ld c, a
313d  ldh a, [$ffcb]
313f  adc $00
3141  ld b, a
3142  ret
Call_000_3143:
3143  ld c, a
3144  xor a
3145  add hl, hl
3146  rla
3147  jr c, jr_000_314c
3149  cp c
314a  jr c, jr_000_314e
jr_000_314c:
314c  sub c
314d  inc l
jr_000_314e:
314e  add hl, hl
314f  rla
3150  jr c, jr_000_3155
3152  cp c
3153  jr c, jr_000_3157
jr_000_3155:
3155  sub c
3156  inc l
jr_000_3157:
3157  add hl, hl
3158  rla
3159  jr c, jr_000_315e
315b  cp c
315c  jr c, jr_000_3160
jr_000_315e:
315e  sub c
315f  inc l
jr_000_3160:
3160  add hl, hl
3161  rla
3162  jr c, jr_000_3167
3164  cp c
3165  jr c, jr_000_3169
jr_000_3167:
3167  sub c
3168  inc l
jr_000_3169:
3169  add hl, hl
316a  rla
316b  jr c, jr_000_3170
316d  cp c
316e  jr c, jr_000_3172
jr_000_3170:
3170  sub c
3171  inc l
jr_000_3172:
3172  add hl, hl
3173  rla
3174  jr c, jr_000_3179
3176  cp c
3177  jr c, jr_000_317b
jr_000_3179:
3179  sub c
317a  inc l
jr_000_317b:
317b  add hl, hl
317c  rla
317d  jr c, jr_000_3182
317f  cp c
3180  jr c, jr_000_3184
jr_000_3182:
3182  sub c
3183  inc l
jr_000_3184:
3184  add hl, hl
3185  rla
3186  jr c, jr_000_318b
3188  cp c
3189  jr c, jr_000_318d
jr_000_318b:
318b  sub c
318c  inc l
jr_000_318d:
318d  add hl, hl
318e  rla
318f  jr c, jr_000_3194
3191  cp c
3192  jr c, jr_000_3196
jr_000_3194:
3194  sub c
3195  inc l
jr_000_3196:
3196  add hl, hl
3197  rla
3198  jr c, jr_000_319d
319a  cp c
319b  jr c, jr_000_319f
jr_000_319d:
319d  sub c
319e  inc l
jr_000_319f:
319f  add hl, hl
31a0  rla
31a1  jr c, jr_000_31a6
31a3  cp c
31a4  jr c, jr_000_31a8
jr_000_31a6:
31a6  sub c
31a7  inc l
jr_000_31a8:
31a8  add hl, hl
31a9  rla
31aa  jr c, jr_000_31af
31ac  cp c
31ad  jr c, jr_000_31b1
jr_000_31af:
31af  sub c
31b0  inc l
jr_000_31b1:
31b1  add hl, hl
31b2  rla
31b3  jr c, jr_000_31b8
31b5  cp c
31b6  jr c, jr_000_31ba
jr_000_31b8:
31b8  sub c
31b9  inc l
jr_000_31ba:
31ba  add hl, hl
31bb  rla
31bc  jr c, jr_000_31c1
31be  cp c
31bf  jr c, jr_000_31c3
jr_000_31c1:
31c1  sub c
31c2  inc l
jr_000_31c3:
31c3  add hl, hl
31c4  rla
31c5  jr c, jr_000_31ca
31c7  cp c
31c8  jr c, jr_000_31cc
jr_000_31ca:
31ca  sub c
31cb  inc l
jr_000_31cc:
31cc  add hl, hl
31cd  rla
31ce  jr c, jr_000_31d2
31d0  cp c
31d1  ret c
jr_000_31d2:
31d2  sub c
31d3  inc l
31d4  ret
Call_000_31d5:
31d5  xor a
31d6  ld c, a
31d7  ldh [$ffc7], a
31d9  ld b, $10
jr_000_31db:
31db  add hl, hl
31dc  rl c
31de  ldh a, [$ffc7]
31e0  rla
31e1  ldh [$ffc7], a
31e3  ld a, c
31e4  sub e
31e5  ldh [$ffc8], a
31e7  ldh a, [$ffc7]
31e9  sbc d
31ea  jr c, jr_000_31f2
31ec  ldh [$ffc7], a
31ee  ldh a, [$ffc8]
31f0  ld c, a
31f1  inc l
jr_000_31f2:
31f2  dec b
31f3  jr nz, jr_000_31db
31f5  ldh a, [$ffc7]
31f7  ld b, a
31f8  ret
Call_000_31f9:
31f9  ldh a, [$ffd3]
31fb  ld b, a
31fc  ldh a, [$ffd4]
31fe  ret
Call_000_31ff:
Jump_000_31ff:
31ff  ld hl, $ffa3
3202  ld a, [hl]
3203  cp $02
3205  jr nc, jr_000_3208
3207  inc [hl]
jr_000_3208:
3208  ld hl, $ff9f
320b  ld a, [hl]
320c  add $01
320e  ld [hl+], a
320f  ld a, [hl]
3210  adc $00
3212  ld [hl], a
3213  ret
Jump_000_3214:
3214  ldh a, [$ffc2]
3216  bit 6, a
3218  ret nz
3219  ld b, $80
321b  ldh a, [$ffaa]
321d  ld h, a
321e  bit 6, c
3220  jr z, jr_000_322f
3222  ld a, h
3223  cp $10
3225  jr z, jr_000_322f
3227  ldh a, [$ffa9]
3229  sub b
322a  ldh [$ffa9], a
322c  jr nc, jr_000_322f
322e  dec h
jr_000_322f:
322f  bit 7, c
3231  jr z, jr_000_3240
3233  ld a, h
3234  cp $6f
3236  jr z, jr_000_3240
3238  ldh a, [$ffa9]
323a  add b
323b  ldh [$ffa9], a
323d  jr nc, jr_000_3240
323f  inc h
jr_000_3240:
3240  ld a, h
3241  ldh [$ffaa], a
3243  ldh a, [$ffa8]
3245  ld h, a
3246  bit 5, c
3248  jr z, jr_000_3256
324a  ld a, h
324b  and a
324c  jr z, jr_000_3256
324e  ldh a, [$ffa7]
3250  sub b
3251  ldh [$ffa7], a
3253  jr nc, jr_000_3256
3255  dec h
jr_000_3256:
3256  bit 4, c
3258  jr z, jr_000_3267
325a  ld a, h
325b  cp $5f
325d  jr z, jr_000_3267
325f  ldh a, [$ffa7]
3261  add b
3262  ldh [$ffa7], a
3264  jr nc, jr_000_3267
3266  inc h
jr_000_3267:
3267  ld a, h
3268  ldh [$ffa8], a
326a  ret
Call_000_326b:
jr_000_326b:
326b  ld a, [hl+]
326c  cp $f9
326e  jr z, jr_000_3279
3270  ld [de], a
3271  ld a, e
3272  add c
3273  ld e, a
3274  jr nc, jr_000_326b
3276  inc d
3277  jr jr_000_326b
jr_000_3279:
3279  ld a, [hl+]
327a  cp $02
327c  jr z, jr_000_3287
327e  and a
327f  ret z
3280  ld c, a
3281  ld a, [hl+]
3282  ld e, a
3283  ld a, [hl+]
3284  ld d, a
3285  jr jr_000_326b
jr_000_3287:
3287  ld a, [hl+]
3288  ld b, a
jr_000_3289:
3289  ld a, [hl]
328a  ld [de], a
328b  ld a, e
328c  add c
328d  ld e, a
328e  jr nc, jr_000_3291
3290  inc d
jr_000_3291:
3291  dec b
3292  jr nz, jr_000_3289
3294  inc hl
3295  jr jr_000_326b
Call_000_3297:
3297  ld hl, $c0db
329a  ld a, $01
329c  ld [hl+], a
329d  ld [hl+], a
329e  ld [hl+], a
329f  ld [hl+], a
32a0  ld [$c0e6], a
32a3  inc hl
32a4  xor a
32a5  ld [hl+], a
32a6  ld [hl+], a
32a7  ld [hl+], a
32a8  ld [hl+], a
32a9  ld [hl+], a
32aa  ld [hl+], a
32ab  ldh a, [$ffaf]
32ad  bit 7, a
32af  ret z
32b0  and $01
32b2  ld [$c0dc], a
32b5  ld [$c0e6], a
32b8  ret
Call_000_32b9:
32b9  ld a, [$c040]
32bc  sub $02
32be  ret c
32bf  cp $03
32c1  ret nc
32c2  ld hl, $ffc2
32c5  res 6, [hl]
32c7  ret
Call_000_32c8:
32c8  ld b, $c1
32ca  ld hl, $c0dd
32cd  ld a, [$c0de]
32d0  cp [hl]
32d1  jr nz, jr_000_32d9
32d3  cp $01
32d5  jr nz, jr_000_32d9
32d7  ld b, $00
jr_000_32d9:
32d9  ld a, b
32da  ldh [$ffc2], a
32dc  ret
Call_000_32dd:
32dd  ld hl, $de00
32e0  ld [hl+], a
32e1  ld a, b
32e2  ld [hl+], a
32e3  ld a, $f9
32e5  ld [hl+], a
32e6  xor a
32e7  ld [hl], a
32e8  ld a, $04
32ea  ld [$dea0], a
32ed  ret
Call_000_32ee:
32ee  ld bc, $0000
32f1  ldh a, [$ffc2]
32f3  bit 6, a
32f5  jr z, jr_000_330c
32f7  call Call_000_35e7
32fa  ld a, $7c
32fc  jr nz, jr_000_3300
32fe  ld a, $7d
jr_000_3300:
3300  ldh [$ffab], a
3302  ld b, $60
3304  ldh a, [$ff91]
3306  bit 1, a
3308  jr z, jr_000_330c
330a  ld c, $68
jr_000_330c:
330c  ldh a, [$ffa6]
330e  and $9f
3310  or b
3311  ldh [$ffa6], a
3313  ld a, c
3314  ldh [$ffac], a
3316  ldh a, [$ffc2]
3318  bit 7, a
331a  ret z
331b  ldh a, [$ff91]
331d  ldh [$ffc3], a
331f  ldh a, [$ffc2]
3321  res 7, a
3323  ldh [$ffc2], a
3325  and $0f
3327  rst RST_08
3336  ld de, $c0c0
3339  rst RST_28
3355  ldh a, [$ff96]
3357  bit 3, a
3359  ld a, $d3
335b  jr z, jr_000_335f
335d  ld a, $d1
jr_000_335f:
335f  ld [$c0c1], a
3362  ld a, [$c0df]
3365  or $d0
3367  ld [$c0d7], a
336a  ret
336b  ld a, [$c0dd]
336e  cp $05
3370  jr nz, jr_000_3392
3372  ld de, $c0c0
3375  rst RST_28
3391  ret
jr_000_3392:
3392  ld de, $c0c0
3395  rst RST_28
33b1  ld a, $dc
33b3  ld [$c0c7], a
33b6  ld a, $e9
33b8  ld [$c0d1], a
33bb  ldh a, [$ff90]
33bd  cp $04
33bf  ret nc
33c0  ld a, [$c0dd]
33c3  add a
33c4  ld c, a
33c5  ld b, $00
33c7  ld hl, $33e7
33ca  add hl, bc
33cb  ld a, [hl+]
33cc  ld [$c0d3], a
33cf  ld a, [hl]
33d0  ld [$c0d4], a
33d3  ld a, [$c0de]
33d6  add a
33d7  ld c, a
33d8  ld b, $00
33da  ld hl, $33e7
33dd  add hl, bc
33de  ld a, [hl+]
33df  ld [$c0c9], a
33e2  ld a, [hl]
33e3  ld [$c0ca], a
33e6  ret
3403  ld de, $c0c0
3406  rst RST_28
3422  ld a, [$c0db]
3425  or $d0
3427  ld [$c0cd], a
342a  ld a, [$c0e6]
342d  cp $0d
342f  jr nc, jr_000_3444
3431  call Call_000_00b6
3434  ld a, b
3435  and a
3436  jr z, jr_000_343d
3438  or $d0
343a  ld [$c0d6], a
jr_000_343d:
343d  ld a, c
343e  or $d0
3440  ld [$c0d7], a
3443  ret
jr_000_3444:
3444  ld de, $c0cb
3447  rst RST_28
3453  ret
3454  ld de, $c0c0
3457  rst RST_28
3473  call Call_000_31f9
3476  ld [$c0d5], a
3479  ld a, b
347a  ld [$c0d0], a
347d  ldh a, [$ff96]
347f  and $03
3481  cp $03
3483  ld hl, $c0d2
3486  jr nz, jr_000_348b
3488  ld hl, $c0d7
jr_000_348b:
348b  ld a, [$c0e0]
348e  or $d0
3490  ld [hl+], a
3491  ld a, [$c0e1]
3494  or $d0
3496  ld [hl+], a
3497  ld a, [$c0e2]
349a  or $d0
349c  ld [hl], a
349d  ldh a, [$ff96]
349f  and $03
34a1  cp $03
34a3  ld hl, $c0d7
34a6  jr nz, jr_000_34ab
34a8  ld hl, $c0d2
jr_000_34ab:
34ab  ld a, [$c0e3]
34ae  or $d0
34b0  ld [hl+], a
34b1  ld a, [$c0e4]
34b4  or $d0
34b6  ld [hl+], a
34b7  ld a, [$c0e5]
34ba  or $d0
34bc  ld [hl], a
34bd  ret
34be  ld de, $c0c0
34c1  rst RST_28
34dd  ld a, $26
34df  jp Jump_000_3665
34e2  ld de, $c0c0
34e5  rst RST_28
3501  ld a, $28
3503  jp Jump_000_3665
3506  ld de, $c0c0
3509  rst RST_28
3525  ld a, $27
3527  jp Jump_000_3665
Call_000_352a:
352a  ld a, [$c0c0]
352d  and a
352e  ret z
352f  ld hl, $c0c1
3532  ld de, $9c00
3535  ld c, $05
jr_000_3537:
3537  ld a, [hl+]
3538  ld [de], a
3539  inc e
353a  ld a, [hl+]
353b  ld [de], a
353c  inc e
353d  ld a, [hl+]
353e  ld [de], a
353f  inc e
3540  ld a, [hl+]
3541  ld [de], a
3542  inc e
3543  ld a, [hl+]
3544  ld [de], a
3545  ld a, e
3546  add $1c
3548  ld e, a
3549  dec c
354a  jr nz, jr_000_3537
354c  xor a
354d  ld [$c0c0], a
3550  ret
Call_000_3551:
3551  ld hl, $de14
3554  ldh a, [$ffc2]
3556  bit 6, a
3558  jr z, jr_000_35ad
355a  ldh a, [$ff91]
355c  bit 1, a
355e  ld c, $0a
3560  jr z, jr_000_3564
3562  ld c, $76
jr_000_3564:
3564  ld d, c
3565  ld a, c
3566  ld [hl+], a
3567  add $08
3569  ld c, a
356a  call Call_000_35e7
356d  ld a, $7b
356f  jr nz, jr_000_3573
3571  ld a, $7c
jr_000_3573:
3573  ld [hl+], a
3574  ld a, $99
3576  ld b, $06
3578  jr jr_000_358b
jr_000_357a:
357a  ld a, c
357b  ld [hl+], a
357c  add $08
357e  ld c, a
357f  call Call_000_35e7
3582  ld a, $75
3584  jr nz, jr_000_3588
3586  ld a, $76
jr_000_3588:
3588  ld [hl+], a
3589  ld a, $97
jr_000_358b:
358b  ld [hl+], a
358c  xor a
358d  ld [hl+], a
358e  dec b
358f  jr nz, jr_000_357a
3591  call Call_000_35e7
3594  ld c, $83
3596  jr nz, jr_000_359a
3598  ld c, $84
jr_000_359a:
359a  ld b, $05
jr_000_359c:
359c  ld a, d
359d  ld [hl+], a
359e  ld a, c
359f  ld [hl+], a
35a0  add $08
35a2  ld c, a
35a3  ld a, $98
35a5  ld [hl+], a
35a6  xor a
35a7  ld [hl+], a
35a8  dec b
35a9  jr nz, jr_000_359c
35ab  jr jr_000_35b4
jr_000_35ad:
35ad  ld b, $2c
35af  xor a
jr_000_35b0:
35b0  ld [hl+], a
35b1  dec b
35b2  jr nz, jr_000_35b0
jr_000_35b4:
35b4  ld bc, $0000
35b7  ld a, [$c043]
35ba  cp $68
35bc  jr c, jr_000_35c6
35be  ld c, $04
35c0  cp $88
35c2  jr c, jr_000_35c6
35c4  ld c, $08
jr_000_35c6:
35c6  ld de, $ffbd
35c9  ldh a, [$ffba]
35cb  bit 1, a
35cd  jr z, jr_000_35d6
35cf  ld a, $63
35d1  ld hl, $35ee
35d4  jr jr_000_35db
jr_000_35d6:
35d6  ld a, $76
35d8  ld hl, $35fa
jr_000_35db:
35db  ld [de], a
35dc  inc e
35dd  add hl, bc
35de  ld b, $04
jr_000_35e0:
35e0  ld a, [hl+]
35e1  ld [de], a
35e2  inc e
35e3  dec b
35e4  jr nz, jr_000_35e0
35e6  ret
Call_000_35e7:
35e7  ldh a, [$ffa8]
35e9  and $03
35eb  cp $03
35ed  ret
Call_000_3606:
3606  ld hl, $ffbd
3609  ld a, [hl+]
360a  ld e, a
360b  ld d, $99
360d  ld a, [hl+]
360e  ld [de], a
360f  inc e
3610  ld a, [hl+]
3611  ld [de], a
3612  ld a, $1f
3614  add e
3615  ld e, a
3616  ld a, [hl+]
3617  ld [de], a
3618  inc e
3619  ld a, [hl+]
361a  ld [de], a
361b  ret
Call_000_361c:
361c  ld a, $80
361e  ldh [rNR52], a
3620  xor a
3621  ldh [rNR51], a
3623  ld [$dd85], a
3626  ld a, $77
3628  ldh [rNR50], a
362a  ld hl, $dd00
362d  ld de, $0016
3630  ld b, $06
3632  ld a, $ff
jr_000_3634:
3634  ld [hl], a
3635  add hl, de
3636  dec b
3637  jr nz, jr_000_3634
3639  ld hl, $dd14
363c  ld de, $0016
363f  ld b, $06
jr_000_3641:
3641  ld [hl], a
3642  add hl, de
3643  dec b
3644  jr nz, jr_000_3641
3646  ld de, $ff30
3649  ld hl, $3655
364c  ld b, $10
jr_000_364e:
364e  ld a, [hl+]
364f  ld [de], a
3650  inc e
3651  dec b
3652  jr nz, jr_000_364e
3654  ret
Call_000_3665:
Jump_000_3665:
3665  ld l, a
3666  ld h, $00
3668  add hl, hl
3669  add hl, hl
366a  ld de, $3d29
366d  add hl, de
366e  push hl
366f  pop de
Call_000_3670:
3670  ld a, [de]
3671  inc de
3672  ld c, a
3673  ld b, $00
3675  ld hl, $dd00
3678  add hl, bc
3679  ld a, [hl]
367a  cp $ff
367c  jr z, jr_000_3692
367e  inc hl
367f  ld a, [hl-]
3680  and $03
3682  inc a
3683  ld b, a
3684  ld a, $77
jr_000_3686:
3686  rlca
3687  dec b
3688  jr nz, jr_000_3686
368a  ld b, a
368b  ld a, [$dd85]
368e  and b
368f  ld [$dd85], a
jr_000_3692:
3692  xor a
3693  ld [hl+], a
3694  ld a, [de]
3695  inc de
3696  ld [hl+], a
3697  ld a, [de]
3698  inc de
3699  ld [hl+], a
369a  ld a, [de]
369b  inc de
369c  ld [hl], a
369d  ret
Call_000_369e:
369e  ldh a, [$ffaf]
36a0  bit 7, a
36a2  ret nz
36a3  xor a
36a4  ld [$dd84], a
36a7  ld [$dd8b], a
36aa  ld hl, $dd8a
36ad  inc [hl]
36ae  ld hl, $dd00
Jump_000_36b1:
36b1  push hl
36b2  ld de, $ffd5
36b5  ld b, $16
jr_000_36b7:
36b7  ld a, [hl+]
36b8  ld [de], a
36b9  inc e
36ba  dec b
36bb  jr nz, jr_000_36b7
36bd  ldh a, [$ffd6]
36bf  and $03
36c1  ld [$dd86], a
36c4  ld b, a
36c5  add a
36c6  add a
36c7  add b
36c8  ld [$dd89], a
36cb  inc b
36cc  ld a, $88
jr_000_36ce:
36ce  rlca
36cf  dec b
36d0  jr nz, jr_000_36ce
36d2  ld [$dd87], a
36d5  ld [$dd88], a
36d8  ldh a, [$ffe9]
36da  and a
36db  jr z, jr_000_372a
36dd  ldh a, [$ffd5]
36df  and a
36e0  jr z, jr_000_3741
36e2  cp $ff
36e4  jr z, jr_000_372a
36e6  call Call_000_3a0c
36e9  call Call_000_398f
36ec  ldh a, [$ffe1]
36ee  ld b, a
36ef  ldh a, [$ffe2]
36f1  inc a
36f2  cp b
36f3  jr c, jr_000_36f6
36f5  ld a, b
jr_000_36f6:
36f6  ldh [$ffe2], a
36f8  ld hl, $ffda
36fb  dec [hl]
36fc  ld a, [hl]
36fd  bit 7, a
36ff  jr z, jr_000_3712
3701  ldh a, [$ffd9]
3703  and $0f
3705  ld [hl], a
3706  call Call_000_39cc
3709  ld hl, $ffdc
370c  dec [hl]
370d  jr nz, jr_000_3712
jr_000_370f:
370f  call Call_000_3785
jr_000_3712:
3712  ld a, [$dd87]
3715  ld b, a
3716  ld a, [$dd84]
3719  or b
371a  ld [$dd84], a
371d  pop hl
371e  push hl
371f  ld de, $ffd5
3722  ld b, $16
jr_000_3724:
3724  ld a, [de]
3725  ld [hl+], a
3726  inc e
3727  dec b
3728  jr nz, jr_000_3724
jr_000_372a:
372a  pop hl
372b  ld de, $0016
372e  add hl, de
372f  ld a, [$dd8b]
3732  inc a
3733  ld [$dd8b], a
3736  cp $06
3738  jp c, Jump_000_36b1
373b  ld a, [$dd85]
373e  ldh [rNR51], a
3740  ret
jr_000_3741:
3741  ldh a, [$ffd7]
3743  ld l, a
3744  ldh a, [$ffd8]
3746  ld h, a
3747  ld a, [hl+]
3748  and $0f
374a  ldh [$ffda], a
374c  ld d, a
374d  ld a, [$dd86]
3750  cp $02
3752  jr z, jr_000_377d
3754  ld a, [hl+]
3755  rrca
3756  rrca
3757  and $c0
3759  or d
jr_000_375a:
375a  ldh [$ffd9], a
375c  ld a, [hl+]
375d  swap a
375f  ldh [$ffdb], a
3761  ld a, [$dd86]
3764  cp $02
3766  jr z, jr_000_376b
3768  ld a, [hl+]
3769  ldh [$ffdd], a
jr_000_376b:
376b  xor a
376c  ldh [$ffde], a
376e  ldh [$ffdf], a
3770  ldh [$ffe0], a
3772  ldh [$ffe3], a
3774  dec a
3775  ldh [$ffea], a
3777  ld a, $02
3779  ldh [$ffd5], a
377b  jr jr_000_370f
jr_000_377d:
377d  ld a, [hl+]
377e  cpl
377f  inc a
3780  ldh [$ffdd], a
3782  ld a, d
3783  jr jr_000_375a
Call_000_3785:
Jump_000_3785:
3785  ldh a, [$ffd5]
3787  ld l, a
3788  ld h, $00
378a  add hl, hl
378b  ldh a, [$ffd7]
378d  ld e, a
378e  ldh a, [$ffd8]
3790  ld d, a
3791  add hl, de
Jump_000_3792:
jr_000_3792:
3792  ldh a, [$ffd5]
3794  inc a
3795  ldh [$ffd5], a
3797  ld a, [hl+]
3798  cp $d0
379a  jr nc, jr_000_37bd
379c  cp $b0
379e  jr nc, jr_000_37fb
37a0  cp $a0
37a2  jp nc, Jump_000_3831
37a5  jp Jump_000_38c0
jr_000_37a8:
37a8  cp $fd
37aa  jr nz, jr_000_37b3
37ac  ldh a, [$ffd5]
37ae  ldh [$ffe8], a
jr_000_37b0:
37b0  inc hl
37b1  jr jr_000_3792
jr_000_37b3:
37b3  cp $ff
37b5  jr nz, jr_000_37b0
37b7  ldh [$ffd5], a
37b9  call Call_000_3a35
37bc  ret
jr_000_37bd:
37bd  cp $f0
37bf  jr nc, jr_000_37a8
37c1  cp $e0
37c3  jr nc, jr_000_37c9
37c5  and $0f
37c7  jr jr_000_37cd
jr_000_37c9:
37c9  and $0f
37cb  cpl
37cc  inc a
jr_000_37cd:
37cd  ld b, a
37ce  ld a, [$dd86]
37d1  cp $02
37d3  jr z, jr_000_37dd
37d5  ld a, b
37d6  ldh [$ffe3], a
37d8  ld a, [hl]
37d9  ldh [$ffe4], a
37db  ldh [$ffe5], a
jr_000_37dd:
37dd  inc hl
37de  jr jr_000_3792
jr_000_37e0:
37e0  and $0f
37e2  ld b, a
37e3  ld a, [$dd86]
37e6  cp $02
37e8  jr z, jr_000_37f8
37ea  ldh a, [$ffdb]
37ec  and $0f
37ee  jr nz, jr_000_37f8
37f0  ld a, [hl]
37f1  ldh [$ffe1], a
37f3  ld a, b
37f4  swap a
37f6  ldh [$ffe0], a
jr_000_37f8:
37f8  inc hl
37f9  jr jr_000_3792
jr_000_37fb:
37fb  cp $c0
37fd  jr nc, jr_000_37e0
37ff  and $0f
3801  jr z, jr_000_3826
3803  ld e, a
3804  ld a, [hl]
3805  and a
3806  jr nz, jr_000_3818
3808  ldh a, [$ffde]
380a  dec a
380b  ldh [$ffde], a
380d  jr z, jr_000_382e
380f  bit 7, a
3811  jr z, jr_000_3826
3813  ld a, e
3814  ldh [$ffde], a
3816  jr jr_000_3826
jr_000_3818:
3818  ldh a, [$ffdf]
381a  dec a
381b  ldh [$ffdf], a
381d  jr z, jr_000_382e
381f  bit 7, a
3821  jr z, jr_000_3826
3823  ld a, e
3824  ldh [$ffdf], a
jr_000_3826:
3826  ld a, [hl]
3827  and a
3828  jr nz, jr_000_382c
382a  ldh a, [$ffe8]
jr_000_382c:
382c  ldh [$ffd5], a
jr_000_382e:
382e  jp Jump_000_3785
Jump_000_3831:
3831  cp $a0
3833  jr nz, jr_000_383d
3835  ld a, [hl+]
3836  swap a
3838  ldh [$ffdb], a
383a  jp Jump_000_3792
jr_000_383d:
383d  cp $a1
383f  jr nz, jr_000_3847
3841  ld a, [hl+]
3842  ldh [$ffdd], a
3844  jp Jump_000_3792
jr_000_3847:
3847  cp $a2
3849  jr nz, jr_000_386a
384b  ld a, [$dd86]
384e  cp $02
3850  jr z, jr_000_3862
3852  ld a, [hl+]
3853  rrca
3854  rrca
3855  and $c0
3857  ld d, a
3858  ldh a, [$ffd9]
385a  and $3f
385c  or d
385d  ldh [$ffd9], a
385f  jp Jump_000_3792
jr_000_3862:
3862  ld a, [hl+]
3863  cpl
3864  inc a
3865  ldh [$ffdd], a
3867  jp Jump_000_3792
jr_000_386a:
386a  cp $a3
386c  jr nz, jr_000_3888
386e  ld a, [hl+]
386f  bit 7, a
3871  jr nz, jr_000_3882
3873  and $70
3875  ld e, a
3876  ldh a, [$ffd6]
3878  and $0f
387a  or e
387b  or $80
jr_000_387d:
387d  ldh [$ffd6], a
387f  jp Jump_000_3792
jr_000_3882:
3882  ldh a, [$ffd6]
3884  and $0f
3886  jr jr_000_387d
jr_000_3888:
3888  cp $a5
388a  jr nz, jr_000_389a
388c  ld a, [hl+]
388d  cp $01
388f  jr nz, jr_000_3895
3891  ldh a, [$ffea]
3893  swap a
jr_000_3895:
3895  ldh [$ffea], a
3897  jp Jump_000_3792
jr_000_389a:
389a  cp $a6
389c  jr nz, jr_000_38a4
389e  ld a, [hl+]
389f  ldh [rNR50], a
38a1  jp Jump_000_3792
jr_000_38a4:
38a4  cp $af
38a6  jr nz, jr_000_38b8
38a8  ld a, [hl+]
38a9  and $0f
38ab  ldh [$ffda], a
38ad  ld b, a
38ae  ldh a, [$ffd9]
38b0  and $f0
38b2  or b
38b3  ldh [$ffd9], a
38b5  jp Jump_000_3792
jr_000_38b8:
38b8  inc hl
38b9  jp Jump_000_3792
jr_000_38bc:
38bc  call Call_000_3a35
38bf  ret
Jump_000_38c0:
38c0  ld b, a
38c1  ld a, [hl]
38c2  ldh [$ffdc], a
38c4  ld a, [$dd86]
38c7  cp $03
38c9  jr nz, jr_000_38e5
38cb  ld a, b
38cc  ld l, $44
38ce  cp $80
38d0  jr z, jr_000_38e1
38d2  cp $10
38d4  jr nc, jr_000_38bc
38d6  bit 3, a
38d8  jr z, jr_000_38de
38da  and $07
38dc  add $50
jr_000_38de:
38de  add $10
38e0  ld l, a
jr_000_38e1:
38e1  ld h, $00
38e3  jr jr_000_38f8
jr_000_38e5:
38e5  ld a, b
38e6  and $0f
38e8  cp $0c
38ea  jr nc, jr_000_38bc
38ec  ld a, b
38ed  add a
38ee  ld e, a
38ef  ld d, $00
38f1  ld hl, $3a59
38f4  add hl, de
38f5  ld a, [hl+]
38f6  ld h, [hl]
38f7  ld l, a
jr_000_38f8:
38f8  xor a
38f9  ldh [$ffe2], a
38fb  call Call_000_3a45
38fe  ld a, [$dd86]
3901  cp $02
3903  jr nz, jr_000_390c
3905  xor a
3906  ldh [rNR30], a
3908  ld a, $80
390a  ldh [rNR30], a
jr_000_390c:
390c  push hl
390d  call Call_000_3974
3910  pop hl
3911  ld a, [$dd86]
3914  and a
3915  jr nz, jr_000_391e
3917  ldh a, [$ffdd]
3919  ld c, $10
391b  call z, Call_000_3a50
jr_000_391e:
391e  ld a, l
391f  ld c, $13
3921  call Call_000_3a50
3924  ld a, l
3925  cp $02
3927  jr c, jr_000_3931
3929  cp $fe
392b  jr c, jr_000_3933
392d  ld a, $fd
392f  jr jr_000_3933
jr_000_3931:
3931  ld a, $02
jr_000_3933:
3933  ldh [$ffe6], a
3935  ld a, [$dd86]
3938  cp $02
393a  jr z, jr_000_3969
393c  cp $02
393e  jr nc, jr_000_3949
3940  ldh a, [$ffd9]
3942  and $c0
3944  ld c, $11
3946  call Call_000_3a50
jr_000_3949:
3949  ld a, h
394a  and $07
394c  or $80
jr_000_394e:
394e  ldh [$ffe7], a
3950  ld c, $14
3952  call Call_000_3a50
3955  ld a, [$dd88]
3958  ld b, a
3959  xor $ff
395b  ld c, a
395c  ldh a, [$ffea]
395e  and b
395f  ld b, a
3960  ld a, [$dd85]
3963  and c
3964  or b
3965  ld [$dd85], a
3968  ret
jr_000_3969:
3969  ldh a, [$ffdd]
396b  ldh [rNR31], a
396d  ld a, h
396e  and $07
3970  or $c0
3972  jr jr_000_394e
Call_000_3974:
3974  ld a, [$dd86]
3977  cp $02
3979  jr z, jr_000_3980
397b  ldh a, [$ffe0]
397d  and a
397e  jr nz, jr_000_399c
jr_000_3980:
3980  ldh a, [$ffdb]
Jump_000_3982:
jr_000_3982:
3982  ld c, $12
3984  call Call_000_3a50
3987  ldh a, [$ffe7]
3989  ld c, $14
398b  call Call_000_3a50
398e  ret
Call_000_398f:
398f  ldh a, [$ffe0]
3991  and a
3992  ret z
3993  ld a, [$dd86]
3996  cp $02
3998  ret z
3999  call Call_000_3a45
jr_000_399c:
399c  ld e, $00
399e  ldh a, [$ffe1]
39a0  ld c, a
39a1  ldh a, [$ffe2]
39a3  ld b, $04
jr_000_39a5:
39a5  sla a
39a7  cp c
39a8  jr c, jr_000_39ab
39aa  sub c
jr_000_39ab:
39ab  ccf
39ac  rl e
39ae  dec b
39af  jr nz, jr_000_39a5
39b1  ldh a, [$ffe0]
39b3  or e
39b4  ld e, a
39b5  ld d, $00
39b7  ld hl, $3b89
39ba  add hl, de
39bb  ld a, [hl]
39bc  ld b, a
39bd  ldh a, [$ffdb]
39bf  swap a
39c1  and $0f
39c3  or b
39c4  ld e, a
39c5  ld hl, $3c29
39c8  add hl, de
39c9  ld a, [hl]
39ca  jr jr_000_3982
Call_000_39cc:
39cc  ld a, [$dd86]
39cf  cp $02
39d1  ret z
39d2  ldh a, [$ffe3]
39d4  and a
39d5  ret z
39d6  ld hl, $ffe5
39d9  dec [hl]
39da  ret nz
39db  ldh a, [$ffdb]
39dd  swap a
39df  cp $10
39e1  ret nc
39e2  and $0f
39e4  ld b, a
39e5  ldh a, [$ffe4]
39e7  ldh [$ffe5], a
39e9  ld hl, $ffe3
39ec  ld a, [hl]
39ed  bit 7, a
39ef  jr nz, jr_000_39ff
39f1  dec [hl]
39f2  ld a, b
39f3  cp $0f
39f5  ret z
39f6  ldh a, [$ffdb]
39f8  add $10
39fa  ldh [$ffdb], a
39fc  jp Jump_000_3982
jr_000_39ff:
39ff  inc [hl]
3a00  ld a, b
3a01  and a
3a02  ret z
3a03  ldh a, [$ffdb]
3a05  sub $10
3a07  ldh [$ffdb], a
3a09  jp Jump_000_3982
Call_000_3a0c:
3a0c  call Call_000_3a45
3a0f  ld a, [$dd86]
3a12  cp $03
3a14  ret z
3a15  ldh a, [$ffd6]
3a17  bit 7, a
3a19  ret z
3a1a  and $70
3a1c  ld b, a
3a1d  ld a, [$dd8a]
3a20  and $0f
3a22  or b
3a23  ld e, a
3a24  ld d, $00
3a26  ld hl, $3b19
3a29  add hl, de
3a2a  ld a, [hl]
3a2b  ld b, a
3a2c  ldh a, [$ffe6]
3a2e  add b
3a2f  ld c, $13
3a31  call Call_000_3a50
3a34  ret
Call_000_3a35:
3a35  call Call_000_3a45
3a38  ld a, [$dd87]
3a3b  cpl
3a3c  ld b, a
3a3d  ld a, [$dd85]
3a40  and b
3a41  ld [$dd85], a
3a44  ret
Call_000_3a45:
3a45  ld a, [$dd87]
3a48  ld b, a
3a49  ld a, [$dd84]
3a4c  and b
3a4d  ret z
3a4e  pop af
3a4f  ret
Call_000_3a50:
3a50  ld b, a
3a51  ld a, [$dd89]
3a54  add c
3a55  ld c, a
3a56  ld a, b
3a57  ldh [c], a
3a58  ret
Call_000_486f:
486f  ld a, [$c000]
4872  and $03
4874  ret z
4875  ld hl, $c002
4878  call Call_000_095d
487b  ld a, [$c001]
487e  ld hl, $4887
4881  call Call_000_3047
4884  jp Jump_000_0063
Call_000_4a90:
4a90  ld a, [$c020]
4a93  and $03
4a95  ret z
4a96  ld hl, $c022
4a99  call Call_000_095d
4a9c  ld a, [$c021]
4a9f  ld hl, $4aa8
4aa2  call Call_000_3047
4aa5  jp Jump_000_0063
Call_000_4cb1:
4cb1  ld b, $88
4cb3  ld a, [$c005]
4cb6  ld c, a
4cb7  ld a, [$c001]
4cba  ld hl, $4cc3
4cbd  call Call_000_3047
4cc0  jp Jump_000_305a
Call_000_500d:
500d  ld b, $88
500f  ld a, [$c005]
5012  cpl
5013  inc a
5014  sub $60
5016  ld c, a
5017  ld a, [$c001]
501a  ld hl, $5023
501d  call Call_000_3047
5020  jp Jump_000_305a
Call_000_528e:
528e  ld b, $ff
5290  jr jr_000_5294
Call_000_5292:
5292  ld b, $00
jr_000_5294:
5294  ld de, $9884
5297  ldh a, [$ff96]
5299  and $03
529b  cp $03
529d  jr z, jr_000_52bb
529f  ld hl, $52c9
52a2  ld a, [hl]
52a3  ldh [$ffd3], a
52a5  call Call_000_52b1
52a8  ld hl, $52d0
jr_000_52ab:
52ab  ld a, [hl]
52ac  ldh [$ffd4], a
52ae  ld de, $98c4
Call_000_52b1:
jr_000_52b1:
52b1  bit 7, b
52b3  ret nz
52b4  ld a, [hl+]
52b5  and a
52b6  ret z
52b7  ld [de], a
52b8  inc de
52b9  jr jr_000_52b1
jr_000_52bb:
52bb  ld hl, $52d0
52be  ld a, [hl]
52bf  ldh [$ffd3], a
52c1  call Call_000_52b1
52c4  ld hl, $52c9
52c7  jr jr_000_52ab