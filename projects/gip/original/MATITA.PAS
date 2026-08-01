Program PresentazioneGIP;

Uses Crt,Graph,Mouse;

Type
     Rec= Record
            X: Integer;
            Y: Integer;
            C: Byte;
            D: Word;
            F: Byte;
            S: Byte;
            End; { Rec }

Var
    DataFile: File Of Rec;
    DataRec:  Rec;
    Gd,Gm:    Integer;
    Ch:       Char;
    NomeFIle: String;
    I:        Real;
    J:        Integer;
    InizioX,
    InizioY,
    FineX,
    FineY:    Integer;
    Angolo1,
    Angolo2,
    Angolo3,
    Angolo4:  Integer;
    Mx,My:    Integer;


{===========================================================================}
{===== DISEGNA FORMA                                                   =====}
{===========================================================================}
Procedure DisegnaForma ( Color:  Byte;
                         Sfondo: Byte;
                         MouseX: Integer;
                         MouseY: Integer;
                         Forma:  Byte );
Begin { DisegnaForma }
SetColor(Color);
SetFillStyle(SolidFill,Sfondo);
Case Forma Of
  0: Circle(MouseX,MouseY,10);
  1: FillEllipse(MouseX,MouseY,10,10);
  2: Ellipse(MouseX,MouseY,0,360,10,20);
  3: FillEllipse(MouseX,MouseY,10,20);
  4: Rectangle(MouseX-5,MouseY-5,MouseX+5,MouseY+5);
  5: Bar(MouseX-5,MouseY-5,MouseX+5,MouseY+5);
  6: Rectangle(MouseX-5,MouseY-10,MouseX+5,MouseY+10);
  7: Bar(MouseX-5,MouseY-10,MouseX+5,MouseY+10);
  End; { Case F }
End; { DisegnaForma }


{===========================================================================}
{===== WAIT TO WRITE                                                   =====}
{===========================================================================}
Procedure WaitToWrite;
Var Pen: Byte;
Begin
Repeat
  Pen := Port[$3DA];
  Pen := Pen And $08; { Maschera il 5§ bit }
Until Pen <> 0;
End;


{===========================================================================}
{===== CREAZIONE                                                       =====}
{===========================================================================}
Procedure Creazione;
Var
    Over:      Boolean;
    OldMouseX: Integer;
    OldMouseY: Integer;
    Color:     Byte;
    Count:     Word;
    Forma:     Byte;
    Sfondo:    Byte;

Begin { Creazione }

WriteLn;
Over := True;
{$I-} Reset(DataFile); {$I+}
If (IOResult = 0)
  Then
    Begin
    Close(DataFile);
    GoToXY(10,17);   Write('Il file esiste, sovrascrivo?');
    Ch := ReadKey;
    If Ch In ['n','N']
      Then
        Over := False;
    End;
If Over
  Then
    Begin
    InstallMouse;
    ReWrite(DataFile);
    Gd := VGA;
    Gm := VGAHI;
    InitGraph(Gd,Gm,'\tp6\bgi');
    ShowMouse;
    OldMouseX := MouseX;
    OldMouseY := MouseY;
    Color := White;
    Forma := 0;
    Sfondo := Black;
    Repeat
      Count := 0;
      Repeat
        GetMPos;
        Inc(Count);
        If KeyPressed
          Then
            Begin
            Ch := UpCase(ReadKey);
            Case Ch Of
              'C': Begin
                   Ch := UpCase(ReadKey);
                   Case Ch Of
                     'Q': Color := Black;
                     'W': Color := Blue;
                     'E': Color := Green;
                     'R': Color := Cyan;
                     'T': Color := Red;
                     'Y': Color := Magenta;
                     'U': Color := Brown;
                     'I': Color := LightGray;
                     'A': Color := DarkGray;
                     'S': Color := LightBlue;
                     'D': Color := LightGreen;
                     'F': Color := LightCyan;
                     'G': Color := LightRed;
                     'H': Color := LightMagenta;
                     'J': Color := Yellow;
                     'K': Color := White;
                     End; { Case }
                   End;
              'S': Begin
                   Ch := UpCase(ReadKey);
                   Case Ch Of
                     'Q': Sfondo := Black;
                     'W': Sfondo := Blue;
                     'E': Sfondo := Green;
                     'R': Sfondo := Cyan;
                     'T': Sfondo := Red;
                     'Y': Sfondo := Magenta;
                     'U': Sfondo := Brown;
                     'I': Sfondo := LightGray;
                     End; { Case }
                   End;
              'F': Begin
                   Ch := UpCase(ReadKey);
                   Case Ch Of
                     '0': Forma := 0;
                     '1': Forma := 1;
                     '2': Forma := 2;
                     '3': Forma := 3;
                     '4': Forma := 4;
                     '5': Forma := 5;
                     '6': Forma := 6;
                     '7': Forma := 7;
                     End; { Case }
                   End;
              End; { Case }
            End;
      Until ((OldMouseX <> MouseX) Or (OldMouseY <> MouseY)) And MousePressed;
      OldMouseX := MouseX;
      OldMouseY := MouseY;
      With DataRec Do
        Begin
        x := MouseX;
        y := MouseY;
        c := Color;
        d := Count;
        f := Forma;
        s := Sfondo;
        Write(DataFile,DataRec);
        HideMouse;
        DisegnaForma(c,s,x,y,f);
        ShowMouse;
        End;

    Until (LeftButton And RightButton);

    Close(DataFile);
    End;

