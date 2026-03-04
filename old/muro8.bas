Check A860E677
Auto 8224

# Run-time Variables

Var y: Num = 11
Var x: Num = 30
Var l: Num = 14
Var d: Num = 1
Var dx: Num = -1
Var dy: Num = -1
Var py: Num = 20
Var px: Num = 1
Var a: NumFOR = 5, 4, 1, 140, 2
Var b: NumFOR = 31, 30, 1, 150, 2
Var i: NumFOR = 21, 20, 1, 130, 2
Var c$: Str = ""
Var z$: Str = " "

# End Run-time Variables

  10 REM NOTE di aggiornamento
  20 REM Ottimizzazione del rimbalzo della pallina
  30 REM Aggiunta dell'Udgs personalizzato
  40 REM Aggiunta colori personalizzati
  50 REM Rimosso momentaneamente movimento del player
  60 REM -----------------------------
  70 REM Dichiatazione delle variabili
  80 REM -----------------------------
  90 LET y=20: LET x=17: LET dx=0: LET dy=0: LET py=20: LET px=1: LET a=0: LET b=0: LET l=0: LET c$=""
 100 INK 2
 110 FOR a=0 TO 7: READ b: POKE a+USR CHR$ 144,b: NEXT a
 120 PRINT AT 2,0;"\:'";AT 2,31;"\':";AT 21,0;"\:.";AT 21,31;"\.:": FOR i=1 TO 30: PRINT AT 2,i;"\''";AT 21,i;"\..": NEXT i
 130 FOR i=3 TO 20: PRINT AT i,0;"\: ";AT i,31;"\ :": NEXT i
 131 INVERSE 1
 140 FOR a=3 TO 4
 150 FOR b=1 TO 30
 160 INK a: PRINT AT a+3,b;"."
 170 NEXT b
 180 NEXT a
 181 INVERSE 0
 190 REM -------------------------------------
 200 REM Posizionamento di default della palla
 210 REM -------------------------------------
 220 PRINT AT y,x;CHR$ 144
 230 REM -------------------------------
 240 REM decide la direzione della palla
 250 REM -------------------------------
 260 LET d=1: REM INT (RND*3)
 270 IF d=0 THEN LET dy=-1: LET dx=0
 280 IF d=1 THEN LET dy=-1: LET dx=-1
 290 IF d=2 THEN LET dy=-1: LET dx=+1
 300 IF d=3 THEN LET dy=0: LET dx=-1
 310 REM -------------------------------------------------------------------------------
 320 REM                                  Loop del gioco
 330 REM ------------------------------------------------------------------------------
 340 REM -------------------------
 350 REM Gestione movimento player
 360 REM -------------------------
 370 REM PRINT AT py,px;"aba": REM \:'\''\':
 380 REM IF INKEY$="o" AND px>1 THEN LET px=px-1: PRINT AT py,px;"aba "
 390 REM IF INKEY$="p" AND px<=27 THEN PRINT AT py,px;" aba": LET px=px+1
 400 REM -------------------------------------------
 410 REM Disegna la palla nelle coordinate calcolate
 420 REM -------------------------------------------
 430 INK 1: PRINT AT y+dy,x+dx;CHR$ 144: PRINT AT y,x;" "
 440 REM --------------------------------
 450 REM gestione collisone con i mattoni
 460 REM --------------------------------
 470 LET z$= SCREEN$ (y-2,x+dx): IF z$="." THEN PRINT AT y-2,x+dx;" ";AT y-1,x+dx;" ": LET dy=1: LET l=l+1
 480 REM -------------------------------------------------------
 490 REM Inverte la direzione della pallina da sinistra a destra
 500 REM -------------------------------------------------------
 510 LET y=y+dy: LET x=x+dx
 520 IF y=3 THEN LET dy=1
 530 IF y=20 THEN LET dy=-1: REM  LET l=l-1
 540 IF x=1 THEN LET dx=1
 550 IF x=30 THEN LET dx=-1
 560 REM -----------------------------------------
 570 REM Stampa le coordinate di debug della palla
 580 REM -----------------------------------------
 590 INK 0: PRINT AT 0,0;"x:   ";AT 0,6;"dx:   ";AT 0,12;"c:    "
 600 PRINT AT 0,0;"x:";x;AT 0,6;"dx:";dx;AT 0,12;"c:";c$
 611 PRINT AT 1,0;"y:   ";AT 1,6;"dy:   ";AT 1,12;"l:    "
 612 PRINT AT 1,0;"y:";y;AT 1,6;"dy:";dy;AT 1,12;"l:";l
 620 REM --------------------------------------------------------
 630 REM Pausa per rendere meno scattoso il movimento della palla
 640 REM --------------------------------------------------------
 650 REM PAUSE 0.5
 660 REM IF l=0 THEN STOP
 670 GO TO 340
 680 DATA 24,60,126,219,255,36,90,165
