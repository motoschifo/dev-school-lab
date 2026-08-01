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
 ║       VERSIONE 1.0                          UNIT TIPFILES                ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   21 Febbraio 1993
  Ora:    14:30:00
  Autore: Fochi Michele
  File:   Unit UnitTextImageProcessorMenuFileManager }

{ Gestisce le chiamate alle opzioni del menu files, dell' opzione
  'Scegli ASCII' e 'Scegli cornice' del menu principale. }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Function  MenuASCII: Char;

    - Procedure ScegliASCII;

    - Function  MenuCornice: Char;

    - Procedure ScegliCornice;

    - Function  SelezionaCornice: String013;

    - Function  DiskIOStatus (DriveSpec: Integer): Byte;

    - Procedure LeggiFileMaschera;

    - Procedure SalvaFileMaschera ( NomeFile: String;
                                    Finestra: Boolean );

    - Procedure LeggiFileTesto;

    - Procedure SalvaFileTesto;

    - Procedure CambiaDirectoryCorrente;

    - Procedure ListaDirectory;

    - Procedure AccessoAlDOS ( Comando: String080 );

    - Procedure EseguiComandoDOS;

    - Procedure ShellDOS;

    - Procedure MenuFiles; }


{ Nome della unit }
Unit
     TIPFiles;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPFiles }


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

     { Routines di base del programma }
     TIPBase,

     { Gestione dei menu a comparsa }
     TIPMenu,

     { Input di una stringa con comandi di editing }
     TIPInStr,

     { Input di un nome di file e visualizzazione della directory }
     TIPInFil,

     { Input del nome di una directory }
     TIPInDir,

     { Procedure di inizializzazione del programma }
     TIPInit;


{----------------------------------------------------------------------------
  FUNZIONE: MENU.ASCII

  Disegna un menu da cui si può scegliere un carattere ASCII (in tutto
  sono 256). Per uscire senza modifiche basta premere il tasto ESCAPE.
  La funzione restituisce il carattere scelto nel caso si prema il tasto
  RETURN o il carattere nullo (codice ASCII 0) nel caso in cui si prema
  il tasto ESCAPE.
 ----------------------------------------------------------------------------}
Function  MenuASCII: Char;


{----------------------------------------------------------------------------
  PROCEDURA: SCEGLI.ASCII

  Effettua la chiamata alla funzione MENUASCII e stampa sul video il
  carattere scelto (in caso di nessuna scelta, non stampa nulla).
 ----------------------------------------------------------------------------}
Procedure ScegliASCII;


{----------------------------------------------------------------------------
  FUNZIONE: MENU.CORNICE

  Disegna un menu da cui si può scegliere il carattere ASCII corrispondente
  ad un angolo di un rettangolo o quadrato, per facilitare la creazione
  o la messa a punto di tabelle o righe. Per uscire senza modifiche basta
  premere il tasto ESCAPE.
  La funzione restituisce il carattere scelto nel caso si prema il tasto
  RETURN o il carattere nullo (codice ASCII 0) nel caso in cui si prema
  il tasto ESCAPE.
 ----------------------------------------------------------------------------}
Function  MenuCornice: Char;


{----------------------------------------------------------------------------
  PROCEDURA: SCEGLI.CORNICE

  Effettua la chiamata alla funzione MENUCORNICE e stampa sul video il
  carattere scelto (in caso di nessuna scelta, non stampa nulla).
 ----------------------------------------------------------------------------}
Procedure ScegliCornice;


{----------------------------------------------------------------------------
  FUNZIONE: SELEZIONA.CORNICE

  Disegna un menu dal quale è possibile scegliere il tipo di cornice
  da utilizzare.
  Se non si effettua nessuna selezione, la funzione restituisce il
  carattere ASCII nullo.
 ----------------------------------------------------------------------------}
Function  SelezionaCornice: String013;


{----------------------------------------------------------------------------
  FUNZIONE: DISK.IO.STATUS

  Verifica lo stato dei floppy disks e degli hard disks, e restituisce un
  numero intero che corrisponde al codice di errore compiuto:

         0     -->     Drive pronto e non protetto da scrittura
         1     -->     Drive pronto e protetto da scrittura
         2     -->     Drive non pronto
         3     -->     Disco non formattato
         4     -->     Il drive floppy richiesto non esiste
        99     -->     Errore fatale

  LA funzione restituisce 0 se si è specificato un hard disk, senza
  controllare eventuali errori critici.
 ----------------------------------------------------------------------------}
Function  DiskIOStatus (DriveSpec: Integer): Byte;


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.FILE.MASCHERA

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video. Se l' immagine corrente non è stata
  salvata chiede se si è disposti a perdere le modifiche apportate.
 ----------------------------------------------------------------------------}
Procedure LeggiFileMaschera;


{----------------------------------------------------------------------------
  PROCEDURA: SALVA.FILE.MASCHERA

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
 ----------------------------------------------------------------------------}
Procedure SalvaFileMaschera ( NomeFile: String;
                              Finestra: Boolean );


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.FILE.TESTO

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video. Se l' immagine corrente non è stata
  salvata chiede se si è disposti a perdere le modifiche apportate.
  Il file viene letto come testo, per cui il colore è quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure LeggiFileTesto;


{----------------------------------------------------------------------------
  PROCEDURA: SALVA.FILE.TESTO

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
  Il file viene salvato come testo, per cui il colore è quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure SalvaFileTesto;


{----------------------------------------------------------------------------
  PROCEDURA: CAMBIA.DIRECTORY.CORRENTE

  Apre una finestra uguale a quella per l' immissione di un nome di file
  ma solo che questa volta occorre digitare una directory. Se la
  directory immessa non esiste viene visualizzato un messaggio di errore
  a video.
 ----------------------------------------------------------------------------}
Procedure CambiaDirectoryCorrente;


{----------------------------------------------------------------------------
  PROCEDURA: LISTA.DIRECTORY

  E' molto simile alla procedura CAMBIADIRECTORYCORRENTE, solo che questa
  volta, invece di listare il path immesso si esegue un 'CHDIR', come
  si farebe in DOS.
 ----------------------------------------------------------------------------}
Procedure ListaDirectory;


{----------------------------------------------------------------------------
  PROCEDURA: ACCESSO.AL.DOS

  E' la procedura che esegue realmente il comando specificato da COMANDO,
  cambiando il prompt nel nuovo environment, comprime la memoria dello
  heap, ecc.
 ----------------------------------------------------------------------------}
Procedure AccessoAlDOS ( Comando: String080 );


{----------------------------------------------------------------------------
  PROCEDURA: ESEGUI.COMANDO.DOS

  Esegue un qualsiasi comando che si darebbe in DOS, restando però con il
  programma caricato in memoria. Una volta terminata l' eseguzione di ciò
  che è stato digitato viene aspettato un RETURN per tornare a TIP.
  Se non c'è abbastanza memoria per eseguire il comando o se non viene
  trovato il file COMMAND.COM, viene visualizzata una finestra con
  il messaggio di errore opportuno.
 ----------------------------------------------------------------------------}
Procedure EseguiComandoDOS;


{----------------------------------------------------------------------------
  PROCEDURA: SHELL.DOS

  Questa procedura non si differenzia molto da quella che esegue un
  comando DOS, tranne per il fatto che il comando da eseguire è ora
  COMMAND.COM.
  Una volta che si desidera ritornare a TIP basta digitare EXIT.
  Se non c'è abbastanza memoria per eseguire il comando o se non viene
  trovato il file COMMAND.COM, viene visualizzata una finestra con
  il messaggio di errore opportuno.
 ----------------------------------------------------------------------------}
Procedure ShellDOS;


{----------------------------------------------------------------------------
  PROCEDURA: MENU.FILES

  Disegna il menu files ed attende una scelta da parte dell' utente: a
  seconda dell' opzione selezionata, esegue il compito specifico.
 ----------------------------------------------------------------------------}
Procedure MenuFiles;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPFiles }


{----------------------------------------------------------------------------
  FUNZIONE: MENU.ASCII

  Disegna un menu da cui si può scegliere un carattere ASCII (in tutto
  sono 256). Per uscire senza modifiche basta premere il tasto ESCAPE.
  La funzione restituisce il carattere scelto nel caso si prema il tasto
  RETURN o il carattere nullo (codice ASCII 0) nel caso in cui si prema
  il tasto ESCAPE.
 ----------------------------------------------------------------------------}
Function  MenuASCII: Char;

