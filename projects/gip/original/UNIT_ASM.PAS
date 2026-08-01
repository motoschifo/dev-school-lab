Unit Unit_Asm;

Interface

uses crt,dos,graph;
type s80= string[80];

var eAX,eBX,eCX,eDX,eBP,eSI,eDI,eDS,eES,eFlags : word;
    ch: char;
    ks: string;
    t,u: integer;

procedure GRAFICA;
procedure TXT(x,y: word; col,fon,dim,jux,juy,bol: byte; cosa: s80);
procedure BEEP;
procedure _BYTE_COPY5;
procedure _BYTE_COPY6;
procedure _CRT_DEFAULT;
procedure WINCOPY(x1,y1,x2,y2: word; dovex,dovey: word);
procedure WINPAG(x1,y1,x2,y2: word; verso: byte);
procedure DEMO_COPYWIN;
procedure DEMO_WINPAG;
function VIDEO_MEM(x,y: word): word;

Implementation

procedure GRAFICA;
var errol: integer;
begin
t:=DETECT;
INITGRAPH(t,t,'d:\work\turbo\bgi');
errol:=GRAPHRESULT;
ks:=GraphErrorMsg(errol);
end;


procedure TXT(x,y: word; col,fon,dim,jux,juy,bol: byte; cosa: s80);
var m,n: byte;
begin
SETCOLOR(col);
SETTEXTSTYLE(fon,0,dim);
SETTEXTJUSTIFY(jux,juy);
case bol of
     0: OUTTEXTXY(x,y,cosa);
   255: begin OUTTEXTXY(x,y,cosa); OUTTEXTXY(x+1,y,cosa); end;
  else  for m:=0 to bol do
        for n:=0 to bol do
                        OUTTEXTXY(x+m,y+n,cosa);
  end;
end;


procedure BEEP;
begin
SOUND(200);
DELAY(100);
NOSOUND;
ch:=READKEY;
end;





procedure _BYTE_COPY5; ASSEMBLER;
(*                          Testo: SCHEDE GRAFICHE; pag. 408, listato 111 *)
(* INPUT

        eES:    Segmento memoria video ($A000 per EGA/VGA)
        eBX:    Spiazzamento byte (origine)
        eAX:    Spiazzamento byte (destinazione)
*)

ASM
(* ------------------------------------------------sezione di lettura byte *)
     MOV  ES,eES     (* segmento buffer video in ES *)
     MOV  SI,eBX     (* spiazz.  byte         in SI *)
     XOR  BL,BL      (* azzero bl                   *)
     MOV  DX,3CEh    (* PORT del controller CRT in DX *)

     MOV  AL,05h    (* AL: n. registro modalitÖ lettura/scrittura *)
     MOV  AH,00h    (* AH: modalitÖ lettura/scrittura a 0 *)
     OUT  DX,AX     (* imposto modalitÖ lettura 0  *)


     MOV  AL,04h     (* AL: n. registro piano di bit *)
     MOV  AH,03h     (* AH: piano di bit;  *)

@@1: OUT  DX,AX      (* seleziono piano di bit *)
     MOV  BH,ES:[SI] (* byte del piano di bit in BH *)
     PUSH BX
     DEC  AH         (* decremento il piano di bit (3..0) *)
     JGE  @@1        (* se AH >=0 salta al prossimo piano di bit (@@1) *)

(* ----------------------------------------------sezione di scrittura byte *)

     MOV  AL,03h    (* AL: n. registro rotazione dati *)
     MOV  AH,18h    (* AH: $18=legge,modifica,scrive bit *)
     OUT  DX,AX     (* imposto modalitÖ manipolazione bit *)

     MOV  AL,05h    (* AL: n. registro modalitÖ lettura/scrittura *)
     MOV  AH,08h    (* AH: modalitÖ lettura 1, scrittura 0 *)
     OUT  DX,AX     (* imposto modalitÖ   *)

     MOV  AL,07h    (* AL: n. registro colore ininfluente *)
     MOV  AH,00h    (* AH: $00=ininfluente per tutti i piani *)
     OUT  DX,AX     (* imposto registro colore ininf.   *)

     MOV  AL,08h    (* n. registro maschera bit in AL *)
     MOV  AH,$FF    (* maschera di bit totale *)
     OUT  DX,AX     (* imposto la maschera giusta (AH) nel registro del CRT (AL) *)

     MOV  DL,$C4    (* cosç DX diventa $3C4, n. porta I/O del CRT *)

     MOV  AL,02h    (* n. registro maschera di mappa ? *)
     MOV  AH,08h    (* AH=1000b    ? *)
     MOV  SI,eAX     (* spiazz.  byte         in SI *)

