{╔══════════════════════════════════════════════════════════════════════════╗
 ║                                                                          ║
 ║       ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙        ║
 ║       ∙·························································∙        ║
 ║       ∙··┌──────────────┐····┌──────┐·······┌─────────────┐·····∙        ║
 ║       ∙··│░░░░░░░░░░░░░░│····│▒▒▒▒▒▒│·······│▓▓▓▓▓▓▓▓▓▓▓▓▓└┐····∙        ║
 ║       ∙··│░░┌──┐░░┌──┐░░│····└─┐▒▒┌─┘·······└─┐▓▓┌──────┐▓▓└┐···∙        ║
 ║       ∙··└──┘··│░░│··└──┘······│▒▒│···········│▓▓│······╞ ▓▓│···∙        ║
 ║       ∙········│░░│············│▒▒│···········│▓▓└──────┘▓▓┌┘···∙        ║
 ║       ∙········│░░│············│▒▒│···········│▓▓▓▓▓▓▓▓▓▓▓┌┘····∙        ║
 ║       ∙········│░░│············│▒▒│···········│▓▓┌────────┘·····∙        ║
 ║       ∙······┌─┘░░└─┐········┌─┘▒▒└─┐·······┌─┘▓▓└─┐············∙        ║
 ║       ∙······│░░░░░░│·TEXT···│▒▒▒▒▒▒│·IMAGE·│▓▓▓▓▓▓│·PROCESSOR··∙        ║
 ║       ∙······└──────┘········└──────┘·······└──────┘············∙        ║
 ║       ∙·························································∙        ║
 ║       ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙        ║
 ║                                                                          ║
 ║       FOCHI MICHELE                                                      ║
 ║       VERSIONE 1.0                          UNIT TIPINIT                 ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   20 Febbraio 1993
  Ora:    21:22:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorInitializeProgram }

{ Inizializza le variabili di memoria, legge e scrive il file di
  configurazione nella directory corrente, controlla i colori, i ritardi,
  i pathes, ecc. }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Procedure WriteCar ( Carattere: Char );

    - Procedure Beep;

    - Procedure SetStandardColors;

    - Procedure CheckHelpFile;

    - Function  ModifyColor ( OldAttr: Byte;
                              NewAttr: Byte;
                              Row:     Byte;
                              Col:     Byte ): Byte;

    - Procedure ApriFileMaschera ( NomeFile: String;
                                   PgVideo:  Byte );

    - Procedure ApriFileTesto ( NomeFile: String;
                                PgVideo:  Byte ); }


{ Nome della unit }
Unit
     TIPInit;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPInit }

{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalità testo }
     Crt,

     { Gestione del disco, memoria, chiamate di sistema, ... }
     Dos,

     { Definizione delle costanti per i tasti }
     Keyboard,

     { Definizione delle costanti, tipi e variabili del programma TIP }
     TIPVar,

     { Gestione finestre e memoria video }
     TIPWin,

     { Gestione della memoria video e del cursore }
     TIPFast,

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse,

     { Input di una stringa con comandi di editing }
     TIPInStr,

     { Input di un nome di file e visualizzazione della directory }
     TIPInFil;


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.CAR

  Scrive il carattere CARATTERE passato come parametro sul video ed aggiorna
  la riga e la colonna.
 ----------------------------------------------------------------------------}
Procedure WriteCar ( Carattere: Char );


{----------------------------------------------------------------------------
  PROCEDURA: BEEP

  Produce un BEEP, un suono di 1000 Hz per circa 300 millisecondi
 ----------------------------------------------------------------------------}
Procedure Beep;


{----------------------------------------------------------------------------
  PROCEDURA: SET.STANDARD.COLORS

  Riporta i colori ai valori di default, quelli cioè memorizzati nel codice
  del programma.
 ----------------------------------------------------------------------------}
Procedure SetStandardColors;


