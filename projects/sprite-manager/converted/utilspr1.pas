{============================================================================}
{                                                                            }
{                  SPRITE MANAGER v5.0 - UNIT UTILSPR1                       }
{                                                                            }
{ Data di ultima modifica .............. Mercoledi, 21 Aprile 1993           }
{                                                                            }
{ Questa UNIT fa parte del programma Sprite Manager 5.0.                     }
{                                                                            }
{ Essa contiene procedure e funzioni per il programma.                       }
{                                                                            }
{============================================================================}
{$R-,S-,B-}
Unit UtilSpr1;

Interface { UtilSpr1 }

Uses Dos,        { Gestisce i file e la directory del disco                  }
     Crt,        { Gestisce lo schermo in modalità testo                     }
     Graph,      { Gestisce lo schermo in modalità grafica                   }
     Pulsanti,   { Definisce tutte le icone del programma                    }
     Mouse;      { Gestisce il mouse                                         }


Const

  { Crt-Controller }
  CrtC=            $03CE;

  { Bytes per una linea (16 colori = 16 bytes) }
  BytesPerLine16=  80;

  { Scrittura di un pixel in modo Normale, Xor, And oppure Or }
  pRep=            $00;
  pXor=            $18;
  pAnd=            $08;
  pOr=             $10;


{===========================================================================}
{ PROCEDURA: PUT.PIXEL.16                                                   }
{                                                                           }
{ Disegna un pixel alle coordinate X e W dello schermo (deve essere una VGA }
{ a 16 colori). Il colore è definito da C, mentre UpMode è il modo con cui  }
{ deve essere visualizzato (pRep, pXor, pAnd, pOr).                         }
{===========================================================================}
Procedure PutPixel16 ( X:      Word;
                       Y:      Word;
                       C:      Word;
                       UpMode: Byte );


{===========================================================================}
{ FUNZIONE: GET.PIXEL.16                                                    }
{                                                                           }
{ Restituisce il colore del pixel che ha come coordinate X e Y. Il video    }
{ deve essere in modalità VGA a 16 colori.                                  }
{===========================================================================}
Function  GetPixel16 ( X: Word;
                       Y: Word ): Byte;


