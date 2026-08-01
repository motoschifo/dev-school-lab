Unit GIPShape;

Interface { GIPShape }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit,GIPIcWin,GIPGraph,
     GIPAppPrc, GIPBase, GIPImage, GIPFile;

Procedure MyGetArcCoords ( Var ArcC: ArcCoordsType );
Procedure MyEllipse (X,Y,AngInizio,AngFine,Rx,Ry:Integer; Step: Byte);
Procedure pCerchio ( Vuoto: Boolean );
Procedure pRettangolo ( Vuoto: Boolean );
Procedure pPoligono ( Vuoto: Boolean );
Procedure pSettore ( Vuoto: Boolean );
Procedure pArco ( Corda: Boolean );
Procedure pRiempimento;
Procedure pLinea;
Procedure pRettangolo3D ( Vuoto: Boolean );
Procedure pDisegnoLibero;
Procedure pTesto;
Procedure pUserCharSize;


Implementation { GIPShape }

Var PointX:   Integer;
    PointY:   Integer;
    FissoX:   Integer;
    FissoY:   Integer;
    Mx:       Integer;
    My:       Integer;
    SaveArcC: ArcCoordsType;

Procedure MyGetArcCoords ( Var ArcC: ArcCoordsType );
Begin
ArcC := SaveArcC;
End;

Procedure MyEllipse (X,Y,AngInizio,AngFine,Rx,Ry:Integer; Step: Byte);
Var Ang:Real;
    X1,Y1,X2,Y2:Integer;
    AngI,AngF: Real;
Begin { MyEllipse }
AngI := Pi/180*AngInizio;
AngF := Pi/180*AngFine;
While (AngI > AngF) Do
  AngF := AngF+2*Pi;
Ang := AngI;{+Step*Pi/360;}
X2 := Round(x+Cos(Ang)*Rx);
Y2 := Round(y-Sin(Ang)*Ry);
SaveArcC.X := X;
SaveArcC.Y := Y;
SaveArcC.XStart := X2;
SaveArcC.YStart := Y2;
Repeat
  X1 := X2;
  Y1 := Y2;
  Ang := Ang+Step*Pi/360;
  X2 := Round(x+Cos(Ang)*Rx);
  Y2 := Round(y-Sin(Ang)*Ry);
  PutPixel(X1,Y1,15-GetPixel(X1,Y1));
  Line(X1,Y1,X2,Y2);
Until Ang > AngF;
SaveArcC.XEnd := X2;
SaveArcC.YEnd := Y2;
End; { MyEllipse }


Procedure pCerchio ( Vuoto: Boolean );

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove );
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(LineStyle,PatternLine,Thickness);
           If Pattern = UserFill
             Then
               Begin
               SetFillStyle(UserFill,BackColor);
               SetFillPattern(UserPattern,BackColor);
               End
           Else
             SetFillStyle(Pattern,BackColor);
           End;
         End;
     If (Modo <> NoPut)
       Then
         Begin
         SetWriteMode(Modo);
         If (Modo = NormalPut)
           Then
             With Setup Do
               SetColor(ForeColor);
         If (Ancora = aMobile)
           Then
             Begin
             PointX := X;
             PointY := Y;
             End
         Else
           Begin
           PointX := FissoX;
           PointY := FissoY;
           End;
         If ((Not Vuoto) And (Modo = NormalPut))
           Then
             FillEllipse(PointX-WinBegX,PointY-WinBegY,Abs(X-FissoX),Abs(Y-FissoY));
         If (Modo = NormalPut)
           Then
             Ellipse(PointX-WinBegX,PointY-WinBegY,0,360,Abs(X-FissoX),Abs(Y-FissoY))
         Else
           MyEllipse(PointX-WinBegX,PointY-WinBegY,0,359,Abs(X-FissoX),Abs(Y-FissoY),5);
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         ShowMouse;
         End;
     End; { Disegna }

Begin { pCerchio }
If Vuoto
  Then
    OldStato := sCerchio
Else
  OldStato := sCerchioPieno;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    FissoX := PointX;
    FissoY := PointY;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      Disegna(Mx,My,XOrPut,Inizio);
      Disegna(MouseX,MouseY,XOrPut,Fine);
    Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

    Disegna(MouseX,MouseY,XOrPut,Inizio);
    If (LeftButton Or (Char1 In [kSpazio,kReturn]))
      Then
        Begin
        Disegna(MouseX,MouseY,NormalPut,Fine);
        With Setup Do
          If Vuoto
            Then
              InserisciFigura(fCerchio,LineStyle,PatternLine,Thickness,
                              ForeColor,Pattern,BackColor,
                              PointX-WinBegX+BeginX,PointY-WinBegY+BeginY,
                              Abs(MouseX-FissoX),Abs(MouseY-FissoY),NUW,NUW)
          Else
              InserisciFigura(fCerchioPieno,LineStyle,PatternLine,
                              Thickness,ForeColor,Pattern,BackColor,
                              PointX-WinBegX+BeginX,PointY-WinBegY+BeginY,
                              Abs(MouseX-FissoX),Abs(MouseY-FissoY),NUW,NUW);
        End;
    ReleaseMouse;
    End;
End; { pCerchio }


Procedure pRettangolo ( Vuoto: Boolean );

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove );
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(LineStyle,PatternLine,Thickness);
           If Pattern = UserFill
             Then
               Begin
               SetFillStyle(UserFill,BackColor);
               SetFillPattern(UserPattern,BackColor);
               End
           Else
             SetFillStyle(Pattern,BackColor);
           End;
         End;
     If (Ancora = aMobile)
       Then
         Begin
         PointX := FissoX;
         PointY := FissoY;
         End
     Else
       Begin
       PointX := FissoX-(X-FissoX);
       PointY := FissoY-(Y-FissoY);
       End;
     If (Modo <> NoPut)
       Then
         Begin
         SetWriteMode(Modo);
         If (Modo = NormalPut)
           Then
             With Setup Do
               SetColor(ForeColor);
         If ((Not Vuoto) And (Modo = NormalPut))
           Then
             Bar(PointX-WinBegX,PointY-WinBegY,X-WinBegX,Y-WinBegY);
         Rectangle(PointX-WinBegX,PointY-WinBegY,X-WinBegX,Y-WinBegY);
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         ShowMouse;
         End;
     End; { Disegna }

Begin { pRettangolo }
If Vuoto
  Then
    OldStato := sRettangolo
Else
  OldStato := sRettangoloPieno;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    FissoX := PointX;
    FissoY := PointY;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      Disegna(Mx,My,XOrPut,Inizio);
      Disegna(MouseX,MouseY,XOrPut,Fine);
    Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

    Disegna(MouseX,MouseY,XOrPut,Inizio);
    If (LeftButton Or (Char1 In [kSpazio,kReturn]))
      Then
        Begin
        Disegna(MouseX,MouseY,NormalPut,Fine);
        With Setup Do
          If Vuoto
            Then
              InserisciFigura(fRettangolo,LineStyle,PatternLine,
                              Thickness,ForeColor,Pattern,BackColor,
                              PointX-WinBegX+BeginX,PointY-WinBegY+BeginY,
                              MouseX-WinBegX+BeginX,MouseY-WinBegY+BeginY,
                              NUW,NUW)
          Else
              InserisciFigura(fRettangoloPieno,LineStyle,PatternLine,
                              Thickness,ForeColor,Pattern,BackColor,
                              PointX-WinBegX+BeginX,PointY-WinBegY+BeginY,
                              MouseX-WinBegX+BeginX,MouseY-WinBegY+BeginY,
                              NUW,NUW);
        End;
    ReleaseMouse;
    End;