{ Variabili locali }
Var

    { Tasto premuto dall' utente }
    Ch1:        Char;

    { Tasto esteso premuto dall' utente }
    Ch2:        Char;

    { Indice per i cicli }
    I:          Byte;

    { Indice per i cicli }
    J:          Byte;

    { Indica se è stata fatta una scelta o no }
    Done:       Boolean;

    { Riga del puntatore }
    Riga:       Byte;

    { Colonna del puntatore }
    Colonna:    Byte;

    { Riga precedentemente puntata }
    OldRiga:    Byte;

    { Colonna precedentemente puntata }
    OldColonna: Byte;


     {-----------------------------------------------------------------------
       PROCEDURA: AGGIORNA.ASCII.CAR

       Scrive in fondo alla finestra dei caratteri ASCII il carattere
       selezionato in quel momento, il suo codice ASCII in decimale,
       esadecimale, ottale e binario.
      -----------------------------------------------------------------------}
     Procedure AggiornaASCIICar;

     { Tipi locali }
     Type

	  { Stringa che contiene le cifre utilizzate in base esadecimale }
	  ArrayHex= String016;

	  { Stringa che contiene le cifre utilizzate in base ottale }
	  ArrayOct= String008;

	  { Stringa che contiene le cifre utilizzate in base binaria }
	  ArrayBin= String002;

     { Costanti locali }
     Const

	   { Vettore di caratteri (stringa) che contiene le cifre
	     esadecimali : 0..F }
	   ArrHex: ArrayHex= '0123456789ABCDEF';

	   { Vettore di caratteri (stringa) che contiene le cifre
	     ottali : 0..7 }
	   ArrOct: ArrayOct= '01234567';

	   { Vettore di caratteri (stringa) che contiene le cifre
	     binarie : 0 e 1 }
	   ArrBin: ArrayBin= '01';

     { Variabili locali }
     Var

	 { Numero in decimale }
	 Num:    Byte;

	 { Copia della variabile NUM per avere sempre il numero
	   in decimale ed effettuare le conversioni opportune }
	 OldNum: Byte;

	 { Stringa che contiene il numero in base esadecimale }
	 HexStr: String002;

	 { Stringa che contiene il numero in base decimale }
	 DecStr: String003;

	 { Stringa che contiene il numero in base ottale }
	 OctStr: String003;

	 { Stringa che contiene il numero in base binaria }
	 BinStr: String008;

	 { Carattere selezionato }
	 CarStr: Char;

	 { Indice per i cicli }
	 I:      Byte;

	 { Stringa di appoggio per la scrittura in fondo alla
	   finestra }
	 St:     String;


     Begin { AggiornaASCIICar }

     { Determina il carattere selezionato }
     CarStr := Chr(16*(Riga-1)+Colonna-1);

     { Trova il codice ASCII corrispondente }
     Num := Ord(CarStr);

     { Memorizza il codice trovato (per essere sicuri di non perderlo) }
     OldNum := Num;

     { Inizializza le stringhe che conterranno i valori convertiti }
     HexStr := '  ';
     DecStr := '   ';
     OctStr := '   ';
     BinStr := '        ';

     { Conversione decimale }
     Str(Num:3,DecStr);

     { Cambia gli spazi in '0' }
     If (DecStr[1] = ' ')
       Then
	 DecStr[1] := '0';

     If (DecStr[2] = ' ')
       Then
	 DecStr[2] := '0';

     { Conversione esadecimale }
     For i := 1 To 2 Do
       Begin
       HexStr[3-i] := ArrHex[Num Mod 16+1];
       Num := Num Div 16;
       End;

     { Ripristino del numero originale }
     Num := OldNum;

     { Conversione ottale }
     For i := 1 To 3 Do
       Begin
       OctStr[4-i] := ArrOct[Num Mod 8+1];
       Num := Num Div 8;
       End;

     { Ripristino del numero originale }
     Num := OldNum;

     { Conversione binaria }
     For i := 1 To 8 Do
       Begin
       BinStr[9-i] := ArrBin[Num Mod 2+1];
       Num := Num Div 2;
       End;

     { Stampa a video i numeri appena convertiti e le relative
       voci su un' unica riga sepatare, in quanto la lunghezza della
       finestra consente una stampa di una stringa di queste dimensioni }
     St := 'CAR:     HEX:      DEC:       OCT:       BIN:';
     WriteStr(8,19,St,Color.MenuUnSel);
     WriteStr(13,19,CarStr,Color.MenuText);
     WriteStr(22,19,HexStr,Color.MenuText);
     WriteStr(32,19,DecStr,Color.MenuText);
     WriteStr(43,19,OctStr,Color.MenuText);
     WriteStr(54,19,BinStr,Color.MenuText);

     End;


Begin { MenuASCII }

{ Apre con effetto a scoppio la finestra dei caratteri ASCII }
ApriQuadro(6,2,76,23,'[Caratteri ASCII]',Color.MenuBord,
	   Color.MenuText,Color.MenuTitle,Ritardo.WinStep,
	   Ritardo.Windows);

{ Stampa tutti i tipi di caratteri che l' utente può selezionare }
For i := 1 To 16 Do
  For j := 1 To 16 Do

    { Scrittura del carattere }
    WriteStr((i-1)*4+4,j+1,' '+Chr(16*(j-1)+i-1)+' ',Color.MenuUnSel);

{ Scrive il primo carattere evidenziato }
WriteStr(4,2,' '+Chr(0)+' ',Color.MenuSel);

{ Impostazioni iniziali }
Done := False;
Riga := 1;
Colonna := 1;
OldRiga := 1;
OldColonna := 1;

{ Questo ciclo si ripete fino a che l' utente non preme RETURN per
  selezionare il carattere evidenziato o non prema il tasto ESCAPE per
  uscire senza effettuare alcuna scelta }
Repeat

  { Se la scelta è cambiata, aggiorna l' evidenziatore sul video }
  If ((OldRiga <> Riga) Or (OldColonna <> Colonna))
    Then
      Begin

      { Scrive il carattere non evidenziato nella posizione opportuna,
	cioè la selezione precedente }
      WriteStr((OldColonna-1)*4+4,OldRiga+1,' '+Chr(16*(OldRiga-1)+
               OldColonna-1)+' ',Color.MenuUnSel);

      { Scrive il carattere non evidenziato nella posizione opportuna,
	cioè la nuova selezione }
      WriteStr((Colonna-1)*4+4,Riga+1,' '+Chr(16*(Riga-1)+Colonna-1)+' ',
	       Color.MenuSel);

      End;

  { Aggiorna il codice ASCII del carattere (in base esadecimale,
    decimale, ottale e binaria) e il carattere selezionato in
    fondo alla finestra delle cornici }
  AggiornaASCIICar;

  { Attende la pressione di un tasto o la pressione di un pulsante del
    mouse }
  Attendi(Ch1,Ch2,SMenuASCII);

  { Memorizza la riga e la colonna, per testate in seguito se c'è stato
    un cambiamento o no }
  OldRiga := Riga;
  OldColonna := Colonna;

  { Controllo della pressione del mouse ... }
  If MousePressed Then
    Begin

    { E' stato premuto il pulsante di sinistra ? }
    If LeftButton
      Then

        { Testa tutte le zone valide }
        Begin

        For i := 1 To 16 Do
	  For j := 1 To 16 Do
            If ((MouseTextX >= Lo(WindMin)+4+(i-1)*4) And
	        (MouseTextX <= Lo(WindMin)+6+(i-1)*4) And
                (MouseTextY = (Hi(WindMin)+j+1)))
                  Then

                    { Controlla se è il secondo click }
                    Begin
		    Riga := j;
                    Colonna := i;

                    { Numero click ? }
                    If ((OldRiga = Riga) And (OldColonna = Colonna))
                      Then

                        { Secondo }
                        Ch1 := kReturn

                    Else

                      { Primo }
                      Begin
                      Ch1 := kNull;
                      Ch2 := kNull;
                      End;

                    End;

        End

    Else

      { E' stato premuto il pulsante di destra ? }
      If RightButton
        Then
          Ch1 := kEscape;

    { Rilascia i pulsanti del mouse }
    While MousePressed Do
      GetMPos;

    End;

  { A seconda del tasto premuto dall' utente ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: Case Ch2 Of

             { F1: aiuto generale }
	     kF1: Help('Help Generale',Altro);

             { Shift-F1: indice dell' aiuto }
	     kSF1: Help('Indice',Altro);

             { Alt-F1: schermata di aiuto precedente }
             kAF1: Help(LastHelp^[1],Precedente);

             { Ctrl-F1: help specifico }
             kCF1: Help('Menu ASCII',Altro);

	     { Su: sposta l' evidenziatore nella riga superiore }
	     kUp: If (Riga > 1)
		    Then
		      Dec(Riga);

	     { Giù: sposta l' evidenziatore nella riga sottostante }
	     kDown: If (Riga < 16)
		      Then
			Inc(Riga);

	     { Sinistra: sposta l' evidenziatore nella colonna a sinistra }
	     kLeft: If (Colonna > 1)
		      Then
			Dec(Colonna);

	     { Destra: sposta l' evidenziatore nella colonna a destra }
	     kRight: If (Colonna < 16)
		       Then
			 Inc(Colonna);

	     { End: sposta l' evidenziatore nell' ultima riga }
	     kEnd: Colonna := 16;

	     { Home: sposta l' evidenziatore nella prima colonna }
	     kHome: Colonna := 1;

	     { Pagina Su: sposta l' evidenziatone nella prima riga }
	     kPgUp: Riga := 1;

	     { Pagina Giù: sposta l' evidenziatore nell' ultima riga }
	     kPgDown: Riga := 16;

	     End; { Case Ch2 }

    { Return: sceglie il carattere evidenziato }
    kReturn: Begin

	     { Esce dal ciclo principale }
	     Done := True;

	     { Restituisce il carattere scelto }
	     MenuASCII := Chr(16*(Riga-1)+Colonna-1);

	     End;

    { Escape: non effettua nessuna scelta }
    kEscape: Begin

	     { Esce dal ciclo princiapale }
	     Done := True;

	     { Restituisce il carattere nullo }
	     MenuASCII := kNull;

	     End;

    Else

      { Viene posizionato sul tasto premuto dall' utente }
      Begin
      Riga := Ord(Ch1) Div 16+1;
      Colonna := Ord(Ch1) Mod 16+1;
      End;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

End; { MenuASCII }


{----------------------------------------------------------------------------
  PROCEDURA: SCEGLI.ASCII

  Effettua la chiamata alla funzione MENUASCII e stampa sul video il
  carattere scelto (in caso di nessuna scelta, non stampa nulla).
 ----------------------------------------------------------------------------}
Procedure ScegliASCII;

{ Variabili locali }
Var

    { Carattere scelto dall' utente }
    Ch: Char;

Begin { ScegliASCII }

{ Memorizza il carattere scelto in CH }
Ch := MenuASCII;

{ Posizione il cursore }
With Image^[NumPgVideo] Do
  GoToXY(Col,Row);

{ Se il carattere scelto è diverso dal carattere nullo (codice ASCII 0)
  lo scrive sullo schermo }
If (Ch <> kNull)
  Then
    WriteCar(Ch);

End; { ScegliASCII }


{----------------------------------------------------------------------------
  FUNZIONE: MENU.CORNICE

  Disegna un menu da cui si può scegliere il carattere ASCII corrispondente
  ad un angolo di un rettangolo o quadrato, per facilitare la creazione
  o la messa a punto di tabelle o righe. Per uscire senza modifiche basta
  premere il tasto ESCAPE.
  La funzione restituisce il carattere scelto nel caso si prema il tasto
  RETURN o il carattere nullo (codice ASCII 0) nel caso in cui si prema
  il tasto ESCAPE.
 ----------------------------------------------------------------------------}
Function  MenuCornice: Char;

{ Costanti locali }
Const

      { Contiene tutti i caratteri che si possono utilizzare per la
	creazione di una cornice, nei formati linea semplice, linea
	doppia e negli altri due misti }
      CornStr: String100= '┌─┬─┐╒═╤═╕'+
			  '│ │ ││ │ │'+
			  '├─┼─┤╞═╪═╡'+
			  '│ │ ││ │ │'+
			  '└─┴─┘╘═╧═╛'+
			  '╔═╦═╗╓─╥─╖'+
			  '║ ║ ║║ ║ ║'+
			  '╠═╬═╣╟─╫─╢'+
			  '║ ║ ║║ ║ ║'+
			  '╚═╩═╝╙─╨─╜';

{ Variabili locali }
Var

    { Carattere di appoggio per la selezione corrente }
    Ch:         Char;

    { Stringa di appoggio }
    St:         String;

    { Tasto premuto dall' utente }
    Ch1:        Char;

    { Tasto esteso premuto dall' utente }
    Ch2:        Char;

    { Indice per i cicli }
    I:          Byte;

    { Indice per i cicli }
    J:          Byte;

    { Indica se è stata fatta una scelta o no }
    Done:       Boolean;

    { Riga del puntatore }
    Riga:       Byte;

    { Colonna del puntatore }
    Colonna:    Byte;

    { Riga precedentemente puntata }
    OldRiga:    Byte;

    { Colonna precedentemente puntata }
    OldColonna: Byte;


     {-----------------------------------------------------------------------
       PROCEDURA: AGGIORNA.CORNICE.CAR

       Scrive in fondo alla finestra delle cornici il carattere selezionato
       in quel momento, il suo codice ASCII in decimale, esadecimale,
       ottale e binario.
      -----------------------------------------------------------------------}
     Procedure AggiornaCorniceCar;

     { Tipi locali }
     Type

	  { Stringa che contiene le cifre utilizzate in base esadecimale }
	  ArrayHex= String016;

	  { Stringa che contiene le cifre utilizzate in base ottale }
	  ArrayOct= String008;

	  { Stringa che contiene le cifre utilizzate in base binaria }
	  ArrayBin= String002;

     { Costanti locali }
     Const

	   { Vettore di caratteri (stringa) che contiene le cifre
	     esadecimali : 0..F }
	   ArrHex: ArrayHex= '0123456789ABCDEF';

	   { Vettore di caratteri (stringa) che contiene le cifre
	     ottali : 0..7 }
	   ArrOct: ArrayOct= '01234567';

	   { Vettore di caratteri (stringa) che contiene le cifre
	     binarie : 0 e 1 }
	   ArrBin: ArrayBin= '01';

     { Variabili locali }
     Var

	 { Numero in decimale }
	 Num:    Byte;

	 { Copia della variabile NUM per avere sempre il numero
	   in decimale ed effettuare le conversioni opportune }
	 OldNum: Byte;

	 { Stringa che contiene il numero in base esadecimale }
	 HexStr: String002;

	 { Stringa che contiene il numero in base decimale }
	 DecStr: String003;

	 { Stringa che contiene il numero in base ottale }
	 OctStr: String003;

	 { Stringa che contiene il numero in base binaria }
	 BinStr: String008;

	 { Carattere selezionato }
	 CarStr: Char;

	 { Indice per i cicli }
	 I:      Byte;

     Begin { AggiornaCorniceCar }

     { Determina il carattere selezionato }
     CarStr := CornStr[10*(Riga-1)+Colonna];

     { Trova il codice ASCII corrispondente }
     Num := Ord(CarStr);

     { Memorizza il codice trovato (per essere sicuri di non perderlo) }
     OldNum := Num;

     { Inizializza le stringhe che conterranno i valori convertiti }
     HexStr := '  ';
     DecStr := '   ';
     OctStr := '   ';
     BinStr := '        ';

     { Conversione decimale }
     Str(Num:3,DecStr);

     { Cambia gli spazi in 0 }
     If (DecStr[1] = ' ')
       Then
	 DecStr[1] := '0';

     If (DecStr[2] = ' ')
       Then
	 DecStr[2] := '0';

     { Conversione esadecimale }
     For i := 1 To 2 Do
       Begin
       HexStr[3-i] := ArrHex[Num Mod 16+1];
       Num := Num Div 16;
       End;

     { Ripristino del numero originale }
     Num := OldNum;

     { Conversione ottale }
     For i := 1 To 3 Do
       Begin
       OctStr[4-i] := ArrOct[Num Mod 8+1];
       Num := Num Div 8;
       End;

     { Ripristino del numero originale }
     Num := OldNum;

     { Conversione binaria }
     For i := 1 To 8 Do
       Begin
       BinStr[9-i] := ArrBin[Num Mod 2+1];
       Num := Num Div 2;
       End;

     { Stampa a video i numeri appena convertiti e le relative
       voci su due righe sepatare, in quanto la lunghezza della finestra
       non consente la stampa sulla stessa riga }
     St := 'CAR:     HEX:      DEC:';
     WriteStr(5,13,St,Color.MenuUnSel);
     WriteStr(11,13,CarStr,Color.MenuText);
     WriteStr(20,13,HexStr,Color.MenuText);
     WriteStr(30,13,DecStr,Color.MenuText);

     { Seconda riga ... }
     St := 'OCT:          BIN:';
     WriteStr(5,14,St,Color.MenuUnSel);
     WriteStr(11,14,OctStr,Color.MenuText);
     WriteStr(25,14,BinStr,Color.MenuText);

     End; { AggiornaCorniceCar }


     {-----------------------------------------------------------------------
       FUNZIONE: ESTENDI.A.TRE

       Estende a tre bytes il carattere passato come parametro, per avere
       una più chiara leggibilità dell' opzione evidenziata.
      -----------------------------------------------------------------------}
     Function  EstendiATre ( Carattere: Char ): String003;
     Begin { EstendiATre }

     { Estensione del carattere ai 3 visualizzati }
     Case Carattere Of
       '┌',
       '├',
       '└',
       '╓',
       '╟',
       '╙': EstendiATre := ' '+Carattere+'─';

       '┬',
       '┼',
       '┴',
       '─',
       '╥',
       '╫',
       '╨': EstendiATre := '─'+Carattere+'─';

       '┐',
       '┤',
       '┘',
       '╖',
       '╢',
       '╜': EstendiATre := '─'+Carattere+' ';

       '╦',
       '╬',
       '╩',
       '═',
       '╤',
       '╪',
       '╧': EstendiATre := '═'+Carattere+'═';

       '╒',
       '╞',
       '╘',
       '╔',
       '╠',
       '╚': EstendiATre := ' '+Carattere+'═';

       '╕',
       '╡',
       '╛',
       '╗',
       '╣',
       '╝': EstendiATre := '═'+Carattere+' ';

       Else

         EstendiATre := ' '+Carattere+' ';

       End;

     End; { EstendiATre }


Begin { MenuCornice }

{ Apre con effetto a scoppio la finestra delle cornici }
ApriQuadro(21,5,58,21,'[Cornici]',Color.MenuBord,
	   Color.MenuText,Color.MenuTitle,Ritardo.WinStep,
	   Ritardo.Windows);

{ Stampa tutti i tipi di caratteri che l' utente può selezionare }
For i := 1 To 10 Do
  For j := 1 To 10 Do
    Begin

    { Carattere da stampare }
    Ch := CornStr[10*(j-1)+i];

    { Aggiunsta il carattere, estendendolo a 3 bytes (per una più chiara
      lettura }
    St := EstendiATre(Ch);

    { Scrive la stringa di 3 caratteri nella posizione opportuna }
    WriteStr((i-1)*3+4,j+1,St,Color.MenuUnSel);

    End;

{ Scrive il primo carattere evidenziato }
WriteStr(4,2,' ┌─',Color.MenuSel);

{ Impostazioni iniziali }
Done := False;
Riga := 1;
Colonna := 1;
OldRiga := 1;
OldColonna := 1;

{ Questo ciclo si ripete fino a che l' utente non preme RETURN per
  selezionare il carattere evidenziato o non prema il tasto ESCAPE per
  uscire senza effettuare alcuna scelta }
Repeat

  { Se la scelta è cambiata, aggiorna l' evidenziatore sul video }
  If ((OldRiga <> Riga) Or (OldColonna <> Colonna))
    Then
      Begin

      { Cambia la vecchia selezione }
      Ch := CornStr[10*(OldRiga-1)+OldColonna];

      { Estende il carattere a 3 bytes }
      St := EstendiATre(Ch);

      { E lo scrive nella posizione opportuna }
      WriteStr((OldColonna-1)*3+4,OldRiga+1,St,Color.MenuUnSel);

      { Ora tocca al nuovo carattere evidenziato }
      Ch := CornStr[10*(Riga-1)+Colonna];

      { Estende il carattere a 3 bytes }
      St := EstendiATre(Ch);

      { E lo scrive nella posizione opportuna }
      WriteStr((Colonna-1)*3+4,Riga+1,St,Color.MenuSel);

      End;

  { Aggiorna il codice ASCII del carattere (in base esadecimale,
    decimale, ottale e binaria) e il carattere selezionato in
    fondo alla finestra delle cornici }
  AggiornaCorniceCar;

  { Attende la pressione di un tasto o la pressione di un pulsante del
    mouse }
  Attendi(Ch1,Ch2,SMenuCornici);

  { Memorizza la riga e la colonna, per testate in seguito se c'è stato
    un cambiamento o no }
  OldRiga := Riga;
  OldColonna := Colonna;

  { Controllo della pressione dei pulsanti del mouse }
  If MousePressed
    Then
      Begin

      { Pulsante di sinistra }
      If LeftButton
        Then

          Begin

          { Testa tutte le aree valide per la pressione }
          For i := 1 To 10 Do
	    For j := 1 To 10 Do

              If ((MouseTextX >= Lo(WindMin)+4+(i-1)*3) And
	          (MouseTextX <= Lo(WindMin)+6+(i-1)*3) And
                  (MouseTextY = (Hi(WindMin)+j+1)))
                    Then

                      { Quante volte è stato premuto ? }
                      Begin
		      Riga := j;
                      Colonna := i;

                      { Seconda volta }
                      If ((OldRiga = Riga) And (OldColonna = Colonna))
                        Then
                          Ch1 := kReturn

                      Else

                        { Prima volta }
                        Begin
                        Ch1 := kNull;
                        Ch2 := kNull;
                        End;

                      End;

          End

      Else

        { E' stato premuto il pulsante di destra ? }
        If RightButton
          Then
            Ch1 := kEscape;

      { Rilascia i pulsanti del mouse }
      While MousePressed Do
        GetMPos;

      End;

  { A seconda del tasto premuto dall' utente ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: Case Ch2 Of

             { F1: aiuto generale }
	     kF1: Help('Help Generale',Altro);

             { Shift-F1: indice dell' aiuto }
	     kSF1: Help('Indice',Altro);

             { Alt-F1: schermata di aiuto precedente }
             kAF1: Help(LastHelp^[1],Precedente);

             { Ctrl-F1: help specifico }
             kCF1: Help('Menu Cornice',Altro);

	     { Su: sposta l' evidenziatore nella riga superiore }
	     kUp: If (Riga > 1)
		    Then
		      Dec(Riga);

	     { Giù: sposta l' evidenziatore nella riga sottostante }
	     kDown: If (Riga < 10)
		      Then
			Inc(Riga);

	     { Sinistra: sposta l' evidenziatore nella colonna a sinistra }
	     kLeft: If (Colonna > 1)
		      Then
			Dec(Colonna);

	     { Destra: sposta l' evidenziatore nella colonna a destra }
	     kRight: If (Colonna < 10)
		       Then
			 Inc(Colonna);

	     { End: sposta l' evidenziatore nell' ultima riga }
	     kEnd: Colonna := 10;

	     { Home: sposta l' evidenziatore nella prima colonna }
	     kHome: Colonna := 1;

	     { Pagina Su: sposta l' evidenziatone nella prima riga }
	     kPgUp: Riga := 1;

	     { Pagina Giù: sposta l' evidenziatore nell' ultima riga }
	     kPgDown: Riga := 10;

	     End; { Case Ch2 }

    { Return: sceglie il carattere evidenziato }
    kReturn: Begin

	     { Esce dal ciclo principale }
	     Done := True;

	     { Restituisce il carattere scelto }
	     MenuCornice := CornStr[10*(Riga-1)+Colonna];

	     End;

    { Escape: non effettua nessuna scelta }
    kEscape: Begin

	     { Esce dal ciclo princiapale }
	     Done := True;

	     { Restituisce il carattere nullo }
	     MenuCornice := kNull;

	     End;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

End; { MenuCornice }


{----------------------------------------------------------------------------
  PROCEDURA: SCEGLI.CORNICE

  Effettua la chiamata alla funzione MENUCORNICE e stampa sul video il
  carattere scelto (in caso di nessuna scelta, non stampa nulla).
 ----------------------------------------------------------------------------}
Procedure ScegliCornice;

{ Variabili locali }
Var

    { Carattere scelto dall' utente }
    Ch: Char;

Begin { ScegliCornice }

{ Memorizza il carattere scelto in CH }
Ch := MenuCornice;

{ Posizione il cursore }
With Image^[NumPgVideo] Do
  GoToXY(Col,Row);

{ Se il carattere scelto è diverso dal carattere nullo (codice ASCII 0)
  lo scrive sullo schermo }
If (Ch <> kNull)
  Then
    WriteCar(Ch);

End; { ScegliCornice }


{----------------------------------------------------------------------------
  FUNZIONE: SELEZIONA.CORNICE

  Disegna un menu dal quale è possibile scegliere il tipo di cornice
  da utilizzare.
  Se non si effettua nessuna selezione, la funzione restituisce il
  carattere ASCII nullo.
 ----------------------------------------------------------------------------}
Function  SelezionaCornice: String013;

{ Variabili locali }
Var

    { Carattere scelto dall' utente }
    Ch:     Char;

Begin { SelezionaCornice }

{ Visualizza il menu sul video }
With Color Do
  Case Menu('[MENU CORNICI]',

            '||'+

	    '               ^1 ┌──┼──────────┘               |'+
            ' Cornice con bordo singolo|'+

	    '||'+

	    '^2 ╒════╪════════╛|'+
            ' Cornice con bordo singolo verticalmente e doppio orizzontalmente|',

	    '||'+

	    '^3 ╔═══════╬═════╝|'+
            ' Cornice con bordo doppio|'+

	    '||'+

	    '^4 ╓──────────╫──╜|'+
            ' Cornice con bordo singolo orizzontalmente e doppio verticalmente|',

	    '||'+

	    '^Carattere|'+
            'Cornice formata da un carattere ASCII|'+

	    '||','','','','','',
	    MenuTitle,MenuSel,MenuUnSel,
	    MenuBord,MenuText,MenuKeySel,
	    MenuKeyUnSel,SSelCornice)
       Of

	  { Cornice singola }
	  2: SelezionaCornice := SingleFrame;

	  { Cornice singola verticale e doppia orizzontale }
	  4: SelezionaCornice := DoubleHorFrame;

	  { Cornice singola orizzontale e doppia verticale }
	  6: SelezionaCornice := DoubleFrame;

	  { Cornice doppia }
	  8: SelezionaCornice := DoubleVerFrame;

	  { Cornice formata da un solo carattere }
	  10: Begin

	      { Messaggio per l' utente }
	      Info(' Scegli il carattere ASCII da utilizzare come cornice.',
		    UserInfo);

	      { Scelta del carattere ASCII }
	      Ch := MenuASCII;

	      { Se il carattere è diverso dal carattere nullo ... }
	      If (Ch <> kNull)
	        Then

		  { Cornice come 13 caratteri successivi }
		  SelezionaCornice := Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch

	      Else

	        { Cornice nulla }
	        SelezionaCornice := kNull;

	      End;

	  { Altrimenti non c'è cornice }
	  Else

	    SelezionaCornice := kNull;

	  End; { Case Menu }

End; { SelezionaCornice }


{----------------------------------------------------------------------------
  FUNZIONE: DISK.IO.STATUS

  Verifica lo stato dei floppy disks e degli hard disks, e restituisce un
  numero intero che corrisponde al codice di errore compiuto:

         0     -->     Drive pronto e non protetto da scrittura
         1     -->     Drive pronto e protetto da scrittura
         2     -->     Drive non pronto
         3     -->     Disco non formattato
         4     -->     Il drive floppy richiesto non esiste
        99     -->     Errore fatale

  LA funzione restituisce 0 se si è specificato un hard disk, senza
  controllare eventuali errori critici.
 ----------------------------------------------------------------------------}
Function  DiskIOStatus (DriveSpec: Integer): Byte;

{ Titpi locali }
Type

     { Puntatore al buffer per la lettura/scrittura su disco }
     PTRBufferType= ^BufferType;

     { Buffer }
     BufferType=    Array [1..512] Of
                      Char;

{ Variabili locali }
Var

    { Risultato delle operazioni sul disco }
    Risultato:   Byte;

    { Stato del carry flag che segnala un errore di disco }
    StatoErrore: Integer;

    { Indice per i cicli }
    NumeroProve: Integer;

    { Buffer per la lettura/scrittura su disco }
    Buffer:      BufferType;

Begin { DiskIOStatus }

{ Se il drive specificato è quello di default lo trasforma in lettera }
If (DriveSpec = 0)
  Then
    Begin

    { Interrupt 21h, funzione 19h }
    Regs.AH := $19;
    MsDos(Regs);
    DriveSpec := Regs.AL+1;

    End;

{ Lettura: verifica degli errori 2, 3, 4 e 99 (tre prove consigliate) }
For NumeroProve := 1 To 3 Do

  With Regs Do

    Begin

    { Interrupt 13h, funzione 00h: reset del controller }
    AH := $00;
    Intr($13,Regs);

    { Lettura }
    AH := $02;
    AL := $01;
    CH := $00;
    CL := $01;
    DL := DriveSpec-1;
    DH := $00;
    ES := Seg(Buffer);
    BX := Ofs(Buffer);
    Intr($13,Regs);

    End;

{ Se il Carry Flag è a 1 significa che c'è stato un errore }
If ((Regs.Flags And $01) > 0)
  Then
    Begin

    { Memorizzazione del codice di errore }
    StatoErrore := Regs.AH;

    { Elaborazione risultato ... }
    Case StatoErrore Of

      { Drine non pronto (2) }
      128: Risultato := 2;

      { Drive non formattato (3) }
      002: Risultato := 3;

      { Drive richiesto inesistente (4) }
      064,
      001: Risultato := 4;

      Else

        { Errore fatale (99) }
        Risultato := 99;

      End; { Case StatoErrore }

    End

Else

  { Drive pronto: nessun errore (0) }
  Risultato :=  0;

{ Scrittura: verifica degli errori 0, 1, 99 e ulteriore 2, 3 e 4.
  Se il drive è pronto, verifica la protezione dalla riscrittura di
  quanto letto }
If (Risultato = 0)
  Then
    Begin

    { 3 prove consigliate }
    For NumeroProve := 1 To 3 Do

      With Regs Do

        Begin

        { Interrupt 13h, funzione 00h: reset del controller }
        AH := $00;
        Intr($13,Regs);

        { Scrittura }
        AH := $03;
        AL := $01;
        CH := $00;
        CL := $01;
        DL := DriveSpec-1;
        DH := $00;
        ES := Seg(Buffer);
        BX := Ofs(Buffer);
        Intr($13,Regs);

        End;

    { Se il Carry Flag è a 1 significa che c'è stato un errore }
    If ((Regs.Flags And $01) > 0)
      Then
        Begin

        { Memorizzazione del codice di errore }
        StatoErrore := Regs.AH;

        { Elaborazione risultato ... }
        Case StatoErrore Of

          { Drine non pronto (2) }
          128: Risultato := 2;

          { Drive non formattato (3) }
          002: Risultato := 3;

          { Drive richiesto inesistente (4) }
          064,
          001: Risultato := 4;

          Else

            { Errore fatale (99) }
            Risultato := 99;

          End; { Case StatoErrore }

        End

    Else

      { Drive pronto: nessun errore (0) }
      Risultato :=  0;

    End;

{ E' stato specificato un hard disk ? }
If (DriveSpec >= 3)
  Then

    { Nessun errore: non viene testato l' hard disk }
    DiskIOStatus := 0

Else

  { Restituisce il risultato delle prove di lettura/scrittura sul disco }
  DiskIOStatus := Risultato;

End; { DiskIOStatus }


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.FILE.MASCHERA

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video. Se l' immagine corrente non è stata
  salvata chiede se si è disposti a perdere le modifiche apportate.
 ----------------------------------------------------------------------------}
Procedure LeggiFileMaschera;

Begin { LeggiFileMaschera }

{ Attende in input il nome del file da leggere }
NameReadFileMSK := InputFile('[Leggi File Maschera]','.MSK','*.MSK',
		   SetCarFile);
		   
ApriFileMaschera(NameReadFileMSK,NumPgVideo);

{ Aggiorna la pagina video attiva }
Image^[NumPgVideo].FileName := NameReadFileMSK;

End; { LeggiFileMaschera }


{----------------------------------------------------------------------------
  PROCEDURA: SALVA.FILE.MASCHERA

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
 ----------------------------------------------------------------------------}
Procedure SalvaFileMaschera ( NomeFile: String;
                              Finestra: Boolean );

{ Variabili locali }
Var

    { File strutturato per la scrittura }
    FileMSK:     FileStructMSK;

    { Appoggio per il salvataggio del file }
    AppRecFile:  PTRRecFile;

    { Indica se il file (sempre se esiste) può essere o no sovrascritto }
    Sovrascrivi: Boolean;

    { Stato del disco }
    StatoDisco:  Byte;

    { Stringa di appoggio }
    St:          String028;

Begin { SalvaFileMaschera }

{ Se occorre visualizzare la finestra per la specificazione del nome
  del file }
If Finestra
  Then

    Begin

    { Attende in input il nome del file da leggere }
    NameWriteFileMSK := InputFile('[Salva File Maschera]','.MSK',
                                  Image^[NumPgVideo].FileName,SetCarFile);
    NomeFile := NameWriteFileMSK;

    End;
		   
{ Se è diverso dalla stringa nulla }
If (NomeFile <> StrNull)
  Then
    Begin

    { Inizializzazioni }
    NomeFile := FExpand(NomeFile);
    Sovrascrivi := True;

    { Assegnazione del file sul disco ad un nome logico }
    Assign(FileMSK,NomeFile);

    { Lettura del file }
    {$I-}  Reset(FileMSK);  {$I+}

    { Se esiste sul disco viene visualizzata una finestra di dialogo
      in cui si chiede se il file deve essere sovrascritto o no }
    If (IOResult = 0)
      Then

	Begin

	{ Chiusura del file }
	Close(FileMSK);

	{ Finestra di dialogo per l' utente }
        With Color Do
          If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               Il file specificato               |'+
		     '( '+NomeFile+' )|'+
		     'esiste sul disco.|'+
		     '|'+
		     'Devo sovrascrivere o no ?|','','',
		     __SI_NO__,WarningBord,WarningTitle,
		     WarningText,WarningSel,
		     WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then

		         { Può essere sovrascritto }
		         Sovrascrivi := True

	Else

	  { Non può essere sovrascritto }
	  Sovrascrivi := False;

	End;

    { Se il file non esiste o se si può sovrascrivere ... }
    If Sovrascrivi Then

      { Se non esiste, invece, viene creato }
      Begin

      New(AppRecFile); { 3848 Bytes }

      { Memorizza l' intestazione del file }
      With AppRecFile^ Do
        Begin
        Header := HeaderValue;
        Page := Image^[NumPgVideo].Page;
        End;

      { Controllo della validità del disco }
      StatoDisco := DiskIOStatus(Ord(NomeFile[1])-64);

      { Individuazione degli errori }
      If (StatoDisco <> 0)
        Then

          Begin

          { Individuazione dell' errore specifico }
          Case StatoDisco Of

             1: St := 'Drive protetto da scrittura|';

             2: St := 'Drive non pronto|';

             3: St := 'Disco non formattato|';

             4: St := 'Drive inesistente|';

            99: St := 'Errore fatale|';

            Else
              St := 'Errore sconosciuto|';

            End; { Case StatoDisco }

          Sovrascrivi := False;

	  { Finestra di dialogo per l' utente }
          With Color Do
            If (Dialog('[AVVERTENZA]',
		       '|'+
		       '               C''è stato un errore               |'+
		       'di disco:|'+
		       '|'+
		       St+
		       '','','',
		       __OK__,WarningBord,WarningTitle,
		       WarningText,WarningSel,
		       WarningUnSel,WarningKeySel,
		       WarningKeyUnSel) = 1)

		         Then

		           ;
	  End

      Else

        Begin

        { Cancellazione del file sul disco }
        ReWrite(FileMSK);

        { Se non c'è stato alcun errore di disco ... }
        If (IOResult = 0)
          Then

            { ... e c'è abbastanza spazio per memorizzare il file maschera ... }
            If (DiskFree(Ord(NomeFile[1])-64) > SizeOf(AppRecFile^))
              Then

                { ... scrivi il file su disco }
                Begin

                { Messaggio per l' utente }
                Info(' Scrittura del file '+NomeFile+' ...',Color.Performing);
                Delay(Ritardo.Messaggi);

                { Scrive il record }
                Write(FileMSK,AppRecFile^);

                { Chiude il file }
                Close(FileMSK);

                Dispose(AppRecFile); { 3848 Bytes }

                { Aggiorna il nome del file }
                Image^[NumPgVideo].FileName := NomeFile;

                End;

        End;

      End;

    End;

End; { SalvaFileMaschera }


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.FILE.TESTO

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video. Se l' immagine corrente non è stata
  salvata chiede se si è disposti a perdere le modifiche apportate.
  Il file viene letto come testo, per cui il colore è quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure LeggiFileTesto;

Begin { LeggiFileTesto }

{ Attende in input il nome del file da leggere }
NameReadFileTXT := InputFile('[Leggi File Testo]','.TXT','*.TXT',SetCarFile);
		   
{ Apre il file di testo specificato nella pagine video corrente }
ApriFileTesto(NameReadFileTXT,NumPgVideo);

End; { LeggiFileTesto }


{----------------------------------------------------------------------------
  PROCEDURA: SALVA.FILE.TESTO

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
  Il file viene salvato come testo, per cui il colore è quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure SalvaFileTesto;

{ Variabili locali }
Var

    { File strutturato per la scrittura }
    FileTXT:     Text;

    { Indica se il file (sempre se esiste) può essere o no sovrascritto }
    Sovrascrivi: Boolean;

    { Indice per i cicli }
    I:           Byte;

    { Indice per i cicli }
    J:           Byte;

    { Appoggio per memorizzare una riga }
    St:          String;

    { Stato del disco }
    StatoDisco:  Byte;


Begin { SalvaFileTesto }

{ Attende in input il nome del file da leggere }
NameWriteFileTXT := InputFile('[Salva File Testo]','.TXT','*.TXT',
			      SetCarFile);
		   
{ Se è diverso dalla stringa nulla }
If (NameWriteFileTXT <> StrNull)
  Then
    Begin

    { Inizializzazioni }
    NameWriteFileTXT := FExpand(NameWriteFileTXT);
    Sovrascrivi := True;

    { Assegnazione del file sul disco ad un nome logico }
    Assign(FileTXT,NameWriteFileTXT);

    { Lettura del file }
    {$I-}  Reset(FileTXT);  {$I+}

    { Se esiste sul disco viene visualizzata una finestra di dialogo
      in cui si chiede se il file deve essere sovrascritto o no }
    If (IOResult = 0)
      Then

	Begin

	{ Chiusura del file }
	Close(FileTXT);

	{ Finestra di dialogo per l' utente }
        With Color Do
	  If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               Il file specificato               |'+
		     '( '+NameWriteFileTXT+' )|'+
		     'esiste sul disco.|'+
		     '|'+
		     'Devo sovrascrivere o no ?|','','',
		     __SI_NO__,WarningBord,WarningTitle,
		     WarningText,WarningSel,
		     WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then

		         { Può essere sovrascritto }
		         Sovrascrivi := True

	Else

	  { Non può essere sovrascritto }
	  Sovrascrivi := False;

	End;

    { Se il file non esiste o se si può sovrascrivere ... }
    If Sovrascrivi Then

      { Se non esiste, invece, viene creato }
      Begin

      { Controllo della validità del disco }
      StatoDisco := DiskIOStatus(Ord(NameWriteFileTXT[1])-64);

      { Individuazione degli errori }
      If (StatoDisco <> 0)
        Then
          Begin

          { Individuazione dell' errore specifico }
          Case StatoDisco Of

             1: St := 'Drive protetto da scrittura|';

             2: St := 'Drive non pronto|';

             3: St := 'Disco non formattato|';

             4: St := 'Drive inesistente|';

            99: St := 'Errore fatale|';

            Else
              St := 'Errore sconosciuto|';

            End; { Case StatoDisco }

          Sovrascrivi := False;

	  { Finestra di dialogo per l' utente }
          With Color Do
            If (Dialog('[AVVERTENZA]',
		       '|'+
		       '               C''è stato un errore               |'+
		       'di disco:|'+
		       '|'+
		       St+
		       '','','',
		       __OK__,WarningBord,WarningTitle,
		       WarningText,WarningSel,
		       WarningUnSel,WarningKeySel,
		       WarningKeyUnSel) = 1)

		         Then

		           ;
	  End

      Else

        Begin

        { Cancellazione del file sul disco }
        ReWrite(FileTXT);

        { Se non c'è stato alcun errore di disco ... }
        If (IOResult = 0)
          Then

            { ... e c'è abbastanza spazio per memorizzare il file di testo ... }
            If (DiskFree(Ord(NameWriteFileTXT[1])-64) > (80*24))
              Then

                { ... scrivi il file su disco }
                Begin

                { Messaggio per l' utente }
                Info(' Scrittura del file '+NameWriteFileTXT+' ...',Color.Performing);
                Delay(Ritardo.Messaggi);

                { Scrive il file di testo sul disco }
                For i := 1 To 24 Do

	          Begin

	          { La riga è lunga 80 caratteri, compresi gli spazi }
	          St[0] := #80;

	          { Compone la stringa carattere per carattere }
	          For j := 1 To 80 Do
	            St[j] := Image^[NumPgVideo].Page[i,j].Ch;

	          { La scrive sul file }
	          WriteLn(FileTXT,St);

	          End;

                { Chiude il file }
                Close(FileTXT);

                { Aggiorna il nome del file }
                Image^[NumPgVideo].FileName := NameWriteFileTXT;

                End;

        End;

      End;

    End;

End; { SalvaFileTesto }


{----------------------------------------------------------------------------
  PROCEDURA: CAMBIA.DIRECTORY.CORRENTE

  Apre una finestra uguale a quella per l' immissione di un nome di file
  ma solo che questa volta occorre digitare una directory. Se la
  directory immessa non esiste viene visualizzato un messaggio di errore
  a video.
 ----------------------------------------------------------------------------}
Procedure CambiaDirectoryCorrente;

{ Variabili locali }
Var

    { Memorizza la directory corrente, per un eventuale ripristino
      della stessa }
    OldCurrDir: String;

    { Appoggio per l' immissione della directory }
    St:         String;

Begin { CambiaDirectoryCorrente }

{ Memorizza la directory corrente per sicurezza }
OldCurrDir := CurrDir;

{ Input della nuova directory }
St := InputDirectory('[Cambia Directory]','.','*.',SetCarFile);

{ Aggiorna la directory corrente }
If (St <> StrNull)
  Then
    CurrDir := St;

{ Cambio della directory corrente }
{$I-} ChDir(CurrDir); {$I+}

{ Se la directory è invalida segnala all' utente l' errore }
If (IOResult <> 0)
  Then

    Begin

    { Finestra di dialogo per l' utente }
    With Color Do
      If (Dialog('[AVVERTENZA]',
	         '|'+
	         '               La directory specificata               |'+
	         '( '+CurrDir+' )|'+
	         'non esiste sul disco.|','','',
	         __OK__,WarningBord,WarningTitle,
	         WarningText,WarningSel,
	         WarningUnSel,WarningKeySel,
		 WarningKeyUnSel) = 1)

		   Then

		     ;

    { Ripristino della directory precedente }
    CurrDir := OldCurrDir;

    End;

End; { CambiaDirectoryCorrente }


{----------------------------------------------------------------------------
  PROCEDURA: LISTA.DIRECTORY

  E' molto simile alla procedura CAMBIADIRECTORYCORRENTE, solo che questa
  volta, invece di listare il path immesso si esegue un 'CHDIR', come
  si farebe in DOS.
 ----------------------------------------------------------------------------}
Procedure ListaDirectory;

{ Variabili locali }
Var

    { Appoggio per l' immissione della directory }
    St: String;

Begin { ListaDirectory }

{ Lista della(e) directory(ies) voluta(e) }
St := InputFile('[Lista Directory]','.*','*.*',SetCarFile);

{ Cambio della directory corrente }
{$I-} ChDir(CurrDir); {$I+}

End; { ListaDirectory }


{----------------------------------------------------------------------------
  PROCEDURA: ACCESSO.AL.DOS

  E' la procedura che esegue realmente il comando specificato da COMANDO,
  cambiando il prompt nel nuovo environment, comprime la memoria dello
  heap, ecc.
 ----------------------------------------------------------------------------}
Procedure AccessoAlDOS ( Comando: String080 );

{ Etichietta per l' uscita dalla procedura con salti incondizionati }
Label
      ExitPoint;

{ Costanti locali }
Const

      { Lista libera per ogni temporanea richiesta dello stato della lista }
      FreeListTemp=  2000;

      { Spazio minimo per eseguire la Shell del DOS }
      MinDOSspace=  20000;

{ Titpi locali }
Type

     { Environment del nuovo COMMAND.COM }
     Environment= Array [0..MaxInt] Of
                    Char;

     { Puntatore all' environment }
     EnvPTR=      ^Environment;

{ Variabili locali }
Var

    { Puntatore al nuovo ambiente con il prompt speciale }
    NewEPTR:     EnvPTR;

    { Lunghezza del nuovo ambiente }
    NewEnvLen:   Word;

    { Segmento del nuovo ambiente }
    NewEnvSeg:   Word;

    { Segmento dell 'environment corrente }
    OldEnvSeg:   Word;

    { Stato restituito della funzione EXEC }
    ExecStatus:  Integer;

    { Drive/percorso/nome del comando da eseguire }
    PathName:    String127;

    { Comando da aggiungere all' opzione /C del COMMAND.COM }
    CommandTail: String127;


     {-----------------------------------------------------------------------
       FUNZIONE: MEM.AVAILABLE

       Restituisce TRUE se non esistono abbastanza blocchi continui nello
       heap; FALSE in caso contrario.
      -----------------------------------------------------------------------}
     Function  MemAvailable ( Size:   Word;
                              Margin: Word ): Boolean;

     { Variabili locali }
     Var

       { Indirizzo di inizio dello heap }
       HighestHeapEnd:  Pointer;

       { Indirizzo dello heap }
       SaveHeapPTR:     Pointer;

       { Indirizzo della lista libera dell' ambiente }
       FreePtr:         Pointer;


          {------------------------------------------------------------------
            FUNZIONE: PTR.DIFFERENCE

           Resituisce il numero di bytes fra l' indirizzo  HIGHTPT^ e LOWPT^
           forniti come parametri.
           ------------------------------------------------------------------}
          Function  PTRDifference ( HighPt: Pointer;
                                    LowPt:  Pointer): LongInt;

          { Variabili locali }
          Var

              { Appoggio per memorizzare l' indirizzo più alto dello heap }
              HighVal: LongInt;

              { Appoggio per memorizzare l' indirizzo più basso dello heap }
              LowVal:  LongInt;

          Begin { PTRDifference }

          { Valore più alto ... }
          HighVal := LongInt(Seg(HighPt^)) shl 4+LongInt(Ofs(HighPt^));

          { ... valore più basso ... }
          LowVal := LongInt(Seg(LowPt^)) shl 4+LongInt(Ofs(LowPt^));

          { ... differenza }
          PTRDifference := HighVal-LowVal;

          End; { PTRDifference }


          {------------------------------------------------------------------
            FUNZIONE: PTR.HEAP.END

            Restituisce l' ultima locazione libera dello heap in un punto
            normalizzato.
           ------------------------------------------------------------------}
          Function  PTRHeapEnd: Pointer;

          Begin { PTRHeapEnd }

          { Testa se è zero ... }
          If (Ofs(FreePtr^) = 0)
            Then

              { La lista libera è vuota }
              PTRHeapEnd := Ptr(Seg(FreePtr^)+$1000, 0)

          Else

            { Restiruisce l' indirizzo }
            PTRHeapEnd := Ptr(Seg(FreePtr^)+Ofs(FreePtr^) Shr 4, 0);

          End; { PTRHeapEnd }


     Begin { MemAvailable }

     { Calcola il valore alto della fine dello heap riferendosi alla
       lista della lunghezza del buffer libera }
     HighestHeapEnd := Ptr(Seg(FreePtr^)+$1000-Succ(Margin shr 4), 0);

     { Confronta l' attuale lunghezza della lista libera }
     If (PTRDifference(HighestHeapEnd, PTRHeapEnd) > 0)
       Then

         { E' più grande del buffer libero }
         HighestHeapEnd := PTRHeapEnd;

     If (PTRDifference(HighestHeapEnd, HeapPtr) > Size)
       Then

         { C'è lo spazio richiesto oltre il margine più alto dello heap }
         MemAvailable := True

     Else

       { Ignora temporaneamente tutto lo spazio che c'è oltre lo heap }
       Begin
       SaveHeapPtr := HeapPtr;
       HeapPtr := PTRHeapEnd;
       MemAvailable := (Size < MaxAvail);
       HeapPtr := SaveHeapPtr;
       End;

     End; { MemAvailable }


     {-----------------------------------------------------------------------
       FUNZIONE: BULID.NEW.ENVIRONMENT

       Modifica l' environment per un nuovo prompt e restituisce il nuovo
       segmento di inizio.
     ------------------------------------------------------------------------}
     Function  BuildNewEnvironment: Word;

     { Variabili locali }
     Var

         { Nuovo indirizzo }
         LNewEPTR:     EnvPTR;

         { Indirizzo dell' environment }
         EPTR:         EnvPTR;

         { Stringa da cercare nell' ambiente }
         SearchString: String127;

         { Stringa di appoggio }
         EStr:         String127;

         { Nuovo prompt modificato }
         ThePrompt:    String127;

         { Vale TRUE se è stata trovata la stringa da ricercare; FALSE
           in caso contrario }
         Done:         Boolean;

         { Indice per i cicli }
         I:            Word;

         { Lunghezza dell' environment nuovo }
         EnvLen:       Word;

         { Inizio della stringa (offset) }
         PStart:       Word;

         { Fine della stringa (offset) }
         PEnd:         Word;

     Begin { BuildNewEnvironment }

     { Inizializza le variabili }
     EPtr := Ptr(MemW[PrefixSeg:$002C], 0);
     I := 0;
     Done := False;
     SearchString := 'PROMPT=';
     EStr := '';
     Pstart := $FFFF;

     { Legge il vecchio environment per sapere la lunghezza del prompt }
     Repeat

       { Se il carattere è nullo si passa ad un' altra variabile
         dell' ambiente }
       If (EPtr^[I] = kNull)
         Then

	   Begin

           { Se ci sono due caratteri nulli di seguito, l' ambiente
             è terminato }
           If ((EPtr^[Succ(I)] = kNull) Or (I > 32767))
	     Then

               { Uscita dal ciclo }
	       Begin
               Done := True;
               EnvLen := Succ(I);
               End;

           { La stringa è quella da cercare ? }
           If (Copy(EStr, 1, Length(SearchString)) = SearchString)
	     Then

	       Begin
               PEnd := I;
               PStart := I-Length(EStr)+Length(SearchString);
               End;

           EStr := '';
           End

       Else

         { Aggiunta del carattere }
         EStr := EStr+EPtr^[I];

       { Incremento dell' indice }
       Inc(I);

     Until Done;

     { L' offset è valido ? }
     If (PStart = $FFFF)
       Then

         { Il prompt non è stato trovato e quindi ne viene creato uno
	   nuovo }
	 Begin
         PStart := Pred(EnvLen);
         PEnd := Pstart;
         ThePrompt := kNull+SearchString+NewPrompt+
	              '[0;31;40;1m$P$G[0;37;40m'+kNull;
         End

     Else

       { L' ambiente è valido e il prompt viene solo aggiornato }
       ThePrompt := NewPrompt+'[0;37;40m';

     { Aggiusta la nuova lunghezza del prompt per avere il nuovo
       environment }
     NewEnvLen := EnvLen+Length(ThePrompt);

     { Controlla se c'è abbastanza memoria libera }
     If (Not (MemAvailable(NewEnvLen+15, FreeListTemp)))
       Then

         { Non c'è abbastanza memoria per il nuovo environment }
         Begin
         BuildNewEnvironment := MemW[PrefixSeg:$002C];
         Exit;
         End;

     { Alloca memoria }
     GetMem(NewEptr, NewEnvLen+15);

     If (Ofs(NewEptr^) <> 0)
       Then
         LnewEPTR := Ptr(Succ(Seg(NewEPTR^)), 0)
     Else
       LnewEPTR := NewEPTR;

     { Restituisce il segmento del nuovo environment }
     BuildNewEnvironment := Seg(LNewEPTR^);

     { Inserisce il nuovo prompt nel nuovo environment }
     Move(EPTR^[0], LNewEPTR^[0], PStart);
     Move(ThePrompt[1], LNewEptr^[PStart], Length(ThePrompt));
     Move(EPTR^[PStart], LNewEPTR^[PStart+Length(ThePrompt)],
          Succ(EnvLen-PStart));

     End; { BuildNewEnvironment }


     {-----------------------------------------------------------------------
       FUNZIONE: EXEC.SHRINK

       Esegue il comando DOS specificato da COMMAND. Per avere una
       nuova Shell basta dare come parametro la stringa nulla ('').
      -----------------------------------------------------------------------}
     Function  ExecShrink ( Command: String): Integer;

     { Etichetta per salti incondizionati }
     Label
           ExitPoint;

     { Variabili locali }
     Var

         { Indirizzo di fine dello heap dell' ambiente precedente }
         OldHeapEnd:      Pointer;

         { Indirizzo di fine dello heap del nuovo ambiente }
         NewHeapEnd:      Pointer;

         { Numero di bytes da allocare }
         BytesAllocated:  Word;

         { Dimensione della lista libera }
         FreeListSize:    Word;

         { Parametri da passare }
         ParasToKeep:     Word;

         { Parametri che abbiamo }
         ParasWeHave:     Word;

         { Parametri per il DOS }
         ParasForDos:     Word;


          {------------------------------------------------------------------
            FUNZIONE: PTR.DIFF

            Restituisce il numero di bytes tra l' indirizzo A^ e l' indiriz_
            zo B^.
           ------------------------------------------------------------------}
          Function  PTRDiff ( HighPt: Pointer;
                              LowPt:  Pointer): LongInt;

          { Tipi locali }
          Type

               { Segmento-offset }
               SegOfs= Record
                         O: Word;
                         S: Word;
                         End; { SegOfs }

          { Variabili locali }
          Var

              { Parte alta del puntatore all' indirizzo di inizio dello heap }
              High:     SegOfs Absolute HighPt;

              { Parte bassa del puntatore all' indirizzo di inizio dello heap }
              Low:      SegOfs Absolute LowPt;

              { Indirizzo di inizio dello heap }
              HighVal:  LongInt;

              { Indirizzo di fine dello heap }
              LowVal:   LongInt;

          Begin { PTRDiff }

          { Determina l' inizio ... }
          HighVal := LongInt(High.S) Shl 4+LongInt(High.O);

          { ... la fine ... }
          LowVal := LongInt(Low.S) Shl 4+LongInt(Low.O);

          { ... e ne calcola la differenza }
          PTRDiff := HighVal-LowVal;

          End; { PTRDiff }


          {------------------------------------------------------------------
            FUNZIONE: SET.BLOCK

           Libera un po' di memoria tra il programma e la Shell DOS.
           ------------------------------------------------------------------}
          Function  SetBlock ( Paras: Integer): Boolean;

          { Variabili locali }
          Var
              Regs: Registers;

          Begin { SetBlock }

          With Regs Do

            Begin
            Ah := $4A;
            ES := PrefixSeg;
            Bx := Paras;
            MsDos(Regs);
            SetBlock := Not Odd(Flags);
            End;

          End; { SetBlock }


          {------------------------------------------------------------------
            FUNZIONE: GET.ENV.STR

            Restituisce il valore logico TRUE se la variabile specificata da
            SEARCHSTRING viene trovata nell' environment; FALSE in caso
            contrario.
           ------------------------------------------------------------------}
          Function  GetEnvStr ( SearchString: String): String;

          { Titpi locali }
          Type

               { Environment (massimo 32767 caratteri) }
               Env= Array [0..32767] Of
	              Char;

          { Variabili locali }
          Var

              { Environment }
              EPTR:      ^Env;

              { Stringa di ricerca }
              EStr:      String255;

              { TRUE per uscira dal ciclo }
              Done:      Boolean;

              { Lunghezza della tringa trovata }
              SearchLen: Integer;

              { Indice per i cicli }
              I:         Integer;


          Begin { GetEnvStr }

          { Controllo della stringa da cercare }
          GetEnvStr := '';
          If (SearchString = '')
            Then

              { Uscita }
              Exit;

          { Inizializzazione delle variabili }
          EPTR := Ptr(MemW[PrefixSeg:$2C], 0);
          I := 0;
          SearchString := SearchString+'=';
          SearchLen := Length(SearchString);
          Done := False;
          EStr := '';

          { Ciclo di ricerca }
          Repeat

            { Se il carattere è nullo si passa ad un' altra variabile
              dell' ambiente }
            If (EPtr^[I] = kNull)
              Then

	        Begin

                { Se ci sono due caratteri nulli di seguito, l' ambiente
                  è terminato }
                If (EPtr^[Succ(I)] = kNull)
	          Then

                    { Uscita dal ciclo }
	            Begin
                    Done := True;

                    { La stringa è '==' non c'è assegnamento e occorre passare
                      alla prossima variabile }
                    If (SearchString = '==')
	              Then

		        Begin
                        EStr := '';
                        I := I+4;

                        { Avanzamento alla prossima stringa }
                        While (EPTR^[I] <> kNull) Do
		          Begin
                          EStr := EStr+EPTR^[I];
                          Inc(I);
                          End;

                        GetEnvStr := EStr;

                        End;

                    End;

                { La stringa è quella da cercare ? }
                If (Copy(EStr, 1, SearchLen) = SearchString)
	          Then

                    { Uscita: ricerca terminata con successo }
	            Begin
                    GetEnvStr := Copy(EStr, Succ(SearchLen), 255);
                    Done := True;
                    End;

                EStr := '';

                End

            Else

              { Aggiunta del carattere }
              EStr := EStr+EPtr^[I];

            { Incremento dell' indice }
            Inc(I);

          Until Done;

          End; { GetEnvStr }


     Begin { ExecShrink }

     { Calcola il numero di bytes da salvare }
     FreeListSize := PTRDiff(TopOfHeap, HeapEnd);
     BytesAllocated := 0;

     { Se non c'è abbastanza spazio disponibile, viene utilizzato lo
       stack per memorizzare la lista libera }
     If ((FreeListSize+1000) < SPTR)
       Then
         NewHeapEnd := PTR(SSeg, 0)

     Else

       Begin

       { Controllo per la memoria libera richiesta }
       If (MaxAvail < FreeListSize)
         Then
	   Begin

           { Memoria insufficiente per memorizare la lista libera: uscita }
           ExecShrink := -1;
           Exit;

           End;

       { Allocazione della memoria per una copia della lista libera }
       BytesAllocated := FreeListSize;
       If (BytesAllocated > 0)
         Then
           GetMem(NewHeapEnd, BytesAllocated);

       { Ricalcola la lunghezza della lista libera }
       FreeListSize := Word(PTRDiff(TopOfHeap, HeapEnd));
       End;

     { Salva il puntatore di fine della lista libera }
     OldHeapEnd := HeapEnd;

     { Attuale locazione di memoria DOS letta dal blocco di controllo
       della memoria }
     ParasWeHave := MemW[Pred(PrefixSeg):3];

     { Calcolo del totale di memoria necessaria }
     ParasForDos := Pred(PtrDiff(TopOfHeap, HeapPtr) Shr 4);

     { Calcolo del totale di memoria necessario per la shell }
     ParasToKeep := ParasWeHave-ParasForDos;

     { Controlla se la memoria è sufficiente per eseguire un comando DOS }
     If ((ParasForDos > 0) And (ParasForDos < (MinDOSspace Shr 4)))
       Then

         Begin
         ExecShrink := -4;
         GoTo ExitPoint;
         End;

     { Copia la lista libera nella locazione calcolata (sicura) }
     Move(OldHeapEnd^, NewHeapEnd^, FreeListSize);

     { De-allocazione della memoria per il DOS }
     If (Not SetBlock(ParasToKeep))
       Then

         Begin
         ExecShrink := -2;
         GoTo ExitPoint;
         End;

     { Legge i parametri per eseguire la shell o un comando DOS }
     PathName := GetEnvStr('COMSPEC');
     If (Command = '')
       Then
         CommandTail := ''
     Else
       CommandTail := '/C '+Command;

     WriteLn('Memoria libera: ', MemAvail-MemShell, ' Bytes');

     { Chiamata alla funzione EXEC del Turbo Pascal }
     Exec(PathName, CommandTail);

     { Riallocazione della memoria dal DOS }
     If (Not SetBlock(ParasWeHave))
       Then

         Begin
         ExecShrink := -3;
         GoTo ExitPoint;
         End;

     { Rimette la lista libera dove era }
     Move(NewHeapEnd^, OldHeapEnd^, FreeListSize);

     { Se si è arrivati fino a questo punto, il risultato della funzione
       è memorizato nella variabile DosError }
     ExecShrink := DosError;

   ExitPoint:

     { Libera ogni memoria allocata dinamicamente durante l' esecuzione
       della procedura }
     If (BytesAllocated <> 0)
       Then
         FreeMem(NewHeapEnd, BytesAllocated);

     End; { ExecShrink }


Begin { AccessoAlDOS }

  { Testa se si vuole eseguire la Shell o un comando DOS qualunque }
  If (Comando = '')
    Then

      Begin

      { DOS shell, contruzione di un nuovo environment per il prompt
        personalizzato }
      NewEnvSeg := BuildNewEnvironment;
      OldEnvSeg := MemW[PrefixSeg:$2C];
      MemW[PrefixSeg:$2C] := NewEnvSeg;

      End

  Else

    { Passaggio all' environment già esistente }
    NewEnvSeg := MemW[PrefixSeg:$2C];

  { Libera la memoria ed esegue il comando DOS specificato }
  ExecStatus := ExecShrink(Comando);

  { Testa un eventuale errore di esecuzione }
  Case ExecStatus Of

     { Successo: tutto bene }
     0: ;

    { Memoria insufficiente per la lista libera }
    -1: WriteLn('Memoria insufficiente per la lista libera.');

    { Memoria insufficiente per eseguire il DOS }
    -4: WriteLn('Memoria insufficiente per eseguire il DOS.');

  Else

    { Errore generico }
    WriteLn('Non posso eseguire il DOS.');

  End;

ExitPoint:

  { Libera la memoria eventualmente allocata }
  If (Comando = '')
    Then

      If (MemW[PrefixSeg:$002C] <> OldEnvSeg)
        Then

          { Rilascio della memoria di heap per il nuovo prompt }
	  Begin
          FreeMem(NewEptr, NewEnvLen+15);
          MemW[PrefixSeg:$2C] := OldEnvSeg;
          End;

End; { AccessoAlDOS }


{----------------------------------------------------------------------------
  PROCEDURA: ESEGUI.COMANDO.DOS

  Esegue un qualsiasi comando che si darebbe in DOS, restando però con il
  programma caricato in memoria. Una volta terminata l' eseguzione di ciò
  che è stato digitato viene aspettato un RETURN per tornare a TIP.
  Se non c'è abbastanza memoria per eseguire il comando o se non viene
  trovato il file COMMAND.COM, viene visualizzata una finestra con
  il messaggio di errore opportuno.
 ----------------------------------------------------------------------------}
Procedure EseguiComandoDOS;

{ Variabili locali }
Var

    { Tasto premuto dall' utente }
    Ch1:        Char;

    { Tasto esteso premuto dall' utente }
    Ch2:        Char;

Begin { EseguiComandoDOS }

{ Input del comando da eseguire }
DOSCommand := InputString(' Comando DOS:  ',
			  Color.InputField,50,255,
			  DOSCommand,Color.InputDigit,
			  Color.InputArrow,SetCarAll);

{ Se è stato digitato qualche cosa ... }
If (DOSCommand <> StrNull)
  Then

    Begin

    AggiornaStatusLine := False;

    { Cancella lo schermo e attiva il cursore a linea }
    TextAttr := Color.Default;
    ClrScr;
    LineCursor;

    { Esecuzione del comando }
    AccessoAlDOS('/C '+DOSCommand);

    { Se c'è stato qualche errore nell' eseguzione visualizza una
      finestra di dialogo per segnalare l' errore }
    If (DosError <> 0)
      Then
	Begin

	{ Apre la finestra di dialogo }
        With Color Do
	  If (Dialog('[ERRORE DOS]',
		     '|'+
		     '               Non trovo il file               |'+
		     'COMMAND.COM o non c''è|'+
		     'abbastanza memoria per|'+
		     'eseguire il comando.|','','',
		     __OK__,WarningBord,WarningTitle,
		     WarningText,WarningSel,
		     WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then

		         ;

	End

    Else

      Begin

      { Messaggio finale }
      TextAttr := Color.UserInfo;
      Write('Premi RETURN o un pulsante del MOUSE per tornare a Text '+
	    'Image Processor.');

      { Attende la pressione del tasto RETURN o quella di uno dei pulsanti
        del mouse }
      Repeat

        { Attendi un tasto o un pulsante del mouse }
        Attendi(Ch1,Ch2,SComandoDOS);

      Until (MousePressed Or (Ch1 = kReturn));

      End;

    AggiornaStatusLine := True;

    { Rilascia i pulsanti del mouse }
    While MousePressed Do
      GetMPos;

    { Nasconde il cursore }
    CursorOFF;

    { Ripristina lo schermo }
    Fisico^ := Image^[NumPgVideo].Page;

    End;

End; { EseguiComandoDOS }


{----------------------------------------------------------------------------
  PROCEDURA: SHELL.DOS

  Questa procedura non si differenzia molto da quella che esegue un
  comando DOS, tranne per il fatto che il comando da eseguire è ora
  COMMAND.COM.
  Una volta che si desidera ritornare a TIP basta digitare EXIT.
  Se non c'è abbastanza memoria per eseguire il comando o se non viene
  trovato il file COMMAND.COM, viene visualizzata una finestra con
  il messaggio di errore opportuno.
 ----------------------------------------------------------------------------}
Procedure ShellDOS;

{ Variabili locali }
Var

    { Tasto premuto dall' utente }
    Ch1:        Char;

    { Tasto esteso premuto dall' utente }
    Ch2:        Char;

Begin { ShellDOS }

AggiornaStatusLine := False;

{ Cancella lo schermo e attiva il cursore a linea }
TextAttr := Color.Default;
ClrScr;
LineCursor;

{ Messaggio per l' utente }
TextAttr := Color.UserInfo;
WriteLn('Memoria libera: ', MemAvail-MemShell,' Bytes');
WriteLn('Digita EXIT per ritornare a TIP.');

{ Esegue la SHELL nel modo tradizionale }
SwapVectors;                          { <--- }
Exec(GetEnv('COMSPEC'), '');          { <--- }
SwapVectors;                          { <--- }

{ Se si dovessero incontrare errori con la Shell tradizionale,
 sostituire le righe segnate dalla freccia ('<---') con la seguente
 riga:

AccessoAlDOS(''); }

{ Se c'è stato qualche errore nell' eseguzione visualizza una
  finestra di dialogo per segnalare l' errore }
If (DosError <> 0)
  Then
    Begin

    { Apre la finestra di dialogo }
    With Color Do
      If (Dialog('[ERRORE SHELL]',
	         '|'+
	         '               Non trovo il file               |'+
	         'COMMAND.COM o non c''è|'+
	         'abbastanza memoria per|'+
	         'eseguire la SHELL.|','','',
	         __OK__,WarningBord,WarningTitle,
	         WarningText,WarningSel,
	         WarningUnSel,WarningKeySel,
		 WarningKeyUnSel) = 1)

		   Then

		     ;

    End

Else

  Begin

  { Messaggio finale }
  TextAttr := Color.UserInfo;
  Write('Premi RETURN o un pulsante del MOUSE per tornare a Text '+
        'Image Processor.');

  { Attende la pressione del tasto RETURN o quella di uno dei pulsanti
    del mouse }
  Repeat

    { Attendi un tasto o un pulsante del mouse }
    Attendi(Ch1,Ch2,SShellDOS);

  Until (MousePressed Or (Ch1 = kReturn));

  End;

AggiornaStatusLine := True;

{ Rilascia i pulsanti del mouse }
While MousePressed Do
  GetMPos;

{ Nasconde il cursore }
CursorOFF;

{ Ripristina lo schermo }
Fisico^ := Image^[NumPgVideo].Page;

End; { ShellDOS }


{----------------------------------------------------------------------------
  PROCEDURA: MENU.FILES

  Disegna il menu files ed attende una scelta da parte dell' utente: a
  seconda dell' opzione selezionata, esegue il compito specifico.
 ----------------------------------------------------------------------------}
Procedure MenuFiles;

Begin { MenuFiles }

{ Apre con effetto a scoppio la finestra del menu files }
With Color Do
  Case Menu('[MENU FILES]',

	    '||'+

	    '               ^Leggi File Maschera               |'+
            ' Carica un file immagine nella pagina attiva|'+

	    '^Salva File Maschera|'+
            ' Salva il contenuto della pagina attiva in un file immagine sul disco|'+

	    '||',

	    'Leggi File di ^Testo|'+
            ' Carica un file di testo nella pagina attiva|'+

	    'Salva File di T^esto|'+
            ' Salva il contenuto della pagina attiva in un file di testo sul disco|'+

	    '||',

	    '^Cambia Directory Corrente|'+
            ' Modifica la directory di default del programma|'+

	    'Lista ^Directory|'+
            ' Visualizza l'' elenco di tutti i file di una directory|'+

	    '||'+

	    'Esegui C^omando DOS|'+
            ' Esegue un comando come se fosse dato da DOS|',

	    'S^hell DOS|'+
            ' Esce temporaneamente dal programma, senza però cancellarlo dalla memoria|'+

	    '||','','','','',
	    MenuTitle,MenuSel,MenuUnSel,
	    MenuBord,MenuText,MenuKeySel,
	    MenuKeyUnSel,SMenuFiles)
       Of

         { Legge un file maschera }
         2: LeggiFileMaschera;

         { Salva la pagina video corrente in un file maschera }
         3: SalvaFileMaschera(Image^[NumPgVideo].FileName,True);

         { Legge un file di testo }
         5: LeggiFileTesto;

         { Salva la pagina video corrente in un file di testo }
         6: SalvaFileTesto;

         { Cambia la directory corrente }
         8: CambiaDirectoryCorrente;

         { Lista la directory (o le directories) del disco }
         9: ListaDirectory;

         { Esegue un qualsiasi comando DOS }
         11: EseguiComandoDOS;

         { Esegue la Shell DOS }
         12: ShellDOS;

       End; { Case Menu }

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

End; { MenuFiles }


End. { TIPFiles }
