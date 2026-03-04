Check 951F7C98
Auto 8224

# Run-time Variables

Var y: Num = 14
Var x: Num = 29
Var b: Num = 165
Var d: Num = 2
Var dx: Num = 1
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 0
Var a: NumFOR = 8, 7, 1, 80, 2
Var i: NumFOR = 21, 20, 1, 100, 2
Var c$: Str = ""

# End Run-time Variables

  10 REM
  20 REM Ottimizzazione del rimbalzo della pallina
  30 REM Aggiunta dell'Udgs personalizzato
  40 REM Aggiunta colori personalizzati
  50 REM
  60 REM -----------------------------
  70 REM Dichiatazione delle variabili
  80 REM -----------------------------
  90 LET y=20: LET x=17: LET dx=0: LET dy=0: LET py=20: LET px=0: LET c$=""
 100 INK 2
 110 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 120 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 130 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 140 REM -------------------------------------
 150 REM Posizionamento di default della palla
 160 REM -------------------------------------
 170 PRINT AT y,x;CHR$ 144
 180 REM -------------------------------
 190 REM decide la direzione della palla
 200 REM -------------------------------
 210 LET d=2: REM INT (RND*3)
 220 IF d=0 THEN LET dy=-1: LET dx=0
 230 IF d=1 THEN LET dy=-1: LET dx=-1
 240 IF d=2 THEN LET dy=-1: LET dx=+1
 250 IF d=3 THEN LET dy=0: LET dx=-1
 260 REM -------------------------
 270 REM Gestione movimento player
 280 REM -------------------------
 290 REM PRINT AT py,px;"bab"
 300 REM IF INKEY$="o" AND px>0 THEN LET px=px-1: PRINT AT py,px;"bab  "
 310 REM IF INKEY$="p" AND px<=28 THEN PRINT AT py,px;" bab": LET px=px+1
 320 REM ----------------------------------
 330 REM gestione collisone palliane player
 340 REM ----------------------------------
 350 REM  LET c$= SCREEN$ (20,x):
 360 REM  IF c$="a" THEN LET dy=-1: LET y=20
 370 REM -------------------------------------------
 380 REM Disegna la palla nelle coordinate calcolate
 390 REM -------------------------------------------
 400 INK 1: PRINT AT y+dy,x+dx;CHR$ 144: PRINT AT y,x;" "
 410 REM -------------------------------------------------------
 420 REM Inverte la direzione della pallina da sinistra a destra
 430 REM -------------------------------------------------------
 440 REM IF x=30 THEN LET dx=-1
 450 REM IF x=0 THEN LET dx=1
 460 REM IF y=-20 THEN LET dy=1
 470 REM IF y=21 THEN LET dy=-1
 480 LET y=y+dy: LET x=x+dx
 490 IF y=3 THEN LET dy=1
 500 IF y=20 THEN LET dy=-1
 510 IF x=1 THEN LET dx=1
 520 IF x=30 THEN LET dx=-1
 530 REM ---------------------------------------------------------
 540 REM Inverte la direzione della pallina dal basso verso l'alto
 550 REM ---------------------------------------------------------
 560 REM IF y=-21 THEN LET dy=-1: LET y=21
 570 REM -----------------------------------------
 580 REM Stampa le coordinate di debug della palla
 590 REM -----------------------------------------
 600 INK 0: PRINT AT 0,0;"x:   ";AT 0,7;"y:   ";AT 0,15;"dy:   ";AT 0,23;"dx:   ";
 610 PRINT AT 0,0;"x:";x;AT 0,7;"y:";y;AT 0,15;"dy:";dy;AT 0,23;"dx:";dx
 620 PRINT AT 1,0;"px:";px;AT 1,7;"py:";py;AT 1,15;"c:";c$
 630 REM --------------------------------------------------------
 640 REM Pausa per rendere meno scattoso il movimento della palla
 650 REM --------------------------------------------------------
 660 REM PAUSE 0.5
 670 GO TO 260
 680 DATA 24,60,126,219,255,36,90,165
