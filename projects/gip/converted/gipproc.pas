Unit GIPProc;

Interface { GIPProc }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit,GIPGraph,GIPAppPrc,
     GIPBase,GIPImage,GIPShape,GIPFile, GipConv,GIPHelp;


(*Procedure pZoomPiu;
Procedure pZoomNorm;
Procedure pZoomMeno;*)
Procedure pBlockMemorizza;
Procedure pBlockRichiama;
Procedure pBlockSposta;
Procedure pBlockCopia;
Procedure pDiscoLeggi;
Procedure pDiscoSalva;
Procedure pDiscoPaletteLeggi;
Procedure pDiscoPaletteSalva;
Procedure pDiscoNuovo;
Procedure pDiscoEsci;
Procedure pConvTurboC;
Procedure pConvTurboPascal;
Procedure pConvTurboAsm;
Procedure pUserDefinedFill;
Procedure pUserDefinedLn;
Procedure pSceltaOggetti;
Procedure pHelpOnLine;
Procedure pDiscoStampa;
Procedure pNewPalette;
Procedure pHelpPrecedente;
Procedure pHelpIndice;
Procedure pHelpGIP;
Procedure pClock;
Procedure pSfondoImmagine;
Procedure pMovPrimo;
Procedure pMovPrec;
Procedure pMovSucc;
Procedure pMovUltimo;
Procedure pMovDelete;


Implementation { GIPProc }



(*Procedure pZoomPiu;
Begin { pZoomPiu }
End; { pZoomPiu }


Procedure pZoomNorm;
Begin { pZoomNorm }
End; { pZoomNorm }


Procedure pZoomMeno;
Begin { pZoomMeno }
End; { pZoomMeno }*)


Procedure pBlockMemorizza;
Begin { pBlockMemorizza }
End; { pBlockMemorizza }


Procedure pBlockRichiama;
Begin { pBlockRichiama }
End; { pBlockRichiama }


Procedure pBlockSposta;
Begin { pBlockSposta }
End; { pBlockSposta }


Procedure pBlockCopia;
Begin { pBlockCopia }
End; { pBlockCopia }


Procedure pDiscoLeggi;
Var Name: String080;
Begin { pDiscoLeggi }
Name := '';
InputFile('LEGGI FILE',Name,'GIP',fLeggiFile,GIP);
ReadFile(Name);
Stato := sAttesa;
End; { pDiscoLeggi }


Procedure pDiscoSalva;
Var Name: String080;
Begin { pDiscoSalva }
Name := '';
InputFile('SALVA FILE',Name,'GIP',fLeggiFile,GIP);
WriteFile(Name);
Stato := sAttesa;
End; { pDiscoSalva }


Procedure pDiscoNuovo;
Begin { pDiscoNuovo }
If ConsensoNuovo
  Then
    Begin
    DistruggiImmagine;
    CreaImmagine;
    DefineOriginalSize;
    DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);
    AggiornaLineBar(Orizzontale);
    AggiornaLineBar(Verticale);
    End;
End; { pDiscoNuovo }


Procedure pDiscoEsci;
Begin { pDiscoEsci }
If ((Tastiera And (Char1 = kReturn)) Or MouseOk)
     Then
       If Warning('Sei sicuro di voler uscire','da G.I.P. ?',2)
         Then
           Begin
           Risultato := True;
           UscitaProgramma := True;
           End;
Stato := sAttesa;
End; { pDiscoEsci }


Procedure pDiscoPaletteLeggi;
Var Name: String080;

Begin { pDiscoPaletteLeggi }
Name := '';
InputFile('LEGGI PALETTE DEI COLORI',Name,'PAL',fLeggiFile,PAL);
ReadPalette(Name);
Stato := sAttesa;
End; { pDiscoPaletteLeggi }


Procedure pDiscoPaletteSalva;
Var Name: String080;
Begin { pDiscoPaletteSalva }
Name := '';
InputFile('SALVA PALETTE DEI COLORI',Name,'PAL',fLeggiFile,PAL);
WritePalette(Name);
Stato := sAttesa;
End; { pDiscoPaletteSalva }


Procedure pConvTurboC;
Begin { pConvTurboC }
ConvertiFile(lTurboC);
End; { pConvTurboC }


Procedure pConvTurboPascal;
Begin { pConvTurboPascal }
ConvertiFile(lTurboPascal);
End; { pConvTurboPascal }


Procedure pConvTurboAsm;
Begin { pConvTurboAsm }
ConvertiFile(lTurboAsm);
End; { pConvTurboAsm }


Procedure pUserDefinedFill;
Var WinPunt: Pointer;
    WinSize: Word;
    WinBX:   Integer;
    WinBY:   Integer;
    WinEX:   Integer;
    WinEY:   Integer;
    Memoria: Boolean;
    EsciWin: Boolean;
    C:       Char;
    C2:      Char;
    Vet:     Array [1..7] Of
               Record
               X1,Y1,X2,Y2: Integer;
               Campo: String[15];
               End;
    I:       Integer;
    MyRetino: FillPatternType;
    X,Y,OldX,OldY:     Byte;
    Bina: Array [1..8] Of String[8];
    Otta: Array [1..8] Of String[3];
    Deci: Array [1..8] Of String[3];
    Esad: Array [1..8] Of String[3];
    OldBin: Char;
    Nome: Boolean;
    Retino,OldRetino:  Byte;
    OldNome: Boolean;
    Cambio: Boolean;


     Procedure WriteCur ( X, Y: Byte; c: Byte );
     Begin
     SetTextJustify(CenterText,TopText);
     WaitToWrite;
     HideMouse;
     With Vet[1] Do
       Begin
       SetColor(cBkSmallDialog);
       OutTextXY(X1+TW*X+4,Y1+TH*(2+Y)+1,'■');
       SetColor(C);
       OutTextXY(X1+TW*X+4,Y1+TH*(2+Y)+1,Bina[Y,X]);
       End;
     ShowMouse;
     End;


     Procedure WriteFill;
     Var I: Byte;
     Begin { WriteFill }
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextJustify(CenterText,TopText);
     With Vet[1] Do
       Begin
       Bar(X1+1,Y1+TH*2+1,X2-1,Y2-1);
       SetColor(cEditColor);
       For i := 1 To 8 Do
         OutTextXY((X1+X2) Div 2,Y1+TH*(2+i)+1,Bina[i]);
       End;
     WriteCur(X,Y,cUserSel);
     End; { WriteFill }


     Procedure WriteView;
     Var I,J,Pot: Byte;
     Begin { WriteView }
     WaitToWrite;
     HideMouse;
     SetColor(cEditColor);
     For i := 1 To 8 Do
       Begin
       MyRetino[i] := 0;
       Pot := 1;
       For j := 8 DownTo 1 Do
         Begin
         If (Bina[i,j] = '■')
           Then
             Inc(MyRetino[i],Pot);
         Inc(Pot,Pot);
         End;
       End;
     With Vet[2] Do
       Begin
       SetFillPattern(MyRetino,Setup.BackColor);
       SetFillStyle(UserFill,Setup.BackColor);
       Bar(X1+1,Y1+TH*2+1,X2-1,Y2-1);
       End;
     ShowMouse;
     End; { WriteView }


     Procedure WriteConv;
     Const VetLett: Array [0..15] Of Char= ('0','1','2','3','4','5','6','7',
                                            '8','9','A','B','C','D','E','F');
     Var App: Array [1..8] Of String[8];
         I,J: Byte;

     Begin { WriteConv }
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextJustify(CenterText,TopText);
     WaitToWrite;
     HideMouse;
     With Vet[3] Do
       Begin
       Bar(X1+1,Y1+TH*2+1,X2-1,Y2-1);
       For i := 1 To 8 Do
         Begin
         App[i] := Bina[i];
         For j := 1 To 8 Do
           If (App[i,j] = '■')
             Then
               App[i,j] := '1'
           Else
             App[i,j] := '0';
         End;
       For i := 1 To 8 Do
         OutTextXY((X1+X2) Div 2,Y1+TH*(2+i)+1,VetLett[i]+'° '+App[i]);
       ShowMouse;
       End;

     WaitToWrite;
     HideMouse;
     With Vet[4] Do
       Begin
       Bar(X1+1,Y1+TH*2+1,X2-1,Y2-1);
       For i := 1 To 8 Do
         Begin
         Otta[i] := '   ';
         Otta[i,1] := VetLett[MyRetino[i] Div 64];
         Otta[i,2] := VetLett[(MyRetino[i] Mod 64) Div 8];
         Otta[i,3] := VetLett[(MyRetino[i] Mod 64) Mod 8];
         If (Otta[i,1] = ' ') Then Otta[i,1] := '0';
         If (Otta[i,2] = ' ') Then Otta[i,2] := '0';
         OutTextXY((X1+X2) Div 2,Y1+TH*(2+i)+1,VetLett[i]+'° '+Otta[i]);
         End;
       End;
     ShowMouse;

     WaitToWrite;
     HideMouse;
     With Vet[5] Do
       Begin
       Bar(X1+1,Y1+TH*2+1,X2-1,Y2-1);
       For i := 1 To 8 Do
         Begin
         Deci[i] := '   ';
         Str(MyRetino[i]:3,Deci[i]);
         If (Deci[i,1] = ' ') Then Deci[i,1] := '0';
         If (Deci[i,2] = ' ') Then Deci[i,2] := '0';
         OutTextXY((X1+X2) Div 2,Y1+TH*(2+i)+1,VetLett[i]+'° '+Deci[i]);
         End;
       End;
     ShowMouse;

     WaitToWrite;
     HideMouse;
     With Vet[6] Do
       Begin
       Bar(X1+1,Y1+TH*2+1,X2-1,Y2-1);
       For i := 1 To 8 Do
         Begin
         Esad[i] := '$  ';
         Esad[i,2] := VetLett[MyRetino[i] Div 16];
         Esad[i,3] := VetLett[MyRetino[i] Mod 16];
         If (Esad[i,2] = ' ') Then Esad[i,2] := '0';
         OutTextXY((X1+X2) Div 2,Y1+TH*(2+i)+1,VetLett[i]+'° '+Esad[i]);
         End;
       End;
     ShowMouse;

     End; { WriteConv }


     Procedure WriteNome ( Evid: Boolean );
     Var Col1,Col2: Byte;
     Begin { WriteNome }
     SetTextJustify(LeftText,CenterText);
     If Evid
       Then
         Begin
         Col1 := cBkEditColorSel;
         Col2 := cEditColorSel;
         End
     Else
       Begin
       Col1 := cBkEditColor;
       Col2 := cEditColor;
       End;
     SetFillStyle(SolidFill,Col1);
     SetColor(Col2);
     WaitToWrite;
     HideMouse;
     With Vet[7] Do
       Begin
       Bar(X1+TH*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       OutTextXY(X1+TH*(Length(Campo)+3)+1,Y1+TH+1,VetFil[Retino]);
       End;
     ShowMouse;
     End; { WriteNome }

     Procedure InitFill;
     Var I,J,Pot: Byte;
     Begin { InitFill }
     For i := 1 To 8 Do
       Begin
       Bina[i] := '········';
       Pot := 1;
       For j := 8 DownTo 1 Do
         Begin
         If ((MyRetino[i] And Pot) > 0)
           Then
             Bina[i,j] := '■'
         Else
           Bina[i,j] := '·';
         Inc(Pot,Pot);
         End;
       End;
     End; { InitFill }


Begin { pUserDefinedFill }

WinBX := GetMaxX Div 2-153;
WinBY := GetMaxY Div 2-185;
WinEX := GetMaxX Div 2+150;
WinEY := GetMaxY Div 2+165;

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

SetFillPattern(MyFill,cBkDialog);
SetFillStyle(UserFill,cBkDialog);
Bar(WinBX+Shadow,WinBY+Shadow,WinEX+Shadow,WinEY+Shadow);
SetFillStyle(SolidFill,cBkDialog);
Bar(WinBX,WinBY,WinEX,WinEY);
SetColor(cDialogBord);
Rectangle(WinBX,WinBY,WinEX,WinEY);
WriteWin('Retino ''User-Defined''',WinBX,WinBY,WinEX,WinEY,cBkDialog,cBkDialogTitle,cDialogTitle);
SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);

