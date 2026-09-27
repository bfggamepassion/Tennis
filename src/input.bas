' ---------------------------------------------------------------------------
' Entrées : clavier + joystick Kempston -> joypad virtuel GB ($FF9A/$FF9B)
'
' Clavier : Q haut, A bas, O gauche, P droite, ESPACE = bouton A (coup),
'           M = bouton B (lob), ENTRÉE = Start.
' Kempston (port $1F) : directions, feu = A, feu 2 = B.
' Octet GB : bit0 A, bit1 B, bit3 Start, bit4 droite, bit5 gauche, bit6 haut, bit7 bas.
' ---------------------------------------------------------------------------

#ifndef INPUT_BAS
#define INPUT_BAS

#include "gbram.bas"

DIM useKempston AS UByte

' Lit clavier et joystick, renvoie l'octet joypad GB (directions opposées annulées, $2225)
FUNCTION ReadPad() AS UByte
    DIM p AS UByte
    DIM k AS UByte
    p = 0
    k = IN $FBFE                            ' Q W E R T
    IF (k BAND 1) = 0 THEN p = p BOR PADU
    k = IN $FDFE                            ' A S D F G
    IF (k BAND 1) = 0 THEN p = p BOR PADD
    k = IN $DFFE                            ' P O I U Y
    IF (k BAND 1) = 0 THEN p = p BOR PADR
    IF (k BAND 2) = 0 THEN p = p BOR PADL
    k = IN $7FFE                            ' ESPACE SYM M N B
    IF (k BAND 1) = 0 THEN p = p BOR PADA
    IF (k BAND 4) = 0 THEN p = p BOR PADB
    k = IN $BFFE                            ' ENTRÉE L K J H
    IF (k BAND 1) = 0 THEN p = p BOR 8
    IF useKempston THEN
        k = IN $1F
        IF k BAND 1 THEN p = p BOR PADR
        IF k BAND 2 THEN p = p BOR PADL
        IF k BAND 4 THEN p = p BOR PADD
        IF k BAND 8 THEN p = p BOR PADU
        IF k BAND 16 THEN p = p BOR PADA
        IF k BAND 32 THEN p = p BOR PADB
    END IF
    IF (p BAND $C0) = $C0 THEN p = p BAND $3F
    IF (p BAND $30) = $30 THEN p = p BAND $CF
    RETURN p
END FUNCTION

' Met à jour $FF9A (maintenu) et $FF9B (nouvellement pressé), comme $21ED
SUB UpdatePad1(p AS UByte)
    hram(HPRS1) = (hram(HPAD1) BXOR p) BAND p
    hram(HPAD1) = p
END SUB

#endif
