; ===========================================================================
; defs.asm - constantes : carte mémoire, variables GB lues par l'affichage
;
; La logique du jeu est la ROM Game Boy traduite (gb/gb_logic.asm) : elle
; travaille sur la RAM GB à ses adresses d'origine, que le Spectrum réserve.
; Les noms ci-dessous ne servent qu'au code Spectrum (affichage, entrées).
; ===========================================================================

; --- Carte mémoire (48K) ----------------------------------------------------
SCREEN      equ $4000
ATTRS       equ $5800
CODE_START  equ $6000           ; zone lente : démarrage, menu, décor (pile en dessous)
HOT_START   equ $8000           ; zone rapide : boucle de jeu, logique, affichage
GFX_START   equ $E000           ; graphismes des sprites
GB_WRAM     equ $C000           ; RAM GB $C000-$C0FF (objets, match)
SPRMEM      equ $D400           ; caches et tampons des sprites (1104 octets)
GB_SNDRAM   equ $DD00           ; état du son GB (testé par $1F42)
IM2_ISR     equ $FDFD           ; routine d'interruption (saut)
IM2_TABLE   equ $FE00           ; table IM2 : 257 x $FD
GB_HRAM     equ $FF80           ; HRAM GB $FF80-$FFFE

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

; --- Sprites -----------------------------------------------------------------
S_MARK      equ 0               ; emplacements (restaurés en ordre inverse)
S_SHADOW    equ 1
S_P2        equ 2
S_P1        equ 3
S_BALL      equ 4
NSLOTS      equ 5

SPR_P1      equ 0               ; numéros de sprites (gfx/sprites.asm)
SPR_P2      equ 20
SPR_BALL    equ 40
SPR_SHADOW  equ 43
SPR_MARK    equ 44

; --- Couleurs ------------------------------------------------------------------
BORDER_COL  equ 4               ; vert
ATTR_COURT  equ %01100000       ; BRIGHT 1, PAPER 4 (vert), INK 0 (noir)
