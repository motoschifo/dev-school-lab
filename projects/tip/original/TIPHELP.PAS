{ֹֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ»
 ÷                                                                          ÷
 ÷       ששששששששששששששששששששששששששששששששששששששששששששששששששששששששששש        ÷
 ÷       שתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתש        ÷
 ÷       שתתÚִִִִִִִִִִִִִִ¿תתתתÚִִִִִִ¿תתתתתתתÚִִִִִִִִִִִִִ¿תתתתתש        ÷
 ÷       שתת³°°°°°°°°°°°°°°³תתתת³±±±±±±³תתתתתתת³²²²²²²²²²²²²²ְ¿תתתתש        ÷
 ÷       שתת³°°Úִִ¿°°Úִִ¿°°³תתתתְִ¿±±ÚִÙתתתתתתתְִ¿²²Úִִִִִִ¿²²ְ¿תתתש        ÷
 ÷       שתתְִִÙתת³°°³תתְִִÙתתתתתת³±±³תתתתתתתתתתת³²²³תתתתתתֶ ²²³תתתש        ÷
 ÷       שתתתתתתתת³°°³תתתתתתתתתתתת³±±³תתתתתתתתתתת³²²ְִִִִִִÙ²²ÚÙתתתש        ÷
 ÷       שתתתתתתתת³°°³תתתתתתתתתתתת³±±³תתתתתתתתתתת³²²²²²²²²²²²ÚÙתתתתש        ÷
 ÷       שתתתתתתתת³°°³תתתתתתתתתתתת³±±³תתתתתתתתתתת³²²ÚִִִִִִִִÙתתתתתש        ÷
 ÷       שתתתתתתÚִÙ°°ְִ¿תתתתתתתתÚִÙ±±ְִ¿תתתתתתתÚִÙ²²ְִ¿תתתתתתתתתתתתש        ÷
 ÷       שתתתתתת³°°°°°°³תTEXTתתת³±±±±±±³תIMAGEת³²²²²²²³תPROCESSORתתש        ÷
 ÷       שתתתתתתְִִִִִִÙתתתתתתתתְִִִִִִÙתתתתתתתְִִִִִִÙתתתתתתתתתתתתש        ÷
 ÷       שתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתש        ÷
 ÷       ששששששששששששששששששששששששששששששששששששששששששששששששששששששששששש        ÷
 ÷                                                                          ÷
 ÷       FOCHI MICHELE                                                      ÷
 ÷       VERSIONE 1.0                          UNIT TIPHELP                 ÷
 ÷                                                                          ÷
 ָֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ¼}
{ Data:   14 Marzo 1993
  Ora:    17:24:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorHelp }

{ Gestisce le chiamate alle schermate di aiuto e tutti gli spostamenti
  all' interno di queste. I tasti sono F1, CTRL-F1, SHIFT-F1, ALT-F1,
  i tasti cursore, TAB e SHIFT-TAB, ESCAPE, e molti altri. Per
  ulteriori informazioni premere, una volta entrati nel programma,
  il tasto F1 che dar… una descrizione sommaria dell' utilizzo
  e della consultazione di un argomento }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Procedure Stato ( NumPgVideo: Byte;
		      Row:        Byte;
		      Col:        Byte;
		      Attr:       Byte;
		      SelCar:     Char;
		      Modify:     Boolean );

  - Procedure Help ( Argomento: String;
                     Tipo:      TipoEsciHelp ); }


{ Nome della unit }
Unit
     TIPHelp;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPHelp }

{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalit… testo }
     Crt,

     { Gestione del disco e della memoria, chiamate di sistema, ... }
     Dos,

     { Definizione delle costanti per i tasti }
     Keyboard,

     { Definizione delle costanti, tipi e variabili del programma TIP }
     TIPVar,

     { Gestione finestre e memoria video }
     TIPWin,

     { Gestione della memoria video e del cursore }
     TIPFast,

     { Gestione del mouse in Turbo Pascal }
     Mouse;


