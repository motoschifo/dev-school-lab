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
 º       VERSIONE 1.0                          UNIT TIPINDIR                º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}
{ Data:   18 Febbraio 1993
  Ora:    17:19:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorInputDirectoryName }

{ Unit che gestisce l' input da tastiera di un nome di directory. L' utente
  pu• editarlo con l' utilizzo dei tasti Insert, Delete, Left, Right, Home,
  End, ecc.. Per facilitare la ricerca si pu• sfruttare l' elenco delle
  sub-directories del disco corrente. Per passare dall' editing alla
  lista della sub-directory basta premere i tasti TAB o SHIFT-TAB.
  E' possibile utilizzare la ricerca veloce per un file digitandone
  solo una parte (ad esempio le prime 3 lettere) }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Function  InputDirectory ( Title:      String;
			         ExtFiles:   String004;
			         Pezza:      String;
			         Allowed:    SetOfChar ): String; }

{ Nome della unit }
Unit
     TIPInDir;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPMenu }

{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalit… testo }
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
     TIPInFil;


{----------------------------------------------------------------------------
  FUNZIONE: INPUT.DIRECTORY

  Apre una finestra di dialogo in cui Š possibile specificare il nome della
  nuova directory di default.
  In alto si pu• immettere il nome desiderato: se il nome che l' utente
  vuole immettere Š pi— lungo dello spazio riservato, la stringa
  scorrer… verso sinistra, e sar… possibile ritornare indietro con
  i tasti cursore (freccia DESTRA e freccia SINISTRA).
  Con i tasti TAB e SHIFT-TAB si pu• passare dall' editing del
  drive/percorso alla scelta della sub-directory nella lista e
  viceversa. Una volta entrati in questa la si pu• scorrere con i tasti
  freccia GIU' e freccia SU, selezionabile con il tasto RETURN.
  Premendo ESCAPE si annulla la selezione, e il risultato della
  funzione sar… una stringa vuota; viceversa conterr… il nome del file
  digitato o scelto.
  La colonna pi— a destra serve per visualizzare la posizione dell'
  evidenziatore rispetto al resto della lista.
  In basso sono visualizzati il numero di directories totali, il totale della
  dimensione occupata in bytes, lo spazio libero (sempre in bytes) del disco
  corrente e il numero di sub-directory evidenziata.
  Il nome della directory da ricercare Š il nome che si digita per
  una ricerca pi— veloce: uno volta che si Š nella lista della
  directory per sceglierne una, basta digitarla, per esteso o in
  parte, e l' evidenziatore verr… posizionato sul primo nome che
  presenta la stringa digitata o solo le sue iniziali (la cosa Š
  la stessa per le directories o per i files; in Turbo Pascal v7.0 (o 6.0)
  invece si ha un comportamento leggermente diverso).
  In fondo alla finestra, prima dei bytes totali, dello spazio liero e delle
  altre informazioni, Š scritto il path corrente.
  E' inoltre possibile inserire del testo premendo il tasto INSERT.
  Tutto pu• essere effettuato anche con l' ausilio del mouse.
 ----------------------------------------------------------------------------}
Function  InputDirectory ( Title:      String;
			   ExtFiles:   String004;
			   Pezza:      String;
			   Allowed:    SetOfChar ): String;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPBase }


{----------------------------------------------------------------------------
  FUNZIONE: INPUT.DIRECTORY

  Apre una finestra di dialogo in cui Š possibile specificare il nome della
  nuova directory di default.
  In alto si pu• immettere il nome desiderato: se il nome che l' utente
  vuole immettere Š pi— lungo dello spazio riservato, la stringa
  scorrer… verso sinistra, e sar… possibile ritornare indietro con
  i tasti cursore (freccia DESTRA e freccia SINISTRA).
  Con i tasti TAB e SHIFT-TAB si pu• passare dall' editing del
  drive/percorso alla scelta della sub-directory nella lista e
  viceversa. Una volta entrati in questa la si pu• scorrere con i tasti
  freccia GIU' e freccia SU, selezionabile con il tasto RETURN.
  Premendo ESCAPE si annulla la selezione, e il risultato della
  funzione sar… una stringa vuota; viceversa conterr… il nome del file
  digitato o scelto.
  La colonna pi— a destra serve per visualizzare la posizione dell'
  evidenziatore rispetto al resto della lista.
  In basso sono visualizzati il numero di directories totali, il totale della
  dimensione occupata in bytes, lo spazio libero (sempre in bytes) del disco
  corrente e il numero di sub-directory evidenziata.
  Il nome della directory da ricercare Š il nome che si digita per
  una ricerca pi— veloce: uno volta che si Š nella lista della
  directory per sceglierne una, basta digitarla, per esteso o in
  parte, e l' evidenziatore verr… posizionato sul primo nome che
  presenta la stringa digitata o solo le sue iniziali (la cosa Š
  la stessa per le directories o per i files; in Turbo Pascal v7.0 (o 6.0)
  invece si ha un comportamento leggermente diverso).
  In fondo alla finestra, prima dei bytes totali, dello spazio liero e delle
  altre informazioni, Š scritto il path corrente.
  E' inoltre possibile inserire del testo premendo il tasto INSERT.
  Tutto pu• essere effettuato anche con l' ausilio del mouse.
 ----------------------------------------------------------------------------}
Function  InputDirectory ( Title:      String;
			   ExtFiles:   String004;
			   Pezza:      String;
			   Allowed:    SetOfChar ): String;

{ Costanti locali }
Const

      { Lunghezza in caratteri del path visualizzato }
      LungVirt:  Byte= 035;

      { Lunghezza in caratteri del path reale }
      LungReale: Byte= 255;

{ Tipi locali }
Type

     { Posizione del cursore: INPATH Š nella finestra dove si digita il
       drive/percorso/filename; INDIRECTORY Š nella finestra dove si sceglie
       il nome del file con i tasti cursore  }
     PosType= (InPath, InDirectory);

