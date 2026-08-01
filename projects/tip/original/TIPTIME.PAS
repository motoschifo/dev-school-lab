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
 º       VERSIONE 1.0                          UNIT TIPTIME                 º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}
{ Data:   14 Marzo 1993
  Ora:    19:00:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorFastCRT }

{ Gestisce la scrittura dell' ora nella linea di stato e dei tasti
  speciali (LeftShift, RightShift, Alt, Ctrl, NumLock, ScrollLock,
  CapsLock, Insert). Questo Š fatto con l' aggancio di due routines
  particolari agli interrupt 1Ch (timer software) e 09h (tastiera). }

{ Elenco delle procedure e funzioni definite in questa unit:

    - Procedure NoTime;

    - Procedure Time1; Interrupt;

    - Procedure Time2; Interrupt; }


{ Nome della unit }
Unit
     TIPTime;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPTime }

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

     { Procedure di inizializzazione del programma }
     TIPInit;


{----------------------------------------------------------------------------
  PROCEDURA: NO.TIME

  Ripristina gli indirizzi memorizzati nella RAM degli interrupt 1Ch e
  09h, modificati all' inizio del programma.
 ----------------------------------------------------------------------------}
Procedure NoTime;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPTime }


{----------------------------------------------------------------------------
  PROCEDURA: TIME.1

  Questa procedura Š collegata all' interrupt 09h (tastiera) e visualizza,
  nella riga di stato, i settaggi di CapsLock, ScrollLock, NumLock ed
  Insert.
  Gli stati dei tasti speciali sono prelevate dall' indirizzo di memoria
  0000h:0417h (Byte).
 ----------------------------------------------------------------------------}
Procedure Time1; Interrupt;

{ Variabili locali }
Var

    { Byte che contiene gli stati dei tasti speciali }
    SpecialByte: Byte;

Begin { Time1 }

{ Se occorre scriverli ... }
If AggiornaStatusLine
  Then
    Begin

    { Lettura del byte specifico (tasti) }
    SpecialByte := Mem[$0000:$0417];

    { NumLock - 'N' }
    If (SpecialByte And $20) > 0
      Then
        Mem[Segmento:3964] := 078
    Else
      Mem[Segmento:3964] := 032;
    Mem[Segmento:3965] := Color.StatusSel;

    { ScrollLock - 'S' }
    If (SpecialByte And $10) > 0
      Then
        Mem[Segmento:3966] := 083
    Else
      Mem[Segmento:3966] := 032;
    Mem[Segmento:3967] := Color.StatusSel;

    { CapsLock - 'C' }
    If (SpecialByte And $40) > 0
      Then
        Mem[Segmento:3968] := 067
    Else
      Mem[Segmento:3968] := 032;
    Mem[Segmento:3969] := Color.StatusSel;

    { Insert - 'I' }
    If Image^[NumPgVideo].InsState
      Then
        Mem[Segmento:3970] := 073
    Else
      Mem[Segmento:3970] := 032;
    Mem[Segmento:3971] := Color.StatusSel;

    End;

{ Allacciamento alla procedura originale }
InLine($9C);
Time1Proc;

End; { Time1 }


{----------------------------------------------------------------------------
  PROCEDURA: TIME.2

  Questa procedura Š collegata all' interrupt 1Ch (timer) e visualizza,
  nella riga di stato, l' ora e i minuti (con i secondi che fanno
  lampeggiare i due punti - ":" ) e settaggi di LeftShift, RightShift,
  Ctrl, Alt.
  L' ora Š prelevata dalla locazione di memoria 0000h:046Ch (LongInt),
  mentre gli stati dei tasti speciali sono prelevate dall' indirizzo di
  memoria 0000h:0417h (Byte).
 ----------------------------------------------------------------------------}
Procedure Time2; Interrupt;

