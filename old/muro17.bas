Check B8A4DC94
Auto 8224

# Run-time Variables

Var y: Num = 19
Var x: Num = 10
Var l: Num = 1
Var m: Num = 3
Var v: Num = 2
Var d: Num = 1
Var dx: Num = 1
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 1
Var a: NumFOR = 5, 4, 1, 180, 2
Var b: NumFOR = 31, 30, 2, 190, 2
Var i: NumFOR = 21, 20, 1, 160, 2
Var s$: Str = ""
Var c$: Str = ""
Var j$: Str = ""
Var z$: Str = " "

# End Run-time Variables

  10 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
  20 REM NOTE di aggiornamento
  30 REM
  40 REM Da migliorare la collisione pallina -> player
  50 REM Da migliorare la collisione pallina -> mattone,
  60 REM
  70 REM
  80 REM -----------------------------
  90 REM Dichiatazione delle variabili
 100 REM -----------------------------
 110 REM
 120 LET y=20: LET x=19: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET m=1: LET v=3: LET s$="": LET c$=""
 130 CLS : PRINT AT 10,8;"IL MURO by NICOLA": PAUSE 150: CLS
 140 INK 2
 150 REM FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 160 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 170 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 180 INVERSE 1
 190 FOR a=3 TO 4
 200 FOR b=1 TO 30 STEP 2
 210 INK m: PRINT AT a+2,b;"QE": LET m=m+1: IF m=6 THEN LET m=1
 220 NEXT b
 230 LET m=3
 240 NEXT a
 250 INVERSE 0
 260 REM -------------------------------------
 270 REM Posizionamento di default della palla
 280 REM -------------------------------------
 290 PRINT AT y,x;CHR$ 144
 300 REM -------------------------------
 310 REM decide la direzione della palla
 320 REM -------------------------------
 330 LET d=1: REM INT (RND*3)
 340 IF d=0 THEN LET dy=-1: LET dx=0
 350 IF d=1 THEN LET dy=-1: LET dx=-1
 360 IF d=2 THEN LET dy=-1: LET dx=+1
 370 IF d=3 THEN LET dy=0: LET dx=-1
 380 LET x=x+dx: LET y=y+dy
 390 REM -------------------------------------------------------------------------------
 400 REM                                  Loop del gioco
 410 REM ------------------------------------------------------------------------------
 420 REM -------------------------
 430 REM Gestione movimento player
 440 REM -------------------------
 450 PRINT AT py,px;"abc": REM \:'\''\':
 460 IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"abc "
 470 IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" abc": LET px=px+1
 480 REM -------------------------------------------
 490 REM Disegna la palla nelle coordinate calcolate
 500 REM -------------------------------------------
 510 INK 1: PRINT AT y,x;CHR$ 144: PRINT AT y-dy,x-dx;" "
 520 REM --------------------------------------------
 530 REM Gestione collisone con i mattoni
 540 REM quando la pannina va dal basso verso l'alto.
 550 REM Da affinare.
 560 REM --------------------------------------------
 570 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="Q" THEN PRINT AT y-1,x;"  ": LET dy=1: LET l=l+1: REM BEEP 0.01,4
 580 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="E" THEN PRINT AT y-1,x-1;"  ": LET dy=1: LET l=l+1: REM BEEP 0.01,4
 590 REM ------------------------------------
 600 REM Gestione collisione con i mattoni
 610 REM quando la pallina va dall'alto verso
 620 REM il basso.
 630 REM Da affinare.
 640 REM ------------------------------------
 650 IF dy=1 THEN LET z$= SCREEN$ (y+1,x): IF z$="Q" THEN PRINT AT y+1,x;"  ": LET dy=-1: LET l=l+1: REM  BEEP 0.01,4
 660 IF dy=1 THEN LET z$= SCREEN$ (y+1,x): IF z$="E" THEN PRINT AT y+1,x-1;"  ": LET dy=-1: LET l=l+1
 670 REM -------------------------------------
 680 REM Gestione collisione con i mattoni
 690 REM quando la pallina si trova alla
 700 REM sinistra del mattone
 710 REM -------------------------------------
 720 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x+1): IF z$="Q" THEN PRINT AT y-1,x+1;"  ": LET dy=1: LET l=l+1
 730 REM -------------------------------------
 740 REM Gestione collisione con i mattomni
 750 REM quando la pallina si trova alla
 760 REM sinistra del mattone
 770 REM -------------------------------------
 780 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x-1): IF z$="E" THEN PRINT AT y-1,x-2;"  ": LET dy=1: LET l=l+1
 790 REM ----------------------------------------------------------------
 800 REM controlla la posizione della collisione della pallina sul player
 810 REM ----------------------------------------------------------------
 820 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="a" THEN LET dy=-1: LET dx=-1: REM BEEP 0.2,2
 830 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="b" THEN LET dy=-1: LET dx=0: REM BEEP 0.2,2
 840 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="c" THEN LET dy=-1: LET dx=1: REM BEEP 0.2,2
 850 REM
 860 IF y=3 THEN LET dy=1
 870 IF y=20 THEN LET dy=-1: LET v=v-1: GO SUB 1060: REM  LET l=l-1
 880 IF x=1 THEN LET dx=1
 890 IF x=30 THEN LET dx=-1
 900 REM -----------------------------------------
 910 REM Stampa le coordinate di debug della palla
 920 REM -----------------------------------------
 930 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"v:    "
 940 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"v:";v: REM FOR h=1 TO v: PRINT AT 0,14+h;CHR$ 144: NEXT h
 950 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
 960 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
 970 REM ----------------------------------------
 980 REM Valuta se il player vuole giocare ancora
 990 REM ----------------------------------------
1000 IF l=30 THEN CLS : PRINT AT 10,10;"BRAVO HAI VINTO!!": STOP
1010 IF v=0 THEN CLS : PRINT AT 10,10;"HAI PERSO!!!!": INPUT "Un altra partita (s/n) ?";s$
1020 IF s$="s" THEN CLS : GO TO 120
1030 IF s$="n" THEN CLS : PRINT AT 10,10;"CIAO!!": STOP
1040 LET y=y+dy: LET x=x+dx
1050 GO TO 420
1060 PRINT AT 10,10;"NOO!!!!!": PAUSE 120: PRINT AT 10,10;"        ":
1070 RETURN
1080 REM --------------------------
1090 REM Definizione caratteri USGs
1091 REM udg 1 - pallina
1092 REM udg 2,3,4 - bacchetta player
1100 REM --------------------------
1110 DATA 60,126,255,255,255,255,126,60: DATA 31,63,127,255,255,127,63,31: DATA 255,255,255,255,255,255,255,255: DATA 248,252,254,255,255,254,252,248
