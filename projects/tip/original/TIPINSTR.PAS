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
 ÷       VERSIONE 1.0                          UNIT TIPINSTR                ÷
 ÷                                                                          ÷
 ָֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ¼}
{ Data:   18 Febbraio 1993
  Ora:    16:18:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorInputString }

{ Unit che gestisce l' input da tastiera di una stringa. L' utente pu•
  editarla con l' utilizzo dei tasti Insert, Delete, Left, Right, Home,
  End, ecc.. La stringa compare nell' ultima riga dello schermo. }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Function  InputString ( StrInput:   String080;
			      InAttr:     Byte;
			      LungVirt:   Byte;
			      LungReale:  Byte;
			      Pezza:      String;
			      OutAttr:    Byte;
			      ArrowAttr:  Byte;
			      Allowed:    SetOfChar ): String; }


{ Nome della unit }
Unit
     TIPInStr;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPMenu }

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

     { Gestione dei menu a comparsa }
     TIPMenu;


{----------------------------------------------------------------------------
  FUNZIONE: INPUT.STRING

  Attende l' input da tastiera di una stringa. Se la stringa supera la
  lunghezza consentita, si potr… continuare a digitarla continuando a
  scrivere: il testo scorrer… verso destra e sar… possibile rivederlo
  premendo il tasto FRECCIA SINISTRA. Se si ha familiarit… con l' ambiente
  integrato (IDE) del Turbo Pascal versione 7.0 (o anche 6.0) si noter… la
  forte somiglianza.
  I parametri in input sono la stringa di richiesta di immissione
  (STRINPUT), il suo attributo di colore (INATTR), il numero di caratteri
  da visualizzare (LUNGVIRT) e quello da memorizzare (LUNGREALE, non oltre
  i 255 caratteri), la stringa che verr… stampata subito (PEZZA, per
  immissioni parziali), l' attributo video della stringa che verr… immessa
  (OUTATTR), l' attributo video dei caratteri freccia (ARROWATTR) e, per
  finire, i caratteri ammessi nell' immissione (ALLOWED).
  Le coordinate della stringa sono quelle della riga di stato, ossia
  quelle dell' ultima riga dello schermo (1,25).
  Vengono inoltre disegnate le due frecce ai lati, nel caso in cui la
  stringa fosse pi— lunga del testo visualizzato sul video.
  La funzione restituisce la stringa immessa e la stringa nulla nel caso
  in cui venga premuto il tasto ESCAPE.
  Il mouse non  operativo nell' editing.
 ----------------------------------------------------------------------------}
Function  InputString ( StrInput:   String080;
			InAttr:     Byte;
			LungVirt:   Byte;
			LungReale:  Byte;
			Pezza:      String;
			OutAttr:    Byte;
			ArrowAttr:  Byte;
			Allowed:    SetOfChar ): String;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPBase }


{----------------------------------------------------------------------------
  FUNZIONE: INPUT.STRING

  Attende l' input da tastiera di una stringa. Se la stringa supera la
  lunghezza consentita, si potr… continuare a digitarla continuando a
  scrivere: il testo scorrer… verso destra e sar… possibile rivederlo
  premendo il tasto FRECCIA SINISTRA. Se si ha familiarit… con l' ambiente
  integrato (IDE) del Turbo Pascal versione 7.0 (o anche 6.0) si noter… la
  forte somiglianza.
  I parametri in input sono la stringa di richiesta di immissione
  (STRINPUT), il suo attributo di colore (INATTR), il numero di caratteri
  da visualizzare (LUNGVIRT) e quello da memorizzare (LUNGREALE, non oltre
  i 255 caratteri), la stringa che verr… stampata subito (PEZZA, per
  immissioni parziali), l' attributo video della stringa che verr… immessa
  (OUTATTR), l' attributo video dei caratteri freccia (ARROWATTR) e, per
  finire, i caratteri ammessi nell' immissione (ALLOWED).
  Le coordinate della stringa sono quelle della riga di stato, ossia
  quelle dell' ultima riga dello schermo (1,25).
  Vengono inoltre disegnate le due frecce ai lati, nel caso in cui la
  stringa fosse pi— lunga del testo visualizzato sul video.
  La funzione restituisce la stringa immessa e la stringa nulla nel caso
  in cui venga premuto il tasto ESCAPE.
  Il mouse non  operativo nell' editing.
 ----------------------------------------------------------------------------}
Function  InputString ( StrInput:   String080;
			InAttr:     Byte;
			LungVirt:   Byte;
			LungReale:  Byte;
			Pezza:      String;
			OutAttr:    Byte;
			ArrowAttr:  Byte;
			Allowed:    SetOfChar ): String;

