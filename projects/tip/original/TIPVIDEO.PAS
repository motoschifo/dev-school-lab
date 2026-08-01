{ֹֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ»
 ÷                                                                          ÷
 ÷       ששששששששששששששששששששששששששששששששששששששששששששששששששששששששששש        ÷
 ÷       שתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתש        ÷
 ÷       שתתÚִִִִִִִִִִִִִִ¿תתתתÚִִִִִִ¿תתתתתתתÚִִִִִִִִִִִִִ¿תתתתתש        ÷
 ÷       שתת³°°°°°°°°°°°°°°³תתתת³±±±±±±³תתתתתתת³²²²²²²²²²²²²²ְ¿תתתתש        ÷
 ÷       שתת³°°Úִִ¿°°Úִִ¿°°³תתתתְִ¿±±ÚִÙתתתתתתתְִ¿²²Úִִִִִִ¿²²ְ¿תתתש        ÷
 ÷       שתתְִִÙתת³°°³תתְִִÙתתתתתת³±±³תתתתתתתתתתת³²²³תתתתתתֶ ²²³תתתש        ÷
 ÷       שתתתתתתתת³°°³תתתתתתתתתתתת³±±³תתתתתתתתתתת³²²ְִִִִִִÙ²²ÚÙתתתש        ÷
 ÷       שתתתתתתתת³°°³תתתתתתתתתתתת³±±³תתתתתתתתתתת³²²²²²²²²²²²ÚÙתתתתש        ÷
 ÷       שתתתתתתתת³°°³תתתתתתתתתתתת³±±³תתתתתתתתתתת³²²ÚִִִִִִִִÙתתתתתש        ÷
 ÷       שתתתתתתÚִÙ°°ְִ¿תתתתתתתתÚִÙ±±ְִ¿תתתתתתתÚִÙ²²ְִ¿תתתתתתתתתתתתש        ÷
 ÷       שתתתתתת³°°°°°°³תTEXTתתת³±±±±±±³תIMAGEת³²²²²²²³תPROCESSORתתש        ÷
 ÷       שתתתתתתְִִִִִִÙתתתתתתתתְִִִִִִÙתתתתתתתְִִִִִִÙתתתתתתתתתתתתש        ÷
 ÷       שתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתש        ÷
 ÷       ששששששששששששששששששששששששששששששששששששששששששששששששששששששששששש        ÷
 ÷                                                                          ÷
 ÷       FOCHI MICHELE                                                      ÷
 ÷       VERSIONE 1.0                          UNIT TIPVIDEO                ÷
 ÷                                                                          ÷
 ָֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ¼}
{ Data:   14 Marzo 1993
  Ora:    13:40:00
  Autore: Fochi Michele
  File:   Unit UnitTextImageProcessorVideo }

{ Contiene le procedure e funzioni per gestire le chiamate al menu Video,
  cio la copia di immagini, lo spostamento, lo riempimento, la cancel_
  lazione, la memorizzazione, il ripristino, ecc. }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Procedure MoveVideo;

  - Function  ScegliImmagine: Byte;

  - Procedure CopyVideo;

  - Procedure MoveAppVideoToImage ( Var Rec1:   RecPage;
                                    Var Rec2:   RecImage;
                                        Car:    Char;
				    Var Colore: Byte );

  - Procedure EraseVideo;

  - Procedure FillVideo;

  - Procedure BordVideo;

  - Procedure InvertVideo;

  - Procedure StoreClipBoardVideo;

  - Procedure RestoreClipBoardVideo;

  - Procedure MenuSchermo; }


