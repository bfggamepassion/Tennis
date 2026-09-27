' ---------------------------------------------------------------------------
' IA du joueur 2 : traduction de $2720 (cf. re/FICHE_JEU.md §9)
' L'IA remplit le joypad virtuel de J2 ($FF9C maintenu, $FF9D pressé).
'   $2750  au service (étapes $FFB5 : attente, pas de côté, lancer, frappe)
'   $27BC  en échange (0 choix de position, 1 déplacement, 2 poursuite,
'          3 décision de frappe, 4 frappe en cours, 5 placement pour smash)
' Hasard : générateur du GB ($00A9) et tirages $00CA / $00D9.
' ---------------------------------------------------------------------------

#ifndef AI_BAS
#define AI_BAS

#include "gbram.bas"
#include "ball.bas"

CONST HRNG AS UByte = $24         ' $FFA4
CONST HAITX AS UByte = $37        ' $FFB7 cible X
CONST HAITY AS UByte = $38        ' $FFB8 cible Y
CONST HAISM AS UByte = $39        ' $FFB9

DIM aiPad AS UByte                ' registre C du GB : joypad en construction

' $00A9 : x = 5x + 11
FUNCTION Rand() AS UByte
    hram(HRNG) = hram(HRNG) * 5 + $0B
    RETURN hram(HRNG)
END FUNCTION

' $00CA : vrai avec une probabilité de a % (a >= 100 : toujours vrai)
FUNCTION Chance(a AS UByte) AS UByte
    DIM l AS UByte
    IF a >= 100 THEN RETURN 1
    l = a * 2 + (a >> 1)
    IF Rand() < l THEN RETURN 1
    RETURN 0
END FUNCTION

' $00D9 : même test, sans nouveau tirage (seuil cumulé)
FUNCTION ChanceSame(a AS UByte) AS UByte
    DIM l AS UByte
    IF a >= 100 THEN RETURN 1
    l = a * 2 + (a >> 1)
    IF hram(HRNG) < l THEN RETURN 1
    RETURN 0
END FUNCTION

' $176B : la balle va-t-elle sortir (ne pas la jouer) ? 1 = la laisser
FUNCTION BallGoingLong() AS UByte
    DIM a AS UByte
    DIM h AS UByte
    IF (WR(BVZ) BAND $80) = 0 THEN RETURN 0
    ' variante J2 ($FF96 bit 7 à 1 pendant l'IA)
    IF WR(BY + 1) > $B8 THEN
        IF WR(BBOUNCE) = 0 THEN RETURN 1
        RETURN 0
    END IF
    a = $B8 - WR(BY + 1)
    IF a >= $0C THEN RETURN 0
    IF WR(BBOUNCE) THEN RETURN 0
    h = a << 1
    IF WR(BZ) < h THEN RETURN 0
    RETURN 1
END FUNCTION

' $297D / $2B11 : direction latérale vers le X prédit de la balle
SUB AiTrack(b AS UByte, near AS UByte)
    DIM a AS UByte
    DIM c AS UByte
    DIM px AS UInteger
    px = BallPredictX(RH(OP2 + FY))
    a = WR(OP2 + FX + 1) - (px >> 8)
    c = $20
    IF near THEN
        ' $297D : s'écarte si trop près, s'arrête entre 8 et 16, sinon approche
        IF a BAND $80 THEN c = $10: a = 0 - a
        IF a < 8 THEN
            c = c BXOR $30
        ELSEIF a < $10 THEN
            c = 0
        END IF
    ELSE
        ' $2B11 (smash)
        IF a BAND $80 THEN c = $10
        IF a < 4 OR (a >= 4 AND a < $0C) THEN c = 0
    END IF
    aiPad = c BOR b
END SUB

