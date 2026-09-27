' ---------------------------------------------------------------------------
' Balle : traduction des routines GB (cf. re/FICHE_JEU.md §7)
'   $17A0  mise à jour (machine à états $C040)
'   $18E4  physique : $18FE X, $1945 Y, $19AC Z + gravité, $1B17 freinage,
'          $1C27 filet, $18F3 zone
'   $09FA  classification de zone     $16F9  balle dans la main
'   $1722  prédiction du X de la balle à une profondeur donnée
'
' Champs ($C040+) : 0 état, 1 compteur, 2-3 Y, 4-5 X, 6-7 Z (frac, entier),
'   B zone, C rebonds, D zone du 1er rebond, F sens Y (bit 7 = vers le haut),
'   10 vx (signe-module), 11 vy, 12 vz (bit 7 = descend), 13 filet,
'   14/15 freinage x/y, 16/17 fractions, 18 échelle Z, 19 lob/smash,
'   1A échanges, 1B délai, 1C profil, 1D-1E gravité, 1F fraction vz,
'   20 marque de rebond (délai), 22-25 position de la marque
' ---------------------------------------------------------------------------

#ifndef BALL_BAS
#define BALL_BAS

#include "gbram.bas"

CONST BST AS UByte = $40
CONST BCNT AS UByte = $41
CONST BY AS UByte = $42
CONST BX AS UByte = $44
CONST BZF AS UByte = $46
CONST BZ AS UByte = $47
CONST BZONE AS UByte = $4B
CONST BBOUNCE AS UByte = $4C
CONST BZONE1 AS UByte = $4D
CONST BDIRY AS UByte = $4F
CONST BVX AS UByte = $50
CONST BVY AS UByte = $51
CONST BVZ AS UByte = $52
CONST BNET AS UByte = $53
CONST BDRGX AS UByte = $54
CONST BDRGY AS UByte = $55
CONST BFRX AS UByte = $56
CONST BFRY AS UByte = $57
CONST BZSCL AS UByte = $58
CONST BLOB AS UByte = $59
CONST BHITS AS UByte = $5A
CONST BTIMER AS UByte = $5B
CONST BPROF AS UByte = $5C
CONST BGRAV AS UByte = $5D
CONST BFRZ AS UByte = $5F
CONST BMARK AS UByte = $60
CONST BMARKY AS UByte = $62

' HRAM
CONST HHIT AS UByte = $2D         ' $FFAD : bit7 = au tour de J2, bit6 frappée,
                                  '         bit5 double rebond, bit4 corps, bit3 annonce
CONST HHITSV AS UByte = $2E       ' $FFAE
CONST HANN AS UByte = $42         ' $FFC2 : annonce ($C4 faute, $C5 let, $C6 dehors)

' Demande de bruitage (jouée par la boucle principale)
DIM sfxReq AS UByte

' $1F42 / $3665 : demande de son (le filtrage de $1F42 est reproduit plus tard)
SUB Sfx(n AS UByte)
    sfxReq = n
END SUB

' Octet haut arrondi de la position de la balle
FUNCTION BallYr() AS UByte
    RETURN RH(BY)
END FUNCTION

FUNCTION BallXr() AS UByte
    RETURN RH(BX)
END FUNCTION

' $09FA : zone d'une position (Y, X octets hauts). Renvoie le code de zone.
FUNCTION ZoneOf(d AS UByte, e AS UByte) AS UByte
    DIM c AS UByte
    c = 0
    IF d >= $78 THEN
        c = 2
        d = (255 - d) + $F0
        e = (255 - e) + $D8
    END IF
    IF e >= $6C THEN
        c = c BOR 1
        e = (255 - e) + $D8
    END IF
    IF e < $36 THEN RETURN c
    IF d >= $37 THEN
        c = c BOR 8
        IF d < $55 THEN RETURN c
    END IF
    RETURN c BOR 4
END FUNCTION

' $16F9 : balle dans la main du serveur, X haut = xh
SUB BallInHand(xh AS UByte)
    WW(BX + 1, xh)
    WW(BZ, $10)
    WW(BBOUNCE, 0)
    WW(BHITS, 0)
    WW(BFRZ, 0)
    WW(BVX, 0)
    WW(BVY, 0)
    WW(BVZ, $44)
    WW(BZSCL, $14)
    WW(BGRAV, $40)
    WW(BGRAV + 1, $01)
