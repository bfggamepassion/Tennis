' ---------------------------------------------------------------------------
' Court : projection coordonnées de court (repère Game Boy) -> écran Spectrum
'
' Repère de court (identique au GB, cf. re/FICHE_JEU.md §5) :
'   X latéral  $08..$D0, centre $6C
'   Y profondeur $08 (fond haut) .. $E7 (fond bas), filet $78
' Projection GB : x = X -+ dx*dx*dy/73728   (dx=|X-$6C|, dy=|$B8-Y|)
'                 y = 28 + Y*40/47
' Spectrum : même forme, mise à l'échelle pour 256x192
'   sx = 128 + 1,25*(X - $6C -+ décalage)   sy = 16 + 0,8*(Y - 8)
' ---------------------------------------------------------------------------

#ifndef COURT_BAS
#define COURT_BAS

CONST CX AS UByte = $6C          ' centre latéral du court
CONST NETY AS UByte = $78        ' filet
CONST BASEFAR AS UByte = $37     ' ligne de fond haute
CONST BASENEAR AS UByte = $B8    ' ligne de fond basse
CONST SERVFAR AS UByte = $55     ' ligne de service haute
CONST SERVNEAR AS UByte = $9A    ' ligne de service basse
CONST SGLHALF AS UByte = 54      ' demi-largeur simple ($6C-$36)
CONST DBLHALF AS UByte = 64      ' demi-largeur double

' Paramètres et résultats de la projection (lus/écrits par l'assembleur)
DIM projX AS UByte
DIM projY AS UByte
DIM pX AS UByte
DIM pY AS UByte

' Projette le point (x, y) du court. Résultat dans projX, projY.
' décalage = ((dx*dx >> 8) * dy) / 288   (= dx²·dy/73728, formule GB $095D)
' sx = 128 -+ 1,25*(dx -+ décalage)       sy = 16 + 0,8*(y - 8)
SUB Project(x AS UByte, y AS UByte)
    pX = x
    pY = y
    ProjectAsm()
END SUB

SUB FASTCALL ProjectAsm()
    ASM
        ld a, (_pY)
        ld c, 0                 ; C = 1 si derrière la ligne de fond basse
        sub $B8
        jr nc, pj_behind
        neg
        jr pj_dy
pj_behind:
        ld c, 1
pj_dy:
        ld (pj_ddy), a
        ld a, (_pX)
        ld b, 0                 ; B = 1 si à droite du centre
        sub $6C
        jr nc, pj_right
        neg
        jr pj_dx
pj_right:
        ld b, 1
pj_dx:
        ld (pj_ddx), a
        push bc
        ; t = (dx*dx) >> 8
        ld e, a
        call pj_mul             ; HL = A*E
        ld a, h                 ; t
        ld hl, pj_ddy
        ld e, (hl)
        call pj_mul             ; HL = t*dy
        ; off = ((u >> 3) * 57) >> 11
        srl h
        rr l
        srl h
        rr l
        srl h
        rr l
        ld d, h
        ld e, l                 ; DE = u>>3
        add hl, hl
        add hl, hl
        add hl, hl              ; *8
        push hl
        add hl, hl
        add hl, hl
        add hl, hl              ; *64
        pop bc
        or a
        sbc hl, bc              ; *56
        add hl, de              ; *57
        ld a, h
        srl a
        srl a
        srl a                   ; >> 11
        pop bc
        ld e, a                 ; E = décalage
        ld a, (pj_ddx)
        bit 0, c
        jr nz, pj_wide
        sub e                   ; devant : vers le centre
        jr nc, pj_s
        xor a
        jr pj_s
pj_wide:
        add a, e                ; derrière : vers l'extérieur
        jr nc, pj_s
        ld a, $FF
pj_s:
        ; s = a * 1,25
        ld l, a
        ld h, 0
        srl a
        srl a
        ld e, a
        ld d, 0
        add hl, de              ; HL = s
        bit 0, b
        jr z, pj_left
        ld de, 128
        add hl, de
        ld a, h
        or a
        ld a, l
        jr z, pj_xok
        ld a, 255
        jr pj_xok
