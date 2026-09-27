' ---------------------------------------------------------------------------
' Moteur de sprites logiciels masqués, en deux temps :
'   1. SprPrepare (pendant la logique, sans contrainte de temps) : calcule la
'      position et, si l'image ou le décalage change, décale le sprite au
'      pixel près dans le cache de son emplacement (slot).
'   2. Juste après l'interruption : SprRestore de tous les slots (ordre
'      inverse) puis SprDraw de chacun. Boucles déroulées : sauvegarde du fond
'      et dessin masqué en une passe (49 T/octet), restauration par LDI.
' Sprites : voir gfx_sprites.bas (masque + dessin, point d'ancrage = pieds).
' Emplacements 2 et 3 : joueurs (grands). 0, 1, 4 : petits (balle, ombre...).
' ---------------------------------------------------------------------------

#ifndef SPRITE_BAS
#define SPRITE_BAS

#include "gfx_sprites.bas"

CONST NSLOTS AS UByte = 5
CONST BIGSAVE AS UInteger = 200      ' 2 + 32 lignes x (2 + 4 octets)
CONST BIGCACHE AS UInteger = 256     ' 32 lignes x 4 paires (masque, dessin)
CONST SMALLSAVE AS UInteger = 32     ' 2 + 7 lignes x (2 + 2 octets)
CONST SMALLCACHE AS UInteger = 32    ' 8 lignes x 2 paires

' État des slots : bloc de 16 octets par slot dans SlotTab (assembleur)
'   +0 affiché  +1 sprite  +2 décalage  +3 largeur+1  +4 hauteur  +5 colonne
'   +6 haut (16 bits signé)  +8 cache (16 bits)  +10 tampon de sauvegarde (16 bits)
CONST STON AS UByte = 0
CONST STN AS UByte = 1
CONST STSH AS UByte = 2
CONST STW1 AS UByte = 3
CONST STH AS UByte = 4
CONST STCOL AS UByte = 5
CONST STTOP AS UByte = 6
CONST STCACHE AS UByte = 8
CONST STBUF AS UByte = 10

DIM slotBig(4) AS UByte => {0, 0, 1, 1, 0}

' Paramètres passés aux routines assembleur
DIM sprL AS UByte          ' décalage (0-7) pour SprShiftAsm
DIM sprW AS UByte          ' largeur source (octets)
DIM sprH AS UByte          ' hauteur en lignes
DIM sprData AS UInteger    ' données source
DIM sprBuf AS UInteger     ' cache destination

' Adresse des données du sprite n
FUNCTION FASTCALL SprAddr(n AS UByte) AS UInteger
    ASM
        ld l, a
        ld h, 0
        add hl, hl
        ld de, SprTable
        add hl, de
        ld a, (hl)
        inc hl
        ld h, (hl)
        ld l, a
    END ASM
END FUNCTION

FUNCTION FASTCALL SlotBase(slot AS UByte) AS UInteger
    ASM
        add a, a
        add a, a
        add a, a
        add a, a
        ld l, a
        ld h, 0
        ld de, SlotTab
        add hl, de
    END ASM
END FUNCTION

FUNCTION FASTCALL SprMemAddr() AS UInteger
    ASM
        ld hl, SprMem
    END ASM
END FUNCTION

SUB SprInit()
    DIM i AS UByte
    DIM b AS UInteger
    DIM m AS UInteger
    ' Référence les paramètres lus seulement en assembleur (sinon l'optimiseur les supprime)
    sprData = @sprL + @sprW + @sprH + @sprBuf + @sprData
    SpriteDataKeep()
    SprCores()
    SprMakeTables()
    m = SprMemAddr()
    FOR i = 0 TO NSLOTS - 1
        b = SlotBase(i)
        POKE b + STON, 0
        POKE b + STN, $FF
        POKE UInteger b + STCACHE, m
        IF slotBig(i) THEN m = m + BIGCACHE ELSE m = m + SMALLCACHE
        POKE UInteger b + STBUF, m
        POKE m, 0
        IF slotBig(i) THEN m = m + BIGSAVE ELSE m = m + SMALLSAVE
    NEXT i