@@2: OUT  DX,AX
     POP  BX
     MOV  ES:[SI],BL
     SHR  AH,1
     JNZ  @@2
end;

procedure _BYTE_COPY6; ASSEMBLER;
(*                          Testo: SCHEDE GRAFICHE; pag. 408, listato 111 *)
(* INPUT

        eES:    Segmento memoria video ($A000 per EGA/VGA)
        eBX:    Spiazzamento byte (origine)
        eAX:    Spiazzamento byte (destinazione)
*)

ASM
(* ------------------------------------------------sezione di lettura byte *)
     MOV  ES,eES     (* segmento buffer video in ES *)
     MOV  SI,eBX     (* spiazz.  byte         in SI *)
     XOR  BL,BL      (* azzero bl                   *)
     MOV  DX,3CEh    (* PORT del controller CRT in DX *)

                    (* AL: n. registro modalitÖ lettura/scrittura *)
                    (* AH: modalitÖ lettura/scrittura a 0 *)
     MOV  AX,0005h
     OUT  DX,AX     (* imposto modalitÖ lettura 0  *)

                     (* AL: n. registro piano di bit *)
                     (* AH: piano di bit;  *)
     MOV  AX,0304h

@@1: OUT  DX,AX      (* seleziono piano di bit *)
     MOV  BH,ES:[SI] (* byte del piano di bit in BH *)
     PUSH BX
     DEC  AH         (* decremento il piano di bit (3..0) *)
     JGE  @@1        (* se AH >=0 salta al prossimo piano di bit (@@1) *)

(* ----------------------------------------------sezione di scrittura byte *)

                    (* AL: n. registro rotazione dati *)
                    (* AH: $18=legge,modifica,scrive bit *)
     MOV  AX,1803h
     OUT  DX,AX     (* imposto modalitÖ manipolazione bit *)

                    (* AL: n. registro modalitÖ lettura/scrittura *)
                    (* AH: modalitÖ lettura 1, scrittura 0 *)
     MOV  AX,0805h
     OUT  DX,AX     (* imposto modalitÖ   *)

                    (* AL: n. registro colore ininfluente *)
                    (* AH: $00=ininfluente per tutti i piani *)
     MOV  AX,0007h
     OUT  DX,AX     (* imposto registro colore ininf.   *)

                    (* n. registro maschera bit in AL *)
                    (* maschera di bit totale *)
     MOV  AX,$FF08
     OUT  DX,AX     (* imposto la maschera giusta (AH) nel registro del CRT (AL) *)

     MOV  DL,$C4    (* cosç DX diventa $3C4, n. porta I/O del CRT *)

                    (* n. registro maschera di mappa ? *)
                    (* AH=1000b    ? *)
     MOV  AX,0802h
     MOV  SI,eAX     (* spiazz.  byte         in SI *)

@@2: OUT  DX,AX
     POP  BX
     MOV  ES:[SI],BL
     SHR  AH,1
     JNZ  @@2
end;


procedure _CRT_DEFAULT; ASSEMBLER;
(*                          Testo: SCHEDE GRAFICHE; pag. 408, listato 111 *)

ASM
(* ripristino tutti i registri di default del CRT *)
     MOV  DX,03C4h   (* PORT maschera di mappa I/O del CRT *)
     MOV  AX,0F02h
     OUT  DX,AX

     MOV  DX,03CEh    (* PORT del controller CRT del CRT *)
     MOV  AX,0FF08h
     OUT  DX,AX
     MOV  AX,0005h
     OUT  DX,AX
     MOV  AX,0003h
     OUT  DX,AX
     MOV  AX,0001h
     OUT  DX,AX
end;



function VIDEO_MEM(x,y: word): word;
begin
VIDEO_MEM:=y*80+x DIV 8;
end;


