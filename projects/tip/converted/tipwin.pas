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
 ║       VERSIONE 1.0                          UNIT TIPWIN                  ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   18 Febbraio 1993
  Ora:    15:44:00
  Autore: Fochi Michele
  File:   Unit WindowsTextImageProcessor }

{ La unit TIPWin gestisce le finestre in Turbo Pascal: è possibile aprire
  e salvare una finestra, chiuderla e ripristinarla, riempirla di un certo
  carattere, disegnarne il bordo in un certo modo, scrivendo direttamente
  in memoria video }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Procedure WriteStr ( X:    Byte;
                           Y:    Byte;
		           S:    String;
      	                   Attr: Byte );

    - Procedure WriteChar ( X:     Byte;
                            Y:     Byte;
		            Count: Byte;
		            Ch:    Char;
		            Attr:  Byte );

    - Procedure FillWin ( Ch:   Char;
                          Attr: Byte);

    - Procedure ReadWin ( Var Buf );

    - Procedure WriteWin (Var Buf );

    - Function  WinSize: Word;

    - Procedure SaveWin ( Var W: WinState );

    - Procedure RestoreWin ( Var W: WinState );

    - Procedure FrameWin (     Title:     TitleStr;
                           Var Frame:     FrameChars;
                               TitleAttr: Byte;
			       FrameAttr: Byte );

    - Procedure UnFrameWin;

    - Procedure ActiveWindow (     Active: Boolean;
                               Var Frame:  FrameChars );

    - Procedure OpenWindow (     X1:    Byte;
                                 Y1:    Byte;
		                 X2:    Byte;
		                 Y2:    Byte;
		                 T:     TitleStr;
		                 TAttr: Byte;
		                 FAttr: Byte;
		             Var Frame: FrameChars );

    - Procedure CloseWindow;

    - Procedure InitializeWindow; }


{ Nome della unit }
Unit
     TIPWin;

{ Direttive al compilatore }
{$D-,S-}

