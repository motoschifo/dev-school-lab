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
 º       VERSIONE 1.0                          UNIT TIPBLOCK                º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}
{ Data:   14 Marzo 1993
  Ora:    12:38:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorBlock }

{ Contiene tutte le procedure che servono per eseguire le operazione
  con i blocchi specificate dal menu Blocchi, come la definizione dei
  contorni, la copia o lo spostamento di una parte di schermo, il
  salvataggio o il ripristino di essa, ecc. }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Function  CheckCoordBlock: Boolean;

  - Procedure MarkBeginBlock;

  - Procedure MarkEndBlock;

  - Function  DefineCoordBlock: Boolean;

  - Procedure DefineBlock;

  - Procedure CopyAppBlockToBlock ( Var Rec1: RecBlock;
                                    Var Rec2: RecBlock;
				    Var PosX: Byte;
				    Var PosY: Byte );

  - Procedure CopyAppBlockToImage ( Var Rec1: RecBlock;
                                    Var Rec2: RecImage;
				    Var PosX: Byte;
				    Var PosY: Byte );

  - Procedure CopyBlock ( MemoryBlock: Boolean );

  - Procedure MoveAppBlockToImage ( Var Rec1:   RecBlock;
                                    Var Rec2:   RecImage;
                                        Car:    Char;
				    Var Colore: Byte );

  - Procedure MoveBlock;

  - Procedure EraseVideoBlock;

  - Procedure FillVideoBlock;

  - Procedure DisegnaCornice ( Var Rec:     RecImage;
                                   InizioX: Byte;
                                   InizioY: Byte;
                                   FineX:   Byte;
                                   FineY:   Byte;
                                   Attr:    Byte;
                                   Corn:    String013 );

  - Procedure BordVideoBlock;

  - Procedure InvertBlock ( Var Rec:     RecImage;
                                InizioX: Byte;
                                InizioY: Byte;
                                FineX:   Byte;
                                FineY:   Byte;
			        Img:     Boolean );

  - Procedure InvertVideoBlock;

  - Procedure ReadBlockFile;

  - Procedure SaveBlockFile;

  - Procedure ReadTextBlock;

  - Procedure SaveTextBlock;

  - Procedure StoreClipBoardBlock;

  - Procedure RestoreClipBoardBlock;

  - Procedure MenuBlocchi; }


{ Nome della unit }
Unit
     TIPBlock;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPBlock }


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

     { Gestione del mouse in Turbo Pascal }
     Mouse,

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp;


