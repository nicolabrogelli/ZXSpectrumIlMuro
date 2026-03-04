Check DB983B70
Auto 8224

# Run-time Variables

Var y: Num = 10
Var x: Num = 26
Var l: Num = 11
Var m: Num = 3
Var v: Num = 1
Var d: Num = 1
Var dx: Num = 0
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 25
Var a: NumFOR = 5, 4, 1, 170, 2
Var b: NumFOR = 31, 30, 2, 180, 2
Var i: NumFOR = 21, 20, 1, 150, 2
Var c$: Str = ""
Var j$: Str = "b"
Var z$: Str = " "

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
 110 LET y=20: LET x=19: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET m=1: LET v=3: LET c$=""
 120 INK 2
 130 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 140 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 150 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 160 INVERSE 1
 170 FOR a=3 TO 4
 180 FOR b=1 TO 30 STEP 2
 190 INK m: PRINT AT a+2,b;"QE": LET m=m+1: IF m=6 THEN LET m=1
 200 NEXT b
 210 LET m=3
 220 NEXT a
 230 INVERSE 0
 240 REM -------------------------------------
 250 REM Posizionamento di default della palla
 260 REM -------------------------------------
 270 PRINT AT y,x;CHR$ 144
 280 REM -------------------------------
 290 REM decide la direzione della palla
 300 REM -------------------------------
 310 LET d=1: REM INT (RND*3)
 320 IF d=0 THEN LET dy=-1: LET dx=0
 330 IF d=1 THEN LET dy=-1: LET dx=-1
 340 IF d=2 THEN LET dy=-1: LET dx=+1
 350 IF d=3 THEN LET dy=0: LET dx=-1
 360 LET x=x+dx: LET y=y+dy
 370 REM -------------------------------------------------------------------------------
 380 REM                                  Loop del gioco
 390 REM ------------------------------------------------------------------------------
 400 REM -------------------------
 410 REM Gestione movimento player
 420 REM -------------------------
 430 PRINT AT py,px;"abc": REM \:'\''\':
 440 IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"abc "
 450 IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" abc": LET px=px+1
 460 REM -------------------------------------------
 470 REM Disegna la palla nelle coordinate calcolate
 480 REM -------------------------------------------
 490 INK 1: PRINT AT y,x;CHR$ 144: PRINT AT y-dy,x-dx;" "
 500 REM --------------------------------------------
 510 REM Gestione collisone con i mattoni
 520 REM quando la pannina va dal basso verso l'alto.
 530 REM Da affinare.
 540 REM --------------------------------------------
 550 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="Q" THEN PRINT AT y-1,x;"  ": LET dy=1: LET l=l+1: REM BEEP 0.01,4
 560 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="E" THEN PRINT AT y-1,x-1;"  ": LET dy=1: LET l=l+1: REM BEEP 0.01,4
 570 REM ------------------------------------
 580 REM Gestione collisione con i mattoni
 590 REM quando la pallina va dall'alto verso
 600 REM il basso.
 610 REM Da affinare.
 620 REM ------------------------------------
 630 IF dy=1 THEN LET z$= SCREEN$ (y+1,x): IF z$="Q" THEN PRINT AT y+1,x;"  ": LET dy=-1: LET l=l+1: REM  BEEP 0.01,4
 640 IF dy=1 THEN LET z$= SCREEN$ (y+1,x): IF z$="E" THEN PRINT AT y+1,x-1;"  ": LET dy=-1: LET l=l+1
 650 REM ----------------------------------------------------------------
 660 REM controlla la posizione della collisione della pallina sul player
 670 REM ----------------------------------------------------------------
 680 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="a" THEN LET dy=-1: LET dx=-1: REM BEEP 0.2,2
 690 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="b" THEN LET dy=-1: LET dx=0: REM BEEP 0.2,2
 700 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="c" THEN LET dy=-1: LET dx=1: REM BEEP 0.2,2
 710 REM
 720 IF y=3 THEN LET dy=1
 730 IF y=20 THEN LET dy=-1: LET v=v-1: REM  LET l=l-1
 740 IF x=1 THEN LET dx=1
 750 IF x=30 THEN LET dx=-1
 760 REM -----------------------------------------
 770 REM Stampa le coordinate di debug della palla
 780 REM -----------------------------------------
 790 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"v:    "
 800 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"v:";v
 810 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
 820 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
 830 REM --------------------------------------------------------
 840 REM Pausa per rendere meno scattoso il movimento della palla
 850 REM --------------------------------------------------------
 860 IF l=30 THEN CLS : PRINT AT 10,10;"BRAVO HAI VINTO!!": STOP
 870 IF v=0 THEN CLS : PRINT AT 10,10;"HAI PERSO!!!!": STOP
 880 LET y=y+dy: LET x=x+dx
 890 GO TO 400
 900 DATA 24,60,126,219,255,36,90,165
