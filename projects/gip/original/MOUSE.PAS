{ֹֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ»
 ÷                                                                          ÷   
 ÷    שששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששש    ÷   
 ÷    שתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתÚִִִִִִ¿תתתתתתתתÚִִִִִִִִִִִִִ¿תתתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתת³±±±±±±³תתתתתתתת³²²²²²²²²²²²²²ְ¿תתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתְִ¿±±ÚִÙתתתתתתתתְִ¿²²Úִִִִִִ¿²²ְ¿תתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתתת³±±³תתתתתתתתתתתת³²²³תתתתתתֶ ²²³תתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתתת³±±³תתתתתתתתתתתת³²²ְִִִִִִÙ²²ÚÙתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתתת³±±³תתתתתתתתתתתת³²²²²²²²²²²²ÚÙתתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתתת³±±³תתתתתתתתתתתת³²²ÚִִִִִִִִÙתתתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתÚִÙ±±ְִ¿תתתתתתתתÚִÙ²²ְִ¿תתתתתתתתתתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתת³±±±±±±³תIMAGEתת³²²²²²²³תPROCESSORתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתְִִִִִִÙתתתתתתתתְִִִִִִÙתתתתתתתתתתתתתתתתתתתתתתתתתש    ÷   
 ÷    שתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתש    ÷   
 ÷    שששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששששש    ÷   
 ÷                                                                          ÷   
 ÷    FOCHI MICHELE                           UNIT MOUSE                    ÷
 ÷    VERSIONE 1.0                                                          ÷
 ÷                                                                          ÷
 ָֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ¼}
{ Data:   9 Aprile 1993
  Ora:    11:11:00
  Autore: Fochi Michele
  File:   Unit MouseInterfaceUnit }

{ Questa unit gestisce il mouse in modalit… grafica o testo.
  Il driver del mouse e l' eseguibile devono essere caricati prima
  di installarlo con la procedura InstallMouse presente in questo
  file.
  Anche se non testato,  previsto l' utilizzo della penna ottica,
  con le funzioni PenOn e PenOff. }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Procedure InstallMouse;

    - Procedure ShowMouse;

    - Procedure HideMouse;

    - Procedure GetMPos;

    - Procedure SetTMPos ( X: Integer;
                           Y: Integer );


    - Procedure SetGMPos ( X: Integer;
                           Y: Integer );

    - Procedure SetTHorRange ( XMin: Integer;
                               XMax: Integer );

    - Procedure SetTVertRange ( YMin: Integer;
                                YMax: Integer );

    - Procedure SetGHorRange ( XMin: Integer;
                               XMax: Integer );

    - Procedure SetGVertRange ( YMin: Integer;
                                YMax: Integer );

    - Procedure PenOn;

    - Procedure PenOff;

    - Procedure SetRatio ( X: Integer;
                           Y: Integer );

    - Procedure SetMSens ( HorSpeed: Integer;
                           VerSpeed: Integer );

    - Procedure GetMSens ( Var HorSpeed: Integer;
                           Var VerSpeed: Integer );

    - Procedure SetPage ( N: Integer );

    - Procedure GetPage ( Var N: Integer );

    - Procedure DisMDrv;

    - Procedure EnMDrv;

    - Procedure ResetM;

    - Procedure SetLang ( Language: Byte );

    - Procedure GetLang ( Var Language: Byte );

    - Procedure GetMInfo ( Var LoVer:       Byte;
                           Var HiVer:       Byte;
                           Var Interfaccia: Byte;
                           Var IRQNum:      Byte );

    - Function  MouseInT ( XMin: Integer;
                           YMin: Integer;
		           XMax: Integer;
		           YMax: Integer ): Boolean;

    - Function  MouseInG ( XMin: Integer;
                           YMin: Integer;
		           XMax: Integer;
		           YMax: Integer ): Boolean;

    - Procedure NewMouseCursor ( Cursor: GraphicCursor ); }


{ Nome della unit }
Unit
     Mouse;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { Mouse }

{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalit… testo }
     Crt,

     { Gestione del disco, memoria, chiamate di sistema, ... }
     Dos;

