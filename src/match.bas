' ---------------------------------------------------------------------------
' Match : niveaux, déroulement du point, score (cf. re/FICHE_JEU.md §8-9)
'   $0A9D  fiche de niveau          $3297 / $2159  remise à zéro match / jeu
'   $1F8E  déroulement du point ($FF90)
'   $1FB5  choix du serveur         $200D  analyse de fin de point
'   $2170  point gagné              $2061  jeu gagné (sets, match)
'
' RAM : $C0DB set en cours, $C0DC compteur de jeux, $C0DD/$C0DE points J1/J2,
'   $C0DF niveau, $C0E0-2 / $C0E3-5 jeux par set J1 / J2, $C0E6 jeux du set + 1,
'   $C0E7 points du jeu (tie-break).
' HRAM : $FF90 étape, $FF91 côté (bit 1) + 1re faute (bit 0), $FF92 délai,
'   $FF93 gagnant du point (0 J1, 1 J2), $FFC4 écart de sets.
' ---------------------------------------------------------------------------

#ifndef MATCH_BAS
#define MATCH_BAS

#include "gbram.bas"
#include "ball.bas"
#include "player.bas"

CONST HFLOW AS UByte = $10        ' $FF90
CONST HDELAY AS UByte = $12       ' $FF92
CONST HWIN AS UByte = $13         ' $FF93
CONST HSETS AS UByte = $44        ' $FFC4
CONST HAIS AS UByte = $35         ' $FFB5 étape de l'IA
CONST HAIT AS UByte = $36         ' $FFB6 minuterie de l'IA

CONST WLEVEL AS UByte = $DF
CONST WSET AS UByte = $DB
CONST WGCNT AS UByte = $DC
CONST WPTS1 AS UByte = $DD
CONST WPTS2 AS UByte = $DE
CONST WGAMES1 AS UByte = $E0
CONST WGAMES2 AS UByte = $E3
CONST WGIS AS UByte = $E6
CONST WPTB AS UByte = $E7

' Vitesses de déplacement par niveau (1-4) : CPU $0AAD/$0ABB, humain $0B11/$0B1C
DIM tSpdXcpu(3) AS UByte => {$A0, $B0, $D0, $FF}
DIM tSpdYcpu(3) AS UByte => {$90, $A0, $C0, $FF}
DIM tSpdXhum(3) AS UByte => {$C0, $C8, $D0, $F0}
DIM tSpdYhum(3) AS UByte => {$A0, $A0, $B0, $C0}

' Fiches de niveau ($0B3D, 16 octets par niveau)
DIM levelRec(63) AS UByte => { _
    $94, $05, $70, $00, $1E, $3C, $58, $0A, $14, $3C, $0A, $14, $0A, $14, $14, $05, _
    $A0, $0A, $A0, $00, $28, $32, $80, $0A, $46, $0A, $0A, $1E, $0A, $14, $14, $00, _
    $A0, $14, $C0, $00, $46, $3C, $90, $0A, $14, $1E, $0A, $14, $0A, $0A, $32, $05, _
    $B0, $1E, $E0, $00, $50, $32, $A0, $05, $1E, $0A, $05, $14, $28, $0A, $32, $05}

DIM matchOver AS UByte        ' 6 = J1 gagne, 7 = J2 gagne

' $0A9D : charge la fiche du niveau (CPU en $C0A8/$C0B0, humain en $C088/$C090)
SUB LevelInit()
    DIM i AS UByte
    DIM lv AS UByte
    FOR i = $80 TO $BF: WW(i, 0): NEXT i
    lv = WR(WLEVEL) - 1
    WW($A8, tSpdXcpu(lv)): WW($A9, tSpdYcpu(lv))
    FOR i = 0 TO 15
        WW($90 + i, levelRec(lv * 16 + i))
        WW($B0 + i, levelRec(lv * 16 + i))
    NEXT i
    WW($90, (0 - WR($90)) - $10)
    ' joueur humain : service et puissance réduits de 1/4 hors niveau 1 ($0B26)
    IF WR(WLEVEL) <> 1 THEN
        WW($92, WR($92) - (WR($92) >> 2))
        WW($96, WR($96) - (WR($96) >> 2))
    END IF
    WW($88, tSpdXhum(lv)): WW($89, tSpdYhum(lv))