End; { pRettangolo }


Procedure pPoligono ( Vuoto: Boolean );
Var I:Byte;
    I1, I2, I3: PointType;

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove;
                         Poli: Boolean );
     Var I: Byte;
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         (*Orologio := False;*)
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(LineStyle,PatternLine,Thickness);
           If Pattern = UserFill
             Then
               Begin
               SetFillStyle(UserFill,BackColor);
               SetFillPattern(UserPattern,BackColor);
               End
           Else
             SetFillStyle(Pattern,BackColor);
           End;
         End;
     If (Modo <> NoPut)
       Then
         Begin
         Polig[NumPunti].X := X-WinBegX;
         Polig[NumPunti].Y := Y-WinBegY;
         SetWriteMode(Modo);
         If (Modo = NormalPut)
           Then
             With Setup Do
               SetColor(ForeColor);
         If ((Not Vuoto) And (Modo = NormalPut))
           Then
             FillPoly(NumPunti,Polig);
         If Poli
           Then
             Begin
             If (Modo = NormalPut)
               Then
                 DrawPoly(NumPunti,Polig)
             Else
               For i := 2 To NumPunti Do
                 Begin
                 Line(Polig[i].X,Polig[i].Y,Polig[i-1].X,Polig[i-1].Y);
                 PutPixel(Polig[i-1].X,Polig[i-1].Y,
                          15-GetPixel(Polig[i-1].X,Polig[i-1].Y));
                 End;
             End
         Else
           Begin
           Line(Polig[NumPunti].X,Polig[NumPunti].Y,
                Polig[NumPunti-1].X,Polig[NumPunti-1].Y);
           End;
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         (*Orologio := True;*)
         ShowMouse;
         End;
     End; { Disegna }


Begin { pPoligono }
If Vuoto
  Then
    OldStato := sPoligono
Else
  OldStato := sPoligonoPieno;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    Polig[1].X := PointX-WinBegX;
    Polig[1].Y := PointY-WinBegY;
    Polig[2] := Polig[1];
    NumPunti := 2;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      If ((LeftButton And (Not RightButton)) Or (Char1 = kSpazio))
        Then
          If (NumPunti < MaxPolyPoints)
            Then
              Inc(NumPunti);
      Disegna(Mx,My,XOrPut,Inizio,False);
      Disegna(MouseX,MouseY,XOrPut,Fine,False);
      If LeftButton
        Then
          Begin
          If RightButton
            Then
              If (NumPunti > 2)
                Then
                  Dec(NumPunti);
          Mx := MouseX;
          My := MouseY;
          Repeat
            GetMPos;
          Until ((Not MousePressed) Or (LeftButton And RightButton));
          MouseX := Mx;
          MouseY := My;
          End;
    Until ((LeftButton And RightButton) Or (Char1 In [kEscape,kReturn]) Or
           (RightButton And (Not LeftButton)));

    Disegna(MouseX,MouseY,XOrPut,Inizio,True);
    If ((LeftButton And RightButton) Or (Char1 = kReturn))
      Then
        Begin
        Disegna(MouseX,MouseY,NormalPut,Fine,True);
        With Setup Do
            Begin
            i := 1;
            If Vuoto
              Then
                InserisciFigura(fPoligono,LineStyle,PatternLine,
                                Thickness,ForeColor,Pattern,BackColor,
                                NumPunti,NUI,NUI,NUI,NUI,NUI)
            Else
              InserisciFigura(fPoligonoPieno,LineStyle,PatternLine,
                              Thickness,ForeColor,Pattern,BackColor,NumPunti,
                              NUI,NUI,NUI,NUI,NUI);

            Repeat
              i1.X := NUI;
              i1.Y := NUI;
              i2.X := NUI;
              i2.Y := NUI;
              i3.X := NUI;
              i3.Y := NUI;
              If (i <= NumPunti)
                Then
                  Begin
                  i1 := Polig[i];
                  Inc(i);
                  If (i <= NumPunti)
                    Then
                      Begin
                      i2 := Polig[i];
                      Inc(i);
                      If (i <= NumPunti)
                        Then
                          Begin
                          i3 := Polig[i];
                          Inc(i);
                          End;
                      End;
                  End;
              If Vuoto
                Then
                  InserisciFigura(fPoligono,LineStyle,PatternLine,
                                  Thickness,ForeColor,Pattern,BackColor,
                                  i1.X+BeginX,i1.Y+BeginY,i2.X+BeginX,
                                  i2.Y+BeginY,i3.X+BeginX,i3.Y+BeginY)
              Else
                InserisciFigura(fPoligonoPieno,LineStyle,PatternLine,
                                Thickness,ForeColor,Pattern,BackColor,
                                i1.X+BeginX,i1.Y+BeginY,i2.X+BeginX,
                                i2.Y+BeginY,i3.X+BeginX,i3.Y+BeginY);

              Until (i > NumPunti);
            End;
        End;
    ReleaseMouse;
    End;
End; { pPoligono }



Procedure pSettore ( Vuoto: Boolean );
Var AngInizio,AngFine: Integer;
    BX,EX,AppX,AppY: Integer;

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove;
                         Step: Byte;
                         Ok:   Boolean );
     Var ArcC: ArcCoordsType;
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(LineStyle,PatternLine,Thickness);
           If Pattern = UserFill
             Then
               Begin
               SetFillStyle(UserFill,BackColor);
               SetFillPattern(UserPattern,BackColor);
               End
           Else
             SetFillStyle(Pattern,BackColor);
           End;
         End;
     If (Modo <> NoPut)
       Then
         Begin
         SetWriteMode(Modo);
         If Ok
           Then
             Begin
             If (Ancora = aMobile)
               Then
                 Begin
                 PointX := X;
                 PointY := Y;
                 End
             Else
               Begin
               PointX := FissoX;
               PointY := FissoY;
               End;
             End;
         If (Modo = NormalPut)
           Then
             Begin
             If Vuoto
               Then
                 Begin
                 Ellipse(PointX-WinBegX,PointY-WinBegY,AngInizio,AngFine,Abs(X-FissoX),Abs(Y-FissoY));
                 GetArcCoords(ArcC);
                 With ArcC Do
                   Begin
                   Line(XStart,YStart,X,Y);
                   Line(XEnd,YEnd,X,Y);
                   End;
                 End
             Else
               Sector(PointX-WinBegX,PointY-WinBegY,AngInizio,AngFine,Abs(X-FissoX),Abs(Y-FissoY));
             End
         Else
           Begin
           MyEllipse(PointX-WinBegX,PointY-WinBegY,AngInizio,AngFine,Abs(X-FissoX),Abs(Y-FissoY),Step);
           MyGetArcCoords(ArcC);
           With ArcC Do
             Begin
             Line(XStart,YStart,X,Y);
             Line(XEnd,YEnd,X,Y);
             End;
           End;
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         ShowMouse;
         End;
     End; { Disegna }


     Procedure ControllaAng;
     Var App: Integer;
     Begin
     While (AngFine >= 360) Do
       AngFine := AngFine-360;
     While (AngInizio >= 360) Do
       AngInizio := AngInizio-360;
     If (AngInizio > AngFine)
       Then
         Begin
         App := AngInizio;
         AngInizio := AngFine;
         AngFine := App;
         End;
     End;


Begin { pSettore }
If Vuoto
  Then
    OldStato := sSettore
Else
  OldStato := sSettorePieno;

