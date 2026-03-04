Check B9F72157
Auto 8224

# Run-time Variables

Var y: Num = 11
Var x: Num = 3
Var b: Num = 165
Var d: Num = 2
Var dx: Num = 1
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 0
Var a: NumFOR = 8, 7, 1, 43, 2
Var i: NumFOR = 21, 20, 1, 45, 2
Var c$: Str = ""

# End Run-time Variables

   1 REM
   2 REM Ottimizzazione del rimbalzo della pallina
   3 REM
  10 REM -----------------------------
  20 REM Dichiatazione delle variabili
  30 REM -----------------------------
  40 LET y=21: LET x=17: LET dx=0: LET dy=0: LET py=20: LET px=0: LET c$=""
  43 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
  44 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
  45 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
  50 REM -------------------------------------
  60 REM Posizionamento di default della palla
  70 REM -------------------------------------
  80 PRINT AT y,x;CHR$ 144
  90 REM -------------------------------
 100 REM decide la direzione della palla
 110 REM -------------------------------
 120 LET d=2: REM INT (RND*3)
 130 IF d=0 THEN LET dy=-1: LET dx=0
 140 IF d=1 THEN LET dy=-1: LET dx=-1
 150 IF d=2 THEN LET dy=-1: LET dx=+1
 160 IF d=3 THEN LET dy=0: LET dx=-1
 170 REM -------------------------
 180 REM Gestione movimento player
 190 REM -------------------------
 200 REM PRINT AT py,px;"bab"
 210 REM IF INKEY$="o" AND px>0 THEN LET px=px-1: PRINT AT py,px;"bab  "
 220 REM IF INKEY$="p" AND px<=28 THEN PRINT AT py,px;" bab": LET px=px+1
 230 REM ----------------------------------
 240 REM gestione collisone palliane player
 250 REM ----------------------------------
 260 REM  LET c$= SCREEN$ (20,x):
 270 REM  IF c$="a" THEN LET dy=-1: LET y=20
 280 REM -------------------------------------------
 290 REM Disegna la palla nelle coordinate calcolate
 300 REM -------------------------------------------
 310 PRINT AT y+dy,x+dx;CHR$ 144: PRINT AT y,x;" "
 320 REM -------------------------------------------------------
 330 REM Inverte la direzione della pallina da sinistra a destra
 340 REM -------------------------------------------------------
 350 REM IF x=30 THEN LET dx=-1
 360 REM IF x=0 THEN LET dx=1
 370 REM IF y=-20 THEN LET dy=1
 380 REM IF y=21 THEN LET dy=-1
 390 LET y=y+dy: LET x=x+dx
 400 IF y=3 THEN LET dy=1
 410 IF y=20 THEN LET dy=-1
 420 IF x=1 THEN LET dx=1
 430 IF x=30 THEN LET dx=-1
 440 REM ---------------------------------------------------------
 450 REM Inverte la direzione della pallina dal basso verso l'alto
 460 REM ---------------------------------------------------------
 470 REM IF y=-21 THEN LET dy=-1: LET y=21
 480 REM -----------------------------------------
 490 REM Stampa le coordinate di debug della palla
 500 REM -----------------------------------------
 510 PRINT AT 0,0;"x:   ";AT 0,7;"y:   ";AT 0,15;"dy:   ";AT 0,23;"dx:   ";
 520 PRINT AT 0,0;"x:";x;AT 0,7;"y:";y;AT 0,15;"dy:";dy;AT 0,23;"dx:";dx
 530 PRINT AT 1,0;"px:";px;AT 1,7;"py:";py;AT 1,15;"c:";c$
 540 REM --------------------------------------------------------
 550 REM Pausa per rendere meno scattoso il movimento della palla
 560 REM --------------------------------------------------------
 570 REM PAUSE 0.5
 580 GO TO 170
1000 DATA 24,60,126,219,255,36,90,165
