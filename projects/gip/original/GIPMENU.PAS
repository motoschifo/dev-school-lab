Unit GIPMenu;

Interface { GIPMenu }

Uses Crt,Graph,Keyboard,Mouse,Dos,GIPVars,GIPFast,GIPBase,GIPInit,GIPGraph;

Procedure DrawMenu ( NumMenu: Byte );
Procedure SelectMenu;
Function  MouseInMenuBar: Boolean;

Implementation { GIPMenu }

Procedure DrawMenu ( NumMenu: Byte );
Var I,Lung,Prec: Integer;

Begin { DrawMenu }
SetFillStyle(SolidFill,cBkMenuTitle);
SetTextStyle(MenuFont,HorizDir,MenuSize);
SetTextJustify(CenterText,CenterText);
SetColor(cMenuTitle);
WaitToWrite;
HideMouse;

Prec := StepTitle-1;
For i := 1 To MenuTitle Do
  With Menu^[i] Do
    Begin
    Lung := TW*Length(Title);
    If ((NumMenu = 0) Or (NumMenu = i))
      Then
          Begin
          Bar(Prec+2,AltzMenu+3,Prec+Lung-1,AltzMenu+AltzMenu-3);
          OutTextXY(Prec+(Lung Div 2),AltzMenu+AltzMenu Div 2+1,Title);
          Rectangle(Prec+1,AltzMenu+2,Prec+Lung,AltzMenu+AltzMenu-2);
          End;
    Inc(Prec,Lung+StepTitle);
    End;

ShowMouse;

End; { DrawMenu }


Procedure SelectMenu;

