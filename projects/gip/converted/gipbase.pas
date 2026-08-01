Unit GIPBase;

Interface { GIPBase }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit,GIPIcWin,GIPGraph;


{----------------------------------------------------------------------------
 PROCEDURA: GRAPHIC.SCREEN

 Disegna la schermata iniziale del programma, completa delle icone laterali,
 quelle dei colori, le barre di scorrimento, ecc.
 ---------------------------------------------------------------------------}
Procedure GraphicScreen;
Procedure EseguiProcedura ( NomeMenu: Byte;
                            NomeOpz:  Byte );
Procedure DisegnaImmagine ( X1:  Integer;
                            Y1:  Integer;
                            X2:  Integer;
                            Y2:  Integer;
                            Clr: Boolean );
Procedure DisegnaFigura (     X1: Integer;
                              Y1: Integer;
                              X2: Integer;
                              Y2: Integer;
                              Op: RecOp;
                          Var P:  PTROperation );
Procedure AggiornaLineBar ( Direzione: TipoDirezione );
Procedure TestArrow;
Procedure TestStrumenti;
Procedure TestColori;
Procedure AggiornaColori;


Implementation { GIPBase }


{----------------------------------------------------------------------------
 PROCEDURA: GRAPHIC.SCREEN

 Disegna la schermata iniziale del programma, completa delle icone laterali,
 quelle dei colori, le barre di scorrimento, ecc.
 ---------------------------------------------------------------------------}
Procedure GraphicScreen;

Var

    { Indici per i cicli }
    I:         Byte;

    { Indice per i cicli }
    X:         Integer;

    { Stringa di appoggio }
    St:        String;

    { Posizione precedente del mouse (X) }
    OldMouseX: Integer;

    { Posizione precedente del mouse (Y) }
    OldMouseY: Integer;

    { Stringa che memorizza la coordinata X del mouse }
    St1:       String;

    { Stringa che memorizza la coordinata Y del mouse }
    St2:       String;

Begin { GraphicScreen }