END SUB

' Prépare le sprite n au point d'ancrage (x, y) dans le slot donné.
' Sans contrainte de temps : à appeler pendant la logique.
SUB SprPrepare(slot AS UByte, n AS UByte, x AS UByte, y AS Integer)
    DIM p AS UInteger
    DIM b AS UInteger
    DIM xo AS Integer
    DIM yo AS Integer
    DIM left AS Integer
    DIM maxL AS Integer
    DIM w AS UByte
    DIM sh AS UByte
    b = SlotBase(slot)
    p = SprAddr(n)
    w = PEEK p
    xo = PEEK (p + 2): IF xo > 127 THEN xo = xo - 256
    yo = PEEK (p + 3): IF yo > 127 THEN yo = yo - 256
    left = CAST(Integer, x) + xo
    maxL = 256 - 8 * (CAST(Integer, w) + 1)
    IF left < 0 THEN left = 0
    IF left > maxL THEN left = maxL
    sh = left BAND 7
    POKE b + STCOL, left >> 3
    POKE Integer b + STTOP, y + yo
    POKE b + STON, 1
    IF (PEEK(b + STN) = n) AND (PEEK(b + STSH) = sh) THEN RETURN
    POKE b + STN, n
    POKE b + STSH, sh
    POKE b + STW1, w + 1
    POKE b + STH, PEEK (p + 1)
    sprW = w
    sprH = PEEK (p + 1)
    sprL = sh
    sprData = p + 4
    sprBuf = PEEK(UInteger, b + STCACHE)
    SprShiftAsm()
END SUB

SUB SprHide(slot AS UByte)
    POKE SlotBase(slot) + STON, 0
END SUB

' Dessine le slot depuis son cache (avec sauvegarde du fond). A = slot.
SUB FASTCALL SprDraw(slot AS UByte)
    ASM
        add a, a
        add a, a
        add a, a
        add a, a
        ld l, a
        ld h, 0
        ld de, SlotTab
        add hl, de
        ld a, (hl)              ; affiché ?
        or a
        jr z, sdr_end
        call SprDrawCore
sdr_end:
    END ASM
END SUB

' Remet le fond sauvegardé du slot. A = slot.
SUB FASTCALL SprRestore(slot AS UByte)
    ASM
        add a, a
        add a, a
        add a, a
        add a, a
        add a, 10               ; STBUF
        ld l, a
        ld h, 0
        ld de, SlotTab
        add hl, de
        ld e, (hl)
        inc hl
        ld d, (hl)
        ex de, hl
        call SprRestoreCore
    END ASM
END SUB

' Tables de décalage : pour chaque décalage s (0-7), deux pages de 256 octets
'   $F0+2s : TR[b] = b >> s          $F1+2s : TL[b] = (b << (8-s)) AND $FF
SUB FASTCALL SprMakeTables()
    ASM
        ld h, $F0
        ld c, 0                 ; s
smt_s:
        ld l, 0
smt_b:
        ld a, l
        ld b, c
        inc b
        jr smt_r1
smt_r:
        srl a
smt_r1:
        djnz smt_r
        ld (hl), a              ; TR[b]
        inc h
        ld a, 8
        sub c
        ld b, a
        ld a, l
smt_l:
        sla a
        djnz smt_l
        ld (hl), a              ; TL[b]  (s=0 : décalage de 8 -> 0)
        dec h
        inc l
        jr nz, smt_b
        inc h
        inc h
        inc c
        ld a, c
        cp 8
        jr nz, smt_s
    END ASM
END SUB

