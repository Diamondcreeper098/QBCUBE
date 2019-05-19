'--------------------------------------------------------------------------
'-                                                                        -
'-Email: Dmnd098@gmail.com + Dmnd098@outlook.com                          -
'-WireFrame cube in qbasic                                                -
'--------------------------------------------------------------------------
DECLARE SUB Delay (dlay#)
DECLARE FUNCTION Atan2# (yloc, xloc)
SCREEN 12
DIM X, Y, spacex, spacey, SqrW, SqrH, ScrW, ScrH, POVX, POVY AS INTEGER
spacex = 20
spacey = 20
ScrW = 640
ScrH = 480
SqrW = ScrW / 10
SqrH = ScrH / 10
X = 1
Y = 1
xtmp = spacex
ytmp = spacey
POVX = ScrW / 2
POVY = ScrH / 2
PRINT ("Welcome this is Wireframe cube from Dmnd098")
PRINT ("Use W,A,S,D to Move the cube")
Delay(3)
DO UNTIL INKEY$ = CHR$(27)
    LET k$ = INKEY$
    'Drawing Box
    LINE (X, Y)-(X + SqrW, Y + SqrH), , B
    LINE (X + spacex, Y + spacey)-((X + SqrW) + spacex, (Y + SqrH) + spacey), , B
    LINE (X, Y)-(X + spacex, Y + spacey)
    LINE (X + SqrW, Y)-((X + SqrW) + spacex, Y + spacey)
    LINE (X, Y + SqrH)-(X + spacex, (Y + SqrH) + spacey)
    LINE (X + SqrW, Y + SqrH)-((X + SqrW) + spacex, (Y + SqrH) + spacey)
    'Drawing Rays to the box
    'LINE (POVX, POVY)-(X, Y)
    'LINE (POVX, POVY)-(X + SqrW, Y)
    'LINE (POVX, POVY)-(X, Y + SqrH)
    'LINE (POVX, POVY)-(X + SqrW, Y + SqrH), 10
    'LINE (POVX, POVY)-(X + spacex, Y + spacey), 4
    'LINE (POVX, POVY)-((X + SqrW) + spacex, Y + spacey), 4
    'LINE (POVX, POVY)-(X + spacex, (Y + SqrH) + spacey), 4
    'LINE (POVX, POVY)-((X + SqrW) + spacex, (Y + SqrH) + spacey), 6


    IF k$ = "W" OR k$ = "w" THEN
        Y = Y - 5
        ytmp = spacey + ((SIN(Atan2#(SqrH, X))) / 2)
    ELSEIF k$ = "S" OR k$ = "s" THEN
        Y = Y + 5
        ytmp = spacey - ((SIN(Atan2#(SqrH, X))) / 2)
        
    ELSEIF k$ = "A" OR k$ = "a" THEN
        X = X - 5
        xtmp = spacex + ((COS(Atan2#(Y, SqrW))) / 2)
    ELSEIF k$ = "D" OR k$ = "d" THEN
        X = X + 5
        xtmp = spacex - ((COS(Atan2#(Y, SqrW))) / 2)
    END IF
    IF (SqrW / 2) = POVX AND (SqrH / 2) = POVY THEN
        spacex = 0
        spacey = 0
    ELSE
        spacex = xtmp
        spacey = ytmp
    END IF
    Delay (.01)
    CLS
LOOP




FUNCTION Atan2# (yloc, xloc)
    '
    IF xloc > 0 THEN
        Atan2# = ATN(yloc / xloc)
    END IF
    IF xloc < 0 AND yloc >= 0 THEN
        Atan2# = ATN(yloc / xloc) + 3.14
    END IF
    IF xloc < 0 AND yloc < 0 THEN
        Atan2# = ATN(yloc / xloc) - 3.14
    END IF
    IF xloc = 0 AND yloc > 0 THEN
        Atan2# = 3.14 / 2
    END IF
    IF xloc = 0 AND yloc < 0 THEN
        Atan2# = -(3.14 / 2)
    END IF
    IF xloc = 0 AND yloc = 0 THEN
        Atan2# = 0
    END IF
END FUNCTION

SUB Delay (dlay#)
    start# = TIMER
    DO WHILE start# + dlay# >= TIMER
        IF start# > TIMER THEN start# = start# - 86400
    LOOP
END SUB

