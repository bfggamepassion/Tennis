' ---------------------------------------------------------------------------
' RAM du Game Boy reproduite, pour traduire les routines adresse par adresse.
'   wram(n) = $C000+n     hram(n) = $FF80+n
' Les valeurs 16 bits sont en petit-boutiste, comme sur GB et sur Z80 :
'   PEEK(UInteger, @wram(n)) lit $C0nn/$C0nn+1.
' ---------------------------------------------------------------------------

#ifndef GBRAM_BAS
#define GBRAM_BAS

DIM wram(255) AS UByte
DIM hram(127) AS UByte

' Objets (cf. re/FICHE_JEU.md §6-7)
CONST OP1 AS UByte = $00          ' joueur 1 (bas)   $C000
CONST OP2 AS UByte = $20          ' joueur 2 (haut)  $C020
CONST OBALL AS UByte = $40        ' balle            $C040

' Champs d'un joueur (décalages)
CONST FSTATE AS UByte = $00
CONST FFRAME AS UByte = $01
CONST FY AS UByte = $02           ' 16 bits (8.8)
CONST FX AS UByte = $04           ' 16 bits (8.8)
CONST FSPDX AS UByte = $08
CONST FSPDY AS UByte = $09
CONST FSHOT AS UByte = $0A
CONST FZONE AS UByte = $0B
CONST FCNT0 AS UByte = $10
CONST FCNT1 AS UByte = $11
CONST FBTN AS UByte = $13

' HRAM utilisée (décalage depuis $FF80)
CONST HPAD1 AS UByte = $1A        ' $FF9A touches maintenues J1
CONST HPRS1 AS UByte = $1B        ' $FF9B touches pressées J1
CONST HPAD2 AS UByte = $1C        ' $FF9C J2 (IA)
CONST HPRS2 AS UByte = $1D        ' $FF9D
CONST HOPT AS UByte = $16         ' $FF96 options (bit 7 = traitement J2)
CONST HSIDE AS UByte = $11        ' $FF91 côté / service

' Bits du joypad GB
CONST PADA AS UByte = $01
CONST PADB AS UByte = $02
CONST PADR AS UByte = $10
CONST PADL AS UByte = $20
CONST PADU AS UByte = $40
CONST PADD AS UByte = $80

' Accès rapides (macros) : un indice variable dans wram() passe par la routine
' générique __ARRAY de Boriel (~300 T) ; PEEK(@wram(0) + x) est direct.
' Noms de paramètres volontairement exotiques : le préprocesseur de Boriel
' re-substitue les paramètres dans les arguments (SW(a, x) avec un
' paramètre nommé x donnait une valeur fausse).
#define WR(pAdr__) PEEK(@wram(0) + (pAdr__))
#define WW(pAdr__, pVal__) POKE @wram(0) + (pAdr__), pVal__
#define GW(pAdr__) PEEK(UInteger, @wram(0) + (pAdr__))
#define SW(pAdr__, pVal__) POKE UInteger @wram(0) + (pAdr__), pVal__
' Octet haut arrondi d'une valeur 8.8 (routines $0885-$08BC) : (v + $80) >> 8
#define RH(pAdr__) ((PEEK(UInteger, @wram(0) + (pAdr__)) + $80) >> 8)

' Lecture indexée d'une table "rst $18" de la ROM : db N puis N octets.
' Les tables utiles sont recopiées dans les DATA du fichier concerné.

#endif
