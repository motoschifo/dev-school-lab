Unit GIPImage;

Interface { GIPImage }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit,GIPGraph,GIPBase;


Procedure InserisciFigura ( nFigura: Word;
                            nLineSt: Word;
                            nLinePt: Word;
                            nLineTh: Word;
                            nColLin: Word;
                            nRetino: Word;
                            nColRet: Word;
                            nWord1:  Integer;
                            nWord2:  Integer;
                            nWord3:  Integer;
                            nWord4:  Integer;
                            nWord5:  Integer;
                            nWord6:  Integer);


Procedure InserisciStringa ( nSt: String );

Procedure RefreshScreen;

{===========================================================================}
{ PROCEDURA: TYPER                                                          }
{                                                                           }
{ Visualizza sul video (in modalit… testo) la stringa specificata come pa_  }
{ rametro in una maniera diversa dal normale (come una macchina da scrive_  }
{ re).                                                                      }
{===========================================================================}
Procedure Typer ( Stringa: String;
		  Riga:    Byte;
		  Colonna: Byte );


Procedure EndProgram;


Implementation { GIPImage }


Procedure InserisciFigura ( nFigura: Word;
                            nLineSt: Word;
                            nLinePt: Word;
                            nLineTh: Word;
                            nColLin: Word;
                            nRetino: Word;
                            nColRet: Word;
                            nWord1:  Integer;
                            nWord2:  Integer;
                            nWord3:  Integer;
                            nWord4:  Integer;
                            nWord5:  Integer;
                            nWord6:  Integer);
Var AppPTR: PTROperation;
Begin { InserisciFigura }
If (InizioOp = NIL)
  Then
    Begin
    New(InizioOp);
    InizioOp^.Last := NIL;
    InizioOp^.Next := NIL;
    FineOp := InizioOp;
    Operation := InizioOp;
    End
Else
  Begin
  Operation := FineOp;
  New(AppPTR);
  AppPTR^.Last := Operation;
  AppPTR^.Last^.Next := AppPTR;
  AppPTR^.Next := NIL; {Operation^.Next;}
  FineOp := AppPTR;
  Operation := AppPTR;
  OpSelected := Operation;
  End;
With Operation^.Op Do
  Begin
  Figura := nFigura;
  LineSt := nLineSt;
  LinePt := nLinePt;
  LineTh := nLineTh;
  ColLin := nColLin;
  Retino := nRetino;
  ColRet := nColRet;
  Word1 := nWord1;
  Word2 := nWord2;
  Word3 := nWord3;
  Word4 := nWord4;
  Word5 := nWord5;
  Word6 := nWord6;
  End;

Operation := FineOp;
End; { InserisciFigura }


Procedure InserisciStringa ( nSt: String );
Var AppPTR: PTRStrings;
Begin { InserisciStringa }
If (InizioSt = NIL)
  Then
    Begin
    New(InizioSt);
    InizioSt^.Last := NIL;
    InizioSt^.Next := NIL;
    FineSt := InizioSt;
    Strings := InizioSt;
    End
Else
  Begin
  Strings := FineSt;
  New(AppPTR);
  AppPTR^.Last := Strings;
  AppPTR^.Last^.Next := AppPTR;
  AppPTR^.Next := NIL;
  FineSt := AppPTR;
  Strings := AppPTR;
  End;
With Strings^ Do
  Begin
  If (Last <> NIL)
    Then
      St.Num := Last^.St.Num+1
  Else
    St.Num := 1;
  St.St := nSt;
  End;

Strings := FineSt;
End; { InserisciStringa }


Procedure RefreshScreen;
Begin { RefreshScreen }
If (Stato = sRedraw)
  Then
    Begin
    DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);
    Stato := sAttesa;
    End;
End; { RefreshScreen }


{===========================================================================}
{ PROCEDURA: TYPER                                                          }
{                                                                           }
{ Visualizza sul video (in modalit… testo) la stringa specificata come pa_  }
{ rametro in una maniera diversa dal normale (come una macchina da scrive_  }
{ re).                                                                      }
{===========================================================================}
Procedure Typer ( Stringa: String;
		  Riga:    Byte;
		  Colonna: Byte );

Var

    { Ciclo }
    I: Byte;

Begin { Typer }

While (Length(Stringa) < 79) Do
  Stringa := Stringa+' ';

GoToXY(Colonna,Riga);
NoSound;

For i := 1 To Length(Stringa) Do
  Begin
  Write('Û');
  Delay(2);
  GoToXY(WhereX-1,WhereY);
  Write(Stringa[i]);
  End;

Sound(1000);
Delay(30);
NoSound;
Delay(5);

End; { Typer }


Procedure EndProgram;
Var I: LongInt;
Begin { EndProgram }
ReleaseMemory;
{$I-} ChDir(CurrentDir); {$I+}
Dispose(Dirs);
Dispose(Files);
Dispose(AppFiles);
{$I-} Reset(FileDir); {$I+}
If (IOResult = 0)
  Then
    Begin
    {$I-} Erase(FileDir); {$I+}
    {$I-} Close(FileDir); {$I+}
    End;

If (Not Abort)
  Then
    Begin

    HideMouse;
    For i := 1 To 400000 Do
      Mem[$A000:Random(38400)] := 0;

    GraphDefaults;
    CloseGraph;
    TextAttr := LightGray;
    ClrScr;
    TextAttr := Yellow;
    Typer(' ',1,1);
    Typer(' ',2,1);
    TextAttr := Yellow+Red*16;
    Typer('                                                                               ',3,1);
    Typer('             GRAPHIC IMAGE PROCESSOR - VERSIONE 1.0 - FOCHI MICHELE            ',4,1);
    Typer('                                                                               ',5,1);
    TextAttr := LightMagenta;
    Typer(' ',6,1);
    Typer(' ',7,1);
    Typer('          Arrivederci.',8,1);
    Typer(' ',9,1);
    TextAttr := Yellow;
    Typer(' ',10,1);
    TextAttr := LightGray;
    Typer(' ',11,1);
    Typer(' ',12,1);
    WriteLn;
    End;

ClearKeyBuf;

End; { EndProgram }


End. { GIPImage }
