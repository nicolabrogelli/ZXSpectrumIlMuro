Check 12A4BA25
Auto 8224

# Run-time Variables

Var y: Num = 8
Var x: Num = 21
Var l: Num = 15
Var m: Num = 3
Var v: Num = 3
Var d: Num = 1
Var dx: Num = 1
Var dy: Num = 1
Var py: Num = 20
Var px: Num = 8
Var a: NumFOR = 5, 4, 1, 170, 2
Var b: NumFOR = 31, 30, 2, 180, 2
Var i: NumFOR = 21, 20, 1, 150, 2
Var c$: Str = ""
Var z$: Str = "E"
Var j$: Str = " "

# End Run-time Variables

  10 REM NOTE di aggiornamento
  20 REM Ottimizzazione del rimbalzo della pallina
  30 REM Aggiunta dell'Udgs personalizzato
  40 REM Aggiunta colori personalizzati
  50 REM Rimosso momentaneamente movimento del player
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
 190 INK m: PRINT AT a+3,b;"QE": LET m=m+1: IF m=6 THEN LET m=1
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
 430 PRINT AT py,px;"aaa": REM \:'\''\':
 440 IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"aaa "
 450 IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" aaa": LET px=px+1
 460 REM -------------------------------------------
 470 REM Disegna la palla nelle coordinate calcolate
 480 REM -------------------------------------------
 490 INK 1: PRINT AT y,x;CHR$ 144: PRINT AT y-dy,x-dx;" "
 500 REM ----------------------------------------------------------
 510 REM gestione collisone con i mattoni, non funziona maremma cane
 520 REM -----------------------------------------------------------
 530 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="Q" THEN PRINT AT y-1,x;"  ": LET dy=1: LET l=l+1: BEEP 0.01,4
 540 IF dy=-1 THEN LET z$= SCREEN$ (y-1,x): IF z$="E" THEN PRINT AT y-1,x-1;"  ": LET dy=1: LET l=l+1: BEEP 0.01,4
 550 IF dy=1 THEN LET j$= SCREEN$ (y+1,x): IF j$="a" THEN LET dy=-1: BEEP 0.2,2
 560 REM  IF dy=1 THEN LET v$= SCREEN$ (y+2,x+dx): IF v$="Q" THEN PRINT AT y+2,x+dx;" ";AT y+2,x+dx;" ": LET dy=-1: LET l=l+1
 570 REM LET y=y+dy: LET x=x+dx
 580 REM
 590 IF y=3 THEN LET dy=1
 600 IF y=20 THEN LET dy=-1: LET v=v-1: REM  LET l=l-1
 610 IF x=1 THEN LET dx=1
 620 IF x=30 THEN LET dx=-1
 630 REM -----------------------------------------
 640 REM Stampa le coordinate di debug della palla
 650 REM -----------------------------------------
 660 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"v:    "
 670 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"v:";v
 680 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
 690 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
 700 REM --------------------------------------------------------
 710 REM Pausa per rendere meno scattoso il movimento della palla
 720 REM --------------------------------------------------------
 730 IF l=30 THEN CLS : PRINT AT 10,10;"BRAVO HAI VINTO!!": STOP
 731 IF v=0 THEN CLS : PRINT AT 10,10;"HAI PERSO!!!!": STOP
 740 LET y=y+dy: LET x=x+dx
 750 GO TO 400
 760 DATA 24,60,126,219,255,36,90,165