END SUB

' $2159 : nouveau jeu
SUB NewGame()
    hram(HFLOW) = 0
    hram(HSIDE) = 0
    IF WR(WGIS) >= $0D THEN WW(WPTS1, 7) ELSE WW(WPTS1, 1)
    WW(WPTS2, WR(WPTS1))
END SUB

' $3297 + $02E3 : nouveau match
SUB NewMatch()
    DIM i AS UByte
    WW(WSET, 1): WW(WGCNT, 1): WW(WPTS1, 1): WW(WPTS2, 1)
    WW(WGIS, 1)
    FOR i = WGAMES1 TO WGAMES1 + 5: WW(i, 0): NEXT i
    hram(HSETS) = 0
    matchOver = 0
    LevelInit()
    NewGame()
END SUB

' $32C8 : annonce du score au début du point (sauf à 0-0)
SUB ScoreCall()
    IF WR(WPTS1) = WR(WPTS2) AND WR(WPTS1) = 1 THEN hram(HANN) = 0 ELSE hram(HANN) = $C1
END SUB

' $1FB5 : désigne le serveur
SUB ChooseServer()
    DIM a AS UByte
    IF WR(WGIS) >= $0D THEN
        a = WR(WPTB) - 1
        a = a >> 1
    ELSE
        a = WR(WGIS)
    END IF
    IF (WR(WSET) BAND 1) = 0 THEN a = 255 - a
    IF a BAND 1 THEN
        hram(HOPT) = hram(HOPT) BAND $BF
        WW(OP1 + FSTATE, 4)
        hram(HHIT) = 0
    ELSE
        hram(HOPT) = hram(HOPT) BOR $40
        WW(OP2 + FSTATE, 4)
        hram(HHIT) = $80
    END IF
    hram($30) = 0: hram(HAIS) = 0
    hram(HFLOW) = 2
END SUB

' $1EFF : applaudissements (long échange, ace, retour gagnant)
SUB Applause()
    DIM ex AS UByte
    ex = WR(BHITS)
    IF ex >= $0A THEN Sfx($25): RETURN
    IF (hram(HOPT) BAND $40) = 0 THEN
        IF hram(HWIN) = 0 THEN
            IF ex = 1 THEN Sfx($25)
        ELSE
            IF ex = 2 THEN Sfx($25)
        END IF
    ELSE
        IF hram(HWIN) THEN
            IF ex = 1 THEN Sfx($25)
        ELSE
            IF ex = 2 THEN Sfx($25)
        END IF
    END IF
END SUB

' $2170 : point gagné par w (0 = J1, 1 = J2)
SUB PointWon(w AS UByte)
    DIM hl AS UByte
    DIM de AS UByte
    DIM a AS UByte
    hram(HWIN) = w
    IF w = 0 THEN hl = WPTS1: de = WPTS2 ELSE hl = WPTS2: de = WPTS1
    WW(WPTB, WR(WPTB) + 1)
    hram(HFLOW) = 8
    a = WR(hl)
    IF a = 0 THEN
        WW(hl, 5): WW(de, 5): Sfx($29)
    ELSEIF a < 3 THEN
        WW(hl, a + 1): Sfx($31)
    ELSEIF a = 3 THEN
        IF WR(de) = 4 THEN
            WW(hl, 5): WW(de, 5): Sfx($29)
        ELSE
            WW(hl, 4): Sfx($31)
        END IF
    ELSEIF a = 5 THEN
        WW(de, 0): WW(hl, 6): Sfx($31)
    ELSEIF a >= 7 AND a < $0C THEN
        WW(hl, a + 1): Sfx($31)
    ELSEIF a = $0C THEN
        IF WR(de) = $0D THEN
            WW(hl, 5): WW(de, 5): Sfx($29)
        ELSE
            WW(hl, $0D): Sfx($31)
        END IF
    ELSE
        ' 4, 6, $0D et plus : jeu
        WW(hl, 0)
        hram(HFLOW) = 4
    END IF
END SUB