{ Nome della unit }
Unit
     TIPVideo;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPVideo }


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

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse,

     { Visualizzazione dell' ora e della pressione dei tasti speciali }
     TIPTime;


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.VIDEO

  Effettua lo spostamento di un blocco. Se  stato definito in memoria
  verr… letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Premendo RETURN una volta spostato il blocco, verr… definita la sua
  nuova posizione nella pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure MoveVideo;


{----------------------------------------------------------------------------
  FUNZIONE: SCEGLI.IMMAGINE

  Visualizza una finestra dalla quale  possibile scegliere una immagine
  tra quelle disponibili (sono in tutto 11).
  Queste sono numerate (da 1 a 11) ed  specificato se sono state modificate
  (il simbolo appare subito dopo il numero), il nome del file associato (se
  esiste) e il tipo di file (maschera o testo).
 ----------------------------------------------------------------------------}
Function  ScegliImmagine: Byte;


{----------------------------------------------------------------------------
  PROCEDURA: COPY.VIDEO

  Effettua la copia di un blocco. Se  stato definito in memoria verr…
  letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Si possono effettuare copie multiple dello stesso blocco, premendo
  RETURN ogni volta che si vuole copiare il contenuto del blocco sulla
  pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure CopyVideo;


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.APP.BLOCK.TO.IMAGE

  Trasferisce la copia del video in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni. La struttura dei dati  quella relativa
  ad una pagina video, e l' immagine viene spostata e non copiata.
  Questa procedura serve solo per cancellare lo schermo e riempirlo di un
  certo attributo/carattere.
 ----------------------------------------------------------------------------}
Procedure MoveAppVideoToImage ( Var Rec1:   RecPage;
                                Var Rec2:   RecImage;
                                    Car:    Char;
				Var Colore: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: ERASE.VIDEO

  Cancella il blocco definito dall' utente riempiendolo di caratteri nulli
  di attributo di colore scelto dall' utente.
 ----------------------------------------------------------------------------}
Procedure EraseVideo;


{----------------------------------------------------------------------------
  PROCEDURA: FILL.VIDEO

  Riempie il blocco definito dall' utente del carattere e del colore
  scelti.
  Per non riempire il blocco, basta premere il tasto ESCAPE prima di
  aver scelto il colore.
 ----------------------------------------------------------------------------}
Procedure FillVideo;


{----------------------------------------------------------------------------
  PROCEDURA: BORD.VIDEO

  Contorna il blocco definito dall' utente del colore e della cornice
  scelti.
  Per interrompere il processo, basta premere il tasto ESCAPE prima di
  aver scelto la cornice.
 ----------------------------------------------------------------------------}
Procedure BordVideo;


{----------------------------------------------------------------------------
  PROCEDURA: INVERT.VIDEO

  Effettua la chiamata alla procedura INVERTBLOCK per invertire la pagina
  nel modo scelto dall' utente (Su-Gi—, Destra-Sinistra, Colori).
 ----------------------------------------------------------------------------}
Procedure InvertVideo;


{----------------------------------------------------------------------------
  PROCEDURA: STORE.CLIPBOARD.VIDEO

  Memorizza il blocco definito dall' utente. Se il blocco non  stato
  definito viene chiesto in input.
 ----------------------------------------------------------------------------}
Procedure StoreClipBoardVideo;


{----------------------------------------------------------------------------
  PROCEDURA: RESTORE.CLIPBOARD.VIDEO

  Ripristina il blocco memorizzato, se c', per copiarlo in qualche zona
  dell' immagina attiva sullo schermo.
 ----------------------------------------------------------------------------}
Procedure RestoreClipBoardVideo;


{----------------------------------------------------------------------------
  PROCEDURA: MENUSCHERMO

  Disegna un menu da cui  possibile marcare l' inizio e la fine di un
  blocco, copiarlo, spostarlo, cancellarlo, riempirlo, contornarlo,
  invertirlo (su-gi—, destra-sinistra, colori, ecc.), leggerlo e
  salvarlo sia da/su disco sia da/su memoria, considerandolo come
  un file di tipo blocco o un file di tipo testo.
 ----------------------------------------------------------------------------}
Procedure MenuSchermo;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPVideo }


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.VIDEO

  Effettua lo spostamento di un blocco. Se  stato definito in memoria
  verr… letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Premendo RETURN una volta spostato il blocco, verr… definita la sua
  nuova posizione nella pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure MoveVideo;

{ Variabili locali }
Var

    { Memorizza lo schermo }
    OldVideo:    PTRPage;

    { Immagine di appoggio }
    AppVideo:    PTRPage;

    { Vale TRUE quando si preme RETURN o ESCAPE }
    Done:        Boolean;

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

Begin { MoveVideo }

