Unit GIPFile;

Interface { GIPFile }

Uses
     Crt, Dos, Keyboard, Graph, GIPFast, Mouse, GIPVars, GIPInit, GIPIcWin,
     GIPGraph, GIPBase, GIPImage;



Procedure WriteWin ( Titolo: String;
                     X1:     Integer;
                     Y1:     Integer;
                     X2:     Integer;
                     Y2:     Integer;
                     Sfondo: Byte;
                     Riemp:  Byte;
                     Color:  Byte );


Procedure WriteLine ( Titolo: String;
                      X1:     Integer;
                      Y1:     Integer;
                      X2:     Integer;
                      Y2:     Integer;
                      Sfondo: Byte;
                      Riemp:  Byte;
                      Color:  Byte );


Function  Warning ( St1:     String;
                    St2:     String;
                    NumIcon: Byte ): Boolean;

Procedure WriteCursor ( X1:       Integer;
                        X2:       Integer;
                        Y:        Integer;
                        InsState: Boolean );


Procedure ReadFile ( NomeFile1: String080 );


Procedure WriteFile ( NomeFile1: String080 );


Procedure ReadPalette ( NomeFile: String080 );


Procedure WritePalette ( NomeFile: String080 );


Procedure InputFile (     TitWin:   String;
                      Var NomeFile: String080;
                          Ext:      String003;
                          Operaz:   TipoOpFile;
                          FileView: TipoView );


Implementation { GIPFile }


Procedure WriteWin ( Titolo: String;
                     X1:     Integer;
                     Y1:     Integer;
                     X2:     Integer;
                     Y2:     Integer;
                     Sfondo: Byte;
                     Riemp:  Byte;
                     Color:  Byte );
Begin { WriteWin }
WaitToWrite;
HideMouse;
SetFillStyle(SolidFill,Sfondo);
Bar(X1,Y1,X2,Y2);
SetTextStyle(DefaultFont,HorizDir,1);
SetTextJustify(CenterText,CenterText);
SetFillStyle(SolidFill,Riemp);
Bar(X1,Y1,X2,Y1+TH*2);
SetColor(Color);
OutTextXY((X2+X1) Div 2,Y1+TH,Titolo);
SetColor(cDialogBord);
Rectangle(X1,Y1,X2,Y2);
Line(X1,Y1+TH*2,X2,Y1+TH*2);
ShowMouse;
End; { WriteWin }


Procedure WriteLine ( Titolo: String;
                      X1:     Integer;
                      Y1:     Integer;
                      X2:     Integer;
                      Y2:     Integer;
                      Sfondo: Byte;
                      Riemp:  Byte;
                      Color:  Byte );
Var F: Integer;
Begin { WriteLine }
WaitToWrite;
HideMouse;
F := X1+TW*(Length(Titolo)+2);
SetFillStyle(SolidFill,Sfondo);
Bar(X1,Y1,X2,Y2);
SetTextStyle(DefaultFont,HorizDir,1);
SetTextJustify(LeftText,CenterText);
SetFillStyle(SolidFill,Riemp);
Bar(X1,Y1,F,Y2);
SetColor(Color);
OutTextXY(X1+TW,Y1+TH,Titolo);
SetColor(cDialogBord);
Rectangle(X1,Y1,X2,Y2);
Line(F,Y1,F,Y2);
ShowMouse;
End; { WriteLine }


Procedure WriteCursor ( X1:       Integer;
                        X2:       Integer;
                        Y:        Integer;
                        InsState: Boolean );
Begin { WriteCursor }
SetLineStyle(SolidLn,0,ThickWidth);
SetColor(cBkEditColorSel);
WaitToWrite;
HideMouse;
Line(X1,Y+1,X1+TW-1,Y+1);
If Not InsState Then SetLineStyle(SolidLn,0,NormWidth);
SetColor(cEditColorSel);
Line(X2,Y+1,X2+TW-1,Y+1);
ShowMouse;
SetLineStyle(SolidLn,0,NormWidth);
End; { WriteCursor }


Function  Warning ( St1:     String;
                    St2:     String;
                    NumIcon: Byte ): Boolean;
Var WinPunt: Pointer;
    WinSize: Word;
    WinBX:   Integer;
    WinBY:   Integer;
    WinEX:   Integer;
    WinEY:   Integer;
    Memoria: Boolean;
    EsciWin: Boolean;
    Sel:     Byte;
    OldSel:  Byte;
    C:       Char;
    C2:      Char;


     Procedure WriteRect ( N:     Byte;
                           Color: Byte );
     Begin
     SetColor(Color);
     Case NumIcon Of
       1: If (N <> 0)
            Then
              With Icone^[IcnOk] Do
                Rectangle(x-4,y-4,x+39+3,y+14+3);
       2: Case N Of
            1: With Icone^[IcnSi] Do
                 Rectangle(x-4,y-4,x+39+3,y+14+3);
            2: With Icone^[IcnNo] Do
                 Rectangle(x-4,y-4,x+39+3,y+14+3);
            End;
       End;
     End;

Begin { Warning }

If (Length(St1) > 60)
  Then
    St1[0] := #60;
If (Length(St2) > 60)
  Then
    St2[0] := #60;
WinBX := (GetMaxX-TW*Length(St1)) Div 2-TW*2;
WinBY := GetMaxY Div 2-TH*6;
WinEX := (GetMaxX+TW*Length(St1)) Div 2+TW*2;
WinEY := GetMaxY Div 2+TH*6;

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

SetFillPattern(MyFill,cBkWarning+8);
SetFillStyle(UserFill,cBkWarning+8);
Bar(WinBX+Shadow,WinBY+Shadow,WinEX+Shadow,WinEY+Shadow);
SetFillStyle(SolidFill,cBkWarning);
Bar(WinBX,WinBY,WinEX,WinEY);
SetColor(cWarningBord);
Rectangle(WinBX,WinBY,WinEX,WinEY);
SetColor(cWarning);
SetTextJustify(CenterText,CenterText);
SetTextStyle(DefaultFont,HorizDir,1);
OutTextXY((WinBX+WinEX) Div 2,WinBY+TH*3,St1);
OutTextXY((WinBX+WinEX) Div 2,WinBY+TH*5,St2);

Case NumIcon Of
  1: Begin
     Icone^[IcnOk].X := (WinBX+WinEX) Div 2-19;
     Icone^[IcnOk].Y := WinEY-15-TH*2;
     With Icone^[IcnOk] Do
       PutImage(x,y,Icn^,NormalPut);
     End;
  2: Begin
     Icone^[IcnSi].X := (WinBX+WinEX) Div 2-38-15;
     Icone^[IcnSi].Y := WinEY-15-TH*2;
     Icone^[IcnNo].X := (WinBX+WinEX) Div 2+15;
     Icone^[IcnNo].Y := Icone^[IcnSi].Y;
     With Icone^[IcnSi] Do
       PutImage(x,y,Icn^,NormalPut);
     With Icone^[IcnNo] Do
       PutImage(x,y,Icn^,NormalPut);
     End;
 End;

EsciWin := False;
Sel := 1;
OldSel := 0;
Repeat

  If (Sel <> OldSel)
    Then
      Begin
      WriteRect(OldSel,cBkWarning);
      WriteRect(Sel,Black);
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

  OldSel := Sel;
  If LeftButton
    Then
      Begin
      Case NumIcon Of
        1: With Icone^[IcnOk] Do
             If MouseInG(x,y,x+39,y+14)
               Then
                 If PremiPulsante(x,y,Icn,LeggiFile,IcnOk,SiAttesa,cBkWarning)
                   Then
                     Begin
                     EsciWin := True;
                     Warning := True;
                     End;
        2: With Icone^[IcnSi] Do
             If MouseInG(x,y,x+39,y+14)
               Then
                 Begin
                 If PremiPulsante(x,y,Icn,LeggiFile,IcnSi,SiAttesa,cBkWarning)
                   Then
                     Begin
                     EsciWin := True;
                     Warning := True;
                     End;
                 End
           Else
             With Icone^[IcnNo] Do
               If MouseInG(x,y,x+39,y+14)
                 Then
                   If PremiPulsante(x,y,Icn,LeggiFile,IcnNo,SiAttesa,cBkWarning)
                     Then
                       Begin
                       EsciWin := True;
                       Warning := False;
                       End;
        End;
      End
  Else
    If RightButton
      Then
        C := kEscape;

  Case C Of
    kNull: Case C2 Of
             kLeft: If (Sel > 1) Then Dec(Sel);
             kRight: If (Sel < NumIcon) Then Inc(Sel);
             End;
    's','S',
    'o','O',
    kReturn: Begin
             EsciWin := True;
             Warning := Sel = 1;
             End;
    'n','N',
    kEscape: Begin
             EsciWin := True;
             Warning := False;
             End;
    End;

Until EsciWin;

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
End; { Warning }


Procedure ReadFile ( NomeFile1: String080 );
Var F1:        FileOperation;
    F2:        FileStrings;
    R1:        RecOp;
    R2:        RecSt;
    D:         DirStr;
    N:         NameStr;
    E:         ExtStr;
    NomeFile2: String080;
    NomeFile3: String080;
    Ok:        Boolean;
    I:         Integer;
    Uscita:    Boolean;
    Primo:     Boolean;

