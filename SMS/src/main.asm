; ===========================================================================
; Master Tennis - portage Sega Master System du Tennis Game Boy (Nintendo, 1989)
; Assembleur : sjasmplus. La logique du jeu est la ROM GB traduite en Z80
; (gb/gb_logic.asm, comme pour le Spectrum, le CPC et la ColecoVision).
;
; Écran : mode 4 du VDP (256x192, 16 couleurs par tuile). Le stade GB fait
; 256 pixels de large : il remplit l'écran (rangées GB 2 à 25), mis en couleurs.
; Sprites 8x16 en 16 couleurs. Manette : bouton 1 = frapper, bouton 2 = lob.
; Bouton Pause de la console : pause.
; Cadence : un pas de logique GB par trame à 60 Hz (59,7 Hz sur GB) ; à 50 Hz,
; un pas de plus toutes les 5 trames (le jeu garde sa vitesse).
;
; Règle du VDP : la mémoire vidéo n'est modifiée que
;   - écran éteint et interruptions coupées (dessin du décor, du titre) ;
;   - dans l'interruption de trame, pendant le retour de trame, à partir de ce
;     que la boucle principale a préparé en RAM (frame_ready).
; tools/smssim.py le vérifie à chaque accès.
;
; Cartouche de 64 Ko (mapper Sega) :
;   pages 0-1 : code, logique, cartes ; page 2 : motifs des sprites ;
;   page 3 : tuiles du stade et du titre.
; ===========================================================================

        DEVICE NOSLOT64K
        INCLUDE "defs.asm"
        INCLUDE "vars.asm"

; =====================================================================================
; Pages 0 et 1 : $0000-$7FFF
; =====================================================================================
        ORG $0000
        di
        im 1
        ld sp,STACK_TOP
        jp start

        ORG $0038                   ; interruption du VDP (IM 1)
        jp irq

        ORG $0066                   ; NMI : bouton Pause
        push af
        ld a,(paused)
        xor 1
        ld (paused),a
        pop af
        retn

start:
        xor a                       ; pages de la cartouche : 0, 1, 2
        ld ($FFFC),a
        ld ($FFFD),a
        inc a
        ld ($FFFE),a
        ld a,SPR_BANK0
        ld (MAPPER_SLOT2),a
        ld hl,$C000                 ; RAM à zéro (sauf le haut de la pile)
        ld de,$C001
        ld bc,STACK_TOP - $C000 - 16
        ld (hl),0
        ldir
        call vdp_init
        call sound_init
        call detect_pal
        ld a,1
        ld (W_LEVEL),a
        ld a,3
        ld (sets),a
.loop:
        IFNDEF AUTOPLAY
        call menu
        ENDIF
        call play_match
        jr .loop

; --- Interruption de trame --------------------------------------------------------
; Lit l'état du VDP (acquittement), compte la trame, puis envoie ce que la
; boucle principale a préparé. La boucle principale ne touche au VDP
; qu'interruptions coupées : l'interruption ne coupe jamais une écriture
; d'adresse (deux octets sur le port de contrôle).
irq:
        push af
        push hl
        in a,(VDP_CTRL)             ; acquittement
        ld hl,frames
        inc (hl)
        ld a,(frame_ready)
        or a
        jr z,.out
        push bc
        push de
        call vblank_update
        pop de
        pop bc
        xor a
        ld (frame_ready),a
.out:
        pop hl
        pop af
        ei
        reti

