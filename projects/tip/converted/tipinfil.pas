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
 ║       VERSIONE 1.0                          UNIT TIPINFIL                ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   18 Febbraio 1993
  Ora:    16:42:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorInputFileName }

{ Unit che gestisce l' input da tastiera di un nome di file. L' utente può
  editarlo con l' utilizzo dei tasti Insert, Delete, Left, Right, Home,
  End, ecc.. Per facilitare la ricerca si può sfruttare l' elenco dei
  files della directory appena sotto. Per passare dall' editing alla
  lista della directory basta premere i tasti TAB o SHIFT-TAB.
  E' possibile utilizzare la ricerca veloce per un file digitandone
  solo una parte (ad esempio le prime 3 lettere) }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Function  InputFile ( Title:      String;
		            ExtFiles:   String004;
		            Pezza:      String;
		            Allowed:    SetOfChar ): String; }

{ Nome della unit }
Unit
     TIPInFil;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPMenu }

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

     { Gestione dei menu a comparsa }
     TIPMenu,

     { Input di una stringa con comandi di editing }
     TIPInStr;


{----------------------------------------------------------------------------
  FUNZIONE: INPUT.FILE

  Apre una finestra di dialogo in cui è possibile specificare il nome del
  file da leggere, salvare o altro.
  In alto si può immettere il nome del file desiderato: se il nome che
  l' utente vuole immettere è più lungo dello spazio riservato, la stringa
  scorrerà verso sinistra, e sarà possibile ritornare indietro con
  i tasti cursore (freccia DESTRA e freccia SINISTRA).
  Con i tasti TAB e SHIFT-TAB si può passare dall' editing del
  percorso/nomefile alla scelta del file nella lista della directory e
  viceversa. Una volta entrati in questa la si può scorrere con i tasti
  freccia GIU' e freccia SU, selezionabile con il tasto RETURN.
  Premendo ESCAPE si annulla la selezione, e il risultato della
  funzione sarà una stringa vuota; viceversa conterrà il nome del file
  digitato o scelto.
  La colonna più a destra serve per visualizzare la posizione dell'
  evidenziatore rispetto al resto della lista.
  In basso sono visualizzati il numero di files totali, il totale della
  dimensione occupata in bytes, lo spazio libero (sempre in bytes) del disco
  corrente e il numero di file evidenziato.
  Il nome del file da ricercare è il nome del file che si digita per
  una più veloce ricerca: uno volta che si è nella lista della
  directory per scegliere un file, basta digitarlo, per esteso o in
  parte, e l' evidenziatore verrà posizionato sul primo file che
  presenta il nome digitato o solo le sue iniziali (la cosa è
  la stessa per le directories o per i files; in Turbo Pascal v7.0 (o 6.0)
  invece si ha un comportamento leggermente diverso).
  In fondo alla finestra, prima dei bytes totali, dello spazio liero e delle
  altre informazioni, è scritto il path corrente.
  E' inoltre possibile inserire del testo premendo il tasto INSERT.
  Tutto può essere effettuato anche con l' ausilio del mouse.
 ----------------------------------------------------------------------------}
Function  InputFile ( Title:      String;
		      ExtFiles:   String004;
		      Pezza:      String;
		      Allowed:    SetOfChar ): String;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPBase }


{----------------------------------------------------------------------------
  FUNZIONE: INPUT.FILE

  Apre una finestra di dialogo in cui è possibile specificare il nome del
  file da leggere, salvare o altro.
  In alto si può immettere il nome del file desiderato: se il nome che
  l' utente vuole immettere è più lungo dello spazio riservato, la stringa
  scorrerà verso sinistra, e sarà possibile ritornare indietro con
  i tasti cursore (freccia DESTRA e freccia SINISTRA).
  Con i tasti TAB e SHIFT-TAB si può passare dall' editing del
  percorso/nomefile alla scelta del file nella lista della directory e
  viceversa. Una volta entrati in questa la si può scorrere con i tasti
  freccia GIU' e freccia SU, selezionabile con il tasto RETURN.
  Premendo ESCAPE si annulla la selezione, e il risultato della
  funzione sarà una stringa vuota; viceversa conterrà il nome del file
  digitato o scelto.
  La colonna più a destra serve per visualizzare la posizione dell'
  evidenziatore rispetto al resto della lista.
  In basso sono visualizzati il numero di files totali, il totale della
  dimensione occupata in bytes, lo spazio libero (sempre in bytes) del disco
  corrente e il numero di file evidenziato.
  Il nome del file da ricercare è il nome del file che si digita per
  una più veloce ricerca: uno volta che si è nella lista della
  directory per scegliere un file, basta digitarlo, per esteso o in
  parte, e l' evidenziatore verrà posizionato sul primo file che
  presenta il nome digitato o solo le sue iniziali (la cosa è
  la stessa per le directories o per i files; in Turbo Pascal v7.0 (o 6.0)
  invece si ha un comportamento leggermente diverso).
  In fondo alla finestra, prima dei bytes totali, dello spazio liero e delle
  altre informazioni, è scritto il path corrente.
  E' inoltre possibile inserire del testo premendo il tasto INSERT.
  Tutto può essere effettuato anche con l' ausilio del mouse.
 ----------------------------------------------------------------------------}
Function  InputFile ( Title:      String;
		      ExtFiles:   String004;
		      Pezza:      String;
		      Allowed:    SetOfChar ): String;

{ Etichetta per un salto incondizionato }
Label Controllo;

{ Costanti locali }
Const

      { Lunghezza in caratteri del path visualizzato }
      LungVirt:  Byte= 036;

      { Lunghezza in caratteri del path reale }
      LungReale: Byte= 255;

