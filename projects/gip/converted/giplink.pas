{ Essa contiene procedure e funzioni per il programma necessarie per         }
{ 'linkare' i driver delle schede grafiche e dei vari tipi di font.          }

Unit GIPLink;

{
  Per chi non conoscesse la tecnica di integrare i driver grafici e i files
  di font in un file .EXE, verrà rapidamente descritta di seguito.
  Sia i driver grafici BGI sia i font sono posti sul disco in files separati,
  cosicchè devono essere dinamicamente letti mentre il programma è in
  esecuzione.
  Tuttavia, qualche volta è preferibile riporre tutti i files ausiliari
  direttamente in un file .EXE.

  Per fare questo è necessario disporre del file BINOBJ.EXE per le
  conversioni in .OBJ.

  Occorre quindi convertire tutti i files *.CHR e *.BGI che si desiderano
  includere nel file finale e convertirli tutti: per esempio, per il file
  TRIP.CHR si dovrà digitare

       BINOBJ TRIP.CHR TRIP TriplexFont

  per il file SCRI.CHR

       BINOBJ SCRI.CHR SCRI ScroptFont

  ecc. ecc.

  Compilare poi le due unit SprDriv e SprFont1 (in questo caso SprFont
  contiene anche SprFont2 e SprFont3 perchè ci sono molti tipi
  di font; di solito ce ne stanno 3 o 4 per file) e includere la
  GIPLink nel programma principale.

  Per includere altri tipi di fonts o altri tipi di driver grafici, occorre
  modificare il programma sorgente, aggiungendo opportunamente le istruzioni
  RegisterBGIfont e RegisterBGIdriver.

  Il programma non segnala nulla se le operazioni di 'linkaggio' non
  vengono eseguite correttamente: i controllo che si trovano in questo
  file non effettuano nulla (anche se non sono necessari, si potrebbe
  prevedere di completarli con la comparsa di messaggi di errore del
  tipo 'Font xxxxx non disponibile').
}

Interface { GIPLink }

Implementation { GIPLink }

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalità testo                       }
     Graph,    { Gestisce lo schermo in modalità grafica                     }
     GIPFont1, { Prima unit delle 3 che definiscono i tipi di fonts          }
     GIPFont2, { Seconda unit delle 3 che definiscono i tipi di fonts        }
     GIPFont3, { Terza unit delle 3 che definiscono i tipi di fonts          }
     GIPDriv;  { Contiene tutti i driver grafici per le schede necessarie    }


Begin { GIPLink }

{ Registra tutti i driver grafici }
If (RegisterBGIdriver(@CGADriverProc) < 0)
  Then
    { Errore: driver non disponibile! };

If (RegisterBGIdriver(@EGAVGADriverProc) < 0)
  Then
    { Errore: driver non disponibile! };

If (RegisterBGIdriver(@HercDriverProc) < 0)
  Then
    { Errore: driver non disponibile! };

If (RegisterBGIdriver(@ATTDriverProc) < 0)
  Then
    { Errore: driver non disponibile! };

If (RegisterBGIdriver(@PC3270DriverProc) < 0)
  Then
    { Errore: driver non disponibile! };

{ Registra tutti i font }
If (RegisterBGIfont(@GothicFontProc) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@SansSerifFontProc) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@SmallFontProc) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@TriplexFontProc) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@LComFont) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@ScroptFont) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@SimpleFont) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@TSCRFont) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@EuroFont) < 0)
  Then
    { Errore: font non disponibile! };

If (RegisterBGIfont(@BoldFont) < 0)
  Then
    { Errore: font non disponibile! };

End. { GIPLink }
