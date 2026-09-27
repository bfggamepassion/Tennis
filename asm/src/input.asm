; ===========================================================================
; input.asm - clavier + joystick Kempston -> octet joypad GB
;   Clavier : Q haut, A bas, O gauche, P droite, ESPACE = feu
;   Kempston (port $1F) : directions, feu
;   Octet GB : bit0 A, bit1 B, bit3 Start, bit4 droite, bit5 gauche,
;              bit6 haut, bit7 bas. Directions opposées annulées ($2225).
;
; Un seul bouton. Lob automatique : quand l'adversaire est au filet (zone
; « carré de service » calculée par la ROM, $C02B) et que le joueur n'y est
; pas lui-même ($C00B), le feu devient le bouton B du GB (lob). Sinon, et
; toujours au service, c'est le bouton A (coup normal).
; ===========================================================================

use_kempston:   db 0

; Sortie : A = joypad GB
read_pad:
        ld c,0
        ld a,$FB                    ; Q W E R T
        in a,($FE)
        rra
        jr c,.nq
        set 6,c
.nq:
        ld a,$FD                    ; A S D F G
        in a,($FE)
        rra
        jr c,.na
        set 7,c
.na:
        ld a,$DF                    ; P O I U Y
        in a,($FE)
        rra
        jr c,.np
        set 4,c
.np:
        rra
        jr c,.no
        set 5,c
.no:
        ld a,$7F                    ; ESPACE SYM M N B
        in a,($FE)
        rra
        jr c,.nsp
        set 0,c
.nsp:
        ld a,(use_kempston)
        or a
        jr z,.cancel
        in a,($1F)
        rra
        jr nc,.kr
        set 4,c
.kr:
        rra
        jr nc,.kl
        set 5,c
.kl:
        rra
        jr nc,.kd
        set 7,c
.kd:
        rra
        jr nc,.ku
        set 6,c
.ku:
        rra
        jr nc,.cancel
        set 0,c
.cancel:
        ld a,c
        and $C0
        cp $C0
        jr nz,.v
        ld a,c
        and $3F
        ld c,a
.v:
        ld a,c
        and $30
        cp $30
        jr nz,.h
        ld a,c
        and $CF
        ld c,a
.h:
        ld a,c
        ret

fire_mode:  db 0                     ; appui en cours : 0 aucun, 1 bouton A, 2 bouton B

P1_ZONE     equ $C00B               ; zones calculées par la ROM ($09FA)
P2_ZONE     equ $C02B
ZONE_NET    equ $0C                 ; carré de service (près du filet)

; A = joypad brut (feu en bit 0) -> A = joypad GB (feu converti en A ou B).
; Le choix est fait à l'appui et tenu jusqu'au relâchement.
apply_fire:
        ld c,a
        and PAD_A
        jr nz,.held
        xor a                       ; relâché
        ld (fire_mode),a
        ld a,c
        ret
.held:
        ld a,(fire_mode)
        or a
        jr nz,.out
        ld b,1                      ; nouvel appui : coup normal par défaut
        ld a,(P1_STATE)
        cp 1                        ; en échange seulement (pas au service)
        jr nz,.set
        ld a,(P2_ZONE)
        and ZONE_NET
        cp ZONE_NET
        jr nz,.set                  ; adversaire pas au filet
        ld a,(P1_ZONE)
        and ZONE_NET
        cp ZONE_NET
        jr z,.set                   ; joueur lui-même au filet
        ld b,2                      ; lob
.set:
        ld a,b
        ld (fire_mode),a
.out:
        ld b,a
        ld a,c
        and $FC                     ; directions seules
        dec b
        jr nz,.lob
        or PAD_A
        ret
.lob:
        or PAD_B
        ret

; Menu : renvoie A = code de la touche pressée (0 si aucune)
;   '1'-'4', 'K', 'J', 'S', 13 (ENTRÉE)
read_menu_key:
        ld a,$F7                    ; 1 2 3 4 5
        in a,($FE)
        ld b,'1'
        ld c,4
.digits:
        rra
        jr nc,.got
        inc b
        dec c
        jr nz,.digits
        ld a,$BF                    ; ENTRÉE L K J H
        in a,($FE)
        rra
        ld b,13
        jr nc,.got
        rra
        rra
        ld b,'K'
        jr nc,.got
        rra
        ld b,'J'
        jr nc,.got
        ld a,$FD                    ; A S D F G
        in a,($FE)
        rra
        rra
        ld b,'S'
        jr nc,.got
        xor a
        ret
.got:
        ld a,b
        ret
