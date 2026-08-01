Unit GIPGraph;

Interface { GIPGraph }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit;

Procedure ControllaTastiera;
Function  PremiPulsante ( X:      Integer;
                          Y:      Integer;
                          Icn:    Pointer;
                          Zona:   TipoZona;
                          Icona:  Byte;
                          Attesa: TipoAttesa;
                          Sfondo: Byte ): Boolean;
Procedure GetMouse ( Coordinate: Boolean );
Function  MyMouseInG ( X1: Integer;
                       Y1: Integer;
                       X2: Integer;
                       Y2: Integer ): Boolean;


Implementation { GIPGraph }


Procedure ControllaTastiera;
Begin { ControllaTastiera }

Tastiera := False;
Char1 := #255;
Char2 := #255;
If KeyPressed
  Then
    Begin
    Tastiera := True;
    Char1 := ReadKey;
    If (Char1 = kNull)
      Then
        Char2 := ReadKey;
    End;
End; { ControllaTastiera }



Function  PremiPulsante ( X:      Integer;
                          Y:      Integer;
                          Icn:    Pointer;
                          Zona:   TipoZona;
                          Icona:  Byte;
                          Attesa: TipoAttesa;
                          Sfondo: Byte ): Boolean;
Var MaxX, MaxY: Integer;
    MouseIn: Boolean;
    ChangeMouse: Boolean;


     Procedure ModificaConst ( Valore: Byte );
     Begin { ModificaConst }

     Case Icona Of
       IcnForeBlack:          Begin
                              ConstIcnBlack.X := MaxX-Valore;
                              ConstIcnBlack.Y := MaxY-Valore;
                              End;
       IcnForeBlue:           Begin
                              ConstIcnBlue.X := MaxX-Valore;
                              ConstIcnBlue.Y := MaxY-Valore;
                              End;
       IcnForeGreen:          Begin
                              ConstIcnGreen.X := MaxX-Valore;
                              ConstIcnGreen.Y := MaxY-Valore;
                              End;
       IcnForeCyan:           Begin
                              ConstIcnCyan.X := MaxX-Valore;
                              ConstIcnCyan.Y := MaxY-Valore;
                              End;
       IcnForeRed:            Begin
                              ConstIcnRed.X := MaxX-Valore;
                              ConstIcnRed.Y := MaxY-Valore;
                              End;
       IcnForeMagenta:        Begin
                              ConstIcnMagenta.X := MaxX-Valore;
                              ConstIcnMagenta.Y := MaxY-Valore;
                              End;
       IcnForeBrown:          Begin
                              ConstIcnBrown.X := MaxX-Valore;
                              ConstIcnBrown.Y := MaxY-Valore;
                              End;
       IcnForeLightGray:      Begin
                              ConstIcnLightGray.X := MaxX-Valore;
                              ConstIcnLightGray.Y := MaxY-Valore;
                              End;
       IcnForeDarkGray:       Begin
                              ConstIcnDarkGray.X := MaxX-Valore;
                              ConstIcnDarkGray.Y := MaxY-Valore;
                              End;
       IcnForeLightBlue:      Begin
                              ConstIcnLightBlue.X := MaxX-Valore;
                              ConstIcnLightBlue.Y := MaxY-Valore;
                              End;
       IcnForeLightGreen:     Begin
                              ConstIcnLightGreen.X := MaxX-Valore;
                              ConstIcnLightGreen.Y := MaxY-Valore;
                              End;
       IcnForeLightCyan:      Begin
                              ConstIcnLightCyan.X := MaxX-Valore;
                              ConstIcnLightCyan.Y := MaxY-Valore;
                              End;
       IcnForeLightRed:       Begin
                              ConstIcnLightRed.X := MaxX-Valore;
                              ConstIcnLightRed.Y := MaxY-Valore;
                              End;
       IcnForeLightMagenta:   Begin
                              ConstIcnLightMagenta.X := MaxX-Valore;
                              ConstIcnLightMagenta.Y := MaxY-Valore;
                              End;
       IcnForeYellow:         Begin
                              ConstIcnYellow.X := MaxX-Valore;
                              ConstIcnYellow.Y := MaxY-Valore;
                              End;
       IcnForeWhite:          Begin
                              ConstIcnWhite.X := MaxX-Valore;
                              ConstIcnWhite.Y := MaxY-Valore;
                              End;
       IcnBackBlack:          Begin
                              ConstIcnBlack.X := MaxX-Valore;
                              ConstIcnBlack.Y := MaxY-Valore;
                              End;
       IcnBackBlue:           Begin
                              ConstIcnBlue.X := MaxX-Valore;
                              ConstIcnBlue.Y := MaxY-Valore;
                              End;
       IcnBackGreen:          Begin
                              ConstIcnGreen.X := MaxX-Valore;
                              ConstIcnGreen.Y := MaxY-Valore;
                              End;
       IcnBackCyan:           Begin
                              ConstIcnCyan.X := MaxX-Valore;
                              ConstIcnCyan.Y := MaxY-Valore;
                              End;
       IcnBackRed:            Begin
                              ConstIcnRed.X := MaxX-Valore;
                              ConstIcnRed.Y := MaxY-Valore;
                              End;
       IcnBackMagenta:        Begin
                              ConstIcnMagenta.X := MaxX-Valore;
                              ConstIcnMagenta.Y := MaxY-Valore;
                              End;
       IcnBackBrown:          Begin
                              ConstIcnBrown.X := MaxX-Valore;
                              ConstIcnBrown.Y := MaxY-Valore;
                              End;
       IcnBackLightGray:      Begin
                              ConstIcnLightGray.X := MaxX-Valore;
                              ConstIcnLightGray.Y := MaxY-Valore;
                              End;
       IcnBackDarkGray:       Begin
                              ConstIcnDarkGray.X := MaxX-Valore;
                              ConstIcnDarkGray.Y := MaxY-Valore;
                              End;
       IcnBackLightBlue:      Begin
                              ConstIcnLightBlue.X := MaxX-Valore;
                              ConstIcnLightBlue.Y := MaxY-Valore;
                              End;
       IcnBackLightGreen:     Begin
                              ConstIcnLightGreen.X := MaxX-Valore;
                              ConstIcnLightGreen.Y := MaxY-Valore;
                              End;
       IcnBackLightCyan:      Begin
                              ConstIcnLightCyan.X := MaxX-Valore;
                              ConstIcnLightCyan.Y := MaxY-Valore;
                              End;
       IcnBackLightRed:       Begin
                              ConstIcnLightRed.X := MaxX-Valore;
                              ConstIcnLightRed.Y := MaxY-Valore;
                              End;
       IcnBackLightMagenta:   Begin
                              ConstIcnLightMagenta.X := MaxX-Valore;
                              ConstIcnLightMagenta.Y := MaxY-Valore;
                              End;
       IcnBackYellow:         Begin
                              ConstIcnYellow.X := MaxX-Valore;
                              ConstIcnYellow.Y := MaxY-Valore;
                              End;
       IcnBackWhite:          Begin
                              ConstIcnWhite.X := MaxX-Valore;
                              ConstIcnWhite.Y := MaxY-Valore;
                              End;
       IcnSinistra:           Begin
                              ConstIcnSinistra.X := MaxX-Valore;
                              ConstIcnSinistra.Y := MaxY-Valore;
                              End;
       IcnDestra:             Begin
                              ConstIcnDestra.X := MaxX-Valore;
                              ConstIcnDestra.Y := MaxY-Valore;
                              End;
       IcnAlto:               Begin
                              ConstIcnAlto.X := MaxX-Valore;
                              ConstIcnAlto.Y := MaxY-Valore;
                              End;
       IcnBasso:              Begin
                              ConstIcnBasso.X := MaxX-Valore;
                              ConstIcnBasso.Y := MaxY-Valore;
                              End;
       IcnSceltaOggetti:      Begin
                              ConstIcnSceltaOggetti.X := MaxX-Valore;
                              ConstIcnSceltaOggetti.Y := MaxY-Valore;
                              End;
       IcnOpDisco:            Begin
                              ConstIcnOpDisco.X := MaxX-Valore;
                              ConstIcnOpDisco.Y := MaxY-Valore;
                              End;