{----------------------------------------------------------------------------
  PROCEDURA: CHECK.HELP.FILE

  Controlla se il file che contiene le schermate di aiuto esiste o no sul
  disco: se non esiste si può digitare il nuovo percorso oppure si può
  decidere di non utilizzarlo durante l' eseguzione del programma.
 ----------------------------------------------------------------------------}
Procedure CheckHelpFile;


{----------------------------------------------------------------------------
  FUNZIONE: MODIFY.COLOR

  Permette di modificare i colori delle finestre, del testo in esse, del
  testo dei menu, delle pagine attive, e tutti i colori presenti (sono
  circa una cinquantina).
 ----------------------------------------------------------------------------}
Function  ModifyColor ( OldAttr: Byte;
                        NewAttr: Byte;
                        Row:     Byte;
                        Col:     Byte ): Byte;


{----------------------------------------------------------------------------
  PROCEDURA: APRI.FILE.MASCHERA

  Ricerca sul disco il file specificato da NOMEFILE nella pagine video
  PGVIDEO. Se il file non esiste fisicamente, o se è stato specificato un
  percorso inesistente, viene visualizzato un messaggio di errore.
  Se la pagina PGVIDEO è stata modificata viene chiesto se si desidera
  procedere con la lettura del file o no.
  Prima di caricare il file viene controllato che sia il tipo supportato
  dal programma (file maschera).
 ----------------------------------------------------------------------------}
Procedure ApriFileMaschera ( NomeFile: String;
                             PgVideo:  Byte );


{----------------------------------------------------------------------------
  PROCEDURA: APRI.FILE.TESTO

  Ricerca sul disco il file specificato da NOMEFILE nella pagine video
  PGVIDEO. Se il file non esiste fisicamente, o se è stato specificato un
  percorso inesistente, viene visualizzato un messaggio di errore.
  Se la pagina PGVIDEO è stata modificata viene chiesto se si desidera
  procedere con la lettura del file o no.
  Non viene fatto nessun controllo sul tipo di file specificato.
 ----------------------------------------------------------------------------}
Procedure ApriFileTesto ( NomeFile: String;
                          PgVideo:  Byte );


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPInit }


{----------------------------------------------------------------------------
  PROCEDURA: APRI.FILE.TESTO

  Ricerca sul disco il file specificato da NOMEFILE nella pagine video
  PGVIDEO. Se il file non esiste fisicamente, o se è stato specificato un
  percorso inesistente, viene visualizzato un messaggio di errore.
  Se la pagina PGVIDEO è stata modificata viene chiesto se si desidera
  procedere con la lettura del file o no.
  Non viene fatto nessun controllo sul tipo di file specificato.
 ----------------------------------------------------------------------------}
Procedure ApriFileTesto ( NomeFile: String;
                          PgVideo:  Byte );
{ Variabili locali }
Var

    { File di testo per la lettura }
    FileTXT:  Text;

    { Stringa di appoggio per la lettura }
    St:       String;

    { Numero di linee lette }
    NumLines: Byte;

Begin { ApriFileTesto }

