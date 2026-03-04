Check 3489A92A
Auto 8224

# Run-time Variables

Var y: Num = -25
Var x: Num = 24
Var l: Num = 4
Var m: Num = 3
Var v: Num = 3
Var d: Num = 1
Var dx: Num = 1
Var dy: Num = -11
Var py: Num = 20
Var px: Num = 18
Var a: NumFOR = 5, 4, 1, 900, 2
Var b: NumFOR = 31, 30, 2, 950, 2
Var i: NumFOR = 21, 20, 1, 800, 2
Var c$: Str = ""
Var z$: Str = "E"
Var j$: Str = "c"

# End Run-time Variables

 100 REM NOTE di aggiornamento
 150 REM Ottimizzazione del rimbalzo della pallina
 200 REM Aggiunta dell'Udgs personalizzato
 250 REM Aggiunta colori personalizzati
 300 REM Rimosso momentaneamente movimento del player
 350 REM
 400 REM -----------------------------
 450 REM Dichiatazione delle variabili
 500 REM -----------------------------
 550 REM
 600 LET y=20: LET x=19: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET m=1: LET v=3: LET c$=""
 650 INK 2
 700 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 750 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 800 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 850 INVERSE 1
 900 FOR a=3 TO 4
 950 FOR b=1 TO 30 STEP 2
1000 INK m: PRINT AT a+3,b;"QE": LET m=m+1: IF m=6 THEN LET m=1
1050 NEXT b
1100 LET m=3
1150 NEXT a
1200 INVERSE 0
1250 REM -------------------------------------
1300 REM Posizionamento di default della palla
1350 REM -------------------------------------
1400 PRINT AT y,x;CHR$ 144
1450 REM -------------------------------
1500 REM decide la direzione della palla
1550 REM -------------------------------
1600 LET d=1: REM INT (RND*3)
1650 IF d=0 THEN LET dy=-1: LET dx=0
1700 IF d=1 THEN LET dy=-1: LET dx=-1
1750 IF d=2 THEN LET dy=-1: LET dx=+1
1800 IF d=3 THEN LET dy=0: LET dx=-1
1850 LET x=x+dx: LET y=y+dy
1900 REM -------------------------------------------------------------------------------
1950 REM                                  Loop del gioco
2000 REM ------------------------------------------------------------------------------
2050 REM -------------------------
2100 REM Gestione movimento player
2150 REM -------------------------
2200 PRINT AT py,px;"abc": REM \:'\''\':
2250 IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"abc "
2300 IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" abc": LET px=px+1
2350 REM -------------------------------------------
2400 REM Disegna la palla nelle coordinate calcolate
2450 REM -------------------------------------------
2500 INK 1: PRINT AT y,x;CHR$ 144: PRINT AT y-dy,x-dx;" "
2550 REM ----------------------------------------------------------
2600 REM gestione collisone con i mattoni, non funziona maremma cane
2650 REM -----------------------------------------------------------
2700 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="Q" THEN PRINT AT y-1,x;"  ": LET dy=1: LET l=l+1: BEEP 0.01,4
2750 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="E" THEN PRINT AT y-1,x-1;"  ": LET dy=1: LET l=l+1: BEEP 0.01,4
2800 REM ----------------------------------------------------------------
2850 REM controlla la posizione della collisione della pallina sul player
2900 REM ----------------------------------------------------------------
2950 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="a" THEN LET dy=-1: LET dx=-1: BEEP 0.2,2
3000 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="b" THEN LET dy=-1: LET dx=0: BEEP 0.2,2
3050 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="c" THEN LET dy=-1: LET dx=1: BEEP 0.2,2
3100 REM  IF dy=1 THEN LET v$= SCREEN$ (y+2,x+dx): IF v$="Q" THEN PRINT AT y+2,x+dx;" ";AT y+2,x+dx;" ": LET dy=-1: LET l=l+1
3150 REM LET y=y+dy: LET x=x+dx
3200 REM
3250 IF y=3 THEN LET dy=1
3300 IF y=20 THEN LET dy=-1: LET v=v-1: REM  LET l=l-1
3350 IF x=1 THEN LET dx=1
3400 IF x=30 THEN LET dx=-1
3450 REM -----------------------------------------
3500 REM Stampa le coordinate di debug della palla
3550 REM -----------------------------------------
3600 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"v:    "
3650 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"v:";v
3700 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
3750 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
3800 REM --------------------------------------------------------
3850 REM Pausa per rendere meno scattoso il movimento della palla
3900 REM --------------------------------------------------------
3950 IF l=30 THEN CLS : PRINT AT 10,10;"BRAVO HAI VINTO!!": STOP
4000 IF v=0 THEN CLS : PRINT AT 10,10;"HAI PERSO!!!!": STOP
4050 LET y=y+dy: LET x=x+dx
4100 GO TO 2050
4150 DATA 24,60,126,219,255,36,90,165