{ Tipi di dati globali }
Type

     { Definisce la maschera del puntatore del mouse }
     GraphicCursor= Record
		      ScreenMask: Array [0..15] Of
		                    Word;
		      CursorMask: Array [0..15] Of
		                    Word;
		      HotX:       Integer;
		      HotY:       Integer;
		      End;

{ Variabili globali }
Var

    { Variabile registro per le chiamate agli interrupts del DOS/BIOS }
    Regs:         Registers;

    { Vale TRUE se il mouse  installato correttamente, e quindi
      disponibile al suo utilizzo; vale FALSE se si  verificato
      un qualsiasi errore }
    MouseOk:      Boolean;

    { Vale TRUE se un qualsiasi pulsante del mouse (o anche pi— di uno) 
      stato premuto }
    MousePressed: Boolean;

    { Vale TRUE se  stato premuto il pulsante sinistro del mouse, FALSE
      se  rilasciato }
    LeftButton:   Boolean;

    { Vale TRUE se  stato premuto il pulsante centrale del mouse (se
      disponibile), FALSE se  rilasciato }
    MiddleButton: Boolean;

    { Vale TRUE se  stato premuto il pulsante destro del mouse, FALSE
      se  rilasciato }
    RightButton:  Boolean;

    { Memorizza la coordinata grafica X in pixels del mouse }
    MouseX:       Integer;

    { Memorizza la coordinata grafica Y in pixels del mouse }
    MouseY:       Integer;

    { Memorizza la coordinata in modalit… testo X in caratteri del mouse }
    MouseTextX:   Integer;

    { Memorizza la coordinata in modalit… testo Y in caratteri del mouse }
    MouseTextY:   Integer;

    { Maschera di definizione del cursore in modalit… grafica }
    Cursor:       GraphicCursor;

    { Se l' ultima procedura o funzione chiamata si  conclusa con un
      errore, viene settata a TRUE questa variabile; altrimenti vale
      FALSE }
    MouseError:   Boolean;

