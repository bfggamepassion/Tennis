' ---------------------------------------------------------------------------
' Joueurs : traduction des routines GB (cf. re/FICHE_JEU.md §6)
'   $0B7D / $10ED  mise à jour J1 / J2 (machine à états $C000 / $C020)
'     0 réception  1 déplacement  2 frappe  3 dribble  4 mise en place du
'     service  5 attente du service  6 balle lancée  7 service
'   $08C7 / $08F8  déplacement X / Y (bornes du terrain)
'   $10A9 / $1618  balle qui touche le corps du joueur
' ---------------------------------------------------------------------------

#ifndef PLAYER_BAS
#define PLAYER_BAS

#include "gbram.bas"
#include "ball.bas"
#include "shot.bas"

' Tables "rst $18" (identiques pour J1 et J2)
DIM tWalk(3) AS UByte => {$01, $02, $11, $12}                   ' $0DF5
DIM tSwingDur(2) AS UByte => {$04, $08, $06}                    ' $0BF1
DIM tVolleyDur(2) AS UByte => {$0A, $0C, $01}                   ' $0BFB
DIM tSwingFrm(17) AS UByte => {$07, $08, $09, $0A, $0B, $0C, _
                               $0D, $0E, $0E, $0F, $10, $10, _
                               $04, $05, $06, $04, $05, $06}    ' $0C22
DIM tServeDur(1) AS UByte => {$08, $0A}                         ' $0D7A
DIM tServeFrm(1) AS UByte => {$05, $06}                         ' $0D9C

' $08C7 : déplacement latéral, vitesse en 1/256 de pixel par pas
SUB MoveX(op AS UByte, speed AS UByte, pad AS UByte)
    DIM x AS UInteger
    x = GW(op + FX)
    IF pad BAND PADL THEN
        IF x >= $07FF THEN x = x - speed
    ELSEIF pad BAND PADR THEN
        IF x < $D001 THEN x = x + speed
    END IF
    SW(op + FX, x)
END SUB

' $08F8 : déplacement en profondeur. J2 : vitesse réduite de $14.
' Renvoie la vitesse effectivement utilisée (le registre B modifié du GB).
FUNCTION MoveY(op AS UByte, speed AS UByte, pad AS UByte) AS UByte
    DIM y AS UInteger
    y = GW(op + FY)
    IF pad BAND PADU THEN
        IF op = OP2 THEN
            IF y >= $08FF THEN speed = speed - $14: y = y - speed
        ELSE
            IF y >= $8500 THEN y = y - speed
        END IF
    ELSEIF pad BAND PADD THEN
        IF op = OP2 THEN
            IF y < $6B00 THEN speed = speed - $14: y = y + speed
        ELSE
            IF y < $E701 THEN y = y + speed
        END IF
    END IF
    SW(op + FY, y)
    RETURN speed
END FUNCTION

' $0DA5 / $1317 : vitesses et puissance depuis la fiche de niveau
SUB PlayerLoadStats(op AS UByte)
    IF op = OP1 THEN
        WW(OP1 + FSPDX, WR($88)): WW(OP1 + FSPDY, WR($89)): WW(OP1 + $16, WR($96))
    ELSE
        WW(OP2 + FSPDX, WR($A8)): WW(OP2 + FSPDY, WR($A9)): WW(OP2 + $16, WR($B6))
    END IF
END SUB

' $0BAC / $111C (service) et $0BCD / $113D (réception) : positions de départ
SUB PlayerPlace(op AS UByte, serving AS UByte)
    DIM side AS UByte
    side = hram(HSIDE) BAND 2
    IF op = OP1 THEN
        SW(OP1 + FY, $B980)
        IF serving THEN
            IF side THEN SW(OP1 + FX, $587F) ELSE SW(OP1 + FX, $7F80)
        ELSE
            IF side THEN SW(OP1 + FX, $457F) ELSE SW(OP1 + FX, $9280)
        END IF
    ELSE
        SW(OP2 + FY, $367F)
        IF serving THEN
            IF side THEN SW(OP2 + FX, $7F80) ELSE SW(OP2 + FX, $587F)
        ELSE
            IF side THEN SW(OP2 + FX, $9280) ELSE SW(OP2 + FX, $457F)
        END IF
    END IF
END SUB

' $0DB8 / $132A : état 1, déplacement et image de marche
SUB PlayerWalk(op AS UByte, pad AS UByte)
    DIM b AS UByte
    DIM d AS UByte
    MoveX(op, WR(op + FSPDX), pad)
    b = MoveY(op, WR(op + FSPDY), pad)
    d = (WR(op + FCNT1) BAND 4) >> 2
    IF (pad BAND $F0) = 0 THEN
        WW(op + FFRAME, 0)
        RETURN
    END IF
    ' J1 (de dos) : +2 vers la gauche ; J2 (de face) : +2 vers la droite
    IF op = OP1 THEN
        IF pad BAND PADL THEN d = d + 2
    ELSE
        IF pad BAND PADR THEN d = d + 2
    END IF
    SW(op + FCNT0, GW(op + FCNT0) + b)
    WW(op + FFRAME, tWalk(d))