' $2750 : IA au service (J2 serveur)
SUB AiServe()
    DIM st AS UByte
    DIM a AS UByte
    IF (hram(HOPT) BAND $40) = 0 THEN RETURN
    st = hram(HAIS)
    IF st = 3 THEN
        IF WR(OP2 + FSTATE) <> 6 THEN
            st = 0
        ELSE
            hram(HAIT) = hram(HAIT) - 1
            IF hram(HAIT) THEN RETURN
            ' $22B1 : frappe du service
            IF hram(HSIDE) BAND 1 THEN aiPad = 2 ELSE aiPad = 1
            IF Chance(WR($B4)) THEN
                a = hram(HSIDE)
                IF (Rand() BAND $F0) >= $C0 THEN a = a BXOR 2
                IF hram(HOPT) BAND $40 THEN a = a BXOR 2
                IF a BAND 2 THEN aiPad = aiPad BOR $10 ELSE aiPad = aiPad BOR $20
            END IF
            a = Rand()
            IF (a BAND $10) = 0 THEN
                IF a BAND 8 THEN
                    IF WR(BZ) >= $3C THEN
                        IF hram(HOPT) BAND $40 THEN aiPad = aiPad BOR $40 ELSE aiPad = aiPad BOR $80
                    END IF
                ELSE
                    IF WR(BZ) < $44 THEN
                        IF (hram(HOPT) BXOR $40) BAND $40 THEN aiPad = aiPad BOR $40 ELSE aiPad = aiPad BOR $80
                    END IF
                END IF
            END IF
            hram(HAIS) = 4
            RETURN
        END IF
    END IF
    IF st = 0 THEN
        IF WR(OP2 + FSTATE) = 5 THEN
            hram(HAIT) = (Rand() BAND $3F) + $20
            hram(HAIS) = 1
        END IF
    ELSEIF st = 1 THEN
        hram(HAIT) = hram(HAIT) - 1
        IF hram(HAIT) = 0 THEN
            hram(HAIT) = (Rand() BAND $1F) - $10
            hram(HAIS) = 2
        END IF
    ELSEIF st = 2 THEN
        a = hram(HAIT)
        IF a BAND $80 THEN
            aiPad = $10: a = a + 1
        ELSE
            aiPad = $20: a = a - 1
        END IF
        hram(HAIT) = a
        IF a THEN RETURN
        ' $229A : lancer de balle, puis attente avant la frappe
        IF WR($DF) = 4 THEN
            hram(HAIT) = (Rand() BAND 7) + $50
        ELSE
            hram(HAIT) = (Rand() BAND $0F) + $48
        END IF
        aiPad = 1
        hram(HAIS) = 3
    ELSEIF st = 4 THEN
        aiPad = hram(HPAD2) BAND $F0
        IF hram(HHIT) BAND $40 THEN hram(HAIS) = 0
    END IF
END SUB

