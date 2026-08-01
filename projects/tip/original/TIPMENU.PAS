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
 ÷       VERSIONE 1.0                          UNIT TIPMENU                 ÷
 ÷                                                                          ÷
 ָֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ¼}
{ Data:   18 Febbraio 1993
  Ora:    16:07:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorMenuSystem }

{ Unit che gestisce le chiamate ai menu a comparsa e le scelte che si
  possono effettuare in esso. }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Function  Menu ( Titolo:     String080;
		       StA:        String;
		       StB:        String;
		       StC:        String;
                       StD:        String;
                       StE:        String;
		       StF:        String;
                       StG:        String;
                       StH:        String;
		       AtTitle:    Byte;
		       AtSel:      Byte;
		       AtUnSel:    Byte;
		       AtBord:     Byte;
		       AtText:     Byte;
		       AtKeySel:   Byte;
		       AtKeyUnSel: Byte;
		       SType:      SpecialMenuType ): Integer; }


{ Nome della unit }
Unit
     TIPMenu;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPMenu }

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

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse;


{----------------------------------------------------------------------------
  PROCEDURA: MENU

  Disegna un menu al centro dello schermo ed attende una selezione da
  parte dell' utente: l' utente pu• utilizzare i tasti cursore e RETURN
  oppure si pu• spostare con il mouse e premere due volte il pulsante
  sinistro dello stesso. Premendo il tasto F1 sono sempre disponibili
  ulteriori informazioni.
  TITOLO  il titolo del menu, mentre StA, StB, StC, ecc. definiscono le
  opzioni del menu.
  Il programma separa tutte le opzioni elencate nelle stringhe,
  da considerarsi per• una unica, facendo in modo che termini con
  il carattere '|'; il numero di opzioni disponibili  noto, sapendo il
  numero di questi caratteri.
  Il numero che restituisce la funzione  quello della riga
  selezionata. Restituisce -1 nel caso in cui non venga scelto
  niente o premuto il tasto ESCAPE o il pulsante DESTRO del mouse.
  Il numero minimo di righe  1, in quanto il titolo  considerato una
  cosa a parte.
  ATTITLE, ATSEL, ATUNSEL, ATBORD ed ATTEXT sono rispettivamente gli
  attributi del titolo, dell' opzione selezionata, di quella non
  selezionata, del bordo della finestra e della finestra stessa.
  Il testo nella finestra sar… scritto con attributo ATUNSEL.
  I colori sono definiti come:

	 <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si pu• usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Function  Menu ( Titolo:     String080;
		 StA:        String;
		 StB:        String;
		 StC:        String;
                 StD:        String;
                 StE:        String;
		 StF:        String;
                 StG:        String;
                 StH:        String;
		 AtTitle:    Byte;
		 AtSel:      Byte;
		 AtUnSel:    Byte;
		 AtBord:     Byte;
		 AtText:     Byte;
		 AtKeySel:   Byte;
		 AtKeyUnSel: Byte;
		 SType:      SpecialMenuType ): Integer;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPMenu }


{----------------------------------------------------------------------------
  PROCEDURA: MENU

  Disegna un menu al centro dello schermo ed attende una selezione da
  parte dell' utente: l' utente pu• utilizzare i tasti cursore e RETURN
  oppure si pu• spostare con il mouse e premere due volte il pulsante
  sinistro dello stesso. Premendo il tasto F1 sono sempre disponibili
  ulteriori informazioni.
  TITOLO  il titolo del menu, mentre StA, StB, StC, ecc. definiscono le
  opzioni del menu.
  Il programma separa tutte le opzioni elencate nelle stringhe,
  da considerarsi per• una unica, facendo in modo che termini con
  il carattere '|'; il numero di opzioni disponibili  noto, sapendo il
  numero di questi caratteri.
  Il numero che restituisce la funzione  quello della riga
  selezionata. Restituisce -1 nel caso in cui non venga scelto
  niente o premuto il tasto ESCAPE o il pulsante DESTRO del mouse.
  Il numero minimo di righe  1, in quanto il titolo  considerato una
  cosa a parte.
  ATTITLE, ATSEL, ATUNSEL, ATBORD ed ATTEXT sono rispettivamente gli
  attributi del titolo, dell' opzione selezionata, di quella non
  selezionata, del bordo della finestra e della finestra stessa.
  Il testo nella finestra sar… scritto con attributo ATUNSEL.
  I colori sono definiti come:

	 <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si pu• usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Function  Menu ( Titolo:     String080;
		 StA:        String;
		 StB:        String;
		 StC:        String;
                 StD:        String;
                 StE:        String;
		 StF:        String;
                 StG:        String;
                 StH:        String;
		 AtTitle:    Byte;
		 AtSel:      Byte;
		 AtUnSel:    Byte;
		 AtBord:     Byte;
		 AtText:     Byte;
		 AtKeySel:   Byte;
		 AtKeyUnSel: Byte;
		 SType:      SpecialMenuType ): Integer;

{ Costanti locali }
Const
      MaxNumOption= 23;

{ Tipi di dati locali }
Type

     { Puntatore al vettore delle opzioni }
     PTRVetSt= ^VetSt;

     { Una opzione, una stringa di 50 caratteri al massimo }
     RecSt=    Record
                 Op: String080;
                 St: String080;
                 End; { RecSt }

     { Il vettore delle opzioni }
     VetSt=    Array [1..MaxNumOption] Of
		 RecSt;

     { Puntatore al vettore delle lettere evidenziate }
     PTRKeyWord= ^ArrayKeyWord;

     { Vettore delle lettere evidenziate }
     ArrayKeyWord= Array [1..MaxNumOption] Of
                     Record
		     Ch:     Char;
                     OffSet: Byte;
                     End;

{ Variabili locali }
Var

    { Stringa di appoggio }
    St:            String;

    { Vettore delle opzioni }
    Vet:           PTRVetSt;

    { Numero di opzione corrente }
    NumOption:     Byte;

    { Numero di opzione precedente }
    OldOption:     Byte;

    { Massima lunghezza delle opzioni }
    MaxLength:     Byte;

    { Numero massimo di opzioni }
    MaxOption:     Byte;

    { Prima opzione valida (diversa da niente) }
    RealMinOption: Byte;

    { Ultima opzione valida (diversa da niente) }
    RealMaxOption: Byte;

    { Indice per i cicli }
    I:             Byte;

    { Carattere premuto dall' utente }
    Ch1:           Char;

    { Carattere esteso premuto dall' utente }
    Ch2:           Char;

    { TRUE per uscire }
    Done:          Boolean;

    { Coordinata X dell' angolo in alto a sinistra della finestra }
    InizioX:       Byte;

    { Coordinata Y dell' angolo in alto a sinistra della finestra }
    InizioY:       Byte;

    { Vettore delle lettere evidenziate: premendo una lettera di queste
      l' opzione sar… accettata, senza spostarsi e premere RETURN }
    KeyWord:       PTRKeyWord;

    { Linea di stato }
    OldAggiorno:   Boolean;


     {-----------------------------------------------------------------------
       PROCEDURA: CAMBIO.STRINGA

       Passa alla stringa seguente: se, ad esempio, la stringa corrente
        STB, passa a STC. Questo lo fa senza che parti di esse vengano
       persi.
      -----------------------------------------------------------------------}
     Procedure CambioStringa;

     Begin { CambioStringa }

     { Cambio della stringa: in questo modo  come se StA, StB ed StC
       siano una sola stringa, lunga al massimo 765 (255*3) caratteri }
     If (St = StrNull)
       Then
	 Begin

	 { Passaggio alla stringa StB }
	 If (StA = StrNull)
	   Then

	     Begin
	     St := StB;
	     StA := '! NON VUOTA !';
	     StB := StrNull;
	     End

	 Else

	   { Passaggio alla stringa StC }
	   If (StB = StrNull)
	     Then

	       Begin
	       St := StC;
	       StB := '! NON VUOTA !';
	       StC := StrNull;
	       End

         Else

	   { Passaggio alla stringa StD }
	   If (StC = StrNull)
	     Then

	       Begin
	       St := StD;
	       StC := '! NON VUOTA !';
	       StD := StrNull;
	       End

         Else

	   { Passaggio alla stringa StE }
	   If (StD = StrNull)
	     Then

	       Begin
	       St := StE;
	       StD := '! NON VUOTA !';
	       StE := StrNull;
	       End

         Else

	   { Passaggio alla stringa StE }
	   If (StE = StrNull)
	     Then

	       Begin
	       St := StF;
	       StE := '! NON VUOTA !';
	       StF := StrNull;
	       End

         Else

	   { Passaggio alla stringa StE }
	   If (StF = StrNull)
	     Then

	       Begin
	       St := StG;
	       StE := '! NON VUOTA !';
	       StG := StrNull;
	       End
         Else

	   { Passaggio alla stringa StE }
	   If (StG = StrNull)
	     Then

	       Begin
	       St := StH;
	       StG := '! NON VUOTA !';
	       StH := StrNull;
	       End;
	 End;


     End; { CambioStringa }


Begin { Menu }

{ Setta a FALSE l' aggiornamento della riga di stato }
OldAggiorno := AggiornaStatusLine;
AggiornaStatusLine := False;

{ Alloca il vettore delle opzioni in memoria }
New(Vet); { 3728 Bytes }

{ Alloca il vettore delle lettere evidenziate }
New(KeyWord);

{ Separa tutte le opzioni elencate nelle tre stringhe, da considerarsi
  per• una unica, senza interruzioni di nessun genere.
  La riga finisce ad ogni carattere '|'; il numero di opzioni
  disponibili  noto, sapendo il numero di questi caratteri.
  Il numero che restituisce la funzione  quello della riga
  selezionata. Restiruisce -1 nel caso in cui non venga scelto
  niente e premuto il tasto ESCAPE o il pulsante DESTRO del mouse.
  Il numero minimo di righe  1, in quanto il titolo  considerato una
  cosa a parte }
St := StA;
StA := StrNull;
MaxLength := 1;
MaxOption := 0;

If (Pos('|',St) <> 0)
  Then

    While (St <> StrNull) Do
      Begin

      { Definisce un' opzione del menu e ne incrementa il numero }
      Inc(MaxOption);
      Vet^[MaxOption].Op := Copy(St,1,Pos('|',St)-1);
      Delete(St,1,Pos('|',St));

      { Effettua il cambio di stringa, se necessario }
      CambioStringa;

      { Ora procede con il rilevare la lettera evidenziata }
      Vet^[MaxOption].St := Copy(St,1,Pos('|',St)-1);
      Delete(St,1,Pos('|',St));

      { Prende la lunghezza massima }
      If (MaxLength < Length(Vet^[MaxOption].Op))
	Then
	  MaxLength := Length(Vet^[MaxOption].Op);

      { Effettua il cambio di stringa, se necessario }
      CambioStringa;

      End;

{ Viene aggiunta un' opzione al menu e aggiornate le variabili }
Inc(MaxOption);
Vet^[MaxOption].Op := StrNull;
KeyWord^[MaxOption].Ch := kNull;
KeyWord^[MaxOption].OffSet := 0;

{ Aggiusta le stringhe, se necessario, in modo che siano centrate
  rispetto a quella pi— lunga del menu }
For i := 1 To MaxOption Do
  Begin

  If (Vet^[i].Op <> StrNull)
    Then
      With Vet^[i] Do
        While (Length(Op) <= MaxLength) Do
	  Begin

          { Centra la stringa rispetto alla finestra }
	  If (Length(Op)/2) <> (Length(Op) Div 2)
	    Then
	      Op := ' '+Op
	  Else
	    Op := Op+' ';

	  End;

  { Stabilisce quale sia la lettera evidenziata }
  With KeyWord^[i] Do
    With Vet^[i] Do

      { Esiste ? }
      If (Pos('^',Op) <> 0)
        Then

          { C': memorizzala }
	  Begin
          OffSet := Pos('^',Op);
	  Ch := Op[OffSet+1];
          Delete(Op,Pos('^',Op),1);
          End
      Else

        { Non c': inizializza l' elemento del vettore }
        Begin
	Ch := kNull;
        OffSet := 0;
        End;
  End;

{ Apre un rettangolo con effetto a scoppio }
InizioX := 40-MaxLength Div 2;
InizioY := 12-MaxOption Div 2;
Inc(MaxLength);
ApriQuadro(InizioX,InizioY,InizioX+MaxLength,InizioY+MaxOption,
	   Titolo,AtBord,AtText,AtTitle,Ritardo.MenuStep,Ritardo.Menu);

{ Calcola la prima opzione valida (non sempre  la numero 1) }
RealMinOption := 1;
While ((Vet^[RealMinOption].Op = StrNull) And (RealMinOption < MaxOption)) Do
  Inc(RealMinOption);

{ Calcola quella massima, diversa da niente }
RealMaxOption := MaxOption;
While ((Vet^[RealMaxOption].Op = StrNull) And
      (RealMaxOption > RealMinOption)) Do
	Dec(RealMaxOption);

{ Se i valori sono sbagliati, li aggiusta }
If (RealMinOption > RealMaxOption)
  Then
    RealMinOption := RealMaxOption;

{ Scrive la prima opzione valida evidenziata rispetto alle altre }
With Vet^[RealMinOption] Do
  WriteStr(1,RealMinOption,Op,AtSel);
With KeyWord^[RealMinOption] Do
  If ((Ch <> kNull) And (OffSet <> 0))
    Then
      WriteChar(OffSet,RealMinOption,1,Ch,AtKeySel);

{ Scrive tutte le altre del colore non evidenziato }
For i := (RealMinOption+1) To RealMaxOption Do
  Begin
  With Vet^[i] Do
    WriteStr(1,i,Op,AtUnSel);
  With KeyWord^[i] Do
    If ((Ch <> kNull) And (OffSet <> 0))
      Then
        WriteChar(OffSet,i,1,Ch,AtKeyUnSel);
  End;

{ La prima opzione  quella selezionata }
NumOption := RealMinOption;
OldOption := NumOption;
Done := False;

Window(1,1,80,25);
Info(Vet^[NumOption].St,Color.UserInfo);
Window(InizioX+1,InizioY+1,InizioX+MaxLength-1,InizioY+MaxOption-1);

{ Nasconde il cursore }
CursorOFF;

{ Attende la scelta di una voce del menu visualizzato. Si possono premere
  i tasti:

    FRECCIA SU   per spostarsi verso l' altro
    FRECCIA GIU' per spostarsi verso il basso
    HOME         per andare alla prima opzione
    END          per andare all' ultima opzione
    RETURN       per selezionare l' opzione corrente
    ESCAPE       per uscire senza selezionare alcuna opzione
    F1           per ottenere l' help
    ALT-F1       per ottenere l' help precedente
    CTRL-F1      per ottenere l' help specifico
    SHIFT-F1     per ottenere la lista degli argomenti dell' help

  oppure, con il mouse:

    DOPPIO CLICK DEL PULSANTE
    SINISTRO SU UNA OPZIONE     per selezionarla

    PULSANTE DESTRO             per ottenere l' help (come F1)

    MOVIMENTO MOUSE             per spostarsi all' interno del menu }
Repeat

  { Aggiorna il video solo quando si  verificato un cambiamento,
    evitando inutili stampe }
  If (OldOption <> NumOption)
    Then

      Begin

      { Opzione precedente }
      With Vet^[OldOption] Do
        WriteStr(1,OldOption,Op,AtUnSel);

      { Lettera evidenziata precedente }
      With KeyWord^[OldOption] Do
        If ((Ch <> kNull) And (OffSet <> 0))
          Then
            WriteChar(OffSet,OldOption,1,Ch,AtKeyUnSel);

      { Opzione corrente }
      With Vet^[NumOption] Do
        WriteStr(1,NumOption,Op,AtSel);

      { Lettera evidenziata corrente }
      With KeyWord^[NumOption] Do
        If ((Ch <> kNull) And (OffSet <> 0))
          Then
            WriteChar(OffSet,NumOption,1,Ch,AtKeySel);

      { Informazione in fondo alla pagina }
      Window(1,1,80,25);
      Info(Vet^[NumOption].St,Color.UserInfo);
      Window(InizioX+1,InizioY+1,InizioX+MaxLength-1,InizioY+MaxOption-1);

      End;

  { Attende la pressione di un tasto o di un pulsante del mouse }
  Attendi(Ch1,Ch2,SType);

  { Memorizza l' opzione precedente }
  OldOption := NumOption;

  { Testa la pressione del mouse }
  If MousePressed
    Then

      Begin

      { Pulsante sinistro }
      If LeftButton
        Then
          Begin

          { Controlla tutte le posizioni valide }
          For i := RealMinOption To RealMaxOption Do
            With Vet^[i] Do
              If ((MouseTextX >= Lo(WindMin)+1) And
	          (MouseTextX <= Lo(WindMax)+1) And
                  (MouseTextY = (Hi(WindMin)+i)) And
		  (Op <> StrNull))
                    Then

                      { E' una posizione valida: aggiornala }
                      Begin
		      NumOption := i;
                      If (NumOption = OldOption)
	                Then

                          { E' la seconda volta che viene selezionata }
                          Ch1 := kReturn
                      Else

                        { Occorre solo portare la barra selezionata
                          alla posizione scelta }
                        Begin
                        Ch1 := kNull;
                        Ch2 := kNull;
                        End;

                      End;
          End
      Else

        { Pulsante destro }
        If RightButton
          Then
            Ch1 := kEscape;

      { Rilascia i pulsanti del mouse }
      While MousePressed Do
        GetMPos;

      End;

  { A seconda del tasto premuto esegue il compito specifico }
  Case Ch1 Of

    { Carattere esteso }
    kNull: Case Ch2 Of

             { F1: aiuto generale }
	     kF1: Help('Help Generale',Altro);

             { Shift-F1: indice dell' aiuto }
	     kSF1: Help('Indice',Altro);

             { Alt-F1: schermata di aiuto precedente }
             kAF1: Help(LastHelp^[1],Precedente);

	     { Su: muove l' evidenziatore di un' opzione verso l' alto }
	     kUp: If (NumOption > RealMinOption)
		    Then

		      Begin
		      Dec(NumOption);
		      While (Vet^[NumOption].Op = StrNull) Do
			Dec(NumOption);
		      End;

	     { Gi—: muove l' evidenziatore di un' opzione verso il basso }
	     kDown: If (NumOption < RealMaxOption)
		      Then

			Begin
			Inc(NumOption);
			While (Vet^[NumOption].Op = StrNull) Do
			  Inc(NumOption);
			End;

	     { Home: muove l' evidenziatore alla prima opzione }
	     kHome: NumOption := RealMinOption;

	     { End: muove l' evidenziatore all' ultima opzione }
	     kEnd: NumOption := RealMaxOption;

	     End; { Case Ch2 }

    { Return: accetta l' opzione }
    kReturn: Begin

	     Done := True;
	     Menu := NumOption;

	     End;

    { Escape: rifiuta l' opzione }
    kEscape: Begin

	     Done := True;
	     Menu := -1;

	     End;
    Else

      { Controllo della pressione di una lettera evidenziata }
      For i := 1 To MaxOption Do
        With KeyWord^[i] Do
          If (UpCase(Ch1) = UpCase(Ch))
            Then

              { La lettera  valida }
              Begin
              Done := True;
              NumOption := i;
              Menu := NumOption;
              End;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Ripristina il contenuto dello schermo }
Fisico^ := Image^[NumPgVideo].Page;

{ Libera la memoria occupata dal vettore delle lettere evidenziate }
Dispose(KeyWord);

{ Libera la memoria occupata dal vettore delle opzioni }
Dispose(Vet);  { 3728 Bytes }

{ Setta i range del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

{ Ripristina la linea di stato }
AggiornaStatusLine := OldAggiorno;

End; { Menu }


End. { TIPMenu }
