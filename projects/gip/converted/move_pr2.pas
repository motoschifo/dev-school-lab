Program Spostamento_Move;

Uses Crt,Graph;

Var Gd, Gm: Integer;
    I,J: LongInt;
    Step: Real;
    Ch: Char;

Procedure Riempi (Valore: Byte);
Begin
FillChar(Mem[$A000:0],38400,Valore);
End;


Procedure RiempiMetaSup (Valore: Byte);
Begin
FillChar(Mem[$A000:0],19200,Valore);
End;


Procedure RiempiMetaInf (Valore: Byte);
Begin
FillChar(Mem[$A000:19201],19200,Valore);
End;


Procedure Sposta8 (x1,y1,x2,y2,x3,y3: Integer);
Var I: LongInt;
Begin
Rectangle(x1*8,y1*8,x2*8,y2*8);
Rectangle(x3*8,y3*8,(x3+x2-x1)*8,(y3+y2-y1)*8);
{For i := x1*8 To x2*8 Do
  For j := y1*8 To y2*8 Do
    Move(Mem[$A000+i-1+(j-1)*80:0],
         Mem[$A000+x3-1*8+(y3-1)*80+i-1+(j-1)*80:0],(x2-x1+1)*8);}
End;


Begin

Gd := VGA;
Gm := VGAHI;
InitGraph(Gd,Gm,'c:\work\turbo7\bgi');

(*Line(0,0,200,200);
ReadLn;

For i := 0 To 200 Do
  Move(Mem[$A000:0000+i*(GetMaxX Div 8)+i],
       Mem[$A000:0010+i*(GetMaxX Div 8)+i],8);

Mem[$A000:1000] := 255;
Mem[$A000:1001] := 255;
ReadLn;*)

i := 255;
Repeat

(*  Repeat
    Riempi(Not i);
    i := i Shl 1;
    If i > 255 Then
      i := 1;
  Until KeyPressed;

  Ch := ReadKey;

  If (Ch <> #27)
    Then

      Begin*)
      i := 10000;
      Repeat
        Riempi(Not i);
        i := i Shr 1;
        If i < 1 Then
          i := 10000;
        Delay(5);
      Until KeyPressed;
      Ch := ReadKey;
  (*    End;*)

Until (Ch = #27);

(*i := 1;
j := 128;
Repeat

  Repeat
    RiempiMetaSup(Not i);
    RiempiMetaInf(Not j);
    i := i Shl 1;
    If i > 255 Then
      i := 1;
    j := j Shr 1;
    If j < 1 Then
      j := 128;
  Until KeyPressed;

  Ch := ReadKey;

  If (Ch <> #27)
    Then

      Begin
      Repeat
        RiempiMetaSup(Not j);
        RiempiMetaInf(Not i);
        i := i Shl 1;
        If i > 255 Then
          i := 1;
        j := j Shr 1;
        If j < 1 Then
          j := 128;
      Until KeyPressed;
      Ch := ReadKey;
      End;

Until (Ch = #27);

Riempi(0);
Line(3*8,3*8,10*8,5*8);
Sposta8(3,3,10,5,10,20);
ReadLn;*)

CloseGraph;

End.