If (Not Abort)
  Then
    Begin

    { Utility grafica }
    WaitToWrite;

    { Nasconde il cursore del mouse }
    HideMouse;

    { Settaggi iniziali }
    SetBkColor(cBkColor);
    SetColor(cLineColor);

    { Disegno delle due barre del menu e del titolo }
    SetFillStyle(SolidFill,cBkTitle);
    Bar(1,1,GetMaxX-1,AltzMenu-1);
    SetFillStyle(SolidFill,cBkMenu);
    WaitToWrite;
    Bar(1,AltzMenu+1,GetMaxX-1,AltzMenu+AltzMenu-1);
    SetFillStyle(CloseDotFill,cFillColor);
    Bar(LargIcone+1,AltzMenu+AltzMenu+1,GetMaxX-1,GetMaxY-AltzIcone-1);

    { Icone dei colori }
    Rectangle(0,0,GetMaxX,GetMaxY);
    Line(0,AltzMenu,GetMaxX,AltzMenu);
    Line(0,AltzMenu+AltzMenu,GetMaxX,AltzMenu+AltzMenu);
    Line(LargIcone,AltzMenu+AltzMenu,LargIcone,GetMaxY);
    Line(0,GetMaxY-AltzIcone,GetMaxX,GetMaxY-AltzIcone);
    For i := 0 To 15 Do
      Icone^[i].Y := GetMaxY-AltzIcone+1;
    i := 16;
    x := GetMaxX-LargIcone+1;
    While (i > 0) Do
      Begin
      Icone^[i-1].X := x;
      Line(x-1,GetMaxY-AltzIcone,x-1,GetMaxY);
      Dec(i);
      Dec(x,LargIcone);
      End;
    For i := 16 To 31 Do
      Begin
      Icone^[i].Y := GetMaxY-(AltzIcone Div 2)+1;
      Icone^[i].X := Icone^[i-16].X;
      End;

    { Determinazione delle coordinate delle barre di scorrimento (X) }
    BarXBegX := LargIcone+Step+LargBar;
    BarXBegY := GetMaxY-AltzIcone-Step-AltzBar;
    BarXEndX := GetMaxX-Step-LargBar-Step-LargBar+1;
    BarXEndY := GetMaxY-AltzIcone-Step;
    SetFillStyle(SolidFill,DarkGray);
    Rectangle(BarXBegX-LargBar,BarXBegY,BarXEndX+LargBar,BarXEndY);
    Bar(BarXBegX+1,BarXBegY+1,BarXEndX-1,BarXEndY-1);
    Line(BarXBegX,BarXBegY+1,BarXBegX,BarXEndY-1);
    Line(BarXEndX,BarXBegY+1,BarXEndX,BarXEndY+1);

    { Determinazione delle coordinate delle barre di scorrimento (Y) }
    BarYBegX := GetMaxX-Step-LargBar;
    BarYBegY := AltzMenu+AltzMenu+Step+AltzBar+1;
    BarYEndX := GetMaxX-Step;
    BarYEndY := GetMaxY-AltzIcone-Step-AltzBar-Step-AltzBar-1;
    Rectangle(BarYBegX,BarYBegY-AltzBar,BarYEndX,BarYEndY+AltzBar);
    Bar(BarYBegX+1,BarYBegY+1,BarYEndX-1,BarYEndY-1);
    Line(BarYBegX+1,BarYBegY,BarYEndX+1,BarYBegY);
    Line(BarYBegX+1,BarYEndY,BarYEndX+1,BarYEndY);

    { Determinazione delle coordinate della finestra di disegno }
    WinBegX := LargIcone+Step;
    WinBegY := AltzMenu+AltzMenu+Step;
    WinEndX := GetMaxX-Step-LargBar-Step;
    WinEndY := GetMaxY-AltzIcone-Step-AltzBar-Step;
    Rectangle(WinBegX,WinBegY,WinEndX,WinEndY);
    SetFillStyle(1,LightGray);
    Bar(WinBegX+1,WinBegY+1,WinEndX-1,WinEndY-1);

    { Delimitazione dei limiti fisici dell' immagine }
    DefineOriginalSize;

    { Riempimento aree delimitate }
    SetFillStyle(SolidFill,cBkTitle);
    Bar(1,1,GetMaxX-1,AltzMenu-1);
    SetFillStyle(SolidFill,cBkMenu);
    Bar(1,AltzMenu+1,GetMaxX-1,AltzMenu+AltzMenu-1);

    { Scrittura del titolo }
    SetTextStyle(TitleFont,HorizDir,TitleSize);
    SetTextJustify(LeftText,TopText);
    SetColor(LightBlue);
    St := 'G R A P H I C   I M A G E   P R O C E S S O R';
    SetUserCharSize(32,39,2,4);
    OutTextXY(10,-1,St);
    SetColor(Red);
    For i := 1 To 6 Do
      OutTextXY(10+i,-1,St);
    SetColor(White);
    OutTextXY(10+i,-1,St);

    {ClockBegX := 1;
    ClockEndX := LargIcone+LargIcone;
    ClockBegY := GetMaxY-AltzIcone+1;
    ClockEndY := GetMaxY-1;}

    { Settaggi delle coordinate grafiche delle icone }
    Icone^[IcnSinistra     ].X := BarXBegX-LargBar+1;
    Icone^[IcnSinistra     ].Y := BarXBegY+1;
    Icone^[IcnDestra       ].X := BarXEndX+1;
    Icone^[IcnDestra       ].Y := BarXBegY+1;
    Icone^[IcnAlto         ].X := BarYBegX+1;
    Icone^[IcnAlto         ].Y := BarYBegY-AltzBar+1;
    Icone^[IcnBasso        ].X := BarYBegX+1;
    Icone^[IcnBasso        ].Y := BarYEndY+1;

    Icone^[IcnSceltaOggetti].X := 1;
    Icone^[IcnSceltaOggetti].Y := AltzMenu+AltzMenu+1;
    Icone^[IcnOpDisco      ].X := 1;
    Icone^[IcnOpDisco      ].Y := Icone^[IcnSceltaOggetti].Y+30;
(*    Icone^[IcnZoom         ].X := 1;
    Icone^[IcnZoom         ].Y := Icone^[IcnOpDisco].Y+30;*)
    Icone^[IcnPalette      ].X := 1;
    Icone^[IcnPalette      ].Y := Icone^[IcnOpDisco].Y+30;
    Icone^[IcnSpostaSchermo].X := 1;
    Icone^[IcnSpostaSchermo].Y := Icone^[IcnPalette].Y+30;
    Icone^[IcnDisegnoLibero].X := 1;
    Icone^[IcnDisegnoLibero].Y := Icone^[IcnSpostaSchermo].Y+30;
    Icone^[IcnOpBlocchi    ].X := 1;
    Icone^[IcnOpBlocchi    ].Y := Icone^[IcnDisegnoLibero].Y+30;
    Icone^[IcnConversione  ].X := 1;
    Icone^[IcnConversione  ].Y := Icone^[IcnOpBlocchi].Y+30;
    Icone^[IcnHelpOnLine   ].X := 1;
    Icone^[IcnHelpOnLine   ].Y := Icone^[IcnConversione].Y+30;
    Icone^[IcnSceltaFont   ].X := 1;
    Icone^[IcnSceltaFont   ].Y := Icone^[IcnHelpOnLine].Y+30;
    Icone^[IcnSceltaForma  ].X := 1;
    Icone^[IcnSceltaForma  ].Y := Icone^[IcnSceltaFont].Y+30;
    Icone^[IcnSceltaRetino ].X := 1;
    Icone^[IcnSceltaRetino ].Y := Icone^[IcnSceltaForma].Y+30;
    Icone^[IcnSceltaLinea  ].X := 1;
    Icone^[IcnSceltaLinea  ].Y := Icone^[IcnSceltaRetino].Y+30;
    Icone^[IcnOrologio     ].X := 1;
    Icone^[IcnOrologio     ].Y := Icone^[IcnSceltaLinea].Y+30;
    Icone^[IcnAttivo       ].X := 1;
    Icone^[IcnAttivo       ].Y := GetMaxY-29;

    SetColor(cLineColor);
    For i := IcnSceltaOggetti To IcnOrologio Do
      Line(1,Icone^[i].Y+29,LargIcone-1,Icone^[i].Y+29);

    SetFillStyle(SolidFill,cLineColor);
    Bar(1,Icone^[IcnOrologio].Y+30,LargIcone,GetMaxY-1);
    Bar(1,GetMaxY-AltzIcone,Icone^[IcnForeBlack].X-1,GetMaxY-1);
    Bar(1,Icone^[IcnAttivo].Y,GetMaxX,GetMaxY);

    InizioCoordX := 63;
    InizioCoordY := GetMaxY-AltzIcone+3;
    FineCoordX := Icone^[IcnForeBlack].X-4;
    FineCoordY := GetMaxY-3;

    { Coordinate grafiche delle coordinate del puntatore che compaiono sul
      video }
    PosCoordX := InizioCoordX+(FineCoordX-InizioCoordX) Div 2;
    PosCoordY := InizioCoordY+(FineCoordY-InizioCoordY) Div 2+1;

    { Parte destra e alta del pulsante }
    SetColor(White);
    Line(InizioCoordX-2,InizioCoordY-2,FineCoordX+2,InizioCoordY-2);
    Line(InizioCoordX-1,InizioCoordY-1,FineCoordX+1,InizioCoordY-1);
    Line(InizioCoordX-2,InizioCoordY-2,InizioCoordX-2,FineCoordY+2);
    Line(InizioCoordX-1,InizioCoordY-1,InizioCoordX-1,FineCoordY+1);

    { Parte sinistra e bassa del pulsante }
    SetColor(DarkGray);
    Line(InizioCoordX-1,FineCoordY+2,FineCoordX+2,FineCoordY+2);
    Line(InizioCoordX  ,FineCoordY+1,FineCoordX+1,FineCoordY+1);
    Line(FineCoordX+2,InizioCoordY-2,FineCoordX+2,FineCoordY+2);
    Line(FineCoordX+1,InizioCoordY-1,FineCoordX+1,FineCoordY+1);

    SetFillStyle(SolidFill,cBkCoord);
    Bar(InizioCoordX,InizioCoordY,FineCoordX,FineCoordY);

    { Disegno delle icone }
    For i := IcnForeBlack To IcnAttivo Do
      With Icone^[i] Do
        PutImage(X,Y,Icn^,NormalPut);

    AggiornaColori;

    End;
End; { GraphicScreen }


Procedure AggiornaColori;
Begin { AggiornaColori }
With Icone^[IcnForeBlack+Setup.ForeColor] Do
  PutImage(LargIcone+1,GetMaxY-AltzIcone+1,Icn^,NormalPut);
With Icone^[IcnBackBlack+Setup.BackColor] Do
  PutImage(LargIcone+1,GetMaxY-AltzIcone+16,Icn^,NormalPut);
End; { AggiornaColori }


Procedure EseguiProcedura ( NomeMenu: Byte;
                            NomeOpz:  Byte );
Begin { EseguiProcedura }

Case NomeMenu Of

  { Menu FILE }
  1: Case NomeOpz Of
       1: Stato := sDiscoLeggi;
       2: Stato := sDiscoSalva;
       3: Stato := sDiscoNuovo;
       4: Stato := sDiscoStampa;
       5: Stato := sDiscoEsci;
       End; { Case NomeOpz }

  { Menu SETUP }
  2: Case NomeOpz Of
       1: IconWinSceltaRetino(StepWin,StepWin);
       2: IconWinSceltaLinea(StepWin,StepWin);
       3: IconWinSceltaFont(StepWin,StepWin);
       4: Stato := sNewPalette;
       5: ;
       End; { Case NomeOpz }

  { Menu TOOLS }
  3: Case NomeOpz Of
       1: (*IconWinZoom(StepWin,StepWin);*)
          Stato := sNewPalette;
       2: IconWinMovim(StepWin,StepWin);
       3: IconWinSceltaForma(StepWin,StepWin);
       4: Begin
          Stato := sDisegnoLibero;
          ConstIcnAttivo := ConstIcnDisegnoLibero;
          End;
       5: ;
       End; { Case NomeOpz }

  { Menu BLOCCHI }
  4: Case NomeOpz Of
       1: Stato := sBlockMemorizza;
       2: Stato := sBlockRichiama;
       3: Stato := sBlockSposta;
       4: Stato := sBlockCopia;
       5: ;
       End; { Case NomeOpz }

  { Menu CONVERSIONE }
  5: Case NomeOpz Of
       1: Stato := sConvTurboC;
       2: Stato := sConvTurboPascal;
       3: Stato := sConvTurboAsm;
       4: ;
       5: ;
       End; { Case NomeOpz }

  { Menu HELP }
  6: Case NomeOpz Of
       1: Stato := sHelpOnLine;
       2: Stato := sHelpPrecedente;
       3: Stato := sHelpIndice;
       4: Stato := sOrologio;
       5: Stato := sHelpGIP;
       End; { Case NomeOpz }

   End; { Case NomeMenu }

End; { EseguiProcedura }




Procedure DisegnaFigura (     X1: Integer;
                              Y1: Integer;
                              X2: Integer;
                              Y2: Integer;
                              Op: RecOp;
                          Var P:  PTROperation );
Var I:       Integer;
    AppPTR:  PTRStrings;
    St:      String;
    Trovato: Boolean;
    ArcC:    ArcCoordsType;
    FP:      FillPatternType;
    AltezzaX,
    AltezzaY: Integer;
    Quad: Byte;

Begin { DisegnaFigura }

With Op Do
  Begin
  If (Figura <> fUserFill)
    Then
      Begin
      SetLineStyle(LineSt,LinePt,LineTh);
      SetColor(ColLin);
      If (Retino = UserFill)
        Then
          Begin
          SetFillPattern(Setup.UserPattern,ColRet);
          SetFillStyle(UserFill,ColRet);
          End
      Else
        SetFillStyle(Retino,ColRet);
      End;
  SetViewPort(WinBegX,WinBegY,WinEndX,WinEndY,ClipOn);
  Case Figura Of

    { -Codice 000-
      Figura:    Arco (Arc)
      Parametri: X        (Integer)
                 Y        (Integer)
                 StAngle  (Word)
                 EndAngle (Word)
                 Radius   (Word) }
    fArcoCorda,
    fArco: Begin
           Ellipse(Word1-BeginX,Word2-BeginY,Word5,Word6,Word3,Word4);
           If (Figura = fArcoCorda)
             Then
               Begin
               GetArcCoords(ArcC);
               With ArcC Do
                 Line(XStart,YStart,XEnd,YEnd);
               End;
           End;

    { -Codice fRettangoloPieno-
      Figura:    Rettangolo pieno (Bar)
      Parametri: X1 (Integer) -> Word1
                 Y1 (Integer) -> Word2
                 X2 (Integer) -> Word3
                 Y2 (Integer) -> Word4 }
    fRettangoloPieno,
    { -Codice fRettangolo-
      Figura:    Rettangolo (Rectangle)
      Parametri: X1 (Integer) -> Word1
                 Y1 (Integer) -> Word2
                 X2 (Integer) -> Word3
                 Y2 (Integer) -> Word4 }

    fRettangolo: Begin
                 If (Figura = fRettangoloPieno)
                   Then
                     Bar(Word1-BeginX,Word2-BeginY,
                         Word3-BeginX,Word4-BeginY);
                 Rectangle(Word1-BeginX,Word2-BeginY,
                           Word3-BeginX,Word4-BeginY);
                 End;

    { -Codice 003-
      Figura:    Cerchio pieno (Circle)
      Parametri: X             (Integer)
                 Y             (Integer)
                 Radius        (Word) }
    fCerchioPieno,

    { -Codice 003-
      Figura:    Cerchio (Circle)
      Parametri: X      (Integer)
                 Y      (Integer)
                 Radius (Word) }
    fCerchio: Begin
              If (Figura = fCerchioPieno)
                Then
                  FillEllipse(Word1-BeginX,Word2-BeginY,Word3,Word4);
              Ellipse(Word1-BeginX,Word2-BeginY,0,360,Word3,Word4);
              End;

    { -Codice fPoligono-
      Figura:    Poligono di MaxPolyPoints lati al massimo (DrawPoly)
      Parametri: NumPoints (Word)             -> Word1 (la prima volta)
                 PolyPoints (array PointType) -> contiene gli n valori
                                                 per ogni coppia: se ci sono
                                                 più di 2 punti, si continua
                                                 sul codice seguente }
    fPoligonoPieno,
    { -Codice fPoligonoPieno-
      Figura:    Poligono pieno di MaxPolyPoints lati al massimo (DrawPoly)
      Parametri: NumPoints (Word)             -> Word1 (la prima volta)
                 PolyPoints (array PointType) -> contiene gli n valori
                                                 per ogni coppia: se ci sono
                                                 più di 2 punti, si continua
                                                 sul codice seguente }
    fPoligono: Begin
               NumPunti := Word1;
               If (NumPunti > MaxPolyPoints)
                 Then
                   NumPunti := MaxPolyPoints;
               i := 0;
               P := P^.Next;
               Repeat
                 With P^.Op Do
                   If ((Word1 <> NUI) And (Word2 <> NUI))
                     Then
                       Begin
                       Inc(i);
                       Polig[i].X := Word1-BeginX;
                       Polig[i].Y := Word2-BeginY;
                       If ((Word3 <> NUI) And (Word4 <> NUI))
                         Then
                           Begin
                           Inc(i);
                           Polig[i].X := Word3-BeginX;
                           Polig[i].Y := Word4-BeginY;
                           If ((Word5 <> NUI) And (Word6 <> NUI))
                             Then
                               Begin
                               Inc(i);
                               Polig[i].X := Word5-BeginX;
                               Polig[i].Y := Word6-BeginY;
                               End;
                           End;
                       End;
                  If (i < NumPunti)
                    Then
                      P := P^.Next;
               Until (i >= NumPunti);

               If (Figura = fPoligonoPieno)
                 Then
                   FillPoly(NumPunti,Polig)
               Else
                 DrawPoly(NumPunti,Polig);
               End;

    { -Codice fLinea-
      Figura:    Linea (Line)
      Parametri: X1 (Integer) -> Word1
                 Y1 (Integer) -> Word2
                 X2 (Integer) -> Word3
                 Y2 (Integer) -> Word4 }
    fLinea: Line(Word1-BeginX,Word2-BeginY,Word3-BeginX,Word4-BeginY);

    { -Codice fLinea-
      Figura:    Riempimento (FloodFill)
      Parametri: X (Integer) -> Word1
                 Y (Integer) -> Word2
                 Colore (Word) -> Word3 }
    fRiempimento: FloodFill(Word1-BeginX,Word2-BeginY,Word3);

    { -Codice fDisegnoLibero-
      Figura:    Punto (PutPixel)
      Parametri: X (Integer) -> Word1
                 Y (Integer) -> Word2
                 Colore (Word) -> ColLin }
    fDisegnoLibero: PutPixel(Word1-BeginX,Word2-BeginY,Word3);

    { -Codice fTestoInizio-
      Figura:    Testo (OutTextXY)
      Parametri: X (Integer) -> Word1
                 Y (Integer) -> Word2
                 Colore (Word) -> ColLin }
    fTestoInizio: Begin
                  SetTextStyle(Word1,Word2,Word3);
                  SetTextJustify(Word5,Word6);

                  AppPTR := InizioSt;
                  St := StrNull;
                  Trovato := False;
                  While (AppPTR <> NIL) And (Not Trovato) Do
                    Begin
                    If (AppPTR^.St.Num = Word4)
                      Then
                        Begin
                        Trovato := True;
                        St := AppPTR^.St.St;
                        End;
                    AppPTR := AppPTR^.Next;
                    End;

                  P := P^.Next;
                  With P^.Op Do
                    Begin
                    If (Word1 <> 1) Or (Word2 <> 1) Or (Word3 <> 1) Or (Word4 <> 1)
                      Then
                        SetUserCharSize(Word1,Word2,Word3,Word4);
                    OutTextXY(Word5-BeginX,Word6-BeginY,St);
                    End;
                  End;
    fSettorePieno: Sector(Word1-BeginX,Word2-BeginY,Word3,Word4,Word5,Word6);
    fSettore: Begin
              Ellipse(Word1-BeginX,Word2-BeginY,Word3,Word4,Word5,Word6);
              GetArcCoords(ArcC);
              With ArcC Do
                Begin
                Line(XStart,YStart,X,Y);
                Line(XEnd,YEnd,X,Y);
                End;
              End;
    { -Codice 002-
      Figura:    Rettangolo tridimensionale (Bar3D)
      Parametri: X1    (Integer)
                 Y1    (Integer)
                 X2    (Integer)
                 Y2    (Integer)
                 Depth (Word)
                 Top   (Boolean) }
    fRettangolo3DPieno,
    fRettangolo3D: Begin
                   If (Figura = fRettangolo3DPieno)
                     Then
                       Bar(Word1-BeginX,Word2-BeginY,Word3-BeginX,Word4-BeginY);
                   Rectangle(Word1-BeginX,Word2-BeginY,Word3-BeginX,Word4-BeginY);
                   AltezzaX := Word5;
                   AltezzaY := Word6 Mod 5000;
                   Quad := Word6 Div 5000;
                   Case Quad Of
                     1: Begin
                        Polig[1].X := Word1-BeginX;
                        Polig[1].Y := Word2-BeginY;
                        Polig[2].X := Word1-BeginX-AltezzaX;
                        Polig[2].Y := Word2-BeginY-AltezzaY;
                        Polig[3].X := Word3-BeginX-AltezzaX;
                        Polig[3].Y := Word2-BeginY-AltezzaY;
                        Polig[4].X := Word3-BeginX;
                        Polig[4].Y := Word2-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(4,Polig);
                        Polig[4] := Polig[1];
                        Polig[1].X := Word1-BeginX-AltezzaX;
                        Polig[1].Y := Word2-BeginY-AltezzaY;
                        Polig[2].X := Word1-BeginX-AltezzaX;
                        Polig[2].Y := Word4-BeginY-AltezzaY;
                        Polig[3].X := Word1-BeginX;
                        Polig[3].Y := Word4-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(3,Polig);
                        End;
                     2: Begin
                        Polig[1].X := Word1-BeginX;
                        Polig[1].Y := Word2-BeginY;
                        Polig[2].X := Word1-BeginX+AltezzaX;
                        Polig[2].Y := Word2-BeginY-AltezzaY;
                        Polig[3].X := Word3-BeginX+AltezzaX;
                        Polig[3].Y := Word2-BeginY-AltezzaY;
                        Polig[4].X := Word3-BeginX;
                        Polig[4].Y := Word2-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(4,Polig);

                        Polig[1].X := Word3-BeginX+AltezzaX;
                        Polig[1].Y := Word2-BeginY-AltezzaY;
                        Polig[2].X := Word3-BeginX+AltezzaX;
                        Polig[2].Y := Word4-BeginY-AltezzaY;
                        Polig[3].X := Word3-BeginX;
                        Polig[3].Y := Word4-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(3,Polig);
                        End;
                     3: Begin
                        Polig[1].X := Word1-BeginX;
                        Polig[1].Y := Word4-BeginY;
                        Polig[2].X := Word1-BeginX+AltezzaX;
                        Polig[2].Y := Word4-BeginY+AltezzaY;
                        Polig[3].X := Word3-BeginX+AltezzaX;
                        Polig[3].Y := Word4-BeginY+AltezzaY;
                        Polig[4].X := Word3-BeginX;
                        Polig[4].Y := Word4-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(4,Polig);

                        Polig[1].X := Word3-BeginX+AltezzaX;
                        Polig[1].Y := Word4-BeginY+AltezzaY;
                        Polig[2].X := Word3-BeginX+AltezzaX;
                        Polig[2].Y := Word2-BeginY+AltezzaY;
                        Polig[3].X := Word3-BeginX;
                        Polig[3].Y := Word2-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(3,Polig);
                        End;
                     4: Begin
                        Polig[1].X := Word1-BeginX;
                        Polig[1].Y := Word4-BeginY;
                        Polig[2].X := Word1-BeginX-AltezzaX;
                        Polig[2].Y := Word4-BeginY+AltezzaY;
                        Polig[3].X := Word3-BeginX-AltezzaX;
                        Polig[3].Y := Word4-BeginY+AltezzaY;
                        Polig[4].X := Word3-BeginX;
                        Polig[4].Y := Word4-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(4,Polig);

                        Polig[4] := Polig[1];
                        Polig[1].X := Word1-BeginX-AltezzaX;
                        Polig[1].Y := Word4-BeginY+AltezzaY;
                        Polig[2].X := Word1-BeginX-AltezzaX;
                        Polig[2].Y := Word2-BeginY+AltezzaY;
                        Polig[3].X := Word1-BeginX;
                        Polig[3].Y := Word2-BeginY;
                        If (Figura = fRettangolo3DPieno)
                          Then
                            FillPoly(4,Polig)
                        Else
                          DrawPoly(3,Polig);
                        End;
                     End; { Case Quad }

                   End;
    fUserFill: Begin
               FP[1] := LineSt;
               FP[2] := LinePt;
               FP[3] := LineTh;
               FP[4] := ColLin;
               FP[5] := Retino;
               FP[6] := ColRet;
               FP[7] := Word1;
               FP[8] := Word2;
               Setup.Pattern := UserFill;
               Setup.UserPattern := FP;
               End;
    End; { Case Figura }
  SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
  End;

End; { DisegnaFigura }


Procedure DisegnaImmagine ( X1:  Integer;
                            Y1:  Integer;
                            X2:  Integer;
                            Y2:  Integer;
                            Clr: Boolean );

Var

    App: PTROperation;

Begin { DisegnaImmagine }


If Clr
  Then
    Begin
    WaitToWrite;
    HideMouse;
    SetLineStyle(SolidLn,0,NormWidth);
    SetColor(ColorImage);
    SetFillStyle(SolidFill,ColorImage);
    Bar(X1,Y1,X2,Y2);
    ShowMouse;
    End;

HideMouse;

If (InizioOp <> NIL)
  Then
    Begin
    App := InizioOp;
    While (App <> NIL) Do
      Begin
      DisegnaFigura(X1,Y1,X2,Y2,App^.Op,App);
      App := App^.Next;
      End;
    End;

SetLineStyle(SolidLn,0,NormWidth);
SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
SetWriteMode(NormalPut);
ShowMouse;
End; { DisegnaImmagine }


Procedure AggiornaLineBar ( Direzione: TipoDirezione );

Var DistX,DistY: Integer;

Begin { AggiornaLineBar }

SetFillStyle(SolidFill,cBkBarLine);
If (Direzione = Orizzontale)
  Then
    Begin
    DistX := BarXEndX-BarXBegX-15;
    CoordX := Round(BeginX/(MaxRisX-(WinEndX-WinBegX))*DistX);
    If (CoordX < 0)
      Then
        CoordX := 0
    Else
      If (CoordX > DistX)
        Then
          CoordX := DistX;
    End
Else
  Begin
  DistY := BarYEndY-BarYBegY-15;
  CoordY := Round(BeginY/(MaxRisY-(WinEndY-WinBegY))*DistY);
  If (CoordY < 0)
    Then
      CoordY := 0
  Else
    If (CoordY > DistY)
      Then
        CoordY := DistY;
  End;

If (Direzione = Orizzontale)
  Then
    Begin
    If (OldCoordX <> CoordX)
      Then
        Begin
        WaitToWrite;
        HideMouse;
        If (OldCoordX <> -1)
          Then
            Bar(BarXBegX+OldCoordX+1,BarXBegY+1,BarXBegX+OldCoordX+13,
                BarXEndY-1);
        PutImage(BarXBegX+CoordX+1,BarXBegY+1,Icone^[IcnCursorBar].Icn^,
                 NormalPut);
        OldCoordX := CoordX;
        End;
    End
Else
  Begin
  If (OldCoordY <> CoordY)
    Then
      Begin
      WaitToWrite;
      HideMouse;
      If (OldCoordY <> -1)
        Then
          Bar(BarYBegX+1,BarYBegY+OldCoordY+1,BarYEndX-1,
              BarYBegY+OldCoordY+13);
      PutImage(BarYBegX+1,BarYBegY+CoordY+1,Icone^[IcnCursorBar].Icn^,
               NormalPut);
      OldCoordY := CoordY;
      End;
  End;
ShowMouse;
End; { AggiornaLineBar }


Procedure TestArrow;
Var Step100,I: Byte;
    AppBeginX,AppBeginY: Integer;
    Premuto: Boolean;
    Dist: Integer;
    MouseNotIn: Boolean;

Begin { TestArrow }

Premuto := False;
If (Not Risultato)
  Then
    Begin
    AppBeginX := BeginX;
    AppBeginY := BeginY;
    Repeat

      If ShiftPressed
        Then
          Step100 := 10
      Else
        Step100 := 1;
      If NumLockActivated
        Then
          Step100 := Step100*10;

      For i := IcnSinistra To IcnBasso Do
        With Icone^[i] Do
          If (Not Risultato)
            Then
              If (MyMouseInG(X,Y,X+14,Y+14) And ((MouseOk And LeftButton)
                  Or (Tastiera And (Char1 In [kReturn,kSpazio]))))
                    Then
                      If PremiPulsante(x,y,Icn,Frecce,i,NoAttesa,cLineColor)
                        Then
                          Begin
                          Premuto := True;
                          Case I Of
                            IcnSinistra: If (BeginX > 0)
                                           Then
                                             Dec(BeginX,Step100);
                            IcnDestra:   If (BeginX < MaxRisX-(WinEndX-WinBegX))
                                           Then
                                             Inc(BeginX,Step100);
                            IcnAlto:     If (BeginY > 0)
                                           Then
                                             Dec(BeginY,Step100);
                            IcnBasso:    If (BeginY < MaxRisY-(WinEndY-WinBegY))
                                           Then
                                             Inc(BeginY,Step100);
                            End; { Case I }

                          If (I In [IcnSinistra,IcnDestra])
                            Then
                              AggiornaLineBar(Orizzontale)
                          Else
                            AggiornaLineBar(Verticale);
                          End;
      If (BeginX < 0)
        Then
          BeginX := 0
      Else
        If (BeginX > MaxRisX-(WinEndX-WinBegX))
          Then
            BeginX := MaxRisX-(WinEndX-WinBegX);

      If (BeginY < 0)
        Then
          BeginY := 0
      Else
        If (BeginY > MaxRisY-(WinEndY-WinBegY))
          Then
            BeginY := MaxRisY-(WinEndY-WinBegY);
      EndX := BeginX+(WinEndX-WinBegX);
      EndY := BeginY+(WinEndY-WinBegY);
      GetMPos;
      MouseNotIn := MyMouseInG(BarXBegX,BarXBegY,BarXEndX,BarXEndY)
                    Or MyMouseInG(BarYBegX,BarYBegY,BarYEndX,BarYEndY);
    Until ((Not LeftButton) Or MouseNotIn Or (Not Premuto));

    Risultato := Premuto;

    If MyMouseInG(BarXBegX,BarXBegY,BarXEndX,BarXEndY)
      Then
        Begin
        Risultato := True;
        SetGHorRange(BarXBegX,BarXEndX-14);
        SetGVertRange(BarXBegY,BarXEndY);
        Dist := BarXEndX-BarXBegX-16;
        Repeat
          GetMPos;
          If LeftButton
            Then
              Begin
              CoordX := MouseX-BarXBegX-1;
              If (CoordX = 0)
                Then
                  BeginX := 0
              Else
                BeginX := Round((CoordX/Dist)*(MaxRisX-
                               (WinEndX-WinBegX)));
              If (BeginX < 0)
                Then
                  BeginX := 0
              Else
                If (BeginX > MaxRisX-(WinEndX-WinBegX))
                  Then
                    BeginX := MaxRisX-(WinEndX-WinBegX);
              EndX := BeginX+(WinEndX-WinBegX);
              AggiornaLineBar(Orizzontale);
              End;
        Until (Not LeftButton);
        End
    Else
      If MyMouseInG(BarYBegX,BarYBegY,BarYEndX,BarYEndY)
        Then
          Begin
          Risultato := True;
          SetGHorRange(BarYBegX,BarYEndX);
          SetGVertRange(BarYBegY,BarYEndY-14);
          Dist := BarYEndY-BarYBegY-16;
          Repeat
            GetMPos;
            If LeftButton
              Then
                Begin
                CoordY := MouseY-BarYBegY-1;
                If (CoordY = 0)
                  Then
                    BeginY := 0
                Else
                  BeginY := Round((CoordY/Dist)*(MaxRisY-
                                 (WinEndY-WinBegY)));
                If (BeginY < 0)
                  Then
                    BeginY := 0
                Else
                  If (BeginY > MaxRisY-(WinEndY-WinBegY))
                    Then
                      BeginY := MaxRisY-(WinEndY-WinBegY);
                EndY := BeginY+(WinEndY-WinBegY);
                AggiornaLineBar(Verticale);
                End;
          Until (Not LeftButton);
          End;
    End;

SetGHorRange(0,GetMaxX);
SetGVertRange(0,GetMaxY);

If ((BeginX <> AppBeginX) Or (BeginY <> AppBeginY))
  Then
    DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);