OldStato := sArco;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    FissoX := MouseX;
    FissoY := MouseY;
    AngInizio := 0;
    AngFine := 359;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      Disegna(Mx,My,XOrPut,Inizio,5,True);
      Disegna(MouseX,MouseY,XOrPut,Fine,5,True);
    Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

    If (LeftButton Or (Char1 In [kSpazio,kReturn]))
      Then
        Begin
        AppX := MouseX;
        AppY := MouseY;
        BX := GetMaxX Div 2-180;
        EX := BX+358;
        SetGHorRange(BX,EX);
        SetGVertRange(GetMaxY Div 2,GetMaxY Div 2);
        ReleaseMouse;
        Disegna(AppX,AppY,XOrPut,Inizio,5,False);
        AngFine := (MouseX-BX+1) Mod 360;
        ControllaAng;
        Disegna(AppX,AppY,XOrPut,Fine,5,False);
        Repeat
          Mx := MouseX;
          My := MouseY;
          Repeat
            GetMouse(False);
          Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
                 Or (Char1 In [kReturn,kSpazio,kEscape]));
          Disegna(AppX,AppY,XOrPut,Inizio,5,False);
          AngFine := (MouseX-BX+1) Mod 360;
          ControllaAng;
          Disegna(AppX,AppY,XOrPut,Fine,5,False);
        Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

        If (LeftButton Or (Char1 In [kSpazio,kReturn]))
          Then
            Begin
            BX := GetMaxX Div 2-180;
            EX := BX+358;
            SetGHorRange(BX,EX);
            SetGVertRange(GetMaxY Div 2,GetMaxY Div 2);
            ReleaseMouse;
            Disegna(AppX,AppY,XOrPut,Inizio,5,False);
            AngInizio := (MouseX-BX+1) Mod 360;
            ControllaAng;
            Disegna(AppX,AppY,XOrPut,Fine,5,False);
            Repeat
              Mx := MouseX;
              My := MouseY;
              Repeat
                GetMouse(False);
              Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
                     Or (Char1 In [kReturn,kSpazio,kEscape]));
              Disegna(AppX,AppY,XOrPut,Inizio,5,False);
              AngInizio := (MouseX-BX+1) Mod 360;
              ControllaAng;
              Disegna(AppX,AppY,XOrPut,Fine,5,False);
            Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

            Disegna(AppX,AppY,XOrPut,Inizio,5,False);

            If (LeftButton Or (Char1 In [kSpazio,kReturn]))
              Then
                Begin
                Disegna(AppX,AppY,NormalPut,Fine,5,False);
                With Setup Do
                  If Vuoto
                    Then
                      InserisciFigura(fSettore,LineStyle,PatternLine,
                                      Thickness,ForeColor,Pattern,BackColor,
                                      PointX-WinBegX+BeginX,
                                      PointY-WinBegY+BeginY,AngInizio,
                                      AngFine,Abs(AppX-FissoX),
                                      Abs(AppY-FissoY))
                  Else
                    InserisciFigura(fSettorePieno,LineStyle,PatternLine,
                                    Thickness,ForeColor,Pattern,BackColor,
                                    PointX-WinBegX+BeginX,
                                    PointY-WinBegY+BeginY,AngInizio,AngFine,
                                    Abs(AppX-FissoX),Abs(AppY-FissoY));

                End;
            End
        Else
          Disegna(AppX,AppY,XOrPut,Inizio,5,False);

        End
    Else
      Disegna(MouseX,MouseY,XOrPut,Inizio,5,True);

    ReleaseMouse;
    End;
End; { pSettore }


Procedure pArco ( Corda: Boolean );

Var AngInizio,AngFine: Integer;
    BX,EX,AppX,AppY: Integer;

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove;
                         Step: Byte;
                         Ok:   Boolean );
     Var ArcC: ArcCoordsType;
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(LineStyle,PatternLine,Thickness);
           If (Pattern = UserFill)
             Then
               Begin
               SetFillStyle(UserFill,BackColor);
               SetFillPattern(UserPattern,BackColor);
               End
           Else
             SetFillStyle(Pattern,BackColor);
           End;
         End;
     If (Modo <> NoPut)
       Then
         Begin
         SetWriteMode(Modo);
         If Ok
           Then
             Begin
             If (Ancora = aMobile)
               Then
                 Begin
                 PointX := X;
                 PointY := Y;
                 End
             Else
               Begin
               PointX := FissoX;
               PointY := FissoY;
               End;
             End;
         If (Modo = NormalPut)
           Then
             Begin
             Ellipse(PointX-WinBegX,PointY-WinBegY,AngInizio,AngFine,Abs(X-FissoX),Abs(Y-FissoY));
             If Corda
               Then
                 Begin
                 GetArcCoords(ArcC);
                 With ArcC Do
                   Line(XStart,YStart,XEnd,YEnd);
                 End;
             End
         Else
           Begin
           MyEllipse(PointX-WinBegX,PointY-WinBegY,AngInizio,AngFine,Abs(X-FissoX),Abs(Y-FissoY),Step);
           If Corda
             Then
               Begin
               MyGetArcCoords(ArcC);
               With ArcC Do
                 Line(XStart,YStart,XEnd,YEnd);
               End;
           End;
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         ShowMouse;
         End;
     End; { Disegna }

Begin { pArco }
OldStato := sArco;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    FissoX := MouseX;
    FissoY := MouseY;
    AngInizio := 0;
    AngFine := 359;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      Disegna(Mx,My,XOrPut,Inizio,5,True);
      Disegna(MouseX,MouseY,XOrPut,Fine,5,True);
    Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

    If (LeftButton Or (Char1 In [kSpazio,kReturn]))
      Then
        Begin
        AppX := MouseX;
        AppY := MouseY;
        BX := 0;
        EX := GetMaxX;
        SetGHorRange(BX,EX);
        SetGVertRange(GetMaxY Div 2,GetMaxY Div 2);
        ReleaseMouse;
        Disegna(AppX,AppY,XOrPut,Inizio,5,False);
        AngFine := (MouseX-BX) Mod 720;
        Disegna(AppX,AppY,XOrPut,Fine,5,False);
        Repeat
          Mx := MouseX;
          My := MouseY;
          Repeat
            GetMouse(False);
          Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
                 Or (Char1 In [kReturn,kSpazio,kEscape]));
          Disegna(AppX,AppY,XOrPut,Inizio,5,False);
          AngFine := (MouseX-BX) Mod 720;
          Disegna(AppX,AppY,XOrPut,Fine,5,False);
        Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

        If (LeftButton Or (Char1 In [kSpazio,kReturn]))
          Then
            Begin
            BX := 0;
            EX := GetMaxX;
            SetGHorRange(BX,EX);
            SetGVertRange(GetMaxY Div 2,GetMaxY Div 2);
            ReleaseMouse;
            Disegna(AppX,AppY,XOrPut,Inizio,5,False);
            AngInizio := (MouseX-BX) Mod 720;
            Disegna(AppX,AppY,XOrPut,Fine,5,False);
            Repeat
              Mx := MouseX;
              My := MouseY;
              Repeat
                GetMouse(False);
              Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
                     Or (Char1 In [kReturn,kSpazio,kEscape]));
              Disegna(AppX,AppY,XOrPut,Inizio,5,False);
              AngInizio := (MouseX-BX) Mod 720;
              Disegna(AppX,AppY,XOrPut,Fine,5,False);
            Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

            Disegna(AppX,AppY,XOrPut,Inizio,5,False);

            If (LeftButton Or (Char1 In [kSpazio,kReturn]))
              Then
                Begin
                Disegna(AppX,AppY,NormalPut,Fine,5,False);
                With Setup Do
                  If Corda
                    Then
                      InserisciFigura(fArcoCorda,LineStyle,PatternLine,
                                      Thickness,ForeColor,Pattern,BackColor,
                                      PointX-WinBegX+BeginX,
                                      PointY-WinBegY+BeginY,Abs(AppX-FissoX),
                                      Abs(AppY-FissoY),AngInizio,AngFine)
                  Else
                    InserisciFigura(fArco,LineStyle,PatternLine,Thickness,
                                    ForeColor,Pattern,BackColor,
                                    PointX-WinBegX+BeginX,
                                    PointY-WinBegY+BeginY,Abs(AppX-FissoX),
                                    Abs(AppY-FissoY),AngInizio,AngFine);
                End;
            End
        Else
          Disegna(AppX,AppY,XOrPut,Inizio,5,False);

        End
    Else
      Disegna(MouseX,MouseY,XOrPut,Inizio,5,True);

    ReleaseMouse;
    End;
