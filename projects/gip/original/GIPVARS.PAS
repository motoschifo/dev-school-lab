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
 º       ùúúúúúú³°°°°°°³úRAPHICú³±±±±±±³úIMAGEú³²²²²²²³úPROCESSORúúù        º
 º       ùúúúúúúÀÄÄÄÄÄÄÙúúúúúúúúÀÄÄÄÄÄÄÙúúúúúúúÀÄÄÄÄÄÄÙúúúúúúúúúúúúù        º
 º       ùúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúù        º
 º       ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù        º
 º                                                                          º
 º       FOCHI MICHELE                         UNIT GIPVARS                 º
 º       VERSIONE 1.0                                                       º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}
Unit GIPVars;

Interface { GIPVars }

Uses Crt,Dos,Graph,Keyboard,Mouse;

Const

      { Massima dimensione del disegno in pixels (X) }
      MaxRisX=             1279;

      { Massima dimensione del disegno in pixels (Y) }
      MaxRisY=             1023;

      { Font per le coordinate }
      CoordFont=           10;

      { Font per i menu }
      MenuFont=            10;

      { Font per i titoli }
      TitleFont=           SansSerifFont;

      { Dimensione del font per le coordinate }
      CoordSize=           1;

      { Dimensione del font per i menu }
      MenuSize=            1;

      { Dimensione del font per il titolo }
      TitleSize=           1;

      { Dimensione del font standard }
      DefaultSize=         1;

      { Altezza del menu }
      AltzMenu=            20;

      { Altezza delle icone }
      AltzIcone=           30;

      { Larghezza delle icone }
      LargIcone=           30;

      { Altezza delle barre di scorrimento }
      AltzBar=             15;

      { Larghezza delle barre di scorrimento }
      LargBar=             15;

      { Passo di interallo }
      Step=                10;

      { Intervallo per i titoli dei menu }
      StepTitle=           25;

      { Intervallo per la prima e l' ultima opzione di un menu }
      StepOpz=             10;

      { Passo di distanza tra il menu-icone e l' icona chiamante }
      StepWin=             10;

      { Colore di una linea }
      cLineColor=          Brown;

      { Colore di background }
      cBkColor=            Black;

      { Colore di riempimento }
      cFillColor=          Cyan;

      { Colore di background per il titolo }
      cBkTitle=            DarkGray;

      { Colore di background per i menu }
      cBkMenu=             Brown;

      { Colore di background per i titoli dei menu }
      cBkMenuTitle=        LightGray;

      { Colore di foreground per i titoli dei menu }
      cMenuTitle=          Red;

      { Colore di background per i titoli selezionati dei menu }
      cBkMenuTitleSel=     Green;

      { Colore di background per la finestra selezionata }
      cBkMenuWinSel=       LightGray;

      { Colore dell' ombra della finestra selezionata }
      cShadowMenuWinSel=   LightGray;

      { Colore di foreground per i titoli selezionati dei menu }
      cMenuTitleSel=       Blue;

      { Colore di foreground per le opzioni selezionate dei menu }
      cOpzSel=             LightGreen;

      { Colore di background per le opzioni selezionate dei menu }
      cBkOpzSel=           LightRed;

      { Colore per le coordinate del mouse }
      cCoord=              Yellow;

      { Colore di background per le coordinate del mouse }
      cBkCoord=            Blue;

      cBkWarning=          Red;
      cWarningBord=        Yellow;
      cWarning=            White;

      { Sfondo di una finestra }
      cBkIconWin=          LightRed;

      { Colore dell' ombra della finestra }
      cShadowIconWin=      LightRed;

      { Bordo della finestra }
      cIconWinBord=        Yellow;
      cBkDialog=           LightGray;
      cShadowDialog=       LightGray;
      cDialogBord=         Red;
      cBkSmallDialog=      DarkGray;
      cBkDialogTitle=      Red;
      cDialogTitle=        Yellow;
      cBkSmallTitle=       Blue;
      cSmallTitle=         White;
      cBkBarLine=          DarkGray;
      cEditColor=          LightGray;     {0,3,7}
      cEditColorSel=       LightGreen;
      cBkEditColor=        Magenta;
      cBkEditColorSel=     Brown;
      cInfoColor=          LightCyan;
      cSmallLineColor=     Cyan;
      { Colore di background per l' orologio }
      cBkClock=            Blue;
      cBkDisplay=          Red;

      { Colore per le lancette delle ore }
      cClkHour=            Yellow;

      cClkMinute=          Yellow;
      { Colore per le lancette dei minuti e dei secondi }
      cClkSecond=          LightCyan;
      cClkSec100=          Cyan;

      cClockBord=          White;
      cClock=              White;
      cBkClkInfo=          Green;
      cClkInfo=            Blue;
      cClkNumber=          White;
      cUserSel=            Black;


      { Percorso dei files *.CHR e *.BGI }
      FilesBGI=            '';

      IcnForeBlack=        0;
      IcnForeBlue=         1;
      IcnForeGreen=        2;
      IcnForeCyan=         3;
      IcnForeRed=          4;
      IcnForeMagenta=      5;
      IcnForeBrown=        6;
      IcnForeLightGray=    7;
      IcnForeDarkGray=     8;
      IcnForeLightBlue=    9;
      IcnForeLightGreen=   10;
      IcnForeLightCyan=    11;
      IcnForeLightRed=     12;
      IcnForeLightMagenta= 13;
      IcnForeYellow=       14;
      IcnForeWhite=        15;

      IcnBackBlack=        16;
      IcnBackBlue=         17;
      IcnBackGreen=        18;
      IcnBackCyan=         19;
      IcnBackRed=          20;
      IcnBackMagenta=      21;
      IcnBackBrown=        22;
      IcnBackLightGray=    23;
      IcnBackDarkGray=     24;
      IcnBackLightBlue=    25;
      IcnBackLightGreen=   26;
      IcnBackLightCyan=    27;
      IcnBackLightRed=     28;
      IcnBackLightMagenta= 29;
      IcnBackYellow=       30;
      IcnBackWhite=        31;

      { Pulsante 'Freccia sinistra' }
      IcnSinistra=         32;

      { Pulsante 'Freccia destra' }
      IcnDestra=           33;

      { Pulsante 'Freccia su' }
      IcnAlto=             34;

      { Pulsante 'Freccia gi—' }
      IcnBasso=            35;
      IcnSceltaOggetti=    36;
      IcnOpDisco=          37;
(*      IcnZoom=             38;*)
      IcnPalette=	   38;
      IcnSpostaSchermo=    39;
      IcnDisegnoLibero=    40;
      IcnOpBlocchi=        41;
      IcnConversione=      42;
      IcnHelpOnLine=       43;
      IcnSceltaFont=       44;
      IcnSceltaForma=      45;
      IcnSceltaRetino=     46;
      IcnSceltaLinea=      47;
      IcnOrologio=         48;
      IcnAttivo=           49;
      IcnCursorBar=        50;
      IcnOk=               51;
      IcnEsci=             52;
      IcnSi=               53;
      IcnNo=               54;
      IcnLongOk=           55;
      IcnLongEsci=         56;
      IcnDefault=          57;
      IcnReset=            58;
      IcnDefaultAll=       59;
      IcnResetAll=         60;

      { Numero di pulsanti }
      MaxIcons=            60;

      { Titoli massimi dei menu }
      MenuTitle=           6;

      { Opzioni massime per ogni menu }
      MenuOpz=             5;

      { Cancellare l' immagine prima di ridisegnarla }
      Clear=               True;

      { Non cancellare l' immagine prima di ridisegnarla }
      DontClear=           False;

      { Serve per fare disegnare tutti i titoli dei menu definiti }
      AllMenu=             0;

      { Visualizza le coordinate del cursore }
      CoordON=             True;

      { Non visualizza le coordinate del cursore }
      CoordOFF=            False;

      { Modo per non disegnare una figura e riportare gli stili di linea
        o di retino o di scrittura (ecc.) alla normalit… }
      NoPut=               5;

      { Disegno di una figura vuota }
      Vuoto=               True;

      { Disegno di una figura piena }
      Pieno=               False;

      { Codici di figura }
      fArco=               0;
      fRettangoloPieno=    1;
      fRettangolo3D=       2;
      fPoligono=           3;
      fCerchio=            4;
      fCerchioPieno=       5;
      fPoligonoPieno=      6;
      fRiempimento=        7;
      fLinea=              8;
      fTestoInizio=        9;
      fSettorePieno=       10;
      fRettangolo3DPieno=  11;
      fRettangolo=         12;
      fSettore=            13;
      fDisegnoLibero=      14;
      fTestoFine=          15;
      fUserFill=           16;
      fArcoCorda=          17;
      fSfondoImmagine=     18;

      { Indica un parametro non utilizzato per i Byte (Not Used Byte) }
      NUB=                 65535;

      { Indica un parametro non utilizzato per gli Integer (Not Used
        Integer) }
      NUI=                 MaxInt;

      { Indica un parametro non utilizzato per i Word (Not Used Word) }
      NUW=                 MaxInt; {65535;}

      { Numero massimo di lati per il poligono }
      MaxPolyPoints=       100;

      Shadow=              8;
      StrNull=             '';

      MaxDirs=             256;
      MaxFiles=            512;

      VetHoriz: Array [0..2] Of String[10]= ('LeftText',
                                             'CenterText',
                                             'RightText');
      VetVert:  Array [0..2] Of String[10]= ('BottomText',
                                             'CenterText',
                                             'TopText');
      VetDir:   Array [0..1] Of String[8]= ('HorizDir',
                                            'VertDir');
      VetFont:  Array [0..10] Of String[13]= ('DefaultFont',
                                              'TriplexFont',
                                              'SmallFont',
                                              'SansSerifFont',
                                              'GothicFont',
                                              '5',
                                              '6',
                                              '7',
                                              '8',
                                              '9',
                                              '10');
      VetCol:   Array [0..15] Of String[12]= ('Black',
                                              'Blue',
                                              'Green',
                                              'Cyan',
                                              'Red',
                                              'Magenta',
                                              'Brown',
                                              'LightGray',
                                              'DarkGray',
                                              'LightBlue',
                                              'LightGreen',
                                              'LightCyan',
                                              'LightRed',
                                              'LightMagenta',
                                              'Yellow',
                                              'White');
      VetFil:   Array [0..12] Of String[14]= ('EmptyFill',
                                              'SolidFill',
                                              'LineFill',
                                              'LtSlashFill',
                                              'SlashFill',
                                              'BkSlashFill',
                                              'LtBkSlashFill',
                                              'HatchFill',
                                              'XHatchFill',
                                              'InterleaveFill',
                                              'WideDotFill',
                                              'CloseDotFill',
                                              'UserFill');
      VetLin:   Array [0..4] Of String[9]=   ('SolidLn',
                                              'DottedLn',
                                              'CenterLn',
                                              'DashedLn',
                                              'UserBitLn');
      VetThi:   Array [1..3] Of String[10]=   ('NormWidth',
                                               '2',
                                               'ThickWidth');
      VetPat:   Array [0..11] Of FillPatternType=
                ((000,000,000,000,000,000,000,000),
                 (255,255,255,255,255,255,255,255),
                 (255,000,000,255,255,000,000,255),
                 (001,002,004,008,016,032,064,128),
                 (224,193,131,007,014,028,056,112),
                 (060,030,015,135,195,225,240,120),
                 (105,180,090,045,150,075,165,210),
                 (068,068,068,255,068,068,068,255),
                 (033,018,012,012,018,033,192,192),
                 (153,102,153,102,153,102,153,102),
                 (000,064,000,004,000,064,000,004),
                 (000,017,000,068,000,017,000,068));
      VetSty:   Array [0..3] Of Word=
                (65535,
                 52428,
                 07743,
                 07967);
      VetHoriC: Array [0..2] Of String[11]= ('LEFT_TEXT',
                                             'CENTER_TEXT',
                                             'RIGHT_TEXT');
      VetVertC: Array [0..2] Of String[11]= ('BOTTOM_TEXT',
                                             'CENTER_TEXT',
                                             'TOP_TEXT');
      VetDirC:  Array [0..1] Of String[9]= ('HORIZ_DIR',
                                            'VERT_DIR');
      VetFontC: Array [0..10] Of String[15]= ('DEFAULT_FONT',
                                              'TRIPLEX_FONT',
                                              'SMALL_FONT',
                                              'SANS_SERIF_FONT',
                                              'GOTHIC_FONT',
                                              '5',
                                              '6',
                                              '7',
                                              '8',
                                              '9',
                                              '10');
      VetColC:  Array [0..15] Of String[12]= ('BLACK',
                                              'BLUE',
                                              'GREEN',
                                              'CYAN',
                                              'RED',
                                              'MAGENTA',
                                              'BROWN',
                                              'LIGHTGRAY',
                                              'DARKGRAY',
                                              'LIGHTBLUE',
                                              'LIGHTGREEN',
                                              'LIGHTCYAN',
                                              'LIGHTRED',
                                              'LIGHTMAGENTA',
                                              'YELLOW',
                                              'WHITE');
      VetFilC:  Array [0..12] Of String[15]= ('EMPTY_FILL',
                                              'SOLID_FILL',
                                              'LINE_FILL',
                                              'LTSLASH_FILL',
                                              'SLASH_FILL',
                                              'BKSLASH_FILL',
                                              'LTBKSLASH_FILL',
                                              'HATCH_FILL',
                                              'XHATCH_FILL',
                                              'INTERLEAVE_FILL',
                                              'WIDEDOT_FILL',
                                              'CLOSEDOT_FILL',
                                              'USER_FILL');
      VetLinC:  Array [0..4] Of String[10]=   ('SOLID_LINE',
                                               'DOTTED_LINE',
                                               'CENTER_LINE',
                                               'DASHED_LINE',
                                               'USERBIT_LINE');
      VetThiC:  Array [1..3] Of String[10]=   ('1',
                                               '2',
                                               '3');


Type

     { Un pulsante di dimensioni 9x9 }
     IcnRec127=     Record
                      X:   Word;
                      Y:   Word;
                      Vet: Array [0..127] Of
                             Byte;
                      End; { IcnRec }

     { Un pulsante di dimensioni 29x14 }
     IcnRec255=     Record
                      X:   Word;
                      Y:   Word;
                      Vet: Array [0..255] Of
                             Byte;
                      End; { IcnRec }

     { Un pulsante di dimensioni 39x14 }
     IcnRec319=     Record
                      X:   Word;
                      Y:   Word;
                      Vet: Array [0..319] Of
                             Byte;
                      End; { IcnRec }

     { Un pulsante di dimensioni 29x29 }
     IcnRec511=     Record
                      X:   Word;
                      Y:   Word;
                      Vet: Array [0..511] Of
                             Byte;
                      End; { IcnRec }

     { Un pulsante di dimensioni 95x14 }
     IcnRec767=     Record
                      X:   Word;
                      Y:   Word;
                      Vet: Array [0..767] Of
                             Byte;
                      End; { IcnRec }

     { Puntatore al vettore dei pulsanti }
     PTRVetType=    ^IcnVetType;

     IcnRec=        Record
                      X:   Integer;
                      Y:   Integer;
                      Icn: Pointer;
                      End; { IcnRec }

     { Vettore dei pulsanti }
     IcnVetType=    Array [0..MaxIcons] Of
                      IcnRec;

     { Stringa di 2 caratteri }
     String002=       String[002];

     { Stringa di 3 caratteri }
     String003=       String[003];

     { Stringa di 5 caratteri }
     String005=       String[005];

     { Stringa di 30 caratteri }
     String030=       String[030];

     { Stringa di 80 caratteri }
     String080=       String[080];

     { Puntatore ai titoli e testi dei menu }
     PTRMenuType=     ^MenuType;

     { Titoli e testi dei menu }
     MenuType=        Array [1..MenuTitle] Of
                        Record
                        Title: String030;
                        Opz:   Array [1..MenuOpz] Of
                                 String030;
                        End;

     { Zone in cui il cursore del mouse assume aspetti differenti }
     TipoMouseCursor= (PosError, PosDisegno, PosIcone);

     { Puntatore alle operazioni effettuate sull' immagine }
     PTROperation=    ^RecOperation;

     { Record che definisce un' operazione }
     RecOp=           Record

                        { Codice della figura }
                        Figura: Word;

                        { Tipo di linea }
                        LineSt: Word;

                        { Tipo di retino per la linea }
                        LinePt: Word;

                        { Spessore della linea }
                        LineTh: Word;

                        { Colore della linea }
                        ColLin: Word;

                        { Tipo di retino per il riempimento }
                        Retino: Word;

                        { Colore del retino per il riempimento }
                        ColRet: Word;

                        { Campo numero 1 }
                        Word1:  Integer;

                        { Campo numero 2 }
                        Word2:  Integer;

                        { Campo numero 3 }
                        Word3:  Integer;

                        { Campo numero 4 }
                        Word4:  Integer;

                        { Campo numero 5 }
                        Word5:  Integer;

                        { Campo numero 6 }
                        Word6:  Integer;

                        End; { RecOp }

     { Record che definisce un' operazione (compresi i puntatori) }
     RecOperation=    Record

                        { Operazione }
                        Op:   RecOp;

                        { Prossima }
                        Next: PTROperation;

                        { Precedente }
                        Last: PTROperation;

                        End; { RecOperation }

     { File di un' immagine grafica in GIP }
     FileOperation=   File Of RecOp;

     { Puntatore alla lista di stringhe }
     PTRStrings=      ^RecStrings;

     { Record che definisce una stringa per le procedure di scrittura sul
       video come OutTextXY ed OutText }
     RecSt=           Record
                        { Numero progressivo di stringa }
                        Num:  Word;

                        { Stringa di testo }
                        St:   String[57];

                        End;

     { Record che definisce una stringa per le procedure di scrittura sul
       video come OutTextXY ed OutText (compresi i puntatori) }
     RecStrings=      Record

                        St:   RecSt;

                        { Successiva }
                        Next: PTRStrings;

                        { Precedente }
                        Last: PTRStrings;

                        End; { RecStrings }

     { File che contiene le stringhe da visualizzare }
     FileStrings=     File Of RecSt;

     { Zona in cui si trova il pulsante da premere }
     TipoZona=        (Colore, Strumenti, Frecce, Finestre, LeggiFile,
                       Long);

     { Specifica se Š necessario attendere il rilascio del pulsante sinistro
       del mouse una volta che l' icona sul video Š stata premuta }
     TipoAttesa=      (SiAttesa, NoAttesa);

     { Direzioni consentite per le barre di scorrimento laterali }
     TipoDirezione=   (Orizzontale, Verticale);

     RecRGB=          Array [0..15] Of
                        Record
                        Red:   Integer;
                        Green: Integer;
                        Blue:  Integer;
                        End; { RecRGB }

     { Contiene i settaggi correnti del programma }
     TipoSetup=       Record

                        { Fattore di correzione X }
                        XAspect:     Word;

                        { Fattore di correzione Y }
                        YAspect:     Word;

                        { Colori della tavolozza }
                        Palette:     RecRGB;

                        { Colore di primo piano }
                        ForeColor:   Word;

                        { Colore di sfondo }
                        BackColor:   Word;

                        { Retino personalizzato }
                        UserPattern: FillPatternType;

                        { Tipo di retino }
                        Pattern:     Word;

                        { Tipo di linea }
                        LineStyle:   Word;

                        { Retino di linea }
                        PatternLine: Word;

                        { Spessore della linea }
                        Thickness:   Word;

                        { Giustificazione orizzontale }
                        HorizJust:   Word;

                        { Giustificazione verticale }
                        VertJust:    Word;

                        { Tipo di font }
                        Font:        Word;

                        { Direzione del font }
                        Direction:   Word;

                        { Dimensione del font }
                        CharSize:    Word;

                        { Fattore di ingrandimento X }
                        UserMultX:   Word;

                        { Fattore di divisione X }
                        UserDivX:    Word;

                        { Fattore di ingrandimento Y }
                        UserMultY:   Word;

                        { Fattore di divisione Y }
                        UserDivY:    Word;

                        End; { TipoSetup }

     { Stato in cui si trova il programma (operazione da eseguire) }
     TipoStato=       (sAttesa, (*sZoomPiu, sZoomNorm, sZoomMeno,*)
                       sBlockMemorizza, sBlockRichiama, sBlockSposta,
                       sBlockCopia, sCerchio, sCerchioPieno,
                       sRettangolo, sRettangoloPieno, sPoligono,
                       sPoligonoPieno, sDiscoLeggi, sDiscoSalva,
                       sDiscoNuovo, sDiscoEsci, sConvTurboC,
                       sConvTurboPascal, sConvTurboAsm, sUserCharSize,
                       sSettore, sSettorePieno, sArco, sRiempimento,
                       sUserDefinedFill, sUserDefinedLn, sSceltaOggetti,
                       sDisegnoLibero, sHelpOnLine, sDiscoStampa,
                       sNewPalette, sHelpPrecedente, sHelpIndice,
                       sHelpGIP, sLinea, sRettangolo3D, sTesto, sOrologio,
                       sSfondoImmagine, sRettangolo3DPieno, sMovPrimo,
                       sMovPrec, sMovSucc, sMovUltimo, sMovDelete, sRedraw,
                       sArcoCorda, sDiscoPaletteLeggi, sDiscoPaletteSalva);

     { Indica se il disegno vuole preceduto del cambiamento dei limiti
       fisici dello schermo oppure se vuole posticipato }
     TipoDove=        (Inizio, Fine);

     PTRDirs=         ^TipoDirs;
     TipoDirs=        Array [1..MaxDirs] Of
                        Record
                        D:    SearchRec;
                        Line: String[18];
                        Path: PathStr;
                        End;
     PTRFiles=        ^TipoFiles;
     TipoFiles=       Array [1..MaxFiles] Of
                        SearchRec;
     PTRRecFileDir=   ^RecFileDir;
     RecFileDir=      Record
                        Drive:       Byte;
                        Directories: TipoDirs;
                        NumDirs:     Integer;
                        End;
     TipoFileDir=     File Of
                        RecFileDir;
     TipoOpFile=      (fLeggiFile, fSalvaFile);
     TipoLing=        (lTurboC, lTurboPascal, lTurboAsm);
     TipoAncora=      (aFisso, aMobile);
     TipoView=        (PAS, PAL, GIP);
     TipoFilePalette= File Of RecRGB;

Const

      { Tavolozza dei colori di default }
      DefaultPalette:        RecRGB=
          ((Red:000; Green:000; Blue:000),
           (Red:000; Green:000; Blue:042),
           (Red:000; Green:042; Blue:000),
           (Red:000; Green:042; Blue:042),
           (Red:042; Green:000; Blue:000),
           (Red:042; Green:000; Blue:042),
           (Red:042; Green:021; Blue:000),
           (Red:042; Green:042; Blue:042),
           (Red:021; Green:021; Blue:021),
           (Red:021; Green:021; Blue:063),
           (Red:021; Green:063; Blue:021),
           (Red:021; Green:063; Blue:063),
           (Red:063; Green:021; Blue:021),
           (Red:063; Green:021; Blue:063),
           (Red:063; Green:063; Blue:021),
           (Red:063; Green:063; Blue:063));

      { Icona : '' }
      ConstIcnBlack:         IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             224, 000, 000, 032, 224, 000, 000, 032, 224, 000, 000, 032, 192,
             000, 000, 024, 224, 000, 000, 032, 224, 000, 000, 032, 224, 000,
             000, 032, 192, 000, 000, 024, 224, 000, 000, 032, 224, 000, 000,
             032, 224, 000, 000, 032, 192, 000, 000, 024, 224, 000, 000, 032,
             224, 000, 000, 032, 224, 000, 000, 032, 192, 000, 000, 024, 224,
             000, 000, 032, 224, 000, 000, 032, 224, 000, 000, 032, 192, 000,
             000, 024, 224, 000, 000, 032, 224, 000, 000, 032, 224, 000, 000,
             032, 192, 000, 000, 024, 224, 000, 000, 032, 224, 000, 000, 032,
             224, 000, 000, 032, 192, 000, 000, 024, 224, 000, 000, 032, 224,
             000, 000, 032, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnBlue:          IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             224, 000, 000, 032, 224, 000, 000, 032, 255, 255, 255, 224, 192, 
             000, 000, 024, 224, 000, 000, 032, 224, 000, 000, 032, 255, 255, 
             255, 224, 192, 000, 000, 024, 224, 000, 000, 032, 224, 000, 000, 
             032, 255, 255, 255, 224, 192, 000, 000, 024, 224, 000, 000, 032,
             224, 000, 000, 032, 255, 255, 255, 224, 192, 000, 000, 024, 224,
             000, 000, 032, 224, 000, 000, 032, 255, 255, 255, 224, 192, 000,
             000, 024, 224, 000, 000, 032, 224, 000, 000, 032, 255, 255, 255,
             224, 192, 000, 000, 024, 224, 000, 000, 032, 224, 000, 000, 032,
             255, 255, 255, 224, 192, 000, 000, 024, 224, 000, 000, 032, 224, 
             000, 000, 032, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnGreen:         IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             224, 000, 000, 032, 255, 255, 255, 224, 224, 000, 000, 032, 192, 
             000, 000, 024, 224, 000, 000, 032, 255, 255, 255, 224, 224, 000,
             000, 032, 192, 000, 000, 024, 224, 000, 000, 032, 255, 255, 255,
             224, 224, 000, 000, 032, 192, 000, 000, 024, 224, 000, 000, 032, 
             255, 255, 255, 224, 224, 000, 000, 032, 192, 000, 000, 024, 224,
             000, 000, 032, 255, 255, 255, 224, 224, 000, 000, 032, 192, 000,
             000, 024, 224, 000, 000, 032, 255, 255, 255, 224, 224, 000, 000,
             032, 192, 000, 000, 024, 224, 000, 000, 032, 255, 255, 255, 224, 
             224, 000, 000, 032, 192, 000, 000, 024, 224, 000, 000, 032, 255, 
             255, 255, 224, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnCyan:          IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             224, 000, 000, 032, 255, 255, 255, 224, 255, 255, 255, 224, 192,
             000, 000, 024, 224, 000, 000, 032, 255, 255, 255, 224, 255, 255, 
             255, 224, 192, 000, 000, 024, 224, 000, 000, 032, 255, 255, 255, 
             224, 255, 255, 255, 224, 192, 000, 000, 024, 224, 000, 000, 032, 
             255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 224,
             000, 000, 032, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 
             000, 024, 224, 000, 000, 032, 255, 255, 255, 224, 255, 255, 255, 
             224, 192, 000, 000, 024, 224, 000, 000, 032, 255, 255, 255, 224, 
             255, 255, 255, 224, 192, 000, 000, 024, 224, 000, 000, 032, 255, 
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnRed:           IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             255, 255, 255, 224, 224, 000, 000, 032, 224, 000, 000, 032, 192, 
             000, 000, 024, 255, 255, 255, 224, 224, 000, 000, 032, 224, 000, 
             000, 032, 192, 000, 000, 024, 255, 255, 255, 224, 224, 000, 000, 
             032, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 255, 224, 
             224, 000, 000, 032, 224, 000, 000, 032, 192, 000, 000, 024, 255, 
             255, 255, 224, 224, 000, 000, 032, 224, 000, 000, 032, 192, 000, 
             000, 024, 255, 255, 255, 224, 224, 000, 000, 032, 224, 000, 000,
             032, 192, 000, 000, 024, 255, 255, 255, 224, 224, 000, 000, 032, 
             224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 255, 224, 224,
             000, 000, 032, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnMagenta:       IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             255, 255, 255, 224, 224, 000, 000, 032, 255, 255, 255, 224, 192,
             000, 000, 024, 255, 255, 255, 224, 224, 000, 000, 032, 255, 255, 
             255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 224, 000, 000,
             032, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224,
             224, 000, 000, 032, 255, 255, 255, 224, 192, 000, 000, 024, 255,
             255, 255, 224, 224, 000, 000, 032, 255, 255, 255, 224, 192, 000, 
             000, 024, 255, 255, 255, 224, 224, 000, 000, 032, 255, 255, 255,
             224, 192, 000, 000, 024, 255, 255, 255, 224, 224, 000, 000, 032,
             255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 224,
             000, 000, 032, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnBrown:         IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 255, 255, 224, 255, 255, 255, 224, 224, 000, 000, 032, 192, 
             000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 224, 000,
             000, 032, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255,
             224, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 255, 224, 
             255, 255, 255, 224, 224, 000, 000, 032, 192, 000, 000, 024, 255,
             255, 255, 224, 255, 255, 255, 224, 224, 000, 000, 032, 192, 000,
             000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 224, 000, 000, 
             032, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 
             224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 255, 224, 255, 
             255, 255, 224, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnLightGray:     IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             224, 000, 000, 032, 224, 000, 000, 032, 224, 000, 000, 032, 192,
             000, 000, 024, 239, 255, 255, 160, 239, 255, 255, 160, 239, 255, 
             255, 160, 192, 000, 000, 024, 239, 255, 255, 160, 239, 255, 255, 
             160, 239, 255, 255, 160, 192, 000, 000, 024, 239, 255, 255, 160, 
             239, 255, 255, 160, 239, 255, 255, 160, 192, 000, 000, 024, 239, 
             255, 255, 160, 239, 255, 255, 160, 239, 255, 255, 160, 192, 000, 
             000, 024, 239, 255, 255, 160, 239, 255, 255, 160, 239, 255, 255, 
             160, 192, 000, 000, 024, 239, 255, 255, 160, 239, 255, 255, 160,
             239, 255, 255, 160, 192, 000, 000, 024, 224, 000, 000, 032, 224, 
             000, 000, 032, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnDarkGray:      IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216, 
             224, 000, 000, 032, 224, 000, 000, 032, 224, 000, 000, 032, 223, 
             255, 255, 216, 224, 000, 000, 032, 224, 000, 000, 032, 224, 000,
             000, 032, 223, 255, 255, 216, 224, 000, 000, 032, 224, 000, 000, 
             032, 224, 000, 000, 032, 223, 255, 255, 216, 224, 000, 000, 032,
             224, 000, 000, 032, 224, 000, 000, 032, 223, 255, 255, 216, 224, 
             000, 000, 032, 224, 000, 000, 032, 224, 000, 000, 032, 223, 255, 
             255, 216, 224, 000, 000, 032, 224, 000, 000, 032, 224, 000, 000, 
             032, 223, 255, 255, 216, 224, 000, 000, 032, 224, 000, 000, 032, 
             224, 000, 000, 032, 223, 255, 255, 216, 224, 000, 000, 032, 224,
             000, 000, 032, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnLightBlue:     IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216, 
             224, 000, 000, 032, 224, 000, 000, 032, 255, 255, 255, 224, 223, 
             255, 255, 216, 224, 000, 000, 032, 224, 000, 000, 032, 255, 255, 
             255, 224, 223, 255, 255, 216, 224, 000, 000, 032, 224, 000, 000,
             032, 255, 255, 255, 224, 223, 255, 255, 216, 224, 000, 000, 032,
             224, 000, 000, 032, 255, 255, 255, 224, 223, 255, 255, 216, 224,
             000, 000, 032, 224, 000, 000, 032, 255, 255, 255, 224, 223, 255, 
             255, 216, 224, 000, 000, 032, 224, 000, 000, 032, 255, 255, 255,
             224, 223, 255, 255, 216, 224, 000, 000, 032, 224, 000, 000, 032,
             255, 255, 255, 224, 223, 255, 255, 216, 224, 000, 000, 032, 224, 
             000, 000, 032, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnLightGreen:    IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216,
             224, 000, 000, 032, 255, 255, 255, 224, 224, 000, 000, 032, 223,
             255, 255, 216, 224, 000, 000, 032, 255, 255, 255, 224, 224, 000,
             000, 032, 223, 255, 255, 216, 224, 000, 000, 032, 255, 255, 255,
             224, 224, 000, 000, 032, 223, 255, 255, 216, 224, 000, 000, 032, 
             255, 255, 255, 224, 224, 000, 000, 032, 223, 255, 255, 216, 224,
             000, 000, 032, 255, 255, 255, 224, 224, 000, 000, 032, 223, 255,
             255, 216, 224, 000, 000, 032, 255, 255, 255, 224, 224, 000, 000, 
             032, 223, 255, 255, 216, 224, 000, 000, 032, 255, 255, 255, 224, 
             224, 000, 000, 032, 223, 255, 255, 216, 224, 000, 000, 032, 255,
             255, 255, 224, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnLightCyan:     IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216,
             224, 000, 000, 032, 255, 255, 255, 224, 255, 255, 255, 224, 223,
             255, 255, 216, 224, 000, 000, 032, 255, 255, 255, 224, 255, 255, 
             255, 224, 223, 255, 255, 216, 224, 000, 000, 032, 255, 255, 255,
             224, 255, 255, 255, 224, 223, 255, 255, 216, 224, 000, 000, 032, 
             255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216, 224,
             000, 000, 032, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 
             255, 216, 224, 000, 000, 032, 255, 255, 255, 224, 255, 255, 255, 
             224, 223, 255, 255, 216, 224, 000, 000, 032, 255, 255, 255, 224, 
             255, 255, 255, 224, 223, 255, 255, 216, 224, 000, 000, 032, 255, 
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnLightRed:      IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216, 
             255, 255, 255, 224, 224, 000, 000, 032, 224, 000, 000, 032, 223, 
             255, 255, 216, 255, 255, 255, 224, 224, 000, 000, 032, 224, 000, 
             000, 032, 223, 255, 255, 216, 255, 255, 255, 224, 224, 000, 000, 
             032, 224, 000, 000, 032, 223, 255, 255, 216, 255, 255, 255, 224,
             224, 000, 000, 032, 224, 000, 000, 032, 223, 255, 255, 216, 255,
             255, 255, 224, 224, 000, 000, 032, 224, 000, 000, 032, 223, 255, 
             255, 216, 255, 255, 255, 224, 224, 000, 000, 032, 224, 000, 000, 
             032, 223, 255, 255, 216, 255, 255, 255, 224, 224, 000, 000, 032,
             224, 000, 000, 032, 223, 255, 255, 216, 255, 255, 255, 224, 224,
             000, 000, 032, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnLightMagenta:  IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216, 
             255, 255, 255, 224, 224, 000, 000, 032, 255, 255, 255, 224, 223, 
             255, 255, 216, 255, 255, 255, 224, 224, 000, 000, 032, 255, 255,
             255, 224, 223, 255, 255, 216, 255, 255, 255, 224, 224, 000, 000, 
             032, 255, 255, 255, 224, 223, 255, 255, 216, 255, 255, 255, 224,
             224, 000, 000, 032, 255, 255, 255, 224, 223, 255, 255, 216, 255,
             255, 255, 224, 224, 000, 000, 032, 255, 255, 255, 224, 223, 255, 
             255, 216, 255, 255, 255, 224, 224, 000, 000, 032, 255, 255, 255,
             224, 223, 255, 255, 216, 255, 255, 255, 224, 224, 000, 000, 032,
             255, 255, 255, 224, 223, 255, 255, 216, 255, 255, 255, 224, 224, 
             000, 000, 032, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnYellow:        IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216,
             255, 255, 255, 224, 255, 255, 255, 224, 224, 000, 000, 032, 223, 
             255, 255, 216, 255, 255, 255, 224, 255, 255, 255, 224, 224, 000,
             000, 032, 223, 255, 255, 216, 255, 255, 255, 224, 255, 255, 255,
             224, 224, 000, 000, 032, 223, 255, 255, 216, 255, 255, 255, 224,
             255, 255, 255, 224, 224, 000, 000, 032, 223, 255, 255, 216, 255,
             255, 255, 224, 255, 255, 255, 224, 224, 000, 000, 032, 223, 255,
             255, 216, 255, 255, 255, 224, 255, 255, 255, 224, 224, 000, 000, 
             032, 223, 255, 255, 216, 255, 255, 255, 224, 255, 255, 255, 224, 
             224, 000, 000, 032, 223, 255, 255, 216, 255, 255, 255, 224, 255, 
             255, 255, 224, 224, 000, 000, 032, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000,
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona : '' }
      ConstIcnWhite:         IcnRec255=
      (X:  28;
       Y:  13;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216,
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 223,
             255, 255, 216, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 
             255, 224, 223, 255, 255, 216, 255, 255, 255, 224, 255, 255, 255, 
             224, 255, 255, 255, 224, 223, 255, 255, 216, 255, 255, 255, 224, 
             255, 255, 255, 224, 255, 255, 255, 224, 223, 255, 255, 216, 255,
             255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 223, 255,
             255, 216, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 
             224, 223, 255, 255, 216, 255, 255, 255, 224, 255, 255, 255, 224, 
             255, 255, 255, 224, 223, 255, 255, 216, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 
             248, 128, 000, 000, 000, 128, 000, 000, 000, 128, 000, 000, 000, 
             255, 255, 255, 248, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000));


      { Icona 1: 'Freccia sinistra' }
      ConstIcnSinistra:      IcnRec127=
      (X:  13;
       Y:  13;
       Vet: (255, 252, 255, 248, 255, 248, 255, 248, 255, 252, 255, 240, 255,
             240, 255, 240, 192, 012, 255, 240, 255, 240, 255, 240, 192, 012,
             255, 144, 255, 144, 255, 240, 192, 012, 254, 016, 254, 016, 255,
             240, 192, 012, 248, 016, 248, 016, 255, 240, 192, 012, 224, 016,
             224, 016, 255, 240, 192, 012, 224, 016, 224, 016, 255, 240, 192,
             012, 248, 016, 248, 016, 255, 240, 192, 012, 254, 016, 254, 016,
             255, 240, 192, 012, 255, 144, 255, 144, 255, 240, 192, 012, 255,
             240, 255, 240, 255, 240, 255, 252, 128, 000, 128, 000, 128, 000,
             255, 252, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona 2: 'Freccia destra' }
      ConstIcnDestra:        IcnRec127=
      (X:  13;
       Y:  13;
       Vet: (255, 252, 255, 248, 255, 248, 255, 248, 255, 252, 255, 240, 255,
             240, 255, 240, 192, 012, 255, 240, 255, 240, 255, 240, 192, 012,
             231, 240, 231, 240, 255, 240, 192, 012, 225, 240, 225, 240, 255,
             240, 192, 012, 224, 112, 224, 112, 255, 240, 192, 012, 224, 016,
             224, 016, 255, 240, 192, 012, 224, 016, 224, 016, 255, 240, 192,
             012, 224, 112, 224, 112, 255, 240, 192, 012, 225, 240, 225, 240,
             255, 240, 192, 012, 231, 240, 231, 240, 255, 240, 192, 012, 255,
             240, 255, 240, 255, 240, 255, 252, 128, 000, 128, 000, 128, 000,
             255, 252, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona 3: 'Freccia su' }
      ConstIcnAlto:          IcnRec127=
      (X:  13;
       Y:  13;
       Vet: (255, 252, 255, 248, 255, 248, 255, 248, 255, 252, 255, 240, 255, 
             240, 255, 240, 192, 012, 255, 240, 255, 240, 255, 240, 192, 012,
             252, 240, 252, 240, 255, 240, 192, 012, 252, 240, 252, 240, 255,
             240, 192, 012, 248, 112, 248, 112, 255, 240, 192, 012, 248, 112, 
             248, 112, 255, 240, 192, 012, 240, 048, 240, 048, 255, 240, 192,
             012, 240, 048, 240, 048, 255, 240, 192, 012, 224, 016, 224, 016,
             255, 240, 192, 012, 224, 016, 224, 016, 255, 240, 192, 012, 255, 
             240, 255, 240, 255, 240, 255, 252, 128, 000, 128, 000, 128, 000,
             255, 252, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona 4: 'Freccia gi—' }
      ConstIcnBasso:         IcnRec127=
      (X:  13;
       Y:  13;
       Vet: (255, 252, 255, 248, 255, 248, 255, 248, 255, 252, 255, 240, 255,
             240, 255, 240, 192, 012, 255, 240, 255, 240, 255, 240, 192, 012,
             224, 016, 224, 016, 255, 240, 192, 012, 224, 016, 224, 016, 255,
             240, 192, 012, 240, 048, 240, 048, 255, 240, 192, 012, 240, 048,
             240, 048, 255, 240, 192, 012, 248, 112, 248, 112, 255, 240, 192,
             012, 248, 112, 248, 112, 255, 240, 192, 012, 252, 240, 252, 240,
             255, 240, 192, 012, 252, 240, 252, 240, 255, 240, 192, 012, 255,
             240, 255, 240, 255, 240, 255, 252, 128, 000, 128, 000, 128, 000,
             255, 252, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona 5: 'Scelta oggetti' }
      ConstIcnSceltaOggetti: IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 
             000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 
             255, 224, 192, 000, 000, 024, 255, 191, 255, 224, 255, 191, 255, 
             224, 255, 191, 255, 224, 192, 000, 000, 024, 255, 159, 255, 224, 
             255, 159, 255, 224, 255, 159, 255, 224, 192, 000, 000, 024, 255, 
             143, 255, 224, 255, 143, 255, 224, 255, 143, 255, 224, 192, 000, 
             000, 024, 255, 135, 255, 224, 255, 135, 255, 224, 255, 135, 255,
             224, 192, 000, 000, 024, 255, 131, 255, 224, 255, 131, 255, 224,
             255, 131, 255, 224, 192, 000, 000, 024, 255, 129, 255, 224, 255,
             129, 255, 224, 255, 129, 255, 224, 192, 000, 000, 024, 255, 128, 
             255, 224, 255, 128, 255, 224, 255, 128, 255, 224, 192, 000, 000,
             024, 255, 128, 127, 224, 255, 128, 127, 224, 255, 128, 127, 224,
             192, 000, 000, 024, 255, 128, 063, 224, 255, 128, 063, 224, 255, 
             128, 063, 224, 192, 000, 000, 024, 255, 128, 031, 224, 255, 128,
             031, 224, 255, 128, 031, 224, 192, 000, 000, 024, 255, 128, 015,
             224, 255, 128, 015, 224, 255, 128, 015, 224, 192, 000, 000, 024, 
             255, 128, 255, 224, 255, 128, 255, 224, 255, 128, 255, 224, 192,
             000, 000, 024, 255, 128, 255, 224, 255, 128, 255, 224, 255, 128,
             255, 224, 192, 000, 000, 024, 255, 156, 127, 224, 255, 156, 127, 
             224, 255, 156, 127, 224, 192, 000, 000, 024, 255, 252, 127, 224, 
             255, 252, 127, 224, 255, 252, 127, 224, 192, 000, 000, 024, 255, 
             254, 063, 224, 255, 254, 063, 224, 255, 254, 063, 224, 192, 000, 
             000, 024, 255, 254, 063, 224, 255, 254, 063, 224, 255, 254, 063, 
             224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 
             255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000, 
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona 6: 'Operazioni disco' }
      ConstIcnOpDisco:       IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 
             000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255,
             255, 224, 192, 000, 000, 024, 248, 000, 000, 224, 248, 000, 000,
             224, 255, 255, 255, 224, 192, 000, 000, 024, 248, 000, 000, 224,
             248, 255, 248, 224, 255, 000, 007, 224, 192, 000, 000, 024, 248, 
             000, 002, 224, 248, 128, 010, 224, 255, 000, 007, 224, 192, 000,
             000, 024, 248, 000, 002, 224, 248, 255, 250, 224, 255, 000, 007,
             224, 192, 000, 000, 024, 248, 000, 000, 224, 248, 128, 008, 224,
             255, 000, 007, 224, 192, 000, 000, 024, 248, 000, 000, 224, 248,
             255, 248, 224, 255, 000, 007, 224, 192, 000, 000, 024, 248, 000,
             000, 224, 248, 128, 008, 224, 255, 000, 007, 224, 192, 000, 000,
             024, 248, 000, 000, 224, 248, 255, 248, 224, 255, 000, 007, 224,
             192, 000, 000, 024, 248, 000, 000, 224, 248, 128, 008, 224, 255, 
             000, 007, 224, 192, 000, 000, 024, 248, 000, 000, 224, 248, 255, 
             248, 224, 255, 000, 007, 224, 192, 000, 000, 024, 248, 000, 000,
             224, 248, 000, 000, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             248, 000, 000, 224, 248, 000, 000, 224, 255, 255, 255, 224, 192, 
             127, 240, 024, 248, 000, 000, 224, 248, 000, 000, 224, 255, 128,
             015, 224, 192, 071, 240, 024, 248, 000, 000, 224, 248, 000, 000,
             224, 255, 184, 015, 224, 192, 071, 240, 024, 248, 000, 000, 224, 
             248, 000, 000, 224, 255, 184, 015, 224, 192, 071, 240, 024, 248,
             000, 000, 224, 248, 000, 000, 224, 255, 184, 015, 224, 192, 071, 
             240, 024, 248, 000, 000, 224, 248, 000, 000, 224, 255, 184, 015,
             224, 192, 071, 240, 024, 248, 000, 000, 224, 248, 000, 000, 224,
             255, 184, 015, 224, 192, 127, 240, 024, 248, 000, 000, 224, 248, 
             000, 000, 224, 255, 128, 015, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000,
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

(*      { Icona 7: 'Zoom' }
      ConstIcnZoom:          IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192,
             000, 000, 024, 255, 007, 255, 224, 255, 007, 255, 224, 255, 255,
             255, 224, 192, 000, 000, 024, 252, 001, 252, 224, 252, 001, 252,
             224, 255, 255, 252, 224, 192, 248, 000, 024, 248, 000, 252, 224,
             248, 000, 252, 224, 255, 007, 252, 224, 193, 252, 000, 024, 240,
             000, 112, 032, 240, 000, 112, 032, 254, 003, 240, 032, 199, 254,
             000, 024, 240, 000, 112, 032, 240, 000, 112, 032, 248, 001, 240,
             032, 199, 255, 000, 024, 224, 000, 060, 224, 224, 000, 060, 224,
             248, 000, 252, 224, 199, 255, 000, 024, 224, 000, 060, 224, 224,
             000, 060, 224, 248, 000, 252, 224, 199, 255, 000, 024, 224, 000,
             063, 224, 224, 000, 063, 224, 248, 000, 255, 224, 199, 255, 000,
             024, 224, 000, 063, 224, 224, 000, 063, 224, 248, 000, 255, 224,
             199, 255, 000, 024, 224, 000, 048, 032, 224, 000, 048, 032, 248,
             000, 240, 032, 195, 254, 000, 024, 240, 000, 112, 032, 240, 000,
             112, 032, 252, 001, 240, 032, 193, 252, 000, 024, 240, 000, 127,
             224, 240, 000, 127, 224, 254, 003, 255, 224, 192, 248, 000, 024,
             248, 000, 063, 224, 248, 000, 063, 224, 255, 007, 255, 224, 192,
             000, 000, 024, 252, 000, 031, 224, 252, 000, 031, 224, 255, 255,
             255, 224, 192, 000, 000, 024, 255, 006, 015, 224, 255, 006, 015,
             224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 007, 224,
             255, 255, 007, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255,
             255, 131, 224, 255, 255, 131, 224, 255, 255, 255, 224, 192, 000,
             000, 024, 255, 255, 195, 224, 255, 255, 195, 224, 255, 255, 255,
             224, 192, 000, 000, 024, 255, 255, 227, 224, 255, 255, 227, 224,
             255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000,
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));
*)
      ConstIcnPalette:       IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 
             000, 000, 024, 255, 252, 031, 224, 255, 252, 031, 224, 255, 252, 
             031, 224, 192, 003, 224, 024, 255, 227, 231, 224, 255, 227, 231, 
             224, 255, 227, 231, 224, 192, 031, 248, 024, 255, 223, 251, 224, 
             255, 223, 251, 224, 255, 223, 251, 224, 192, 049, 140, 024, 255, 
             049, 141, 224, 255, 049, 253, 224, 255, 063, 141, 224, 192, 225, 
             132, 024, 254, 225, 133, 224, 254, 225, 253, 224, 254, 255, 133, 
             224, 193, 143, 196, 024, 253, 143, 197, 224, 253, 143, 253, 224, 
             253, 255, 197, 224, 193, 249, 228, 024, 253, 249, 229, 224, 253, 
             249, 253, 224, 253, 249, 229, 224, 193, 224, 252, 024, 253, 238, 
             253, 224, 253, 238, 253, 224, 253, 238, 253, 224, 192, 049, 248, 
             024, 254, 049, 251, 224, 254, 049, 251, 224, 254, 049, 251, 224, 
             192, 063, 048, 024, 255, 191, 247, 224, 255, 191, 055, 224, 255, 
             191, 055, 224, 192, 120, 096, 024, 255, 127, 239, 224, 255, 120, 
             111, 224, 255, 120, 111, 224, 192, 249, 192, 024, 254, 255, 223,
             224, 254, 249, 223, 224, 254, 249, 223, 224, 192, 255, 000, 024, 
             254, 255, 063, 224, 254, 255, 063, 224, 254, 255, 063, 224, 192, 
             120, 000, 024, 255, 120, 255, 224, 255, 120, 255, 224, 255, 120, 
             255, 224, 192, 000, 000, 024, 255, 135, 255, 224, 255, 135, 255, 
             224, 255, 135, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 
             255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 
             255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 
             000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 
             224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 
             255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000, 
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000));

      { Icona 8: 'Sposta schermo' }
      ConstIcnSpostaSchermo: IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 253, 255, 224, 255, 253, 255, 224, 255, 253, 255, 224, 192, 
             000, 000, 024, 255, 250, 255, 224, 255, 248, 255, 224, 255, 250, 
             255, 224, 192, 000, 000, 024, 255, 247, 127, 224, 255, 240, 127, 
             224, 255, 247, 127, 224, 192, 000, 000, 024, 255, 239, 191, 224, 
             255, 224, 063, 224, 255, 239, 191, 224, 192, 000, 000, 024, 255,
             223, 223, 224, 255, 192, 031, 224, 255, 223, 223, 224, 192, 000, 
             000, 024, 255, 194, 031, 224, 255, 192, 031, 224, 255, 194, 031,
             224, 192, 000, 000, 024, 255, 250, 255, 224, 255, 248, 255, 224,
             255, 250, 255, 224, 192, 000, 000, 024, 254, 122, 243, 224, 254, 
             120, 243, 224, 254, 122, 243, 224, 192, 000, 000, 024, 253, 122, 
             245, 224, 252, 120, 241, 224, 253, 122, 245, 224, 192, 000, 000, 
             024, 251, 122, 246, 224, 248, 120, 240, 224, 251, 122, 246, 224,
             192, 000, 000, 024, 247, 002, 007, 096, 240, 000, 000, 096, 247,
             002, 007, 096, 192, 000, 000, 024, 239, 255, 255, 160, 224, 000,
             000, 032, 239, 255, 255, 160, 192, 000, 000, 024, 247, 002, 007,
             096, 240, 000, 000, 096, 247, 002, 007, 096, 192, 000, 000, 024,
             251, 122, 246, 224, 248, 120, 240, 224, 251, 122, 246, 224, 192,
             000, 000, 024, 253, 122, 245, 224, 252, 120, 241, 224, 253, 122, 
             245, 224, 192, 000, 000, 024, 254, 122, 243, 224, 254, 120, 243,
             224, 254, 122, 243, 224, 192, 000, 000, 024, 255, 250, 255, 224,
             255, 248, 255, 224, 255, 250, 255, 224, 192, 000, 000, 024, 255, 
             194, 031, 224, 255, 192, 031, 224, 255, 194, 031, 224, 192, 000, 
             000, 024, 255, 223, 223, 224, 255, 192, 031, 224, 255, 223, 223, 
             224, 192, 000, 000, 024, 255, 239, 191, 224, 255, 224, 063, 224,
             255, 239, 191, 224, 192, 000, 000, 024, 255, 247, 127, 224, 255, 
             240, 127, 224, 255, 247, 127, 224, 192, 000, 000, 024, 255, 250,
             255, 224, 255, 248, 255, 224, 255, 250, 255, 224, 192, 000, 000, 
             024, 255, 253, 255, 224, 255, 253, 255, 224, 255, 253, 255, 224, 
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000, 
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona 9: 'Disegno libero' }
      ConstIcnDisegnoLibero: IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             248, 015, 255, 224, 248, 015, 255, 224, 248, 015, 255, 224, 192, 
             000, 000, 024, 247, 255, 241, 224, 247, 255, 241, 224, 247, 255, 
             241, 224, 192, 000, 000, 024, 239, 255, 224, 224, 239, 255, 228, 
             224, 239, 255, 224, 224, 192, 000, 000, 024, 239, 255, 192, 096, 
             239, 255, 206, 096, 239, 255, 192, 096, 192, 000, 000, 024, 239,
             255, 128, 096, 239, 255, 159, 096, 239, 255, 128, 096, 192, 000,
             000, 024, 239, 255, 000, 096, 239, 255, 062, 096, 239, 255, 000, 
             096, 192, 000, 000, 024, 247, 254, 000, 224, 247, 254, 124, 224,
             247, 254, 000, 224, 192, 000, 000, 024, 251, 252, 001, 224, 251,
             252, 249, 224, 251, 252, 001, 224, 192, 000, 000, 024, 252, 248,
             003, 224, 252, 249, 243, 224, 252, 248, 003, 224, 192, 000, 000,
             024, 254, 240, 007, 224, 254, 243, 231, 224, 254, 240, 007, 224,
             192, 000, 000, 024, 254, 224, 015, 224, 254, 231, 207, 224, 254, 
             224, 015, 224, 192, 000, 000, 024, 254, 232, 031, 224, 254, 235, 
             159, 224, 254, 232, 031, 224, 192, 000, 000, 024, 253, 236, 063,
             224, 253, 237, 063, 224, 253, 236, 063, 224, 192, 000, 000, 024, 
             251, 238, 127, 224, 251, 238, 127, 224, 251, 238, 127, 224, 192,
             000, 000, 024, 251, 224, 255, 224, 251, 224, 255, 224, 251, 224,
             255, 224, 192, 000, 000, 024, 247, 239, 255, 224, 247, 239, 255,
             224, 247, 239, 255, 224, 192, 000, 000, 024, 247, 247, 255, 224, 
             247, 247, 255, 224, 247, 247, 255, 224, 192, 000, 000, 024, 247, 
             247, 255, 224, 247, 247, 255, 224, 247, 247, 255, 224, 192, 000, 
             000, 024, 247, 247, 255, 224, 247, 247, 255, 224, 247, 247, 255, 
             224, 192, 000, 000, 024, 251, 239, 255, 224, 251, 239, 255, 224,
             251, 239, 255, 224, 192, 000, 000, 024, 252, 031, 255, 224, 252,
             031, 255, 224, 252, 031, 255, 224, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000,
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona 10: 'Operazioni blocco' }
      ConstIcnOpBlocchi:     IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             224, 000, 255, 224, 224, 000, 255, 224, 224, 000, 255, 224, 202,
             170, 000, 024, 234, 170, 255, 224, 234, 170, 255, 224, 224, 000,
             255, 224, 192, 000, 000, 024, 224, 000, 255, 224, 231, 252, 255,
             224, 231, 252, 255, 224, 200, 002, 000, 024, 232, 002, 255, 224,
             239, 254, 255, 224, 231, 252, 255, 224, 192, 000, 000, 024, 224, 
             000, 255, 224, 231, 252, 255, 224, 231, 252, 255, 224, 200, 002,
             000, 024, 232, 002, 255, 224, 239, 254, 255, 224, 231, 252, 255,
             224, 192, 000, 000, 024, 224, 000, 255, 224, 231, 252, 255, 224, 
             231, 252, 255, 224, 200, 002, 000, 024, 232, 002, 223, 096, 239, 
             254, 223, 096, 231, 252, 223, 096, 192, 000, 000, 024, 224, 000,
             142, 032, 231, 252, 174, 160, 231, 252, 142, 032, 200, 002, 000, 
             024, 232, 002, 142, 032, 239, 254, 174, 160, 231, 252, 142, 032,
             192, 000, 000, 024, 224, 000, 196, 096, 231, 252, 213, 096, 231, 
             252, 196, 096, 200, 002, 000, 024, 232, 002, 196, 096, 239, 254, 
             213, 096, 231, 252, 196, 096, 192, 000, 000, 024, 224, 000, 224, 
             224, 231, 252, 234, 224, 231, 252, 224, 224, 202, 170, 000, 024, 
             234, 170, 224, 224, 234, 170, 234, 224, 224, 000, 224, 224, 192,
             000, 000, 024, 224, 000, 241, 224, 224, 000, 245, 224, 224, 000,
             241, 224, 192, 000, 000, 024, 255, 255, 192, 096, 255, 255, 196, 
             096, 255, 255, 192, 096, 192, 000, 000, 024, 255, 255, 128, 032,
             255, 255, 187, 160, 255, 255, 128, 032, 192, 000, 000, 024, 255,
             255, 000, 000, 255, 255, 074, 064, 255, 255, 000, 000, 192, 000,
             000, 024, 255, 255, 000, 000, 255, 255, 074, 064, 255, 255, 000,
             000, 192, 000, 000, 024, 255, 255, 000, 000, 255, 255, 074, 064,
             255, 255, 000, 000, 192, 000, 000, 024, 255, 255, 000, 000, 255, 
             255, 074, 064, 255, 255, 000, 000, 192, 000, 000, 024, 255, 255,
             132, 032, 255, 255, 181, 160, 255, 255, 132, 032, 192, 000, 000,
             024, 255, 255, 206, 096, 255, 255, 206, 096, 255, 255, 206, 096, 
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000));

      { Icona 11: 'Conversione' }
      ConstIcnConversione:   IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             255, 255, 131, 224, 255, 255, 131, 224, 255, 255, 255, 224, 192,
             000, 000, 024, 255, 254, 124, 224, 255, 254, 124, 224, 255, 255,
             255, 224, 192, 000, 000, 024, 255, 255, 255, 096, 255, 224, 007,
             096, 255, 224, 007, 224, 192, 000, 000, 024, 255, 253, 255, 096, 
             255, 237, 247, 096, 255, 239, 247, 224, 192, 000, 000, 024, 252,
             059, 255, 160, 252, 043, 247, 160, 252, 047, 247, 224, 192, 000, 
             000, 024, 248, 059, 255, 160, 248, 043, 247, 160, 248, 047, 247, 
             224, 192, 000, 000, 024, 243, 251, 255, 160, 243, 235, 247, 160, 
             243, 239, 247, 224, 192, 000, 000, 024, 243, 255, 255, 096, 243, 
             224, 007, 096, 243, 224, 007, 224, 192, 000, 000, 024, 243, 253,
             255, 096, 243, 253, 255, 096, 243, 255, 255, 224, 192, 000, 000,
             024, 243, 254, 124, 224, 243, 254, 124, 224, 243, 255, 255, 224, 
             192, 000, 000, 024, 243, 255, 131, 224, 243, 255, 131, 224, 243,
             255, 255, 224, 192, 000, 000, 024, 243, 255, 255, 224, 243, 255,
             255, 224, 243, 255, 255, 224, 192, 000, 000, 024, 243, 255, 255,
             224, 243, 255, 255, 224, 243, 255, 255, 224, 192, 000, 000, 024, 
             243, 255, 255, 224, 243, 255, 003, 224, 243, 255, 255, 224, 192, 
             000, 000, 024, 243, 255, 255, 224, 243, 255, 255, 224, 243, 255,
             255, 224, 192, 000, 000, 024, 243, 239, 255, 224, 243, 239, 018,
             224, 243, 239, 255, 224, 192, 000, 000, 024, 243, 231, 255, 224, 
             243, 231, 255, 224, 243, 231, 255, 224, 192, 000, 000, 024, 243,
             227, 255, 224, 243, 227, 019, 224, 243, 227, 255, 224, 192, 000,
             000, 024, 248, 001, 255, 224, 248, 001, 255, 224, 248, 001, 255, 
             224, 192, 000, 000, 024, 252, 001, 255, 224, 252, 001, 036, 096,
             252, 001, 255, 224, 192, 000, 000, 024, 255, 227, 255, 224, 255,
             227, 255, 224, 255, 227, 255, 224, 192, 000, 000, 024, 255, 231, 
             255, 224, 255, 231, 001, 224, 255, 231, 255, 224, 192, 000, 000, 
             024, 255, 239, 255, 224, 255, 239, 255, 224, 255, 239, 255, 224, 
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona 12: 'Help on-line' }
      ConstIcnHelpOnLine:    IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 224, 127, 224, 255, 224, 127, 224, 255, 224, 127, 224, 192, 
             015, 000, 024, 255, 138, 031, 224, 255, 143, 031, 224, 255, 133, 
             031, 224, 192, 063, 192, 024, 255, 021, 079, 224, 255, 063, 207,
             224, 255, 042, 143, 224, 192, 127, 224, 024, 254, 042, 167, 224,
             254, 127, 231, 224, 254, 085, 071, 224, 192, 240, 240, 024, 254, 
             080, 087, 224, 254, 240, 247, 224, 254, 160, 167, 224, 192, 224,
             112, 024, 252, 166, 035, 224, 252, 230, 115, 224, 252, 070, 083,
             224, 193, 224, 056, 024, 253, 079, 019, 224, 253, 239, 059, 224,
             252, 175, 043, 224, 193, 192, 056, 024, 252, 143, 171, 224, 253, 
             207, 187, 224, 253, 079, 147, 224, 192, 192, 056, 024, 252, 095, 
             147, 224, 252, 223, 187, 224, 252, 159, 171, 224, 192, 000, 056, 
             024, 254, 031, 043, 224, 254, 031, 059, 224, 254, 031, 019, 224, 
             192, 000, 120, 024, 255, 248, 083, 224, 255, 248, 123, 224, 255,
             248, 043, 224, 192, 003, 240, 024, 255, 226, 163, 224, 255, 227,
             243, 224, 255, 225, 083, 224, 192, 015, 224, 024, 255, 197, 071,
             224, 255, 207, 231, 224, 255, 202, 167, 224, 192, 031, 128, 024,
             255, 202, 143, 224, 255, 223, 143, 224, 255, 213, 015, 224, 192,
             030, 000, 024, 255, 212, 063, 224, 255, 222, 063, 224, 255, 202, 
             063, 224, 192, 030, 000, 024, 255, 202, 255, 224, 255, 222, 255, 
             224, 255, 212, 255, 224, 192, 012, 000, 024, 255, 196, 255, 224,
             255, 204, 255, 224, 255, 200, 255, 224, 192, 000, 000, 024, 255, 
             225, 255, 224, 255, 225, 255, 224, 255, 225, 255, 224, 192, 012,
             000, 024, 255, 196, 255, 224, 255, 204, 255, 224, 255, 200, 255,
             224, 192, 030, 000, 024, 255, 202, 255, 224, 255, 222, 255, 224, 
             255, 212, 255, 224, 192, 030, 000, 024, 255, 212, 255, 224, 255,
             222, 255, 224, 255, 202, 255, 224, 192, 012, 000, 024, 255, 200,
             255, 224, 255, 204, 255, 224, 255, 196, 255, 224, 192, 000, 000,
             024, 255, 225, 255, 224, 255, 225, 255, 224, 255, 225, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona 13: 'Tipo di font' }
      ConstIcnSceltaFont:    IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192,
             000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255,
             255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255,
             224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224,
             255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255,
             255, 255, 224, 255, 224, 127, 224, 255, 224, 127, 224, 192, 000,
             000, 024, 255, 255, 255, 224, 255, 224, 127, 224, 255, 224, 127,
             224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 134, 031, 224,
             255, 134, 031, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255,
             134, 031, 224, 255, 134, 031, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 254, 031, 135, 224, 254, 031, 135, 224, 192, 000, 000,
             024, 255, 255, 255, 224, 254, 031, 135, 224, 254, 031, 135, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 254, 031, 135, 224, 254,
             031, 135, 224, 192, 000, 000, 024, 255, 255, 255, 224, 254, 031,
             135, 224, 254, 031, 135, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 254, 000, 007, 224, 254, 000, 007, 224, 192, 000, 000, 024,
             255, 255, 255, 224, 254, 000, 007, 224, 254, 000, 007, 224, 192,
             000, 000, 024, 255, 255, 255, 224, 254, 031, 135, 224, 254, 031,
             135, 224, 192, 000, 000, 024, 255, 255, 255, 224, 254, 031, 135,
             224, 254, 031, 135, 224, 192, 000, 000, 024, 255, 255, 255, 224,
             254, 031, 135, 224, 254, 031, 135, 224, 192, 000, 000, 024, 255,
             255, 255, 224, 254, 031, 135, 224, 254, 031, 135, 224, 192, 000,
             000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224,
             255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000,
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      ConstIcnSceltaForma:   IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 224, 063, 224, 255, 224, 063, 224, 255, 255, 255, 224, 192,
             000, 000, 024, 255, 128, 015, 224, 255, 128, 015, 224, 255, 255,
             255, 224, 192, 000, 000, 024, 255, 000, 007, 224, 255, 000, 007,
             224, 255, 255, 255, 224, 192, 000, 000, 024, 252, 015, 129, 224,
             252, 015, 129, 224, 255, 255, 255, 224, 192, 000, 000, 024, 252,
             063, 225, 224, 252, 063, 225, 224, 255, 255, 255, 224, 192, 000,
             000, 024, 248, 255, 248, 224, 248, 255, 248, 224, 255, 255, 255,
             224, 192, 000, 000, 024, 240, 255, 248, 096, 240, 255, 248, 096, 
             255, 255, 255, 224, 192, 000, 000, 024, 241, 255, 252, 096, 241,
             255, 252, 096, 255, 255, 255, 224, 192, 000, 000, 024, 225, 255,
             252, 032, 225, 255, 252, 032, 255, 255, 255, 224, 192, 000, 000, 
             024, 227, 255, 254, 032, 227, 255, 254, 032, 255, 255, 255, 224,
             192, 000, 000, 024, 227, 255, 254, 032, 227, 255, 254, 032, 255,
             255, 255, 224, 192, 000, 000, 024, 227, 255, 254, 032, 227, 255,
             254, 032, 255, 255, 255, 224, 192, 000, 000, 024, 227, 255, 254,
             032, 227, 255, 254, 032, 255, 255, 255, 224, 192, 000, 000, 024, 
             227, 255, 254, 032, 227, 255, 254, 032, 255, 255, 255, 224, 192, 
             000, 000, 024, 225, 255, 252, 032, 225, 255, 252, 032, 255, 255,
             255, 224, 192, 000, 000, 024, 241, 255, 252, 096, 241, 255, 252, 
             096, 255, 255, 255, 224, 192, 000, 000, 024, 240, 255, 248, 096, 
             240, 255, 248, 096, 255, 255, 255, 224, 192, 000, 000, 024, 248,
             255, 248, 224, 248, 255, 248, 224, 255, 255, 255, 224, 192, 000, 
             000, 024, 252, 063, 225, 224, 252, 063, 225, 224, 255, 255, 255,
             224, 192, 000, 000, 024, 252, 015, 129, 224, 252, 015, 129, 224,
             255, 255, 255, 224, 192, 000, 000, 024, 255, 000, 007, 224, 255,
             000, 007, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 128,
             015, 224, 255, 128, 015, 224, 255, 255, 255, 224, 192, 000, 000,
             024, 255, 224, 063, 224, 255, 224, 063, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona 15: 'Tipo di retino' }
      ConstIcnSceltaRetino:  IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             226, 035, 098, 032, 226, 035, 098, 032, 226, 035, 098, 032, 192, 
             000, 000, 024, 234, 247, 106, 160, 234, 247, 106, 160, 234, 247,
             106, 160, 192, 000, 000, 024, 230, 119, 106, 160, 230, 119, 106,
             160, 230, 119, 106, 160, 192, 000, 000, 024, 234, 247, 106, 160, 
             234, 247, 106, 160, 234, 247, 106, 160, 192, 000, 000, 024, 234,
             055, 106, 032, 234, 055, 106, 032, 234, 055, 106, 032, 192, 000, 
             000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255,
             224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224,
             255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 224, 199, 255, 255, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 248, 000, 000, 224, 196, 000, 001, 
             024, 252, 000, 001, 224, 252, 000, 001, 224, 248, 000, 000, 224, 
             196, 000, 001, 024, 252, 000, 001, 224, 252, 000, 001, 224, 248, 
             000, 000, 224, 196, 000, 001, 024, 252, 000, 001, 224, 252, 000,
             001, 224, 248, 000, 000, 224, 196, 000, 001, 024, 252, 000, 001,
             224, 252, 000, 001, 224, 248, 000, 000, 224, 196, 000, 001, 024,
             252, 000, 001, 224, 252, 000, 001, 224, 248, 000, 000, 224, 196, 
             000, 001, 024, 252, 000, 001, 224, 252, 000, 001, 224, 248, 000,
             000, 224, 196, 000, 001, 024, 252, 000, 001, 224, 252, 000, 001,
             224, 248, 000, 000, 224, 196, 000, 001, 024, 252, 000, 001, 224, 
             252, 000, 001, 224, 248, 000, 000, 224, 196, 000, 001, 024, 252,
             000, 001, 224, 252, 000, 001, 224, 248, 000, 000, 224, 196, 000,
             001, 024, 252, 000, 001, 224, 252, 000, 001, 224, 248, 000, 000, 
             224, 196, 000, 001, 024, 252, 000, 001, 224, 252, 000, 001, 224,
             248, 000, 000, 224, 199, 255, 255, 024, 255, 255, 255, 224, 255,
             255, 255, 224, 248, 000, 000, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000, 
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona 16: 'Tipo di linea' }
      ConstIcnSceltaLinea:   IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192,
             000, 000, 024, 255, 223, 255, 224, 255, 223, 255, 224, 255, 223,
             255, 224, 192, 000, 000, 024, 255, 223, 255, 224, 255, 223, 247,
             224, 255, 223, 255, 224, 192, 000, 000, 024, 255, 143, 255, 224,
             255, 143, 247, 224, 255, 143, 255, 224, 192, 000, 000, 024, 255,
             143, 255, 224, 255, 143, 247, 224, 255, 143, 255, 224, 192, 000, 
             000, 024, 255, 087, 255, 224, 255, 087, 247, 224, 255, 087, 255,
             224, 192, 000, 000, 024, 254, 219, 255, 224, 254, 219, 247, 224, 
             254, 219, 255, 224, 192, 000, 000, 024, 253, 221, 255, 224, 253,
             221, 247, 224, 253, 221, 255, 224, 192, 000, 000, 024, 251, 142, 
             255, 224, 251, 142, 247, 224, 251, 142, 255, 224, 192, 000, 000, 
             024, 251, 222, 255, 224, 251, 222, 247, 224, 251, 222, 255, 224, 
             192, 000, 000, 024, 251, 254, 255, 224, 251, 254, 247, 224, 251, 
             254, 255, 224, 192, 000, 000, 024, 251, 254, 255, 224, 251, 254,
             247, 224, 251, 254, 255, 224, 192, 000, 000, 024, 253, 253, 255,
             224, 253, 253, 247, 224, 253, 253, 255, 224, 192, 000, 000, 024, 
             253, 253, 255, 224, 253, 253, 247, 224, 253, 253, 255, 224, 192,
             000, 000, 024, 252, 001, 255, 224, 252, 001, 247, 224, 252, 001,
             255, 224, 192, 000, 000, 024, 252, 001, 255, 224, 253, 253, 247,
             224, 252, 001, 255, 224, 192, 000, 000, 024, 252, 001, 255, 224,
             253, 253, 247, 224, 252, 001, 255, 224, 192, 000, 000, 024, 252,
             001, 255, 224, 253, 253, 247, 224, 252, 001, 255, 224, 192, 000,
             000, 024, 252, 001, 255, 224, 253, 253, 247, 224, 252, 001, 255,
             224, 192, 000, 000, 024, 252, 001, 255, 224, 253, 253, 247, 224,
             252, 001, 255, 224, 192, 000, 000, 024, 252, 001, 255, 224, 252,
             001, 247, 224, 252, 001, 255, 224, 192, 000, 000, 024, 255, 255,
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000,
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000,
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona   : 'Disegno dell' orologio' }
      ConstIcnOrologio:      IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255, 
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255, 
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 
             000, 000, 024, 255, 224, 063, 224, 255, 224, 063, 224, 255, 255, 
             255, 224, 192, 000, 000, 024, 255, 128, 015, 224, 255, 159, 207, 
             224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 000, 007, 224, 
             255, 125, 247, 224, 255, 255, 255, 224, 192, 000, 000, 024, 254, 
             000, 003, 224, 254, 253, 251, 224, 255, 255, 255, 224, 192, 000, 
             000, 024, 252, 000, 001, 224, 253, 253, 253, 224, 255, 255, 255,
             224, 192, 000, 000, 024, 248, 000, 000, 224, 251, 255, 254, 224, 
             255, 255, 255, 224, 192, 000, 000, 024, 248, 000, 000, 224, 251, 
             255, 254, 224, 255, 255, 255, 224, 192, 000, 000, 024, 240, 000, 
             064, 096, 247, 255, 191, 096, 255, 255, 191, 224, 192, 000, 000, 
             024, 240, 000, 128, 096, 247, 255, 127, 096, 255, 255, 127, 224, 
             192, 000, 000, 024, 240, 001, 000, 096, 247, 254, 255, 096, 255, 
             254, 255, 224, 192, 000, 000, 024, 240, 002, 000, 096, 244, 125, 
             241, 096, 255, 253, 255, 224, 192, 000, 000, 024, 240, 001, 000,
             096, 247, 254, 255, 096, 255, 254, 255, 224, 192, 000, 000, 024, 
             240, 000, 128, 096, 247, 255, 127, 096, 255, 255, 127, 224, 192, 
             000, 000, 024, 240, 000, 064, 096, 247, 255, 191, 096, 255, 255, 
             191, 224, 192, 000, 000, 024, 248, 000, 032, 224, 251, 255, 222, 
             224, 255, 255, 223, 224, 192, 000, 000, 024, 248, 000, 016, 224, 
             251, 255, 238, 224, 255, 255, 239, 224, 192, 000, 000, 024, 252, 
             000, 001, 224, 253, 253, 253, 224, 255, 255, 255, 224, 192, 000, 
             000, 024, 254, 000, 003, 224, 254, 253, 251, 224, 255, 255, 255, 
             224, 192, 000, 000, 024, 255, 000, 007, 224, 255, 125, 247, 224, 
             255, 255, 255, 224, 192, 000, 000, 024, 255, 130, 015, 224, 255, 
             159, 207, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 224,
             063, 224, 255, 224, 063, 224, 255, 255, 255, 224, 192, 000, 000, 
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000, 
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona : 'Attivazione' }
      ConstIcnAttivo:        IcnRec511=
      (X:  28;
       Y:  28;
       Vet: (255, 255, 255, 248, 255, 255, 255, 240, 255, 255, 255, 240, 255,
             255, 255, 240, 255, 255, 255, 248, 255, 255, 255, 224, 255, 255,
             255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255,
             224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024,
             255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192,
             000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255,
             255, 224, 192, 000, 000, 024, 255, 191, 255, 224, 255, 191, 255,
             224, 255, 191, 255, 224, 192, 000, 000, 024, 255, 159, 255, 224,
             255, 159, 255, 224, 255, 159, 255, 224, 192, 000, 000, 024, 255,
             143, 255, 224, 255, 143, 255, 224, 255, 143, 255, 224, 192, 000,
             000, 024, 255, 135, 255, 224, 255, 135, 255, 224, 255, 135, 255,
             224, 192, 000, 000, 024, 255, 131, 255, 224, 255, 131, 255, 224,
             255, 131, 255, 224, 192, 000, 000, 024, 255, 129, 255, 224, 255,
             129, 255, 224, 255, 129, 255, 224, 192, 000, 000, 024, 255, 128,
             255, 224, 255, 128, 255, 224, 255, 128, 255, 224, 192, 000, 000,
             024, 255, 128, 127, 224, 255, 128, 127, 224, 255, 128, 127, 224,
             192, 000, 000, 024, 255, 128, 063, 224, 255, 128, 063, 224, 255,
             128, 063, 224, 192, 000, 000, 024, 255, 128, 031, 224, 255, 128,
             031, 224, 255, 128, 031, 224, 192, 000, 000, 024, 255, 128, 015,
             224, 255, 128, 015, 224, 255, 128, 015, 224, 192, 000, 000, 024,
             255, 128, 255, 224, 255, 128, 255, 224, 255, 128, 255, 224, 192, 
             000, 000, 024, 255, 128, 255, 224, 255, 128, 255, 224, 255, 128,
             255, 224, 192, 000, 000, 024, 255, 156, 127, 224, 255, 156, 127,
             224, 255, 156, 127, 224, 192, 000, 000, 024, 255, 252, 127, 224, 
             255, 252, 127, 224, 255, 252, 127, 224, 192, 000, 000, 024, 255, 
             254, 063, 224, 255, 254, 063, 224, 255, 254, 063, 224, 192, 000, 
             000, 024, 255, 254, 063, 224, 255, 254, 063, 224, 255, 254, 063, 
             224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 
             255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 255, 224, 255, 
             255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 024, 255, 255, 
             255, 224, 255, 255, 255, 224, 255, 255, 255, 224, 192, 000, 000, 
             024, 255, 255, 255, 224, 255, 255, 255, 224, 255, 255, 255, 224,
             192, 000, 000, 024, 255, 255, 255, 224, 255, 255, 255, 224, 255,
             255, 255, 224, 255, 255, 255, 248, 128, 000, 000, 000, 128, 000, 
             000, 000, 128, 000, 000, 000, 255, 255, 255, 248, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000));

      { Icona nn: 'Cursore per le barre di scorrimento' }
      ConstIcnCursorBar:     IcnRec127=
      (X:  13;
       Y:  13;
       Vet: (255, 252, 255, 248, 255, 248, 255, 248, 255, 252, 255, 240, 255,
             240, 255, 240, 192, 012, 255, 240, 255, 240, 255, 240, 192, 012,
             255, 240, 255, 240, 255, 240, 192, 012, 255, 240, 255, 240, 255,
             240, 192, 012, 255, 240, 255, 240, 255, 240, 192, 012, 255, 240,
             255, 240, 255, 240, 192, 012, 255, 240, 255, 240, 255, 240, 192,
             012, 255, 240, 255, 240, 255, 240, 192, 012, 255, 240, 255, 240,
             255, 240, 192, 012, 255, 240, 255, 240, 255, 240, 192, 012, 255,
             240, 255, 240, 255, 240, 255, 252, 128, 000, 128, 000, 128, 000,
             255, 252, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000));

      { Icona nn: 'Ok' }
      ConstIcnOk:            IcnRec319=
      (X:  38;
       Y:  13;
       Vet: (255, 255, 255, 255, 254, 255, 255, 255, 255, 252, 255, 255, 255,
             255, 252, 255, 255, 255, 255, 252, 255, 255, 255, 255, 254, 255,
             255, 255, 255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255,
             248, 192, 000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255,
             255, 255, 248, 255, 255, 255, 255, 248, 192, 000, 000, 000, 006,
             255, 248, 051, 159, 248, 255, 248, 051, 159, 248, 255, 255, 255,
             255, 248, 192, 000, 000, 000, 006, 255, 243, 147, 063, 248, 255,
             243, 147, 063, 248, 255, 255, 255, 255, 248, 192, 000, 000, 000,
             006, 255, 243, 146, 127, 248, 255, 243, 146, 127, 248, 255, 255,
             255, 255, 248, 192, 000, 000, 000, 006, 255, 243, 144, 255, 248,
             255, 243, 144, 255, 248, 255, 255, 255, 255, 248, 192, 000, 000,
             000, 006, 255, 243, 146, 127, 248, 255, 243, 146, 127, 248, 255,
             255, 255, 255, 248, 192, 000, 000, 000, 006, 255, 243, 147, 063, 
             248, 255, 243, 147, 063, 248, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 006, 255, 248, 051, 159, 248, 255, 248, 051, 159, 248, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 006, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 254, 128, 000, 
             000, 000, 000, 128, 000, 000, 000, 000, 128, 000, 000, 000, 000,
             255, 255, 255, 255, 254, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000));

      { Icona nn: 'Esci' }
      ConstIcnEsci:          IcnRec319=
      (X:  38;
       Y:  13;
       Vet: (255, 255, 255, 255, 254, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 252, 255, 255, 255, 255, 252, 255, 255, 255, 255, 254, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 248, 192, 000, 000, 000, 006, 
             248, 012, 060, 028, 056, 248, 012, 060, 028, 056, 255, 255, 255, 
             255, 248, 192, 000, 000, 000, 006, 249, 249, 153, 206, 120, 249, 
             249, 153, 206, 120, 255, 255, 255, 255, 248, 192, 000, 000, 000, 
             006, 249, 252, 249, 206, 120, 249, 252, 249, 206, 120, 255, 255,
             255, 255, 248, 192, 000, 000, 000, 006, 248, 030, 121, 254, 120, 
             248, 030, 121, 254, 120, 255, 255, 255, 255, 248, 192, 000, 000, 
             000, 006, 249, 255, 057, 254, 120, 249, 255, 057, 254, 120, 255, 
             255, 255, 255, 248, 192, 000, 000, 000, 006, 249, 249, 153, 206, 
             120, 249, 249, 153, 206, 120, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 006, 248, 012, 060, 028, 056, 248, 012, 060, 028, 056, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 006, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255, 255, 255,
             248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 254, 128, 000, 
             000, 000, 000, 128, 000, 000, 000, 000, 128, 000, 000, 000, 000, 
             255, 255, 255, 255, 254, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000));

      { Icona nn: 'Si' }
      ConstIcnSi:            IcnRec319=
      (X:  38;
       Y:  13;
       Vet: (255, 255, 255, 255, 254, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 252, 255, 255, 255, 255, 252, 255, 255, 255, 255, 254, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 248, 192, 000, 000, 000, 006, 
             255, 248, 120, 127, 248, 255, 248, 120, 127, 248, 255, 255, 255, 
             255, 248, 192, 000, 000, 000, 006, 255, 243, 060, 255, 248, 255, 
             243, 060, 255, 248, 255, 255, 255, 255, 248, 192, 000, 000, 000, 
             006, 255, 249, 252, 255, 248, 255, 249, 252, 255, 248, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 006, 255, 252, 252, 255, 248, 
             255, 252, 252, 255, 248, 255, 255, 255, 255, 248, 192, 000, 000, 
             000, 006, 255, 254, 124, 255, 248, 255, 254, 124, 255, 248, 255, 
             255, 255, 255, 248, 192, 000, 000, 000, 006, 255, 243, 060, 255, 
             248, 255, 243, 060, 255, 248, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 006, 255, 248, 120, 127, 248, 255, 248, 120, 127, 248, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 006, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 248, 192,
             000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255, 255, 255,
             248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 254, 128, 000, 
             000, 000, 000, 128, 000, 000, 000, 000, 128, 000, 000, 000, 000, 
             255, 255, 255, 255, 254, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000));

      { Icona nn: 'No' }
      ConstIcnNo:            IcnRec319=
      (X:  38;
       Y:  13;
       Vet: (255, 255, 255, 255, 254, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 252, 255, 255, 255, 255, 252, 255, 255, 255, 255, 254, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 248, 192, 000, 000, 000, 006, 
             255, 231, 048, 127, 248, 255, 231, 048, 127, 248, 255, 255, 255,
             255, 248, 192, 000, 000, 000, 006, 255, 227, 039, 063, 248, 255, 
             227, 039, 063, 248, 255, 255, 255, 255, 248, 192, 000, 000, 000,
             006, 255, 225, 039, 063, 248, 255, 225, 039, 063, 248, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 006, 255, 228, 039, 063, 248, 
             255, 228, 039, 063, 248, 255, 255, 255, 255, 248, 192, 000, 000, 
             000, 006, 255, 230, 039, 063, 248, 255, 230, 039, 063, 248, 255, 
             255, 255, 255, 248, 192, 000, 000, 000, 006, 255, 231, 039, 063, 
             248, 255, 231, 039, 063, 248, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 006, 255, 231, 048, 127, 248, 255, 231, 048, 127, 248, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 006, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 006, 255, 255, 255, 255, 248, 255, 255, 255, 255,
             248, 255, 255, 255, 255, 248, 255, 255, 255, 255, 254, 128, 000, 
             000, 000, 000, 128, 000, 000, 000, 000, 128, 000, 000, 000, 000, 
             255, 255, 255, 255, 254, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000));

      ConstIcnLongOk: IcnRec767=
      (X:  94;
       Y:  13;
       Vet: (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 254, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 
             255, 255, 255, 255, 255, 131, 057, 255, 255, 255, 255, 248, 255, 
             255, 255, 255, 255, 131, 057, 255, 255, 255, 255, 248, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 
             255, 057, 051, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255,
             057, 051, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 057, 039, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 057, 039, 255, 255,
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             006, 255, 255, 255, 255, 255, 057, 015, 255, 255, 255, 255, 248, 
             255, 255, 255, 255, 255, 057, 015, 255, 255, 255, 255, 248, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 
             255, 255, 057, 039, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             255, 057, 039, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 057, 051, 
             255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 057, 051, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 006, 255, 255, 255, 255, 255, 131, 057, 255, 255, 255, 255, 
             248, 255, 255, 255, 255, 255, 131, 057, 255, 255, 255, 255, 248,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 254, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000));
      ConstIcnLongEsci: IcnRec767=
      (X:  94;
       Y:  13;
       Vet: (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 254, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
             248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 
             255, 255, 255, 255, 128, 195, 193, 195, 255, 255, 255, 248, 255, 
             255, 255, 255, 128, 195, 193, 195, 255, 255, 255, 248, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 
             159, 153, 156, 231, 255, 255, 255, 248, 255, 255, 255, 255, 159, 
             153, 156, 231, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 006, 255, 255, 255, 255, 159, 207, 156, 231, 
             255, 255, 255, 248, 255, 255, 255, 255, 159, 207, 156, 231, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             006, 255, 255, 255, 255, 129, 231, 159, 231, 255, 255, 255, 248, 
             255, 255, 255, 255, 129, 231, 159, 231, 255, 255, 255, 248, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 
             255, 159, 243, 159, 231, 255, 255, 255, 248, 255, 255, 255, 255, 
             159, 243, 159, 231, 255, 255, 255, 248, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 159, 153, 156,
             231, 255, 255, 255, 248, 255, 255, 255, 255, 159, 153, 156, 231, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 006, 255, 255, 255, 255, 128, 195, 193, 195, 255, 255, 255, 
             248, 255, 255, 255, 255, 128, 195, 193, 195, 255, 255, 255, 248, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 254, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000));
      ConstIcnReset: IcnRec767=
      (X:  94;
       Y:  13;
       Vet: (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 254, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 
             255, 255, 255, 240, 048, 024, 112, 016, 063, 255, 255, 248, 255, 
             255, 255, 240, 048, 024, 112, 016, 063, 255, 255, 248, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 243, 
             147, 243, 051, 252, 255, 255, 255, 248, 255, 255, 255, 243, 147, 
             243, 051, 252, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 006, 255, 255, 255, 243, 147, 249, 243, 252, 
             255, 255, 255, 248, 255, 255, 255, 243, 147, 249, 243, 252, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             006, 255, 255, 255, 240, 048, 060, 240, 060, 255, 255, 255, 248,
             255, 255, 255, 240, 048, 060, 240, 060, 255, 255, 255, 248, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 
             243, 147, 254, 115, 252, 255, 255, 255, 248, 255, 255, 255, 243, 
             147, 254, 115, 252, 255, 255, 255, 248, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 006, 255, 255, 255, 243, 147, 243, 051, 
             252, 255, 255, 255, 248, 255, 255, 255, 243, 147, 243, 051, 252, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 006, 255, 255, 255, 243, 144, 024, 112, 028, 255, 255, 255, 
             248, 255, 255, 255, 243, 144, 024, 112, 028, 255, 255, 255, 248, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 254, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000));

      ConstIcnDefault: IcnRec767=
      (X:  94;
       Y:  13;
       Vet: (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 254, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 
             255, 255, 240, 112, 016, 028, 115, 147, 240, 063, 255, 248, 255, 
             255, 240, 112, 016, 028, 115, 147, 240, 063, 255, 248, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 243, 051, 
             243, 249, 051, 147, 252, 255, 255, 248, 255, 255, 243, 051, 243,
             249, 051, 147, 252, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 006, 255, 255, 243, 147, 243, 243, 147, 147, 
             252, 255, 255, 248, 255, 255, 243, 147, 243, 243, 147, 147, 252, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             006, 255, 255, 243, 144, 048, 051, 147, 147, 252, 255, 255, 248, 
             255, 255, 243, 144, 048, 051, 147, 147, 252, 255, 255, 248, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 243, 
             147, 243, 240, 019, 147, 252, 255, 255, 248, 255, 255, 243, 147, 
             243, 240, 019, 147, 252, 255, 255, 248, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 006, 255, 255, 243, 051, 243, 243, 147, 
             147, 252, 255, 255, 248, 255, 255, 243, 051, 243, 243, 147, 147, 
             252, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 006, 255, 255, 240, 112, 019, 243, 152, 048, 028, 255, 255, 
             248, 255, 255, 240, 112, 019, 243, 152, 048, 028, 255, 255, 248,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 254, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000));

      ConstIcnResetAll: IcnRec767=
      (X:  94;
       Y:  13;
       Vet: (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 254, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
             255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 
             255, 240, 048, 024, 112, 016, 063, 252, 115, 243, 255, 248, 255, 
             240, 048, 024, 112, 016, 063, 252, 115, 243, 255, 248, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 243, 147, 243, 
             051, 252, 255, 249, 051, 243, 255, 248, 255, 243, 147, 243, 051,
             252, 255, 249, 051, 243, 255, 248, 255, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 006, 255, 243, 147, 249, 243, 252, 255, 243, 
             147, 243, 255, 248, 255, 243, 147, 249, 243, 252, 255, 243, 147,
             243, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
             255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             006, 255, 240, 048, 060, 240, 060, 255, 243, 147, 243, 255, 248, 
             255, 240, 048, 060, 240, 060, 255, 243, 147, 243, 255, 248, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 243, 147, 
             254, 115, 252, 255, 240, 019, 243, 255, 248, 255, 243, 147, 254, 
             115, 252, 255, 240, 019, 243, 255, 248, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 006, 255, 243, 147, 243, 051, 252, 255, 
             243, 147, 243, 255, 248, 255, 243, 147, 243, 051, 252, 255, 243, 
             147, 243, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 006, 255, 243, 144, 024, 112, 028, 255, 243, 144, 016, 031,
             248, 255, 243, 144, 024, 112, 028, 255, 243, 144, 016, 031, 248, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 254, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000));
      ConstIcnDefaultAll: IcnRec767=
      (X:  94;
       Y:  13;
       Vet: (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 252, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 254, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 006, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 
             240, 112, 016, 028, 115, 147, 240, 063, 252, 115, 243, 248, 240, 
             112, 016, 028, 115, 147, 240, 063, 252, 115, 243, 248, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 006, 243, 051, 243, 249, 
             051, 147, 252, 255, 249, 051, 243, 248, 243, 051, 243, 249, 051, 
             147, 252, 255, 249, 051, 243, 248, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 006, 243, 147, 243, 243, 147, 147, 252, 255,
             243, 147, 243, 248, 243, 147, 243, 243, 147, 147, 252, 255, 243, 
             147, 243, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             006, 243, 144, 048, 051, 147, 147, 252, 255, 243, 147, 243, 248, 
             243, 144, 048, 051, 147, 147, 252, 255, 243, 147, 243, 248, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 243, 147, 243, 
             240, 019, 147, 252, 255, 240, 019, 243, 248, 243, 147, 243, 240, 
             019, 147, 252, 255, 240, 019, 243, 248, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 006, 243, 051, 243, 243, 147, 147, 252, 
             255, 243, 147, 243, 248, 243, 051, 243, 243, 147, 147, 252, 255, 
             243, 147, 243, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 248, 192, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 006, 240, 112, 019, 243, 152, 048, 028, 255, 243, 144, 016, 
             024, 240, 112, 019, 243, 152, 048, 028, 255, 243, 144, 016, 024, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 192, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 006, 255, 255, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 255, 248, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 255, 255, 248, 192, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 006, 255, 255, 255, 255, 255, 255,
             255, 255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 255, 248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 
             255, 255, 254, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 128, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 254, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 
             000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000,
             000));


      { Cursore del mouse nella zona Icone }
      CurIcone:        GraphicCursor=
                       (ScreenMask:($0FFF, $03FF, $80CF, $C007,
		                    $F003, $E001, $E001, $E000,
		                    $C000, $C000, $C000, $C000,
		                    $C001, $E003, $F807, $FC0F);
                        CursorMask:($0000, $7000, $3C00, $0F30,
		                    $07B0, $03DC, $09EC, $0EFC,
		                    $07FE, $19EE, $0FFE, $11DE,
		                    $1FFC, $07F8, $03F0, $0000);
                        HotX:       1;
                        HotY:       1);

      { Cursore del mouse nella zona Disegno }
      CurDisegno:      GraphicCursor=
                       (ScreenMask:(53247, 51199, 50175, 49663,
		                    49407, 49279, 49215, 49183,
		                    49167, 49159, 49279, 50239,
		                    52799, 65055, 65311, 65311);
                        CursorMask:(00000, 04096, 06144, 07168,
		                    07680, 07936, 08064, 08128,
		                    08160, 07936, 06912, 04480,
		                    00128, 00192, 00064, 00000);
                        HotX:        2;
                        HotY:       -2);

      MyFill:           FillPatternType=
                        (170,85,170,85,170,85,170,85);