End; { TestArrow }


Procedure TestStrumenti;
Var I: Byte;
Begin { TestStrumenti }

If (Not Risultato)
  Then
    For i := IcnSceltaOggetti To IcnOrologio Do
      With Icone^[i] Do
        If (Not Risultato)
          Then
            If (MyMouseInG(X,Y,X+29,Y+29) And ((MouseOk And LeftButton)
                Or (Tastiera And (Char1 In [kReturn,kSpazio]))))
                  Then
                    If PremiPulsante(x,y,Icn,Strumenti,i,SiAttesa,cLineColor)
                      Then
                        Begin
                        Risultato := True;
                        Case I Of
                          IcnSceltaOggetti: Begin
                                            Stato := sSceltaOggetti;
                                            ConstIcnAttivo := ConstIcnSceltaOggetti;
                                            End;
                          IcnOpDisco:       IconWinOpDisco(x+StepWin,y+StepWin);
                          IcnPalette:       (*IconWinZoom(x+StepWin,y+StepWin);*)
                                            Stato := sNewPalette;
                          IcnSpostaSchermo: IconWinMovim(x+StepWin,y+StepWin);
                          IcnDisegnoLibero: Begin
                                            Stato := sDisegnoLibero;
                                            ConstIcnAttivo := ConstIcnDisegnoLibero;
                                            End;
                          IcnOpBlocchi:     IconWinOpBlocchi(x+StepWin,y+StepWin);
                          IcnConversione:   IconWinConversione(x+StepWin,y+StepWin);
                          IcnHelpOnLine:    Begin
                                            Stato := sHelpOnLine;
                                            ConstIcnAttivo := ConstIcnHelpOnLine;
                                            End;
                          IcnSceltaFont:    IconWinSceltaFont(x+StepWin,y+StepWin);
                          IcnSceltaForma:   IconWinSceltaForma(x+StepWin,y+StepWin);
                          IcnSceltaRetino:  IconWinSceltaRetino(x+StepWin,y+StepWin);
                          IcnSceltaLinea:   IconWinSceltaLinea(x+StepWin,y+StepWin);
                          IcnOrologio:      Stato := sOrologio;
                          End; { Case I }
                        End;
