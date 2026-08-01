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
 º       VERSIONE 1.0                          UNIT TIPBASE                 º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}
{ Data:   18 Febbraio 1993
  Ora:    15:48:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorBaseProcedures }

{ Unit che gestisce il file di configurazione, leggendolo e riconoscendo
  ci• che vi Š scritto, creandone uno nuovo (se non viene trovato),
  la lettura o il salvataggio di un file maschera strutturato, ecc. }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Procedure WriteConfigFile;

    - Procedure ReadConfigFile;

    - Procedure InizializzaVariabili;

    - Procedure LeggiFileMaschera;

    - Procedure SalvaFileMaschera ( NomeFile: String;
                                    Finestra: Boolean );
    - Procedure PosizCursore; }


{ Nome della unit }
Unit
     TIPBase;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPBase }

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

     { Input di una stringa con comandi di editing }
     TIPInStr,

     { Input di un nome di file e visualizzazione della directory }
     TIPInFil,

     { Procedure di inizializzazione del programma }
     TIPInit;


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.CONFIG.FILE

  Riscrive il file di configurazione che contiene le definizioni dei
  colori, il path per l' help, per le pagine video in memoria e sui
  dischi, per i settaggi del ritardi e delle opzioni speciali, per le
  cornici della finestra, del bordo, ecc.
 ----------------------------------------------------------------------------}
Procedure WriteConfigFile;


{----------------------------------------------------------------------------
  PROCEDURA: READ.CONFIG.FILE

  Legge il file di configurazione che contiene le definizioni dei colori,
  dei ritardi, il path per l' help, l' abilitazione o no del suono emesso
  dal PC, i pathes per le immagini, ed altre cose: se questo file non
  esiste sul disco, ne viene creato uno nuovo.
 ----------------------------------------------------------------------------}
Procedure ReadConfigFile;


{----------------------------------------------------------------------------
  PROCEDURA: INIZIALIZZA.VARIABILI

  Setta le variabili globali ai valori di default; cancella le pagine video
  e i relativi dati; controlla se esiste il file di aiuto; controlla se il
  video Š monocromatico o no; legge il file di configurazione, se esiste,
  oppure ne crea uno nuovo, se non esiste; controlla se il mouse Š
  installato o no; ecc.
 ----------------------------------------------------------------------------}
Procedure InizializzaVariabili;


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.FILE.MASCHERA

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video. Se l' immagine corrente non Š stata
  salvata chiede se si Š disposti a perdere le modifiche apportate.
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
  PROCEDURA: POSIZ.CURSORE

  Sposta il cursore ad una certa posizione. Se la variabile globale
  NORMALCURSOR vale TRUE allora il cursore Š un blocco lampeggiante,
  altrimenti (cioŠ se vale FALSE) Š dato da due linee (una orizzontale
  e l' altra verticale) che si intersecano nella posizione specificata.
 ----------------------------------------------------------------------------}
Procedure PosizCursore;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPBase }


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.CONFIG.FILE

  Riscrive il file di configurazione che contiene le definizioni dei
  colori, il path per l' help, per le pagine video in memoria e sui
  dischi, per i settaggi del ritardi e delle opzioni speciali, per le
  cornici della finestra, del bordo, ecc.
 ----------------------------------------------------------------------------}
Procedure WriteConfigFile;

{ Variabili locali }
Var

    { Stringa di appoggio per le conversioni }
    St:  String;

    { Stringa di appoggio per le conversioni }
    St2: String;

    { Indice per i cicli }
    I:   Byte;


     {-----------------------------------------------------------------------
       FUNZIONE: SI.NO

       La funzione SINO serve per scrivere SI o NO per le variabili di tipo
       booleane: il valore logico TRUE corrisponde al SI, mentre FALSE a
       NO.
      -----------------------------------------------------------------------}
     Function  SiNo ( Variabile: Boolean ): String;
     Begin { SiNo }

     { Se VARIABILE ha valore TRUE }
     If Variabile
       Then

         { La funzione restituisce SI }
         SiNo := 'Si'
     Else

       { Altrimenti restituisce NO }
       SiNo := 'No';

     End; { SiNo }


Begin { WriteConfigFile }