{ Variabili locali }
Var

    { Memorizza la posizione del cursore }
    CursorPos:    PosType;

    { Memorizza la posizione del cursore precedente }
    OldPos:       PosType;

    { Tasto premuto dall' utente }
    Ch1:          Char;

    { Tasto esteso premuto dall' utente }
    Ch2:          Char;

    { Vale TRUE quando Š stato premuto il tasto RETURN o quello di ESCAPE }
    Done:         Boolean;

    { Memorizza il drive/percorso/nomefile immesso }
    Path:         String;

    { Posizione del cursore rispetto alla lista dei files della directory }
    PosD:         Integer;

    { Posizione precedente del cursore rispetto alla lista dei files
      della directory }
    OldPosD:      Integer;

    { Indice per i cicli }
    I:            Byte;

    { Spiazzamento della parte visualizzata rispetto al resto della stringa }
    Spiazzamento: Integer;

    { Stato inserzione (cursore a forma di linea) o di sovrascritura (
      cursore a forma di blocco pieno) }
    Inserisci:    Boolean;

    { Cifra puntata dal cursore }
    Punt:         Integer;

    { Vettore che contiene le informazioni di ciascun file della
      directory }
    DirInfo:      PTRDirsInfo;

    { Numero di files nella directory }
    NumFiles:     Word;

    { Coordinata Y della stringa }
    Y:            Byte;

    { Memorizza la posizione X della stringa da immettere }
    X:            Byte;

    { Memorizza la stringa che restituisce la funzione }
    St:           String;

    { Stringa di appoggio }
    Stt:          String;

    { Numero del file che Š all' inizio della lista visualizzata }
    PosLista:     Integer;

    { Appoggio per contare quanti files sono stati trovati con le stesse
      caratteristiche }
    TotFiles:     Word;

    { Specificazione dei files della directory }
    SpecFile:     String;

    { Appoggio per memorizzare la directory a cui accedere }
    StApp:        String;

    { Indice per i cicli }
    L:            Integer;

    { Ultima posizione del segnalino nella colonna a lato della lista }
    OldPosBar:    Byte;

    { Posizione del segnalino nella colonna a lato della lista }
    PosBar:       Byte;

    { Stringa per la ricerca rapida del file }
    StrSearch:    String012;

    { Il record SerchRec Š un record definito nella unit DOS. E' formato
      dai seguenti campi:

       SearchRec= Record
		  Fill: Array [1..21] Of Byte;
		  Attr: Byte;
		  Time: LongInt;
		  Size: LongInt;
		  Name: String[12];
		  End; ( SearchRec )

    dove FILL non vuole modificato perchŠ Š riservato e gestito dal
    DOS; ATTR Š l' attributo del file; TIME Š l' ora e la data di
    ultimo aggiornamento; SIZE Š la sua lunghezza in bytes; NAME
    Š il nome e l' estensione del file.
    Le costanti di attributo dei files hanno i seguenti valori:

       - Sola lettura (ReadOnly) ............ $01
       - Nascosti (Hidden) .................. $02
       - Files di sistema (SysFile) ......... $04
       - Etichetta di volume (VolumeID) ..... $08
       - Sub-directory (Directory) .......... $10
       - Archivio (Archive) ................. $20
       - Tutti i files (AnyFile) ............ $3F }
    RecInfo:      SearchRec;

    { Appoggio per stabilire gli attributi di un file, e testare se Š
      o no una directory }
    FileDir:      File;

    { Stringa per memorizzare la directory del disco }
    StrDir:       DirStr;

    { Stringa per memorizzare il nome il file }
    StrName:      NameStr;

    { Stringa per memorizzare l' estensione del file }
    StrExt:       ExtStr;

    { Memorizza l' attributo del file, come spiegato in precedenza }
    Attr:         Word;


     {-----------------------------------------------------------------------
       PROCEDURA: GEST.INPUT.PATH

       Attende l' input da tastiera di una stringa. Se la stringa supera la
       lunghezza consentita, si potr… continuare a digitarla continuando a
       scrivere: il testo scorrer… verso destra e sar… possibile rivederlo
       premendo il tasto FRECCIA SINISTRA. Se si ha familiarit… con l'
       ambiente integrato (IDE) del Turbo Pascal versione 6.0 si noter… la
       forte somiglianza.
       Questa procedura Š molto simile alla funzione INPUTSTRING, solo
       che questa volta Š possibile, premendo i tasti TAB o SHIFT-TAB,
       passare dall' immissione alla scelta del file.
       Vengono inoltre disegnate le due frecce ai lati, nel caso in cui la
       stringa fosse pi— lunga del testo visualizzato sul video.
      -----------------------------------------------------------------------}
     Procedure GestInputPath ( Var Path:          String;
			       Var PosCurs:       Integer;
			       Var Spiazzamento:  Integer;
			       Var Inserisci:     Boolean;
				   Ch1:           Char;
				   Ch2:           Char );

     { Variabili locali }
     Var

	 { Indice per i cicli }
	 K:            Byte;

	 { Variabile di appoggio }
	 XX:           Byte;

	 { Variabile di appoggio di tipo stringa }
	 St2:          String;


     Begin { GestInputPath }

     { Posizione Y della stringa }
     y := 2;

     { A seconda del tasto premuto dall' utente }
     Case Ch1 Of

       { Tasto esteso ... }
       kNull: Case Ch2 Of

                { F1: aiuto generale }
	        kF1: Help('Help Generale',Altro);

                { Shift-F1: indice dell' aiuto }
	        kSF1: Help('Indice',Altro);

                { Alt-F1: schermata di aiuto precedente }
                kAF1: Help(LastHelp^[1],Precedente);

                { Ctrl-F1: help specifico }
                kCF1: Help('Immissione percorso',Altro);

		{ Questa Š la condizione di partenza, per cui viene eseguita
		  solo la prima volta, in quanto Š impossibile avere due
		  caratteri nulli insieme }
		kNull: WriteStr(x+2,y,Copy(Path,Spiazzamento,LungVirt),
				Color.MenuSel);

		{ Sinistra: sposta il cursore di una colonna verso sinistra }
		kLeft: If (Punt > 1)
			 Then
			   Begin

			   Dec(Punt);

			   { Controllo del limite sinistro }
			   If (Punt < Spiazzamento)
			     Then
			       Begin

			       Dec(Spiazzamento);
			       WriteStr(2+x,y,Copy(Path,Spiazzamento,
					LungVirt),Color.MenuSel);

			       End;

			   End;

		{ Destra: sposta il cursore verso destra di una colonna }
		kRight: Begin

			{ Controllo del limite destro }
			If (Punt < LungReale)
			  Then
			    If ((Path[Punt+1] <> ShadowChar) Or
			       ((Path[Punt+1] = ShadowChar) And
			       (Path[Punt] <> ShadowChar)))
				 Then

				   { Se c'Š ancora testo scorrilo verso
                                     destra }
				   Begin

				   Inc(Punt);
				   If (Punt >= (LungVirt+Spiazzamento))
				     Then

				       Begin
				       Inc(Spiazzamento);
				       WriteStr(2+x,y,Copy(Path,Spiazzamento,
						LungVirt),Color.MenuSel);
				       End;

				   End;

			End;

		{ Home: sposta il cursore alla prima lettera digitata }
		kHome: Begin

		       Punt := 1;
		       Spiazzamento := Punt;
		       WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),
				Color.MenuSel);

		       End;

		{ End: sposta il cursore all' ultima lettera digitata }
		kEnd: Begin

		      Punt := Length(Path);
		      While (Path[Punt] = ShadowChar) Do
			Dec(Punt);

		      If (Punt < LungReale)
			Then
			  Inc(Punt);

		      Spiazzamento := Punt-LungVirt+1;
		      If (Spiazzamento <= 0)
			Then
			  Spiazzamento := 1;

		      WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),
			       Color.MenuSel);

		      End;

		{ Insert: passa dal modo sovrascrittura (default) a quello
			  di inserimento }
		kInsert: Begin

			 Inserisci := Not Inserisci;

			 { Cursore a linea per l' inserzione }
			 If Inserisci
			   Then
			     LineCursor

			 { Cursore a blocco per la sovrascrittura }
			 Else
			   BlockCursor;

			 End;

		{ Cancel: cancella il carattere puntato dal cursore e sposta
			  il testo rimanente a sinistra di una posizione }
		kCancel: Begin

			 Delete(Path,Punt,1);
			 Path := Path+ShadowChar;
			 WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),
				  Color.MenuSel);

			 End;

		End; { Case Ch2 }

       { Return: accetta la stringa e cambia la directory di default (se Š
		 una directory valida), altrimenti si entra nella lista }
       kReturn: Done := True;

       { Escape: esce senza digitare nessuna stringa }
       kEscape: Done := True;

       { Delete: cancella il carattere a sinistra del cursore e sposta il
                 testo rimanente verso sinistra }
       kDel: If (Punt > 1)
	       Then

		 Begin

		 Dec(Punt);
		 Delete(Path,Punt,1);
		 Path := Path+ShadowChar;

		 If (Spiazzamento > 1)
		   Then
		     Dec(Spiazzamento);

		 WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),
			  Color.MenuSel);

		 End;

       { Qualsiasi altro tasto premuto }
       Else

	 { Se Š nell' insieme dei tasti permessi scrivilo }
	 If Ch1 In Allowed Then

	   Begin

	   { Il cursore si trova sull' ultima posizione: sovrascrive
	     l' ultimo carattere e resta fermo alla stesso punto }
	   If (Punt = LungReale)
	     Then

	       Begin
	       Path[LungReale] := Ch1;

	       If (Punt = (LungVirt+Spiazzamento))
		 Then
		   Inc(Spiazzamento);

               WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),
                        Color.MenuSel);
	       End

	   { Altrimenti aggiorna la stringa con il carattere digitato }
	   Else

	     Begin

	     { Se l' inserzione Š attiva inserisci il carattere }
	     If Inserisci
	       Then

		 Begin
		 Delete(Path,LungReale,1);
		 Insert(Ch1,Path,Punt);

		 If (Punt = (LungVirt+Spiazzamento))
		   Then
		     Inc(Spiazzamento);

		 If (Punt < LungReale)
		   Then
		     Inc(Punt);

		 WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),
			  Color.MenuSel);
		 End

	     { Altrimenti, se la sovrascrittura Š attiva (ossia inserzione
	       non attiva) rimpiazza il carattere puntato con il nuovo
	       appena digitato }
	     Else

	       Begin
	       Delete(Path,Punt,1);
	       Insert(Ch1,Path,Punt);

	       If (Punt = (LungVirt+Spiazzamento))
		 Then
		   Inc(Spiazzamento);

	       If (Punt < LungReale)
		 Then
		   Inc(Punt);

	       WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),
			Color.MenuSel);
	       End;

	     End;

	   End;

       End; { Case Ch1 }

     { Calcolo della posizione della stringa sul video }
     xx := x+(Punt-Spiazzamento);

     { Aggiornamento della posizione del cursore se si trova al limite
       della parte evidenziata }
     If ((Punt-Spiazzamento) = LungVirt)
       Then
	 Begin
	 Dec(xx);

	 If ((Spiazzamento+LungVirt) < LungReale)
	   Then
	     Inc(Spiazzamento);

	 WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),Color.MenuSel);
	 End;

     { Posizionamento del cursore nella giusta locazione }
     GoToXY(2+xx,y);

     { Cursore a linea per l' inserzione }
     If Inserisci
       Then
	 LineCursor

     { Cursore a blocco per la sovrascrittura }
     Else
       BlockCursor;

     { Scrittura, se necessario, della freccia verso sinistra (codice ASCII
       17) per indicare che a sinistra Š presente altro testo }
     If (Spiazzamento > 1)
       Then
	 WriteChar(2+x-1,y,1,#17,Color.FileArrow)

     Else
       WriteChar(2+x-1,y,1,' ',Color.FileArrow);

     { Calcolo della lunghezzza reale della stringa }
     St2 := Path;
     k := Length(St2);

     While (St2[k] = ShadowChar) Do
       Dec(k);
     St2[0] := Chr(k);

     { Scrittura, se necessario, della freccia verso destra (codice ASCII
       16) per indicare che a destra Š presente altro testo }
     If ((Spiazzamento+LungVirt-1) < Length(St2))
       Then
	 WriteChar(2+x+LungVirt,y,1,#16,Color.FileArrow)

     Else
       WriteChar(2+x+LungVirt,y,1,' ',Color.FileArrow);

     { Se Š stato premuto il tasto ESCAPE viene restituita una stringa
       nulla }
     If (Ch1 = kEscape) Then
       Path := kNull;

     End; { GestInputPath }


     {-----------------------------------------------------------------------
       PROCEDURA: WRITE.LINE

       Scrive l' opzione scelta da COORDY con il colore COLORE. Questa
       procedura aggiorna anche il numero di file in fondo alla finestra.
      -----------------------------------------------------------------------}
     Procedure WriteLine ( CoordY: Integer;
			   Colore: Byte );

     { Variabili locali }
     Var

	 { Indice per i cicli }
	 I:      Byte;

	 { Appoggio per l' aggiornamento della barra di posizione }
	 Ch:     Char;

     Begin { WriteLine }

     { Se ci sono files da visualizzare ... }
     If (NumFiles > 0)
       Then
	 Begin

	 { Scrive il nome del file }
	 WriteStr(4,CoordY-PosLista+7,DirInfo^[CoordY].Line,Colore);

	 { Se non c'Š una vecchia posizione della barra a destra significa
	   che deve essere ristampata }
	 If (OldPosBar = 0)
	   Then
	     Begin

	     { Stampa degli spazi }
	     For i := 2 To 9 Do
	       WriteChar(56,i+6,1,' ',Color.DirBar);

	     { Stampa della freccia verso l' alto (codice ASCII 30) }
	     WriteChar(56,7,1,#30,Color.DirArrow);

	     { Stampa della freccia verso il basso (codice ASCII 31) }
	     WriteChar(56,16,1,#31,Color.DirArrow);

	     { La vecchia posizione viene posta uguale a 1, valore iniziale }
	     OldPosBar := 1;

	     { Scrive il carattere }
	     WriteChar(56,8,1,'ß',Color.DirBar);

	     End;

	 { Calcola la nuova posizione }
	 If (NumFiles > 1)
	   Then
	     PosBar := Round(16*(PosD-1)/(NumFiles-1))

	 Else
	   PosBar := 1;

	 { Aggiusta il risultato del calcolo per evitare errori }
	 If (PosBar = 0)
	   Then
	     PosBar := 1;

	 { Aggiorna la posizione, se Š cambiata }
	 If (OldPosBar <> PosBar)
	   Then

             Begin

	     { Decide quale carattere visualizzare: per avere uno scorrimento
	       del puntatore meno 'a scatto', si Š pensato di utilizzare i
               due caratteri 'Ü' e 'ß', invece del solito 'Û'; uno Š utiliz_
               zato quando la posizione Š pari, l' altra quando Š dispari }
	     If ((PosBar Div 2) = (PosBar / 2))
	       Then
		 Ch := 'Ü'

	     Else
	       Ch := 'ß';

	     { Scrive uno spazio per cancellare la vecchia posizione }
	     WriteChar(56,7+Round(OldPosBar/2),1,' ',Color.DirBar);

	     { Scrive il nuovo carattere alla giusta posizione }
	     WriteChar(56,7+Round(PosBar/2),1,Ch,Color.DirBar);

	     End;

	 { Memorizza la posizione del puntatore precedente }
	 OldPosBar := PosBar;

	 End

     Else

       { Altrimenti, se non ci sono cioŠ files da visualizzare,
	 viene lasciata vuota }
       Begin

       { Spazi della barra di posizione }
       For i := 2 To 9 Do
	 WriteChar(56,i+6,1,' ',Color.DirBar);

       { Stampa della freccia verso l' alto (codice ASCII 30) }
       WriteChar(56,7,1,#30,Color.DirArrow);

       { Stampa della freccia verso il basso (codice ASCII 31) }
       WriteChar(56,16,1,#31,Color.DirArrow);

       { La vecchia posizione viene posta uguale a 1, valore iniziale }
       OldPosBar := 1;

       End;

     { Viene aggiornato il numero di files evidenziato }
     Str(PosD:5,St);
     WriteStr(5,20,'Numero Dir:',Color.MenuText);
     WriteStr(19,20,St,Color.DirInfo);

     End; { WriteLine }


     {-----------------------------------------------------------------------
       PROCEDURA: WRITE.DIRECTORY

       Scrive nella zona opportuna la lista delle directories del disco di
       default, leggendo le informazioni memorizzate nel vettore DIRINFO.
       Inoltre aggiorna e sposta opportunamente il puntatore della posizione
       del file rispetto a tutta la lista, visualizzato nella colonna a
       destra.
       Se non vengono trovati sub-directories, scrive 'NO DIRECTORIES'.
       Alla prima chiamata della procedura, dopo avere cioŠ eseguito
       INITFILESVECTOR, scrive il numero di directories totali, la loro
       occupazione in bytes e lo spazio libero del disco specificato
       dal path di ricerca.
      -----------------------------------------------------------------------}
     Procedure WriteDirectory;

     { Variabili locali }
     Var

	{ Indice per i cicli }
	I:         Word;

	{ Appoggio per un elemento del vettore di stringhe }
	StInfo:    String;

	{ Appoggio per le conversioni numero -> stringa }
	St2:       String;

	{ Appoggio per le conversioni numero -> stringa }
	St3:       String;

	{ Appoggio per le conversioni numero -> stringa }
	St4:       String;

	{ Bytes disponibili sul disco }
	BytesFree: LongInt;

     Begin { WriteDirectory }

     { Se ci sono files da visualizzare stampali }
     If (NumFiles > 0)
       Then

	 { Scrive i files che stanno nella zona riservata alla lista }
	 For i := PosLista To PosLista+9 Do

	   Begin

	   { Se il file Š valido leggi i suoi dati dal vettore }
	   If (NumFiles >= i)
	     Then
	       StInfo := DirInfo^[i].Line

	   Else

	     { Altrimenti azzera la stringa }
	     StInfo := '                          '+
		       '                          ';

	   { Stampa la stringa assegnata }
	   WriteStr(4,i-PosLista+7,StInfo,Color.Dir);
	   End

     Else

       Begin

       { Altrimenti, se non ci sono files, azzera la finestra }
       For i := 1 To 10 Do
	 WriteStr(4,i+6,'                          '+
			'                          ',Color.Dir);

       { Scrivi il messsaggio 'No Directories !' }
       WriteStr(4,7,'  No Directories !  ',Color.NoFiles);

       { Converte il numero di directories totali e lo memorizza in ST }
       Str(NumFiles:5,St);

       { Converte il numero di file evidenziato (se non ci sono files Š 0)
	 e lo memorizza in ST2 }
       Str(0:5,St2);

       { ST3 contiene il messaggio '!Errore!' perchŠ non c'Š la dimensione }
       St3 := ' !Errore! ';

       { Calcola il numero di bytes liberi nel disco }
       BytesFree := DiskFree(CurrDrive);

       { Il valore -1 significa che si Š verificato un errore, altrimenti
	 converte e memorizza in ST4 }
       If (BytesFree <> -1)
	 Then
	   Str(BytesFree:10,St4)

       Else

	 { C'Š stato un errore di lettura }
	 St4 := ' !Errore! ';

       { Scrive tutti i parametri con i diversi colori definiti }
       WriteStr(5,20,'Numero Dir:',Color.MenuText);
       WriteStr(19,20,St2,Color.DirInfo);
       WriteStr(27,20,'Bytes Occupati:',Color.MenuText);
       WriteStr(43,20,St3,Color.DirInfo);
       WriteStr(5,21,'Dirs Totali:',Color.MenuText);
       WriteStr(19,21,St,Color.DirInfo);
       WriteStr(27,21,'Bytes Liberi:',Color.MenuText);
       WriteStr(43,21,St4,Color.DirInfo);

       End;

     End; { WriteDirectory }


     {-----------------------------------------------------------------------
       PROCEDURA: INIT.FILES.VECTOR

       Inizializza il contenuto del vettore dei files (DIRINFO), un vettore
       memorizzato nello heap per risparmiare la memoria dedicata ai dati
       del programma. La procedura trova tutte le directories con una
       chiamata ricorsiva. Le directories vengono fatte precedere dai
       caratteri opportuni per ottenere una spece di struttura
       gerarchica.
       Se dovessero esserci troppe directories, le ultime non vengono
       considerate.
       Oltre ad inizializzare il vettore delle directories, procede anche
       alla stampa della lista sul video.
      -----------------------------------------------------------------------}
     Procedure InitFilesVector;

     { Variabili locali }
     Var

	 { Indice per i cicli }
	 I:         Integer;

         { Indice per i cicli }
         J:         Integer;

	 { Appoggio per le conversioni numeriche }
	 St2:       String;

	 { Appoggio per le conversioni numeriche }
	 St3:       String;

	 { Appoggio per le conversioni numeriche }
	 St4:       String;

	 { Memorizza la dimensione totale occupata }
	 TotSize:   LongInt;

	 { Memorizza il numero di bytes disponibili sul disco }
	 BytesFree: LongInt;

         { Lunghezza di un livello }
         Lung:      Byte;


          {------------------------------------------------------------------
            PROCEDURA GET.DIRS

            Questa procedura ricerca tutte le sotto-directories del path
            passato come parametro e memorizza la stringa risultante (cioŠ
            come verr… stampata sullo schermo) e il path in un vettore di
            records nello heap.
           ------------------------------------------------------------------}
          Procedure GetDirs ( Path: PathStr );

          { Variabili locali }
          Var

              { Appoggio per il path di ricerca }
              S:          PathStr;

              { Indice dei cicli }
              I:          Byte;

              { Posizione di un certo carattere in una certa stringa }
              Posiz:      Byte;

              { Posizione di un carattere in una stringa }
              A:          Byte;

              { Appoggio per le conversioni }
              StNumFiles: String005;


               {-------------------------------------------------------------
                 PROCEDURA GET.CHILDREN

                 Chiamando ricorsivamente questa procedura si ottengono tutti
                 i path di livello inferiore al path specificato dalla
                 procedura GETDIRS.
                -------------------------------------------------------------}
               Procedure GetChildren ( Const Path:  PathStr;
                                             Level: Byte );

               { Variabili locali }
               Var

                   { Record predefinito }
                   S: SearchRec;

                   { Indice cicli }
                   I: Byte;

               Begin { GetChildren }

               { Almeno due nomi di directories per il path precedente }
               If (NumFiles <> 2)
                 Then
                   DirInfo^[NumFiles-1].Path := FExpand(Path);

               { Ricerca il primo files che corrisponde alle caratteristiche
                 impostate (directory) }
               FindFirst(Path+'\*.*', Directory, S);

               { Fino a che non si Š verificato un errore di disco }
               While (DosError = 0) Do
                 Begin

                 { Directory valida }
                 If (((S.Attr And Directory) <> 0) And (S.Name[1] <> '.'))
                   Then
                     Begin

                     { Forma la stringa di presentazione }
                     With DirInfo^[NumFiles] Do
                       Begin

                       Line := StrNull;
                       For i := 1 To (Level-1) Do
                         Line := Line+StrLevelNull;
                       Line := Line+StrLevelDirs+S.Name;

                       End;

                     { Calcola la posizione che interessa (intersezione) }
                     Posiz := (Level-1)*LungLevelDir+1;

                     { Se ci sono pi— di 2 directories ... }
                     If (NumFiles <> 2)
                       Then

                         { Aggiusta il carattere di intersezione }
                         With DirInfo^[NumFiles-1] Do
                           If (Line[Posiz] = DirEndChar)
                             Then
                               Line[Posiz] := DirIntersChar;

                     { Sempre oltre 2 directories ... }
                     If (NumFiles <> 2)
                       Then
                         Begin

                         { Aggiusta i vari collegamenti con le altre
                           directory di grado superiore }
                         i := NumFiles;
                         While (DirInfo^[i-1].Line[Posiz] = DirSpcChar) Do
                           Begin
                           DirInfo^[i-1].Line[Posiz] := DirBarChar;
                           Dec(i);
                           End;

                         End;

                   { Aumenta il numero di directories lette ... }
                   Inc(NumFiles);

                   { ... e lo scrive sul video }
                   Str(NumFiles:5,StNumFiles);
                   WriteStr(22,2,StNumFiles,Color.SpecText);

                   { Chiamata ricorsiva }
                   GetChildren(Path+'\'+S.Name,Level+1);
                   End;

                 { Continua con la ricerca della prossima directory }
                 FindNext(S);

                 End;

               End; { GetChildren }


          Begin { GetDirs }

          { Inizializzazioni }
          NumFiles := 1;
          For i := 1 To Length(Path) Do
            Path[i] := UpCase(Path[i]);
          Path := FEXpand(Path);
          DirInfo^[NumFiles].Line := Path;
          DirInfo^[NumFiles].Path := Path;
          Inc(NumFiles);
          S := Path;
          If (S[Length(S)] = '\')
            Then
              Dec(S[0]);

          { Prima chiamata alla procedura }
          GetChildren(S,1);

          { Aggiusta la lista in memoria }
          i := NumFiles;
          For i := 2 To NumFiles Do
            Begin

            { Posizione del carattere di fine }
            A := Pos(DirEndChar,DirInfo^[i-1].Line);
            If (A <> 0)
              Then
                If (DirInfo^[i].Line[A] = DirBarChar)
                  Then
                    DirInfo^[i-1].Line[A] := DirIntersChar;
            End;

          Dec(NumFiles);
          TotFiles := NumFiles;

          End; { GetDirs }


     Begin { InitFilesVector }

     { Inizializza le variabili al valore iniziale }
     OldPosD := 0;
     PosD := 1;
     NumFiles := 0;
     TotSize := 0;
     OldPosBar := 0;
     PosBar := 1;
     HideMouse;
     With Color Do
       Begin
       OpenWindow(26,11,55,15,'[Albero]',SpecTitle,SpecText,WinCornice);
       FillWin(kSpazio,SpecText);
       WriteStr(3,2,'Lettura Directory:      ',SpecText);
       End;

     { Chiamata alla procedura di ricerca delle sub-directories }
     GetDirs('\');

     CloseWindow;

     { Aggiusta le stringhe riempiendole di spazi }
     For i := 1 To NumFiles Do
       With DirInfo^[i] Do

         Begin
         Line := ' '+Line;
         Lung := Length(Line)+1;
         For j := Lung To 52 Do
           Line[j] := ' ';
         Line[0] := #52;
         End;

     { Visualizza la directory sul video }
     WriteDirectory;

     { Aggiorna i parametri in fondo allo schermo, come il numero
       di file in totale ... }
     Str(NumFiles:5,St);

     { ... il numero di file evidenziato ... }
     Str(PosD:5,St2);

     { ... lo spazio occupato dai files ... }
     Str(0:10,St3);

     { ... e lo spazio disponibile sul disco }
     BytesFree := DiskFree(CurrDrive);

     { Il valore -1 significa che c'Š stato un errore di lettura }
     If (BytesFree <> -1)
       Then
	 Str(BytesFree:10,St4)

     Else
       St4 := ' !Errore! ';

     { Scrive questi valori, con le relative descrizioni, sul video,
       nella posizione opportuna }
     WriteStr(5,20,'Numero Dir:',Color.MenuText);
     WriteStr(19,20,St2,Color.DirInfo);
     WriteStr(27,20,'Bytes Occupati:',Color.MenuText);
     WriteStr(43,20,St3,Color.DirInfo);
     WriteStr(5,21,'Dirs Totali:',Color.MenuText);
     WriteStr(19,21,St,Color.DirInfo);
     WriteStr(27,21,'Bytes Liberi:',Color.MenuText);
     WriteStr(43,21,St4,Color.DirInfo);

     End; { InitFilesVector }


     {-----------------------------------------------------------------------
       PROCEDURA: GEST.DIRECTORY

       Gestisce la parte che riguarda la scelta della directory e la sua
       ricerca rapida. L' utente pu• spostare l' evidenziatore con i tasti
       freccia SU e freccia GIU', HOME, END, PAGEUP e PAGEDOWN, oppure
       digitando il nome del file. Questo Š utile per una ricerca
       rapida del file: la zona riservata al nome della directory da
       ricercare visualizza le condizioni che deve avere il file evidenziato.
       Si possono premere i soliti tasti numerici, alfanumerici e gli altri
       che si utilizzano per dare un nome ad un file su disco, e in pi— il
       tasto DEL per cancellare l' ultimo carattere. Il tasto RETURN serve
       per accettare il nome della directory e quindi a spostarsi nel disco.
       Premendo il tasto ESCAPE si esce dall' immissione senza effettuare
       nessuna scelta.
       Con i tasti TAB e SHIFT-TAB ci si sposta tra l' immissione del
       drive/percorso e la scelta della directory nella lista del
       disco.
       Inoltre, a lato Š visualizzata una barra per sapere la posizione
       dell' evidenziatore rispetto al resto della lista.
       Il path corrente Š visualizzato in fondo alla finestra, prima del
       numero di directories totali, dello spazio occupato, di quello libero,
       ecc.
       Come in qualsiasi altra procedura, anche se non specificato, Š
       possibile premere i tasti per il richiamo delle schermate di aiuto
       (F1, ALT-F1, CTRL-F1, SHIFT-F1).
      -----------------------------------------------------------------------}
     Procedure GestDirectory ( Var Path: String;
			       Var PosD: Integer;
				   Ch1:  Char;
				   Ch2:  Char );

     { Variabili locali }
     Var

	 { Indice per i cicli }
	 I:       Integer;

	 { File di ricerca rapida trovato o no }
	 Trovato: Boolean;

	 { Appoggio che memorizza il nome del file puntato }
	 St:      String;

         { Posizione di un carattere particolare }
         Posiz:   Byte;

     Begin { GestDirectory }

     { Test per la pressione di un pulsante del mouse }
     If LeftButton
       Then

         { Pulsante di sinistra: occorre controllare tutte le zone valide }
         Begin

	 If MouseInT(65,8,65,8)
           Then
             Begin
	     Ch1 := kNull;
             Ch2 := kUp;
             End

         Else

           If MouseInT(65,17,65,17)
             Then
               Begin
	       Ch1 := kNull;
               Ch2 := kDown;
               End

         Else

           Begin
           Ch1 := kNull;
           Ch2 := kCPrtScrn;
           End;

         End;

     { A seconda del carattere premuto }
     Case Ch1 Of

       { Carattere esteso }
       kNull: Begin

	      Case Ch2 Of

                { F1: aiuto generale }
	        kF1: Help('Help Generale',Altro);

                { Shift-F1: indice dell' aiuto }
	        kSF1: Help('Indice',Altro);

                { Alt-F1: schermata di aiuto precedente }
                kAF1: Help(LastHelp^[1],Precedente);

                { Ctrl-F1: help specifico }
                kCF1: Help('Cambia directory',Altro);

		{ Situazione iniziale, cioŠ inizializzazione della
		  directory }
		kNull: InitFilesVector;

		{ Su: sposta l' evidenziatore verso l' alto }
		kUp: Dec(PosD);

		{ Gi—: sposta l' evidenziatore verso il basso }
		kDown: Inc(PosD);

		{ PageUp: sposta l' evidenziatore di una pagina verso
			  l' alto }
		kPgUp: Dec(PosD,LinesPage-1);

		{ PageDown: sposta l' evidenziatore di una pagina verso
			    il basso }
		kPgDown: Inc(PosD,LinesPage+1);

		{ Home: sposta l' evidenziatore al primo file della lista }
		kHome: PosD := 1;

		{ End: sposta l' evidenziatore all' ultimo file della lista }
		kEnd: PosD := NumFiles;

		End; { Case Ch2 }

	      { Controllo ed eventuale correzione della posizione }
	      If (PosD < 1)
		Then
		  PosD := 1

	      Else
		If (PosD > NumFiles)
		  Then
		    PosD := NumFiles;

	      End;

       { Return: accetta il file evidenziato o, nel caso di una directory,
		 si sposta nel disco }
       kReturn: Done := True;

       { Escape: annulla ogni scelta ed esce dalla procedura }
       kEscape: Done := True;

       { Un qualsiasi altro tasto viene utilizzato per la ricerca rapida
	 del file }
       Else

	 Begin

	 { Inizializzazione: non Š stato trovato }
	 Trovato := False;

	 { Se la stringa Š nulla allora la posizione Š 1 }
	 If (StrSearch = StrNull)
	   Then
	     PosD := 1;

	 { Se il tasto Š diverso da DEL, viene aggiunto al nome del
	   file di ricerca rapida }
	 If (Ch1 <> kDel)
	   Then
	     Begin

	     { SemprechŠ il file non sia completo (12 caratteri con il
	       punto) }
	     If (Length(StrSearch) < 12)
	       Then
		 StrSearch := StrSearch+UpCase(Ch1);

	     End

	 Else

	   { Se Š stato premuto il tasto DEL viene cancellato l' ultimo
	     carattere del nome del file di ricerca rapida, semprechŠ
	     sia diverso dalla stringa nulla }
	   Begin

	   If (StrSearch <> StrNull)
	     Then
	       Delete(StrSearch,Length(StrSearch),1)

	   End;

	 { Ricerca in tutta la directory il file specificato }
	 For i := NumFiles DownTo 1 Do

           With DirInfo^[i] Do

	     Begin

	     St := Line;

	     { Aggiusta il nome del file e controlla se Š il file cercato }
             Posiz := Pos(StrSearch,St);
	     If (Posiz <> 0)
	       Then
                 If ((Posiz > 1) And (Line[Posiz-1] = 'Ä'))
                    Or (Posiz = 1)
                      Then
                        Begin
	                PosD := i;
	                Trovato := True;
	                End;

	     End;

	 { Se non Š stato trovato nessun file che corrisponde alla
	   descrizione specificata, il nome non viene aggiornato, e
	   il carattere digitato non viene considerato }
	 If Not Trovato Then
	   Delete(StrSearch,Length(StrSearch),1);

	 End;

       End; { Case Ch1 }

     If (Ch1 = kNull)
       Then
	 StrSearch := StrNull;

     { Aggiusta il nome del file di ricerca rapida riempiendolo di
       caratteri ombra (ShadowChar) }
     St := StrSearch;
     While (Length(St) < 12) Do
       St := St+ShadowChar;

     { Lo scrive nella posizione opportuna }
     WriteStr(33,4,St,Color.Search);

     { Se l' evidenziatore Š stato modificato }
     If (OldPosD <> PosD)
       Then

	 Begin

	 { Spostamento verso l' alto e riscrittura delle directory }
	 If (PosD < PosLista)
	   Then

	     Begin
	     PosLista := PosD;
	     WriteDirectory;
	     End

	 Else

	   { Spostamento verso il basso e riscrittura delle directory }
	   If (PosD > PosLista+9)
	     Then

	       Begin
	       PosLista := PosD-9;
	       WriteDirectory;
	       End;

	 { Ripristino del vecchio evidenziatore }
	 If ((OldPosD > 0) And (Abs(OldPosD-PosD) <= 9))
	   Then
	     WriteLine(OldPosD,Color.Dir);

	 { Aggiornamento del nuovo evidenziatore }
	 If (PosD > 0)
	   Then
	     WriteLine(PosD,Color.MenuSel);

	 { Se ci sono files da visualizzare nella directory }
	 If (NumFiles > 0)
	   Then

	     Begin

	     { Aggiusta il nome del file ... }
	     St := DirInfo^[PosD].Path;

	     { ... approssima il nome e lo completa con i caratteri
	       ombra ... }
	     While (Length(St) < LungVirt) Do
	       St := St+ShadowChar;

	     { ... ed infine lo scrive nella posizione opportuna }
	     WriteStr(x+2,y,St,Color.MenuSelUnSel);

	     { Cancella le frecce del nome del file, se ci sono }
	     WriteChar(2+x-1,y,1,' ',Color.FileArrow);
	     WriteChar(2+x+LungVirt,y,1,' ',Color.FileArrow);

	     { Modifica le variabili per l' editing del nome del file }
	     Path := St;
	     Spiazzamento := 1;
	     Punt := 1;

	     End

	 Else

	   { Se non ci sono files da visualizzare ... }
	   Begin

	   { Cambia e ritorna all' editing del path }
	   CursorPos := InPath;
	   Ch1 := kNull;
	   Ch2 := kNull;
	   Punt := 1;
	   Spiazzamento := 1;

	   { Gestione del path }
	   GestInputPath(Path,Punt,Spiazzamento,Inserisci,Ch1,Ch2);

	   End;

	 End;

     End; { GestDirectory }


Begin { InputDirectory }

{ Cambio della directory corrente }
{$I-}
ChDir(CurrDir);
{$I+}

{ Apre una finestra con effetto a scoppio per contenere tutte le
  informazioni riguardanti l' immissione del nome di un file }
ApriQuadro(9,1,71,24,Title,Color.MenuBord,Color.MenuText,Color.MenuTitle,
	   Ritardo.WinStep,Ritardo.Windows);

{ Scrive le stringhe che non variano, cioŠ quelle di indicazione }
WriteStr(4,2,'Drive / Path: ',Color.MenuText);
WriteStr(4,4,'Nome Directory da Cercare: ',Color.MenuText);
WriteStr(4,6,'                STRUTTURA DEL DISCO                 ',
	 Color.MenuText);
WriteStr(4,18,'Percorso corrente:',Color.MenuText);

{ La posizione iniziale Š quella nella zona di digitazione del
  nome del file da leggere }
CursorPos := InPath;

{ Alloca il vettore che contiene le informazioni su ogni file della
  directory }
New(DirInfo);   { 13568 Bytes }

{ Inpostazioni iniziali ed inizializzazione delle variabili }

{ Parte della ricerca rapida di un file }
StrSearch := StrNull;

{ Parte dell' editing del nome del file }
Path := FExpand(StrNull);
Punt := 1;
PosD := 1;
OldPosD := 0;
Spiazzamento := 1;
Inserisci := False;

{ Parte della lista della directory }
PosLista := 1;
OldPosBar := 0;
PosBar := 1;
Ch1 := kNull;
Ch2 := kNull;
SpecFile := '*'+ExtFiles;

{ Uscita dalla procedura SI/NO }
Done := False;

{ Posizione X della stringa da editare sul video }
x := 18;

{ Posizione Y della stringa da editare sul video }
y := 2;

{ Gestione della directory e visualizzazione sul video della lista in
  memoria }
GestDirectory(Path,PosD,Ch1,Ch2);

{ Aggiornamento dell' evidenziatore }
If (PosD > 0)
  Then
    WriteLine(PosD,Color.MenuSelUnSel);

{ La stringa viene inizializzata con il contenuto di pezza }
Path := FExpand(StrNull);

{ La stringa viene riempita di caratteri ombra (ShadowChar) }
Punt := Length(Path)+1;
For i := Punt To 255 Do
  Path[i] := ShadowChar;
Path[0] := Chr(255);

{ Gestione dell' input del nome del file }
GestInputPath(Path,Punt,Spiazzamento,Inserisci,Ch1,Ch2);

{ Scrittura del path correntemente settato }
Stt := FExpand(StrNull);
For i := Length(Stt)+1 To 32 Do
  Stt[i] := ShadowChar;
Stt[0] := #32;
WriteStr(24,18,Stt,Color.Search);

{ Per uscire da questo ciclo occorre premere il tasto ESCAPE o il tasto
  RETURN per confermare un nome di file valido }
Repeat

  { Attende la pressione di un tasto o di un pulsante del mouse }
  Attendi(Ch1,Ch2,SInputDirectory);

  { Memorizza la vecchia posizione nella directory }
  OldPosD := PosD;

  { Il mouse Š stato premuto ? }
  If MousePressed
    Then
      Begin

      { Pulsante sinitro ? }
      If LeftButton
        Then

          { Testare tutte le zone valide }
          Begin

          { Simulazione dei tasti SHIFT-TAB o TAB }
          If ((MouseInT(29,3,64,3) And (CursorPos = InDirectory))
             Or (MouseInT(13,8,64,17) And (CursorPos = InPath)))
               Then
		 Ch1 := kTab

          Else

            { Simulazione di RETURN }
            If (CursorPos = InDirectory)
              Then

                If MouseInT(13,8,64,17)
                  Then
                    Begin
                    Ch1 := kNull;
                    Ch2 := kCPrtScrn;
                    PosD := MouseTextY+PosLista-8;

                    { Controllo della seconda pressione }
                    If (PosD <= NumFiles)
                      Then
                        Begin
                        If (OldPosD = PosD)
                          Then
                            Ch1 := kReturn;
                        End
                    Else
                      PosD := NumFiles;

                    { Rilascio dei pulsanti del mouse }
                    While MousePressed Do
                      GetMPos;

                    End;
          End
      Else

        { Pulsante di destra: simulazione tasto ESCAPE }
        If RightButton
          Then
            Ch1 := kEscape;

      End;

  { Se sono stati premuti i tasti TAB, o SHIFT-TAB ... }
  If ((((Ch1 = kNull) And (Ch2 = kSTab))
     Or (Ch1 = kTab)) And (NumFiles > 0))
       Then

	 Begin

	 { Se si Š nella zona di input del path ... }
	 If (CursorPos = InPath)
	   Then

	     Begin

	     { Si cambia e si va in quella di scelta del file dalla lista
	       visualizzata, tramite un' evidenziatore }
	     CursorPos := InDirectory;

	     { Aggiornamento del path immesso: viene riscritto ma
	       non evidenziato }
             With DirInfo^[PosD] Do
  	       WriteStr(x+2,y,Copy(Path,Spiazzamento,LungVirt),
		        Color.MenuSelUnSel);

	     { Nasconde il cursore }
	     CursorOFF;

	     StrSearch := StrNull;

	     End

	 Else

	   { Altrimenti, se si Š nella zona di scelta del file dalla
	     lista della directory ... }
	   Begin

	   { Cambio alla zona di input del path }
	   CursorPos := InPath;

	   { Aggiornamento dell' evidenziatore: viene evidenziato in
	     modo diverso }
	   If (PosD > 0)
	     Then
	       WriteLine(PosD,Color.MenuSelUnSel);

	   { Aggiornamento del path immesso: viene riscritto ma
	     evidenziato }
           Path := DirInfo^[PosD].Path;

           { La stringa viene riempita di caratteri ombra (ShadowChar) }
           Punt := Length(Path)+1;
           For i := Punt To 255 Do
             Path[i] := ShadowChar;
           Path[0] := Chr(255);
  	   WriteStr(x+2,y,Copy(Path,Spiazzamento,LungVirt),Color.MenuSel);

	   End;

	 { Impostando entrembi i tasti a NULL (codice ASCII 0), viene
	   eseguita l' inizializzazione della procedura di gestione del
	   path o della directory, a seconda di quella che verr… chiamata }
	 Ch1 := kNull;
	 Ch2 := #255;
	 OldPosD := 0;

         While MousePressed Do
           GetMPos;

	 End

  Else

    { Altrimenti, se il tasto non Š TAB o SHIFT-TAB, viene controllato
      ed eseguito il compito specifico }
    Case Ch1 Of

      { Escape: esce dalla procedura senza effettuare scelte }
      kEscape: Done := True;

      { Return: sceglie il file o il path digitato }
      kReturn: Begin

	       { Annulla il nome del file di ricerca rapida }
	       StrSearch := StrNull;

	       { Toglie i caratteri ombra (ShadowChar) dal path }
	       StApp := Path;
	       l := LungReale;

	       While (Path[l] = ShadowChar) Do
		 Dec(l);

	       Path[0] := Chr(l);

	       { Estende il nome del file al path completo }
	       Path := FExpand(Path);

               {$I-}
               ChDir(Path);
               {$I+}

	       { Se non si deve uscire continua  }
               If (IOResult = 0)
                 Then
                   Done := True;

               End;

      End; { Case Ch1 }

  { Se non si Š scelto di uscia dalla funzione ... }
  If (Not Done)
    Then

      { A seconda della posizione del cursore (digita path o scegli
	file dalla lista) }
      Case CursorPos Of

	{ Digitazione del path: gestisce l' immissione da tastiera }
	InPath: GestInputPath(Path,Punt,Spiazzamento,Inserisci,Ch1,Ch2);

	{ Scelta del file dalla directory del disco: gestisce lo scorrimento
	  della lista dei files in memoria e i possibili cambiamenti
	  di directory }
	InDirectory: GestDirectory(Path,PosD,Ch1,Ch2);

	End; { Case Pos }

Until Done;

{ Se Š stato premuto il tasto ESCAPE viene restituita la stringa nulla }
If (Ch1 = kEscape)
  Then
    InputDirectory := StrNull

Else

  { Altrimenti viene restituito il nome del file digitato, completo di
    drive e path }
  Begin

  { Aggiusta il nome del file, memorizzato in ST }
  If (CursorPos = InPath)
    Then
      { Espande il nome al drive/percorso/nome completo }
      St := FExpand(Path)

  Else

    { O lo preleva dall' elemento evidenziato }
    St := DirInfo^[PosD].Path;

  { Aggiusta la directory per essere passata come parametro
    alla procedura CHDIR, togliendo il carattere '\' in fondo
    quando non serve }
  If (St <> StrNull)
    Then

      If (Not (((Copy(St,2,2) = ':\') Or (St[2] = ':'))
	 And (Length(St) <= 3))) And ((Length(St) > 3)
         And (St[Length(St)] = '\'))

	   Then
	     Delete(St,Length(St),1);


  InputDirectory := St;

  End;

{ Libera la memoria allocata per la lista della directory }
Dispose(DirInfo);  { 13568 Bytes }

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Ripristina il contenuto dello schermo }
Fisico^ := Image^[NumPgVideo].Page;

End; { InputDirectory }


End. { TIPInDir }
