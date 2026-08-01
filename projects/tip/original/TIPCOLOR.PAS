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
 º       VERSIONE 1.0                          UNIT TIPCOLOR                º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}
{ Data:   28 Novembre 1992
  Ora:    11:28:00
  Autore: Fochi Michele
  File:   Unit UnitTextImageProcessorColor }

{ Contiene le procedure/funzioni per il controllo dei colori e per
  i messaggi di uscita dal programma }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Function  ScegliColori: Integer;

  - Procedure SelezionaColori;

  - Procedure UscitaSiNo;

  - Procedure EndTextImageProcessor; }


{ Nome della unit }
Unit
     TIPColor;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPColor }


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

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse;


{----------------------------------------------------------------------------
  FUNZIONE: SCEGLI.COLORI

  Visualizza una finestra da cui Š possibile scegliere un qualsiasi colore
  per il foreground e/o per il background (da quelli che appaiono sul
  video).
  Con i tasti cursore (SINISTRA, DESTRA, SU, GIU', HOME, END, PAGE-UP,
  PAGE-DOWN) Š possibile muoversi all' interno della finestra. Premendo
  il tasto RETURN o SPAZIO si seleziona il colore puntato se ci si trova
  su un colore, si attiva o disattiva il lampeggio se ci si trova su
  di esso oppure si esce accettando le modifiche se ci si trova sull'
  ultima posizione ('ACCETTA ED ESCI').
  Un simbolo ('<F>' per il foreground e '<B>' per i background) indica quale
  sia il colore selezionato, oltre allo stesso scritto (in parole) in
  fondo alla finestra.
  La funzione restituisce il codice del colore scelto in caso di scelta
  effettuata oppure il valore -1, corrispondente alla pressione del
  tasto ESCAPE.
 ----------------------------------------------------------------------------}
Function  ScegliColori: Integer;


{----------------------------------------------------------------------------
  PROCEDURA: SELEZIONA.COLORI

  Effettua la chiamata alla funzione ScegliColori e memorizza il colore
  scelto (in caso di nessuna scelta, non esegue nulla).
 ----------------------------------------------------------------------------}
Procedure SelezionaColori;


{----------------------------------------------------------------------------
  PROCEDURA: USCITA.SI.NO

  Chiede se si vuole veramente uscire dal programma oppure no.
  La selezione avviene tramite un piccolo menu a due voci.
 ----------------------------------------------------------------------------}
Procedure UscitaSiNo;


{----------------------------------------------------------------------------
  PROCEDURA: END.TEXT.IMAGE.PROCESSOR

  Scrive qualche riga di commento al programma e termina la sua eseguzione.
 ----------------------------------------------------------------------------}
Procedure EndTextImageProcessor;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPColor }


{----------------------------------------------------------------------------
  FUNZIONE: SCEGLI.COLORI

  Visualizza una finestra da cui Š possibile scegliere un qualsiasi colore
  per il foreground e/o per il background (da quelli che appaiono sul
  video).
  Con i tasti cursore (SINISTRA, DESTRA, SU, GIU', HOME, END, PAGE-UP,
  PAGE-DOWN) Š possibile muoversi all' interno della finestra. Premendo
  il tasto RETURN o SPAZIO si seleziona il colore puntato se ci si trova
  su un colore, si attiva o disattiva il lampeggio se ci si trova su
  di esso oppure si esce accettando le modifiche se ci si trova sull'
  ultima posizione ('ACCETTA ED ESCI').
  Un simbolo ('<F>' per il foreground e '<B>' per i background) indica quale
  sia il colore selezionato, oltre allo stesso scritto (in parole) in
  fondo alla finestra.
  La funzione restituisce il codice del colore scelto in caso di scelta
  effettuata oppure il valore -1, corrispondente alla pressione del
  tasto ESCAPE.
 ----------------------------------------------------------------------------}
Function  ScegliColori: Integer;