{ Messaggio per l' utente }
Info('Creazione del file di configurazione in corso....',Color.Performing);
Delay(Ritardo.Messaggi);

{ Cancella il file, se esiste, o lo crea, se non esiste }
ReWrite(ConfigFile);

{ Righe di commento }
WriteLn(ConfigFile,'ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ'+
                   'ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
WriteLn(ConfigFile,'º                                                      '+
		   '                       º');
WriteLn(ConfigFile,'º                    FILE DI CONFIGURAZIONE DEL PROGRAM'+
		   'MA                     º');
WriteLn(ConfigFile,'º                        "T.I.P.": TEXT IMAGE PROCESSOR'+
		   '                       º');
WriteLn(ConfigFile,'º                     PROGRAMMA SCRITTO DA FOCHI MICHEL'+
                   'E                      º');
WriteLn(ConfigFile,'º                    TESI PER L'' ANNO SCOLASTICO 1992-'+
		   '1993                    º');
WriteLn(ConfigFile,'º                                                      '+
		   '                       º');
WriteLn(ConfigFile,'ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ'+
		   'ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');

{ Scrive i colori in memoria }
WriteLn(ConfigFile);
With Color Do

  Begin
  WriteLn(ConfigFile,'ColorDefault='          ,Default);
  WriteLn(ConfigFile,'ColorCancel='           ,Cancel);
  WriteLn(ConfigFile,'ColorUserInfo='         ,UserInfo);
  WriteLn(ConfigFile,'ColorError='            ,Error);
  WriteLn(ConfigFile,'ColorPerforming='       ,Performing);
  WriteLn(ConfigFile,'ColorInputField='       ,InputField);
  WriteLn(ConfigFile,'ColorInputDigit='       ,InputDigit);
  WriteLn(ConfigFile,'ColorInputArrow='       ,InputArrow);
  WriteLn(ConfigFile,'ColorMenuBord='         ,MenuBord);
  WriteLn(ConfigFile,'ColorMenuTitle='        ,MenuTitle);
  WriteLn(ConfigFile,'ColorMenuSel='          ,MenuSel);
  WriteLn(ConfigFile,'ColorMenuUnSel='        ,MenuUnSel);
  WriteLn(ConfigFile,'ColorMenuKeySel='       ,MenuKeySel);
  WriteLn(ConfigFile,'ColorMenuKeyUnSel='     ,MenuKeyUnSel);
  WriteLn(ConfigFile,'ColorMenuText='         ,MenuText);
  WriteLn(ConfigFile,'ColorStatus='           ,Status);
  WriteLn(ConfigFile,'ColorStatusSel='        ,StatusSel);
  WriteLn(ConfigFile,'ColorMenuSelUnSel='     ,MenuSelUnSel);
  WriteLn(ConfigFile,'ColorFileArrow='        ,FileArrow);
  WriteLn(ConfigFile,'ColorDirArrow='         ,DirArrow);
  WriteLn(ConfigFile,'ColorDirBar='           ,DirBar);
  WriteLn(ConfigFile,'ColorDirInfo='          ,DirInfo);
  WriteLn(ConfigFile,'ColorSearch='           ,Search);
  WriteLn(ConfigFile,'ColorDir='              ,Dir);
  WriteLn(ConfigFile,'ColorNoFiles='          ,NoFiles);
  WriteLn(ConfigFile,'ColorWarningBord='      ,WarningBord);
  WriteLn(ConfigFile,'ColorWarningTitle='     ,WarningTitle);
  WriteLn(ConfigFile,'ColorWarningSel='       ,WarningSel);
  WriteLn(ConfigFile,'ColorWarningUnSel='     ,WarningUnSel);
  WriteLn(ConfigFile,'ColorWarningKeySel='    ,WarningKeySel);
  WriteLn(ConfigFile,'ColorWarningKeyUnSel='  ,WarningKeyUnSel);
  WriteLn(ConfigFile,'ColorWarningText='      ,WarningText);
  WriteLn(ConfigFile,'ColorColoriBlinkON='    ,ColoriBlinkON);
  WriteLn(ConfigFile,'ColorColoriBlinkOFF='   ,ColoriBlinkOFF);
  WriteLn(ConfigFile,'ColorBlockBord='        ,BlockBord);
  WriteLn(ConfigFile,'ColorBlockArrow='       ,BlockArrow);
  WriteLn(ConfigFile,'ColorBlockAngle='       ,BlockAngle);
  WriteLn(ConfigFile,'ColorHelpBord='         ,HelpBord);
  WriteLn(ConfigFile,'ColorHelpTitle='        ,HelpTitle);
  WriteLn(ConfigFile,'ColorHelpSel='          ,HelpSel);
  WriteLn(ConfigFile,'ColorHelpUnSel='        ,HelpUnSel);
  WriteLn(ConfigFile,'ColorHelpText='         ,HelpText);
  WriteLn(ConfigFile,'ColorSpecTitle='        ,SpecTitle);
  WriteLn(ConfigFile,'ColorSpecText='         ,SpecText);
  WriteLn(ConfigFile,'ColorSpecSel='          ,SpecSel);
  End;

{ Ora scrive i ritardi su disco }
WriteLn(ConfigFile);
With Ritardo Do

  Begin
  WriteLn(ConfigFile,'RitardoDefault='      ,Default);
  WriteLn(ConfigFile,'RitardoBeep='         ,Beep);
  WriteLn(ConfigFile,'RitardoMenuStep='     ,MenuStep);
  WriteLn(ConfigFile,'RitardoMenu='         ,Menu);
  WriteLn(ConfigFile,'RitardoDialStep='     ,DialStep);
  WriteLn(ConfigFile,'RitardoDialog='       ,Dialog);
  WriteLn(ConfigFile,'RitardoWinStep='      ,WinStep);
  WriteLn(ConfigFile,'RitardoWindows='      ,Windows);
  WriteLn(ConfigFile,'RitardoMessaggi='     ,Messaggi);
  WriteLn(ConfigFile,'RitardoBlockSpeed='   ,BlockSpeed);
  WriteLn(ConfigFile,'RitardoBlockBlink='   ,BlockBlink);
  WriteLn(ConfigFile,'RitardoSpecialKey='   ,SpecialKey);
  End;

{ Scrive nel file di configurazione anche i valori delle variabili
  delle opzioni speciali }
WriteLn(ConfigFile);
With Special Do

  Begin
  WriteLn(ConfigFile,'SpecialBloccaForeGround='   ,SiNo(BloccaFore));
  WriteLn(ConfigFile,'SpecialBloccaBackGround='   ,SiNo(BloccaBack));
  WriteLn(ConfigFile,'SpecialBloccaCarattere='    ,SiNo(BloccaCar));
  WriteLn(ConfigFile,'SpecialReturnDown='         ,SiNo(ReturnDown));
  WriteLn(ConfigFile,'SpecialInvertiCaratteriX='  ,SiNo(InvertXCar));
  WriteLn(ConfigFile,'SpecialInvertiCaratteriY='  ,SiNo(InvertYCar));
  WriteLn(ConfigFile,'SpecialEnableSound='        ,SiNo(EnableSound));
  WriteLn(ConfigFile,'SpecialNormalCursor='       ,SiNo(NormalCursor));
  End;

{ Linea vuota }
WriteLn(ConfigFile);
WriteLn(ConfigFile,'Velocita''OrizzontaleMouse=',MouseHorSpeed);
WriteLn(ConfigFile,'Velocita''VerticaleMouse=',MouseVerSpeed);

{ Linea vuota }
WriteLn(ConfigFile);

{ Scrive la definizione della cornice }
WriteLn(ConfigFile,'TracciaCornice=',Cornice);
WriteLn(ConfigFile,'TracciaColore=',Colore);

{ Scrive la definizione del bordo delle finestre }
WriteLn(ConfigFile,'BordoFinestre=',WinCornice);

{ Scrive la definizione del bordo del blocco selezionato }
WriteLn(ConfigFile,'BordoBlocco=',BlockDef.Bord);

{ Scrive le frecce utilizzate nel bordo }
Write(ConfigFile,'FrecceBlocco=');
For i := 1 To 4 Do
  Begin

  { Conversione da codice ASCII a stringa di 3 caratteri }
  Str(Ord(BlockDef.Arrow[i]):3,St);

  { Converte gli spazi in caratteri '0' }
  While (Pos(' ',St) <> 0) Do
    St[Pos(' ',St)] := '0';

  { Scrive la stringa sul file }
  Write(ConfigFile,St);

  { Aggiunge la virgola }
  If (i <> 4)
    Then
      Write(ConfigFile,',')

  { Nuova riga }
  Else
    WriteLn(ConfigFile);

  End;

{ Linea vuota }
WriteLn(ConfigFile);

{ Scrive il percorso del file di aiuto e di tutti i files caricati nelle
  pagine video disponibili in memoria }
WriteLn(ConfigFile,'PathHelp='+FExpand(NameHelpFile));

{ Linea vuota }
WriteLn(ConfigFile);
For i := 1 To MaxPgVideo Do
  Begin
  Str(i:2,St);

  { Trasforma lo spazio in 0 }
  If (St[1] = ' ')
    Then
      St[1] := '0';

  { Aggiorna il nome del file nella stringa del record opportuno }
  With Image^[i] do
    If (FileName <> StrNull)
      Then
        Begin

        If Maschera
          Then

            { File maschera strutturato }
            St2 := ',Maschera'
        Else

          { File di testo generico }
          St2 := ',Testo';

        End

    Else
      St2 := StrNull;

  WriteLn(ConfigFile,'Pagina'+St+'='+Image^[i].FileName+St2);

  End;

{ Riga vuota }
WriteLn(ConfigFile);

{ Chiude il file di configurazione }
Close(ConfigFile);

End; {  WriteConfigFile }


{----------------------------------------------------------------------------
  PROCEDURA: READ.CONFIG.FILE

  Legge il file di configurazione che contiene le definizioni dei colori,
  dei ritardi, il path per l' help, l' abilitazione o no del suono emesso
  dal PC, i pathes per le immagini, ed altre cose: se questo file non
  esiste sul disco, ne viene creato uno nuovo.
 ----------------------------------------------------------------------------}
Procedure ReadConfigFile;

{ Variabili locali }
Var

    { Stringa di appoggio }
    St:        String;

    { Stringa di appoggio }
    St2:       String;

    { Stringa di appoggio }
    St3:       String;

    { Contatore per i cicli }
    I:         Byte;

    { Appoggio numerico per le conversioni }
    Num:       LongInt;

    { Codice di errore per la procedura VAL }
    ErrorCode: Integer;


     {-----------------------------------------------------------------------
       FUNZIONE: ONE.BYTE

       Date ST1 ed ST2, dove la prima Š la stringa letta dal file di
       configurazione mentre la seconda Š la stringa che bisogna ricono_
       scere, questa funzione restituisce TRUE se i primi caratteri di
       ST1 sono quelli di ST2 (ossia se ST2 Š compresa in ST1 ed occupa
       la posizione 1) e FALSE in caso contrario.
       La variabile OUT viene aggiornata con il contenuto di NUM, se
       la funzione ha avuto successo (TRUE).
      -----------------------------------------------------------------------}
      Function OneByte (     St1: String;
                             St2: String;
                         Var Out: Byte ): Boolean;

      Begin { OneByte }

      { Se i primi caratteri sono gli stessi }
      If (Copy(St1,1,Length(St2)) = St2)
        Then

          Begin

          { Restituisce TRUE }
          OneByte := True;

          { Aggiornamento della variabile }
          Out := Num;

          End

      Else

        { Restituisce FALSE }
        OneByte := False;

      End; { OneByte }


     {-----------------------------------------------------------------------
       FUNZIONE: ONE.WORD

       Date ST1 ed ST2, dove la prima Š la stringa letta dal file di
       configurazione mentre la seconda Š la stringa che bisogna ricono_
       scere, questa funzione restituisce TRUE se i primi caratteri di
       ST1 sono quelli di ST2 (ossia se ST2 Š compresa in ST1 ed occupa
       la posizione 1) e FALSE in caso contrario.
       La variabile OUT viene aggiornata con il contenuto di NUM, se
       la funzione ha avuto successo (TRUE).
       L' unica differenza dalla funzione ONEBYTE Š che la variabile OUT
       Š di tipo Word.
      -----------------------------------------------------------------------}
      Function OneWord (     St1: String;
                             St2: String;
                         Var Out: Word ): Boolean;

      Begin { OneWord }

      { Se i primi caratteri sono gli stessi }
      If (Copy(St1,1,Length(St2)) = St2)
        Then

          Begin

          { Restituisce TRUE }
          OneWord := True;

          { Aggiornamento della variabile }
          Out := Num;

          End

      Else

        { Restituisce FALSE }
        OneWord := False;

      End; { OneWord }


     {-----------------------------------------------------------------------
       FUNZIONE: ONE.STRING

       Date STA ed STB, dove la prima Š la stringa letta dal file di
       configurazione mentre la seconda Š la stringa che bisogna ricono_
       scere, questa funzione restituisce TRUE se i primi caratteri di
       STA sono quelli di STB (ossia se STB Š compresa in STA ed occupa
       la posizione 1) e FALSE in caso contrario.
       La variabile OUT viene aggiornata con il contenuto di ST2: se essa
       Š 'SI' vale TRUE; altrimenti vale FALSE.
       Anche per questa funzione, l' unica differenza da ONEBYTE Š che la
       variabile OUT Š di tipo Boolean;
      -----------------------------------------------------------------------}
      Function OneString (     StA: String;
                               StB: String;
                           Var Out: Boolean ): Boolean;

      Begin { OneString }

      { Se i primi caratteri sono gli stessi }
      If (Copy(StA,1,Length(StB)) = StB)
        Then

          Begin

          { Controlla il contenuto di ST2 }
          If (St2 = 'SI')
            Then

              { Aggiorna a TRUE se Š 'SI' }
   	      Out := True

          Else

            { Controlla il contenuto di ST2 }
            If (St2 = 'NO')
	      Then

                { Aggiorna a FALSE se Š 'NO' }
	        Out := False;

          { Restituisce TRUE }
          OneString := True;

          End

      Else

        { Restituisce FALSE }
        OneString := False;

      End; { OneString }


     {-----------------------------------------------------------------------
       PROCEDURA: TESTA.COLORI.RITARDI

       Controlla la stringa e verifica se in essa Š specificato un colore
       o un ritardo preciso. Se lo riconosce viene settata la variabile
       relativa.
      -----------------------------------------------------------------------}
      Procedure TestaColoriRitardi;
      Begin { TestaColoriRitardi }

      With Color Do

	Begin

	     { Ora vengono controllati tutti i colori }
	  If OneByte(St,'COLORDEFAULT=',Default)
	    Then

	Else

	  If OneByte(St,'COLORCANCEL=',Cancel)
	    Then

	Else

	  If OneByte(St,'COLORUSERINFO=',UserInfo)
	    Then

	Else

	  If OneByte(St,'COLORERROR=',Error)
	    Then

	Else

	  If OneByte(St,'COLORPERFORMING=',Performing)
	    Then

	Else

	  If OneByte(St,'COLORINPUTFIELD=',InputField)
	    Then

	Else

	  If OneByte(St,'COLORINPUTDIGIT=',InputDigit)
	    Then

	Else

	  If OneByte(St,'COLORINPUTARROW=',InputArrow)
	    Then

	Else

	  If OneByte(St,'COLORMENUBORD=',MenuBord)
	    Then

	Else

	  If OneByte(St,'COLORMENUTITLE=',MenuTitle)
            Then

	Else

	  If OneByte(St,'COLORMENUSEL=',MenuSel)
	    Then

	Else

	  If OneByte(St,'COLORMENUUNSEL=',MenuUnSel)
	    Then

	Else

	  If OneByte(St,'COLORMENUKEYSEL=',MenuKeySel)
	    Then

	Else

	  If OneByte(St,'COLORMENUKEYUNSEL=',MenuKeyUnSel)
	    Then

	Else

	  If OneByte(St,'COLORMENUTEXT=',MenuText)
	    Then

	Else

	  If OneByte(St,'COLORSTATUS=',Status)
	    Then

	Else

	  If OneByte(St,'COLORSTATUSSEL=',StatusSel)
	    Then

	Else

	  If OneByte(St,'COLORMENUSELUNSEL=',MenuSelUnSel)
	    Then

	Else

	  If OneByte(St,'COLORFILEARROW=',FileArrow)
	    Then

	Else

	  If OneByte(St,'COLORDIRARROW=',DirArrow)
	    Then

	Else

	  If OneByte(St,'COLORDIRBAR=',DirBar)
	    Then

	Else

	  If OneByte(St,'COLORDIRINFO=',DirInfo)
	    Then

	Else

	  If OneByte(St,'COLORSEARCH=',Search)
	    Then

	Else

	  If OneByte(St,'COLORDIR=',Dir)
	    Then

	Else

	  If OneByte(St,'COLORNOFILES=',NoFiles)
	    Then

	Else

	  If OneByte(St,'COLORWARNINGBORD=',WarningBord)
	    Then

	Else

	  If OneByte(St,'COLORWARNINGTITLE=',WarningTitle)
	    Then

	Else

	  If OneByte(St,'COLORWARNINGSEL=',WarningSel)
	    Then

	Else

	  If OneByte(St,'COLORWARNINGUNSEL=',WarningUnSel)
	    Then

	Else

	  If OneByte(St,'COLORWARNINGKEYSEL=',WarningKeySel)
	    Then

	Else

	  If OneByte(St,'COLORWARNINGKEYUNSEL=',WarningKeyUnSel)
	    Then

	Else

	  If OneByte(St,'COLORWARNINGTEXT=',WarningText)
	    Then

	Else

	  If OneByte(St,'COLORCOLORIBLINKON=',ColoriBlinkON)
	    Then

	Else

	  If OneByte(St,'COLORCOLORIBLINKOFF=',ColoriBlinkOFF)
	    Then

	Else

	  If OneByte(St,'COLORBLOCKBORD=',BlockBord)
	    Then

	Else

	  If OneByte(St,'COLORBLOCKARROW=',BlockArrow)
	    Then

	Else

	  If OneByte(St,'COLORBLOCKANGLE=',BlockAngle)
	    Then

	Else

	  If OneByte(St,'TRACCIACOLORE=',Colore)
	    Then

	  If OneByte(St,'COLORHELPBORD=',HelpBord)
	    Then

	Else

	  If OneByte(St,'COLORHELPTITLE=',HelpTitle)
	    Then

	Else

	  If OneByte(St,'COLORHELPSEL=',HelpSel)
	    Then

	Else

	  If OneByte(St,'COLORHELPUNSEL=',HelpUnSel)
	    Then

	Else

	  If OneByte(St,'COLORHELPTEXT=',HelpText)
	    Then

	Else

	  If OneByte(St,'COLORSPECTITLE=',SpecTitle)
	    Then

	Else

	  If OneByte(St,'COLORSPECTEXT=',SpecText)
	    Then

	Else

	  If OneByte(St,'COLORSPECSEL=',SpecSel)
	    Then

        { Ora si procede controllando tutti i ritardi }
	Else

	  If OneWord(St,'RITARDODEFAULT=',Ritardo.Default)
	    Then

	Else

	  If OneWord(St,'RITARDOBEEP=',Ritardo.Beep)
	    Then

	Else

	  If OneWord(St,'RITARDOMENUSTEP=',Ritardo.MenuStep)
	    Then

	Else

	  If OneWord(St,'RITARDOMENU=',Ritardo.Menu)
	    Then

	Else

	  If OneWord(St,'RITARDODIALSTEP=',Ritardo.DialStep)
	    Then

	Else

	  If OneWord(St,'RITARDODIALOG=',Ritardo.Dialog)
	    Then

	Else

	  If OneWord(St,'RITARDOWINSTEP=',Ritardo.WinStep)
	    Then

	Else

	  If OneWord(St,'RITARDOWINDOWS=',Ritardo.Windows)
	    Then

	Else

	  If OneWord(St,'RITARDOMESSAGGI=',Ritardo.Messaggi)
	    Then

	Else

	  If OneWord(St,'RITARDOBLOCKSPEED=',Ritardo.BlockSpeed)
	    Then

	Else

	  If OneWord(St,'RITARDOBLOCKBLINK=',Ritardo.BlockBlink)
	    Then

	Else

	  If OneWord(St,'RITARDOSPECIALKEY=',Ritardo.SpecialKey)
	    Then

	Else

	  If OneWord(St,'VELOCITA''ORIZZONTALEMOUSE=',Word(MouseHorSpeed))
	    Then

	Else

	  If OneWord(St,'VELOCITA''VERTICALEMOUSE=',Word(MouseVerSpeed))
	    Then

	End

      End; { TestaColoriRitardi }

Begin { ReadConfigFile }

{ Controllo del file sul disco }
{$I-} Reset(ConfigFile); {$I+}

{ Se il file esiste fisicamente }
If (IOResult = 0) Then

  { Il file esiste: leggilo }
  Begin

  { Messaggio per l' utente }
  Info(' Lettura del file di configurazione....',Color.Performing);
  Delay(Ritardo.Messaggi);


  { Legge il file di configurazione }
  While (Not EOF(ConfigFile)) Do
    Begin

    { Lettura di una riga }
    ReadLn(ConfigFile,St);

    { Vengono eliminati gli spazi }
    While (Pos(' ',St) <> 0) Do
      Delete(St,Pos(' ',St),1);

    { I caratteri diventano anche tutti maiuscoli, per evitare errori di
      confronti }
    For i := 1 To Length(St) Do
      St[i] := UpCase(St[i]);

    { Guarda se il carattere '=' Š presente nella stringa }
    Num := Pos('=',St);

    { Se non Š presente significa che non Š una riga valida }
    If (Num <> 0) Then
      Begin

      { ST2 memorizza il secondo parametro, quello dopo il carattere '=' }
      St2 := Copy(St,Num+1,Length(St)-Num+1);

      { Converte il parametro in numero }
      Val(St2,Num,ErrorCode);

      { Se il numero Š valido significa che Š la definizione di un
	colore o di un ritardo del programma }
      If (ErrorCode = 0) Then

	{ Uno per uno vengono controllati tutti i colori e poi tutti i
	  ritardi }
        TestaColoriRitardi

      Else

	{ Se il parametro non Š un numero, significa che Š il
	  percorso di un file immagine o del file di aiuto o
	  ancora la configurazione del suono (Si/No) }
	Begin

	{ Controlla se Š il path per file dell' help }
	If (Copy(St,1,9) = 'PATHHELP=')
	  Then
	    NameHelpFile := St2

	{ ... }
	Else

	  If OneString(St,'SPECIALBLOCCAFOREGROUND=',Special.BloccaFore)
	    Then

        Else

	  If OneString(St,'SPECIALBLOCCABACKGROUND=',Special.BloccaBack)
	    Then

        Else

	  If OneString(St,'SPECIALBLOCCACARATTERE=',Special.BloccaCar)
	    Then

        Else

	  If OneString(St,'SPECIALRETURNDOWN=',Special.ReturnDown)
	    Then

        Else

	  If OneString(St,'SPECIALINVERTICARATTERIX=',Special.InvertXCar)
	    Then

        Else

	  If OneString(St,'SPECIALINVERTICARATTERIY=',Special.InvertYCar)
	    Then

	Else

	  If OneString(St,'SPECIALENABLESOUND=',Special.EnableSound)
	    Then

	Else

	  If OneString(St,'SPECIALNORMALCURSOR=',Special.NormalCursor)
	    Then

	Else

	  {  }
	  If (Copy(St,1,15) = 'TRACCIACORNICE=')
	    Then

	      { Memorizza il bordo (13 caratteri) }
	      For i := 1 To 13 Do
		Cornice[i] := St[15+i]

        Else

	  { Altrimenti pu• essere la definizione del bordo delle finestre }
	  If (Copy(St,1,14) = 'BORDOFINESTRE=')
	    Then

	      { Memorizza il bordo (13 caratteri) }
	      For i := 1 To 13 Do
		WinCornice[i] := St[14+i]

        Else

	  { Altrimenti pu• essere la definizione del bordo del blocco }
	  If (Copy(St,1,12) = 'BORDOBLOCCO=')
	    Then

	      { Memorizza il bordo (13 caratteri) }
	      For i := 1 To 13 Do
		BlockDef.Bord[i] := St[12+i]

	Else

	  { Potrebbe essere la definizione delle frecce utilizzate
	    nel bordo del blocco selezionato, espresse in
	    XXX,XXX,XXX,XXX (4 codici ASCII separati da una virgola) }
	  If (Copy(St,1,14) = 'FRECCEBLOCCO=')
	    Then
	      Begin

	      { Primo carattere, freccia verso sinistra }
	      Val(Copy(St,15,3),Num,ErrorCode);
	      If (ErrorCode = 0)
		Then
		  BlockDef.Arrow[1] := Chr(Num);

	      { Secondo carattere, freccia verso destra }
	      Val(Copy(St,19,3),Num,ErrorCode);
	      If (ErrorCode = 0)
		Then
		  BlockDef.Arrow[2] := Chr(Num);

	      { Terzo carattere, freccia verso il basso }
	      Val(Copy(St,23,3),Num,ErrorCode);
	      If (ErrorCode = 0)
		Then
		  BlockDef.Arrow[3] := Chr(Num);

	      { Quarto ed ultimo carattere, freccia verso l' alto }
	      Val(Copy(St,27,3),Num,ErrorCode);
	      If (ErrorCode = 0)
		Then
		  BlockDef.Arrow[4] := Chr(Num);

	      End

	{ Se Š il path di un file di una delle pagine video }
	Else

	  Begin

	  For i := 1 To MaxPgVideo Do
	    Begin

	    Str(i:2,St3);

	    { Se il numero Š inferiore a 10, viene agggiunto uno 0
	      davanti alla stringa (01, 02, ..., 09, 10) }
	    If (St3[1] = ' ')
	      Then
		St3[1] := '0';

	    { Lettura del path della paina video opportura }
	    If (Copy(St,1,9) = 'PAGINA'+St3+'=')
	      Then
		Begin
                St3 := Copy(St2,1,Pos(',',St2)-1);
                Delete(St2,1,Pos(',',St2));
                If (St2 = 'TESTO')
		  Then
                    ApriFileTesto(St3,i)
                Else
                  If (St2 = 'MASCHERA')
                    Then
                      ApriFileMaschera(St3,i);
                End;

	    End;

	  End;

	End;

      End;

    End;

  End

Else

  { Il file di configurazione non Š stato trovato: ne viene creato uno
    nuovo }
  Begin

  { Messaggio per l' utente }
  Info('Il file di configurazione non Š stato trovato.',Color.Error);
  Delay(Ritardo.Messaggi);

  { Creazione del file di configurazione }
  WriteConfigFile;

  End;

End; {  ReadConfigFile }


{----------------------------------------------------------------------------
  PROCEDURA: INIZIALIZZA.VARIABILI

  Setta le variabili globali ai valori di default; cancella le pagine video
  e i relativi dati; controlla se esiste il file di aiuto; controlla se il
  video Š monocromatico o no; legge il file di configurazione, se esiste,
  oppure ne crea uno nuovo, se non esiste; controlla se il mouse Š
  installato o no; ecc.
 ----------------------------------------------------------------------------}
Procedure InizializzaVariabili;

{ Variabili locali }
Var

    { Indice per i cicli }
    I:       Byte;

    { Indice per i cicli }
    J:       Byte;


Begin { InizializzaVariabili }

{ Aggiorna la linea di stato }
AggiornaStatusLine := True;

{ Velocit… orizzontale e verticale del mouse }
MouseHorSpeed := 5;
MouseVerSpeed := 5;

{ Inizializzazione dei ritardi }
With Ritardo Do

  Begin
  Default    := 10;
  Beep       := 10;
  MenuStep   := 10;
  Menu       := 02;
  DialStep   := 10;
  Dialog     := 02;
  WinStep    := 10;
  Windows    := 02;
  Messaggi   := 10;
  BlockSpeed := 10;
  BlockBlink := 2;
  SpecialKey := 100;
  End;

With Special Do

  Begin
  BloccaFore  := False;
  BloccaBack  := False;
  BloccaCar   := False;
  ReturnDown  := False;
  InvertXCar  := False;
  InvertYCar  := False;
  End;

{ Definisce i colori standard }
SetStandardColors;

{ Variabili rimanenti }
Trace := TOff;
Colore := Color.Default;
Cornice := SingleFrame;
WinCornice := SingleFrame;

{ Legge la directory corrente dal drive di default }
GetDir(CurrDrive,CurrDir);

{ Abilita il suono }
Special.EnableSound := True;

{ Cursore normale (lampeggiante) }
Special.NormalCursor := True;

{ Inizializza i puntatori per le finestre, vedi unit WINTIP }
InitializeWindow;

{ Nasconde il cursore }
CursorOFF;

{ Alloca le pagine che memorizzeranno le immagini in modalit… testo: ogni
  pagina occupa 4KBytes (4096 Bytes): 80x25 attributi e 80x25 caratteri.
  Ci sono inoltre i bytes per la colonna, la riga e il colore-attributo
  del cursore per ogni pagina. Alla pagina video si devono togliere 160
  Bytes (80 attributi + 80 caratteri) in quanto l' ultima riga non Š
  utilizzata.
  Insieme a queste pagine viene anche allocata la clipboard }
New(Image);  { 43200 Bytes }

{ Alloca il record che contiene la definizione di un blocco (al massimo
  grande come una pagina intera) e le sue coordinate di inizio e fine
  sullo schermo }
New(Block);   { 4748 Bytes }

{ Alloca in memoria il vettore delle chiamate all' help }
New(LastHelp);

{ Inizializza le chiamate all' help precedente (ALT-F1) }
For i := 1 To MaxLastHelp-1 Do
  LastHelp^[i] := 'Help Generale';

{ Definizione delle variabii che contengono i nomi dei files da leggere,
  salvare e le schermate di aiuto }
NameReadFileMSK := StrNull;
NameWriteFileMSK := StrNull;
NameReadFileTXT := StrNull;
NameWriteFileTXT := StrNull;
NameReadFileBLK := StrNull;
NameWriteFileBLK := StrNull;
NameHelpFile := InitNameHelpFile;
DOSCommand := StrNull;

{ Messaggio per l' utente }
Info(' Attendi che definisco le variabili....',Color.Performing);

{ Azzera tutte le pagine video e i valori delle colonne, righe, attributi
  per ogni pagina e tutti gli altri campi }
With Image^[1] Do
  Begin

  { Pagina in memoria ... }
  For i := 1 To 24 Do
    For j := 1 To 80 Do
      Begin
      Page[i,j].Ch := kSpazio;
      Page[i,j].At := LightGray;
      End;

  { ... e altri campi }
  Row := 1;
  Col := 1;
  Attr := LightGray;
  InsState := False;
  SelCar := kSpazio;
  Modify := False;
  FileName := StrNull;
  Maschera := True;

  End;

{ Le altre pagine video sono la copia della prima }
For i := 2 To MaxPgVideo Do
  Image^[i] := Image^[1];

{ Ora inizializza il blocco in memoria }
With Block^ Do
  Begin

  { Pagina in memoria ... }
  For i := 1 To 24 Do
    For j := 1 To 80 Do
      Begin
      Page[i,j].Ch := kSpazio;
      Page[i,j].At := Color.Default;
      End;

  { ... e altri campi }
  InizioX := 1;
  InizioY := 1;
  FineX := 1;
  FineY := 1;

  End;

{ Definisce il bordo del blocco e le frecce da utilizzare con esso }
With BlockDef Do
  Begin

  { Definisce il tipo di bordo di default }
  Bord := SingleFrame;

  { Ed il tipo di frecce da utilizzare }
  Arrow := FrecceSottili;

  End;

{ Il blocco non si trova in memoria }
MemoryBlock := False;

{ La pagina numero 1 in memoria viene fatta coincidere con la reale
  pagina della memoria video }
Fisico := PTR(Segmento,$0000);
NumPgVideo := 1;
Fisico^ := Image^[NumPgVideo].Page;
Delay(Ritardo.Messaggi);

{ Controlla il file di configurazione: se esiste lo legge, altrimenti ne
  crea uno nuovo }
Assign(ConfigFile,NameConfigFile);
ReadConfigFile;

{ Setta il colore a quello di default }
TextAttr := Color.Default;
ClrScr;

{ Controlla se il mouse Š presente ed installazione del mouse }
InstallMouse;

{ Emette un segnale acustico }
Beep;

{ Il mouse Š stato installato con successo }
If MouseOk
  Then
    Info(' Mouse installato correttamente.',Color.Performing)

Else

  { Il mouse non Š stato installato correttamente }
  Info(' Mouse non installato!',Color.Error);

Delay(Ritardo.Messaggi);

{ Controllo del file dell' aiuto }
CheckHelpFile;

End; { InizializzaVariabili }


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.FILE.MASCHERA

  Esegue la funzione INPUTFILE per ricevere in input il nome di un file
  da leggere e lo visualizza sul video. Se l' immagine corrente non Š stata
  salvata chiede se si Š disposti a perdere le modifiche apportate.
 ----------------------------------------------------------------------------}
Procedure LeggiFileMaschera;

Begin { LeggiFileMaschera }

{ Attende in input il nome del file da leggere }
NameReadFileMSK := InputFile('[Leggi File Maschera]','.MSK','*.MSK',
		   SetCarFile);
		   
{ ... ed apre il file specificato }
ApriFileMaschera(NameReadFileMSK,NumPgVideo);

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

    { Record di appoggio }
    AppRecFile:  PTRRecFile;

    { Indica se il file (sempre se esiste) pu• essere o no sovrascritto }
    Sovrascrivi: Boolean;

Begin { SalvaFileMaschera }

{ Se non deve comparire la finestra ... }
If Finestra
  Then

    Begin

    { Attende in input il nome del file da leggere }
    NameWriteFileMSK := InputFile('[Salva File Maschera]','.MSK',
                                  Image^[NumPgVideo].FileName,SetCarFile);
    NomeFile := NameWriteFileMSK;
    End;
		   
{ Se Š diverso dalla stringa nulla }
If (NomeFile <> StrNull)
  Then
    Begin

    { Default }
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

      New(AppRecFile); { 3848 Bytes }

      { Controllo della validit… del file }
      With AppRecFile^ Do
        Begin
        Header := HeaderValue;
        Page := Image^[NumPgVideo].Page;
        End;

      { Cancellazione del file sul disco }
      ReWrite(FileMSK);

      { Messaggio per l' utente }
      Info(' Scrittura del file '+NomeFile+' ...',Color.Performing);
      Delay(Ritardo.Messaggi);

      { Scrive il record }
      Write(FileMSK,AppRecFile^);

      { Chiude il file }
      Close(FileMSK);

      Dispose(AppRecFile); { 3848 Bytes }

      Image^[NumPgVideo].FileName := NomeFile;

      End;

    End;

End; { SalvaFileMaschera }


{----------------------------------------------------------------------------
  PROCEDURA: POSIZ.CURSORE

  Sposta il cursore ad una certa posizione. Se la variabile globale
  NORMALCURSOR vale TRUE allora il cursore Š un blocco lampeggiante,
  altrimenti (cioŠ se vale FALSE) Š dato da due linee (una orizzontale
  e l' altra verticale) che si intersecano nella posizione specificata.
 ----------------------------------------------------------------------------}
Procedure PosizCursore;

{ Variabili locali }
Var
    { Offset del carattere in memoria video }
    I:   Integer;

    { Indice per i cicli }
    J:   Byte;

    { Attributo in memoria video }
    Att: Byte;

Begin { PosizCursore }

With Image^[NumPgVideo] Do

  { Come deve essere il cursore ? }
  If Special.NormalCursor
    Then

      { Cursore normale (blocco lampeggiante) }
      Begin

      { Vai alle coordinate specifiche }
      GoToXY(Col,Row);

      { Disegna il cursore come un blocco pieno ('Û') }
      BlockCursor;

      End

  Else

    { La posizione Š data dall' intersezione delle due linee (orizzontale
      e verticale) che percorrono tutto lo schermo }
    Begin

    { Offset di inizio nella memoria video }
    i := (Col-1)*2+1;
    j := 1;

    { Scrittura della linea verticale }
    Repeat

      { Memorizza }
      Att := Mem[Segmento:i];

      { Elabora }
      Mem[Segmento:i] := (Not Att) Mod 128;

      { Prosegui }
      Inc(i,160);
      Inc(j);

    Until (j > 24);

    { Offset di inizio nella memoria video }
    i := (Row-1)*160+1;
    j := 1;

    { Scrittura della linea orizzontale }
    Repeat

      { Memorizza }
      Att := Mem[Segmento:i];

      { Elabora }
      Mem[Segmento:i] := (Not Att) Mod 128;

      { Prosegui }
      Inc(i,2);
      Inc(j);

    Until (j > 80);

    End;

End; { PosizCursore }


End. { TIPBase }