Begin { ReadFile }
If (NomeFile1 <> StrNull)
  Then
    Begin
    FSplit(NomeFile1,D,N,E);
    Assign(F1,NomeFile1);
    {$I-} Reset(F1); {$I+}
    If (IOResult <> 0)
      Then
        Begin
        If Warning('Errore di lettura: il file '''+N+E+'''',
                   'non esiste sul disco.',1)
                     Then
                       ;
        End
    Else
      Begin
      DistruggiImmagine;
      CreaImmagine;

      NomeFile2 := D+N+'.STR';
      Assign(F2,NomeFile2);
      {$I-} Reset(F2); {$I+}
      Ok := IOResult = 0;
      Uscita := False;

      If (Not Ok)
        Then
          Begin
          Uscita := True;
          If Warning('Errore di lettura: il file '''+N+'.STR''',
                     'non ä un file dati valido.',1)
                       Then
                         ;
          End;

      If (Not Uscita)
        Then
          Begin
          i := 1;
          { Riempimento stringhe .... }
          While (Not EOF(F2)) And (Not Uscita) Do
            Begin
            If Ok Then
              Begin
              {$I-} Read(F2,R2); {$I+}
              If (IOResult <> 0)
                Then
                  Begin
                  Uscita := True;
                  If Warning('Errore di lettura: il file '''+N+'.STR''',
                             'non ä un file dati valido.',1)
                               Then
                                 ;
                  Ok := False;
                  End;
              End;
            If (Not Ok)
              Then
                With R2 Do
                  Begin
                  St := StrNull;
                  Num := i;
                  End;
            InserisciStringa(R2.St);
            Inc(i);
            End;
          Close(F2);

          { Lettura immagine }
          Uscita := False;
          Primo := True;
          While (Not EOF(F1)) And (Not Uscita) Do
            Begin
            {$I-} Read(F1,R1); {$I+}
            If (IOResult <> 0)
              Then
                Begin
                Uscita := True;
                If Warning('Errore di lettura: il file '''+N+E+'''',
                           'non ä un file immagine.',1)
                             Then
                               ;
                DistruggiImmagine;
                CreaImmagine;
                End
            Else
              Begin
              With R1 Do
                If Primo
                  Then
                    Begin
                    ColorImage := LineSt;
                    Primo := False;
                    End
                Else
                  InserisciFigura(Figura,LineSt,LinePt,LineTh,ColLin,Retino,
                                  ColRet,Word1,Word2,Word3,Word4,Word5,Word6);
              End;
            End;
          End;
      Close(F1);

      DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);

      NomeFile3 := N+'.PAL';
      ReadPalette(NomeFile3);

      End;

    End;
End; { ReadFile }


Procedure WriteFile ( NomeFile1: String080 );
Var F1:        FileOperation;
    F2:        FileStrings;
    R1:        RecOp;
    R2:        RecSt;
    D:         DirStr;
    N:         NameStr;
    E:         ExtStr;
    NomeFile2: String080;
    NomeFile3: String080;
    Over1:     Boolean;
    Over2:     Boolean;
    AppSt:     PTRStrings;
    AppOp:     PTROperation;
    Uscita:    Boolean;
    Primo:     Boolean;

Begin { WriteFile }
If (NomeFile1 <> StrNull)
  Then
    Begin
    Over1 := True;
    FSplit(NomeFile1,D,N,E);
    Assign(F1,NomeFile1);
    {$I-} Reset(F1); {$I+}
    If (IOResult = 0)
      Then
        Begin
        Close(F1);
        Over1 := Warning('Il file '''+N+E+''' esiste sul disco,',
                         ' devo sovrascriverlo ?',2);
        End;
    If Over1
      Then
        Begin
        NomeFile2 := D+N+'.STR';
        Over2 := True;
        Assign(F2,NomeFile2);
        {$I-}
        Reset(F2);
        {$I+}
        If (IOResult = 0)
          Then
            Begin
            Close(F2);
            Over2 := Warning('Il file esiste '''+N+'.STR'' esiste giÖ sul disco,',
                             'devo sovrascriverlo ?',2);
            If Not Over2
              Then
                If Warning('Il file '''+N+E+''' non ä stato salvato,',
                           'correttamente sul disco.',1)
                             Then
                               ;
            End;

        If Over2
          Then
            Begin

            {$I-}
            ReWrite(F1);
            ReWrite(F2);
            {$I+}

            If (IOResult <> 0)
              Then
                Warning('Errore di scrittura sul disco.',
                        'Il file non ä stato salvato correttamente',1)
            Else
              Begin

              { Riempimento stringhe .... }
              Uscita := False;
              AppSt := InizioSt;
              While (AppSt <> NIL) And (Not Uscita) Do
                Begin
                With R2 Do
                  Begin
                  Num := AppSt^.St.Num;
                  St := AppSt^.St.St;
                  End;
                {$I-} Write(F2,R2); {$I+}
                If (IOResult <> 0)
                  Then
                    Begin
                    Uscita := True;
                    If Warning('Errore di scrittura sul disco: il file '''+N+'.STR''',
                               'non ä stato salvato correttamente.',1)
                                 Then
                                   ;
                    DistruggiImmagine;
                    CreaImmagine;
                    End
                Else
                  AppSt := AppSt^.Next;
                End;

              { Scrittura immagine }
              AppOp := InizioOp;
              Uscita := False;
              Primo := True;
              While (AppOp <> NIL) And (Not Uscita) Do
                Begin
                With R1 Do
                  If Primo
                    Then
                      Begin
                      Figura := fSfondoImmagine;
                      LineSt := ColorImage;
                      LinePt := NUW;
                      LineTh := NUW;
                      ColLin := NUW;
                      Retino := NUW;
                      ColRet := NUW;
                      Word1  := NUI;
                      Word2  := NUI;
                      Word3  := NUI;
                      Word4  := NUI;
                      Word5  := NUI;
                      Word6  := NUI;
                      End
                  Else
                    Begin
                    Figura := AppOp^.Op.Figura;
                    LineSt := AppOp^.Op.LineSt;
                    LinePt := AppOp^.Op.LinePt;
                    LineTh := AppOp^.Op.LineTh;
                    ColLin := AppOp^.Op.ColLin;
                    Retino := AppOp^.Op.Retino;
                    ColRet := AppOp^.Op.ColRet;
                    Word1  := AppOp^.Op.Word1;
                    Word2  := AppOp^.Op.Word2;
                    Word3  := AppOp^.Op.Word3;
                    Word4  := AppOp^.Op.Word4;
                    Word5  := AppOp^.Op.Word5;
                    Word6  := AppOp^.Op.Word6;
                    End;
                {$I-} Write(F1,R1); {$I+}
                If (IOResult <> 0)
                  Then
                    Begin
                    Uscita := True;
                    If Warning('Errore di scrittura sul disco: il file '''+N+E+'''',
                               'non ä stato salvato correttamente.',1)
                                 Then
                                   ;
                    DistruggiImmagine;
                    CreaImmagine;
                    End
                Else
                  Begin
                  If Primo
                    Then
                      Primo := False
                  Else
                    AppOp := AppOp^.Next;
                  End;
                End;

              End;

            {$I-}
            Close(F1);
            Close(F2);
            {$I+}
            NomeFile3 := N+'.PAL';
            WritePalette(NomeFile3);
            End;
        End;
    End;
End; { WriteFile }


Procedure ReadPalette ( NomeFile: String080 );
Var D:         DirStr;
    N:         NameStr;
    E:         ExtStr;
    Ok:        Boolean;
    I:         Integer;
    Uscita:    Boolean;
    F:         TipoFilePalette;
    R:         RecRGB;

Begin
If (NomeFile <> StrNull)
  Then
    Begin
    FSplit(NomeFile,D,N,E);
    Assign(F,NomeFile);
    {$I-} Reset(F); {$I+}
    If (IOResult <> 0)
      Then
        Begin
        If Warning('Errore di lettura: il file '''+N+E+'''',
                   'non esiste sul disco.',1)
                     Then
                       ;
        End
    Else
      Begin

      { Lettura colori }
      Uscita := False;
      While (Not EOF(F)) And (Not Uscita) Do
        Begin
        {$I-} Read(F,R); {$I+}
        If (IOResult <> 0)
          Then
            Begin
            Uscita := True;
            If Warning('Errore di lettura: il file '''+N+E+'''',
                       'non ä un file palette.',1)
                         Then
                           ;
            End
        Else
          Setup.Palette := R;
        End;
      Close(F);

      For i := 0 To 15 Do
        With Setup.Palette[i] Do
          SetRGBPalette(i,Red,Green,Blue);
      End;

    End;
End;


Procedure WritePalette ( NomeFile: String080 );
Var D:         DirStr;
    N:         NameStr;
    E:         ExtStr;
    F:         TipoFilePalette;
    Over:      Boolean;

Begin { WritePalette }
If (NomeFile <> StrNull)
  Then
    Begin
    Over := True;
    FSplit(NomeFile,D,N,E);
    Assign(F,NomeFile);
    {$I-} Reset(F); {$I+}
    If (IOResult = 0)
      Then
        Begin
        Close(F);
        Over := Warning('Il file '''+N+E+''' esiste sul disco,',
                        ' devo sovrascriverlo ?',2);
        End;
    If Over
      Then
        Begin
        {$I-} ReWrite(F); {$I+}

        If (IOResult <> 0)
          Then
            Warning('Errore di scrittura sul disco.',
                    'Il file non ä stato salvato correttamente',1)
        Else
          Begin

          { Scrittura colori }
          {$I-} Write(F,Setup.Palette); {$I+}
          If (IOResult <> 0)
            Then
              If Warning('Errore di scrittura sul disco: il file '''+N+E+'''',
                         'non ä stato salvato correttamente.',1)
                           Then
                             ;
          End;
        {$I-} Close(F); {$I+}
        End;
    End;
End; { WritePalette }



Procedure InputFile (     TitWin:   String;
                      Var NomeFile: String080;
                          Ext:      String003;
                          Operaz:   TipoOpFile;
                          FileView: TipoView );
Type
     TipoFrecce= Array [3..5] Of
                   Record
                   X1:        Integer;
                   Y1:        Integer;
                   X2:        Integer;
                   Y2:        Integer;
                   OldPosBar: Integer;
                   PosBar:    Integer;
                   Select:    Integer;
                   OldSelect: Integer;
                   BegLista:  Integer;
                   End;

Var IniDialX:     Integer;
    IniDialY:     Integer;
    FinDialX:     Integer;
    FinDialY:     Integer;
    Size:         Word;
    Procedi:      (Memoria,Video);
    Fin:          Pointer;
    FineX:        Integer;
    FineY:        Integer;
    Arrow:        TipoFrecce;
    I:            Integer;
    EsciFin:      Boolean;
    C:            Char;
    C2:           Char;
    Attivo:       Byte;
    OldAttivo:    Byte;
    PosNomeFile:  Byte;
    PosPercorso:  Byte;
    InsState:     Boolean;
    AppFile:      File;
    FAttr:        Word;
    NewDir:       String;
    Direct:       String;
    SaveNome:     NameStr;
    SavePercorso: String;
    SaveDrive:    Byte;
    OldDirs:      Byte;
    OldDrives:    Byte;
    SaveAttivo:   Byte;
    SaveIOResult: Integer;


     {------------------------------------------------------------------
       PROCEDURA GET.DIRS

       Questa procedura ricerca tutte le sotto-directories del path
       passato come parametro e memorizza la stringa risultante (cioä
       come verrÖ stampata sullo schermo) e il path in un vettore di
       records nello heap.
      ------------------------------------------------------------------}
     Procedure GetDirs ( Perc: PathStr );

     { Variabili locali }
     Var

         { Appoggio per il path di ricerca }
         St:         String;

         { Indice dei cicli }
         I:          Integer;

         { Posizione di un certo carattere in una certa stringa }
         Posiz:      Byte;

         { Posizione di un carattere in una stringa }
         A:          Byte;

         { Appoggio per le conversioni }
         StNumDirs:  String005;
         FinSize:    Word;
         FinPunt:    Pointer;
         FinBegX:    Integer;
         FinBegY:    Integer;
         FinEndX:    Integer;
         FinEndY:    Integer;
         Allocato:   Boolean;
         PX:         Integer;
         PY:         Integer;
         St2:        String;


          {-------------------------------------------------------------
            PROCEDURA GET.CHILDREN

            Chiamando ricorsivamente questa procedura si ottengono tutti
            i path di livello inferiore al path specificato dalla
            procedura GETDIRS.
           -------------------------------------------------------------}
          Procedure GetChildren ( Const Perc:  PathStr;
                                        Level: Byte );

          { Variabili locali }
          Var

              { Record predefinito }
              S: SearchRec;

              { Indice cicli }
              I: Byte;

          Begin { GetChildren }

          { Ricerca il primo files che corrisponde alle caratteristiche
            impostate (directory) }
          FindFirst(Perc+'\*.*', Directory, S);

          { Fino a che non si ä verificato un errore di disco }
          While (DosError = 0) Do
            Begin

            { Directory valida }
            If (((S.Attr And Directory) <> 0) And (S.Name[1] <> '.'))
              Then
                Begin

                If (NumDirs < MaxDirs)
                  Then
                    Begin

                    Inc(NumDirs);
                    If Allocato
                      Then
                        Begin
                        WaitToWrite;
                        HideMouse;
                        Bar(Px-TW*3,Py-TH,PX+TW*3,Py+TH);
                        Str(NumDirs,St2);
                        OutTextXY(Px,Py,'('+St2+')');
                        ShowMouse;
                        End;

                    { Forma la stringa di presentazione }
                    With Dirs^[NumDirs] Do
                      Begin

                      Line := StrNull;
                      For i := 1 To (Level-1) Do
                        Line := Line+'   ';
                      Line := Line+'¿ƒƒ'+S.Name;

                      Path := Perc+'\'+S.Name;
                      D := S;
                      End;


                    { Calcola la posizione che interessa (intersezione) }
                    Posiz := (Level-1)*3+1;

                    { Se ci sono pió di 2 directories ... }
                    If (NumDirs > 2)
                      Then

                        { Aggiusta il carattere di intersezione }
                        With Dirs^[NumDirs-1] Do
                          If (Line[Posiz] = '¿')
                            Then
                              Line[Posiz] := '√';
                    { Sempre oltre 2 directories ... }
                    If (NumDirs > 2)
                      Then
                        Begin

                        { Aggiusta i vari collegamenti con le altre
                          directory di grado superiore }
                        i := NumDirs;
                        While (Dirs^[i-1].Line[Posiz] = kSpazio) Do
                          Begin
                          Dirs^[i-1].Line[Posiz] := '≥';
                          Dec(i);
                          End;

                        End;
                End;

              { Chiamata ricorsiva }
              GetChildren(Perc+'\'+S.Name,Level+1);
              End;

            { Continua con la ricerca della prossima directory }
            FindNext(S);

            End;

          End; { GetChildren }


     Begin { GetDirs }

     { Inizializzazioni }
     For i := 1 To Length(Perc) Do
       Perc[i] := UpCase(Perc[i]);
     Perc := FExpand(Perc);
     NumDirs := 1;
     With Dirs^[NumDirs] Do
       Begin
       Line := Perc;
       Path := Perc;
       D.Name := Perc;
       D.Size := 0;
       D.Attr := Directory;
       D.Time := 0;
       End;
     {Inc(NumDirs);}
     St := Perc;
     If (St[Length(St)] = '\')
       Then
         Dec(St[0]);

     FinBegX := FineX Div 2-TW*23;
     FinBegY := FineY Div 2-TH*3;
     FinEndX := FineX Div 2+TW*23;
     FinEndY := FineY Div 2+TH*3;
     FinSize := ImageSize(FinBegX,FinBegY,FinEndX+Shadow,FinEndY+Shadow);
     Allocato := False;
     If (FinSize > 0) And (MemAvail > FinSize)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         GetMem(FinPunt, FinSize);
         GetImage(FinBegX,FinBegY,FinEndX+Shadow,FinEndY+Shadow,FinPunt^);
         Allocato := True;
         SetFillPattern(MyFill,LightRed);
         SetFillStyle(UserFill,LightRed);
         Bar(FinBegX+Shadow,FinBegY+Shadow,FinEndX+Shadow,FinEndY+Shadow);
         SetFillStyle(SolidFill,Red);
         Bar(FinBegX,FinBegY,FinEndX,FinEndY);
         SetColor(Cyan);
         Rectangle(FinBegX,FinBegY,FinEndX,FinEndY);
         Rectangle(FinBegX+1,FinBegY+1,FinEndX-1,FinEndY-1);
         SetColor(Yellow);
         SetTextJustify(CenterText,CenterText);
         OutTextXY((FinBegX+FinEndX) Div 2,(FinBegY+FinEndY) Div 2,
                   'Lettura del disco in corso ...   ( )  ');
         Px := (FinBegX+FinEndX) Div 2+TW*16;
         Py := (FinBegY+FinEndY) Div 2;
         SetColor(LightGreen);
         ShowMouse;
         End;

     { Prima chiamata alla procedura }
     GetChildren(St,1);

     { Aggiusta la lista in memoria }
     For i := 2 To NumDirs Do
       Begin

       { Posizione del carattere di fine }
       A := Pos('¿',Dirs^[i-1].Line);
       If (A <> 0)
         Then
           If (Dirs^[i].Line[A] = '≥')
             Then
               Dirs^[i-1].Line[A] := '√';
       End;

     If Allocato
       Then
         Begin
         WaitToWrite;
         HideMouse;
         PutImage(FinBegX,FinBegY,FinPunt^,NormalPut);
         FreeMem(FinPunt,FinSize);
         ShowMouse;
         End;
     End; { GetDirs }


     {-----------------------------------------------------------------------
       PROCEDURA: ORDINA.DIRECTORY

       Ordina il vettore di stringhe DIRINFO secondo il nome e l' estensione
       del file: a paritÖ di questi secondo la lunghezza del file,
       la data e l' ora dell' ultimo aggiornamento e il tipo di
       attributo. Dato che per le directories si sono utilizzati i
       caratteri di freccia su (codice ASCII 30) e freccia gió (codice
       ASCII 31), verranno all' inizio della lista.
       Il tipo di ordinamento usato ä il bubble-sort, il pió semplice e
       il pió diffuso. Non si sono utilizzati invece ordinamenti come
       il quick-sort, un metodo di ordinamento molto veloce, o il
       merge-sort (pió veloce), per motivi di insufficiente memoria di
       heap (la ricorsione ä infatti molto pericolosa a tale proposito).
       Descrivo comunque sommariamente i metodi accennati:

       - Bubble-Sort: ordina la lista di nomi confrontando il primo con
		      il secondo, il secondo con il terzo, ecc. Ad ogni
		      scansione di tutti i nomi, il primo elemento ä
		      senz' altro il pió piccolo. Quindi, per effettuare
		      il vero e proprio ordinamento, occorre far eseguire
		      queste operazioni N volte, dove N ä il numero
		      di stringhe da ordinare.

       - Quick-Sort: utilizza la tecnica della ricorsione, suddividendo il
		     problema in sottoproblemi successivi. Se, ad esempio,
		     si deve ordinare una lista di 10 stringhe, la procedura
		     esegue l' ordinamento di due liste da 5 elementi, poi
		     quello di liste da 2 e 3 elementi e in seguito da 1 e 2.
		     Una volta giunti a quelle di uno, l' elemento ä
		     ordinato; passati a quelle di due, basta stabilire quale
		     ä il pió grande e cosç via.

       - Merge-Sort: ä pió veloce ma vuole un vettore di appoggio delle
		     stesse dimensioni, e quindi uno spreco inutile di
		     memoria.

       VET ä il vettore da ordinare, INF ä l' estremo inferiore e SUP ä
       quello superiore. La chiamata originaria sarÖ quindi

       OrdinaFiles ( DIRINFO^, 1, NUMFILES ),

       dove DIRINFO^ ä il puntatore all' array delle stringhe, memorizzate
       nello heap; 1 ä il primo elemento e NUMFILES ä il numero di files
       della directory scelta.

       Non serve capire a fondo l' algoritmo, in quanto questo ä uno di
       quei programmi per l' ordinamento che bisogna 'prendere cosç come
       sono': vengono imparati e memorizzati; quando capiterÖ di
       doverli riutilizzare in altri programmi basta copiare le parti
       necessarie per il funzionamento della procedura.
      -----------------------------------------------------------------------}
     Procedure OrdinaFiles ( Var Vet: PTRFiles;
		                 Inf: Word;
			         Sup: Word );

     { Variabili locali }
     Var

         { Appoggio per le conversioni }
         StFiles: String;
         FinSize:    Word;
         FinPunt:    Pointer;
         FinBegX:    Integer;
         FinBegY:    Integer;
         FinEndX:    Integer;
         FinEndY:    Integer;
         Allocato:   Boolean;
         PX:         Integer;
         PY:         Integer;


          Procedure MergeSort  ( Var Vet: PTRFiles;
                                     Inf: Integer;
                                     Sup: Integer  );
          Var
            Middle:   Integer;
            I:        Integer;
            J:        Integer;
            K:        Integer;
          Begin { MergeSort }
          If Inf < Sup Then
            Begin

            { Calcolo metÖ }
            Middle := (Inf+Sup) Div 2;

            If Allocato
              Then
                Begin
                WaitToWrite;
                HideMouse;
                Bar(Px-TW*3,Py-TH,PX+TW*3,Py+TH);
                Str(Inf,StFiles);
                OutTextXY(Px,Py,'('+StFiles+')');
                ShowMouse;
                End;

            { Chiamate ricorsive ai 2 sotto-vettori }
            MergeSort(Vet,Inf,Middle);
            MergeSort(Vet,Middle+1,Sup);

            { Fusione dei 2 vettori }
            i := Inf;
            j := Middle+1;
            k := 0;
            While (i <= Middle) And (j <= Sup) Do
              If Vet^[i].Name < Vet^[j].Name Then
                Begin
                k := k+1;
                AppFiles^[k].Name := Vet^[i].Name;
                i := i+1;
                End
              Else
                Begin
                k := k+1;
                AppFiles^[k].Name := Vet^[j].Name;
                j := j+1;
                End;
            If i > Middle Then
              For i := j To Sup Do
                Begin
                k := k+1;
                AppFiles^[k].Name := Vet^[i].Name;
                End
            Else
              For j := i To Middle Do
                Begin
                k := k+1;
                AppFiles^[k].Name := Vet^[j].Name;
                End;
            For i := 1 To k Do
              Vet^[i+Inf-1].Name := AppFiles^[i].Name;
            End;
          End; { MergeSort }


     Begin { OrdinaFiles }

     FinBegX := FineX Div 2-TW*23;
     FinBegY := FineY Div 2-TH*3;
     FinEndX := FineX Div 2+TW*23;
     FinEndY := FineY Div 2+TH*3;
     FinSize := ImageSize(FinBegX,FinBegY,FinEndX+Shadow,FinEndY+Shadow);
     Allocato := False;
     If (FinSize > 0) And (MemAvail > FinSize)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         GetMem(FinPunt, FinSize);
         GetImage(FinBegX,FinBegY,FinEndX+Shadow,FinEndY+Shadow,FinPunt^);
         Allocato := True;
         SetFillPattern(MyFill,LightRed);
         SetFillStyle(UserFill,LightRed);
         Bar(FinBegX+Shadow,FinBegY+Shadow,FinEndX+Shadow,FinEndY+Shadow);
         SetFillStyle(SolidFill,Red);
         Bar(FinBegX,FinBegY,FinEndX,FinEndY);
         SetColor(Cyan);
         Rectangle(FinBegX,FinBegY,FinEndX,FinEndY);
         Rectangle(FinBegX+1,FinBegY+1,FinEndX-1,FinEndY-1);
         SetColor(Yellow);
         SetTextJustify(CenterText,CenterText);
         OutTextXY((FinBegX+FinEndX) Div 2,(FinBegY+FinEndY) Div 2,
                   'Ordinamento files in corso ...   ( )  ');
         Px := (FinBegX+FinEndX) Div 2+TW*16;
         Py := (FinBegY+FinEndY) Div 2;
         SetColor(LightGreen);
         ShowMouse;
         End;


     MergeSort(Vet,1,NumFiles);

     If Allocato
       Then
         Begin
         WaitToWrite;
         HideMouse;
         PutImage(FinBegX,FinBegY,FinPunt^,NormalPut);
         FreeMem(FinPunt,FinSize);
         ShowMouse;
         End;

     End; { OrdinaFiles }


(*
	  {------------------------------------------------------------------
	    PROCEDURA: SCAMBIA

	    Questa procedura serve per scambiare il contenuto delle due
	    stringhe passate come parametri.
	   ------------------------------------------------------------------}
	  Procedure Scambia( Var Elem1: SearchRec;
			     Var Elem2: SearchRec );

	  { Variabili locali }
	  Var

	      { Elemento di appoggio per lo scambio }
	      Elem3: SearchRec;

	  Begin { Scambia }

	  { Scambio dei contenuti }
	  Elem3 := Elem2;
	  Elem2 := Elem1;
	  Elem1 := Elem3;

	  End; { Scambia }


     Begin { OrdinaFiles }

     FinBegX := FineX Div 2-TW*23;
     FinBegY := FineY Div 2-TH*3;
     FinEndX := FineX Div 2+TW*23;
     FinEndY := FineY Div 2+TH*3;
     FinSize := ImageSize(FinBegX,FinBegY,FinEndX+Shadow,FinEndY+Shadow);
     Allocato := False;
     If (FinSize > 0) And (MemAvail > FinSize)
       Then
         Begin
         WaitToWrite;
         HideMouse;
         GetMem(FinPunt, FinSize);
         GetImage(FinBegX,FinBegY,FinEndX+Shadow,FinEndY+Shadow,FinPunt^);
         Allocato := True;
         SetFillPattern(MyFill,LightRed);
         SetFillStyle(UserFill,LightRed);
         Bar(FinBegX+Shadow,FinBegY+Shadow,FinEndX+Shadow,FinEndY+Shadow);
         SetFillStyle(SolidFill,Red);
         Bar(FinBegX,FinBegY,FinEndX,FinEndY);
         SetColor(Cyan);
         Rectangle(FinBegX,FinBegY,FinEndX,FinEndY);
         Rectangle(FinBegX+1,FinBegY+1,FinEndX-1,FinEndY-1);
         SetColor(Yellow);
         SetTextJustify(CenterText,CenterText);
         OutTextXY((FinBegX+FinEndX) Div 2,(FinBegY+FinEndY) Div 2,
                   'Ordinamento files in corso ...   ( )  ');
         Px := (FinBegX+FinEndX) Div 2+TW*16;
         Py := (FinBegY+FinEndY) Div 2;
         SetColor(LightGreen);
         ShowMouse;
         End;


     { Ciclo pió esterno }
     For i := Inf To Sup Do

       Begin

       { Ciclo pió interno }
       For j := i To Sup Do

	 { Se l' ordine degli elementi ä sbagliato ... }
	 If (Vet^[i].Name > Vet^[j].Name)

	   Then

	     { ... scambia i due elementi }
	     Scambia(Vet^[i],Vet^[j]);

       If Allocato
         Then
           Begin
           WaitToWrite;
           HideMouse;
           Bar(Px-TW*3,Py-TH,PX+TW*3,Py+TH);
           Str(i,StFiles);
           OutTextXY(Px,Py,'('+StFiles+')');
           ShowMouse;
           End;

       End;

     If Allocato
       Then
         Begin
         WaitToWrite;
         HideMouse;
         PutImage(FinBegX,FinBegY,FinPunt^,NormalPut);
         FreeMem(FinPunt,FinSize);
         ShowMouse;
         End;

     End; { OrdinaFiles }
*)


     Procedure InitFiles;
     Var AppFile: SearchRec;
     Begin { InitFiles }
     NumFiles := 0;
     FindFirst(FExpand(NomeFile),Archive,AppFile);
     While (DosError = 0) Do
       Begin
       If (AppFile.Attr = Archive)
         Then
           Begin
           If (NumFiles < MaxFiles)
             Then
               Begin
               Inc(NumFiles);
               Files^[NumFiles] := AppFile;
               Arrow[3].Select := 1;
               End;
           End;
       FindNext(AppFile);
       End;
     OrdinaFiles(Files,1,NumFiles);
     End; { InitFiles }


     Procedure TrovaDir;
     Var I: Integer;
         Trovato: Boolean;
     Begin { TrovaDir }
     i := 1;
     Trovato := False;
     If (Arrow[4].Select <= 0)
       Then
         Arrow[4].Select := 1;
     Repeat
       If (i <= NumDirs)
         Then
           If (Dirs^[i].Path = Percorso)
             Then
               Begin
               Arrow[4].Select := i;
               Trovato := True;
               End;
       Inc(i);
     Until Trovato Or (i > NumDirs) Or (i > MaxDirs);
     If (Arrow[4].Select > 13)
       Then
         Arrow[4].BegLista := Arrow[4].Select-13;
     End; { TrovaDir }


     Procedure InitDirs;
     Var D:       DirStr;
         N:       NameStr;
         E:       ExtStr;
         Trovato: Boolean;
         App:     PTRRecFileDir;
     Begin { InitDirs }
     New(App);

     {$I-} ChDir(Direct); {$I+}

     {$I-} Reset(FileDir); {$I+}
     If (IOResult <> 0)
       Then
         {$I-} ReWrite(FileDir); {$I+}
     {$I-} Close(FileDir); {$I+}

     {$I-} ChDir(Direct); {$I+}
     {$I-} Reset(FileDir); {$I+}
     Trovato := False;
     While ((Not EOF(FileDir)) And (Not Trovato)) Do
       Begin
       Read(FileDir,App^);
       If (App^.Drive = Drive)
         Then
           Trovato := True;
       End;
     Close(FileDir);

     Arrow[4].Select := 1;
     If (Trovato And (Drive <> 1) And (Drive <> 2))
       Then
         Begin
         Dirs^ := App^.Directories;
         Drive := App^.Drive;
         NumDirs := App^.NumDirs;
         End
     Else
       Begin
       {$I-} ChDir(NewDir); {$I+}
       FSplit(FExpand(NomeFile),D,N,E);      (*********************************)
       {$I-} ChDir(Direct); {$I+}
       Drive := Ord(D[1])-64;
       GetDirs(Copy(D,1,3));
       {$I-} ChDir(Direct); {$I+}
       {$I-} Reset(FileDir); {$I+}
       While (Not EOF(FileDir)) Do
         Read(FileDir,App^);
       App^.Directories := Dirs^;
       App^.Drive := Drive;
       App^.NumDirs := NumDirs;
       Write(FileDir,App^);
       Close(FileDir);
       Percorso := D;
       End;

     TrovaDir;

     Dispose(App);
     End; { InitDirs }


     Procedure InitDrives;
     Var D:       DirStr;
         N:       NameStr;
         E:       ExtStr;
     Begin { InitDrives }
     FSplit(FExpand(NomeFile),D,N,E);
     Drive := Ord(D[1])-64;
     Arrow[5].Select := Drive;
     End; { InitDrives }


     Procedure AggiornaPosizione ( Quale: Byte );
     Begin { AggiornaPosizione }
     WaitToWrite;
     HideMouse;
     With Arrow[Quale] Do
       If (OldPosBar <> PosBar)
         Then
           Begin
           WaitToWrite;
           HideMouse;
           If (OldPosBar > 0)
             Then
               Begin
               SetFillStyle(SolidFill,cBkBarLine);
               Bar(X1,Y1+14+OldPosBar,X1+14,OldPosBar+14);
               End;
           PutImage(X1,Y1+14+PosBar,Icone^[IcnCursorBar].Icn^,NormalPut);
           ShowMouse;
           End;
     ShowMouse;
     End; { AggiornaPosizione }


     Procedure WriteNomeFile ( Evid: Boolean );
     Var X1, X2, Y1, Y2, F: Integer;
         Col1, Col2: Byte;
         D: DirStr;
         N: NameStr;
         E: ExtStr;
     Begin { WriteNomeFile }
     X1 := TW;
     Y1 := TH*3;
     X2 := TW*66;
     Y2 := TH*5;
     F := X1+TW*(Length('Nome file')+2);
     If Evid
       Then
         Begin
         Col1 := cBkEditColorSel;
         Col2 := cEditColorSel;
         End
     Else
       Begin
       Col1 := cBkSmallDialog;
       Col2 := cEditColor;
       End;
     SetFillStyle(SolidFill,Col1);
     NomeFile := FExpand(NomeFile);
     FSplit(NomeFile,D,N,E);
     NomeFile := N+E;
     If (Length(NomeFile) > 52)
       Then
         NomeFile[0] := #52;
     WaitToWrite;
     HideMouse;
     Bar(F+1,Y1+1,X2-1,Y2-1);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     SetColor(Col2);
     OutTextXY(F+TW,Y1+TH,NomeFile);
     If Evid
       Then
         WriteCursor(F+TW*PosNomeFile,F+TW*PosNomeFile,Y2-3,InsState);
     ShowMouse;
     End; { WriteNomeFile }


     Procedure WritePercorso ( Evid: Boolean );
     Var X1, X2, Y1, Y2, F: Integer;
         Col1, Col2: Byte;
     Begin { WritePercorso }
     X1 := TW;
     Y1 := TH*6;
     X2 := TW*66;
     Y2 := TH*8;
     F := X1+TW*(Length('Percorso ')+2);
     If Evid
       Then
         Begin
         Col1 := cBkEditColorSel;
         Col2 := cEditColorSel;
         End
     Else
       Begin
       Col1 := cBkSmallDialog;
       Col2 := cEditColor;
       End;
     If Length(Percorso) > 52
       Then
         Percorso[0] := #52;
     WaitToWrite;
     HideMouse;
     SetFillStyle(SolidFill,Col1);
     Bar(F+1,Y1+1,X2-1,Y2-1);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     SetColor(Col2);
     AddBackSlash(Percorso);
     OutTextXY(F+TW,Y1+TH,Percorso);

     If Evid
       Then
         WriteCursor(F+TW*PosPercorso,F+TW*PosPercorso,Y2-3,InsState);
     ShowMouse;
     End; { WritePercorso }


     Procedure WriteFiles ( Aggiorna: Boolean;
                            Evid:     Boolean );
     Var NX1, NX2, NY1, NY2, App, I, BL: Integer;
         St: String;
         Col1, Col2: Byte;
     Begin { WriteFiles }
     With Arrow[3] Do
       If (Select < BegLista)
         Then
           BegLista := Select
       Else
         If (Select > BegLista+12)
           Then
             BegLista := Select-12;
     BL := Arrow[3].BegLista;
     nX1 := TW;
     nY1 := TH*11;
     nX2 := TW*18;
     nY2 := TH*24;
     WaitToWrite;
     HideMouse;
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     SetColor(cEditColor);
     If Aggiorna
       Then
         For i := 1 To 13 Do
           Begin
           App := nY1+(i-1)*TH;
           Bar(nX1+1,App+1,nX2-17,App+TH);
           If (NumFiles >= (i-1+BL))
             Then
               OutTextXY(nX1+1+TH,App+TH Div 2+1,Files^[i-1+BL].Name);
           End;
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
     With Arrow[3] Do
       Begin
       If (OldSelect In [BegLista..BegLista+13])
         Then
           If (NumFiles >= OldSelect) And (NumFiles > 0)
             Then
               Begin
               App := nY1+(OldSelect-BL)*TH;
               SetFillStyle(SolidFill,cBkSmallDialog);
               Bar(nX1+1,App+1,nX2-17,App+TH);
               SetColor(cEditColor);
               OutTextXY(nX1+1+TH,App+TH Div 2+1,Files^[OldSelect].Name);
               End;

       If (NumFiles >= Select) And (NumFiles > 0)
         Then
           Begin
           SetFillStyle(SolidFill,Col1);
           SetColor(Col2);
           App := nY1+(Select-BL)*TH;
           Bar(nX1+1,App+1,nX2-17,App+TH);
           OutTextXY(nX1+1+TH,App+TH Div 2+1,Files^[Select].Name);
           End;
       End;
     SetColor(cDialogBord);
     Line(nX1,nY2+1,nX2,nY2+1);
     SetFillStyle(SolidFill,cBkSmallDialog);
     If Aggiorna
       Then
         Begin
         Bar(nX1+1,nY2+2,nX2-1,nY2+TH*2-1);
         SetColor(cInfoColor);
         SetTextJustify(CenterText,CenterText);
         Str(NumFiles,St);
         OutTextXY((nX1+nX2) Div 2,nY2+TH+1,St+' Totali');
         End;
     ShowMouse;
     End; { WriteFiles }


     Procedure WriteDirs ( Aggiorna: Boolean;
                           Evid:     Boolean );
     Var NX1, NX2, NY1, NY2, App, I, BL: Integer;
         St: String;
         Col1, Col2: Byte;
         Trovato: Boolean;
     Begin { WriteDirs }
     { Aggiusta la directory per essere passata come parametro
       alla procedura CHDIR, togliendo il carattere '\' in fondo
       quando non serve }
     If (Arrow[4].OldSelect <= 0)
       Then
         Begin
         If (Percorso <> StrNull)
           Then
	     RemoveBackSlash(Percorso);
         TrovaDir;
         AddBackSlash(Percorso);
         End;

     With Arrow[4] Do
       If (Select < BegLista)
         Then
           BegLista := Select
       Else
         If (Select > BegLista+12)
           Then
             BegLista := Select-12;
     BL := Arrow[4].BegLista;
     nX1 := TW*19;
     nY1 := TH*11;
     nX2 := TW*41;
     nY2 := TH*24;
     WaitToWrite;
     HideMouse;
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     SetColor(cEditColor);
     If Aggiorna
       Then
         For i := 1 To 13 Do
           Begin
           App := nY1+(i-1)*TH;
           Bar(nX1+1,App+1,nX2-17,App+TH);
           If (NumDirs >= (i-1+BL))
             Then
               OutTextXY(nX1+1+TH,App+TH Div 2+1,Dirs^[i-1+BL].Line);
           End;
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
     With Arrow[4] Do
       Begin
       If (OldSelect In [BegLista..BegLista+13])
         Then
           If (NumDirs >= OldSelect) And (NumDirs > 0)
             Then
               Begin
               App := nY1+(OldSelect-BL)*TH;
               SetFillStyle(SolidFill,cBkSmallDialog);
               Bar(nX1+1,App+1,nX2-17,App+TH);
               SetColor(cEditColor);
               OutTextXY(nX1+1+TH,App+TH Div 2+1,Dirs^[OldSelect].Line);
               End;

       If (NumDirs >= Select) And (NumDirs > 0)
         Then
           Begin
           SetFillStyle(SolidFill,Col1);
           SetColor(Col2);
           App := nY1+(Select-BL)*TH;
           Bar(nX1+1,App+1,nX2-17,App+TH);
           OutTextXY(nX1+1+TH,App+TH Div 2+1,Dirs^[Select].Line);
           End;
       End;
     SetColor(cDialogBord);
     Line(nX1,nY2+1,nX2,nY2+1);
     If Aggiorna
       Then
         Begin
         SetFillStyle(SolidFill,cBkSmallDialog);
         Bar(nX1+1,nY2+2,nX2-1,nY2+TH*2-1);
         SetColor(cInfoColor);
         SetTextJustify(CenterText,CenterText);
         Str(NumDirs,St);
         OutTextXY((nX1+nX2) Div 2,nY2+TH+1,St+' Totali');
         End;
     ShowMouse;
     End; { WriteDirs }


     Procedure WriteDrives ( Aggiorna: Boolean;
                             Evid:     Boolean );
     Var NX1, NX2, NY1, NY2, App, I, BL: Integer;
         St: String;
         Col1, Col2: Byte;
     Begin { WriteDrives }
     With Arrow[5] Do
       If (Select < BegLista)
         Then
           BegLista := Select
       Else
         If (Select > BegLista+14)
           Then
             BegLista := Select-14;
     BL := Arrow[5].BegLista;
     nX1 := TW*42;
     nY1 := TH*11;
     nX2 := TW*49;
     nY2 := TH*24;
     WaitToWrite;
     HideMouse;
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     SetColor(cEditColor);
     If Aggiorna
       Then
         For i := 1 To 15 Do
           Begin
           App := nY1+(i-1)*TH;
           Bar(nX1+1,App+1,nX2-17,App+TH);
           If (26 >= (i-1+BL))
             Then
               OutTextXY(nX1+1+TH,App+TH Div 2+1,' '+Chr(i-1+BL+64)+':');
           End;
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
     With Arrow[5] Do
       Begin
       If (OldSelect In [BegLista..BegLista+13])
         Then
           If (26 >= Select)
             Then
               Begin
               App := nY1+(OldSelect-BL)*TH;
               SetFillStyle(SolidFill,cBkSmallDialog);
               Bar(nX1+1,App+1,nX2-17,App+TH);
               SetColor(cEditColor);
               OutTextXY(nX1+1+TH,App+TH Div 2+1,' '+Chr(OldSelect+64)+':');
               End;

       If (26 >= Select)
         Then
           Begin
           SetFillStyle(SolidFill,Col1);
           SetColor(Col2);
           App := nY1+(Select-BL)*TH;
           Bar(nX1+1,App+1,nX2-17,App+TH);
           OutTextXY(nX1+1+TH,App+TH Div 2+1,' '+Chr(Select+64)+':');
           End;
       End;

     SetColor(cDialogBord);
     Line(nX1,nY2+16,nX2,nY2+16);
     ShowMouse;
     End; { WriteDrives }


     Procedure WriteViewFile;
     Begin { WriteViewFile }
     End; { WriteViewFile }


     Procedure WriteSpecFile;
     Var X1, X2, Y1, Y2, App, I: Integer;
         St: String;
         DT: DateTime;
         St1,
         St2,
         St3,Global1,Global2: String;
     Begin { WriteSpecFile }
     Global1 := 'Nessun file selezionato!';
     Global2 := '';
     X1 := TW;
     Y1 := TH*29;
     X2 := TW*41;
     Y2 := TH*32;
     If (Arrow[3].Select > 0) And (NumFiles > 0)
       Then
         With Files^[Arrow[3].Select] Do
           Begin
           Global1 := Name;
           UnPackTime(Time,DT);
           Str(DT.Day:2,St1);
           If St1[1] = kSpazio Then St1[1] := '0';
           Str(DT.Month:2,St2);
           If St2[1] = kSpazio Then St2[1] := '0';
           Str(DT.Year:4,St3);
           If St3[1] = kSpazio Then St3[1] := '0';
           Global1 := Global1+', '+St1+'-'+St2+'-'+St3;
           Str(DT.Hour:2,St1);
           If St1[1] = kSpazio Then St1[1] := '0';
           Str(DT.Min:2,St2);
           If St2[1] = kSpazio Then St2[1] := '0';
           Str(DT.Sec:2,St3);
           If St3[1] = kSpazio Then St3[1] := '0';
           Global1 := Global1+', '+St1+':'+St2+':'+St3+',';

           Str(Size,St1);
           St2 := '----';
           If (Attr And ReadOnly) <> 0  Then St2[3] := 'R';
           If (Attr And Hidden) <> 0    Then St2[1] := 'H';
           If (Attr And SysFile) <> 0   Then St2[4] := 'S';
           If (Attr And VolumeID) <> 0  Then St2 := '<VOLUME>';
           If (Attr And Directory) <> 0 Then St2 := '<DIRECTORY>';
           If (Attr And Archive) <> 0   Then St2[2] := 'A';
           Global2 := St1+' Bytes, '+St2;
           End;

     WaitToWrite;
     HideMouse;
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     SetColor(cInfoColor);
     Bar(X1+1,Y1+1,X2-1,Y2-1);
     OutTextXY(X1+1+TH,Y1+TH Div 2+3,Global1);
     OutTextXY(X1+1+TH,Y1+TH+TH Div 2+5,Global2);
     ShowMouse;
     End; { WriteSpecFile }


     Procedure WriteSpecDir;
     Var X1, X2, Y1, Y2, App, I: Integer;
         St: String;
         DT: DateTime;
         St1,
         St2,
         St3,Global1,Global2: String;
     Begin { WriteSpecDir }
     Global1 := 'Nessuna directory selezionata!';
     Global2 := '';
     X1 := TW;
     Y1 := TH*35;
     X2 := TW*41;
     Y2 := TH*38;
     If (Arrow[4].Select > 0) And (NumDirs > 0)
       Then
         With Dirs^[Arrow[4].Select].D Do
           Begin
           Global1 := Name;
           UnPackTime(Time,DT);
           Str(DT.Day:2,St1);
           If St1[1] = kSpazio Then St1[1] := '0';
           Str(DT.Month:2,St2);
           If St2[1] = kSpazio Then St2[1] := '0';
           Str(DT.Year:4,St3);
           If St3[1] = kSpazio Then St3[1] := '0';
           Global1 := Global1+', '+St1+'-'+St2+'-'+St3;
           Str(DT.Hour:2,St1);
           If St1[1] = kSpazio Then St1[1] := '0';
           Str(DT.Min:2,St2);
           If St2[1] = kSpazio Then St2[1] := '0';
           Str(DT.Sec:2,St3);
           If St3[1] = kSpazio Then St3[1] := '0';
           Global1 := Global1+', '+St1+':'+St2+':'+St3+',';

           Str(Size,St1);
           St2 := '----';
           If (Attr And ReadOnly) <> 0  Then St2[3] := 'R';
           If (Attr And Hidden) <> 0    Then St2[1] := 'H';
           If (Attr And SysFile) <> 0   Then St2[4] := 'S';
           If (Attr And VolumeID) <> 0  Then St2 := '<VOLUME>';
           If (Attr And Directory) <> 0 Then St2 := '<DIRECTORY>';
           If (Attr And Archive) <> 0   Then St2[2] := 'A';
           Global2 := St1+' Bytes, '+St2;
           End;
     WaitToWrite;
     HideMouse;
     SetFillStyle(SolidFill,cBkSmallDialog);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     SetColor(cInfoColor);
     Bar(X1+1,Y1+1,X2-1,Y2-1);
     OutTextXY(X1+1+TH,Y1+TH Div 2+3,Global1);
     OutTextXY(X1+1+TH,Y1+TH+TH Div 2+5,Global2);
     ShowMouse;
     End; { WriteSpecDir }


     Procedure WriteSpecView;
     Begin { WriteSpecView }
     End; { WriteSpecView }


     Procedure GestNomeFile ( C:  Char;
                              C2: Char );
     Var X1, X2, Y1, Y2, F: Integer;
         OldName: String;
         OldPosNomeFile: Byte;
         OldInsState: Boolean;
         D: DirStr;
         N: NameStr;
         E: ExtStr;
     Begin { GestNomeFile }

     X1 := TW;
     Y1 := TH*3;
     X2 := TW*66;
     Y2 := TH*5;
     F := X1+TW*(Length('Nome file')+2);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     OldName := NomeFile;
     OldPosNomeFile := PosNomeFile;
     OldInsState := InsState;
     Case C Of
       kNull: Case C2 Of
                kNull: If MouseInG(F+IniDialX,Y1+IniDialY,X2+IniDialX,Y2+IniDialY)
                         Then
                           Begin
                           PosNomeFile := (MouseX-IniDialX-F) Div TW;
                           If (PosNomeFile > Length(NomeFile))
                             Then
                               PosNomeFile := Length(NomeFile)+1
                           Else
                             If PosNomeFile <= 0 Then PosNomeFile := 1;
                           End;
                kUp,
                kPgUp: ;
                kDown,
                kPgDown: Attivo := 2;
                kLeft: If PosNomeFile > 1 Then Dec(PosNomeFile);
                kRight: If PosNomeFile <= Length(NomeFile) Then Inc(PosNomeFile);
                kHome: PosNomeFile := 1;
                kEnd: PosNomeFile := Length(NomeFile)+1;
                kInsert: InsState := Not InsState;
                kCancel: If (NomeFile <> '') Then
                           Delete(NomeFile,PosNomeFile,1)
                End; { Case C2 }
       kEscape: Begin
                EsciFin := True;
                NomeFile := '';
                End;
       kReturn: Begin

                SaveNome := NomeFile;
                SavePercorso := Percorso;
                SaveDrive := Drive;

(*                RemoveBackSlash(NewDir);
                {$I-} ChDir(NewDir); {$I+}
                SaveDosError := DosError;
                If (SaveDosError In [2,18])
                  Then
                    Begin
                    FSplit(FExpand(NomeFile),D,N,E);
                    NewDir := D;
                    End;
                RemoveBackSlash(NewDir);
*)
                NomeFile := FExpand(NomeFile);
                FSplit(NomeFile,D,N,E);
                Drive := Ord(D[1])-64;
                Percorso := D;
                PosNomeFile := 1;

		{ Assegnazione di un nome logico al file su disco }
		Assign(AppFile,NomeFile);
                {$I-} GetFAttr(AppFile,FAttr); {$I+}

                If (IOResult <> 0)
                  Then
                    Begin
                    Drive := SaveDrive;
                    NomeFile := SaveNome;
                    Percorso := SavePercorso;
                    End
                Else
                  Begin
{                  InitDrives;
                  InitFiles;
                  InitDirs;}
                  End;

(**)
                {SaveDosError := DosError;}
                If (DOSError In [18,2,3,15])
                  Then
                    Begin

		    { Legge i suoi attributi }
		    GetFAttr(F,FAttr);

                    { Se ä una directory, aggiusta l' immissione completandola }
   	            If (NomeFile[Length(NomeFile)] <> '\')
		      Then

  		        { Se ä una directory aggiunge il carattere '\' }
		        If ((DosError = 0) And (FAttr And Directory <> 0))
		          Then
		            NomeFile := NomeFile+'\';

                    {$I-} ChDir(NewDir); {$I+}

	            { Separa il path esteso in nome della directory, nome del
		      file, nome dell' estensione }
	            FSplit(FExpand(NomeFile),D,N,E);

	            { Aggiusta il nome }
	            If (N = StrNull)
		      Then
		        N := '*';

	            { Aggiusta l' estensione }
	            If (E = StrNull)
		      Then
		        E := '.'+Ext;

	            { Aggiorna il path alla sua scrittura completa e corretta }
	            NomeFile := D+N+E;

	            { Memorizza la directory scelta }
	            NewDir := D;
                    Percorso := D;

	            { Aggiusta la directory per essere passata come parametro
		      alla procedura CHDIR, togliendo il carattere '\' in fondo
		      quando non serve }
	            If (NewDir <> StrNull)
		      Then
                        RemoveBackSlash(NewDir);

                    {$I-} ChDir(NewDir); {$I+}
                    If (IOResult = 0)
                      Then
                        InitFiles;
                    {$I-} ChDir(NewDir); {$I+}
                    If IOResult = 0
                      Then
                        InitDrives
                    Else
                      Begin
                      Drive := SaveDrive;
                      Percorso := SavePercorso;
                      End;
                    {$I-} ChDir(Direct); {$I+}
                    If (NumFiles <= 1) And (Pos('*',NomeFile) = 0) And
                       (Pos('?',NomeFile) = 0) And
                       (Operaz In [fLeggiFile,fSalvaFile])
                         Then
                           Begin
                           EsciFin := True;
                           {$I-} ChDir(NewDir); {$I+}
                           NomeFile := FExpand(NomeFile);
                           End;
                    End;

                {$I-} ChDir(Direct); {$I+}
                If (SaveDrive <> Drive) And (SaveIOResult In [2,18,0])
                  Then
                    InitDirs;  (**)

                WriteNomeFile(True);
                WritePercorso(False);
                WriteFiles(True,False);
                WriteDirs(True,False);
                WriteDrives(True,False);
                WriteViewFile;
                WriteSpecFile;
                WriteSpecDir;
                WriteSpecView;
                End;
       kDel: If (PosNomeFile > 1) Then
               Begin
               Delete(NomeFile,PosNomeFile-1,1);
               Dec(PosNomeFile);
               End;
       Else
         If (PosNomeFile <= 52)
           Then
             Begin
             If (InsState Or (PosNomeFile > Length(NomeFile)))
               Then
                 Insert(C,NomeFile,PosNomeFile)
             Else
               If Not InsState
                 Then
                   NomeFile[PosNomeFile] := C;
             If Length(NomeFile) > 52
               Then
                 NomeFile[0] := #52;
             If PosNomeFile <= 52 Then Inc(PosNomeFile);
             End;
       End; { Case C }

     If (OldName <> NomeFile)
       Then
         Begin
         SetColor(cEditColorSel);
         SetFillStyle(SolidFill,cBkEditColorSel);
         WaitToWrite;
         HideMouse;
         Bar(F+1,Y1+1,X2-1,Y2-1);
         OutTextXY(F+TW,Y1+TH,NomeFile);
         ShowMouse;
         End;

     If (OldPosNomeFile <> PosNomeFile) Or (OldInsState <> InsState) Or
        (OldName <> NomeFile)
          Then
            WriteCursor(F+TW*OldPosNomeFile,F+TW*PosNomeFile,Y2-3,InsState);

     End; { GestNomeFile }


     Procedure GestPercorso ( C:  Char;
                              C2: Char );
     Var X1, X2, Y1, Y2, F: Integer;
         OldPercorso: String;
         OldPosPercorso: Byte;
         OldInsState: Boolean;
         D: DirStr;
         N: NameStr;
         E: ExtStr;
     Begin { GestPercorso }

     X1 := TW;
     Y1 := TH*6;
     X2 := TW*66;
     Y2 := TH*8;
     F := X1+TW*(Length('Percorso ')+2);
     SetTextStyle(DefaultFont,HorizDir,1);
     SetTextJustify(LeftText,CenterText);
     OldPercorso := Percorso;
     OldPosPercorso := PosPercorso;
     OldInsState := InsState;
     Case C Of
       kNull: Case C2 Of
                kNull: If MouseInG(F+IniDialX,Y1+IniDialY,X2+IniDialX,Y2+IniDialY)
                         Then
                           Begin
                           PosPercorso := (MouseX-IniDialX-F) Div TW;
                           If (PosPercorso > Length(Percorso))
                             Then
                               PosPercorso := Length(Percorso)+1
                           Else
                             If PosPercorso <= 0 Then PosPercorso := 1;
                           End;
                kUp,
                kPgUp: Attivo := 1;
                kDown,
                kPgDown: Attivo := 3;
                kLeft: If PosPercorso > 1 Then Dec(PosPercorso);
                kRight: If PosPercorso <= Length(Percorso) Then Inc(PosPercorso);
                kHome: PosPercorso := 1;
                kEnd: PosPercorso := Length(Percorso)+1;
                kInsert: InsState := Not InsState;
                kCancel: If (Percorso <> '') Then
                           Delete(Percorso,PosPercorso,1)

                End; { Case C2 }
       kEscape: Begin
                EsciFin := True;
                NomeFile := '';
                End;
       kReturn: Begin

                SaveNome := NomeFile;
                SavePercorso := Percorso;
                SaveDrive := Drive;

                {$I-} ChDir(NewDir); {$I+}

                Percorso := FExpand(Percorso);
                FSplit(Percorso,D,N,E);
                Drive := Ord(D[1])-64;
                Percorso := D;
                PosPercorso := 1;

		{ Assegnazione di un nome logico al file su disco }
		Assign(AppFile,Percorso);

                SaveIOResult := IOResult;
                If (SaveIOResult In [0{18,2,3,15,152}])
                  Then
                    Begin

		    { Legge i suoi attributi }
		    GetFAttr(F,FAttr);

                    { Se ä una directory, aggiusta l' immissione completandola }
   	            If (Percorso[Length(Percorso)] <> '\')
		      Then

  		        { Se ä una directory aggiunge il carattere '\' }
		        If ((DosError = 0) And (FAttr And Directory <> 0))
		          Then
		            Percorso := Percorso+'\';

	            { Separa il path esteso in nome della directory, nome del
		      file, nome dell' estensione }
	            FSplit(FExpand(Percorso),D,N,E);

	            { Aggiusta il nome }
	            If (N = StrNull)
		      Then
		        N := '*';

	            { Aggiusta l' estensione }
	            If (E = StrNull)
		      Then
		        E := '.'+Ext;

	            { Aggiorna il path alla sua scrittura completa e corretta }
	            NomeFile := D+N+E;

	            { Memorizza la directory scelta }
	            NewDir := D;
                    Percorso := D;

	            { Aggiusta la directory per essere passata come parametro
		      alla procedura CHDIR, togliendo il carattere '\' in fondo
		      quando non serve }
	            If (NewDir <> StrNull)
		      Then
		        RemoveBackSlash(NewDir);

                    {$I-} ChDir(NewDir); {$I+}
                    InitFiles;
                    {$I-} ChDir(NewDir); {$I+}
                    InitDrives;
                    If (SaveDrive <> Drive){ And (SaveDosError = 0)}
                      Then
                        InitDirs;
                    If (NumFiles = 1) And (Pos('*',NomeFile) = 0) And
                       (Pos('?',NomeFile) = 0) And
                       (Operaz In [fLeggiFile,fSalvaFile])
                         Then
                           Begin
                           EsciFin := True;
                           {$I-} ChDir(NewDir); {$I+}
                           NomeFile := FExpand(NomeFile);
                           End;
                    End;

(*                If (SaveDOSError <> 0)
                  Then
                    Begin
                    NomeFile := SaveNome;
                    Percorso := SavePercorso;
                    Drive := SaveDrive;
                    {NewDir := Direct;}
                    End;*)

                {$I-} ChDir(Direct); {$I+}
                WriteNomeFile(False);
                WritePercorso(True);
                WriteFiles(True,False);
                WriteDirs(True,False);
                WriteDrives(True,False);
                WriteViewFile;
                WriteSpecFile;
                WriteSpecDir;
                WriteSpecView;

                End;
       kDel: If (PosPercorso > 1) Then
               Begin
               Delete(Percorso,PosPercorso-1,1);
               Dec(PosPercorso);
               End;
       Else
         If (PosPercorso <= 52)
           Then
             Begin
             If (InsState Or (PosPercorso > Length(Percorso)))
               Then
                 Insert(C,Percorso,PosPercorso)
             Else
               If Not InsState
                 Then
                   Percorso[PosPercorso] := C;
             If Length(Percorso) > 52
               Then
                 Percorso[0] := #52;
             If PosPercorso <= 52 Then Inc(PosPercorso);
             End;
       End; { Case C }

     If (OldPercorso <> Percorso)
       Then
         Begin
         SetColor(cEditColorSel);
         SetFillStyle(SolidFill,cBkEditColorSel);
         WaitToWrite;
         HideMouse;
         Bar(F+1,Y1+1,X2-1,Y2-1);
         OutTextXY(F+TW,Y1+TH,Percorso);
         ShowMouse;
         End;

     If (OldPosPercorso <> PosPercorso) Or (OldInsState <> InsState) Or
        (OldPercorso <> Percorso)
          Then
            WriteCursor(F+TW*OldPosPercorso,F+TW*PosPercorso,Y2-3,InsState);

     End; { GestPercorso }


     Procedure GestFiles ( C:  Char;
                           C2: Char );
     Var X1, X2, Y1, Y2: Integer;
     Begin { GestFiles }
     X1 := TW;
     Y1 := TH*9;
     X2 := TW*18;
     Y2 := TH*26;
     With Arrow[3] Do
       Begin
       OldSelect := Select;
       If (NumFiles > 0)
         Then
           NomeFile := Files^[Select].Name;
       Case C Of
         kNull: Case C2 Of
(**************************************************************************************************)
                kNull: If MouseInG(X1+IniDialX,Y1+IniDialY,X2+IniDialX,Y2+IniDialY)
                         Then
                           Begin
                           Select := (MouseY-IniDialY-Y1) Div TH+BegLista;
                           If (Select > NumFiles)
                             Then
                               Select := NumFiles
                           Else
                             If Select <= 0 Then Select := 1;
                           End;
(**************************************************************************************************)
                  kUp: If (Select > 1) Then Dec(Select);
                  kPgUp: If (Select > 13) Then Dec(Select,13)
                         Else Select := 1;
                  kDown: If (Select < NumFiles) Then Inc(Select);
                  kPgDown: If (Select+13 <= NumFiles) Then Inc(Select,13)
                           Else Select := NumFiles;
                  kLeft: Attivo := 2;
                  kRight: Attivo := 4;
                  kHome: Select := 1;
                  kEnd: Select := NumFiles;
                  End; { Case C2 }
         kEscape: Begin
                  EsciFin := True;
                  NomeFile := '';
                  End;
         kReturn: Begin

                  If (NumFiles > 0) And (Select > 0)
                    Then
                      Begin
                      {$I-}
                      ChDir(NewDir);
                      {$I+}
                      NomeFile := FExpand(Files^[Select].Name);
                      EsciFin := True;
                      End;

                  WriteNomeFile(False);
                  WritePercorso(False);
                  WriteFiles(False,True);
                  WriteDirs(False,False);
                  WriteDrives(False,False);
                  WriteViewFile;
                  WriteSpecFile;
                  WriteSpecDir;
                  WriteSpecView;

                  End;
         End;

       If (OldSelect <> Select)
         Then
           Begin
           If (NumFiles > 0)
             Then
               NomeFile := Files^[Select].Name;
           WriteNomeFile(False);
           WriteSpecFile;
           WriteViewFile;
           WriteSpecView;
           If (Select < BegLista)
             Then
               Begin
               BegLista := Select;
               WriteFiles(True,True);
               End
           Else
             If (Select > BegLista+12)
               Then
                 Begin
                 BegLista := Select-12;
                 WriteFiles(True,True);
                 End
           Else
             WriteFiles(False,True);
           End;
       End;
     End; { GestFiles }


     Procedure GestDirs ( C:  Char;
                          C2: Char );
     Var X1, X2, Y1, Y2: Integer;

          Procedure AggDirs;
          Var OldPercorso: String;
          Begin { AggDirs }
          With Arrow[4] Do

            If (OldDirs <> Select)
              Then
                Begin
                OldPercorso := Percorso;
                If (NumDirs > 0) And (Select > 0)
                  Then
                    Percorso := FExpand(Dirs^[Select].Path);

                AddBackSlash(Percorso);
                AddBackSlash(OldPercorso);
                NomeFile := Percorso+'*.'+Ext;

    (*            If FExpand(NomeFile) <> FExpand(OldPercorso+'*.'+Ext)
                     Then

                       Begin*)
                       InitFiles;
                       If (Arrow[3].Select > 0) And (NumFiles > 0)
                         Then
                           NomeFile := Files^[Arrow[3].Select].Name;
                       WriteNomeFile(False);
                       WritePercorso(False);
                       WriteFiles(True,False);
                       WriteViewFile;
                       WriteSpecFile;
                       WriteSpecDir;
                       WriteSpecView;
    (*                   End;*)

                End;

          End; { AggDirs }

     Begin { GestDirs }

     X1 := TW*19;
     Y1 := TH*9;
     X2 := TW*41;
     Y2 := TH*26;
     With Arrow[4] Do
       Begin
       OldSelect := Select;
       Percorso := Dirs^[Select].Path;
       Case C Of
         kNull: Case C2 Of
                  kUp: If (Select > 1) Then Dec(Select);
                  kPgUp: If (Select > 13) Then Dec(Select,13)
                         Else Select := 1;
                  kDown: If (Select < NumDirs) Then Inc(Select);
                  kPgDown: If (Select+13 <= NumDirs) Then Inc(Select,13)
                           Else Select := NumDirs;
                  kLeft: Begin
                         Attivo := 3;
                         AggDirs;
                         End;
                  kRight: Begin
                          Attivo := 5;
                          AggDirs;
                          End;
                  kHome: Select := 1;
                  kEnd: Select := NumDirs;
                  End; { Case C2 }
         kEscape: Begin
                  EsciFin := True;
                  NomeFile := '';
                  End;
         kReturn: Begin
                  AggDirs;
                  OldDirs := Select;
                  End;
         End;

       If (OldSelect <> Select)
         Then
           Begin
           If (Select < BegLista)
             Then
               Begin
               BegLista := Select;
               WriteDirs(True,True);
               End
           Else
             If (Select > BegLista+12)
               Then
                 Begin
                 BegLista := Select-12;
                 WriteDirs(True,True);
                 End
           Else
             WriteDirs(False,True);
           End;
       End;
     End; { GestDirs }


     Procedure GestDrives ( C:  Char;
                            C2: Char );
     Var X1, X2, Y1, Y2: Integer;

          Procedure AggDrives;
          Begin
          With Arrow[5] Do
            If (OldDrives <> Select)
              Then
                Begin
                Drive := Select;

                NomeFile := Chr(Select+64)+':';
                Percorso := FExpand(NomeFile);
     {           InitDrives;}
                If (Percorso[Length(Percorso)] = '\')
                  Then
                    Dec(Percorso[0]);

                {$I-} ChDir(Percorso); {$I+}
                Percorso := FExpand(Percorso);
                NomeFile := Percorso+'\*.'+Ext;
                {$I-} ChDir(Direct); {$I+}

                InitFiles;
                InitDirs;
                WriteNomeFile(False);
                WritePercorso(False);
                WriteFiles(True,False);
                WriteDirs(True,False);
                WriteViewFile;
                WriteSpecFile;
                WriteSpecDir;
                WriteSpecView;

     (*           If (NumDirs > 0) And (Select > 0)
                  Then
                    Percorso := FExpand(Dirs^[Select].Path);

                AddBackSlash(Percorso);
                NomeFile := Percorso+'*.'+Ext;

                InitFiles;

                If (Arrow[3].Select > 0) And (NumFiles > 0)
                  Then
                    NomeFile := Files^[Arrow[3].Select].Name;
                WriteNomeFile(False);
                WritePercorso(False);
                WriteFiles(True,False);
                WriteViewFile;
                WriteSpecFile;
                WriteSpecDir;
                WriteSpecView;*)
                End;
          End;

     Begin { GestDrives }

     X1 := TW*42;
     Y1 := TH*9;
     X2 := TW*49;
     Y2 := TH*26;
     With Arrow[5] Do
       Begin
       OldSelect := Select;
       Drive := Select;
       Case C Of
         kNull: Case C2 Of
                  kUp: If (Select > 1) Then Dec(Select);
                  kPgUp: If (Select > 15) Then Dec(Select,15)
                         Else Select := 1;
                  kDown: If (Select < 26) Then Inc(Select);
                  kPgDown: If (Select+15 <= 26) Then Inc(Select,15)
                           Else Select := 26;
                  kLeft: Begin
                         Attivo := 4;
                         AggDrives;
                         End;
                  kRight: ;
                  kHome: Select := 1;
                  kEnd: Select := 26;
                  End; { Case C2 }
         kEscape: Begin
                  EsciFin := True;
                  NomeFile := '';
                  End;
         kReturn: Begin
                  AggDrives;
                  OldDrives := Select;
                  End;
         End;

       If (OldSelect <> Select)
         Then
           Begin
           If (Select < BegLista)
             Then
               Begin
               BegLista := Select;
               WriteDrives(True,True);
               End
           Else
             If (Select > BegLista+12)
               Then
                 Begin
                 BegLista := Select-12;
                 WriteDrives(True,True);
                 End
           Else
             WriteDrives(False,True);
           End;
       End;
     End; { GestDrives }


     Procedure GestOk ( C:  Char;
                        C2: Char );
     Begin { GestOk }

     SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
     With Icone^[IcnOk] Do
       If PremiPulsante(x+IniDialX-1,y+IniDialY-1,Icn,LeggiFile,IcnOk,SiAttesa,cBkDialog)
         Then
           With Arrow[3] Do
             If (NumFiles > 0) And (Select > 0)
               Then
                 Begin
                 {$I-}
                 ChDir(NewDir);
                 {$I+}
                 NomeFile := FExpand(Files^[Select].Name);
                 EsciFin := True;
                 End
             Else
               If (NumFiles <= 1) And (Pos('*',NomeFile) = 0) And
                  (Pos('?',NomeFile) = 0) And
                  (Operaz In [fLeggiFile,fSalvaFile])
                    Then
                      Begin
                      EsciFin := True;
                      NomeFile := FExpand(NomeFile);
                      End;

     SetViewPort(IniDialX+1,IniDialY+1,FinDialX-1,FinDialY-1,ClipOff);
     End; { GestOk }


     Procedure GestEsci ( C:  Char;
                          C2: Char );
     Begin { GestEsci }
     SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
     With Icone^[IcnEsci] Do
       If PremiPulsante(x+IniDialX-1,y+IniDialY-1,Icn,LeggiFile,IcnEsci,SiAttesa,cBkDialog)
         Then
           Begin
           EsciFin := True;
           NomeFile := '';
           End;
     SetViewPort(IniDialX+1,IniDialY+1,FinDialX-1,FinDialY-1,ClipOff);
     End; { GestEsci }


Begin { InputFile }

GetDir(0,Direct);
NewDir := Direct;

Percorso := FExpand(Percorso);
If (NomeFile = StrNull)
  Then
    Begin

    NomeFile := '*.'+Ext;
    SetTextStyle(DefaultFont,HorizDir,1);
    SetTextJustify(CenterText,CenterText);
    IniDialX := GetMaxX Div 2-269;
    IniDialY := GetMaxY Div 2-180;
    FinDialX := GetMaxX Div 2+269;
    FinDialY := GetMaxY Div 2+160;
    FineX := FinDialX-IniDialX;
    FineY := FinDialY-IniDialY;

    Size := ImageSize(IniDialX,IniDialY,FinDialX+Shadow,FinDialY+Shadow);

    If (Size < MemAvail) And (Size > 0)
      Then
        Begin
        Procedi := Memoria;
        GetMem(Fin,Size);
        GetImage(IniDialX,IniDialY,FinDialX+Shadow,FinDialY+Shadow,Fin^);
        End
    Else
      Procedi := Video;

    SetFillPattern(MyFill,cShadowDialog);
    SetFillStyle(UserFill,cShadowDialog);
    Bar(IniDialX+1+Shadow,IniDialY+1+Shadow,FinDialX-1+Shadow,FinDialY-1+Shadow);
    SetFillStyle(SolidFill,cBkDialog);
    SetTextJustify(LeftText,CenterText);
    Bar(IniDialX+1,IniDialY+1,FinDialX-1,FinDialY-1);
    SetColor(cDialogBord);
    Rectangle(IniDialX+1,IniDialY+1,FinDialX-1,FinDialY-1);

    SetGHorRange(IniDialX+1,FinDialX-1);
    SetGVertRange(IniDialY+1,FinDialY-1);
    SetViewPort(IniDialX+1,IniDialY+1,FinDialX-1,FinDialY-1,ClipOff);

    WaitToWrite;
    HideMouse;
    WriteWin(TitWin,0,0,FineX,FineY,cBkDialog,cBkDialogTitle,cDialogTitle);
    WriteLine('Nome file',TW,TH*3,TW*66,TH*5,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteLine('Percorso ',TW,TH*6,TW*66,TH*8,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteWin('Files',TW,TH*9,TW*18,TH*26,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteWin('Directories',TW*19,TH*9,TW*41,TH*26,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteWin('Specifiche del file',TW,TH*27,TW*41,TH*32,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteWin('Specifiche della directory',TW,TH*33,TW*41,TH*38,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteWin('Drives',TW*42,TH*9,TW*49,TH*26,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteWin('Visualizzazione',TW*50,TH*9,TW*66,TH*26,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    WriteWin('Specifiche visualizz.',TW*42,TH*27,TW*66,TH*38,cBkSmallDialog,cBkSmallTitle,cSmallTitle);
    ShowMouse;

    Arrow[3].X1 := TW*18-15;
    Arrow[3].Y1 := TH*11+2;
    Arrow[3].X2 := Arrow[3].X1;
    Arrow[3].Y2 := TH*24-15+2;
    Arrow[4].X1 := TW*41-15;
    Arrow[4].Y1 := Arrow[3].Y1;
    Arrow[4].X2 := Arrow[4].X1;
    Arrow[4].Y2 := Arrow[3].Y2;
    Arrow[5].X1 := TW*49-15;
    Arrow[5].Y1 := Arrow[3].Y1;
    Arrow[5].X2 := Arrow[5].X1;
    Arrow[5].Y2 := TH*26-15;

    For i := 3 To 5 Do
      With Arrow[i] Do
        Begin
        SetFillStyle(SolidFill,cDialogBord);
        Bar(X1-1,Y1-1,X2+14,Y2+14);
        SetFillStyle(SolidFill,cBkBarLine);
        Bar(X1,Y1+15,X2+13,Y2-2);
        OldPosBar := 0;
        PosBar := 1;
        Select := 0;
        OldSelect := 0;
        BegLista := 1;
        PutImage(X1,Y1,Icone^[IcnAlto].Icn^,NormalPut);
        PutImage(X2,Y2,Icone^[IcnBasso].Icn^,NormalPut);
        AggiornaPosizione(i);
        End;

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

    EsciFin := False;
    Attivo := 1;
    OldAttivo := 0;
    PosNomeFile := 1;
    PosPercorso := 1;
    InsState := True;

    InitDrives;
    InitFiles;
    InitDirs;
    WriteNomeFile(False);
    WritePercorso(False);
    WriteFiles(True,False);
    WriteDirs(True,False);
    WriteDrives(True,False);
    WriteViewFile;
    WriteSpecFile;
    WriteSpecDir;
    WriteSpecView;
    WriteNomeFile(True);

    OldDirs := Arrow[4].Select;
    OldDrives := Arrow[5].Select;

    Repeat

      ClearKeyBuf;
      Repeat
        GetMPos;
      Until (MousePressed Or KeyPressed);

      OldAttivo := Attivo;

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
               If MouseInG(TW+IniDialX,TH*3+IniDialY,TW*66+IniDialX,TH*5+IniDialY) Then Attivo := 1
          Else If MouseInG(TW+IniDialX,TH*6+IniDialY,TW*66+IniDialX,TH*8+IniDialY) Then Attivo := 2
          Else If MouseInG(TW+IniDialX,TH*9+IniDialY,TW*18+IniDialX,TH*26+IniDialY) Then Attivo := 3
          Else If MouseInG(TW*19+IniDialX,TH*9+IniDialY,TW*41+IniDialX,TH*26+IniDialY) Then Attivo := 4
          Else If MouseInG(TW*42+IniDialX,TH*9+IniDialY,TW*49+IniDialX,TH*26+IniDialY) Then Attivo := 5
          Else With Icone^[IcnOk] Do
                 If MouseInG(X+IniDialX,Y+IniDialY,X+29+IniDialX,Y+14+IniDialY) Then Attivo := 6
          Else With Icone^[IcnEsci] Do
                 If MouseInG(X+IniDialX,Y+IniDialY,X+29+IniDialX,Y+14+IniDialY) Then Attivo := 7;
          If (OldAttivo <> Attivo)
            Then
              Begin
              SaveAttivo := Attivo;
              GestDirs(kNull,kLeft);
              GestDrives(kNull,kLeft);
              Attivo := SaveAttivo;
              End;
          End;

      If RightButton And (Not LeftButton)
        Then
          EsciFin := True;

      If Not EsciFin
        Then
          Begin
          Case Attivo Of
            1: GestNomeFile(C,C2);
            2: GestPercorso(C,C2);
            3: GestFiles(C,C2);
            4: GestDirs(C,C2);
            5: GestDrives(C,C2);
            6: GestOk(C,C2);
            7: GestEsci(C,C2);
            End; { Case Attivo }

          If (OldAttivo <> Attivo)
            Then
              Begin
              OldDirs := Arrow[4].Select;
              OldDrives := Arrow[5].Select;
              Case OldAttivo Of
                1: WriteNomeFile(False);
                2: WritePercorso(False);
                3: WriteFiles(False,False);
                4: WriteDirs(False,False);
                5: WriteDrives(False,False);
                End; { Case OldAttivo }
              Case Attivo Of
                1: WriteNomeFile(True);
                2: WritePercorso(True);
                3: WriteFiles(False,True);
                4: WriteDirs(False,True);
                5: WriteDrives(False,True);
                End; { Case Attivo }
              End;
          End;

    Until EsciFin;

    If (NomeFile <> StrNull)
      Then
        Begin
        {$I-} ChDir(NewDir); {$I+}
        NomeFile := FExpand(NomeFile);
        {$I-} ChDir(Direct); {$I+}
        End;
    SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
    SetGHorRange(0,GetMaxX);
    SetGVertRange(0,GetMaxY);
{    Halt;}
    Case Procedi Of
      Memoria: PutImage(IniDialX,IniDialY,Fin^,NormalPut);
      Video:   DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);
      End; { Case Procedi }

    End;

ReleaseMouse;
End; { InputFile }


End. { GIPFile }