(*       IcnZoom:               Begin
                              ConstIcnZoom.X := MaxX-Valore;
                              ConstIcnZoom.Y := MaxY-Valore;
                              End;*)
       IcnPalette:            Begin
                              ConstIcnPalette.X := MaxX-Valore;
                              ConstIcnPalette.Y := MaxY-Valore;
                              End;
       IcnSpostaSchermo:      Begin
                              ConstIcnSpostaSchermo.X := MaxX-Valore;
                              ConstIcnSpostaSchermo.Y := MaxY-Valore;
                              End;
       IcnDisegnoLibero:      Begin
                              ConstIcnDisegnoLibero.X := MaxX-Valore;
                              ConstIcnDisegnoLibero.Y := MaxY-Valore;
                              End;
       IcnOpBlocchi:          Begin
                              ConstIcnOpBlocchi.X := MaxX-Valore;
                              ConstIcnOpBlocchi.Y := MaxY-Valore;
                              End;
       IcnConversione:        Begin
                              ConstIcnConversione.X := MaxX-Valore;
                              ConstIcnConversione.Y := MaxY-Valore;
                              End;
       IcnHelpOnLine:         Begin
                              ConstIcnHelpOnLine.X := MaxX-Valore;
                              ConstIcnHelpOnLine.Y := MaxY-Valore;
                              End;
       IcnSceltaFont:         Begin
                              ConstIcnSceltaFont.X := MaxX-Valore;
                              ConstIcnSceltaFont.Y := MaxY-Valore;
                              End;
       IcnSceltaForma:        Begin
                              ConstIcnSceltaForma.X := MaxX-Valore;
                              ConstIcnSceltaForma.Y := MaxY-Valore;
                              End;
       IcnSceltaRetino:       Begin
                              ConstIcnSceltaRetino.X := MaxX-Valore;
                              ConstIcnSceltaRetino.Y := MaxY-Valore;
                              End;
       IcnSceltaLinea:        Begin
                              ConstIcnSceltaLinea.X := MaxX-Valore;
                              ConstIcnSceltaLinea.Y := MaxY-Valore;
                              End;
       IcnOrologio:           Begin
                              ConstIcnOrologio.X := MaxX-Valore;
                              ConstIcnOrologio.Y := MaxY-Valore;
                              End;
       IcnOk:                 Begin
                              ConstIcnOk.X := MaxX-Valore;
                              ConstIcnOk.Y := MaxY-Valore;
                              End;
       IcnEsci:               Begin
                              ConstIcnEsci.X := MaxX-Valore;
                              ConstIcnEsci.Y := MaxY-Valore;
                              End;
       IcnSi:                 Begin
                              ConstIcnSi.X := MaxX-Valore;
                              ConstIcnSi.Y := MaxY-Valore;
                              End;
       IcnNo:                 Begin
                              ConstIcnNo.X := MaxX-Valore;
                              ConstIcnNo.Y := MaxY-Valore;
                              End;
       IcnSpostaSchermo:      Begin
                              ConstIcnSpostaSchermo.X := MaxX-Valore;
                              ConstIcnSpostaSchermo.Y := MaxY-Valore;
                              End;
       IcnLongOk:             Begin
                              ConstIcnLongOk.X := MaxX-Valore;
                              ConstIcnLongOk.Y := MaxY-Valore;
                              End;
       IcnLongEsci:           Begin
                              ConstIcnLongEsci.X := MaxX-Valore;
                              ConstIcnLongEsci.Y := MaxY-Valore;
                              End;
       IcnReset:              Begin
                              ConstIcnReset.X := MaxX-Valore;
                              ConstIcnReset.Y := MaxY-Valore;
                              End;
       IcnResetAll:           Begin
                              ConstIcnResetAll.X := MaxX-Valore;
                              ConstIcnResetAll.Y := MaxY-Valore;
                              End;
       IcnDefault:            Begin
                              ConstIcnDefault.X := MaxX-Valore;
                              ConstIcnDefault.Y := MaxY-Valore;
                              End;
       IcnDefaultAll:         Begin
                              ConstIcnDefaultAll.X := MaxX-Valore;
                              ConstIcnDefaultAll.Y := MaxY-Valore;
                              End;
       End; { Case Icona }

     End; { ModificaConst }


