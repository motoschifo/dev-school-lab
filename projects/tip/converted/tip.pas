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
 ║       FOCHI MICHELE                         MAIN PROGRAM                 ║
 ║       VERSIONE 1.0                                                       ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   14 Marzo 1993
  Ora:    20:00:00
  Autore: Fochi Michele
  File:   TextImageProcessor (Programma Principale) }

{
  Una volta terminato, si potrebbe aggiungere anche:

   - Font in modalità testo
   - Inserisci linea
   - Cancella linea
   - Inserisci colonna
   - Cancella colonna
   - Stampa pagina
   - Centra testo
   - Linea fino agli estremi verticali
   - Linea fino agli estremi orizzontali
   - TAB = spostamento di 10 caratteri
   - Sposta al prossimo carattere
   - Sposta al carattere precedente
   - Special.Allunga per allungare le linee dopo un' inserzione
}

{$M 16384,8192,655360,S-,R-,B-,I-,V-,D-}

{ Intestazione }
Program
        TextImageProcessor;

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

     { Voce 'Traccia cornici' del menu principale }
     TIPTrace,

     { Voce 'Schermo' del menu principale }
     TIPVideo,

     { Gestisce la chiamata alle schermate di aiuto di TIP }
     TIPHelp,

     { Gestione del mouse in Turbo Pascal }
     Mouse,

     { Voce 'Scegli immagine' del menu principale }
     TIPImage,

     { Voce 'Configurazione' del menu principale }
     TIPConfg,

     { Visualizzazione dell' ora e della pressione dei tasti speciali }
     TIPTime,

     { Voce 'Conversione' del menu principale }
     TIPConv,

     { Chiamata del menu principale }
     TIPMain;


Begin { TextImageProcessor }

{ Inizializza tutte le variabili globali del programma e i puntatori
  alle finestre e alle pagine video }
InizializzaVariabili;

{ E' la procedura principale che controlla tutte le pressioni dei tasti
  da parte dell' utente ed esegue i compiti scelti }
EditScreen;

{ Annulla la visualizzazione dell' ora e dei tasti speciali }
NoTime;

End. { TextImageProcessor }