END SUB

' $18FE / $1945 / $1991 : amortissement après un mur invisible
SUB BallWallDamp()
    DIM a AS UByte
    a = WR(BVX)
    WW(BVX, (a BAND $80) BOR ((a BAND $7F) >> 1))
    WW(BVY, WR(BVY) >> 1)
    WW(BNET, 0)
    Sfx(4)
END SUB

' $18FE : déplacement latéral
SUB BallMoveX()
    DIM x AS UInteger
    DIM v AS UInteger
    x = GW(BX)
    v = CAST(UInteger, WR(BVX) BAND $7F) << 2
    IF (WR(BVX) BAND $80) = 0 THEN
        x = x + v
        IF x < $D001 THEN SW(BX, x): RETURN
    ELSE
        IF x >= v THEN
            x = x - v
            IF x >= $07FF THEN SW(BX, x): RETURN
        END IF
    END IF
    WW(BVX, WR(BVX) BXOR $80)
    BallWallDamp()
END SUB

' $1945 : déplacement en profondeur
SUB BallMoveY()
    DIM y AS UInteger
    DIM v AS UInteger
    y = GW(BY)
    v = CAST(UInteger, WR(BVY)) << 2
    IF (WR(BDIRY) BAND $80) = 0 THEN
        y = y + v
        IF y < $E701 THEN SW(BY, y): RETURN
    ELSE
        IF y >= v THEN
            y = y - v
            IF y >= $08FF THEN SW(BY, y): RETURN
        END IF
    END IF
    WW(BDIRY, WR(BDIRY) BXOR $80)
    BallWallDamp()
END SUB

' Vitesse verticale 8.8 (vz:fraction) mise à l'échelle selon le profil
' (tables $19E3 montée / $1A34 descente), comme les routines GB :
'   s=0 $1B0F x2 (octet seul)   s=1 $1B01 x4   s=2 $1AE5 x8
'   s=3 $1ACD x10               s=4 $1AC3 x12 (+ 1 bit de fraction)
FUNCTION BallVzScaled(s AS UByte) AS UInteger
    DIM v AS UInteger
    DIM r AS UInteger
    v = (CAST(UInteger, WR(BVZ) BAND $7F) << 8) BOR WR(BFRZ)
    IF s = 0 THEN RETURN (v >> 7) BAND $FF
    IF s = 1 THEN RETURN v >> 6
    IF s = 2 THEN RETURN v >> 5
    IF s = 3 THEN RETURN (v >> 5) + ((v >> 7) BAND $FF)
    r = (v >> 6) + ((v >> 7) BAND $FF)
    RETURN (r << 1) BOR ((WR(BFRZ) >> 5) BAND 1)
END FUNCTION

' $19AC : vitesse verticale, gravité et hauteur ; rebond au sol
SUB BallMoveZ()
    DIM vz AS UInteger
    DIM g AS UInteger
    DIM s AS UByte
    DIM p AS UInteger
    DIM z AS UInteger
    DIM d AS UInteger
    DIM b AS UByte
    DIM ix AS UByte
    DIM rising AS UByte
    g = GW(BGRAV)
    vz = (CAST(UInteger, WR(BVZ) BAND $7F) << 8) BOR WR(BFRZ)
    rising = (WR(BVZ) BAND $80) = 0
    IF rising THEN
        ' montée : la gravité freine
        IF vz < g THEN
            WW(BFRZ, (vz - g) BAND $FF)
            WW(BVZ, $80)
            IF WR(BLOB) THEN Sfx(WR(BLOB))
            RETURN
        END IF
        vz = vz - g
        WW(BFRZ, vz BAND $FF)
        WW(BVZ, vz >> 8)
        ix = WR(BPROF) >> 4
    ELSE
        ' descente : la gravité accélère (addition sur c052 bit 7 compris)
        vz = ((CAST(UInteger, WR(BVZ)) << 8) BOR WR(BFRZ)) + g
        WW(BFRZ, vz BAND $FF)
        WW(BVZ, vz >> 8)
        ix = WR(BPROF) BAND $0F
    END IF
    ' profils : montée {x8, x4, x2}, descente {x8, x10, x12}
    IF rising THEN
        s = 0
        IF ix = 0 THEN s = 2
        IF ix = 1 THEN s = 1
    ELSE
        s = 4
        IF ix = 0 THEN s = 2
        IF ix = 1 THEN s = 3
    END IF
    p = BallVzScaled(s)
    ' déplacement = p * échelle / 16 (24 bits tronqués à 16, routine $30D0)
    d = CAST(UInteger, (CAST(ULong, p) * WR(BZSCL)) >> 4)
    z = GW(BZF)
    IF rising THEN
        SW(BZF, z + d)
        RETURN
    END IF
    IF d < z THEN
        SW(BZF, z - d)
        RETURN
    END IF
    ' rebond ($1A6D)
    SW(BZF, 0)
    WW(BBOUNCE, WR(BBOUNCE) + 1)
    IF WR(BBOUNCE) >= 2 THEN hram(HHIT) = hram(HHIT) BOR $20
    WW(BLOB, 0)
    IF WR(BBOUNCE) < 4 THEN
        WW(BMARK, $1C)
        SW(BMARKY, GW(BY))
        SW(BMARKY + 2, GW(BX))
        Sfx(3)
    END IF
    b = WR(BVZ) BAND $7F
    b = b - (b >> 2)
    WW(BVZ, b)                 ' repart vers le haut (bit 7 à 0)
