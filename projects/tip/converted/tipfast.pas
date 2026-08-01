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
 ║       VERSIONE 1.0                          UNIT TIPFAST                 ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   18 Febbario 1993
  Ora:    15:46:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorFastCRT }

{ Unit che gestisce la memoria video (scrivendovi direttamente una
  stringa o salvando una certa area di memoria in un' altra pagina)
  il cursore del video (nascondendolo o visualizzandolo solo in
  parte) e cose simili. }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Procedure CursorOFF; Assembler;

    - Procedure BlockCursor; Assembler;

    - Procedure LineCursor; Assembler;

    - Function  ControlPressed: Boolean;

    - Function  AltPressed: Boolean;

    - Function  ShiftPressed: Boolean;

    - Procedure ApriQuadro ( X1:       Byte;
		             Y1:       Byte;
		             X2:       Byte;
		             Y2:       Byte;
		             Title:    String080;
		             AtBord:   Byte;
		             AtFore:   Byte;
		             AtTitle:  Byte;
		             NumPassi: Byte;
		             Ritardo:  Word );

    - Function  Dialog ( Titolo:     String080;
		         StA:        String;
		         StB:        String;
		         StC:        String;
		         Tasti:      OptionType;
		         AtBord:     Byte;
		         AtTitle:    Byte;
		         AtText:     Byte;
		         AtSel:      Byte;
		         AtUnSel:    Byte;
		         AtKeySel:   Byte;
		         AtKeyUnSel: Byte ): Integer;

    - Procedure Info ( Stringa: String080;
                       Colore:  Byte );

    - Procedure Scrivi ( PosX:     Byte;
                         PosY:     Byte;
                         St:       String080;
                         Attr:     Byte;
                         Evid1:    Byte;
                         Evid2:    Byte;
		         AttrEvid: Byte );

    - Procedure ControlloSpecialKeys ( SKey: SpecialMenuType );

    - Procedure Attendi ( Var Ch1:  Char;
                          Var Ch2:  Char;
		              SKey: SpecialMenuType );

    - Procedure AttendiMouse ( Var Ch1:         Char;
			       Var Ch2:         Char;
			           SKey:        SpecialMenuType;
			       Var KeybPressed: Boolean ); }


{ Nome della unit }
Unit
     TIPFast;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPFast }

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

     { Gestione del mouse in Turbo Pascal }
     Mouse;


{----------------------------------------------------------------------------
  PROCEDURA: CURSOR.OFF

  Nasconde il cursore facendolo scomparire dal video.
 ----------------------------------------------------------------------------}
Procedure CursorOFF; {Assembler;}


{----------------------------------------------------------------------------
  PROCEDURA: BLOCK.CURSOR

  Visualizza il cursore come un blocco pieno, del tipo '█'.
 ----------------------------------------------------------------------------}
Procedure BlockCursor; {Assembler;}


{----------------------------------------------------------------------------
  PROCEDURA: LINE.CURSOR

  Visualizza il cursore come una linea, del tipo '_'.
 ----------------------------------------------------------------------------}
Procedure LineCursor; {Assembler;}


