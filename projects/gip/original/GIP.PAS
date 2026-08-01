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
{ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
 º                                                                          º
 º     ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù     º
 º     ùúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúù     º
 º     ùúúúÚÄÄÄÄÄÄÄÄÄÄÄÄ¿úúúúúúúúúúÚÄÄÄÄÄÄ¿úúúúúúúÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿úúúúúù     º
 º     ùúúÚÙ°°°°°°°°°°°°À¿úúúúúúúúú³±±±±±±³úúúúúúú³²²²²²²²²²²²²²À¿úúúúù     º
 º     ùúú³°°°ÚÄÄÄÄÄÄÄ¿°°³úúúúúúúúúÀÄ¿±±ÚÄÙúúúúúúúÀÄ¿²²ÚÄÄÄÄÄÄ¿²²À¿úúúù     º
 º     ùúú³°°ÚÙúúúúúúúÀÄÄÙúúúúúúúúúúú³±±³úúúúúúúúúúú³²²³úúúúúúÆ ²²³úúúù     º
 º     ùúú³°°³úúúúÚÄÄÄÄÄÄ¿úúúúúúúúúúú³±±³úúúúúúúúúúú³²²ÀÄÄÄÄÄÄÙ²²ÚÙúúúù     º
 º     ùúú³°°³úúúú³°°°°°°³úúúúúúúúúúú³±±³úúúúúúúúúúú³²²²²²²²²²²²ÚÙúúúúù     º
 º     ùúú³°°À¿úúúÀÄÄÄ¿°°³úúúúúúúúúúú³±±³úúúúúúúúúúú³²²ÚÄÄÄÄÄÄÄÄÙúúúúúù     º
 º     ùúú³°°°ÀÄÄÄÄÄÄÄÙ°°³úúúúúúúúúÚÄÙ±±ÀÄ¿úúúúúúúÚÄÙ²²ÀÄ¿úúúúúúúúúúúúù     º
 º     ùúúÀ¿°°°°°°°°°°°°ÚÙúGRAPHICú³±±±±±±³úIMAGEú³²²²²²²³úPROCESSORúúù     º
 º     ùúúúÀÄÄÄÄÄÄÄÄÄÄÄÄÙúúúúúúúúúúÀÄÄÄÄÄÄÙúúúúúúúÀÄÄÄÄÄÄÙúúúúúúúúúúúúù     º
 º     ùúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúù     º
 º     ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù     º
 º                                                                          º
 º     FOCHI MICHELE                                                        º
 º     VERSIONE 1.0                                                         º
 º                                                                          º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼}

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

     { Unit standard per la gestione del video in modalit… testo }
     Crt,

     { Unit standard per la gestione del video in modalit… grafca }
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

{ Inizializza il mouse: Š obbligatorio }
InitMouse;

{ Inizializza la scheda grafica: necessita una delle seguenti schede
  grafiche:
             Driver ³  Modo   ³ Risoluzione
             ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄ
              VGA   ³ VGALO   ³ 640x200
              VGA   ³ VGAMED  ³ 640x350
              VGA   ³ VGAHI   ³ 640x480
              EGA   ³ EGALO   ³ 640x200
              EGA   ³ EGAHI   ³ 640x350
              EGA64 ³ EGA64LO ³ 640x200
              EGA64 ³ EGA64HI ³ 640x350     }
InitVGACard;

{ Disegno della schermata del paint }
GraphicScreen;

{ Programma vero e proprio }
ImageProcessor;

{ Ripristina l' interrupt modificato }
{EndClock;}

End. { GraphicImageProcessor }
