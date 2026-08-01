Program PresentazioneSlotMachine;

Uses Crt,Graph,Keyboard,GIPLink;

Var Gd,Gm,I,Dim,J,H,Ciclo: Integer;
    Step,OldX,OldY,X,Y: Integer;
    A: Real;
    Colore: Byte;
    Count: Word;
    Lettera: Char;
    Passato: Boolean;
    MaxStep: Word;
    Font1, Font2, Font3, Font4, Font5: Word;
    StepX,StepY: Real;
    MaxXDiv2,MaxYDiv2: Integer;
    Abort, Suono: Boolean;
    B: LongInt;
    Ch: Char;

Procedure WaitKey;
Var C: Char;
Begin
While KeyPressed Do
  C := ReadKey;
C := ReadKey;
End;


Procedure SpostaBasso ( Pixel: Integer );
Const Enable= $0F;
Var i1,i2: Integer;
    BegX,BegY,EndX,EndY:Integer;
    Base: Integer;
    ExistColor: Byte;
     Procedure Out (Index, Valore: Byte );
     Begin
     Port[$3CE] := Index;
     Port[$3CF] := Valore;
     End;
Begin
Move(Mem[$A000+5*Pixel:0],Mem[$A000:0],38405-5*Pixel);
End;


Procedure Riempi (Valore: Byte);
Begin
FillChar(Mem[$A000:0],38400,Valore);
End;


Procedure CtrlAbort;
Var Ch: Char;
Begin
If KeyPressed
  Then
    Begin
    Ch := ReadKey;
    If (Ch = kNull)
      Then
        Begin
        Ch := ReadKey;
        Case Ch Of
          kAX: Abort := Not Abort;
          kAS: Suono := Not Suono;
          End;
        End;
    End;
End;


Procedure MyClearViewPort;
Begin
Riempi(0);
End;


Procedure WaitToWrite;
Begin { WaitToWrite }
Repeat
  { Maschera il 3§ bit }
Until ((Port[$3DA] And $08) <> 0);
End; { WaitToWrite }


Procedure Disegna ( X,Y: Integer; Color:Byte; Stringa: String);
Var App: Char;
Begin
SetColor(Color);
OutTextXY(x,y,Stringa);
App := Succ(Lettera);
If (App > 'Z')
  Then
    App := 'A';
OutTextXY(x,y-128,App)
End;


Procedure DisegnaCar ( x,y: Integer; St: String; C: Byte );
Begin
SetColor(c);
OutTextXY(x,y,St);
End;


Procedure EspandiCar ( x,y: Integer; St: String; C: Byte;
                       MultX, DivX, MultY, DivY: Word );
Var AppX: Word;
    AppY: Word;
Begin
SetColor(c);
SetWriteMode(XOrPut);
AppX := 1;
NoSound;
Repeat
  SetUserCharSize(MultX,AppX,DivY,DivY);
  OutTextXY(x,y,St);
  SetUserCharSize(MultX,DivX,MultX,AppX);
  OutTextXY(x,y,St);
  If Suono
    Then
      Sound(AppX*100);
  WaitToWrite;

  SetUserCharSize(MultX,AppX,DivY,DivY);
  OutTextXY(x,y,St);
  SetUserCharSize(MultX,DivX,MultX,AppX);
  OutTextXY(x,y,St);

  Inc(AppX,4);
  CtrlAbort;
Until ((AppX > DivX) Or Abort);
AppY := DivY;
NoSound;
Repeat
  SetUserCharSize(MultX,DivX,AppY,DivY);
  OutTextXY(x,y,St);
  If Suono
    Then
      Sound(5000-AppY*100);
  WaitToWrite;
  OutTextXY(x,y,St);
  Inc(AppY,3);
  CtrlAbort;
Until ((AppY >= MultY) Or Abort);
NoSound;
SetWriteMode(NormalPut);
SetUserCharSize(MultX,DivX,MultY,DivY);
OutTextXY(x,y,St);
End;


Procedure DisegnaScorr ( X,Y: Integer; Color:Byte; Lettera: String);
Begin
SetColor(Color);
OutTextXY(x,y,Lettera);
End;