Begin { PremiPulsante }

ChangeMouse := CambioMouse;
CambioMouse := False;
PremiPulsante := False;
Case Zona Of
  Colore: Begin
          MaxX := 29;
          MaxY := 14;
          End;
  LeggiFile: Begin
             MaxX := 39;
             MaxY := 14;
             End;
  Finestre,
  Strumenti: Begin
             MaxX := 29;
             MaxY := 29;
             End;
  Frecce: Begin
          MaxX := 14;
          MaxY := 14;
          End;
  Long: Begin
        MaxX := 95;
        MaxY := 14;
        End;
  End; { Case Zona }

Repeat

  GetMouse(False);
  MouseIn := ((MouseX >= X)      And (MouseY >= Y) And
              (MouseX <= X+MaxX) And (MouseY <= Y+MaxY) And
              MouseOk);

  If ((MouseIn And LeftButton) Or (Attesa = NoAttesa))
    Then
      Begin
      ModificaConst(3);
      WaitToWrite;
      HideMouse;
      SetColor(Sfondo);
      SetLineStyle(SolidLn,0,NormWidth);
      If Not (Zona In [Finestre,LeggiFile])
        Then
          Begin
          Line(x,y,x+MaxX-1,y);
          Line(x,y+1,x+MaxX-1,y+1);
          Line(x,y,x,y+MaxY-1);
          Line(x+1,y,x+1,y+MaxY-1);
          End;
      PutImage(x+2,y+2,Icn^,NormalPut);
      If (Zona In [Finestre,LeggiFile])
        Then
          Begin
          Rectangle(x,y,x+MaxX,y+MaxY);
          Rectangle(x+1,y+1,x+MaxX+1,y+MaxY+1);
          End;
      SetColor(DarkGray);
      Line(x+2,y+2,x+MaxX-1,y+2);
      Line(x+2,y+3,x+MaxX-1,y+3);
      Line(x+2,y+2,x+2,y+MaxY-1);
      Line(x+3,y+2,x+3,y+MaxY-1);
      ShowMouse;

      Repeat
        GetMouse(False);
        MouseIn := ((MouseX >= X)      And (MouseY >= Y) And
                    (MouseX <= X+MaxX) And (MouseY <= Y+MaxY) And
                    MouseOk);
      Until ((Not (MouseIn And LeftButton)) Or (Attesa = NoAttesa));

      If (Attesa = NoAttesa)
        Then
          Delay(200);

      ModificaConst(1);
      WaitToWrite;
      HideMouse;
      PutImage(x,y,Icn^,NormalPut);
      ShowMouse;
      If MouseIn
        Then
          PremiPulsante := True
      Else
        PremiPulsante := False;
      End;