End; { Creazione }


{===========================================================================}
{===== VISUALIZZAZIONE                                                 =====}
{===========================================================================}
Procedure Visualizzazione;

Var
    Speed: Word;
    Esci:  Boolean;

Begin { Visualizzazione }

{$I-} Reset(DataFile); {$I+}
If (IOResult <> 0)
  Then
    Begin
    GoToXY(10,19);   Write('Il file ',NomeFile,' non esiste sul disco!');
    Ch := '3';
    End
Else
  Begin
  Gd := VGA;
  Gm := VGAHI;
  InitGraph(Gd,Gm,'\tp6\bgi');
  Speed := 10;
  Esci := False;
  While (Not (EOF(DataFile)) And (Not Esci)) Do
    Begin
    Read(DataFile,DataRec);
    With DataRec Do
      Begin
      If KeyPressed
        Then
          Begin
          Ch := UpCase(ReadKey);
          Case Ch Of
            '1': Speed := 10;
            '2': Speed := 20;
            '3': Speed := 30;
            '4': Speed := 40;
            '5': Speed := 50;
            '6': Speed := 60;
            '7': Speed := 70;
            '8': Speed := 80;
            '9': Speed := 90;
            '0': Speed := 100;
            #27: Esci := True;
            End; { Case }
          End;
      Delay(d Div (10*Speed Div 5));
      DisegnaForma(c,s,x,y,f);
      End;
    End;
  Close(DataFile);
  End;
End; { Visualizzazione }


{===========================================================================}
{===== PRESENTAZIONE (MAIN PROGRAM)                                    =====}
{===========================================================================}
Begin { Presentazione }
TextAttr := LightGray;
ClrScr;
GoToXY(10,05);   Write('Scegli un'' opzione:');
GoToXY(10,07);   Write('1. Creazione');
GoToXY(10,09);   Write('2. Visualizzazione');
GoToXY(10,11);   Write('3. Uscita');
GoToXY(10,13);   Write('   >');

Repeat
  Ch := ReadKey;
Until (Ch In ['1','2','3']);

If (Ch <> '3')
  Then
    Begin
    GoToXY(10,15);   Write('Nome del file? ');
    ReadLn(NomeFile);
    Assign(DataFile,NomeFile);
    End;

Case Ch Of
  '1': Creazione;
  '2': Visualizzazione;
  '3': ;
  End; { Case }

If (Ch <> '3')
  Then
    Begin
    Sound(1000);
    Delay(500);
    NoSound;
    SetWriteMode(XOrPut);
    While KeyPressed Do
      Ch := ReadKey;
    Mx := GetMaxX;
    My := GetMaxY;

    SetColor(LightMagenta);
    Circle(Mx Div 2,My Div 2,100);

    SetColor(Magenta);
    Circle(Mx Div 2,My Div 2,Round(Cos(Pi/4)*100));

    i := 0;
    Repeat
      InizioX := Round(Mx Div 2+Sin(i)*100);
      InizioY := Round(My Div 2-Cos(i)*100);
      FineX := Round(Mx Div 2-Sin(i)*100);
      FineY := Round(My Div 2+Cos(i)*100);
      Angolo1 := Round(Mx Div 2-Cos(i)*100);
      Angolo2 := Round(My Div 2+Sin(i)*100);
      Angolo3 := Round(Mx Div 2+Cos(i)*100);
      Angolo4 := Round(My Div 2-Sin(i)*100);

      For j := 1 To 2 Do
        Begin

            SetColor(White);
            Rectangle(InizioX,InizioY,FineX,FineY);

            SetColor(White);
            SetColor(LightCyan);
            Line(InizioX,InizioY,FineX,FineY);
            Line(InizioX,FineY,FineX,InizioY);

            SetColor(LightGreen);
            Line(InizioX,FineY,Angolo1,Angolo2);
            Line(FineX,InizioY,Angolo1,Angolo2);
            Line(InizioX,FineY,Angolo3,Angolo4);
            Line(FineX,InizioY,Angolo3,Angolo4);

            SetColor(Yellow);
            Line(InizioX,FineY,0,0);
            Line(InizioX,InizioY,0,0);
            Line(FineX,FineY,0,0);
            Line(FineX,InizioY,0,0);

            SetColor(Brown);
            Line(InizioX,FineY,Mx,0);
            Line(InizioX,InizioY,Mx,0);
            Line(FineX,FineY,Mx,0);
            Line(FineX,InizioY,Mx,0);

            SetColor(White);
            SetColor(LightRed);
            Line(InizioX,FineY,0,My);
            Line(InizioX,InizioY,0,My);
            Line(FineX,FineY,0,My);
            Line(FineX,InizioY,0,My);

            SetColor(LightBlue);
            Line(InizioX,FineY,Mx,My);
            Line(InizioX,InizioY,Mx,My);
            Line(FineX,FineY,Mx,My);
            Line(FineX,InizioY,Mx,My);

{        If (j = 1)
          Then
            Begin
            WaitToWrite;
            Delay(1);
            End;   }

        End;
      i := i+Pi/70;
    Until KeyPressed;
    SetWriteMode(NormalPut);
    Ch := ReadKey;
    CloseGraph;
    End;

WriteLn;
WriteLn;

End. { Presentazione }
