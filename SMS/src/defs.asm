; ===========================================================================
; defs.asm - carte mémoire de la Master System, variables GB, VDP
;
; La logique du jeu est la ROM Game Boy traduite en Z80 (gb/gb_logic.asm).
; La RAM de la Master System (8 Ko en $C000-$DFFF) est à la même place que la
; RAM de travail du GB : $C000-$C0FF et $DD00 gardent leurs adresses. Seule
; la HRAM est déplacée par le traducteur (port_config.py, RAM_MAP) :
;   GB $FF80-$FFFE -> $DE00
; ===========================================================================

; --- Carte mémoire -------------------------------------------------------------
;   $0000-$7FFF  cartouche, pages 0 et 1 (fixes) : code, logique, décor
;   $8000-$BFFF  page 2 : motifs des sprites (page 3 : tuiles du stade et du titre,
;                le temps de les copier, écran éteint)
;   $C000-$C0FF  RAM GB ($C000)
;   $C100-...    variables (vars.asm)
;   $DD00        son GB ($DD00)
;   $DE00-$DE7F  HRAM GB ($FF80)
;   ... -$DFEF   pile
;   $FFFC-$FFFF  registres de pages de la cartouche (mapper Sega)
GB_WRAM     equ $C000
GB_HRAM     equ $DE00
GB_SNDRAM   equ $DD00
STACK_TOP   equ $DFF0

MAPPER_SLOT2 equ $FFFF          ; page visible en $8000-$BFFF
SPR_BANK0   equ 2               ; page des motifs des sprites
GFX_BANK    equ 3               ; page des tuiles du stade et du titre

; --- Variables GB utilisées par le code Master System ----------------------------
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
B_VX        equ $C050           ; vitesse latérale (signe-module)
B_VZ        equ $C052           ; vitesse de montée
B_MARK      equ $C060           ; marque de rebond : délai, position
B_MARKY     equ $C062
B_MARKX     equ $C064
P1_ZONE     equ $C00B           ; zones calculées par la ROM ($09FA)
P2_ZONE     equ $C02B
W_PTS1      equ $C0DD           ; points (codes GB)
W_PTS2      equ $C0DE
W_LEVEL     equ $C0DF           ; niveau 1-4
W_GAMES1    equ $C0E0           ; jeux par set
W_GAMES2    equ $C0E3

H_SCREEN    equ $DE0A           ; écran GB ($FF8A : 3 = court, $0A = fin de match)
H_SIDE95    equ $DE15
H_OPT       equ $DE16           ; options
H_PAD98     equ $DE18
H_PRS99     equ $DE19
H_PAD1      equ $DE1A           ; joypad J1 : maintenu / pressé
H_PRS1      equ $DE1B
H_PADPREV   equ $DE1E           ; joypad précédent ($21ED)
H_RNG       equ $DE24           ; hasard
H_HIT       equ $DE2D           ; bit 7 = c'est au joueur 2 de frapper
H_SETS      equ $DE44
H_ANN       equ $DE42           ; annonce ($C1 score, $C4 faute, $C5 let, $C6 dehors)

; --- Joypad GB --------------------------------------------------------------
PAD_A       equ $01
PAD_B       equ $02
PAD_START   equ $08
PAD_R       equ $10
PAD_L       equ $20
PAD_U       equ $40
PAD_D       equ $80

; --- VDP (mode 4) ------------------------------------------------------------------
VDP_DATA    equ $BE
VDP_CTRL    equ $BF
VCOUNTER    equ $7E
; VRAM
VR_TILES    equ $0000           ; tuiles 0-447 (32 octets chacune)
VR_SPR      equ $2000           ; tuiles 256-... : motifs des sprites (registre 6)
VR_FONT     equ $3000           ; tuiles 384-447 : police (codes 32-95)
VR_NAME     equ $3800           ; carte 32x28 (mots)
VR_SAT      equ $3F00           ; attributs des sprites : 64 Y, puis X/tuile en $3F80
FONT_TILE   equ 384
; registre 1 : sprites 8x16 (bit 1), + écran allumé (bit 6), + interruption de trame (bit 5)
R1_OFF      equ $82
R1_ON_IRQ   equ $E2

; --- Son SN76489 -----------------------------------------------------------------
PSG         equ $7F

; --- Manettes ---------------------------------------------------------------------
PORT_AB     equ $DC             ; manette 1 : bits 0-3 haut bas gauche droite,
                                ; bit 4 bouton 1, bit 5 bouton 2 (0 = appuyé)