End; { TestStrumenti }


Procedure TestColori;
Var I: Byte;
Begin { TestColori }

If (Not Risultato)
  Then
    For i := IcnForeBlack To IcnBackWhite Do
      With Icone^[i] Do
        If (Not Risultato)
          Then
            If (MyMouseInG(X,Y,X+29,Y+14) And ((MouseOk And LeftButton)
                Or (Tastiera And (Char1 In [kReturn,kSpazio]))))
                  Then
                    If PremiPulsante(x,y,Icn,Colore,i,SiAttesa,cLineColor)
                      Then
                        Begin
                        Risultato := True;
                        With Setup Do
                          Case I Of
                            IcnForeBlack:        ForeColor := Black;
                            IcnForeBlue:         ForeColor := Blue;
                            IcnForeGreen:        ForeColor := Green;
                            IcnForeCyan:         ForeColor := Cyan;
                            IcnForeRed:          ForeColor := Red;
                            IcnForeMagenta:      ForeColor := Magenta;
                            IcnForeBrown:        ForeColor := Brown;
                            IcnForeLightGray:    ForeColor := LightGray;
                            IcnForeDarkGray:     ForeColor := DarkGray;
                            IcnForeLightBlue:    ForeColor := LightBlue;
                            IcnForeLightGreen:   ForeColor := LightGreen;
                            IcnForeLightCyan:    ForeColor := LightCyan;
                            IcnForeLightRed:     ForeColor := LightRed;
                            IcnForeLightMagenta: ForeColor := LightMagenta;
                            IcnForeYellow:       ForeColor := Yellow;
                            IcnForeWhite:        ForeColor := White;

                            IcnBackBlack:        BackColor := Black;
                            IcnBackBlue:         BackColor := Blue;
                            IcnBackGreen:        BackColor := Green;
                            IcnBackCyan:         BackColor := Cyan;
                            IcnBackRed:          BackColor := Red;
                            IcnBackMagenta:      BackColor := Magenta;
                            IcnBackBrown:        BackColor := Brown;
                            IcnBackLightGray:    BackColor := LightGray;
                            IcnBackDarkGray:     BackColor := DarkGray;
                            IcnBackLightBlue:    BackColor := LightBlue;
                            IcnBackLightGreen:   BackColor := LightGreen;
                            IcnBackLightCyan:    BackColor := LightCyan;
                            IcnBackLightRed:     BackColor := LightRed;
                            IcnBackLightMagenta: BackColor := LightMagenta;
                            IcnBackYellow:       BackColor := Yellow;
                            IcnBackWhite:        BackColor := White;
                            End; { Case I }
                        AggiornaColori;
                        End;

End; { TestColori }


End. { GIPBase }