{ Se è diverso dalla stringa nulla }
If (NomeFile <> StrNull)
  Then
    Begin

    { Assegnazione del file sul disco ad un nome logico }
    Assign(FileTXT,NomeFile);

    { Lettura del file }
    {$I-}  Reset(FileTXT);  {$I+}

    { Se non esiste sul disco viene visualizzato un messaggio di errore }
    If (IOResult <> 0)
      Then

	Begin

	{ Finestra di dialogo per l' utente }
        With Color Do
          If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               Il file specificato               |'+
		     '( '+NomeFile+' )|'+
		     'non esiste sul disco.|','','',
		     __OK__,WarningBord,WarningTitle,
		     WarningText,WarningSel,
		     WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then

		         ;

	End

    Else

      { Se esiste, invece, lo legge }
      Begin

      { Se la pagina video è stata modificata ma non salvata, chiede
	se si è disposti a rinunciare alle modifiche apportare }
      If Image^[PgVideo].Modify
	Then

	  Begin

	  { Visualizza una finestra di dialogo che chiede se si vogliono
	    veramente annullare le modifiche apportare al programma. In
	    caso affermativo setta il campo MODIFY del record dell' immagine
	    IMAGE^ a TRUE.
	    In questo modo, se si testa la variabile booleana, si conclude
	    che l' immagine è stata salvata (questo teoricamente) }
	  With Image^[PgVideo] Do

	    { Viene deciso il nome del file della pagina corrente }
	    If (FileName <> StrNull) Then
	      St := '( '+FileName+' )|'

	    Else

	      { Altrimenti, se non esiste, viene visualizzato un altro
		messaggio }
	      St := '( nessun nome di file non assegnato )|';

	  { Finestra di dialogo per l' utente }
          With Color Do
            If (Dialog('[AVVERTENZA]',
		       '|'+
		       '               L'' immagine corrente               |'+
		       St+
		       'non è stata salvata su disco.|'+
		       '|'+
		       'Continui ugualmente ?|','','',
		       __SI_NO__,WarningBord,WarningTitle,
		       WarningText,WarningSel,
		       WarningUnSel,WarningKeySel,
		       WarningKeyUnSel) = 1)

		         Then

			   { Aggiorna lo stato della pagina (modificata) }
			   Image^[PgVideo].Modify := False;

	  End;

      { Alla risposta affermativa dell' ultima domanda viene letto il
	file, altrimenti non viene fatto niente }
      If (Not (Image^[PgVideo].Modify))
	Then

	  Begin

	  { Messaggio per l' utente }
	  Info(' Lettura del file '+NomeFile+' ...',Color.Performing);
	  Delay(Ritardo.Messaggi);

	  { Cancella lo schermo }
	  TextAttr := Color.Default;
	  ClrScr;

	  { Inizializza a 0 il numero di linee lette dal file }
	  NumLines := 0;

	  { Legge le righe del file di testo }
	  While ((Not EOF(FileTXT)) And (NumLines < 24)) Do

	    Begin

	    { Incrementa il numero di linee lette dal file }
	    Inc(NumLines);

	    { Legge una linea }
	    ReadLn(FileTXT,St);

	    { La scrive sul video }
	    WriteStr(1,NumLines,St,Color.Default);

	    End;

	  { Chiude il file }
	  Close(FileTXT);

          With Image^[PgVideo] Do
            Begin
            Page := Fisico^;
            Maschera := False;
            FileName := NomeFile;
            End;

	  End;

      End;

    Fisico^ := Image^[PgVideo].Page;

    End;

End; { ApriFileTesto }


{----------------------------------------------------------------------------
  PROCEDURA: APRI.FILE.MASCHERA

  Ricerca sul disco il file specificato da NOMEFILE nella pagine video
  PGVIDEO. Se il file non esiste fisicamente, o se è stato specificato un
  percorso inesistente, viene visualizzato un messaggio di errore.
  Se la pagina PGVIDEO è stata modificata viene chiesto se si desidera
  procedere con la lettura del file o no.
  Prima di caricare il file viene controllato che sia il tipo supportato
  dal programma (file maschera).
 ----------------------------------------------------------------------------}
Procedure ApriFileMaschera ( NomeFile: String;
                             PgVideo:  Byte );

{ Variabili locali }
Var

    { File strutturato per la lettura }
    FileMSK:     FileStructMSK;

    { File di testo di appoggio }
    FileTXT:     Text;

    { Record appoggio per il file maschera }
    AppRecFile:  PTRRecFile;

    { Stringa di appoggio per il nome del file }
    St:      String;

    { Carattere appoggio }
    Ch: Char;


Begin { ApriFileMaschera }

{ Se è diverso dalla stringa nulla }
If (Nomefile <> StrNull)
  Then
    Begin

    { Assegnazione del file sul disco ad un nome logico }
    Assign(FileMSK,NomeFile);

    { Lettura del file }
    {$I-}  Reset(FileMSK);  {$I+}

    { Se non esiste sul disco viene visualizzato un messaggio di errore }
    If (IOResult <> 0)
      Then

	Begin

	{ Finestra di dialogo per l' utente }
        With Color Do
          If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               Il file specificato               |'+
		     '( '+NomeFile+' )|'+
		     'non esiste sul disco.|','','',
		     __OK__,WarningBord,WarningTitle,
		     WarningText,WarningSel,
		     WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then

		         ;

	End

    Else

      { Se esiste, invece, lo legge }
      Begin

      { Se la pagina video è stata modificata ma non salvata, chiede
	se si è disposti a rinunciare alle modifiche apportare }
      If Image^[PgVideo].Modify
	Then

	  Begin

	  { Visualizza una finestra di dialogo che chiede se si vogliono
	    veramente annullare le modifiche apportare al programma. In
	    caso affermativo setta il campo MODIFY del record dell' immagine
	    IMAGE^ a TRUE.
	    In questo modo, se si testa la variabile booleana, si conclude
	    che l' immagine è stata salvata (questo teoricamente) }
	  With Image^[PgVideo] Do

	    { Viene deciso il nome del file della pagina corrente }
	    If (FileName <> StrNull) Then
	      St := '( '+FileName+' )|'

	    Else

	      { Altrimenti, se non esiste, viene visualizzato un altro
		messaggio }
	      St := '( nessun nome di file non assegnato )|';

	  { Finestra di dialogo per l' utente }
          With Color Do
	    If (Dialog('[AVVERTENZA]',
		       '|'+
		       '               L'' immagine corrente               |'+
		       St+
		       'non è stata salvata su disco.|'+
		       '|'+
		       'Continui ugualmente ?|','','',
		       __SI_NO__,WarningBord,WarningTitle,
		       WarningText,WarningSel,
		       WarningUnSel,WarningKeySel,
		       WarningKeyUnSel) = 1)

		         Then

			   { Aggiorna lo stato della pagina (modificata) }
			   Image^[PgVideo].Modify := False;

	  End;

      { Alla risposta affermativa dell' ultima domanda viene letto il
	file, altrimenti non viene fatto niente }
      If (Not (Image^[PgVideo].Modify))
	Then

	  Begin

          New(AppRecFile); { 3848 Bytes }

	  { Messaggio per l' utente }
	  Info(' Lettura del file '+NomeFile+' ...',Color.Performing);
	  Delay(Ritardo.Messaggi);

          { Assegnazione del file sul disco ad un nome logico }
          Assign(FileTXT,NomeFile);
          {$I-}  Reset(FileTXT); {$I+}

          If (IOResult = 0)
            Then
              Begin

              { Legge l' intestazione (header) del file per controllare
                che sia un file maschera supportato dal programma }
              Read(FileTXT,Ch);
              Read(FileTXT,AppRecFile^.Header);
              Close(FileTXT);

              { Se non è un tipo di file valido ... }
              If (AppRecFile^.Header <> HeaderValue)
                Then

                  Begin

	          { Finestra di dialogo per l' utente }
                  With Color Do
	            If (Dialog('[AVVERTENZA]',
		               '|'+
		               '               Il file specificato               |'+
		               '( '+NomeFile+' )|'+
		               'non è un file maschera.|','','',
		               __OK__,WarningBord,WarningTitle,
		               WarningText,WarningSel,
                               WarningUnSel,WarningKeySel,
                               WarningKeyUnSel) = 1)

		                 Then

                                   ;

                  End

              Else
                Begin

                { Lettura del file }
                {$I-}  Reset(FileMSK);  {$I+}

	        { Legge il record }
	        Read(FileMSK,AppRecFile^);

	        { Chiude il file }
	        Close(FileMSK);

                { Aggiorna il record della pagina video nello heap }
                With Image^[PgVideo] Do

                  Begin
                  Page := AppRecFile^.Page;
                  Maschera := True;
                  FileName := NomeFile;
                  End;

                End;

              Dispose(AppRecFile); { 3848 Bytes }

              End

            Else

	          { Finestra di dialogo per l' utente }
                  With Color Do
	            If (Dialog('[AVVERTENZA]',
		               '|'+
		               '               Errore di disco durante               |'+
		               'la lettura del file|'+
		               ''+NomeFile+'.|','','',
		               __OK__,WarningBord,WarningTitle,
		               WarningText,WarningSel,
		               WarningUnSel,WarningKeySel,
			       WarningKeyUnSel) = 1)

		                 Then

                                   ;

	  End;

      End;

    Fisico^ := Image^[PgVideo].Page;

    End;

End; { ApriFileMaschera }


{----------------------------------------------------------------------------
  PROCEDURA: SET.STANDARD.COLORS

  Riporta i colori ai valori di default, quelli cioè memorizzati nel codice
  del programma.
 ----------------------------------------------------------------------------}
Procedure SetStandardColors;
Begin { SetStandardColors }

{ Definisce tutti i colori }
With Color Do
		  { ForeGround } { BackGround }   { Lampeggio }
  Begin

  Default          := LightGray    + Black     * 16        ;
  Cancel           := Black        + Black     * 16        ;
  UserInfo         := Yellow       + Black     * 16        ;
  Error            := LightRed     + Black     * 16        ;
  Performing       := LightGreen   + Black     * 16        ;
  InputField       := Yellow       + Black     * 16        ;
  InputDigit       := Yellow       + Blue      * 16        ;
  InputArrow       := LightCyan    + Black     * 16        ;
  MenuBord         := LightCyan    + Black     * 16        ;
  MenuTitle        := LightGreen   + Black     * 16        ;
  MenuSel          := Yellow       + Red       * 16        ;
  MenuUnSel        := LightGray    + Blue      * 16        ;
  MenuKeySel       := White        + Red       * 16        ;
  MenuKeyUnSel     := White        + Blue      * 16        ;
  MenuText         := White        + Blue      * 16        ;
  MenuSelUnSel     := Yellow       + Black     * 16        ;
  Status           := Yellow       + Black     * 16        ;
  StatusSel        := LightCyan    + Black     * 16        ;
  FileArrow        := White        + Blue      * 16        ;
  DirArrow         := Yellow       + Blue      * 16        ;
  DirBar           := Yellow       + Red       * 16        ;
  DirInfo          := Cyan         + Black     * 16        ;
  Dir              := LightGray    + Black     * 16        ;
  NoFiles          := LightGreen   + Black     * 16        ;
  Search           := LightMagenta + Black     * 16        ;
  WarningBord      := White        + Black     * 16        ;
  WarningTitle     := Yellow       + Black     * 16        ;
  WarningSel       := LightGreen   + Red       * 16        ;
  WarningUnSel     := LightGray    + Blue      * 16        ;
  WarningKeySel    := White        + Red       * 16        ;
  WarningKeyUnSel  := White        + Blue      * 16        ;
  WarningText      := White        + Blue      * 16        ;
  ColoriBlinkON    := LightGreen   + Red       * 16 + Blink;
  ColoriBlinkOFF   := LightGreen   + Black     * 16        ;
  BlockBord        := Yellow       + Black     * 16        ;
  BlockArrow       := LightGreen   + Black     * 16        ;
  BlockAngle       := LightMagenta + Magenta   * 16        ;
  HelpBord         := LightBlue    + Black     * 16        ;
  HelpTitle        := Yellow       + Black     * 16        ;
  HelpSel          := Black        + White     * 16        ;
  HelpUnSel        := White        + Black     * 16        ;
  HelpText         := LightGreen   + Blue      * 16        ;
  SpecTitle        := LightGreen   + Black     * 16        ;
  SpecText         := LightCyan    + Red       * 16        ;
  SpecSel          := Yellow       + Red       * 16        ;

  End;

End; { SetStandardColors }


{----------------------------------------------------------------------------
  PROCEDURA: CHECK.HELP.FILE

  Controlla se il file che contiene le schermate di aiuto esiste o no sul
  disco: se non esiste si può digitare il nuovo percorso oppure si può
  decidere di non utilizzarlo durante l' eseguzione del programma.
 ----------------------------------------------------------------------------}
Procedure CheckHelpFile;

{ Variabili locali }
Var

    { Appoggio per testare se si è verificato un errore }
    NoError:    Boolean;

    { Tasto premuto dall' utente }
    Ch1:        Char;

    { Tasto esteso premuto dall' utente }
    Ch2:        Char;

    { Stringa per la directory }
    DirString:  DirStr;     { = String[67] }

    { Stringa per il nome }
    NameString: NameStr;    { = String[8] }

    { Stringa per l' estensione }
    ExtString:  ExtStr;     { = String[3] }

    { Intestazione del file }
    StHeader:   HeaderStr;


Begin { CheckHelpFile }

{ Imposta i default: nessun errore e nome del file dell' help iniziale }
NoError := False;
NameHelpFile := InitNameHelpFile;

{ Ripete fino a che non è stata presa una decisione: digirate un nuovo
  path (valido) o non utilizzare l' help durante l' eseguzione del
  programma }
Repeat

  { Assegnazione del file }
  Assign(HelpFile,NameHelpFile);
  NoError := False;

  { Controllo della sua presenza sul disco }
  {$I-} Reset(HelpFile); {$I+}

  { Se c'è stato un errore visualizza un messaggio per l' utente ed
    attendi una sua scelta }
  If (IOResult <> 0)
    Then
      Begin
      NoError := False;
      HelpOnLine := False;
      End
  Else
    { Se esiste visualizza un messaggio affermativo }
    Begin

    { Messaggio per l' utente }
    Beep;

    Read(HelpFile,StHeader);

    { Controllo del file di aiuto }
    If (StHeader = HeaderValue)
      Then

        { File di aiuto valido }
        Begin

        Info(' Help trovato!',Color.Performing);
        Delay(Ritardo.Messaggi);

        { Setta le variabili opportunamente }
        NoError := True;
        HelpOnLine := True;
        Close(HelpFile);

        End
    Else

      { File di aiuto non valido }
      Begin

      Close(HelpFile);

      { Messaggio per l' utente }
      Info(' File di aiuto invalido!',Color.Performing);
      Delay(Ritardo.Messaggi);

      Attendi(Ch1,Ch2,SNothing);

      NoError := False;
      HelpOnLine := False;
      End;

    End;

  { Se c'è stato un qualsiasi errore nella lettura del file ... }
  If ((Not NoError) Or (Not HelpOnLine))

    Then

      { Non esiste sul disco }
      Begin

      { Messaggio per l' utente con BEEP }
      AggiornaStatusLine := False;
      Beep;
      Info(' Help non trovato! Riprovi, Percorso o Abbandoni ? '+
	   '(R,P,A) ?',Color.Error);

      { Attende la pressione di una delle lettere D, R o A, sia minuscole
	sia maiuscole }
      Repeat
	Attendi(Ch1,Ch2,SNothing);
      Until Ch1 In ['r','R','p','P','a','A'];

      Case Ch1 Of

	{ Lettera R: Riprova }
	'r','R': Begin
		 NoError := False;
		 HelpOnLine := False;
		 End;

	{ Lettera A: Help non disponibile }
	'a','A': Begin
		 NoError := True;
		 HelpOnLine := False;
		 End;

	{ Lettera D: Digitazione di un nuovo drive/percorso }
	'p','P': Begin

		 { Aggiusta il drive/percorso già esistente }
		 FSplit(NameHelpFile,DirString,NameString,ExtString);
		 NameHelpFile := DirString;

		 { Editing del drive/percorso }
		 NameHelpFile := InputString(' Path (senza nome del file):  ',
					     Color.InputField,40,255,
					     NameHelpFile,Color.InputDigit,
					     Color.InputArrow,SetCarPath);

		 { Aggiusta il path immesso: se è stato premuto il tasto
		   ESCAPE, significa che non si vuole l' help }
		 If (NameHelpFile = kNull)
		   Then
		     Begin
		     NoError := True;
		     HelpOnLine := False;
		     End

		 { Altrimenti si guarda se il path è corretto }
		 Else

		   Begin

		   { Elimina gli spazi in più }
		   While (Pos(' ',NameHelpFile) <> 0) Do
		     Delete(NameHelpFile,Pos(' ',NameHelpFile),1);

		   { Se il path digitato era fatto solo di spazi, viene
		     richiesto dinuovo }
		   If (NameHelpFile <> StrNull)
		     Then
		       Begin

		       If (NameHelpFile[Length(NameHelpFile)] <> '\')
			 Then
			   NameHelpFile := NameHelpFile+'\';

		       End;

		   { Nome completo del file }
		   NameHelpFile := NameHelpFile+InitNameHelpFile;
		   NoError := False;

		   End;

		 End;

	End;

      End;

Until NoError;

AggiornaStatusLine := True;

End; { CheckHelpFile }


{----------------------------------------------------------------------------
  PROCEDURA: BEEP

  Produce un BEEP, un suono di 1000 Hz per circa 300 millisecondi
 ----------------------------------------------------------------------------}
Procedure Beep;
Begin { Beep }

{ Suono di 1000 Hz }
If Special.EnableSound Then
  Sound(1000);

{ Attende 300 ms }
Delay(Ritardo.Beep);

{ Nessun suono }
NoSound;

End; { Beep }


{----------------------------------------------------------------------------
  FUNZIONE: MODIFY.COLOR

  Permette di modificare i colori delle finestre, del testo in esse, del
  testo dei menu, delle pagine attive, e tutti i colori presenti (sono
  circa una cinquantina).
 ----------------------------------------------------------------------------}
Function  ModifyColor ( OldAttr: Byte;
                        NewAttr: Byte;
                        Row:     Byte;
                        Col:     Byte ): Byte;

Begin { ModifyColor }

With Image^[NumPgVideo] Do
  With Special Do

  { Nessuna limitazione }
  If ((Not BloccaFore) And (Not BloccaBack))
    Then
      ModifyColor := NewAttr

  Else

    { Solo il colore di foreground }
    If ((Not BloccaFore) And (BloccaBack))
      Then
        ModifyColor := (NewAttr Mod 16)+(OldAttr Div 16)*16

  Else

    { Solo il colore di background }
    If ((BloccaFore) And (Not BloccaBack))
      Then
        ModifyColor := (OldAttr Mod 16)+(NewAttr Div 16)*16

  Else

    { Nessun cambiamento nel colore }
    If (BloccaFore And BloccaBack)
      Then
        ModifyColor := OldAttr;

End; { ModifyColor }


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.CAR

  Scrive il carattere CARATTERE passato come parametro sul video ed aggiorna
  la riga e la colonna.
 ----------------------------------------------------------------------------}
Procedure WriteCar ( Carattere: Char );

Begin { WriteCar }

With Image^[NumPgVideo] Do

  Begin

  { Memorizza l' ultimo carattere visualizzato }
  SelCar := Carattere;

  { Scrittura del carattere }
  If (Not Special.BloccaCar)
    Then
      Page[Row,Col].Ch := Carattere;

  { Aggiornamento del colore del carattere specificato }
  Page[Row,Col].At := ModifyColor(Page[Row,Col].At,Attr,Row,Col);

  { Aggiorna colonna e riga }
  If (Col < 80) Then
    Inc(Col)

  Else

    If (Row < 24)
      Then
	Begin
	Inc(Row);
	Col := 1;
	End;

  { Aggiorna lo stato dell' immagine (ora è stata modificata) }
  Modify := True;

  End;

End; { WriteCar }


End. { TIPInit }
