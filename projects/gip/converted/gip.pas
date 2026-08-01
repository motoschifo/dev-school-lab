(* MANCANO ANCORA DA FARE LE SEGUENTI COSE:

       - SCELTA OGGETTI
  >NO< - STAMPA IMMAGINE
  >NO< - BLOCCO MEMORIZZA
  >NO< - BLOCCO RICHIAMA
  >NO< - BLOCCO MUOVI
  >NO< - BLOCCO COPIA
       - CONVERSIONE TURBO C
  >NO< - CONVERSIONE TURBO ASSEMBLER
       - HELP GENERALE
       - HELP PRECEDENTE
       - HELP INDICE
       - HELP G.I.P.
       - FINIRE INPUTFILE                                                   *)
{╔══════════════════════════════════════════════════════════════════════════╗
 ║                                                                          ║
 ║     ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙     ║
 ║     ∙······························································∙     ║
 ║     ∙···┌────────────┐··········┌──────┐·······┌─────────────┐·····∙     ║
 ║     ∙··┌┘░░░░░░░░░░░░└┐·········│▒▒▒▒▒▒│·······│▓▓▓▓▓▓▓▓▓▓▓▓▓└┐····∙     ║
 ║     ∙··│░░░┌───────┐░░│·········└─┐▒▒┌─┘·······└─┐▓▓┌──────┐▓▓└┐···∙     ║
 ║     ∙··│░░┌┘·······└──┘···········│▒▒│···········│▓▓│······╞ ▓▓│···∙     ║
 ║     ∙··│░░│····┌──────┐···········│▒▒│···········│▓▓└──────┘▓▓┌┘···∙     ║
 ║     ∙··│░░│····│░░░░░░│···········│▒▒│···········│▓▓▓▓▓▓▓▓▓▓▓┌┘····∙     ║
 ║     ∙··│░░└┐···└───┐░░│···········│▒▒│···········│▓▓┌────────┘·····∙     ║
 ║     ∙··│░░░└───────┘░░│·········┌─┘▒▒└─┐·······┌─┘▓▓└─┐············∙     ║
 ║     ∙··└┐░░░░░░░░░░░░┌┘·GRAPHIC·│▒▒▒▒▒▒│·IMAGE·│▓▓▓▓▓▓│·PROCESSOR··∙     ║
 ║     ∙···└────────────┘··········└──────┘·······└──────┘············∙     ║
 ║     ∙······························································∙     ║
 ║     ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙     ║
 ║                                                                          ║
 ║     FOCHI MICHELE                                                        ║
 ║     VERSIONE 1.0                                                         ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}

{ Data:   13 Marzo 1993
  Ora:    21:00:00
  Autore: Fochi Michele
  File:   GraphicImageProcessor (Programma Principale) }


{ Direttive al compilatore }
{$A+,B-,D+,E+,F-,G-,I+,L+,M 16384,0,655360,N+,O-,R-,S-,V+,X-}

{ Intestazione }
Program
        GraphicImageProcessor;

{ Units utilizzate }
Uses

     { Unit standard per la gestione del video in modalità testo }
     Crt,

     { Unit standard per la gestione del video in modalità grafca }
     Graph,

     { Unit standard per le chiamate al sistema, gestione disco, ecc. }
     Dos,

     { Unit di definizione delle costanti dei tasti }
     Keyboard,

     { Unit per la gestione del mouse in Turbo Pascal }
     Mouse,

     { Dichiarazione delle variabili globali del programma }
     GIPVars,

     { Inizializzazione del programma }
     GIPInit,

     { Utility grafiche }
     GIPFast,

     { Procedure di base (schermata iniziale, del paint, ecc.) }
     GIPBase,

     { Gestione dell' orologio a lancette nell' angolo basso sinistro
       del video }
     (*GIPIntrp,*)
     GIPGraph,
     GIPMenu,
     GIPIcWin,
     GIPStato,
     GIPProc,
     GIPAppPrc,
     GIPImage,
     
     GIPLink,
     GIPFont1, { Prima unit delle 3 che definiscono i tipi di fonts          }
     GIPFont2, { Seconda unit delle 3 che definiscono i tipi di fonts        }
     GIPFont3, { Terza unit delle 3 che definiscono i tipi di fonts          }
     GIPDriv,  { Contiene tutti i driver grafici per le schede necessarie    }
     
     { Procedure principali }
     GIPMain;


Begin { GraphicImageProcessor }

InitVar;

{ Inizializza il mouse: è obbligatorio }
InitMouse;

{ Inizializza la scheda grafica: necessita una delle seguenti schede
  grafiche:
             Driver │  Modo   │ Risoluzione
             ───────┼─────────┼────────────
              VGA   │ VGALO   │ 640x200
              VGA   │ VGAMED  │ 640x350
              VGA   │ VGAHI   │ 640x480
              EGA   │ EGALO   │ 640x200
              EGA   │ EGAHI   │ 640x350
              EGA64 │ EGA64LO │ 640x200
              EGA64 │ EGA64HI │ 640x350     }
InitVGACard;

{ Disegno della schermata del paint }
GraphicScreen;

{ Programma vero e proprio }
ImageProcessor;

{ Ripristina l' interrupt modificato }
{EndClock;}

End. { GraphicImageProcessor }
