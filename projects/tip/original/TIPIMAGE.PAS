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
 ÷       VERSIONE 1.0                          UNIT TIPIMAGE                ÷
 ÷                                                                          ÷
 ָֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽֽ¼}
{ Data:   14 Marzo 1993
  Ora:    17:30:00
  Autore: Fochi Michele
  File:   Unit UnitTextImageProcessorImage }

{ Contiene la procedura che seleziona un' immagine fra quelle disponibili }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Procedure SelezionaImmagine; }


{ Nome della unit }
Unit
     TIPImage;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPImage }


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

     { Voce 'Schermo' del menu principale }
     TIPVideo,

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse,

     { Visualizzazione dell' ora e della pressione dei tasti speciali }
     TIPTime;


{----------------------------------------------------------------------------
  PROCEDURA: SELEZIONA.IMMAGINE

  Effettua la chiamata alla funzione SCEGLIIMMAGINE per scegliere la pagina
  in memoria da rendere attiva (fra le 11 disponibili).
 ----------------------------------------------------------------------------}
Procedure SelezionaImmagine;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPImage }


{----------------------------------------------------------------------------
  PROCEDURA: SELEZIONA.IMMAGINE

  Effettua la chiamata alla funzione SCEGLIIMMAGINE per scegliere la pagina
  in memoria da rendere attiva (fra le 11 disponibili).
 ----------------------------------------------------------------------------}
Procedure SelezionaImmagine;

{ Variabili locali }
Var

    { Immagine scelta }
    Img: Byte;

Begin { SelezionaImmagine }

{ Selezione dell' immagine }
Img := ScegliImmagine;

{ Aggiornamento se la scelta  valida }
If (Img <> 0)
  Then
    Begin
    NumPgVideo := Img;
    Fisico^ := Image^[NumPgVideo].Page;
    End;

End; { SelezionaImmagine }


End. { TIPImage }
