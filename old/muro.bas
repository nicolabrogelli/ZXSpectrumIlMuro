Check 193A05DD
Auto 8224

# Run-time Variables

Var y: Num = 10
Var x: Num = 22
Var d: Num = 2
Var dx: Num = -1
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 29
Var c$: Str = "x"

# End Run-time Variables

 100 REM -----------------------------
 150 REM Dichiatazione delle variabili
 200 REM -----------------------------
 250 LET y=21: LET x=7: LET dx=0: LET dy=0: LET py=20: LET px=0: LET c$=""
 300 REM -------------------------------------
 350 REM Posizionamento di default della palla
 400 REM -------------------------------------
 450 PRINT AT y,x;"x"
 500 REM -------------------------------
 550 REM decide la direzione della palla
 600 REM -------------------------------
 650 LET d=2: REM INT (RND*3)
 700 IF d=0 THEN LET dy=-1: LET dx=0
 750 IF d=1 THEN LET dy=-1: LET dx=-1
 800 IF d=2 THEN LET dy=-1: LET dx=+1
 850 REM -------------------------
 900 REM Gestione movimento player
 950 REM -------------------------
1000 PRINT AT py,px;"smd"
1050 IF INKEY$="o" AND px>0 THEN LET px=px-1: PRINT AT py,px;"smd  "
1100 IF INKEY$="p" AND px<=28 THEN PRINT AT py,px;" smd": LET px=px+1
1150 REM ----------------------------------
1200 REM gestione collisone palliane player
1250 REM ----------------------------------
1300 LET c$= SCREEN$ (py+1,px):
1350 IF c$="c" THEN LET dy=-1: LET y=20
1400 REM -------------------------------------------
1450 REM Disegna la palla nelle coordinate calcolate
1500 REM -------------------------------------------
1550 PRINT AT y+dy,x+dx;"x": PRINT AT y,x;" "
1600 REM -------------------------------------------------------
1650 REM Inverte la direzione della pallina da sinistra a destra
1700 REM -------------------------------------------------------
1750 IF x=30 THEN LET dx=-1
1800 IF x=0 THEN LET dx=1
1850 IF y=-20 THEN LET dy=1
1900 IF y=20 THEN LET dy=-1
1950 LET y=y+dy: LET x=x+dx
2000 REM ---------------------------------------------------------
2050 REM Inverte la direzione della pallina dal basso verso l'alto
2100 REM ---------------------------------------------------------
2150 IF y=-21 THEN LET dy=-1: LET y=21
2200 REM -----------------------------------------
2250 REM Stampa le coordinate di debug della palla
2300 REM -----------------------------------------
2350 PRINT AT 0,0;"x:   ";AT 0,7;"y:   ";AT 0,15;"dy:   ";AT 0,23;"dx:   ";
2400 PRINT AT 0,0;"x:";x;AT 0,7;"y:";y;AT 0,15;"dy:";dy;AT 0,23;"dx:";dx
2450 PRINT AT 1,0;"px:";px;AT 1,7;"py:";py;AT 1,15;"c:";c$
2500 REM --------------------------------------------------------
2550 REM Pausa per rendere meno scattoso il movimento della palla
2600 REM --------------------------------------------------------
2650 REM PAUSE 0.5
2700 GO TO 850
