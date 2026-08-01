Program Spostamento_Move;

Uses Crt,Graph;

Var Gd, Gm: Integer;
    I,J: LongInt;

Begin

Gd := VGA;
Gm := VGAHI;
InitGraph(Gd,Gm,'c:\work\turbo7\bgi');

Line(0,0,200,200);
ReadLn;

For i := 0 To 200 Do
  Move(Mem[$A000:0000+i*(GetMaxX Div 8)+i],
       Mem[$A000:0010+i*(GetMaxX Div 8)+i],8);

Mem[$A000:1000] := 255;
Mem[$A000:1001] := 255;

ReadLn;

Mem[$A001:0] := 255;
i := 0;
Repeat

  For j := 0 To 2399 Do
    Mem[$A000+j:i] := 255;
{  Delay(100);}
  Inc(i);

Until i > 16;


ReadLn;

CloseGraph;

End.