(*    { Se vale TRUE l' orologio viene aggiornato, altrimenti no }
    Orologio:        Boolean;*)


{----------------------------------------------------------------------------
  PROCEDURA: INSTALL.MOUSE

  Se il mouse  presente (HardWare) e il driver per tale dispositivo 
  stato caricato (SoftWare), questa procedura disegna sullo schermo
  il mouse (una freccia se in modalit… grafica o un blocco ('Û') se in
  modalit… testo. La variabile globale MOUSEOK riporta il successo
  dell' operazione.
  NOTA: Per controllare se la procedura chiamata (qualsiasi procedura o
  funzione di questa unit) ha avuto esito positivo o negativo, basta
  testare il valore della variabile MOUSEERROR.
 ----------------------------------------------------------------------------}
Procedure InstallMouse;


{----------------------------------------------------------------------------
  PROCEDURA: SHOW.MOUSE

  Se il video  in modalit… grafica apparir… una freccia, se  in
  modalit… testo apparir… un blocco pieno ('Û').
 ----------------------------------------------------------------------------}
Procedure ShowMouse;


{----------------------------------------------------------------------------
  PROCEDURA: HIDE.MOUSE

  Permette di nascondere il puntatore del mouse, senza visualizzarlo
  sul video. Questo  molto utile quando occorre scrivere proprio
  dove si trova tale puntatore: infatti, se si tenta l' operazione
  senza prima nasconderlo, non si otterr… nessun risultato.
  UNA COSA MOLTO IMPORTANTE: Ad ogni HideMouse corrisponde una
                             ShowMouse, per cui se lo nascondiamo
                             per due volte di seguito (senza prima
                             ri-visualizzarlo) occorre chiamare
                             due volte anche la procedura ShoMouse.
 ----------------------------------------------------------------------------}
Procedure HideMouse;


{----------------------------------------------------------------------------
  PROCEDURA: GET.M.POS

  Alla chiamata di questa procedura vengono settate le seguenti
  variabili al valore letto in quell' stante:

  - LeftButton
  - MiddleButton
  - RightButton
  - MouseX
  - MouseY
  - MouseTextX
  - MouseTextY
  - MousePressed

  Quindi, prima si scrivere una riga del tipo

    If MousePressed Then ....

  occorre eseguire 'GetMPos' per aggiornare le variabili appena
  elencate.
 ----------------------------------------------------------------------------}
Procedure GetMPos;


{----------------------------------------------------------------------------
  PROCEDURA: SET.T.M.POS

  Posizione il puntatore del mouse alla posizione X,Y dello schermo
  (solo in modalit… testo).
 ----------------------------------------------------------------------------}
Procedure SetTMPos ( X: Integer;
                     Y: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: SET.G.M.POS

  Posizione il puntatore del mouse alla posizione X,Y dello schermo
  (solo in modalit… grafica).
 ----------------------------------------------------------------------------}
Procedure SetGMPos ( X: Integer;
                     Y: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: SET.T.HOR.RANGE

  Definisce l' ampiezza di spostamento del mouse in orizzontale (solo
  in modalit… testo). Definendo questa, occorre anche definire quella
  verticale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetTHorRange ( XMin: Integer;
                         XMax: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: SET.T.VERT.RANGE

  Definisce l' ampiezza di spostamento del mouse in verticale (solo
  in modalit… testo). Definendo questa, occorre anche definire quella
  orizzontale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetTVertRange ( YMin: Integer;
                          YMax: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: SET.G.HOR.RANGE

  Definisce l' ampiezza di spostamento del mouse in orizzontale (solo
  in modalit… grafica). Definendo questa, occorre anche definire quella
  verticale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetGHorRange ( XMin: Integer;
                         XMax: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: SET.G.VERT.RANGE

  Definisce l' ampiezza di spostamento del mouse in verticale (solo
  in modalit… grafica). Definendo questa, occorre anche definire quella
  orizzontale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetGVertRange ( YMin: Integer;
                          YMax: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: PEN.ON

  Abilita l' emulazione della penna ottica.
 ----------------------------------------------------------------------------}
Procedure PenOn;


{----------------------------------------------------------------------------
  PROCEDURA: PEN.OFF

  Disabilita l' emulazione della penna ottica.
 ----------------------------------------------------------------------------}
Procedure PenOff;


{----------------------------------------------------------------------------
  PROCEDURA: SET.RATIO

  Sceglie la velocit… di movimento del mouse, indipendentemente per le
  direzioni su-gi— (Y) e destra-sinistra (X), definita in N Mickey ogni
  8 pixels, dove N vale X o Y.
  Per valori piccoli il puntatore del mouse  molto veloce.
 ----------------------------------------------------------------------------}
Procedure SetRatio ( X: Integer;
                     Y: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: SET.M.SENS

  Definisce la sensitivit… del mouse.
 ----------------------------------------------------------------------------}
Procedure SetMSens ( HorSpeed: Integer;
                     VerSpeed: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: GET.M.SENS

  Ritorna la sensitivit… del mouse.
 ----------------------------------------------------------------------------}
Procedure GetMSens ( Var HorSpeed: Integer;
                     Var VerSpeed: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: SET.PAGE

  Attiva il mouse nella pagina video numero N.
 ----------------------------------------------------------------------------}
Procedure SetPage ( N: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: GET.PAGE

  Ritorna il numero di pagina N dove il mouse  stato attivato.
 ----------------------------------------------------------------------------}
Procedure GetPage ( Var N: Integer );


{----------------------------------------------------------------------------
  PROCEDURA: DIS.M.DRV

  Disabilita il driver software del mouse, ripristinando il vettori degli
  interrupts per il 10H e il 71H (nel caso la CPU sia un 8086) o 74H
  (nel caso in cui la CPU sia un 80286 o 80386).
 ----------------------------------------------------------------------------}
Procedure DisMDrv;


{----------------------------------------------------------------------------
  PROCEDURA: EN.M.DRV

  Abilita il driver software del mouse, ripristinando i vettori
  rimossi con la chiamata alla procedura DISMDRV.
 ----------------------------------------------------------------------------}
Procedure EnMDrv;


{----------------------------------------------------------------------------
  PROCEDURA: RESET.M

  Inizializza il mouse ai valori di default:  identica alla procedura
  INSTALLMOUSE ma non lo resetta.
 ----------------------------------------------------------------------------}
Procedure ResetM;


{----------------------------------------------------------------------------
  PROCEDURA: SET.LANG

  Sceglie il linguaggio del mouse. LANGUAGE pu• assumere i seguenti valori:

    0  per  ENGLISH
    1  per  FRENCH
    2  per  DUTCH
    3  per  GERMAN
    4  per  SWEDISH
    5  per  FINNISH
    6  per  SPANISH
    7  per  PORTUGUESE
    8  per  ITALIAN

  Tutti gli altri valori verranno ignorati.
 ----------------------------------------------------------------------------}
Procedure SetLang ( Language: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: GET.LANG

  Ritorna il linguaggio del mouse. LANGUAGE pu• assumere i seguenti valori:

    0  per  ENGLISH
    1  per  FRENCH
    2  per  DUTCH
    3  per  GERMAN
    4  per  SWEDISH
    5  per  FINNISH
    6  per  SPANISH
    7  per  PORTUGUESE
    8  per  ITALIAN
    9  per  <Sconosciuta>
 ----------------------------------------------------------------------------}
Procedure GetLang ( Var Language: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: GET.M.INFO

  Restituisce le informazioni del mouse e del driver caricato.
  LOVER e HIVER sono la versione del driver del mouse (es. se LOVER vale 3 e
  HIVER vale 0, la versione  3.0); Interfaccia assume i seguenti valori:

       1  per  BUS
       2  per  Seriale
       3  per  Microsoft InPort
       4  per  IBM PS/2 Pointing Device Port
       5  per  Hawlett-Packard Mouse

  IRQNUM vale:

       0  per  IRQ PS/2 Pointing Device
       1  per  IRQ <Sconosciuto>
       2  per  IRQ numero 2
       .  .    .
       .  .    .
       .  .    .
       7  per  IRQ numero 7
 ----------------------------------------------------------------------------}
Procedure GetMInfo ( Var LoVer:       Byte;
                     Var HiVer:       Byte;
                     Var Interfaccia: Byte;
                     Var IRQNum:      Byte );


{----------------------------------------------------------------------------
  FUNZIONE: MOUSE.IN.T

  Restituisce TRUE se il mouse si trova nell' area delimitata da (X1,Y1) e
  da (X2,Y2) ed  stato premuto un qualsiasi pulsante.
  Questo solo in modalit… testo.
 ----------------------------------------------------------------------------}
Function  MouseInT ( XMin: Integer;
                     YMin: Integer;
		     XMax: Integer;
		     YMax: Integer ): Boolean;


{----------------------------------------------------------------------------
  FUNZIONE: MOUSE.IN.G

  Restituisce TRUE se il mouse si trova nell' area delimitata da (X1,Y1) e
  da (X2,Y2) ed  stato premuto un qualsiasi pulsante.
  Questo solo in modalit… grafica.
 ----------------------------------------------------------------------------}
Function  MouseInG ( XMin: Integer;
                     YMin: Integer;
		     XMax: Integer;
		     YMax: Integer ): Boolean;


{----------------------------------------------------------------------------
  PROCEDURA: NEW.MOUSE.CURSOR

  Cambia la forma del cursore in modalit… grafica.
 ----------------------------------------------------------------------------}
Procedure NewMouseCursor ( Cursor: GraphicCursor );


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { Mouse }


{----------------------------------------------------------------------------
  PROCEDURA: INSTALL.MOUSE

  Se il mouse  presente (HardWare) e il driver per tale dispositivo 
  stato caricato (SoftWare), questa procedura disegna sullo schermo
  il mouse (una freccia se in modalit… grafica o un blocco ('Û') se in
  modalit… testo. La variabile globale MOUSEOK riporta il successo
  dell' operazione, oltre a MOUSEERROR, sempre disponibile.
 ----------------------------------------------------------------------------}
Procedure InstallMouse;

Begin { InstallMouse }

Regs.AX  := $00;
Intr($33,Regs);

If (Regs.AX = $FFFF)
  Then
    Begin
    MouseOk := True;
    MouseError := False;
    End

Else

  Begin
  MouseOk := False;
  MouseError := True;
  End;

End; { InstallMouse }


{----------------------------------------------------------------------------
  PROCEDURA: SHOW.MOUSE

  Se il video  in modalit… grafica apparir… una freccia, se  in
  modalit… testo apparir… un blocco pieno ('Û').
 ----------------------------------------------------------------------------}
Procedure ShowMouse;

Begin { ShowMouse }

If MouseOk
  Then

    Begin
    (*Orologio := False;*)
    Regs.AX := $01;
    Intr($33,Regs);
    MouseError := False;
    (*Orologio := True;*)
    End

Else

  MouseError := True;

End; { ShowMouse }


{----------------------------------------------------------------------------
  PROCEDURA: HIDE.MOUSE

  Permette di nascondere il puntatore del mouse, senza visualizzarlo
  sul video. Questo  molto utile quando occorre scrivere proprio
  dove si trova tale puntatore: infatti, se si tenta l' operazione
  senza prima nasconderlo, non si otterr… nessun risultato.
  UNA COSA MOLTO IMPORTANTE: Ad ogni HideMouse corrisponde una
                             ShowMouse, per cui se lo nascondiamo
                             per due volte di seguito (senza prima
                             ri-visualizzarlo) occorre chiamare
                             due volte anche la procedura ShoMouse.
 ----------------------------------------------------------------------------}
Procedure HideMouse;

Begin { HideMouse }

If MouseOk
  Then

    Begin
    (*Orologio := False;*)
    Regs.AX := $02;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { HideMouse }


{----------------------------------------------------------------------------
  PROCEDURA: GET.M.POS

  Alla chiamata di questa procedura vengono settate le seguenti
  variabili al valore letto in quell' stante:

  - LeftButton
  - MiddleButton
  - RightButton
  - MouseX
  - MouseY
  - MouseTextX
  - MouseTextY
  - MousePressed

  Quindi, prima si scrivere una riga del tipo

    If MousePressed Then ....

  occorre eseguire 'GetMPos' per aggiornare le variabili appena
  elencate.
 ----------------------------------------------------------------------------}
Procedure GetMPos;

Begin { GetMPos }

If MouseOk
  Then

    Begin
    Regs.AX := $03;
    Intr($33,Regs);

    If ((Regs.BX And $1) > 0)
      Then
        LeftButton := True
    Else
      LeftButton := False;

    If ((Regs.BX And $2) > 0)
      Then
        RightButton := True
    Else
      RightButton := False;

    If ((Regs.BX And $4) > 0)
      Then
        MiddleButton := True
    Else
      MiddleButton := False;

    MousePressed := (((Regs.BX And $1) > 0) Or ((Regs.BX And $2) > 0) Or
                     ((Regs.BX And $4) > 0)) And MouseOk;
    MouseX := Regs.CX;
    MouseY := Regs.DX;
    MouseTextX := (Regs.CX Div 8)+1;
    MouseTextY := (Regs.DX Div 8)+1;
    MouseError := False;

    End

Else

  Begin
  MousePressed := False;
  LeftButton := False;
  MiddleButton := False;
  RightButton := False;
  MouseError := True;
  End;

End; { GetMPos }


{----------------------------------------------------------------------------
  PROCEDURA: SET.T.M.POS

  Posizione il puntatore del mouse alla posizione X,Y dello schermo
  (solo in modalit… testo).
 ----------------------------------------------------------------------------}
Procedure SetTMPos ( X: Integer;
                     Y: Integer );

Begin { SetTMPos }

If MouseOk
  Then

    Begin
    Regs.AX := $04;
    Regs.CX := Abs(X*8-1);
    Regs.DX := Abs(Y*8-1);
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetTMPos }


{----------------------------------------------------------------------------
  PROCEDURA: SET.G.M.POS

  Posizione il puntatore del mouse alla posizione X,Y dello schermo
  (solo in modalit… grafica).
 ----------------------------------------------------------------------------}
Procedure SetGMPos ( X: Integer;
                     Y: Integer );

Begin { SetGMPos }

If MouseOk
  Then

    Begin
    Regs.AX := $04;
    Regs.CX := Abs(X);
    Regs.DX := Abs(Y);
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetGMPos }


{----------------------------------------------------------------------------
  PROCEDURA: SET.T.HOR.RANGE

  Definisce l' ampiezza di spostamento del mouse in orizzontale (solo
  in modalit… testo). Definendo questa, occorre anche definire quella
  verticale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetTHorRange ( XMin: Integer;
                         XMax: Integer );

Begin { SetTHorRange }

If MouseOk
  Then

    Begin
    Regs.AX := $07;
    Regs.CX := Abs(XMin);
    Regs.DX := Abs(XMax);
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetTHorRange }


{----------------------------------------------------------------------------
  PROCEDURA: SET.T.VERT.RANGE

  Definisce l' ampiezza di spostamento del mouse in verticale (solo
  in modalit… testo). Definendo questa, occorre anche definire quella
  orizzontale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetTVertRange ( YMin: Integer;
                          YMax: Integer );

Begin { SetTVertRange }

If MouseOk
  Then

    Begin
    Regs.AX := $08;
    Regs.CX := Abs(YMin*8-1);
    Regs.DX := Abs(YMax*8-1);
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetTVertRange }


{----------------------------------------------------------------------------
  PROCEDURA: SET.G.HOR.RANGE

  Definisce l' ampiezza di spostamento del mouse in orizzontale (solo
  in modalit… grafica). Definendo questa, occorre anche definire quella
  verticale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetGHorRange ( XMin: Integer;
                         XMax: Integer );

Begin { SetGHorRange }

If MouseOk
  Then

    Begin
    Regs.AX := $07;
    Regs.CX := Abs(XMin);
    Regs.DX := Abs(XMax);
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetGHorRange }


{----------------------------------------------------------------------------
  PROCEDURA: SET.G.VERT.RANGE

  Definisce l' ampiezza di spostamento del mouse in verticale (solo
  in modalit… grafica). Definendo questa, occorre anche definire quella
  orizzontale, altrimenti verr… considerara 1.
 ----------------------------------------------------------------------------}
