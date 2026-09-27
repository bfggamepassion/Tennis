' ===========================================================================
' TENNIS - portage ZX Spectrum 48K du Tennis Game Boy (Nintendo, 1989)
' Boriel ZX Basic. Logique et constantes : re/FICHE_JEU.md
'
' Cadence : affichage à 25 images/s (1 image toutes les 2 trames de 50 Hz),
' logique au rythme exact du GB : 12 pas de jeu toutes les 5 images
' (59,7 Hz), soit 3,2,3,2,2 pas par image.
' Ordre d'un pas de jeu (comme $0680) : déroulement du match, J1, J2, balle, IA.
' ===========================================================================

#include "gbram.bas"
#include "court.bas"
#include "sprite.bas"
#include "input.bas"
#include "ball.bas"
#include "shot.bas"
#include "player.bas"
#include "match.bas"
#include "ai.bas"
#include "sound.bas"

' Profilage : compiler avec -D PROFILE pour colorer la bordure pendant chaque
' partie de la boucle (mesuré par tools/zxrun.py). Sinon, bordure verte unie.
#ifdef PROFILE
#define PROF(pCol__) BORDER pCol__
#else
#define PROF(pCol__)
#endif

CONST FRAMES AS UInteger = 23672          ' compteur de trames de la ROM

' Emplacements de sprites (restaurés en ordre inverse)
CONST SMARK AS UByte = 0
CONST SSHADOW AS UByte = 1
CONST SP2 AS UByte = 2
CONST SP1 AS UByte = 3
CONST SBALL AS UByte = 4

DIM tickPattern(4) AS UByte => {3, 2, 3, 2, 2}
DIM phase AS UByte
DIM lastDraw AS UByte
DIM pad AS UByte
DIM t AS UByte
DIM shownScore AS UInteger
DIM shownAnn AS UByte

' Hauteur de la balle à l'écran ($09C2), en pixels Spectrum
FUNCTION BallLift() AS UByte
    DIM l AS UInteger
    DIM y AS UByte
    l = WR(BZ)
    IF WR(BST) = 2 THEN l = l + (l >> 3)
    l = ((l * 6) >> 4) + 1
    y = BallYr()
    IF y < $C8 THEN
        IF l THEN l = l - 1
        IF (y < $A8) AND (l <> 0) THEN l = l - 1
        IF (y < $78) AND (l <> 0) THEN l = l - 1
    END IF
    RETURN (l * 15) >> 4
END FUNCTION

' Prépare les sprites (hors moment critique) : position et décalage
SUB PrepareAll()
    DIM bx AS UByte
    DIM by AS UByte
    DIM n AS UByte
    Project(RH(OP2 + FX), RH(OP2 + FY))
    SprPrepare(SP2, 20 + WR(OP2 + FFRAME), projX, projY)
    Project(RH(OP1 + FX), RH(OP1 + FY))
    SprPrepare(SP1, WR(OP1 + FFRAME), projX, projY)
    IF WR(BST) = 0 THEN
        SprHide(SBALL): SprHide(SSHADOW)
    ELSE
        Project(BallXr(), BallYr())
        bx = projX: by = projY
        SprPrepare(SSHADOW, 43, bx, by)
        IF WR(BZ) < $40 THEN
            n = 40
        ELSEIF WR(BZ) < $60 THEN
            n = 41
        ELSE
            n = 42
        END IF
        SprPrepare(SBALL, n, bx, CAST(Integer, by) - BallLift())
    END IF
    IF WR(BMARK) THEN
        Project(WR(BMARKY + 3), WR(BMARKY + 1))
        SprPrepare(SMARK, 44, projX, projY)
    ELSE
        SprHide(SMARK)
    END IF
END SUB

' Juste après l'interruption : effacer (ordre inverse) puis redessiner
SUB DrawAll()
    SprRestore(SBALL)
    SprRestore(SP1)
    SprRestore(SP2)
    SprRestore(SSHADOW)
    SprRestore(SMARK)
    SprDraw(SMARK)
    SprDraw(SSHADOW)
    SprDraw(SP2)
    SprDraw(SP1)
    SprDraw(SBALL)
END SUB

' Points : codes GB -> texte
FUNCTION PointText(p AS UByte, o AS UByte) AS String
    IF p >= 7 THEN RETURN STR(p - 7)
    IF p = 1 THEN RETURN "0"
    IF p = 2 THEN RETURN "15"
    IF p = 3 THEN RETURN "30"
    IF p = 4 THEN RETURN "40"
    IF p = 5 THEN RETURN "40"
    IF p = 6 THEN RETURN "AD"
    RETURN "40"
END FUNCTION

