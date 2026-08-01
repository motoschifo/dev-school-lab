{ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
 º                                                                          º
 º       ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù        º
 º       ùúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúù        º
 º       ùúúÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿úúúúÚÄÄÄÄÄÄ¿úúúúúúúÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿úúúúúù        º
 º       ùúú³°°°°°°°°°°°°°°³úúúú³±±±±±±³úúúúúúú³²²²²²²²²²²²²²À¿úúúúù        º
 º       ùúú³°°ÚÄÄ¿°°ÚÄÄ¿°°³úúúúÀÄ¿±±ÚÄÙúúúúúúúÀÄ¿²²ÚÄÄÄÄÄÄ¿²²À¿úúúù        º
 º       ùúúÀÄÄÙúú³°°³úúÀÄÄÙúúúúúú³±±³úúúúúúúúúúú³²²³úúúúúúÆ ²²³úúúù        º
 º       ùúúúúúúúú³°°³úúúúúúúúúúúú³±±³úúúúúúúúúúú³²²ÀÄÄÄÄÄÄÙ²²ÚÙúúúù        º
 º       ùúúúúúúúú³°°³úúúúúúúúúúúú³±±³úúúúúúúúúúú³²²²²²²²²²²²ÚÙúúúúù        º
 º       ùúúúúúúúú³°°³úúúúúúúúúúúú³±±³úúúúúúúúúúú³²²ÚÄÄÄÄÄÄÄÄÙúúúúúù        º
 º       ùúúúúúúÚÄÙ°°ÀÄ¿úúúúúúúúÚÄÙ±±ÀÄ¿úúúúúúúÚÄÙ²²ÀÄ¿úúúúúúúúúúúúù        º
 º       ùúúúúúú³°°°°°°³úTEXTúúú³±±±±±±³úIMAGEú³²²²²²²³úPROCESSORúúù        º
 º       ùúúúúúúÀÄÄÄÄÄÄÙúúúúúúúúÀÄÄÄÄÄÄÙúúúúúúúÀÄÄÄÄÄÄÙúúúúúúúúúúúúù        º
 º       ùúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúù        º
 º       ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù        º
 º                                                                          º
 º       FOCHI MICHELE                                                      º
 º       VERSIONE 1.0                          UNIT TIPMAIN                 º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}
{ Data:   14 Marzo 1993
  Ora:    14:00:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorMainUnit }

{ Contiene le procedure principali del programma. }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Procedure MenuPrincipale;

  - Procedure EditScreen; }


{ Nome della unit }
Unit
     TIPMain;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPMain }


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
     TIPInit,

     { Voce 'Files' del menu principale }
     TIPFiles,

     { Voce 'Colori' del menu principale }
     TIPColor,

     { Voce 'Blocchi' del menu principale }
     TIPBlock,

     { Voce 'Traccia cornici' del menu principale }
     TIPTrace,

     { Voce 'Schermo' del menu principale }
     TIPVideo,

     { Voce 'Conversione' del menu principale }
     TIPConv,

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse,

     { Voce 'Scegli immagine' del menu principale }
     TIPImage,

     { Voce 'Configurazione' del menu principale }
     TIPConfg,

     { Visualizzazione dell' ora e della pressione dei tasti speciali }
     TIPTime;


{----------------------------------------------------------------------------
  PROCEDURA: MENU.PRINCIPALE

  Visualizza il menu principale, richiamabile premendo il tasto ESCAPE,
  e attende una scelta da parte dell' utente. Una volta effettuata tale
  scelta manda in eseguzione la procedura opportuna.
  Premendo il tasto ESCAPE si esce dal menu senza effettuare alcuna scelta.
 ----------------------------------------------------------------------------}
Procedure MenuPrincipale;


{----------------------------------------------------------------------------
  PROCEDURA: EDIT.SCREEN

  E' la procedura principale, che gestisce le chiamate ai menu, all' help,
  tutti gli spostamenti del cursore e tutte le altre cose che si possono
  fare nel programma.
 ----------------------------------------------------------------------------}
Procedure EditScreen;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPMain }


{----------------------------------------------------------------------------
  PROCEDURA: MENU.PRINCIPALE

  Visualizza il menu principale, richiamabile premendo il tasto ESCAPE,
  e attende una scelta da parte dell' utente. Una volta effettuata tale
  scelta manda in eseguzione la procedura opportuna.
  Premendo il tasto ESCAPE si esce dal menu senza effettuare alcuna scelta.
 ----------------------------------------------------------------------------}
Procedure MenuPrincipale;

Begin { MenuPrincipale }

{ Disegna il menu }
With Color Do
  Case Menu('[MENU PRINCIPALE]',

	    '||'+

	    '                    Carattere ^ASCII                    |'+
            ' (ALT-A) Scegli un carattere ASCII fra quelli visualizzati|'+

	    '^Cornici|'+
            ' (ALT-C) Scegli un carattere per aggiustare o creare una cornice|',

	    '^Traccia Cornici|'+
            ' (ALT-T) Disegna linee per lo schermo|'+

	    'C^olori|'+
            ' (ALT-O) Scegli il colore di foregroung e/o background|'+

	    '||',

            'Scegli ^Immagine|'+
            ' (ALT-I) Scegli l'' immagine di lavoro|'+

	    '^Blocchi|'+
            ' (ALT-B) Operazioni sui blocchi (copia, muovi, colora, contorna, ecc.)|',

	    '^Schermo|'+
            ' (ALT-S) Operazioni sullo schermo intero (muovi, inverti, colora, ecc.)|'+

            '||',

            '^Files|'+
            ' (ALT-F) Operazioni sul disco (leggi/salva file, directory, shell, ecc.)|'+

            'Confi^gurazione|'+
            ' (ALT-G) Personalizza il programma (ritardi, cornici, ecc.)|',

	    'Con^versione|'+
            ' (ALT-V) Converti l'' immagine in Pascal, C, Assembler, ecc.|'+

            '^Help|'+
            ' (ALT-H) Apri la finestra di aiuto|',

	    '||'+

	    '^Uscita|'+
            ' (ALT-U) Termina la sessione TIP|'+

	    '||','',

	    MenuTitle,MenuSel,MenuUnSel,
	    MenuBord,MenuText,MenuKeySel,
	    MenuKeyUnSel,SMainMenu) Of

    { Scegli un carattere ASCII dalla finestra }
    2: ScegliASCII;

    { Scegli un carattere per disegnare un angolo di una cornice, un
      carattere lineare, ecc. }
    3: ScegliCornice;

    { Disegna un menu da cui si possono effettuare le seguenti operazioni:
       - Non tracciare linee
       - Tracciare linee singole
       - Tracciare linee semplici/doppie
       - Tracciare linee doppie/semplici
       - Tracciare linee doppie
       - Tracciare linee con un carattere
       - Tracciare linee colorate }
    4: MenuTraccia;

    { Scegli il colore di foreground e/o di background }
    5: SelezionaColori;

    { Disegna un menu da cui si pu• scegliere l' immagine da rendere
      attiva }
    7: SelezionaImmagine;

    { Disegna un menu da cui si possono effettuare le seguenti operazioni:
       - Marcare l' inizio del blocco
       - Marcare la fine del blocco
       - Definizione delle coordinate del blocco
       - Copiare un blocco
       - Muovere un blocco
       - Cancellare un blocco
       - Riempire un blocco
       - Contornare un blocco
       - Invertire un blocco
         - Inverti orizzontalmente
         - Inverti verticalmente
         - Negativo
       - Leggere un file blocco
       - Salvare un file blocco
       - Leggere un blocco da un file di testo
       - Salvare un blocco su un file di testo
       - Memorizzare un blocco
       - Richiamare un blocco }
    8: MenuBlocchi;

    { Disegna un menu da cui si possono effettuare le seguenti operazioni:
       - Copiare una immagine
       - Muove una immagine
       - Cancellare una immagine
       - Riempire una immagine
       - Contornare una immagine
       - Invertire una immagine
         - Inverti orizzontalmente
         - Inverti verticalmente
         - Negativo
       - Memorizzare una immagine
       - Richiamareuna immagine }
    9: MenuSchermo;

    { Disegna un menu da cui si possono effettuare le seguenti operazioni:
       - Lettura di un file maschera
       - Scrittura di un file maschera
       - Lettura di un file di testo
       - Scrittura di un file di testo
       - Cambiare la directory corrente
       - Listare una directory
       - Eseguire un comando DOS
       - Eseguire la Shell DOS }
    11: MenuFiles;

    { Disegna un menu da cui si possono effettuare le seguenti operazioni:
        - Modifica dei colori
        - Modifica delle velocit…
        - Modicifa dei bordi delle finestre
        - Modifica dei bordi del blocco
        - Modifica le frecce del contorno del blocco
        - Modifica i settaggi del mouse
        - Modifica le opzioni speciali
        - Leggi il file di configurazione
        - Salva il file di configurazione }
    12: MenuConfigurazione;

    { Disegna un menu da cui si possono effettuare le seguenti operazioni:
        - Turbo Pascal
          - GoToXY + Write
          - Solo Write
          - Colori ottimizzati
          - Con WriteStr
          - Con Diretta
          - Memoria video
          - Con file maschera
        - Turbo Assembler
          - Colori e posizioni
          - Solo colori
          - Solo posizioni
          - con il BIOS
        - Turbo C
          - GoToXY + CPrintF
          - Senza GoToXY
          - Colori ottimizzati
          - Con Diretta
        - GW Basic
          - Con Locate
          - Senza Locate
        - DataBase
          - A colori
          - Colori ottimizzato
          - In bianco e nero
        - Sequenze Escape
          - Con posizionamento
          - Senza posizionamento }
    13: MenuConversione;

    { Apre la schermata di aiuto generale }
    14: Help('Help Generale',Altro);

    { Disegna un menu da cui si possono effettuare le seguenti operazioni:
        - Uscire dal programma perdendo le modifiche
        - Non uscire }
    16: UscitaSiNo;

    End; { Case Menu }