With Vet[1] Do
  Begin
  X1 := TW*2;
  Y1 := TH*4;
  X2 := TW*12;
  Y2 := TH*16;
  Campo := 'Retino';
  End;

With Vet[2] Do
  Begin
  X1 := TW*14;
  Y1 := TH*7;
  X2 := TW*36;
  Y2 := TH*16;
  Campo := 'Visualizzazione';
  End;

With Vet[3] Do
  Begin
  X1 := TW*2;
  Y1 := TH*17;
  X2 := TW*18;
  Y2 := TH*29;
  Campo := 'Binario';
  End;

With Vet[4] Do
  Begin
  X1 := TW*20;
  Y1 := TH*17;
  X2 := TW*36;
  Y2 := TH*29;
  Campo := 'Ottale';
  End;

With Vet[5] Do
  Begin
  X1 := TW*2;
  Y1 := TH*30;
  X2 := TW*13;
  Y2 := TH*42;
  Campo := 'Decimale';
  End;

With Vet[6] Do
  Begin
  X1 := TW*15;
  Y1 := TH*30;
  X2 := TW*29;
  Y2 := TH*42;
  Campo := 'Esadecimale';
  End;

With Vet[7] Do
  Begin
  X1 := TW*14;
  Y1 := TH*4;
  X2 := TW*36;
  Y2 := TH*6;
  Campo := 'Nome';
  End;

Icone^[IcnOk].X := TW*31;
Icone^[IcnOk].Y := TH*34;
Icone^[IcnEsci].X := Icone^[IcnOk].X;
Icone^[IcnEsci].Y := TH*38;

With Icone^[IcnOk] Do
  PutImage(x,y,Icn^,NormalPut);
With Icone^[IcnEsci] Do
  PutImage(x,y,Icn^,NormalPut);