Procedure SpostaScorr (FinX,FinY: Integer; St: String; Dimensione: Byte);
Begin
MaxXDiv2 := GetMaxX Div 2;
MaxYDiv2 := GetMaxY Div 2;
a := 1;
Dim := 1;
SetTextStyle(Font1,HorizDir,Dim);
SetTextJustify(CenterText,CenterText);
SetWriteMode(XorPut);
NoSound;
Ciclo := 1;
Repeat
  x := Round(Sin(a)*60)+MaxXDiv2;
  y := Round(Cos(a)*60)+MaxYDiv2;
  DisegnaScorr(x,y,White,St);
  If Suono
    Then
      Sound(Round(10*a));
  WaitToWrite;
  DisegnaScorr(x,y,White,St);
  a := a+0.2;
  Inc(Step);
  If (Step >= 2)
    Then
      Begin
      Step := 0;
      Inc(Ciclo);
      If (Ciclo <= Dimensione*2)
        Then
          Begin
          Dim := Ciclo Div 2;
          SetTextStyle(Font1,HorizDir,Dim);
          End
      Else
        Dim := Dimensione;
      End;
  CtrlAbort;
Until ((Ciclo >= 33) Or Abort);
Dim := Dimensione;
SetTextStyle(Font1,HorizDir,Dim);
NoSound;

CtrlAbort;
If (Not Abort)
  Then
    For h := 1 To 2 Do
      Begin
      If (x < FinX)
        Then
          StepX := -10
      Else
        StepX := 10;
      If (y < FinY)
        Then
          StepY := -10
      Else
        StepY := 10;
      i := x;
      j := y;
      Repeat
        DisegnaScorr(Abs(i),Abs(FinY+Round((y-FinY)/(x-FinX)*(i-FinX))),
                     LightRed,St);
        WaitToWrite;
        i := i-Round(StepX);
        j := j-Round(StepY);
      Until (((i > FinX) And (StepX < 0.0)) Or
             ((i < FinX) And (StepX > 0.0)));
      End;

SetWriteMode(NormalPut);
i := 1;
j := 0;
DisegnaScorr(FinX+Round((x-FinX)/(y-FinY)*(i-1)),FinY+i-1,White,St);
Repeat
  DisegnaScorr(FinX+j,FinY+i,Yellow,St);
  WaitToWrite;
  DisegnaScorr(FinX+j,FinY+i,Blue,St);
  Inc(i);
  j := j+2;
Until (i > 10);
DisegnaScorr(FinX+j,FinY+i,Yellow,St);
End;


Procedure Scrivi ( InX, InY: Integer; Stringa: String; Dimensione: Byte );
Var K,Continuo,StepCont: Integer;
Begin
Continuo := 0;
For k := 1 To Length(Stringa) Do
  Begin
  If (Stringa[k] <> ' ')
    Then
      SpostaScorr(InX+Continuo,InY,Stringa[k],Dimensione);
  StepCont := 10;
  If (Stringa[k+1] In ['l','i'])
    Then
      StepCont := 0
  Else
    StepCont := 35;
  If k > 1
    Then
      Begin
      If Stringa[k] In ['l','i']
        Then
          StepCont := StepCont+30;
      End;
  Continuo := Continuo+TextWidth(Stringa[k])+StepCont;
  End;
End;


Procedure Info;
Const Vet: Array [1..17] Of String=
      ('',
       'Graphic Image Processor (G.I.P.) fa parte',
       'di una serie di 3 programmi scritti da',
       'FOCHI MICHELE per la tesina di maturit…',
       'dell'' anno scolastico 1992-93 (classe 5¦ A,',
       'specializzazione informatica).',
       '',
       'Per accellerare la presentazione',
       'Š sufficiente premere la combinazione',
       'dei tasti ALT-X, mentre per togliere',
       'il suono si utilizza la combinazione',
       'ALT-S.',
       '',
       'Questi tasti possono essere ripremuti per',
       'ripristinare le condizioni precedenti.',
       '',
       'Premi un tasto per continuare . . . . .');

Var TH,I,J: Integer;

Begin
SetTextStyle(Font5,HorizDir,3);
SetColor(White);
SetWriteMode(NormalPut);
SetTextJustify(CenterText,CenterText);
i := GetMaxY*5;
j := 1;
TH := TextHeight('X');
Repeat
  SpostaBasso(2);
  If (i Div TH) = (i / TH)
    Then
      If (j <= 17)
        Then
          Begin
          OutTextXY(GetMaxX Div 2,GetMaxY-50,Vet[j]);
          Inc(j);
          If i > 17 Then i := GetMaxY-50;
          End;
  Dec(i,2);
Until KeyPressed Or (i <= -TH);

While KeyPressed Do
  Ch := ReadKey;

