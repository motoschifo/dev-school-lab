Unit GIPInit;

Interface { GIPInit }

Uses
     Crt,Dos,Keyboard,Graph,GIPVars,Mouse,GIPFast;

Procedure AddBackSlash ( Var St: String );
Procedure RemoveBackSlash ( Var St: String );
Procedure InitVar;
Procedure InitVGACard;
Procedure InitMouse;
Procedure CreaImmagine;
Procedure DistruggiImmagine;
Procedure DefineOriginalSize;
Procedure ReleaseMemory;
Procedure Defaults;
Procedure ClearKeyBuf;

Implementation { GIPInit }


Procedure AddBackSlash ( Var St: STring );
Begin { AddBackSlash }
If (Length(St) > 3) And (St[Length(St)] <> '\')
       Then
         St := St+'\';
End; { AddBackSlash }


Procedure RemoveBackSlash ( Var St: STring );
Begin { RemoveBackSlash }
If (Not (((Copy(St,2,2) = ':\') Or (St[2] = ':'))
   And (Length(St) <= 3)))
     Then
       If (St[Length(St)] = '\')
         Then
           Dec(St[0]);
End; { RemoveBackSlash }


Procedure InitVar;
Var D: DirStr;
    N: NameStr;
    E: ExtStr;
    I: Byte;
Begin { InitVar }
Stato := sAttesa;
OldStato := sSceltaOggetti;
Disegno := True;

With Setup Do
  Begin
  XAspect      := 10000;
  YAspect      := 10000;
  Palette      := DefaultPalette;
  ForeColor    := White;
  BackColor    := Black;
  UserPattern  := MyFill;
  Pattern      := SolidFill;
  LineStyle    := SolidLn;
  PatternLine  := $0000;
  Thickness    := NormWidth;
  HorizJust    := CenterText;
  VertJust     := CenterText;
  Font         := DefaultFont;
  Direction    := HorizDir;
  CharSize     := 1;
  UserMultX    := 1;
  UserDivX     := 1;
  UserMultY    := 1;
  UserDivY     := 1;
  End;

{ Set-up iniziali }
CambioMouse := True;
CoordX := 0;
CoordY := 0;
OldCoordX := -1;
OldCoordY := -1;
Tastiera := False;
NewMenu := 0;
OldMenu := 0;
MouseCursor := PosError;
OldMouseX := -1;
OldMouseY := -1;
TastieraX := MouseX;
TastieraY := MouseY;
OldTastieraX := OldMouseX;
OldTastieraY := OldMouseY;
New(Icone);

Icone^[IcnForeBlack       ].Icn := @ConstIcnBlack;
Icone^[IcnForeBlue        ].Icn := @ConstIcnBlue;
Icone^[IcnForeGreen       ].Icn := @ConstIcnGreen;
Icone^[IcnForeCyan        ].Icn := @ConstIcnCyan;
Icone^[IcnForeRed         ].Icn := @ConstIcnRed;
Icone^[IcnForeMagenta     ].Icn := @ConstIcnMagenta;
Icone^[IcnForeBrown       ].Icn := @ConstIcnBrown;
Icone^[IcnForeLightGray   ].Icn := @ConstIcnLightGray;
Icone^[IcnForeDarkGray    ].Icn := @ConstIcnDarkGray;
Icone^[IcnForeLightBlue   ].Icn := @ConstIcnLightBlue;
Icone^[IcnForeLightGreen  ].Icn := @ConstIcnLightGreen;
Icone^[IcnForeLightCyan   ].Icn := @ConstIcnLightCyan;
Icone^[IcnForeLightRed    ].Icn := @ConstIcnLightRed;
Icone^[IcnForeLightMagenta].Icn := @ConstIcnLightMagenta;
Icone^[IcnForeYellow      ].Icn := @ConstIcnYellow;
Icone^[IcnForeWhite       ].Icn := @ConstIcnWhite;
Icone^[IcnBackBlack       ].Icn := @ConstIcnBlack;
Icone^[IcnBackBlue        ].Icn := @ConstIcnBlue;
Icone^[IcnBackGreen       ].Icn := @ConstIcnGreen;
Icone^[IcnBackCyan        ].Icn := @ConstIcnCyan;
Icone^[IcnBackRed         ].Icn := @ConstIcnRed;
Icone^[IcnBackMagenta     ].Icn := @ConstIcnMagenta;
Icone^[IcnBackBrown       ].Icn := @ConstIcnBrown;
Icone^[IcnBackLightGray   ].Icn := @ConstIcnLightGray;
Icone^[IcnBackDarkGray    ].Icn := @ConstIcnDarkGray;
Icone^[IcnBackLightBlue   ].Icn := @ConstIcnLightBlue;
Icone^[IcnBackLightGreen  ].Icn := @ConstIcnLightGreen;
Icone^[IcnBackLightCyan   ].Icn := @ConstIcnLightCyan;
Icone^[IcnBackLightRed    ].Icn := @ConstIcnLightRed;
Icone^[IcnBackLightMagenta].Icn := @ConstIcnLightMagenta;
Icone^[IcnBackYellow      ].Icn := @ConstIcnYellow;
Icone^[IcnBackWhite       ].Icn := @ConstIcnWhite;
Icone^[IcnSinistra        ].Icn := @ConstIcnSinistra;
Icone^[IcnDestra          ].Icn := @ConstIcnDestra;
Icone^[IcnAlto            ].Icn := @ConstIcnAlto;
Icone^[IcnBasso           ].Icn := @ConstIcnBasso;
Icone^[IcnSceltaOggetti   ].Icn := @ConstIcnSceltaOggetti;
Icone^[IcnOpDisco         ].Icn := @ConstIcnOpDisco;
(*Icone^[IcnZoom            ].Icn := @ConstIcnZoom;*)
Icone^[IcnPalette         ].Icn := @ConstIcnPalette;
Icone^[IcnSpostaSchermo   ].Icn := @ConstIcnSpostaSchermo;
Icone^[IcnDisegnoLibero   ].Icn := @ConstIcnDisegnoLibero;
Icone^[IcnOpBlocchi       ].Icn := @ConstIcnOpBlocchi;
Icone^[IcnConversione     ].Icn := @ConstIcnConversione;
Icone^[IcnHelpOnLine      ].Icn := @ConstIcnHelpOnLine;
Icone^[IcnSceltaFont      ].Icn := @ConstIcnSceltaFont;
Icone^[IcnSceltaForma     ].Icn := @ConstIcnSceltaForma;
Icone^[IcnSceltaRetino    ].Icn := @ConstIcnSceltaRetino;
Icone^[IcnSceltaLinea     ].Icn := @ConstIcnSceltaLinea;
Icone^[IcnOrologio        ].Icn := @ConstIcnOrologio;
Icone^[IcnAttivo          ].Icn := @ConstIcnAttivo;
Icone^[IcnCursorBar       ].Icn := @ConstIcnCursorBar;
Icone^[IcnOk              ].Icn := @ConstIcnOk;
Icone^[IcnEsci            ].Icn := @ConstIcnEsci;
Icone^[IcnSi              ].Icn := @ConstIcnSi;
Icone^[IcnNo              ].Icn := @ConstIcnNo;
Icone^[IcnLongOk          ].Icn := @ConstIcnLongOk;
Icone^[IcnLongEsci        ].Icn := @ConstIcnLongEsci;
Icone^[IcnReset           ].Icn := @ConstIcnReset;
Icone^[IcnResetAll        ].Icn := @ConstIcnResetAll;
Icone^[IcnDefault         ].Icn := @ConstIcnDefault;
Icone^[IcnDefaultAll      ].Icn := @ConstIcnDefaultAll;

New(Menu);
New(Dirs);
New(Files);
New(AppFiles);

{ Definizione dei titoli dei menu }
Menu^[1].Title := '  FILE  ';
Menu^[2].Title := '  SETUP  ';
Menu^[3].Title := '  TOOLS  ';
Menu^[4].Title := '  BLOCK  ';
Menu^[5].Title := '  CONVERSIONE  ';
Menu^[6].Title := '  HELP  ';

{ Definizione delle opzioni per il menu FILE }
With Menu^[1] Do
  Begin
  Opz[1] := '   Leggi immagine    ';
  Opz[2] := '   Salva immagine    ';
  Opz[3] := '   Nuova immagine    ';
  Opz[4] := '   Stampa immagine   ';
  Opz[5] := '   Esci              ';
  End;

{ Definizione delle opzioni per il menu SETUP }
With Menu^[2] Do
  Begin
  Opz[1] := '   Retino   ';
  Opz[2] := '   Linea    ';
  Opz[3] := '   Font     ';
  Opz[4] := '   Colori   ';
  Opz[5] := 'END';
  End;


{ Definizione delle opzioni per il menu TOOLS }
With Menu^[3] Do
  Begin
  Opz[1] := '   Zoom             ';
  Opz[2] := '   Spostamento      ';
  Opz[3] := '   Forma            ';
  Opz[4] := '   Disegno Libero   ';
  Opz[5] := 'END';
  End;

{ Definizione delle opzioni per il menu BLOCK }
With Menu^[4] Do
  Begin
  Opz[1] := '   Memorizza   ';
  Opz[2] := '   Richiama    ';
  Opz[3] := '   Sposta      ';
  Opz[4] := '   Copia       ';
  Opz[5] := 'END';
  End;

{ Definizione delle opzioni per il menu CONVERSIONE }
With Menu^[5] Do
  Begin
  Opz[1] := '   Turbo C           ';
  Opz[2] := '   Turbo Pascal      ';
  Opz[3] := '   Turbo Assembler   ';
  Opz[4] := 'END';
  Opz[5] := 'END';
  End;

{ Definizione delle opzioni per il menu HELP }
With Menu^[6] Do
  Begin
  Opz[1] := '   Generale     ';
  Opz[2] := '   Precedente   ';
  Opz[3] := '   Indice       ';
  Opz[4] := '   Orologio     ';
  Opz[5] := '   G.I.P.       ';
  End;

{$I-} GetDir(0,CurrentDir); {$I+}

If (IOResult <> 0)
  Then
    CurrentDir := '';

AddBackSlash(CurrentDir);

FSplit(FExpand(CurrentDir),D,N,E);
NameFileDir := FExpand(D+'__DRVS__.IP');
Assign(FileDir,NameFileDir);
{$I-} ReWrite(FileDir); {$I+}
{$I-} Close(FileDir); {$I+}

FileAperto := IOResult = 0;
Drive := 0;
Percorso := CurrentDir;

Ancora := aFisso;
ColorImage := Cyan;

End; { InitVar }


Procedure InitVGACard;

Var GraphMode:   Integer;
    GraphDriver: Integer;
    Path:        String;
    Errore:      Integer;
    I:           Byte;

Begin { InitVGACard }

If (Not Abort)
  Then
    Begin

    Path := FExpand(FilesBGI);

    Repeat

      { Schede grafiche valide:

                   Driver │  Modo   │ Risoluzione
                   ───────┼─────────┼────────────
                    VGA   │ VGALO   │ 640x200
                    VGA   │ VGAMED  │ 640x350
                    VGA   │ VGAHI   │ 640x480
                    EGA   │ EGALO   │ 640x200
                    EGA   │ EGAHI   │ 640x350
                    EGA64 │ EGA64LO │ 640x200
                    EGA64 │ EGA64HI │ 640x350     }
      GraphDriver := VGA;
      GraphMode := VGAHI;
      InitGraph(GraphDriver,GraphMode,Path);
      Errore := GraphResult;
      If (Errore <> GrOk)
        Then
          Begin
          TextAttr := LightGray;
          ClrScr;
          WriteLn;
          WriteLn('┌─────────────┐');
          WriteLn('│  ERRORE !!  │');
          WriteLn('└─────────────┘');
          WriteLn(kBeep);
          WriteLn('Per eseguire G.I.P. è indispensabile una delle seguenti schede grafiche:');
          WriteLn;
          WriteLn('    VGA  640x200, 640x350, 640x480');
          WriteLn('    EGA  640x200, 640x350 (anche EGA 64)');
          WriteLn;
          WriteLn('Il file EGAVGA.BGI, il driver per una delle risoluzione richieste, non è');
          WriteLn('presente nella directory di default.');
          WriteLn;
          WriteLn('Specificare un nuovo percorso e confermare con RETURN; l'' immissione nulla');
          WriteLn('farà terminare il programma.');
          WriteLn;
          Write  ('Nuovo percorso: ');
          ReadLn(Path);
          WriteLn;
          End;
    Until ((Path = '') Or (Errore = GrOk));

    If (Errore <> GrOk)
      Then
        Begin
        Abort := True;
        WriteLn;
        WriteLn('Programma interrotto.');
        WriteLn;
        End
    Else
      Abort := False;

    If (Not Abort)
      Then
        Begin

        With Setup Do
          Begin
          SetAspectRatio(XAspect,YAspect);
          SetBkColor(BackColor);
          SetColor(ForeColor);
          SetWriteMode(NormalPut);
          SetFillStyle(Pattern,ForeColor);
          SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
          ClearViewPort;

          SetTextStyle(Font,Direction,CharSize);
          SetTextJustify(HorizJust,VertJust);

          For i := Black To White Do
            With Palette[i] Do
              SetRGBPalette(i,Red,Green,Blue);
          End;

        TastieraX := GetMaxX Div 2;
        TastieraY := GetMaxY Div 2;
        OldTastieraX := -1;
        OldTastieraY := -1;

        MouseX := TastieraX;
        MouseY := TastieraY;
        OldMouseX := OldTastieraX;
        OldMouseY := OldTastieraY;
        SetGMPos(MouseX,MouseY);

        SetTextStyle(DefaultFont,HorizDir,1);

        TH := TextHeight('X');
        TW := TextWidth('X');

        { Setta i numeri dei colori (es. Black = 0, White = 15) }
        For i := 0 To 15 Do
          SetPalette(i,i);
        SetAllPalette(Setup.Palette);
        End;
    End;
End; { InitVGACard }


Procedure InitMouse;
Begin { InitMouse }

If (Not Abort)
  Then
    Begin

    InstallMouse;

    If ((Not MouseOk) And (MouseError))
      Then
        Begin
        TextAttr := LightGray;
        ClrScr;
        WriteLn;
        WriteLn('┌─────────────┐');
        WriteLn('│  ERRORE !!  │');
        WriteLn('└─────────────┘');
        WriteLn(kBeep);
        WriteLn('Non è stato trovato alcun mouse nel sistema.');
        WriteLn('Il programma G.I.P. necessita di tale dispositivo');
        WriteLn;
        WriteLn('Se è fisicamente presente occorre caricare in memoria il relativo driver.');
        WriteLn;
        WriteLn('Programma interrotto.');
        WriteLn;
        Abort := True;
        End;
    End;
End; { InitMouse }


Procedure CreaImmagine;
Begin { CreaImmagine }

{ Inizializzazione della lista delle operazioni }
{New(InizioOp);}  { 27 Bytes }
{DefineOperation(oNuovo,InizioOp^);}
InizioOp := NIL;
FineOp := InizioOp;
Operation := InizioOp;

{ Inizializzazione della lista delle stringhe }
{New(InizioSt);}  { 266 bytes }
InizioSt := NIL;
FineSt := InizioSt;
Strings := InizioSt;

OpSelected := InizioOp;

End; { CreaImmagine }


Procedure DistruggiImmagine;
Begin { DistruggiImmagine }
(*
Operation := InizioOp;
If (InizioOp <> NIL)
  Then
    While (Operation^.Next <> NIL) Do
      Begin
      Operation := Operation^.Next;
      Dispose(Operation^.Last);
      End;
*)

(*
Strings := InizioSt;
If (InizioSt <> NIL)
  Then
    While (Strings^.Next <> NIL) Do
      Begin
      Strings := Strings^.Next;
      Dispose(Strings^.Last);
      End;
*)

End; { DistruggiImmagine }


Procedure DefineOriginalSize;
Begin { DefineOriginalSize }
{ Delimitazione dei limiti fisici dell' immagine }
BeginX := 0;
BeginY := 0;
EndX := WinEndX-WinBegX;
EndY := WinEndY-WinBegY;
End; { OriginalSize }


Procedure ReleaseMemory;
Begin { ReleaseMemory }

Dispose(Menu);
Dispose(Icone);

DistruggiImmagine;

End; { ReleaseMemory }


Procedure Defaults;
Begin { Defaults }
SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
SetWriteMode(NormalPut);
CambioMouse := True;
SetGHorRange(0,GetMaxX);
SetGVertRange(0,GetMaxY);
SetLineStyle(SolidLn,0,NormWidth);
SetWriteMode(NormalPut);
End; { Defaults }


Procedure ClearKeyBuf;
Var C: Char;
Begin { ClearKeyBuf }
While KeyPressed Do
  C := ReadKey;
End; { ClearKeyBuf }


End. { GIPInit }