For i := 1 To 6 Do
  With Vet[i] Do
    WriteWin(Campo,X1,Y1,X2,Y2,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
With Vet[7] Do
  WriteLine(Campo,X1,Y1,X2,Y2,cBkSmallDialog,cBkSmallTitle,cSmallTitle);

EsciWin := False;
Nome := False;
Retino := UserFill;
MyRetino := Setup.UserPattern;
X := 1;
OldX := 1;
Y := 1;
OldY := 1;
InitFill;
WriteFill;
WriteView;
WriteConv;
WriteNome(Nome);
Repeat

  Cambio := False;
  If (X <> OldX) Or (Y <> OldY) And (Not Nome)
    Then
      Begin
      If (OldX <> 0) And (OldY <> 0)
        Then
          WriteCur(OldX,OldY,cEditColor);
      WriteCur(X,Y,cUserSel);
      End;

  ShowMouse;
  ClearKeyBuf;
  Repeat
    GetMPos;
  Until MousePressed Or KeyPressed;

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

  OldX := X;
  OldY := Y;
  OldBin := Bina[Y,X];
  OldRetino := Retino;
  OldNome := Nome;

  If LeftButton
    Then
      Begin
      With Vet[1] Do
        If MouseInG(X1+WinBX,Y1+WinBY,X2+WinBX,Y2+WinBY)
          Then
            Begin
            Nome := False;
            X := (MouseX-X1-WinBX-TW) Div TW+1;
            If (X > 8)
              Then
                X := 8
            Else
              If (X < 1)
                Then
                  X := 1;
            Y := (MouseY-Y1-WinBY-TH*3) Div TH+1;
            If (Y > 8)
              Then
                Y := 8
            Else
              If (Y < 1)
                Then
                  Y := 1;
            C := kSpazio;
            End
      Else
        With Vet[7] Do
          If MouseInG(X1+WinBX,Y1+WinBY,X2+WinBX,Y2+WinBY)
            Then
              Nome := True
      Else
        With Icone^[IcnOk] Do
          If MouseInG(x+WinBX,y+WinBY,x+39+WinBX,y+14+WinBY)
            Then
              Begin
              SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
              If PremiPulsante(x+WinBX,y+WinBY,Icn,LeggiFile,IcnOk,SiAttesa,cBkDialog)
                Then
                  C := kReturn;
              SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
              End
      Else
        With Icone^[IcnEsci] Do
          If MouseInG(x+WinBX,y+WinBY,x+39+WinBX,y+14+WinBY)
            Then
              Begin
              SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
              If PremiPulsante(x+WinBX,y+WinBY,Icn,LeggiFile,IcnOk,SiAttesa,cBkDialog)
                Then
                  C := kEscape;
              SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
              End;
      End
  Else
    If RightButton
      Then
        C := kEscape;

  Case C Of
    kNull: Case C2 Of
             kLeft: If Nome
                      Then
                        Begin
                        If (Retino > 0)
                          Then
                            Dec(Retino);
                        End
                     Else
                       If X > 1 Then Dec(X);
             kRight: If Nome
                       Then
                         Begin
                         If (Retino < UserFill)
                           Then
                             Inc(Retino);
                         End
                     Else
                       If (X < 8) Then Inc(X);
             kUp: If (Y > 1) And (Not Nome)
                    Then
                      Dec(Y);
             kDown: If (Y < 8)  And (Not Nome)
                      Then
                        Inc(Y);
             kHome: If (Not Nome) Then X := 1;
             kEnd: If (Not Nome) Then X := 8;
             kPgUp: If (Not Nome) Then Y := 1;
             kPgDown: If (Not Nome) Then Y := 8;
             End;
    kReturn: Begin
             EsciWin := True;
             Setup.Pattern := UserFill;
             Setup.UserPattern := MyRetino;
             With Setup Do
               InserisciFigura(fUserFill,UserPattern[1],UserPattern[2],
                               UserPattern[3],UserPattern[4],UserPattern[5],
                               UserPattern[6],UserPattern[7],UserPattern[8],
                               NUW,NUW,NUW,NUW);
             End;
    kEscape: Begin
             EsciWin := True;
             End;
    kSpazio: Begin
             If (Bina[Y,X] = '■')
               Then
                 Bina[Y,X] := '·'
             Else
               Bina[Y,X] := '■';
             ReleaseMouse;
             Cambio := True;
             End;
    kTab: Nome := Not Nome;
    End;

  If (Nome <> OldNome)
    Then
      Begin
      WriteNome(Nome);
      If Nome
        Then
          WriteCur(X,Y,cEditColor)
      Else
        WriteCur(X,Y,cUserSel);
      End;

  If ((Bina[Y,X] <> OldBin) And (X = OldX) And (Y = OldY)) Or
     (Retino <> OldRetino) Or Cambio
       Then
         Begin
         If (Retino <> OldRetino)
           Then
             Begin
             WriteNome(Nome);
             If (Retino = UserFill)
               Then
                 Begin
                 SetFillPattern(MyRetino,Setup.BackColor);
                 SetFillStyle(UserFill,Setup.BackColor);
                 GetFillPattern(MyRetino);
                 End
             Else
               MyRetino := VetPat[Retino];
             InitFill;
             End;
         WriteFill;
         WriteView;
         WriteConv;
         End;

Until EsciWin;

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

SetGHorRange(0,GetMaxX);
SetGVertRange(0,GetMaxY);
SetFillPattern(VetPat[SolidFill],Setup.BackColor);
SetFillStyle(SolidFill,Setup.BackColor);
Stato := sAttesa;
End; { pUserDefinedFill }


Procedure pUserDefinedLn;
Var WinPunt: Pointer;
    WinSize: Word;
    WinBX:   Integer;
    WinBY:   Integer;
    WinEX:   Integer;
    WinEY:   Integer;
    Memoria: Boolean;
    EsciWin: Boolean;
    C:       Char;
    C2:      Char;
    Vet:     Array [1..7] Of
               Record
               X1,Y1,X2,Y2: Integer;
               Campo: String[15];
               End;
    I:       Integer;
    MyLine:  Word;
    X,OldX:  Byte;
    Bina: String[16];
    Otta: String[6];
    Deci: String[5];
    Esad: String[5];
    OldBin: Char;
    Nome: Boolean;
    Linea,OldLinea:  Byte;
    OldNome: Boolean;
    Cambio: Boolean;
    LineInfo: LineSettingsType;


     Procedure WriteCur ( X: Byte; C: Byte );
     Begin
     SetTextJustify(LeftText,CenterText);
     WaitToWrite;
     HideMouse;
     With Vet[1] Do
       Begin
       SetColor(cBkSmallDialog);
       OutTextXY(X1+TW*(Length(Campo)+2+X)+1,Y1+TH+1,'█');
       SetColor(C);
       OutTextXY(X1+TW*(Length(Campo)+2+X)+1,Y1+TH+1,Bina[X]);
       End;
     ShowMouse;
     End;


     Procedure WriteBitLn;
     Var I: Byte;
     Begin { WriteBitLn }
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetLineStyle(Linea,MyLine,Setup.Thickness);
     SetTextJustify(LeftText,CenterText);
     With Vet[1] Do
       Begin
       Bar(X1+TW*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       SetColor(cEditColor);
       OutTextXY(X1+TW*(Length(Campo)+3)+1,Y1+TH+1,Bina);
       End;
     WriteCur(X,cUserSel);
     End; { WriteBitLn }


     Procedure WriteView;
     Var I,J: Byte;
         Pot: Word;
     Begin { WriteView }
     WaitToWrite;
     HideMouse;
     SetColor(cEditColor);
     MyLine := 0;
     Pot := 1;
     For j := 16 DownTo 1 Do
       Begin
       If (Bina[j] = '■')
         Then
           Inc(MyLine,Pot);
       Inc(Pot,Pot);
       End;
     With Vet[2] Do
       Begin
       SetFillStyle(SolidFill,cBkSmallDialog);
       Bar(X1+TW*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       SetLineStyle(Linea,MyLine,Setup.Thickness);
       Line(X1+TW*(Length(Campo)+2)+1,Y1+TH+1,X2-1,Y1+TH+1);
       End;
     ShowMouse;
     End; { WriteView }


     Procedure WriteConv;
     Const VetLett: Array [0..15] Of Char= ('0','1','2','3','4','5','6','7',
                                            '8','9','A','B','C','D','E','F');
     Var App: String[16];
         I: Byte;
         Num: Word;

     Begin { WriteConv }
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextJustify(LeftText,CenterText);
     WaitToWrite;
     HideMouse;
     With Vet[3] Do
       Begin
       Bar(X1+TW*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       Num := MyLine;
       App := '                ';
       For i := 1 To 16 Do
         Begin
         App[17-i] := VetLett[Num Mod 2];
         Num := Num Div 2;
         End;
       OutTextXY(X1+TW*(Length(Campo)+3)+1,Y1+TH+1,App);
       ShowMouse;
       End;

     Num := MyLine;
     With Vet[4] Do
       Begin
       { Conversione ottale }
       Otta := '      ';
       For i := 1 To 6 Do
         Begin
         Otta[7-i] := VetLett[Num Mod 8];
         Num := Num Div 8;
         End;
       WaitToWrite;
       HideMouse;
       Bar(X1+TW*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       OutTextXY(X1+TW*(Length(Campo)+3),Y1+TH+1,Otta);
       End;
     ShowMouse;

     WaitToWrite;
     HideMouse;
     With Vet[5] Do
       Begin
       Bar(X1+TW*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       Num := MyLine;
       Deci := '     ';
       For i := 1 To 5 Do
         Begin
         Deci[6-i] := VetLett[Num Mod 10];
         Num := Num Div 10;
         End;
       OutTextXY(X1+TW*(Length(Campo)+3),Y1+TH+1,Deci);
       End;
     ShowMouse;

     WaitToWrite;
     HideMouse;
     With Vet[6] Do
       Begin
       Bar(X1+TW*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       Num := MyLine;
       Esad := '$    ';
       For i := 1 To 4 Do
         Begin
         Esad[6-i] := VetLett[Num Mod 16];
         Num := Num Div 16;
         End;
       OutTextXY(X1+TW*(Length(Campo)+3),Y1+TH+1,Esad);
       End;
     ShowMouse;

     End; { WriteConv }


     Procedure WriteNome ( Evid: Boolean );
     Var Col1,Col2: Byte;
     Begin { WriteNome }
     SetTextJustify(LeftText,CenterText);
     If Evid
       Then
         Begin
         Col1 := cBkEditColorSel;
         Col2 := cEditColorSel;
         End
     Else
       Begin
       Col1 := cBkEditColor;
       Col2 := cEditColor;
       End;
     SetFillStyle(SolidFill,Col1);
     SetColor(Col2);
     WaitToWrite;
     HideMouse;
     With Vet[7] Do
       Begin
       Bar(X1+TH*(Length(Campo)+2)+1,Y1+1,X2-1,Y2-1);
       OutTextXY(X1+TH*(Length(Campo)+3)+1,Y1+TH+1,VetLin[Linea]);
       End;
     ShowMouse;
     End; { WriteNome }


     Procedure InitLn;
     Var I:   Byte;
         Pot: Word;
     Begin { InitLn }
     Bina := '················';
     Pot := 1;
     For i := 16 DownTo 1 Do
       Begin
       If ((MyLine And Pot) > 0)
         Then
           Bina[i] := '■'
       Else
         Bina[i] := '·';
       Inc(Pot,Pot);
       End;
     End; { InitLn }


Begin { pUserDefinedLn }

WinBX := GetMaxX Div 2-156;
WinBY := GetMaxY Div 2-155;
WinEX := GetMaxX Div 2+157;
WinEY := GetMaxY Div 2+135;

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

SetFillPattern(MyFill,cBkDialog);
SetFillStyle(UserFill,cBkDialog);
Bar(WinBX+Shadow,WinBY+Shadow,WinEX+Shadow,WinEY+Shadow);
SetFillStyle(SolidFill,cBkDialog);
Bar(WinBX,WinBY,WinEX,WinEY);
SetColor(cDialogBord);
Rectangle(WinBX,WinBY,WinEX,WinEY);
WriteWin('Linea ''User-Defined''',WinBX,WinBY,WinEX,WinEY,cBkDialog,cBkDialogTitle,cDialogTitle);
SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);

With Vet[1] Do
  Begin
  Y1 := TH*4;
  Y2 := TH*6;
  Campo := 'Linea          ';
  End;

With Vet[2] Do
  Begin
  Y1 := TH*12;
  Y2 := TH*14;
  Campo := 'Visualizzazione';
  End;

With Vet[3] Do
  Begin
  Y1 := TH*16;
  Y2 := TH*18;
  Campo := 'Binario        ';
  End;

With Vet[4] Do
  Begin
  Y1 := TH*20;
  Y2 := TH*22;
  Campo := 'Ottale         ';
  End;

With Vet[5] Do
  Begin
  Y1 := TH*24;
  Y2 := TH*26;
  Campo := 'Decimale       ';
  End;

With Vet[6] Do
  Begin
  Y1 := TH*28;
  Y2 := TH*30;
  Campo := 'Esadecimale    ';
  End;

With Vet[7] Do
  Begin
  Y1 := TH*8;
  Y2 := TH*10;
  Campo := 'Nome           ';
  End;

Icone^[IcnOk].X := TW*13;
Icone^[IcnOk].Y := TH*32;
Icone^[IcnEsci].X := Icone^[IcnOk].X+TW*7;
Icone^[IcnEsci].Y := Icone^[IcnOk].Y;

With Icone^[IcnOk] Do
  PutImage(x,y,Icn^,NormalPut);
With Icone^[IcnEsci] Do
  PutImage(x,y,Icn^,NormalPut);

For i := 1 To 7 Do
  With Vet[i] Do
    Begin
    X1 := TW*2;
    X2 := TW*37;
    WriteLine(Campo,X1,Y1,X2,Y2,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    End;

EsciWin := False;
Nome := False;
Linea := UserBitLn;
MyLine := Setup.PatternLine;
X := 1;
OldX := 1;
InitLn;
WriteBitLn;
WriteView;
WriteConv;
WriteNome(Nome);
Repeat

  Cambio := False;
  If (X <> OldX) And (Not Nome)
    Then
      Begin
      If (OldX <> 0)
        Then
          WriteCur(OldX,cEditColor);
      WriteCur(X,cUserSel);
      End;

  ShowMouse;
  ClearKeyBuf;
  Repeat
    GetMPos;
  Until MousePressed Or KeyPressed;

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

  OldX := X;
  OldBin := Bina[X];
  OldLinea := Linea;
  OldNome := Nome;

  If LeftButton
    Then
      Begin
      With Vet[1] Do
        If MouseInG(X1+WinBX,Y1+WinBY,X2+WinBX,Y2+WinBY)
          Then
            Begin
            Nome := False;
            X := (MouseX-X1-WinBX-TW*(Length(Campo)+3)) Div TW+1;
            If (X > 16)
              Then
                X := 16
            Else
              If (X < 1)
                Then
                  X := 1;
            C := kSpazio;
            End
      Else
        With Vet[7] Do
          If MouseInG(X1+WinBX,Y1+WinBY,X2+WinBX,Y2+WinBY)
            Then
              Nome := True
      Else
        With Icone^[IcnOk] Do
          If MouseInG(x+WinBX,y+WinBY,x+39+WinBX,y+14+WinBY)
            Then
              Begin
              SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
              If PremiPulsante(x+WinBX,y+WinBY,Icn,LeggiFile,IcnOk,SiAttesa,cBkDialog)
                Then
                  C := kReturn;
              SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
              End
      Else
        With Icone^[IcnEsci] Do
          If MouseInG(x+WinBX,y+WinBY,x+39+WinBX,y+14+WinBY)
            Then
              Begin
              SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
              If PremiPulsante(x+WinBX,y+WinBY,Icn,LeggiFile,IcnOk,SiAttesa,cBkDialog)
                Then
                  C := kEscape;
              SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
              End;
      End
  Else
    If RightButton
      Then
        C := kEscape;

  Case C Of
    kNull: Case C2 Of
             kLeft: If Nome
                      Then
                        Begin
                        If (Linea > 0)
                          Then
                            Dec(Linea);
                        End
                     Else
                       If X > 1 Then Dec(X);
             kRight: If Nome
                       Then
                         Begin
                         If (Linea < UserBitLn)
                           Then
                             Inc(Linea);
                         End
                     Else
                       If (X < 16) Then Inc(X);
             kUp: Nome := False;
             kDown: Nome := True;
             kHome: If (Not Nome) Then X := 1;
             kEnd: If (Not Nome) Then X := 16;
             End;
    kReturn: Begin
             EsciWin := True;
             Setup.LineStyle := UserBitLn;
             Setup.PatternLine := MyLine;
             End;
    kEscape: Begin
             EsciWin := True;
             End;
    kSpazio: Begin
             If (Bina[X] = '■')
               Then
                 Bina[X] := '·'
             Else
               Bina[X] := '■';
             ReleaseMouse;
             Cambio := True;
             End;
    kTab: Nome := Not Nome;
    End;

  If (Nome <> OldNome)
    Then
      Begin
      WriteNome(Nome);
      If Nome
        Then
          WriteCur(X,cEditColor)
      Else
        WriteCur(X,cUserSel);
      End;

  If ((Bina[X] <> OldBin) And (X = OldX)) Or
     (Linea <> OldLinea) Or Cambio
       Then
         Begin
         If (Linea <> OldLinea)
           Then
             Begin
             WriteNome(Nome);
             SetLineStyle(Linea,MyLine,NormWidth);
             If (Linea = UserBitLn)
               Then
                 Begin
                 GetLineSettings(LineInfo);
                 MyLine := LineInfo.Pattern;
                 End
             Else
               MyLine := VetSty[Linea];
             InitLn;
             End;
         WriteBitLn;
         WriteView;
         WriteConv;
         End;

Until EsciWin;

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

SetGHorRange(0,GetMaxX);
SetGVertRange(0,GetMaxY);
Stato := sAttesa;
End; { pUserDefinedLn }


Procedure pSceltaOggetti;
Begin { pSceltaOggetti }
OldStato := sSceltaOggetti;
End; { pSceltaOggetti }


Procedure pHelpOnLine;
Begin { pHelpOnLine }
Help('Help Generale',Altro);
Stato := sAttesa;
End; { pHelpOnLine }


Procedure pDiscoStampa;
Begin { pDiscoStampa }
End; { pDiscoStampa }


Procedure pNewPalette;

Var WinPunt:
Pointer;
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
    Vet:        Array [0..30] Of
                  Record
                  X1,Y1: Integer;
                  Icn: Pointer;
                  End;
    I:          Integer;
    Col:        Byte;
    AppPalette: RecRGB;
    RGB:        Byte;
    OldCol:     Byte;
    Agg:        Boolean;
    OldRGB:     Byte;
    Ok:         Boolean;
    AggAll:     Boolean;
    OldPos:     Byte;


     Procedure WriteColor;
     Begin { WriteColor }
     WaitToWrite;
     HideMouse;
     SetFillStyle(SolidFill,Col);
     Bar(Vet[LightGray].X1+41,Vet[LightGray].Y1+1+TH*2,
         Vet[LightGray].X1+109,Vet[30].Y1+13);
     ShowMouse;
     End; { WriteColor }


     Procedure WriteRed ( Evid: Boolean );
     Var St: String[3];
         Col1: Byte;
     Begin { WriteRed }
     If Evid
       Then
         Col1 := cBkEditColorSel
     Else
       Col1 := cBkEditColor;

     SetColor(cDialogBord);

     SetFillStyle(SolidFill,Col1);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(CenterText,CenterText);
     WaitToWrite;
     HideMouse;
     With Vet[18] Do
       Begin
       Rectangle(X1+20,Y1,X1+46,Y1+13);
       Bar(X1+21,Y1+1,X1+45,Y1+12);
       Str(AppPalette[Col].Red,St);
       SetColor(cEditColor);
       OutTextXY(X1+33,Y1+7,St);
       End;
     SetFillStyle(SolidFill,cBkSmallDialog);
     With Vet[17] Do
       Begin
       Bar(X1,Y1,X1+14,Y1+13);
       X1 := Round(((Vet[18].X1-2-(Vet[16].X1+15)-14)/63)*
             AppPalette[Col].Red+Vet[16].X1+15);
       PutImage(X1,Y1,Icn^,NormalPut);
       End;
     With AppPalette[Col] Do
       SetRGBPalette(Col,Red,Green,Blue);
     ShowMouse;
     End; { WriteRed }


     Procedure WriteGreen ( Evid: Boolean );
     Var St: String[3];
         Col1: Byte;
     Begin { WriteGreen }
     If Evid
       Then
         Col1 := cBkEditColorSel
     Else
       Col1 := cBkEditColor;

     SetColor(cDialogBord);
     SetFillStyle(SolidFill,Col1);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(CenterText,CenterText);
     WaitToWrite;
     HideMouse;
     With Vet[21] Do
       Begin
       Rectangle(X1+20,Y1,X1+46,Y1+13);
       Bar(X1+21,Y1+1,X1+45,Y1+12);
       Str(AppPalette[Col].Green,St);
       SetColor(cEditColor);
       OutTextXY(X1+33,Y1+7,St);
       End;
     SetFillStyle(SolidFill,cBkSmallDialog);
     With Vet[20] Do
       Begin
       Bar(X1,Y1,X1+14,Y1+13);
       X1 := Round(((Vet[21].X1-2-(Vet[19].X1+15)-14)/63)*
             AppPalette[Col].Green+Vet[19].X1+15);
       PutImage(X1,Y1,Icn^,NormalPut);
       End;
     With AppPalette[Col] Do
       SetRGBPalette(Col,Red,Green,Blue);
     ShowMouse;
     End; { WriteGreen }


     Procedure WriteBlue ( Evid: Boolean );
     Var St: String[3];
         Col1: Byte;
     Begin { WriteBlue }
     If Evid
       Then
         Col1 := cBkEditColorSel
     Else
       Col1 := cBkEditColor;

     SetColor(cDialogBord);
     SetFillStyle(SolidFill,Col1);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(CenterText,CenterText);
     WaitToWrite;
     HideMouse;
     With Vet[24] Do
       Begin
       Rectangle(X1+20,Y1,X1+46,Y1+13);
       Bar(X1+21,Y1+1,X1+45,Y1+12);
       Str(AppPalette[Col].Blue,St);
       SetColor(cEditColor);
       OutTextXY(X1+33,Y1+7,St);
       End;
     SetFillStyle(SolidFill,cBkSmallDialog);
     With Vet[23] Do
       Begin
       Bar(X1,Y1,X1+14,Y1+13);
       X1 := Round(((Vet[24].X1-2-(Vet[22].X1+15)-14)/63)*
             AppPalette[Col].Blue+Vet[22].X1+15);
       PutImage(X1,Y1,Icn^,NormalPut);
       End;
     With AppPalette[Col] Do
       SetRGBPalette(Col,Red,Green,Blue);
     ShowMouse;
     End; { WriteBlue }


Begin { pNewPalette }

WinBX := GetMaxX Div 2-TW*22;
WinBY := GetMaxY Div 2-TH*13;
WinEX := GetMaxX Div 2+TW*22;
WinEY := GetMaxY Div 2+TH*13;

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

SetFillPattern(MyFill,cBkDialog);
SetFillStyle(UserFill,cBkDialog);
Bar(WinBX+Shadow,WinBY+Shadow,WinEX+Shadow,WinEY+Shadow);
SetFillStyle(SolidFill,cBkDialog);
Bar(WinBX,WinBY,WinEX,WinEY);
SetColor(cDialogBord);
Rectangle(WinBX,WinBY,WinEX,WinEY);
SetColor(cEditColor);
SetTextJustify(CenterText,CenterText);
SetTextStyle(DefaultFont,HorizDir,1);

WriteWin('NUOVA PALETTE DEI COLORI',WinBX,WinBY,WinEX,WinEY,cBkDialog,cBkDialogTitle,cDialogTitle);
SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);

Vet[0].X1 := TW*2;
Vet[0].Y1 := TH*4;
For i := 1 To 7 Do
  With Vet[i] Do
    Begin
    X1 := Vet[i-1].X1+30;
    Y1 := Vet[0].Y1;
    End;
For i := 8 To 15 Do
  With Vet[i] Do
    Begin
    X1 := Vet[i-8].X1;
    Y1 := Vet[i-8].Y1+15;
    End;
Vet[16].X1 := TW*7+30;
Vet[16].Y1 := Vet[15].Y1+TW*3;
Vet[17].X1 := TW*7+45;
Vet[17].Y1 := Vet[16].Y1;
Vet[18].X1 := TW*20+44;
Vet[18].Y1 := Vet[17].Y1;

Vet[19].X1 := Vet[16].X1;
Vet[19].Y1 := Vet[16].Y1+20;
Vet[20].X1 := Vet[17].X1;
Vet[20].Y1 := Vet[17].Y1+20;
Vet[21].X1 := Vet[18].X1;
Vet[21].Y1 := Vet[18].Y1+20;

Vet[22].X1 := Vet[19].X1;
Vet[22].Y1 := Vet[19].Y1+20;
Vet[23].X1 := Vet[20].X1;
Vet[23].Y1 := Vet[20].Y1+20;
Vet[24].X1 := Vet[21].X1;
Vet[24].Y1 := Vet[21].Y1+20;

Vet[25].X1 := Vet[16].X1-60;
Vet[25].Y1 := Vet[24].Y1+TH*4;
Vet[26].X1 := Vet[25].X1;
Vet[26].Y1 := Vet[25].Y1+TH*2;
Vet[27].X1 := Vet[25].X1;
Vet[27].Y1 := Vet[26].Y1+TH*2;

Vet[28].X1 := Vet[16].X1+63;
Vet[28].Y1 := Vet[25].Y1;
Vet[29].X1 := Vet[28].X1;
Vet[29].Y1 := Vet[26].Y1;
Vet[30].X1 := Vet[28].X1;
Vet[30].Y1 := Vet[27].Y1;

Vet[00].Icn := @ConstIcnBlack;
Vet[01].Icn := @ConstIcnBlue;
Vet[02].Icn := @ConstIcnGreen;
Vet[03].Icn := @ConstIcnCyan;
Vet[04].Icn := @ConstIcnRed;
Vet[05].Icn := @ConstIcnMagenta;
Vet[06].Icn := @ConstIcnBrown;
Vet[07].Icn := @ConstIcnLightGray;
Vet[08].Icn := @ConstIcnDarkGray;
Vet[09].Icn := @ConstIcnLightBlue;
Vet[10].Icn := @ConstIcnLightGreen;
Vet[11].Icn := @ConstIcnLightCyan;
Vet[12].Icn := @ConstIcnLightRed;
Vet[13].Icn := @ConstIcnLightMagenta;
Vet[14].Icn := @ConstIcnYellow;
Vet[15].Icn := @ConstIcnWhite;

Vet[16].Icn := @ConstIcnSinistra;
Vet[17].Icn := @ConstIcnCursorBar;
Vet[18].Icn := @ConstIcnDestra;

Vet[19].Icn := @ConstIcnSinistra;
Vet[20].Icn := @ConstIcnCursorBar;
Vet[21].Icn := @ConstIcnDestra;

Vet[22].Icn := @ConstIcnSinistra;
Vet[23].Icn := @ConstIcnCursorBar;
Vet[24].Icn := @ConstIcnDestra;

Vet[25].Icn := @ConstIcnLongOk;
Vet[26].Icn := @ConstIcnReset;
Vet[27].Icn := @ConstIcnDefault;
Vet[28].Icn := @ConstIcnLongEsci;
Vet[29].Icn := @ConstIcnResetAll;
Vet[30].Icn := @ConstIcnDefaultAll;

For i := 0 To 30 Do
  With Vet[i] Do
    PutImage(X1,Y1,Icn^,NormalPut);
SetTextStyle(DefaultFont,HorizDir,1);
SetTextJustify(RightText,CenterText);
SetColor(cBkSmallTitle);
With Vet[16] Do
  OutTextXY(X1-5,Y1+6,'Rosso');
With Vet[19] Do
  OutTextXY(X1-5,Y1+6,'Verde');
With Vet[22] Do
  OutTextXY(X1-5,Y1+6,'Blu  ');

WriteWin('Colore',Vet[LightGray].X1+40,Vet[LightGray].Y1,
         Vet[LightGray].X1+110,Vet[30].Y1+14,cBkSmallDialog,cBkSmallTitle,
         cSmallTitle);

SetFillStyle(SolidFill,cDialogBord);
With Vet[16] Do
  Bar(X1-1,Y1-1,Vet[18].X1+14,Y1+14);
With Vet[19] Do
  Bar(X1-1,Y1-1,Vet[21].X1+14,Y1+14);
With Vet[22] Do
  Bar(X1-1,Y1-1,Vet[24].X1+14,Y1+14);
SetFillStyle(SolidFill,cBkSmallDialog);
With Vet[16] Do
  Bar(X1+15,Y1,Vet[18].X1-2,Y1+13);
With Vet[19] Do
  Bar(X1+15,Y1,Vet[21].X1-2,Y1+13);
With Vet[22] Do
  Bar(X1+15,Y1,Vet[24].X1-2,Y1+13);

For i := 0 To 30 Do
  With Vet[i] Do
    PutImage(X1,Y1,Icn^,NormalPut);

RGB := 1;
OldRGB := 1;

AppPalette := Setup.Palette;
Col := Setup.ForeColor;
WriteColor;
WriteRed(True);
WriteGreen(False);
WriteBlue(False);

EsciWin := False;
Sel := 1;
OldSel := 0;

Repeat

  ShowMouse;
  ClearKeyBuf;
  Repeat
    GetMPos;
  Until MousePressed Or KeyPressed;

  OldCol := Col;
  OldSel := Sel;
  OldRGB := RGB;
  Agg := False;
  AggAll := False;

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
      Ok := False;
      For i := Black To White Do
        If (Not Ok)
          Then
            With Vet[i] Do
              If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+29,Y1+WinBY+14)
                Then
                  If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Colore,i,SiAttesa,cBkDialog)
                    Then
                      Begin
                      Col := i;
                      Ok := True;
                      End;
      If (Not Ok)
        Then
          With Vet[16] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+14,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Frecce,IcnSinistra,NoAttesa,cBkDialog)
                  Then
                    Begin
                    C := kNull;
                    C2 := kLeft;
                    RGB := 1;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[16] Do
            If MouseInG(X1+WinBX+15,Y1+WinBY,Vet[18].X1+WinBX-2,Y1+WinBY+13)
              Then
                Begin
                SetGHorRange(X1+WinBX+15,Vet[18].X1+WinBX-16);
                SetGVertRange(Y1+WinBY,Y1+WinBY+13);
                SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
                OldPos := AppPalette[Col].Red;
                RGB := 1;
                Repeat
                  GetMPos;
                  AppPalette[Col].Red := Round(((MouseX-(X1+WinBX+15))*63)/(Vet[18].X1-2-(Vet[16].X1+15)-14));
                  If (AppPalette[Col].Red <> OldPos)
                    Then
                      Begin
                      WriteRed(True);
                      OldPos := AppPalette[Col].Red;
                      End;
                Until (Not LeftButton);
                SetGHorRange(WinBX,WinEX);
                SetGVertRange(WinBY,WinEY);
                Agg := True;
                Ok := True;
                End;
      If (Not Ok)
        Then
          With Vet[18] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+14,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Frecce,IcnDestra,NoAttesa,cBkDialog)
                  Then
                    Begin
                    C := kNull;
                    C2 := kRight;
                    RGB := 1;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[19] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+14,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Frecce,IcnSinistra,NoAttesa,cBkDialog)
                  Then
                    Begin
                    C := kNull;
                    C2 := kLeft;
                    RGB := 2;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[19] Do
            If MouseInG(X1+WinBX+15,Y1+WinBY,Vet[21].X1+WinBX-2,Y1+WinBY+13)
              Then
                Begin
                SetGHorRange(X1+WinBX+15,Vet[21].X1+WinBX-16);
                SetGVertRange(Y1+WinBY,Y1+WinBY+13);
                SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
                OldPos := AppPalette[Col].Green;
                RGB := 2;
                Repeat
                  GetMPos;
                  AppPalette[Col].Green := Round(((MouseX-(X1+WinBX+15))*63)/(Vet[21].X1-2-(Vet[19].X1+15)-14));
                  If (AppPalette[Col].Green <> OldPos)
                    Then
                      Begin
                      WriteGreen(True);
                      OldPos := AppPalette[Col].Green;
                      End;
                Until (Not LeftButton);
                SetGHorRange(WinBX,WinEX);
                SetGVertRange(WinBY,WinEY);
                Agg := True;
                Ok := True;
                End;
      If (Not Ok)
        Then
          With Vet[21] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+14,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Frecce,IcnDestra,NoAttesa,cBkDialog)
                  Then
                    Begin
                    C := kNull;
                    C2 := kRight;
                    RGB := 2;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[22] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+14,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Frecce,IcnSinistra,NoAttesa,cBkDialog)
                  Then
                    Begin
                    C := kNull;
                    C2 := kLeft;
                    RGB := 3;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[22] Do
            If MouseInG(X1+WinBX+15,Y1+WinBY,Vet[24].X1+WinBX-2,Y1+WinBY+13)
              Then
                Begin
                SetGHorRange(X1+WinBX+15,Vet[24].X1+WinBX-16);
                SetGVertRange(Y1+WinBY,Y1+WinBY+13);
                SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
                OldPos := AppPalette[Col].Blue;
                RGB := 3;
                Repeat
                  GetMPos;
                  AppPalette[Col].Blue := Round(((MouseX-(X1+WinBX+15))*63)/(Vet[24].X1-2-(Vet[22].X1+15)-14));
                  If (AppPalette[Col].Blue <> OldPos)
                    Then
                      Begin
                      WriteBlue(True);
                      OldPos := AppPalette[Col].Blue;
                      End;
                Until (Not LeftButton);
                SetGHorRange(WinBX,WinEX);
                SetGVertRange(WinBY,WinEY);
                Agg := True;
                Ok := True;
                End;
      If (Not Ok)
        Then
          With Vet[24] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+14,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Frecce,IcnDestra,NoAttesa,cBkDialog)
                  Then
                    Begin
                    C := kNull;
                    C2 := kRight;
                    RGB := 3;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[25] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+95,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Long,IcnLongOk,SiAttesa,cBkDialog)
                  Then
                    Begin
                    C := kReturn;
                    C2 := kNull;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[26] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+95,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Long,IcnReset,SiAttesa,cBkDialog)
                  Then
                    Begin
                    AppPalette[Col] := Setup.Palette[Col];
                    For i := 0 To 15 Do
                      With AppPalette[i] Do
                        SetRGBPalette(i,Red,Green,Blue);
                    Agg := True;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[27] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+95,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Long,IcnDefault,SiAttesa,cBkDialog)
                  Then
                    Begin
                    With AppPalette[Col] Do
                      Case Col Of
                         0: Begin Red:=000; Green:=000; Blue:=000; End;
                         1: Begin Red:=000; Green:=000; Blue:=042; End;
                         2: Begin Red:=000; Green:=042; Blue:=000; End;
                         3: Begin Red:=000; Green:=042; Blue:=042; End;
                         4: Begin Red:=042; Green:=000; Blue:=000; End;
                         5: Begin Red:=042; Green:=000; Blue:=042; End;
                         6: Begin Red:=042; Green:=021; Blue:=000; End;
                         7: Begin Red:=042; Green:=042; Blue:=042; End;
                         8: Begin Red:=021; Green:=021; Blue:=021; End;
                         9: Begin Red:=021; Green:=021; Blue:=063; End;
                        10: Begin Red:=021; Green:=063; Blue:=021; End;
                        11: Begin Red:=021; Green:=063; Blue:=063; End;
                        12: Begin Red:=063; Green:=021; Blue:=021; End;
                        13: Begin Red:=063; Green:=021; Blue:=063; End;
                        14: Begin Red:=063; Green:=063; Blue:=021; End;
                        15: Begin Red:=063; Green:=063; Blue:=063; End;
                        End;
                    With AppPalette[Col] Do
                      SetRGBPalette(Col,Red,Green,Blue);
                    Agg := True;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[28] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+95,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Long,IcnLongEsci,SiAttesa,cBkDialog)
                  Then
                    Begin
                    C := kEscape;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[29] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+95,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Long,IcnResetAll,SiAttesa,cBkDialog)
                  Then
                    Begin
                    AppPalette := Setup.Palette;
                    For i := 0 To 15 Do
                      With AppPalette[i] Do
                        SetRGBPalette(i,Red,Green,Blue);
                    AggAll := True;
                    Ok := True;
                    End;
      If (Not Ok)
        Then
          With Vet[30] Do
            If MouseInG(X1+WinBX,Y1+WinBY,X1+WinBX+95,Y1+WinBY+14)
              Then
                If PremiPulsante(X1+WinBX,Y1+WinBY,Icn,Long,IcnDefaultAll,SiAttesa,cBkDialog)
                  Then
                    Begin
                    AppPalette := DefaultPalette;
                    For i := 0 To 15 Do
                      With AppPalette[i] Do
                        SetRGBPalette(i,Red,Green,Blue);
                    AggAll := True;
                    Ok := True;
                    End;

      SetViewPort(WinBX,WinBY,WinEX,WinEY,ClipOn);
      End
  Else
    If RightButton
      Then
        C := kEscape;

  Case C Of
    kNull: Case C2 Of
             kLeft: Case RGB Of
                      1: If (AppPalette[Col].Red > 0)
                           Then
                             Begin
                             Dec(AppPalette[Col].Red);
                             Agg := True;
                             End;
                      2: If (AppPalette[Col].Green > 0)
                           Then
                             Begin
                             Dec(AppPalette[Col].Green);
                             Agg := True;
                             End;
                      3: If (AppPalette[Col].Blue > 0)
                           Then
                             Begin
                             Dec(AppPalette[Col].Blue);
                             Agg := True;
                             End;
                      End;
             kRight: Case RGB Of
                       1: If (AppPalette[Col].Red < 63)
                            Then
                              Begin
                              Inc(AppPalette[Col].Red);
                              Agg := True;
                              End;
                       2: If (AppPalette[Col].Green < 63)
                            Then
                              Begin
                              Inc(AppPalette[Col].Green);
                              Agg := True;
                              End;
                       3: If (AppPalette[Col].Blue < 63)
                            Then
                              Begin
                              Inc(AppPalette[Col].Blue);
                              Agg := True;
                              End;
                       End;
             kHome: Begin
                    Case RGB Of
                      1: AppPalette[Col].Red := 0;
                      2: AppPalette[Col].Green := 0;
                      3: AppPalette[Col].Blue := 0;
                      End;
                    Agg := True;
                    End;
             kEnd: Begin
                   Case RGB Of
                     1: AppPalette[Col].Red := 63;
                     2: AppPalette[Col].Green := 63;
                     3: AppPalette[Col].Blue := 63;
                     End;
                   Agg := True;
                   End;
             kUp: If (RGB > 1)
                    Then
                      Dec(RGB);
             kDown: If (RGB < 3)
                      Then
                        Inc(RGB);
             End;
    kReturn: Begin
             EsciWin := True;
             Setup.Palette := AppPalette;
             End;
    kEscape: EsciWin := True;
    End;

  If AggAll
    Then
      Begin
      WriteRed(RGB = 1);
      WriteGreen(RGB = 2);
      WriteBlue(RGB = 3);
      End
  Else
    If (OldCol <> Col)
      Then
        Begin
        WriteColor;
        WriteRed(RGB = 1);
        WriteGreen(RGB = 2);
        WriteBlue(RGB = 3);
        End
  Else
    If (OldRGB <> RGB)
      Then
        Begin
        Case OldRGB Of
          1: WriteRed(False);
          2: WriteGreen(False);
          3: WriteBlue(False);
          End;
        Case RGB Of
          1: WriteRed(True);
          2: WriteGreen(True);
          3: WriteBlue(True);
          End;
        End
  Else
    If Agg
      Then
        Begin
        Case RGB Of
          1: WriteRed(True);
          2: WriteGreen(True);
          3: WriteBlue(True);
          End;
        End;