Procedure SetGVertRange ( YMin: Integer;
                          YMax: Integer );

Begin { SetGVertRange }

If MouseOk
  Then

    Begin
    Regs.AX := $08;
    Regs.CX := Abs(YMin);
    Regs.DX := Abs(YMax);
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetGVertRange }


{----------------------------------------------------------------------------
  PROCEDURA: PEN.ON

  Abilita l' emulazione della penna ottica.
 ----------------------------------------------------------------------------}
Procedure PenOn;

Begin { PenOn }

If MouseOk
  Then

    Begin
    Regs.AX := $0D;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { PenOn }


{----------------------------------------------------------------------------
  PROCEDURA: PEN.OFF

  Disabilita l' emulazione della penna ottica.
 ----------------------------------------------------------------------------}
Procedure PenOff;

Begin { PenOff }

If MouseOk
  Then

    Begin
    Regs.AX := $0E;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { PenOff }


{----------------------------------------------------------------------------
  PROCEDURA: SET.RATIO

  Sceglie la velocit… di movimento del mouse, indipendentemente per le
  direzioni su-gi— (Y) e destra-sinistra (X), definita in N Mickey ogni
  8 pixels, dove N vale X o Y.
  Per valori piccoli il puntatore del mouse  molto veloce.
 ----------------------------------------------------------------------------}