{ Tipi locali }
Type

     { Posizione del cursore: INPATH è nella finestra dove si digita il
       drive/percorso/filename; INDIRECTORY è nella finestra dove si sceglie
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

    { Vale TRUE quando è stato premuto il tasto RETURN o quello di ESCAPE }
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
    DirInfo:      PTRDirInfo;

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

    { Numero del file che è all' inizio della lista visualizzata }
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

    { Il record SerchRec è un record definito nella unit DOS. E' formato
      dai seguenti campi:

       SearchRec= Record
		  Fill: Array [1..21] Of Byte;
		  Attr: Byte;
		  Time: LongInt;
		  Size: LongInt;
		  Name: String[12];
		  End; ( SearchRec )

    dove FILL non vuole modificato perchè è riservato e gestito dal
    DOS; ATTR è l' attributo del file; TIME è l' ora e la data di
    ultimo aggiornamento; SIZE è la sua lunghezza in bytes; NAME
    è il nome e l' estensione del file.
    Le costanti di attributo dei files hanno i seguenti valori:

       - Sola lettura (ReadOnly) ............ $01
       - Nascosti (Hidden) .................. $02
       - Files di sistema (SysFile) ......... $04
       - Etichetta di volume (VolumeID) ..... $08
       - Sub-directory (Directory) .......... $10
       - Archivio (Archive) ................. $20
       - Tutti i files (AnyFile) ............ $3F }
    RecInfo:      SearchRec;

    { Appoggio per stabilire gli attributi di un file, e testare se è
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
       PROCEDURA: ORDINA.DIRECTORY

       Ordina il vettore di stringhe DIRINFO secondo il nome e l' estensione
       del file: a parità di questi secondo la lunghezza del file,
       la data e l' ora dell' ultimo aggiornamento e il tipo di
       attributo. Dato che per le directories si sono utilizzati i
       caratteri di freccia su (codice ASCII 30) e freccia giù (codice
       ASCII 31), verranno all' inizio della lista.
       Il tipo di ordinamento usato è il bubble-sort, il più semplice e
       il più diffuso. Non si sono utilizzati invece ordinamenti come
       il quick-sort, un metodo di ordinamento molto veloce, o il
       merge-sort (più veloce), per motivi di insufficiente memoria di
       heap (la ricorsione è infatti molto pericolosa a tale proposito).
       Descrivo comunque sommariamente i metodi accennati:

       - Bubble-Sort: ordina la lista di nomi confrontando il primo con
		      il secondo, il secondo con il terzo, ecc. Ad ogni
		      scansione di tutti i nomi, il primo elemento è
		      senz' altro il più piccolo. Quindi, per effettuare
		      il vero e proprio ordinamento, occorre far eseguire
		      queste operazioni N volte, dove N è il numero
		      di stringhe da ordinare.

       - Quick-Sort: utilizza la tecnica della ricorsione, suddividendo il
		     problema in sottoproblemi successivi. Se, ad esempio,
		     si deve ordinare una lista di 10 stringhe, la procedura
		     esegue l' ordinamento di due liste da 5 elementi, poi
		     quello di liste da 2 e 3 elementi e in seguito da 1 e 2.
		     Una volta giunti a quelle di uno, l' elemento è
		     ordinato; passati a quelle di due, basta stabilire quale
		     è il più grande e così via.

       - Merge-Sort: è più veloce ma vuole un vettore di appoggio delle
		     stesse dimensioni, e quindi uno spreco inutile di
		     memoria.

       VET è il vettore da ordinare, INF è l' estremo inferiore e SUP è
       quello superiore. La chiamata originaria sarà quindi

       ORDINADIRECTORY ( DIRINFO^, 1, NUMFILES ),

       dove DIRINFO^ è il puntatore all' array delle stringhe, memorizzate
       nello heap; 1 è il primo elemento e NUMFILES è il numero di files
       della directory scelta.

       Non serve capire a fondo l' algoritmo, in quanto questo è uno di
       quei programmi per l' ordinamento che bisogna 'prendere così come
       sono': vengono imparati e memorizzati; quando capiterà di
       doverli riutilizzare in altri programmi basta copiare le parti
       necessarie per il funzionamento della procedura.
      -----------------------------------------------------------------------}
     Procedure OrdinaDirectory ( Var Vet: PTRDirInfo;
				     Inf: Word;
				     Sup: Word );


	  {------------------------------------------------------------------
	    PROCEDURA: SCAMBIA

	    Questa procedura serve per scambiare il contenuto delle due
	    stringhe passate come parametri.
	   ------------------------------------------------------------------}
	  Procedure Scambia( Var Elem1: String052;
			     Var Elem2: String052 );

	  { Variabili locali }
	  Var

	      { Elemento di appoggio per lo scambio }
	      Elem3: String052;

	  Begin { Scambia }

	  { Scambio dei contenuti }
	  Elem3 := Elem2;
	  Elem2 := Elem1;
	  Elem1 := Elem3;

	  End; { Scambia }


     { Variabili locali }
     Var

	 { Indice per i cicli }
	 I: Integer;

	 { Indice per i cicli }
	 J: Integer;

         { Appoggio per le conversioni }
         StFiles: String005;

     Begin { OrdinaDirectory }

     { Ciclo più esterno }
     For i := Inf To Sup Do

       Begin

       { Ciclo più interno }
       For j := i To Sup Do

	 { Se l' ordine degli elementi è sbagliato ... }
	 If (Vet^[i] > Vet^[j])

	   Then

	     { ... scambia i due elementi }
	     Scambia(Vet^[i],Vet^[j]);

       Str(i:5,StFiles);
       WriteStr(21,2,StFiles,Color.SpecText);

       End;

     End; { OrdinaDirectory }


     {-----------------------------------------------------------------------
       PROCEDURA: GEST.INPUT.PATH

       Attende l' input da tastiera di una stringa. Se la stringa supera la
       lunghezza consentita, si potrà continuare a digitarla continuando a
       scrivere: il testo scorrerà verso destra e sarà possibile rivederlo
       premendo il tasto FRECCIA SINISTRA. Se si ha familiarità con l'
       ambiente integrato (IDE) del Turbo Pascal versione 6.0 si noterà la
       forte somiglianza.
       Questa procedura è molto simile alla funzione INPUTSTRING, solo
       che questa volta è possibile, premendo i tasti TAB o SHIFT-TAB,
       passare dall' immissione alla scelta del file.
       Vengono inoltre disegnate le due frecce ai lati, nel caso in cui la
       stringa fosse più lunga del testo visualizzato sul video.
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
                kCF1: Help('Immissione nome file',Altro);

		{ Questa è la condizione di partenza, per cui viene eseguita
		  solo la prima volta, in quanto è impossibile avere due
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

				   { Se c'è ancora testo scorrilo verso
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

       { Return: accetta la stringa ed esce }
       kReturn: Done := True;

       { Escape: esce senza digitare nessuna stringa }
       kEscape: Done := True;

       { Delete: cancella il carattere a sinistra del cursore e sposta
                 il testo rimanente verso sinistra }
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

	 { Se è nell' insieme dei tasti permessi scrivilo }
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

	       WriteStr(2+x,y,Copy(Path,Spiazzamento,LungVirt),Color.MenuSel);
	       End

	   { Altrimenti aggiorna la stringa con il carattere digitato }
	   Else

	     Begin

	     { Se l' inserzione è attiva inserisci il carattere }
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

	     { Altrimenti, se la sovrascrittura è attiva (ossia inserzione
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
       17) per indicare che a sinistra è presente altro testo }
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
       16) per indicare che a destra è presente altro testo }
     If ((Spiazzamento+LungVirt-1) < Length(St2))
       Then
	 WriteChar(2+x+LungVirt,y,1,#16,Color.FileArrow)

     Else
       WriteChar(2+x+LungVirt,y,1,' ',Color.FileArrow);

     { Se è stato premuto il tasto ESCAPE viene restituita una stringa
       nulla }
     If (Ch1 = kEscape) Then
       Path := kNull

     Else

       { Altrimenti, se è stato premuto il tasto RETURN viene restituito
	 il nome del file digitato oppure si passa alla scelta del
	 nome del file nella lista della directory }
       If (Ch1 = kReturn)
	 Then
	   Begin

	   { Calcolo della stringa reale, senza i caratteri ShadowChar }
	   k := Length(Path);
	   While (Path[k] = ShadowChar) Do
	     Dec(k);
	   Path[0] := Chr(k);

	   { Passaggio dal path alla directory o viceversa }
	   If (CursorPos = InPath)
	     Then
	       CursorPos := InDirectory

	   Else
	     CursorPos := InPath;

	   End;

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
	 WriteStr(4,CoordY-PosLista+7,DirInfo^[CoordY],Colore);

	 { Se non c'è una vecchia posizione della barra a destra significa
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
	     WriteChar(56,8,1,'▀',Color.DirBar);

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

	 { Aggiorna la posizione, se è cambiata }
	 If (OldPosBar <> PosBar)
	   Then

             Begin

	     { Decide quale carattere visualizzare: per avere uno scorrimento
	       del puntatore meno 'a scatto', si è pensato di utilizzare i
               due caratteri '▄' e '▀', invece del solito '█'; uno è utiliz_
               zato quando la posizione è pari, l' altra quando è dispari }
	     If ((PosBar Div 2) = (PosBar / 2))
	       Then
		 Ch := '▄'

	     Else
	       Ch := '▀';

	     { Scrive uno spazio per cancellare la vecchia posizione }
	     WriteChar(56,7+Round(OldPosBar/2),1,' ',Color.DirBar);

	     { Scrive il nuovo carattere alla giusta posizione }
	     WriteChar(56,7+Round(PosBar/2),1,Ch,Color.DirBar);

	     End;

	 { Memorizza la posizione del puntatore precedente }
	 OldPosBar := PosBar;

	 End

     Else

       { Altrimenti, se non ci sono cioè files da visualizzare,
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
     WriteStr(5,20,'Numero File:',Color.MenuText);
     WriteStr(19,20,St,Color.DirInfo);

     End; { WriteLine }


     {-----------------------------------------------------------------------
       PROCEDURA: WRITE.DIRECTORY

       Scrive nella zona opportuna la lista dei files della directory
       scelta, leggendo le informazioni memorizzate nel vettore DIRINFO.
       Inoltre aggiorna e sposta opportunamente il puntatore della posizione
       del file rispetto a tutta la lista, visualizzato nella colonna a
       destra.
       Se non vengono trovati files, scrive 'NO FILES'.
       Alla prima chiamata della procedura, dopo avere cioè eseguito
       INITFILESVECTOR, scrive il numero di files totali, la loro
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

	   { Se il file è valido leggi i suoi dati dal vettore }
	   If (NumFiles >= i)
	     Then
	       StInfo := DirInfo^[i]

	   Else

	     { Altrimenti azzera la stringa }
	     StInfo := '                          '+
		       '                          ';

	   { Atampa la stringa assegnata }
	   WriteStr(4,i-PosLista+7,StInfo,Color.Dir);
	   End

     Else

       Begin

       { Altrimenti, se non ci sono files, azzera la finestra }
       For i := 1 To 10 Do
	 WriteStr(4,i+6,'                          '+
			'                          ',Color.Dir);

       { Scrivi il messsaggio 'No Files !' }
       WriteStr(4,7,'  No Files !  ',Color.NoFiles);

       { Converte il numero di files totali e lo memorizza in ST }
       Str(NumFiles:5,St);

       { Converte il numero di file evidenziato (se non ci sono files è 0)
	 e lo memorizza in ST2 }
       Str(0:5,St2);

       { ST3 contiene il messaggio '!Errore!' perchè non c'è la dimensione }
       St3 := ' !Errore! ';

       { Calcola il numero di bytes liberi nel disco }
       BytesFree := DiskFree(CurrDrive);

       { Il valore -1 significa che si è verificato un errore, altrimenti
	 converte e memorizza in ST4 }
       If (BytesFree <> -1)
	 Then
	   Str(BytesFree:10,St4)

       Else

	 { C'è stato un errore di lettura }
	 St4 := ' !Errore! ';

       { Scrive tutti i parametri con i diversi colori definiti }
       WriteStr(5,20,'Numero File:',Color.MenuText);
       WriteStr(19,20,St2,Color.DirInfo);
       WriteStr(27,20,'Bytes Occupati:',Color.MenuText);
       WriteStr(43,20,St3,Color.DirInfo);
       WriteStr(5,21,'Files Totali:',Color.MenuText);
       WriteStr(19,21,St,Color.DirInfo);
       WriteStr(27,21,'Bytes Liberi:',Color.MenuText);
       WriteStr(43,21,St4,Color.DirInfo);

       End;

     End; { WriteDirectory }


     {-----------------------------------------------------------------------
       PROCEDURA: INIT.FILES.VECTOR

       Inizializza il contenuto del vettore dei files (DIRINFO), un vettore
       memorizzato nello heap per risparmiare la memoria dedicata ai dati
       del programma. La procedura trova tutte le directories (tranne quella
       '.' che non serve). Le directories vengono fatte precedere dal
       carattere freccia su (codice ASCII 30) o freccia giù (codice ASCII
       31), a seconda che si tratti della directory madre ('..') o di una
       qualsiasi figlia (sottodirectory). Poi ricerca tutti i files
       specificati in SPECFILE che non abbiano l' attributo di directory.
       Se dovessero esserci troppi file, gli ultimi non vengono considerati.
       Oltre ad inizializzare il vettore dei files, procede anche all'
       ordinamento e alla stampa della lista.
      -----------------------------------------------------------------------}
     Procedure InitFilesVector;

     { Variabili locali }
     Var

	 { Indice per i cicli }
	 I:          Integer;

	 { Appoggio per le conversioni numeriche }
	 St2:        String;

	 { Appoggio per le conversioni numeriche }
	 St3:        String;

	 { Appoggio per le conversioni numeriche }
	 St4:        String;

	 { Memorizza la dimensione totale occupata }
	 TotSize:    LongInt;

	 { Memorizza il numero di bytes disponibili sul disco }
	 BytesFree:  LongInt;

         { Appoggio per le conversioni }
         StNumFiles: String005;


	  {------------------------------------------------------------------
	    FUNZIONE: TRASFORMA

	    Questa funzione trasforma il record RESSR, di tipo SearchRec,
	    che contiene tutte le informazioni riguardanti un file (nome,
	    estensione, attributi, lunghezza, data e ora di ultimo
	    aggiornamento) in una stringa di lunghezza pari a 52 caratteri
	    che rappresenta un file sul video (i dati presenti in essa sono
	    gli stessi ma in formato stringa e non interi).
	    Il risultato della funzione è appunto la stringa calcolata.
	   ------------------------------------------------------------------}
	  Function  Trasforma ( Var RecSR: SearchRec ): String052;

	  { Variabili locali }
	  Var

	      { Record DateTime, che contiene i seguenti campi:

		 DateTime = Record
			      Year:  Word;
			      Month: Word;
			      Day:   Word;
			      Hour:  Word;
			      Min:   Word;
			      Sec:   Word;
			      End; (DateTime)

		 Il record è utilizzato da PackTime e da UnPackTime per
		 codificare e decodificare la data e l' ora di ultimo
		 aggiornamento del file }
	      RecDT: DateTime;

	  Begin { Trasforma }

	  { Definisce il nome (caratteri 2..12) }
	  If (RecSR.Name = '..')
	    Then
	      St := '..          '

	  Else

	    Begin

	    { Se è presente il carattere '.' significa che c'è anche
	      l' estensione }
	    If (Pos('.',RecSR.Name) <> 0)
	      Then

		Begin

		{ Copia il nome del file }
		St := Copy(RecSR.Name,1,Pos('.',RecSR.Name)-1);

		{ Aggiusta la sua lunghezza a 8 caratteri (2..9) }
		While (Length(St) < 9) Do
		  St := St+' ';

		{ Copia l' estensione }
		St := St+Copy(RecSR.Name,Pos('.',RecSR.Name)+1,3);

		{ Aggiusta la sua lunghezza a 3 caratteri (10..12) }
		While (Length(St) < 12) Do
		  St := St+' ';

		End

	    Else

	      Begin

	      { Altrimenti c'è solo il nome, senza estensione }
	      St := RecSR.Name;

	      { Porta la lunghezza a 11 caratteri (2..12) }
	      While (Length(St) < 12) Do
		St := St+' ';

	      End;

	    End;

	  { Converte la lunghezza del file in stringa }
	  Str(RecSR.Size:10,St2);

	  { Aggiorna ST, la stringa che conterrà il risultato che dovrà
	    restituire la funzione }
	  St := St+St2+' ';

	  { Decodifica la data e l' ora }
	  UnPackTime(RecSR.Time,RecDT);

	  { Converte l' ora, i minuti, i secondi, il numero del giorno,
	    del mese e dell' anno in stringa, aggiornando ST }
	  With RecDT Do
	    Begin

	    { Ora }
	    Str(Hour:2,St2);
	    If (St2[1] = ' ')
	      Then
		St2[1] := '0';

	    { Carattere separatore }
	    St := St+St2+':';

	    { Minuti }
	    Str(Min:2,St2);
	    If (St2[1] = ' ')
	      Then
		St2[1] := '0';

	    { Carattere separatore }
	    St := St+St2+':';

	    { Secondi }
	    Str(Sec:2,St2);
	    If (St2[1] = ' ')
	      Then
		St2[1] := '0';

	    { Carattere separatore }
	    St := St+St2+' ';

	    { Giorno }
	    Str(Day:2,St2);
	    If (St2[1] = ' ')
	      Then
		St2[1] := '0';

	    { Carattere separatore }
	    St := St+St2+'-';

	    { Mese }
	    Str(Month:2,St2);
	    If (St2[1] = ' ')
	      Then
		St2[1] := '0';

	    { Carattere separatore }
	    St := St+St2+'-';

	    { Anno }
	    Str(Year:2,St2);
	    If (St2[1] = ' ')
	      Then
		St2[1] := '0';

	    { Carattere separatore }
	    St := St+St2+' ';

	    End;

	  { Converte gli attributi }
	  With RecSR Do

	    Begin

	    { Nessun attributo }
	    St2 := '-------';

	    { Archivio }
	    If ((Attr And Archive)   > 0)
	      Then
		St2[2] := 'A';

	    { Nascosto }
	    If ((Attr And Hidden)    > 0)
	      Then
		St2[4] := 'H';

	    { Sola lettura }
	    If ((Attr And ReadOnly)  > 0)
	      Then
		St2[5] := 'R';

	    { File di sistema }
	    If ((Attr And SysFile)   > 0)
	      Then
		St2[6] := 'S';

	    { Directory }
	    If ((Attr And Directory) > 0)
	      Then
		St2    := ' <DIR> ';

	    { Volume del disco }
	    If ((Attr And VolumeID)  > 0)
	      Then
		St2    := ' <VOL> ';

	    End;

	  { Aggiusta la stringa }
	  St := St+St2;
	  St := ' '+St+' ';

	  { Restituisce il risultato }
	  Trasforma := St;

	  End; { Trasforma }


     Begin { InitFilesVector }

     { Inizializza le variabili al valore iniziale }
     OldPosD := 0;
     PosD := 1;
     NumFiles := 0;
     TotSize := 0;
     OldPosBar := 0;
     PosBar := 1;

     { Apre la finestra del numero progressivo di files letti }
     HideMouse;
     With Color Do
       Begin
       OpenWindow(26,11,54,15,'[Files]',SpecTitle,SpecText,WinCornice);
       FillWin(kSpazio,SpecText);
       WriteStr(3,2,'Lettura del File:      ',SpecText);
       End;

     { Ricerca tutte le sotto-directories }
     FindFirst('*.*',Directory,RecInfo);

     { Continua la ricerca }
     While ((DosError = 0) And (NumFiles < MaxDirFiles)) Do

       Begin

       { Se il file è una directory e non è quella punto (corrente, '.')
	 aggiorna il vettore dei files }
       If ((RecInfo.Name <> '.') And ((RecInfo.Attr And Directory) > 0))
	 Then
	   Begin

	   { Aggiorna la dimensione totale occupata dai files: è
	     inutile in quanto le directories non hanno dimensione }
	   Inc(TotSize,RecInfo.Size);

	   { Aggiorna il numero di files della directory }
	   Inc(NumFiles);

           Str(NumFiles:5,StNumFiles);
           WriteStr(21,2,StNumFiles,Color.SpecText);

	   { Aggiorna l' elemento corrente del vettore }
	   DirInfo^[NumFiles] := Trasforma(RecInfo);

	   { Aggiunge il carattere freccia in su (codice ASCII 30) se
	     la directory è quella immediatamente sopra ('..') }
	   If (Copy(DirInfo^[NumFiles],2,2) = '..')
	     Then
	       DirInfo^[NumFiles,1] := #30

	   Else

	     { Altrimenti aggiunge il carattere freccia in giù (codice
	       ASCII 31) }
	     DirInfo^[NumFiles,1] := #31;

	   End;

       { Prosegue con la ricerca del prossimo file }
       FindNext(RecInfo);

       End;

     { Ora ricerca del primo file con le specifiche desiderate }
     FindFirst(SpecFile,AllFiles,RecInfo);

     { Continua la ricerca con gli altri files }
     While ((DosError = 0) And (NumFiles < MaxDirFiles)) Do

       Begin

       If (Not ((RecInfo.Attr And Directory) > 0))
	 Then

	   Begin

	   { Aggiorna la dimensione occupata in totale }
	   Inc(TotSize,RecInfo.Size);

	   { Aggiorna il numero di files totale }
	   Inc(NumFiles);

           Str(NumFiles:5,StNumFiles);
           WriteStr(21,2,StNumFiles,Color.SpecText);

	   { Aggiorna l' elemento corrente }
	   DirInfo^[NumFiles] := Trasforma(RecInfo);

	   End;

       { Ricerca del prossimo file }
       FindNext(RecInfo);

       End;

     CloseWindow;

     { Apre la finestra del numero progressivo di files ordinati }
     With Color Do
       Begin
       OpenWindow(26,11,55,15,'[Sort]',SpecTitle,SpecText,WinCornice);
       FillWin(kSpazio,SpecText);
       WriteStr(3,2,'Ordinamento File:      ',SpecText);
       End;

     { Ordina, con metodo quick-sort, la lista in memoria }
     OrdinaDirectory(DirInfo,1,NumFiles);

     CloseWindow;

     { Visualizza la directory sul video }
     WriteDirectory;

     { Aggiorna i parametri in fondo allo schermo, come il numero
       di file in totale ... }
     Str(NumFiles:5,St);

     { ... il numero di file evidenziato ... }
     Str(PosD:5,St2);

     { ... lo spazio occupato dai files ... }
     Str(TotSize:10,St3);

     { ... e lo spazio disponibile sul disco }
     BytesFree := DiskFree(CurrDrive);

     { Il valore -1 significa che c'è stato un errore di lettura }
     If (BytesFree <> -1)
       Then
	 Str(BytesFree:10,St4)

     Else
       St4 := ' !Errore! ';

     { Scrive questi valori, con le relative descrizioni, sul video,
       nella posizione opportuna }
     WriteStr(5,20,'Numero File:',Color.MenuText);
     WriteStr(19,20,St2,Color.DirInfo);
     WriteStr(27,20,'Bytes Occupati:',Color.MenuText);
     WriteStr(43,20,St3,Color.DirInfo);
     WriteStr(5,21,'Files Totali:',Color.MenuText);
     WriteStr(19,21,St,Color.DirInfo);
     WriteStr(27,21,'Bytes Liberi:',Color.MenuText);
     WriteStr(43,21,St4,Color.DirInfo);

     End; { InitFilesVector }


     {-----------------------------------------------------------------------
       PROCEDURA: GEST.DIRECTORY

       Gestisce la parte che riguarda la scelta del file e la sua ricerca
       nella zona della directory. L' utente può spostare l' evidenziatore
       con i tasti freccia SU e freccia GIU', HOME, END, PAGEUP e PAGEDOWN,
       oppure digitando il nome del file. Questo è utile per una ricerca
       rapida del file: la zona riservata al nome del file da ricercare
       visualizza le condizioni che deve avere il file evidenziato.
       Funziona sia per i files sia per le sotto-directory, e si possono
       premere i soliti tasti numerici, alfanumerici e gli altri che
       si utilizzano per dare un nome ad un file su disco, e in più il tasto
       DEL per cancellare l' ultimo carattere. Il tasto RETURN serve per
       accettare il nome del file evidenziato o, nel caso di una directory,
       serve a spostarsi nel disco. Premendo il tasto ESCAPE si esce dall'
       immissione senza effettuare nessuna scelta.
       Con i tasti TAB e SHIFT-TAB ci si sposta tra l' immissione del
       drive/percorso/nomefile e la scelta del file nella lista del
       disco.
       Inoltre, a lato è visualizzata una barra per sapere la posizione
       dell' evidenziatore rispetto al resto della lista.
       Il path corrente è visualizzato in fondo alla finestra, prima del
       numero di files totali, dello spazio occupato, di quello libero,
       ecc.
       Come in qualsiasi altra procedura, anche se non specificato, è
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

     Begin { GestDirectory }

     { E' stato premuto il pulsante di sinistra ? }
     If LeftButton
       Then

         { Si: controlla le posizioni valide }
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
                kCF1: Help('Immissione nome file',Altro);

		{ Situazione iniziale, cioè inizializzazione della
		  directory }
		kNull: InitFilesVector;

		{ Su: sposta l' evidenziatore verso l' alto }
		kUp: Dec(PosD);

		{ Giù: sposta l' evidenziatore verso il basso }
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
       kReturn: If (Not (Copy(DirInfo^[PosD],45,7) = ' <VOL> '))
		  Then
		    Done := True;

       { Escape: annulla ogni scelta ed esce dalla procedura }
       kEscape: Done := True;

       { Un qualsiasi altro tasto viene utilizzato per la ricerca rapida
	 del file }
       Else

	 Begin

	 { Inizializzazione: non è stato trovato }
	 Trovato := False;

	 { Se la stringa è nulla allora la posizione è 1 }
	 If (StrSearch = StrNull)
	   Then
	     PosD := 1;

	 { Se il tasto è diverso da DEL, viene aggiunto al nome del
	   file di ricerca rapida }
	 If (Ch1 <> kDel)
	   Then
	     Begin

	     { Semprechè il file non sia completo (12 caratteri con il
	       punto) }
	     If (Length(StrSearch) < 12)
	       Then
		 StrSearch := StrSearch+UpCase(Ch1);

	     End

	 Else

	   { Se è stato premuto il tasto DEL viene cancellato l' ultimo
	     carattere del nome del file di ricerca rapida, semprechè
	     sia diverso dalla stringa nulla }
	   Begin

	   If( StrSearch <> StrNull)
	     Then
	       Delete(StrSearch,Length(StrSearch),1)

	   End;

	 { Ricerca in tutta la directory il file specificato }
	 For i := NumFiles DownTo 1 Do

	   Begin

	   St := Copy(DirInfo^[i],2,12);

	   { Aggiusta il nome del file: aggiunge il puntino ... }
	   If (Pos('.',St) = 0)
	     Then
	       St[9] := '.';

	   { ... elimina gli spazi in più ... }
	   While (Pos(' ',St) <> 0) Do
	     Delete(St,Pos(' ',St),1);

	   { ... e controlla se è il file cercato }
	   If (Pos(StrSearch,St) = 1)
	     Then

	       Begin
	       PosD := i;
	       Trovato := True;
	       End;

	   End;

	 { Se non è stato trovato nessun fle che corrisponde alla
	   descrizione specificata, il nome non viene aggiornato, e
	   il carattere digitato non viene contato }
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

     { Se l' evidenziatore è stato modificato }
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
	     St := Copy(DirInfo^[PosD],2,12);

	     { ... aggiunge il puntino al file ... }
	     If (Pos('.',St) = 0)
	       Then
		 St[9] := '.';

	     { ... toglie gli spazi in più ... }
	     While (Pos(' ',St) <> 0) Do
	       Delete(St,Pos(' ',St),1);

	     { ... se il file non ha estensione toglie il puntino, che non
	       serve (questo solo se è una directory) ... }
	     If ((St <> '..') And (St[Length(St)] = '.')
		And (Copy(DirInfo^[PosD],45,7) = ' <DIR> '))
		  Then
		    Delete(St,Length(St),1);

	     { ... se è una sotto-directory aggiunge le specificazioni
	       del file al nome ... }
	     If (Copy(DirInfo^[PosD],45,7) = ' <DIR> ')
	       Then
		 St := St+'\*'+ExtFiles;

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


Begin { InputFile }

{ Cambio della directory corrente }
{$I-} ChDir(CurrDir); {$I+}

{ Apre una finestra con effetto a scoppio per contenere tutte le
  informazioni riguardanti l' immissione del nome di un file }
ApriQuadro(9,1,71,24,Title,Color.MenuBord,Color.MenuText,Color.MenuTitle,
	   Ritardo.WinStep,Ritardo.Windows);

{ Scrive le stringhe che non variano, cioè quelle di indicazione }
WriteStr(4,2,'Nome del File:',Color.MenuText);
WriteStr(4,4,'Nome del File da Ricercare:',Color.MenuText);
WriteStr(4,6,' NOME     EXT LUNGHEZZA ORA      DATA       ATTR    ',
	 Color.MenuText);
WriteStr(4,18,'Percorso corrente:',Color.MenuText);

{ La posizione iniziale è quella nella zona di digitazione del
  nome del file da leggere }
CursorPos := InPath;

{ Alloca il vettore che contiene le informazioni su ogni file della
  directory }
New(DirInfo);  { 13568 Bytes }

{ Inpostazioni iniziali ed inizializzazione delle variabili }

{ Parte della ricerca rapida di un file }
StrSearch := StrNull;

{ Parte dell' editong del nome del file }
Path := Pezza;
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
Path := Pezza;

{ La stringa viene riempita di caratteri ombra (ShadowChar) }
Punt := Length(Path)+1;
For i := Punt To 255 Do
  Path[i] := ShadowChar;
Path[0] := Chr(255);

{ Gestione dell' input del nome del file }
GestInputPath(Path,Punt,Spiazzamento,Inserisci,Ch1,Ch2);

{ Scrittura del path correntemente settato }
Stt := FExpand(Path);
For i := (Length(Stt)+1) To 32 Do
  Stt := Stt+ShadowChar;
Stt[0] := #32;
WriteStr(24,18,Stt,Color.Search);

{ Per uscire da questo ciclo occorre premere il tasto ESCAPE o il tasto
  RETURN per confermare un nome di file valido }
Repeat

  { Attende la pressione di un tasto o di un pulsante del mouse }
  Attendi(Ch1,Ch2,SInputFile);

  { Memorizza la vecchia posizione nella directory }
  OldPosD := PosD;

  { Se il mouse è stato premuto ... }
  If MousePressed
    Then

      Begin

      { Pulsante di sinistra }
      If LeftButton
        Then
          Begin

          { Simulazione del tasto TAB o SHIFT-TAB }
          If ((MouseInT(29,3,64,3) And (CursorPos = InDirectory))
             Or (MouseInT(13,8,64,17) And (CursorPos = InPath)))
               Then
		 Ch1 := kTab

          Else

            { Simulazione del tasto RETURN }
            If (CursorPos = InDirectory)
              Then
                If MouseInT(13,8,64,17)
                  Then
                    Begin
                    Ch1 := kNull;
                    Ch2 := kCPrtScrn;
                    PosD := MouseTextY+PosLista-8;

                    { Testa la seconda pressione }
                    If (PosD <= NumFiles)
                      Then
                        Begin
                        If (OldPosD = PosD)
                          Then
                            Ch1 := kReturn;
                        End
                    Else
                      PosD := NumFiles;

                    { Rilascia i pulsanti }
                    While MousePressed Do
                      GetMPos;

                    End;
          End
      Else

        { Se è il pulsante di destra restituisci ESCAPE }
        If RightButton
          Then
            Ch1 := kEscape;
      End;

  { Se sono stati premuti i tasti TAB, o SHIFT-TAB ... }
  If ((((Ch1 = kNull) And (Ch2 = kSTab))
     Or (Ch1 = kTab)) And (NumFiles > 0))
       Then

	 Begin

	 { Se si è nella zona di input del path ... }
	 If (CursorPos = InPath)
	   Then

	     Begin

	     { Si cambia e si va in quella di scelta del file dalla lista
	       visualizzata, tramite un' evidenziatore }
	     CursorPos := InDirectory;

	     { Aggiornamento del path immesso: viene riscritto ma
	       non evidenziato }
	     WriteStr(x+2,y,Copy(Path,Spiazzamento,LungVirt),
		      Color.MenuSelUnSel);

	     { Nasconde il cursore }
	     CursorOFF;

	     { Impostazioni iniziali }
	     PosD := 1;
	     OldPosD := 0;
	     PosLista := 1;
	     OldPosBar := 0;
	     PosBar := 1;
	     StrSearch := StrNull;

	     End

	 Else

	   { Altrimenti, se si è nella zona di scelta del file dalla
	     lista della directory ... }
	   Begin

	   { Cambio alla zona di input del path }
	   CursorPos := InPath;

	   { Aggiornamento dell' evidenziatore: viene evidenziato in
	     modo diverso }
	   If (PosD > 0)
	     Then
	       WriteLine(PosD,Color.MenuSelUnSel);

	   End;

	 { Impostando entrembi i tasti a NULL (codice ASCII 0), viene
	   eseguita l' inizializzazione della procedura di gestione del
	   path o della directory, a seconda di quella che verrà chiamata }
	 Ch1 := kNull;
	 Ch2 := kNull;
	 OldPosD := 0;

         While MousePressed Do
           GetMPos;

	 End

  Else

    { Altrimenti, se il tasto non è TAB o SHIFT-TAB, viene controllato
      ed eseguito il compito specifico }
    Case Ch1 Of

      { Escape: esce dalla procedura senza effettuare scelte }
      kEscape: Done := True;

      { Return: scelie il file o il path digitato }
      kReturn: Begin

	       { Annulla il nome del file di ricerca rapida }
	       StrSearch := StrNull;

	       { Aggiorna l' estensione di default }
	       If (Path[1] = ShadowChar)
		 Then
		   Path := ExtFiles;

	       { Toglie i caratteri ombra (ShadowChar) dal path }
	       StApp := Path;
	       l := LungReale;

	       While (Path[l] = ShadowChar) Do
		 Dec(l);

	       Path[0] := Chr(l);

	       { Estende il nome del file al path completo }
	       Path := FExpand(Path);

	       { Se è una directory, aggiusta l' immissione completandola }
	       If (Path[Length(Path)] <> '\')
		 Then

		   Begin

		   { Assegnazione di un nome logico al file su disco }
		   Assign(FileDir,Path);

		   { Legge i suoi attributi }
		   GetFAttr(FileDir,Attr);

		   { Se è una directory aggiunge il carattere '\' }
		   If ((DosError = 0) And (Attr And Directory <> 0))
		     Then
		       Path := Path+'\';

		   End;

	       { Separa il path esteso in nome della directory, nome del
		 file, nome dell' estensione }
	       FSplit(FExpand(Path),StrDir,StrName,StrExt);

	       { Aggiusta il nome }
	       If (StrName = StrNull)
		 Then
		   StrName := '*';

	       { Aggiusta l' estensione }
	       If (StrExt = StrNull)
		 Then
		   StrExt := ExtFiles;

	       { Aggiorna l' estensione di default }
	       ExtFiles := StrExt;

	       { Aggiorna il path alla sua scrittura completa e corretta }
	       Path := StrDir+StrName+StrExt;

	       { Scrive il path nella zona specifica }
	       Stt := Path;

	       For i := Length(Stt) To 32 Do
		 Stt := Stt+ShadowChar;

	       Stt[0] := #32;

	       WriteStr(24,18,Stt,Color.Search);

	       { Memorizza la directory scelta }
	       StApp := StrDir;

	       { Aggiusta la directory per essere passata come parametro
		 alla procedura CHDIR, togliendo il carattere '\' in fondo
		 quando non serve }
	       If (StApp <> StrNull)
		 Then

		   If (Not (((Copy(StApp,2,2) = ':\') Or (StApp[2] = ':'))
		      And (Length(StApp) <= 3)))
			Then
			  Delete(StApp,Length(StApp),1);

	       { Inizializza il numero di files trovati con le
		 specificazioni digitate da tastiera }
	       TotFiles := 0;

	       { Trova il primo file che risponde alle specificazioni }
	       FindFirst(Path,AllFiles,RecInfo);

	       { Continua con la ricerca }
	       While ((DosError = 0) And (TotFiles < 2)) Do
		 Begin

		 { Incrementa il numero di files trovati }
		 Inc(TotFiles);

		 { Continua con la ricerca }
		 FindNext(RecInfo);

		 End;

	       { Se sono stati trovati almeno due files, o se è stato
		 specificato un nome che contiene caratteri jolly ('*' o
		 '?'), si procede alla visualizzazione della directory }
	       If ((TotFiles >= 2) Or
		  (Pos('*',Path) <> 0) Or (Pos('?',Path) <> 0))
		    Then

		      Begin

		      { Passaggio alla selezione del file }
		      CursorPos := InDirectory;

		      { Nasconde il cursore }
		      CursorOFF;

		      { Annulla i caratteri dei tasti, per inizializzare
			la directory stessa }
		      Ch1 := kNull;
		      Ch2 := kNull;

		      { Inizializza le variabili del file evidenziato }
		      PosD := 1;
		      OldPosD := 0;
		      PosLista := 1;

		      { Aggiorna la specificazione del file al nuovo path
			digitato }
		      SpecFile := Path;

		      { Se è possibile cambia la directory corrente }
		      {$I-} ChDir(StApp); {$I+}

		      End

	       Else

		 { Se invece è stata scelta una directory e si stava
		   scegliendo un file con l' evidenziatore nella lista
		   dei files del disco, si cambia la directory corrente }
		 If ((Copy(DirInfo^[PosD],45,7) = ' <DIR> ')
		    And (CursorPos = InDirectory))
		      Then

			Begin

			{ Cambio della specificazione dei files da
			  visualizzare }
			SpecFile := St;

			{ Inizializzazione delle variabili per
			  l' evidenziatore e la lista dei files }
			PosD := 1;
			OldPosD := 0;
			PosLista := 1;

			{ Annulla i caratteri dei tasti, per inizializzare
			  la directory stessa }
			Ch1 := kNull;
			Ch2 := kNull;

			{ Gestione della directory e visualizzazione sul
			  video della lista in memoria }
			GestDirectory(Path,PosD,Ch1,Ch2);

			{ Aggiornamento dell' evidenziatore }
			If (PosD > 0)
			  Then
			    WriteLine(PosD,Color.MenuSel);

			End

	       Else

		 { Altrimenti, significa che il file è ben specificato,
		   e si deve uscire dalla funzione, restituendo
		   il file digitato }
		 Done := True;

	       { L' errore 152 si verifica ogni tanto: non è documentato
		 ma si è notato che interrompe i cicli di scrittura;
		 non provoca nulla di evidente, per cui viene saltato e
		 inibito. Un possibile risultato potrebbe essere 'Nessun
		 file sul disco' }
	       If (DosError = 152)
		 Then

		   Begin

		   { Nessun file da visualizzare }
		   NumFiles := 0;

		   { Aggiorna la directory sul video }
		   WriteDirectory;

		   { Ritorna alla digitazione del path }
		   CursorPos := InPath;

		   End;

	       End;

      End; { Case Ch1 }

  { Se non si è scelto di uscire dalla funzione ... }
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

{ Se è stato premuto il tasto ESCAPE viene restituita la stringa nulla }
If (Ch1 = kEscape)
  Then
    InputFile := StrNull

Else

  { Altrimenti viene restituito il nome del file digitato, completo di
    drive e path }
  Begin

  { Aggiusta il nome del file, memorizzato in ST }
  If (CursorPos = InPath)
    Then
      St := Path

  Else

    { O lo preleva dall' elemento evidenziato }
    Begin

    St := Copy(DirInfo^[PosD],2,12);

    { Mette il puntino se non c'è }
    If (Pos('.',St) = 0)
      Then
	St[9] := '.';

    End;

  { Toglie gli spazi in più }
  While (Pos(' ',St) <> 0) Do
    Delete(St,Pos(' ',St),1);

  { Toglie i caratteri ombra (ShadowChar) }
  While (Pos(ShadowChar,St) <> 0) Do
    Delete(St,Pos(ShadowChar,St),1);

  { Restituisce il nome del file completo anche del drive e del percorso }
  InputFile := FExpand(St);

  End;

{ Libera la memoria allocata per la lista della directory }
Dispose(DirInfo);  { 13568 Bytes }

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Ripristina il contenuto dello schermo }
Fisico^ := Image^[NumPgVideo].Page;

{ Cambia la directory a quella di inizio del programma }
{$I-} ChDir(CurrDir); {$I+}

While MousePressed Do
  GetMPos;

End; { InputFile }


End. { TIPInFil }