{----------------------------------------------------------------------------
  PROCEDURA: STATO

  Aggiorna il numero di riga, di colonna, di pagina, il colore corrente,
  l' ultimo carattere selezionato, lo stato dell' immagine (modificata
  o no), ecc., scrivendoli nell' ultima riga del video (riga di stato).
  Tutti questi campi vengono passati come parametro alla procedura.
 ----------------------------------------------------------------------------}
Procedure Stato ( NumPgVideo: Byte;
		  Row:        Byte;
		  Col:        Byte;
		  Attr:       Byte;
		  SelCar:     Char;
		  Modify:     Boolean );


{----------------------------------------------------------------------------
  PROCEDURA: HELP

  Apre una finestra di aiuto e visualizza l' argomento ARGOMENTO passato
  come parametro. Se non viene trovato nel file di aiuto, l' errore
   segnalato all' utente. Se il file dell' help non viene trovato
  all' inizio del programma (quando si digita da DOS il comando TIP),
  la variabile HELPONLINE viene settata a FALSE: in questo caso la
  pressione dei tasti F1, ALT-F1, CTRL-F1, SHIFT-F1 e ALT-H non avranno
  effetto sul programma.
  Per richiamare l' help si possono utilizzare 5 combinazioni di tasti:

    F1            Help generale
    ALT-F1        Help precedente
    CTRL-F1       Help specifico
    SHIFT-F1      Indice degli argomenti
    ALT-H         Help generale (solo nel menu principale).
 ----------------------------------------------------------------------------}
Procedure Help ( Argomento: String;
                 Tipo:      TipoEsciHelp );


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { ConvertT }


{----------------------------------------------------------------------------
  PROCEDURA: STATO

  Aggiorna il numero di riga, di colonna, di pagina, il colore corrente,
  l' ultimo carattere selezionato, lo stato dell' immagine (modificata
  o no), ecc., scrivendoli nell' ultima riga del video (riga di stato).
  Tutti questi campi vengono passati come parametro alla procedura.
 ----------------------------------------------------------------------------}
Procedure Stato ( NumPgVideo: Byte;
		  Row:        Byte;
		  Col:        Byte;
		  Attr:       Byte;
		  SelCar:     Char;
		  Modify:     Boolean );

{ Variabili locali }
Var

    { Appoggio per le conversioni }
    St:         String;

Begin { Stato }

{ Scrive le voci dei campi che in seguito verranno riempiti dal numero di
  pagine, di riga, di colonna, ecc. }
WriteStr(1,25,#16+' Pag:   Rig:   Col:   ³ Colore:   ³ F1:Help ESC:Menu'+
         ' ³     ³ ',Color.Status);