{ Variabili locali }
Var

    { Memorizza la stringa in input, che si digita da tastiera }
    St:           String;

    { Memorizza la posizione X della stringa da immettere }
    X:            Byte;

    { Cifra puntata dal cursore }
    Punt:         Integer;

    { Spiazzamento della parte visualizzata rispetto al resto della stringa }
    Spiazzamento: Integer;

    { Stato inserzione (cursore a forma di linea) o di sovrascritura (
      cursore a forma di blocco pieno) }
    Inserisci:    Boolean;

    { Indice per i cicli }
    I:            Byte;

    { Indice per i cicli }
    J:            Byte;

    { Tasto premuto dall' utente }
    Ch1:          Char;

    { Tasto esteso premuto dall' utente }
    Ch2:          Char;

    { Variabile di appoggio }
    XX:           Byte;

    { Vale TRUE quando  stato premuto il tasto RETURN o quello di ESCAPE }
    Done:         Boolean;

    { Variabile di appoggio di tipo stringa }
    St2:          String;


Begin { InputString }

{ Messaggio di richiesta per l' utente }
Info(StrInput,InAttr);

{ La stringa viene inizializzata con il contenuto di pezza }
St := Pezza;

{ La stringa viene riempita di caratteri ShadowChar }
j := Length(St)+1;
For i := j To LungReale Do
  St[i] := ShadowChar;
St[0] := Chr(LungReale);

{ Stampa della stringa iniziale }
x := Length(StrInput)+2;
WriteStr(x,25,Copy(St,1,LungVirt),OutAttr);

{ Inizializzazione delle variabili }
Punt := 1;
Spiazzamento := 1;
Inserisci := False;
Done := False;

{ Disegna il cursore come un blocco pieno ('Û') }
BlockCursor;

{ Per uscire da questo ciclo si possono premere i tasti ESCAPE e RETURN:
  nel primo caso la funzione restituir… una stringa nulla (''); nel
  secondo invece restiruir… la stringa digitata dall' utente }
Repeat

  { Calcolo della posizione della stringa sul video }
  xx := x+(Punt-Spiazzamento);

  { Aggiornamento della posizione del cursore se si trova al limite
    della parte evidenziata }
  If (Punt-Spiazzamento) = LungVirt Then
    Begin
    Dec(xx);
    If Spiazzamento+LungVirt < Lungreale Then
      Inc(Spiazzamento);
    WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);
    End;

  { Posizionamento del cursore nella giusta locazione }
  GoToXY(xx,25);

  { Scrittura, se necessario, della freccia verso sinistra (codice ASCII
    17) per indicare che a sinistra  presente altro testo }
  If Spiazzamento > 1 Then
    WriteChar(x-1,25,1,#17,ArrowAttr)
  Else
    WriteChar(x-1,25,1,' ',ArrowAttr);

  { Calcolo della lunghezzza reale della stringa }
  St2 := St;
  j := Length(St2);
  While St2[j] = ShadowChar Do
    Dec(j);
  St2[0] := Chr(j);

  { Scrittura, se necessario, della freccia verso destra (codice ASCII
    16) per indicare che a destra  presente altro testo }
  If Spiazzamento+LungVirt-1 < Length(St2) Then
    WriteChar(x+LungVirt,25,1,#16,ArrowAttr)
  Else
    WriteChar(x+LungVirt,25,1,' ',ArrowAttr);

  If Inserisci
    Then
      { Cursore a linea per l' inserzione }
      LineCursor
  Else
    { Cursore a blocco per la sovrascrittura }
    BlockCursor;

  { Attende la pressione di un tasto: il mouse  escluso }
  Repeat

    Attendi(Ch1,Ch2,SInputString);

  Until Not MousePressed;

  { A seconda del tasto premuto dall' utente }
  Case Ch1 Of

    { Tasto esteso ... }
    kNull: Case Ch2 Of

             { F1: aiuto generale }
	     kF1: Help('Help Generale',Altro);

             { Shift-F1: indice dell' aiuto }
	     kSF1: Help('Indice',Altro);

             { Alt-F1: schermata di aiuto precedente }
             kAF1: Help(LastHelp^[1],Precedente);

             { Ctrl-F1: help specifico }
             kCF1: Help('Immissione generica',Altro);

	     { Sinistra: sposta il cursore di una colonna verso sinistra }
	     kLeft: If Punt > 1 Then
		      Begin
		      Dec(Punt);

		      { Controllo del limite sinistro }
		      If Punt < Spiazzamento Then
			Begin
			Dec(Spiazzamento);
			WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),
				 OutAttr);
			End;

		      End;

	     { Destra: sposta il cursore verso destra di una colonna }
	     kRight: Begin

		     { Controllo del limite destro }
		     If Punt < LungReale Then
		       If (St[Punt+1] <> ShadowChar) Or
			  ((St[Punt+1] = ShadowChar) And
			  (St[Punt] <> ShadowChar))
			    Then

			      { Se c' ancora testo scorrilo verso destra }
			      Begin
			      Inc(Punt);
			      If Punt >= (LungVirt+Spiazzamento) Then
				Begin
				Inc(Spiazzamento);
				WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),
					 OutAttr);
				End;

			      End;

		     End;

	     { Home: sposta il cursore alla prima lettera digitata }
	     kHome: Begin

		    Punt := 1;
		    Spiazzamento := Punt;
		    WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);

		    End;

	     { End: sposta il cursore all' ultima lettera digitata }
	     kEnd: Begin

		   Punt := Length(St);
		   While St[Punt] = ShadowChar Do
		     Dec(Punt);
		   If Punt < LungReale Then
		     Inc(Punt);
		   Spiazzamento := Punt-LungVirt+1;
		   If Spiazzamento <= 0 Then
		     Spiazzamento := 1;
		   WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);

		   End;

	     { Insert: passa dal modo sovrascrittura (default) a quello
		       di inserimento }
	     kInsert: Begin

		      Inserisci := Not Inserisci;

		      { Cursore a linea per l' inserzione }
		      If Inserisci Then LineCursor

		      { Cursore a blocco per la sovrascrittura }
		      Else BlockCursor;

		      End;

	     { Cancel: cancella il carattere puntato dal cursore e sposta
		       il testo rimanente a sinistra di una posizione }
	     kCancel: Begin

		      Delete(St,Punt,1);
		      St := St+ShadowChar;
		      WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);

		      End;

	     End; { Case Ch2 }

    { Return: accetta la stringa ed esce }
    kReturn: Begin

	     Done := True;

	     { Calcolo della stringa reale, senza i caratteri ShadowChar }
	     j := Length(St);
	     While St[j] = ShadowChar Do
	       Dec(j);
	     St[0] := Chr(j);

	     End;

    { Escape: esce senza digitare nessuna stringa }
    kEscape: Begin

	     Done := True;
	     St := StrNull;

	     End;

    { Delete: cancella il carattere a sinistra del cursore e sposta il testo
	      rimanente verso sinistra }
    kDel: If Punt > 1 Then

	    Begin
	    Dec(Punt);
	    Delete(St,Punt,1);
	    St := St+ShadowChar;
	    If Spiazzamento > 1 Then
	      Dec(Spiazzamento);
	    WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);

	    End;

    { Qualsiasi altro tasto premuto }
    Else

      { Se  nell' insieme dei tasti permessi scrivilo }
      If Ch1 In Allowed Then

	Begin

	{ Il cursore si trova sull' ultima posizione: sovrascrive
	  l' ultimo carattere e resta fermo alla stesso punto }
	If Punt = LungReale Then

	  Begin
	  St[LungReale] := Ch1;
	  If Punt = LungVirt+Spiazzamento Then
	    Inc(Spiazzamento);
	  WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);
	  End

	{ Altrimenti aggiorna la stringa con il carattere digitato }
	Else

	  Begin

	  { Se l' inserzione  attiva inserisci il carattere }
	  If Inserisci Then

	    Begin
	    Delete(St,LungReale,1);
	    Insert(Ch1,St,Punt);
	    If Punt = LungVirt+Spiazzamento Then
	      Inc(Spiazzamento);
	    If Punt < LungReale Then
	      Inc(Punt);
	    WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);
	    End

	  { Altrimenti, se la sovrascrittura  attiva (ossia inserzione
	    non attiva) rimpiazza il carattere puntato con il nuovo
	    appena digitato }
	  Else

	    Begin
	    Delete(St,Punt,1);
	    Insert(Ch1,St,Punt);
	    If Punt = LungVirt+Spiazzamento Then
	      Inc(Spiazzamento);
	    If Punt < LungReale Then
	      Inc(Punt);
	    WriteStr(x,25,Copy(St,Spiazzamento,LungVirt),OutAttr);
	    End;

	  End;

	End;

    End; { Case Ch1 }

Until Done;

{ Restituisce la stringa immessa dall' utente }
InputString := St;

End; { InputString }


End. { TIPInStr }