END SUB

' $0DFE / $1370 : appui sur A ou B -> choix du coup et début de frappe
SUB PlayerStartSwing(op AS UByte, pad AS UByte, pressed AS UByte)
    DIM a AS UByte
    DIM b AS UByte
    DIM px AS UInteger
    DIM bx AS UInteger
    DIM diff AS UInteger
    a = pressed BAND 3
    IF a = 0 THEN RETURN
    WW(op + FBTN, a)
    Sfx(5)
    bx = BallPredictX(RH(op + FY))
    px = GW(op + FX)
    diff = bx - px
    IF op = OP1 THEN
        IF bx >= px THEN a = 0 ELSE a = 3
    ELSE
        IF bx >= px THEN a = 3 ELSE a = 0
    END IF
    WW(op + FSHOT, a)
    ' balle presque en face : la direction tenue décide coup droit / revers
    IF ((diff + $0400) >> 8) < 8 THEN
        IF pad BAND PADL THEN
            IF op = OP1 THEN WW(op + FSHOT, 0) ELSE WW(op + FSHOT, 3)
            WW(op + $19, $FF)
        ELSEIF pad BAND PADR THEN
            IF op = OP1 THEN WW(op + FSHOT, 3) ELSE WW(op + FSHOT, 0)
            WW(op + $19, $FF)
        END IF
    END IF
    b = 0
    IF WR(BZ) >= $40 THEN
        WW(op + FSHOT, WR(op + FSHOT) + $0C)        ' smash
    ELSEIF WR(op + FZONE) >= $0C THEN
        WW(op + FSHOT, WR(op + FSHOT) + 6)          ' volée
        b = 1
    END IF
    WW(op + FCNT1, b)
    WW(op + FCNT0, 0)
    WW(op + FSTATE, 2)
END SUB

' $0E77 / $13E8 suivi du coup : impact éventuel pendant l'animation
SUB PlayerTryHit(op AS UByte, pad AS UByte)
    IF HitTest(op) = 0 THEN RETURN
    WW(BPROF, 1)
    IF op = OP1 THEN WW(BDIRY, $80) ELSE WW(BDIRY, 0)
    IF WR(op + FSTATE) = 7 THEN
        ShotServe(op, pad)
    ELSE
        ShotRally(op, pad)
    END IF
END SUB

' $10A9 / $1618 : la balle touche le corps du joueur -> point perdu
SUB PlayerBodyCheck(op AS UByte)
    DIM a AS UByte
    DIM b AS UByte
    a = hram(HHIT)
    IF op = OP1 THEN
        IF a BAND $80 THEN RETURN
    ELSE
        IF (a BAND $80) = 0 THEN RETURN
    END IF
    IF a BAND $10 THEN RETURN
    a = RH(op + FY): b = BallYr()
    IF a >= b THEN a = a - b ELSE a = b - a
    IF a >= 3 THEN RETURN
    a = RH(op + FX): b = BallXr()
    IF a >= b THEN a = a - b ELSE a = b - a
    IF a >= 4 THEN RETURN
    IF WR(BZ) >= $34 THEN RETURN
    a = hram(HHIT)
    IF a BAND 8 THEN
        a = a BOR $30
    ELSE
        a = a BOR $38
        hram(HHITSV) = a
    END IF
    hram(HHIT) = a
    Sfx($0D)
    BallRebound()
END SUB

' $0C3E : fin d'animation -> retour au déplacement
SUB PlayerBackToWalk(op AS UByte)
    WW(op + FCNT0, 0)
    WW(op + FCNT1, 0)
    WW(op + FSTATE, 1)
END SUB

' $0BE2 / $1152 : état 2, animation de frappe en 3 phases
SUB PlayerSwing(op AS UByte, pad AS UByte)
    DIM shot AS UByte
    DIM dur AS UByte
    DIM ph AS UByte
    shot = WR(op + FSHOT)
    ph = WR(op + FCNT1)
    IF shot = 6 OR shot = 9 THEN dur = tVolleyDur(ph) ELSE dur = tSwingDur(ph)
    WW(op + FCNT0, WR(op + FCNT0) + 1)
    IF WR(op + FCNT0) >= dur THEN
        WW(op + FCNT0, 0)
        ph = ph + 1
        IF ph >= 3 THEN
            PlayerBackToWalk(op)
            PlayerBodyCheck(op)
            RETURN
        END IF
        WW(op + FCNT1, ph)
    END IF
    WW(op + FFRAME, tSwingFrm(shot + ph))
    PlayerTryHit(op, pad)
    PlayerBodyCheck(op)
END SUB