Var Prec, NewPrec, Lung, NewLung, I, J: Integer;
    NumOpzMenu: Byte;
    TempOpz: Byte;
    MaxLength: Byte;
    LungFin: Integer;
    InizioX,InizioY,FineX,FineY: Integer;
    Fin: Pointer;
    Size: Word;
    TH: Integer;
    OldOpz: Byte;
    AltroMenu: Boolean;
    A: Integer;
    Rilasciato: Boolean;
    SaveOpz: Byte;


     Function  MouseInTitleMenu: Boolean;
     Begin { MouseInTitleMenu }
     MouseInTitleMenu := (MyMouseInG(Prec+1,AltzMenu+2,Prec+Lung,
                          AltzMenu+AltzMenu-2) Or (NewMenu <> 0));
     End; { MouseInTitleMenu }


     Procedure ShiftDown;
     Begin { ShiftDown }
     With Menu^[i] Do
       While (((Opz[TempOpz] = 'END') Or (Opz[TempOpz] = 'NO')) And
              (TempOpz+1 < MenuOpz)) Do
                Inc(TempOpz);
     End; { ShiftDown }


     Procedure ShiftUp;
     Begin { ShiftUp }
     With Menu^[i] Do
       While (((Opz[TempOpz] = 'END') Or (Opz[TempOpz] = 'NO')) And
              (TempOpz-1 > 1)) Do
                Dec(TempOpz);
     End; { ShiftUp }


     Procedure CursorHome;
     Begin { CursorHome }
     TempOpz := 1;
     ShiftDown;
     End; { CursorHome }


     Procedure CursorEnd;
     Begin { CursorEnd }
     TempOpz := MenuOpz;
     ShiftUp;
     End; { CursorEnd }


     Procedure CursorUp;
     Begin { CursorUp }
     SaveOpz := TempOpz;
     With Menu^[i] Do
       Begin
       If (TempOpz In [2..MenuOpz])
         Then
           Begin
           Dec(TempOpz);
           ShiftDown;
           End
       Else
         If (TempOpz > MenuOpz)
           Then
             Begin
             TempOpz := 1;
             ShiftUp;
             End;
       If ((Opz[TempOpz] = 'END') Or
           (Opz[TempOpz] = 'NO'))
             Then
               TempOpz := SaveOpz;
       End;
     End; { CursorUp }


     Procedure CursorDown;
     Begin { CursorDown }
     SaveOpz := TempOpz;
     With Menu^[i] Do
       Begin
       If (TempOpz < MenuOpz)
         Then
         Begin
         Inc(TempOpz);
         ShiftDown;
         End
       Else
         If (TempOpz > MenuOpz)
           Then
             Begin
             TempOpz := 1;
             ShiftDown;
             End;
       If ((Opz[TempOpz] = 'END') Or
           (Opz[TempOpz] = 'NO'))
             Then
               TempOpz := SaveOpz;
       End;
     End; { CursorDown }


     Procedure CursorRight;
     Begin { CursorRight }
     If (i < MenuTitle)
       Then
         Begin
         NewMenu := i+1;
         AltroMenu := True;
         End;
     End; { CursorRight }


     Procedure CursorLeft;
     Begin { CursorLeft }
     If (i > 1)
       Then
         Begin
         NewMenu := i-1;
         AltroMenu := True;
         End;
     End; { CursorLeft }


     Function  TastiValidi: Boolean;
     Begin { TastiValidi }
     TastiValidi := (LeftButton Or ((Char1 = kReturn) Or ((Char1 = kNull) And
                    (Char2 In [kUp,kDown,kHome,kEnd,kF10,kAF,kAS,kAT,kAB,kAC,
                               kAH]))));
     End; { TastiValidi }


     Procedure ControllaMenu;
     Begin { ControllaMenu }
     If (Tastiera And (Char1 = kNull) And
        (Char2 In [kF10,kAF,kAS,kAT,kAB,kAC,kAH]))
          Then
            Begin
            Case Char2 Of
              kF10: If (OldMenu <> 0)
                      Then
                        NewMenu := OldMenu
                    Else
                      NewMenu := 1;
              kAF:  NewMenu := 1;
              kAS:  NewMenu := 2;
              kAT:  NewMenu := 3;
              kAB:  NewMenu := 4;
              kAC:  NewMenu := 5;
              kAH:  NewMenu := 6;
              End; { Case Char2 }

            If (NewMenu <> i)
              Then
                AltroMenu := True;
            End;

     If (NewMenu = 0)
       Then
         Begin
         OldMouseX := MouseX;
         OldMouseY := MouseY;

         NewPrec := StepTitle-1;

         NewMenu := 0;
         a := 1;
         Repeat

           With Menu^[a] Do
             Begin
             NewLung := TW*Length(Title);
             If (MouseInG(NewPrec+1,AltzMenu+2,NewPrec+NewLung,
                          AltzMenu+AltzMenu-2) And (i <> a))
                            Then
                              AltroMenu := True;
             Inc(NewPrec,NewLung+StepTitle);
             Inc(a);
             End;

         Until (AltroMenu Or (a > MenuTitle));
         End;
     End; { ControllaMenu }


     Procedure AggiornaEvidenziatore;
     Begin { AggiornaEvidenziatore }
     With Menu^[i] Do
       Begin
       If (((MouseX >= InizioX) And (MouseY >= InizioY+StepOpz) And
            (MouseX <= FineX)   And (MouseY <= FineY-StepOpz)) Or
           (Char1 = kReturn))
             Then
               Begin
               If (Not Tastiera)
                 Then
                   TempOpz := (MouseY-InizioY-StepOpz) Div TH+1;
               If ((TempOpz = OldOpz) And (TempOpz In [1..MenuOpz]) And
                   (Opz[TempOpz] <> 'NO') And (Opz[TempOpz] <> 'END') And
                   (Rilasciato Or (Char1 = kReturn)))
                           Then
                             Begin
                             OptionSelected := True;
                             ProcMenu := i;
                             ProcOpz := TempOpz;
                             End
               Else
                 OptionSelected := False;
               End;

       If (TempOpz <> OldOpz)
         Then
           Begin
           WaitToWrite;
           HideMouse;
           If (OldOpz In [1..MenuOpz])
             Then
               If ((Opz[OldOpz] <> 'NO') And (Opz[OldOpz] <> 'END'))
                 Then
                   Begin
                   SetFillStyle(SolidFill,cBkMenuWinSel);
                   SetColor(cMenuTitleSel);
                   HideMouse;
                   Bar(InizioX+1,(OldOpz-1)*TH+InizioY+StepOpz,FineX-1,
                       OldOpz*TH+InizioY+StepOpz-1);
                   OutTextXY(InizioX,(OldOpz-1)*TH+InizioY+StepOpz+TH Div 2,
                             Opz[OldOpz]);
                   ShowMouse;
                   End;
           If (TempOpz In [1..MenuOpz])
             Then
               If ((Opz[TempOpz] <> 'NO') And
                   (Opz[TempOpz] <> 'END'))
                     Then
                       Begin
                       SetFillStyle(SolidFill,cBkOpzSel);
                       SetColor(cOpzSel);
                       HideMouse;
                       Bar(InizioX+1,(TempOpz-1)*TH+InizioY+StepOpz,FineX-1,
                           TempOpz*TH+InizioY+StepOpz-1);
                       OutTextXY(InizioX,
                                 (TempOpz-1)*TH+InizioY+StepOpz+TH Div 2,
                                 Opz[TempOpz]);
                       ShowMouse;
                       End;
           ShowMouse;
           End;
       End;
     End; { AggiornaEvidenziatore }


