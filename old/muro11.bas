Check 3D8415EE
Auto 8224

# Run-time Variables

Var y: Num = 19
Var x: Num = 12
Var l: Num = 4
Var m: Num = 1
Var d: Num = 1
Var dx: Num = 1
Var dy: Num = 1
Var py: Num = 20
Var px: Num = 1
Var a: NumFOR = 6, 5, 1, 150, 2
Var b: NumFOR = 31, 30, 2, 160, 2
Var i: NumFOR = 21, 20, 1, 130, 2
Var c$: Str = ""
Var z$: Str = "E"

# End Run-time Variables

  10 REM NOTE di aggiornamento
  20 REM Ottimizzazione del rimbalzo della pallina
  30 REM Aggiunta dell'Udgs personalizzato
  40 REM Aggiunta colori personalizzati
  50 REM Rimosso momentaneamente movimento del player
  60 REM -----------------------------
  70 REM Dichiatazione delle variabili
  80 REM -----------------------------
  90 LET y=20: LET x=19: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET m=1: LET c$=""
 100 INK 2
 110 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 120 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 130 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 140 INVERSE 1
 150 FOR a=3 TO 5
 160 FOR b=1 TO 30 STEP 2
 170 INK m: PRINT AT a+3,b;"QE": LET m=m+1: IF m=6 THEN LET m=1
 180 NEXT b
 190 NEXT a
 200 INVERSE 0
 210 REM -------------------------------------
 220 REM Posizionamento di default della palla
 230 REM -------------------------------------
 240 PRINT AT y,x;CHR$ 144
 250 REM -------------------------------
 260 REM decide la direzione della palla
 270 REM -------------------------------
 280 LET d=1: REM INT (RND*3)
 290 IF d=0 THEN LET dy=-1: LET dx=0
 300 IF d=1 THEN LET dy=-1: LET dx=-1
 310 IF d=2 THEN LET dy=-1: LET dx=+1
 320 IF d=3 THEN LET dy=0: LET dx=-1
 330 LET x=x+dx: LET y=y+dy
 340 REM -------------------------------------------------------------------------------
 350 REM                                  Loop del gioco
 360 REM ------------------------------------------------------------------------------
 370 REM -------------------------
 380 REM Gestione movimento player
 390 REM -------------------------
 400 REM PRINT AT py,px;"aba": REM \:'\''\':
 410 REM IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"aba "
 420 REM IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" aba": LET px=px+1
 430 REM -------------------------------------------
 440 REM Disegna la palla nelle coordinate calcolate
 450 REM -------------------------------------------
 460 INK 1: PRINT AT y,x;CHR$ 144: PRINT AT y-dy,x-dx;" "
 470 REM ----------------------------------------------------------
 480 REM gestione collisone con i mattoni, non funziona maremma cane
 490 REM -----------------------------------------------------------
 500 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="Q" THEN PRINT AT y-1,x;"  ": LET dy=1: LET l=l+1
 501 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="E" THEN PRINT AT y-1,x-1;"  ": LET dy=1: LET l=l+1
 510 REM  IF dy=1 THEN LET v$= SCREEN$ (y+2,x+dx): IF v$="Q" THEN PRINT AT y+2,x+dx;" ";AT y+2,x+dx;" ": LET dy=-1: LET l=l+1
 520 REM LET y=y+dy: LET x=x+dx
 530 REM
 540 IF y=3 THEN LET dy=1
 550 IF y=20 THEN LET dy=-1: REM  LET l=l-1
 560 IF x=1 THEN LET dx=1
 570 IF x=30 THEN LET dx=-1
 580 REM -----------------------------------------
 590 REM Stampa le coordinate di debug della palla
 600 REM -----------------------------------------
 610 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"c:    "
 620 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"c:";c$
 630 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
 640 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
 650 REM --------------------------------------------------------
 660 REM Pausa per rendere meno scattoso il movimento della palla
 670 REM --------------------------------------------------------
 680 REM IF l=0 THEN STOP
 690 LET y=y+dy: LET x=x+dx
 700 GO TO 370
 710 DATA 24,60,126,219,255,36,90,165