pj_left:
        ex de, hl
        ld hl, 128
        or a
        sbc hl, de
        ld a, l
        jr nc, pj_xok
        xor a
pj_xok:
        ld (_projX), a
        ; sy = 16 + ((y-8)*205) >> 8
        ld a, (_pY)
        sub 8
        jr nc, pj_y0
        xor a
pj_y0:
        ld e, 205
        call pj_mul
        ld a, h
        add a, 16
        ld (_projY), a
        jr pj_end
pj_mul:                         ; HL = A * E (non signé)
        ld h, a
        ld l, 0
        ld d, 0
        ld b, 8
pj_ml:
        add hl, hl
        jr nc, pj_mn
        add hl, de
pj_mn:
        djnz pj_ml
        ret
pj_ddx: defb 0
pj_ddy: defb 0
pj_end:
    END ASM
END SUB

' Trace un segment entre deux points du court (coordonnées écran, y vers le bas)
SUB CourtLine(x1 AS UByte, y1 AS UByte, x2 AS UByte, y2 AS UByte)
    DIM ax AS UByte
    DIM ay AS UByte
    Project(x1, y1): ax = projX: ay = projY
    Project(x2, y2)
    PLOT ax, 191 - ay
    DRAW CAST(Integer, projX) - ax, CAST(Integer, ay) - projY
END SUB

' Filet : bande grillagée de 6 pixels de haut entre les poteaux
SUB DrawNet()
    DIM x1 AS UByte
    DIM x2 AS UByte
    DIM yy AS UByte
    DIM i AS UByte
    DIM px AS UByte
    Project(CX - DBLHALF - 4, NETY): x1 = projX: yy = projY
    Project(CX + DBLHALF + 4, NETY): x2 = projX
    ' bande supérieure (câble)
    PLOT x1, 191 - (yy - 6): DRAW x2 - x1, 0
    PLOT x1, 191 - (yy - 5): DRAW x2 - x1, 0
    ' maillage : un pixel sur deux, lignes alternées
    FOR i = 0 TO 4 STEP 2
        FOR px = x1 TO x2 STEP 2
            PLOT px + ((i >> 1) BAND 1), 191 - (yy - 4 + i)
        NEXT px
    NEXT i
    PLOT x1, 191 - yy: DRAW x2 - x1, 0
    ' poteaux
    PLOT x1, 191 - (yy - 8): DRAW 0, -9
    PLOT x2, 191 - (yy - 8): DRAW 0, -9
END SUB

SUB DrawCourt()
    DIM keep AS UInteger
    ' Référence pX/pY, lus seulement en assembleur (sinon supprimés par l'optimiseur)
    keep = @pX + @pY
    ' lignes de fond
    CourtLine(CX - DBLHALF, BASEFAR, CX + DBLHALF, BASEFAR)
    CourtLine(CX - DBLHALF, BASENEAR, CX + DBLHALF, BASENEAR)
    ' couloirs (double) et lignes de simple
    CourtLine(CX - DBLHALF, BASEFAR, CX - DBLHALF, BASENEAR)
    CourtLine(CX + DBLHALF, BASEFAR, CX + DBLHALF, BASENEAR)
    CourtLine(CX - SGLHALF, BASEFAR, CX - SGLHALF, BASENEAR)
    CourtLine(CX + SGLHALF, BASEFAR, CX + SGLHALF, BASENEAR)
    ' lignes de service et ligne médiane
    CourtLine(CX - SGLHALF, SERVFAR, CX + SGLHALF, SERVFAR)
    CourtLine(CX - SGLHALF, SERVNEAR, CX + SGLHALF, SERVNEAR)
    CourtLine(CX, SERVFAR, CX, SERVNEAR)
    ' marques centrales sur les lignes de fond
    CourtLine(CX, BASEFAR, CX, BASEFAR + 3)
    CourtLine(CX, BASENEAR - 3, CX, BASENEAR)
    DrawNet()
END SUB

#endif