Begin { SelectMenu }

Prec := StepTitle-1;
i := 1;
Repeat

  ProcMenu := 0;
  ProcOpz := 0;
  AltroMenu := False;
  OptionSelected := False;
  SetTextStyle(MenuFont,HorizDir,MenuSize);
  SetTextJustify(CenterText,CenterText);
  TH := TextHeight('X');
  TW := TextWidth('X');
  WaitToWrite;
  SetFillStyle(SolidFill,cBkMenuTitleSel);
  SetColor(cMenuTitleSel);

  Repeat
    If (NewMenu <> 0)
      Then
        Begin
        Prec := StepTitle-1;
        i := 1;
        While (i <> NewMenu) Do
          Begin
          Lung := TW*Length(Menu^[i].Title);
          Inc(Prec,Lung+StepTitle);
          Inc(i);
          End;
        i := NewMenu;
        End;
    With Menu^[i] Do
      Begin
      Lung := TW*Length(Title);
      If MouseInTitleMenu
        Then
          Begin
          NewMenu := 0;
          HideMouse;
          SetTextStyle(MenuFont,HorizDir,MenuSize);
          SetTextJustify(CenterText,CenterText);
          Bar(Prec+4,AltzMenu+5,Prec+Lung-4,AltzMenu+AltzMenu-5);
          Rectangle(Prec+3,AltzMenu+4,Prec+Lung-2,AltzMenu+AltzMenu-4);
          OutTextXY(Prec+(Lung Div 2),AltzMenu+(AltzMenu Div 2)+1,Title);
          ShowMouse;

          NumOpzMenu := 0;
          MaxLength := 1;
          For j := 1 To MenuOpz Do
            With Menu^[i] Do
              If (Opz[j] <> 'END')
                Then
                  Begin
                  Inc(NumOpzMenu);
                  If (Length(Opz[j]) > MaxLength)
                    Then
                      MaxLength := Length(Opz[j]);
                  End;

          LungFin := TW*MaxLength;

          If ((Prec+LungFin+Shadow) >= GetMaxX)
            Then
              Begin
              FineX := Prec+Lung;
              InizioX := FineX-LungFin-1-Shadow;
              End
          Else
            Begin
            InizioX := Prec;
            FineX := Prec+LungFin;
            End;

          InizioY := AltzMenu*2+StepOpz;
          FineY := InizioY+TH*NumOpzMenu+StepOpz*2;

          Size := ImageSize(InizioX,InizioY,FineX+Shadow,FineY+Shadow);
          If ((MemAvail > Size) And (Size > 0))
            Then
              Begin
              GetMem(Fin,Size);
              HideMouse;
              GetImage(InizioX,InizioY,FineX+Shadow,FineY+Shadow,Fin^);

              SetFillPattern(MyFill,cShadowMenuWinSel);
              SetFillStyle(UserFill,cShadowMenuWinSel);
              Bar(InizioX+1+Shadow,InizioY+1+Shadow,FineX-1+Shadow,FineY-1+Shadow);
              SetFillStyle(SolidFill,cBkMenuWinSel);
              SetTextJustify(LeftText,CenterText);
              Bar(InizioX+1,InizioY+1,FineX-1,FineY-1);
              Rectangle(InizioX,InizioY,FineX,FineY);
              TempOpz := InizioY+StepOpz;
              TH := TH;
              For j := 1 To MenuOpz Do
                With Menu^[i] Do
                  If (Opz[j] <> 'END')
                    Then
                      Begin
                      If (Opz[j] <> 'NO')
                        Then
                          OutTextXY(InizioX,TempOpz+TH Div 2,Opz[j]);
                      Inc(TempOpz,TH);
                      End;

              ShowMouse;
              OldMouseY := -1;
              OldMouseX := -1;
              OldOpz := MenuOpz+1;
              TempOpz := MenuOpz+2;

              Repeat
                ShowMouse;

                GetMPos;
                If (Not MousePressed)
                  Then
                    Rilasciato := True
                Else
                  Rilasciato := False;

                Repeat
                  GetMPos;
                  ControllaTastiera;
                Until MousePressed Or Tastiera;

                With Menu^[i] Do
                  Case Char1 Of
                    kNull: Case Char2 Of
                             kHome:  CursorHome;
                             kEnd:   CursorEnd;
                             kUp:    CursorUp;
                             kDown:  CursorDown;
                             kRight: CursorRight;
                             kLeft:  CursorLeft;
                             End; { Case Char2 }
                    End; { Case Char1 }

                If TastiValidi
                  Then

                    Begin

                    AltroMenu := False;
                    OptionSelected := False;

                    ControllaMenu;

                    If (Not AltroMenu)
                      Then
                        AggiornaEvidenziatore;

                    OldOpz := TempOpz;
                    If (Not (TempOpz In [1..MenuOpz]))
                      Then
                        Begin
                        OldOpz := MenuOpz+1;
                        TempOpz := MenuOpz+2;
                        End;
                    End;
              Until (RightButton Or OptionSelected Or AltroMenu Or
                    (Char1 = kEscape));

              HideMouse;
              PutImage(InizioX,InizioY,Fin^,NormalPut);
              ShowMouse;
              FreeMem(Fin,Size);
              End;
          End;
      Inc(Prec,Lung+StepTitle);
      Inc(i);
      End;
  Until (AltroMenu Or (i > MenuTitle) Or OptionSelected Or RightButton Or
        (Char1 = kEscape));

  If (AltroMenu Or RightButton Or (Char1 = kEscape))
    Then
      Begin
      Prec := StepTitle-1;
      DrawMenu(i-1);
      i := 1;
      End;

  If (OptionSelected And ((Char1 = kNull) And
     (Char2 In [kUp,kDown,kLeft,kRight,kPgUp,kPgDown,kHome,kEnd])))
       Then
         OptionSelected := False;