END SUB

' $1B17 : freinage des vitesses horizontales
SUB BallDrag()
    DIM b AS UInteger
    b = (CAST(UInteger, WR(BVX) BAND $7F) << 8) BOR WR(BFRX)
    IF b >= WR(BDRGX) THEN
        b = b - WR(BDRGX)
        WW(BFRX, b BAND $FF)
        WW(BVX, (WR(BVX) BAND $80) BOR (b >> 8))
    END IF
    b = (CAST(UInteger, WR(BVY)) << 8) BOR WR(BFRY)
    IF b >= WR(BDRGY) THEN
        b = b - WR(BDRGY)
        WW(BFRY, b BAND $FF)
        WW(BVY, b >> 8)
    END IF
END SUB

' $1C84 : la balle reste dans le filet (ou touche un joueur) : repart, 1/4 de vitesse
SUB BallRebound()
    DIM a AS UByte
    a = WR(BVX)
    WW(BVX, (a BAND $80) BOR ((a BAND $7F) >> 2))
    WW(BVY, (WR(BVY) >> 2) BAND $3F)
    WW(BDIRY, WR(BDIRY) BXOR $80)
    a = WR(BVZ)
    WW(BVZ, (a BAND $80) BOR ((a BAND $7F) >> 2))
END SUB

' $1C27 : passage du filet
SUB BallNet()
    DIM a AS UByte
    IF WR(BNET) THEN RETURN
    a = BallYr()
    IF a < $76 OR a >= $7B THEN RETURN
    WW(BNET, a)
    a = BallXr()
    IF a < $2E OR a >= $AB THEN RETURN
    IF WR(BZ) >= $1E THEN RETURN
    Sfx($0C)
    IF WR(BZ) >= $1C THEN
        ' bande : la balle passe, ralentie
        WW(BVY, WR(BVY) >> 1)
        a = WR(BVX)
        WW(BVX, (a BAND $80) BOR ((a BAND $7F) >> 1))
        a = WR(BVZ)
        IF (a BAND $80) = 0 THEN
            WW(BVZ, a + (a >> 1))
        ELSE
            WW(BVZ, (a BAND $7F) >> 1)
        END IF
        WW(BNET, $FF)
        RETURN
    END IF
    WW(BNET, $FE)
    BallRebound()
END SUB

' $18E4 : un pas de physique complet
SUB BallPhysics()
    BallMoveX()
    BallMoveY()
    BallMoveZ()
    BallDrag()
    BallNet()
    WW(BZONE, ZoneOf(WR(BY + 1), WR(BX + 1)))
END SUB

' $18AB : annonce (faute, let, dehors) puis pause
SUB BallAnnounce(delay AS UByte, ann AS UByte)
    IF (hram(HHIT) BAND 8) = 0 THEN
        hram(HANN) = ann
        hram(HHIT) = hram(HHIT) BOR 8
        hram(HHITSV) = hram(HHIT)
    END IF
    WW(BTIMER, delay)
    WW(BST, 8)
    BallPhysics()
END SUB