; Attend la prochaine trame, en faisant tourner le hasard du jeu (comme la
; boucle principale du GB, qui appelle $00A9 en attendant l'interruption).
wait_frame:
        ld a,(frames)
        ld (wn_last),a
.w:
        call G_00A9
        ld a,(wn_last)
        ld b,a
        ld a,(frames)
        cp b
        jr z,.w
        ret

; 50 ou 60 Hz : durée d'une trame, mesurée par une boucle de 35 cycles
; (60 Hz : ~1 700 tours ; 50 Hz : ~2 030). Écran allumé, interruptions en marche.
PAL_LOOPS   equ 1870

detect_pal:
        call screen_on
        call .sync
        ld hl,0
        ld a,(frames)
        ld b,a
.l:
        inc hl                      ; 6
        ld a,(frames)               ; 13
        cp b                        ; 4
        jr z,.l                     ; 12
        ld de,PAL_LOOPS
        or a
        sbc hl,de
        ld a,0
        jr c,.ntsc
        inc a
.ntsc:
        ld (is_pal),a
        jp screen_off
.sync:
        ld a,(frames)
        ld b,a
.s:
        ld a,(frames)
        cp b
        jr z,.s
        ret

; --- Match -------------------------------------------------------------------------

play_match:
        call court_screen
        call gb_new_match
        call spr_reset
        xor a
        ld (paused),a
        ld (was_paused),a
        ld (pal_acc),a
        call show_score_force
        ld a,(frames)
        ld (last_frame),a
.frame:
        call wait_frame
        ld a,(frames)               ; pas de logique : un par trame écoulée
        ld hl,last_frame
        sub (hl)
        ld c,a
        ld a,(frames)
        ld (hl),a
        ld a,(is_pal)               ; 50 Hz : un pas de plus toutes les 5 trames
        or a
        jr z,.hz
        ld a,(pal_acc)
        add a,c
.acc:
        cp 5
        jr c,.accd
        sub 5
        inc c
        jr .acc
.accd:
        ld (pal_acc),a
.hz:
        ld a,c
        cp 5                        ; au plus 4 pas rattrapés
        jr c,.lag
        ld a,4
.lag:
        ld (ticks_due),a
        call check_pause
        jr z,.run
        xor a                       ; en pause : ni logique ni son
        ld (ticks_due),a
.run:
        IFDEF AUTOPLAY
        ld a,(ticks_due)
        cp 2                        ; test : trames en retard
        jr c,.ontime
        ld hl,(lag_count)
        inc hl
        ld (lag_count),hl
.ontime:
        call bot_pad
        ELSE
        call read_pad
        ENDIF
        ld (pad_now),a
.tick:
        ld a,(ticks_due)
        or a
        jr z,.ticked
        dec a
        ld (ticks_due),a
        ld a,(pad_now)
        call gb_set_pad
        call gb_tick
        jr .tick
.ticked:
        call prepare_all
        ld a,(paused)
        or a
        call z,show_score
        IFDEF AUTOPLAY
        call show_lag
        ENDIF
        ld a,1                      ; tout est prêt pour la prochaine trame
        ld (frame_ready),a
        ld a,(paused)
        or a
        call z,play_sfx
        ld a,(match_over)
        or a
        jr z,.frame
        ; fin du match
        call wait_frame
        ld a,(H_SETS)
        bit 7,a
        ld hl,txt_win
        jr z,.w
        ld hl,txt_lose
.w:
        call announce
        ld a,1
        ld (frame_ready),a
        ld b,180
.p:
        push bc
        call wait_frame
        call play_sfx
        pop bc
        djnz .p
        jp sound_off

; Pause : affiche ou efface l'annonce quand l'état change. Sortie : NZ en pause.
check_pause:
        ld a,(paused)
        ld hl,was_paused
        cp (hl)
        jr z,.same
        ld (hl),a
        or a
        jr z,.resume
        call sound_off
        ld hl,txt_pause
        call announce
        jr .same
.resume:
        ld a,$FF                    ; l'annonce du jeu sera réécrite (show_ann)
        ld (shown_ann),a
.same:
        ld a,(paused)
        or a
        ret

txt_win:   db "YOU WIN!",0
txt_lose:  db "CPU WINS",0
txt_pause: db " PAUSE ",0

        IFDEF AUTOPLAY
; Test : trames en retard / 256 trames, dans le cadre du score
show_lag:
        ld hl,(total_count)
        inc hl
        ld (total_count),hl
        ld a,l                      ; affiché toutes les 64 trames seulement
        and 63
        ret nz
        ld hl,ann_buf
        ld (sb_ptr),hl
        ld a,(lag_count+1)
        call sb_num2
        ld a,'/'
        call sb_char
        ld a,(total_count+1)
        call sb_num2
        ld hl,VR_NAME + (32 + 8) * 2
        ld de,ann_buf
        ld b,10
        jp add_job
        INCLUDE "autoplay.asm"
        ENDIF

        INCLUDE "vdp.asm"
        INCLUDE "gb_support.asm"
        INCLUDE "render.asm"
        INCLUDE "proj.asm"
        INCLUDE "input.asm"
        INCLUDE "text.asm"
        INCLUDE "sound.asm"
        IFNDEF AUTOPLAY
        INCLUDE "menu.asm"
        ENDIF
        INCLUDE "../gfx/court_map.asm"
        INCLUDE "../gfx/font.asm"
        INCLUDE "../gfx/sprites.asm"
        INCLUDE "../gb/gb_logic.asm"
code_end:
        ASSERT code_end <= $7FF0, "pages 0-1 pleines"
        DISPLAY "pages 0-1 : ", /D, code_end, " octets sur 32752"

; En-tête de la cartouche (lu par le BIOS de la Master System). La somme de
; contrôle est calculée par tools/make_rom.py.
        ORG $7FF0
        db "TMR SEGA"
        dw 0                        ; réservé
        dw 0                        ; somme de contrôle ($0000-$7FEF)
        db $26, $19                 ; code produit (BCD)
        db $00                      ; version
        db $4C                      ; Master System export, somme sur 32 Ko
        SAVEBIN "../build/page01.bin", $0000, $8000

; =====================================================================================
; Page 2 : motifs des sprites
; =====================================================================================
        ORG $8000
        INCLUDE "../gfx/sprites_bank0.asm"
bank2_end:
        ASSERT bank2_end <= $C000, "page 2 pleine"
        DISPLAY "page 2 : ", /D, bank2_end - $8000, " octets sur 16384"
        SAVEBIN "../build/page2.bin", $8000, $4000

; =====================================================================================
; Page 3 : tuiles du stade et du titre
; =====================================================================================
        ORG $8000
        INCLUDE "../gfx/court.asm"
        IFNDEF AUTOPLAY
        INCLUDE "../gfx/title.asm"
        ENDIF
bank3_end:
        ASSERT bank3_end <= $C000, "page 3 pleine"
        DISPLAY "page 3 : ", /D, bank3_end - $8000, " octets sur 16384"
        SAVEBIN "../build/page3.bin", $8000, $4000
