Unit GIPHelp;

Interface { GIPHelp }

{ Unit utilizzate }
Uses
     Graph,    { Unit standard per la gestione dello schermo in
		  modalit… grafica }
     Crt,      { Unit standard per la gestione dello schermo in
		  modalit… testo }
     Dos,      { Unit standard per la gestione del disco, dei
		 registri, ecc. }
     Mouse,    { Unit per la gestione del mouse }
     GIPVars,
     GIPInit,
     GIPFile,
     Keyboard,
     GIPGraph,
     GIPFast;

Const
      { Massimo numero di caratteri per ogni riga di informazioe }
      MaxLengthHelp=    80;

      { Massimo numero di linee per una schermata di informazioni }
      MaxLineHelp=      25;

      cBkHelp=          LightGray;
      cHelpBord=        Blue;
      cBkHelpTitle=     Blue;
      cHelpTitle=       White;
      cHelpMsgError=    Red;
      cHelpBkBar=       DarkGray;
      cHelpBarBord=     Red;
      cHelpBar=         Green;
      cHelpBkSel=       Brown;
      cHelpText=        Black;
      cHelpSel=         Yellow;
      cHelpUnSel=       Red;
      NameFileHlp=      'GIP.HLP';
      { Numero di schermi memorizzati, richiamabili premendo il tasto
        ALT-F1 }
      MaxLastHelp=      50;
      { Lunghezza di un riferimento evidenziato }
      MaxHelpRif=       30;
      { Numero di linee per un argomento }
      MaxNumLine=      200;