{===========================================================================}
{ PROCEDURA: WAIT.TO.WRITE                                                  }
{                                                                           }
{ Questa procedura viene utilizzata per evitare l' effetto di sfarfallio    }
{ quando si scrive e cancella ripetutamente una stessa zona.                }
{===========================================================================}
Procedure WaitToWrite;


{===========================================================================}
{ PROCEDURA: DEFINE.END.COORDS                                              }
{                                                                           }
{ Definisce il massimo numero di quadri per l' immagine, settando opportu_  }
{ namente le variabili di limiti.                                           }
{===========================================================================}
Procedure DefineEndCoords;


{===========================================================================}
{ PROCEDURA: PREMI.PULSANTE                                                 }
{                                                                           }
{ Serve per premere un qualsiasi pulsante sullo schermo; i parametri sono:  }
{   Quale: numero dell'immagine                                             }
{   Punt : puntatore all'immagine                                           }
{   Luogo: luogo in cui si trova il tasto                                   }
{===========================================================================}
Procedure PremiPulsante ( Quale: Byte;
		  	  Punt:  RecP;
		  	  Luogo: TipoLuogo );


{===========================================================================}
{ PROCEDURA: VUOTA.SCHERMO                                                  }
{                                                                           }
{ Questa procedura serve per vuotare lo schermo in memoria, ossia per azze_ }
{ rare al colore NERO tutti i pixel dell'immagine.                          }
{===========================================================================}
Procedure VuotaSchermo;


{===========================================================================}
{ PROCEDURA: DISEGNA.PIXEL                                                  }
{                                                                           }
{ Serve per disegnare l'immagine che si trova in memoria, stabilendo il     }
{ Modo (Clear = cancella prima di disegnare, NotClear = non cancellare) e   }
{ se si vuole disegnare anche l'immagine in dimensioni reali con Reale      }
{ (SiReale e NoReale).                                                      }
{===========================================================================}
Procedure DisegnaPixel ( Modo:  TipoModo;
		         Reale: TipoReal );


{===========================================================================}
{ PROCEDURA: DISEGNA.GRIGLIA                                                }
{                                                                           }
{ Disegna la griglia sullo schermo secondo il valore della variabile        }
{ Griglia:                                                                  }
{           PerLinee : linee che formano un reticolo,                       }
{           PerPunti : punti                                                }
{           NoGriglia: nessuna griglia                                      }
{===========================================================================}
Procedure DisegnaGriglia;


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.GRIGLIA                                       }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di griglia   }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:    vale Disegna se deve essere visualizzata la finestra        }
{               e se si deve attendere che l' utente scelga un' icona       }
{               (altrimenti vale NonDisegnare)                              }
{     gGriglia: individua il tipo di griglia (gLinee, gPunti, gNessuna)     }
{     Punt:     puntatore all' icona                                        }
{===========================================================================}
Procedure AssegnaPulsanteGriglia (     Metti:    TipoMetti;
                                       gGriglia: TipoGriglia;
                                   Var Punt:     RecP );


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.SHAPE                                         }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di forma     }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:   vale Disegna se deve essere visualizzata la finestra         }
{              e se si deve attendere che l' utente scelga un' icona        }
{              (altrimenti vale NonDisegnare)                               }
{     gShape:  individua il tipo di forma corrente, scelte fra sCerchio,    }
{              sCerchioPieno, sLinee, sLineePiene, sRettangolo,             }
{              sRettangoloPieno, sDisegnoLiberoestra                        }
{     Punt:    puntatore all' icona                                         }
{===========================================================================}
Procedure AssegnaPulsanteShape (     Metti:  TipoMetti;
                                     sShape: TipoShape;
                                 Var Punt:   RecP );


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.LINE                                          }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di linea     }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:   vale Disegna se deve essere visualizzata la finestra         }
{              e se si deve attendere che l' utente scelga un' icona        }
{              (altrimenti vale NonDisegnare)                               }
{     gLines:  individua il tipo di linea corrente, scelte fra lSolid1,     }
{              lDotted1, lCenter1, lDashed1, lSolid3, lDotted3, lCenter3,   }
{              lDashed3                                                     }
{     Punt:    puntatore all' icona                                         }
{===========================================================================}
Procedure AssegnaPulsanteLine (     Metti:  TipoMetti;
                                    lLines: TipoLine;
                                Var Punt:   RecP );


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.PATTERN                                       }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di retino    }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:     vale Disegna se deve essere visualizzata la finestra       }
{                e se si deve attendere che l' utente scelga un' icona      }
{                (altrimenti vale NonDisegnare)                             }
{     gPattern:  individua il tipo di retino corrente, scelte fra pEmpty,   }
{                pSolid, pLine, pLtSlash, pSlash, pBkSlash, pLtBkSlash,     }
{                pHatch, pXHatch, pInterleave, pWideDot, pCloseDot          }
{     Punt:      puntatore all' icona                                       }
{===========================================================================}
Procedure AssegnaPulsantePattern (     Metti:    TipoMetti;
                                       pPattern: TipoPattern;
                                   Var Punt:     RecP );


{===========================================================================}
{ PROCEDURA: DEFINISCI.PULSANTE                                             }
{                                                                           }
{ Definisce l' ARRAY principale di tutti i tasti presenti nel programma e   }
{ le loro posizioni.                                                        }
{===========================================================================}
Procedure DefinisciPulsanti;


{===========================================================================}
{ PROCEDURA: RETTANGOLO.REAL                                                }
{                                                                           }
{ Serve per disegnare l'area che rappresenta lo schermo grande in quello    }
{ a dimensioni reali, in modo da sapere sempre in che posizione ci si trova }
{ con lo schermo, anche se questo viene aiutato dal fatto che ai bordi del_ }
{ lo schermo si trovano le coordinate dei vertici. I parametri indicano l'  }
{ angolo di inizio (in alto a sinistra) del rettangolo appena descritto.    }
{===========================================================================}
Procedure RettangoloReal ( ValX: Integer;
			   ValY: Integer );


{===========================================================================}
{ PROCEDURA: WRITE.BAR.COORD                                                }
{                                                                           }
{ Questa procedura serve per disegnare le coordinate dello schermo grande   }
{ rispetto allo schermo in dimensioni reali, specificando quali coordinate  }
{ scrivere (Orizz per quelle orizzontali e Vert per quelle verticali) e i   }
{ valori di minimo e massimo da scrivere.                                   }
{===========================================================================}
Procedure WriteBarCoord ( Direzione: TipoDirezione;
			  ValMin:    Integer;
			  ValMax:    Integer );


{===========================================================================}
{ PROCEDURA: WRITE.POS.COORD                                                }
{                                                                           }
{ Serve per scrivere le coordinate della posizione del mouse su entrambi    }
{ gli schermi di disegno.                                                   }
{===========================================================================}
Procedure WritePosCoord ( ValX: Integer;
			  ValY: Integer );


{===========================================================================}
{ PROCEDURA: AGGIORNA.SCALA                                                 }
{                                                                           }
{ Scrive la scala corrente fra il disegno nella finestra più grande e quel_ }
{ lo nella finestra più piccola. Quella di defalut è 10:1.                  }
{===========================================================================}
Procedure AggiornaScala;


{===========================================================================}
{ PROCEDURA: AGGIORNA.NOME.FILE                                             }
{                                                                           }
{ Scrive in alto a destra il nome del file corrente.                        }
{===========================================================================}
Procedure AggiornaNomefile;


{===========================================================================}
{ PROCEDURA: METTI.PUNTINI                                                  }
{                                                                           }
{ Serve per trasformare una stringa '12345' in '12.345', ossia mette i      }
{ puntini ogni 3 cifre della stringa.                                       }
{===========================================================================}
Procedure MettiPuntini ( Var Numero: String );


{===========================================================================}
{ PROCEDURA: MERGE.SORT                                                     }
{                                                                           }
{ Serve per ordinare la directory del disco.                                }
{===========================================================================}
Procedure MergeSort ( Var Dir: PTRTipoDir;
		     	  Min: Integer;
		      	  Max: Integer );


{===========================================================================}
{ PROCEDURA: INFORMAZIONE                                                   }
{                                                                           }
{ Visualizza alcune informazioni riguardanti il disco, il computer, il file }
{ ecc., premendo l' icona INFORMAZIONI.                                     }
{===========================================================================}
Procedure Informazione ( Var NumRighe: Byte;
		         Var Stringhe: TipoStringhe );


{===========================================================================}
{ PROCEDURA: NORMAL.WINDOW                                                  }
{                                                                           }
{ Aggiusta il contenuto della finestra attiva, separando i colori dal testo }
{ di ogni riga.                                                             }
{===========================================================================}
Procedure NormalWindow ( Var NumRighe: Byte;
			 Var Stringhe: TipoStringhe;
			 Var Stringa:  String );


{===========================================================================}
{ PROCEDURA: CHECK.TIME                                                     }
{                                                                           }
{ Se occorre, visualizza l' ora, i minuti, i secondi e i centesimi di se_   }
{ condi nelle coordinate grafiche opportune.                                }
{===========================================================================}
Procedure CheckTime ( Var Stringa:    String;
		      Var PulsSfondo: Byte;
		      Var Hour:       Word;
		      Var Minute:     Word;
		      Var Second:     Word;
		      Var Sec100:     Word;
		      Var OldHour:    Word;
		      Var OldMinute:  Word;
		      Var OldSecond:  Word;
		      Var OldSec100:  Word );


{===========================================================================}
{ PROCEDURA: TYPER                                                          }
{                                                                           }
{ Visualizza sul video (in modalità testo) la stringa specificata come pa_  }
{ rametro in una maniera diversa dal normale (come una macchina da scrive_  }
{ re).                                                                      }
{===========================================================================}
Procedure Typer ( Stringa: String;
		  Riga:    Byte;
		  Colonna: Byte );


{===========================================================================}
{ PROCEDURA: INSERT.PATH                                                    }
{                                                                           }
{ Attende che l' utente inserisca il path dove si trovano i files *.BGI e   }
{ *.CHR, continuando fino a che l' utente non vuole uscire o fino a che il  }
{ path non sia corretto.                                                    }
{===========================================================================}
Procedure InsertPath ( Var PathBGI:  String;
			   Errore:   Integer );


{===========================================================================}
{ PROCEDURA: ABORT                                                          }
{                                                                           }
{ Esce dal programma perchè non è disponibile la scheda grafica VGA.        }
{===========================================================================}
Procedure Abort ( Errore: Integer );


{===========================================================================}
{ PROCEDURA: ERRORE.MOUSE                                                   }
{                                                                           }
{ Esce dal programma perchè non è stato trovato il mouse oppure non è stato }
{ caricato il suo driver in memoria. Il programma utilizza solo questo      }
{ dispositivo.                                                              }
{===========================================================================}
Procedure ErroreMouse;


{===========================================================================}
{ PROCEDURA: END.SPRITE.MANAGER                                             }
{                                                                           }
{ Esce dal programma liberando la memoria e chiudendo la modalità grafica,  }
{ tornando quindi alla modalità testo 25x80. Cambia la directory corrente   }
{ (ritorna quindi a quella in cui si era al momento dell' esecuzione del    }
{ programma) e visualizza sul video alcune informazioni per l' utente.      }
{===========================================================================}
Procedure EndSpriteManager;


{===========================================================================}
{ PROCEDURA: SPEGNI.CURSORE                                                 }
{                                                                           }
{ Nasconde la visualizzazione del cursore alla vista dell' utente.          }
{===========================================================================}
Procedure SpegniCursore;


{===========================================================================}
{ PROCEDURA: CURSORE.PICCOLO                                                }
{                                                                           }
{ Visualizza il cursore come una piccola linea in fondo ('_').              }
{===========================================================================}
Procedure CursorePiccolo;


{===========================================================================}
{ PROCEDURA: CURSORE.GRANDE                                                 }
{                                                                           }
{ Visualizza il cursore come un blocco pieno ('█').                         }
{===========================================================================}
Procedure CursoreGrande;


Implementation { UtilSpr1 }


{===========================================================================}
{ PROCEDURA: WAIT.TO.WRITE                                                  }
{                                                                           }
{ Questa procedura viene utilizzata per evitare l' effetto di sfarfallio    }
{ quando si scrive e cancella ripetutamente una stessa zona.                }
{===========================================================================}
Procedure WaitToWrite;
Begin { WaitToWrite }

Repeat
  { Maschera il 5º bit }
Until ((Port[$3DA] And $08) <> 0);

End; { WaitToWrite }


{===========================================================================}
{ PROCEDURA: PUT.PIXEL.16                                                   }
{                                                                           }
{ Disegna un pixel alle coordinate X e W dello schermo (deve essere una VGA }
{ a 16 colori). Il colore è definito da C, mentre UpMode è il modo con cui  }
{ deve essere visualizzato (pRep, pXor, pAnd, pOr).                         }
{===========================================================================}
Procedure PutPixel16 ( X:      Word;
                       Y:      Word;
                       C:      Word;
                       UpMode: Byte ); Assembler;
Asm { PutPixel16 }
  MOV AX, Y
  MOV BX, X
  MOV CL, BL
  PUSH DX
  MOV DX, BytesPerLine16
  MUL DX         { Moltiplica le righe per byte-per-riga }
  POP DX         { AX conserva l'inizio della riga }
  SHR BX,1
  SHR BX,1
  SHR BX,1
  ADD BX, AX     { BX conserva lo spiazzamento nel buffer }
  MOV AX, 0A000h
  MOV ES, AX     { ES:BX punta all'indirizzo del byte del pixel }
  AND CL, 7
  XOR CL, 7      { Bits da scorrere a sinistra (indirizzo BIT) }
  MOV AH, 1
  SHL AH, CL
  MOV DX, CRTC
  MOV AL, 8
  OUT DX, AX     { Maschera tutto salvo il bit desiderato }
  MOV AX, 0005h
  OUT DX, AX     { Modo scrittura 0}
  MOV AH, upmode
  MOV AL, 3
  OUT DX, AX     { Setta il modo aggiornamento del pixel }
  MOV AH, Byte(C)
  MOV AL, 0
  OUT DX, AX     { Setta/resetta}
  MOV AX, 0F01h
  OUT DX, AX     { Setta/resetta per byte }
  OR ES:[BX], AL { REALIZZA L'IMPRESA! }
  MOV AX, 0FF08h { Ripristina la maschera dei bit: NESSUN bit resta
                   mascherato                                       }
  OUT DX, AX
  MOV AX, 0003h  { Ripristina il modo di default di aggiornamento del pixel }
  OUT DX, AX
  MOV AX, 0001   { Setta/resetta per pixel }
  OUT DX, AX
End; { PutPixel16 }


{===========================================================================}
{ FUNZIONE: GET.PIXEL.16                                                    }
{                                                                           }
{ Restituisce il colore del pixel che ha come coordinate X e Y. Il video    }
{ deve essere in modalità VGA a 16 colori.                                  }
{===========================================================================}
Function  GetPixel16 ( X: Word;
                       Y: Word ): Byte; Assembler;

Asm { GetPixel16 }
  MOV AX, Y
  MOV BX, X
  MOV CL, BL
  PUSH DX
  MOV DX, BytesPerLine16
  MUL DX         { Moltiplica le righe per byte-per-riga }
  POP DX         { AX contiene l'inizio della riga }
  SHR BX,1
  SHR BX,1
  SHR BX,1
  ADD BX, AX     { BX contiene lo spiazzamento nel buffer }
  MOV AX, 0A000h
  MOV ES, AX     { ES:BX punta all'indirizzo del byte del pixel }
  AND CL, 7
  XOR CL, 7      { Bits da scorrere a sinistra (indirizzo BIT ) }
  MOV AH, 1
  MOV CH, AH
  SHL CH, CL     { CH ha la maschera del bit nella posizione giusta }
  MOV SI, BX     { ES:SI punta al byte nella RAM del video }
  MOV DX, CRTC
  MOV AX, 304h   { Comincia col piano 3 }
  XOR BL, BL     { Accumuleremo il valore del pixel in BL }
  @Loop:
  OUT DX, AX
  MOV BH, ES:[SI]
  AND BH, CH
  NEG BH
  ROL BX, 1
  DEC AH
  JGE @Loop
  MOV AL, BL     { Il risultato va in AL }
End; { GetPixel16 }


{===========================================================================}
{ PROCEDURA: DEFINE.END.COORDS                                              }
{                                                                           }
{ Definisce il massimo numero di quadri per l' immagine, settando opportu_  }
{ namente le variabili di limiti.                                           }
{===========================================================================}
Procedure DefineEndCoords;
Begin { DefineEndCoords }

{ Determina la fine della finestra }
FineX := (461 Div Lato)+InizioX-1;
FineY := (421 Div Lato)+InizioY-1;

{ Controllo della validità dei valori calcolati }
If (FineX > MaxColonne)
  Then
    FineX := MaxColonne;

If (FineY > MaxRighe)
  Then
    FineY := MaxRighe;

{ Calcolo ampiezze }
MaxX := FineX-InizioX+1;
MaxY := FineY-InizioY+1;

End; { DefineEndCoords }


{===========================================================================}
{ PROCEDURA: PREMI.PULSANTE                                                 }
{                                                                           }
{ Serve per premere un qualsiasi pulsante sullo schermo; i parametri sono:  }
{   Quale: numero dell'immagine                                             }
{   Punt : puntatore all'immagine                                           }
{   Luogo: luogo in cui si trova il tasto                                   }
{===========================================================================}
Procedure PremiPulsante ( Quale: Byte;
		  	  Punt:  RecP;
		  	  Luogo: TipoLuogo );

Begin { PremiPulsante }

{ Se si preme su un colore già premuto, la procedura
  non esegue niente                                  }
If ((Luogo = Colori) And (Color <> Quale)) Or (Luogo <> Colori)
  Then

    Begin

    WaitToWrite;
    HideMouse;

    { Disegna il tasto premuto. }
    SetColor(GetPixel16(Punt.x+24,Punt.y+24));
    PutImage(Punt.x+2,Punt.y+2,Punt.P^,NormalPut);
    Line(Punt.x+2,Punt.y+2,Punt.x+26,Punt.y+2);
    Line(Punt.x+3,Punt.y+3,Punt.x+26,Punt.y+3);
    Line(Punt.x+2,Punt.y+3,Punt.x+2,Punt.y+26);
    Line(Punt.x+3,Punt.y+3,Punt.x+3,Punt.y+26);
    SetColor(GetPixel16(Punt.x-1,Punt.y-1));
    Rectangle(Punt.x,Punt.y,Punt.x+26,Punt.y+26);
    Rectangle(Punt.x+1,Punt.y+1,Punt.x+25,Punt.y+25);

    { Attende un certo tempo per simulare la pressione.
      Se il tasto è una freccia dello schermo grande,
      attende un tempo molto più piccolo                }
    If (Luogo = Colori) And (Color <> Quale)
      Then

        Begin
        PutImage(P[Color].x,P[Color].y,P[Color].P^,NormalPut);
        ShowMouse;
        Delay(70);
        End

    Else

      Begin
      ShowMouse;

      { Ritardo per la simulazione della pressione del pulsante }
      Delay(70);

      { Ripristino del pulsante }
      WaitToWrite;
      HideMouse;
      PutImage(Punt.x,Punt.y,Punt.P^,NormalPut);
      ShowMouse;

      End;
    End;

End; { PremiPulsante }


{===========================================================================}
{ PROCEDURA: VUOTA.SCHERMO                                                  }
{                                                                           }
{ Questa procedura serve per vuotare lo schermo in memoria, ossia per azze_ }
{ rare al colore NERO tutti i pixel dell'immagine.                          }
{===========================================================================}
Procedure VuotaSchermo;

Var

    { Indice per i cicli }
    I: Integer;

    { Indice per i cicli }
    J: Integer;

Begin { VuotaSchermo }

{ Vuota la memoria }
For i := 1 To MaxColonne Do
  For j := 1 To MaxRighe Do
    Vet^[i,j] := Black;

{ Definisce i valori delle variabili che delimitano lo schermo. }
InizioX := 1;
InizioY := 1;

DefineEndCoords;
WaitToWrite;
HideMouse;

{ Cancella fisicamente entrambi gli schermi di disegno. }
SetFillStyle(SolidFill,Black);
Bar(11,11,469,429);
Bar(InizioRealX,InizioRealY,
    InizioRealX+MaxColonne-1,InizioRealY+MaxRighe-1);
SetColor(Brown);
Rectangle(10,10,470,430);
Rectangle(InizioRealX-1,InizioRealY-1,
	  InizioRealX+MaxColonne,InizioRealY+MaxRighe);

{ Una volta cancellato, lo sprite si considera non modificato. }
Modificato := False;

End; { VuotaSchermo }


{===========================================================================}
{ PROCEDURA: DISEGNA.PIXEL                                                  }
{                                                                           }
{ Serve per disegnare l'immagine che si trova in memoria, stabilendo il     }
{ Modo (Clear = cancella prima di disegnare, NotClear = non cancellare) e   }
{ se si vuole disegnare anche l'immagine in dimensioni reali con Reale      }
{ (SiReale e NoReale).                                                      }
{===========================================================================}
Procedure DisegnaPixel ( Modo:  TipoModo;
		         Reale: TipoReal );

Var

    { Colore per SetFillStyle }
    PixelColor:   Byte;

    { Indice per i cicli }
    I:            Integer;

    { Indice per i cicli }
    J:            Integer;

    { Indice per i cicli }
    I2:           Integer;

    { Indice per i cicli }
    J2:           Integer;

    { Coordinata X e Y dell' icona }
    Icona:        Array [1..2] Of
                    PointType;

    { Appoggio }
    Vet3:         Byte;

Begin { DisegnaPixel }

I := 1;
I2 := FineX-InizioX+1;
If (I2 > MaxColonne)
  Then
    I2 := MaxColonne;
J := 1;
J2 := FineY-InizioY+1;
If (J2 > MaxRighe)
  Then
    J2 := MaxRighe;
PixelColor := Black;
SetFillStyle(SolidFill,PixelColor);
Icona[1].X := 11;
Icona[1].Y := 11;
WaitToWrite;
HideMouse;

{ Se si è specificato di cancellare lo schermo... }
If (Modo = Clear) Then
  Bar(11,11,469,429);


{ Queste righe e i prossimi cicli disegnano tutteùi i punti sullo
  schermo.
  La procedura è stata fatta in modo da eseguire solo il minor
  numero operazioni, utilizzando solo 6 somme per disegnare il
  primo punto di tutte le colonne, mentre solo tre per ogni
  punto di ogni riga e due se questo è nero. La condizione
  ottimale è che tutti i punti sono neri, mentre quella più
  svantaggiosa è se tutti i punti sono diversi da nero.
  Inoltre ho scelto la procedura per disegnare un'area colorata
  più veloce : BAR.                                               }
Repeat

  Vet3 := Vet^[I+InizioX-1,J+InizioY-1];
  If Vet3 <> PixelColor
    Then
      Begin
      PixelColor := Vet3;
      SetFillStyle(SolidFill,PixelColor);
      End;

  If (PixelColor <> Black) Or (Modo <> Clear)
    Then
      Bar(Icona[1].X,Icona[1].Y,Icona[1].X+Lato-2,Icona[1].Y+Lato-2);

  Inc(I);
  Inc(Icona[1].X,Lato);
  If (I > I2)
    Then
      Begin
      I := 1;
      Inc(J);
      Icona[1].X := 11;
      Inc(Icona[1].Y,Lato);
      End;

Until (J > J2);

{ Se si disegna anche la parte di schermo piccola... }
If Reale = AncheReal Then
  Begin
  WaitToWrite;
  HideMouse;
  SetFillStyle(SolidFill,Black);
  Bar(InizioRealX,InizioRealY,
      InizioRealX+MaxColonne-1,InizioRealY+MaxRighe-1);
  For i := 1 To MaxColonne Do
    For j := 1 To MaxRighe Do
      If Vet^[i,j] <> Black Then
	PutPixel16(InizioRealX+i-1,InizioRealY+j-1,Vet^[i,j],pRep);
  RettangoloReal(InizioX,InizioY);
  End;

ShowMouse;
End; { DisegnaPixel }


{===========================================================================}
{ PROCEDURA: DISEGNA.GRIGLIA                                                }
{                                                                           }
{ Disegna la griglia sullo schermo secondo il valore della variabile        }
{ Griglia:                                                                  }
{           PerLinee : linee che formano un reticolo,                       }
{           PerPunti : punti                                                }
{           NoGriglia: nessuna griglia                                      }
{===========================================================================}
Procedure DisegnaGriglia;

Var

    { Massimo valore X }
    FondoX: Integer;

    { Massimo valore Y }
    FondoY: Integer;

    { Ciclo }
    I:      Integer;

    { Ciclo }
    J:      Integer;

    { Ciclo }
    II:     Integer;

     { Ciclo }
    JJ:     Integer;

Begin { DisegnaGriglia }

{ La griglia viene disegnata secondo il valore di Griglia,
  e in modo da non disegnare due volte la stessa griglia
  o fare inutili tracciamenti di righe : quindi è stata
  studiata in modo da disegnarla nel minor tempo possibile. }
FondoX := 9+MaxX*Lato;
FondoY := 9+MaxY*Lato;
If (FondoX > 469)
  Then
    FondoX := 469;
If (FondoY > 429)
  Then
    FondoY := 429;
WaitToWrite;
HideMouse;
SetColor(Brown);
Rectangle(10,10,FondoX+1,FondoY+1);
Rectangle(10,10,470,430);

{ A seconda del tipo di griglia vengono evitate alcune routines ... }
Case Griglia Of

  { Tipo di griglia: a linee }
  gLinee: Begin

	  SetColor(DarkGray);
	  j := 10;

	  For i := 1 To MaxX Do
	    Begin
	    Inc(j,Lato);
	    Line(j,11,j,FondoY);
	    End;
	  j := 10;

	  For i := 1 To MaxY Do
	    Begin
	    Inc(j,Lato);
	    Line(11,j,FondoX,j);
	    End;

	  End;

  { Tipo di griglia: a puntini }
  gPunti: Begin

	  If (OldGriglia = gLinee)
            Then

	      Begin
	      SetColor(Black);
	      j := 10;

	      For i := 1 To MaxX Do
	        Begin
	        Inc(j,Lato);
	        Line(j,11,j,FondoY);
	        End;

              j := 10;
	      For i := 1 To MaxY Do
	        Begin
	        Inc(j,Lato);
	        Line(11,j,FondoX,j);
	        End;
	      End;

	  ii := 10;
	  For i := 1 To MaxX Do
	    Begin
	    Inc(ii,Lato);
	    jj := 10;
	    For j := 1 To MaxY Do
	      Begin
	      Inc(jj,Lato);
	      PutPixel16(ii,jj,LightGray,pRep);
	      End;
	    End;

	  End;

  { Tipo di griglia: nessuna }
  gNessuna: If (OldGriglia <> gNessuna)
              Then

	        Begin

	        SetColor(Black);
	        j := 10;

	        For i := 1 To MaxX Do
		  Begin
		  Inc(j,Lato);
		  Line(j,11,j,FondoY);
		  End;
	        j := 10;

	        For i := 1 To MaxY Do
		  Begin
		  Inc(j,Lato);
		  Line(11,j,FondoX,j);
		  End;

	        End;

  End; { Case }

SetColor(Brown);
Rectangle(10,10,FondoX+1,FondoY+1);
Rectangle(10,10,470,430);
OldGriglia := Griglia;
ShowMouse;

End; { DisegnaGriglia }


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.GRIGLIA                                       }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di griglia   }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:    vale Disegna se deve essere visualizzata la finestra        }
{               e se si deve attendere che l' utente scelga un' icona       }
{               (altrimenti vale NonDisegnare)                              }
{     gGriglia: individua il tipo di griglia (gLinee, gPunti, gNessuna)     }
{     Punt:     puntatore all' icona                                        }
{===========================================================================}
Procedure AssegnaPulsanteGriglia (     Metti:    TipoMetti;
                                       gGriglia: TipoGriglia;
                                   Var Punt:     RecP );

Const

      { Dati per l'icona del comando GRIGLIA A PUNTI. }
      ConstPPunti: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   195, 024, 193, 128,
             060, 231, 062, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   024, 193, 128, 000,
             231, 062, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   024, 193, 128, 000,
             231, 062, 000, 000,   000, 001, 128, 000));

      { Dati per l'icona del comando GRIGLIA A LINEE. }
      ConstPLinee: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 255, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             048, 000, 014, 000,   207, 255, 241, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             060, 231, 062, 000,   195, 024, 193, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             192, 000, 000, 000,   192, 000, 001, 128,
             063, 255, 254, 000,   192, 000, 001, 128,
             128, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             000, 000, 000, 000,   255, 255, 255, 128,
             255, 255, 128, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             255, 255, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   255, 255, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             255, 254, 000, 000,   000, 001, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             231, 062, 000, 000,   024, 193, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             231, 062, 000, 000,   024, 193, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 014, 000, 000,   255, 241, 128, 000,
             000, 000, 000, 000,   000, 001, 128, 000,
             000, 014, 000, 000,   255, 241, 128, 000));

      { Dati per l'icona del comando NO GRIGLIA. }
      ConstPNero: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 255, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             199, 255, 241, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 147, 030, 000,   060, 147, 030, 000,
             196, 147, 017, 128,   056, 000, 014, 000,
             252, 212, 158, 000,   060, 212, 158, 000,
             196, 212, 145, 128,   056, 000, 014, 000,
             252, 180, 158, 000,   060, 180, 158, 000,
             196, 180, 145, 128,   056, 000, 014, 000,
             252, 148, 158, 000,   060, 148, 158, 000,
             196, 148, 145, 128,   056, 000, 014, 000,
             252, 147, 030, 000,   060, 147, 030, 000,
             196, 147, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             252, 000, 030, 000,   060, 000, 030, 000,
             196, 000, 017, 128,   056, 000, 014, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             199, 255, 241, 128,   056, 000, 014, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             128, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             000, 000, 000, 000,   000, 000, 000, 000,
             255, 255, 255, 128,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 255, 000, 000,   000, 000, 000, 000,
             255, 255, 128, 000,   000, 000, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             000, 001, 128, 000,   255, 254, 000, 000,
             255, 254, 000, 000,   255, 254, 000, 000,
             255, 241, 128, 000,   000, 014, 000, 000,
             000, 030, 000, 000,   000, 030, 000, 000,
             000, 017, 128, 000,   000, 014, 000, 000,
             000, 030, 000, 000,   000, 030, 000, 000,
             000, 017, 128, 000,   000, 014, 000, 000));

Begin { AssegnaPulsanteGriglia }

{ Assegnazione del pulsante }
Case gGriglia Of
  gNessuna: Punt.P := @ConstPNero;
  gPunti:   Punt.P := @ConstPPunti;
  gLinee:   Punt.P := @ConstPLinee;
  End; { Case Griglia }

If (Metti = Disegna)
  Then
    PutImage(Punt.X,Punt.Y,Punt.P^,NormalPut);

End; { AssegnaPulsanteGriglia }


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.SHAPE                                         }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di forma     }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:   vale Disegna se deve essere visualizzata la finestra         }
{              e se si deve attendere che l' utente scelga un' icona        }
{              (altrimenti vale NonDisegnare)                               }
{     gShape:  individua il tipo di forma corrente, scelte fra sCerchio,    }
{              sCerchioPieno, sLinee, sLineePiene, sRettangolo,             }
{              sRettangoloPieno, sDisegnoLiberoestra                        }
{     Punt:    puntatore all' icona                                         }
{===========================================================================}
Procedure AssegnaPulsanteShape (     Metti:  TipoMetti;
                                     sShape: TipoShape;
                                 Var Punt:   RecP );

Const

      { Dati per l'icona della forma CERCHIO }
      ConstPCerchio: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 127, 000, 000,      255, 255, 255, 128,
             192, 127, 001, 128,      000, 127, 000, 000,
             192, 128, 128, 000,      255, 255, 255, 128,
             192, 128, 129, 128,      000, 128, 128, 000,
             193, 000, 064, 000,      255, 255, 255, 128,
             193, 000, 065, 128,      001, 000, 064, 000,
             194, 000, 032, 000,      255, 255, 255, 128,
             194, 000, 033, 128,      002, 000, 032, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             194, 000, 032, 000,      255, 255, 255, 128,
             194, 000, 033, 128,      002, 000, 032, 000,
             193, 000, 064, 000,      255, 255, 255, 128,
             193, 000, 065, 128,      001, 000, 064, 000,
             192, 128, 128, 000,      255, 255, 255, 128,
             192, 128, 129, 128,      000, 128, 128, 000,
             192, 127, 000, 000,      255, 255, 255, 128,
             192, 127, 001, 128,      000, 127, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della forma CERCHIO PIENO }
      ConstPCerchioPieno: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 127, 000, 000,      255, 255, 255, 128,
             192, 127, 001, 128,      000, 127, 000, 000,
             192, 128, 128, 000,      255, 255, 255, 128,
             192, 255, 129, 128,      000, 255, 128, 000,
             193, 000, 064, 000,      255, 255, 255, 128,
             193, 255, 193, 128,      001, 255, 192, 000,
             194, 000, 032, 000,      255, 255, 255, 128,
             195, 255, 225, 128,      003, 255, 224, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             194, 000, 032, 000,      255, 255, 255, 128,
             195, 255, 225, 128,      003, 255, 224, 000,
             193, 000, 064, 000,      255, 255, 255, 128,
             193, 255, 193, 128,      001, 255, 192, 000,
             192, 128, 128, 000,      255, 255, 255, 128,
             192, 255, 129, 128,      000, 255, 128, 000,
             192, 127, 000, 000,      255, 255, 255, 128,
             192, 127, 001, 128,      000, 127, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della forma LINEE (POLIGONO) }
      ConstPLinee: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 032, 000, 000,      255, 255, 255, 128,
             192, 032, 001, 128,      000, 032, 000, 000,
             192, 064, 000, 000,      255, 255, 255, 128, 
             192, 064, 001, 128,      000, 064, 000, 000,     
             192, 128, 000, 000,      255, 255, 255, 128, 
             192, 128, 001, 128,      000, 128, 000, 000,
             193, 000, 000, 000,      255, 255, 255, 128, 
             193, 000, 001, 128,      001, 000, 000, 000,
             194, 000, 000, 000,      255, 255, 255, 128, 
             194, 000, 001, 128,      002, 000, 000, 000,     
             196, 000, 000, 000,      255, 255, 255, 128,
             196, 000, 001, 128,      004, 000, 000, 000,     
             196, 000, 000, 000,      255, 255, 255, 128, 
             196, 000, 001, 128,      004, 000, 000, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 006, 016, 000,      255, 255, 255, 128, 
             196, 006, 017, 128,      004, 006, 016, 000,     
             196, 005, 016, 000,      255, 255, 255, 128,
             196, 005, 017, 128,      004, 005, 016, 000,
             196, 008, 144, 000,      255, 255, 255, 128, 
             196, 008, 145, 128,      004, 008, 144, 000,     
             196, 008, 080, 000,      255, 255, 255, 128, 
             196, 008, 081, 128,      004, 008, 080, 000,
             196, 016, 048, 000,      255, 255, 255, 128, 
             196, 016, 049, 128,      004, 016, 048, 000,
             199, 240, 016, 000,      255, 255, 255, 128, 
             199, 240, 017, 128,      007, 240, 016, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della forma LINEE PIENE (POLIGONO) }
      ConstPLineePiene: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 032, 000, 000,      255, 255, 255, 128,
             192, 032, 001, 128,      000, 032, 000, 000,     
             192, 064, 000, 000,      255, 255, 255, 128, 
             192, 120, 001, 128,      000, 120, 000, 000,     
             192, 128, 000, 000,      255, 255, 255, 128,
             192, 252, 001, 128,      000, 252, 000, 000,
             193, 000, 000, 000,      255, 255, 255, 128, 
             193, 254, 001, 128,      001, 254, 000, 000,     
             194, 000, 000, 000,      255, 255, 255, 128, 
             195, 255, 129, 128,      003, 255, 128, 000,     
             196, 000, 000, 000,      255, 255, 255, 128,
             199, 255, 193, 128,      007, 255, 192, 000,
             196, 000, 000, 000,      255, 255, 255, 128,
             199, 255, 225, 128,      007, 255, 224, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 006, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 005, 016, 000,      255, 255, 255, 128,
             199, 253, 241, 128,      007, 253, 240, 000,     
             196, 008, 144, 000,      255, 255, 255, 128, 
             199, 248, 241, 128,      007, 248, 240, 000,     
             196, 008, 080, 000,      255, 255, 255, 128,
             199, 248, 113, 128,      007, 248, 112, 000,
             196, 016, 048, 000,      255, 255, 255, 128, 
             199, 240, 049, 128,      007, 240, 048, 000,     
             199, 240, 016, 000,      255, 255, 255, 128, 
             199, 240, 017, 128,      007, 240, 016, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della forma RETTANGOLO }
      ConstPRettangolo: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             199, 255, 240, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             196, 000, 017, 128,      004, 000, 016, 000,
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             196, 000, 017, 128,      004, 000, 016, 000,     
             199, 255, 240, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della forma RETTANGOLO PIENO }
      ConstPRettangoloPieno: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             199, 255, 240, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128,
             199, 255, 241, 128,      007, 255, 240, 000,     
             196, 000, 016, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,
             199, 255, 240, 000,      255, 255, 255, 128, 
             199, 255, 241, 128,      007, 255, 240, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della forma DISEGNO LIBERO }
      ConstPDisegnoLibero: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             193, 192, 000, 000,      255, 255, 255, 128,
             193, 192, 001, 128,      001, 192, 000, 000,
             198, 000, 064, 000,      255, 255, 255, 128,
             198, 000, 065, 128,      006, 000, 064, 000,     
             200, 000, 160, 000,      255, 255, 191, 128, 
             200, 000, 161, 128,      008, 000, 160, 000,     
             200, 001, 016, 000,      255, 255, 031, 128, 
             200, 001, 017, 128,      008, 001, 016, 000,     
             200, 002, 032, 000,      255, 254, 063, 128, 
             200, 002, 033, 128,      008, 002, 032, 000,     
             200, 004, 064, 000,      255, 252, 127, 128,
             200, 004, 065, 128,      008, 004, 064, 000,     
             196, 008, 128, 000,      255, 248, 255, 128,
             196, 008, 129, 128,      004, 008, 128, 000,     
             196, 017, 000, 000,      255, 241, 255, 128, 
             196, 017, 001, 128,      004, 017, 000, 000,     
             196, 034, 000, 000,      255, 227, 255, 128,
             196, 034, 001, 128,      004, 034, 000, 000,
             200, 068, 000, 000,      255, 199, 255, 128, 
             200, 068, 001, 128,      008, 068, 000, 000,     
             208, 072, 000, 000,      255, 207, 255, 128,
             208, 072, 001, 128,      016, 072, 000, 000,     
             208, 112, 000, 000,      255, 255, 255, 128, 
             208, 112, 001, 128,      016, 112, 000, 000,     
             200, 128, 000, 000,      255, 255, 255, 128, 
             200, 128, 001, 128,      008, 128, 000, 000,     
             199, 000, 000, 000,      255, 255, 255, 128, 
             199, 000, 001, 128,      007, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della forma DISEGNO LIBERO }
      ConstPTesto:         RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 004, 000, 000,      255, 255, 255, 128,
             192, 004, 001, 128,      000, 004, 000, 000,
             192, 004, 000, 000,      255, 255, 255, 128,
             192, 004, 001, 128,      000, 004, 000, 000,
             192, 014, 000, 000,      255, 255, 255, 128,
             192, 014, 001, 128,      000, 014, 000, 000,
             192, 014, 000, 000,      255, 255, 255, 128,
             192, 014, 001, 128,      000, 014, 000, 000,
             192, 014, 000, 000,      255, 255, 255, 128,
             192, 014, 001, 128,      000, 014, 000, 000,
             192, 022, 000, 000,      255, 255, 255, 128,
             192, 022, 001, 128,      000, 022, 000, 000,
             192, 023, 000, 000,      255, 255, 255, 128,
             192, 023, 001, 128,      000, 023, 000, 000,
             192, 035, 000, 000,      255, 255, 255, 128,
             192, 035, 001, 128,      000, 035, 000, 000,
             192, 035, 000, 000,      255, 255, 255, 128,
             192, 035, 001, 128,      000, 035, 000, 000,
             192, 035, 128, 000,      255, 255, 255, 128,
             192, 035, 129, 128,      000, 035, 128, 000,
             192, 127, 128, 000,      255, 255, 255, 128,
             192, 127, 129, 128,      000, 127, 128, 000,
             192, 065, 128, 000,      255, 255, 255, 128,
             192, 065, 129, 128,      000, 065, 128, 000,
             192, 065, 128, 000,      255, 255, 255, 128,
             192, 065, 129, 128,      000, 065, 128, 000,
             192, 128, 192, 000,      255, 255, 255, 128,
             192, 128, 193, 128,      000, 128, 192, 000,
             193, 243, 240, 000,      255, 255, 255, 128,
             193, 243, 241, 128,      001, 243, 240, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));


Begin { AssegnaPulsanteShape }

{ Assegnazione del pulsante }
Case sShape Of
  sCerchio:         Punt.P := @ConstPCerchio;
  sCerchioPieno:    Punt.P := @ConstPCerchioPieno;
  sLinee:           Punt.P := @ConstPLinee;
  sLineePiene:      Punt.P := @ConstPLineePiene;
  sRettangolo:      Punt.P := @ConstPRettangolo;
  sRettangoloPieno: Punt.P := @ConstPRettangoloPieno;
  sDisegnoLibero:   Punt.P := @ConstPDisegnoLibero;
  sTesto:           Punt.P := @ConstPTesto;
  End; { Case Shape }

If (Metti = Disegna)
  Then
    PutImage(Punt.X,Punt.Y,Punt.P^,NormalPut);

End; { AssegnaPulsanteShape }


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.LINE                                          }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di linea     }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:   vale Disegna se deve essere visualizzata la finestra         }
{              e se si deve attendere che l' utente scelga un' icona        }
{              (altrimenti vale NonDisegnare)                               }
{     gLines:  individua il tipo di linea corrente, scelte fra lSolid1,     }
{              lDotted1, lCenter1, lDashed1, lSolid3, lDotted3, lCenter3,   }
{              lDashed3                                                     }
{     Punt:    puntatore all' icona                                         }
{===========================================================================}
Procedure AssegnaPulsanteLine (     Metti:  TipoMetti;
                                    lLines: TipoLine;
                                Var Punt:   RecP );

Const

      { Dati per l'icona della linea SOLIDLN (NORMWIDTH) }
      ConstPSolid1: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      015, 255, 248, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della linea DOTTEDLN (NORMWIDTH) }
      ConstPDotted1: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             202, 170, 168, 000,      245, 085, 087, 128,
             202, 170, 169, 128,      010, 170, 168, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della linea CENTERLN (NORMWIDTH) }
      ConstPCenter1: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             206, 186, 232, 000,      241, 069, 023, 128, 
             206, 186, 233, 128,      014, 186, 232, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della linea DASHEDLN (NORMWIDTH) }
      ConstPDashed1: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             206, 238, 232, 000,      241, 017, 023, 128, 
             206, 238, 233, 128,      014, 238, 232, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della linea SOLIDLN (THICKWIDTH) }
      ConstPSolid3: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      015, 255, 248, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      015, 255, 248, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      015, 255, 248, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della linea DOTTEDLN (THICKWIDTH) }
      ConstPDotted3: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      010, 170, 168, 000,
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      010, 170, 168, 000,     
             202, 170, 168, 000,      245, 085, 087, 128,
             202, 170, 169, 128,      010, 170, 168, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della linea CENTERLN (THICKWIDTH) }
      ConstPCenter3: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             206, 186, 232, 000,      241, 069, 023, 128, 
             206, 186, 233, 128,      014, 186, 232, 000,
             206, 186, 232, 000,      241, 069, 023, 128, 
             206, 186, 233, 128,      014, 186, 232, 000,     
             206, 186, 232, 000,      241, 069, 023, 128, 
             206, 186, 233, 128,      014, 186, 232, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona della linea DASHEDLN (THICKWIDTH) }
      ConstPDashed3: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             206, 238, 232, 000,      241, 017, 023, 128, 
             206, 238, 233, 128,      014, 238, 232, 000,
             206, 238, 232, 000,      241, 017, 023, 128, 
             206, 238, 233, 128,      014, 238, 232, 000,     
             206, 238, 232, 000,      241, 017, 023, 128,
             206, 238, 233, 128,      014, 238, 232, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));


