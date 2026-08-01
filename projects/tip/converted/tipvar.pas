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
 ║       VERSIONE 1.0                          UNIT TIPVAR                  ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   14 Marzo 1993
  Ora:    20:00:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorVariables }

{ Unit di definizione delle costanti, tipi e variabili globali che utilizza
  il programma TIP (Text Image Processor). }


{ Nome della unit }
Unit
     TIPVar;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPVar }

{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalità testo }
     Crt,

     { Gestione del disco, memoria, chiamate di sistema, ... }
     Dos,

     { Definizione delle costanti per i tasti }
     Keyboard;


{ Costanti globali tipizzate }
Const

      { Memoria occupata dal programma }
      MemOccupata:     LongInt=      215808;

      { Memoria aggiuntiva della Shell }
      MemShell:        LongInt=        6200;

      { Coordinata X di inizio della finestra dell' help }
      HlpXMin:         Byte=             13;

      { Coordinata X di fine della finestra dell' help }
      HlpXMax:         Byte=             66;

      { Coordinata Y di inizio della finestra dell' help }
      HlpYMin:         Byte=              2;

      { Coordinata Y di fine della finestra dell' help }
      HlpYMax:         Byte=             22;

      { Lunghezza orizzontale della finestra dell' help }
      HlpXLun:         Byte=             49;

      { Lunghezza verticale della finestra dell' help }
      HlpYLun:         Byte=             19;


{ Costanti globali non tipizzate }
Const

      { Numero di pagine dell' help memorizzate, richiamabili con
        i tasti SHIFT-F1 }
      MaxLastHelp=          020;

      { Numero massimo di immagini caricate in memoria, visualizzabili
	premendo i tasti ALT-1, ALT-2, ALT-3, ..., ALT-9, ALT-0,
	compresa la ClipBoard (ALT-B) }
      MaxPgVideo=            11;

      { Numero massimo di files per ogni directory, compresi i files
	di volume, quelli nascosti, ecc. }
      MaxDirFiles=          512;

      { Numero massimo di directory per ogni drive, senza considerare
        la '.' e la '..' }
      MaxDirDirs=           256;

      { Numero di linee da saltare con i tasti PageDown e PageUp,
	nella finestra dei files della directory }
      LinesPage=            010;

      { Numero della pagina video che viene utilizzata come clipboard (zona
        appunti), per la memorizzazione di un blocco, ecc. }
      PgClipBoard=           11;

      { Numero massimo di riferimenti per un argomento dell' help }
      MaxNumRif=            100;

      { Numero di linee per un argomento }
      MaxNumLines=          200;

      { Lunghezza della stringa che precede il nome della directory
        (nella finestra aperta da Cambia Directory) per ogni livello
        di sub-directory }
      LungLevelDir=           6;

      { Stringa da visualizzare per ogni livello }
      StrLevelNull=    '      ';

      { Stringa per una sub-directory }
      StrLevelDirs=    '└─────';

      { Intersezione tra una sub-directory ed un' altra }
      DirIntersChar=        '├';

      { Linea continua senza diramazioni }
      DirBarChar=           '│';

      { Sub-directory figlia }
      DirEndChar=           '└';

      { Carattere vuoto }
      DirSpcChar=           ' ';


{ Tipi globali }
Type

     { Stringa di 1 carattere }
     String001=            String[001];

     { Stringa di 2 caratteri }
     String002=            String[002];

     { Stringa di 3 caratteri }
     String003=            String[003];

     { Stringa di 4 caratteri }
     String004=            String[004];

     { Stringa di 5 caratteri }
     String005=            String[005];

     { Stringa di 6 caratteri }
     String006=            String[006];

     { Stringa di 7 caratteri }
     String007=            String[007];

     { Stringa di 8 caratteri }
     String008=            String[008];

     { Stringa di 12 caratteri }
     String012=            String[012];

     { Stringa di 13 caratteri }
     String013=            String[013];

     { Stringa di 15 caratteri }
     String015=            String[015];

     { Stringa di 16 caratteri }
     String016=            String[016];

     { Stringa di 19 caratteri }
     String019=            String[019];

     { Stringa di 22 caratteri }
     String022=            String[022];

     { Stringa di 23 caratteri }
     String023=            String[023];

     { Stringa di 25 caratteri }
     String025=            String[025];

     { Stringa di 28 caratteri }
     String028=            String[028];

     { Stringa di 44 caratteri }
     String044=            String[044];

     { Stringa di 49 caratteri }
     String049=            String[049];

     { Stringa di 52 caratteri }
     String052=            String[052];

     { Stringa di 63 caratteri }
     String063=            String[063];

     { Stringa di 80 caratteri }
     String080=            String[080];

     { Stringa di 100 carattri }
     String100=            String[100];

     { Stringa di 127 carattri }
     String127=            String[127];

     { Stringa di 160 carattri }
     String160=            String[160];

     { Stringa di 255 carattri }
     String255=            String[255];

     { Stringa per il titolo di una finestra }
     TitleStr=             String063;

     { Insieme di caratteri per una immissione controllata del nome
       del file, drive o percorso da parte dell' utente }
     SetOfChar=            Set Of Char;

     { E' il puntatore alll' array che contiene tutti i dati dei files
       di una directory }
     PTRDirInfo=           ^TypeDirInfo;

     { Vettore in memoria dei files della directory }
     TypeDirInfo=          Array [1..MaxDirFiles] Of
			     String052;

     { E' il puntatore alll' array che contiene tutti i dati delle
       directory di un disco }
     PTRDirsInfo=          ^TypeDirsInfo;

     { Vettore in memoria delle directory di un disco }
     TypeDirsInfo=         Array [0..MaxDirDirs] Of
			     Record
                             Line: String052;
                             Path: PathStr;
                             End;

     { Puntatore in memoria che contiene l' argomento della finestra
       dell' help }
     PTRHelpStr=           ^VetHelpStr;

     { Vettore del testo dell' argomento visualizzato }
     VetHelpStr=           Array [1..MaxNumLines] Of
                             String049;

     { Puntatore in memoria che contiene i riferimenti per ogni
       argomento dell' help }
     PTRHelpRif=           ^VetHelpRif;

     { Vettore dei riferimenti }
     VetHelpRif=           Array [1..MaxNumRif] Of
                             Record

                             { Numero di riga }
                             Line:   Integer;

                             { Numero di colonna }
                             OffSet: Byte;

                             { Testo della parola evidenziata }
                             Word:   String049;

                             End;

     { Record che contiene un carattere e l' attributo corrispondente.
       Una pagina della memoria video non è altro che la ripetizione
       di questo record per 80x24 volte (non sono 80x25 perchè manca l'
       ultima riga) }
     RecCharAttr=          Record

                             { Carattere }
                             Ch: Char;

                             { Attributo }
                             At: Byte;

                             End; { RecCharAttr }

     { Puntatore ad una pagina video in memoria }
     PTRPage=             ^RecPage;

     { Una pagina video parziale: 4096 Bytes (o 4 KBytes) meno l' ultima
       riga (160 Bytes); in tutto sono 3936 Bytes }
     RecPage=             Array [1..24,1..80] Of
                            RecCharAttr;

     { Puntatore ad una pagina video in memoria (intera: 25x80) }
     PTRFullPage=         ^RecFullPage;

     { Una pagina video completa: 4096 Bytes (o 4 KBytes) }
     RecFullPage=         Array [1..25,1..80] Of
                            RecCharAttr;

     { Puntatore ad un record di un' immagine }
     PTRRecImage=         ^RecImage;

     { Record che contiene tutte le informazioni di un' immagine
       in memoria (che è poi una pagina video virtuale) }
     RecImage=            Record

                            { Immagine in modalità testo }
			    Page:     RecPage;

                            { Riga del cursore }
			    Row:      Byte;

                            { Colonna del cursore }
			    Col:      Byte;

                            { Attributo del cursore }
			    Attr:     Byte;

			    { Modalità di Inserzione o di Sovrascrittura }
			    InsState: Boolean;

			    { Ultimo carattere stampato sul video }
			    SelCar:   Char;

			    { Vale TRUE quando l' immagine è stata
			      modificata; FALSE in caso contrario }
			    Modify:   Boolean;

			    { Nome del file associato ad ogni pagina,
			      compreso il drive e il percorso sul disco }
			    FileName: String080;

                            { Vale TRUE quando il file è di tipo maschera,
                              FALSE in caso contrario }
                            Maschera: Boolean;

			    End; { RecImage }

     { Puntatore al vettore delle immagini: questo consente l' utilizzo
       di solo 4 Bytes per una variabile di tipo POINTER ed il
       conseguente risparmio di memoria per i dati (64 KBytes in tutto) }
     PTRImage=            ^ArrayImage;

     { Insieme delle immagini in memoria }
     ArrayImage=          Array [1..MaxPgVideo] Of
                            RecImage;

     { E' la stringa iniziale di ogni file maschera: se manca tale
       stringa il file viene considerato file di testo }
     HeaderStr=           String007;

     { Puntatore in memoria della struttura di un file maschera }
     PTRRecFile=          ^RecFile;

     { Struttura di un file maschera }
     RecFile=             Record

                            { Intestazione di riconoscimento del file }
                            Header: HeaderStr;

                            { Immagine in modalità testo }
                            Page:   RecPage;

                            End; { RecFile }

     { File strutturato  }
     FileStructMSK=       File Of
                            RecFile;

     { Puntatore al record di un' immagine utilizzata come appoggio per
       memorizzare un blocco }
     PTRRecBlock=         ^RecBlock;

     { Contiene le informazioni di un blocco, come la pagina video,
       le coordinate di inizio e le coordinate di fine del blocco }
     RecBlock=            Record

                            { Immagine in memoria }
			    Page:    RecPage;

                            { Coordinate di inizio e fine del blocco }
			    InizioX: Byte;
			    InizioY: Byte;
			    FineX:   Byte;
			    FineY:   Byte;

			    End; { RecBlock }

     { Caratteri per la cornice di una finestra o di un blocco }
     FrameChars=          String013;

     { Caratteri per le frecce nel bordo di un blocco }
     ArrowChars=          String004;

     { Contiene la definizione del bordo di un blocco evidenziato e
       i caratteri da utilizzare come frecce }
     RecBlockDef=        Record

                           { Bordo }
			   Bord:  FrameChars;

                           { Frecce }
			   Arrow: ArrowChars;

			   End; { RecBlockDef }

     { Record che contiene tutti i colori disponibili. Questi colori
       sono letti dal file di definizione: se questo file non esiste,
       verranno presi quelli di default e verrà creato un nuovo file
       di configurazione }
     RecColor=            Record

			    { Colore di default }
			    Default:             Byte;

                            { Colore per le cancellazioni }
                            Cancel:              Byte;

			    { Colore di default della riga di stato in
			      fondo allo schermo }
			    UserInfo:            Byte;

			    { Colore dei messaggi di errore }
			    Error:               Byte;

			    { Colore dei messaggi quando un' operazione
			      è in corso }
			    Performing:          Byte;

			    { Colore dei campi in input }
			    InputField:          Byte;

			    { Colore dei caratteri digitati in input }
			    InputDigit:          Byte;

			    { Colore dei caratteri freccia per indicare
			      che la stringa immessa continua oltre i limiti
			      destro e/o sinistro della zona riservata }
			    InputArrow:          Byte;

			    { Colore del bordo dei menu }
			    MenuBord:            Byte;

			    { Colore del titolo dei menu }
			    MenuTitle:           Byte;

			    { Colore dell' opzione selezionata dei menu }
			    MenuSel:             Byte;

			    { Colore dell' opzione non selezionata dei menu }
			    MenuUnSel:           Byte;

			    { Colore della lettera selezionata dei menu }
			    MenuKeySel:          Byte;

			    { Colore della lettera non selezionata dei menu }
                            MenuKeyUnSel:        Byte;

			    { Colore dell' opzione selezionata nella
			      finestra per la gestione dei files ,
			      mentre si sta editando il path }
			    MenuSelUnSel:        Byte;

			    { Colore del testo dei menu }
			    MenuText:            Byte;

			    { Colore della riga di stato in fondo allo
			      schermo }
			    Status:              Byte;

			    { Colore dei campi della riga di stato in
			      fondo allo schermo }
			    StatusSel:           Byte;

			    { Colore dei caratteri freccia per indicare
			      che la stringa immessa continua oltre i limiti
			      destro e/o sinistro della zona riservata,
			      della finestra per la gestione dei files
			      maschera }
			    FileArrow:           Byte;

			    { Colore delle frecce per la directory,
			      utilizzato nelle finestre per la gestione
			      dei files }
			    DirArrow:            Byte;

			    { Colore della barra di posizione per il file
			      selezionato rispetto al resto della
			      directory, utilizzato nelle finestre per la
			      gestione dei files }
			    DirBar:              Byte;

			    { Colore del testo relativo alle informazioni
			      sui files nella directory, utilizzato
			      nelle finestre per la gestione dei files }
			    DirInfo:             Byte;

			    { Colore del nome del file da ricercare,
			      utilizzato nelle finestre per la gestione
			      dei files }
			    Search:              Byte;

			    { Colore della directory, utilizzato nelle
			      finestre per la gestione dei files }
			    Dir:                 Byte;

			    { Colore del messaggio nella directory
			      quando non ci sono files da visualizzare
			      utilizzato nelle finestre per la gestione
			      dei files }
			    NoFiles:             Byte;

			    { Colore del bordo della finestra delle
			      avvertenze (file non salvato, sovrascrivo
			      si o no, ecc.) }
			    WarningBord:         Byte;

			    { Colore del titolo della finestra delle
			      avvertenze (file non salvato, sovrascrivo
			      si o no, ecc.) }
			    WarningTitle:        Byte;

			    { Colore dell' opzione selezionata della
			      finestra delle avvertenze (file non salvato,
			      sovrascrivo si o no, ecc.) }
			    WarningSel:          Byte;

			    { Colore dell' opzione non selezionata della
			      finestra delle avvertenze (file non salvato,
			      sovrascrivo si o no, ecc.) }
			    WarningUnSel:        Byte;

			    { Colore della lettera evidenziata della
			      finestra delle avvertenze (file non salvato,
			      sovrascrivo si o no, ecc.) }
			    WarningKeySel:       Byte;

			    { Colore della lettera non selezionata della
			      finestra delle avvertenze (file non salvato,
			      sovrascrivo si o no, ecc.) }
			    WarningKeyUnSel:     Byte;

			    { Colore del testo della finestra delle
			      avvertenze (file non salvato, sovrascrivo
			      si o no, ecc.) }
			    WarningText:         Byte;

			    { Colore dell' opzione lampeggio selezionata,
			      utilizzato nella finestra dei colori }
			    ColoriBlinkON:       Byte;

			    { Colore dell' opzione lampeggio non
			      selezionata, utilizzato nella finestra dei
			      colori }
			    ColoriBlinkOFF:      Byte;

			    { Colore del bordo del blocco selezionato }
			    BlockBord:           Byte;

			    { Colore delle frecce del bordo del un
			      blocco }
			    BlockArrow:          Byte;

			    { Colore dell' angolo selezionato, del quale
			      si vogliono cambiare le coordinate }
			    BlockAngle:          Byte;

			    { Colore del bordo dell' help }
			    HelpBord:            Byte;

			    { Colore del titolo dell' help }
			    HelpTitle:           Byte;

			    { Colore dell' opzione selezionata dell' help }
			    HelpSel:             Byte;

			    { Colore dell' opzione non selezionata dell'
                              help }
			    HelpUnSel:           Byte;

			    { Colore del testo dell' help }
			    HelpText:            Byte;

                            { Colore del titolo della finestra aperta
			      con il tasto CTRL }
                            SpecTitle:           Byte;

                            { Colore del testo nella finestra aperta con
                              il tasto CTRL }
                            SpecText:            Byte;

                            { Colore del testo evidenziato nella finestra
			      aperta con il tasto CTRL }
                            SpecSel:             Byte;

			    End; { RecColor }

     { Record che contiene i valori dei ritardi presenti nel programma;
       Questi valori sono letti dal file di definizione: se questo file
       non esiste, verranno presi quelli di default e verrà creato un
       nuovo file di configurazione }
     RecRitardo=            Record

			      { Ritardo di default }
			      Default:             Word;

			      { Ritardo per l' emissione del BEEP }
			      Beep:                Word;

			      { Numero di passi che deve effettuare
				il menu per aprire una finestra }
			      MenuStep:            Word;

			      { Ritardo per l' apertura di un menu }
			      Menu:                Word;

			      { Numero di passi che deve effettuare
				la finestra di dialogo per aprirsi }
			      DialStep:            Word;

			      { Ritardo per l' apertura di una finestra
				di dialogo }
			      Dialog:              Word;

			      { Numero di passi che deve effettuare
				una generica finestra per aprirsi }
			      WinStep:             Word;

			      { Ritardo per l' apertura di una finestra
				generica }
			      Windows:             Word;

			      { Ritardo per la scrittura di un messaggio
				in fondo alla pagina }
			      Messaggi:            Word;

			      { E' la velocità con cui si spostano le
				frecce dei bordi del blocco }
			      BlockSpeed:          Word;

			      { E' la velocità con cui lampeggiano i
				bordi del blocco }
			      BlockBlink:          Word;

                              { E' il ritardo con cui appaiono i menu
			        quando è premuto un tasto speciale
				quale SHIFT, CTRL, ALT, ecc. }
                              SpecialKey:          Word;

			      End; { RecRitardo }

     { Record che memorizza le caratteristiche di una finestra }
     WinState=            Record

			    { Coordinata dell' angolo superiore sinistro:
			      X = Lo(WindMin), Y = Hi(WindMin) }
			    WindMin:  Word;

			    { Coordinata dell' angolo inferiore destro:
			      X = Lo(WindMax), Y = Hi(WindMax) }
			    WindMax:  Word;

			    { Coordinata X della finestra }
			    WhereX:   Byte;

			    { Coordinata Y della finestra }
			    WhereY:   Byte;

			    { Attributi della finestra }
			    TextAttr: Byte;

			    End; { WinState }

  { Puntatore al titolo di una finestra }
  TitleStrPTR=            ^TitleStr;

  { Puntatore al record di stato di una finestra }
  WinRecPTR=              ^WinRec;

  { Record di stato di una finestra }
  WinRec=                 Record

			    { Puntatore alla prossima finestra }
			    Next:      WinRecPTR;

			    { Record che contiene le dimensioni e la
			      posizione della finestra }
			    State:     WinState;

			    { Titolo della finestra }
			    Title:     TitleStrPTR;

			    { Attributi del titolo }
			    TitleAttr: Byte;

			    { Attributi della cornice }
			    FrameAttr: Byte;

			    { Contenuto }
			    Buffer:    Pointer;

			    { Tipo di cornice }
			    WFrame:    FrameChars;

			    End; { WinRec }

  { Sono le possibili scelte per le finestre di dialogo:

       __OK__     significa che si accetta il commento sul video
       __SI__NO   significa che si può (SI) o non si può (NO) accettare
		  ciò che viene chiesto }
  OptionType=             (__OK__, __SI_NO__);

  { Modalità di tracciamento delle cornici:

      TOff:    Nessuna cornice
      TLine:   Una linea, un carattere, ecc.
      TColor:  Un colore }
  TraceType=              (TOff, TLine, TColor);

  { Record che memorizza le opzioni speciali:

       BloccaFore:    Blocca il colore di foreground, lasciandolo inalterato
       BloccaBack:    Blocca il colore di background, lasciandolo inalterato
       BloccaCar:     Blocca il carattere sul video, lasciandolo inalterato
       ReturnDown:    Il tasto RETURN fa avanzare di una riga oppure
                      visualizza l' ultimo carattere digitato
       InvertXCar:    Inverte i caratteri (quelli possibili) in senso
                      orizzontale
       InvertYCar:    Inverte i caratteri (quelli possibili) in senso
                      verticale
       EnableSound:   Abilita o disabilita l' emissione dei suoni dal PC
       NormalCursor:  Abilita o disabilita il modo di visualizzazione del
                      cursore (lampeggiante o a croce)

    Queste opzioni possono essere settare a vero (TRUE) o falso (FALSE)
    anche insieme (per ottenere effetti combinati).
    Esse sono sempre valide, per ogni operazione effettuata sull' immagine
    corrente }
  SpecialRec=             Record

                            { Colore di foreground }
                            BloccaFore:   Boolean;

                            { Colore di background }
                            BloccaBack:   Boolean;

                            { Carattere }
                            BloccaCar:    Boolean;

                            { Tasto RETURN }
                            ReturnDown:   Boolean;

                            { Inversione orizzontale }
                            InvertXCar:   Boolean;

                            { Inversione verticale }
                            InvertYCar:   Boolean;

                            { Serve per far sentire i suoni emessi dal PC
                              oppure no: TRUE emette i Beep, FALSE non
                              emette alcun suono }
                            EnableSound:  Boolean;

                            { Abilita o disabilita il modo di visualizzazione
                              del cursore (lampeggiante o a croce) }
                            NormalCursor: Boolean;

                            End; { SpecialRec }

  { Tipo di uscita dall' help (uscita negata, uscita, nuovo argomento,
    argomento precedente o pressione del tasto ALT-F1 nell' help stesso }
  TipoEsciHelp=           (NonUscire, EsciHlp, Altro, Precedente,
                           AncoraPrecedente);

  { Puntatore in memoria delle chiamate all' help }
  PTRLastHelp=            ^VetLastHelp;

  { Vettore delle chiamate all' help }
  VetLastHelp=             Array [1..MaxLastHelp] Of
			     String049;

  { Prompt per la Shell }
  PromptType=              String127;

  { Finestre per la visualizzazione dei tasti speciali disponibil }
  SpecialMenuType=         (SNothing,     SScreen,      SMainMenu, SHelp,
                            SInputString, SMenuASCII,   SMenuCornici,
    			    SSelCornice,  SInputFile,   SInputDirectory,
			    SMenuFiles,   SMenuColori,  SCopyBlock,
			    SMoveBlock,   SMenuInvert,  SMenuBlock,
			    SMenuTrace,   SMoveVideo,   SDefineBlock,
			    SDialog,      SComandoDOS,  SShellDOS,
			    SMenuImage,   SMenuVideo,   SMenuSpeed,
			    SMenuArrow,   SMenuMouse,   SMenuSpecial,
			    SMenuConfig,  SMenuConv);


{ Costanti globali tipizzate }
Const

      { Prompt per la Shell }
      NewPrompt:          PromptType=  #027+'[0;32;40mText Image Processor:'+
                                       '$_'+#027+'[0;37;40;1mDigita EXIT pe'+
                                       'r tornare al programma.$_';

      { Valore della stringa per riconoscere un file maschera }
      HeaderValue:        HeaderStr=   'TIPv1.0';

      { Carattere utilizzato nei campi per l' immissione da tastiera,
	negli spazi dove non vi sono caratteri validi }
      ShadowChar:         Char=        '·';

      { Tipi di files da visualizzare nella directory.
	Le costanti di attributo dei files hanno i seguenti valori:

	  - Sola lettura (ReadOnly) ............ $01
	  - Nascosti (Hidden) .................. $02
	  - Files di sistema (SysFile) ......... $04
	  - Etichetta di volume (VolumeID) ..... $08
	  - Sub-directory (Directory) .......... $10
	  - Archivio (Archive) ................. $20
	  - Tutti i files (AnyFile) ............ $3F

	Ad esempio, per elencare i file nascosti e quelli con attributo
	di archivio si imposta AllFiles a Hidden+Archive (oppure $22),
	mentre per visualizzare tutti i files tranne quelli nascosti
	AnyFile-Hidden (oppure $1D). }
      AllFiles:           Byte=        ReadOnly + Directory +
                                       Archive + Hidden +
                                       SysFile + VolumeID;

      { Drive-percorso-nome del file di configurazione }
      NameConfigFile:     String=      'TIP.CFG';

      { Drive-percorso-nome del file che contiene le schermate di aiuto }
      InitNameHelpFile:   String=      'TIP.HLP';

      { Caratteri di definizione della cornice di una finestra }
      SingleFrame:        FrameChars=  '┌─┐││└─┘┬├┼┤┴';
      DoubleFrame:        FrameChars=  '╔═╗║║╚═╝╦╠╬╣╩';
      SingleHorFrame:     FrameChars=  '╓─╖║║╙─╜╥╟╫╢╨';
      DoubleVerFrame:     FrameChars=  '╓─╖║║╙─╜╥╟╫╢╨';
      DoubleHorFrame:     FrameChars=  '╒═╕││╘═╛╤╞╪╡╧';
      SingleVerFrame:     FrameChars=  '╒═╕││╘═╛╤╞╪╡╧';

      { Caratteri per le frecce nel bordo di un blocco }
      FrecceSottili:      ArrowChars=  #027+#026+#025+#024;
      FrecceGrandi:       ArrowChars=  #017+#016+#031+#030;

      { Caratteri che si possono digitare per immettere un drive/percorso }
      SetCarPath:         SetOfChar=   [#033..#041,#046,#048..#058,
					#064..#123,#125,#126,#128..#249,
					#251..#254];

      { Caratteri che si possono digitare per immettere un
	drive/percorso/nomefile }
      SetCarFile:         SetOfChar=   [#033..#042,#046,#048..#058,
					#063..#123,#125,#126,#128..#249,
					#251..#254];

      { Caratteri che si possono digitare per immettere il nome di una
        procedura }
      SetCarProc:         SetOfChar=   [#048..#057,#065..#090,#097..#122];

      { Tutti i 256 caratteri che si possono digitare }
      SetCarAll:          SetOfChar=   [#000..#255];

      { Stringa vuota }
      StrNull:            String=      '';

      { Disco di default. Per modificare il drive:

          0:  Default
          1:  A:
          2:  B:
          3:  C:
          4:  D:
          ...
          ...
          ...
          25: Z: }
      CurrDrive:          Byte=        0;

      { Caratteri che si possono invertire in senso verticale }
      SetCarUp:    String019= '^╜╛╝┘└┴╚╩╧╨╙╘▀°∩L';
      SetCarDown:  String019= 'v╖╕╗┐┌┬╔╦╤╥╓╒▄.UΓ';

      { Caratteri che si possono invertire in senso orizzontale }
      SetCarLeft:  String025= '(<\{[┤╡╢╖╕╣╗╝╜╛┐┘«¬▌≤pb''';
      SetCarRight: String025= ')>/}]├╞╟╓╒╠╔╚╙╘┌└»⌐▐≥qd`';


{ Variabili globali }
Var

    { Record che contiene le definizioni di tutti i colori utilizzati }
    Color:                 RecColor;

    { Record che contiene le definizioni di tutti i ritardi utilizzati }
    Ritardo:               RecRitardo;

    { File di configurazione dei colori, pathes, ecc. }
    ConfigFile:            Text;

    { File di aiuto che contiene tutte le schermate richiamabili
      dall' utente alla pressione dei tasti F1, ALT-F1, CTRL-F1,
      SHIFT-F1 }
    HelpFile:              Text;

    { Drive-percorso-nome del file maschera da leggere }
    NameReadFileMSK:       String;

    { Drive-percorso-nome del file maschera da salvare }
    NameWriteFileMSK:      String;

    { Drive-percorso-nome del file di testo da leggere }
    NameReadFileTXT:       String;

    { Drive-percorso-nome del file di testo da salvare }
    NameWriteFileTXT:      String;

    { Drive-percorso-nome del file blocco da leggere }
    NameReadFileBLK:       String;

    { Drive-percorso-nome del file blocco da salvare }
    NameWriteFileBLK:      String;

    { Drive-percorso-nome del file di testo da leggere (blocco) }
    NameReadFileTXTBLK:    String;

    { Drive-percorso-nome del file di testo da salvare (blocco) }
    NameWriteFileTXTBLK:   String;

    { Drive-percorso-nome del file di aiuto }
    NameHelpFile:          String;

    { Drive-percorso-nome del file in Turbo Pascal da creare }
    NamePascalFile:        String;

    { Drive-percorso-nome del file in Turbo Assembler da creare }
    NameAssemblerFile:     String;

    { Drive-percorso-nome del file in Turbo C da creare }
    NameCFile:             String;

    { Drive-percorso-nome del file in GW-Basic da creare }
    NameBasicFile:         String;

    { Drive-percorso-nome del file in Data Base da creare }
    NameDataBaseFile:      String;

    { Drive-percorso-nome del file in ANSI da creare }
    NameANSIFile:          String;

    { Comando DOS digitato dall' utente }
    DOSCommand:            String;

    { All' eseguzione del programma, viene controllato se è disponibile
      il file di aiuto: è possibile specificare un altro path, riprovare
      con quello corrente oppure abbandonare (in questo caso l' help non
      sarà disponibile). Se il file è stato trovato ed è quindi
      disponibile, la variabile vale TRUE; vale invece FALSE in caso
      contrario }
    HelpOnLine:            Boolean;

    { Una volta che si è deciso di uscire dal programma questa variabile
      assume il valore logico TRUE; fino a chè vale FALSE si continuerà
      ad eseguirlo }
    Uscita:                Boolean;

    { Immagine reale nella memoria video }
    Fisico:                PTRPage;

    { Insieme delle pagine e delle relative informazioni }
    Image:                 PTRImage;

    { Informazioni del blocco: pagina video, coordinate di inizio e
      di fine }
    Block:                 PTRRecBlock;

    { Contiene la definizione del bordo di un blocco evidenziato e
      i caratteri da utilizzare come frecce }
    BlockDef:              RecBlockDef;

    { Vale TRUE se il blocco è stato definito in memoria, e quindi basta
      leggerlo dalla clipboard, altrimenti vale FALSE }
    MemoryBlock:           Boolean;

    { Numero di pagina video corrente }
    NumPgVideo:            Byte;

    { Puntatore al primo elemento della lista delle finestre aperte }
    TopWindow:             WinRecPTR;

    { Conta il numero di finestre aperte }
    WindowCount:           Integer;

    { Directory corrente }
    CurrDir:               String;

    { Tipo di cornice per il disegno di linee }
    Cornice:               FrameChars;

    { Tipo di cornice per le finestre }
    WinCornice:            FrameChars;

    { Tipo di tracciamento per le cornici }
    Trace:                 TraceType;

    { Memorizza gli stati delle opzioni avanzate }
    Special:               SpecialRec;

    { Colore della traccia colorata }
    Colore:                Byte;

    { Velocità orizzontale del mouse }
    MouseHorSpeed:         Integer;

    { Velocità verticale del mouse }
    MouseVerSpeed:         Integer;

    { Vettore delle chiamate precedenti del file di aiuto, rivedibili
      premendo i tasto ALT-F1 }
    LastHelp:              PTRLastHelp;

    { Valore di HeapEnd, cioè della fine dello heap, all' inizio del
      programma }
    TopOfHeap:             Pointer;

    { Parametri da passare al DOS per la Shell o per un comando DOS }
    ParasForDos:           Word;

    { Variabile registri per le chiamate di sistema del DOS }
    Regs:                  Registers;

    { Procedura associata all' interrupt 09h, cioè alla pressione di un
      tasto, che visualizza lo stato di NumLock, ScrollLock, CapsLock e
      Insert }
    Time1Proc:             Procedure;

    { Procedura associata all' interrupt 1Ch, cioè al timer, che visualizza
      l' ora e lo stato dei tasti Shift, Alt e Control }
    Time2Proc:             Procedure;

    { Memorizza l' indirizzo dell' interrupt 09h originale }
    SaveTime1Vect:         Pointer;

    { Memorizza l' indirizzo dell' interrupt 1Ch originale }
    SaveTime2Vect:         Pointer;

    { Inizio del segmento dati per una pagina video i memoria: cambia se
      il video è monocromatico o a colori }
    Segmento:              Word;

    { Aggiorna o no la linea di stato in fondo alla pagina }
    AggiornaStatusLine:    Boolean;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPVar }

Begin { TIPVar }

{ Salva il limite superiore dello heap per la Shell o un comando DOS }
TopOfHeap := HeapEnd;

{ Aggiornamento della riga di stato ON }
AggiornaStatusLine := True;

{ Restituisce il segmento di inizio della pagina video numero 0 (quella di
  default): se il video è monocromatico vale $B000; se è a colori vale
  invece $B000. Questa informazione si trova nella locazione di memoria
  $0000:$0449 (vale 7 se monocromatico) }
If (Mem[$0000:$0449] = 7)
  Then
    Segmento := $B000
Else
  Segmento := $B800;

{ Velocizza la pressione dei tasti (INT 16h, Funzione 03h) }
Regs.AH := $03;
Regs.AL := $05;
Regs.BL := $00;
Regs.BH := $00;
Intr($16,Regs);

End. { TIPVar }
