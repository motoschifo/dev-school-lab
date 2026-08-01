Program Spostamento_Move;

Uses Crt,Graph;

Var Gd, Gm: Integer;
    I,J: LongInt;
    Step: Real;
    Ch: Char;

Procedure WaitToWrite;
Begin { WaitToWrite }
Repeat
  { Maschera il 3º bit }
Until ((Port[$3DA] And $08) <> 0);
End; { WaitToWrite }

Procedure SpostaBasso ( Pixel: Integer;
                        Riemp: Byte );
Begin
Move(Mem[$A000+5*Pixel:0],Mem[$A000:0],38400-5*Pixel);
End;


Begin

Gd := VGA;
Gm := VGAHI;
InitGraph(Gd,Gm,'c:\tp6\bgi');

SetTextStyle(TriplexFont,HorizDir,5);
SetTextJustify(LeftText,TopText);
FillEllipse(100,100,20,30);
Line(0,0,200,200);
OutTextXY(10,100,'Testo di Prova');
OutTextXY(10,300,'Per lo scorrimento del video');
ReadLn;

{ 38400 locazioni di memoria (byte) }
Repeat

  WaitToWrite;
  SpostaBasso(1,Black);

Until KeyPressed;

ReadLn;
{CloseGraph;}
End.