Begin { AssegnaPulsanteLine }

{ Assegnazione del pulsante }
Case lLines Of
  lSolid1:   Punt.P := @ConstPSolid1;
  lDotted1:  Punt.P := @ConstPDotted1;
  lCenter1:  Punt.P := @ConstPCenter1;
  lDashed1:  Punt.P := @ConstPDashed1;
  lSolid3:   Punt.P := @ConstPSolid3;
  lDotted3:  Punt.P := @ConstPDotted3;
  lCenter3:  Punt.P := @ConstPCenter3;
  lDashed3:  Punt.P := @ConstPDashed3;
  End; { Case Lines }

If (Metti = Disegna)
  Then
    PutImage(Punt.X,Punt.Y,Punt.P^,NormalPut);

End; { AssegnaPulsanteLine }


{===========================================================================}
{ PROCEDURA: ASSEGNA.PULSANTE.PATTERN                                       }
{                                                                           }
{ Per limitare l' utilizzo della memoria, le icone per il tipo di retino    }
{ vengono definite solo in ambienti locali. I parametri sono:               }
{     Metti:     vale Disegna se deve essere visualizzata la finestra       }
{                e se si deve attendere che l' utente scelga un' icona      }
{                (altrimenti vale NonDisegnare)                             }
{     gPattern:  individua il tipo di retino corrente, scelte fra pEmpty,   }
{                pSolid, pLine, pLtSlash, pSlash, pBkSlash, pLtBkSlash,     }
{                pHatch, pXHatch, pInterleave, pWideDot, pCloseDot          }
{     Punt:      puntatore all' icona                                       }
{===========================================================================}
Procedure AssegnaPulsantePattern (     Metti:    TipoMetti;
                                       pPattern: TipoPattern;
                                   Var Punt:     RecP );
Const

      { Dati per l'icona del retino EMPTY }
      ConstPEmpty: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino SOLID }
      ConstPSolid: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000));    

      { Dati per l'icona del retino LINE }
      ConstPLine: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino LTSLASH }
      ConstPLtSlash: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             201, 153, 152, 000,      246, 102, 103, 128, 
             201, 153, 153, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             198, 102, 096, 000,      249, 153, 159, 128,
             198, 102, 097, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,
             201, 153, 152, 000,      246, 102, 103, 128, 
             201, 153, 153, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128,
             195, 051, 049, 128,      000, 000, 000, 000,
             198, 102, 096, 000,      249, 153, 159, 128, 
             198, 102, 097, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             201, 153, 152, 000,      246, 102, 103, 128, 
             201, 153, 153, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             198, 102, 096, 000,      249, 153, 159, 128, 
             198, 102, 097, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             201, 153, 152, 000,      246, 102, 103, 128,
             201, 153, 153, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,
             198, 102, 096, 000,      249, 153, 159, 128, 
             198, 102, 097, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128,
             204, 204, 201, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino SLASH }
      ConstPSlash: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             204, 113, 192, 000,      243, 142, 063, 128,
             204, 113, 193, 128,      000, 000, 000, 000,
             200, 227, 136, 000,      247, 028, 119, 128,
             200, 227, 137, 128,      000, 000, 000, 000,
             193, 199, 024, 000,      254, 056, 231, 128, 
             193, 199, 025, 128,      000, 000, 000, 000,     
             195, 142, 056, 000,      252, 113, 199, 128, 
             195, 142, 057, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      248, 227, 143, 128, 
             199, 028, 113, 128,      000, 000, 000, 000,
             206, 056, 224, 000,      241, 199, 031, 128, 
             206, 056, 225, 128,      000, 000, 000, 000,     
             204, 113, 192, 000,      243, 142, 063, 128,
             204, 113, 193, 128,      000, 000, 000, 000,     
             200, 227, 136, 000,      247, 028, 119, 128, 
             200, 227, 137, 128,      000, 000, 000, 000,     
             193, 199, 024, 000,      254, 056, 231, 128,
             193, 199, 025, 128,      000, 000, 000, 000,     
             195, 142, 056, 000,      252, 113, 199, 128, 
             195, 142, 057, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      248, 227, 143, 128, 
             199, 028, 113, 128,      000, 000, 000, 000,     
             206, 056, 224, 000,      241, 199, 031, 128,
             206, 056, 225, 128,      000, 000, 000, 000,
             204, 113, 192, 000,      243, 142, 063, 128, 
             204, 113, 193, 128,      000, 000, 000, 000,     
             200, 227, 136, 000,      247, 028, 119, 128, 
             200, 227, 137, 128,      000, 000, 000, 000,     
             193, 199, 024, 000,      254, 056, 231, 128, 
             193, 199, 025, 128,      000, 000, 000, 000,
             195, 142, 056, 000,      252, 113, 199, 128, 
             195, 142, 057, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      248, 227, 143, 128,
             199, 028, 113, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino BKSLASH }
      ConstPBkSlash: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             193, 199, 024, 000,      254, 056, 231, 128, 
             193, 199, 025, 128,      000, 000, 000, 000,     
             200, 227, 136, 000,      247, 028, 119, 128, 
             200, 227, 137, 128,      000, 000, 000, 000,     
             204, 113, 192, 000,      243, 142, 063, 128, 
             204, 113, 193, 128,      000, 000, 000, 000,     
             206, 056, 224, 000,      241, 199, 031, 128,
             206, 056, 225, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      248, 227, 143, 128, 
             199, 028, 113, 128,      000, 000, 000, 000,
             195, 142, 056, 000,      252, 113, 199, 128, 
             195, 142, 057, 128,      000, 000, 000, 000,     
             193, 199, 024, 000,      254, 056, 231, 128,
             193, 199, 025, 128,      000, 000, 000, 000,
             200, 227, 136, 000,      247, 028, 119, 128, 
             200, 227, 137, 128,      000, 000, 000, 000,     
             204, 113, 192, 000,      243, 142, 063, 128, 
             204, 113, 193, 128,      000, 000, 000, 000,     
             206, 056, 224, 000,      241, 199, 031, 128, 
             206, 056, 225, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      248, 227, 143, 128, 
             199, 028, 113, 128,      000, 000, 000, 000,     
             195, 142, 056, 000,      252, 113, 199, 128, 
             195, 142, 057, 128,      000, 000, 000, 000,     
             193, 199, 024, 000,      254, 056, 231, 128, 
             193, 199, 025, 128,      000, 000, 000, 000,     
             200, 227, 136, 000,      247, 028, 119, 128,
             200, 227, 137, 128,      000, 000, 000, 000,     
             204, 113, 192, 000,      243, 142, 063, 128, 
             204, 113, 193, 128,      000, 000, 000, 000,
             206, 056, 224, 000,      241, 199, 031, 128, 
             206, 056, 225, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      248, 227, 143, 128,
             199, 028, 113, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             128, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino LTBKSLASH }
      ConstPLtBkSlash: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             204, 113, 192, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             200, 227, 136, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             193, 199, 024, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             195, 142, 056, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,
             206, 056, 224, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 113, 192, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             200, 227, 136, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             193, 199, 024, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             195, 142, 056, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             206, 056, 224, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             204, 113, 192, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             200, 227, 136, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             193, 199, 024, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,
             195, 142, 056, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             199, 028, 112, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino HATCH }
      ConstPHatch: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             204, 204, 200, 000,      243, 051, 055, 128,
             204, 204, 201, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128,
             204, 204, 201, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128,
             204, 204, 201, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino XHATCH }
      ConstPXHatch: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128,
             195, 051, 049, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128,
             204, 204, 201, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             204, 204, 200, 000,      243, 051, 055, 128, 
             204, 204, 201, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             204, 204, 200, 000,      243, 051, 055, 128,
             204, 204, 201, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino INTERLEAVE }
      ConstPInterleave: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             202, 170, 168, 000,      245, 085, 087, 128,
             202, 170, 169, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128,
             202, 170, 169, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      000, 000, 000, 000,     
             207, 255, 248, 000,      240, 000, 007, 128,
             207, 255, 249, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128, 
             202, 170, 169, 128,      000, 000, 000, 000,
             207, 255, 248, 000,      240, 000, 007, 128, 
             207, 255, 249, 128,      000, 000, 000, 000,     
             202, 170, 168, 000,      245, 085, 087, 128,
             202, 170, 169, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino WIDEDOT }
      ConstPWideDot: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,     
             255, 255, 255, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128,
             195, 051, 049, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128,
             195, 051, 049, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128, 
             195, 051, 049, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             195, 051, 048, 000,      252, 204, 207, 128,
             195, 051, 049, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));

      { Dati per l'icona del retino CLOSEDOT }
      ConstPCloseDot: RecImage=
      (X:  24;
       Y:  24;
       Vet: (255, 255, 255, 128,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             255, 255, 255, 000,      255, 255, 255, 128,
             255, 255, 255, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             197, 085, 080, 000,      250, 170, 175, 128,
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             197, 085, 080, 000,      250, 170, 175, 128,
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             197, 085, 080, 000,      250, 170, 175, 128, 
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             197, 085, 080, 000,      250, 170, 175, 128, 
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             197, 085, 080, 000,      250, 170, 175, 128, 
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             197, 085, 080, 000,      250, 170, 175, 128, 
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             197, 085, 080, 000,      250, 170, 175, 128,
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,
             197, 085, 080, 000,      250, 170, 175, 128, 
             197, 085, 081, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128,
             192, 000, 001, 128,      000, 000, 000, 000,
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             192, 000, 000, 000,      255, 255, 255, 128, 
             192, 000, 001, 128,      000, 000, 000, 000,     
             128, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      255, 255, 255, 128, 
             255, 255, 255, 128,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000, 
             000, 000, 000, 000,      000, 000, 000, 000,     
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000,
             000, 000, 000, 000,      000, 000, 000, 000));


Begin { AssegnaPulsantePattern }

{ Assegnazione del pulsante }
Case pPattern Of
  pEmpty:      Punt.P := @ConstPEmpty;
  pSolid:      Punt.P := @ConstPSolid;
  pLine:       Punt.P := @ConstPLine;
  pLtSlash:    Punt.P := @ConstPLtSlash;
  pSlash:      Punt.P := @ConstPSlash;
  pBkSlash:    Punt.P := @ConstPBkSlash;
  pLtBkSlash:  Punt.P := @ConstPLtBkslash;
  pHatch:      Punt.P := @ConstPHatch;
  pXHatch:     Punt.P := @ConstPXHatch;
  pInterleave: Punt.P := @ConstPInterleave;
  pWideDot:    Punt.P := @ConstPWideDot;
  pCloseDot:   Punt.P := @ConstPCloseDot;
  End; { Case Pattern }

If (Metti = Disegna)
  Then
    PutImage(Punt.X,Punt.Y,Punt.P^,NormalPut);

End; { AssegnaPulsantePattern }


{===========================================================================}
{ PROCEDURA: DEFINISCI.PULSANTE                                             }
{                                                                           }
{ Definisce l' ARRAY principale di tutti i tasti presenti nel programma e   }
{ le loro posizioni.                                                        }
{===========================================================================}
Procedure DefinisciPulsanti;
Var
    { Ciclo }
    I: Integer;

Begin { DefinisciPulsanti }

{ Assegnazione delle costanti all'array di icone. }
P[Black].P         := @ConstP0;
P[Blue].P          := @ConstP1;
P[Green].P         := @ConstP2;
P[Cyan].P          := @ConstP3;
P[Red].P           := @ConstP4;
P[Magenta].P       := @ConstP5;
P[Brown].P         := @ConstP6;
P[LightGray].P     := @ConstP7;
P[DarkGray].P      := @ConstP8;
P[LightBlue].P     := @ConstP9;
P[LightGreen].P    := @ConstP10;
P[LightCyan].P     := @ConstP11;
P[LightRed].P      := @ConstP12;
P[LightMagenta].P  := @ConstP13;
P[Yellow].P        := @ConstP14;
P[White].P         := @ConstP15;
P[CmdNuovo].P      := @ConstPNuovo;
P[CmdLeggi].P      := @ConstPLeggi;
P[CmdSalva].P      := @ConstPSalva;
P[CmdEsci].P       := @ConstPEsci;
P[CmdZoomIn].P     := @ConstPZoomIn;
P[CmdZoomOut].P    := @ConstPZoomOut;
P[CmdTurbo].P      := @ConstPTurbo;
P[CmdInfo].P       := @ConstPInfo;
P[CmdDestra].P     := @ConstPDestra;
P[CmdSinistra].P   := @ConstPSinistra;
P[CmdSu].P         := @ConstPSu;
P[CmdGiu].P        := @ConstPGiu;

AssegnaPulsanteGriglia(NonDisegnare,Griglia,P[CmdGriglia]);
AssegnaPulsanteShape(NonDisegnare,Shape,P[CmdShape]);
AssegnaPulsanteLine(NonDisegnare,Lines,P[CmdLine]);
AssegnaPulsantePattern(NonDisegnare,Pattern,P[CmdPattern]);

{ Definizione delle coordinate X e Y. }
For i := Black To LightGray Do
  Begin
  P[i].x := 520;
  P[i].y := 10+i*30;
  End;
For i := DarkGray To White Do
  Begin
  P[i].x := 550;
  P[i].y := 10+(i-DarkGray)*30;
  End;
For i := Black To White Do
  PutImage(P[i].x,P[i].y,P[i].p^,NormalPut);

P[CmdNuovo].x := 580;
P[CmdNuovo].y := 10;
PutImage(P[CmdNuovo].x,P[CmdNuovo].y,P[CmdNuovo].p^,NormalPut);
P[CmdLeggi].x := 610;
P[CmdLeggi].y := 10;
PutImage(P[CmdLeggi].x,P[CmdLeggi].y,P[CmdLeggi].p^,NormalPut);
P[CmdEsci].x := 580;
P[CmdEsci].y := 40;
PutImage(P[CmdEsci].x,P[Cmdesci].y,P[CmdEsci].p^,NormalPut);
P[CmdSalva].x := 610;
P[CmdSalva].y := 40;
PutImage(P[CmdSalva].x,P[CmdSalva].y,P[CmdSalva].p^,NormalPut);
P[CmdZoomIn].x := 580;
P[CmdZoomIn].y := 70;
PutImage(P[CmdZoomIn].x,P[CmdZoomIn].y,P[CmdZoomIn].p^,NormalPut);
P[CmdZoomOut].x := 610;
P[CmdZoomOut].y := 70;
PutImage(P[CmdZoomOut].x,P[CmdZoomOut].y,P[CmdZoomOut].p^,NormalPut);
P[CmdGriglia].x := 580;
P[CmdGriglia].y := 100;
PutImage(P[CmdGriglia].x,P[CmdGriglia].y,P[CmdGriglia].p^,NormalPut);
P[CmdShape].x := 610;
P[CmdShape].y := 100;
PutImage(P[CmdShape].x,P[CmdShape].y,P[CmdShape].p^,NormalPut);
P[CmdLine].x := 580;
P[CmdLine].y := 130;
PutImage(P[CmdLine].x,P[CmdLine].y,P[CmdLine].p^,NormalPut);
P[CmdPattern].x := 610;
P[CmdPattern].y := 130;
PutImage(P[CmdPattern].x,P[CmdPattern].y,P[CmdPattern].p^,NormalPut);
P[CmdInfo].x := 580;
P[CmdInfo].y := 160;
PutImage(P[CmdInfo].x,P[CmdInfo].y,P[CmdInfo].p^,NormalPut);
P[CmdTurbo].x := 610;
P[CmdTurbo].y := 160;
PutImage(P[CmdTurbo].x,P[CmdTurbo].y,P[CmdTurbo].p^,NormalPut);
P[CmdDestra].x := 445;
P[CmdDestra].y := 440;
PutImage(P[CmdDestra].x,P[CmdDestra].y,P[CmdDestra].p^,NormalPut);
P[CmdSinistra].x := 10;
P[CmdSinistra].y := 440;
PutImage(P[CmdSinistra].x,P[CmdSinistra].y,P[CmdSinistra].p^,NormalPut);
P[CmdGiu].x := 480;
P[CmdGiu].y := 406;
PutImage(P[CmdGiu].x,P[CmdGiu].y,P[CmdGiu].p^,NormalPut);
P[CmdSu].x := 480;
P[CmdSu].y := 10;
PutImage(P[CmdSu].x,P[CmdSu].y,P[CmdSu].p^,NormalPut);

{ Definizione dello schermo piccolo. }
InizioRealX := P[CmdLeggi].X+25-MaxColonne-1;
InizioRealY := P[CmdGiu].Y+25-MaxRighe+1;

End; { DefinisciPulsanti }


{===========================================================================}
{ PROCEDURA: RETTANGOLO.REAL                                                }
{                                                                           }
{ Serve per disegnare l'area che rappresenta lo schermo grande in quello    }
{ a dimensioni reali, in modo da sapere sempre in che posizione ci si trova }
{ con lo schermo, anche se questo viene aiutato dal fatto che ai bordi del_ }
{ lo schermo si trovano le coordinate dei vertici. I parametri indicano l'  }
{ angolo di inizio (in alto a sinistra) del rettangolo appena descritto.    }
{===========================================================================}
Procedure RettangoloReal ( ValX: Integer;
			   ValY: Integer );

Var

    { Coordinate grafiche di inizio }
    X1: Integer;
    Y1: Integer;

    { Coordinate grafiche di fine }
    X2: Integer;
    Y2: Integer;

Begin { RettangoloReal }

X1 := InizioRealX+InizioX-2;
X2 := InizioRealX+FineX;
Y1 := InizioRealY+InizioY-2;
Y2 := InizioRealY+FineY;

{ Visualizzazione del rettangolo (o quadrato) }
If ((ValX In [X1,X2]) Or (ValY In [Y1,Y2]))
  Then

    Begin
    SetColor(LightCyan);
    SetWriteMode(XOrPut);
    Rectangle(X1,Y1,X2,Y2);
    SetWriteMode(NormalPut);
    End;

End; { RettangoloReal }


{===========================================================================}
{ PROCEDURA: WRITE.BAR.COORD                                                }
{                                                                           }
{ Questa procedura serve per disegnare le coordinate dello schermo grande   }
{ rispetto allo schermo in dimensioni reali, specificando quali coordinate  }
{ scrivere (Orizz per quelle orizzontali e Vert per quelle verticali) e i   }
{ valori di minimo e massimo da scrivere.                                   }
{===========================================================================}
Procedure WriteBarCoord ( Direzione: TipoDirezione;
			  ValMin:    Integer;
			  ValMax:    Integer );

Begin { WriteBarCoord }

{ A seconda della direzione scelta, il valore viene scritto
  in verticale o in orizzontale. Alla fine la procedura modifica
  i valori delle variabili InizioX e FineX o InizioY e FineY.
  In questo modo si evita di cancellare con un'area nera, ma basta
  riscrivere i valori precedenti in nero.                          }
SetTextStyle(DefaultFont,Direzione,1);
SetTextJustify(CenterText,CenterText);
SetFillStyle(SolidFill,Black);
HideMouse;

{ Direzione orizzontale }
If (Direzione = HorizDir)
  Then

    Begin
    Bar(395,445,440,459);
    Bar(38,445,75,459);
    SetColor(LightMagenta);
    Str(ValMin,St);
    OutTextXY(50,452,St);
    Str(ValMax,St);
    OutTextXY(440-TextWidth(St),452,St);
    InizioX := ValMin;
    FineX := ValMax;
    End

Else

  { Direzione verticale }
  If (Direzione = VertDir)
    Then

      Begin
      Bar(483,37,497,70);
      Bar(483,360,497,400);
      SetColor(LightMagenta);
      Str(ValMin,St);
      OutTextXY(490,45+TextHeight(St),St);
      Str(ValMax,St);
      OutTextXY(490,385,St);
      InizioY := ValMin;
      FineY := ValMax;
      End;

ShowMouse;

End; { WriteBarCoord }


{===========================================================================}
{ PROCEDURA: WRITE.POS.COORD                                                }
{                                                                           }
{ Serve per scrivere le coordinate della posizione del mouse su entrambi    }
{ gli schermi di disegno.                                                   }
{===========================================================================}
Procedure WritePosCoord ( ValX: Integer;
			  ValY: Integer );

Var

    { Stringa finale }
    St:  String;

    { Coordinata X }
    St1: String003;

    { Coordinata Y }
    St2: String003;

Begin { WritePosCoord }

{ Setup iniziali }
SetTextStyle(DefaultFont,HorizDir,1);
SetFillStyle(SolidFill,Black);
SetColor(LightBlue);
SetTextJustify(CenterText,CenterText);

WaitToWrite;
HideMouse;
Bar(240-15*TextWidth('█'),P[CmdSinistra].Y,
    240+15*TextWidth('█'),P[CmdSinistra].Y+25);

Str(ValX,St1);
Str(ValY,St2);
St := '<Colonna: '+St1+', Riga: '+St2+'>';
OutTextXY(240,P[CmdSinistra].Y+13,St);
ShowMouse;

End; { WritePosCoord }


{===========================================================================}
{ PROCEDURA: AGGIORNA.SCALA                                                 }
{                                                                           }
{ Scrive la scala corrente fra il disegno nella finestra più grande e quel_ }
{ lo nella finestra più piccola. Quella di defalut è 10:1.                  }
{===========================================================================}
Procedure AggiornaScala;

Begin { AggiornaScala }

SetFillStyle(SolidFill,Red);
WaitToWrite;
HideMouse;
Bar(P[CmdInfo].X+2,P[Yellow].Y+2,P[CmdTurbo].X+23,P[White].Y+23);

SetColor(LightGray);
Line(P[CmdInfo].X,P[Yellow].Y,P[CmdTurbo].X+24,P[Yellow].Y);
Line(P[CmdInfo].X,P[Yellow].Y+1,P[CmdTurbo].X+23,P[Yellow].Y+1);
Line(P[CmdInfo].X,P[Yellow].Y,P[CmdInfo].X,P[White].Y+24);
Line(P[CmdInfo].X+1,P[Yellow].Y,P[CmdInfo].X+1,P[White].Y+23);
SetColor(DarkGray);
Line(P[CmdInfo].X,P[White].Y+25,P[CmdTurbo].X+24,P[White].Y+25);
Line(P[CmdInfo].X+1,P[White].Y+24,P[CmdTurbo].X+24,P[White].Y+24);
Line(P[CmdTurbo].X+24,P[Yellow].Y+1,P[CmdTurbo].X+24,P[White].Y+25);
Line(P[CmdTurbo].X+23,P[Yellow].Y+2,P[CmdTurbo].X+23,P[White].Y+25);
SetTextJustify(CenterText,CenterText);
SetTextStyle(DefaultFont,HorizDir,1);
SetColor(Yellow);
Str(Lato,St);
OutTextXY(P[CmdTurbo].X-4,P[Yellow].Y+20,'Scala');
OutTextXY(P[CmdTurbo].X-4,P[White].Y+5,St+':1');
ShowMouse;

End; { AggiornaScala }


{===========================================================================}
{ PROCEDURA: AGGIORNA.NOME.FILE                                             }
{                                                                           }
{ Scrive in alto a destra il nome del file corrente.                        }
{===========================================================================}
Procedure AggiornaNomefile;

Begin { AggiornaNomeFile }

SetFillStyle(SolidFill,Black);
SetTextJustify(CenterText,CenterText);
SetTextStyle(DefaultFont,HorizDir,1);
SetColor(LightMagenta);
St := NomeFile;
If (St = '')
  Then
    St := '? NOME FILE ?';

WaitToWrite;
HideMouse;
Bar(P[Black].X,0,P[CmdLeggi].X+25,P[CmdLeggi].Y-1);
OutTextXY(P[CmdNuovo].X-3,4,St);
ShowMouse;

End; { AggiornaNomeFile }


{===========================================================================}
{ PROCEDURA: METTI.PUNTINI                                                  }
{                                                                           }
{ Serve per trasformare una stringa '12345' in '12.345', ossia mette i      }
{ puntini ogni 3 cifre della stringa.                                       }
{===========================================================================}
Procedure MettiPuntini ( Var Numero: String );

Const

      { Sottostringa da cercare }
      Sub: String= '.';

Begin { MettiPuntini }

If (Length(Numero) > 3)
  Then

    Begin
    Insert(Sub,Numero,Length(Numero)-2);
    If (Length(Numero) > 7)
      Then
        Begin
        Insert(Sub,Numero,Length(Numero)-6);
        If (Length(Numero) > 11)
          Then
            Begin
            Insert(Sub,Numero,Length(Numero)-10);
            If (Length(Numero) > 15)
              Then
                Insert(Sub,Numero,Length(Numero)-14);
            End;
        End;
    End;

End; { MettiPuntini }


{===========================================================================}
{ PROCEDURA: MERGE.SORT                                                     }
{                                                                           }
{ Serve per ordinare la directory del disco.                                }
{===========================================================================}
Procedure MergeSort ( Var Dir: PTRTipoDir;
		     	  Min: Integer;
		      	  Max: Integer );

Var

    { Perno }
    Middle: Integer;

    { Ciclo }
    I:      Integer;

    { Ciclo }
    J:      Integer;

    { Ciclo }
    K:      Integer;

Begin { MergeSort }
If (Min < Max)
  Then
    Begin

    { Calcolo metà }
    Middle := (Min+Max) Div 2;

    { Chiamate ricorsive ai 2 sotto-vettori }
    MergeSort(Dir,Min,Middle);
    MergeSort(Dir,Middle+1,Max);

    { Fusione dei 2 vettori }
    i := Min;
    j := Middle+1;
    k := 0;

    While (i <= Middle) And (j <= Max) Do
      If Dir^[i] < Dir^[j]
        Then
          Begin
          k := k+1;
          DirApp^[k] := Dir^[i];
          i := i+1;
          End

      Else

        Begin
        k := k+1;
        DirApp^[k] := Dir^[j];
        j := j+1;
        End;

    If (i > Middle)
      Then
        For i := j To Max Do
          Begin
          k := k+1;
          DirApp^[k] := Dir^[i]
          End

    Else

      For j := i To Middle Do
        Begin
        k := k+1;
        DirApp^[k] := Dir^[j];
        End;

    For i := 1 To k Do
      Dir^[i+Min-1] := DirApp^[i];

    End;

End; { MergeSort }


{===========================================================================}
{ PROCEDURA: INFORMAZIONE                                                   }
{                                                                           }
{ Visualizza alcune informazioni riguardanti il disco, il computer, il file }
{ ecc., premendo l' icona INFORMAZIONI.                                     }
{===========================================================================}
Procedure Informazione ( Var NumRighe: Byte;
		         Var Stringhe: TipoStringhe );

Var

    { Versione del DOS }
    Version:   Word;

    { Anno }
    Year:      Word;

    { Mese }
    Month:     Word;

    { Giorno }
    Day:       Word;

    { Giorno della settimana }
    DayOfWeek: Word;

    { Ora }
    Hour:      Word;

    { Minuti }
    Minute:    Word;

    { Secondi }
    Second:    Word;

    { Centesimi di secondo }
    Sec100:    Word;

    { Stringa per conversioni }
    St1:       String;

    { Stringa per conversioni }
    St2:       String;

    { Stringa per conversioni }
    St3:       String;

    { Stringa per conversioni }
    St4:       String;

    { Ciclo }
    I:         Integer;

    { Ciclo }
    J:         Integer;

    { Ciclo }
    K:         Integer;

    { Dimensioni in Turbo Pascal dello sprite }
    X:         Integer;

    { Numero di righe }
    Righe:     Integer;

    { Numero di colonne }
    Colonne:   Integer;

    { Il colore è stato trovato ? }
    Trovato:   Boolean;

    { Directory corrente }
    D:         DirStr;

    { Nome del file }
    N:         NameStr;

    { Estensione del file }
    E:         ExtStr;

    { Numero massimo di colonne }
    MaxCol:    Integer;

Begin { Informazione }

{ Titolo }
NumRighe := 19;
Stringhe[1] := 'L ';
Stringhe[2] := 'O***** INFORMAZIONI GENERALI *****';
Stringhe[3] := 'L';
Righe := 1;
Colonne := 1;

{ Numero di righe e colonne teoriche }
For i := 1 To MaxColonne Do
  For j := 1 To MaxRighe Do
    If Vet^[i,j] <> Black Then
      Begin
      If (i > Colonne)
        Then
          Colonne := i;
      If (j > Righe)
        Then
          Righe := j;
      End;
Str(Righe,St1);
Str(Colonne,St2);
Stringhe[4] := 'LDimensioni Teoriche Sprite ...... '+St1+' Righe e '+St2+' Colonne';


{ Numero di righe e colonne reali }
x := Colonne;
While (x / 8) <> (x Div 8) Do
  Inc(x);
Str(x,St2);
Str(Righe,St1);
Stringhe[5] := 'LDimensioni Reali Sprite ......... '+St1+' Righe e '+St2+' Colonne';

{ Memoria occupata dallo sprite }
Str(Righe*Colonne,St1);
MettiPuntini(St1);
Stringhe[6] := 'LMemoria Occupata Dallo Sprite ... '+St1+' Bytes';

{ Memoria occupata dallo sprite in ambiente Turbo Pascal }
Str(((Righe*Colonne) Div 2+8),St1);
MettiPuntini(St1);
Stringhe[7] := 'LMemoria Occupata In Turbo ....... '+St1+' Bytes';

{ Memoria DOS libera }
Str(MaxColonne*MaxRighe-Colonne*Righe,St1);
MettiPuntini(St1);
Stringhe[8] := 'LMemoria Disponibile ............. '+St1+' Bytes';

{ Colori utilizzati }
MaxCol := 0;
For k := 1 To 16 Do
  Begin

  i := 0;
  j := 1;
  Trovato := False;

  Repeat
    Inc(i);

    If (i > Colonne)
      Then
        Begin
        i := 1;
        Inc(j);
        End;
    If (Vet^[i,j] = k)
      Then
        Begin
        Trovato := True;
        Inc(MaxCol);
        End;

  Until ((j > Righe) Or Trovato);

  End;

Str(MaxCol,St1);
Stringhe[9] := 'LColori Utilizzati ............... '+St1+' + Il Nero';

{ Colore corrente }
Case Color Of
  Black:        St1 := 'Nero';
  Blue:         St1 := 'Blu';
  Green:        St1 := 'Verde';
  Cyan:         St1 := 'Azzurro';
  Red:          St1 := 'Rosso';
  Magenta:      St1 := 'Magenta';
  Brown:        St1 := 'Marrone';
  LightGray:    St1 := 'Grigio Chiaro';
  DarkGray:     St1 := 'Grigio Scuro';
  LightBlue:    St1 := 'Blu Chiaro';
  LightGreen:   St1 := 'Verde Chiaro';
  LightCyan:    St1 := 'Azzurro Chiaro';
  LightRed:     St1 := 'Rosso Chiaro';
  LightMagenta: St1 := 'Magenta Chiaro';
  Yellow:       St1 := 'Giallo';
  White:        St1 := 'Bianco';
  End; { Case Color }
Stringhe[10] := 'LColore Attuale .................. '+St1;

{ Memoria DOS libera }
Str(MemAvail,St1);
MettiPuntini(St1);
Stringhe[11] := 'LMemoria Del Sistema ............. '+St1+' Bytes';

{ blocco più grande DOS libero }
Str(MaxAvail,St1);
MettiPuntini(St1);
Stringhe[12] := 'LBlocco Più Grande Del Sistema ... '+St1+' Bytes';

{ Capacità del disco }
Str(DiskSize(DriveDefault),St1);
MettiPuntini(St1);
Stringhe[13] := 'LCapacità Del Disco .............. '+St1+' Bytes';

{ Spazio libero sul disco }
Str(DiskFree(DriveDefault),St1);
MettiPuntini(St1);
Stringhe[14] := 'LSpazio Su Disco Libero .......... '+St1+' Bytes';

{ Directory corrente }
GetDir(DriveDefault,St1);
FSplit(St1,D,N,E);
Stringhe[15] := 'LSub-Directory Corrente .......... '+St1;

{ Versione del dos }
Version := DosVersion;
Str(Lo(Version),St1);
Str(Hi(Version),St2);
Stringhe[16] := 'LVersione DOS .................... '+St1+'.'+St2;

{ Data corrente }
GetDate(Year, Month, Day, DayOfWeek);

{ Mese }
Case Month Of
   1: St3 := 'Gennaio';
   2: St3 := 'Febbraio';
   3: St3 := 'Marzo';
   4: St3 := 'Aprile';
   5: St3 := 'Maggio';
   6: St3 := 'Giugno';
   7: St3 := 'Luglio';
   8: St3 := 'Agosto';
   9: St3 := 'Settembre';
  10: St3 := 'Ottobre';
  11: St3 := 'Novembre';
  12: St3 := 'Dicembre';
  End; { Month }

{ Giorno }
Case DayOfWeek Of
  0: St1 := 'Lunedi';
  1: St1 := 'Martedi';
  2: St1 := 'Mercoledi';
  3: St1 := 'Giovedi';
  4: St1 := 'Venerdi';
  5: St1 := 'Sabato';
  6: St1 := 'Domenica';
  End; { DayOfWeek }

Str(Day,St2);
Str(Year,St4);
Stringhe[17] := 'LData Attuale .................... '+St1+' '+St2+' '+St3+' '+St4;

{ Ora corrente }
Stringhe[18] := 'LOra Attuale .....................            ';
Stringhe[19] := 'L ';

End; { Informazione }


{===========================================================================}
{ PROCEDURA: NORMAL.WINDOW                                                  }
{                                                                           }
{ Aggiusta il contenuto della finestra attiva, separando i colori dal testo }
{ di ogni riga.                                                             }
{===========================================================================}
Procedure NormalWindow ( Var NumRighe: Byte;
			 Var Stringhe: TipoStringhe;
			 Var Stringa:  String );

Var

    { Stringa di appoggio }
    St: String;

Begin { NormalWindow }

NumRighe := 0;
St := Stringa;

Repeat
  Inc(NumRighe);
  If (Pos('^',St) <> 0)
    Then
      Begin
      Stringhe[NumRighe] := Copy(St,1,Pos('^',St)-1);
      Delete(St,1,Pos('^',St));
      End

  Else

    Begin
    Stringhe[NumRighe] := St;
    St := '';
    End;

Until (St = '');

End; { NormalWindow }


{===========================================================================}
{ PROCEDURA: CHECK.TIME                                                     }
{                                                                           }
{ Se occorre, visualizza l' ora, i minuti, i secondi e i centesimi di se_   }
{ condi nelle coordinate grafiche opportune.                                }
{===========================================================================}
Procedure CheckTime ( Var Stringa:    String;
		      Var PulsSfondo: Byte;
		      Var Hour:       Word;
		      Var Minute:     Word;
		      Var Second:     Word;
		      Var Sec100:     Word;
		      Var OldHour:    Word;
		      Var OldMinute:  Word;
		      Var OldSecond:  Word;
		      Var OldSec100:  Word );

Var

     { Stringa di appoggio }
     St1: String;

Begin { CheckTime }

GetMPos;

If (Stringa = '***INFO***')
  Then
    Begin

    SetTextJustify(LeftText,CenterText);
    GetTime(Hour, Minute, Second, Sec100);

    If ((MouseX >= 355) And (MouseX <= 470)) And
       ((MouseY >= 320) And (MouseY <= 355))
         Then
           Begin
           WaitToWrite;
           HideMouse;
           End;

    If (OldHour <> Hour)
      Then
        Begin
        Str(OldHour:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        SetColor(PulsSfondo);
        OutTextXY(380,345,St1);
        SetColor(LightCyan);
        OldHour := Hour;
        Str(Hour:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        OutTextXY(380,345,St1+':');
        End;

    If (OldMinute <> Minute)
      Then
        Begin
        Str(OldMinute:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        SetColor(PulsSfondo);
        OutTextXY(404,345,St1);
        SetColor(LightCyan);
        OldMinute := Minute;
        Str(Minute:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        OutTextXY(404,345,St1+':');
        End;

    If (OldSecond <> Second)
      Then
        Begin
        Str(OldSecond:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        SetColor(PulsSfondo);
        OutTextXY(428,345,St1);
        SetColor(LightCyan);
        OldSecond := Second;
        Str(Second:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        OutTextXY(428,345,St1+'.');
        End;

    If (OldSec100 <> Sec100)
      Then
        Begin
        Str(OldSec100:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        SetColor(PulsSfondo);
        OutTextXY(451,345,St1);
        SetColor(LightCyan);
        OldSec100 := Sec100;
        Str(Sec100:2,St1);
        If (St1[1] = ' ')
          Then
            St1[1] := '0';
        OutTextXY(451,345,St1);
        End;

    If ((MouseX >= 355) And (MouseX <= 470)) And
       ((MouseY >= 320) And (MouseY <= 355))
         Then
           ShowMouse;

    End;

End; { CheckTime }


{===========================================================================}
{ PROCEDURA: TYPER                                                          }
{                                                                           }
{ Visualizza sul video (in modalità testo) la stringa specificata come pa_  }
{ rametro in una maniera diversa dal normale (come una macchina da scrive_  }
{ re).                                                                      }
{===========================================================================}
Procedure Typer ( Stringa: String;
		  Riga:    Byte;
		  Colonna: Byte );

Var

    { Ciclo }
    I: Byte;

Begin { Typer }

While (Length(Stringa) < 79) Do
  Stringa := Stringa+' ';

GoToXY(Colonna,Riga);
NoSound;

For i := 1 To Length(Stringa) Do
  Begin
  Write('█');
  Delay(2);
  GoToXY(WhereX-1,WhereY);
  Write(Stringa[i]);
  End;

Sound(1000);
Delay(30);
NoSound;
Delay(5);

End; { Typer }


{===========================================================================}
{ PROCEDURA: INSERT.PATH                                                    }
{                                                                           }
{ Attende che l' utente inserisca il path dove si trovano i files *.BGI e   }
{ *.CHR, continuando fino a che l' utente non vuole uscire o fino a che il  }
{ path non sia corretto.                                                    }
{===========================================================================}
Procedure InsertPath ( Var PathBGI:  String;
			   Errore:   Integer );
Var

    { Tasto premuto dall'utente }
    Ch: Char;

Begin { InsertPath }

SpegniCursore;
TextAttr := White;
ClrScr;
TextAttr := Yellow;
Typer(' ',1,1);
Typer(' ',2,1);
TextAttr := Yellow+Red*16;
Typer('                                                                ',3,1);
Typer('                 SPRITE MANAGER VERSIONE '+Version+' - DI FOCHI MICHELE ',4,1);
Typer('                                                                ',5,1);
TextAttr := LightMagenta;
Typer(' ',6,1);
Typer(' ',7,1);
Typer('          Impossibile continuare.',8,1);
Typer(' ',9,1);
Typer('          Errore grafico : '+GraphErrorMsg(Errore),10,1);
Typer(' ',11,1);
Typer('          Digita il path dove si trova il file EGAVGA.BGI o premi',12,1);
Typer(' ',13,1);
Typer('          RETURN per uscire.',14,1);
Typer(' ',15,1);
TextAttr := Yellow;
Typer('          Si ricorda che il programma Sprite Manager necessita',16,1);
Typer(' ',17,1);
Typer('          di una scheda grafica VGA 640x400 o VGA 640x480.',18,1);
TextAttr := White;
Typer(' ',19,1);
Typer(' ',20,1);
Typer('          Path > ',21,1);
GoToXY(19,21);
TextAttr := LightCyan;

While KeyPressed Do
  Ch := ReadKey;
CursoreGrande;
ReadLn(PathBGI);

End; { InsertPath }


{===========================================================================}
{ PROCEDURA: ABORT                                                          }
{                                                                           }
{ Esce dal programma perchè non è disponibile la scheda grafica VGA.        }
{===========================================================================}
Procedure Abort ( Errore: Integer );

Var

    { Tasto premuto dall'utente }
    Ch: Char;

Begin { Abort }

CloseGraph;

{ Libera la memoria occupata }
Dispose(Vet);
Dispose(OldVet);
Dispose(Dir);
Dispose(DirApp);

TextAttr := LightGray;
SpegniCursore;
ClrScr;
TextAttr := Yellow;
Typer(' ',1,1);
Typer(' ',2,1);
TextAttr := Yellow+Red*16;
Typer('                                                                ',3,1);
Typer('                 SPRITE MANAGER VERSIONE '+Version+' - DI FOCHI MICHELE ',4,1);
Typer('                                                                ',5,1);
TextAttr := LightMagenta;
Typer(' ',6,1);
Typer(' ',7,1);
Typer('          Impossibile continuare.',8,1);
Typer(' ',9,1);
Typer('          Errore grafico : '+GraphErrorMsg(Errore),10,1);
Typer(' ',11,1);
TextAttr := Yellow;
Typer('          Si ricorda che il programma Sprite Manager necessita',12,1);
Typer(' ',13,1);
Typer('          di una scheda grafica VGA 640x400 o VGA 640x480.',14,1);
Typer(' ',15,1);
TextAttr := LightCyan+Blink;
Typer('          ERRORE IRREVERSIBILE : PROGRAMMA INTERROTTO !',16,1);
TextAttr := LightGray;
Typer(' ',17,1);
Typer(' ',18,1);
Typer(' ',19,1);
Typer(' ',20,1);

While KeyPressed Do
  Ch := ReadKey;
CursorePiccolo;
GoToXY(1,21);
Halt(1);

End; { Abort }


{===========================================================================}
{ PROCEDURA: END.SPRITE.MANAGER                                             }
{                                                                           }
{ Esce dal programma liberando la memoria e chiudendo la modalità grafica,  }
{ tornando quindi alla modalità testo 25x80. Cambia la directory corrente   }
{ (ritorna quindi a quella in cui si era al momento dell' esecuzione del    }
{ programma) e visualizza sul video alcune informazioni per l' utente.      }
{===========================================================================}
Procedure EndSpriteManager;

Var

    { Tasto premuto dall'utente }
    Ch: Char;

Begin { EndSpriteManager }

{$I-}
ChDir(CurrDir);
{$I+}

GraphDefaults;
CloseGraph;
TextAttr := LightGray;
ClrScr;
TextAttr := Yellow;
Typer(' ',1,1);
Typer(' ',2,1);
TextAttr := Yellow+Red*16;
Typer('                                                                ',3,1);
Typer('                 SPRITE MANAGER VERSIONE '+Version+' - DI FOCHI MICHELE ',4,1);
Typer('                                                                ',5,1);
TextAttr := LightMagenta;
Typer(' ',6,1);
Typer(' ',7,1);
Typer('          Arrivederci.',8,1);
Typer(' ',9,1);
TextAttr := Yellow;
Typer(' ',10,1);
TextAttr := LightGray;
Typer(' ',11,1);
Typer(' ',12,1);
WriteLn;

While KeyPressed Do
  Ch := ReadKey;

End; { EndSpriteManager }


{===========================================================================}
{ PROCEDURA: ERRORE.MOUSE                                                   }
{                                                                           }
{ Esce dal programma perchè non è stato trovato il mouse oppure non è stato }
{ caricato il suo driver in memoria. Il programma utilizza solo questo      }
{ dispositivo.                                                              }
{===========================================================================}
Procedure ErroreMouse;

Var

    { Tasto premuto dall'utente }
    Ch: Char;

Begin { ErroreMouse }

CloseGraph;

{ Libera la memoria occupata }
Dispose(Vet);
Dispose(OldVet);
Dispose(Dir);
Dispose(DirApp);

TextAttr := LightGray;
ClrScr;
TextAttr := Yellow;
Typer(' ',1,1);
Typer(' ',2,1);
TextAttr := Yellow+Red*16;
Typer('                                                                ',3,1);
Typer('                 SPRITE MANAGER VERSIONE '+Version+' - DI FOCHI MICHELE ',4,1);
Typer('                                                                ',5,1);
TextAttr := LightMagenta;
Typer(' ',6,1);
Typer(' ',7,1);
Typer('          Il mouse non è stato installato nel sistema!',8,1);
Typer(' ',9,1);
TextAttr := Yellow;
Typer('          Tale dispositivo è indispensabile per il programma.',10,1);
TextAttr := LightGray;
Typer(' ',11,1);
Typer('          Suggerimento: caricare il driver relativo e riprovare.',12,1);
Typer(' ',13,1);
WriteLn;

While KeyPressed Do
  Ch := ReadKey;

End; { ErroreMouse }


{===========================================================================}
{ PROCEDURA: SPEGNI.CURSORE                                                 }
{                                                                           }
{ Nasconde la visualizzazione del cursore alla vista dell' utente.          }
{===========================================================================}
Procedure SpegniCursore;

Var

    { Variabile registro DOS }
    Regs : Registers;

Begin { SpegniCursore }

With Regs Do
  Begin
  AH := $01;
  CH := $20;
  CL := $20;
  End;

Intr($10,Regs);

End; { SpegniCursore }


{===========================================================================}
{ PROCEDURA: CURSORE.PICCOLO                                                }
{                                                                           }
{ Visualizza il cursore come una piccola linea in fondo ('_').              }
{===========================================================================}
Procedure CursorePiccolo;

Var

    { Variabile registro DOS }
    Regs : Registers;

Begin { CursorePiccolo }

With Regs Do
  Begin
  AH := $0F;
  Intr($10,Regs);
  If (AL = 7)
    Then
      Begin
      AH := $01;
      CH := 12;
      CL := 13;
      End

  Else

    Begin
    AH := $01;
    CH := 6;
    CL := 7;
    End

  End;

Intr($10,Regs);

End; { CursorePiccolo }


{===========================================================================}
{ PROCEDURA: CURSORE.GRANDE                                                 }
{                                                                           }
{ Visualizza il cursore come un blocco pieno ('█').                         }
{===========================================================================}
Procedure CursoreGrande;

Var

    { Variabile registro DOS }
    Regs : Registers;

Begin { CursoreGrande }

With Regs Do
  Begin
  AH := $0F;
  Intr($10,Regs);
  If (AL = 7)
    Then
      Begin
      AH := $01;
      CH := 0;
      CL := 13;
      End

  Else

    Begin
    AH := $01;
    CH := 0;
    CL := 7;
    End

  End;

Intr($10,Regs);

End; { CursoreGrande }

End. { UtilSpr1 }