procedure WINCOPY(x1,y1,x2,y2: word; dovex,dovey: word);
var byteXriga: byte;
    totrighe : integer;
    inizio   : word;
    i,j      : WORD;
    dove     : word;
    punt     : word;
    puntdove : word;

begin
eES:=$A000;
puntdove :=VIDEO_MEM(dovex,dovey);
punt     :=VIDEO_MEM(x1,y1);
byteXriga:=VIDEO_MEM(x2,y1)-inizio;
totrighe :=y2-y1;

for i:=0 to totrighe do
         begin
         for j:=0 to byteXriga do
                               begin
                               eBX:=punt+j;       (* byte origine (lettura) *)
                               eAX:=puntdove+j;    (* byte destinazione (scrittura) *)
                               _BYTE_COPY5;
                               end;
         punt:=punt+80;
         puntdove:=puntdove+80;
         end;
_CRT_DEFAULT;
end;


procedure WINPAG(x1,y1,x2,y2: word; verso: byte);
var byteXriga: byte;
    totrighe : integer;
    i,j      : WORD;
    dove     : word;
    spz0,spz1: word;

begin
eES:=$A000;
case verso of
           0: begin spz0:=$8000; spz1:=0; end;
           1: begin spz1:=$8000; spz0:=0; end;
           end;

dove     :=VIDEO_MEM(x1,y1);
byteXriga:=VIDEO_MEM(x2,y1)-dove;
totrighe :=y2-y1;

for i:=0 to totrighe do
         begin
         for j:=0 to byteXriga do
                    begin
                    eBX:=spz0+dove+j;    (* byte origine (lettura)        *)
                    eAX:=spz1+dove+j;    (* byte destinazione (scrittura) *)
                    _BYTE_COPY6;
                    end;
         dove:=dove+80;
         end;
_CRT_DEFAULT;
end;

procedure DEMO_COPYWIN;
var x,y,xf,yf: word;
begin
x:=9;
y:=100;
xf:=x+120;
yf:=y+100;
GRAFICA;
SETBKCOLOR(7);
SETCOLOR(8);
for t:= 0 to getmaxx do if t MOD 5=0 then LINE(t,0,t,getmaxy);

SETFILLSTYLE(1,9);
BAR(x,y,xf,yf);
SETCOLOR(15);
RECTANGLE(x,y,xf,yf);
TXT(x+10,y+5,3,0,0,0,2,0,'B');

TXT(10,310,1,0,0,0,2,0,'La finestra blu verra ricopiata. (premere un tasto ...)');

BEEP;
WINCOPY(x,y,xf,yf,xf+30,y+10);

BEEP;
CLOSEGRAPH;
end;

procedure DEMO_WINPAG;
var x,y,xf,yf: word;
begin
x:=180;
y:=10;
xf:=x+40;
yf:=y+80;
GRAFICA;
SETBKCOLOR(7);


SETCOLOR(8);
for t:= 0 to getmaxx do if t MOD 5=0 then LINE(t,0,t,getmaxy);
SETCOLOR(14);
SETLINESTYLE(0,0,3);
CIRCLE((x+xf) DIV 2,(y+yf) DIV 2,20);
SETLINESTYLE(0,0,0);
TXT(10,getmaxy-20,14,0,0,0,2,0,'(*) Il buffer video VGA ä insufficiente per contenere una');
TXT(10,getmaxy-10,14,0,0,0,2,0,'    una videata intera.');


WINPAG(x,y,xf,yf,1);
SETCOLOR(15);



SETLINESTYLE(1,2,1);
RECTANGLE(x,y,xf,yf);
SETLINESTYLE(0,0,0);
TXT(10,300,15,0,0,0,2,0,'[A]   L''area tratteggiata ä stata salvata. Premere un tasto ...');

BEEP;

SETFILLSTYLE(1,9);
BAR(x,y,xf,yf);
SETCOLOR(15);
RECTANGLE(x,y,xf,yf);


TXT(x+10,y+5,3,0,0,0,2,0,'B');
TXT(10,310,15,0,0,0,2,0,'[B]   Ho disegnato sull''area ...');

BEEP;
WINPAG(x,y,xf,yf,0);

TXT(10,320,15,0,0,0,2,0,'[C]   Ho ripristinato !');

BEEP;
CLOSEGRAPH;
end;
End.