WriteStr(71,25,' ³ ',Color.Status);
WriteStr(79,25,' '+#017,Color.Status);

{ Aggiorna la riga di stato, scrivendo il numero di pagina, riga, colonna,
  il colore di foreground e background, di stato della pagina, ecc.
  L' orologio e i tasti speciali non vengono testati in questa procedura, in
  quanto vengono scritte da una specie di programma TSR: non lo  propria_
  mente in quanto viene eseguito solo durante l' eseguzione di TIP }

{ Viene scritto 'CB' (= ClipBoard) se la pagina  quella degli appunti,
  altrimenti il numero corrispondente }
If (NumPgVideo = PgClipBoard)
  Then
    St := 'CB'

{ Numero di pagina, compresa tra 1 e 10 }
Else
  Str(NumPgVideo:2,St);

If (NumPgVideo < 10)
  Then
    St[1] := '0';

WriteStr(7,25,St,Color.StatusSel);

{ Numero di riga }
Str(Row:2,St);

If (Row < 10)
  Then
    St[1] := '0';

WriteStr(14,25,St,Color.StatusSel);

{ Numero di colonna }
Str(Col:2,St);

If (Col < 10)
  Then
    St[1] := '0';

WriteStr(21,25,St,Color.StatusSel);

{ Colore di un carattere }
WriteChar(34,25,1,'‏',Attr);

{ Carattere selezionato, cio l' ultimo carattere visualizzato }
WriteChar(57,25,1,SelCar,Color.StatusSel);

{ Compare il carattere di codice ASCII 21 se l' immagine non  stata
  salvata, uno spazio in caso contrario }
If Modify
  Then

    { Modificata }
    WriteStr(59,25,#21,Color.StatusSel)

Else

  { Non modificata }
  WriteStr(59,25,' ',Color.StatusSel);

End; { Stato }


{----------------------------------------------------------------------------
  PROCEDURA: HELP

  Apre una finestra di aiuto e visualizza l' argomento ARGOMENTO passato
  come parametro. Se non viene trovato nel file di aiuto, l' errore
   segnalato all' utente. Se il file dell' help non viene trovato
  all' inizio del programma (quando si digita da DOS il comando TIP),
  la variabile HELPONLINE viene settata a FALSE: in questo caso la
  pressione dei tasti F1, ALT-F1, CTRL-F1, SHIFT-F1 e ALT-H non avranno
  effetto sul programma.
  Per richiamare l' help si possono utilizzare 5 combinazioni di tasti:

    F1            Help generale
    ALT-F1        Help precedente
    CTRL-F1       Help specifico
    SHIFT-F1      Indice degli argomenti
    ALT-H         Help generale (solo nel menu principale).
 ----------------------------------------------------------------------------}
Procedure Help ( Argomento: String;
                 Tipo:      TipoEsciHelp );

Var

    { Carattere premuto dall' utente }
    Ch1:               Char;

    { Carattere premuto dall 'utente }
    Ch2:               Char;

    { Indice per i cilci }
    I:                 Integer;

    { Linea dello schermo di help }
    St:                String;

    { Inizio della barra-posizione }
    Trovato:           Boolean;

    { Numero massimo di linee dell' argomento }
    MaxLines:          Integer;

    { Numero di linee lette dell' argomento }
    NumLine:           Integer;

    { Stringa vuota (80 spazi) }
    SpaceStr:          String080;

    { Pu• assumere i valori

      EsciHelp           per uscire dall' help,
      Altro              per andare ad un altro argomento,
      Precedente         per andare all' argomento precedente,
      AncoraPrecedente   per andare al precedente quando si  dentro
		         l' help,
      NonUscire          resta nell' help }
    EsciHelp:          TipoEsciHelp;

    { Appoggio per il disegno delle selezioni }
    App:               String;

    { Appoggio numerico }
    X:                 Integer;

    { Parola selezionata }
    Sel:               Integer;

    { Parola selezionata precedentemente }
    OldSel:            Integer;

    { Riferimenti dell' argomento }
    HelpRif:           PTRHelpRif;

    { Testo dell' argomento }
    HelpStr:           PTRHelpStr;

    { File di testo per l' help }
    FileHlp:           Text;

    { Numero massimo di riferimenti per l' argomento letto }
    MaxRif:            Integer;

    { Linea precedente }
    OldLine:           Integer;

    { Posizione sulla barra di scorrimento }
    PosBar:            Byte;

    { Posizione precedente sulla barra di scorrimento }
    OldPosBar:         Byte;

    { Tasto premuto dall' utente }
    Ch:                Char;

    { Stringa di ricerca rapida }
    StrSearch:         String049;

    { Stato della variabile 'AggiornaStatusLine' }
    OldAggiornaStatus: Boolean;

    { Pagina corrente, memorizzata per sicurezza }
    AppPage:           PTRFullPage;

    { Immagine reale nella memoria video }
    FisicoFull:        PTRFullPage;

    { Attendere il rilascio dei pulsanti del mouse ? }
    Attesa:            Boolean;

    { Coordinata dell' angolo in alto a sinistra dello schermo }
    OldWindMin:        Word;

    { Coordinata dell' angolo in basso a destra dello schermo }
    OldWindMax:        Word;

    { Posizione X del cursore }
    OldPosX:           Byte;

    { Posizione Y del cursore }
    OldPosY:           Byte;


Begin { Help }

{ Memorizzazione della dimensione dello schermo }
OldWindMin := WindMin;
OldWindMax := WindMax;

{ Memorizzazione delle coordinate del cursore }
OldPosX := WhereX;
OldPosY := WhereY;

{ Settaggi iniziali delle pagine video }
FisicoFull := PTR(Segmento,$0000);

New(AppPage);   { 4000 Byes }
AppPage^ := FisicoFull^;

OldAggiornaStatus := AggiornaStatusLine;
AggiornaStatusLine := True;

{ Se l' help on line  disponibile, ossia se c' il file opportuno ... }
If HelpOnLine
  Then
    Begin

    { Formazione di una stringa di 80 spazi }
    SpaceStr := '';
    For i := 1 To HlpXLun Do
      SpaceStr[i] := ' ';
    SpaceStr[0] := Chr(HlpXLun);

    New(HelpRif);    (* 5300 bytes *)
    New(HelpStr);    (* 10000 bytes *)

    Window(1,1,80,25);

    With Image^[NumPgVideo] Do
      Stato(NumPgVideo,Row,Col,Attr,SelCar,Modify);

    { Apre un quadro con effetto a scoppio al centro dello schermo }
    ApriQuadro(HlpXMin,HlpYMin,HlpXMax,HlpYMax,'[Help]',
               Color.HelpBord,Color.HelpText,Color.HelpTitle,Ritardo.WinStep,
	       Ritardo.Windows);

    CursorOFF;

    { Controllo se il file esiste su disco (non si sa mai) }
    Assign(FileHlp,NameHelpFile);

    {$I-} Reset(FileHlp); {$I+}

    { Se non esiste, avverti l' utente }
    If (IOResult <> 0)
      Then
        Begin

        { Finestra di dialogo per l' utente }
        With Color Do

          IF (Dialog('[ERRORE]',
	             '|'+
	             '               Il file di aiuto               |'+
	             '( '+NameHelpFile+' )|'+
	             'non  stato trovato|'+
	             'sul disco.||','','',
	             __OK__,WarningBord,WarningTitle,
	             WarningText,WarningSel,
	             WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then
                         ;

        EsciHelp := EsciHlp;

        End

    Else

      Begin

      If (Tipo = Precedente)
        Then
          EsciHelp := Precedente
      Else
        EsciHelp := Altro;

      { Fino a che l' utente non esce dall' help ... }
      While (EsciHelp In [Altro,Precedente,AncoraPrecedente]) Do
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
          For i := 1 To Length(St) Do
            St[i] := UpCase(St[i]);

	  If (St = Argomento)
	    Then
	      Trovato := True;
	  End;
        Delete(Argomento,1,Length('ARGOMENTO: '));

        { Se non lo trova avverte l' utente }
        If Not Trovato Then
	  Begin

          { Finestra di dialogo per l' utente }
          With Color Do
            If (Dialog('[ERRORE]',
	               '|'+
	               '               L''argomento               |'+
	               ''''+Argomento+'''|'+
	               'non  stato trovato|'+
	               'nel file di aiuto.||','','',
	               __OK__,WarningBord,WarningTitle,
	               WarningText,WarningSel,
	               WarningUnSel,WarningKeySel,
		       WarningKeyUnSel) = 1)

		         Then
                           ;

          EsciHelp := EsciHlp;

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
                                LastHelp^[i] := LastHelp^[i+1];

            Altro: Begin
                   For i := MaxLastHelp DownTo 2 Do
                     LastHelp^[i] := LastHelp^[i-1];
                   LastHelp^[1] := Argomento;
                   End;

            End; { Case EsciHelp }

          { Azzera le linee della pagina }
          For i := 1 To MaxNumLines Do
            HelpStr^[i] := StrNull;
          For i := 1 To MaxNumRif Do
            With HelpRif^[i] Do
	      Begin
	      Word := StrNull;
              Line := 0;
              OffSet := 0;
              End;

	  MaxLines := 0;
          MaxRif := 0;

          { Legge il testo dell' argomento e memorizza tutte le righe
            e i riferimenti }
          St := '';
          While (St <> 'FINE ARGOMENTO') Do
            Begin
	    Inc(MaxLines);
            While (Pos('<<',St) <> 0) Do
	      Begin
              Inc(MaxRif);

              { Determina i riferimenti, indicati con <<...>> }
              With HelpRif^[MaxRif] Do
                Begin
                Line := MaxLines;
                OffSet := Pos('<<',St);
                Word := Copy(St,Pos('<<',St)+2,Pos('>>',St)-Pos('<<',St)-2);
                Delete(St,Pos('<<',St),2);
                Delete(St,Pos('>>',St),2);
                End;
              End;
            While (Length(St) < HlpXLun) Do
              St := St+' ';
            HelpStr^[MaxLines] := St;
	    ReadLn(FileHlp,St);
	    End;


          NumLine := 1;
          OldLine := 0;
          Sel := 1;
          OldSel := 0;
          PosBar := 1;
          OldPosBar := 0;

	  EsciHelp := NonUscire;

          { Attende fino a che non  stata fatta una scelta ad un diverso
            argomento o fino alla pressione del tasto ESCAPE }
          CursorOFF;

          If (MaxLines <= HlpYLun)
            Then

              { Altrimenti, se non ci sono cio files da visualizzare,
	        viene lasciata vuota }
              Begin

	      { Stampa degli spazi }
	      For i := 2 To (HlpYLun-1) Do
	        WriteChar(HlpXLun+3,i,1,' ',Color.DirBar);

              { Stampa della freccia verso l' alto (codice ASCII 30) }
              WriteChar(HlpXLun+3,1,1,#30,Color.DirArrow);

              { Stampa della freccia verso il basso (codice ASCII 31) }
              WriteChar(HlpXLun+3,HlpYLun,1,#31,Color.DirArrow);

              { La vecchia posizione viene posta uguale a 1, valore
                iniziale }
              OldPosBar := 1;

              End;

          StrSearch := StrNull;

	  Repeat

            { Aggiorna lo schermo se c' stato un cambiamento di pagina }
	    If (OldLine <> NumLine)
	      Then
	        Begin

                If (MaxLines > HlpYLun)
                  Then
                    Begin

	            { Se non c' una vecchia posizione della barra a destra
                      significa che deve essere ristampata }
	            If (OldPosBar = 0)
	              Then
	                Begin

	                { Stampa degli spazi }
	                For i := 2 To (HlpYLun-1) Do
	                  WriteChar(HlpXLun+3,i,1,' ',Color.DirBar);

	                { Stampa della freccia verso l' alto (codice ASCII
                          30) }
	                WriteChar(HlpXLun+3,1,1,#30,Color.DirArrow);

	                { Stampa della freccia verso il basso (codice ASCII
                          31) }
	                WriteChar(HlpXLun+3,HlpYLun,1,#31,Color.DirArrow);

	                { La vecchia posizione viene posta uguale a 1, valore
                          iniziale }
	                OldPosBar := 1;

	                { Scrive il carattere }
	                WriteChar(HlpXLun+3,2,1,'ß',Color.DirBar);

	                End;

	            { Calcola la nuova posizione }
	            If (MaxLines > HlpYLun)
	              Then
	                PosBar := Round((NumLine-1)*(HlpYLun*2-4)/
                                        (MaxLines-HlpYLun))
	            Else
	              PosBar := 1;

	            { Aggiusta il risultato del calcolo per evitare errori }
	            If (PosBar = 0)
	              Then
	                PosBar := 1;

	            { Aggiorna la posizione, se  cambiata }
	            If (OldPosBar <> PosBar)
	              Then

                        Begin

	                { Decide quale carattere visualizzare: per avere uno
                          scorrimento del puntatore meno 'a scatto', si 
                          pensato di utilizzare i due caratteri 'Ü' e 'ß',
                          invece del solito 'Û'; uno  utilizzato quando la
                          posizione  pari, l' altra quando  dispari }
	                If ((PosBar Div 2) = (PosBar / 2))
	                  Then
		            Ch := 'Ü'

	                Else
	                  Ch := 'ß';

	                { Scrive uno spazio per cancellare la vecchia
                          posizione }
	                WriteChar(HlpXLun+3,1+Round(OldPosBar/2),1,' ',
                                  Color.DirBar);

	                { Scrive il nuovo carattere alla giusta posizione }
	                WriteChar(HlpXLun+3,1+Round(PosBar/2),1,Ch,
                                  Color.DirBar);

	                End;

	            { Memorizza la posizione del puntatore precedente }
	            OldPosBar := PosBar;
                    End;

                { Scrittura del testo letto }
                For i := 1 To HlpYLun Do
	          If ((i+NumLine-1) > MaxLines)
		    Then
                      WriteStr(1,i,' '+SpaceStr+' ',Color.HelpText)
                  Else
                    WriteStr(1,i,' '+HelpStr^[i+NumLine-1]+' ',
                             Color.HelpText);

                { Scrittura dei riferimenti della pagina visualizzata }
                For i := 1 To MaxRif Do
                  With HelpRif^[i] Do
                    If ((Line >= NumLine) And (Line <= NumLine+HlpYLun))
                      Then
		        WriteStr(OffSet+1,Line-NumLine+1,Word,
                                 Color.HelpUnSel);

                OldSel := 0;
                End;

            { Se  stata selezionata una nuova parola chiave ... }
            If (OldSel <> Sel)
              Then

                Begin

                { Ripristino, se necessario, della parola chiave precedente }
                If (OldSel > 0)
                  Then
                    With HelpRif^[OldSel] Do
                      If ((Line >= NumLine) And (Line <= NumLine+HlpYLun))
                        Then
		          WriteStr(OffSet+1,Line-NumLine+1,Word,
                                   Color.HelpUnSel);

                { Scrittura della nuova }
                With HelpRif^[Sel] Do
                  If ((Line >= NumLine) And (Line <= NumLine+HlpYLun))
                    Then
		      WriteStr(OffSet+1,Line-NumLine+1,Word,Color.HelpSel);
                End;

            { Attende la pressione di un tasto permesso o la pressione
              di un pulsante del mouse }
	    Attendi(Ch1,Ch2,SHelp);

            { Aggiornamento delle variabili }
            OldLine := NumLine;
            OldSel := Sel;

            { Controllo della pressione del mouse ... }
            If MousePressed Then
              Begin

              { E' stato premuto il pulsante di sinistra ? }
              If LeftButton
                Then
                  Begin

                  { Inibizione della tastiera }
                  Ch1 := kNull;
                  Ch2 := kNull;
                  Attesa := True;

                  { Parte superiore: cursore su }
                  If ((MouseTextX = (HlpXMax-1)) And
                      (MouseTextY = (HlpYMin+1)))
                        Then

                          Begin
                          Ch1 := kNull;
                          Ch2 := kUp;
                          Attesa := False;
                          End

                  Else

                    { Parte inferiore: cursore gi— }
                    If ((MouseTextX = (HlpXMax-1)) And
                        (MouseTextY = (HlpYMax-1)))
                          Then

                            Begin
                            Ch1 := kNull;
                            Ch2 := kDown;
                            Attesa := False;
                            End

                  Else

                    { Controllo di tutte le parole chiavi }
                    For i := 1 To MaxRif Do
                      With HelpRif^[i] Do
                        If ((Line-NumLine+1) = (MouseTextY-2))
                          Then
                            If ((MouseTextX >= (Offset+14)) And
                                (MouseTextX < (Offset+14+Length(Word))))
                                  Then
                                    Begin

                                    { La parola  gi… evidenziata ? }
                                    If (Sel = i)
                                      Then

                                        { Si: altro argomento }
                                        Ch1 := kReturn

                                    Else

                                      { No: spostamento }
                                      Sel := i;

                                    End;

                  End

              Else

                { E' stato premuto il pulsante di destra ? }
                If RightButton
                  Then
                    Begin

                    { Simulazione uscita dalla procedura }
                    Ch1 := kEscape;
                    EsciHelp := EsciHlp;

                    End;

              { Rilascia i pulsanti del mouse }
              If Attesa
                Then
                  While MousePressed Do
                    GetMPos
              Else
                Delay(50);

              End;

            { A seconda del tasto premuto ... }
 	    Case Ch1 Of
	      kNull: Case Ch2 Of

                       { Su: sposta il testo di una riga verso l' alto }
		       kUp: If (NumLine > 1)
		              Then
				Begin
				Dec(NumLine);
                                With HelpRif^[Sel] Do
                                  If (Line > NumLine+HlpYLun-1)
                                    Then
                                      If (Sel > 1)
                                        Then
                                          Dec(Sel);
                                End;

                       { Gi—: sposta il testo di una riga verso il basso }
		       kDown: If (NumLine < (MaxLines-HlpYLun+1))
			        Then
                                  Begin

				  Inc(NumLine);

                                  With HelpRif^[Sel] Do
                                    If (Line < NumLine)
                                      Then
                                        If (Sel < MaxRif)
                                          Then
                                            Inc(Sel);

                                  End;

                       { Pagina Su: sposta il testo di una pagina verso
                                    l' alto }
		       kPgDown: Begin

		                If ((NumLine+HlpYLun) <=
			           (MaxLines-HlpYLun+1))
                                     Then
				       Inc(NumLine,HlpYLun)
			        Else
				  NumLine := MaxLines-HlpYLun+1;

                                If (NumLine <> OldLine)
                                  Then

                                    For i := Sel To (MaxRif-1) Do

                                      With HelpRif^[i] Do

                                        If (Line < NumLine)
                                          Then
                                            If (i < MaxRif)
                                              Then
                                                Sel := i+1;

                                End;


                       { Pagina Gi—: sposta il testo di una pagina verso
                                     il basso }
		       kPgUp: Begin

		              If ((NumLine-HlpYLun) > 1)
		                Then
			          Dec(NumLine,HlpYLun)
			      Else
			        NumLine := 1;

                              If (NumLine <> OldLine)
                                Then

                                  For i := Sel DownTo 2 Do

                                    With HelpRif^[i] Do

                                      If (Line > NumLine+HlpYLun-1)
                                        Then
                                          If (i > 1)
                                            Then
                                              Sel := i-1;

                                End;

                       { Home: sposta il testo alla prima riga }
		       kHome: Begin
		              NumLine := 1;

                              If (NumLine <> OldLine)
                                Then

                                  For i := Sel DownTo 2 Do

                                    With HelpRif^[i] Do

                                      If (Line > NumLine+HlpYLun-1)
                                        Then
                                          If (i > 1)
                                            Then
                                              Sel := i-1;

                              End;

                       { End: sposta il testo all' ultima riga }
		       kEnd: Begin

		             NumLine := MaxLines-HlpYLun+1;

                             If (NumLine <> OldLine)
                               Then

                                 For i := Sel To (MaxRif-1) Do

                                   With HelpRif^[i] Do

                                     If (Line < NumLine)
                                       Then
                                         If (i < MaxRif)
                                           Then
                                             Sel := i+1;

                             End;

                       { SHIFT-Tab: sposta la selezione alla parola chiave
                                    precedente }
		       kSTab: If (Sel > 1)
		                Then
                                  Dec(Sel);

                       { ALT-F1: argomento precedente dell' help }
                       kAF1: EsciHelp := AncoraPrecedente;

                       { SHIFT-F1: indice degli argomenti }
                       kSF1: EsciHelp := EsciHlp;

		       End;

              { Escape: uscita dall' help }
	      kEscape: EsciHelp := EsciHlp;

              { Return: passa all' argomento selezionato dalla parola
                        chiave }
	      kReturn: EsciHelp := Altro;

              { Tab: sposta la selezione alla parola chiave successiva }
	      kTab: If (Sel < MaxRif)
	              Then
		        Inc(Sel);

              { Un qualsiasi altro tasto viene utilizzato per la ricerca rapida
	        del file }
              Else

	        Begin

	        { Inizializzazione: non  stato trovato }
	        Trovato := False;

	        { Se la stringa  nulla allora la posizione  1 }
	        If (StrSearch = StrNull)
	          Then
	            Sel := 1;

	        { Se il tasto  diverso da DEL, viene aggiunto al nome del
	          file di ricerca rapida }
	        If (Ch1 <> kDel)
	          Then
	            Begin

	            { Semprech il file non sia completo (12 caratteri con il
	              punto) }
	            If (Length(StrSearch) < HlpXLun)
	              Then
		        StrSearch := StrSearch+UpCase(Ch1);

	            End

	        Else

	          { Se  stato premuto il tasto DEL viene cancellato l' ultimo
	            carattere del nome del file di ricerca rapida, semprech
	            sia diverso dalla stringa nulla }
	          Begin

	          If (StrSearch <> StrNull)
	            Then
	              Delete(StrSearch,Length(StrSearch),1)

	          End;

	        { Ricerca in tutta la directory il file specificato }
	        For i := MaxRif DownTo 1 Do

	          Begin

	          St := HelpRif^[i].Word;

	          { ... e controlla se  il file cercato }
	          If (Pos(StrSearch,St) = 1)
	            Then

	              Begin
	              Sel := i;
	              Trovato := True;
	              End;

	          End;

	        { Se non  stato trovato nessun fle che corrisponde alla
	          descrizione specificata, il nome non viene aggiornato, e
	          il carattere digitato non viene contato }
	        If Not Trovato Then
	          Delete(StrSearch,Length(StrSearch),1);

	        End;

              End; { Case Ch1 }


          If (Ch1 = kNull)
            Then
	      StrSearch := StrNull;

          { Controllo della parola selezionata }
          If ((OldSel <> Sel) And (Not ((Ch1 = kNull) And (Ch2 In [kUp,
	     kDown,kPgUp,kPgDown,kHome,kEnd]))))

            Then

              Begin

 	      If (NumLine >= HelpRif^[Sel].Line)
	        Then

                  { Testo verso l' alto }
                  Begin
                  If (NumLine < 1)
		    Then
		      NumLine := 1
		  Else
		    NumLine := HelpRif^[Sel].Line;
                  End

              Else

 		If (HelpRif^[Sel].Line > (NumLine+HlpYLun-1))
		  Then

                    { Testo verso il basso }
                    Begin
                    If (NumLine+HlpYLun-1 > MaxLines)
		      Then
                        NumLine := MaxLines-HlpYLun+1
                    Else
		      NumLine := HelpRif^[Sel].Line-HlpYLun+1
		    End;

              End;

	  Until (EsciHelp In [Altro,EsciHlp,Precedente,AncoraPrecedente]);

          Case EsciHelp Of

            { Uscita dall' help oppure indice degli argomenti }
	    EsciHlp: If (Ch1 = kNull) And (Ch2 = kSF1)
                       Then
		         Begin
	                 Argomento := 'Indice';
                         EsciHelp := Altro;
                         End;

            { Help per la parola chiave evidenziata }
            Altro: Argomento := HelpRif^[Sel].Word;

            { Help precedente }
            AncoraPrecedente: Argomento := LastHelp^[2];

            End; { Case EsciHelp }

        End;

      End;

      { Chiude il file di testo }
      Close(FileHlp);
      End;

    Dispose(HelpStr);   (* 10000 bytes *)
    Dispose(HelpRif);   (* 5300 bytes *)

    End;

{ Ripristino della dimensione originale dello schermo }
Window(Lo(OldWindMin)+1,Hi(OldWindMin)+1,
       Lo(OldWindMax)+1,Hi(OldWindMax)+1);

{ Ripristino delle coordinate del cursore }
GoToXY(OldPosX,OldPosY);

AggiornaStatusLine := OldAggiornaStatus;

FisicoFull^ := AppPage^;
Dispose(AppPage); { 4000 Byes }

End; { Help }

End. { TIPHelp }