{ Messaggio per l' utente }
Info(' Premi <Return> per accettare l'' immagine.',Color.UserInfo);

{ Alloca in memoria la pagina che memorizzar… il blocco }
New(OldVideo);  { 3840 Bytes }
New(AppVideo);  { 3840 Bytes }

{ Salva la situazione del video }
OldVideo^ := Image^[NumPgVideo].Page;

{ TRUE per uscire dal ciclo }
Done := False;

{ Ciclo principale: premere ESCAPE per uscire }
Repeat

  { Attesa di un tasto }
  AttendiMouse(Ch1,Ch2,SMoveVideo,Aggiorna);

  { Se la posizione del mouse  cambiata ... }
  If (((OldMouseX <> MouseTextX) Or (OldMouseY <> MouseTextY)) And
        MouseOk)
          Then

            Begin

            Ch1 := kNull;

            { Simula lo spostamento del mouse con la pressione dei tasti
              freccia }
            If (MouseTextX > OldMouseX)
              Then
                Ch2 := kRight;
            If (MouseTextX < OldMouseX)
              Then
                Ch2 := kLeft;
            If (MouseTextY > OldMouseY)
              Then
                Ch2 := kDown;
            If (MouseTextY < OldMouseY)
              Then
                Ch2 := kUp;

            { Aggiornamento delle variabili }
            OldMouseX := MouseTextX;
            OldMouseY := MouseTextY;
            Aggiorna := True;

            End;

  { I pulsanti del mouse sono stati premuti ? }
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

      { Rilascio dei pulsanti }
      While MousePressed Do
        GetMPos;

      Aggiorna := True;

      End;

  { Se il video vuole aggiornato ... }
  If Aggiorna
    Then

      { A seconda del tasto premuto ... }
      Case Ch1 Of

        { Tasto esteso }
        kNull: With Image^[NumPgVideo] Do

                 Case Ch2 Of

	           { Su: Sposta il blocco verso l' alto di una riga }
	           kUp: Begin

                        With Special Do
                          Begin

                          { Nessuna restrizione }
	                  If ((Not BloccaFore) And (Not BloccaBack) And
                              (Not BloccaCar))
	                        Then
                                  Begin
		                  AppVideo^[1] := Page[1];
                                  For i := 1 To 23 Do
                                    Page[i] := Page[i+1];
                                  Page[24] := AppVideo^[1];
                                  End

                          Else

                            Begin

                            { Caratteri non bloccati }
                            If (Not BloccaCar)
                              Then
                                Begin
		                For i := 1 To 80 Do
			          AppVideo^[1,i].Ch := Page[1,i].Ch;
                                For i := 1 To 23 Do
                                  For j := 1 To 80 Do
                                    Page[i,j].Ch := Page[i+1,j].Ch;
                                For i := 1 To 80 Do
                                  Page[24,i].Ch := AppVideo^[1,i].Ch;
                                End

                            Else
                              ;

                            { Colori non bloccati }
                            If ((Not BloccaFore) And (Not BloccaBack))
                              Then
                                Begin
		                For i := 1 To 80 Do
			          AppVideo^[1,i].At := Page[1,i].At;
                                For i := 1 To 23 Do
                                  For j := 1 To 80 Do
                                    Page[i,j].At := Page[i+1,j].At;
                                For i := 1 To 80 Do
                                  Page[24,i].At := AppVideo^[1,i].At;
                                End

                            Else

                              { Colore di sfondo bloccato }
                              If (BloccaBack And (Not BloccaFore))
                                Then
                                  Begin
                                  For i := 1 To 80 Do
                                    AppVideo^[1,i].At :=
                                                 (Page[1,i].At Mod 16)+
			                         (Page[24,i].At Div 16)*16;
                                  For i := 1 To 23 Do
                                    For j := 1 To 80 Do
                                      Page[i,j].At :=
                                              (Page[i+1,j].At Mod 16)+
				              (Page[i,j].At Div 16)*16;
                                  For i := 1 To 80 Do
                                    Page[24,i].At := AppVideo^[1,i].At;
                                  End

                            Else

                              { Colore di primo piano bloccato }
                              If (BloccaFore And (Not BloccaBack))
                                Then
                                  Begin
                                  For i := 1 To 80 Do
                                    AppVideo^[1,i].At :=
                                                 (Page[24,i].At Mod 16)+
			                         (Page[1,i].At Div 16)*16;
                                  For i := 1 To 23 Do
                                    For j := 1 To 80 Do
                                      Page[i,j].At :=
                                              (Page[i,j].At Mod 16)+
				              (Page[i+1,j].At Div 16)*16;
                                  For i := 1 To 80 Do
                                    Page[24,i].At := AppVideo^[1,i].At;
                                  End

                              Else

                                { Colori bloccati }
                                If (BloccaFore And BloccaBack)
                                  Then
                                    ;

                            End;

                          End;

                        { Aggiornamento dello schermo }
                        Fisico^ := Page;

	                End;

	           { Gi—: Sposta il blocco verso il basso di una riga }
	           kDown: Begin

                          With Special Do

                            Begin

                            { Nessuna restrizione }
	                    If ((Not BloccaFore) And (Not BloccaBack) And
                                (Not BloccaCar))
	                          Then
                                    Begin
		                    AppVideo^[24] := Page[24];
                                    For i := 24 DownTo 2 Do
                                      Page[i] := Page[i-1];
                                    Page[1] := AppVideo^[24];
                                    End

                            Else

                              Begin

                              { Caratteri non bloccati }
                              If (Not BloccaCar)
                                Then
                                  Begin
		                  For i := 1 To 80 Do
                                    AppVideo^[24,i].Ch := Page[24,i].Ch;
                                  For i := 24 DownTo 2 Do
                                    For j := 1 To 80 Do
                                      Page[i,j].Ch := Page[i-1,j].Ch;
                                  For i := 1 To 80 Do
                                    Page[1,i].Ch := AppVideo^[24,i].Ch;
                                  End

                              Else
                                ;

                              { Colori non bloccati }
                              If ((Not BloccaFore) And (Not BloccaBack))
                                Then
                                  Begin
		                  For i := 1 To 80 Do
                                    AppVideo^[24,i].At := Page[24,i].At;
                                  For i := 24 DownTo 2 Do
                                    For j := 1 To 80 Do
                                      Page[i,j].At := Page[i-1,j].At;
                                  For i := 1 To 80 Do
                                    Page[1,i].At := AppVideo^[24,i].At;
                                  End

                              Else

                                { Colore di sfondo bloccato }
                                If (BloccaBack And (Not BloccaFore))
                                  Then
                                    Begin
                                    For i := 1 To 80 Do
                                      AppVideo^[24,i].At :=
                                                    (Page[24,i].At Mod 16)+
			                            (Page[1,i].At Div 16)*16;
                                    For i := 24 DownTo 2 Do
                                      For j := 1 To 80 Do
                                        Page[i,j].At :=
                                                (Page[i-1,j].At Mod 16)+
				                (Page[i,j].At Div 16)*16;
                                    For i := 1 To 80 Do
                                      Page[1,i].At := AppVideo^[24,i].At;
                                    End

                              Else

                                { Colore di primo piano bloccato }
                                If (BloccaFore And (Not BloccaBack))
                                  Then
                                    Begin
                                    For i := 1 To 80 Do
                                      AppVideo^[24,i].At :=
                                                   (Page[1,i].At Mod 16)+
			                           (Page[24,i].At Div 16)*16;
                                    For i := 24 DownTo 2 Do
                                      For j := 1 To 80 Do
                                        Page[i,j].At :=
                                                (Page[i,j].At Mod 16)+
				                (Page[i-1,j].At Div 16)*16;
                                    For i := 1 To 80 Do
                                      Page[1,i].At := AppVideo^[24,i].At;
                                    End

                                Else

                                  { Colori bloccati }
                                  If (BloccaFore And BloccaBack)
                                    Then
                                      ;

                              End;

                            End;

                            { Aggiornamento dello schermo }
                            Fisico^ := Page;

		            End;

	           { Sinistra: Sposta il blocco verso sinistra di una colonna }
	           kLeft: Begin

                          With Special Do
                            Begin

                            { Nessuna restrizione }
	                    If ((Not BloccaFore) And (Not BloccaBack) And
                                (Not BloccaCar))
	                          Then
                                    Begin
                                    For i := 1 To 24 Do
                                      AppVideo^[i,1] := Page[i,1];
                                    For i := 1 To 24 Do
                                      For j := 1 To 79 Do
                                        Page[i,j] := Page[i,j+1];
                                    For i := 1 To 24 Do
                                      Page[i,80] := AppVideo^[i,1];
                                    End

                            Else

                              Begin

                              { Caratteri non bloccati }
                              If (Not BloccaCar)
                                Then
                                  Begin
                                  For i := 1 To 24 Do
                                    AppVideo^[i,1].Ch := Page[i,1].Ch;
                                  For i := 1 To 24 Do
                                    For j := 1 To 79 Do
                                      Page[i,j].Ch := Page[i,j+1].Ch;
                                  For i := 1 To 24 Do
                                    Page[i,80].Ch := AppVideo^[i,1].Ch;
                                  End

                              Else
                                ;

                              { Colori non bloccati }
                              If ((Not BloccaFore) And (Not BloccaBack))
                                Then
                                  Begin
                                  For i := 1 To 24 Do
                                    AppVideo^[i,1].At := Page[i,1].At;
                                  For i := 1 To 24 Do
                                    For j := 1 To 79 Do
                                      Page[i,j].At := Page[i,j+1].At;
                                  For i := 1 To 24 Do
                                    Page[i,80].At := AppVideo^[i,1].At;
                                  End

                              Else

                                { Colore di sfondo bloccato }
                                If (BloccaBack And (Not BloccaFore))
                                  Then
                                    Begin
                                    For i := 1 To 24 Do
                                      AppVideo^[i,1].At :=
                                                   (Page[i,1].At Mod 16)+
			                           (Page[i,80].At Div 16)*16;
                                    For i := 1 To 24 Do
                                      For j := 1 To 79 Do
                                        Page[i,j].At :=
                                                (Page[i,j+1].At Mod 16)+
				                (Page[i,j].At Div 16)*16;
                                    For i := 1 To 24 Do
                                      Page[i,80].At := AppVideo^[i,1].At;
                                    End

                              Else

                                { Colore di primo piano bloccato }
                                If (BloccaFore And (Not BloccaBack))
                                  Then
                                    Begin
                                    For i := 1 To 24 Do
                                      AppVideo^[i,1].At :=
                                                   (Page[i,80].At Mod 16)+
			                           (Page[i,1].At Div 16)*16;
                                    For i := 1 To 24 Do
                                      For j := 1 To 79 Do
                                        Page[i,j].At :=
                                                (Page[i,j].At Mod 16)+
				                (Page[i,j+1].At Div 16)*16;
                                    For i := 1 To 24 Do
                                      Page[i,80].At := AppVideo^[i,1].At;
                                    End

                                Else

                                  { Colori bloccati }
                                  If (BloccaFore And BloccaBack)
                                    Then
                                      ;

                              End;

                            End;

                          { Aggiornamento dello schermo }
                          Fisico^ := Page;

                          End;

	           { Destra: Sposta il blocco verso destra di una colonna }
	           kRight: Begin

                           With Special Do
                             Begin

                             { Nessuna restrizione }
	                     If ((Not BloccaFore) And (Not BloccaBack) And
                                 (Not BloccaCar))
	                           Then
                                     Begin
                                     For i := 1 To 24 Do
                                       AppVideo^[i,80] := Page[i,80];
                                     For i := 1 To 24 Do
                                       For j := 80 DownTo 2 Do
                                         Page[i,j] := Page[i,j-1];
                                     For i := 1 To 24 Do
                                       Page[i,1] := AppVideo^[i,80];
                                     End

                             Else

                               Begin

                               { Caratteri non bloccati }
                               If (Not BloccaCar)
                                 Then
                                   Begin
                                   For i := 1 To 24 Do
                                     AppVideo^[i,80].Ch := Page[i,80].Ch;
                                   For i := 1 To 24 Do
                                     For j := 80 DownTo 2 Do
                                       Page[i,j].Ch := Page[i,j-1].Ch;
                                   For i := 1 To 24 Do
                                     Page[i,1].Ch := AppVideo^[i,80].Ch;
                                   End

                               Else
                                 ;

                               { Colori non bloccati }
                               If ((Not BloccaFore) And (Not BloccaBack))
                                 Then
                                   Begin
                                   For i := 1 To 24 Do
                                     AppVideo^[i,80].At := Page[i,80].At;
                                   For i := 1 To 24 Do
                                     For j := 80 DownTo 2 Do
                                       Page[i,j].At := Page[i,j-1].At;
                                   For i := 1 To 24 Do
                                     Page[i,1].At := AppVideo^[i,80].At;
                                   End

                               Else

                                 { Colore di sfondo bloccato }
                                 If (BloccaBack And (Not BloccaFore))
                                   Then
                                     Begin
                                     For i := 1 To 24 Do
                                       AppVideo^[i,80].At :=
                                                    (Page[i,80].At Mod 16)+
			                            (Page[i,1].At Div 16)*16;
                                     For i := 1 To 24 Do
                                       For j := 80 DownTo 2 Do
                                         Page[i,j].At :=
                                                 (Page[i,j-1].At Mod 16)+
				                 (Page[i,j].At Div 16)*16;
                                     For i := 1 To 24 Do
                                       Page[i,1].At := AppVideo^[i,80].At;
                                     End

                               Else

                                 { Colore di primo piano bloccato }
                                 If (BloccaFore And (Not BloccaBack))
                                   Then
                                     Begin
                                     For i := 1 To 24 Do
                                       AppVideo^[i,80].At :=
                                                   (Page[i,1].At Mod 16)+
			                           (Page[i,80].At Div 16)*16;
                                     For i := 1 To 24 Do
                                       For j := 80 DownTo 2 Do
                                         Page[i,j].At :=
                                                 (Page[i,j].At Mod 16)+
				                 (Page[i,j-1].At Div 16)*16;
                                     For i := 1 To 24 Do
                                       Page[i,1].At := AppVideo^[i,80].At;
                                     End
                                 Else

                                   { Colori bloccati }
                                   If BloccaFore And BloccaBack
                                     Then
                                       ;

                               End;

                             End;

                           { Aggiornamento dello schermo }
                           Fisico^ := Page;

                           End;

                   { F1: aiuto generale }
	           kF1: Help('Help Generale',Altro);

                   { Shift-F1: indice dell' aiuto }
	           kSF1: Help('Indice',Altro);

                   { Alt-F1: schermata di aiuto precedente }
                   kAF1: Help(LastHelp^[1],Precedente);

                   { Ctrl-F1: help specifico }
                   kCF1: Help('Muovi schermo',Altro);

	           End; { Case Ch2 }

        { Return: Accetta le coordinate del blocco e lo memorizza nella
	          clipboard }
        kReturn: Begin

	         { L' immagine viene considerata modificata }
	         Image^[NumPgVideo].Modify := True;

                 Done := True;

	         End;

        { Escape: Non sceglie il blocco e ripristina il precedente }
        kEscape: Begin

   	         { Ripristino del blocco precedente }
	         Image^[NumPgVideo].Page := OldVideo^;

	         { Uscita dalla funzione }
	         Done := True;

	         End;

        End; { Case Ch1 }
Until Done;

{ Libera la memoria dalla pagina utilizzata per la copia di sicurezza del
  blocco }
Dispose(OldVideo);  { 3840 Bytes }
Dispose(AppVideo);  { 3840 Bytes }

End; { MoveVideo }


{----------------------------------------------------------------------------
  FUNZIONE: SCEGLI.IMMAGINE

  Visualizza una finestra dalla quale  possibile scegliere una immagine
  tra quelle disponibili (sono in tutto 11).
  Queste sono numerate (da 1 a 11) ed  specificato se sono state modificate
  (il simbolo appare subito dopo il numero), il nome del file associato (se
  esiste) e il tipo di file (maschera o testo).
 ----------------------------------------------------------------------------}
Function  ScegliImmagine: Byte;

{ Tipi locali }
Type

     { Vettore che contiene le stringa da visualizzare }
     Vet= Array [1..MaxPgVideo] Of
            String044;

{ Variabili locali }
Var

    { Righe da visualizzare nella finestra }
    St: Vet;

    { Indice per i cicli }
    I:  Byte;

Begin { ScegliImmagine }

{ Vengono controllate tutte le pagine video disponibili }
For i := 1 To MaxPgVideo Do
  Begin

  With Image^[i] Do
    Begin

    { Aggiornamento del nome del file }
    If (FileName = StrNull)
      Then

        { File non su disco }
        St[i] := '( nome di file non assegnato )'

    Else

      { File esistente sul disco }
      Begin

      { Aggiusta la stringa del nome del file }
      St[i] := Copy(FileName,1,33);
      While (Length(St[i]) < 30) Do
        St[i] := St[i]+' ';

      { Tipo del file ? }
      If Maschera
        Then

          { Maschera }
          St[i] := St[i]+'(Maschera)'

      Else

        { Testo }
        St[i] := St[i]+'(Testo)';

      End;

    { E' stato modificato ? }
    If Modify
      Then

        { Si }
        St[i] := 'ִ'+#21+'ִ '+St[i]

    Else

      { No }
      St[i] := 'ִִִ '+St[i];

    End;

  While (Length(St[i]) < 44) Do
    St[i] := St[i]+' ';

  End;

{ Apre con effetto a scoppio la finestra del menu schermo }
With Color Do
  Case Menu('[SCEGLI IMMAGINE]',

	    '||'+

            '       Immagine 0^1: '+St[01]+'       |'+
            ' Scegli l'' immagine numero 1|'+

            'Immagine 0^2: '+St[02]+'|'+
            ' Scegli l'' immagine numero 2|'+

            'Immagine 0^3: '+St[03]+'|',
            ' Scegli l'' immagine numero 3|'+

            'Immagine 0^4: '+St[04]+'|'+
            ' Scegli l'' immagine numero 4|'+

            'Immagine 0^5: '+St[05]+'|'+
            ' Scegli l'' immagine numero 5|',

            'Immagine 0^6: '+St[06]+'|'+
            ' Scegli l'' immagine numero 6|'+

            'Immagine 0^7: '+St[07]+'|'+
            ' Scegli l'' immagine numero 7|'+

            'Immagine 0^8: '+St[08]+'|',
            ' Scegli l'' immagine numero 8|'+

            'Immagine 0^9: '+St[09]+'|'+
            ' Scegli l'' immagine numero 9|'+

            'Immagine 1^0: '+St[10]+'|'+
            ' Scegli l'' immagine numero 10|',

            '||'+

            ' ^ClipBoard:  '+St[PgClipBoard]+'|'+
            ' Scegli l'' immagine memorizzata nella ClipBoard|'+

	    '||','','','',

	    MenuTitle,MenuSel,MenuUnSel,
	    MenuBord,MenuText,MenuKeySel,
	    MenuKeyUnSel,SMenuImage)
       Of

          { Immagine in memoria numero 1 }
          2: ScegliImmagine := 1;

          { Immagine in memoria numero 2 }
          3: ScegliImmagine := 2;

          { Immagine in memoria numero 3 }
          4: ScegliImmagine := 3;

          { Immagine in memoria numero 4 }
          5: ScegliImmagine := 4;

          { Immagine in memoria numero 5 }
          6: ScegliImmagine := 5;

          { Immagine in memoria numero 6 }
          7: ScegliImmagine := 6;

          { Immagine in memoria numero 7 }
          8: ScegliImmagine := 7;

          { Immagine in memoria numero 8 }
          9: ScegliImmagine := 8;

          { Immagine in memoria numero 9 }
          10: ScegliImmagine := 9;

          { Immagine in memoria numero 10 }
          11: ScegliImmagine := 10;

          { Immagine in memoria di appoggio (clipboard) }
          13: ScegliImmagine := PgClipBoard;

       Else

         { Nessuna scelta }
         ScegliImmagine := 0;

       End; { Case Menu }

End; { ScegliImmagine }


{----------------------------------------------------------------------------
  PROCEDURA: COPY.VIDEO

  Effettua la copia di un blocco. Se  stato definito in memoria verr…
  letto da essa, altrimenti verranno chiesti gli estremi degli angoli
  superiore-sinistro e inferiore-destro del rettangolo.
  Per definire il blocco basta premere i tasti direzionali e RETURN per
  confermarlo.
  Si possono effettuare copie multiple dello stesso blocco, premendo
  RETURN ogni volta che si vuole copiare il contenuto del blocco sulla
  pagina attiva.
  Premendo il tasto ESCAPE si esce dalla procedura.
 ----------------------------------------------------------------------------}
Procedure CopyVideo;

{ Variabili locali }
Var

    { Numero di immagine scelta }
    Num: Byte;

    { Stringa di appoggio }
    St:  String;

Begin { CopyVideo }

{ Sceglie un' immagine valida }
Num := ScegliImmagine;

{ Se la scelta  corretta ... }
If (Num <> 0)
  Then
    Begin

    { Se la pagina video  stata modificata ma non salvata, chiede
      se si  disposti a rinunciare alle modifiche apportare }
    If Image^[NumPgVideo].Modify
      Then

	Begin

	{ Visualizza una finestra di dialogo che chiede se si vogliono
	  veramente annullare le modifiche apportare al programma. In
	  caso affermativo setta il campo MODIFY del record dell' immagine
	  IMAGE^ a TRUE.
	  In questo modo, se si testa la variabile booleana, si conclude
	  che l' immagine  stata salvata (questo teoricamente) }
	With Image^[NumPgVideo] Do

	  { Viene deciso il nome del file della pagina corrente }
	  If (FileName <> StrNull) Then
	    St := '( '+FileName+' )|'

	  Else

	    { Altrimenti, se non esiste, viene visualizzato un altro
	      messaggio }
	    St := '( nessun nome di file assegnato )|';

	{ Finestra di dialogo per l' utente }
        With Color Do
	  If (Dialog('[AVVERTENZA]',
		     '|'+
		     '               L'' immagine corrente               |'+
		     St+
		     'non  stata salvata su disco.|'+
		     '|'+
		     'Continui ugualmente ?|','','',
		     __SI_NO__,WarningBord,WarningTitle,
		     WarningText,WarningSel,
		     WarningUnSel,WarningKeySel,
		     WarningKeyUnSel) = 1)

		       Then

		         { Aggiorna lo stato della pagina (modificata) }
		         Image^[NumPgVideo].Modify := False;

	End;

    { Alla risposta affermativa dell' ultima domanda viene letto il
      file, altrimenti non viene fatto niente }
    If (Not (Image^[NumPgVideo].Modify))
      Then

	With Image^[NumPgVideo] Do

	  Begin

          { Aggiornamento dei parametri dell' immagine }
          Page := Image^[Num].Page;
          FileName := Image^[Num].FileName;
          Modify := Image^[Num].Modify;
          Fisico^ := Page;

	  End;

    End;

End; { CopyVideo }


{----------------------------------------------------------------------------
  PROCEDURA: MOVE.APP.BLOCK.TO.IMAGE

  Trasferisce la copia del video in memoria nella pagina attiva, in modo
  da esserci sempre la possibilit… di premere ESCAPE e di ripristinare
  la pagina video originale. Questa procedura effettua inoltre tutti i
  controlli sulle opzioni BLOCCACAR, BLOCCAFORE e BLOCCABACK per impostare
  gli attributi video opportuni. La struttura dei dati  quella relativa
  ad una pagina video, e l' immagine viene spostata e non copiata.
  Questa procedura serve solo per cancellare lo schermo e riempirlo di un
  certo attributo/carattere.
 ----------------------------------------------------------------------------}
Procedure MoveAppVideoToImage ( Var Rec1:   RecPage;
                                Var Rec2:   RecImage;
                                    Car:    Char;
				Var Colore: Byte );

{ Variabili locali }
Var

    { Indice per i cicli }
    I:  Byte;

    { Indice per i cicli }
    J:  Byte;

Begin

With Special Do

  Begin

  { Nessuna restrizione: scrittura normale dei caratteri }
  If ((Not BloccaFore) And (Not BloccaBack) And (Not BloccaCar))
    Then
      For i := 1 To 80 Do
	For j := 1 To 24 Do
          Begin
	  Rec2.Page[j,i].Ch := Car;
          Rec2.Page[j,i].At := Colore;
          End

  Else

    Begin

    { Caratteri non bloccati }
    If (Not BloccaCar)
      Then
        For i := 1 To 80 Do
    	  For j := 1 To 24 Do
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
          For i := 1 To 80 Do
            For j := 1 To 24 Do
	      Rec2.Page[j,i].At := (Colore Mod 16)+(Rec1[j,i].At Div 16)*16

    Else

      { Attributi di primo piano bloccati }
      If ((BloccaFore) And (Not BloccaBack))
        Then
          For i := 1 To 80 Do
	    For j := 1 To 24 Do
	      Rec2.Page[j,i].At := (Rec1[j,i].At Mod 16)+(Colore Div 16)*16

    Else

      { Attributi di primo piano e di sfondo non bloccati }
      If (Not BloccaFore) and (Not BloccaBack)
        Then
          For i := 1 To 80 Do
	    For j := 1 To 24 Do
	      Rec2.Page[j,i].At := Colore;

    End;

  End;

End; { MoveAppVideoToImage }


{----------------------------------------------------------------------------
  PROCEDURA: ERASE.VIDEO

  Cancella il blocco definito dall' utente riempiendolo di caratteri nulli
  di attributo di colore scelto dall' utente.
 ----------------------------------------------------------------------------}
Procedure EraseVideo;

{ Variabili locali }
Var

    { Indice per i cicli }
    I:        Byte;

    { Indice per i cicli }
    J:        Byte;

    { Colore scelto dall' utente }
    Attr:     Integer;

    AppVideo: PTRPage;

Begin { EraseVideo }

New(AppVideo);  { 3840 Bytes }
AppVideo^ := Image^[NumPgVideo].Page;

{ Messaggio per l' utente }
Info(' Scegli il colore dello sfondo.',Color.UserInfo);

{ Scelta dell' attributo }
Attr := ScegliColori;

{ Se  stato scelto un attributo valido si prosegue }
If (Attr <> -1)
  Then

    Begin

    { Cancella il video riempiendolo con caratteri nulli di colore
      ATTR }
    MoveAppVideoToImage(AppVideo^,Image^[NumPgVideo],kNull,Byte(Attr));

    { L' immagine viene considerata modificata }
    Image^[NumPgVideo].Modify := True;

    End;


Dispose(AppVideo);  { 3840 Bytes }

End; { EraseVideo }


{----------------------------------------------------------------------------
  PROCEDURA: FILL.VIDEO

  Riempie il blocco definito dall' utente del carattere e del colore
  scelti.
  Per non riempire il blocco, basta premere il tasto ESCAPE prima di
  aver scelto il colore.
 ----------------------------------------------------------------------------}
Procedure FillVideo;

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

    { Appoggio per il video }
    AppVideo: PTRPage;

Begin { FillVideo }


New(AppVideo);  { 3840 Bytes }

{ Salvataggio dello schermo }
AppVideo^ := Image^[NumPgVideo].Page;

{ Messaggio per l' utente }
Info(' Scegli il carattere ASCII per il riempimento.',Color.UserInfo);

{ Scelta del carattere ASCII }
Ch := MenuASCII;

{ Deve essere diverso dal carattere ASCII nullo }
If (Ch = kNull)
  Then
    Ok := False;

{ Se anche il carattere  stato scelto correttamento ... }
If Ok
  Then

    Begin

    { Messaggio per l' utente }
    Info(' Scegli il colore per il riempimento.',Color.UserInfo);

    { Scelta dell' attributo }
    Attr := ScegliColori;

    { Se  stato scelto un attributo valido si prosegue }
    If (Attr = -1)
      Then
	Ok := False;

    { Se tutte le scelte sono state fatte correttamente,
      si pu• cominciare a riempire il blocco }
    If Ok
      Then

	Begin

	{ Riempie il blocco con caratteri CH di attributo ATTR }
        MoveAppVideoToImage(AppVideo^,Image^[NumPgVideo],Ch,Byte(Attr));

	{ L' immagine viene considerata modificata }
	Image^[NumPgVideo].Modify := True;

	End;

    End;

Dispose(AppVideo);  { 3840 Bytes }

End; { FillVideo }


{----------------------------------------------------------------------------
  PROCEDURA: BORD.VIDEO

  Contorna il blocco definito dall' utente del colore e della cornice
  scelti.
  Per interrompere il processo, basta premere il tasto ESCAPE prima di
  aver scelto la cornice.
 ----------------------------------------------------------------------------}
Procedure BordVideo;

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

    { Cornice scelta }
    Corn:    String013;

Begin { BordVideo }

{ Messaggio per l' utente }
Info(' Scegli il colore per la cornice.',Color.UserInfo);

{ Scelta dell' attributo }
Attr := ScegliColori;

{ Se  stato scelto un attributo valido si prosegue }
If (Attr = -1)
  Then
    Ok := False;

{ Si pu• proseguire solo se il colore  valido }
If Ok
  Then

    Begin

    { Messaggio per l' utente }
    Info(' Scegli il tipo di cornice.',Color.UserInfo);

    { Scegli il tipo di cornice }
    Corn := SelezionaCornice;

    { Se non  un tipo valido non si prosegue }
    If (Cornice = kNull)
      Then
	Ok := False;

    { Dopo la scelta della cornice, si pu• passare finalmente
      ad incorniciare il blocco }
    If Ok
      Then

	{ Disegna una cornice di tipo CORN con attributo ATTR }
        DisegnaCornice(Image^[NumPgVideo],1,1,80,24,Attr,Corn);

    End;


End; { BordVideo }


{----------------------------------------------------------------------------
  PROCEDURA: INVERT.VIDEO

  Effettua la chiamata alla procedura INVERTBLOCK per invertire la pagina
  nel modo scelto dall' utente (Su-Gi—, Destra-Sinistra, Colori).
 ----------------------------------------------------------------------------}
Procedure InvertVideo;

Begin { InvertVideo }

InvertBlock(Image^[NumPgVideo],1,1,80,24,True);

End; { InvertVideo }


{----------------------------------------------------------------------------
  PROCEDURA: STORE.CLIPBOARD.VIDEO

  Memorizza il blocco definito dall' utente. Se il blocco non  stato
  definito viene chiesto in input.
 ----------------------------------------------------------------------------}
Procedure StoreClipBoardVideo;

Begin { StoreClipBoardVideo }

{ Aggiornamento delle variabili delle immagini }
Image^[PgClipBoard].Page := Image^[NumPgVideo].Page;
Image^[PgClipBoard].Modify := Image^[NumPgVideo].Modify;
Image^[PgClipBoard].FileName := Image^[NumPgVideo].FileName;

End; { StoreClipBoardVideo }


{----------------------------------------------------------------------------
  PROCEDURA: RESTORE.CLIPBOARD.VIDEO

  Ripristina il blocco memorizzato, se c', per copiarlo in qualche zona
  dell' immagina attiva sullo schermo.
 ----------------------------------------------------------------------------}
Procedure RestoreClipBoardVideo;

{ Variabili locali }
Var

    { Stringa di appoggio }
    St: String;

Begin { RestoreClipBoardVideo }

{ Se la pagina video  stata modificata ma non salvata, chiede
  se si  disposti a rinunciare alle modifiche apportare }
If Image^[NumPgVideo].Modify
  Then

    Begin

    { Visualizza una finestra di dialogo che chiede se si vogliono
      veramente annullare le modifiche apportare al programma. In
      caso affermativo setta il campo MODIFY del record dell' immagine
      IMAGE^ a TRUE.
      In questo modo, se si testa la variabile booleana, si conclude
      che l' immagine  stata salvata (questo teoricamente) }
    With Image^[NumPgVideo] Do

      { Viene deciso il nome del file della pagina corrente }
      If (FileName <> StrNull) Then
	St := '( '+FileName+' )|'

      Else

	{ Altrimenti, se non esiste, viene visualizzato un altro
	  messaggio }
	St := '( nessun nome di file assegnato )|';

    { Finestra di dialogo per l' utente }
    With Color Do
      If (Dialog('[AVVERTENZA]',
	         '|'+
	         '               L'' immagine corrente               |'+
	         St+
	         'non  stata salvata su disco.|'+
	         '|'+
	         'Continui ugualmente ?|','','',
	         __SI_NO__,WarningBord,WarningTitle,
	         WarningText,WarningSel,
	         WarningUnSel,WarningKeySel,
		 WarningKeyUnSel) = 1)

		   Then

		     { Aggiorna lo stato della pagina (modificata) }
		     Image^[NumPgVideo].Modify := False;

    End;

{ Alla risposta affermativa dell' ultima domanda viene letto il
  file, altrimenti non viene fatto niente }
If (Not (Image^[NumPgVideo].Modify))
  Then

    With Image^[NumPgVideo] Do

      Begin

      { Aggiornamento delle variabili dell' immagine }
      Page := Image^[PgClipBoard].Page;
      FileName := Image^[PgClipBoard].FileName;
      Modify := Image^[PgClipBoard].Modify;
      Fisico^ := Page;

      End;

End; { RestoreClipBoardVideo }


{----------------------------------------------------------------------------
  PROCEDURA: MENUSCHERMO

  Disegna un menu da cui  possibile marcare l' inizio e la fine di un
  blocco, copiarlo, spostarlo, cancellarlo, riempirlo, contornarlo,
  invertirlo (su-gi—, destra-sinistra, colori, ecc.), leggerlo e
  salvarlo sia da/su disco sia da/su memoria, considerandolo come
  un file di tipo blocco o un file di tipo testo.
 ----------------------------------------------------------------------------}
Procedure MenuSchermo;

Begin { MenuSchermo }

{ Apre con effetto a scoppio la finestra del menu schermo }
With Color Do
  Case Menu('[MENU SCHERMO]',

	    '||'+

	    '               ^Copia Schermo               |'+
            ' Effettua una copia dell'' immagine in un'' altra finestra|'+

	    '^Muovi Schermo|'+
            ' Effettua spostamenti dell'' immagine|'+

	    'C^ancella Schermo|'+
            ' Riempie lo schermo di caratteri nulli|',

	    'R^iempi Schermo|'+
            ' Riempie lo schermo di un certo carattere ASCII|'+

	    'C^ontorna Schermo|'+
            ' Disegna la cornice allo schermo|',

	    'In^verti Schermo|'+
            ' Inverte in vari modi lo schermo|'+

	    '||'+

	    'Memori^zza Schermo|'+
            ' Memorizza lo schermo nella ClipBoard|',

	    'Ric^hiama Schermo|'+
            ' Copia lo schermo memorizzato nella ClipBoard|'+

	    '||','','','','',

	     MenuTitle,MenuSel,MenuUnSel,
	     MenuBord,MenuText,MenuKeySel,
	     MenuKeyUnSel,SMenuVideo)
       Of

         { Copia lo schermo }
         2: CopyVideo;

         { Muove un blocco }
         3: MoveVideo;

         { Cancella un blocco sul video }
         4: EraseVideo;

         { Riempie un blocco sul video di un carattere ASCII e di un certo
           colore scelto dall' utente }
         5: FillVideo;

         { Contorna un blocco sul video utilizzando un certo tipo di
	   cornice (o carattere) del colore scelto }
         6: BordVideo;

         { Inverte (su-gi—, destra-sinistra, colore, ..., un blocco }
         7: InvertVideo;

         { Memorizza il blocco nella clipboard }
         9: StoreClipBoardVideo;

         { Legge il blocco dalla clipboard }
         10: RestoreClipBoardVideo;

       End; { Case Menu }

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

End; { MenuSchermo }


End. { TIPVideo }