' $200D : analyse de la fin du point
SUB PointDecide()
    DIM a AS UByte
    a = hram(HANN) BAND $0F
    IF a = 4 THEN
        ' faute de service
        hram(HSIDE) = hram(HSIDE) + 1
        IF hram(HSIDE) BAND 1 THEN hram(HFLOW) = 0: RETURN
        IF hram(HOPT) BAND $40 THEN PointWon(0) ELSE PointWon(1)
    ELSEIF a = 5 THEN
        hram(HFLOW) = 0                      ' let : on rejoue
    ELSEIF a = 6 THEN
        ' dehors : perdu par celui qui a frappé
        hram(HSIDE) = (hram(HSIDE) BAND $FE) + 2
        IF hram(HHIT) BAND 8 THEN a = hram(HHITSV) ELSE a = hram(HHIT)
        IF a BAND $80 THEN PointWon(1) ELSE PointWon(0)
        Applause()
    ELSE
        ' double rebond, filet, corps : côté du premier rebond
        hram(HSIDE) = (hram(HSIDE) BAND $FE) + 2
        IF WR(BZONE1) BAND 2 THEN PointWon(1) ELSE PointWon(0)
        Applause()
    END IF
END SUB

' $2061 : jeu gagné par hram(HWIN)
SUB GameWon()
    DIM hl AS UByte
    DIM de AS UByte
    DIM a AS UByte
    WW(WGCNT, WR(WGCNT) + 1)
    WW(WGIS, WR(WGIS) + 1)
    IF hram(HWIN) = 0 THEN hl = WGAMES1: de = WGAMES2 ELSE hl = WGAMES2: de = WGAMES1
    hl = hl + WR(WSET) - 1
    de = de + WR(WSET) - 1
    WW(hl, WR(hl) + 1)
    a = WR(hl)
    IF a = 6 AND WR(de) = 5 THEN GOTO gw_continue
    IF a = 6 AND WR(de) = 6 THEN
        ' 6-6 : tie-break
        WW(WGCNT, WR(WGCNT) - 1)
        WW(WPTB, 0)
        GOTO gw_continue
    END IF
    IF a = 7 OR a = 6 THEN
        ' set gagné
        WW(WGIS, 1)
        IF hram(HWIN) = 0 THEN hram(HSETS) = hram(HSETS) + 1 ELSE hram(HSETS) = hram(HSETS) - 1
        WW(WSET, WR(WSET) + 1)
        IF WR(WSET) = 3 THEN
            IF hram(HSETS) = 2 THEN matchOver = 6: hram(HFLOW) = 6: hram(HDELAY) = $96: RETURN
            IF hram(HSETS) = $FE THEN matchOver = 7: hram(HFLOW) = 7: hram(HDELAY) = $96: RETURN
        ELSEIF WR(WSET) = 4 THEN
            IF hram(HSETS) BAND $80 THEN matchOver = 7 ELSE matchOver = 6
            hram(HFLOW) = matchOver: hram(HDELAY) = $96
            RETURN
        END IF
    END IF
gw_continue:
    hram(HDELAY) = $64
    hram(HFLOW) = 5
END SUB

' $1F8E : une étape du déroulement du match (appelée à chaque pas de jeu)
SUB MatchTick()
    DIM f AS UByte
    DIM i AS UByte
    ' $32B9 : l'annonce du score s'efface dès que la balle est en jeu
    IF WR(BST) >= 2 AND WR(BST) < 5 THEN hram(HANN) = hram(HANN) BAND $BF
    f = hram(HFLOW)
    IF f = 0 THEN
        ScoreCall()
        FOR i = 0 TO $7F: WW(i, 0): NEXT i
        ChooseServer()
    ELSEIF f = 2 THEN
        IF WR(BST) = 9 THEN hram(HFLOW) = 3
    ELSEIF f = 3 THEN
        PointDecide()
    ELSEIF f = 4 THEN
        GameWon()
    ELSEIF f = 5 THEN
        hram(HDELAY) = hram(HDELAY) - 1
        IF hram(HDELAY) = 0 THEN NewGame()
    ELSEIF f = 6 OR f = 7 THEN
        IF hram(HDELAY) THEN hram(HDELAY) = hram(HDELAY) - 1
    ELSEIF f = 8 THEN
        hram(HFLOW) = 0
    END IF
END SUB

#endif
