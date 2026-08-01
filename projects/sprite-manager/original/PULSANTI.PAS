{============================================================================}
{                                                                            }
{                  SPRITE MANAGER v5.0 - UNIT PULSANTI                       }
{                                                                            }
{ Data di ultima modifica .............. Mercoledi, 21 Aprile 1993           }
{                                                                            }
{ Questa UNIT fa parte del programma Sprite Manager v5.0.                    }
{                                                                            }
{ Essa contiene tutti i dati delle icone, delle costanti, dei tipi e delle   }
{ variabili che utilizza il programma.                                       }
{ Le icone sono in tutto 32 (MaxIcone-1), e ad ogni icona Š associato        }
{ un record che contiene, oltre l'immagine, le coordinate sullo schermo.     }
{                                                                            }
{ La struttura principale Š un ARRAY di record (Variabile puntatore,         }
{ Coordinata X, Coordinata Y) : i primi 16 elementi (da 0 a 15) sono le      }
{ icone dei 16 colori disponibili, mentre le altre sono quelle dei comandi,  }
{ delle frecce, ecc.                                                         }
{                                                                            }
{ Per identificare l'icona che esegue il comando 'ESCI' basta prendere       }
{ l'icona specificata dalla costante 'CMDESCI', e cos per tutte le altre.   }
{ Con questo metodo viene molto semplificata la gestione dei tasti da        }
{ disegnare: se si vuole disegnare il tasto 'ESCI' basta fare un             }
{ PutImage dell'elemento CMDESCI dell'ARRAY.                                 }
{                                                                            }
{============================================================================}
{$R-,S-,B-}
Unit Pulsanti;

Interface { Pulsanti }

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalit… testo                       }
     Graph,    { Gestisce lo schermo in modalit… grafica                     }
     Mouse;    { Gestisce il mouse                                           }

Type

     { Stringa di 3 caratteri }
     String003=     String[003];

     { Rappresenta la stringa di un nome di file }
     String012=     String[012];

     { Stringa di 80 caratteri }
     String080=     String[080];

     { Stringa che contiene il nome di un file da leggere o
       da salvare                                           }
     StringFile=    String012;

     { E' la stringa che identifica il nome del drive/percorso
       di cui si vuole listare la directory.
       La sua lunghezza massima Š di 26 caratteri, ma per
       riconoscere i file in altre directory Š necessario
       aumentarne la dimensione (i caratteri stampati
       rimangono sempre 26 al massimo.                         }
     StringPath=    String[200];

Const

      { Versione del programma }
      Version=          '5.0';

      { Estensione dei files sprite {.SPR) }
      SprExt=           'SPR';

      { Estensione dei files pascal {.PAS) }
      PasExt=           'PAS';

      { Percorso in cui si trovano i files *.BGI e *.CHR per la grafica,
	ed in particolare il file EGAVGA.BGI                             }
      DefaultBGI:       String=   '';

      { Per leggere un file in un altra directory il programma
	cambia la directory di default. Questa costante serve
	per dare il drive di default su cui listare la
	prima volta la directory (0 = corrente, 1 = A, 2 = B,
	3 = C, 4 = D, ecc.)                                    }
      DriveDefault:     Byte=     0;

      { Questa stringa serve per identificare il file come
	file che contiene dati per uno sprite. Se questa
	stringa non si trova all'inizio di un file, non
	viene letto.
	Al momento della scrittura del file viene aggiunto un
	#26 alla stringa, per evitare di stampare sul video
	tutti i dati:
	per riconoscere quali files sono dati per sprite
	basta usare il comando DOS 'TYPE' seguito dal nome
	del file stesso. Se tutto Š corretto verr…
	stampata questa stringa con i dati dello sprite stesso }
      StrFile:          String=   'º Questo file contiene i dati d'+
				  'i uno Sprite disegnato con il p'+
				  'rogramma        º º SPRITE MANA'+
                                  'GER versione '+Version+', scrit'+
                                  'to da Fochi Michele.           '+
                                  '           º';

      { Numero massimo di righe dello sprite }
      MaxRighe=                   180;

      { Numero massimo di colonne dello sprite }
      MaxColonne=                 120;

      { Numero delle icone definite (vanno da 0 a MaxIcone-1) }
      MaxIcone=                   33;

      { Numero massimo di punti per i poligoni }
      MaxNumPoints=               20;

      { Definizione dei tasti. "#0" significa che Š un tasto esteso }
      kNull=                      #000;
      kEscape=                    #027;
      kSpazio=                    #032;
      kBeep=                      #007;
      kDel=                       #008;
      kReturn=                    #013;
      kHome=              {kNull} #071;
      kUp=                {kNull} #072;
      kPgUp=              {kNull} #073;
      kLeft=              {kNull} #075;
      kRight=             {kNull} #077;
      kEnd=               {kNull} #079;
      kDown=              {kNull} #080;
      kPgDown=            {kNull} #081;
      kInsert=            {kNull} #082;
      kCancel=            {kNull} #083;

      { Tasti funzione normali           Tasti funzione + CTRL }
      kF1=       {kNull} #059;           kCF1=     {kNull} #094;
      kF2=       {kNull} #060;           kCF2=     {kNull} #095;
      kF3=       {kNull} #061;           kCF3=     {kNull} #096;
      kF4=       {kNull} #062;           kCF4=     {kNull} #097;
      kF5=       {kNull} #063;           kCF5=     {kNull} #098;
      kF6=       {kNull} #064;           kCF6=     {kNull} #099;
      kF7=       {kNull} #065;           kCF7=     {kNull} #100;
      kF8=       {kNull} #066;           kCF8=     {kNull} #101;
      kF9=       {kNull} #067;           kCF9=     {kNull} #102;
      kF10=      {kNull} #068;           kCF10=    {kNull} #103;
      kF11=      {kNull} #133;           kCF11=    {kNull} #137;
      kF12=      {kNull} #134;           kCF12=    {kNull} #138;

      { Tasti funzione + ALT             Tasti funzione + SHIFT }
      kAF1=      {kNull} #104;           kSF1=     {kNull} #084;
      kAF2=      {kNull} #105;           kSF2=     {kNull} #085;
      kAF3=      {kNull} #106;           kSF3=     {kNull} #086;
      kAF4=      {kNull} #107;           kSF4=     {kNull} #087;
      kAF5=      {kNull} #108;           kSF5=     {kNull} #088;
      kAF6=      {kNull} #109;           kSF6=     {kNull} #089;
      kAF7=      {kNull} #110;           kSF7=     {kNull} #090;
      kAF8=      {kNull} #111;           kSF8=     {kNull} #091;
      kAF9=      {kNull} #112;           kSF9=     {kNull} #092;
      kAF10=     {kNull} #113;           kSF10=    {kNull} #093;
      kAF11=     {kNull} #139;           kSF11=    {kNull} #135;
      kAF12=     {kNull} #140;           kSF12=    {kNull} #136;

      { E' la dimensione del lato di un pixel ingrandito di default }
      DimLatoDefault:   Byte=     10;

      { Comando 'Crea nuovo sprite' }
      CmdNuovo:         Byte=     16;

      { Comando 'Leggi sprite dal disco' }
      CmdLeggi:         Byte=     17;

      { Comando 'Salva lo sprite corrente sul disco' }
      CmdSalva:         Byte=     18;

      { Comando 'Esci da Sprite Manager senza salvare' }
      CmdEsci:          Byte=     19;

      { Comando 'Ingrandisci l' immagine' }
      CmdZoomIn:        Byte=     20;

      { Comando 'Rimpicciolisci l' immagine' }
      CmdZoomOut:       Byte=     21;

      { Comando 'Cambia la griglia (NoGriglia, Punti, Linee)' }
      CmdGriglia:       Byte=     22;

      { Comando 'Disegna forme' }
      CmdShape:         Byte=     23;

      { Comando 'Disegna linee' }
      CmdLine:          Byte=     24;

      { Comando 'Elabora lo sprite corrente e crea il file in Turbo Pascal' }
      CmdTurbo:         Byte=     25;

      { Comando 'Visualizza sul video i dati dello sprite' }
      CmdInfo:          Byte=     26;

      { Comando 'Cambia il retino' }
      CmdPattern:       Byte=     27;

      { Comando 'Aumenta il numero corrente (per le finestre di dialogo)'
	o 'Sposta la finestra dello sprite verso destra'                  }
      CmdDestra:        Byte=     28;

      { Comando 'Decrementa il numero corrente (per le fin. di dialogo)'
	o 'Sposta la finestra dello sprite verso sinistra'                }
      CmdSinistra:      Byte=     29;

      { Comando 'Aumenta il numero corrente (per le fin. di dialogo)'
	o 'Sposta la finestra dello sprite verso l'alto'              }
      CmdSu:            Byte=     30;

      { Comando 'Decrementa il numero corrente (per le fin. di dialogo)'
	o 'Sposta la finestra dello sprite verso il basso'               }
      CmdGiu:           Byte=     31;

      { Comando 'Accetta la nuova configurazione (per le fin. di dialogo)' }
      CmdOk:            Byte=     32;

      { Comando 'Mantieni vecchia configurazione (per le fin. di dialogo)' }
      CmdEscape:        Byte=     33;

      { Questa costante serve per le finestre di dialogo ed indica
        che le coordinate d' inizio e di fine delle stesse devono
        essere calcolate in modo che ci stiano i pulsanti e il
        testo specificato. E' molto comodo in quanto non occorre
	provare e riprovare diversi valori, essi vengono calcolati
	automaticamente dal computer                               }
      Automatico:       Integer=   0;

      { Le prossime due costanti sono i due colori per le finestre
        di dialogo di lettura da un file e di scrittura su di un file.
        DialogBackGround indica il colore di sfondo della finestra,
        mentre DialogSelect Š il colore della barra di selezione
        utilizzata per scegliere il nome del file da leggere o scrivere }
      { Sfondo della finestra }
      DialogBackGround: Byte=     Magenta;

      { Barra di selezione }
      DialogSelect:     Byte=     LightGreen;

      { Questa costante dice quali files trovare nella directory.
        Si possono trovare i seguenti files :

          - Sola lettura (ReadOnly) ............ $01
          - Nascosti (Hidden) .................. $02
          - Files di sistema (SysFile) ......... $04
          - Etichetta di volume (VolumeID) ..... $08
          - Sub-directory (Directory) .......... $10
          - Archivio (Archive) ................. $20
          - Tutti i files (AnyFile) ............ $3F

        Ad esempio, per elencare i file nascosti e quelli con
        attributo di archivio si imposta AllFiles a
        Hidden+Archive (oppure $22), mentre per visualizzare
        tutti i files tranne quelli nascosti AnyFile-Hidden
	(oppure $1D)                                          }
      AllFiles:         Byte=     AnyFile-VolumeID;
                                  { Equivale a:
                                    ReadOnly + Directory +
				    Archive + Hidden + SysFile }

      { E' la forma del cursore del mouse quando esso punta su un'icona.
	Per creare un puntatore personalizzato seguire i seguenti
        passi:
	- disegnare su carta (in una griglia di 16x16 quadretti)
	  la figura desiderata, utilizzando i colori nero e
	  bianco (o utilizzare il programma Sprite Manager)
	- decodificare separatamente i due colori come
	  Word (parole di 16 bit)
	- memorizzare nella ScreenMask i 16 valori decodificati
	  dal nero (disegnata con un AndPut)
	- memorizzare nella CursorMask quelli del bianco
	  (disegnata con un XOrPut)
	- definire gli hot spots (HotX e HotY) che vanno da
	  -16 a +16, ed indicano il punto esatto, riferito
	  all'angolo in alto a sinistra, in cui punta il
	  mouse.
	Per rendere pi— chiara la firura Š consigliabile utilizzare
        un'immagine bianca con un contorno (di 1 o 2 pixels al
        massimo) in colore nero                                          }
      CursorIcone:      GraphicCursor=
				  (ScreenMask:($0FFF, $03FF, $80CF, $C007,
					       $F003, $E001, $E001, $E000,
					       $C000, $C000, $C000, $C000,
					       $C001, $E003, $F807, $FC0F);
				   CursorMask:($0000, $7000, $3C00, $0F30,
					       $07B0, $03DC, $09EC, $0EFC,
					       $07FE, $19EE, $0FFE, $11DE,
					       $1FFC, $07F8, $03F0, $0000);
				   HotX: 1;
				   HotY: 1);

      { E' la forma del cursore del mouse quando esso punta sullo
        schermo per disegnare o sullo sprite in dimensioni reali
        (a fianco)                                                }
      CursorScreen:     GraphicCursor=
				  (ScreenMask:(53247, 51199, 50175, 49663,
					       49407, 49279, 49215, 49183,
					       49167, 49159, 49279, 50239,
					       52799, 65055, 65311, 65311);
				   CursorMask:(00000, 04096, 06144, 07168,
					       07680, 07936, 08064, 08128,
					       08160, 07936, 06912, 04480,
					       00128, 00192, 00064, 00000);
				   HotX:  2;
				   HotY: -2);

Type
     { Record che rappresenta l'icona in memoria, per essere utilizzata
       dalla procedura PutImage della libreria grafica GRAPH.TPU del
       Turbo Pascal                                                     }
     RecImage=      Record
		      X:   Word;
		      Y:   Word;
		      Vet: Array [0..511] Of Byte;
		      End; { Record da modello }

     { Questo record Š un elemento dell'array che contiene le icone }
     RecP=          Record
		      P: Pointer;
		      X: Integer;
		      Y: Integer;
		      End; { Record di un'icona }

     { Array di tutte le icone che ci sono, comprese quelle per i colori }
     TipoP=         Array [0..MaxIcone] Of
                      RecP;

     { Questo enumerativo serve per indicare quali tasti sono
       presenti nella finestra di dialogo, ossia :
       - Escape e Ok (EscapeOk)
       - Ok (SoloOk)
       - Freccia destra e Freccia sinistra (FrecceOrizz)
       - Freccia su e Freccia giu (FrecceVert)
       - Freccia destra e Freccia sinistra +
         Freccia su e Freccia giu +
	 Escape e Ok (ReadFile e SaveFile)
       - Escape (SoloEscape)                                  }
     TipoTasti=     (EscapeOk, SoloOk, FrecceOrizz, FrecceVert,
                     ReadFile, SaveFile, SoloEscape);

     { Tipo di icona da passare come parametro alla procedura
       IconWindows, per visualizzare l' icona da scegliere nell'
       insieme definito (forme, linee, retini, griglia)          }
     TipoIcone=     (IconeShape, IconeLines, IconePattern, IconeGriglia);

     { Questo enumerativo stabilisce il tipo di visualizzazione della
       griglia: PerLinee significa che vengono tracciate delle linee
       perpendicolari formanti un reticolo, mentre PerPunti vengono
       visualizzati solo dei punti invece delle linee, ed ancora
       NoGriglia consente una visione pi— uniforme dello sprite
       appena disegnato (non c'Š la griglia)                          }
     TipoGriglia=   (gLinee, gPunti, gNessuna);

     { Tipi di forme selezionabili }
     TipoShape=     (sCerchio, sCerchioPieno, sLinee, sLineePiene,
                     sRettangolo, sRettangoloPieno, sDisegnoLibero,
                     sTesto, sCopiaBlocco, sMuoviBlocco);

     { Tipi di linee disponibili }
     TipoLine=      (lSolid1, lDotted1, lCenter1, lDashed1,
                     lSolid3, lDotted3, lCenter3, lDashed3);

     { Tipi di retini disponibili }
     TipoPattern=   (pEmpty, pSolid, pLine, pLtSlash, pSlash,
                     pBkSlash, pLtBkSlash, pHatch, pXHatch,
                     pInterleave, pWideDot, pCloseDot);

     { Stabilisce se occorre visualizzare la finestra delle icone
       da scegliere (forme, retini, ecc.) o se occorre definirle
       senza 'disturbare' lo schermo                              }
     TipoMetti=     (Disegna, NonDisegnare);

     { Questo enumerativo serve alla procedura DisegnaPixel per
       sapere se cancellare o no lo schermo prima di disegnare
       tutti i pixel giganti che compongono il disegno in memoria.
       E' consigliabile cancellare in quanto, per rendere pi—
       veloce la stampa del disegno sul video, i pixel neri
       non vengono stampati ma ignorati                            }
     TipoModo=      (Clear, NotClear);

     { AncheReal fa si che, dopo che Š stato disegnato lo schermo
       principale, venga disegnato anche lo sprite in dimensioni
       reali (Š il rettangolo in basso a destra), mentre NoReal
       fa disegnare solo lo schermo (utilizzare il secondo valore
       per accellerare i tempi di scorrimento dello schermo)      }
     TipoReal=      (AncheReal, NoReal);

     { Quest'altro enumerativo, utilizzato dalla procedura
       PremiPulsante, identifica il 'luogo' in cui il
       pulsante deve essere premuto: se Š premuto nella
       parte dei colori il pulsante deve restare premuto,
       altrimenti, dopo un certo periodo di tempo, deve
       essere rilasciato                                   }
     TipoLuogo=     (Colori,AreaDisegno,Finestre,Opzioni);

     { Decide se la direzione Š orizzontale o verticale:
       per utilizzare quella orizzontale basta scrivere
       HorizDir (che vale 0); per quella verticale si usa
       VertDir (che vale 1) }
     TipoDirezione= 0..1;

     { Il cursore del mouse cambia aspetto a seconda della
       posizione su cui punta.
       Tutti i tipi di forma che esso pu• avere sono elencati
       nell'enumerativo che segue.
       Icone  --> quando il mouse punta su un'icona,
       Screen --> quando il mouse punta sullo schermo grande
		  per disegnare o su quello a lato in
		  dimensioni reali                           }
     TipoMouse=     (Icone,Screen);

     { Si possono disegnare le figure sia nella finestra piccola in
       dimensioni reali (FinPiccola) sia in quella pi— grande in
       dimensioni ingrandite (FinGrande)                            }
     TipoDisegna=   (FinGrande, FinPiccola);

     { Contiene tutti i nomi dei files delle directory, che
       possono essere al massimo 512. Il vettore Š allocato nello
       heap                                                       }
     PTRTipoDir=   ^TipoDir;
     TipoDir=      Array [1..513] Of
                     String[013];

     { Contiene le righe del testo delle finestre di dialogo (heap) }
     PTRTipoStringhe= ^TipoStringhe;
     TipoStringhe= Array [1..30] Of
                     String[100];

Const

      { Dati per l'icona del NERO. }
      ConstP0: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000));

      { Dati per l'icona del BLU. }
      ConstP1: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000));

      { Dati per l'icona del VERDE. }
      ConstP2: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000));

      { Dati per l'icona dell' AZZURRO. }
      ConstP3: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000));

      { Dati per l'icona del ROSSO. }
      ConstP4: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             128, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000));

      { Dati per l'icona del MAGENTA. }
      ConstP5: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000));

      { Dati per l'icona del MARRONE. }
      ConstP6: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000));

      { Dati per l'icona del GRIGIO CHIARO. }
      ConstP7: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             128, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000));

      { Dati per l'icona del GRIGIO SCURO. }
      ConstP8: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   192, 000, 001, 128,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   000, 001, 128, 000));

      { Dati per l'icona del BLU CHIARO. }
      ConstP9: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000));

      { Dati per l'icona del VERDE CHIARO. }
      ConstP10: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000));

      { Dati per l'icona dell' AZZURRO CHIARO. }
      ConstP11: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000));

      { Dati per l'icona del ROSSO CHIARO. }
      ConstP12: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             128, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000));

      { Dati per l'icona del MAGENTA CHIARO. }
      ConstP13: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000));

      { Dati per l'icona del GIALLO. }
      ConstP14: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000));

      { Dati per l'icona del BIANCO. }
      ConstP15: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   063, 255, 254, 000,
             128, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000));

      { Dati per l'icona del comando NUOVO. }
      ConstPNuovo: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             195, 255, 224, 000,   192, 000, 001, 128,
             195, 255, 225, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             195, 255, 224, 000,   192, 000, 001, 128,
             195, 255, 225, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             195, 255, 224, 000,   192, 000, 001, 128,
             195, 255, 225, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             195, 255, 224, 000,   192, 000, 001, 128,
             195, 255, 225, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             195, 255, 224, 000,   192, 000, 001, 128,
             195, 255, 225, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             194, 034, 032, 000,   192, 000, 001, 128,
             194, 034, 033, 128,   063, 255, 254, 000,
             195, 255, 224, 000,   192, 000, 001, 128,
             195, 255, 225, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 224, 000, 000,   000, 001, 128, 000,
             255, 225, 128, 000,   255, 254, 000, 000,
             034, 032, 000, 000,   000, 001, 128, 000,
             034, 033, 128, 000,   255, 254, 000, 000));

      { Dati per l'icona del comando LEGGI. }
      ConstPLeggi: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             199, 255, 240, 000,   192, 000, 001, 128,
             199, 255, 241, 128,   063, 255, 254, 000,
             196, 000, 080, 000,   192, 000, 001, 128,
             196, 000,  81, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             196, 000, 112, 000,   192, 000, 001, 128,
             196, 000, 113, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 254, 001, 128,
             197, 254, 241, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 062, 001, 128,
             197, 062, 241, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 062, 001, 128,
             197, 062, 241, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 062, 001, 128,
             197, 062, 241, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 028, 000, 000,   192, 028, 001, 128,
             192, 028, 001, 128,   063, 255, 254, 000,
             192, 020, 000, 000,   192, 028, 001, 128,
             192, 020, 001, 128,   063, 247, 254, 000,
             192, 247, 128, 000,   192, 255, 129, 128,
             192, 247, 129, 128,   063, 247, 254, 000,
             192, 065, 000, 000,   192, 127, 001, 128,
             192, 065, 001, 128,   063, 193, 254, 000,
             192, 034, 000, 000,   192, 062, 001, 128,
             192, 034, 001, 128,   063, 227, 254, 000,
             192, 020, 000, 000,   192, 028, 001, 128,
             192, 020, 001, 128,   063, 247, 254, 000,
             192, 008, 000, 000,   192, 008, 001, 128,
             192, 008, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 240, 000, 000,   000, 001, 128, 000,
             255, 241, 128, 000,   255, 254, 000, 000,
             000, 080, 000, 000,   000, 001, 128, 000,
             000,  81, 128, 000,   255, 254, 000, 000,
             255, 112, 000, 000,   255, 001, 128, 000,
             255, 113, 128, 000,   255, 254, 000, 000,
             255, 112, 000, 000,   255, 001, 128, 000,
             255, 113, 128, 000,   255, 254, 000, 000));

      { Dati per l'icona del comando SALVA. }
      ConstPSalva: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 028, 000, 000,   192, 028, 001, 128,
             192, 028, 001, 128,   063, 255, 254, 000,
             192, 020, 000, 000,   192, 028, 001, 128,
             192, 020, 001, 128,   063, 247, 254, 000,
             192, 247, 128, 000,   192, 255, 129, 128,
             192, 247, 129, 128,   063, 247, 254, 000,
             192, 065, 000, 000,   192, 127, 001, 128,
             192, 065, 001, 128,   063, 193, 254, 000,
             192, 034, 000, 000,   192, 062, 001, 128,
             192, 034, 001, 128,   063, 227, 254, 000,
             192, 020, 000, 000,   192, 028, 001, 128,
             192, 020, 001, 128,   063, 247, 254, 000,
             192, 008, 000, 000,   192, 008, 001, 128,
             192, 008, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             199, 255, 240, 000,   192, 000, 001, 128,
             199, 255, 241, 128,   063, 255, 254, 000,
             196, 000, 080, 000,   192, 000, 001, 128,
             196, 000,  81, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             197, 255, 112, 000,   193, 255, 001, 128,
             197, 255, 113, 128,   063, 255, 254, 000,
             196, 000, 112, 000,   192, 000, 001, 128,
             196, 000, 113, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 254, 001, 128,
             197, 254, 241, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 062, 001, 128,
             197, 062, 241, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 062, 001, 128,
             197, 062, 241, 128,   063, 255, 254, 000,
             196, 000, 240, 000,   193, 062, 001, 128,
             197, 062, 241, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             028, 000, 000, 000,   028, 001, 128, 000,
             028, 001, 128, 000,   255, 254, 000, 000,
             020, 000, 000, 000,   028, 001, 128, 000,
             020, 001, 128, 000,   247, 254, 000, 000,
             247, 128, 000, 000,   255, 129, 128, 000,
             247, 129, 128, 000,   247, 254, 000, 000,
             065, 000, 000, 000,   127, 001, 128, 000,
             065, 001, 128, 000,   193, 254, 000, 000));

      { Dati per l'icona del comando ESCI. }
      ConstPEsci: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             194, 064, 000, 000,   194, 064, 001, 128,
             194, 064, 001, 128,    61, 191, 254, 000,
             208, 000, 000, 000,   208, 000, 001, 128,
             208, 000, 001, 128,    47, 255, 254, 000,
             192, 224, 000, 000,   199, 224, 001, 128,
             192, 224, 001, 128,   056, 255, 254, 000,
             208, 016, 000, 000,   208, 016, 001, 128,
             208, 016, 001, 128,    47, 255, 254, 000,
             194, 072, 000, 000,   194, 072, 001, 128,
             194, 072, 001, 128,    61, 191, 254, 000,
             192, 008, 000, 000,   192, 008, 001, 128,
             192, 008, 001, 128,   063, 255, 254, 000,
             192, 008, 000, 000,   192, 008, 001, 128,
             192, 008, 001, 128,   063, 255, 254, 000,
             192, 028, 000, 000,   192, 000, 001, 128,
             192, 028, 001, 128,   063, 255, 254, 000,
             192, 034, 000, 000,   192, 000, 001, 128,
             192, 034, 001, 128,   063, 227, 254, 000,
             192, 065, 000, 000,   192, 000, 001, 128,
             192, 065, 001, 128,   063, 193, 254, 000,
             192, 128, 128, 000,   192, 000, 001, 128,
             192, 128, 129, 128,   063, 128, 254, 000,
             193, 000, 064, 000,   192, 000, 001, 128,
             193, 000, 065, 128,   063, 000, 126, 000,
             193, 000, 064, 000,   192, 000, 001, 128,
             193, 000, 065, 128,   063, 000, 126, 000,
             193, 000, 064, 000,   192, 000, 001, 128,
             193, 000, 065, 128,   063, 000, 126, 000,
             192, 128, 128, 000,   192, 000, 001, 128,
             192, 128, 129, 128,   063, 128, 254, 000,
             192, 065, 000, 000,   192, 000, 001, 128,
             192, 065, 001, 128,   063, 193, 254, 000,
             192, 034, 000, 000,   192, 000, 001, 128,
             192, 034, 001, 128,   063, 227, 254, 000,
             192, 028, 000, 000,   192, 000, 001, 128,
             192, 028, 001, 128,   063, 255, 254, 000,
             192, 000, 000, 000,   192, 000, 001, 128,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             064, 000, 000, 000,   064, 001, 128, 000,
             064, 001, 128, 000,   191, 254, 000, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             224, 000, 000, 000,   224, 001, 128, 000,
             224, 001, 128, 000,   255, 254, 000, 000));

      { Dati per l'icona del comando ZOOM OUT. }
      ConstPZoomOut: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 201, 254, 000,
             192, 000, 001, 128,      063, 201, 254, 000,
             192, 034, 000, 000,      063, 042, 126, 000,
             192, 034, 001, 128,      063, 008, 126, 000,
             192, 227, 128, 000,      060, 235, 158, 000,
             192, 227, 129, 128,      060, 008, 030, 000,
             195, 227, 224, 000,      051, 235, 230, 000,
             195, 227, 225, 128,      048, 008, 006, 000,
             192, 227, 128, 000,      060, 235, 158, 000,
             192, 227, 129, 128,      060, 008, 030, 000,
             192, 034, 000, 000,      063, 042, 126, 000,
             192, 034, 001, 128,      063, 008, 126, 000,
             192, 000, 000, 000,      063, 201, 254, 000,
             192, 000, 001, 128,      063, 201, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             199, 034, 248, 000,      056, 221, 006, 000,
             199, 034, 249, 128,      063, 255, 254, 000,
             200, 162, 032, 000,      055, 093, 222, 000,
             200, 162, 033, 128,      063, 255, 254, 000,
             200, 162, 032, 000,      055, 093, 222, 000,
             200, 162, 033, 128,      063, 255, 254, 000,
             200, 162, 032, 000,      055, 093, 222, 000,
             200, 162, 033, 128,      063, 255, 254, 000,
             200, 162, 032, 000,      055, 093, 222, 000,
             200, 162, 033, 128,      063, 255, 254, 000,
             200, 162, 032, 000,      055, 093, 222, 000,
             200, 162, 033, 128,      063, 255, 254, 000,
             199, 028, 032, 000,      056, 227, 222, 000,
             199, 028, 033, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             128, 000, 000, 000,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del comando ZOOM IN. }
      ConstPZoomIn: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000,
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      051, 255, 230, 000,
             192, 000, 001, 128,      051, 255, 230, 000,
             196, 000, 016, 000,      052, 255, 150, 000, 
             196, 000, 017, 128,      048, 255, 134, 000,     
             199, 000, 112, 000,      055, 062, 118, 000, 
             199, 000, 113, 128,      048, 062, 006, 000,     
             199, 193, 240, 000,      055, 201, 246, 000, 
             199, 193, 241, 128,      048, 008, 006, 000,
             199, 000, 112, 000,      055, 062, 118, 000,
             199, 000, 113, 128,      048, 062, 006, 000,     
             196, 000, 016, 000,      052, 255, 150, 000,
             196, 000, 017, 128,      048, 255, 134, 000,
             192, 000, 000, 000,      051, 255, 230, 000, 
             192, 000, 001, 128,      051, 255, 230, 000,     
             192, 000, 000, 000,      063, 255, 254, 000, 
             192, 000, 001, 128,      063, 255, 254, 000,     
             192, 000, 000, 000,      063, 255, 254, 000, 
             192, 000, 001, 128,      063, 255, 254, 000,
             192, 000, 000, 000,      063, 255, 254, 000, 
             192, 000, 001, 128,      063, 255, 254, 000,     
             193, 217, 192, 000,      062, 038, 062, 000,
             193, 217, 193, 128,      063, 255, 254, 000,     
             192, 140, 128, 000,      063, 115, 126, 000, 
             192, 140, 129, 128,      063, 255, 254, 000,     
             192, 138, 128, 000,      063, 117, 126, 000, 
             192, 138, 129, 128,      063, 255, 254, 000,     
             192, 137, 128, 000,      063, 118, 126, 000, 
             192, 137, 129, 128,      063, 255, 254, 000,
             192, 136, 128, 000,      063, 119, 126, 000, 
             192, 136, 129, 128,      063, 255, 254, 000,     
             192, 136, 128, 000,      063, 119, 126, 000,
             192, 136, 129, 128,      063, 255, 254, 000,
             193, 221, 192, 000,      062, 034, 062, 000, 
             193, 221, 193, 128,      063, 255, 254, 000,     
             192, 000, 000, 000,      063, 255, 254, 000, 
             192, 000, 001, 128,      063, 255, 254, 000,     
             192, 000, 000, 000,      063, 255, 254, 000, 
             192, 000, 001, 128,      063, 255, 254, 000,
             128, 000, 000, 000,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del comando CREA FILE TURBO PASCAL. }
      ConstPTurbo: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             207, 243, 240, 000,   063, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             207, 243, 248, 000,   048, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             193, 131, 024, 000,   062, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             193, 131, 024, 000,   062, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             193, 131, 248, 000,   062, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             193, 131, 240, 000,   062, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             193, 131, 000, 000,   062, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             193, 131, 000, 000,   062, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             193, 131, 000, 000,   062, 253, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             199, 142, 048, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   199, 142, 049, 128,
             204,  27, 048, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   204,  27, 049, 128,
             205, 155, 048, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   205, 155, 049, 128,
             205, 155, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   205, 155, 001, 128,
             199, 014, 048, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   199, 014, 049, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             243, 240, 000, 000,   253, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             243, 248, 000, 000,   253, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000));

      { Dati per l'icona del comando VISUALIZZA DATI. }
      ConstPInfo: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 255, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             199, 224, 112, 000,   063, 255, 254, 000,
             199, 224, 113, 128,   199, 224, 113, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             199, 000, 048, 000,   063, 255, 254, 000,
             199, 000, 049, 128,   199, 000, 049, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             199, 120, 112, 000,   063, 255, 254, 000,
             199, 120, 113, 128,   199, 120, 113, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             198, 252, 048, 000,   063, 255, 254, 000,
             198, 252, 049, 128,   198, 252, 049, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             199, 184, 016, 000,   063, 255, 254, 000,
             199, 184, 017, 128,   199, 184, 017, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             192, 000, 000, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   192, 000, 001, 128,
             128, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   255, 255, 255, 128,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000,
             224, 112, 000, 000,   255, 254, 000, 000,
             224, 113, 128, 000,   224, 113, 128, 000,
             000, 000, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   000, 001, 128, 000));

      { Dati per l'icona del comando AIUTO. }
      ConstPAiuto: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 000, 126, 000,   063, 000, 126, 000,
             063, 000, 126, 000,   192, 000, 001, 128,
             252, 000, 030, 000,   060, 255, 158, 000,
             060, 000, 030, 000,   192, 000, 001, 128,
             248, 000, 014, 000,   059, 255, 238, 000,
             056, 000, 014, 000,   192, 000, 001, 128,
             240, 000, 014, 000,   055, 131, 238, 000,
             048, 000, 014, 000,   192, 000, 001, 128,
             240, 120, 014, 000,   055, 123, 238, 000,
             048, 120, 014, 000,   192, 000, 001, 128,
             248, 240, 030, 000,   056, 247, 222, 000,
             056, 240, 030, 000,   192, 000, 001, 128,
             255, 224, 126, 000,   063, 239, 126, 000,
             063, 224, 126, 000,   192, 000, 001, 128,
             255, 192, 254, 000,   063, 222, 254, 000,
             063, 192, 254, 000,   192, 000, 001, 128,
             255, 192, 254, 000,   063, 222, 254, 000,
             063, 192, 254, 000,   192, 000, 001, 128,
             255, 192, 254, 000,   063, 222, 254, 000,
             063, 192, 254, 000,   192, 000, 001, 128,
             255, 225, 254, 000,   063, 225, 254, 000,
             063, 225, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 225, 254, 000,   063, 225, 254, 000,
             063, 225, 254, 000,   192, 000, 001, 128,
             255, 192, 254, 000,   063, 222, 254, 000,
             063, 192, 254, 000,   192, 000, 001, 128,
             255, 192, 254, 000,   063, 222, 254, 000,
             063, 192, 254, 000,   192, 000, 001, 128,
             255, 225, 254, 000,   063, 225, 254, 000,
             063, 225, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             255, 255, 254, 000,   063, 255, 254, 000,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 126, 000, 000,   000, 126, 000, 000,
             000, 126, 000, 000,   000, 001, 128, 000,
             000, 030, 000, 000,   255, 158, 000, 000,
             000, 030, 000, 000,   000, 001, 128, 000,
             000, 014, 000, 000,   255, 238, 000, 000,
             000, 014, 000, 000,   000, 001, 128, 000));

      { Dati per l'icona del comando FRECCIA DESTRA. }
      ConstPDestra: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 207, 254, 000,   255, 207, 255, 128,
             063, 207, 254, 000,   000, 000, 000, 000,
             255, 195, 254, 000,   255, 195, 255, 128,
             063, 195, 254, 000,   000, 000, 000, 000,
             255, 192, 254, 000,   255, 220, 255, 128,
             063, 192, 254, 000,   000, 000, 000, 000,
             248, 000, 062, 000,   248, 030, 063, 128,
             056, 000, 062, 000,   000, 000, 000, 000,
             248, 000, 014, 000,   251, 255, 143, 128,
             056, 000, 014, 000,   000, 000, 000, 000,
             248, 000, 062, 000,   248, 030, 063, 128,
             056, 000, 062, 000,   000, 000, 000, 000,
             255, 192, 254, 000,   255, 220, 255, 128,
             063, 192, 254, 000,   000, 000, 000, 000,
             255, 195, 254, 000,   255, 195, 255, 128,
             063, 195, 254, 000,   000, 000, 000, 000,
             255, 207, 254, 000,   255, 207, 255, 128,
             063, 207, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000));

      { Dati per l'icona del comando FRECCIA SINISTRA. }
      ConstPSinistra: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 249, 254, 000,   255, 249, 255, 128,
             063, 249, 254, 000,   000, 000, 000, 000,
             255, 225, 254, 000,   255, 225, 255, 128,
             063, 225, 254, 000,   000, 000, 000, 000,
             255, 129, 254, 000,   255, 157, 255, 128,
             063, 129, 254, 000,   000, 000, 000, 000,
             254, 000, 014, 000,   254, 060, 015, 128,
             062, 000, 014, 000,   000, 000, 000, 000,
             248, 000, 014, 000,   248, 255, 239, 128,
             056, 000, 014, 000,   000, 000, 000, 000,
             254, 000, 014, 000,   254, 060, 015, 128,
             062, 000, 014, 000,   000, 000, 000, 000,
             255, 129, 254, 000,   255, 157, 255, 128,
             063, 129, 254, 000,   000, 000, 000, 000,
             255, 225, 254, 000,   255, 225, 255, 128,
             063, 225, 254, 000,   000, 000, 000, 000,
             255, 249, 254, 000,   255, 249, 255, 128,
             063, 249, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000));

      { Dati per l'icona del comando FRECCIA GIU'. }
      ConstPGiu: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 227, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 000, 126, 000,   255, 008, 127, 128,
             063, 000, 126, 000,   000, 000, 000, 000,
             255, 000, 126, 000,   255, 062, 127, 128,
             063, 000, 126, 000,   000, 000, 000, 000,
             255, 128, 254, 000,   255, 190, 255, 128,
             063, 128, 254, 000,   000, 000, 000, 000,
             255, 128, 254, 000,   255, 156, 255, 128,
             063, 128, 254, 000,   000, 000, 000, 000,
             255, 193, 254, 000,   255, 221, 255, 128,
             063, 193, 254, 000,   000, 000, 000, 000,
             255, 193, 254, 000,   255, 201, 255, 128,
             063, 193, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 227, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 247, 254, 000,   255, 247, 255, 128,
             063, 247, 254, 000,   000, 000, 000, 000,
             255, 247, 254, 000,   255, 247, 255, 128,
             063, 247, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             227, 254, 000, 000,   227, 255, 128, 000,
             227, 254, 000, 000,   000, 000, 000, 000,
             227, 254, 000, 000,   235, 255, 128, 000,
             227, 254, 000, 000,   000, 000, 000, 000));

      { Dati per l'icona del comando FRECCIA SU. }
      ConstPSu: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 247, 254, 000,   255, 247, 255, 128,
             063, 247, 254, 000,   000, 000, 000, 000,
             255, 247, 254, 000,   255, 247, 255, 128,
             063, 247, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 227, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 193, 254, 000,   255, 201, 255, 128,
             063, 193, 254, 000,   000, 000, 000, 000,
             255, 193, 254, 000,   255, 221, 255, 128,
             063, 193, 254, 000,   000, 000, 000, 000,
             255, 128, 254, 000,   255, 156, 255, 128,
             063, 128, 254, 000,   000, 000, 000, 000,
             255, 128, 254, 000,   255, 190, 255, 128,
             063, 128, 254, 000,   000, 000, 000, 000,
             255, 000, 126, 000,   255, 062, 127, 128,
             063, 000, 126, 000,   000, 000, 000, 000,
             255, 000, 126, 000,   255, 008, 127, 128,
             063, 000, 126, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 235, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 227, 254, 000,   255, 227, 255, 128,
             063, 227, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             247, 254, 000, 000,   247, 255, 128, 000,
             247, 254, 000, 000,   000, 000, 000, 000,
             247, 254, 000, 000,   247, 255, 128, 000,
             247, 254, 000, 000,   000, 000, 000, 000));

      { Dati per l'icona del comando OK. }
      ConstPOk: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 014, 000,   255, 255, 015, 128,
             063, 255, 014, 000,   000, 000, 000, 000,
             255, 254, 014, 000,   255, 254, 239, 128,
             063, 254, 014, 000,   000, 000, 000, 000,
             255, 252, 030, 000,   255, 253, 223, 128,
             063, 252, 030, 000,   000, 000, 000, 000,
             255, 248, 062, 000,   255, 251, 191, 128,
             063, 248, 062, 000,   000, 000, 000, 000,
             255, 240, 126, 000,   255, 247, 127, 128,
             063, 240, 126, 000,   000, 000, 000, 000,
             255, 240, 126, 000,   255, 247, 127, 128,
             063, 240, 126, 000,   000, 000, 000, 000,
             255, 224, 254, 000,   255, 238, 255, 128,
             063, 224, 254, 000,   000, 000, 000, 000,
             255, 224, 254, 000,   255, 238, 255, 128,
             063, 224, 254, 000,   000, 000, 000, 000,
             255, 193, 254, 000,   255, 221, 255, 128,
             063, 193, 254, 000,   000, 000, 000, 000,
             248, 193, 254, 000,   248, 221, 255, 128,
             056, 193, 254, 000,   000, 000, 000, 000,
             240, 065, 254, 000,   247, 093, 255, 128,
             048, 065, 254, 000,   000, 000, 000, 000,
             248, 001, 254, 000,   251, 189, 255, 128,
             056, 001, 254, 000,   000, 000, 000, 000,
             252, 003, 254, 000,   253, 251, 255, 128,
             060, 003, 254, 000,   000, 000, 000, 000,
             254, 003, 254, 000,   254, 251, 255, 128,
             062, 003, 254, 000,   000, 000, 000, 000,
             255, 003, 254, 000,   255, 123, 255, 128,
             063, 003, 254, 000,   000, 000, 000, 000,
             255, 003, 254, 000,   255, 123, 255, 128,
             063, 003, 254, 000,   000, 000, 000, 000,
             255, 135, 254, 000,   255, 135, 255, 128,
             063, 135, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             255, 255, 254, 000,   255, 255, 255, 128,
             063, 255, 254, 000,   000, 000, 000, 000,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 255, 128, 000,
             255, 254, 000, 000,   000, 000, 000, 000,
             255, 014, 000, 000,   255, 015, 128, 000,
             255, 014, 000, 000,   000, 000, 000, 000,
             254, 014, 000, 000,   254, 239, 128, 000,
             254, 014, 000, 000,   000, 000, 000, 000,
             252, 030, 000, 000,   253, 223, 128, 000,
             252, 030, 000, 000,   000, 000, 000, 000));

      { Dati per l'icona del comando ESCAPE. }
      ConstPEscape: RecImage=
      (X:  24;
       Y:  24;
       Vet: (
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 243, 254, 000,   063, 243, 254, 000,
             192, 000, 001, 128,   063, 243, 254, 000,
             255, 195, 254, 000,   063, 195, 254, 000,
             192, 000, 001, 128,   063, 195, 254, 000,
             255, 003, 254, 000,   063, 003, 254, 000,
             192, 000, 001, 128,   063, 003, 254, 000,
             252, 000, 006, 000,   060, 000, 006, 000,
             192, 000, 001, 128,   060, 000, 006, 000,
             240, 000, 006, 000,   048, 000, 006, 000,
             192, 000, 001, 128,   048, 000, 006, 000,
             252, 000, 006, 000,   060, 000, 006, 000,
             192, 000, 001, 128,   060, 000, 006, 000,
             255, 003, 254, 000,   063, 003, 254, 000,
             192, 000, 001, 128,   063, 003, 254, 000,
             255, 195, 254, 000,   063, 195, 254, 000,
             192, 000, 001, 128,   063, 195, 254, 000,
             255, 243, 254, 000,   063, 243, 254, 000,
             192, 000, 001, 128,   063, 243, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             224, 000, 002, 000,   032, 000, 002, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             239, 190, 250, 000,   047, 190, 250, 000,
             207, 190, 249, 128,   048, 065, 006, 000,
             236, 048, 194, 000,   044, 048, 194, 000,
             204, 048, 193, 128,   051, 207, 062, 000,
             239, 190, 194, 000,   047, 190, 194, 000,
             207, 190, 193, 128,   048, 065, 062, 000,
             236, 006, 194, 000,   044, 006, 194, 000,
             204, 006, 193, 128,   051, 249, 062, 000,
             239, 190, 250, 000,   047, 190, 250, 000,
             207, 190, 249, 128,   048, 065, 006, 000,
             224, 000, 002, 000,   032, 000, 002, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             243, 254, 000, 000,   243, 254, 000, 000,
             000, 001, 128, 000,   243, 254, 000, 000,
             195, 254, 000, 000,   195, 254, 000, 000,
             000, 001, 128, 000,   195, 254, 000, 000));

Type

     { Puntatore alla matrice in memoria }
     PTRVetType= ^VetType;

     { Matrice che contiene l' immagine }
     VetType=    Array [1..MaxColonne,1..MaxRighe] Of
                   Byte;

Var

    { Nome del file da leggere o salvare }
    FileName:    StringFile;

    { Coordinata X di una cella }
    X:           Integer;

    { Coordinata Y di una cella }
    Y:           Integer;

    { Puntatore ad una icona }
    P:           TipoP;

    { Coordinate della finestra per il disegno 10:1 }
    InizioX:     Integer;
    InizioY:     Integer;
    FineX:       Integer;
    FineY:       Integer;

    { Appoggio stringa }
    St:          String;

    { Finito o no di lavorare con SpriteManager2 }
    Fine:        Boolean;

    { Colore di una cella }
    Color:       Byte;

    { Matrice figura }
    Vet:         PTRVetType;

    { Risposta (Vero/Falso) }
    Risp:        Boolean;

    { Directory corrente sul disco }
    CurrDir:     PathStr;

    { Valore massimo di pixels orizzontali }
    MaxX:        Integer;

    { Valore massimo di pixels verticali }
    MaxY:        Integer;

    { Griglia }
    Griglia:     TipoGriglia;

    { Griglia precedente }
    OldGriglia:  TipoGriglia;

    { Forma selezionata }
    Shape:       TipoShape;

    { Linea selezionata }
    Lines:       TipoLine;

    { Retino selezionato }
    Pattern:     TipoPattern;

    { Vale TRUE se il file non Š un file di dati }
    NoFile:      Boolean;

    { Coordinate dell' immagine in dimensioni reali (1:1) }
    InizioRealX: Integer;
    InizioRealY: Integer;

    { Posizioni precedenti del mouse }
    OldMouseX:   Integer;
    OldMouseY:   Integer;

    { Vari aspetti del cursore del mouse }
    MouseType:   TipoMouse;

    { Vale TRUE se l' immagine non Š stata salvata su disco }
    Modificato:  Boolean;

    { E' la dimensione del lato di un pixel della figura ingrandita.
      La dimensione va da 2 a 420 }
    Lato:        Integer;

    { Nome del file corrente }
    NomeFile:    StringFile;

    { Appoggio per l' immagine }
    OldVet:      PTRVetType;

    { Contenuto del disco }
    Dir:         PTRTipoDir;

    { Appoggio per il merge sort }
    DirApp:      PTRTipoDir;


Implementation { Pulsanti }


Begin { Pulsanti }

{ Alloca la matrice che conterr… l' immagine disegnata e quella
  di appoggio                                                   }
New(Vet);      { 21600 Bytes }
New(OldVet);   { 21600 Bytes }

{ e i vettori che conterranno la directory (compreso quello di appoggio) }
New(Dir);
New(DirApp);

End. { Pulsanti }