Procedure SetRatio ( X: Integer;
                     Y: Integer );

Begin { SetRatio }

If MouseOk
  Then

    Begin
    Regs.AX := $0F;
    Regs.CX := X;
    Regs.DX := Y;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetRatio }


{----------------------------------------------------------------------------
  PROCEDURA: SET.M.SENS

  Definisce la sensitivit… del mouse.
 ----------------------------------------------------------------------------}
Procedure SetMSens ( HorSpeed: Integer;
                     VerSpeed: Integer );

Begin { SetMSens }

If MouseOk
  Then

    Begin
    Regs.AX := $1B;
    Regs.BX := HorSpeed;
    Regs.CX := VerSpeed;
    Regs.DX := $0000;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetMSens }


{----------------------------------------------------------------------------
  PROCEDURA: GET.M.SENS

  Ritorna la sensitivit… del mouse.
 ----------------------------------------------------------------------------}
Procedure GetMSens ( Var HorSpeed: Integer;
                     Var VerSpeed: Integer );

Begin { GetMSens }

If MouseOk
  Then

    Begin
    Regs.AX := $1B;
    Intr($33,Regs);
    HorSpeed := Regs.BX;
    VerSpeed := Regs.CX;
    MouseError := False;
    End

Else

  MouseError := True;

End; { GetMSens }


{----------------------------------------------------------------------------
  PROCEDURA: SET.PAGE

  Attiva il mouse nella pagina video numero N.
 ----------------------------------------------------------------------------}
