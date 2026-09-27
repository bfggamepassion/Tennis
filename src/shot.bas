' ---------------------------------------------------------------------------
' Frappes : traduction des routines GB (cf. re/FICHE_JEU.md §6)
'   $0E77 / $13E8  test d'impact (fenêtres Y, X, Z selon l'image de frappe)
'   $0F3D / $14AD  service          $0FCA / $153A  coup en échange
'   $165C          lancement de la balle (gravité, freinage, tour de jeu)
'   aides : $1CF6 $1D22 $1D57 $1CB1 $1D71 $1D90 $1DB3 $1DD9 $1DE7
'           $1E0D $1E3C $1E60 $1E6E $1E87 $1E9F $1EC3
' ---------------------------------------------------------------------------

#ifndef SHOT_BAS
#define SHOT_BAS

#include "gbram.bas"
#include "ball.bas"

' Fenêtres d'impact par index de coup (0-4), J1 puis J2
DIM hitYlo1(4) AS UByte => {$F6, $F6, $F4, $F4, $F4}     ' $0E97
DIM hitYhi1(4) AS UByte => {$06, $06, $02, $02, $04}     ' $0EA5
DIM hitYmid1(4) AS UByte => {$FE, $FE, $FB, $FB, $FC}    ' $0EBE
DIM hitXlo1(4) AS UByte => {$FC, $EE, $FC, $F2, $FE}     ' $0EE2
DIM hitXhi1(4) AS UByte => {$12, $04, $0E, $04, $0A}     ' $0EF0
DIM hitYlo2(4) AS UByte => {$FA, $FA, $FE, $FE, $FC}     ' $1408
DIM hitYhi2(4) AS UByte => {$0A, $0A, $0C, $0C, $0C}     ' $1416
DIM hitYmid2(4) AS UByte => {$02, $02, $05, $05, $04}    ' $142F
DIM hitXlo2(4) AS UByte => {$EE, $FC, $F2, $FC, $F6}     ' $1453
DIM hitXhi2(4) AS UByte => {$04, $12, $04, $0E, $02}     ' $1461
DIM hitZlo(4) AS UByte => {$02, $02, $10, $10, $30}      ' $0F0C / $147D
DIM hitZhi(4) AS UByte => {$30, $30, $40, $40, $50}      ' $0F18 / $1489

DIM shotFfc6 AS UByte          ' $FFC6 : direction calculée par $1D22

' $0A2C : image de frappe -> index de coup (0-4), $FF si pas une image de frappe
FUNCTION HitIndex(frm AS UByte) AS UByte
    IF frm = $08 THEN RETURN 0
    IF frm = $0B THEN RETURN 1
    IF frm = $0E THEN RETURN 2
    IF frm = $10 THEN RETURN 3
    IF frm = $05 THEN RETURN 4
    RETURN $FF
END FUNCTION

' Écart arrondi (octet signé) entre balle et joueur, champs 16 bits ($1C05 / $1BEF)
FUNCTION RelRound(bOff AS UByte, pOff AS UByte) AS UByte
    DIM d AS UInteger
    d = GW(bOff) - GW(pOff)
    IF GW(bOff) < GW(pOff) THEN d = d - 1
    RETURN (d + $80) >> 8
END FUNCTION

' $1E87 : ramène une vitesse vers $70 puis x3/4
FUNCTION Soften(a AS UByte) AS UByte
    DIM l AS UByte
    l = a
    IF a < $70 THEN
        a = (($70 - a) >> 1) + l
    ELSE
        a = l - ((a - $70) >> 1)
    END IF
    a = a >> 1
    l = a
    RETURN (a >> 1) + l
END FUNCTION

' $1CF6 : vitesse verticale pour atterrir à la profondeur e
SUB AimVertical(e AS UByte)
    DIM y AS UByte
    DIM b AS UByte
    DIM a AS UByte
    y = BallYr()
    IF y >= e THEN b = y - e ELSE b = e - y
    a = y + 8
    IF a BAND $80 THEN a = 0 - a
    IF a >= $30 THEN b = b + ((a - $30) >> 2)
    IF b >= WR(BZ) THEN a = b - WR(BZ) ELSE a = WR(BZ) - b
    WW(BVZ, a >> 1)
END SUB

' $1D22 : vitesse latérale vers la cible (d = X, e = Y) ; résultat en signe-module
FUNCTION AimLateral(d AS UByte, e AS UByte) AS UByte
    DIM dx AS UByte
    DIM dy AS UByte
    DIM hl AS UInteger
    DIM l AS UByte
    IF BallXr() >= d THEN dx = BallXr() - d ELSE dx = d - BallXr()
    IF BallYr() >= e THEN dy = BallYr() - e ELSE dy = e - BallYr()
    hl = CAST(UInteger, WR(BVY)) * dx
    IF dy = 0 THEN hl = $FFFF ELSE hl = hl / dy
    IF hl >= $68 THEN l = $68 ELSE l = hl
    IF BallXr() < d THEN l = l BOR $80
    shotFfc6 = l
    RETURN l
END FUNCTION

' $1D57 : déviation due au mauvais timing (c014 bas = écart, bit 7 = sens)
FUNCTION TimingDev(op AS UByte) AS UByte
    DIM a AS UByte
    DIM b AS UByte
    b = 0
    a = WR(op + $14) BAND $0F
    IF a < 2 THEN RETURN 0
    b = 2
    IF a >= 5 THEN b = 6
    WW(op + $15, WR(op + $15) - 4)
    IF WR(op + $14) BAND $80 THEN b = b BOR $80
    RETURN b
END FUNCTION

' $1CB1 : ajoute la déviation b (signe-module) à la direction visée ; borne à 2*vy
SUB ApplyLateral(b AS UByte)
    DIM a AS UByte
    DIM ma AS UByte
    DIM mb AS UByte
    DIM r AS UByte
    a = shotFfc6 BXOR $80
    ma = a BAND $7F
    mb = b BAND $7F
    IF (a BAND $80) = (b BAND $80) THEN
        r = (a BAND $80) BOR (ma + mb)
    ELSEIF ma >= mb THEN
        r = (a BAND $80) BOR (ma - mb)
    ELSE
        r = (b BAND $80) BOR (mb - ma)
    END IF
    WW(BVX, r)
    IF WR(BVY) < $80 THEN
        IF (WR(BVY) << 1) < (r BAND $7F) THEN WW(BVX, (r BAND $80) BOR (WR(BVY) << 1))
    END IF
END SUB

' $1E0D : ajoute -c (gauche) ou +c (droite) à b (signe-module)
FUNCTION AddSideSpin(pad AS UByte, b AS UByte, c AS UByte) AS UByte
    IF pad BAND PADL THEN
        IF b BAND $80 THEN RETURN b + c
        IF c >= b THEN RETURN (c - b) BOR $80
        RETURN b - c
    ELSEIF pad BAND PADR THEN
        IF b BAND $80 THEN
            b = b BAND $7F
            IF c >= b THEN RETURN c - b
            RETURN (b - c) BOR $80
        END IF
        RETURN b + c
    END IF
    RETURN b
END FUNCTION

' $1E3C (J1) / $1E60 (J2) : service plus long (+$10) ou plus court (-$10)
SUB ServeDepth(op AS UByte, pad AS UByte)
    DIM up AS UByte
    DIM down AS UByte
    IF op = OP1 THEN up = PADU: down = PADD ELSE up = PADD: down = PADU
    IF pad BAND up THEN
        WW(BVY, WR(BVY) + $10): WW(BPROF, $10)
    ELSEIF pad BAND down THEN
        WW(BVY, WR(BVY) - $10): WW(BPROF, $11)
    ELSE
        WW(BPROF, 1)
    END IF
END SUB

' $165C : la balle part. btn = bouton (1 A, 2 B), idx = index de coup
SUB LaunchBall(btn AS UByte, idx AS UByte)
    DIM c AS UByte
    DIM hl AS UInteger
    DIM dv AS UByte
    IF idx < 5 THEN Sfx(6) ELSE Sfx(7)
    c = 0
    IF ((btn BAND 2) <> 0) AND ((hram(HHIT) BAND $40) <> 0) AND (idx < 2) THEN
        Sfx($2A)
        c = $2B
    END IF
    WW(BLOB, c)
    WW(BBOUNCE, 0)
    WW(BNET, 0)
    WW(BHITS, WR(BHITS) + 1)
    IF (hram(HHIT) BAND 8) = 0 THEN
        IF WR(BST) <> 4 THEN WW(BST, 3)
    END IF
    WW(BDRGX, WR(BVX) BAND $7F)
    WW(BDRGY, WR(BVY))
    WW(BFRX, 0)
    WW(BFRY, 0)
    IF c THEN dv = $28 ELSE dv = $48
    hl = (CAST(UInteger, WR(BVY)) << 8) / dv
    IF (hl >> 8) = 0 THEN hl = $00F8
    SW(BGRAV, hl)
    WW(BZSCL, (hl >> 4) BAND $FF)
    WW(BFRZ, 0)
    hram(HHIT) = (hram(HHIT) BXOR $80) BOR $40
END SUB

' $0E77 / $13E8 : test d'impact pendant une image de frappe. Renvoie 1 si frappée.
FUNCTION HitTest(op AS UByte) AS UByte
    DIM c AS UByte
    DIM a AS UByte
    DIM rel AS UByte
    DIM lo AS UByte
    DIM hi AS UByte
    DIM mid AS UByte
    a = hram(HHIT)
    IF op = OP1 THEN
        IF a BAND $80 THEN RETURN 0
    ELSE
        IF (a BAND $80) = 0 THEN RETURN 0
    END IF
    IF a BAND $30 THEN RETURN 0
    IF op = OP1 THEN
        IF WR(BY + 1) < $78 THEN RETURN 0
    ELSE
        IF WR(BY + 1) >= $78 THEN RETURN 0
    END IF
    c = HitIndex(WR(op + FFRAME))
    IF c = $FF THEN RETURN 0
    WW(op + $18, c)
    ' fenêtre en profondeur
    IF op = OP1 THEN lo = hitYlo1(c): hi = hitYhi1(c): mid = hitYmid1(c) ELSE lo = hitYlo2(c): hi = hitYhi2(c): mid = hitYmid2(c)
    rel = RelRound(BY, op + FY)
    a = rel + $10
    hi = hi + $11
    lo = lo + $10
    IF a >= hi THEN RETURN 0
    IF a < lo THEN RETURN 0
    ' timing (écart au centre de la fenêtre)
    a = rel - mid
    IF a BAND $80 THEN a = (0 - a) BOR $80
    IF c BAND 1 THEN a = a BXOR $80
    WW(op + $14, a)
    ' fenêtre latérale
    IF op = OP1 THEN lo = hitXlo1(c): hi = hitXhi1(c) ELSE lo = hitXlo2(c): hi = hitXhi2(c)
    a = RelRound(BX, op + FX) + $20
    hi = hi + $23
    lo = lo + $1E
    IF a >= hi THEN RETURN 0
    IF a < lo THEN RETURN 0
    ' fenêtre en hauteur
    a = WR(BZ) - WR(op + 7)
    IF a >= hitZhi(c) THEN RETURN 0
    IF a < hitZlo(c) THEN RETURN 0
    RETURN 1
END FUNCTION

' $0F3D / $14AD : service
SUB ShotServe(op AS UByte, pad AS UByte)
    DIM btn AS UByte
    DIM spd AS UByte
    DIM d AS UByte
    DIM e AS UByte
    DIM a AS UByte
    DIM b AS UByte
    DIM c AS UByte
    btn = WR(op + FBTN)
    IF op = OP1 THEN spd = WR($92) ELSE spd = WR($B2)
    IF (btn BAND 2) = 0 THEN
        WW(BVY, spd)
        a = WR(BZ) - $26
        WW(BVZ, (a >> 1) + $0C)
    ELSE
        a = Soften(spd)
        WW(BVY, a)
        WW(op + $15, a BAND $7F)
        IF op = OP1 THEN AimVertical($58) ELSE AimVertical($98)
        WW(BVZ, WR(BVZ) + $0C)
    END IF
    ServeDepth(op, pad)
    ' cible : carré de service opposé (X $54 ou $84 selon le côté)
    IF op = OP1 THEN
        IF hram(HSIDE) BAND 2 THEN d = $84 ELSE d = $54
        e = $6C
    ELSE
        IF hram(HSIDE) BAND 2 THEN d = $54 ELSE d = $84
        e = $84
    END IF
    IF pad BAND (PADL BOR PADR) THEN
        IF pad BAND PADL THEN a = $F0 ELSE a = $10
        IF (btn BAND 1) = 0 THEN
            IF a BAND $80 THEN a = $F8 ELSE a = $08
        END IF
        d = d + a
    END IF
    b = AimLateral(d, e) BXOR $80
    IF btn BAND 2 THEN c = 4 ELSE c = $10
    IF WR($DF) < 3 THEN c = c >> 2
    WW(BVX, AddSideSpin(pad, b, c))
    LaunchBall(btn, WR(op + $18))
END SUB

' $0FCA / $153A : coup pendant l'échange
SUB ShotRally(op AS UByte, pad AS UByte)
    DIM a AS UByte
    DIM b AS UByte
    DIM d AS UByte
    DIM e AS UByte
    DIM shot AS UByte
    DIM idx AS UByte
    DIM pw AS UByte
    DIM c AS UByte
    IF WR(op + $19) THEN
        WW(op + $18, WR(op + $18) + 5)
        WW(op + $19, 0)
    END IF
    shot = WR(op + FSHOT)
    idx = WR(op + $18)
    a = shot
    WHILE a >= 6: a = a - 6: WEND
    IF a = 0 THEN b = 4 ELSE b = $FC
    ' $1E9F / $1EC3 : puissance selon haut/bas
    pw = WR(op + $16)
    IF op = OP1 THEN
        IF pad BAND PADU THEN
            c = pw >> 2: b = b + (c >> 1) + c
        ELSEIF pad BAND PADD THEN
            b = b - (pw >> 3)
        END IF
    ELSE
        IF pad BAND PADD THEN
            c = pw >> 2: b = b + (c >> 1) + c
        ELSEIF pad BAND PADU THEN
            b = b - (pw >> 3)
        END IF
    END IF
    WW(op + $15, pw + b)
    ' profondeur visée selon la profondeur de frappe
    IF op = OP1 THEN
        a = BallYr()
        IF a >= $B9 THEN e = ((a - $B9) >> 2) + $52 ELSE e = $52 - (($B9 - a) >> 2)
    ELSE
        a = BallYr()
        IF a >= $37 THEN e = ((a - $37) >> 2) + $9E ELSE e = $9E - (($37 - a) >> 2)
    END IF
    d = $6C
    IF shot < $0C AND idx >= 5 THEN
        IF op = OP1 THEN
            d = $5C: IF (idx - 5) BAND 1 THEN d = $7C
        ELSE
            d = $7C: IF (idx - 5) BAND 1 THEN d = $5C
        END IF
    END IF
    IF shot >= $0C THEN
        IF op = OP1 THEN e = $68 ELSE e = $88
        WW(op + $15, WR(op + $15) + $10)
    ELSEIF shot >= 6 THEN
        IF op = OP1 THEN e = $58 ELSE e = $98
        WW(op + $15, WR(op + $15) - $10)
        WW(BPROF, 2)
    END IF
    ' $1E6E : cible X moyennée avec la position du joueur (hors frappe dirigée).
    ' Le GB compare l'octet BAS de X à $6C (bizarrerie d'origine, conservée).
    IF idx < 5 THEN
        DIM lo9 AS UInteger
        DIM h9 AS UInteger
        lo9 = WR(op + FX)
        IF lo9 < $6C THEN lo9 = lo9 + 2
        h9 = CAST(UInteger, WR(op + FX + 1)) + d + (lo9 >> 8)
        d = h9 >> 1
        IF h9 BAND 1 THEN d = d + 1
    END IF
    ' $1D71 : gauche/droite décale la cible
    IF shot >= 6 AND shot < $0C THEN c = $20 ELSE c = $28
    IF pad BAND PADL THEN
        d = d - c: WW(op + $15, WR(op + $15) - 4)
    ELSEIF pad BAND PADR THEN
        d = d + c: WW(op + $15, WR(op + $15) - 4)
    END IF
    ' $1D90 / $1DB3 : haut/bas décale la profondeur
    IF shot >= 6 AND shot < $0C THEN a = 2 ELSE a = $0A
    IF op = OP1 THEN
        IF pad BAND PADU THEN
            e = e - a - 8
            IF WR(BPROF) <> 2 THEN WW(BPROF, 0)
        ELSEIF pad BAND PADD THEN
            e = e + a
            WW(BPROF, 1)
        END IF
    ELSE
        IF pad BAND PADD THEN
            e = e + a + 8
            IF WR(BPROF) <> 2 THEN WW(BPROF, 0)
        ELSEIF pad BAND PADU THEN
            e = e - a
            WW(BPROF, 1)
        END IF
    END IF
    AimVertical(e)
    IF shot >= $0C THEN
        WW(BVZ, $90)
        WW(BPROF, $22)
    END IF
    ' $1DD9 / $1DE7 : lob
    b = WR(op + $15)
    IF WR(op + FBTN) BAND 2 THEN
        a = WR(BVZ)
        IF a BAND $80 THEN
            WW(BVZ, 1)
        ELSEIF (a << 1) BAND $80 THEN
            WW(BVZ, $7F)
        ELSE
            WW(BVZ, a << 1)
        END IF
        b = $40
        IF op = OP1 THEN
            IF pad BAND PADU THEN b = $4C
        ELSE
            IF pad BAND PADD THEN b = $4C
        END IF
    END IF
    WW(BVY, b)
    IF op = OP1 THEN WW(BDIRY, $80) ELSE WW(BDIRY, 0)
    a = AimLateral(d, e)
    ApplyLateral(TimingDev(op))
    IF idx >= 5 THEN idx = idx - 5
    LaunchBall(WR(op + FBTN), idx)
END SUB

#endif