' $17A0 : un pas de jeu pour la balle
SUB BallTick()
    DIM st AS UByte
    DIM a AS UByte
    DIM b AS UByte
    IF WR(BMARK) THEN WW(BMARK, WR(BMARK) - 1)
    st = WR(BST)
    IF st = 0 THEN
        WW(BVX, 0): WW(BVY, 0): WW(BVZ, 0)
        WW(BZF, 0): WW(BCNT, 0): WW(BMARK, 0)
        WW(BZ, 1)
        WW(BST, 1)
    ELSEIF st = 1 THEN
        ' dans la main
        WW(BZONE, ZoneOf(WR(BY + 1), WR(BX + 1)))
        IF WR(BZ) = 0 THEN Sfx(3)
    ELSEIF st = 2 THEN
        ' lancer du service
        BallPhysics()
        IF WR(BBOUNCE) THEN
            hram(HHIT) = hram(HHIT) BOR $20
            WW(BST, 5)
        END IF
    ELSEIF st = 3 THEN
        ' service en vol : le premier rebond doit tomber dans le bon carré
        hram(HHIT) = hram(HHIT) BOR $20
        BallPhysics()
        IF WR(BBOUNCE) <> 1 THEN RETURN
        IF (WR(BZ) <> 0) OR (WR(BZF) <> 0) THEN RETURN
        IF (hram(HHIT) BAND $80) = 0 THEN b = $0E ELSE b = $0C
        IF hram(HSIDE) BAND 2 THEN b = b + 1
        WW(BZONE1, WR(BZONE))
        IF WR(BZONE) = b THEN
            IF WR(BNET) BAND $80 THEN
                WW(BST, 6)          ' let
            ELSE
                WW(BST, 4)          ' service bon
            END IF
        ELSE
            WW(BST, 5)              ' faute
        END IF
        hram(HHIT) = hram(HHIT) BAND $DF
    ELSEIF st = 4 THEN
        ' échange
        BallPhysics()
        IF WR(BCNT) THEN
            WW(BCNT, WR(BCNT) - 1)
            IF WR(BCNT) = 0 THEN WW(BST, 9)
            RETURN
        END IF
        a = WR(BBOUNCE)
        IF a = 1 THEN
            IF (WR(BZ) <> 0) OR (WR(BZF) <> 0) THEN RETURN
            WW(BZONE1, WR(BZONE))
            IF WR(BZONE) BAND 2 THEN b = $80 ELSE b = 0
            IF ((hram(HHIT) BXOR b) BAND $80) THEN
                IF (WR(BZONE1) BAND 8) = 0 THEN WW(BST, 7)
                RETURN
            END IF
            WW(BCNT, $3C)
        ELSEIF a >= 2 THEN
            WW(BCNT, $3C)
        END IF
    ELSEIF st = 5 THEN
        BallAnnounce($5A, $C4)
    ELSEIF st = 6 THEN
        BallAnnounce($5A, $C5)
    ELSEIF st = 7 THEN
        BallAnnounce($96, $C6)
    ELSEIF st = 8 THEN
        BallPhysics()
        WW(BTIMER, WR(BTIMER) - 1)
        IF WR(BTIMER) >= $1E THEN RETURN
        hram(HANN) = hram(HANN) BAND $BF
        IF WR(BTIMER) = 0 THEN WW(BST, 9)
    ELSE
        BallPhysics()
    END IF
END SUB

' $1722 : X (8.8) de la balle quand elle atteindra la profondeur py (octet haut)
FUNCTION BallPredictX(py AS UByte) AS UInteger
    DIM dy AS UByte
    DIM t AS UInteger
    DIM dv AS UInteger
    DIM dx AS UInteger
    dy = BallYr()
    IF dy >= py THEN dy = dy - py ELSE dy = py - dy
    dv = CAST(UInteger, WR(BVY)) << 2
    IF dv = 0 THEN
        t = $FFFF                  ' division par zéro du GB ($31D5)
    ELSE
        t = (CAST(UInteger, dy) << 8) / dv
    END IF
    dx = CAST(UInteger, CAST(ULong, t) * (CAST(UInteger, WR(BVX) BAND $7F) << 2))
    IF WR(BVX) BAND $80 THEN RETURN GW(BX) - dx
    RETURN GW(BX) + dx
END FUNCTION

#endif