End; { pArco }


Procedure pRiempimento;
Begin { pRiempimento }
OldStato := sRiempimento;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    With Setup Do
      Begin
      PointX := MouseX;
      PointY := MouseY;
      WaitToWrite;
      HideMouse;
      (*Orologio := False;*)
      SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
      SetLineStyle(SolidLn,0,NormWidth);
      If Pattern = UserFill
        Then
          Begin
          SetFillStyle(UserFill,BackColor);
          SetFillPattern(UserPattern,BackColor);
          End
      Else
        SetFillStyle(Pattern,BackColor);
      FloodFill(PointX-WinBegX,PointY-WinBegY,Setup.ForeColor);
      SetLineStyle(SolidLn,0,NormWidth);
      SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
      SetWriteMode(NormalPut);
      (*Orologio := True;*)
      ShowMouse;
      With Setup Do
        InserisciFigura(fRiempimento,LineStyle,PatternLine,Thickness,
                        ForeColor,Pattern,BackColor,PointX-WinBegX+BeginX,
                        PointY-WinBegY+BeginY,ForeColor,NUW,NUW,NUW);
      ReleaseMouse;
      End;
End; { pRiempimento }



Procedure pLinea;

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove );
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(LineStyle,PatternLine,Thickness);
           End;
         End;
     If (Ancora = aMobile)
       Then
         Begin
         PointX := FissoX;
         PointY := FissoY;
         End
     Else
       Begin
       PointX := FissoX-(X-FissoX);
       PointY := FissoY-(Y-FissoY);
       End;
     If (Modo <> NoPut)
       Then
         Begin
         SetWriteMode(Modo);
         If (Modo = NormalPut)
           Then
             With Setup Do
               SetColor(ForeColor);
         Line(PointX-WinBegX,PointY-WinBegY,X-WinBegX,Y-WinBegY);
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         ShowMouse;
         End;
     End; { Disegna }

Begin { pLinea }
OldStato := sLinea;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    FissoX := PointX;
    FissoY := PointY;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      Disegna(Mx,My,XOrPut,Inizio);
      Disegna(MouseX,MouseY,XOrPut,Fine);
    Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

    Disegna(MouseX,MouseY,XOrPut,Inizio);
    If (LeftButton Or (Char1 In [kSpazio,kReturn]))
      Then
        Begin
        Disegna(MouseX,MouseY,NormalPut,Fine);
        With Setup Do
          InserisciFigura(fLinea,LineStyle,PatternLine,Thickness,ForeColor,
                          Pattern,BackColor,PointX-WinBegX+BeginX,
                          PointY-WinBegY+BeginY,MouseX-WinBegX+BeginX,
                          MouseY-WinBegY+BeginY,NUW,NUW);
        End;
    ReleaseMouse;
    End;
End; { pLinea }


Procedure SwapInteger ( Var Elem1: Integer;
                        Var Elem2: Integer );
Var Elem3: Integer;
Begin { SwapInteger }
Elem3 := Elem1;
Elem1 := Elem2;
Elem2 := Elem3;
End; { SwapInteger }


Procedure pRettangolo3D ( Vuoto: Boolean );

Var RectX, RectY: Integer;
    AltezzaX,AltezzaY: Integer;
    Quad: Byte;
    DefAltz: Boolean;
    MedioX,MedioY: Integer;

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove );
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(LineStyle,PatternLine,Thickness);
           If Pattern = UserFill
             Then
               Begin
               SetFillStyle(UserFill,BackColor);
               SetFillPattern(UserPattern,BackColor);
               End
           Else
             SetFillStyle(Pattern,BackColor);
           End;
         End;
     If (Not DefAltz)
       Then
         Begin
         RectX := X;
         RectY := Y;
         If (Ancora = aMobile)
           Then
             Begin
             PointX := FissoX;
             PointY := FissoY;
             End
         Else
           Begin
           PointX := FissoX-(X-FissoX);
           PointY := FissoY-(Y-FissoY);
           End;
         End;
     If (Modo <> NoPut)
       Then
         Begin
         SetWriteMode(Modo);
         If (Modo = NormalPut)
           Then
             With Setup Do
               SetColor(ForeColor);

         If ((Not Vuoto) And (Modo = NormalPut))
           Then
             Bar(PointX-WinBegX,PointY-WinBegY,RectX-WinBegX,RectY-WinBegY);
         Rectangle(PointX-WinBegX,PointY-WinBegY,RectX-WinBegX,RectY-WinBegY);
         If (AltezzaX <> 0) Or (AltezzaY <> 0)
           Then
             Begin
             Case Quad Of
               1: Begin
                  Polig[1].X := PointX-WinBegX;
                  Polig[1].Y := PointY-WinBegY;
                  Polig[2].X := PointX-WinBegX-AltezzaX;
                  Polig[2].Y := PointY-WinBegY-AltezzaY;
                  Polig[3].X := RectX-WinBegX-AltezzaX;
                  Polig[3].Y := PointY-WinBegY-AltezzaY;
                  Polig[4].X := RectX-WinBegX;
                  Polig[4].Y := PointY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(4,Polig);
                  Polig[4] := Polig[1];
                  Polig[1].X := PointX-WinBegX-AltezzaX;
                  Polig[1].Y := PointY-WinBegY-AltezzaY;
                  Polig[2].X := PointX-WinBegX-AltezzaX;
                  Polig[2].Y := RectY-WinBegY-AltezzaY;
                  Polig[3].X := PointX-WinBegX;
                  Polig[3].Y := RectY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(3,Polig);
                  End;
               2: Begin
                  Polig[1].X := PointX-WinBegX;
                  Polig[1].Y := PointY-WinBegY;
                  Polig[2].X := PointX-WinBegX+AltezzaX;
                  Polig[2].Y := PointY-WinBegY-AltezzaY;
                  Polig[3].X := RectX-WinBegX+AltezzaX;
                  Polig[3].Y := PointY-WinBegY-AltezzaY;
                  Polig[4].X := RectX-WinBegX;
                  Polig[4].Y := PointY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(4,Polig);

                  Polig[1].X := RectX-WinBegX+AltezzaX;
                  Polig[1].Y := PointY-WinBegY-AltezzaY;
                  Polig[2].X := RectX-WinBegX+AltezzaX;
                  Polig[2].Y := RectY-WinBegY-AltezzaY;
                  Polig[3].X := RectX-WinBegX;
                  Polig[3].Y := RectY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(3,Polig);
                  End;
               3: Begin
                  Polig[1].X := PointX-WinBegX;
                  Polig[1].Y := RectY-WinBegY;
                  Polig[2].X := PointX-WinBegX+AltezzaX;
                  Polig[2].Y := RectY-WinBegY+AltezzaY;
                  Polig[3].X := RectX-WinBegX+AltezzaX;
                  Polig[3].Y := RectY-WinBegY+AltezzaY;
                  Polig[4].X := RectX-WinBegX;
                  Polig[4].Y := RectY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(4,Polig);

                  Polig[1].X := RectX-WinBegX+AltezzaX;
                  Polig[1].Y := RectY-WinBegY+AltezzaY;
                  Polig[2].X := RectX-WinBegX+AltezzaX;
                  Polig[2].Y := PointY-WinBegY+AltezzaY;
                  Polig[3].X := RectX-WinBegX;
                  Polig[3].Y := PointY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(3,Polig);
                  End;
               4: Begin
                  Polig[1].X := PointX-WinBegX;
                  Polig[1].Y := RectY-WinBegY;
                  Polig[2].X := PointX-WinBegX-AltezzaX;
                  Polig[2].Y := RectY-WinBegY+AltezzaY;
                  Polig[3].X := RectX-WinBegX-AltezzaX;
                  Polig[3].Y := RectY-WinBegY+AltezzaY;
                  Polig[4].X := RectX-WinBegX;
                  Polig[4].Y := RectY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(4,Polig);

                  Polig[4] := Polig[1];
                  Polig[1].X := PointX-WinBegX-AltezzaX;
                  Polig[1].Y := RectY-WinBegY+AltezzaY;
                  Polig[2].X := PointX-WinBegX-AltezzaX;
                  Polig[2].Y := PointY-WinBegY+AltezzaY;
                  Polig[3].X := PointX-WinBegX;
                  Polig[3].Y := PointY-WinBegY;
                  If ((Not Vuoto) And (Modo = NormalPut))
                    Then
                      FillPoly(4,Polig)
                  Else
                    DrawPoly(3,Polig);
                  End;
               End; { Case Quad }

             End;
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         ShowMouse;
         End;
     End; { Disegna }