{ Tipi locali }
Type

     { Tipo per le stringhe selezionate dall' utente }
     TypeStrSel= Array [1..24] Of

		   Record

		     { Colore }
		     St1: String007;

		     { Intensit… (Chiaro o Scuro) }
		     St2: String006;

		     End;

{ Costanti locali }
Const

      { Contiene i nomi dei colori che l' utente pu• selezionare,
	16 per il foreground e 8 per il background }
      StrSel: TypeStrSel= ((St1: 'Nero'    ; St2: ''      ),
			   (St1: 'Blu'     ; St2: ''      ),
			   (St1: 'Verde'   ; St2: ''      ),
			   (St1: 'Azzurro' ; St2: ''      ),
			   (St1: 'Rosso'   ; St2: ''      ),
			   (St1: 'Magenta' ; St2: ''      ),
			   (St1: 'Marrone' ; St2: ''      ),
			   (St1: 'Grigio'  ; St2: 'Chiaro'),
			   (St1: 'Grigio'  ; St2: 'Scuro' ),
			   (St1: 'Blu'     ; St2: 'Chiaro'),
			   (St1: 'Verde'   ; St2: 'Chiaro'),
			   (St1: 'Azzurro' ; St2: 'Chiaro'),
			   (St1: 'Rosso'   ; St2: 'Chiaro'),
			   (St1: 'Magenta' ; St2: 'Chiaro'),
			   (St1: 'Giallo'  ; St2: ''      ),
			   (St1: 'Bianco'  ; St2: ''      ),
			   (St1: 'Nero'    ; St2: ''      ),
			   (St1: 'Blu'     ; St2: ''      ),
			   (St1: 'Verde'   ; St2: ''      ),
			   (St1: 'Azzurro' ; St2: ''      ),
			   (St1: 'Rosso'   ; St2: ''      ),
			   (St1: 'Magenta' ; St2: ''      ),
			   (St1: 'Marrone' ; St2: ''      ),
			   (St1: 'Grigio'  ; St2: 'Chiaro'));

{ Variabili locali }
Var

    { Tasto premuto dall' utente }
    Ch1:          Char;

    { Tasto esteso premuto dall' utente }
    Ch2:          Char;

    { Indica se Š stata fatta una scelta o no }
    Done:         Boolean;

    { Numero del colore evidenziato (1..24) }
    NumColore:    Byte;

    { Numero del colore evidenziato precedentemente (1..24) }
    OldNumColore: Byte;

    { Colore scelto di foreground }
    ForeColor:    Byte;

    { Colore scelto di background }
    BackColor:    Byte;

    { Colore di foreground scelto precedentemente }
    OldForeColor: Byte;

    { Colore di background scelto precedentemente }
    OldBackColor: Byte;

    { Stato del lampeggio (TRUE=On, FALSE=Off) }
    Lampeggio:    Boolean;

    { Indice per i cicli }
    I:            Byte;

    { Indice per i cicli }
    J:            Byte;


     {-----------------------------------------------------------------------
       PROCEDURA: AGGIORNA.COLORE

       Aggiorna la scelta dell' utente, scrivendo con attributo ATTRCOL il
       colore corrispondente alla posizione NUMCOL e il relativo rettangolo
       colorato.
      -----------------------------------------------------------------------}
     Procedure AggiornaColore ( NumCol:  Byte;
				AttrCol: Byte );

     { Variabili locali }
     Var

	 { Coordinata X del cursore }
	 X:  Byte;

	 { Coordinata Y del cursore }
	 Y:  Byte;

	 { Prima stringa del record }
	 St1: String015;

	 { Seconda stringa del record }
	 St2: String006;

     Begin { AggiornaColore }

     { A seconda del valore della posizione ... }
     Case NumCol Of

       { Prima riga: i primo 8 colori (da 0 a 7) del foreground }
       1..8: Begin

	     { Coordinate X e Y sullo schermo }
	     X := (NumCol-1)*8+5;
	     Y := 6;

	     { Parole evidenziate }
	     St1 := StrSel[NumCol].St1;
	     St2 := StrSel[NumCol].St2;

	     End;

       { Seconda riga: gli altri 8 colori (da 8 a 15) del foreground }
       9..16: Begin

	      { Coordinate X e Y sullo schermo }
	      X := (NumCol-9)*8+5;
	      Y := 11;

	      { Parole evidenziate }
	      St1 := StrSel[NumCol].St1;
	      St2 := StrSel[NumCol].St2;

	      End;

       { Terza riga: gli 8 colori (da 0 a 7) del background }
       17..24: Begin

	       { Coordinate X e Y sullo schermo }
	       X := (NumCol-17)*8+5;
	       Y := 18;

	       { Parole evidenziate }
	       St1 := StrSel[NumCol].St1;
	       St2 := StrSel[NumCol].St2;

	       End;

       { Riga del lampeggio: attiva o disattiva il lampeggio }
       25: Begin

	   { Coordinate X e Y sullo schermo }
	   X := 63;
	   Y := 20;

	   { Parole evidenziate }
	   If Lampeggio
	     Then

	       { Lampeggio On }
	       St1 := 'ÄSIÄ'

	   Else

	     { Lampeggio Off }
	     St1 := 'ÄNOÄ';

	   St2 := '';

	   End;

       { Ultima riga: accetta i colori scelti ed esce dalla funzione }
       26: Begin

	   { Coordinate X e Y sullo schermo }
	   X := 52;
	   Y := 21;

	   { Parole evidenziate }
	   St1 := 'ACCETTA ED ESCI';
	   St2 := '';

	   End;

       End; { Case NumCol }

     { Scrive le parole evidenziate con attributo ATTRCOL }
     WriteStr(x,y,St1,AttrCol);
     WriteStr(x,y+1,St2,AttrCol);

     End; { AggiornaColore }


     {-----------------------------------------------------------------------
       PROCEDURA: AGGIORNA.NOMI

       Aggiorna i nomi dei colori a fondo pagina e lo stato del lampeggio
       (Si o No). Inoltre disegna un simbolo ('<F>' per il foreground e
       '<B>' per il background) per indicare il colore attivo.
      -----------------------------------------------------------------------}
     Procedure AggiornaNomi;

     { Variabili locali }
     Var

	 { Stringa di appoggio }
	 St: String;

         Num: Byte;

     Begin { AggiornaNomi }

     { Memorizza in ST il colore in parole }
     With StrSel[ForeColor+1] Do
       St := St1+' '+St2;

     { La porta, aggiungendo degli spazi, alla lunghezza di 21 caratteri }
     While (Length(St) < 21) Do
       St := St+' ';

     { Ed infine la scrive in fondo alla finestra }
     WriteStr(17,20,St,Color.MenuSelUnSel);

     { Memorizza in ST il colore in parole }
     With StrSel[BackColor+17] Do
       If (St2 = StrNull)
	 Then
	   St := St1

       Else
	 St := St1+' '+St2;

     { Aggiunge il lampeggio, se Š attivo }
     If Lampeggio
       Then

	 { ampeggio On }
	 St := St+' (Lamp)';

     { La porta, aggiungendo degli spazi, alla lunghezza di 21 caratteri }
     While (Length(St) < 21) Do
       St := St+' ';

     { Ed infine la scrive in fondo alla finestra }
     WriteStr(17,21,St,Color.MenuSelUnSel);

     { Se il colore di foreground Š stato cambiato lo aggiorna }
     If (OldForeColor <> ForeColor)
       Then

	 Begin

	 { Cancella il puntatore '<F>' dal colore precedente }
	 Case OldForeColor Of

	   { Prima riga: i primo 8 colori (da 0 a 7) del foreground }
	   0..7: WriteStr(OldForeColor*8+7,4,'ÛÛÛ',OldForeColor);

	   { Seconda riga: gli altri 8 colori (da 8 a 15) del foreground }
	   8..15: WriteStr((OldForeColor-8)*8+7,9,'ÛÛÛ',OldForeColor);

	   End; { Case OldForeColor }

	 { Scrive il simbolo '<F>', con attributo delle parole evidenziate }
	 Case ForeColor Of

	   { Prima riga: i primo 8 colori (da 0 a 7) del foreground }
	   0..7: WriteStr(ForeColor*8+7,4,'<F>',Color.MenuSel);

	   { Seconda riga: gli altri 8 colori (da 8 a 15) del foreground }
	   8..15: WriteStr((ForeColor-8)*8+7,9,'<F>',Color.MenuSel);

	   End; { Case ForeColor }

	 End;

     { La stessa cosa per il colore di background: se Š stato cambiato lo
       aggiorna }
     If (OldBackColor <> BackColor)
       Then

	 Begin

	 { Se il lampeggio Š attivo viene ripristinato }
	 If Lampeggio
	   Then

	     { Con lampeggio }
	     WriteStr(OldBackColor*8+7,16,'ÛÛÛ',OldBackColor+Green*16+Blink)

	 Else

	   { Altrimenti viene ripristinato senza lampeggio }
	   WriteStr(OldBackColor*8+7,16,'ÛÛÛ',OldBackColor+Green*16);

	 { Scrive il simbolo '<B>', con attributo delle parole evidenziate }
	 WriteStr(BackColor*8+7,16,'<B>',Color.MenuSel);

	 End;

     If Lampeggio
       Then
         Num := ForeColor+BackColor*16+Blink
     Else
       Num := ForeColor+BackColor*16;

     WriteStr(39,20,'PROVA TESTO',Num);
     WriteStr(39,21,'PROVA TESTO',Num);

     End; { AggiornaNomi }


     {-----------------------------------------------------------------------
       PROCEDURA: SET.LAMPEGGIO

       Aggiorna i colori di background facendoli lampeggiare o no, a seconda
       che la variabile LAMPEGGIO, passata come parametro, sia TRUE o FALSE.
       Aggiorna anche lo stato visualizzato in fondo alla pagina, da ON a
       OFF e viceversa.
       La stringa Š scritta utilizzando il colore LAMPATTR.
       La procedura aggiorna inoltre i nomi dei colori in fondo alla
       finestra dei colori.
      -----------------------------------------------------------------------}
     Procedure SetLampeggio ( Lampeggio: Boolean;
			      LampAttr:  Byte );

     { Variabili locali }
     Var
	 { Indice per i cicli }
	 I:            Byte;

	 { Indice per i cicli }
	 J:            Byte;

     Begin { SetLampeggio }

     { Stampa tutti i tipi di colori lampeggianti che l' utente pu•
       selezionare; ciclo esterno }
     For i := 0 To 7 Do

       Begin

       { Ciclo interno }
       For j := 1 To 3 Do

	 Begin

	 { Scrive una parte del colore di background }
	 If Lampeggio
	   Then

	     { Con il lampeggio On }
	     WriteStr(i*8+5,j+14,'ÛÛÛÛÛÛÛ',i+Green*16+Blink)

	 Else

	   { Con il lampeggio Off }
	   WriteStr(i*8+5,j+14,'ÛÛÛÛÛÛÛ',i+Green*16);

	 End;

       { Ora ripristina le parole del colore scelto precedentemente }
       With StrSel[i+17] Do

	 Begin

	 { Colore }
	 WriteStr(i*8+5,j+15,St1,Color.MenuUnSel);

	 { Intensit… (Chiaro o Scuro) }
	 WriteStr(i*8+5,j+16,St2,Color.MenuUnSel);

	 End;

       End;

     { Aggiorna lo stato del lampeggio sul video }
     If Lampeggio
       Then

	 { Lampeggio On }
	 WriteStr(63,20,'ÄSIÄ',LampAttr)

     Else

       { Lampeggio Off }
       WriteStr(63,20,'ÄNOÄ',LampAttr);

     { Aggiorna i nomi dei colori in fondo alla finestra }
     AggiornaNomi;

     End; { SetLampeggio }


Begin { ScegliColori }

{ Apre con effetto a scoppio la finestra dei caratteri ASCII }
ApriQuadro(4,1,78,24,'[Colori]',Color.MenuBord,
	   Color.MenuText,Color.MenuTitle,
	   Ritardo.WinStep,Ritardo.Windows);

{ Scrive le righe che non variano nella finestra, quelle di indicazione }
WriteStr(4,2,'ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍCOLORI DI FOREGROUNDÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ'+
	     'ÍÍÍ¸',
	 Color.MenuText);
WriteStr(4,14,'ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍCOLORI DI BACKGROUNDÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ'+
	      'ÍÍÍÍ¸',
	 Color.MenuText);
WriteStr(5,20,'FOREGROUND: ',Color.MenuText);
WriteStr(5,21,'BACKGROUND: ',Color.MenuText);
WriteStr(52,20,'LAMPEGGIO: ',Color.MenuText);
WriteStr(52,21,'ACCETTA ED ESCI',Color.MenuUnSel);

{ Impostazioni iniziali dei colori, delle posizioni del cursore, ecc. }
Done := False;
ForeColor := Image^[NumPgVideo].Attr Mod 16;
BackColor := (Image^[NumPgVideo].Attr Div 16) Mod 8;
NumColore := ForeColor+1;
OldNumColore := 0;
OldForeColor := 15-ForeColor;
OldBackColor := 7-BackColor;

{ Aggiorna il puntatore all' interno dei rettangoli colorati }
AggiornaColore(NumColore,Color.MenuSel);

{ Stampa tutti i tipi di colori che l' utente pu• selezionare; ciclo
  esterno }
For i := 0 To 7 Do

  Begin

  { Ciclo interno }
  For j := 1 To 3 Do

    Begin

    { Scrive una parte del colore di foreground (prima zona) }
    WriteStr(i*8+5,j+2,'ÛÛÛÛÛÛÛ',i);

    { Scrive una parte del colore di foreground (seconda zona) }
    WriteStr(i*8+5,j+7,'ÛÛÛÛÛÛÛ',i+8);

    End;

  { Ora scrive il nome del colore sotto al rettangolo della prima riga }
  With StrSel[i+1] Do

    Begin

    { Colore }
    WriteStr(i*8+5,j+3,St1,Color.MenuUnSel);

    { Intensit… (Chiaro o Scuro) }
    WriteStr(i*8+5,j+4,St2,Color.MenuUnSel);

    End;

  { Ora scrive il nome del colore sotto al rettangolo della seconda riga }
  With StrSel[i+9] Do

    Begin

    { Colore }
    WriteStr(i*8+5,j+8,St1,Color.MenuUnSel);

    { Intensit… (Chiaro o Scuro) }
    WriteStr(i*8+5,j+9,St2,Color.MenuUnSel);

    End;

  End;

{ Imposta lo stato del lampeggio (On/Off) }
If (Image^[NumPgVideo].Attr > 127)
  Then

    { Lampeggio On }
    Lampeggio := True

Else

  { Lampeggio Off }
  Lampeggio := False;

{ Aggiorna i rettangoli colorati e i nomi dei colori }
SetLampeggio(Lampeggio,Color.MenuUnSel);

{ Questo ciclo si ripete fino a che l' utente non preme RETURN nella
  zona di accettazione dei colori ('ACCETTA ED ESCI') o non prema il
  tasto ESCAPE per uscire senza effettuare alcuna scelta }
Repeat

  { Se la scelta Š cambiata, aggiorna l' evidenziatore sul video }
  If (OldNumColore <> NumColore)
    Then

      Begin

      { Toglie l' evidenziazione alla scelta precedente ... }
      AggiornaColore(OldNumColore,Color.MenuUnSel);

      { ... e la mette a quella corrente }
      AggiornaColore(NumColore,Color.MenuSel);

      End;

  { Attende la pressione di un tasto o la pressione di un pulsante del
    mouse }
  Attendi(Ch1,Ch2,SMenuColori);

  { Memorizza la riga e la colonna, per testate in seguito se c'Š stato
    un cambiamento o no. Stessa cosa per il colore di foreground e
    background precedenti }
  OldNumColore := NumColore;
  OldForeColor := ForeColor;
  OldBackColor := BackColor;

  { Controllo del mouse }
  If MousePressed
    Then
      Begin

      { Pulsante sinistro }
      If LeftButton
        Then
          Begin

          { Lampeggio }
          If (MouseInT(Lo(WindMin)+63,Hi(WindMin)+20,
                       Lo(WindMin)+66,Hi(WindMin)+20))
                         Then
                           Begin
		     	   NumColore := 25;
                           Ch1 := kReturn;
                           End
          Else

            { Uscita }
            If (MouseInT(Lo(WindMin)+52,Hi(WindMin)+21,
                         Lo(WindMin)+66,Hi(WindMin)+21))
                           Then
                             Begin
                             NumColore := 26;
                             Ch1 := kReturn;
                             End
          Else

            For i := 0 To 7 Do
              Begin

              { Prima riga dei colori }
	      If (MouseInT(Lo(WindMin)+5+i*8,Hi(WindMin)+3,
                           Lo(WindMin)+11+i*8,Hi(WindMin)+7))
                             Then
                               Begin
			       NumColore := i+1;
                               Ch1 := kReturn;
                               End
              Else

                { Seconda riga dei colori }
                If (MouseInT(Lo(WindMin)+5+i*8,Hi(WindMin)+8,
                             Lo(WindMin)+11+i*8,Hi(WindMin)+12))
                               Then
                                 Begin
                                 NumColore := i+9;
                                 Ch1 := kReturn;
                                 End
              Else

                { Terza riga dei colori }
                If (MouseInT(Lo(WindMin)+5+i*8,Hi(WindMin)+14,
                             Lo(WindMin)+11+i*8,Hi(WindMin)+18))
                               Then
                                 Begin
                                 NumColore := i+17;
                                 Ch1 := kReturn;
                                 End

              End;

        End
    Else

      { Pulsanti destri }
      If RightButton
        Then
          Ch1 := kEscape;

    { Rilascio dei pulsanti del mouse }
    While MousePressed Do
      GetMPos;

    End;

  { A seconda del tasto premuto dall' utente ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: Begin
	   Case Ch2 Of

	     { Su: sposta l' evidenziatore nella riga superiore }
	     kUp: Case NumColore Of
		    9..24: Dec(NumColore,8);
		    25: NumColore := 23;
		    26: NumColore := 25;
		    End; { Case NumColore }

	     { Gi—: sposta l' evidenziatore nella riga sottostante }
	     kDown: Case NumColore Of
		      1..16: Inc(NumColore,8);
		      17..24: NumColore := 25;
		      25: NumColore := 26;
		      End; { Case NumColore }

	     { Sinistra: sposta l' evidenziatore nella colonna a sinistra }
	     kLeft: Case NumColore Of
		      2..8,
		      10..16,
		      18..24: Dec(NumColore);
		      End; { Case NumColore }

	     { Destra: sposta l' evidenziatore nella colonna a destra }
	     kRight: Case NumColore Of
		       1..7,
		       9..15,
		       17..23: Inc(NumColore);
		       End; { Case NumColore }

	     { End: sposta l' evidenziatore nell' ultima riga }
	     kEnd: Case NumColore Of
		      1..7: NumColore := 8;
		      9..15: NumColore := 16;
		      17..23: NumColore := 24;
		      End; { Case NumColore }

	     { Home: sposta l' evidenziatore nella prima colonna }
	     kHome: Case NumColore Of
		      2..8: NumColore := 1;
		      10..16: NumColore := 9;
		      18..24: NumColore := 17;
		      End; { Case NumColore }

	     { Pagina Su: sposta l' evidenziatone nella prima riga }
	     kPgUp: Case NumColore Of
		      9,17: NumColore := 1;
		      10,18: NumColore := 2;
		      11,19: NumColore := 3;
		      12,20: NumColore := 4;
		      13,21: NumColore := 5;
		      14,22: NumColore := 6;
		      15,23,
		      25,26: NumColore := 7;
		      16,24: NumColore := 8;
		      End; { NumColore }

	     { Pagina Gi—: sposta l' evidenziatore nell' ultima riga }
	     kPgDown: Case NumColore Of
			1,9: NumColore := 17;
			2,10: NumColore := 18;
			3,11: NumColore := 19;
			4,12: NumColore := 20;
			5,13: NumColore := 21;
			6,14: NumColore := 22;
			7,15,
			23,25: NumColore := 26;
			8,16: NumColore := 24;
			End; { NumColore }

             { F1: aiuto generale }
	     kF1: Help('Help Generale',Altro);

             { Shift-F1: indice dell' aiuto }
	     kSF1: Help('Indice',Altro);

             { Alt-F1: schermata di aiuto precedente }
             kAF1: Help(LastHelp^[1],Precedente);

             { Ctrl-F1: help specifico }
             kCF1: Help('Scegli colori',Altro);

	     End; { Case Ch2 }

	   End;

    { Return: sceglie il colore evidenziato;
	      imposta il lampeggio (On/Off);
	      accetta i colori impostati ed esce }
    kReturn,
    kSpazio: Case NumColore Of

	       { Prima riga: i primo 8 colori (da 0 a 7) del foreground }
	       1..16: Begin

		      { Imposta il colore di foreground attivo }
		      ForeColor := NumColore-1;

		      { Aggiorna i nomi dei colori }
		      AggiornaNomi;

		      End;

	       { Seconda riga: gli altri 8 colori (da 8 a 15) del
		 foreground }
	       17..24: Begin

		       { Imposta il colore di foreground attivo }
		       BackColor := NumColore-17;

		       { Aggiorna i nomi dei colori }
		       AggiornaNomi;

		       End;

	       { Terza riga: gli 8 colori (da 0 a 7) del background }
	       25: Begin

		   { Modifica lo stato del lampeggio (On ---> Off oppure
		     Off ---> On) }
		   Lampeggio := Not Lampeggio;

		   { Aggiorna i nomi dei colori e il lampeggio dei
		     rettangoli sul video }
		   OldBackColor := 7-OldBackColor;
		   SetLampeggio(Lampeggio,Color.MenuSel);

		   End;

	       { Accetta i colori impostati ed esce dalla funzione }
	       26: Begin

		   { Esce dal ciclo principale }
		   Done := True;

		   { Restituisce il colore scelto }
		   If Lampeggio
		     Then

		       { Colore lampeggiante }
		       ScegliColori := ForeColor+BackColor*16+Blink

		   Else

		     { Colore non lampeggiante }
		     ScegliColori := ForeColor+BackColor*16;

		   End;

	       End; { Case NumColore }

    { Escape: non effettua nessuna scelta ed esce }
    kEscape: Begin

	     { Esce dal ciclo princiapale }
	     Done := True;

	     { Restituisce il valore -1 per indicare che non Š stato
	       scelto nessun colore }
	     ScegliColori := -1;

	     End;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

End; { ScegliColori }


{----------------------------------------------------------------------------
  PROCEDURA: SELEZIONA.COLORI

  Effettua la chiamata alla funzione ScegliColori e memorizza il colore
  scelto (in caso di nessuna scelta, non esegue nulla).
 ----------------------------------------------------------------------------}
Procedure SelezionaColori;

{ Variabili locali }
Var

    { Carattere scelto dall' utente }
    Attributo: Integer;

Begin { SelezionaColori }

{ Memorizza il colore scelto in ATTRIBUTO }
Attributo := ScegliColori;

{ Se Š stato scelto un particolare attributo, viene memorizzato }
If (Attributo <> -1)
  Then

    { Memorizzazione del colore scelto }
    Image^[NumPgVideo].Attr := Attributo;

End; { SelezionaColori }


{----------------------------------------------------------------------------
  PROCEDURA: USCITA.SI.NO

  Chiede se si vuole veramente uscire dal programma oppure no.
  La selezione avviene tramite un piccolo menu a due voci.
 ----------------------------------------------------------------------------}
Procedure UscitaSiNo;

{ Variabili locali }
Var

    { Appoggio stringa }
    St:         String;

    { Appoggio stringa }
    St2:        String;

    { Indice per i cicli }
    I:          Byte;

    { Posizione della virgola }
    PosVirgola: Byte;

Begin { UscitaSiNo }

St := StrNull;
PosVirgola := 0;

{ Cerca tutte le pagine modificate }
For i := 1 To (MaxPgVideo-1) Do
  With Image^[i] Do

    { Se Š modificato lo specifica nella finestra di dialogo }
    If Modify
      Then
        Begin
        Str(i,St2);
        If (St = StrNull)
          Then
            St := St2
        Else
          Begin
          PosVirgola := Length(St);
          St := St+','+St2;
          End;
        End;

{ Aggiorna la riga di avvertimento delle pagine modificate }
If (St <> StrNull)
  Then
    Begin

    { Pi— di 2 pagine modificate: congiunzioni "," ed "e" }
    If (Length(St) > 2)
      Then
        Begin
        Delete(St,PosVirgola+1,1);
        Insert(' e ',St,PosVirgola+1);
        St := '( Ricordo che le immagini|'+St+'|sono state modificate )||';
        End
    Else

      { Una sola pagina modificata: congiunzione "e" }
      St := '( Ricordo che l'' immagine '+St+'|Š stata modificata )||';

    End;

{ Finestra di dialogo per l' utente }
With Color Do
  If (Dialog('[USCITA]',
	     '|'+
	     '               Sei sicuro di voler                |'+
	     'uscire dal programma ?|'+
	     '|',St,'',
	     __SI_NO__,MenuBord,MenuTitle,
	     MenuText,MenuSel,
	     MenuUnSel,MenuKeySel,
	     MenuKeyUnSel) = 1)

	       Then

	         { Pone a TRUE la variabile che consente di uscire
		   dal ciclo pi— esterno del programma }
	         Uscita := True;

End; { UscitaSiNo }


{----------------------------------------------------------------------------
  PROCEDURA: END.TEXT.IMAGE.PROCESSOR

  Scrive qualche riga di commento al programma e termina la sua eseguzione.
 ----------------------------------------------------------------------------}
Procedure EndTextImageProcessor;

{ Variabili locali }
Var

    { Appoggio per le conversioni }
    St: String;

Begin { EndTextImageProcessor }

Dispose(LastHelp);

{ Libera la memoria occupata dal blocco }
Dispose(Block);  { 3848 Bytes }

{ Libera la memoria occupata dalle immagini }
Dispose(Image);  { 43200 Bytes }

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);
TextAttr := Color.Default;
ClrScr;

{ Messaggi per l' utente }
WriteStr(10,2,'Grazie per avere utilizzato T.I.P.',Color.Default);
WriteStr(10,4,'Programma scritto da Fochi Michele',Color.Default);
WriteStr(10,6,'Tesi scolastica dell'' anno 1992-93',Color.Default);
Str((MemAvail+MemOccupata):7,St);
WriteStr(10,8,'Memoria libera: '+St+' Bytes',Color.Default);

{ Nasconde il puntatore del mouse }
HideMouse;

{ Visualizza il cursore come una linea ('_') }
GoToXY(1,10);
LineCursor;
HideMouse;

End; { EndTextImageProcessor }


End. { TIPColor }