Type { Tipo di uscita dall' help (uscita negata, uscita, nuovo argomento,
       argomento precedente o pressione del tasto ALT-F1 nell' help stesso }
     TipoEsciHelp=  (NonUscire,EsciHlp,Altro,Precedente,AncoraPrecedente);
     { Vettore che contiene le schermate di help precedenti }
     TipoVetHelp=   Array [1..MaxLastHelp] Of
                      String[MaxHelpRif];
     { Array delle linee di una schermata di help }
     TipoScrHlp=    Array [1..MaxNumLine] Of
		      String[MaxLengthHelp];
     { Riferimenti per un argomento dell' help }
     TipoRif=       Array [1..MaxNumLine] Of
 		      String[MaxHelpRif];


Var FileHlp: Text;
    { Schermate precedenti dell' help, visualizzabili con la pressione
      dei tasti ALT-F1 }
    VetHelp:      TipoVetHelp;
    { Testo di un argomento }
    ScreenInfo:   TipoScrHlp;
    { Riferimenti per un argomento }
    NumRif:       TipoRif;




{ Emette un suono di 100 Hz per circa 30 ms (millisecondi) }
Procedure Beep;

{ Questa Š la procedura che gestisce l' intero help, compreso i
  collegamenti nello stesso, la pressione dei tasti e dei pulsanti
  del mouse.
  Si ricordano i tasti che lo richiamano: F1, ALT-F1, CTRL-F1 e
  SHIFT-F1 }
Procedure Help ( Argomento: String;
                 Tipo:      TipoEsciHelp);


Implementation { GIPHelp }


{ Produce un BEEP, un suono di 100 Hz per circa 30 millisecondi }
Procedure Beep;
Begin { Beep }

{ Suono di 100 Hz }
Sound(100);

{ Attendi 30 ms }
Delay(30);

{ Nessun suono }
NoSound;

End; { Beep }


{ Stampa a video una schermata di informazioni, leggendo tutto dal
  record TipoScreen.
  Questa Š la procedura che gestisce l' intero help, compreso i
  collegamenti nello stesso, la pressione dei tasti e dei pulsanti
  del mouse.
  Si ricordano i tasti che lo richiamano: F1, ALT-F1, CTRL-F1 e
  SHIFT-F1. }
Procedure Help(Argomento: String;
               Tipo:      TipoEsciHelp);
Var
    Size:        Word;          { Memoria occupata }
    FinHlp:      Pointer;       { Puntatore }
    Ch1:         Char;          { Carattere premuto dall' utente }
    Ch2:         Char;          { Carattere premuto dall 'utente }
    I:           Integer;       { Indice per i cilci }
    St:          String;        { Linea dello schermo di help }
    HlpXMin:     Integer;       { Inizio X - angolo alto-sinistro }
    HlpXMax:     Integer;       { Fine X - angolo alto-destra }
    HlpYMin:     Integer;       { Inizio Y - angolo basso-sinistro }
    HlpYMax:     Integer;       { Inizio Y - angolo basso-destro }
    BarXMin:     Integer;       { Inizio della barra-posizione }
    Trovato:     Boolean;       { L' argomento Š presente sul disco o no }
    MaxRif:      Integer;       { Numero di riferimenti dell' argomento }
    MaxLine:     Integer;       { Numero di linee dell' argomento }
    Sel:         Integer;       { Numero della riga/parola selezionata }
    OldSel:      Integer;       { Numero della riga/parola precedentemente
                                  selezionata }
    Riga:        Integer;       { Numero di riga di inizio }
    OldRiga:     Integer;       { Numero predcedente di riga di inizio }
    EsciHelp:    TipoEsciHelp;  { Pu• assumere i valori
                                  ESCIHLP          per uscire dall' help,
                                  ALTRO            per andare ad un altro
				                   argomento,
                                  PRECEDEMTE       per andare all' argomento
				                   precedente,
                                  ANCORAPRECEDENTE per andare al precedente
				                   quando si Š dentro
						   l' help,
                                  NONUSCIRE        resta nell' help }
    App:         String;        { Appoggio per il disegno delle selezioni }
    X:           Integer;       { Appoggio numerico }
    Controllato: Boolean;       { La selezione Š gia stata stampata o no }

Begin { Help }

{ Calcola i valori della finestra }
HlpXMin := (GetMaxX-TW*MaxLengthHelp) Div 2;
HlpXMax := (GetMaxX+TW*(MaxLengthHelp+6)) Div 2;
HlpYMin := (GetMaxY-TH*MaxLineHelp) Div 2;
HlpYMax := (GetMaxY+TH*MaxLineHelp) Div 2;
BarXMin := (GetMaxX+TW*(MaxLengthHelp+2)) Div 2;

  { Dimensione in pixels }
  Size := ImageSize(HlpXMin,HlpYMin,HlpXMax,HlpYMax);

  { Se c'Š abbastanza memoria scrivi, altrimenti emetti un beep }
  If (MemAvail > Size) And (Size > 0) Then
    Begin

    { Memorizza la parte di schermo interessata }
    GetMem(FinHlp, Size);
    GetImage(HlpXMin,HlpYMin,HlpXMax,HlpYMax,FinHlp^);

    { Setta il colore, lo sfondo, il retino e il tipo di scrittura }
    SetTextJustify(CenterText,TopText);
    SetFillStyle(SolidFill,cBkHelp);
    SetColor(cHelpBord);

    { Apparizione della finestra }
    WriteWin('HELP ON-LINE',HlpXMin,HlpYMin,HlpXMax,HlpYMax,cBkHelp,cBkHelpTitle,cHelpTitle);
    { Disegno della finestra }
    Bar(HlpXMin,HlpYMin,HlpXMax,HlpYMax);
    Rectangle(HlpXMin,HlpYMin,HlpXMax,HlpYMax);

    { Controllo se il file esiste su disco (non si sa mai) }
    Assign(FileHlp,NameFileHlp);

    {$I-} Reset(FileHlp); {$I+}

    { Se non esiste, avverti l' utente }
    If IOResult <> 0 Then
      Begin

      { Suono di avvertimento }
      For i := 1 To 5 Do
        Beep;

      { Scrive un messaggio per l' utente }
      SetColor(cHelpMsgError);
      For i := 1 To MaxLineHelp Do
        Begin
        Case i Of
	  4: St := 'ERRORE DI LETTURA DA DISCO';
	  5: St := '--------------------------';
	  9: St := 'NON RIESCO A TROVARE IL';
	  11: St := 'FILE SIS04HLP.TXT CHE';
	  13: St := 'CONTIENE L'' HELP.';
	  15: St := 'DEVE TROVARSI NELLA';
	  17: St := 'DIRECTORY CORRENTE.';
	  21: St := 'PREMI UN TASTO PER CONTINUARE.';
	  Else St := '';
	  End;
        OutTextXY(GetMaxX Div 2,Round((GetMaxY+TH*(i-MaxLineHelp/2-1)*2)/2),St);
        End;

      { Attende un RETURN o la pressione di un pulsante del mouse }
      Repeat
        GetMPos;
      Until (MousePressed Or KeyPressed);

      If KeyPressed
        Then
          Begin
          Ch1 := ReadKey;
          If Ch1 = kNull
            Then
              Ch2 := ReadKey;
          End;

      { Rilascia i pulsanti del mouse }
      ReleaseMouse;

      End
    Else
      Begin

      If Tipo = Precedente Then EsciHelp := Precedente
      Else EsciHelp := Altro;

      { Fino a che l' utente non esce dall' help ... }
      While EsciHelp In [Altro,Precedente,AncoraPrecedente] Do
        Begin

        { Predisponi il file di testo per la lettura }
        Close(FileHlp);
        {$I-} Reset(FileHlp); {$I+}

        { Tutte le lettere devono essere maiuscole }
        For i := 1 To Length(Argomento) Do
	  Argomento[i] := UpCase(Argomento[i]);
        Argomento := 'ARGOMENTO: '+Argomento;

        { Cerca l' argomento specificato }
        Trovato := False;
        While (Not EOF(FileHlp)) And (Not Trovato) Do
	  Begin
	  ReadLn(FileHlp,St);
	  If St = Argomento Then
	    Trovato := True;
	  End;
        Delete(Argomento,1,Length('ARGOMENTO: '));

        { Se non lo trova avverte l' utente }
        If Not Trovato Then
	  Begin

          { Retino, colore, sfondo, ecc. }
	  SetTextJustify(CenterText,TopText);
	  SetFillStyle(SolidFill,cBkHelp);
	  SetColor(cHelpBord);
	  Bar(HlpXMin,HlpYMin,HlpXMax,HlpYMax);
	  Rectangle(HlpXMin,HlpYMin,HlpXMax,HlpYMax);

          { Suono di avvertimento }
	  For i := 1 To 5 Do Beep;

          { Informa l' utente che l' argomento specificato non
            esiste sul disco }
	  SetColor(Yellow);
	  For i := 1 To MaxLineHelp Do
	    Begin
	    Case i Of
	      3: St := 'ERRORE DI RICERCA DA DISCO';
	      4: St := '--------------------------';
	      9: St := 'NON RIESCO A TROVARE ';
	      11: St := 'L'' ARGOMENTO <'+Argomento+'>';
	      13: St := 'NEL FILE SIS04HLP.TXT.';
	      15: St := 'CONTROLLANE IL CONTENUTO.';
	      21: St := 'PREMI RETURN PER CONTINUARE.';
	      Else St := '';
	      End;
	    OutTextXY(GetMaxX Div 2,Round((GetMaxY+TH*(i-MaxLineHelp/2-1)*2)/2),St);
	    End;

	  { Attende un RETURN o la pressione di un ulsante del mouse }
	  Repeat
	    GetMPos;
	  Until (MousePressed Or KeyPressed);

          If KeyPressed
            Then
              Begin
              Ch1 := ReadKey;
              If Ch1 = kNull
                Then
                  Ch2 := ReadKey;
              End;

	  EsciHelp := EsciHlp;

          { Rilascia i pulsanti del mouse }
          ReleaseMouse;

	  End
        Else
	  Begin

          { Salta la prima riga }
	  ReadLn(FileHlp);

          { Aggiorna il vettore che contiene gli argomenti dell' help
	    visualizzati in precedenza, disponibili con la pressione
	    del tasto ALT-F1 }
          Case EsciHelp Of
	    Precedente,
	    AncoraPrecedente: For i := 1 To MaxLastHelp-1 Do
                                VetHelp[i] := VetHelp[i+1];
            Altro: Begin
                   For i := MaxLastHelp DownTo 2 Do
                     VetHelp[i] := VetHelp[i-1];
                   VetHelp[1] := Argomento;
                   End;
            End;

          { Azzera le linee della pagina }
          For i := 1 To MaxLineHelp Do
	    Begin
	    ScreenInfo[i] := '';
            NumRif[i] := '';
            End;
	  MaxLine := 0;
	  MaxRif := 0;

          { Legge il teso dell' argomento e memorizza tutte le righe
            e i riferimenti }
          St := '';
          While St <> 'FINE ARGOMENTO' Do
            Begin
	    Inc(MaxLine);
	    If Pos('$',St) <> 0 Then
	      Begin
	      NumRif[MaxLine] := Copy(St,Pos('$',St)+1,
				      Pos('&',St)-Pos('$',St)-1);
	      Delete(St,Pos('$',St),1);
	      Delete(St,Pos('&',St),1);
	      Inc(MaxRif);
	      End
	    Else NumRif[MaxLine] := '';
	    ScreenInfo[MaxLine] := St;
	    ReadLn(FileHlp,St);
	    End;

          { Il numero minimo di righe Š una pagina }
          If MaxLine < MaxLineHelp Then
            Begin
            For i := MaxLine To MaxLineHelp Do
              Begin
	      ScreenInfo[i] := '';
              NumRif[i] := '';
              End;
	    MaxLine := MaxLineHelp;
            End;

          { Cerca la prima parola evidenziata }
	  Sel := 1;
          While NumRif[Sel] = '' Do
            Inc(Sel);
          Riga := 1;

          { Inizializza le variabili }
          OldSel := 0;
	  OldRiga := 0;
	  EsciHelp := NonUscire;
	  SetTextJustify(LeftText,TopText);

          { Attende fino a che non Š stata fatta una scelta ad un diverso
            argomento o fino alla pressione del tasto ESCAPE }
	  Repeat

            { Aggiorna lo schermo se c'Š stato un cambiamento di pagina }
	    If Riga <> OldRiga Then
	      Begin

              { Cancella la finestra rendendola vuota }
	      SetFillStyle(SolidFill,cBkHelp);
	      SetColor(cHelpBord);
	      Bar(HlpXMin,HlpYMin,HlpXMax,HlpYMax);
	      Rectangle(HlpXMin,HlpYMin,HlpXMax,HlpYMax);
	      SetFillStyle(SolidFill,cHelpBkBar);
              SetColor(cHelpBarBord);
	      Bar(BarXMin,HlpYMin,HlpXMax,HlpYMax);
	      Rectangle(BarXMin,HlpYMin,HlpXMax,HlpYMax);
	      SetFillStyle(SolidFill,cHelpBar);
	      Bar(BarXMin,((HlpYMax-HlpYMin)*Riga) Div MaxLine+HlpYMin,
		  HlpXMax,((HlpYMax-HlpYMin)*(Riga+MaxLineHelp-2)) Div MaxLine
		  +HlpYMin);

              { Ristampa il contenuto sul video }
	      SetFillStyle(SolidFill,cHelpBkSel);
	      For i := 1 To MaxLineHelp-2 Do
	        If i+Riga-1 <= MaxLine Then
		  Begin
                  SetColor(cHelpText);
		  OutTextXY(HlpXMin+10,HlpYMin+i*TH,ScreenInfo[i+Riga-1]);

                  { Se c'Š una parola selezionata vuole stampata con
                    unn diverso colore }
		  If NumRif[i+Riga-1] <> '' Then
		    Begin
                    App := Copy(ScreenInfo[i+Riga-1],1,Pos(NumRif[i+Riga-1],
		                ScreenInfo[i+Riga-1])-1);
		    If Sel = i+Riga-1 Then
		      Begin
		      Bar(HlpXMin+10+TextWidth(App),HlpYMin+3+i*
		          TH,HlpXMin+10+TextWidth(App)+
			  TextWidth(NumRif[i+Riga-1]),HlpYMin+(i+1)*
			  TH);
		      SetColor(cHelpSel);
		      End
		    Else SetColor(cHelpUnSel);

		    If NumRif[i+Riga-1] <> '' Then
		      OutTextXY(HlpXMin+10+TextWidth(App),HlpYMin+i*
		                TH,NumRif[i+Riga-1]);
		    End;
		  End;
	      End
            Else

              { Altrimenti aggiorna solo la parola selezionata }
              If (Sel <> OldSel) And (OldSel > 0) Then
                Begin

                { Riscrive la precedente }
	        If (OldSel <= MaxLine) And (OldSel >= Riga)
                   And (OldSel <= Riga+MaxLineHelp-3)
	             Then
		       Begin
	               SetFillStyle(SolidFill,cBkHelp);
	               SetColor(cHelpUnSel);
                       i := OldSel-Riga+1;
                       App := Copy(ScreenInfo[OldSel],1,Pos(NumRif[OldSel],
		                   ScreenInfo[OldSel])-1);
		       Bar(HlpXMin+10+TextWidth(App),HlpYMin+3+i*
		           TH,HlpXMin+10+TextWidth(App)+
		           TextWidth(NumRif[OldSel]),HlpYMin+(i+1)*
		           TH);
                       OutTextXY(HlpXMin+10+TextWidth(App),HlpYMin+i*
		                 TH,NumRif[OldSel]);
                       End;

                { Riscrive la nuova selezione }
                i := Sel-Riga+1;
	        SetFillStyle(SolidFill,cHelpBkSel);
	        SetColor(cHelpSel);
                App := Copy(ScreenInfo[Sel],1,Pos(NumRif[Sel],
		            ScreenInfo[Sel])-1);
	        Bar(HlpXMin+10+TextWidth(App),HlpYMin+3+i*
		    TH,HlpXMin+10+TextWidth(App)+
		    TextWidth(NumRif[Sel]),HlpYMin+(i+1)*
		    TH);
	        OutTextXY(HlpXMin+10+TextWidth(App),HlpYMin+i*
		          TH,NumRif[Sel]);
                End;

            { Memorizza la selezione e il numero di riga }
            OldSel := Sel;
	    OldRiga := Riga;

            { Attende la pressione di un tasto permesso o la pressione
              di un pulsante del mouse }
	    Repeat
              GetMPos;
              ControllaTastiera;
	      If Not ((((Ch1 = kNull) And (Ch2 In [kUp,kDown,kPgUp,kPgDown,
	         kHome,kEnd,kSTab,kAF1,kSF1])) Or (Ch1 In [kReturn,kEscape,
		 kTab])) Or MousePressed) Then Beep;
	    Until (((Ch1 = kNull) And (Ch2 In [kUp,kDown,kPgUp,kPgDown,
	         kHome,kEnd,kSTab,kAF1,kSF1])) Or (Ch1 In [kReturn,kEscape,
		 kTab])) Or MousePressed;

            { Se il mouse Š premuto, si simula la pressione della tastiera }
            If MousePressed Then
              Begin
              Ch1 := 'Û';

              { Pulsante destro, equivale al tasto ESCAPE }
              If RightButton Then
                Begin
                Ch1 := kEscape;
                EsciHelp := EsciHlp;
                End
              Else

                { Pulsante sinistro, equivale a CURSORE SU (se fatto nella
		  parte superiore della barra di scorrimento) ... }
                If MouseInG(HlpXMin,HlpYMin,HlpXMax,HlpYMax)
		  Then
		    Begin
                    If MouseInG(BarXMin,HlpYMin,
		                HlpXMax,(HlpYMax+HlpYMin) Div 2-1)
                                  Then
                                    Begin
                                    Ch1 := kNull;
                                    Ch2 := kUp;
                                    End
                    Else

                      { ... a CURSORE GIU' (se fatto in quella bassa) ... }
                      If MouseInG(BarXMin,(HlpYMax+HlpYMin) Div 2+1,
		                  HlpXMax,HlpYMax)
                                    Then
                                      Begin
                                      Ch1 := kNull;
                                      Ch2 := kDown;
                                      End
                    Else

                      { ... o a RETURN (se fatta su una parola evidenziata
                        o ancora a TAB/SHIFT-TAB fino alla nuova parola
                        da evidenziare) }
                      If MouseInG(HlpXMin,HlpYMin,BarXMin,HlpYMax)
                        Then
                          Begin
                          Controllato := False;
		          For i := Riga To Riga+MaxLineHelp Do
	                    If Not Controllato Then
			      If NumRif[i] <> '' Then
			        Begin
                                x := i-Riga+1;
                                App := Copy(ScreenInfo[i],1,
				            Pos(NumRif[i],ScreenInfo[i])-1);

                                { Se Š stato premuto su una parola
                                  evidenziata ... }
                                If MouseInG(HlpXMin+10+TextWidth(App),
				            HlpYMin+3+x*TH,
					    HlpXMin+10+TextWidth(App)+
			                    TextWidth(NumRif[i]),
					    HlpYMin+(x+1)*TH)
                                  Then
                                    Begin
                                    Controllato := True;
                                    OldSel := Sel;

                                    { Se la parola era gi… evidenziata, si
                                      procede come RETURN ... }
                                    If Sel = i Then
				      Begin
				      EsciHelp := Altro;
                                      Ch1 := kReturn;
                                      End

                                    { ... altrimenti con TAB/SHIFT-TAB fino
                                      alla parola scelta }
                                    Else Sel := i;
                                    End;
		                End;
                          End;
                    End;

              { Rilascia il pulsante del mouse }
              ReleaseMouse;
              End;

            { Se i tasti premuti sono validi (il mouse viene visto come
	      la tastiera, ma in modo speciale) }
            If (MousePressed And (((Ch1 = kNull) And (Ch2 In [kUp,kDown]))
	       Or (Ch1 In [kReturn,kEscape,kReturn])) Or (Not MousePressed))
	         Then
                   Begin

                   { A seconda del tasto premuto ... }
 	           Case Ch1 Of
	             kNull: Case Ch2 Of

                              { SU }
		              kUp: If Riga > 1 Then Dec(Riga);

                              { GIU' }
		              kDown: If Riga <= MaxLine-MaxLineHelp
			               Then Inc(Riga);

                              { PAGINA SU }
		              kPgDown: If Riga+MaxLineHelp <=
			                  MaxLine-MaxLineHelp+1
					    Then Inc(Riga,MaxLineHelp)
			               Else Riga := MaxLine-MaxLineHelp+1;

                              { PAGINA GIU' }
		              kPgUp: If Riga-MaxLineHelp > 1 Then
			               Dec(Riga,MaxLineHelp)
			             Else Riga := 1;

                              { HOME }
		              kHome: Riga := 1;

                              { END }
		              kEnd: Riga := MaxLine-MaxLineHelp+1;

                              { SHIFT-TAB }
		              kSTab: If Sel > 1 Then
			               Begin
			               i := Sel-1;
			               While (NumRif[i] = '') And (i > 1) Do
				         Dec(i);
                                       If NumRif[i] <> '' Then Sel := i;
			               End;

                              { ALT-F1 }
                              kAF1: EsciHelp := AncoraPrecedente;

                              { SHIFT-F1 }
                              kSF1: EsciHelp := EsciHlp;
		              End;

                     { ESCAPE }
	             kEscape: EsciHelp := EsciHlp;

                     { RETURN }
	             kReturn: EsciHelp := Altro;

                     { TAB }
	             kTab: If Sel < MaxLine Then
		             Begin
		             i := Sel+1;
		             While (NumRif[i] = '') And (i < MaxLine) Do
		               Inc(i);
                             If NumRif[i] <> '' Then Sel := i;
		             End;
	             End;

                 { Controllo della parola selezionata }
                 If ((Ch1 = kNull) And (Ch2= kSTab)) Or (Ch1 = kTab)
                   Then
                     Begin
 	             If Sel < Riga Then
                       Begin
                       If Riga < 1 Then Riga := 1
                       Else Riga := Sel;
                       End
                     Else
 		       If Sel >= Riga+MaxLineHelp-3 Then
                         Begin
                         If Riga+MaxLineHelp > MaxLine Then
                           Riga := MaxLine-MaxLineHelp+1
                         Else Riga := Sel-MaxLineHelp+3;
		         End;
                     End;
                   End;

	  Until ((EsciHelp = Altro) And (NumRif[Sel] <> ''))
	        Or (EsciHelp = EsciHlp) Or (EsciHelp In [Precedente,
		AncoraPrecedente]);

          Case EsciHelp Of
	    EsciHlp: If (Ch1 = kNull) And (Ch2 = kSF1)
                       Then
		         Begin
	                 Argomento := 'Indice';
                         EsciHelp := Altro;
                         End;
            Altro: Argomento := NumRif[Sel];
            AncoraPrecedente: Argomento := VetHelp[2];
            End;
          SetFillStyle(SolidFill,cBkHelp);
          Bar(HlpXMin,HlpYMin,HlpXMax,HlpYMax);
	  End;
        End;

      { Chiude il file di testo }
      Close(FileHlp);
      End;

    { Ripristina il video come se la finestra non lo avesse 'sporcato' }
    PutImage((GetMaxX-TextWidth('Û')*MaxLengthHelp) Div 2,
	     (GetMaxY-TH*MaxLineHelp) Div 2,FinHlp^,NormalPut);
    FreeMem(FinHlp,Size);

    End;
End; { Help }


End. { GIPHelp }