Begin { pRettangolo3D }
If Vuoto
  Then
    OldStato := sRettangolo3D
Else
  OldStato := sRettangolo3DPieno;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    FissoX := PointX;
    FissoY := PointY;
    AltezzaX := 0;
    AltezzaY := 0;
    Quad := 1;           (*     1  2
                                3  4      *)
    DefAltz := False;
    RectX := MouseX;
    RectY := MouseY;
    MedioX := MouseX;
    MedioY := MouseX;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      Disegna(Mx,My,XOrPut,Inizio);
      If DefAltz
        Then
          Begin
          If (MouseX <= MedioX) And (MouseY <= MedioY)
            Then
              Quad := 1
          Else
            If (MouseX >= MedioX) And (MouseY <= MedioY)
              Then
                Quad := 2
          Else
            If (MouseX >= MedioX) And (MouseY >= MedioY)
              Then
                Quad := 3
          Else
            If (MouseX <= MedioX) And (MouseY >= MedioY)
              Then
                Quad := 4;

          AltezzaX := Abs(MouseX-MedioX);
          AltezzaY := Abs(MouseY-MedioY);
          End;
      Disegna(MouseX,MouseY,XOrPut,Fine);
      If ((Char1 In [kSpazio,kReturn]) Or LeftButton) And (Not DefAltz)
        Then
          Begin
          DefAltz := True;
          If (RectX < PointX)
            Then
              SwapInteger(RectX,PointX);
          If (RectY < PointY)
            Then
              SwapInteger(RectY,PointY);
          AltezzaX := 0;
          AltezzaY := 0;
          Quad := 1;
          MedioX := (RectX+PointX) Div 2;
          MedioY := (RectY+PointY) Div 2;
          ReleaseMouse;
          End;
    Until ((RightButton Or (Char1 = kEscape)) Or
          ((DefAltz Or (Char1 In [kSpazio,kReturn])) And LeftButton ));

    Disegna(MouseX,MouseY,XOrPut,Inizio);
    If (LeftButton Or (Char1 In [kSpazio,kReturn]))
      Then
        Begin
        Disegna(MouseX,MouseY,NormalPut,Fine);
        With Setup Do
          If Vuoto
            Then
              InserisciFigura(fRettangolo3D,LineStyle,PatternLine,Thickness,
                              ForeColor,Pattern,BackColor,
                              PointX-WinBegX+BeginX,PointY-WinBegY+BeginY,
                              RectX-WinBegX+BeginX,RectY-WinBegY+BeginY,
                              AltezzaX,AltezzaY+Quad*5000)
          Else
              InserisciFigura(fRettangolo3DPieno,LineStyle,PatternLine,
                              Thickness,ForeColor,Pattern,BackColor,
                              PointX-WinBegX+BeginX,PointY-WinBegY+BeginY,
                              RectX-WinBegX+BeginX,RectY-WinBegY+BeginY,
                              AltezzaX,AltezzaY+Quad*5000);
        End;
    ReleaseMouse;
    End;
End; { pRettangolo3D }


Procedure pDisegnoLibero;
Begin { pDisegnoLibero }
OldStato := sDisegnoLibero;
If MouseInG(WinBegX,WinBegY,WinEndX,WinEndY) And LeftButton
  Then
    With Setup Do
      Begin
      PutPixel(MouseX,MouseY,ForeColor);
      InserisciFigura(fDisegnoLibero,LineStyle,PatternLine,Thickness,
                      ForeColor,Pattern,BackColor,MouseX-WinBegX+BeginX,
                      MouseY-WinBegY+BeginY,ForeColor,NUW,NUW,NUW);
      End;
End; { pDisegnoLibero }


Procedure pTesto;

Const VetHJ: Array [0..2] Of String[5]= ('SINIS','CENTR','DESTR');
      VetVJ: Array [0..2] Of String[5]= ('BASSO','CENTR','ALTO');
      VetF:  Array [0..10] Of String[4]= ('DEF.','TRIP','LITT','SANS','GOTH',
                                          'SCRI','SIMP','TSCR','LCOM','EURO',
                                          'BOLD');
      VetD:  Array [0..1] Of String[5]= ('ORIZZ','VERT');