' $27BC : IA pendant l'échange
SUB AiRally()
    DIM st AS UByte
    DIM a AS UByte
    DIM b AS UByte
    DIM c AS UByte
    DIM d AS UByte
    DIM i AS UByte
    DIM px AS UInteger
    IF hram(HANN) BAND $40 THEN RETURN
    IF WR(BBOUNCE) >= 2 THEN RETURN
    st = hram(HAIS)
    IF st = 0 THEN
        ' $27D6 : choisir une position cible
        hram(HAISM) = 0
        IF (hram(HHIT) BAND $80) = 0 THEN
            IF WR(BY + 1) < $70 THEN RETURN
        END IF
        IF WR(BHITS) < 2 THEN
            hram(HAITX) = WR(OP2 + FX + 1): a = WR(OP2 + FY + 1)
        ELSE
            IF WR(OP2 + FY + 1) < $38 THEN
                i = 0
            ELSEIF WR(OP2 + FY + 1) < $56 THEN
                i = 3
            ELSE
                i = 6
            END IF
            d = 0
            IF WR($DF) >= 3 THEN
                a = WR(OP2 + FY + 1)
                IF a >= $6C THEN d = (a - $6C) >> 2 ELSE d = ($6C - a) >> 2
            END IF
            IF WR($B7 + i) >= d THEN d = WR($B7 + i) - d ELSE d = 0
            IF Chance(d) THEN
                hram(HAITX) = WR(OP2 + FX + 1): a = WR(OP2 + FY + 1)
            ELSE
                d = WR($B8 + i) + d
                IF ChanceSame(d) THEN
                    ' $2844 : vers la balle et vers l'avant
                    b = (Rand() BAND $3F) + $4C
                    c = (CAST(UInteger, WR(OP2 + FX + 1)) + WR(BX + 1)) >> 1
                    hram(HAITX) = (CAST(UInteger, c) + b) >> 1
                    a = WR(OP2 + FY + 1) + $20
                    IF a >= $6C THEN a = $6C
                ELSE
                    d = WR($B9 + i) + d
                    IF ChanceSame(d) THEN
                        hram(HAITX) = $6C: a = $38
                    ELSE
                        hram(HAITX) = $6C: a = WR(OP2 + FY + 1)
                    END IF
                END IF
            END IF
        END IF
        hram(HAITY) = a
        aiPad = 0
        hram(HAIT) = 0
        hram(HAIS) = 1
    ELSEIF st = 1 THEN
        ' $287F : rejoindre la cible ; attendre que la balle approche
        c = 0
        a = WR(OP2 + FX + 1)
        IF a > hram(HAITX) THEN
            c = $20
        ELSEIF a < hram(HAITX) THEN
            c = $10
        END IF
        a = WR(OP2 + FY + 1)
        IF a > hram(HAITY) THEN
            c = c BOR $40
        ELSEIF a < hram(HAITY) THEN
            c = c BOR $80
        END IF
        aiPad = c
        IF (hram(HHIT) BAND $80) = 0 THEN RETURN
        a = WR($B0)
        IF WR(BHITS) < 2 THEN a = a - (WR(BVY) >> 2)
        ' (a est un octet : la soustraction se replie comme sur GB)
        IF a < WR(BY + 1) THEN RETURN
        hram(HAIS) = 2
    ELSEIF st = 2 THEN
        ' $28C1 : poursuivre la balle
        IF hram(HAIT) THEN
            hram(HAIT) = hram(HAIT) - 1
            IF hram(HAIT) = 0 THEN hram(HAIS) = 3
            AiTrack(0, 1)
            RETURN
        END IF
        a = WR(BVY) >> 4
        b = (a << 2) - (a >> 1)
        IF CAST(UByte, WR(BY + 1) - WR(OP2 + FY + 1)) < b THEN
            px = BallPredictX(RH(OP2 + FY))
            IF CAST(UByte, WR(OP2 + FX + 1) - (px >> 8) + $14) < $28 THEN
                IF WR(BZ) >= $48 THEN AiTrack($40, 1): RETURN
                IF WR(BZONE) >= 4 OR WR(BBOUNCE) <> 0 THEN
                    hram(HAIT) = (Rand() BAND 7) + 1
                END IF
            END IF
        END IF
        IF WR(BZ) >= $60 AND hram(HAISM) = 0 THEN
            hram(HAIS) = 5
            aiPad = 0
            RETURN
        END IF
        IF WR($B0) < WR(BY + 1) THEN AiTrack(0, 1): RETURN
        IF WR(BZ) BAND $80 THEN AiTrack($40, 1): RETURN
        IF WR(BZ) < $30 AND WR(BBOUNCE) = 0 THEN AiTrack(0, 1): RETURN
        b = $80
        IF WR(BHITS) < 2 AND WR(OP2 + FY + 1) >= $4C THEN b = 0
        c = WR(BVY) >> 3
        IF WR(BVZ) BAND $80 THEN c = c >> 1
        a = WR(BY + 1) - c
        IF a < WR(OP2 + FY + 1) THEN b = $40
        AiTrack(b, 1)
    ELSEIF st = 3 THEN
        ' $29A7 : décider de la frappe (bouton et direction)
        c = 0
        IF BallGoingLong() = 0 THEN
            IF WR(OP1 + FZONE) < 8 THEN
                c = 1
            ELSE
                c = 0
                IF ((hram(HPAD1) BAND PADU) <> 0) AND (WR(OP1 + FY + 1) < $A0) THEN c = $1E
                a = WR($B1) + c
                IF WR(OP2 + FZONE) >= $0C THEN a = a >> 2
                IF Chance(a) THEN c = 2 ELSE c = 1
            END IF
        END IF
        a = WR($B5)
        IF WR(OP2 + FZONE) >= $0C THEN a = a + $14
        b = 0
        IF Chance(a) THEN
            IF WR($DF) = 4 THEN d = 1 ELSE d = 3
            i = 0
            IF (Rand() BAND d) = 0 THEN
                IF hram(HPAD1) BAND PADL THEN
                    i = 1
                ELSEIF hram(HPAD1) BAND PADR THEN
                    i = 2
                END IF
            END IF
            IF i = 0 THEN
                IF WR(OP1 + FX + 1) >= $6C THEN i = 2 ELSE i = 1
            END IF
            IF i = 1 THEN
                IF WR(OP2 + FX + 1) < $88 THEN b = $10
            ELSE
                IF WR(OP2 + FX + 1) >= $50 THEN b = $20
            END IF
        END IF
        c = c BOR b
        b = 0
        a = 0
        IF c BAND 2 THEN a = Rand() BAND $10
        IF a THEN
            b = $80
        ELSE
            IF Rand() BAND 1 THEN
                IF WR(OP1 + FY + 1) >= $B0 THEN
                    IF WR(OP2 + FY + 1) >= $40 THEN b = $40
                ELSE
                    IF WR(OP2 + FY + 1) < $40 THEN b = $80
                END IF
            END IF
        END IF
        aiPad = c BOR b
        hram(HAIS) = 4
    ELSEIF st = 4 THEN
        ' $2A63 : frappe en cours
        aiPad = hram(HPAD2) BAND $F0
        IF WR(OP2 + FSTATE) = 2 THEN RETURN
        hram(HAIS) = 0
    ELSEIF st = 5 THEN
        ' $2A72 : se placer pour le smash
        IF hram(HAIT) THEN
            hram(HAIT) = hram(HAIT) - 1
            IF hram(HAIT) = 0 THEN hram(HAIS) = 3
            AiTrack(0, 0)
            RETURN
        END IF
        IF CAST(UByte, WR(BY + 1) - WR(OP2 + FY + 1)) < $0C THEN
            a = RelRound(BX, OP2 + FX) + $0C
            IF (a < $10) AND (WR(BZ) < $60) AND ((WR(BVZ) BAND $80) <> 0) THEN
                hram(HAIT) = (Rand() BAND 3) + 1
            END IF
        END IF
        IF WR(BY + 1) < $60 THEN
            hram(HAIS) = 2: hram(HAISM) = 2: aiPad = 0
            RETURN
        END IF
        IF WR(BVZ) BAND $80 THEN
            b = WR(OP2 + FX + 1) - 8
            IF WR(BX + 1) >= b THEN a = WR(BX + 1) - b ELSE a = b - WR(BX + 1)
            b = (a << 1) + $38
            IF WR(BZ) < b THEN
                hram(HAIS) = 2: hram(HAISM) = 2: aiPad = 0
                RETURN
            END IF
        END IF
        b = 0
        IF WR($B0) >= WR(BY + 1) THEN
            IF WR(BY + 1) < WR(OP2 + FY + 1) THEN
                b = $40
            ELSEIF CAST(UByte, WR(BY + 1) - WR(OP2 + FY + 1)) < $18 THEN
                IF WR(BZ) BAND $80 THEN b = $40
            END IF
        END IF
        AiTrack(b, 0)
    END IF
END SUB

' $2720 : un pas de l'IA
SUB AiTick()
    aiPad = 0
    IF hram(HHIT) BAND $40 THEN AiRally() ELSE AiServe()
    IF (WR(BHITS) <> 1) AND ((hram(HHIT) BAND $20) <> 0) THEN aiPad = aiPad BAND $FC
    hram(HPRS2) = (hram(HPAD2) BXOR aiPad) BAND aiPad
    hram(HPAD2) = aiPad
END SUB

#endif
