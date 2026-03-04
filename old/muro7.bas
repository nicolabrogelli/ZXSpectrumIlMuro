Check 3ED986E6
Auto 8224

# Run-time Variables

Var y: Num = 15
Var x: Num = 17
Var l: Num = 0
Var d: Num = 0
Var dx: Num = 0
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 1
Var a: NumFOR = 5, 4, 1, 150, 2
Var b: NumFOR = 31, 30, 1, 160, 2
Var i: NumFOR = 21, 20, 1, 140, 2
Var c$: Str = " "

# End Run-time Variables

  10 REM NOTE di aggiornamento
  20 REM Ottimizzazione del rimbalzo della pallina
  30 REM Aggiunta dell'Udgs personalizzato
  40 REM Aggiunta colori personalizzati
  50 REM Rimosso momentaneamente movimento del player
  60 REM Aggiunti i puntini che simulano i mattoni da distruggere
  70 REM -----------------------------
  80 REM Dichiatazione delle variabili
  90 REM -----------------------------
 100 LET y=20: LET x=17: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET c$=""
 110 INK 2
 120 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 130 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 140 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 150 FOR a=3 TO 4
 160 FOR b=1 TO 30
 170 INK a: PRINT AT a,b;"."
 180 NEXT b
 190 NEXT a
 200 REM -------------------------------------
 210 REM Posizionamento di default della palla
 220 REM -------------------------------------
 230 PRINT AT y,x;CHR$ 144
 240 REM -------------------------------
 250 REM decide la direzione della palla
 260 REM -------------------------------
 270 LET d=0: REM INT (RND*3)
 280 IF d=0 THEN LET dy=-1: LET dx=0
 290 IF d=1 THEN LET dy=-1: LET dx=-1
 300 IF d=2 THEN LET dy=-1: LET dx=+1
 310 IF d=3 THEN LET dy=0: LET dx=-1
 320 REM -------------------------
 330 REM Gestione movimento player
 340 REM -------------------------
 350 REM PRINT AT py,px;"aba": REM \:'\''\':
 360 REM IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"aba "
 370 REM IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" aba": LET px=px+1
 380 REM -------------------------------------------
 390 REM Disegna la palla nelle coordinate calcolate
 400 REM -------------------------------------------
 410 INK 1: PRINT AT y+dy,x+dx;CHR$ 144: PRINT AT y,x;" "
 420 REM --------------------------------
 430 REM gestione collisone con i mattoni
 440 REM --------------------------------
 450 LET c$= SCREEN$ (y+1,x): IF c$="." THEN LET dy=1: PRINT AT y,x;"x": LET l=l+1
 460 REM -------------------------------------------------------
 470 REM Inverte la direzione della pallina da sinistra a destra
 480 REM -------------------------------------------------------
 490 LET y=y+dy: LET x=x+dx
 500 IF y=3 THEN LET dy=1
 510 IF y=20 THEN LET dy=-1: REM  LET l=l-1
 520 IF x=1 THEN LET dx=1
 530 IF x=30 THEN LET dx=-1
 540 REM -----------------------------------------
 550 REM Stampa le coordinate di debug della palla
 560 REM -----------------------------------------
 570 INK 0: PRINT AT 0,0;"x:   ";AT 0,7;"y:   ";AT 0,15;"dy:   ";AT 0,23;"dx:   ";
 580 PRINT AT 0,0;"x:";x;AT 0,7;"y:";y;AT 0,15;"dy:";dy;AT 0,23;"dx:";dx
 590 PRINT AT 1,0;"px:";px;AT 1,7;"py:";py;AT 1,15;"c:";c$;AT 1,23;"l:";l
 600 REM --------------------------------------------------------
 610 REM Pausa per rendere meno scattoso il movimento della palla
 620 REM --------------------------------------------------------
 630 REM PAUSE 0.5
 640 REM IF l=0 THEN STOP
 650 GO TO 320
 660 DATA 24,60,126,219,255,36,90,165