' Décale le sprite source (sprData, sprW x sprH, décalage sprL) vers le cache
' (sprBuf) : sprH lignes de sprW+1 paires (masque, dessin).
SUB FASTCALL SprShiftAsm()
    ASM
        push ix
        ld a, (_sprL)
        add a, a
        add a, $F0
        ld (ss_pg), a
        ld h, a
        inc h
        ld l, $FF
        ld a, (hl)
        ld (ss_cm0), a          ; TL[$FF] : masque entrant
        ld de, (_sprBuf)
        ld ix, (_sprData)
        ld a, (_sprH)
        ld (ss_rows), a
ss_row:
        ld a, (ss_cm0)
        ld (ss_cm), a
        xor a
        ld (ss_cg), a
        ld a, (ss_pg)
        ld h, a
        ld a, (_sprW)
        ld b, a
ss_byte:
        ld l, (ix+0)            ; masque
        ld a, (hl)              ; TR[m]
        ld c, a
        ld a, (ss_cm)
        or c
        ld (de), a
        inc de
        inc h
        ld a, (hl)              ; TL[m]
        ld (ss_cm), a
        ld l, (ix+1)            ; dessin
        ld a, (hl)              ; TL[g]
        ld c, a
        dec h
        ld a, (hl)              ; TR[g]
        ld l, a
        ld a, (ss_cg)
        or l
        ld (de), a
        inc de
        ld a, c
        ld (ss_cg), a
        inc ix
        inc ix
        djnz ss_byte
        ld a, (ss_cm)           ; octet supplémentaire
        ld (de), a
        inc de
        ld a, (ss_cg)
        ld (de), a
        inc de
        ld a, (ss_rows)
        dec a
        ld (ss_rows), a
        jr nz, ss_row
        pop ix
        jr ss_end
ss_pg:   defb 0
ss_cm0:  defb 0
ss_cm:   defb 0
ss_cg:   defb 0
ss_rows: defb 0
ss_end:
    END ASM
END SUB

' Cœurs assembleur et mémoire des slots.
'   SprDrawCore : HL = entrée de SlotTab. Sauvegarde le fond et dessine depuis
'     le cache, ligne par ligne, en une passe déroulée. Données lues par la pile.
'   SprRestoreCore : HL = tampon de sauvegarde. Recopie par LDI déroulés.
SUB FASTCALL SprCores()
    ASM
        ret

SprDrawCore:
        di
        ld (sd_ix), ix
        inc hl
        inc hl
        inc hl
        ld a, (hl)              ; largeur + 1
        ld (sd_w1), a
        add a, a
        ld (sd_w2), a
        ; entrée dans la boucle déroulée : 8 octets de code par octet dessiné
        ld a, (sd_w1)
        ld c, a
        ld a, 5
        sub c
        add a, a
        add a, a
        add a, a
        ld e, a
        ld d, 0
        push hl
        ld hl, sd_unroll
        add hl, de
        ld (sd_jp + 1), hl
        pop hl
        inc hl
        ld b, (hl)              ; hauteur
        inc hl
        ld a, (hl)              ; colonne
        ld (sd_col), a
        inc hl
        ld e, (hl)
        inc hl
        ld d, (hl)              ; DE = haut (signé)
        inc hl
        ld a, (hl)
        ld (sd_data), a
        inc hl
        ld a, (hl)
        ld (sd_data + 1), a     ; cache
        inc hl
        ld a, (hl)
        inc hl
        ld h, (hl)
        ld l, a                 ; HL = tampon de sauvegarde
        ld (sd_buf), hl
        ld (hl), 0
        ; découpage vertical : lignes au-dessus de l'écran
        ld c, 0                 ; lignes sautées en haut
        bit 7, d
        jr z, sd_top_ok
sd_clip_top:
        inc c
        inc de
        dec b
        jp z, sd_empty
        bit 7, d
        jr nz, sd_clip_top
sd_top_ok:
        ld a, d
        or a
        jp nz, sd_empty         ; y >= 256
        ld a, e
        cp 192
        jp nc, sd_empty
        ; lignes sous l'écran : hauteur = min(h, 192 - y)
        ld a, 192
        sub e
        cp b
        jr nc, sd_h_ok
        ld b, a
