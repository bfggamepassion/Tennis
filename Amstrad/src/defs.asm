; ===========================================================================
; defs.asm - carte mémoire du CPC664 et variables GB lues par le code CPC
;
; La logique du jeu est la ROM Game Boy traduite en Z80 (gb/gb_logic.asm,
; la même que pour le Spectrum) : elle travaille sur la RAM GB à ses
; adresses d'origine, que le CPC réserve (l'écran est déplacé en $4000).
; ===========================================================================

; --- Carte mémoire -------------------------------------------------------------
;   $0000-$003F  vecteurs (IM 1 : saut en $0038), $0100-$01FF pile
;   $0200-$3FFF  programme (partie A), chargé par RUN"TENNIS"
;   $4000-$7FFF  écran (mode 1). Dans le fichier : bloc déplacé au démarrage
;                vers $C100 (données, avant que l'écran n'occupe la place)
;   $8000-$A5FF  programme (partie B) ; $A600-$BFFF libre une fois le
;                firmware coupé (tampons des sprites)
;   $C000-$C0FF  RAM GB ; $C100-$DCFF bloc déplacé ; $DD00 son GB ;
;   $FF80-$FFFE  HRAM GB
LOAD_ADDR   equ $0200
SCREEN      equ $4000
RELOC       equ $C100
RELOC_END   equ $DD00
GB_WRAM     equ $C000
GB_SNDRAM   equ $DD00
GB_HRAM     equ $FF80
BUFFERS     equ $A600           ; tampons (après le démarrage)

; --- Variables GB utilisées par le code Spectrum -----------------------------
P1_STATE    equ $C000           ; joueur 1 : état, image, Y (8.8), X (8.8)
P1_FRAME    equ $C001
P1_Y        equ $C002
P1_X        equ $C004
P2_STATE    equ $C020
P2_FRAME    equ $C021
P2_Y        equ $C022
P2_X        equ $C024
B_ST        equ $C040           ; balle : état, Y, X, hauteur
B_Y         equ $C042
B_X         equ $C044
B_Z         equ $C047
B_MARK      equ $C060           ; marque de rebond : délai, position
B_MARKY     equ $C062
B_MARKX     equ $C064
W_PTS1      equ $C0DD           ; points (codes GB)
W_PTS2      equ $C0DE
W_LEVEL     equ $C0DF           ; niveau 1-4
W_GAMES1    equ $C0E0           ; jeux par set
W_GAMES2    equ $C0E3

H_SCREEN    equ $FF8A           ; écran GB (3 = court, $0A = fin de match)
H_OPT       equ $FF96           ; options
H_PAD1      equ $FF9A           ; joypad J1 : maintenu / pressé
H_PRS1      equ $FF9B
H_PADPREV   equ $FF9E           ; joypad précédent ($21ED)
H_RNG       equ $FFA4           ; hasard
H_HIT       equ $FFAD           ; bit 7 = c'est au joueur 2 de frapper
H_SETS      equ $FFC4
H_ANN       equ $FFC2           ; annonce ($C1 score, $C4 faute, $C5 let, $C6 dehors)
H_DEMO      equ $FFAF           ; bit 7 = mode démo (toujours 0 ici)

; --- Joypad GB --------------------------------------------------------------
PAD_A       equ $01
PAD_B       equ $02
PAD_START   equ $08
PAD_R       equ $10
PAD_L       equ $20
PAD_U       equ $40
PAD_D       equ $80


; --- Matériel du CPC -----------------------------------------------------------
GA          equ $7F             ; Gate Array : encres, mode, ROM (OUT ($7Fxx))
GA_MODE1    equ %10001101       ; mode 1, ROM basse et haute coupées
GA_MODE1_LROM equ %10001001     ; mode 1, ROM basse visible (police)