{ Variabili locali }
Var

    { Byte che contiene gli stati dei tasti speciali }
    SpecialByte: Byte;

    { LongInt che contiene l' ora, i minuti, i secondi, ecc. }
    Count:       LongInt;

    { Ora }
    Hour:        Byte;

    { Minuti }
    Minute:      Byte;

    { Secondi }
    Second:      Byte;

    { Resto }
    Remainder:   LongInt;

Begin { Time2 }

{ Se occorre scriverli ... }
If AggiornaStatusLine
  Then
    Begin

    { Lettura del byte specifico (tasti) }
    SpecialByte := Mem[$0000:$0417];

    { LeftShift - '<-' }
    If (SpecialByte And $2) > 0
      Then
        Mem[Segmento:3972] := 027
    Else
      Mem[Segmento:3972] := 032;
    Mem[Segmento:3973] := Color.StatusSel;

    { Control - '^' }
    If (SpecialByte And $4) > 0
      Then
        Mem[Segmento:3974] := 094
    Else
      Mem[Segmento:3974] := 032;
    Mem[Segmento:3975] := Color.StatusSel;

    { Alt - '!' }
    If (SpecialByte And $8) > 0
      Then
        Mem[Segmento:3976] := 033
    Else
      Mem[Segmento:3976] := 032;
    Mem[Segmento:3977] := Color.StatusSel;

    { RightShift - '->' }
    If (SpecialByte And $1) > 0
      Then
        Mem[Segmento:3978] := 026
    Else
      Mem[Segmento:3978] := 032;
    Mem[Segmento:3979] := Color.StatusSel;

    { Lettura del byte specifico (ora) }
    Count := MemL[$0000:$046C];

    { Calcolo delle ore, dei minuti, e dei secondi }
    Hour := Trunc(Count / 65543);
    Remainder := Count Mod 65543;
    Minute := Trunc(Remainder / 1092);
    Remainder := Remainder Mod 1092;
    Second := Trunc(Remainder / 18.21);

    { Aggiornamento della memoria video (ore) }
    Mem[Segmento:3986] := Hour Div 10+48;
    Mem[Segmento:3987] := Color.StatusSel;
    Mem[Segmento:3988] := Hour Mod 10+48;
    Mem[Segmento:3989] := Color.StatusSel;

    { Due punti (:) }
    Mem[Segmento:3990] := 058;

    { Lampeggio dei due punti per simulare i secondi }
    If ((Second * 0.5) = (Second Div 2))
      Then
        Mem[Segmento:3991] := Color.Cancel
    Else
      Mem[Segmento:3991] := Color.Status;

    { Visualizzazione dei minuti }
    Mem[Segmento:3992] := Minute Div 10+48;
    Mem[Segmento:3993] := Color.StatusSel;
    Mem[Segmento:3994] := Minute Mod 10+48;
    Mem[Segmento:3995] := Color.StatusSel;

    End;

{ Allacciamento alla procedura originale }
InLine($9C);
Time2Proc;

End; { Time2 }


{----------------------------------------------------------------------------
  PROCEDURA: NOTIME

  Ripristina gli indirizzi memorizzati nella RAM degli interrupt 1Ch e
  09h, modificati all' inizio del programma.
 ----------------------------------------------------------------------------}
Procedure NoTime;

Begin { NoTime }

{ Interrupt 09h }
SetIntVec($09,SaveTime1Vect);

{ Interrupt 1Ch }
SetIntVec($1C,SaveTime2Vect);

End; { NoTime }


Begin { TIPTime }

{ Salvataggio e assegnazione dell' interrupt 09h (tastiera) }
GetIntVec($09,SaveTime1Vect);
GetIntVec($09,Addr(Time1Proc));
SetIntVec($09,Addr(Time1));

{ Salvataggio e assegnazione dell' interrupt 1Ch (timer) }
GetIntVec($1C,SaveTime2Vect);
GetIntVec($1C,Addr(Time2Proc));
SetIntVec($1C,Addr(Time2));

End. { TIPTime }