Var WinPunt:    Pointer;
    WinSize:    Word;
    WinBX:      Integer;
    WinBY:      Integer;
    WinEX:      Integer;
    WinEY:      Integer;
    Memoria:    Boolean;
    EsciWin:    Boolean;
    Sel:        Byte;
    OldSel:     Byte;
    C:          Char;
    C2:         Char;
    FineX:      Integer;
    FineY:      Integer;
    Vet:        Array [1..11] Of
                  Record
                  XI:       Integer;
                  YI:       Integer;
                  XF:       Integer;
                  YF:       Integer;
                  PosC:     Byte;
                  OldPosC:  Byte;
                  Testo:    String[57];
                  Campo:    String[17];
                  Lim:      Byte;
                  End;
    Attivo:     Byte;
    OldAttivo:  Byte;
    I:          Integer;
    OldTesto:   String;
    OldInsert:  Boolean;
    InsState:   Boolean;
    F:          Integer;
    App:        PTROperation;
    AggCampo11: Boolean;
    AppL:       LongInt;
    ErrorCode:  Integer;
    PointEndX:  Integer;
    PointEndY:  Integer;
    AppMouseX:  Integer;
    AppMouseY:  Integer;
    DX:         Integer;
    DY:         Integer;


     Procedure AggCampo ( NumCampo: Byte;
                          Fore:     Byte;
                          Back:     Byte );
     Begin { AggCampo }
     WaitToWrite;
     HideMouse;
     With Vet[NumCampo] Do
       Begin
       If (NumCampo <> 11)
         Then
           Begin
           F := XI+TW*(Length(Campo)+2);
           SetFillStyle(SolidFill,Back);
           Bar(F+1,YI+1,XF-1,YF-1);
           SetColor(Fore);
           SetTextStyle(DefaultFont,HorizDir,1);
           SetTextJustify(LeftText,CenterText);
           OutTextXY(F+1+TW,(YI+YF) Div 2+1,Testo);
           If (Fore = cEditColorSel)
             Then
               WriteCursor(F+TW*PosC,F+TW*PosC,YF-3,InsState);
           End
       Else
         With Setup Do
           Begin
           SetColor(Fore);
           SetTextStyle(Font,Direction,CharSize);
           SetTextJustify(HorizJust,VertJust);
           If (UserMultX <> 1) Or (UserMultY <> 1) Or
              (UserDivX <> 1) Or (UserDivY <> 1)
                Then
                  SetUserCharSize(UserMultX,UserDivX,UserMultY,UserDivY);
           SetFillStyle(SolidFill,Back);
           Bar(XI+1,YI+TH*2+1,XF-1,YF-1);
           SetColor(cBkSmallDialog+8);
           SetLineStyle(CenterLn,0,NormWidth);
           Line((XI+XF) Div 2,YI+TH*2+1,(XI+XF) Div 2,YF-1);
           Line(XI+1,(YI+YF) Div 2+TH,XF-1,(YI+YF) Div 2+TH);
           SetLineStyle(SolidLn,0,NormWidth);
           SetViewPort(XI+WinBX+1,YI+TH*2+WinBY+1,XF+WinBX-1,YF+WinBY-1,ClipOn);
           SetColor(Fore);
           OutTextXY((XF-XI) Div 2,(YF-YI) Div 2-TH,'AaBbCc');
           SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
           End;
       End;
     ShowMouse;
     End; { AggCampo }


     Procedure Disegna;
     Begin
     SetWriteMode(XOrPut);
     SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
     With Setup Do
       SetColor(ForeColor);
     WaitToWrite;
     HideMouse;
     Rectangle(PointX-WinBegX,PointY-WinBegY,PointEndX-WinBegX,PointEndY-WinBegY);
     ShowMouse;
     SetWriteMode(NormalPut);
     SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
     End;


