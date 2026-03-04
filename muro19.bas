Check 7ECBDBAE
Auto 8224

# Run-time Variables

Var y: Num = 10
Var x: Num = 3
Var l: Num = 2
Var m: Num = 3
Var v: Num = 2
Var f: Num = 0
Var d: Num = 2
Var dx: Num = 1
Var dy: Num = 1
Var py: Num = 20
Var px: Num = 1
Var a: NumFOR = 5, 4, 1, 1000, 2
Var b: NumFOR = 31, 30, 2, 1050, 2
Var i: NumFOR = 21, 20, 1, 900, 2
Var s$: Str = ""
Var c$: Str = ""

# End Run-time Variables

 100 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 150 REM NOTE di aggiornamento
 200 REM
 250 REM Migliorata la collisione player - pallina
 300 REM Da migliorare la collisione pallina -> mattone,
 350 REM Possiamo mettere un flag per capre quale collisione e' stata effettuata
 400 REM i flag si resettano poi alliinizio del loop
 450 REM -----------------------------
 500 REM Dichiatazione delle variabili
 550 REM -----------------------------
 600 REM
 650 LET y=20: LET x=19: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET m=1: LET v=3: LET f=0: LET s$="": LET c$=""
 700 CLS : PRINT AT 10,8;"IL MURO by NICOLA": PAUSE 150: CLS
 750 INK 2
 800 REM FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 850 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 900 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 950 INVERSE 1
1000 FOR a=3 TO 4
1050 FOR b=1 TO 30 STEP 2
1100 INK m: PRINT AT a+2,b;"QE": LET m=m+1: IF m=6 THEN LET m=1
1150 NEXT b
1200 LET m=3
1250 NEXT a
1300 INVERSE 0
1350 REM -------------------------------------
1400 REM Posizionamento di default della palla
1450 REM -------------------------------------
1500 PRINT AT y,x;CHR$ 144
1550 REM -------------------------------
1600 REM decide la direzione della palla
1650 REM -------------------------------
1700 LET d=2: REM INT (RND*3)
1750 IF d=0 THEN LET dy=-1: LET dx=0
1800 IF d=1 THEN LET dy=-1: LET dx=-1
1850 IF d=2 THEN LET dy=-1: LET dx=+1
1900 IF d=3 THEN LET dy=0: LET dx=-1
1950 LET x=x+dx: LET y=y+dy
2000 REM -------------------------------------------------------------------------------
2050 REM                                  Loop del gioco
2100 REM ------------------------------------------------------------------------------
2150 REM -------------------------
2200 REM Gestione movimento player
2250 REM -------------------------
2300 PRINT AT py,px;"abc"
2350 IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"abc "
2400 IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" abc": LET px=px+1
2450 REM -------------------------------------------
2500 REM Disegna la palla nelle coordinate calcolate
2550 REM -------------------------------------------
2600 INK 1: PRINT AT y,x;CHR$ 144: PRINT AT y-dy,x-dx;" "
2650 REM --------------------------------------------
2700 REM Gestione collisone con i mattoni
2750 REM quando la pannina va dal basso verso l'alto.
2800 REM Da affinare.
2850 REM --------------------------------------------
2900 IF dy=-1 AND  SCREEN$ (y-1,x)="Q" THEN PRINT AT y-1,x;"  ": LET dy=1: LET l=l+1: LET f=1: REM BEEP 0.01,4
2950 IF dy=-1 AND  SCREEN$ (y-1,x)="E" THEN PRINT AT y-1,x-1;"  ": LET dy=1: LET l=l+1: LET f=1: REM BEEP 0.01,4
3000 REM ------------------------------------
3050 REM Gestione collisione con i mattoni
3100 REM quando la pallina va dall'alto verso
3150 REM il basso.
3200 REM Da affinare.
3250 REM ------------------------------------
3300 IF dy=1 AND  SCREEN$ (y+1,x)="Q" THEN PRINT AT y+1,x;"  ": LET dy=-1: LET l=l+1: REM  BEEP 0.01,4
3350 IF dy=1 AND  SCREEN$ (y+1,x)="E" THEN PRINT AT y+1,x-1;"  ": LET dy=-1: LET l=l+1
3400 REM -------------------------------------
3450 REM Gestione collisione con i mattoni
3500 REM quando la pallina si trova alla
3550 REM sinistra del mattone
3600 REM -------------------------------------
3650 IF f=0 THEN IF dy=-1 AND  SCREEN$ (y-1,x+1)="Q" THEN PRINT AT y-1,x+1;"  ": LET dy=1: LET l=l+1
3700 REM -------------------------------------
3750 REM Gestione collisione con i mattomni
3800 REM quando la pallina si trova alla
3850 REM sinistra del mattone
3900 REM -------------------------------------
3950 IF f=0 THEN IF dy=-1 AND  SCREEN$ (y-1,x-1)="E" THEN PRINT AT y-1,x-2;"  ": LET dy=1: LET l=l+1
4000 REM ----------------------------------------------------------------
4050 REM controlla la posizione della collisione della pallina sul player
4100 REM ----------------------------------------------------------------
4150 IF dy=1 AND  SCREEN$ (y+1,x)="a" THEN LET dy=-1: LET dx=-1: REM BEEP 0.2,2
4200 IF dy=1 AND  SCREEN$ (y+1,x)="b" THEN LET dy=-1: LET dx=0: REM BEEP 0.2,2
4250 IF dy=1 AND  SCREEN$ (y+1,x)="c" THEN LET dy=-1: LET dx=1: REM BEEP 0.2,2
4300 IF dy=1 AND dx<>0 AND  SCREEN$ (y+1,x+1)="a" THEN LET dy=-1: LET dx=-1
4350 IF dy=1 AND dx<>0 AND  SCREEN$ (y+1,x-1)="c" THEN LET dy=-1: LET dx=1
4400 REM
4450 IF y=3 THEN LET dy=1
4500 IF y=20 THEN LET dy=-1: LET v=v-1: GO SUB 5450
4550 IF x=1 THEN LET dx=1
4600 IF x=30 THEN LET dx=-1
4650 REM -----------------------------------------
4700 REM Stampa le coordinate di debug della palla
4750 REM -----------------------------------------
4800 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"v:    ";AT 0,18;"f:    "
4850 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"v:";v;AT 0,18;"f:";f
4900 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
4950 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
5000 REM ----------------------------------------
5050 REM Valuta se il player vuole giocare ancora
5100 REM ----------------------------------------
5150 IF l=30 THEN CLS : PRINT AT 10,10;"BRAVO HAI VINTO!!": STOP
5200 IF v=0 THEN CLS : PRINT AT 10,10;"HAI PERSO!!!!": INPUT "Un altra partita (s/n) ?";s$
5250 IF s$="s" THEN CLS : GO TO 650
5300 IF s$="n" THEN CLS : PRINT AT 10,10;"CIAO!!": STOP
5350 LET y=y+dy: LET x=x+dx
5400 LET f=0: GO TO 2150
5450 PRINT AT 10,10;"NOO!!!!!": PAUSE 120: PRINT AT 10,10;"        ":
5500 RETURN
5550 REM --------------------------
5600 REM Definizione caratteri USGs
5650 REM udg 1 - pallina
5700 REM udg 2,3,4 - bacchetta player
5750 REM --------------------------
5800 DATA 60,126,255,255,255,255,126,60: DATA 31,63,127,255,255,127,63,31: DATA 255,255,255,255,255,255,255,255: DATA 248,252,254,255,255,254,252,248
