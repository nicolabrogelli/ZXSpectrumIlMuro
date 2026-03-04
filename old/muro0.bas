Check CD9078DD
Auto 8224

# Run-time Variables

Var y: Num = 9
Var x: Num = 5
Var d: Num = 1
Var dx: Num = 1
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 0
Var c$: Str = ""

# End Run-time Variables

 100 REM -----------------------------
 150 REM Dichiatazione delle variabili
 200 REM -----------------------------
 250 LET y=21: LET x=15: LET dx=0: LET dy=0: LET py=20: LET px=0: LET c$=""
 300 REM -------------------------------------
 350 REM Posizionamento di default della palla
 400 REM -------------------------------------
 450 PRINT AT y,x;"x"
 500 REM -------------------------------
 550 REM decide la direzione della palla
 600 REM -------------------------------
 650 LET d=1: REM INT (RND*3)
 700 IF d=0 THEN LET dy=-1: LET dx=0
 750 IF d=1 THEN LET dy=-1: LET dx=-1
 800 IF d=2 THEN LET dy=-1: LET dx=+1
 850 IF d=3 THEN LET dy=0: LET dx=1
 900 REM -------------------------------------------
 950 REM Disegna la palla nelle coordinate calcolate
1000 REM -------------------------------------------
1050 PRINT AT y+dy,x+dx;"x": PRINT AT y,x;" "
1100 REM -------------------------------------------------------
1150 REM Inverte la direzione della pallina da sinistra a destra
1200 REM -------------------------------------------------------
1250 IF x=30 THEN LET dx=-1
1300 IF x=0 THEN LET dx=1
1350 IF y=-20 THEN LET dy=1
1355 IF y=20 THEN LET dy=-1
1400 LET x=x+dx: LET y=y+dy
1450 REM ---------------------------------------------------------
1500 REM Inverte la direzione della pallina dal basso verso l'alto
1550 REM ---------------------------------------------------------
1600 REM IF y=-21 THEN LET dy=-1: LET y=21
1650 REM -----------------------------------------
1700 REM Stampa le coordinate di debug della palla
1750 REM -----------------------------------------
1800 PRINT AT 0,0;"x:   ";AT 0,7;"y:   ";AT 0,15;"dy:   ";AT 0,23;"dx:   ";
1850 PRINT AT 0,0;"x:";x;AT 0,7;"y:";y;AT 0,15;"dy:";dy;AT 0,23;"dx:";dx
1900 PRINT AT 1,0;"px:";px;AT 1,7;"py:";py;AT 1,15;"c:";c$
1950 REM --------------------------------------------------------
2000 REM Pausa per rendere meno scattoso il movimento della palla
2050 REM --------------------------------------------------------
2100 REM PAUSE 2
2150 GO TO 900