Begin { pTesto }
OldStato := sTesto;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;

    WinBX := GetMaxX Div 2-TW*34;
    WinBY := GetMaxY Div 2-TH*14;
    WinEX := GetMaxX Div 2+TW*34;
    WinEY := GetMaxY Div 2+TH*14;

    SetGHorRange(WinBX,WinEX);
    SetGVertRange(WinBY,WinEY);

    WinSize := ImageSize(WinBX,WinBY,WinEX+Shadow,WinEY+Shadow);
    If (WinSize > 0) And (MemAvail > WinSize)
      Then
        Memoria := True
    Else
      Memoria := False;

    WaitToWrite;
    HideMouse;
    If Memoria
      Then
        Begin
        GetMem(WinPunt,WinSize);
        GetImage(WinBX,WinBY,WinEX+Shadow,WinEY+Shadow,WinPunt^);
        End;

    SetFillPattern(MyFill,cShadowDialog);
    SetFillStyle(UserFill,cShadowDialog);
    Bar(WinBX+Shadow,WinBY+Shadow,WinEX+Shadow,WinEY+Shadow);
    SetFillStyle(SolidFill,cBkDialog);
    Bar(WinBX,WinBY,WinEX,WinEY);
    SetColor(cDialogBord);
    Rectangle(WinBX,WinBY,WinEX,WinEY);
    SetColor(cEditColor);
    SetTextJustify(CenterText,CenterText);
    SetTextStyle(DefaultFont,HorizDir,1);

    WriteWin('IMMISSIONE TESTO',WinBX,WinBY,WinEX,WinEY,cBkDialog,cBkDialogTitle,cDialogTitle);

    SetGHorRange(WinBX,WinEX);
    SetGVertRange(WinBY,WinEY);
    SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);

    For i := 1 To 11 Do
      With Vet[i] Do
        Begin
        PosC := 1;
        OldPosC := 0;
        Lim := 5;
        End;

    With Vet[1] Do
      Begin
      Testo := '';
      Campo := 'Testo';
      XI := TW;
      YI := TH*4;
      XF := TW*67;
      YF := TH*6;
      Lim := 57;
      End;
    With Vet[2] Do
      Begin
      Str(Setup.CharSize,Testo);
      Campo := 'Dimensione       ';
      XI := TW;
      YI := TH*8;
      XF := TW*27;
      YF := TH*10;
      End;
    With Vet[3] Do
      Begin
      Str(Setup.UserDivX,Testo);
      Campo := 'Divisione X      ';
      XI := TW;
      YI := TH*11;
      XF := TW*27;
      YF := TH*13;
      End;
    With Vet[4] Do
      Begin
      Str(Setup.UserDivY,Testo);
      Campo := 'Divisione Y      ';
      XI := TW;
      YI := TH*14;
      XF := TW*27;
      YF := TH*16;
      End;
    With Vet[5] Do
      Begin
      Testo := VetHJ[Setup.HorizJust];
      Campo := 'Giustificazione X';
      XI := TW;
      YI := TH*17;
      XF := TW*27;
      YF := TH*19;
      Lim := 0;
      End;
    With Vet[6] Do
      Begin
      Testo := VetD[Setup.Direction];
      Campo := 'Direzione        ';
      XI := TW;
      YI := TH*20;
      XF := TW*27;
      YF := TH*22;
      Lim := 0;
      End;
    With Vet[7] Do
      Begin
      Testo := VetF[Setup.Font];
      Campo := 'Tipo di font     ';
      XI := TW*28;
      YI := TH*8;
      XF := TW*54;
      YF := TH*10;
      Lim := 0;
      End;
    With Vet[8] Do
      Begin
      Str(Setup.UserMultX,Testo);
      Campo := 'Moltiplicazione X';
      XI := TW*28;
      YI := TH*11;
      XF := TW*54;
      YF := TH*13;
      End;
    With Vet[9] Do
      Begin
      Str(Setup.UserMultY,Testo);
      Campo := 'Moltiplicazione Y';
      XI := TW*28;
      YI := TH*14;
      XF := TW*54;
      YF := TH*16;
      End;
    With Vet[10] Do
      Begin
      Testo := VetVJ[Setup.VertJust];
      Campo := 'Giustificazione Y';
      XI := TW*28;
      YI := TH*17;
      XF := TW*54;
      YF := TH*19;
      Lim := 0;
      End;
    With Vet[11] Do
      Begin
      Testo := '';
      Campo := 'VISTA';
      XI := TW*55;
      YI := TH*8;
      XF := TW*67;
      YF := TH*22;
      Lim := 0;
      End;

    With Vet[11] Do
      WriteWin(Campo,XI,YI,XF,YF,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    For i := 1 To 10 Do
      With Vet[i] Do
        WriteLine(Campo,XI,YI,XF,YF,cBkSmallDialog,cBkSmallTitle,cSmallTitle);

    FineX := WinEX-WinBX;
    FineY := WinEY-WinBY;

    With Icone^[IcnOk] Do
      Begin
      X := FineX Div 2-50;
      Y := FineY-25;
      PutImage(X,Y,Icn^,NormalPut);
      End;
    With Icone^[IcnEsci] Do
      Begin
      X := FineX Div 2+30;
      Y := Icone^[IcnOk].Y;
      PutImage(X,Y,Icn^,NormalPut);
      End;

    Attivo := 1;
    OldAttivo := 0;
    EsciWin := False;
    Sel := 1;
    OldSel := 0;
    InsState := True;

    For i := 1 To 11 Do
      With Vet[i] Do
        AggCampo(i,cEditColor,cBkSmallDialog);

    AggCampo(1,cEditColorSel,cBkEditColorSel);

    Repeat

      ShowMouse;
      AggCampo11 := False;

      ClearKeyBuf;
      Repeat
        GetMPos;
      Until (MousePressed Or KeyPressed);

      OldAttivo := Attivo;
      OldTesto := Vet[Attivo].Testo;
      Vet[Attivo].OldPosC := Vet[Attivo].PosC;
      OldInsert := InsState;

      If KeyPressed
        Then
          Begin
          C := ReadKey;
          If (C = kNull)
            Then
              C2 := ReadKey;
          End
      Else
        Begin
        C := kNull;
        C2 := kNull;
        End;

      If LeftButton
        Then
          Begin
          SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
          For i := 1 To 10 Do
            With Vet[i] Do
              If MouseInG(XI+WinBX,YI+WinBY,XF+WinBX,YF+WinBY)
                Then
                  Attivo := i
              Else
                With Icone^[IcnOk] Do
                  If MouseInG(x+WinBX,y+WinBY,x+WinBX+39,y+WinBY+14)
                    Then
                      Begin
                      If PremiPulsante(x+WinBX,y+WinBY,Icn,LeggiFile,IcnOk,SiAttesa,cBkDialog)
                        Then
                          C := kReturn;
                      End
              Else
                With Icone^[IcnEsci] Do
                  If MouseInG(x+WinBX,y+WinBY,x+WinBX+39,y+WinBY+14)
                    Then
                      Begin
                      If PremiPulsante(x+WinBX,y+WinBY,Icn,LeggiFile,IcnEsci,SiAttesa,cBkDialog)
                        Then
                          C := kEscape;
                      End;
          SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
          End
      Else
        If RightButton
          Then
            Begin
            EsciWin := True;
            Vet[1].Testo := StrNull;
            End;

      With Vet[Attivo] Do
        Begin
        F := XI+TW*(Length(Campo)+2);
        Case C Of
          kNull: Case C2 Of
                   kNull: If MouseInG(F+WinBX,YI+WinBY,XF+WinBX,YF+WinBY)
                            Then
                              Begin
                              If (Attivo In [5,6,7,10])
                                Then
                                  PosC := 1
                              Else
                                Begin
                                PosC := (MouseX-WinBX-F) Div TW;
                                If (PosC > Length(Testo))
                                  Then
                                    PosC := Length(Testo)+1
                                Else
                                  If PosC <= 0 Then PosC := 1;
                                End;
                              End;
                   kUp,
                   kPgUp: If (Attivo > 1) Then Dec(Attivo);
                   kDown,
                   kPgDown: If (Attivo < 10) Then Inc(Attivo);
                   kLeft: Begin
                          If (PosC > 1) Then Dec(PosC);
                          If Attivo In [5,6,7,10] Then PosC := 1;
                          With Setup Do
                            Case Attivo Of
                              5: If (HorizJust > 0)
                                   Then
                                     Begin
                                     Dec(HorizJust);
                                     Testo := VetHJ[HorizJust];
                                     AggCampo11 := True;
                                     End;
                              6: If (Direction > 0)
                                   Then
                                     Begin
                                     Dec(Direction);
                                     Testo := VetD[Direction];
                                     AggCampo11 := True;
                                     End;
                              7: If (Font > 0)
                                   Then
                                     Begin
                                     Dec(Font);
                                     Testo := VetF[Font];
                                     AggCampo11 := True;
                                     End;
                              10: If (VertJust > 0)
                                    Then
                                      Begin
                                      Dec(VertJust);
                                      Testo := VetVJ[VertJust];
                                      AggCampo11 := True;
                                      End;
                              End;
                          End;
                   kRight: Begin
                           If (PosC <= Length(Testo)) Then Inc(PosC);
                           If Attivo In [5,6,7,10] Then PosC := 1;
                           With Setup Do
                             Case Attivo Of
                               5: If (HorizJust < 2)
                                    Then
                                      Begin
                                      Inc(HorizJust);
                                      Testo := VetHJ[HorizJust];
                                      AggCampo11 := True;
                                      End;
                               6: If (Direction < 1)
                                    Then
                                      Begin
                                      Inc(Direction);
                                      Testo := VetD[Direction];
                                      AggCampo11 := True;
                                      End;
                               7: If (Font < 10)
                                    Then
                                      Begin
                                      Inc(Font);
                                      Testo := VetF[Font];
                                      AggCampo11 := True;
                                      End;
                               10: If (VertJust < 2)
                                     Then
                                       Begin
                                       Inc(VertJust);
                                       Testo := VetVJ[VertJust];
                                       AggCampo11 := True;
                                       End;
                               End;
                           End;
                   kHome: PosC := 1;
                   kEnd: PosC := Length(Testo)+1;
                   kInsert: InsState := Not InsState;
                   kCancel: If (Testo <> '') And (Attivo In [1,2,3,4,8,9])
                              Then
                                Delete(Testo,PosC,1)
                   End; { Case C2 }
          kEscape: Begin
                   EsciWin := True;
                   Vet[1].Testo := '';
                   End;
          kReturn: EsciWin := True;
          kDel: If (PosC > 1) And (Attivo In [1,2,3,4,8,9])
                  Then
                    Begin
                    Delete(Testo,PosC-1,1);
                    Dec(PosC);
                    End;
          Else
            If (PosC <= Lim) And (Attivo In [1,2,3,4,8,9])
              Then
                Begin
                If (InsState Or (PosC > Length(Testo)))
                  Then
                    Insert(C,Testo,PosC)
                Else
                  If Not InsState
                    Then
                      Testo[PosC] := C;
                If Length(Testo) > Lim
                  Then
                    Testo[0] := Chr(Lim);
                If (PosC <= Length(Testo)) Then Inc(PosC);
                End;
          End; { Case C }

        If (OldTesto <> Testo)
          Then
            AggCampo(Attivo,cEditColorSel,cBkEditColorsel);

        If (OldPosC <> PosC) Or (OldInsert <> InsState) Or
           (OldTesto <> Testo)
             Then
               Begin
               If OldPosC <= 0
                 Then OldPosC := 1;
               WriteCursor(F+TW*OldPosC,F+TW*PosC,YF-3,InsState);
               End;

        If (OldAttivo <> Attivo)
          Then
            Begin

            With Setup Do
              Case OldAttivo Of
                2: Begin
                   Val(Vet[2].Testo,AppL,ErrorCode);
                   If (ErrorCode = 0) And (AppL > 0) And (AppL < 65535)
                     Then
                       Begin
                       CharSize := Word(AppL);
                       AggCampo11 := True;
                       End
                   Else
                     Str(CharSize,Vet[2].Testo);
                   End;
                3: Begin
                   Val(Vet[3].Testo,AppL,ErrorCode);
                   If (ErrorCode = 0) And (AppL > 0) And (AppL < 65535)
                     Then
                       Begin
                       UserDivX := Word(AppL);
                       AggCampo11 := True;
                       End
                   Else
                     Str(UserDivX,Vet[3].Testo);
                   End;
                4: Begin
                   Val(Vet[4].Testo,AppL,ErrorCode);
                   If (ErrorCode = 0) And (AppL > 0) And (AppL < 65535)
                     Then
                       Begin
                       UserDivY := Word(AppL);
                       AggCampo11 := True;
                       End
                   Else
                     Str(UserDivY,Vet[4].Testo);
                   End;
                5: ;
                6: ;
                7: ;
                8: Begin
                   Val(Vet[8].Testo,AppL,ErrorCode);
                   If (ErrorCode = 0) And (AppL > 0) And (AppL < 65535)
                     Then
                       Begin
                       UserMultX := Word(AppL);
                       AggCampo11 := True;
                       End
                   Else
                     Str(UserMultX,Vet[8].Testo);
                   End;
                9: Begin
                   Val(Vet[9].Testo,AppL,ErrorCode);
                   If (ErrorCode = 0) And (AppL > 0) And (AppL < 65535)
                     Then
                       Begin
                       UserMultY := Word(AppL);
                       AggCampo11 := True;
                       End
                   Else
                     Str(UserMultY,Vet[9].Testo);
                   End;
                10: ;
                11: ;
                End;
            AggCampo(OldAttivo,cEditColor,cBkSmallDialog);
            AggCampo(Attivo,cEditColorSel,cBkEditColorSel);
            End;

        If AggCampo11
          Then
            AggCampo(11,cEditColor,cBkSmallDialog);
        End;
    Until EsciWin;

    SetGHorRange(0,GetMaxX);
    SetGVertRange(0,GetMaxY);
    SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);

    If Memoria
      Then
        Begin
        WaitToWrite;
        HideMouse;
        PutImage(WinBX,WinBY,WinPunt^,NormalPut);
        FreeMem(WinPunt,WinSize);
        ShowMouse;
        End
    Else
      DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);


    ShowMouse;

    If (Vet[1].Testo <> StrNull)
      Then
        Begin

        With Setup Do
          Begin
          SetTextStyle(Font,Direction,CharSize);
          If (UserMultX <> 1) Or (UserMultY <> 1) Or
             (UserDivX <> 1) Or (UserDivY <> 1)
               Then
                 SetUserCharSize(UserMultX,UserDivX,UserMultY,UserDivY);
          If (Direction = HorizDir)
            Then
              Begin
              Dx := TextWidth(Vet[1].Testo);
              Dy := TextHeight(Vet[1].Testo);
              End
          Else
            Begin
            Dx := TextHeight(Vet[1].Testo);
            Dy := TextWidth(Vet[1].Testo);
            End;

          Case HorizJust Of
            LeftText:   ;
            CenterText: PointX := PointX-Dx Div 2;
            RightText:  PointX := PointX-Dx;
            End;
          Case VertJust Of
            BottomText: PointY := PointY-Dy;
            CenterText: PointY := PointY-Dy Div 2;
            TopText:    ;
            End;
          PointEndX := PointX+Dx;
          PointEndY := PointY+Dy;
          End;

        EsciWin := False;
        ReleaseMouse;
        Repeat

           PointX := MouseX;
           PointY := MouseY;
           PointEndX := MouseX+Dx;
           PointEndY := MouseY+Dy;

           AppMouseX := MouseX;
           AppMouseY := MouseY;
           OldTastieraX := MouseX;
           OldTastieraY := MouseY;
           TastieraX := MouseX;
           TastieraY := MouseY;

           Disegna;

           ClearKeyBuf;
           Repeat
             GetMouse(True);
           Until (MouseX <> AppMouseX) Or (MouseY <> AppMouseY)
                 Or (TastieraX <> OldTastieraX) Or (TastieraY <> OldTastieraY)
                 Or KeyPressed Or MousePressed;

           Disegna;

           If (TastieraX <> OldTastieraX) Or (TastieraY <> OldTastieraY)
             Then
               Begin
               MouseX := TastieraX;
               MouseY := TastieraY;
               End;

           If KeyPressed
             Then
               Begin
               C := ReadKey;
               If (C = kNull)
                 Then
                   C2 := ReadKey;
               End
           Else
             Begin
             C := kNull;
             C2 := kNull;
             End;

           If LeftButton
             Then
               C := kReturn
           Else
             If RightButton
               Then
                 C := kEscape;

           Case C Of
             kReturn: EsciWin := True;
             kEscape: Begin
                      EsciWin := True;
                      Vet[1].Testo := StrNull;
                      End;
             End;

        Until EsciWin;

        With Setup Do
          Begin
          Case HorizJust Of
            LeftText:   ;
            CenterText: PointX := PointX+Dx Div 2;
            RightText:  PointX := PointX+Dx;
            End;
          Case VertJust Of
            BottomText: PointY := PointY+Dy;
            CenterText: PointY := PointY+Dy Div 2;
            TopText:    ;
            End;
          End;

        HideMouse;
        With Vet[1] Do
          If (Testo <> StrNull)
            Then
              Begin
              InserisciStringa(Testo);
              With Setup Do
                Begin
                InserisciFigura(fTestoInizio,LineStyle,PatternLine,
                                Thickness,ForeColor,Pattern,BackColor,
                                Font,Direction,CharSize,Strings^.St.Num,
                                HorizJust,VertJust);
                InserisciFigura(fTestoFine,LineStyle,PatternLine,
                                Thickness,ForeColor,Pattern,BackColor,
                                UserMultX,UserDivX,UserMultY,UserDivY,
                                PointX-WinBegX+BeginX,PointY-WinBegY+BeginY);
                App := FineOp^.Last;
                DisegnaFigura(WinBegX,WinBegY,WinEndX,WinEndY,App^.Op,App);
                End;
              End;
        ShowMouse;
        ReleaseMouse;
        End;
    End;