{----------------------------------------------------------------------------
  FUNZIONE: CONTROL.PRESSED

  Restituisce TRUE se il tasto CTRL è premuto; FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  ControlPressed: Boolean;


{----------------------------------------------------------------------------
  FUNZIONE: ALT.PRESSED

  Restituisce TRUE se il tasto ALT è premuto; FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  AltPressed: Boolean;


{----------------------------------------------------------------------------
  FUNZIONE: SHIFT.PRESSED

  Restituisce TRUE se il tasto SHIFT (di destra o di sinistra) è premuto;
  FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  ShiftPressed: Boolean;


{----------------------------------------------------------------------------
  PROCEDURA: APRI.QUADRO

  Apre con effetto a scoppio (o zoom) un rettangolo di coordinate massime
  pari a (X1,Y1) e (X2,Y2) che ha come titolo TITLE.
  ATBORD, ATFORE ed ATTITLE sono rispettivamente il colore del bordo, il
  colore del testo nella finestra e il colore del titolo.
  NUMPASSI è la velocità di apertura del quadro: più il valore è piccolo
  e più sarà veloce; RITARDO aspetta un certo numero di millisecondi prima
  di disegnare ogni quadro.
  I colori sono definiti come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure ApriQuadro ( X1:       Byte;
		       Y1:       Byte;
		       X2:       Byte;
		       Y2:       Byte;
		       Title:    String080;
		       AtBord:   Byte;
		       AtFore:   Byte;
		       AtTitle:  Byte;
		       NumPassi: Byte;
		       Ritardo:  Word );


{----------------------------------------------------------------------------
  FUNZIONE: DIALOG

  Visualizza una finestra di dialogo, al centro dello schermo, che contiene
  il messaggio passato come parametro in STA, STB ed STC, come nella
  funzione MENU.
  Una volta scritte queste righe, divise sempre dal carattere '|', vengono
  disegnate le scelte che l' utente può effettuare.
  La variabile TITOLO è il titolo della finestra che verrà aperta.
  La funzione restituisce il numero del tasto premuto (da 1 in poi) o
  il valore -1 se è stato premuto il tasto ESCAPE e quindi non è stata
  scelta nessuna opzione.
  ATBORD, ATTITLE, ATTEXT, ATSEL, ATUNSEL sono rispettivamente l' attributo
  del bordo della finestra, quello del titolo e del testo in essa,
  il colore del tasto selezionato e di quello non selezionato.
  Le variabili dei tasti sono:

     __OK__      per il solo tasto OK
     __SI_NO__   per i tasti SI e NO

  E' implementato l' utilizzo del mouse.
  La variabile HELPARG è l' argomento dell' help che viene richiamato con
  i tasti CTRL-F1.
 ----------------------------------------------------------------------------}
Function  Dialog ( Titolo:     String080;
		   StA:        String;
		   StB:        String;
		   StC:        String;
		   Tasti:      OptionType;
		   AtBord:     Byte;
		   AtTitle:    Byte;
		   AtText:     Byte;
		   AtSel:      Byte;
		   AtUnSel:    Byte;
		   AtKeySel:   Byte;
		   AtKeyUnSel: Byte ): Integer;


{----------------------------------------------------------------------------
  PROCEDURA: INFO

  Scrive la stringa STRINGA passata come parametro in fondo allo schermo
  nell' ultima riga, utilizzando il colore COLORE.
 ----------------------------------------------------------------------------}
Procedure Info ( Stringa: String080;
                 Colore:  Byte );


{----------------------------------------------------------------------------
  PROCEDURA: SCRIVI

  Scrive la stringa ST alle coordinate dello schermo POSX,POSY utilizzando
  il colore ATTR ed evidenziando (cioè scrivendole con il colore ATTREVID)
  le lettere di offset EVID1 ed EVID2 rispetto alla stringa stessa.
 ----------------------------------------------------------------------------}
Procedure Scrivi ( PosX:     Byte;
                   PosY:     Byte;
                   St:       String080;
                   Attr:     Byte;
                   Evid1:    Byte;
                   Evid2:    Byte;
		   AttrEvid: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: CONTROLLO.SPECIAL.KEYS

  Controlla lo stato dei tasti speciali (SHIFT, ALT e CTRL) e fa apparire
  la finestra opportuna, in relazione allo stato in cui ci si trova.
  Lo stato è definito dall' enumerativo SKEY, che assume valori diversi
  (ad esempio) se si è nell' help o nel programma principale.
 ----------------------------------------------------------------------------}
Procedure ControlloSpecialKeys ( SKey: SpecialMenuType );


{----------------------------------------------------------------------------
  PROCEDURA: ATTENDI

  Attende la pressione di un tasto e restituisce il codice ASCII di questo
  in CH1. Se il tasto è esteso, CH1 vale 0, mentre CH2 contiene il codice
  del carattere esteso (per la lista di molti dei caratteri estesi vedere
  la unit KEYBOARD.PAS.
  Se viene premuto un tasto del mouse, le variabili CH1 e CH2 non
  vengono modificate.
 ----------------------------------------------------------------------------}
Procedure Attendi ( Var Ch1:  Char;
                    Var Ch2:  Char;
		        SKey: SpecialMenuType );


{----------------------------------------------------------------------------
  PROCEDURA: ATTENDI.MOUSE

  Attende la pressione di un tasto e restituisce il codice ASCII di questo
  in CH1. Se il tasto è esteso, CH1 vale 0, mentre CH2 contiene il codice
  del carattere esteso (per la lista di molti dei caratteri estesi vedere
  la unit KEYBOARD.PAS).
  Oltre a questo controlla lo stato del mouse e ne segnala la pressione o
  il movimento.
  Se invece è stata premuta la tastiera si esce ugualmente e il valore
  logico della variabile KEYBPRESSED è TRUE.
  SKEY specifica quale menu far apparire alla pressione dei tasti speciali
  (SHIFT, ALT e CTRL).
 ----------------------------------------------------------------------------}
Procedure AttendiMouse ( Var Ch1:         Char;
			 Var Ch2:         Char;
			     SKey:        SpecialMenuType;
			 Var KeybPressed: Boolean );


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPFast }


{----------------------------------------------------------------------------
  PROCEDURA: CURSOR.OFF

  Nasconde il cursore facendolo scomparire dal video.
 ----------------------------------------------------------------------------}
Procedure CursorOFF; Assembler;
Asm { CursorOFF }
MOV AH,01H
MOV CH,27H
MOV CL,06H
INT 10H
End; { CursorOFF }


{----------------------------------------------------------------------------
  PROCEDURA: BLOCK.CURSOR

  Visualizza il cursore come un blocco pieno, del tipo '█'.
 ----------------------------------------------------------------------------}
Procedure BlockCursor; Assembler;
Asm { BlockCursor }
MOV AH,01H
MOV CH,00H
MOV CL,06H
INT 10H
End; { BlockCursore }


{----------------------------------------------------------------------------
  PROCEDURA: LINE.CURSOR

  Visualizza il cursore come una linea, del tipo '_'.
 ----------------------------------------------------------------------------}
Procedure LineCursor; Assembler;
Asm { LineCursor }
MOV AH,01H
MOV CH,06H
MOV CL,06H
INT 10H
End; { BlockCursore }


{----------------------------------------------------------------------------
  FUNZIONE: CONTROL.PRESSED

  Restituisce TRUE se il tasto CTRL è premuto; FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  ControlPressed: Boolean;

Begin { ControlPressed }

{ Viene letto lo stato all' indirizzo di memoria 0000h:0417h, nel 3º bit }
ControlPressed := (Mem[$0000:$0417] And $04) > 0;

End; { ControlPressed }


{----------------------------------------------------------------------------
  FUNZIONE: ALT.PRESSED

  Restituisce TRUE se il tasto ALT è premuto; FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  AltPressed: Boolean;

Begin { AltPressed }

{ Viene letto lo stato all' indirizzo di memoria 0000h:0417h, nel 4º bit }
AltPressed := (Mem[$0000:$0417] And $08) > 0;

End; { AltPressed }


{----------------------------------------------------------------------------
  FUNZIONE: SHIFT.PRESSED

  Restituisce TRUE se il tasto SHIFT (di destra o di sinistra) è premuto;
  FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  ShiftPressed: Boolean;

Begin { ShiftPressed }

{ Viene letto lo stato all' indirizzo di memoria 0000h:0417h, nei bit
  1 (Destra) e 2 (Sinistra) }
ShiftPressed := ((Mem[$0000:$0417] And $01) > 0)
                Or ((Mem[$0000:$0417] And $02) > 0);

End; { ShiftPressed }


{----------------------------------------------------------------------------
  PROCEDURA: APRI.QUADRO

  Apre con effetto a scoppio (o zoom) un rettangolo di coordinate massime
  pari a (X1,Y1) e (X2,Y2) che ha come titolo TITLE.
  ATBORD, ATFORE ed ATTITLE sono rispettivamente il colore del bordo, il
  colore del testo nella finestra e il colore del titolo.
  NUMPASSI è la velocità di apertura del quadro: più il valore è piccolo
  e più sarà veloce; RITARDO aspetta un certo numero di millisecondi prima
  di disegnare ogni quadro.
  I colori sono definiti come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure ApriQuadro ( X1:       Byte;
		       Y1:       Byte;
		       X2:       Byte;
		       Y2:       Byte;
		       Title:    String080;
		       AtBord:   Byte;
		       AtFore:   Byte;
		       AtTitle:  Byte;
		       NumPassi: Byte;
		       Ritardo:  Word );

{ Variabili locali }
Var

    { Indice per i cicli }
    I:      Byte;

    { Indice per i cicli }
    J:      Byte;

    { Passo X }
    DeltaX: Byte;

    { Passo Y }
    DeltaY: Byte;

    { Appoggio per il titolo }
    St:     String080;

    { Numero che contiene la distanza tra X1 e X2 }
    Num:    Integer;


Begin { ApriQuadro }

{ Per NumPassi volte, apre un quadro }
For i := NumPassi DownTo 1 Do

  Begin

  { Ripristina le dimensioni della finestra attiva a tutto lo schermo }
  Window(1,1,80,25);

  { Passo X }
  If (i = 1)
    Then
      DeltaX := 0
  Else
    DeltaX := Trunc((X2-X1)/(NumPassi*2)*i);

  { Passo Y }
  If (i = 1)
    Then
      DeltaY := 0
  Else
    DeltaY := Trunc((Y2-Y1)/(NumPassi*2)*i);

  { Scrive l' angolo in alto a sinistra }
  WriteChar(X1+DeltaX,Y1+DeltaY,1,WinCornice[1],AtBord);

  { Scrive il bordo orizzontale superiore }
  If ((X2-DeltaX-1)-(X1+DeltaX) > 0)
    Then
      WriteChar(X1+DeltaX+1,Y1+DeltaY,(X2-DeltaX-1)-(X1+DeltaX),WinCornice[2],AtBord);

  { Scrive l' angolo in alto a destra }
  WriteChar(X2-DeltaX,Y1+DeltaY,1,WinCornice[3],AtBord);

  { Scrive i bordi verticali }
  If ((Y2-DeltaY-1)-(Y1+DeltaY+1) > 0)
    Then
      For j := (Y1+DeltaY+1) To (Y2-DeltaY-1) Do
	Begin

	{ Verticale sinistro }
	WriteChar(X1+DeltaX,j,1,WinCornice[4],AtBord);

	{ Verticale destro }
	WriteChar(X2-DeltaX,j,1,WinCornice[5],AtBord);

	End;

  { Scrive l' angolo in basso a sinistra }
  WriteChar(X1+DeltaX,Y2-DeltaY,1,WinCornice[6],AtBord);

  { Scrive il bordo orizzontale inferiore }
  If ((X2-DeltaX-1)-(X1+DeltaX) > 0)
    Then
      WriteChar(X1+DeltaX+1,Y2-DeltaY,(X2-DeltaX-1)-(X1+DeltaX),WinCornice[7],AtBord);

  { Scrive l' angolo in basso a destra }
  WriteChar(X2-DeltaX,Y2-DeltaY,1,WinCornice[8],AtBord);

  { Scrive il titolo e lo tronca (se necessario) }
  St := Title;
  Num := (X2-DeltaX)-(X1+DeltaX);
  If (Num > 0)
    Then
      Begin

      If (Length(St) > Num-2)
	Then
	  Begin
	  St[0] := Chr(Num-1);
	  End;

      If ((Num/2) = (Num Div 2))
	Then
	  Num := 0

      Else
	Num := 1;

      WriteStr((X1+X2) Div 2-Length(St) Div 2+Num,Y1+DeltaY,St,AtTitle);

      End;

  { Imposta la finestra attiva }
  If (((X2-DeltaX-1)-(X1+DeltaX+1) > 0) And
     ((Y2-DeltaY-1)-(Y1+DeltaY+1) > 0))
       Then
	 Begin

	 Window(X1+DeltaX+1,Y1+DeltaY+1,X2-DeltaX-1,Y2-DeltaY-1);

	 { Riempie la finestra di spazi }
	 TextAttr := AtFore;
	 ClrScr;

	 End;

  { Attende un po' ed emette un beep variabile, se il suono è stato
    abilitato }
  If Special.EnableSound
    Then
      Sound(Ritardo+1000-(50*i));

  Delay(Ritardo);
  NoSound;

  End;

{ Setta il range per il mouse }
SetTVertRange(Y1+1,Y2-1);
SetTHorRange(X1+1,X2-1);

End; { ApriQuadro }


{----------------------------------------------------------------------------
  FUNZIONE: DIALOG

  Visualizza una finestra di dialogo, al centro dello schermo, che contiene
  il messaggio passato come parametro in STA, STB ed STC, come nella
  funzione MENU.
  Una volta scritte queste righe, divise sempre dal carattere '|', vengono
  disegnate le scelte che l' utente può effettuare.
  La variabile TITOLO è il titolo della finestra che verrà aperta.
  La funzione restituisce il numero del tasto premuto (da 1 in poi) o
  il valore -1 se è stato premuto il tasto ESCAPE e quindi non è stata
  scelta nessuna opzione.
  ATBORD, ATTITLE, ATTEXT, ATSEL, ATUNSEL sono rispettivamente l' attributo
  del bordo della finestra, quello del titolo e del testo in essa,
  il colore del tasto selezionato e di quello non selezionato.
  Le variabili dei tasti sono:

     __OK__      per il solo tasto OK
     __SI_NO__   per i tasti SI e NO

  E' implementato l' utilizzo del mouse.
  La variabile HELPARG è l' argomento dell' help che viene richiamato con
  i tasti CTRL-F1.
 ----------------------------------------------------------------------------}
Function  Dialog ( Titolo:     String080;
		   StA:        String;
		   StB:        String;
		   StC:        String;
		   Tasti:      OptionType;
		   AtBord:     Byte;
		   AtTitle:    Byte;
		   AtText:     Byte;
		   AtSel:      Byte;
		   AtUnSel:    Byte;
		   AtKeySel:   Byte;
		   AtKeyUnSel: Byte ): Integer;

{ Costanti locali }
Const
     MaxDialogTasti= 2;

{ Tipi di dati locali }
Type

     { Puntatore al vettore delle righe }
     PTRVetSt=    ^VetSt;

     { Una riga, una stringa di 50 caratteri al massimo }
     RecSt=       String080;

     { Il vettore delle righe }
     VetSt=       Array [1..10] Of
		    RecSt;

     { Puntatore al vettore dei tasti }
     PTRVetTasti= ^VetOpzioni;

     { Record che contiene le opzioni visualizzate sul video: ST è una
       stringa di 8 caratteri, del tipo '   OK   ' o '   SI   '; X è la
       coordinata orizzontale sullo schermo (quella verticale è sempre
       nota, sommando 1 al numero massimo di righe del commento) }
     RecOpzioni=  Record
		    Op:    String008;
		    X:     Byte;
                    St:    String080;
		    End;

     { Vettore che contiene le opzioni visualizzate sul video }
     VetOpzioni=  Array [1..MaxDialogTasti] Of
		    RecOpzioni;

{ Variabili locali }
Var

    { Stringa di appoggio }
    St:            String;

    { Vettore delle righe }
    VetRow:        PTRVetSt;

    { Numero di opzione corrente (tasto evidenziato) }
    NumTasto:      Byte;

    { Numero di opzione precedente (tasto evidenziato) }
    OldTasto:      Byte;

    { Massima lunghezza delle righe }
    MaxLength:     Byte;

    { Numero massimo di righe }
    MaxRow:        Byte;

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

    { Vettore che contiene le opzioni visualizzate sul video }
    VetTasti:      PTRVetTasti;

    { Numero di tasti visalizzati }
    MaxTasti:      Byte;

    { Coordinata Y dei tasti sullo schermo }
    Y:             Byte;

    { Vettore per memorizzare le lettere evidenziate }
    KeyWord:       Array [1..MaxDialogTasti] Of
                     Char;

    { Stato della linea }
    OldAggiorno:   Boolean;

Begin { Dialog }

OldAggiorno := AggiornaStatusLine;
AggiornaStatusLine := False;

{ Alloca il vettore delle righe in memoria }
New(VetRow);  { 816 Bytes }

{ Alloca il vettore dei tasti in memoria }
New(VetTasti);   { 184 Bytes }

{ Inizializza la lunghezza massima della finestra ai valori minimi
  consentiti }
Case Tasti Of

  { Tasto OK }
  __OK__: MaxLength := 10;

  { Tasti SI e NO }
  __SI_NO__: MaxLength := 14;

  End; { Case Tasti }

{ Separa tutte le righe elencate nelle tre stringhe, da considerarsi
  però una unica, senza interruzioni di nessun genere.
  La riga finisce ad ogni carattere '|'; il numero di opzioni
  disponibili è noto, sapendo il numero di questi caratteri.
  Il numero che restituisce la funzione è quello della riga
  selezionata. Restiruisce -1 nel caso in cui non venga scelto
  niente e premuto il tasto ESCAPE o il pulsante DESTRO del mouse.
  Il numero minimo di righe è 1, in quanto il commento è considerato una
  cosa a parte }
St := StA;
StA := StrNull;
MaxRow := 0;
If (Pos('|',St) <> 0)
  Then

    While St <> StrNull Do

      Begin

      { Definisce una riga della finestra }
      Inc(MaxRow);
      VetRow^[MaxRow] := Copy(St,1,Pos('|',St)-1);
      Delete(St,1,Pos('|',St));
      If (MaxLength < Length(VetRow^[MaxRow]))
	Then
	  MaxLength := Length(VetRow^[MaxRow]);

      { Cambio della stringa: in questo modo è come se StA, StB ed StC
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
		End;

	  End;

      End;

{ Aggiusta le stringhe, se necessario, in modo che siano centrate
  rispetto a quella più lunga della finestra }
For i := 1 To MaxRow Do
  If (VetRow^[i] <> StrNull)
    Then
      While (Length(VetRow^[i]) < MaxLength) Do

	Begin

	If (Length(VetRow^[i])/2) <> (Length(VetRow^[i]) Div 2)
	  Then
	    VetRow^[i] := ' '+VetRow^[i]

	Else
	  VetRow^[i] := VetRow^[i]+' ';

	End;

{ Nasconde il cursore }
CursorOFF;

{ Apre un rettangolo con effetto a scoppio }
InizioX := 40-MaxLength Div 2;
InizioY := 9-MaxRow Div 2-1;
Inc(MaxLength);
ApriQuadro(InizioX,InizioY,InizioX+MaxLength,InizioY+MaxRow+6,
	   Titolo,AtBord,AtText,AtTitle,Ritardo.DialStep,
	   Ritardo.Dialog);

{ Y è la coordinata y dei tasti, ed è sempre la stessa qualsiasi sia
  il numero di tasti presenti }
y := MaxRow+3;

{ Ora viene inizializzato il vettore che contiene tutte le informazioni
  per ciascun tasto, come la posizione X, il contenuto e il numero
  massimo di tasti scelti dall' utente }
Case Tasti Of

  { Tasto OK }
  __OK__: Begin

	  MaxTasti := 1;
	  VetTasti^[1].Op := '   OK   ';
	  VetTasti^[1].X := (Lo(WindMax)-Lo(WindMin)) Div 2-2;
          VetTasti^[1].St := ' Accetta e chiudi la finestra di dialogo';
          KeyWord[1] := 'O';
	  VetTasti^[2] := VetTasti^[1];

	  End;

  { Tasti SI e NO }
  __SI_NO__: Begin

	     MaxTasti := 2;
	     VetTasti^[1].Op := '   SI   ';
	     VetTasti^[1].X := (Lo(WindMax)-Lo(WindMin)) Div 3-2;
             VetTasti^[1].St := ' Esegui l'' operazione';
             KeyWord[1] := 'S';

	     VetTasti^[2].Op := '   NO   ';
	     VetTasti^[2].X := ((Lo(WindMax)-Lo(WindMin)) Div 3)*2-2;
             VetTasti^[2].St := ' Non eseguire l'' operazione';
             KeyWord[2] := 'N';

	     End;

  End; { Case Tasti }


{ Scrive le righe di commento del colore testo della finestra }
For i := 1 To MaxRow Do
  WriteStr(1,i+1,VetRow^[i],AtText);

{ Ora scrive i tasti sul video con attributo 'tasto non evidenziato' }
For i := 1 To MaxTasti Do

  With VetTasti^[i] Do
    Begin
    WriteStr(x,y,Op,AtUnSel);
    WriteChar(x+3,y,1,KeyWord[i],AtKeyUnSel);
    End;


{ Il primo tasto è quello selezionato }
NumTasto := 1;
OldTasto := NumTasto;
Done := False;

{ Scrive il tasto selezionato con attributo 'tasto evidenziato' }
With VetTasti^[NumTasto] Do
  Begin
  WriteStr(x,y,Op,AtSel);
  WriteChar(x+3,y,1,KeyWord[NumTasto],AtKeySel);
  End;

Window(1,1,80,25);
Info(VetTasti^[NumTasto].St,Color.UserInfo);
Window(InizioX+1,InizioY+1,InizioX+MaxLength-1,InizioY+MaxRow+5);

{ Nasconde il cursore }
CursorOFF;

{ Attende la scelta di un tasto visualizzato. Si possono premere
  i tasti:

    FRECCIA DESTRA    per spostarsi verso destra
    FRECCIA SINISTRA  per spostarsi verso sinistra
    HOME              per andare al primo tasto
    END               per andare all' ultimo tasto
    RETURN            per selezionare l' opzione corrente
    ESCAPE            per uscire senza selezionare alcuna opzione
    F1                per ottenere l' help
    ALT-F1            per ottenere l' help precedente
    CTRL-F1           per ottenere l' help specifico
    SHIFT-F1          per ottenere la lista degli argomenti dell' help

  oppure, con il mouse:

    DOPPIO CLICK DEL PULSANTE
    SINISTRO SU UN TASTO        per selezionarlo

    PULSANTE DESTRO             per ottenere l' help (come F1)

    MOVIMENTO MOUSE             per spostarsi all' interno del menu }
Repeat

  { Aggiorna il video solo quando si è verificato un cambiamento,
    evitando inutili stampe }
  If (OldTasto <> NumTasto)
    Then

      Begin

      { Cancella l' evidenziatore dal vecchio tasto }
      With VetTasti^[OldTasto] Do
	WriteStr(x,y,Op,AtUnSel);

      With VetTasti^[OldTasto] Do
	WriteChar(x+3,y,1,KeyWord[OldTasto],AtKeyUnSel);

      { Evidenzia il nuovo tasto }
      With VetTasti^[NumTasto] Do
	WriteStr(x,y,Op,AtSel);

      With VetTasti^[NumTasto] Do
	WriteChar(x+3,y,1,KeyWord[NumTasto],AtKeySel);

      Window(1,1,80,25);
      Info(VetTasti^[NumTasto].St,Color.UserInfo);
      Window(InizioX+1,InizioY+1,InizioX+MaxLength+1,InizioY+MaxRow+5);

      End;

  { Attende la pressione di un tasto o di un pulsante del mouse }
  Attendi(Ch1,Ch2,SDialog);

  { Memorizza il tasto precedente }
  OldTasto := NumTasto;

  { Controlla il mouse }
  If MousePressed
    Then

      Begin

      { Pulsante di sinistra }
      If LeftButton
        Then

          Begin

          { Controlla tutti i tasti disponibili }
          For i := 1 To MaxTasti Do
            With VetTasti^[i] Do
              If ((MouseTextX >= (Lo(WindMin)+x)) And
	          (MouseTextX <= (Lo(WindMin)+x+7)) And
		  (MouseTextY = (Hi(WindMin)+y)))
                    Then

                      { Tasto premuto in una posizione valida }
                      Begin
		      NumTasto := i;
                      If (NumTasto = OldTasto)
	                Then

                          { Opzione accettata }
                          Ch1 := kReturn
                      Else

                        { Opzione non accettata }
                        Begin
                        Ch1 := kNull;
                        Ch2 := kNull;
                        End;
                      End;

          End
      Else

        { Pulsante di destra }
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

	     { Destra: muove l' evidenziatore di un tasto verso destra }
	     kRight: If (NumTasto < MaxTasti)
		       Then
			 Inc(NumTasto);

	     { Sinistra: muove l' evidenziatore di un tasto verso sinistra }
	     kLeft: If (NumTasto > 1)
		      Then
			Dec(NumTasto);

	     { Home: muove l' evidenziatore al primo tasto }
	     kHome: NumTasto := 1;

	     { End: muove l' evidenziatore all' ultimo tasto }
	     kEnd: NumTasto := MaxTasti;

	     End; { Case Ch2 }

    { Return: accetta il tasto evidenziato }
    kReturn: Begin
	     Done := True;
	     Dialog := NumTasto;
	     End;

    { Escape: rifiuta la scelta }
    kEscape: Begin
	     Done := True;
	     Dialog := -1;
	     End;
    Else

      { Controlla la pressione di una lettera evidenziata }
      If (UpCase(Ch1) In [KeyWord[1],KeyWord[2]])
        Then

          Begin
	  Done := True;
          If (UpCase(Ch1) = KeyWord[1])
            Then

              { Primo tasto }
              NumTasto := 1
          Else
            If (UpCase(Ch1) = KeyWord[2])
              Then

                { Secondo tasto }
                NumTasto := 2;
	  Dialog := NumTasto;
          End;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Ripristina il contenuto dello schermo }
Fisico^ := Image^[NumPgVideo].Page;

{ Libera la memoria occupata dal vettore delle righe di commento }
Dispose(VetRow);   { 816 Bytes }

{ Libera la memoria occupata dal vettore delle informazioni di ogni tasto }
Dispose(VetTasti);  { 184 Bytes }

{ Setta i range per il mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

{ Ripristina lo stato della linea }
AggiornaStatusLine := OldAggiorno;

End; { Dialog }


{----------------------------------------------------------------------------
  PROCEDURA: INFO

  Scrive la stringa STRINGA passata come parametro in fondo allo schermo
  nell' ultima riga, utilizzando il colore COLORE.
 ----------------------------------------------------------------------------}
Procedure Info ( Stringa: String080;
                 Colore:  Byte );

{ Variabili locali }
Var

    { Indice dei cicli }
    I: Byte;

Begin { Info }

{ Nasconde il cursore }
CursorOFF;

{ Colore adatti }
TextAttr := Colore;

For i := (Length(Stringa)+1) To 80 Do
  Stringa[i] := kSpazio;
Stringa[0] := #80;

{ Scrive la stringa }
WriteStr(1,25,Stringa,Colore);

End; { Info }


{----------------------------------------------------------------------------
  PROCEDURA: SCRIVI

  Scrive la stringa ST alle coordinate dello schermo POSX,POSY utilizzando
  il colore ATTR ed evidenziando (cioè scrivendole con il colore ATTREVID)
  le lettere di offset EVID1 ed EVID2 rispetto alla stringa stessa.
 ----------------------------------------------------------------------------}
Procedure Scrivi ( PosX:     Byte;
                   PosY:     Byte;
                   St:       String080;
                   Attr:     Byte;
                   Evid1:    Byte;
                   Evid2:    Byte;
		   AttrEvid: Byte );

Begin { Scrivi }

{ Stringa per esteso }
WriteStr(PosX,PosY,St,Attr);

{ Lettera evidenziata numero 1 }
WriteChar(PosX+Evid1-1,PosY,1,St[Evid1],AttrEvid);

{ Lettera evidenziata numero 2 }
WriteChar(PosX+Evid2-1,PosY,1,St[Evid2],AttrEvid);

End; { Scrivi }


{----------------------------------------------------------------------------
  PROCEDURA: CONTROLLO.SPECIAL.KEYS

  Controlla lo stato dei tasti speciali (SHIFT, ALT e CTRL) e fa apparire
  la finestra opportuna, in relazione allo stato in cui ci si trova.
  Lo stato è definito dall' enumerativo SKEY, che assume valori diversi
  (ad esempio) se si è nell' help o nel programma principale.
 ----------------------------------------------------------------------------}
Procedure ControlloSpecialKeys ( SKey: SpecialMenuType );

{ Variabili locali }
Var
     { Contatore per il ritardo di apparizione dei menu }
     Count: Word;

Begin { ControlloSpecialKeys }

{ CTRL premuto }
If ControlPressed
  Then

    Begin
    Count := 0;

    { Conteggio ritardo }
    With Ritardo Do
      While (ControlPressed And (Count < SpecialKey) And (Not KeyPressed)) Do
        Inc(Count);

    { Il tempo è passato ? }
    If (ControlPressed And (Not KeyPressed))
      Then

        Begin
        HideMouse;

        { Visualizza la finestra specifica per ogni situazione }
	With Color Do
	  Case SKey Of

            SNothing: ;

	    SScreen: Begin
		     OpenWindow(02,04,78,19,'[CTRL]',SpecTitle,SpecText,
			        WinCornice);
                     FillWin(kSpazio,SpecText);
                     Scrivi(04,02,'CTRL-I......Marca Inizio Blocco',SpecText,6,6,SpecSel);
                     Scrivi(04,03,'CTRL-F......Marca Fine Blocco',SpecText,6,6,SpecSel);
                     Scrivi(04,04,'CTRL-D......Definisci Blocco',SpecText,6,6,SpecSel);
                     Scrivi(04,05,'CTRL-Q......Leggi File Blocco',SpecText,6,6,SpecSel);
                     Scrivi(04,06,'CTRL-W......Salva File Blocco',SpecText,6,6,SpecSel);
                     Scrivi(04,07,'CTRL-C......Leggi File Testo (Blocco)',SpecText,6,6,SpecSel);
                     Scrivi(04,08,'CTRL-V......Salva File Testo (Blocco)',SpecText,6,6,SpecSel);
                     Scrivi(04,09,'CTRL-L......Leggi File Maschera',SpecText,6,6,SpecSel);
                     Scrivi(04,10,'CTRL-S......Salva File Maschera',SpecText,6,6,SpecSel);
                     Scrivi(04,11,'CTRL-Z......Leggi File Testo',SpecText,6,6,SpecSel);
                     Scrivi(04,12,'CTRL-X......Salva File Testo',SpecText,6,6,SpecSel);
                     Scrivi(04,13,'CTRL-B......Cambia Directory',SpecText,6,6,SpecSel);
                     Scrivi(45,02,'CTRL-A......Lista Directory',SpecText,6,6,SpecSel);
                     Scrivi(45,03,'CTRL-O......Comando DOS',SpecText,6,6,SpecSel);
                     Scrivi(45,04,'CTRL-E......Shell DOS',SpecText,6,6,SpecSel);
                     Scrivi(45,05,'CTRL-F1.....Help Specifico',SpecText,6,7,SpecSel);
                     Scrivi(45,06,'CTRL-F2.....Copia Blocco',SpecText,6,7,SpecSel);
                     Scrivi(45,07,'CTRL-F3.....Muovi Blocco',SpecText,6,7,SpecSel);
                     Scrivi(45,08,'CTRL-F4.....Cancella Blocco',SpecText,6,7,SpecSel);
                     Scrivi(45,09,'CTRL-F5.....Riempi Blocco',SpecText,6,7,SpecSel);
                     Scrivi(45,10,'CTRL-F6.....Contorna Blocco',SpecText,6,7,SpecSel);
                     Scrivi(45,11,'CTRL-F7.....Inverti Blocco',SpecText,6,7,SpecSel);
                     Scrivi(45,12,'CTRL-F8.....Memorizza Blocco',SpecText,6,7,SpecSel);
                     Scrivi(45,13,'CTRL-F9.....Richiama Blocco',SpecText,6,7,SpecSel);
                     End;

            SMainMenu,
	    SInputString,
	    SMenuASCII,
	    SMenuCornici,
	    SSelCornice,
	    SInputFile,
	    SInputDirectory,
            SMenuFiles,
	    SMenuColori,
	    SCopyBlock,
            SMoveBlock,
	    SMenuInvert,
	    SMenuBlock,
            SMenuTrace,
	    SMoveVideo,
	    SDefineBlock,
            SDialog,
	    SComandoDOS,
	    SShellDOS,
            SMenuImage,
	    SMenuVideo,
	    SMenuSpeed,
            SMenuArrow,
	    SMenuMouse,
	    SMenuSpecial,
	    SMenuConfig,
	    SMenuConv,
	    SHelp: Begin
		   OpenWindow(21,9,58,13,'[CTRL]',SpecTitle,SpecText,
			      WinCornice);
                   FillWin(kSpazio,SpecText);
                   Scrivi(04,02,'CTRL-F1.....Help Specifico',SpecText,6,7,SpecSel);
                   End;

            End; { Case SKey }

        { Attende fino a che non è stato rilasciato il tasto CTRL }
        ShowMouse;
        While (ControlPressed And (Not KeyPressed)) Do
          ;

        { Ripristina la pagina video }
        If (WindowCount > 0)
	  Then
            Begin
            HideMouse;
            CloseWindow;
            End;

        End;
    End
Else

  { SHIFT premuto }
  If ShiftPressed
    Then

      Begin
      Count := 0;

      { Conteggio del ritardo }
      With Ritardo Do
        While (ShiftPressed And (Count < SpecialKey) And (Not KeyPressed)) Do
          Inc(Count);

      { Il tempo è passato ? }
      If (ShiftPressed And (Not KeyPressed))
        Then
          Begin
          HideMouse;

          { Visualizza la finestra specifica per ogni situazione }
	  With Color Do
	    Case SKey Of

              SNothing: ;

	      SScreen: Begin
		       OpenWindow(18,06,62,19,'[SHIFT]',SpecTitle,SpecText,
			          WinCornice);
                       FillWin(kSpazio,SpecText);
                       Scrivi(04,02,'SHIFT-F1....Indice dell'' Help',SpecText,7,8,SpecSel);
                       Scrivi(04,03,'SHIFT-F2....Modifica Colori',SpecText,7,8,SpecSel);
                       Scrivi(04,04,'SHIFT-F3....Modifica Velocità',SpecText,7,8,SpecSel);
                       Scrivi(04,05,'SHIFT-F4....Modifica Cornici Finestra',SpecText,7,8,SpecSel);
                       Scrivi(04,06,'SHIFT-F5....Modifica Bordo Blocco',SpecText,7,8,SpecSel);
                       Scrivi(04,07,'SHIFT-F6....Modifica Frecce Blocco',SpecText,7,8,SpecSel);
                       Scrivi(04,08,'SHIFT-F7....Velocità Mouse',SpecText,7,8,SpecSel);
                       Scrivi(04,09,'SHIFT-F8....Opzioni Avanzate',SpecText,7,8,SpecSel);
                       Scrivi(04,10,'SHIFT-F9....Leggi Configurazione',SpecText,7,8,SpecSel);
                       Scrivi(04,11,'SHIFT-F10...Salva Configurazione',SpecText,7,8,SpecSel);
                       WriteChar(12,11,1,'0',SpecSel);
                       End;

	      SMenuASCII,
	      SMenuCornici,
	      SSelCornice,
	      SInputString,
              SMenuFiles,
	      SMenuColori,
	      SMenuInvert,
	      SMenuBlock,
              SMenuTrace,
	      SMoveVideo,
              SDialog,
	      SComandoDOS,
	      SShellDOS,
              SMenuImage,
	      SMenuVideo,
	      SMenuSpeed,
              SMenuArrow,
	      SMenuMouse,
	      SMenuSpecial,
	      SMenuConfig,
	      SMenuConv,
	      SMainMenu: Begin
		         OpenWindow(21,9,58,13,'[SHIFT]',SpecTitle,SpecText,
			            WinCornice);
                         FillWin(kSpazio,SpecText);
                         Scrivi(04,02,'SHIFT-F1.....Indice dell'' Help',SpecText,7,8,SpecSel);
                         End;

	      SHelp: Begin
		     OpenWindow(20,9,60,14,'[SHIFT]',SpecTitle,SpecText,
			        WinCornice);
                     FillWin(kSpazio,SpecText);
                     Scrivi(04,02,'SHIFT-F1.....Indice dell'' Help',SpecText,7,8,SpecSel);
                     Scrivi(04,03,'SHIFT-TAB....Argomento Precedente',SpecText,7,8,SpecSel);
                     WriteChar(12,03,1,'B',SpecSel);
                     End;

	      SInputDirectory,
	      SInputFile: Begin
		          OpenWindow(19,9,61,14,'[SHIFT]',SpecTitle,SpecText,
			             WinCornice);
                          FillWin(kSpazio,SpecText);
                          Scrivi(04,02,'SHIFT-F1.....Indice dell'' Help',SpecText,7,8,SpecSel);
                          Scrivi(04,03,'SHIFT-TAB....Nome File / Directory',SpecText,7,8,SpecSel);
                          WriteChar(12,03,1,'B',SpecSel);
                          End;

              SMoveBlock,
	      SDefineBlock,
	      SCopyBlock: Begin
		          OpenWindow(19,8,60,16,'[SHIFT]',SpecTitle,SpecText,
			             WinCornice);
                          FillWin(kSpazio,SpecText);
                          Scrivi(04,02,'SHIFT-'+#30+'......Sposta Verso l'' Alto',SpecText,7,7,SpecSel);
                          Scrivi(04,03,'SHIFT-'+#31+'......Sposta Verso il Basso',SpecText,7,7,SpecSel);
                          Scrivi(04,04,'SHIFT-'+#16+'......Sposta Verso Destra',SpecText,7,7,SpecSel);
                          Scrivi(04,05,'SHIFT-'+#17+'......Sposta Verso Sinistra',SpecText,7,7,SpecSel);
                          Scrivi(04,06,'SHIFT-F1.....Indice dell'' Help',SpecText,7,8,SpecSel);
                          End;

              End; { Case SKey }

          { Con alcuni LCD ci sono dei problemi }
          With TopWindow^.State Do
            Begin
	    WriteChar(Lo(WindMax)-1,Hi(WindMax)-1,1,'█',Color.SpecText);
            GoToXY(Lo(WindMax)-1,Hi(WindMax)-1);
            End;

          { Attende fino a che non viene rilasciato lo SHIFT }
          ShowMouse;
          While (ShiftPressed And (Not KeyPressed)) Do
            ;

          { Ripristina la pagina video }
          If (WindowCount > 0)
	    Then
              Begin
              HideMouse;
	      CloseWindow;
              End;

          End;
      End
Else

  { ALT premuto }
  If AltPressed
    Then

      Begin
      Count := 0;

      { Conteggio del ritardo }
      While (AltPressed And (Count < Ritardo.SpecialKey) And (Not KeyPressed)) Do
        Inc(Count);

      { Il tempo è passato ? }
      If (AltPressed And (Not KeyPressed))
        Then

          Begin
          HideMouse;

          { Visualizza la finestra relativa alla situazione }
	  With Color Do
	    Case SKey Of

              SNothing: ;

	      SScreen: Begin
		       OpenWindow(08,02,72,22,'[ALT]',SpecTitle,SpecText,
			          WinCornice);
                       FillWin(kSpazio,SpecText);
                       Scrivi(04,02,'ALT-M....Menu Principale',SpecText,5,5,SpecSel);
                       Scrivi(04,03,'ALT-A....Caratteri ASCII',SpecText,5,5,SpecSel);
                       Scrivi(04,04,'ALT-C....Cornici',SpecText,5,5,SpecSel);
                       Scrivi(04,05,'ALT-T....Traccia Cornici',SpecText,5,5,SpecSel);
                       Scrivi(04,06,'ALT-O....Colore',SpecText,5,5,SpecSel);
                       Scrivi(04,07,'ALT-I....Scegli Immagine',SpecText,5,5,SpecSel);
                       Scrivi(04,08,'ALT-B....Blocchi',SpecText,5,5,SpecSel);
                       Scrivi(04,09,'ALT-S....Schermo',SpecText,5,5,SpecSel);
                       Scrivi(04,10,'ALT-F....Files',SpecText,5,5,SpecSel);
                       Scrivi(04,11,'ALT-G....Configurazione',SpecText,5,5,SpecSel);
                       Scrivi(04,12,'ALT-V....Conversione',SpecText,5,5,SpecSel);
                       Scrivi(04,13,'ALT-H....Help',SpecText,5,5,SpecSel);
                       Scrivi(04,14,'ALT-F2...Copia Schermo',SpecText,5,6,SpecSel);
                       Scrivi(04,15,'ALT-F3...Muovi Schermo',SpecText,5,6,SpecSel);
                       Scrivi(04,16,'ALT-F4...Cancella Schermo',SpecText,5,6,SpecSel);
                       Scrivi(04,17,'ALT-F5...Riempi Schermo',SpecText,5,6,SpecSel);
                       Scrivi(04,18,'ALT-U....Uscita',SpecText,5,5,SpecSel);
                       Scrivi(34,02,'ALT-1....Immagine Num. 1',SpecText,5,5,SpecSel);
                       Scrivi(34,03,'ALT-2....Immagine Num. 2',SpecText,5,5,SpecSel);
                       Scrivi(34,04,'ALT-3....Immagine Num. 3',SpecText,5,5,SpecSel);
                       Scrivi(34,05,'ALT-4....Immagine Num. 4',SpecText,5,5,SpecSel);
                       Scrivi(34,06,'ALT-5....Immagine Num. 5',SpecText,5,5,SpecSel);
                       Scrivi(34,07,'ALT-6....Immagine Num. 6',SpecText,5,5,SpecSel);
                       Scrivi(34,08,'ALT-7....Immagine Num. 7',SpecText,5,5,SpecSel);
                       Scrivi(34,09,'ALT-8....Immagine Num. 8',SpecText,5,5,SpecSel);
                       Scrivi(34,10,'ALT-9....Immagine Num. 9',SpecText,5,5,SpecSel);
                       Scrivi(34,11,'ALT-0....Immagine Num. 10',SpecText,5,5,SpecSel);
                       Scrivi(34,12,'ALT-P....ClipBoard',SpecText,5,5,SpecSel);
                       Scrivi(34,13,'ALT-F1...Help Prec.',SpecText,5,6,SpecSel);
                       Scrivi(34,14,'ALT-F6...Contorna Schermo',SpecText,5,6,SpecSel);
                       Scrivi(34,15,'ALT-F7...Inverti Schermo',SpecText,5,6,SpecSel);
                       Scrivi(34,16,'ALT-F8...Memorizza Schermo',SpecText,5,6,SpecSel);
                       Scrivi(34,17,'ALT-F9...Richiama Schermo',SpecText,5,6,SpecSel);
                       End;

	      SMainMenu,
              SInputString,
              SMenuASCII,
              SMenuCornici,
	      SSelCornice,
	      SInputFile,
	      SInputDirectory,
              SMenuFiles,
	      SMenuColori,
	      SCopyBlock,
              SMoveBlock,
	      SMenuInvert,
	      SMenuBlock,
              SMenuTrace,
	      SMoveVideo,
	      SDefineBlock,
              SDialog,
	      SComandoDOS,
	      SShellDOS,
              SMenuImage,
	      SMenuVideo,
	      SMenuSpeed,
              SMenuArrow,
	      SMenuMouse,
	      SMenuSpecial,
	      SMenuConfig,
	      SMenuConv,
	      SHelp: Begin
		     OpenWindow(24,9,56,14,'[ALT]',SpecTitle,SpecText,
			        WinCornice);
                     FillWin(kSpazio,SpecText);
                     Scrivi(04,02,'ALT-H....Help Generale',SpecText,5,5,SpecSel);
                     Scrivi(04,03,'ALT-F1...Help Precedente',SpecText,5,6,SpecSel);
                     End;

              End; { Case SKey }

          { Attende fino a che non viene rilasciato lo SHIFT di destra o
            quello di sinistra }
          ShowMouse;
          While (AltPressed And (Not KeyPressed)) Do
            ;

          { Ripristina la pagina video }
          If (WindowCount > 0)
	    Then
              Begin
              HideMouse;
	      CloseWindow;
              End;

          End;
      End;

ShowMouse;

End; { ControlloSpecialKeys }


{----------------------------------------------------------------------------
  PROCEDURA: ATTENDI

  Attende la pressione di un tasto e restituisce il codice ASCII di questo
  in CH1. Se il tasto è esteso, CH1 vale 0, mentre CH2 contiene il codice
  del carattere esteso (per la lista di molti dei caratteri estesi vedere
  la unit KEYBOARD.PAS.
  Se viene premuto un tasto del mouse, le variabili CH1 e CH2 non
  vengono modificate.
 ----------------------------------------------------------------------------}
Procedure Attendi ( Var Ch1:  Char;
                    Var Ch2:  Char;
		        SKey: SpecialMenuType );

Begin { Attendi }

{ Vuota il buffer della tastiera }
While KeyPressed Do
  Ch1 := ReadKey;

{ Attende un tasto o la pressione del mouse se presente }
ShowMouse;
Repeat
  GetMPos;
  ControlloSpecialKeys(SKey);
Until (KeyPressed Or (MouseOk And MousePressed));
HideMouse;

{ Aggiorna Ch1 e Ch2 se è stato premuto un tasto della tastiera }
If KeyPressed
  Then

    Begin

    Ch1 := ReadKey;

    If (Ch1 = kNull)
      Then
	Ch2 := ReadKey;

    End;

End; { Attendi }


{----------------------------------------------------------------------------
  PROCEDURA: ATTENDI.MOUSE

  Attende la pressione di un tasto e restituisce il codice ASCII di questo
  in CH1. Se il tasto è esteso, CH1 vale 0, mentre CH2 contiene il codice
  del carattere esteso (per la lista di molti dei caratteri estesi vedere
  la unit KEYBOARD.PAS).
  Oltre a questo controlla lo stato del mouse e ne segnala la pressione o
  il movimento.
  Se invece è stata premuta la tastiera si esce ugualmente e il valore
  logico della variabile KEYBPRESSED è TRUE.
  SKEY specifica quale menu far apparire alla pressione dei tasti speciali
  (SHIFT, ALT e CTRL).
 ----------------------------------------------------------------------------}
Procedure AttendiMouse ( Var Ch1:         Char;
			 Var Ch2:         Char;
			     SKey:        SpecialMenuType;
			 Var KeybPressed: Boolean );

{ Variabili locali }
Var

    { Posizione X del mouse }
    OldMouseX:   Byte;

    { Posizione Y del mouse }
    OldMouseY:   Byte;

    { TRUE per uscira dalla procedura }
    Esci:        Boolean;

    { Aggiornamento della linea di stato }
    OldAggiorno: Boolean;

Begin { AttendiMouse }

{ Memorizza lo stato dell' aggiornamento della linea in fondo allo schermo }
OldAggiorno := AggiornaStatusLine;
AggiornaStatusLine := False;

{ Posizioni X e Y del mouse }
GetMPos;
OldMouseX := MouseTextX;
OldMouseY := MouseTextY;

{ Attende un tasto o la pressione del mouse se presente }
ShowMouse;

{ Attende fino a che non mosso il mouse o la tastiera }
Repeat

  GetMPos;

  { Testa il movimento del mouse }
  If ((OldMouseX <> MouseTextX) Or (OldMouseY <> MouseTextY))
    Then
      Esci := True
  Else
    Esci := False;

  { Caratteri speciali (SHIFT, ALT e CTRL) }
  ControlloSpecialKeys(SDefineBlock);

Until (KeyPressed Or (MouseOk And MousePressed) Or Esci);

HideMouse;

{ Aggiorna Ch1 e Ch2 se è stato premuto un tasto della tastiera }
If KeyPressed
  Then

    Begin

    KeybPressed := True;

    Ch1 := ReadKey;

    If (Ch1 = kNull)
      Then
	Ch2 := ReadKey;

    End

Else

  KeybPressed := False;

AggiornaStatusLine := OldAggiorno;

End; { AttendiMouse }


End. { TIPFast }
