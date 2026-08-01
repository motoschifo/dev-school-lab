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
 ║       VERSIONE 1.0                          UNIT TIPTRACE                ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   14 Marzo 1993
  Ora:    13:00:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorTrace }

{ Contiene tutte le procedure per il disegno di cornici e il raccordo
  dei caratteri scritti con quelli già esistenti nell' immagine. }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Procedure MenuTraccia;

  - Procedure TraceControl ( Car: Char ); }


{ Nome della unit }
Unit
     TIPTrace;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPTrace }


{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalità testo }
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

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse,

     { Visualizzazione dell' ora e della pressione dei tasti speciali }
     TIPTime;


{----------------------------------------------------------------------------
  PROCEDURA: MENU.TRACCIA

  Attende che venga scelto il tipo di carattere da utilizzare come traccia
  oppure il colore da modificare.
 ----------------------------------------------------------------------------}
Procedure MenuTraccia;


{----------------------------------------------------------------------------
  PROCEDURA: TRACE.CONTROL

  Aggiorna in modo opportuno il colore e l' attributo della posizione
  corrente del cursore nella pagina video attiva.
 ----------------------------------------------------------------------------}
Procedure TraceControl ( Car: Char );


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPTrace }


{----------------------------------------------------------------------------
  PROCEDURA: MENU.TRACCIA

  Attende che venga scelto il tipo di carattere da utilizzare come traccia
  oppure il colore da modificare.
 ----------------------------------------------------------------------------}
Procedure MenuTraccia;

{ Variabili locali }
Var

    { Cornice in input }
    St:   FrameChars;

    { Carattere di appoggio }
    Ch:   Char;

    { Attributo in input }
    Attr: Integer;

Begin { MenuTraccia }