{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e Procedure accessibili all' utente }
Interface { TIPWin }

{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalità testo }
     Crt,

     { Gestione del disco, memoria, chiamate di sistema, ... }
     Dos,

     { Definizione delle costanti, tipi e variabili del programma TIP }
     TipVar;


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.STR

  Scrive una stringa direttamente in memoria video.
  I parametri sono la posizione x (X), quella y (Y), la stringa da visualiz_
  zare (S) e il colore della stessa (ATTR).
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure WriteStr ( X:    Byte;
                     Y:    Byte;
		     S:    String;
		     Attr: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.CHAR

  Scrive un carattere direttamente in memoria video.
  I parametri sono la posizione x (X), quella y (Y), il carattere da visua_
  lizzare (CH), il colore dello stesso (ATTR) e il numero di volte che si
  desidera stamparlo (COUNT) (questo significa che se COUNT vale 3 e CH
  vale 'A', viene stampata la stringa 'AAA'.
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure WriteChar ( X:     Byte;
                      Y:     Byte;
		      Count: Byte;
		      Ch:    Char;
		      Attr:  Byte );


{----------------------------------------------------------------------------
  PROCEDURA: FILL.WIN

  Riempie la finestra corrente con un certo carattere (CH) e colore (ATTR).
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure FillWin ( Ch:   Char;
                    Attr: Byte);


{----------------------------------------------------------------------------
  PROCEDURA: READ.WIN

  Legge il contenuto di una finestra dalla memoria video.
  Il parametro BUF è un puntatore all' indirizzo di partenza dal quale
  verrà salvata la zona di schermo da coprire.
 ----------------------------------------------------------------------------}
Procedure ReadWin ( Var Buf );


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.WIN

  Scrive il contenuto di una finestra in memoria sul video. E' ovvio che
  per poterla ripristinare occorre averla salvata precedentemente.
  Il parametro BUF è un puntatore all' indirizzo di partenza dal quale
  verrà letta la zona di schermo da ripristinare.

 ----------------------------------------------------------------------------}
Procedure WriteWin (Var Buf );


{----------------------------------------------------------------------------
  FUNZIONE: WIN.SIZE

  Ritorna la dimensione della finestra in occupazione di memoria.
 ----------------------------------------------------------------------------}
Function  WinSize: Word;


{----------------------------------------------------------------------------
  PROCEDURA: SAVE.WIN

  Salva i parametri della finestra corrente, come il colore, la posizione,
  ecc. Il parametro W è un record formato dai seguenti campi:

       WinState = Record
                    WindMin:  Word;
		    WindMax:  Word;
                    WhereX:   Byte;
		    WhereY:   Byte;
                    TextAttr: Byte;
                    End;

  'WindMin' e 'WindMax' sono rispettivamente gli angoli in alto a sinistra
  e in basso a destra. Per avere le coordinate del primo occorre prendere
  la perte meno significativa del valore, tramite la funzione LO (WindMin);
  la stessa cosa funziona con quella più significativa (HI (WindMin)).
  I campi 'WhereX' e 'WhereY' memorizzano la posizione della finestra
  rispetto allo schermo.
  'TextAttr' serve per memorizzare il colore, definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure SaveWin ( Var W: WinState );


{----------------------------------------------------------------------------
  PROCEDURA: RESTORE.WIN

  Ripristina i parametri nella finestra corrente, come il colore, la
  posizione, ecc. Il parametro W è un record formato dai seguenti campi:

       WinState = Record
                    WindMin:  Word;
		    WindMax:  Word;
                    WhereX:   Byte;
		    WhereY:   Byte;
                    TextAttr: Byte;
                    End;

  'WindMin' e 'WindMax' sono rispettivamente gli angoli in alto a sinistra
  e in basso a destra. Per avere le coordinate del primo occorre prendere
  la perte meno significativa del valore, tramite la funzione LO (WindMin);
  la stessa cosa funziona con quella più significativa (HI (WindMin)).
  I campi 'WhereX' e 'WhereY' memorizzano la posizione della finestra
  rispetto allo schermo.
  'TextAttr' serve per memorizzare il colore, definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure RestoreWin ( Var W: WinState );


{----------------------------------------------------------------------------
  PROCEDURA: FRAME.WIN

  Disegna il bordo della finestra. I parametri sono il titolo (TITLE), il
  tipo di bordo (FRAMECHARS), il colore del titolo (TITLEATTR) e il
  colore del bordo (FRAMEATTR).
  I colori sono definiti come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
  Il tipo FRAMECHARS è una stringa che contiene i cartteri del bordo.
  Ci sono quattro tipi di bordi:

                      ┌────────┐       SingleHorFrame:  ╓────────╖
     SingleFrame:     │        │       DoubleVerFrame:  ║        ║
		      └────────┘                        ╙────────╜
                      ╔════════╗       DoubleHorFrame:  ╒════════╕
     DoubleFrame:     ║        ║       SingleVerFrame:  │        │
		      ╚════════╝                        ╘════════╛
 ----------------------------------------------------------------------------}
Procedure FrameWin (     Title:     TitleStr;
                     Var Frame:     FrameChars;
                         TitleAttr: Byte;
			 FrameAttr: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: UNFRAME.WIN

  Cancella il bordo della finestra.
 ----------------------------------------------------------------------------}
Procedure UnFrameWin;


{----------------------------------------------------------------------------
  PROCEDURA: ACTIVE.WINDOW

  Attiva una finestra disegnandone il bordo in un certo modo.
  Il tipo FRAMECHARS è una stringa che contiene i cartteri del bordo.
  Ci sono quattro tipi di bordi:

                      ┌────────┐       SingleHorFrame:  ╓────────╖
     SingleFrame:     │        │       DoubleVerFrame:  ║        ║
		      └────────┘                        ╙────────╜
                      ╔════════╗       DoubleHorFrame:  ╒════════╕
     DoubleFrame:     ║        ║       SingleVerFrame:  │        │
		      ╚════════╝                        ╘════════╛
 ----------------------------------------------------------------------------}
Procedure ActiveWindow (     Active: Boolean;
                         Var Frame:  FrameChars );


{----------------------------------------------------------------------------
  PROCEDURA: OPEN.WINDOW

  Apre una finestra di coordinate (X1,Y1) per l' angolo in alto a sinistra
  e (X2,Y2) per quello in basso a destra. Il titolo è definito dalla
  variabile T; TATTR è il colore del titolo, mentre FATTR è il colore
  all' interno della finestra.
  I colori sono definiti come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
  Il tipo FRAMECHARS è una stringa che contiene i cartteri del bordo.
  Ci sono quattro tipi di bordi:

                      ┌────────┐       SingleHorFrame:  ╓────────╖
     SingleFrame:     │        │       DoubleVerFrame:  ║        ║
		      └────────┘                        ╙────────╜
                      ╔════════╗       DoubleHorFrame:  ╒════════╕
     DoubleFrame:     ║        ║       SingleVerFrame:  │        │
		      ╚════════╝                        ╘════════╛
 ----------------------------------------------------------------------------}
Procedure OpenWindow (     X1:    Byte;
                           Y1:    Byte;
		           X2:    Byte;
		           Y2:    Byte;
		           T:     TitleStr;
		           TAttr: Byte;
		           FAttr: Byte;
		       Var Frame: FrameChars );


{----------------------------------------------------------------------------
  PROCEDURA: CLOSE.WINDOW

  Chiude la finestra corrente ripristinando il contenuto della zona di
  schermo precedente. Se è presente un' altra finestra questa viene
  resa attiva disegnando il bordo scelto alla sua apertura.
 ----------------------------------------------------------------------------}
Procedure CloseWindow;


{----------------------------------------------------------------------------
  PROCEDURA: INITIALIZE.WINDOW

  Questa procedura deve essere eseguita prima di eseguira qualsiasi
  procedura di questa unit, in quanto inizializza i contatori e libera
  la memoria di partenza per i record delle finestre, ecc.
 ----------------------------------------------------------------------------}
Procedure InitializeWindow;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e Procedure disponibili solo all' interno della unit stessa }
Implementation { TIPWin }

{ File WIN.OBJ: tutte le procedure sono scritte direttamente in linguaggio
  macchina (assembler) per renderle più veloci }
{$L WIN}


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.STR

  Scrive una stringa direttamente in memoria video.
  I parametri sono la posizione x (X), quella y (Y), la stringa da visualiz_
  zare (S) e il colore della stessa (ATTR).
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure WriteStr ( X:    Byte;
                     Y:    Byte;
		     S:    String;
		     Attr: Byte );
External { TIPWin };


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.CHAR

  Scrive un carattere direttamente in memoria video.
  I parametri sono la posizione x (X), quella y (Y), il carattere da visua_
  lizzare (CH), il colore dello stesso (ATTR) e il numero di volte che si
  desidera stamparlo (COUNT) (questo significa che se COUNT vale 3 e CH
  vale 'A', viene stampata la stringa 'AAA'.
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure WriteChar ( X:     Byte;
                      Y:     Byte;
		      Count: Byte;
		      Ch:    Char;
		      Attr:  Byte );
External { TIPWin };


{----------------------------------------------------------------------------
  PROCEDURA: FILL.WIN

  Riempie la finestra corrente con un certo carattere (CH) e colore (ATTR).
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure FillWin ( Ch:   Char;
                    Attr: Byte);
External { TIPWin };


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.WIN

  Scrive il contenuto di una finestra in memoria sul video. E' ovvio che
  per poterla ripristinare occorre averla salvata precedentemente.
  Il parametro BUF è un puntatore all' indirizzo di partenza dal quale
  verrà letta la zona di schermo da ripristinare.

 ----------------------------------------------------------------------------}
Procedure WriteWin (Var Buf );
External { TIPWin };


{----------------------------------------------------------------------------
  PROCEDURA: READ.WIN

  Legge il contenuto di una finestra dalla memoria video.
  Il parametro BUF è un puntatore all' indirizzo di partenza dal quale
  verrà salvata la zona di schermo da coprire.
 ----------------------------------------------------------------------------}
Procedure ReadWin ( Var Buf );
External { TIPWin };


{----------------------------------------------------------------------------
  FUNZIONE: WIN.SIZE

  Ritorna la dimensione della finestra in occupazione di memoria.
 ----------------------------------------------------------------------------}
Function  WinSize: Word;
External { TIPWin };


{----------------------------------------------------------------------------
  PROCEDURA: SAVE.WIN

  Salva i parametri della finestra corrente, come il colore, la posizione,
  ecc. Il parametro W è un record formato dai seguenti campi:

       WinState = Record
                    WindMin:  Word;
		    WindMax:  Word;
                    WhereX:   Byte;
		    WhereY:   Byte;
                    TextAttr: Byte;
                    End;

  'WindMin' e 'WindMax' sono rispettivamente gli angoli in alto a sinistra
  e in basso a destra. Per avere le coordinate del primo occorre prendere
  la perte meno significativa del valore, tramite la funzione LO (WindMin);
  la stessa cosa funziona con quella più significativa (HI (WindMin)).
  I campi 'WhereX' e 'WhereY' memorizzano la posizione della finestra
  rispetto allo schermo.
  'TextAttr' serve per memorizzare il colore, definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure SaveWin ( Var W: WinState );
Begin { SaveWin }

W.WindMin := WindMin;
W.WindMax := WindMax;
W.WhereX := WhereX;
W.WhereY := WhereY;
W.TextAttr := TextAttr;

End; { SaveWin }


{----------------------------------------------------------------------------
  PROCEDURA: RESTORE.WIN

  Ripristina i parametri nella finestra corrente, come il colore, la
  posizione, ecc. Il parametro W è un record formato dai seguenti campi:

       WinState = Record
                    WindMin:  Word;
		    WindMax:  Word;
                    WhereX:   Byte;
		    WhereY:   Byte;
                    TextAttr: Byte;
                    End;

  'WindMin' e 'WindMax' sono rispettivamente gli angoli in alto a sinistra
  e in basso a destra. Per avere le coordinate del primo occorre prendere
  la perte meno significativa del valore, tramite la funzione LO (WindMin);
  la stessa cosa funziona con quella più significativa (HI (WindMin)).
  I campi 'WhereX' e 'WhereY' memorizzano la posizione della finestra
  rispetto allo schermo.
  'TextAttr' serve per memorizzare il colore, definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure RestoreWin ( Var W: WinState );
Begin { RestoreWin }

WindMin := W.WindMin;
WindMax := W.WindMax;
GotoXY(W.WhereX, W.WhereY);
TextAttr := W.TextAttr;

End; { RestoreWin }


{----------------------------------------------------------------------------
  PROCEDURA: FRAME.WIN

  Disegna il bordo della finestra. I parametri sono il titolo (TITLE), il
  tipo di bordo (FRAMECHARS), il colore del titolo (TITLEATTR) e il
  colore del bordo (FRAMEATTR).
  I colori sono definiti come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
  Il tipo FRAMECHARS è una stringa che contiene i cartteri del bordo.
  Ci sono quattro tipi di bordi:

                      ┌────────┐       SingleHorFrame:  ╓────────╖
     SingleFrame:     │        │       DoubleVerFrame:  ║        ║
		      └────────┘                        ╙────────╜
                      ╔════════╗       DoubleHorFrame:  ╒════════╕
     DoubleFrame:     ║        ║       SingleVerFrame:  │        │
		      ╚════════╝                        ╘════════╛
 ----------------------------------------------------------------------------}
Procedure FrameWin (     Title:     TitleStr;
                     Var Frame:     FrameChars;
                         TitleAttr: Byte;
			 FrameAttr: Byte );

{ Variabili locali }
Var

    { Lunghezza orizzontale della finestra }
    WinWidth:  Word;

    { Lunghezza verticale della finestra }
    WinHeight: Word;

    { Indice per i cicli }
    I:         Word;

Begin { FrameWin }

{ Calcolo delle dimensioni X e Y della finestra }
WinWidth := Lo(WindMax)-Lo(WindMin)+1;
WinHeight := Hi(WindMax)-Hi(WindMin)+1;

{ Scrive l' angolo in alto a sinistra }
WriteChar(1,1,1,Frame[1],FrameAttr);

{ Scrive il bordo orizzontale alto della finestra }
WriteChar(2,1,WinWidth-2,Frame[2],FrameAttr);

{ Scrive quello in alto a destra }
WriteChar(WinWidth,1,1,Frame[3],FrameAttr);

{ Se il titolo è più lungo dello spazio disponibile per la sua scrittura
  viene troncato }
If Length(Title) > WinWidth-2
  Then Title[0] := Chr(WinWidth-2);

{ Scrive il titolo della finestra }
WriteStr((WinWidth-Length(Title)) Shr 1+1,1,Title,TitleAttr);

{ Disegna i bordi verticali della finestra }
For I := 2 to WinHeight-1 do

  Begin
  WriteChar(1,I,1,Frame[4],FrameAttr);
  WriteChar(WinWidth,I,1,Frame[5],FrameAttr);
  End;

{ Scrive l' angolo in basso a sinistra }
WriteChar(1,WinHeight,1,Frame[6],FrameAttr);

{ Scrive il bordo orizzontale basso della finestra }
WriteChar(2,WinHeight,WinWidth-2,Frame[7],FrameAttr);

{ Scrive l' angolo in basso a destra della finestra }
WriteChar(WinWidth,WinHeight,1,Frame[8],FrameAttr);

{ Aggiusta le coordinate della nuova finestra }
Inc(WindMin,$0101);
Dec(WindMax,$0101);

End; { FrameWin }


{----------------------------------------------------------------------------
  PROCEDURA: UNFRAME.WIN

  Cancella il bordo della finestra.
 ----------------------------------------------------------------------------}
Procedure UnFrameWin;
Begin { UnFrameWin }

{ Aggiusta le coordinate della nuova finestra }
Dec(WindMin, $0101);
Inc(WindMax, $0101);

End; { UnFrameWin }


{----------------------------------------------------------------------------
  PROCEDURA: ACTIVE.WINDOW

  Attiva una finestra disegnandone il bordo in un certo modo.
  Il tipo FRAMECHARS è una stringa che contiene i cartteri del bordo.
  Ci sono quattro tipi di bordi:

                      ┌────────┐       SingleHorFrame:  ╓────────╖
     SingleFrame:     │        │       DoubleVerFrame:  ║        ║
		      └────────┘                        ╙────────╜
                      ╔════════╗       DoubleHorFrame:  ╒════════╕
     DoubleFrame:     ║        ║       SingleVerFrame:  │        │
		      ╚════════╝                        ╘════════╛
 ----------------------------------------------------------------------------}
Procedure ActiveWindow (     Active: Boolean;
                         Var Frame:  FrameChars );
Begin { ActiveWindow }

{ Se esistono finestre ... }
If (TopWindow <> NIL)
  Then

    Begin

    { Cancella il bordo }
    UnFrameWin;

    { Ridisegnalo nel modo scelto }
    With TopWindow^ Do
      If Active Then
        FrameWin(Title^,Frame,TitleAttr,FrameAttr)

      Else
        FrameWin(Title^,SingleFrame,FrameAttr,FrameAttr);

    End;

End; { ActiveWindow }


{----------------------------------------------------------------------------
  PROCEDURA: OPEN.WINDOW

  Apre una finestra di coordinate (X1,Y1) per l' angolo in alto a sinistra
  e (X2,Y2) per quello in basso a destra. Il titolo è definito dalla
  variabile T; TATTR è il colore del titolo, mentre FATTR è il colore
  all' interno della finestra.
  I colori sono definiti come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
  Il tipo FRAMECHARS è una stringa che contiene i cartteri del bordo.
  Ci sono quattro tipi di bordi:

                      ┌────────┐       SingleHorFrame:  ╓────────╖
     SingleFrame:     │        │       DoubleVerFrame:  ║        ║
		      └────────┘                        ╙────────╜
                      ╔════════╗       DoubleHorFrame:  ╒════════╕
     DoubleFrame:     ║        ║       SingleVerFrame:  │        │
		      ╚════════╝                        ╘════════╛
 ----------------------------------------------------------------------------}
Procedure OpenWindow (     X1:    Byte;
                           Y1:    Byte;
		           X2:    Byte;
		           Y2:    Byte;
		           T:     TitleStr;
		           TAttr: Byte;
		           FAttr: Byte;
		       Var Frame: FrameChars );

{ Varibili locali }
Var
    { Puntatore al record informazioni di una finestra }
    W: WinRecPtr;

Begin { OpenWindow }

{ Disattiva la finestra corrente }
ActiveWindow(False,Frame);

{ Alloca un nuovo record nella lista }
New(W);  { Bytes }

{ Salva i valori scelti nel record }
With W^ Do

  Begin

  { Puntatore alla fine della lista (ultima finestra) }
  Next := TopWindow;

  { Coordinate della finestra }
  SaveWin(State);

  { Allocazione memoria per il titolo }
  GetMem(Title,Length(T)+1);
  Title^ := T;

  { Colori del titolo e del bordo }
  TitleAttr := TAttr;
  FrameAttr := FAttr;

  { Memorizza il tipo di bordo }
  WFrame := Frame;

  { Attiva la finestra specificata }
  Window(X1,Y1,X2,Y2);

  { Alloca la memoria per la zona da salvare }
  GetMem(Buffer,WinSize);

  { Salva la zona di schermo da ricoprire  con la finestra }
  ReadWin(Buffer^);

  { Disegna il bordo scelto }
  FrameWin(T,Frame,TAttr,FAttr);

  End;

{ Aggiusta il puntatore all' ultima finestra e il contatore delle finestre
  aperte }
TopWindow := W;
Inc(WindowCount);

End; { OpenWindow }


{----------------------------------------------------------------------------
  PROCEDURA: CLOSE.WINDOW

  Chiude la finestra corrente ripristinando il contenuto della zona di
  schermo precedente. Se è presente un' altra finestra questa viene
  resa attiva disegnando il bordo scelto alla sua apertura.
 ----------------------------------------------------------------------------}
Procedure CloseWindow;

{ Varibili locali }
Var
    { Puntatore al record informazioni di una finestra }
    W: WinRecPtr;

Begin { CloseWindow }

{ Se ci sono finestra aperte ... }
If (TopWindow <> NIL)
  Then

    Begin

    { Ultima finestra attiva }
    W := TopWindow;

    With W^ Do

      Begin

      { Cancella bordo }
      UnFrameWin;

      { Ripristina la zona di schermo }
      WriteWin(Buffer^);

      { Libera la memoria }
      FreeMem(Buffer,WinSize);
      FreeMem(Title,Length(Title^)+1);

      { Legge i dati della finestra precedente }
      RestoreWin(State);

      { Aggiusta il puntatore all' ultima finestra, tornando indietro
        di un record nella lista }
      TopWindow := Next;

      End;

    { Libera la memoria occupata dalla finestra }
    Dispose(W);   { Bytes }

    { Attiva la finestra precedente }
    ActiveWindow(True,W^.WFrame);

    { Decrementa il contatore delle finestra aperte }
    Dec(WindowCount);

    End;

End; { CloseWindow }


{----------------------------------------------------------------------------
  PROCEDURA: INITIALIZE.WINDOW

  Questa procedura deve essere eseguita prima di eseguira qualsiasi
  procedura di questa unit, in quanto inizializza i contatori e libera
  la memoria di partenza per i record delle finestre, ecc.
 ----------------------------------------------------------------------------}
Procedure InitializeWindow;
Begin { InitializeWindow }

{ Disabilita la pressione dei tasti CTRL-BREAK per interrompere l' esegu_
  zione dei programmi }
CheckBreak := False;

{ Controlla la modalità video corrente: se non è quella voluta dalla
  procedura, la cambia }
If ((LastMode <> CO80) And (LastMode <> BW80) And (LastMode <> Mono))
     Then
       TextMode(CO80);

{ Colore di default e finestra a tutto schermo }
TextAttr := LightGray;
Window(1,1,80,25);
ClrScr;

{ Nessuna finestra aperta }
TopWindow := NIL;
WindowCount := 0;

End; { InitializeWindow }


End. { TIPWin }