Var

    { Posizione precedente X del mouse }
    OldMouseX:       Integer;

    { Posizione precedente Y del mouse }
    OldMouseY:       Integer;

    { Inizio della finestra di disegno (X) }
    WinBegX:         Integer;

    { Inizio della finestra di disegno (Y) }
    WinBegY:         Integer;

    { Fine della finestra di disegno (X) }
    WinEndX:         Integer;

    { Fine della finestra di disegno (Y) }
    WinEndY:         Integer;

    { Inizio della barra di scorrimento orizzontale (X) }
    BarXBegX:        Integer;

    { Inizio della barra di scorrimento orizzontale (Y) }
    BarXBegY:        Integer;

    { Fine della barra di scorrimento orizzontale (X) }
    BarXEndX:        Integer;

    { Fine della barra di scorrimento orizzontale (Y) }
    BarXEndY:        Integer;

    { Inizio della barra di scorrimento verticale (X) }
    BarYBegX:        Integer;

    { Inizio della barra di scorrimento verticale (Y) }
    BarYBegY:        Integer;

    { Fine della barra di scorrimento verticale (X) }
    BarYEndX:        Integer;

    { Fine della barra di scorrimento verticale (Y) }
    BarYEndY:        Integer;

(*
    { Procedura richiamata dall' interrupt 1Ch }
    Vect1CProc:      Procedure;

    { Indirizzo della procedura dell' interrupt 1Ch }
    Save1CProc:      Pointer;
*)

    { Icone (pulsanti) che compaiono sullo schermo }
    Icone:           PTRVetType;

    { La sessione GIP Š terminata ? }
    UscitaProgramma: Boolean;

    { Titoli dei menu e loro sotto-menu }
    Menu:            PTRMenuType;

    { E' stata scelta un' opzione da un menu ? }
    OptionSelected:  Boolean;

    { Numero del menu chiamato }
    ProcMenu:        Byte;

    { Numero dell' opzione chiamata del menu }
    ProcOpz:         Byte;

    { E' stato causato un errore per cui il programma deve terminare ? }
    Abort:           Boolean;

    { Tipi di cursore del mouse }
    MouseCursor:     TipoMouseCursor;

    { Inizio X dell' immagine teorica (risultante) }
    BeginX:          Integer;

    { Inizio Y dell' immagine teorica (risultante) }
    BeginY:          Integer;

    { Fine X dell' immagine teorica (risultante) }
    EndX:            Integer;

    { Fine Y dell' immagine teorica (risultante) }
    EndY:            Integer;

    { Operazioni sull' immagine }
    Operation:       PTROperation;

    { Punatore alla prima operazione }
    InizioOp:        PTROperation;

    { Puntatore all' ultima operazione }
    FineOp:          PTROperation;

    { Stringhe da visualizzare }
    Strings:         PTRStrings;

    { Puntatore alla prima stringa }
    InizioSt:        PTRStrings;

    { Puntatore all' ultima stringa }
    FineSt:          PTRStrings;

    { E' stato premuto un tasto della tastiera ? }
    Tastiera:        Boolean;

    { Carattere premuto da tastiera }
    Char1:           Char;

    { Carattere esteso }
    Char2:           Char;

    { Chiamata al nuovo menu (solo con la tastiera) }
    NewMenu:         Byte;

    { Ultimo menu chiamato }
    OldMenu:         Byte;

    { Posizione X del puntatore se si utilizza la tastiera }
    TastieraX:       Integer;

    { Posizione Y del puntatore se si utilizza la tastiera }
    TastieraY:       Integer;

    { Posizione X precedente del puntatore se si utilizza la tastiera }
    OldTastieraX:    Integer;

    { Posizione Y precedente del puntatore se si utilizza la tastiera }
    OldTastieraY:    Integer;

    { Tipo di icona per la tastiera (senza mouse) }
    IcnMouse:        Pointer;

    { E' stato premuto un pulsante ? }
    Risultato:       Boolean;

    { Posizione del cursore nella barra di scorrimento orizzontale }
    CoordX:          Integer;

    { Posizione del cursore nella barra di scorrimento verticale }
    CoordY:          Integer;

    { Posizione precedente del cursore nella barra di scorrimento
      orizzontale }
    OldCoordX:       Integer;

    { Posizione precedente del cursore nella barra di scorrimento verticale }
    OldCoordY:       Integer;

    { Posizione X delle coordinate relative al disegno (X:nnnn,Y:nnnn) }
    PosCoordX:       Integer;

    { Posizione Y delle coordinate relative al disegno (X:nnnn,Y:nnnn) }
    PosCoordY:       Integer;

    { Il cursore del mouse deve cambiare aspetto a seconda della posizione
      in cui si trova ? }
    CambioMouse:     Boolean;

    { Definizioni colori, retini, linee, ecc. correnti }
    Setup:           TipoSetup;

    { Stato in cui si trova il programma (operazione da eseguire) }
    Stato:           TipoStato;

    { Forma da disegnare }
    OldStato:        TipoStato;

    { Inizio X delle coordinate del cursore }
    InizioCoordX:    Integer;

    { Inizio Y delle coordinate del cursore }
    InizioCoordY:    Integer;

    { Fine X delle coordinate del cursore }
    FineCoordX:      Integer;

    { Fine Y delle coordinate del cursore }
    FineCoordY:      Integer;

    { Se vale TRUE viene disegnata la forma di default }
    Disegno:         Boolean;

    { Vettore dati per un poligono }
    Polig:           Array [1..MaxPolyPoints] Of
                       PointType;

    { Numero di punti per il poligono }
    NumPunti:        Byte;

    { Directory al momento dell' esecuzione del programma }
    CurrentDir:      String;

    Dirs:            PTRDirs;
    Files:           PTRFiles;
    AppFiles:        PTRFiles;

    FileDir:         TipoFileDir;
    FileAperto:      Boolean;
    Drive:           Byte;
    Percorso:        String;
    NumFiles:        Integer;
    NumDirs:         Integer;

    { Altezza di un carattere (default dimensione 1) }
    TH:              Integer;

    { Larghezza di un carattere (default dimensione 1) }
    TW:              Integer;

    NameFileDir:     String;

    Ancora:          TipoAncora;

    { Colore dell' area per il disegno }
    ColorImage:      Byte;

    OpSelected:      PTROperation;


Implementation { GIPVars }


End. { GIPVars }