Procedure SetPage ( N: Integer );

Begin { SetPage }

If MouseOk
  Then

    Begin
    Regs.AX := $1D;
    Regs.BX := N;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetPage }


{----------------------------------------------------------------------------
  PROCEDURA: GET.PAGE

  Ritorna il numero di pagina N dove il mouse  stato attivato.
 ----------------------------------------------------------------------------}
Procedure GetPage ( Var N: Integer );

Begin { GetPage }

If MouseOk
  Then

    Begin
    Regs.AX := $1E;
    Intr($33,Regs);
    N := Regs.BX;
    MouseError := False;
    End

Else

  MouseError := True;

End; { GetPage }



{----------------------------------------------------------------------------
  PROCEDURA: DIS.M.DRV

  Disabilita il driver software del mouse, ripristinando il vettori degli
  interrupts per il 10H e il 71H (nel caso la CPU sia un 8086) o 74H
  (nel caso in cui la CPU sia un 80286 o 80386).
 ----------------------------------------------------------------------------}
Procedure DisMDrv;

Begin { DisMDrv }

If MouseOk
  Then

    Begin
    Regs.AX := $1F;
    Intr($33,Regs);

    If (Regs.AX = $001F)
      Then
        MouseError := False
    Else

      If (Regs.AX = $FFFF)
        Then
          MouseError := True;

    End

Else

  MouseError := False;

End; { DisMDrv }


{----------------------------------------------------------------------------
  PROCEDURA: EN.M.DRV

  Abilita il driver software del mouse, ripristinando i vettori
  rimossi con la chiamata alla procedura DISMDRV.
 ----------------------------------------------------------------------------}
Procedure EnMDrv;

Begin { EnMDrv }

If MouseOk
  Then

    Begin
    Regs.AX := $20;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { EnMDrv }


{----------------------------------------------------------------------------
  PROCEDURA: RESET.M

  Inizializza il mouse ai valori di default:  identica alla procedura
  INSTALLMOUSE ma non lo resetta.
 ----------------------------------------------------------------------------}
Procedure ResetM;

Begin { ResetM }

If MouseOk
  Then

    Begin
    Regs.AX := $21;
    Intr($33,Regs);

    If (Regs.AX = $0021)
      Then
        MouseError := True
    Else

      If ((Regs.AX = $FFFF) Or (Regs.BX = $0002))
        Then
          MouseError := False;
    End

Else

  MouseError := False;

End; { ResetM }


{----------------------------------------------------------------------------
  PROCEDURA: SET.LANG

  Sceglie il linguaggio del mouse. LANGUAGE pu• assumere i seguenti valori:

    0  per  ENGLISH
    1  per  FRENCH
    2  per  DUTCH
    3  per  GERMAN
    4  per  SWEDISH
    5  per  FINNISH
    6  per  SPANISH
    7  per  PORTUGUESE
    8  per  ITALIAN

  Tutti gli altri valori verranno ignorati.
 ----------------------------------------------------------------------------}
Procedure SetLang ( Language: Byte );

Begin { SetMouseLanguage }

If MouseOk
  Then

    Begin
    Regs.AX := $22;
    Regs.BX := Language;
    Intr($33,Regs);
    MouseError := False;
    End

Else

  MouseError := True;

End; { SetLang }


{----------------------------------------------------------------------------
  PROCEDURA: GET.LANG

  Ritorna il linguaggio del mouse. LANGUAGE pu• assumere i seguenti valori:

    0  per  ENGLISH
    1  per  FRENCH
    2  per  DUTCH
    3  per  GERMAN
    4  per  SWEDISH
    5  per  FINNISH
    6  per  SPANISH
    7  per  PORTUGUESE
    8  per  ITALIAN
    9  per  <Sconosciuto>
 ----------------------------------------------------------------------------}
Procedure GetLang ( Var Language: Byte );

Begin { GetLang }

If MouseOk
  Then

    Begin
    Regs.AX := $23;
    Intr($33,Regs);

    If (Regs.BX In [0..8])
      Then
        Language := Regs.BX
    Else
      Language := 9;

    MouseError := False;
    End

Else

  MouseError := True;

End; { GetLang }