Until ((Not AltroMenu) Or RightButton Or (Char1 = kEscape));

ShowMouse;
DrawMenu(i-1);
If (Not ((Char1 = kEscape) Or RightButton))
  Then
    OldMenu := ProcMenu;

If (Tastiera And (Char1 = kReturn))
  Then
    Risultato := True;

End; { SelectMenu }


Function  MouseInMenuBar: Boolean;
Var KeyOk: Boolean;
Begin { MouseInMenuBar }

If (Tastiera And (Char1 = kNull) And
   (Char2 In [kF10,kAF,kAS,kAT,kAB,kAC,kAH]))
     Then
       Begin
       KeyOk := True;
       Case Char2 Of
         kF10: If (OldMenu <> 0)
                 Then
                   NewMenu := OldMenu
               Else
                 NewMenu := 1;
         kAF:  NewMenu := 1;
         kAS:  NewMenu := 2;
         kAT:  NewMenu := 3;
         kAB:  NewMenu := 4;
         kAC:  NewMenu := 5;
         kAH:  NewMenu := 6;
         End; { Case Char2 }

       End
Else
  KeyOk := False;
MouseInMenuBar := ((MouseInG(0,AltzMenu,GetMaxX,AltzMenu+AltzMenu) And
                   LeftButton) Or KeyOk Or ((TastieraX >= 0) And
                   (TastieraX <= GetMaxX) And (TastieraY >= AltzMenu) And
                   (TastieraY <= AltzMenu+AltzMenu) And
                   (Char1 In [kSpazio,kReturn,kEscape])));
OptionSelected := False;
Risultato := False;
CambioMouse := False;

End; { MouseInMenuBar }


End. { GIPMenu }