Until EsciWin;

For i := 0 To 15 Do
  With Setup.Palette[i] Do
    SetRGBPalette(i,Red,Green,Blue);

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

SetGHorRange(0,GetMaxX);
SetGVertRange(0,GetMaxY);
Stato := sAttesa;
End; { pNewPalette }


Procedure pHelpPrecedente;
Begin { pHelpPrecedente }
{ ALT-F1 }
Help(VetHelp[1],Precedente);
Stato := sAttesa;
End; { pHelpPrecedente }


Procedure pHelpIndice;
Begin { pHelpIndice }
{ SHIFT-F1 }
Help('Indice',Altro);
Stato := sAttesa;
End; { pHelpIndice }


Procedure pHelpGIP;
Begin { pHelpGIP }
Help('G.I.P.',Altro);
Stato := sAttesa;
End; { pHelpGIP }


Procedure pClock;

Type
     ClockType=  Array [1..5] Of
                   PointType;

Var

    { Vale TRUE se occorre uscire e chiudere la finestra attiva }
    EsciFin:           Boolean;

    { Inizio del display dell' orologio (X) }
    ClockBegX:         Integer;

    { Inizio del display dell' orologio (Y) }
    ClockBegY:         Integer;

    { Fine del display dell' orologio (X) }
    ClockEndX:         Integer;

    { Fine del display dell' orologio (Y) }
    ClockEndY:         Integer;

    { Ora corrente }
    Hour:              Word;

    { Minuto corrente }
    Minute:            Word;

    { Secondo corrente }
    Second:            Word;

    { Centesimo di secondo }
    Sec100:            Word;

    { Ora precedente }
    OldHour:           Word;

    { Minuto precedente }
    OldMinute:         Word;

    { Secondo precedente }
    OldSecond:         Word;

    { Centesimo di secondo precedente }
    OldSec100:         Word;

    { Puntatore nello heap }
    WinPunt:           Pointer;

    { Dimensione della finestra }
    WinSize:           Word;

    { Utilizzo della memoria (TRUE) o no (FALSE) }
    Memoria:           Boolean;

    { Coordinata X del centro dell' orologio }
    ClkMedioX:         Integer;

    { Coordinata Y del centro dell' orologio }
    ClkMedioY:         Integer;

    { Coordinate della lancetta delle ore }
    LancHour:          ClockType;

    { Coordinate della lancetta dei minuti }
    LancMinute:        ClockType;

    { Coordinate della lancetta dei secondi }
    LancSecond:        ClockType;

    { Coordinate della lancetta dei centesimi di secondo }
    LancSecond100:     ClockType;

    { Coordinate precedenti della lancetta delle ore }
    LancHourPrec:      ClockType;

    { Coordinate precedenti della lancetta dei minuti }
    LancMinutePrec:    ClockType;

    { Coordinate precedenti della lancetta dei secondi }
    LancSecondPrec:    ClockType;

    { Coordinate precedenti della lancetta dei centesimi di secondo }
    LancSecond100Prec: ClockType;


     Procedure CalcolaCoordinate ( Var CTHour:      ClockType;
                                   Var CTMinute:    ClockType;
                                   Var CTSecond:    ClockType;
                                   Var CTSecond100: ClockType;
                                   Var WHour:       Word;
                                   Var WMinute:     Word;
                                   Var WSecond:     Word;
                                   Var WSecond100:  Word;
                                       OldSecond:   Word );
     Var
         App1: Integer;
         App2: Integer;
         App:    Real;
         St1:  String002;
         St2:  String002;
         St3:  String002;

     Begin { CalcolaCoordinate }

     GetTime(WHour,WMinute,WSecond,WSecond100);

     If (OldSecond <> Second)
       Then
         Begin
         SetFillStyle(SolidFill,cBkClkInfo);
         Bar(ClockEndX-TW-1,   ClockEndY-TH-1,
             ClockEndX-TW*10+1,ClockEndY-TH*3+1);
         SetColor(cClkInfo);
         Str(WHour:2,St1);
         If (St1[1] = ' ')
           Then
             St1[1] := '0';
         Str(WMinute:2,St2);
         If (St2[1] = ' ')
           Then
             St2[1] := '0';
         Str(WSecond:2,St3);
         If (St3[1] = ' ')
           Then
             St3[1] := '0';
         OutTextXY(ClockEndX-TW-TW Div 2+1,ClockEndY-TH*2+1,
                   St1+':'+St2+','+St3);
         End;

     If (WHour > 11)
       Then
         Dec(WHour,12);

     { Calcolo delle coordinate della lancetta dei centesimi di secondo }
     App := WSecond100*Pi/50;
     App1 := Trunc(Sin(App+Pi/2)*4);
     App2 := Trunc(Cos(App+Pi/2)*4);
     CTSecond100[1].X := ClockBegX+ClkMedioX-App1;
     CTSecond100[1].Y := ClockBegY+ClkMedioY+App2;
     CTSecond100[2].X := ClockBegX+ClkMedioX+Round(Sin(App)*100);
     CTSecond100[2].Y := ClockBegY+ClkMedioY-Round(Cos(App)*100);
     CTSecond100[3].X := ClockBegX+ClkMedioX+App1;
     CTSecond100[3].Y := ClockBegY+ClkMedioY-App2;
     CTSecond100[4].X := ClockBegX+ClkMedioX+App2*3;
     CTSecond100[4].Y := ClockBegY+ClkMedioY+App1*3;
     CTSecond100[5]   := CTSecond100[1];

     { Calcolo delle coordinate della lancetta dei secondi }
     App := (WSecond+WSecond100/100)*Pi/30;
     App1 := Trunc(Sin(App+Pi/2)*5);
     App2 := Trunc(Cos(App+Pi/2)*5);
     CTSecond[1].X := ClockBegX+ClkMedioX-App1;
     CTSecond[1].Y := ClockBegY+ClkMedioY+App2;
     CTSecond[2].X := ClockBegX+ClkMedioX+Round(Sin(App)*100);
     CTSecond[2].Y := ClockBegY+ClkMedioY-Round(Cos(App)*100);
     CTSecond[3].X := ClockBegX+ClkMedioX+App1;
     CTSecond[3].Y := ClockBegY+ClkMedioY-App2;
     CTSecond[4].X := ClockBegX+ClkMedioX+App2*3;
     CTSecond[4].Y := ClockBegY+ClkMedioY+App1*3;
     CTSecond[5]   := CTSecond[1];

     { Calcolo delle coordinate della lancetta dei minuti }
     App := (WMinute+WSecond/60+WSecond100/6000)*Pi/30;
     App1 := Trunc(Sin(App+Pi/2)*11);
     App2 := Trunc(Cos(App+Pi/2)*11);
     CTMinute[1].X := ClockBegX+ClkMedioX-App1;
     CTMinute[1].Y := ClockBegY+ClkMedioY+App2;
     CTMinute[2].X := ClockBegX+ClkMedioX+Round(Sin(App)*100);
     CTMinute[2].Y := ClockBegY+ClkMedioY-Round(Cos(App)*100);
     CTMinute[3].X := ClockBegX+ClkMedioX+App1;
     CTMinute[3].Y := ClockBegY+ClkMedioY-App2;
     CTMinute[4].X := ClockBegX+ClkMedioX+App2*3;
     CTMinute[4].Y := ClockBegY+ClkMedioY+App1*3;
     CTMinute[5]   := CTMinute[1];

     { Calcolo delle coordinate della lancetta delle ore }
     App := (WHour+WMinute/60+WSecond/3600+WSecond100/360000)*Pi/6;
     App1 := Trunc(Sin(App+Pi/2)*11);
     App2 := Trunc(Cos(App+Pi/2)*11);
     CTHour[1].X := ClockBegX+ClkMedioX-App1;
     CTHour[1].Y := ClockBegY+ClkMedioY+App2;
     CTHour[2].X := ClockBegX+ClkMedioX+Round(Sin(App)*80);
     CTHour[2].Y := ClockBegY+ClkMedioY-Round(Cos(App)*80);
     CTHour[3].X := ClockBegX+ClkMedioX+App1;
     CTHour[3].Y := ClockBegY+ClkMedioY-App2;
     CTHour[4].X := ClockBegX+ClkMedioX+App2*3;
     CTHour[4].Y := ClockBegY+ClkMedioY+App1*3;
     CTHour[5]   := CTHour[1];

     End; { CalcolaCoordinate }


     Procedure Lancette ( Var CTHour:      ClockType;
                          Var CTMinute:    ClockType;
                          Var CTSecond:    ClockType;
                          Var CTSecond100: ClockType;
                              cHour:       Byte;
                              cMinute:     Byte;
                              cSecond:     Byte;
                              cSecond100:  Byte );
     Begin { Lancette }

     SetColor(cHour);
     DrawPoly(5,CTHour);
     SetColor(cMinute);
     DrawPoly(5,CTMinute);
     SetColor(cSecond);
     DrawPoly(5,CTSecond);
     SetColor(cSecond100);
     DrawPoly(5,CTSecond100);

     End; { Lancette }


     Procedure DrawClock;

     Var
         I:    Integer;
         St:   String002;
         Lung: Byte;
         Ok:   Boolean;

     Begin { DrawClock }

     SetFillStyle(SolidFill,cBkClock);
     SetColor(cBkClock+8);
     FillEllipse(ClockBegX+ClkMedioX,ClockBegY+ClkMedioY,
                 ClkMedioX-5,ClkMedioY-5);

     SetTextJustify(CenterText,CenterText);
     SetColor(cClock);
     i := 1;
     Repeat
       Case i Of
         15,
         30,
         45,
         60: Begin
             SetTextStyle(GothicFont,HorizDir,5);
             SetFillStyle(SolidFill,cBkDisplay);
             Lung := 8;
             Ok := True;
             End;

         5,
         10,
         20,
         25,
         35,
         40,
         50,
         55: Begin
             SetTextStyle(GothicFont,HorizDir,3);
             SetFillStyle(SolidFill,cBkClock+8);
             Lung := 4;
             Ok := True;
             End
         Else
           Begin
           Lung := 1;
           Ok := False;
           SetFillStyle(SolidFill,cClkNumber);
           End;
         End; { Case I }

       FillEllipse(ClockBegX+ClkMedioX+Round(Sin(i*Pi/30)*110),
                   ClockBegY+ClkMedioY-Round(Cos(i*Pi/30)*110),Lung,Lung);

       If Ok
         Then
           Begin
           Str(i Div 5,St);
           OutTextXY(ClockBegX+ClkMedioX+Round(Sin(i*Pi/30)*140+3),
                     ClockBegY+ClkMedioY-Round(Cos(i*Pi/30)*140)-5,St);
           End;
       Inc(i);

     Until (i > 60);

     SetTextStyle(DefaultFont,HorizDir,1);
     SetColor(cBkClkInfo+8);
     Rectangle(ClockEndX-TW,ClockEndY-TH,ClockEndX-TW*10,ClockEndY-TH*3);

     SetTextJustify(RightText,CenterText);
     CalcolaCoordinate(LancHourPrec,LancMinutePrec,LancSecondPrec,
                       LancSecond100Prec,OldHour,OldMinute,OldSecond,
                       OldSec100,OldSecond-1);
     Lancette(LancHourPrec,LancMinutePrec,LancSecondPrec,LancSecondPrec,
              cClkHour,cClkMinute,cClkSecond,cClkSec100);

     End; { DrawClock }


Begin { pClock }

ClockBegX := (WinBegX+WinEndX) Div 2-170;
ClockBegY := (WinBegY+WinEndY) Div 2-170;
ClockEndX := (WinBegX+WinEndX) Div 2+170;
ClockEndY := (WinBegY+WinEndY) Div 2+170;

ClkMedioX := (ClockEndX-ClockBegX) Div 2;
ClkMedioY := (ClockEndY-ClockBegY) Div 2;

SetGHorRange(ClockBegX,ClockEndX);
SetGVertRange(ClockBegY,ClockEndY);
SetLineStyle(SolidLn,0,NormWidth);
WinSize := ImageSize(ClockBegX,ClockBegY,ClockEndX+Shadow,ClockEndY+Shadow);
If ((WinSize > 0) And (MemAvail > WinSize))
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
    GetImage(ClockBegX,ClockBegY,ClockEndX+Shadow,ClockEndY+Shadow,WinPunt^);
    End;

SetFillPattern(MyFill,cBkDisplay+8);
SetFillStyle(UserFill,cBkDisplay+8);
Bar(ClockBegX+Shadow,ClockBegY+Shadow,ClockEndX+Shadow,ClockEndY+Shadow);
SetFillStyle(SolidFill,cBkDisplay);
Bar(ClockBegX,ClockBegY,ClockEndX,ClockEndY);
SetColor(cClockBord);
Rectangle(ClockBegX,ClockBegY,ClockEndX,ClockEndY);

DrawClock;
EsciFin := False;

Repeat

(*
   Invece di GetTime si può utilizzare anche:

     Var Count: LongInt Absolute $0000:$046C;

  Hour      := Trunc(Count / 65543);
  Remainder := Count Mod 65543;
  Minute    := Trunc(Remainder / 1092);
  Remainder := Remainder Mod 1092;
  Second    := Trunc(Remainder / 18.21);
  Remainder := Remanider Mod 18.21;
  Sec100    := CINT(Remanider*100);

*)

  GetMPos;

  CalcolaCoordinate(LancHour,LancMinute,LancSecond,LancSecond100,
                    Hour,Minute,Second,Sec100,OldSecond);

  WaitToWrite;
  Lancette(LancHourPrec,LancMinutePrec,LancSecondPrec,LancSecond100Prec,
           cBkClock,cBkClock,cBkclock,cBkclock);
  Lancette(LancHour,LancMinute,LancSecond,LancSecond100,
           cClkHour,cClkMinute,cClkSecond,cClkSec100);

  { Puntino centrale (perno delle lancette) }
  SetColor(cClkNumber);
  Circle(ClockBegX+ClkMedioX,ClockBegY+ClkMedioY,1);

  LancHourPrec := LancHour;
  LancMinutePrec := LancMinute;
  LancSecondPrec := LancSecond;
  LancSecond100Prec := LancSecond100;

  OldHour   := Hour;
  OldMinute := Minute;
  OldSecond := Second;
  OldSec100 := Sec100;

Until (EsciFin Or MousePressed Or KeyPressed);

SetWriteMode(NormalPut);

If Memoria
  Then
    Begin
    WaitToWrite;
    HideMouse;
    PutImage(ClockBegX,ClockBegY,WinPunt^,NormalPut);
    FreeMem(WinPunt,WinSize);
    ShowMouse;
    End
Else
  DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);

ShowMouse;
SetGHorRange(0,GetMaxX);
SetGVertRange(0,GetMaxY);
Stato := sAttesa;
End; { pClock }


Procedure pSfondoImmagine;
Begin { pSfondoImmagine }
ColorImage := Setup.BackColor;
DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);
Stato := sAttesa;
End; { pSfondoImmagine }


Procedure pMovPrimo;
Begin { pMovPrimo }
OpSelected := InizioOp;
Stato := sAttesa;
End; { pMovPrimo }


Procedure pMovPrec;
Begin { pMovPrec }
If (OpSelected^.Last <> NIL)
  Then
    OpSelected := OpSelected^.Last;
Stato := sAttesa;
End; { pMovPrec }


Procedure pMovSucc;
Begin { pMovSucc }
If (OpSelected^.Next <> NIL)
  Then
    OpSelected := OpSelected^.Next;
Stato := sAttesa;
End; { pMovSucc }


Procedure pMovUltimo;
Begin { pMovUltimo }
OpSelected := FineOp;
Stato := sAttesa;
End; { pMovUltimo }


Procedure pMovDelete;
Var St: String;
    AppPTR: PTROperation;
Begin { pMovDelete }

If (OpSelected <> NIL)
  Then
    Begin
    Case OpSelected^.Op.Figura Of
      fArco:              St := 'Arco';
      fRettangoloPieno:   St := 'Rettangolo pieno';
      fRettangolo:        St := 'Rettangolo';
      fCerchioPieno:      St := 'Cerchio pieno';
      fCerchio:           St := 'Cerchio';
      fPoligonoPieno:     St := 'Poligono pieno';
      fPoligono:          St := 'Poligono';
      fLinea:             St := 'Linea';
      fRiempimento:       St := 'Riempimento';
      fDisegnoLibero:     St := 'Disegno libero';
      fTestoInizio:       St := 'Testo';
      fSettorePieno:      St := 'Settore pieno';
      fSettore:           St := 'Settore';
      fRettangolo3DPieno: St := 'Parallelepipedo pieno';
      fRettangolo3D:      St := 'Parallelepipedo';
      fUserFill:          St := 'Retino user-defined';
      End; { Case Figura }
    If Warning('Cancello la figura selezionata ?','( '+St+' )',2)
      Then
        Begin
        If (OpSelected^.Next <> NIL)
          Then
            Begin
            End
        Else
          Begin
          OpSelected := FineOp;
          End;

(*        If (OpSelected = InizioOp)
          Then
            Begin

            End
        Else
          Begin
          AppPTR := OpSelected^.Next;
          OpSelected^.Last^.Next := OpSelected^.Next;
          OpSelected^.Next^.Last := OpSelected^.Last;
          Dispose(OpSelected);
          OpSelected := AppPTR;
          End;
        DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);*)
        End;
    End;

Stato := sAttesa;
End; { pMovDelete }


End. { GIPProc }