' $0C4C / $11BC : état 3, le joueur fait rebondir la balle en attendant
SUB PlayerDribble(op AS UByte)
    DIM a AS UByte
    WW(op + FFRAME, 3)
    a = WR(op + $17)
    IF a = 0 THEN
        WW(BST, 1)
        WW(BZ, $0E)
    END IF
    a = a + 1
    WW(op + $17, a)
    IF a >= $10 THEN
        a = a - $10
        IF a < 4 THEN RETURN
        a = a - 4
        IF a >= $10 THEN
            WW(op + $17, 0)
            WW(op + FSTATE, 5)
            RETURN
        END IF
    END IF
    IF a < 8 THEN WW(BZ, WR(BZ) - 2) ELSE WW(BZ, WR(BZ) + 2)
    IF WR(BZ) < $0E THEN WW(op + FFRAME, $13)
END SUB

' $0C9A / $120A : état 4, mise en place du service
SUB PlayerServeSetup(op AS UByte)
    PlayerLoadStats(op)
    IF op = OP1 THEN hram(HHIT) = 0 ELSE hram(HHIT) = $80
    WW(op + $17, 0)
    PlayerPlace(op, 1)
    WW(op + FSTATE, 5)
END SUB

' $0CB7 / $1229 : état 5, attente du service (déplacement latéral limité)
SUB PlayerServeWait(op AS UByte, pad AS UByte, pressed AS UByte)
    DIM c AS UByte
    DIM x AS UInteger
    DIM lim1 AS UInteger
    DIM lim2 AS UInteger
    WW(op + FFRAME, 3)
    IF pad = 0 THEN
        WW(op + $17, WR(op + $17) + 1)
        IF WR(op + $17) >= $B4 THEN
            WW(op + $17, 0)
            WW(op + FSTATE, 3)
            RETURN
        END IF
    ELSE
        WW(op + $17, 0)
        c = pad
        IF op = OP1 THEN
            IF hram(HSIDE) BAND 2 THEN lim1 = $3F80: lim2 = $6480 ELSE lim1 = $7380: lim2 = $9880
        ELSE
            IF hram(HSIDE) BAND 2 THEN lim1 = $7380: lim2 = $9880 ELSE lim1 = $3F80: lim2 = $6480
        END IF
        x = GW(op + FX)
        IF x < lim1 THEN c = c BAND $DF
        IF x >= lim2 THEN c = c BAND $EF
        MoveX(op, WR(op + FSPDX), c)
    END IF
    ' la balle suit la main du serveur
    SW(BY, GW(op + FY))
    WW(BX, WR(op + FX))
    IF op = OP1 THEN BallInHand(WR(op + FX + 1) + 6) ELSE BallInHand(WR(op + FX + 1) - 6)
    IF pressed BAND 3 THEN
        WW(BST, 2)
        WW(op + FSTATE, 6)
    END IF
END SUB

' $0D3D / $12AF : état 6, balle lancée : A/B pour servir
SUB PlayerTossed(op AS UByte, pressed AS UByte)
    WW(op + FFRAME, 4)
    IF pressed BAND 3 THEN
        WW(op + FBTN, pressed BAND 3)
        Sfx(5)
        WW(op + FCNT0, 0)
        WW(op + FCNT1, 0)
        WW(op + FSTATE, 7)
        RETURN
    END IF
    IF ((WR(BVZ) BAND $80) <> 0) AND (WR(BZ) < $30) THEN
        WW(op + $17, 0)
        WW(op + FSTATE, 5)
    END IF
END SUB

' $0D76 / $12E8 : état 7, animation de service (2 phases)
SUB PlayerServe(op AS UByte, pad AS UByte)
    DIM ph AS UByte
    ph = WR(op + FCNT1)
    WW(op + FCNT0, WR(op + FCNT0) + 1)
    IF WR(op + FCNT0) >= tServeDur(ph) THEN
        WW(op + FCNT0, 0)
        ph = ph + 1
        IF ph >= 2 THEN
            PlayerBackToWalk(op)
            PlayerBodyCheck(op)
            RETURN
        END IF
        WW(op + FCNT1, ph)
    END IF
    WW(op + FFRAME, tServeFrm(ph))
    PlayerTryHit(op, pad)
END SUB

' $0B7D / $10ED : un pas de jeu pour un joueur
SUB PlayerTick(op AS UByte, pad AS UByte, pressed AS UByte)
    DIM st AS UByte
    WW(op + FZONE, ZoneOf(WR(op + FY + 1), WR(op + FX + 1)))
    st = WR(op + FSTATE)
    IF st = 0 THEN
        PlayerLoadStats(op)
        PlayerPlace(op, 0)
        WW(op + FSTATE, 1)
    ELSEIF st = 1 THEN
        PlayerWalk(op, pad)
        PlayerStartSwing(op, pad, pressed)
        PlayerBodyCheck(op)
    ELSEIF st = 2 THEN
        PlayerSwing(op, pad)
    ELSEIF st = 3 THEN
        PlayerDribble(op)
    ELSEIF st = 4 THEN
        PlayerServeSetup(op)
    ELSEIF st = 5 THEN
        PlayerServeWait(op, pad, pressed)
    ELSEIF st = 6 THEN
        PlayerTossed(op, pressed)
    ELSEIF st = 7 THEN
        PlayerServe(op, pad)
    END IF
END SUB

#endif