MyClearViewPort;
End;


Procedure SlotMachine;
Begin
SetColor(LightMagenta);
Rectangle(0,0,GetMaxX,GetMaxY);
SetTextStyle(Font3,HorizDir,10);
SetTextJustify(CenterText,CenterText);
SetFillStyle(SolidFill,Black);
SetColor(White);
For j := 0 To 2 Do
  Begin
  Case j Of
    0: Colore := Yellow;
    1: Colore := LightBlue;
    2: Colore := LightMagenta;
    End;
  SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
  SetColor(White);
  Rectangle(j*150+100-1-10,300-1-2,j*150+204+1+2,428+1-10);
  Bar(j*150+100-1-10+1,300-1-2+1,j*150+204+1+2-1,428+1-10-1);
  SetViewPort(j*150+100,300-2,j*150+204+2,428-10,ClipOn);
  Disegna(52,38,Colore,'A');
  End;
For j := 0 To 2 Do
  Begin
  Case j Of
    0: Colore := Yellow;
    1: Colore := LightBlue;
    2: Colore := LightMagenta;
    End;
  SetViewPort(j*150+100,300-2,j*150+204+2,428-10,ClipOn);
  SetTextStyle(Font3,HorizDir,10);
  Step := 64;
  Count := 0;
  i := -64;
  Lettera := 'A';
  MaxStep := i;
  Passato := False;
  Disegna(52,38,Black,'A');
  Repeat
    Inc(Count);
    Disegna(52,i,Colore,Lettera);
    WaitToWrite;
    Delay(30);
    Disegna(52,i,Black,Lettera);
    Inc(i,Step);
    If (Count >= MaxStep)
      Then
        Dec(Step);
    If (i >= 164)
      Then
        Begin
        NoSound;
        If Suono
          Then
            Begin
            Sound(100);
            Delay(10);
            NoSound;
            Delay(5);
            NoSound;
            End;
        i := 38;
        If (Not Passato)
          Then
            MaxStep := i;
        Lettera := Succ(Lettera);
        If (Lettera > 'Z')
          Then
            Begin
	    Lettera := 'A';
            Passato := True;
            Case j Of
	      0: MaxStep := 66;
	      1: MaxStep := 73;
	      2: MaxStep := 102;
              End;
            End;
        End;
    CtrlAbort;
  Until ((Step <= 0) Or Abort);
  NoSound;
  If Suono
    Then
      Begin
      Sound(1000);
      Delay(100);
      NoSound;
      End;
  Case j Of
    0: Lettera := 'G';
    1: Lettera := 'I';
    2: Lettera := 'P';
    End;
  Disegna(52,38,Colore,Lettera);
  SetTextStyle(Font4,HorizDir,3);
  SetColor(Brown);
  SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
  Case j Of
    0: EspandiCar(151,210,'Graphic',Yellow,100,80,40,10);
    1: EspandiCar(301,210,'Image',LightBlue,100,67,40,10);
    2: EspandiCar(451,210,'Processor',LightMagenta,100,100,40,10);
    End;
  End;

SetWriteMode(NormalPut);

End;


Procedure EndPres;
Begin
Randomize;
B := 1;
Repeat
  Mem[$A000:Random(38400)] := 0;
  Inc(B);
Until (KeyPressed Or (B >= 150000));

CloseGraph;
End;


Begin {* MAIN *}

Gd := VGA;
Gm := VGAHI;
InitGraph(Gd,Gm,'c:\tp6\bgi');
SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
Abort := False;
Suono := True;

Font1 := 9;
Font2 := 6;
Font3 := TriplexFont;
Font4 := 5;
Font5 := 7;

Info;

Scrivi(140,70,'Fochi',8);
Scrivi(100,260,'Michele',7);

{ effetto elastico per 'e' e 'presentano' }
SetTextStyle(Font2,HorizDir,3);
SetTextJustify(CenterText,CenterText);
EspandiCar(320,380,'... e ...',LightGreen,100,96,40,10);

WaitKey;

MyClearViewPort;
Scrivi(100,70,'Amatulli',6);
Scrivi(150,260,'Davide',7);

SetTextStyle(Font2,HorizDir,3);
SetTextJustify(CenterText,CenterText);
EspandiCar(320,380,'presentano',LightGreen,100,96,40,10);
WaitKey;
MyClearViewPort;

SlotMachine;
WaitKey;
EndPres;

End. {* MAIN *}