{ Disegna il menu traccia }
With Color Do
  Case Menu('[MENU TRACCIA]',

            '||'+

            '^Nessuna Cornice|'+
            ' Nessuna cornice (scrittura normalmente)|'+

	    '||'+

	    '              ^1 ┌──┼──────────┘               |'+
            ' Disegna linee singole|'+

	    '||'+

	    '^2 ╒════╪════════╛|'+
            ' Disegna linee singole verticalmente e doppie orizzontalmente|',

	    '||'+

	    '^3 ╔═══════╬═════╝|'+
            ' Disegna linee doppie|'+

	    '||'+

	    '^4 ╓──────────╫──╜|'+
            ' Disegna linee singole orizzontalmente e doppie verticalmente|',

	    '||'+

	    'C^arattere|'+
            ' Disegna linee formate da un carattere ASCII|'+

            '||'+

            'Cambio ^Colore|'+
            ' Cambia solo il colore e lascia invariato il carattere|',

	    '||','','','','',

	     MenuTitle,MenuSel,MenuUnSel,
	     MenuBord,MenuText,MenuKeySel,
	     MenuKeyUnSel,SMenuTrace)
       Of

          { Rinuncia a scegliere il tipo di linea }
          2: Trace := TOff;

	  { Linea singola }
	  4: Begin
	     Trace := TLine;
	     Cornice := SingleFrame;
             End;

	  { Linea singola verticale e doppia orizzontale }
	  6: Begin
	     Trace := TLine;
	     Cornice := DoubleHorFrame;
             End;

	  { Linea singola orizzontale e doppia verticale }
	  8: Begin
             Trace := TLine;
             Cornice := DoubleFrame;
             End;

	  { Linea doppia }
	  10: Begin
	      Trace := TLine;
	      Cornice := DoubleVerFrame;
              End;

	  { Linea formata da un solo carattere }
	  12: Begin

	      { Messaggio per l' utente }
	      Info(' Scegli il carattere ASCII da utilizzare per le linee.',
		    UserInfo);

	      { Scelta del carattere ASCII }
	      Ch := MenuASCII;

	      { Se il carattere è diverso dal carattere nullo ... }
	      If (Ch <> kNull)
	        Then

		  { Linea formata da 13 caratteri successivi }
		  Begin
                  Trace := TLine;
		  Cornice := Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch+Ch;
                  End

	      Else

	        { Cornice nulla }
	        Trace := TOff;

	      End;

          { Cambio del colore e non del carattere }
          14: Begin

              { Informazione per l' utente }
              Info(' Scegli nuovo colore per disegnare.',UserInfo);

              { Scelta del colore da utilizzare per la cornice }
              Attr := ScegliColori;

              { E' valido ? }
              If (Attr <> -1)
                Then

                  { Si }
                  Begin
                  Trace := TColor;
                  Colore := Attr;
                  End

                Else

                  { No }
                  Trace := TOff;

              End;

	  End; { Case Menu }

End; { MenuTraccia }


{----------------------------------------------------------------------------
  PROCEDURA: TRACE.CONTROL

  Aggiorna in modo opportuno il colore e l' attributo della posizione
  corrente del cursore nella pagina video attiva.
 ----------------------------------------------------------------------------}
Procedure TraceControl ( Car: Char );


     {-----------------------------------------------------------------------
       FUNZIONE: DESTRA

       Restituisce il valore logico TRUE se il carattere a destra della
       posizione considerata può essere collegato con quello attuale.
       Restituisce FALSE anche quando non esistono caratteri più a destra
       (limite destro del video).
      -----------------------------------------------------------------------}
     Function  Destra: Boolean;

     Begin { Destra }

     With Image^[NumPgVideo] Do

       If (Col+1 > 80)
         Then
           Destra := False

       Else

         Destra := (Page[Row,Col+1].Ch In [Cornice[2],Cornice[3],Cornice[7],
                                           Cornice[8],Cornice[9],Cornice[11],
                                           Cornice[12],Cornice[13]]);

     End; { Destra }


     {-----------------------------------------------------------------------
       FUNZIONE: SINISTRA

       Restituisce il valore logico TRUE se il carattere a sinistra della
       posizione considerata può essere collegato con quello attuale.
       Restituisce FALSE anche quando non esistono caratteri più a sinistra
       (limite sinistro del video).
      -----------------------------------------------------------------------}
     Function  Sinistra: Boolean;

     Begin { Sinistra }

     With Image^[NumPgVideo] Do

       If (Col-1 < 1)
         Then
           Sinistra := False

       Else

         Sinistra := (Page[Row,Col-1].Ch In [Cornice[1],Cornice[2],
                                             Cornice[6],Cornice[7],
                                             Cornice[9],Cornice[10],
                                             Cornice[11],Cornice[13]]);

     End; { Sinistra }


     {-----------------------------------------------------------------------
       FUNZIONE: SU

       Restituisce il valore logico TRUE se il carattere superiore alla
       posizione considerata può essere collegato con quello attuale.
       Restituisce FALSE anche quando non esistono caratteri più in alto
       (limite superiore del video).
      -----------------------------------------------------------------------}
     Function  Su: Boolean;

     Begin { Su }

     With Image^[NumPgVideo] Do

       If (Row-1 < 1)
         Then
           Su := False

     Else

       Su := (Page[Row-1,Col].Ch In [Cornice[1],Cornice[3],Cornice[4],
                                     Cornice[5],Cornice[9],Cornice[10],
                                     Cornice[11],Cornice[12]]);

     End; { Su }


     {-----------------------------------------------------------------------
       FUNZIONE: GIU

       Restituisce il valore logico TRUE se il carattere inferiore alla
       posizione considerata può essere collegato con quello attuale.
       Restituisce FALSE anche quando non esistono caratteri più in basso
       (limite inferiore del video).
      -----------------------------------------------------------------------}
     Function  Giu: Boolean;

     Begin { Giu }

     With Image^[NumPgVideo] Do

       If (Row+1 > 24)
         Then
           Giu := False

       Else

         Giu := (Page[Row+1,Col].Ch In [Cornice[4],Cornice[5],Cornice[6],
                                        Cornice[8],Cornice[10],Cornice[11],
                                        Cornice[12],Cornice[13]]);

     End; { Giu }


Begin { TraceControl }

With Image^[NumPgVideo] Do

  With Page[Row,Col] Do

    Begin

    { L' immagine è considerata modificata }
    If (Trace <> TOff)
      Then
        Image^[NumPgVideo].Modify := True;

    { Traccia colore }
    If (Trace = TColor)
      Then
        Begin

        { Colori non bloccati }
        If ((Not Special.BloccaFore) And (Not Special.BloccaBack))
          Then
            At := Colore

        Else

          { Colore di fondo bloccato }
          If ((Not Special.BloccaFore) And (Special.BloccaBack))
            Then
              At := (Colore Mod 16)+(At Div 16)*16

        Else

          { Colore di primo piano bloccato }
          If ((Special.BloccaFore) And (Not Special.BloccaBack))
            Then
              At := (At Mod 16)+(Colore Div 16)*16;

        End

    Else

      { Cornice carattere }
      Begin

      Case Car Of

        { Su: muove di una riga verso l' alto }
        kUp: Begin

             { Se i caratteri non sono bloccati }
             If ((Not Special.BloccaCar) And (Trace = TLine))
               Then
                 Begin

                 { A seconda dei caratteri che stanno attorno alla
                   posizione del cursore, viene disegnato una parte
                   della cornice }
                 If (Giu And Destra And Sinistra)
                   Then
                     Ch := Cornice[11]
                 Else
                   If (Destra And Sinistra)
                     Then
                       Ch := Cornice[13]
                 Else
                   If (Destra And Giu)
                     Then
                       Ch := Cornice[10]
                 Else
                   If (Sinistra And Giu)
                     Then
                       Ch := Cornice[12]
                 Else
                   If Destra
                     Then
                       Ch := Cornice[6]
                 Else
                   If Sinistra
                     Then
                       Ch := Cornice[8]
                 Else
                   Ch := Cornice[4];

                 { Aggiornamento del carattere }
                 Page[Row,Col].At := ModifyColor(Page[Row,Col].At,Attr,
                                                 Row,Col);

                 End;

             End;

        { Giù: muove di una riga verso il basso }
        kDown: Begin

               { Se i caratteri non sono bloccati }
               If ((Not Special.BloccaCar) And (Trace = TLine))
                 Then
                   Begin

                   { A seconda dei caratteri che stanno attorno alla
                     posizione del cursore, viene disegnato una parte
                     della cornice }
                   If (Su And Destra And Sinistra)
                     Then
                       Ch := Cornice[11]
                   Else
                     If (Destra And Sinistra)
                       Then
                         Ch := Cornice[9]
                   Else
                     If (Destra And Su)
                       Then
                         Ch := Cornice[10]
                   Else
                     If (Sinistra And Su)
                       Then
                         Ch := Cornice[12]
                   Else
                     If Destra
                       Then
                         Ch := Cornice[1]
                   Else
                     If Sinistra
                       Then
                         Ch := Cornice[3]
                   Else
                     Ch := Cornice[5];

                   { Aggiornamento del carattere }
                   Page[Row,Col].At := ModifyColor(Page[Row,Col].At,Attr,
                                                   Row,Col);

                   End;

               End;

        { Destra: muove di una colonna verso destra }
        kRight: Begin

                { Se i caratteri non sono bloccati }
                If ((Not Special.BloccaCar) And (Trace = TLine))
                  Then
                    Begin

                    { A seconda dei caratteri che stanno attorno alla
                      posizione del cursore, viene disegnato una parte
                      della cornice }
                    If (Su And Giu And Sinistra)
                      Then
                        Ch := Cornice[11]
                    Else
                      If (Giu And Sinistra)
                        Then
                          Ch := Cornice[9]
                    Else
                      If (Giu And Su)
                        Then
                          Ch := Cornice[10]
                    Else
                      If (Su And Sinistra)
                        Then
                          Ch := Cornice[13]
                    Else
                      If Giu
                        Then
                          Ch := Cornice[1]
                    Else
                      If Su
                        Then
                          Ch := Cornice[6]
                    Else
                      Ch := Cornice[7];

                    { Aggiornamento del carattere }
                    Page[Row,Col].At := ModifyColor(Page[Row,Col].At,Attr,
                                                    Row,Col);

                    End;

                End;

        { Sinistra: muove di una colonna verso sinistra }
        kLeft: Begin

               { Se i caratteri non sono bloccati }
               If ((Not Special.BloccaCar) And (Trace = TLine))
                 Then
                   Begin

                   { A seconda dei caratteri che stanno attorno alla
                     posizione del cursore, viene disegnato una parte
                     della cornice }
                   If (Su And Giu And Destra)
                     Then
                       Ch := Cornice[11]
                   Else
                     If (Giu And Destra)
                       Then
                         Ch := Cornice[9]
                   Else
                     If (Giu And Su)
                       Then
                         Ch := Cornice[12]
                   Else
                     If (Su And Destra)
                       Then
                         Ch := Cornice[13]
                   Else
                     If Giu
                       Then
                         Ch := Cornice[3]
                   Else
                     If Su
                       Then
                         Ch := Cornice[8]
                   Else
                     Ch := Cornice[2];

                   { Aggiornamento del carattere }
                   Page[Row,Col].At := ModifyColor(Page[Row,Col].At,Attr,
                                                   Row,Col);

                   End;

               End;

        End; { Case Car }

      End;

    End;

End; { TraceControl }


End. { TIPTrace }