{ Campo d' azione del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { MenuPrincipale }


{----------------------------------------------------------------------------
  PROCEDURA: EDIT.SCREEN

  E' la procedura principale, che gestisce le chiamate ai menu, all' help,
  tutti gli spostamenti del cursore e tutte le altre cose che si possono
  fare nel programma.
 ----------------------------------------------------------------------------}
Procedure EditScreen;

{ Variabili locali }
Var

    { Tasto premuto dall' utente }
    Ch1:   Char;

    { Tasto premuto dall' utente }
    Ch2:   Char;

    { Indice per i cicli }
    I:     Byte;


Begin { EditScreen }

{ La prima pagina Š quella di default }
NumPgVideo := 1;

{ Se vale TRUE, il programma termina la sua eseguzione, altrimenti attende
  la pressione di un tasto da parte dell' utente ed esegue il compito
  specifico }
Uscita := False;

{ Ciclo principale }
Repeat

  { Campo d' azione del mouse }
  SetTHorRange(1,80);
  SetTVertRange(1,24);

  { Visualizza lo schermo in memoria sul video }
  Fisico^ := Image^[NumPgVideo].Page;

  { Aggiorna il numero di riga, di colonna, di pagina, il colore di
    background e quello di foreground, e il carattere selezionato }
  With Image^[NumPgVideo] Do
    Stato(NumPgVideo,Row,Col,Attr,SelCar,Modify);

  { Posiziona il cursore alla riga e colonna opportuna }
  PosizCursore;

  { Attende la pressione di un tasto o di un pulsante del mouse. La
    procedura Attendi aggiorna anche l' ora e la pressione dei tasti
    speciali }
  AggiornaStatusLine := True;

  Attendi(Ch1,Ch2,SScreen);

  { Spegne il cursore }
  CursorOFF;
  AggiornaStatusLine := False;

  { Se il mouse Š stato premuto ... }
  If MousePressed
    Then

      Begin

      { Pulsante sinistro }
      If LeftButton
        Then
          Begin

          { Disegno del carattere precedente }
	  If ((MouseTextX In [1..80]) And (MouseTextY In [1..24]))
            Then
              Begin
              With Image^[NumPgVideo] Do
                Begin
	        Col := MouseTextX;
                Row := MouseTextY;
                Ch1 := SelCar;
                End;
              Ch2 := kNull;
              End;
          End

      Else

        { Pulsante destro }
        If RightButton
          Then

            { Chiamata al menu principale }
            Begin
            Ch1 := kEscape;
            While MousePressed Do
              GetMPos;
            End;

      End;

  { A seconda del tasto premuto ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: With Image^[NumPgVideo] Do
	     Case Ch2 Of

	       { Su: muove di una riga verso l' alto }
	       kUp: Begin
	            TraceControl(kUp);
                    If (Row > 1)
	              Then Dec(Row);
                    End;

	       { Gi—: muove di una riga verso il basso }
	       kDown: Begin
	              TraceControl(kDown);

	              If (Row < 24)
	                Then Inc(Row);
                      End;

	       { Destra: muove di una colonna verso destra }
	       kRight: Begin
	               TraceControl(kRight);
	               If (Col < 80)
	                 Then Inc(Col);
                       End;

	       { Sinistra: muove di una colonna verso sinistra }
	       kLeft: Begin
	              TraceControl(kLeft);
	              If (Col > 1)
	                Then Dec(Col);
                      End;

	       { Home: muove alla prima colonna }
	       kHome: Col := 1;

	       { End: muove all' ultima colonna }
	       kEnd: Col := 80;

	       { Pagina su: muove alla prima riga }
	       kPgUp: Row := 1;

	       { Pagina gi—: muove all' ultima riga }
	       kPgDown: Row := 24;

	       { Insert: inserisci o sovrascrivi il testo sottostante }
	       kInsert: InsState := Not InsState;

	       { Cancel: cancella il carattere puntato dal cursore e sposta
			 tutto il resto della riga verso sinistra }
	       kCancel: If (Col < 80) Then
			  Begin

			  { Sposta i caratteri a destra del cursore }
			  For i := Col To 79 Do
			    Page[Row,i] := Page[Row,i+1];
			  Page[Row,80].Ch := ' ';

			  { Aggiorna lo stato dell' immagine (modificata
			    o non modificata) }
			  Modify := True;

			  End;

	       { ALT-1: visualizza l' immagine 1 }
	       kA1: NumPgVideo := 1;

	       { ALT-2: visualizza l' immagine 2 }
	       kA2: NumPgVideo := 2;

	       { ALT-3: visualizza l' immagine 3 }
	       kA3: NumPgVideo := 3;

	       { ALT-4: visualizza l' immagine 4 }
	       kA4: NumPgVideo := 4;

	       { ALT-5: visualizza l' immagine 5 }
	       kA5: NumPgVideo := 5;

	       { ALT-6: visualizza l' immagine 6 }
	       kA6: NumPgVideo := 6;

	       { ALT-7: visualizza l' immagine 7 }
	       kA7: NumPgVideo := 7;

	       { ALT-8: visualizza l' immagine 8 }
	       kA8: NumPgVideo := 8;

	       { ALT-9: visualizza l' immagine 9 }
	       kA9: NumPgVideo := 9;

	       { ALT-0: visualizza l' immagine 10 }
	       kA0: NumPgVideo := 10;

	       { ALT-C: visualizza l' immagine memorizzata nella
			clipboard }
	       kAP: NumPgVideo := PgClipBoard;

	       { CTRL-Home: visualizza la prima immagine (1) }
	       kCHome: NumPgVideo := 1;

	       { CTRL-End: visualizza l' ultima immagine (10) }
	       kCEnd: NumPgVideo := MaxPgVideo;

	       { CTRL-PageUp,
		 CTRL-Sinistra: visualizza l' immagine precedente }
	       kCPgUp,
	       kCLeft: If (NumPgVideo) > 1
			 Then
			   Dec(NumPgVideo);

	       { CTRL-PageDown,
		 CTRL-Destra: visualizza l' immagine seguente }
	       kCPgDown,
	       kCRight: If (NumPgVideo < MaxPgVideo)
			   Then
			     Inc(NumPgVideo);

               { ALT-M: menu principale }
               kAM: MenuPrincipale;

               { ALT-A: menu caratteri ASCII }
               kAA: ScegliASCII;

               { ALT-C: menu cornice }
               kAC: ScegliCornice;

               { ALT-T: menu traccia }
               kAT: MenuTraccia;

               { ALT-O: menu scelta dei colori }
               kAO: SelezionaColori;

               { ALT-I: menu scelta dell' immagine }
               kAI: SelezionaImmagine;

               { ALT-B: menu blocchi }
               kAB: MenuBlocchi;

               { ALT-S: menu schermo }
               kAS: MenuSchermo;

               { ALT-F: menu files }
               kAF: MenuFiles;

               { ALT-G: menu di configurazione }
               kAG: MenuConfigurazione;

               { ALT-V: menu di conversione }
               kAV: MenuConversione;

               { ALT-H: help generale }
               kAH: Help('Help Generale',Altro);

               { ALT-U: uscita dal programma }
               kAU: UscitaSiNo;

               { F1: Aiuto }
               kF1: Help('Help generale',Altro);

               { ALT-F1: Ultima schermata di aiuto }
               kAF1: Help(LastHelp^[1],Precedente);

               { CTRL-F1: Help specifico }
               kCF1: Help('Schermo del programma',Altro);

               { SHIFT-F1: Indice dell' help }
               kSF1: Help('Indice',Altro);

               { CTRL-F2: copia un blocco }
               kCF2: CopyBlock(False);

               { CTRL-F3: muove un blocco }
               kCF3: MoveBlock;

               { CTRL-F4: cancella un blocco sul video }
               kCF4: EraseVideoBlock;

               { CTRL-F5: riempie un blocco sul video di un carattere ASCII
                          e di un certo colore scelto dall' utente }
               kCF5: FillVideoBlock;

               { CTRL-F6: contorna un blocco sul video utilizzando un certo
                          tipo di cornice (o carattere) del colore scelto }
               kCF6: BordVideoBlock;

               { CTRL-F7: inverte (su-gi—, destra-sinistra, colore, ...,
                          un blocco }
               kCF7: InvertVideoBlock;

               { CTRL-F8: memorizza il blocco nella clipboard }
               kCF8: StoreClipBoardBlock;

               { CTRL-F9: legge il blocco dalla clipboard }
               kCF9: RestoreClipBoardBlock;

               { SHIFT-F2: modifica dei colori }
               kSF2: ModifyColors;

               { SHIFT-F3: modifica delle velocit… }
               kSF3: ModifySpeeds;

               { SHIFT-F4: modifica delle cornici delle finestra }
               kSF4: ModifyWindows;

               { SHIFT-F5: modifica dei bordi del blocco }
               kSF5: ModifyBordBlock;

               { SHIFT-F6: modifica delle frecce dei bordi del blocco }
               kSF6: ModifyArrowBlock;

               { SHIFT-F7: modifica dei settaggi del mouse }
               kSF7: ModifyMouseSpeed;

               { SHIFT-F8: modifica delle opzioni speciali }
               kSF8: ModifySpecialOptions;

               { SHIFT-F9: leggi il file di configurazione }
               kSF9: LeggiConfigurazione;

               { SHIFT-F10: salva il file di configurazione }
               kSF10: SalvaConfigurazione;

               { ALT-F2: copia lo schermo }
               kAF2: CopyVideo;

               { ALT-F3: muove un blocco }
               kAF3: MoveVideo;

               { ALT-F4: cancella un blocco sul video }
               kAF4: EraseVideo;

               { ALT-F5: riempie un blocco sul video di un carattere ASCII
                         e di un certo colore scelto dall' utente }
               kAF5: FillVideo;

               { ALT-F6: contorna un blocco sul video utilizzando un certo
                         tipo di cornice (o carattere) del colore scelto }
               kAF6: BordVideo;

               { ALT-F7: inverte (su-gi—, destra-sinistra, colore, ...,
                         un blocco }
               kAF7: InvertVideo;

               { ALT-F8: memorizza il blocco nella clipboard }
               kAF8: StoreClipBoardVideo;

               { ALT-F9: legge il blocco dalla clipboard }
               kAF9: RestoreClipBoardVideo;

	       End; { Case Ch2 }

    { Delete: cancella il carattere della colonna precedente e sposta il
	      resto della riga verso sinistra }
    kDel: With Image^[NumPgVideo] Do

	    If (Col > 1) Then
	      Begin

	      { Sposta a destra i caratteri }
	      For i := Col To 80 Do
		Page[Row,i-1] := Page[Row,i];
	      Page[Row,80].Ch := ' ';
	      Dec(Col);

	      { Aggiorna lo stato dell' immagine (modificata o non
		modificata) }
	      Modify := True;

	      End;

    { Return: scrive il carattere in memoria (l' ultimo digitato) }
    kReturn: With Image^[NumPgVideo] Do
               If (Not Special.ReturnDown)
                 Then
                   WriteCar(SelCar)
               Else
                 { Aggiorna colonna e riga }
                 If (Row < 24)
                   Then
	             Begin
	             Inc(Row);
	             Col := 1;
	             End;

    { Escape: visualizza il menu principale ed attende una scelta
	      da perte dell' utente }
    kEscape: MenuPrincipale;

    { CTRL-I: imposta le coordinate di inizio del blocco }
    kCI: MarkBeginBlock;

    { CTRL-F: imposta le coordinate di fine del blocco }
    kCF: MarkEndBlock;

    { CTRL-D: imposta le coordinate del blocco }
    kCD: DefineBlock;

    { CTRL-Q: legge da disco un file-blocco }
    kCQ: ReadBlockFile;

    { CTRL-W: salva su disco un file-blocco }
    kCW: SaveBlockFile;

    { CTRL-C: legge da un file di testo il blocco }
    kCC: ReadTextBlock;

    { CTRL-V: salva su un file di testo il blocco }
    kCV: SaveTextBlock;

    { CTRL-L: legge un file maschera }
    kCL: LeggiFileMaschera;

    { CTRL-S: salva un file maschera }
    kCS: SalvaFileMaschera(Image^[NumPgVideo].FileName,True);

    { CTRL-Z: legge un file di testo }
    kCZ: LeggiFileTesto;

    { CTRL-X: salva un file di testo }
    kCX: SalvaFileTesto;

    { CTRL-B: cambia directory }
    kCB: CambiaDirectoryCorrente;

    { CTRL-A: lista directory }
    kCA: ListaDirectory;

    { CTRL-O: esegui comando DOS }
    kCO: EseguiComandoDOS;

    { CTRL-E: esegui Shell DOS }
    kCE: ShellDOS;

    { Un altro tasto: lo scrive sul video cos come si presenta  }
    Else

      With Image^[NumPgVideo] Do
        Begin

        If InsState
          Then
            For i := 80 DownTo Col+1 Do
              Page[Row,i] := Page[Row,i-1];

        { Scrive il carattere }
        WriteCar(Ch1);

        End;

    End; { Case Ch1 }

Until Uscita;

{ Termina scrivendo qualche riga, liberando la memoria occupata e
  visualizzando la memoria libera del computer }
EndTextImageProcessor;

End; { EditScreen }


End. { TIPMain }