' Ligne de score (haut de l'écran) et annonces
SUB ShowScore()
    DIM key AS UInteger
    DIM s AS UByte
    DIM a AS UByte
    key = (CAST(UInteger, WR(WPTS1)) << 8) BOR WR(WPTS2)
    key = key BXOR (CAST(UInteger, WR(WGAMES1) + WR(WGAMES1 + 1) * 3 + WR(WGAMES1 + 2) * 9) << 4)
    key = key BXOR (CAST(UInteger, WR(WGAMES2) + WR(WGAMES2 + 1) * 3 + WR(WGAMES2 + 2) * 9) << 10)
    IF key <> shownScore THEN
        shownScore = key
        PRINT AT 0, 0; "VOUS ";
        FOR s = 0 TO 2
            PRINT WR(WGAMES1 + s); " ";
        NEXT s
        PRINT AT 0, 12; PointText(WR(WPTS1), WR(WPTS2)); "-"; PointText(WR(WPTS2), WR(WPTS1)); "   ";
        PRINT AT 0, 22; "CPU ";
        FOR s = 0 TO 2
            PRINT WR(WGAMES2 + s); " ";
        NEXT s
    END IF
    a = hram(HANN)
    IF (a BAND $40) = 0 THEN a = 0
    IF a <> shownAnn THEN
        shownAnn = a
        PRINT AT 1, 10; "            ";
        IF a THEN
            a = a BAND $0F
            IF a = 4 THEN
                PRINT AT 1, 13; "FAULT"
            ELSEIF a = 5 THEN
                PRINT AT 1, 14; "LET"
            ELSEIF a = 6 THEN
                PRINT AT 1, 14; "OUT"
            ELSEIF a = 1 THEN
                IF WR(WPTS1) = 5 AND WR(WPTS2) = 5 THEN
                    PRINT AT 1, 13; "DEUCE"
                ELSEIF WR(WPTS1) = 6 OR WR(WPTS2) = 6 THEN
                    PRINT AT 1, 11; "ADVANTAGE"
                END IF
            END IF
        END IF
    END IF
END SUB

' Un pas de jeu, dans l'ordre de $0680
SUB GameTick()
    MatchTick()
    PlayerTick(OP1, hram(HPAD1), hram(HPRS1))
    PlayerTick(OP2, hram(HPAD2), hram(HPRS2))
    BallTick()
    AiTick()
END SUB

' Menu : niveau et contrôles
SUB Menu()
    DIM k AS String
    BORDER 4: PAPER 4: INK 0: BRIGHT 1
    CLS
    PRINT AT 3, 13; "TENNIS"
    PRINT AT 5, 6; "d'apres Nintendo, 1989"
    PRINT AT 9, 6; "1-4 : niveau ("; WR(WLEVEL); ")"
    PRINT AT 11, 6; "K : clavier"
    PRINT AT 12, 6; "J : joystick Kempston"
    PRINT AT 15, 6; "Q A O P : deplacement"
    PRINT AT 16, 6; "ESPACE : coup   M : lob"
    PRINT AT 20, 6; "ENTREE : jouer"
    DO
        k = INKEY$
        IF k >= "1" AND k <= "4" THEN
            WW(WLEVEL, CODE(k) - 48)
            PRINT AT 9, 21; WR(WLEVEL)
        ELSEIF k = "k" OR k = "K" THEN
            useKempston = 0: PRINT AT 11, 4; ">": PRINT AT 12, 4; " "
        ELSEIF k = "j" OR k = "J" THEN
            useKempston = 1: PRINT AT 11, 4; " ": PRINT AT 12, 4; ">"
        END IF
        hram(HRNG) = hram(HRNG) + 1
    LOOP UNTIL k = CHR(13)
END SUB

' --- Programme principal ---------------------------------------------------
SprInit()
WW(WLEVEL, 1)

DO
    Menu()
    CLS
    DrawCourt()
    SprInit()
    shownScore = $FFFF: shownAnn = $FF
    NewMatch()
    lastDraw = PEEK FRAMES
    DO
        ' attendre 2 trames depuis la dernière image (le hasard tourne en attendant)
        DO
            Rand()
            ASM
                halt
            END ASM
        LOOP UNTIL CAST(UByte, PEEK FRAMES - lastDraw) >= 2
        lastDraw = PEEK FRAMES
        PROF(2)
        DrawAll()
        PROF(4)
        pad = ReadPad()
        PROF(1)
        FOR t = 1 TO tickPattern(phase)
            UpdatePad1(pad)
            GameTick()
        NEXT t
        PROF(3)
        phase = phase + 1: IF phase = 5 THEN phase = 0
        PrepareAll()
        PROF(5)
        ShowScore()
        PROF(4)
        IF sfxReq THEN SfxPlay(sfxReq): sfxReq = 0
    LOOP UNTIL (matchOver <> 0) AND (hram(HDELAY) = 0)
    IF matchOver = 6 THEN
        PRINT AT 11, 10; "VOUS GAGNEZ !"
    ELSE
        PRINT AT 11, 10; "LE CPU GAGNE"
    END IF
    PAUSE 150
LOOP