{----------------------------------------------------------------------------
  PROCEDURA: GET.M.INFO

  Restituisce le informazioni del mouse e del driver caricato.
  LOVER e HIVER sono la versione del driver del mouse (es. se LOVER vale 3 e
  HIVER vale 0, la versione  3.0); Interfaccia assume i seguenti valori:

       1  per  BUS
       2  per  Seriale
       3  per  Microsoft InPort
       4  per  IBM PS/2 Pointing Device Port
       5  per  Hawlett-Packard Mouse

  IRQNUM vale:

       0  per  IRQ PS/2 Pointing Device
       1  per  IRQ <Sconosciuto>
       2  per  IRQ numero 2
       .  .    .
       .  .    .
       .  .    .
       7  per  IRQ numero 7
 ----------------------------------------------------------------------------}
Procedure GetMInfo ( Var LoVer:       Byte;
                     Var HiVer:       Byte;
                     Var Interfaccia: Byte;
                     Var IRQNum:      Byte );

Begin { GetMInfo }

If MouseOk
  Then

    Begin
    Regs.AX := $24;
    Intr($33,Regs);

    If (Regs.AX = $FFFF)
      Then
        MouseError := True

    Else

      Begin
      LoVer := Regs.BH;
      HiVer := Regs.BL;
      Interfaccia := Regs.CH;
      IRQNum := Regs.CL;
      MouseError := False;
      End;

    End

Else

  MouseError := True;

End; { GetMInfo }


{----------------------------------------------------------------------------
  FUNZIONE: MOUSE.IN.T

  Restituisce TRUE se il mouse si trova nell' area delimitata da (X1,Y1) e
  da (X2,Y2) ed  stato premuto un qualsiasi pulsante.
  Questo solo in modalit… testo.
 ----------------------------------------------------------------------------}
Function  MouseInT ( XMin: Integer;
                     YMin: Integer;
		     XMax: Integer;
		     YMax: Integer ): Boolean;

Begin { MouseInT }

If MouseOk
  Then

    Begin
    GetMPos;
    MouseInT := (MouseTextX >= XMin) And (MouseTextY >= YMin) And
	        (MouseTextX <= XMax) And (MouseTextY <= YMax) And
                 MousePressed;
    End

Else

  Begin
  MouseInT := False;
  MouseError := True;
  End;

End; { MouseInT }


{----------------------------------------------------------------------------
  FUNZIONE: MOUSE.IN.G

  Restituisce TRUE se il mouse si trova nell' area delimitata da (X1,Y1) e
  da (X2,Y2) ed  stato premuto un qualsiasi pulsante.
  Questo solo in modalit… grafica.
 ----------------------------------------------------------------------------}
Function  MouseInG ( XMin: Integer;
                     YMin: Integer;
		     XMax: Integer;
		     YMax: Integer ): Boolean;
Begin { MouseInG }

If MouseOk
  Then

    Begin
    MouseInG := (MouseX >= XMin) And (MouseY >= YMin) And
	        (MouseX <= XMax) And (MouseY <= YMax) And
                 MousePressed;
    End

Else

  Begin
  MouseInG := False;
  MouseError := True;
  End;

End; { MouseInG }


{----------------------------------------------------------------------------
  PROCEDURA: NEW.MOUSE.CURSOR

  Cambia la forma del cursore in modalit… grafica.
 ----------------------------------------------------------------------------}
Procedure NewMouseCursor ( Cursor: GraphicCursor );

{ Variabili locali }
Var
    { Puntatore alla variabile Cursor di tipo GraphicCursor }
    P: Pointer;

Begin { NewMouseCursor }

If MouseOk
  Then

    Begin
    Regs.AX := 9;
    Regs.BX := Cursor.HotX;
    Regs.CX := Cursor.HotY;
    P := Addr(Cursor.ScreenMask);
    Regs.DX := Ofs(P^);
    Regs.ES := Seg(P^);
    Intr($33,Regs);
    End

Else

  MouseError := True;

End; { NewMouseCursor }


Begin { Mouse }

{ Inizializza le variabili MOUSEOK, MOUSEPRESSED e MOUSEERROR }
MouseOk := False;
MousePressed := False;
MouseError := True;
LeftButton := False;
RightButton := False;
MiddleButton := False;

End. { Mouse }
