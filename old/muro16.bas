Check 8D29719D
Auto 8224

# Run-time Variables

Var y: Num = 6
Var x: Num = 2
Var l: Num = 30
Var m: Num = 3
Var v: Num = 1
Var d: Num = 0
Var dx: Num = -1
Var dy: Num = 1
Var py: Num = 20
Var px: Num = 12
Var a: NumFOR = 5, 4, 1, 180, 2
Var b: NumFOR = 31, 30, 2, 190, 2
Var i: NumFOR = 21, 20, 1, 160, 2
Var s$: Str = ""
Var c$: Str = ""
Var z$: Str = " "
Var j$: Str = " "

# End Run-time Variables

  10 REM NOTE di aggiornamento
  20 REM
  30 REM Da migliorare la collisione pallina -> player
  40 REM Da migliorare la collisione pallina -> mattone,
  50 REM
  60 REM
  70 REM -----------------------------
  80 REM Dichiatazione delle variabili
  90 REM -----------------------------
 100 REM
 110 LET y=20: LET x=19: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET m=1: LET v=3: LET s$="": LET c$=""
 120 CLS : PRINT AT 10,8;"IL MURO by NICOLA": PAUSE 150: CLS
 130 INK 2
 140 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 150 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 160 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 170 INVERSE 1
 180 FOR a=3 TO 4
 190 FOR b=1 TO 30 STEP 2
 200 INK m: PRINT AT a+2,b;"QE": LET m=m+1: IF m=6 THEN LET m=1
 210 NEXT b
 220 LET m=3
 230 NEXT a
 240 INVERSE 0
 250 REM -------------------------------------
 260 REM Posizionamento di default della palla
 270 REM -------------------------------------
 280 PRINT AT y,x;CHR$ 144
 290 REM -------------------------------
 300 REM decide la direzione della palla
 310 REM -------------------------------
 320 LET d=INT (RND*3)
 330 IF d=0 THEN LET dy=-1: LET dx=0
 340 IF d=1 THEN LET dy=-1: LET dx=-1
 350 IF d=2 THEN LET dy=-1: LET dx=+1
 360 IF d=3 THEN LET dy=0: LET dx=-1
 370 LET x=x+dx: LET y=y+dy
 380 REM -------------------------------------------------------------------------------
 390 REM                                  Loop del gioco
 400 REM ------------------------------------------------------------------------------
 410 REM -------------------------
 420 REM Gestione movimento player
 430 REM -------------------------
 440 PRINT AT py,px;"abc": REM \:'\''\':
 450 IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"abc "
 460 IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" abc": LET px=px+1
 470 REM -------------------------------------------
 480 REM Disegna la palla nelle coordinate calcolate
 490 REM -------------------------------------------
 500 INK 1: PRINT AT y,x;CHR$ 144: PRINT AT y-dy,x-dx;" "
 510 REM --------------------------------------------
 520 REM Gestione collisone con i mattoni
 530 REM quando la pannina va dal basso verso l'alto.
 540 REM Da affinare.
 550 REM --------------------------------------------
 560 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="Q" THEN PRINT AT y-1,x;"  ": LET dy=1: LET l=l+1: REM BEEP 0.01,4
 570 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="E" THEN PRINT AT y-1,x-1;"  ": LET dy=1: LET l=l+1: REM BEEP 0.01,4
 580 REM ------------------------------------
 590 REM Gestione collisione con i mattoni
 600 REM quando la pallina va dall'alto verso
 610 REM il basso.
 620 REM Da affinare.
 630 REM ------------------------------------
 640 IF dy=1 THEN LET z$= SCREEN$ (y+1,x): IF z$="Q" THEN PRINT AT y+1,x;"  ": LET dy=-1: LET l=l+1: REM  BEEP 0.01,4
 650 IF dy=1 THEN LET z$= SCREEN$ (y+1,x): IF z$="E" THEN PRINT AT y+1,x-1;"  ": LET dy=-1: LET l=l+1
 660 REM -------------------------------------
 670 REM Gestione collisione con i mattoni
 680 REM quando la pallina si trova alla
 690 REM sinistra del mattone
 700 REM -------------------------------------
 710 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x+1): IF z$="Q" THEN PRINT AT y-1,x+1;"  ": LET dy=1: LET l=l+1
 720 REM -------------------------------------
 730 REM Gestione collisione con i mattomni
 740 REM quando la pallina si trova alla
 750 REM sinistra del mattone
 760 REM -------------------------------------
 770 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x-1): IF z$="E" THEN PRINT AT y-1,x-2;"  ": LET dy=1: LET l=l+1
 780 REM ----------------------------------------------------------------
 790 REM controlla la posizione della collisione della pallina sul player
 800 REM ----------------------------------------------------------------
 810 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="a" THEN LET dy=-1: LET dx=-1: REM BEEP 0.2,2
 820 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="b" THEN LET dy=-1: LET dx=0: REM BEEP 0.2,2
 830 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="c" THEN LET dy=-1: LET dx=1: REM BEEP 0.2,2
 840 REM
 850 IF y=3 THEN LET dy=1
 860 IF y=20 THEN LET dy=-1: LET v=v-1: GO SUB 1030: REM  LET l=l-1
 870 IF x=1 THEN LET dx=1
 880 IF x=30 THEN LET dx=-1
 890 REM -----------------------------------------
 900 REM Stampa le coordinate di debug della palla
 910 REM -----------------------------------------
 920 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"v:    "
 930 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"v:";v
 940 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
 950 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
 960 REM --------------------------------------------------------
 970 REM Pausa per rendere meno scattoso il movimento della palla
 980 REM --------------------------------------------------------
 990 IF l=30 THEN CLS : PRINT AT 10,10;"BRAVO HAI VINTO!!": STOP
1000 IF v=0 THEN CLS : PRINT AT 10,10;"HAI PERSO!!!!": INPUT "Un altra partita (s/n) ?";s$
1001 IF s$="s" THEN CLS : GO TO 150
1002 IF s$="n" THEN CLS : PRINT AT 10,10;"CIAO!!": STOP
1010 LET y=y+dy: LET x=x+dx
1020 GO TO 410
1030 PRINT AT 10,10;"NOO!!!!!": PAUSE 120: PRINT AT 10,10;"        ":
1040 RETURN
1050 DATA 60,126,255,255,255,255,126,60
