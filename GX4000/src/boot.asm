; ===========================================================================
; boot.asm - page 0 de la cartouche (vue en $0000 à la mise sous tension)
;
; Déverrouille l'ASIC, recopie le programme en RAM (page 1 -> $0000-$3FFF,
; page 2 -> $8000-$BFFF), puis saute en RAM (BOOT2, dans la page 2) qui
; coupe les ROM et lance le jeu. Les écritures vont toujours en RAM, même
; sous une ROM visible : on peut remplir $0000-$3FFF en exécutant la ROM.
; Assemblé avec -DBOOT2=adresse (tirée des symboles du programme).
; ===========================================================================
        DEVICE NOSLOT64K
        ORG $0000
        di
        ld sp,$7FF0                 ; pile provisoire (futur écran)
        ld hl,unlock                ; déverrouillage de l'ASIC (17 octets vers le CRTC)
        ld b,$BC
        ld e,17
.u:
        ld c,(hl)
        out (c),c
        inc hl
        dec e
        jr nz,.u
        ld bc,$7F00 + %10000001     ; mode 1, ROM basse (nous) et ROM haute visibles
        out (c),c
        ld bc,$DF81                 ; ROM haute = page 1 de la cartouche
        out (c),c
        ld hl,$C000
        ld de,$0000
        ld bc,$4000
        ldir
        ld bc,$DF82                 ; page 2
        out (c),c
        ld hl,$C000
        ld de,$8000
        ld bc,$4000
        ldir
        jp BOOT2
unlock: db $FF, $00, $FF, $77, $B3, $51, $A8, $D4, $62, $39, $9C, $46, $2B, $15, $8A, $CD, $EE
boot_end:
        SAVEBIN "../build/page0.bin", 0, boot_end
