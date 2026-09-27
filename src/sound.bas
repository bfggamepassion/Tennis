' ---------------------------------------------------------------------------
' Bruitages beeper (48K) : bips courts pour les sons GB ($3665)
'   3 rebond  4 mur  5 élan  6/7 frappe  $0C filet  $0D corps
'   $25 applaudissements  $29/$31 annonce du score
' Chaque son bloque le processeur quelques millisecondes seulement.
' ---------------------------------------------------------------------------

#ifndef SOUND_BAS
#define SOUND_BAS

DIM sndPeriod AS UByte
DIM sndLen AS UInteger

' Bip : sndLen demi-périodes de sndPeriod boucles, bordure verte conservée
SUB FASTCALL BeepAsm()
    ASM
        ld hl, (_sndLen)
        ld a, (_sndPeriod)
        ld c, a
        ld a, 4                 ; bordure verte, haut-parleur à 0
bp_loop:
        xor $10
        out ($FE), a
        ld b, c
bp_wait:
        djnz bp_wait
        dec hl
        ld d, a
        ld a, h
        or l
        ld a, d
        jr nz, bp_loop
        and $EF
        out ($FE), a
    END ASM
END SUB

' Bruit : demi-périodes aléatoires (applaudissements, filet)
SUB FASTCALL NoiseAsm()
    ASM
        ld hl, (_sndLen)
        ld de, 0
        ld a, 4
nz_loop:
        ld b, a
        ld a, (de)              ; octets de la ROM comme source de hasard
        and $1F
        or 1
        inc de
        ld c, a
        ld a, b
        xor $10
        out ($FE), a
        ld b, c
nz_wait:
        djnz nz_wait
        dec hl
        ld b, a
        ld a, h
        or l
        ld a, b
        jr nz, nz_loop
        and $EF
        out ($FE), a
    END ASM
END SUB

SUB SfxPlay(n AS UByte)
    DIM keep AS UInteger
    keep = @sndPeriod + @sndLen
    IF n = 3 THEN
        sndPeriod = 90: sndLen = 16: BeepAsm()
    ELSEIF n = 4 THEN
        sndPeriod = 120: sndLen = 10: BeepAsm()
    ELSEIF n = 5 THEN
        sndPeriod = 200: sndLen = 6: BeepAsm()
    ELSEIF n = 6 OR n = 7 THEN
        sndPeriod = 40: sndLen = 40: BeepAsm()
    ELSEIF n = $0C THEN
        sndLen = 40: NoiseAsm()
    ELSEIF n = $0D THEN
        sndPeriod = 150: sndLen = 20: BeepAsm()
    ELSEIF n = $25 THEN
        sndLen = 250: NoiseAsm()
    ELSEIF n = $29 OR n = $31 THEN
        sndPeriod = 60: sndLen = 30: BeepAsm()
    END IF
END SUB

#endif