Until ((Not LeftButton) Or (Attesa = NoAttesa));
CambioMouse := ChangeMouse;
End; { PremiPulsante }


Procedure GetMouse ( Coordinate: Boolean );

Var St1, St2: String005;
    Step100: Byte;

Begin { GetMouse }

GetMPos;

{ Test per lo spostamento del puntatore }
If ((OldMouseX <> MouseX) Or (OldMouseY <> MouseY))
  Then
    Begin
    If ((MouseX >= WinBegX) And (MouseY >= WinBegY) And
        (MouseX <= WinEndX) And (MouseY <= WinEndY) And
        Coordinate)
          Then
            Begin
            Str((MouseX-WinBegX+BeginX):5,St1);
            If (St1[1] = kSpazio)
              Then
                St1[1] := '0';
            If (St1[2] = kSpazio)
              Then
                St1[2] := '0';
            If (St1[3] = kSpazio)
              Then
                St1[3] := '0';
            If (St1[4] = kSpazio)
              Then
                St1[4] := '0';
            Str((MouseY-WinBegY+BeginY):5,St2);
            If (St2[1] = kSpazio)
              Then
                St2[1] := '0';
            If (St2[2] = kSpazio)
              Then
                St2[2] := '0';
            If (St2[3] = kSpazio)
              Then
                St2[3] := '0';
            If (St2[4] = kSpazio)
              Then
                St2[4] := '0';
            WaitToWrite;
            HideMouse;
            SetFillStyle(SolidFill,cBkCoord);
            SetTextStyle(CoordFont,HorizDir,CoordSize);
            SetTextJustify(CenterText,CenterText);
            SetColor(cCoord);
            Bar(InizioCoordX,InizioCoordY,FineCoordX,FineCoordY);
            OutTextXY(PosCoordX,PosCoordY-4,'X:'+St1);
            OutTextXY(PosCoordX,PosCoordY+5,'Y:'+St2);
            ShowMouse;
            End;
    OldMouseX := MouseX;
    OldMouseY := MouseY;
    End;

TastieraX := MouseX;
TastieraY := MouseY;

ControllaTastiera;

OldTastieraX := TastieraX;
OldTastieraY := TastieraY;

If Tastiera
  Then
    Begin
    Case Char1 Of
      kNull: Begin
             If ShiftPressed
               Then
                 Step100 := 10
             Else
               Step100 := 1;
             If NumLockActivated
               Then
                 Step100 := Step100*10;
             Case Char2 Of
               kUp: If (MouseY > 0)
                      Then
                        Dec(MouseY,Step100);
               kDown: If (MouseY < GetMaxY)
                        Then
                          Inc(MouseY,Step100);
               kLeft: If (MouseX > 0)
                        Then
                          Dec(MouseX,Step100);
               kRight: If (MouseX < GetMaxX)
                         Then
                           Inc(MouseX,Step100);
               End; { Case Char2 }
             If (MouseX < 0)
               Then
                 MouseX := 0
             Else
               If (MouseX > GetMaxX)
                 Then
                   MouseX := GetMaxX;
             If (MouseY < 0)
               Then
                 MouseY := 0
             Else
               If (MouseY > GetMaxY)
                 Then
                   MouseY := GetMaxY;
             SetGMPos(MouseX,MouseY);
             TastieraX := MouseX;
             TastieraY := MouseY;
             End;
      End; { Case Char1 }
    End;
End; { GetMouse }


Function  MyMouseInG ( X1: Integer;
                       Y1: Integer;
                       X2: Integer;
                       Y2: Integer ): Boolean;
Begin { MyMouseInG }
MyMouseInG := (MouseInG(X1,Y1,X2,Y2) Or
              ((TastieraX >= X1) And (TastieraY >= Y1) And
               (TastieraX <= X2) And (TastieraY <= Y2) And Tastiera));
End; { MyMouseInG }


End. { GIPGraph }