End; { pTesto }


Procedure pUserCharSize;

     Procedure Disegna ( X:    Integer;
                         Y:    Integer;
                         Modo: Word;
                         Dove: TipoDove );
     Begin { Disegna }
     If (Dove = Inizio)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
         With Setup Do
           Begin
           If (ForeColor = Black)
             Then
               SetColor(White)
            Else
              SetColor(ForeColor);
           SetLineStyle(SolidLn,0,NormWidth);
           End;
         End;
     If (Ancora = aMobile)
       Then
         Begin
         PointX := FissoX;
         PointY := FissoY;
         End
     Else
       Begin
       PointX := FissoX-(X-FissoX);
       PointY := FissoY-(Y-FissoY);
       End;
     If (Modo <> NoPut)
       Then
         Begin
         SetWriteMode(Modo);
         Rectangle(PointX-WinBegX,PointY-WinBegY,X-WinBegX,Y-WinBegY);
         End;
     If (Dove = Fine)
       Then
         Begin
         SetLineStyle(SolidLn,0,NormWidth);
         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
         SetWriteMode(NormalPut);
         ShowMouse;
         End;
     End; { Disegna }

Begin { pUserCharSize }
If Vuoto
  Then
    OldStato := sRettangolo
Else
  OldStato := sRettangoloPieno;
TastieraX := MouseX;
TastieraY := MouseY;
If AttendiInizio
  Then
    Begin
    PointX := MouseX;
    PointY := MouseY;
    FissoX := PointX;
    FissoY := PointY;
    Repeat
      Mx := MouseX;
      My := MouseY;
      Repeat
        GetMouse(True);
      Until ((MouseX <> Mx) Or (MouseY <> My) Or MousePressed
             Or (Char1 In [kReturn,kSpazio,kEscape]));
      Disegna(Mx,My,XOrPut,Inizio);
      Disegna(MouseX,MouseY,XOrPut,Fine);
    Until (LeftButton Or RightButton Or (Char1 In [kEscape,kSpazio,kReturn]));

    Disegna(MouseX,MouseY,XOrPut,Inizio);
    If (LeftButton Or (Char1 In [kSpazio,kReturn]))
      Then
        Begin
        With Setup Do
          Begin
          UserMultX := Abs(PointX-MouseX);
          UserMultY := Abs(PointY-MouseY);
          SetTextStyle(Font,Direction,CharSize);
          UserDivX := TextWidth('X');
          UserDivY := TextHeight('X');
          End;
        End;
    ReleaseMouse;
    End;

End; { pUserCharSize }


End. { GIPShape }