sd_h_ok:
        ld a, b
        ld (sd_n), a
        ; sauter les données des lignes coupées en haut (c lignes x w2 octets)
        push hl
        ld hl, (sd_data)
        ld a, c
        or a
        jr z, sd_nodskip
        ld a, (sd_w2)
        ld d, 0
sd_dskip:
        push de
        ld e, a
        add hl, de
        pop de
        dec c
        jr nz, sd_dskip
sd_nodskip:
        ld (sd_data), hl
        pop hl
        ; en-tête du tampon : lignes, largeur
        ld a, (sd_n)
        ld (hl), a
        inc hl
        ld a, (sd_w1)
        ld (hl), a
        inc hl
        ; adresse écran de la première ligne -> DE
        ld a, e
        and 7
        or $40
        ld d, a
        ld a, e
        rra
        rra
        rra
        and $18
        or d
        ld d, a
        ld a, e
        rla
        rla
        and $E0
        ld e, a
        ld a, (sd_col)
        or e
        ld e, a
        ld ixl, b               ; compteur de lignes
        ld (sd_sp), sp
        ld sp, (sd_data)
sd_row:
        ld (hl), e
        inc hl
        ld (hl), d
        inc hl
        ld c, e                 ; colonne de départ de la ligne
sd_jp:
        jp sd_unroll
sd_unroll:
        pop bc
        ld a, (de)
        ld (hl), a
        inc hl
        and c
        or b
        ld (de), a
        inc e
        pop bc
        ld a, (de)
        ld (hl), a
        inc hl
        and c
        or b
        ld (de), a
        inc e
        pop bc
        ld a, (de)
        ld (hl), a
        inc hl
        and c
        or b
        ld (de), a
        inc e
        pop bc
        ld a, (de)
        ld (hl), a
        inc hl
        and c
        or b
        ld (de), a
        inc e
        pop bc
        ld a, (de)
        ld (hl), a
        inc hl
        and c
        or b
        ld (de), a
        inc e
        ; ligne suivante : revenir à la colonne, descendre d'un pixel
        ld a, (sd_col)
        ld c, a
        ld a, e
        and $E0
        or c
        ld e, a
        inc d
        ld a, d
        and 7
        jr nz, sd_nl
        ld a, e
        add a, 32
        ld e, a
        jr c, sd_nl
        ld a, d
        sub 8
        ld d, a
sd_nl:
        dec ixl
        jp nz, sd_row
        ld sp, (sd_sp)
sd_done:
        ld ix, (sd_ix)
        ei
        ret
sd_empty:
        ld hl, (sd_buf)
        ld (hl), 0
        jr sd_done
sd_sp:   defw 0
sd_ix:   defw 0
sd_data: defw 0
sd_buf:  defw 0
sd_w1:   defb 0
sd_w2:   defb 0
sd_col:  defb 0
sd_n:    defb 0

SprRestoreCore:
        ld a, (hl)
        or a
        ret z
        push hl
        ld (sr_n), a
        inc hl
        ld a, (hl)              ; largeur + 1
        inc hl
        ld c, a
        ld a, 5
        sub c
        add a, a                ; LDI = 2 octets
        ld e, a
        ld d, 0
        push hl
        ld hl, sr_unroll
        add hl, de
        ld (sr_jp + 1), hl
        pop hl
        ld bc, $FFFF
sr_row:
        ld e, (hl)
        inc hl
        ld d, (hl)
        inc hl
sr_jp:
        jp sr_unroll
sr_unroll:
        ldi
        ldi
        ldi
        ldi
        ldi
        ld a, (sr_n)
        dec a
        ld (sr_n), a
        jr nz, sr_row
        pop hl
        ld (hl), 0
        ret
sr_n:   defb 0

SlotTab:
        defs 16 * 5
SprMem:
        defs 2 * (256 + 200) + 3 * (32 + 32)
    END ASM
END SUB

#endif