{----------------------------------------------------------------------------
  FUNZIONE: CHECK.COORD.BLOCK

  Controlla le coordinate del blocco e visualizza un eventuale messaggio di
  errore (mancata definizione delle coordinate di inizio o di fine del
  blocco stesso).
  La funzione restituisce TRUE quando le coordinate del blocco sono diverse
  dal valore 0; restituisce FALSE quando una di esse vale 0 (viene anche
  avvertito l' utente).
 ----------------------------------------------------------------------------}
Function  CheckCoordBlock: Boolean;


{----------------------------------------------------------------------------
  PROCEDURA: MARK.BEGIN.BLOCK

  Definisce le coordinate iniziali del blocco.
 ----------------------------------------------------------------------------}
Procedure MarkBeginBlock;


{----------------------------------------------------------------------------
  PROCEDURA: MARK.END.BLOCK

  Definisce le coordinate finali del blocco.
 ----------------------------------------------------------------------------}
Procedure MarkEndBlock;


{----------------------------------------------------------------------------
  FUNZIONE: DEFINE.COORD.BLOCK

  Definisce il blocco con i tasti cursore (SU, GUU', DESTRA, SINISTRA,
  HOME, END, PAGE-UP, PAGE-DOWN, ecc.).
  Il blocco definito viene evidenziato per una pi— facile lettura.
  I bordi, visualizzati in negativo, sono compresi nella definizione
  delle coordinate del blocco.
  I bordi del blocco sono compresi nel blocco considerato.
  La funzione restituisce TRUE se il blocco Š stato definito; FALSE
  se non Š stato definito (pressione del tasto ESCAPE).
 ----------------------------------------------------------------------------}
Function  DefineCoordBlock: Boolean;


{----------------------------------------------------------------------------
  PROCEDURA: DEFINE.BLOCK

  Effettua la chiamata alla funzione DEFINECOORDBLOCK per definire le
  coordinate del blocco.
 ----------------------------------------------------------------------------}
Procedure DefineBlock;


{----------------------------------------------------------------------------
  PROCEDURA: COPY.APP.BLOCK.TO.BLOCK

  Trasferisce la copia del blocco in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni.
 ----------------------------------------------------------------------------}
Procedure CopyAppBlockToBlock ( Var Rec1: RecBlock;
                                Var Rec2: RecBlock;
				Var PosX: Byte;
				Var PosY: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: COPY.APP.BLOCK.TO.IMAGE

  Trasferisce la copia del blocco in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni. La differenza tra questa procedura e la
  precedente (COPYAPPBLOCKTOBLOCK) Š che qui viene specificata una
  struttura dati differente (RECIMAGE invece di RECBLOCK).
 ----------------------------------------------------------------------------}
Procedure CopyAppBlockToImage ( Var Rec1: RecBlock;
                                Var Rec2: RecImage;
				Var PosX: Byte;
				Var PosY: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: COPY.BLOCK

  Effettua la copia di un blocco. Se Š stato definito in memoria verr…
  letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Si possono effettuare copie multiple dello stesso blocco, premendo
  RETURN ogni volta che si vuole copiare il contenuto del blocco sulla
  pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure CopyBlock ( MemoryBlock: Boolean );


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.APP.BLOCK.TO.IMAGE

  Trasferisce la copia del blocco in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni. La struttura dei dati Š quella relativa
  ad una pagina video e non ad un blocco, e l' immagine viene spostata e non
  copiata. Questa procedura serve solo per cancellare la parte di
  schermo relativa alle coordinate iniziali del blocco.
 ----------------------------------------------------------------------------}
Procedure MoveAppBlockToImage ( Var Rec1:   RecBlock;
                                Var Rec2:   RecImage;
                                    Car:    Char;
				Var Colore: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.BLOCK

  Effettua lo spostamento di un blocco. Se Š stato definito in memoria
  verr… letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Premendo RETURN una volta spostato il blocco, verr… definita la sua
  nuova posizione nella pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure MoveBlock;


{----------------------------------------------------------------------------
  PROCEDURA: ERASE.VIDEO.BLOCK

  Cancella il blocco definito dall' utente riempiendolo di caratteri nulli
  di attributo di colore scelto dall' utente.
 ----------------------------------------------------------------------------}
Procedure EraseVideoBlock;


{----------------------------------------------------------------------------
  PROCEDURA: FILL.VIDEO.BLOCK

  Riempie il blocco definito dall' utente del carattere e del colore
  scelti.
  Per non riempire il blocco, basta premere il tasto ESCAPE prima di
  aver scelto il colore.
 ----------------------------------------------------------------------------}
Procedure FillVideoBlock;


{----------------------------------------------------------------------------
  PROCEDURA: DISEGNA.CORNICE

  Disegna una cornice attorno al blocco evidenziato, scegliendo tra i diversi
  tipi di cornice disponibili. I parametri sono il puntatore della pagina
  video che si desidera modificare, le coordinate del blocco (o della
  pagina), il colore della cornice e i caratteri che la compongono.
 ----------------------------------------------------------------------------}
Procedure DisegnaCornice ( Var Rec:     RecImage;
                               InizioX: Byte;
                               InizioY: Byte;
                               FineX:   Byte;
                               FineY:   Byte;
                               Attr:    Byte;
                               Corn:    String013 );


{----------------------------------------------------------------------------
  PROCEDURA: BORD.VIDEO.BLOCK

  Contorna il blocco definito dall' utente del colore e della cornice
  scelti.
  Per interrompere il processo, basta premere il tasto ESCAPE prima di
  aver scelto la cornice.
 ----------------------------------------------------------------------------}
Procedure BordVideoBlock;


{----------------------------------------------------------------------------
  PROCEDURA: INVERT.BLOCK

  Inverte i colori di un blocco oppure i caratteri di questo in senso
  verticale od orizzontale. I parametri passati sono il puntatore
  alla pagina video in memoria, le coordinate di inizio e di fine
  del blocco (quindi si possono specificare anche per invertire uno schermo
  intero), e un valore IMG (True o False) per indicare se l' inversione
  riguarda un blocco (False) oppute l' intera pagina video (True).
  Se le opzioni InvertXCar o InvertYCar sono attive, verranno invertiti
  i caratteri che hanno un corrispondente al contrario; ad esempio
  i caratteri "^v" "\/" "<>" "()" "óò" "Lâ" ecc.
 ----------------------------------------------------------------------------}
Procedure InvertBlock ( Var Rec:     RecImage;
                            InizioX: Byte;
                            InizioY: Byte;
                            FineX:   Byte;
                            FineY:   Byte;
			    Img:     Boolean );


{----------------------------------------------------------------------------
  PROCEDURA: INVERT.VIDEO.BLOCK

  Effettua la chiamata alla procedura INVERTBLOCK per invertire il blocco
  nel modo scelto dall' utente.
 ----------------------------------------------------------------------------}
Procedure InvertVideoBlock;


{----------------------------------------------------------------------------
  PROCEDURA: READ.BLOCK.FILE

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video.
  Dopo aver definito il blocco, lo si pu• spostare a piacere ed effettuare
  copie multiple.
 ----------------------------------------------------------------------------}
Procedure ReadBlockFile;


{----------------------------------------------------------------------------
  PROCEDURA: SAVE.BLOCK.FILE

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
 ----------------------------------------------------------------------------}
Procedure SaveBlockFile;


{----------------------------------------------------------------------------
  PROCEDURA: READ.TEXT.BLOCK

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video.
  Dopo aver definito il blocco, lo si pu• spostare a piacere ed effettuare
  copie multiple.
  Il file viene letto come testo, per cui il colore Š quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure ReadTextBlock;


{----------------------------------------------------------------------------
  PROCEDURA: SAVE.TEXT.BLOCK

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
  Il file viene salvato come testo, per cui il colore Š quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure SaveTextBlock;


{----------------------------------------------------------------------------
  PROCEDURA: STORE.CLIPBOARD.BLOCK

  Memorizza il blocco definito dall' utente. Se il blocco non Š stato
  definito viene chiesto in input.
 ----------------------------------------------------------------------------}
Procedure StoreClipBoardBlock;


{----------------------------------------------------------------------------
  PROCEDURA: RESTORE.CLIPBOARD.BLOCK

  Ripristina il blocco memorizzato, se c'Š, per copiarlo in qualche zona
  dell' immagina attiva sullo schermo.
 ----------------------------------------------------------------------------}
Procedure RestoreClipBoardBlock;


{----------------------------------------------------------------------------
  PROCEDURA: MENU.BLOCCHI

  Disegna un menu da cui Š possibile marcare l' inizio e la fine di un
  blocco, copiarlo, spostarlo, cancellarlo, riempirlo, contornarlo,
  invertirlo (su-gi—, destra-sinistra, colori, ecc.), leggerlo e
  salvarlo sia da/su disco sia da/su memoria, considerandolo come
  un file di tipo blocco o un file di tipo testo.
 ----------------------------------------------------------------------------}
Procedure MenuBlocchi;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TBlock }


{----------------------------------------------------------------------------
  FUNZIONE: CHECK.COORD.BLOCK

  Controlla le coordinate del blocco e visualizza un eventuale messaggio di
  errore (mancata definizione delle coordinate di inizio o di fine del
  blocco stesso).
  La funzione restituisce TRUE quando le coordinate del blocco sono diverse
  dal valore 0; restituisce FALSE quando una di esse vale 0 (viene anche
  avvertito l' utente).
 ----------------------------------------------------------------------------}
Function  CheckCoordBlock: Boolean;

Begin { CheckCoordBlock }

{ Controlla se sono state definite le coordinate iniziali del blocco }
If (Block^.InizioX = 0) Or (Block^.InizioY = 0)
  Then

    Begin

    { Informazione per l' utente }
    With Color Do
      If (Dialog('[INIZIO BLOCCO]',
	         '|'+
	         '               Non sono state definite               |'+
	         'le coordinate iniziali|'+
	         'del blocco.|'+
	         '|','','',
	         __OK__,WarningBord,WarningTitle,
	         WarningText,WarningSel,
	         WarningUnSel,WarningKeySel,
		 WarningKeyUnSel) = 1)

		   Then

		     ;

    End

Else

  { Ora controlla le coordinate finali del blocco }
  If (Block^.FineX = 0) Or (Block^.FineY = 0)
    Then

      Begin

      { Informazione per l' utente }
      With Color Do
        If (Dialog('[FINE BLOCCO]',
		   '|'+
		   '               Non sono state definite               |'+
		   'le coordinate finali|'+
		   'del blocco.|'+
		   '|','','',
		   __OK__,WarningBord,WarningTitle,
		   WarningText,WarningSel,
		   WarningUnSel,WarningKeySel,
		   WarningKeyUnSel) = 1)

		     Then

		       ;

      End

End; { CheckCoordBlock }


{----------------------------------------------------------------------------
  PROCEDURA: MARK.BEGIN.BLOCK

  Definisce le coordinate iniziali del blocco.
 ----------------------------------------------------------------------------}
Procedure MarkBeginBlock;

Begin { MarkBeginBlock }

{ Memorizza la coordinata X di inizio del blocco ... }
Block^.InizioX := Image^[NumPgVideo].Col;

{ ... e quella Y }
Block^.InizioY := Image^[NumPgVideo].Row;

End; { MarkBeginBlock }


{----------------------------------------------------------------------------
  PROCEDURA: MARK.END.BLOCK

  Definisce le coordinate finali del blocco.
 ----------------------------------------------------------------------------}
Procedure MarkEndBlock;

Begin { MarkEndBlock }

{ Memorizza la coordinata X di fine del blocco ... }
Block^.FineX := Image^[NumPgVideo].Col;

{ ... e quella Y }
Block^.FineY := Image^[NumPgVideo].Row;

End; { MarkEndBlock }


{----------------------------------------------------------------------------
  FUNZIONE: DEFINE.COORD.BLOCK

  Definisce il blocco con i tasti cursore (SU, GUU', DESTRA, SINISTRA,
  HOME, END, PAGE-UP, PAGE-DOWN, ecc.).
  Il blocco definito viene evidenziato per una pi— facile lettura.
  I bordi, visualizzati in negativo, sono compresi nella definizione
  delle coordinate del blocco.
  I bordi del blocco sono compresi nel blocco considerato.
  La funzione restituisce TRUE se il blocco Š stato definito; FALSE
  se non Š stato definito (pressione del tasto ESCAPE).
 ----------------------------------------------------------------------------}
Function  DefineCoordBlock: Boolean;

{ Variabili locali }
Var

    { Memorizza le coordinate del blocco nel caso in cui si prema il
      tasto ESCAPE, e quindi occorre ripristinare le condizioni
      precedenti }
    AppBlock:    PTRRecBlock;

    { Vale TRUE quando si preme RETURN o ESCAPE }
    Done:        Boolean;

    { Coordinata X dell' inizio del blocco }
    InizioX:     Byte;

    { Coordinata Y dell' inizio del blocco }
    InizioY:     Byte;

    { Coordinata X della fine del blocco }
    FineX:       Byte;

    { Coordinata Y della fine del blocco }
    FineY:       Byte;

    { Coordinata X precedente dell' inizio del blocco }
    OldInizioX:  Byte;

    { Coordinata X precedente dell' inizio del blocco }
    OldInizioY:  Byte;

    { Coordinata X precedente della fine del blocco }
    OldFineX:    Byte;

    { Coordinata Y precedente della fine del blocco }
    OldFineY:    Byte;

    { Tasto premuto dall' utente }
    Ch1:         Char;

    { Tasto esteso premuto dall' utente }
    Ch2:         Char;

    { Vale TRUE quando si sposta l' angolo in alto a sinistra; vale
      FALSE quando si sposta invece l' angolo in basso a destra }
    PrimoAngolo: Boolean;

    { Appoggio per lo scmabio dei valori }
    AppByte:     Byte;

    { Contatore per il ritardo dell' animazione del bordo del blocco }
    Count:       Word;

    { Contatore per il ritardo del lampeggio del bordo del blocco }
    CountBlink:  Word;

    { Memorizza lo stato del tasto SHIFT (premuto o no) }
    ShiftState:  Boolean;

    { Indice per i cicli }
    I:           Byte;

    { Indice per i cicli }
    J:           Byte;

    { Indica se l' immagine Š quella in BLOCK^ o in IMAGE^, ossia se il
      bordo Š disegnato o no sul video }
    Lampeggio:   Boolean;


     {-----------------------------------------------------------------------
       PROCEDURA: DEFINE.RECTANGLE.BLOCK

       Scrive il bordo del blocco in movimento: viene modificata solo la
       pagina memorizzata nel record BLOCK.
      -----------------------------------------------------------------------}
     Procedure DefineRectangleBlock;

     { Variabili locali }
     Var

	 { Indice per i cicli }
	 I: Byte;

	 { Indice per i cicli }
	 J: Byte;

	 { Appoggio per l' offset della freccia del bordo del blocco }
	 Num: Byte;

     Begin { DefineRectangleBlock }

     { Viene disegnato il bordo del blocco ... }

     { Ripristino del contenuto della pagina che contiene il blocco }
     Block^.Page := Image^[NumPgVideo].Page;

     { Determinazione della posizione della freccia del bordo }
     Num := Count Div 10000;

     { Vengono disegnati le linee orizzontali }
     i := 1;
     j := Num;

     While ((InizioX+i) <= (FineX-1)) Do

       Begin

       While (((InizioX+i) <= (FineX-1)) And (j < 3)) Do

	 Begin

	 If Lampeggio
	   Then

	     Begin

	     { Linea superiore e relativo attributo }
	     Block^.Page[InizioY,InizioX+i].Ch := BlockDef.Bord[2];
	     Block^.Page[InizioY,InizioX+i].At := Color.BlockBord;

	     { Linea inferiore e relativo attributo }
	     Block^.Page[FineY,  FineX-i  ].Ch := BlockDef.Bord[7];
	     Block^.Page[FineY,  FineX-i  ].At := Color.BlockBord;

	     End;

	 { Incremento dei contatori }
	 Inc(i);
	 Inc(j);

	 End;

       { Frecce inferiore e superiore }
       Block^.Page[InizioY,InizioX+i].Ch := BlockDef.Arrow[1];
       Block^.Page[FineY,  FineX-i  ].Ch := BlockDef.Arrow[2];

       { Attributi delle frecce inferiore e superiore }
       If Lampeggio
	 Then

	   Begin
	   Block^.Page[InizioY,InizioX+i].At := Color.BlockArrow;
	   Block^.Page[FineY,  FineX-i  ].At := Color.BlockArrow;
	   End;

       { Aggiornamento dei contatori }
       j := 0;
       Inc(i);

       End;

     { Determinazione della posizione della freccia del bordo }
     Num := Count Div 10000;

     { Vengono disegnati le linee verticali }
     i := 1;
     j := Num;

     While ((InizioY+i) <= (FineY-1)) Do

       Begin

       While (((InizioY+i) <= (FineY-1)) And (j < 3)) Do

	 Begin

	 If Lampeggio
	   Then

	     Begin

	     { Linea sinistra e relativo attributo }
	     Block^.Page[FineY-i,  InizioX].Ch := BlockDef.Bord[4];
	     Block^.Page[FineY-i,  InizioX].At := Color.BlockBord;

	     { Linea destra e relativo attributo }
	     Block^.Page[InizioY+i,FineX  ].Ch := BlockDef.Bord[5];
	     Block^.Page[InizioY+i,FineX  ].At := Color.BlockBord;

	     End;

	 { Incremento dei contatori }
	 Inc(i);
	 Inc(j);

	 End;


       { Frecce sinistra e destra }
       Block^.Page[FineY-i,  InizioX].Ch := BlockDef.Arrow[3];
       Block^.Page[InizioY+i,FineX  ].Ch := BlockDef.Arrow[4];

       { Attributi delle Frecce sinistra e destra }
       If Lampeggio
	 Then

	   Begin
	   Block^.Page[FineY-i,  InizioX].At := Color.BlockArrow;
	   Block^.Page[InizioY+i,FineX  ].At := Color.BlockArrow;
	   End;

       { Aggiornamento dei contatori }
       Inc(i);
       j := 0;

       End;

     If Lampeggio
       Then

	 Begin

	 { Angolo in basso a sinistra e relativo attributo }
	 Block^.Page[FineY,  InizioX].Ch := BlockDef.Bord[6];
	 Block^.Page[FineY,  InizioX].At := Color.BlockBord;

	 { Angolo in alto a destra e relativo attributo }
	 Block^.Page[InizioY,FineX  ].Ch := BlockDef.Bord[3];
	 Block^.Page[InizioY,FineX  ].At := Color.BlockBord;

	 { Angolo in alto a sinistra e relativo attributo }
	 Block^.Page[InizioY,InizioX].Ch := BlockDef.Bord[1];

	 If PrimoAngolo
	   Then

	     { Angolo selezionato }
	     Block^.Page[InizioY,InizioX].At := Color.BlockAngle

	 Else

	   { Angolo non selezionato }
	   Block^.Page[InizioY,InizioX].At := Color.BlockBord;

	 { Angolo in basso a destra e relativo attributo }
	 Block^.Page[FineY,  FineX  ].Ch := BlockDef.Bord[8];
	 If PrimoAngolo
	   Then

	     { Angolo non selezionato }
	     Block^.Page[FineY,  FineX  ].At := Color.BlockBord
	 Else

	   { Angolo selezionato }
	   Block^.Page[FineY,  FineX  ].At := Color.BlockAngle;

	 End

     Else

       { Caratteri originali dell' immagine }
       Begin
       Block^.Page[FineY,  InizioX].Ch :=
              Image^[NumPgVideo].Page[FineY,InizioX].Ch;
       Block^.Page[InizioY,FineX  ].Ch :=
              Image^[NumPgVideo].Page[InizioY,FineX].Ch;
       Block^.Page[InizioY,InizioX].Ch :=
              Image^[NumPgVideo].Page[InizioY,InizioX].Ch;
       Block^.Page[FineY,  FineX  ].Ch :=
              Image^[NumPgVideo].Page[FineY,FineX].Ch;
       End;

     { Visualizzazione del rettangolo, dalla memoria al video }
     Fisico^ := Block^.Page;

     End; { DefineRectangleBlock }


     {-----------------------------------------------------------------------
       PROCEDURA: BLOCK.ATTENDI

       Attende la pressione di un tasto e restituisce il codice ASCII di questo
       in CH1. Se il tasto Š esteso, CH1 vale 0, mentre CH2 contiene il codice
       del carattere esteso (per la lista di molti dei caratteri estesi vedere
       la unit KEYBOARD.PAS.
       Se viene premuto un tasto del mouse, le variabili CH1 e CH2 non
       vengono modificate.
       Questa procedura Š differente dalla ATTENDI in quanto viene anche
       aggiornata la posizione delle frecce del bordo del blocco, creando
       cos un effetto di movimento.
      -----------------------------------------------------------------------}
     Procedure BlockAttendi ( Var Ch1:        Char;
			      Var Ch2:        Char;
			          SKey:       SpecialMenuType;
				  MovimMouse: Boolean );

     { Variabili locali }
     Var

         { Posizione precedente dle mouse (X) }
         OldMouseX: Byte;

         { Posizione precedente dle mouse (Y) }
         OldMouseY: Byte;

         { Uscita per Esci=True }
         Esci:      Boolean;

     Begin { BlockAttendi }

     { Vuota il buffer della tastiera }
     While KeyPressed Do
       Ch1 := ReadKey;

     { Controllo della posizione del mouse }
     If (MovimMouse And MouseOk)
       Then

         Begin
	 GetMPos;
         OldMouseX := MouseTextX;
         OldMouseY := MouseTextY;
         End;

     { Attende un tasto o la pressione del mouse se presente }
     ShowMouse;

     { Ciclo principale che si ripete fino a che il mouse non ha cambiato
       posizione oppure Š stato premuto un tasto oppure Š stato
       premuto un pulsante del mouse }
     Repeat

       With Ritardo Do

	 Begin

         { Incremento del contatore di lampeggio }
         If MousePressed
           Then
             Inc(Count,BlockSpeed*10)
         Else
           Inc(Count,BlockSpeed);

         { Scrive il bordo del blocco se necessario }
	 If (Count In [BlockSpeed,10000+BlockSpeed,20000+BlockSpeed,
	    30000+BlockSpeed,40000+BlockSpeed])
	      Then

		DefineRectangleBlock

	   Else

             { Cambio del tipo di visualizzazione: dal bordo normale al
               bordo che ha gli stessi attributi dell' immagine (in modo
               da risultare nascosto) }
	     If (Count > 40000)
	       Then

		 Begin
		 Count := 0;

                 Inc(CountBlink);

                 { Cambio ... }
                 With Ritardo Do
                   If ((CountBlink > BlockBlink) And (Not MousePressed))
                    Or ((CountBlink > (BlockBlink Div 5)) And MousePressed)
		      Then

		        Begin
		        CountBlink := 0;
		        Lampeggio := Not Lampeggio;
		        End;

		 End;

	 End;

       GetMPos;

       { Controllo dello stato del mouse }
       If MovimMouse And MouseOk
         Then
           Begin
           If ((OldMouseX <> MouseTextX) Or (OldMouseY <> MouseTextY))
             Then
               Esci := True;
           End
       Else
         Esci := False;

       { Controllo dei tasti speciali }
       ControlloSpecialKeys(SDefineBlock);

     Until (KeyPressed Or (MouseOk And MousePressed) Or Esci);

     HideMouse;

     { Aggiorna Ch1 e Ch2 se Š stato premuto un tasto della tastiera }
     If KeyPressed
       Then

	 Begin

	 Ch1 := ReadKey;

	 If (Ch1 = kNull)
	   Then
	     Ch2 := ReadKey;

	 End;

     End; { BlockAttendi }


Begin { DefineCoordBlock }

{ Messaggio per l' utente }
Info(' Definisci il blocco con i tasti cursore o il mouse.',Color.UserInfo);

{ Alloca in memoria la pagina che memorizzar… il blocco }
New(AppBlock);  { 3848 Bytes }

{ Salva la situazione del blocco }
AppBlock^ := Block^;

{ Il blocco diventa la pagina video attiva }
Block^.Page := Image^[NumPgVideo].Page;

{ Inizializza le coordinate del blocco, se definite }
InizioX := Block^.InizioX;
InizioY := Block^.InizioY;

FineX := Block^.FineX;
FineY := Block^.FineY;

{ Aggiusta le coordinate X del blocco e le scambia se sono invertite }
If (InizioX > FineX)
  Then

    { Scambio }
    Begin
    AppByte := FineX;
    FineX := InizioX;
    InizioX := AppByte;
    End;

{ Aggiusta le coordinate X del blocco e le scambia se sono invertite }
If (InizioY > FineY)
  Then

    { Scambio }
    Begin
    AppByte := FineY;
    FineY := InizioY;
    InizioY := AppByte;
    End;

OldInizioX := InizioX;
OldInizioY := InizioY;

OldFineX := FineX;
OldFineY := FineY;

{ Definisce le coordinate se non sono state definite }
DefineRectangleBlock;

{ Editing dell' angolo in alto a sinistra }
PrimoAngolo := True;

{ Cambio al secondo, se esiste il primo ma non esiste il secondo }
If ((InizioX <> 0) And (InizioY <> 0)
   And (FineX = 0) And (FineY = 0))
     Then
       PrimoAngolo := False;

{ Azzeramento del contatore per il movimento delle frecce }
Count := 0;
Countblink := 0;

{ TRUE per uscire dal ciclo }
Done := False;

Repeat

  { Se le posizioni sono cambiate, aggiornale anche sul video }
  If ((OldInizioX <> InizioX) Or (OldInizioY <> InizioY)
     Or (OldFineX <> FineX) Or (OldFineY <> FineY))
       Then

	 Begin

	 { Aggiorna il bordo sul video }
	 DefineRectangleBlock;

	 { Aggiorna la riga di stato in fondo alla pagina }
	 With Image^[NumPgVideo] Do

	   If PrimoAngolo
	     Then

	       { Coordinate di inizio e fine dell' angolo in alto a
		 sinistra }
	       Stato(NumPgVideo,InizioY,InizioX,Attr,SelCar,Modify)

	   Else

	     { Coordinate di inizio e fine dell' angolo in basso a destra }
	     Stato(NumPgVideo,FineY,FineX,Attr,SelCar,Modify);

	 End;

  { Attesa di un tasto ed aggiornamento delle frecce del bordo }
  BlockAttendi(Ch1,Ch2,SDefineBlock,False);

  { Salvataggio dei dati precedenti }
  OldInizioX := InizioX;
  OldInizioY := InizioY;
  OldFineX := FineX;
  OldFineY := FineY;

  { Controllo della pressione dei pulsanti del mouse }
  If MousePressed
    Then
      Begin

      { Pulsante sinistro }
      If LeftButton
        Then

          Begin

          InizioX := MouseTextX;
          InizioY := MouseTextY;

          While MousePressed Do
            Begin

            BlockAttendi(Ch1,Ch2,SDefineBlock,True);

            FineX := MouseTextX;
            FineY := MouseTextY;

	    { Aggiorna il bordo sul video }
	    DefineRectangleBlock;

	    { Aggiorna la riga di stato in fondo alla pagina }
	    With Image^[NumPgVideo] Do

	        { Coordinate di inizio e fine dell' angolo in basso a destra }
	        Stato(NumPgVideo,FineY,FineX,Attr,SelCar,Modify);
            { Aggiusta le coordinate X del blocco e le scambia se sono invertite }
            If (InizioX > FineX)
              Then

                { Scambio }
                Begin
                AppByte := FineX;
                FineX := InizioX;
                InizioX := AppByte;
                End;

            { Aggiusta le coordinate X del blocco e le scambia se sono invertite }
            If (InizioY > FineY)
              Then

                { Scambio }
                Begin
                AppByte := FineY;
                FineY := InizioY;
                InizioY := AppByte;
                End;

            End;

          Ch1 := kNull;
          Ch2 := kNull;
          End

      Else

        { Pulsante destro }
        If RightButton
          Then
            Ch1 := kEscape;

      { Rilascio dei pulsanti del mouse }
      While MousePressed Do
        GetMPos;

      End;

  { Memorizza lo stato del tasto SHIFT (premuto o no) }
  ShiftState := ShiftPressed;

  { A seconda del tasto premuto ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: Case Ch2 Of

	     { Su: Sposta l' angolo verso l' alto di una riga;
		   con il tasto SHIFT sposta il blocco }
	     kUp: If ShiftState
		    Then

		      { Tasto SHIFT premuto: spostamento del bordo
			del blocco }
		      Begin
		      Dec(InizioY);
		      Dec(FineY);
		      End

		  Else

		    Begin

		    If PrimoAngolo
		      Then

			{ Angolo in alto a sinistra }
			Dec(InizioY)

		    Else

		      { Angolo in basso a destra }
		      Dec(FineY);

		    End;

	     { Gi—: Sposta l' angolo verso il basso di una riga;
		    con il tasto SHIFT sposta il blocco }
	     kDown: If ShiftState
		      Then

			{ Tasto SHIFT premuto: spostamento del bordo
			  del blocco }
			Begin
			Inc(InizioY);
			Inc(FineY);
			End

		    Else

		      Begin

		      If PrimoAngolo
			Then

			  { Angolo in alto a sinistra }
			  Inc(InizioY)

		      Else
			{ Angolo in basso a destra }
			Inc(FineY);

		      End;

	     { Sinistra: Sposta l' angolo verso sinistra di una colonna;
			 con il tasto SHIFT sposta il blocco }
	     kLeft: If ShiftState
		      Then

			{ Tasto SHIFT premuto: spostamento del bordo
			  del blocco }
			Begin
			Dec(InizioX);
			Dec(FineX);
			End

		    Else

		      Begin

		      If PrimoAngolo
			Then

			  { Angolo in alto a sinistra }
			  Dec(InizioX)

		      Else
			{ Angolo in basso a destra }
			Dec(FineX);

		      End;

	     { Destra: Sposta l' angolo verso destra di una colonna;
		       con il tasto SHIFT sposta il blocco }
	     kRight: If ShiftState
		       Then

			 { Tasto SHIFT premuto: spostamento del bordo
			   del blocco }
			 Begin
			 Inc(InizioX);
			 Inc(FineX);
			 End

		     Else

		       Begin

		       If PrimoAngolo
			  Then

			    { Angolo in alto a sinistra }
			    Inc(InizioX)

			Else
			  { Angolo in basso a destra }
			  Inc(FineX);

		       End;

	     { PageUp: Sposta l' angolo alla prima riga }
	     kPgUp: If PrimoAngolo
		      Then

			{ Angolo in alto a sinistra }
			InizioY := 1

		    Else
		      { Angolo in basso a destra }
		      FineY := 1;

	     { PageDown: Sposta l' angolo all' ultima riga }
	     kPgDown: If PrimoAngolo
			Then

			  { Angolo in alto a sinistra }
			  InizioY := 24

		      Else
			{ Angolo in basso a destra }
			FineY := 24;

	     { Home: Sposta l' angolo alla prima colonna }
	     kHome: If PrimoAngolo
		      Then

			{ Angolo in alto a sinistra }
			InizioX := 1

		    Else
		      { Angolo in basso a destra }
		      FineX := 1;

	     { End: Sposta l' angolo all' ultima colonna }
	     kEnd: If PrimoAngolo
		     Then

		       { Angolo in alto a sinistra }
		       InizioX := 80

		   Else
		     { Angolo in basso a destra }
		     FineX := 80;

             { F1: aiuto generale }
	     kF1: Help('Help Generale',Altro);

             { Shift-F1: indice dell' aiuto }
	     kSF1: Help('Indice',Altro);

             { Alt-F1: schermata di aiuto precedente }
             kAF1: Help(LastHelp^[1],Precedente);

             { Ctrl-F1: help specifico }
             kCF1: Help('Definisci blocco',Altro);

	     End; { Case Ch2 }

    { Return: Accetta le coordinate del blocco e lo memorizza nella
	      clipboard }
    kReturn: Begin

	     { Uscita dalla funzione }
	     Done := True;

	     { Memorizzazione del blocco senza il bordo }
	     Block^.Page := Image^[NumPgVideo].Page;

	     { Memorizza le coordinate del blocco }
	     Block^.InizioX := InizioX;
	     Block^.FineX := FineX;
	     Block^.InizioY := InizioY;
	     Block^.FineY := FineY;

	     For i := InizioX To FineX Do
	       For j := InizioY To FineY Do
		 Image^[PgClipBoard].Page[j,i] := Block^.Page[j,i];

	     { La funzione restituisce TRUE (tutto Ok) }
	     DefineCoordBlock := True;

	     { Il blocco non si trova in memoria ma Š appena stato definito }
	     MemoryBlock := False;

	     { L' immagine nella clipboard viene considerata modificata }
	     Image^[PgClipBoard].Modify := True;

	     End;

    { Escape: Non sceglie il blocco e ripristina il precedente }
    kEscape: Begin

	     { Uscita dalla funzione }
	     Done := True;

	     { Ripristino del blocco precedente }
	     Block^ := AppBlock^;

	     { La funzione restituisce FALSE (fallimento) }
	     DefineCoordBlock := False;

	     End;

    { 1: Cambia le coordinate dell' angolo in alto a sinistra }
    '1': PrimoAngolo := True;

    { 2: Cambia le coordinate dell' angolo in basso a destra }
    '2': PrimoAngolo := False;

    End; { Case Ch1 }

  { Aggiorna il puntatore di angolo e le coordinate del cursore sullo
    schermo }
  If (Ch1 In ['1','2'])
    Then

      Begin

      Lampeggio := True;

      { Aggiorna il bordo sul video }
      DefineRectangleBlock;

      { Aggiorna la riga di stato in fondo alla pagina }
      With Image^[NumPgVideo] Do

	If PrimoAngolo
	  Then

	    { Coordinate di inizio e fine dell' angolo in alto a
	      sinistra }
	    Stato(NumPgVideo,InizioY,InizioX,Attr,SelCar,Modify)

	Else

	  { Coordinate di inizio e fine dell' angolo in basso a destra }
	  Stato(NumPgVideo,FineY,FineX,Attr,SelCar,Modify);

      End;

  { Aggiusta le coordinate X del blocco e le scambia se sono invertite }
  If (InizioX > FineX)
    Then

      { Scambio }
      Begin
      AppByte := FineX;
      FineX := InizioX;
      InizioX := AppByte;
      End;

  { Aggiusta le coordinate X del blocco e le scambia se sono invertite }
  If (InizioY > FineY)
    Then

      { Scambio }
      Begin
      AppByte := FineY;
      FineY := InizioY;
      InizioY := AppByte;
      End;

  { Controlla se la coordinata X minima Š valida e la aggiusta se non la Š }
  If (InizioX < 1)
    Then

      { Troppo piccola }
      InizioX := 1

  Else

    If (InizioX > 80)
      Then

	{ Troppo grande }
	InizioX := 80;

  { Controlla se la coordinata X massima Š valida e la aggiusta se non la Š }
  If (FineX < 1)
    Then

      { Troppo piccola }
      FineX := 1

  Else

    If (FineX > 80)
      Then

	{ Troppo grande }
	FineX := 80;

  { Controlla se la coordinata Y minima Š valida e la aggiusta se non la Š }
  If (InizioY < 1)
    Then

      { Troppo piccola }
      InizioY := 1

  Else

    If (InizioY > 24)
      Then

	{ Troppo grande }
	InizioY := 24;

  { Controlla se la coordinata Y massima Š valida e la aggiusta se non la Š }
  If (FineY < 1)
    Then

      { Troppo piccola }
      FineY := 1

  Else

    If (FineY > 24)
      Then

	{ Tropo grande }
	FineY := 24;


Until Done;

{ Libera la memoria dalla pagina utilizzata per la copia di sicurezza del
  blocco }
Dispose(AppBlock);  { 3848 Bytes }

SetTHorRange(1,80);
SetTVertRange(1,24);

End; { DefineCoordBlock }


{----------------------------------------------------------------------------
  PROCEDURA: DEFINE.BLOCK

  Effettua la chiamata alla funzione DEFINECOORDBLOCK per definire le
  coordinate del blocco.
 ----------------------------------------------------------------------------}
Procedure DefineBlock;

Begin { DefineBlock }

If DefineCoordBlock
  Then
    ;

End; { DefineBlock }


{----------------------------------------------------------------------------
  PROCEDURA: COPY.APP.BLOCK.TO.BLOCK

  Trasferisce la copia del blocco in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni.
 ----------------------------------------------------------------------------}
Procedure CopyAppBlockToBlock ( Var Rec1: RecBlock;
                                Var Rec2: RecBlock;
				Var PosX: Byte;
				Var PosY: Byte );
{ Variabili locali }
Var

    { Indice per i cicli }
    I:  Byte;

    { Indice per i cicli }
    J:  Byte;

Begin { CopyAppBlockToBlock }

With Rec1 Do

  With Special Do

    Begin

    { Nessuna restrizione: scrittura normale dei caratteri }
    If ((Not BloccaFore) And (Not BloccaBack) And (Not BloccaCar))
      Then
        For i := InizioX To FineX Do
	  For j := InizioY To FineY Do
	    Rec2.Page[PosY+j-InizioY,PosX+i-InizioX] := Page[j,i]

    Else

      Begin

      { Caratteri non bloccati }
      If (Not BloccaCar)
        Then
          For i := InizioX To FineX Do
	    For j := InizioY To FineY Do
	      Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].Ch := Page[j,i].Ch

      Else

        { Caratteri bloccati (quindi il carattere non viene modificato) }
        For i := InizioX To FineX Do
	  For j := InizioY To FineY Do
	    Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].Ch :=
  	                             Page[PosY+j-InizioY,PosX+i-InizioX].Ch;

      { Attributi di primo piano e di sfondo non bloccati }
      If (Not BloccaFore) And (Not BloccaBack)
        Then
          For i := InizioX To FineX Do
	    For j := InizioY To FineY Do
	      Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].At := Page[j,i].At

      Else

        { Attributi di primo piano bloccati }
        If ((Not BloccaBack) And BloccaFore)
          Then
            For i := InizioX To FineX Do
	      For j := InizioY To FineY Do
	        Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].At :=
	               (Page[PosY+j-InizioY,PosX+i-InizioX].At Mod 16)+
                       (Page[j,i].At Div 16)*16

      Else

        { Attributi di sfondo bloccati }
        If ((Not BloccaFore) And BloccaBack)
          Then
            For i := InizioX To FineX Do
	      For j := InizioY To FineY Do
		Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].At :=
		       (Page[j,i].At Mod 16)+
                       (Page[PosY+j-InizioY,PosX+i-InizioX].At Div 16)*16

        Else

          { Attributi bloccati: nessuna modifica }
          If (BloccaFore And BloccaBack)
             Then
               ;

      End;

    End;

End; { CopyAppBlockToBlock }


{----------------------------------------------------------------------------
  PROCEDURA: COPY.APP.BLOCK.TO.IMAGE

  Trasferisce la copia del blocco in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni. La differenza tra questa procedura e la
  precedente (COPYAPPBLOCKTOBLOCK) Š che qui viene specificata una
  struttura dati differente (RECIMAGE invece di RECBLOCK).
 ----------------------------------------------------------------------------}
Procedure CopyAppBlockToImage ( Var Rec1: RecBlock;
                                Var Rec2: RecImage;
				Var PosX: Byte;
				Var PosY: Byte );

{ Variabili locali }
Var

    { Indice per i cicli }
    I:  Byte;

    { Indice per i cicli }
    J:  Byte;

Begin { CopyAppBlockToImage }

With Rec1 Do

  With Special Do

    Begin

    { Nessuna restrizione: scrittura normale dei caratteri }
    If ((Not BloccaFore) And (Not BloccaBack) And (Not BloccaCar))
      Then
        For i := InizioX To FineX Do
	  For j := InizioY To FineY Do
	    Rec2.Page[PosY+j-InizioY,PosX+i-InizioX] := Page[j,i]

    Else

      Begin

      { Caratteri non bloccati }
      If (Not BloccaCar)
        Then
          For i := InizioX To FineX Do
	    For j := InizioY To FineY Do
	      Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].Ch := Page[j,i].Ch

      Else

        { Caratteri bloccati (quindi il carattere non viene modificato) }
        For i := InizioX To FineX Do
	  For j := InizioY To FineY Do
	    Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].Ch :=
	                             Page[PosY+j-InizioY,PosX+i-InizioX].Ch;

      { Attributi di primo piano e di sfondo non bloccati }
      If (Not BloccaFore) And (Not BloccaBack)
        Then
          For i := InizioX To FineX Do
	    For j := InizioY To FineY Do
              Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].At := Page[j,i].At

      Else

        { Attributi di primo piano bloccati }
        If ((Not BloccaBack) And BloccaFore)
          Then
            For i := InizioX To FineX Do
              For j := InizioY To FineY Do
	        Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].At :=
		       (Page[PosY+j-InizioY,PosX+i-InizioX].At Mod 16)+
                       (Page[j,i].At Div 16)*16

      Else

        { Attributi di sfondo bloccati }
        If ((Not BloccaFore) And BloccaBack)
          Then
            For i := InizioX To FineX Do
	      For j := InizioY To FineY Do
		Rec2.Page[PosY+j-InizioY,PosX+i-InizioX].At :=
		       (Page[j,i].At Mod 16)+
		       (Page[PosY+j-InizioY,PosX+i-InizioX].At Div 16)*16
        Else

          { Attributi bloccati: nessuna modifica }
          If (BloccaFore And BloccaBack)
             Then
               ;

      End;

    End;

End; { CopyAppBlockToImage }


{----------------------------------------------------------------------------
  PROCEDURA: COPY.BLOCK

  Effettua la copia di un blocco. Se Š stato definito in memoria verr…
  letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Si possono effettuare copie multiple dello stesso blocco, premendo
  RETURN ogni volta che si vuole copiare il contenuto del blocco sulla
  pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure CopyBlock ( MemoryBlock: Boolean );

{ Variabili locali }
Var

    { Memorizza le coordinate del blocco nel caso in cui si prema il
      tasto ESCAPE, e quindi occorre ripristinare le condizioni
      precedenti }
    AppBlock:    PTRRecBlock;

    { Vale TRUE quando si preme RETURN o ESCAPE }
    Done:        Boolean;

    { Posizione X del blocco (angolo in alto a sinistra }
    PosX:        Byte;

    { Posizione Y del blocco (angolo in alto a sinistra }
    PosY:        Byte;

    { Posizione X precedente del blocco (angolo in alto a sinistra }
    OldPosX:     Byte;

    { Posizione Y precedente del blocco (angolo in alto a sinistra }
    OldPosY:     Byte;

    { Tasto premuto dall' utente }
    Ch1:        Char;

    { Tasto esteso premuto dall' utente }
    Ch2:        Char;

    { Indice per i cicli }
    I:          Byte;

    { Indice per i cicli }
    J:          Byte;

    { Per continuare con lo spostamento e la copia del blocco deve
      assumere il valore logico TRUE }
    Ok:         Boolean;

    { Posizione precedente del mouse (X) }
    OldMouseX:  Byte;

    { Posizione precedente del mouse (Y) }
    OldMouseY:  Byte;

    { Il blocco vuole aggiornato ? }
    Aggiorna:   Boolean;


Begin { CopyBlock }

{ Se il blocco non Š stato definito viene chiesto dall' utente }
If (Not MemoryBlock)
  Then

    { Chiesto dall' utente }
    Ok := DefineCoordBlock

Else

  { E' stato definito in memoria (clipboard) }
  Ok := True;

{ Se il blocco esiste }
If Ok
  Then

    Begin

    { Messaggio per l' utente }
    Info(' Premi <Return> per copiare il blocco.',Color.UserInfo);

    { Alloca in memoria la pagina che memorizzar… il blocco }
    New(AppBlock);  { 3848 Bytes }

    { Salva la situazione del blocco }
    AppBlock^ := Block^;

    { Il blocco diventa la pagina video attiva }
    Block^.Page := Image^[NumPgVideo].Page;

    { TRUE per uscire dal ciclo }
    Done := False;

    { Definizione della posizione del blocco }
    PosX := Block^.InizioX;
    PosY := Block^.InizioY;
    OldPosX := 0;
    OldPosY := 0;

    { Ciclo principale: premere ESCAPE per uscire }
    Repeat

      { Se le posizioni sono cambiate, aggiornale anche sul video }
      If ((OldPosX <> PosX) Or (OldPosY <> PosY))
	Then

	  Begin

          { Il blocco diventa la pagina video attiva }
	  Block^.Page := Image^[NumPgVideo].Page;

	  { Copia il blocco sull' immagine in memoria }
          CopyAppBlockToBlock(AppBlock^,Block^,PosX,PosY);

	  With AppBlock^ Do

            With Special Do

              Begin

              { Nessuna restrizione: scrittura normale dei caratteri }
	      If ((Not BloccaFore) And (Not BloccaBack) And (Not BloccaCar))
	        Then
                  For i := InizioX To FineX Do
	            For j := InizioY To FineY Do
		      Block^.Page[PosY+j-InizioY,PosX+i-InizioX] := Page[j,i]

              Else

                Begin

                { Caratteri non bloccati }
                If (Not BloccaCar)
                  Then
                    For i := InizioX To FineX Do
	              For j := InizioY To FineY Do
		        Block^.Page[PosY+j-InizioY,PosX+i-InizioX].Ch :=
                                                                Page[j,i].Ch

                Else

                  { Caratteri bloccati (quindi il carattere non viene
                    modificato) }
                  For i := InizioX To FineX Do
	            For j := InizioY To FineY Do
		      Block^.Page[PosY+j-InizioY,PosX+i-InizioX].Ch :=
		            AppBlock^.Page[PosY+j-InizioY,PosX+i-InizioX].Ch;

                { Attributi di primo piano e di sfondo non bloccati }
                If (Not BloccaFore) And (Not BloccaBack)
                  Then
                    For i := InizioX To FineX Do
	              For j := InizioY To FineY Do
		        Block^.Page[PosY+j-InizioY,PosX+i-InizioX].At :=
                                                                Page[j,i].At

                Else

                  { Attributi di primo piano bloccati }
                  If ((Not BloccaBack) And BloccaFore)
                    Then
                      For i := InizioX To FineX Do
	                For j := InizioY To FineY Do
		          Block^.Page[PosY+j-InizioY,PosX+i-InizioX].At :=
			     (Page[PosY+j-InizioY,PosX+i-InizioX].At Mod 16)+
                             (Page[j,i].At Div 16)*16

                Else

                  { Attributi di sfondo bloccati }
                  If ((Not BloccaFore) And BloccaBack)
                    Then
                      For i := InizioX To FineX Do
	                For j := InizioY To FineY Do
		          Block^.Page[PosY+j-InizioY,PosX+i-InizioX].At :=
			    (Page[j,i].At Mod 16)+
                            (Page[PosY+j-InizioY,PosX+i-InizioX].At Div 16)*16

                  Else

                    { Attributi bloccati: nessuna modifica }
                    If (BloccaFore And BloccaBack)
                       Then
                         ;

                End;

              End;

	  { Aggiorna la riga di stato in fondo alla pagina }
	  With Image^[NumPgVideo] Do
	    { Coordinate di inizio e fine dell' angolo in alto a
	      sinistra }
	    Stato(NumPgVideo,PosY,PosX,Attr,SelCar,Modify);

	  { Visualizza il blocco }
	  Fisico^ := Block^.Page;

	  End;

      { Attesa di un tasto }
      AttendiMouse(Ch1,Ch2,SCopyBlock,Aggiorna);

      { Salvataggio dei dati precedenti }
      OldPosX := PosX;
      OldPosY := PosY;

      { Se la posizione del mouse Š cambiata ... }
      If (((OldMouseX <> MouseTextX) Or (OldMouseY <> MouseTextY)) And
            MouseOk)
              Then
                Begin

                { Aggiorna la posizione attuale }
                PosX := MouseTextX;
                PosY := MouseTextY;

                { Aggiorna le dimensioni del blocco }
	        If (PosX > (80-(Block^.FineX-Block^.InizioX)))
	          Then
	            PosX := 80-(Block^.FineX-Block^.InizioX);

	        If (PosY > (24-(Block^.FineY-Block^.InizioY)))
                  Then
                    PosY := 24-(Block^.FineY-Block^.InizioY);

                { Impostazioni per simulare il cambio delle dimensioni sullo
                  schermo }
                OldMouseX := MouseTextX;
                OldMouseY := MouseTextY;
                Ch1 := kNull;
                Ch2 := kNull;

                End;

      { Se il mouse Š stato premuto ... }
      If MousePressed
        Then

          Begin

          { Pulsante sinistro }
          If LeftButton
            Then
              Ch1 := kReturn

          Else

            { Pulsante destro }
            If RightButton
              Then
                Ch1 := kEscape;

          { Rilascio dei pulsanti del mouse }
          While MousePressed Do
            GetMPos;

          Aggiorna := True;

          End;

      { A seconda del tasto premuto ... }
      If Aggiorna
        Then

          Case Ch1 Of

	    { Tasto esteso }
	    kNull: Case Ch2 Of

		     { Su: Sposta il blocco verso l' alto di una riga }
		     kUp: If (PosY > 1)
			    Then
			      Dec(PosY);

		     { Gi—: Sposta il blocco verso il basso di una riga }
		     kDown: If (PosY < (24-(Block^.FineY-Block^.InizioY)))
			      Then
			        Inc(PosY);

		     { Sinistra: Sposta il blocco verso sinistra di una
                                 colonna }
		     kLeft: If (PosX > 1)
			      Then
			        Dec(PosX);

		     { Destra: Sposta il blocco verso destra di una colonna }
		     kRight: If (PosX < (80-(Block^.FineX-Block^.InizioX)))
			       Then
			         Inc(PosX);

		     { PageUp: Sposta il blocco alla prima riga }
		     kPgUp: PosY := 1;

		     { PageDown: Sposta il blocco all' ultima riga }
		     kPgDown: PosY := 24-(Block^.FineY-Block^.InizioY);

		     { Home: Sposta il blocco alla prima colonna }
		     kHome: PosX := 1;

		     { End: Sposta il blocco all' ultima colonna }
		     kEnd: PosX := 80-(Block^.FineX-Block^.InizioX);

                     { F1: aiuto generale }
	             kF1: Help('Help Generale',Altro);

                     { Shift-F1: indice dell' aiuto }
	             kSF1: Help('Indice',Altro);

                     { Alt-F1: schermata di aiuto precedente }
                     kAF1: Help(LastHelp^[1],Precedente);

                     { Ctrl-F1: help specifico }
                     kCF1: Help('Copia blocco',Altro);

		     End; { Case Ch2 }

	    { Return: Accetta le coordinate del blocco e lo memorizza nella
		      clipboard }
	    kReturn: Begin

		     { L' immagine viene considerata modificata }
		     Image^[NumPgVideo].Modify := True;

		     { Copia il blocco sull' immagine in memoria }
	             CopyAppBlockToImage(AppBlock^,Image^[NumPgVideo],
                                         PosX,PosY);

		     { Visualizza il blocco }
		     Fisico^ := Image^[NumPgVideo].Page;

		     { Aggiorna la riga di stato in fondo alla pagina }
		     With Image^[NumPgVideo] Do
		       { Coordinate di inizio e fine dell' angolo in alto a
		         sinistra }
		       Stato(NumPgVideo,PosY,PosX,Attr,SelCar,Modify);

		     End;

	    { Escape: Non sceglie il blocco e ripristina il precedente }
	    kEscape: Begin

		     { Uscita dalla funzione }
		     Done := True;

		     { Ripristino del blocco precedente }
		     Block^ := AppBlock^;

		     End;

	    End; { Case Ch1 }

    Until Done;

    { Libera la memoria dalla pagina utilizzata per la copia di sicurezza del
      blocco }
    Dispose(AppBlock);  { 3848 Bytes }

    End;

End; { CopyBlock }


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.APP.BLOCK.TO.IMAGE

  Trasferisce la copia del blocco in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni. La struttura dei dati Š quella relativa
  ad una pagina video e non ad un blocco, e l' immagine viene spostata e non
  copiata. Questa procedura serve solo per cancellare la parte di
  schermo relativa alle coordinate iniziali del blocco.
 ----------------------------------------------------------------------------}
Procedure MoveAppBlockToImage ( Var Rec1:   RecBlock;
                                Var Rec2:   RecImage;
                                    Car:    Char;
				Var Colore: Byte );
{ Variabili locali }
Var

    { Indice per i cicli }
    I:  Byte;

    { Indice per i cicli }
    J:  Byte;


Begin { MoveAppBlockToImage }

With Rec1 Do

  With Special Do

    Begin

    { Nessuna restrizione: scrittura normale dei caratteri }
    If ((Not BloccaFore) And (Not BloccaBack) And (Not BloccaCar))
      Then
        For i := InizioX To FineX Do
	  For j := InizioY To FineY Do
            Begin
	    Rec2.Page[j,i].Ch := Car;
            Rec2.Page[j,i].At := Colore;
            End

    Else

      Begin


      { Caratteri non bloccati }
      If (Not BloccaCar)
        Then
          For i := InizioX To FineX Do
	    For j := InizioY To FineY Do
	      Rec2.Page[j,i].Ch := Car

      Else

        ;

      { Attributi bloccati: nessuna modifica }
      If (BloccaFore And BloccaBack)
        Then

      Else

        { Attributi di sfondo bloccati }
        If ((Not BloccaFore) And (BloccaBack))
          Then
            For i := InizioX To FineX Do
	      For j := InizioY To FineY Do
	        Rec2.Page[j,i].At := (Colore Mod 16)+(Page[j,i].At Div 16)*16

      Else

        { Attributi di primo piano bloccati }
        If ((BloccaFore) And (Not BloccaBack))
          Then
            For i := InizioX To FineX Do
	      For j := InizioY To FineY Do
		Rec2.Page[j,i].At := (Page[j,i].At Mod 16)+(Colore Div 16)*16

      Else

        { Attributi di primo piano e di sfondo non bloccati }
        If (Not BloccaFore) and (Not BloccaBack)
          Then
            For i := InizioX To FineX Do
	      For j := InizioY To FineY Do
		Rec2.Page[j,i].At := Colore;

      End;

    End;

End; { MoveAppBlockToImage }


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.BLOCK

  Effettua lo spostamento di un blocco. Se Š stato definito in memoria
  verr… letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Premendo RETURN una volta spostato il blocco, verr… definita la sua
  nuova posizione nella pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure MoveBlock;

{ Variabili locali }
Var

    { Memorizza le coordinate del blocco nel caso in cui si prema il
      tasto ESCAPE, e quindi occorre ripristinare le condizioni
      precedenti }
    AppBlock:    PTRRecBlock;

    { Vale TRUE quando si preme RETURN o ESCAPE }
    Done:        Boolean;

    { Posizione X del blocco (angolo in alto a sinistra }
    PosX:        Byte;

    { Posizione Y del blocco (angolo in alto a sinistra }
    PosY:        Byte;

    { Posizione X precedente del blocco (angolo in alto a sinistra }
    OldPosX:     Byte;

    { Posizione Y precedente del blocco (angolo in alto a sinistra }
    OldPosY:     Byte;

    { Tasto premuto dall' utente }
    Ch1:        Char;

    { Tasto esteso premuto dall' utente }
    Ch2:        Char;

    { Indice per i cicli }
    I:          Byte;

    { Indice per i cicli }
    J:          Byte;

    { Posizione precedente del mouse (X) }
    OldMouseX:  Byte;

    { Posizione precedente del mouse (Y) }
    OldMouseY:  Byte;

    { Lo schermo deve essere aggiornato ? }
    Aggiorna:   Boolean;

Begin { MoveBlock }

{ Se il blocco non Š stato definito viene chiesto dall' utente }
If DefineCoordBlock
  Then

    Begin

    { Messaggio per l' utente }
    Info(' Premi <Return> per accettare la nuova posizione.',Color.UserInfo);

    { Alloca in memoria la pagina che memorizzar… il blocco }
    New(AppBlock);   { 3848 Bytes }

    { Salva la situazione del blocco }
    AppBlock^ := Block^;

    { Il blocco diventa la pagina video attiva }
    Block^.Page := Image^[NumPgVideo].Page;

    { Vuota la parte di immagine definita dal blocco, impostando i
      caratteri a 'carattei nulli' (codice ASCII 0), senza alterarne
      gli attributi }
    MoveAppBlockToImage(AppBlock^,Image^[NumPgVideo],kNull,Color.Default);

    { TRUE per uscire dal ciclo }
    Done := False;

    { Definizione della posizione del blocco }
    PosX := Block^.InizioX;
    PosY := Block^.InizioY;
    OldPosX := 0;
    OldPosY := 0;

    { Ciclo principale: premere ESCAPE per uscire }
    Repeat

      { Se le posizioni sono cambiate, aggiornale anche sul video }
      If ((OldPosX <> PosX) Or (OldPosY <> PosY))
	Then

	  Begin

          { Il blocco diventa la pagina video attiva }
	  Block^.Page := Image^[NumPgVideo].Page;


	  { Copia il blocco sull' immagine in memoria }
          CopyAppBlockToBlock(AppBlock^,Block^,PosX,PosY);

	  { Aggiorna la riga di stato in fondo alla pagina }
	  With Image^[NumPgVideo] Do
	    { Coordinate di inizio e fine dell' angolo in alto a
	      sinistra }
	    Stato(NumPgVideo,PosY,PosX,Attr,SelCar,Modify);

	  { Visualizza il blocco }
	  Fisico^ := Block^.Page;

          OldPosX := PosX;
          OldPosY := PosY;

	  End;

      { Attesa di un tasto }
      AttendiMouse(Ch1,Ch2,SMoveBlock,Aggiorna);

      OldPosX := PosX;
      OldPosY := PosY;

      { Se la posizione del mouse Š cambiata ... }
      If (((OldMouseX <> MouseTextX) Or (OldMouseY <> MouseTextY)) And
            MouseOk)
              Then

                Begin

                { Aggiorna le posizioni del blocco }
                PosX := MouseTextX;
                PosY := MouseTextY;

                { Controllo della validit… delle posizioni }
	        If (PosX > (80-(Block^.FineX-Block^.InizioX)))
	          Then
	            PosX := 80-(Block^.FineX-Block^.InizioX);

	        If (PosY > (24-(Block^.FineY-Block^.InizioY)))
                  Then
                    PosY := 24-(Block^.FineY-Block^.InizioY);

                { Aggiornamento delllo schermo }
                OldMouseX := MouseTextX;
                OldMouseY := MouseTextY;
                Ch1 := kNull;
                Ch2 := kNull;

                End;

      { E' stato premuto un pulsante del mouse ? }
      If MousePressed
        Then

          Begin

          { Pulsante sinistro }
          If LeftButton
            Then
              Ch1 := kReturn

          Else

            { Pulsante destro }
            If RightButton
              Then
                Ch1 := kEscape;

          { Rilascio dei pulsanti del mouse }
          While MousePressed Do
            GetMPos;

          Aggiorna := True;

          End;

      { A seconda del tasto premuto ... }
      If Aggiorna
        Then

          Case Ch1 Of

	    { Tasto esteso }
	    kNull: Case Ch2 Of

		     { Su: Sposta il blocco verso l' alto di una riga }
		     kUp: If (PosY > 1)
			    Then
			      Dec(PosY);

		     { Gi—: Sposta il blocco verso il basso di una riga }
		     kDown: If (PosY < (24-(Block^.FineY-Block^.InizioY)))
			      Then
			        Inc(PosY);

		     { Sinistra: Sposta il blocco verso sinistra di una
                                 colonna }
		     kLeft: If (PosX > 1)
			      Then
			        Dec(PosX);

		     { Destra: Sposta il blocco verso destra di una colonna }
		     kRight: If (PosX < (80-(Block^.FineX-Block^.InizioX)))
			       Then
			         Inc(PosX);

		     { PageUp: Sposta il blocco alla prima riga }
		     kPgUp: PosY := 1;

		     { PageDown: Sposta il blocco all' ultima riga }
		     kPgDown: PosY := 24-(Block^.FineY-Block^.InizioY);

		     { Home: Sposta il blocco alla prima colonna }
		     kHome: PosX := 1;

		     { End: Sposta il blocco all' ultima colonna }
		     kEnd: PosX := 80-(Block^.FineX-Block^.InizioX);

                     { F1: aiuto generale }
	             kF1: Help('Help Generale',Altro);

                     { Shift-F1: indice dell' aiuto }
	             kSF1: Help('Indice',Altro);

                     { Alt-F1: schermata di aiuto precedente }
                     kAF1: Help(LastHelp^[1],Precedente);

                     { Ctrl-F1: help specifico }
                     kCF1: Help('Muovi blocco',Altro);

		     End; { Case Ch2 }

	    { Return: Accetta le coordinate del blocco e lo memorizza nella
		      clipboard }
	    kReturn: Begin

		     { Si pu• muovere il blocco una sola volta }
		     Done := True;

		     { L' immagine viene considerata modificata }
		     Image^[NumPgVideo].Modify := True;

		     { Copia il blocco sull' immagine in memoria }
		     With AppBlock^ Do

		     { Copia il blocco sull' immagine in memoria }
                     CopyAppBlockToImage(AppBlock^,Image^[NumPgVideo],
                                         PosX,PosY);

		     { Visualizza il blocco }
		     Fisico^ := Image^[NumPgVideo].Page;

		     { Aggiorna la riga di stato in fondo alla pagina }
		     With Image^[NumPgVideo] Do
		       { Coordinate di inizio e fine dell' angolo in alto a
		         sinistra }
		       Stato(NumPgVideo,PosY,PosX,Attr,SelCar,Modify);

		     End;

	    { Escape: Non sceglie il blocco e ripristina il precedente }
	    kEscape: Begin

		     { Uscita dalla funzione }
		     Done := True;

		     { Ripristino del blocco precedente }
		     Block^ := AppBlock^;

		     { Ripristina l' immagine iniziale }
		     With AppBlock^ Do

		       For i := InizioX To FineX Do
		         For j := InizioY To FineY Do
		           Image^[NumPgVideo].Page[j,i] := Page[j,i];
		     End;

	    End; { Case Ch1 }

    Until Done;

    { Libera la memoria dalla pagina utilizzata per la copia di sicurezza del
      blocco }
    Dispose(AppBlock);   { 3848 Bytes }

    End;

End; { MoveBlock }


{----------------------------------------------------------------------------
  PROCEDURA: ERASE.VIDEO.BLOCK

  Cancella il blocco definito dall' utente riempiendolo di caratteri nulli
  di attributo di colore scelto dall' utente.
 ----------------------------------------------------------------------------}
Procedure EraseVideoBlock;

{ Variabili locali }
Var

    { Indice per i cicli }
    I:          Byte;

    { Indice per i cicli }
    J:          Byte;

    { Colore scelto dall' utente }
    Attr:   Integer;

Begin { EraseVideoBlock }

{ Se il blocco Š stato definito ... }
If DefineCoordBlock
  Then

    Begin

    { Messaggio per l' utente }
    Info(' Scegli il colore dello sfondo.',Color.UserInfo);

    { Scelta dell' attributo }
    Attr := ScegliColori;

    { Se Š stato scelto un attributo valido si prosegue }
    If (Attr <> -1)
      Then

	Begin

	{ Cancella il blocco riempiendolo con caratteri nulli di colore
	  ATTR }
        MoveAppBlockToImage(Block^,Image^[NumPgVideo],kNull,Byte(Attr));

	{ L' immagine viene considerata modificata }
	Image^[NumPgVideo].Modify := True;

	End;

    End;

End; { EraseVideoBlock }


{----------------------------------------------------------------------------
  PROCEDURA: FILL.VIDEO.BLOCK

  Riempie il blocco definito dall' utente del carattere e del colore
  scelti.
  Per non riempire il blocco, basta premere il tasto ESCAPE prima di
  aver scelto il colore.
 ----------------------------------------------------------------------------}
Procedure FillVideoBlock;

{ Variabili locali }
Var

    { Vale TRUE se si pu• procedere con il riempimento dell' area definita
      dal blocco }
    Ok:     Boolean;

    { Indice per i cicli }
    I:      Byte;

    { Indice per i cicli }
    J:      Byte;

    { Colore scelto dall' utente }
    Attr:   Integer;

    { Carattere scelto dall' utente }
    Ch:     Char;

Begin { FillVideoBlock }

{ Definizione del blocco }
Ok := DefineCoordBlock;

{ Se Š stato definito ... }
If Ok
  Then

    Begin

    { Messaggio per l' utente }
    Info(' Scegli il carattere ASCII per il riempimento.',Color.UserInfo);

    { Scelta del carattere ASCII }
    Ch := MenuASCII;

    { Deve essere diverso dal carattere ASCII nullo }
    If (Ch = kNull)
      Then
	Ok := False;

    { Se anche il carattere Š stato scelto correttamento ... }
    If Ok
      Then

	Begin

	{ Messaggio per l' utente }
	Info(' Scegli il colore per il riempimento.',Color.UserInfo);

	{ Scelta dell' attributo }
	Attr := ScegliColori;

	{ Se Š stato scelto un attributo valido si prosegue }
	If (Attr = -1)
	  Then
	    Ok := False;

	{ Se tutte le scelte sono state fatte correttamente,
	  si pu• cominciare a riempire il blocco }
	If Ok
	  Then

	    Begin

	    { Riempie il blocco con caratteri CH di attributo ATTR }
            MoveAppBlockToImage(Block^,Image^[NumPgVideo],Ch,Byte(Attr));

	    { L' immagine viene considerata modificata }
	    Image^[NumPgVideo].Modify := True;

	    End;

	End;

    End;

End; { FillVideoBlock }


{----------------------------------------------------------------------------
  PROCEDURA: DISEGNA.CORNICE

  Disegna una cornice attorno al blocco evidenziato, scegliendo tra i diversi
  tipi di cornice disponibili. I parametri sono il puntatore della pagina
  video che si desidera modificare, le coordinate del blocco (o della
  pagina), il colore della cornice e i caratteri che la compongono.
 ----------------------------------------------------------------------------}
Procedure DisegnaCornice ( Var Rec:     RecImage;
                               InizioX: Byte;
                               InizioY: Byte;
                               FineX:   Byte;
                               FineY:   Byte;
                               Attr:    Byte;
                               Corn:    String013 );

{ Variabili locali }
Var

    { Indice per i cili }
    I:  Byte;

    { Indice per i cicli }
    J:  Byte;

Begin { DisegnaCornice }

{ Disegna i bordi orizzontali }
For i := InizioX To FineX Do

  Begin

  { Bordo orizzontale superiore e relativo atttibuto }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[InizioY,i].Ch := Corn[2];

  Image^[NumPgVideo].Page[InizioY,i].At :=
         ModifyColor(Image^[NumPgVideo].Page[InizioY,i].At,Attr,InizioY,i);

  { Bordo orizzontale inferiore e relativo atttibuto }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[FineY,i].Ch := Corn[7];

  Image^[NumPgVideo].Page[FineY,i].At :=
         ModifyColor(Image^[NumPgVideo].Page[FineY,i].At,Attr,FineY,i);

  End;

{ Disegna i bordi verticali }
For i := InizioY To FineY Do

  Begin

  { Bordo verticale sinistro e relativo atttibuto }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[i,InizioX].Ch := Corn[4];

  Image^[NumPgVideo].Page[i,InizioX].At :=
         ModifyColor(Image^[NumPgVideo].Page[i,InizioX].At,Attr,i,InizioX);

  { Bordo verticale destro e relativo atttibuto }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[i,FineX].Ch := Corn[4];

  Image^[NumPgVideo].Page[i,FineX].At :=
         ModifyColor(Image^[NumPgVideo].Page[i,FineX].At,Attr,i,FineX);

  End;

  { Angolo in basso a sinistra e relativo attributo }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[FineY,  InizioX].Ch := Corn[6];

  Image^[NumPgVideo].Page[FineY,  InizioX].At :=
         ModifyColor(Image^[NumPgVideo].Page[FineY,InizioX].At,Attr,
                     FineY,InizioX);

  { Angolo in alto a destra e relativo attributo }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[InizioY,FineX  ].Ch := Corn[3];

  Image^[NumPgVideo].Page[InizioY,FineX  ].At :=
         ModifyColor(Image^[NumPgVideo].Page[InizioY,FineX].At,Attr,
                     InizioY,FineX);

  { Angolo in alto a sinistra e relativo attributo }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[InizioY,InizioX].Ch := Corn[1];

  Image^[NumPgVideo].Page[InizioY,InizioX].At :=
         ModifyColor(Image^[NumPgVideo].Page[InizioY,InizioX].At,Attr,
                     InizioY,InizioX);

  { Angolo in basso a destra e relativo attributo }
  If (Not Special.BloccaCar)
    Then
      Image^[NumPgVideo].Page[FineY,  FineX  ].Ch := Corn[8];

  Image^[NumPgVideo].Page[FineY,FineX].At :=
         ModifyColor(Image^[NumPgVideo].Page[FineY,FineX].At,Attr,
                     FineY,FineX);

End; { DisegnaCornice }


{----------------------------------------------------------------------------
  PROCEDURA: BORD.VIDEO.BLOCK

  Contorna il blocco definito dall' utente del colore e della cornice
  scelti.
  Per interrompere il processo, basta premere il tasto ESCAPE prima di
  aver scelto la cornice.
 ----------------------------------------------------------------------------}
Procedure BordVideoBlock;

{ Variabili locali }
Var

    { Vale TRUE se si pu• procedere con l' operazione }
    Ok:      Boolean;

    { Indice per i cicli }
    I:       Byte;

    { Indice per i cicli }
    J:       Byte;

    { Colore scelto dall' utente }
    Attr:    Integer;

    { Caratteri che formano la cornice }
    Corn:    String013;

Begin { BordVideoBlock }

{ Definizione del blocco }
Ok := DefineCoordBlock;

{ Se Š stato definito ... }
If Ok
  Then

    Begin

    { Messaggio per l' utente }
    Info(' Scegli il colore per la cornice.',Color.UserInfo);

    { Scelta dell' attributo }
    Attr := ScegliColori;

    { Se Š stato scelto un attributo valido si prosegue }
    If (Attr = -1)
      Then
	Ok := False;

    { Si pu• proseguire solo se il colore Š valido }
    If Ok
      Then

	Begin

	{ Messaggio per l' utente }
	Info(' Scegli il tipo di cornice.',Color.UserInfo);

	{ Scegli il tipo di cornice }
	Corn := SelezionaCornice;

	{ Se non Š un tipo valido non si prosegue }
	If (Corn = kNull)
	  Then
	    Ok := False;

	{ Dopo la scelta della cornice, si pu• passare finalmente
	  ad incorniciare il blocco }
	If Ok
	  Then

	    Begin

	    { Disegna una cornice di tipo CORN con attributo ATTR }
	    With Block^ Do

              DisegnaCornice(Image^[NumPgVideo],InizioX,InizioY,FineX,FineY,
                             Byte(Attr),Corn);

	    { L' immagine viene considerata modificata }
	    Image^[NumPgVideo].Modify := True;

	    End;

	End;

    End;

End; { BordVideoBlock }


{----------------------------------------------------------------------------
  PROCEDURA: INVERT.BLOCK

  Inverte i colori di un blocco oppure i caratteri di questo in senso
  verticale od orizzontale. I parametri passati sono il puntatore
  alla pagina video in memoria, le coordinate di inizio e di fine
  del blocco (quindi si possono specificare anche per invertire uno schermo
  intero), e un valore IMG (True o False) per indicare se l' inversione
  riguarda un blocco (False) oppute l' intera pagina video (True).
  Se le opzioni InvertXCar o InvertYCar sono attive, verranno invertiti
  i caratteri che hanno un corrispondente al contrario; ad esempio
  i caratteri "^v" "\/" "<>" "()" "óò" "Lâ" ecc.
 ----------------------------------------------------------------------------}
Procedure InvertBlock ( Var Rec:     RecImage;
                            InizioX: Byte;
                            InizioY: Byte;
                            FineX:   Byte;
                            FineY:   Byte;
			    Img:     Boolean );

{ Variabili locali }
Var

    { Carattere da invertire }
    AppChar: Char;

    { Attributo da invertire }
    AppAttr: Byte;

    { Record (attributo+carattere) da invertire }
    AppAttrChar: RecCharAttr;

    { Stringa di appoggio }
    St:      String;

    { Stringa di appoggio }
    St2:     String;

    { Posizione del carattere da invertire }
    PosCar:  Byte;


     {-----------------------------------------------------------------------
       PROCEDURA: INVERT.UP.DOWN

       Inverte l' immagine o il blocco in senso verticale (su-gi—).
      -----------------------------------------------------------------------}
     Procedure InvertUpDown;

     { Variabili locali }
     Var

          { Indice per i cicli }
          I:         Byte;

          { Indice per i cicli }
          J:         Byte;

          { Fine del blocco/immagine reale }
          RealFineY: Byte;

     Begin { InvertUpDown }

     { L' immagine Š modificata }
     Image^[NumPgVideo].Modify := True;

     { Solo se le dimensioni sono corrette }
     If (FineY > InizioY)
       Then

         Begin
         RealFineY := (FineY+InizioY-1) Div 2;

         With Special Do
           Begin

           { Inversione dei caratteri non bloccati }
           If (InvertYCar And (Not BloccaCar))
             Then
               For i := InizioY To FineY Do
                 For j := InizioX To FineX Do
                   Begin

                   { Cerca il carattere speciale (es. <>, (), \/, ecc.) }
                   PosCar := Pos(Rec.Page[i,j].Ch,SetCarUp);

                   { Esiste ? }
                   If (PosCar <> 0)
                     Then

                       { Si: inversione }
                       Rec.Page[i,j].Ch := SetCarDown[PosCar]

                   Else

                     { No: ricerca il carattere opposto }
                     Begin

                     { Ricerca }
                     PosCar := Pos(Rec.Page[i,j].Ch,SetCarDown);

                     { Esiste ? }
                     If (PosCar <> 0)
                       Then

                         { Si: inversione }
                         Rec.Page[i,j].Ch := SetCarUp[PosCar];

                     End;

                   End

           Else
             ;

           { Nessuna restrizione: scrittura normale dei caratteri }
           If ((Not BloccaCar) And (Not BloccaFore) And (Not BloccaBack))
             Then
               For i := InizioY To RealFineY Do
                 For j := InizioX To FineX Do
                   Begin
	           AppAttrChar := Rec.Page[i,j];
                   Rec.Page[i,j] := Rec.Page[FineY-i+InizioY,j];
                   Rec.Page[FineY-i+InizioY,j] := AppAttrChar;
                   End

           Else

             Begin

             { Caratteri non bloccati }
             If (Not BloccaCar)
               Then
                 For i := InizioY To RealFineY Do
                   For j := InizioX To FineX Do
                     Begin
	             AppChar := Rec.Page[i,j].Ch;
                     Rec.Page[i,j].Ch := Rec.Page[FineY-i+InizioY,j].Ch;
                     Rec.Page[FineY-i+InizioY,j].Ch := AppChar;
                     End

             Else
               ;

             { Attributi di primo piano e di sfondo non bloccati }
             If ((Not BloccaFore) And (Not BloccaBack))
               Then
                 For i := InizioY To RealFineY Do
	           For j := InizioX To FineX Do
	             Begin
		     AppAttr := Rec.Page[i,j].At;
		     Rec.Page[i,j].At := Rec.Page[FineY-i+InizioY,j].At;
                     Rec.Page[FineY-i+InizioY,j].At := AppAttr;
                     End

             Else

               { Attributi di sfondo bloccati }
               If (BloccaBack And (Not BloccaFore))
                 Then
                   For i := InizioY To RealFineY Do
	             For j := InizioX To FineX Do
	               Begin
		       AppAttr := (Rec.Page[i,j].At Mod 16)+
		                  (Rec.Page[FineY-i+InizioY,j].At Div 16)*16;
		       Rec.Page[i,j].At :=
                                   (Rec.Page[FineY-i+InizioY,j].At Mod 16)+
		                   (Rec.Page[i,j].At Div 16)*16;
                       Rec.Page[FineY-i+InizioY,j].At := AppAttr;
                       End

             Else

               { Attributi di primo piano bloccati }
               If (BloccaFore And (Not BloccaBack))
                 Then
                   For i := InizioY To RealFineY Do
	             For j := InizioX To FineX Do
                       Begin
		       AppAttr := (Rec.Page[FineY-i+InizioY,j].At Mod 16)+
		                  (Rec.Page[i,j].At Div 16)*16;
		       Rec.Page[i,j].At :=
                                 (Rec.Page[i,j].At Mod 16)+
		                 (Rec.Page[FineY-i+InizioY,j].At Div 16)*16;;
                       Rec.Page[FineY-i+InizioY,j].At := AppAttr;
                       End

               Else

               { Attributi bloccati: nessuna modifica }
               If (BloccaFore And BloccaBack)
                  Then
	            ;

             End;

           End;

         End;

     End; { InvertUpDown }


     {-----------------------------------------------------------------------
       PROCEDURA: INVERTRIGHTLEFT

       Inverte l' immagine o il blocco in senso orizzontale (destra-
       sinistra).
      -----------------------------------------------------------------------}
     Procedure InvertRightLeft;

     { Variabili locali }
     Var

          { Indice per i cicli }
          I:         Byte;

          { Indice per i cicli }
          J:         Byte;

          { Fine del blocco/immagine reale }
          RealFineX: Byte;

     Begin { InvertRightLeft }

     { L' immagine Š modificata }
     Image^[NumPgVideo].Modify := True;

     { Solo se le dimensioni sono corrette }
     If (FineX > InizioX)
       Then

         Begin
         RealFineX := (FineX+InizioX-1) Div 2;

         With Special Do
           Begin

           { Inversione dei caratteri non bloccati }
           If (InvertXCar And (Not BloccaCar))
             Then
               For i := InizioY To FineY Do
                 For j := InizioX To FineX Do
                   Begin

                   { Inversione dei caratteri non bloccati }
                   PosCar := Pos(Rec.Page[i,j].Ch,SetCarLeft);

                   { Esiste ? }
                   If (PosCar <> 0)
                     Then

                       { Si: inversione }
                       Rec.Page[i,j].Ch := SetCarRight[PosCar]

                   Else

                     { No: ricerca il carattere opposto }
                     Begin

                     { Ricerca }
                     PosCar := Pos(Rec.Page[i,j].Ch,SetCarRight);

                     { Esiste ? }
                     If (PosCar <> 0)
                       Then

                         { Si: inversione }
                         Rec.Page[i,j].Ch := SetCarLeft[PosCar];

                     End;

                   End

           Else
             ;

           { Nessuna restrizione: scrittura normale dei caratteri }
           If ((Not BloccaCar) And (Not BloccaFore) And (Not BloccaBack))
             Then
               For i := InizioY To FineY Do
                 For j := InizioX To RealFineX Do
                   Begin
	           AppAttrChar := Rec.Page[i,j];
                   Rec.Page[i,j] := Rec.Page[i,FineX-j+InizioX];
                   Rec.Page[i,FineX-j+InizioX] := AppAttrChar;
                   End

           Else

             Begin

             { Caratteri non bloccati }
             If Not BloccaCar
               Then
                 For i := InizioY To FineY Do
                   For j := InizioX To RealFineX Do
                     Begin
	             AppChar := Rec.Page[i,j].Ch;
                     Rec.Page[i,j].Ch := Rec.Page[i,FineX-j+1].Ch;
                     Rec.Page[i,FineX-j+InizioX].Ch := AppChar;
                     End

             Else
               ;

             { Attributi di primo piano e di sfondo non bloccati }
             If ((Not BloccaFore) And (Not BloccaBack))
               Then
                 For i := InizioY To FineY Do
	           For j := InizioX To RealFineX Do
	             Begin
		     AppAttr := Rec.Page[i,j].At;
		     Rec.Page[i,j].At := Rec.Page[i,FineX-j+InizioX].At;
                     Rec.Page[i,FineX-j+InizioX].At := AppAttr;
                     End

             Else

               { Attributi di sfondo bloccati }
               If (BloccaBack And (Not BloccaFore))
                 Then
                   For i := InizioY To FineY Do
       	             For j := InizioX To RealFineX Do
	               Begin
		       AppAttr := (Rec.Page[i,j].At Mod 16)+
		                  (Rec.Page[i,FineX-j+InizioX].At Div 16)*16;
		       Rec.Page[i,j].At :=
                                   (Rec.Page[i,FineX-j+InizioX].At Mod 16)+
		                   (Rec.Page[i,j].At Div 16)*16;;
                       Rec.Page[i,FineX-j+InizioX].At := AppAttr;
                       End

             Else

               { Attributi di primo piano bloccati }
               If (BloccaFore And (Not BloccaBack))
                 Then
                   For i := InizioY To FineY Do
	             For j := InizioX To RealFineX Do
                       Begin
		       AppAttr := (Rec.Page[i,FineX-j+InizioX].At Mod 16)+
		                  (Rec.Page[i,j].At Div 16)*16;
		       Rec.Page[i,j].At :=
                                 (Rec.Page[i,j].At Mod 16)+
		                 (Rec.Page[i,FineX-j+InizioX].At Div 16)*16;;
                       Rec.Page[i,FineX-j+InizioX].At := AppAttr;
                       End

               Else

                 { Attributi bloccati: nessuna modifica }
                 If (BloccaFore And BloccaBack)
                    Then
	              ;

             End;

           End;

         End;

     End; { InvertRightLeft }


     {-----------------------------------------------------------------------
       PROCEDURA: INVERTCOLOR

       Inverte i colori dell' immagine o del blocco (negativo).
      -----------------------------------------------------------------------}
     Procedure InvertColor;

     { Variabili locali }
     Var

          { Indice per i cicli }
          I:         Byte;

          { Indice per i cicli }
          J:         Byte;

     Begin { InvertColor }

     { L' immagine Š modificata }
     Image^[NumPgVideo].Modify := True;

     With Special Do
       Begin

       { Attributi di primo piano e di sfondo non bloccati }
       If ((Not BloccaFore) And (Not BloccaBack))
         Then
           For i := InizioY To FineY Do
             For j := InizioX To FineX Do
               If (Rec.Page[i,j].At > 127)
	         Then

                   { Considera anche il lampeggio }
	           Rec.Page[i,j].At := 255-Rec.Page[i,j].At+Blink

               Else

                 { Senza lampeggio }
	         Rec.Page[i,j].At := 127-Rec.Page[i,j].At

       Else

         Begin

         { Attributi di sfondo bloccati }
         If (BloccaBack And (Not BloccaFore))
           Then
             For i := InizioY To FineY Do
	       For j := InizioX To FineX Do
	           Rec.Page[i,j].At := (15-Rec.Page[i,j].At Mod 16)+
		                       (Rec.Page[i,j].At Div 16)*16

         Else

           { Attributi di primo piano bloccati }
           If (BloccaFore And (Not BloccaBack))
             Then
               For i := InizioY To FineY Do
	         For j := InizioX To FineX Do
                   If Rec.Page[i,j].At > 127
                     Then

                       { Considera anche il lampeggio }
                       Rec.Page[i,j].At :=
                                   (Rec.Page[i,j].At Mod 16)+
		                   (15-Rec.Page[i,j].At Div 16)*16+Blink

                   Else

                     { Senza lampeggio }
                     Rec.Page[i,j].At := (Rec.Page[i,j].At Mod 16)+
		                         (7-Rec.Page[i,j].At Div 16)*16

           Else

             { Attributi bloccati: nessuna modifica }
             If (BloccaFore And BloccaBack)
                Then
	          ;

         End;

       End;

     End; { InvertColor }


Begin { InvertBlock }

{ Se Š un' immagine o un blocco vengono impostati i messaggi per la finestra
  di dialogo }
If Img
  Then

    { Immagine }
    Begin
    St := 'l'' immagine';
    St2 := 'dell'' immagine';
    End

Else

  { Blocco }
  Begin
  St := 'il blocco';
  St2 := 'del blocco';
  End;

{ Disegno del menu }
With Color Do
  Case Menu('[TIPI DI INVERSIONE]',

	    '||'+

	    '               Inversione ^Su-Gi—               |'+
            ' Inverte '+St+' in senso verticale|',

            '||'+

	    'Inversione ^Destra-Sinistra|'+
            ' Inverte '+St+' in senso orizzontale|',

            '||'+

	    '^Negativo '+St2+'|'+
            'Inverte i colori '+St2+', negandoli|',

	    '||','','','','',

	     MenuTitle,MenuSel,MenuUnSel,
	     MenuBord,MenuText,MenuKeySel,
	     MenuKeyUnSel,SMenuInvert)

       Of

         { Inversione del blocco/immagine in senso verticale }
         2: InvertUpDown;

         { Inversione del blocco/immagine in senso orizzontale }
         4: InvertRightLeft;

         { Negativo del blocco/immagine }
         6: InvertColor;

       End; { Case Menu }

End; { InvertBlock }


{----------------------------------------------------------------------------
  PROCEDURA: INVERT.VIDEO.BLOCK

  Effettua la chiamata alla procedura INVERTBLOCK per invertire il blocco
  nel modo scelto dall' utente.
 ----------------------------------------------------------------------------}
Procedure InvertVideoBlock;

Begin { InvertVideoBlock }

If DefineCoordBlock
  Then

    With Block^ Do

      InvertBlock(Image^[NumPgVideo],InizioX,InizioY,FineX,FineY,False);

End; { InvertVideoBlock }


{----------------------------------------------------------------------------
  PROCEDURA: READ.BLOCK.FILE

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video.
  Dopo aver definito il blocco, lo si pu• spostare a piacere ed effettuare
  copie multiple.
 ----------------------------------------------------------------------------}
Procedure ReadBlockFile;

{ Variabili locali }
Var

    { File strutturato per la lettura }
    FileBLK:       File Of
		     RecPage;

    { Stringa di appoggio per il nome del file }
    St:            String;

    { Appoggio per memorizzare il numero di pagina attiva }
    OldNumPgVideo: Byte;

Begin { ReadBlockFile }

{ Attende in input il nome del file da leggere }
NameReadFileBLK := InputFile('[Leggi File Blocco]','.BLK','*.BLK',
			     SetCarFile);
		   
{ Se Š diverso dalla stringa nulla }
If (NameReadFileBLK <> StrNull)
  Then
    Begin

    { Assegnazione del file sul disco ad un nome logico }
    Assign(FileBLK,NameReadFileBLK);

    { Lettura del file }
    {$I-}  Reset(FileBLK);  {$I+}

    { Se non esiste sul disco viene visualizzato un messaggio di errore }
    If (IOResult <> 0)
      Then

	Begin

	{ Finestra di dialogo per l' utente }
        With Color Do
          If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               Il file specificato               |'+
		     '( '+NameReadFileBLK+' )|'+
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

      { Messaggio per l' utente }
      Info(' Lettura del file '+NameReadFileBLK+' ...',Color.Performing);
      Delay(Ritardo.Messaggi);

      { Legge il record }
      Read(FileBLK,Image^[PgClipBoard].Page);

      { Chiude il file }
      Close(FileBLK);

      OldNumPgVideo := NumPgVideo;
      NumPgVideo := PgClipBoard;
      Fisico^ := Image^[NumPgVideo].Page;

      If DefineCoordBlock
	Then
	  Begin
	  NumPgVideo := OldNumPgVideo;
	  CopyBlock(True);
	  End;

      End;

    End;


End; { ReadBlockFile }


{----------------------------------------------------------------------------
  PROCEDURA: SAVE.BLOCK.FILE

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
 ----------------------------------------------------------------------------}
Procedure SaveBlockFile;

{ Variabili locali }
Var

    { File strutturato per la scrittura }
    FileBLK:     File Of
		   RecPage;

    { Indica se il file (sempre se esiste) pu• essere o no sovrascritto }
    Sovrascrivi: Boolean;

Begin { SaveBlockFile }

{ Attende in input il nome del file da leggere }
NameWriteFileBLK := InputFile('[Salva File Blocco]','.BLK','*.BLK',
			      SetCarFile);
		   
{ Se Š diverso dalla stringa nulla }
If (NameWriteFileBLK <> StrNull)
  Then
    Begin

    Sovrascrivi := True;

    { Assegnazione del file sul disco ad un nome logico }
    Assign(FileBLK,NameWriteFileBLK);

    { Lettura del file }
    {$I-}  Reset(FileBLK);  {$I+}

    { Se esiste sul disco viene visualizzata una finestra di dialogo
      in cui si chiede se il file deve essere sovrascritto o no }
    If (IOResult = 0)
      Then

	Begin

	{ Chiusura del file }
	Close(FileBLK);

	{ Finestra di dialogo per l' utente }
        With Color Do
	  If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               Il file specificato               |'+
		     '( '+NameWriteFileBLK+' )|'+
		     'esiste sul disco.|'+
		     '|'+
		     'Devo sovrascrivo o no ?|','','',
		     __SI_NO__,WarningBord,WarningTitle,
		     WarningText,WarningSel,
		     WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then

		         { Pu• essere sovrascritto }
		         Sovrascrivi := True

	Else

	  { Non pu• essere sovrascritto }
	  Sovrascrivi := False;

	End;

    { Se il file non esiste o se si pu• sovrascrivere ... }
    If Sovrascrivi Then

      { Se non esiste, invece, viene creato }
      Begin


      { Cancellazione del file sul disco }
      ReWrite(FileBLK);

      { Messaggio per l' utente }
      Info(' Scrittura del file '+NameWriteFileBLK+' ...',Color.Performing);
      Delay(Ritardo.Messaggi);

      { Scrive il record }
      Write(FileBLK,Image^[NumPgVideo].Page);

      { Chiude il file }
      Close(FileBLK);

      End;

    End;


End; { SaveBlockFile }


{----------------------------------------------------------------------------
  PROCEDURA: READ.TEXT.BLOCK

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video.
  Dopo aver definito il blocco, lo si pu• spostare a piacere ed effettuare
  copie multiple.
  Il file viene letto come testo, per cui il colore Š quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure ReadTextBlock;

{ Variabili locali }
Var

    { File di testo per la lettura }
    FileTXTBLK:    Text;

    { Stringa di appoggio per la lettura }
    St:            String;

    { Numero di linee lette }
    NumLines:      Byte;

    { Appoggio per memorizzare il numero di pagina attiva }
    OldNumPgVideo: Byte;

Begin { ReadTextBlock }

{ Attende in input il nome del file da leggere }
NameReadFileTXTBLK := InputFile('[Leggi File Testo]','.TXT','*.TXT',
				SetCarFile);
		   
{ Se Š diverso dalla stringa nulla }
If (NameReadFileTXTBLK <> StrNull)
  Then
    Begin

    { Assegnazione del file sul disco ad un nome logico }
    Assign(FileTXTBLK,NameReadFileTXTBLK);

    { Lettura del file }
    {$I-}  Reset(FileTXTBLK);  {$I+}

    { Se non esiste sul disco viene visualizzato un messaggio di errore }
    If (IOResult <> 0)
      Then

	Begin

	{ Finestra di dialogo per l' utente }
        With Color Do
	  If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               Il file specificato               |'+
		     '( '+NameReadFileTXTBLK+' )|'+
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

      { Messaggio per l' utente }
      Info(' Lettura del file '+NameReadFileTXTBLK+' ...',Color.Performing);
      Delay(Ritardo.Messaggi);

      OldNumPgVideo := NumPgVideo;
      NumPgVideo := PgClipBoard;
      Fisico^ := Image^[NumPgVideo].Page;

      { Cancella lo schermo }
      TextAttr := Color.Default;
      ClrScr;

      { Inizializza a 0 il numero di linee lette dal file }
      NumLines := 0;

      { Legge le righe del file di testo }
      While ((Not EOF(FileTXTBLK)) And (NumLines < 24)) Do

	Begin

	{ Incrementa il numero di linee lette dal file }
	Inc(NumLines);

	{ Legge una linea }
	ReadLn(FileTXTBLK,St);

	{ La scrive sul video }
	WriteStr(1,NumLines,St,Color.Default);

	End;

      { Chiude il file }
      Close(FileTXTBLK);

      { Aggiorna la pagina video in memoria }
      Image^[NumPgVideo].Page := Fisico^;

      If DefineCoordBlock
	Then
	  Begin
	  NumPgVideo := OldNumPgVideo;
	  CopyBlock(True);
	  End;

      End;

    End;


End; { ReadTextBlock }


{----------------------------------------------------------------------------
  PROCEDURA: SAVE.TEXT.BLOCK

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da salvare e lo registra sul disco. Se esiste un altro file con lo
  stesso nome viene chiesto se lo si vuole sovrascrivere oppure no.
  Il file viene salvato come testo, per cui il colore Š quello di default,
  mentre i caratteri sul video corrispondono a quelli che si avrebbero
  con il comando TYPE del DOS.
 ----------------------------------------------------------------------------}
Procedure SaveTextBlock;

{ Variabili locali }
Var

    { File strutturato per la scrittura }
    FileTXTBLK:  Text;

    { Indica se il file (sempre se esiste) pu• essere o no sovrascritto }
    Sovrascrivi: Boolean;

    { Indice per i cicli }
    I:           Byte;

    { Indice per i cicli }
    J:           Byte;

    { Appoggio per memorizzare una riga }
    St:          String;

Begin { SaveTextBlock }

If DefineCoordBlock
  Then

    Begin

    { Attende in input il nome del file da leggere }
    NameWriteFileTXTBLK := InputFile('[Salva File Testo]','.TXT','*.TXT',
				     SetCarFile);
		       
    { Se Š diverso dalla stringa nulla }
    If (NameWriteFileTXTBLK <> StrNull)
      Then
	Begin

	Sovrascrivi := True;

	{ Assegnazione del file sul disco ad un nome logico }
	Assign(FileTXTBLK,NameWriteFileTXTBLK);

	{ Lettura del file }
	{$I-}  Reset(FileTXTBLK);  {$I+}

	{ Se esiste sul disco viene visualizzata una finestra di dialogo
	  in cui si chiede se il file deve essere sovrascritto o no }
	If (IOResult = 0)
	  Then

	    Begin

	    { Chiusura del file }
	    Close(FileTXTBLK);

	    { Finestra di dialogo per l' utente }
            With Color Do
	      If (Dialog('[AVVERTENZA]',
		         '|'+
		         '               Il file specificato               |'+
		         '( '+NameWriteFileTXTBLK+' )|'+
		         'esiste sul disco.|'+
		         '|'+
		         'Devo sovrascrivo o no ?|','','',
		         __SI_NO__,WarningBord,WarningTitle,
		         WarningText,WarningSel,
		         WarningUnSel,WarningKeySel,
		         WarningKeyUnSel) = 1)

			   Then

			     { Pu• essere sovrascritto }
			     Sovrascrivi := True

	    Else

	      { Non pu• essere sovrascritto }
	      Sovrascrivi := False;

	    End;

	{ Se il file non esiste o se si pu• sovrascrivere ... }
	If Sovrascrivi Then

	  { Se non esiste, invece, viene creato }
	  Begin


	  { Cancellazione del file sul disco }
	  ReWrite(FileTXTBLK);

	  { Messaggio per l' utente }
	  Info(' Scrittura del file '+NameWriteFileTXTBLK+' ...',
	       Color.Performing);
	  Delay(Ritardo.Messaggi);

	  { Scrive il file di testo sul disco }
	  With Block^ Do

	    For i := InizioY To FineY Do

	      Begin

	      St := '';

	      { Compone la stringa carattere per carattere }
	      For j := InizioX To FineX Do
		St := St+Image^[NumPgVideo].Page[i,j].Ch;

	      { La scrive sul file }
	      WriteLn(FileTXTBLK,St);

	      End;

	  { Chiude il file }
	  Close(FileTXTBLK);

	  End;

	End;

    End;

End; { SaveTextBlock }


{----------------------------------------------------------------------------
  PROCEDURA: STORE.CLIPBOARD.BLOCK

  Memorizza il blocco definito dall' utente. Se il blocco non Š stato
  definito viene chiesto in input.
 ----------------------------------------------------------------------------}
Procedure StoreClipBoardBlock;

Begin { StoreClipBoardBlock }

If DefineCoordBlock
  Then
    MemoryBlock := True

Else
  MemoryBlock := False;

End; { StoreClipBoardBlock }


{----------------------------------------------------------------------------
  PROCEDURA: RESTORE.CLIPBOARD.BLOCK

  Ripristina il blocco memorizzato, se c'Š, per copiarlo in qualche zona
  dell' immagina attiva sullo schermo.
 ----------------------------------------------------------------------------}
Procedure RestoreClipBoardBlock;

Begin { RestoreClipBoardBlock }

If MemoryBlock
  Then
    CopyBlock(True);

End; { RestoreClipBoardBlock }


{----------------------------------------------------------------------------
  PROCEDURA: MENU.BLOCCHI

  Disegna un menu da cui Š possibile marcare l' inizio e la fine di un
  blocco, copiarlo, spostarlo, cancellarlo, riempirlo, contornarlo,
  invertirlo (su-gi—, destra-sinistra, colori, ecc.), leggerlo e
  salvarlo sia da/su disco sia da/su memoria, considerandolo come
  un file di tipo blocco o un file di tipo testo.
 ----------------------------------------------------------------------------}
Procedure MenuBlocchi;

Begin { MenuBlocchi }

{ Apre con effetto a scoppio la finestra del menu blocchi }
With Color Do
  Case Menu('[MENU BLOCCHI]',
	    '||'+

	    '               Marca ^Inizio Blocco               |'+
            ' Definisce l'' inizio del blocco|'+

	    'Marca ^Fine Blocco|'+
            ' Definisce la fine del blocco|'+

	    'Definisci ^Blocco|'+
            ' Definisce i limiti del blocco|'+

	    '||'+

	    '^Copia Blocco|'+
            ' Effettua copie multiple di un blocco|',

	    '^Muovi Blocco|'+
            ' Effettua spostamenti di un blocco|'+

	    'C^ancella Blocco|'+
            ' Riempie un blocco di caratteri nulli|'+

	    'Ri^empi Blocco|'+
            ' Riempie un blocco di un certo carattere ASCII|'+

	    'C^ontorna Blocco|'+
            ' Disegna la cornice ad un blocco|',

	    'In^verti Blocco|'+
            ' Inverte in vari modi un blocco|'+

	    '||'+

	    'Le^ggi File Blocco|'+
            ' Legge un blocco da un file su disco|'+

	    '^Salva File Blocco|'+
            ' Salva il blocco definito su disco|'+

	    'Leggi File ^Testo|'+
            ' Legge un blocco da un file di testo su disco|',

	    'Salva Fi^le Testo|'+
            ' Salva il blocco definito su disco come file di testo|'+

	    'Memori^zza Blocco|'+
            ' Memorizza un blocco nella ClipBoard|'+

	    'Ric^hiama Blocco|'+
            ' Richiama il blocco memorizzato nella ClipBoard|'+

	    '||','','','','',
	     MenuTitle,MenuSel,MenuUnSel,
	     MenuBord,MenuText,MenuKeySel,
	     MenuKeyUnSel,SMenuBlock)
       Of

         { Imposta le coordinate di inizio del blocco }
         2: MarkBeginBlock;

         { Imposta le coordinate di fine del blocco }
         3: MarkEndBlock;

         { Imposta le coordinate del blocco }
         4: DefineBlock;

         { Copia un blocco }
         6: CopyBlock(False);

         { Muove un blocco }
         7: MoveBlock;

         { Cancella un blocco sul video }
         8: EraseVideoBlock;

         { Riempie un blocco sul video di un carattere ASCII e di un certo
	   colore scelto dall' utente }
         9: FillVideoBlock;

         { Contorna un blocco sul video utilizzando un certo tipo di
	   cornice (o carattere) del colore scelto }
         10: BordVideoBlock;

         { Inverte (su-gi—, destra-sinistra, colore, ..., un blocco }
         11: InvertVideoBlock;

         { Legge da disco un file-blocco }
         13: ReadBlockFile;

         { Salva su disco un file-blocco }
         14: SaveBlockFile;

         { Legge da un file di testo il blocco }
         15: ReadTextBlock;

         { Salva su un file di testo il blocco }
         16: SaveTextBlock;

         { Memorizza il blocco nella clipboard }
         17: StoreClipBoardBlock;

         { Legge il blocco dalla clipboard }
         18: RestoreClipBoardBlock;

       End; { Case Menu }

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

End; { MenuBlocchi }


End. { TIPBlock }
