{============================================================================}
{                                                                            }
{                  SPRITE MANAGER v5.0 - UNIT UTILSPR2                       }
{                                                                            }
{ Data di ultima modifica .............. Mercoledi, 21 Aprile 1993           }
{                                                                            }
{ Questa UNIT fa parte del programma Sprite Manager 5.0.                     }
{                                                                            }
{ Essa contiene procedure e funzioni per il programma.                       }
{                                                                            }
{============================================================================}
{$R-,S-,B-}
Unit UtilSpr2;

Interface { UtilSpr2 }

Uses Dos,              { Gestisce i file e la directory del disco }
     Crt,              { Gestisce lo schermo in modalità testo    }
     Graph,            { Gestisce lo schermo in modalità grafica  }
     Pulsanti,         { Definisce tutte le icone del programma   }
     Mouse,            { Gestisce il mouse                        }
     UtilSpr1;         { Procedure varie per il programma 1/2     }


{===========================================================================}
{ PROCEDURA: STAMPA.DIR                                                     }
{                                                                           }
{ Visualizza sul video il contenuto della directory corrente.               }
{ I parametri hanno gli stessi nomi delle variabili globali.                }
{===========================================================================}
Procedure StampaDir ( Var Inizio:      Integer;
                      Var InizioDialX: Integer;
                      Var InizioDialY: Integer;
                      Var FineDialX:   Integer;
                      Var FineDialY:   Integer;
                      Var NumFiles:    Integer;
                      Var Dir:         PTRTipoDir;
                      Var Select:      Integer;
                      Var OldSelect:   Integer;
                      Var Risult:      Boolean );


{===========================================================================}
{ PROCEDURA: AGGIORNA                                                       }
{                                                                           }
{ Aggiorna l' evidenziatore all' interno della lista della directory.       }
{ I parametri hanno gli stessi nomi delle variabili globali.                }
{===========================================================================}
Procedure Aggiorna ( Var Select:      Integer;
                     Var OldSelect:   Integer;
                     Var Inizio:      Integer;
                     Var NumFiles:    Integer;
                     Var InizioDialX: Integer;
                     Var InizioDialY: Integer;
                     Var FineDialX:   Integer;
                     Var FineDialY:   Integer;
                     Var Dir:         PTRTipoDir;
                     Var Risult:      Boolean );


{===========================================================================}
{ PROCEDURA: LEGGI.PATH                                                     }
{                                                                           }
{ Legge il contenuto del disco e setta opportunamente le variabili interes_ }
{ sate (vettore nello heap, numero di files, ecc.).                         }
{ I parametri hanno gli stessi nomi delle variabili globali.                }
{===========================================================================}
Procedure LeggiPath ( Var Path:        StringPath;
                      Var Risult:      Boolean;
                      Var Tasti:       TipoTasti;
                      Var InizioDialX: Integer;
                      Var InizioDialY: Integer;
                      Var FineDialX:   Integer;
                      Var FineDialY:   Integer;
                      Var Dir:         PTRTipoDir;
                      Var NumFiles:    Integer;
                      Var Inizio:      Integer;
                      Var Select:      Integer;
                      Var OldSelect:   Integer );


{===========================================================================}
{ PROCEDURA: WINDOWS                                                        }
{                                                                           }
{ E' la procedura più importante del programma, in quanto tutte le finestre }
{ di dialogo sono gestite e disegnate da questa. I parametri sono:          }
{   X1:          inizio X                                                   }
{   Y1:          inizio Y                                                   }
{   X2:          fine X                                                     }
{   Y2:          fine Y                                                     }
{   Stringa:     testo della finestra (usare ^ per separare le righe)       }
{   PulsAlto:    colore delle linne in alto (come i tasti)                  }
{   PulsBasso:   colore delle linee in basso                                }
{   PulsSfondo:  colore di sfondo                                           }
{   Tasti:       tipo di tasti da integrare nella finestra.                 }
{===========================================================================}
Procedure Windows ( X1:         Integer;
		    Y1:         Integer;
                    X2:         Integer;
                    Y2:         Integer;
		    Stringa:    String;
		    PulsAlto:   Byte;
                    PulsBasso:  Byte;
                    PulsSfondo: Byte;
                    Tasti:      TipoTasti;
                    Ext:        String003 );


{===========================================================================}
{ PROCEDURA: SALVA.FILE                                                     }
{                                                                           }
{ Salva il file (con conferma) di nome FileName.                            }
{===========================================================================}
Procedure SalvaFile ( Var FileName: StringFile );


{===========================================================================}
{ PROCEDURA: LEGGI.FILE                                                     }
{                                                                           }
{ Legge il file (con conferma) di nome FileName.                            }
{===========================================================================}
Procedure LeggiFile ( Var FileName: StringFile );


{===========================================================================}
{ PROCEDURA: CREA.FILE.TURBO                                                }
{                                                                           }
{ Crea un file in Turbo Pascal che visualizzi lo sprite che si trova in     }
{ memoria.                                                                  }
{===========================================================================}
Procedure CreaFileTurbo ( Var NomeFile: StringFile );


{===========================================================================}
{ FUNZIONE: EXPAND.3                                                        }
{                                                                           }
{ Espande la cifra a 3 cifre, aggiungendogli se necessario degli zero in    }
{ testa. Restituisce una stringa (generalmente di 3 cifre).                 }
{===========================================================================}
Function  Expand3 ( Valore: Integer ): String;


{===========================================================================}
{ PROCEDURA: SPRITE.MANAGER                                                 }
{                                                                           }
{ E' il cuore del programma, quello che lo fa partire.                      }
{===========================================================================}
Procedure SpriteManager;


{===========================================================================}
{ PROCEDURA: RELEASE.BUTTONS                                                }
{                                                                           }
{ Attende che l' utente rilasci tutti i pulsanti del mouse (nel frattenpo   }
{ non esegue nessuna operazione).                                           }
{===========================================================================}
Procedure ReleaseButtons;


{===========================================================================}
{ PROCEDURA: ICON.WINDOWS                                                   }
{                                                                           }
{ E' molto simile alla procedura WINDOWS, ma questa visualizza delle icone  }
{ (per la scelta del tipo di griglia, retino, linea o forma da disegnare).  }
{ I parametri sono quasi gli stessi, tranne l' ultimo:                      }
{   X1:          inizio X                                                   }
{   Y1:          inizio Y                                                   }
{   X2:          fine X                                                     }
{   Y2:          fine Y                                                     }
{   Stringa:     testo della finestra (usare ^ per separare le righe)       }
{   PulsAlto:    colore delle linne in alto (come i tasti)                  }
{   PulsBasso:   colore delle linee in basso                                }
{   PulsSfondo:  colore di sfondo                                           }
{   Icone:       tipo di icona da integrare nella finestra, scelte fra      }
{                IconeShape, IconeLines, IconePattern, IconeGriglia         }
{===========================================================================}
Procedure IconWindows ( X1:         Integer;
                        Y1:         Integer;
                        X2:         Integer;
                        Y2:         Integer;
                        Stringa:    String;
		        PulsAlto:   Byte;
                        PulsBasso:  Byte;
                        PulsSfondo: Byte;
                        Icone:      TipoIcone );


{===========================================================================}
{ PROCEDURA: GET.SPRITE                                                     }
{                                                                           }
{ Legge il contenuto dell' immagine piccola in basso a destra e lo copia in }
{ quella grande (settando opportunamente tutti i valori dei pixels in       }
{ memoria).                                                                 }
{===========================================================================}
Procedure GetSprite;


{===========================================================================}
{ PROCEDURA: GET.ALL.SPRITE                                                 }
{                                                                           }
{ Legge il contenuto dell' intera immagine piccola in basso a destra e lo   }
{ copia in quella grande (settando opportunamente tutti i valori dei pixels }
{ in { memoria).                                                            }
{===========================================================================}
Procedure GetAllSprite;


{===========================================================================}
{ PROCEDURA: DISEGNA.FIGURA                                                 }
{                                                                           }
{ Disegna la figura sullo schermo (cerchio, punto, linea, ellisse, figure   }
{ piene, ecc.). L' unico parametro è Luogo, che indica il luogo in cui deve }
{ essere disegnata (nella finestra grande o in quella piccola) e può assu_  }
{ mere i valori: FinGrande, FinPiccola.                                     }
{===========================================================================}
Procedure DisegnaFigura ( Luogo: TipoDisegna );



Implementation { UtilSpr2 }



{===========================================================================}
{ PROCEDURA: STAMPA.DIR                                                     }
{                                                                           }
{ Visualizza sul video il contenuto della directory corrente.               }
{ I parametri hanno gli stessi nomi delle variabili globali.                }
{===========================================================================}
Procedure StampaDir ( Var Inizio:      Integer;
                      Var InizioDialX: Integer;
                      Var InizioDialY: Integer;
                      Var FineDialX:   Integer;
                      Var FineDialY:   Integer;
                      Var NumFiles:    Integer;
                      Var Dir:         PTRTipoDir;
                      Var Select:      Integer;
                      Var OldSelect:   Integer;
                      Var Risult:      Boolean );

Var

    { Ciclo }
    I: Integer;

Begin { StampaDir }

{ Libera lo spazio per i nomi dei files }
SetColor(Black);
SetFillStyle(EmptyFill,Black);
SetTextStyle(DefaultFont,HorizDir,1);
SetTextJustify(LeftText,TopText);
WaitToWrite;
HideMouse;
Bar(InizioDialX+TextWidth('█'),    InizioDialY+6*TextHeight('█'),
    InizioDialX+14*TextWidth('█'), InizioDialY+16*TextHeight('█'));
Bar(InizioDialX+15*TextWidth('█'), InizioDialY+6*TextHeight('█'),
    InizioDialX+28*TextWidth('█'), InizioDialY+16*TextHeight('█'));
SetColor(White);

{ Stampa i files che stanno nella finestra (fino a 10). }
If (NumFiles > 0)
  Then

    Begin

    i := Inizio;

    Repeat
      Inc(i);
      If (i > Inizio+5)
        Then
          OutTextXY(InizioDialX+15*TextWidth('█')+3,
	            InizioDialY+(6+(i-Inizio-6)*2)*TextHeight('█')+3,
		    Dir^[i])

      Else

        OutTextXY(InizioDialX+TextWidth('█')+3,
		  InizioDialY+(6+(i-Inizio-1)*2)*TextHeight('█')+3,
		  Dir^[i])

    Until ((i >= NumFiles) Or (i >= Inizio+10));

    { Disegna il puntatore. }
    If (Select In [0,1]) And (OldSelect In [0,1])
      Then
        Begin
        SetColor(DialogSelect);
        SetWriteMode(XOrPut);
        For i := (6*TextHeight('█')) To (8*TextHeight('█')) Do
          Line(InizioDialX+TextWidth('█'),InizioDialY+i,
	       InizioDialX+14*TextWidth('█'),InizioDialY+i);
        SetWriteMode(NormalPut);
        NoFile := False;
        End;
    End

Else

  { Scrive '! No Files !', per dire che la directory non
    contiene files.                                      }
  Begin
  OldSelect := 0;
  Select := 0;
  SetColor(Yellow);
  OutTextXY(InizioDialX+TextWidth('█')+3,InizioDialY+6*TextHeight('█')+3,
	    '! No Files !');
  NoFile := True;
  Risult := True;
  End;

ShowMouse;

End; { StampaDir }


{===========================================================================}
{ PROCEDURA: AGGIORNA                                                       }
{                                                                           }
{ Aggiorna l' evidenziatore all' interno della lista della directory.       }
{ I parametri hanno gli stessi nomi delle variabili globali.                }
{===========================================================================}
Procedure Aggiorna ( Var Select:      Integer;
                     Var OldSelect:   Integer;
                     Var Inizio:      Integer;
                     Var NumFiles:    Integer;
                     Var InizioDialX: Integer;
                     Var InizioDialY: Integer;
                     Var FineDialX:   Integer;
                     Var FineDialY:   Integer;
                     Var Dir:         PTRTipoDir;
                     Var Risult:      Boolean );

Var

    { Aggiorna o no il puntatore }
    Stampa:   Boolean;

    { Ciclo }
    I:        Integer;

    { Ciclo }
    J:        Integer;

    { Se il file contiene uno sprite viene disegnato a lato, altrimenti
      viene scritto 'No Sprite'. }
    F:        Text;

    { Variabile di appoggio per il Read dal file di testo. }
    Appoggio: Byte;

    { Numero di righe }
    Righe:    Integer;

    { Numero di colonne }
    Colonne:  Integer;

    { Carattere premuto dall' utente }
    Ch:       Char;

    { Stringa di appoggio }
    StApp:   String;

Begin { Aggiorna }

{ Se necessita un cambio pagina, viene effettuato. }
Stampa := True;
If ((Not NoFile) And (Select <> OldSelect))
  Then

    Begin
    If (((Select-1) Div 10) > ((OldSelect-1) Div 10))
      Then

        Begin
        If ((Inizio+10) <= NumFiles)
          Then

            Begin
            Inc(Inizio,10);
            StampaDir(Inizio,InizioDialX,InizioDialY,FineDialX,FineDialY,
                      NumFiles,Dir,Select,OldSelect,Risult);
            End;

        End

    Else

      If (((Select-1) Div 10) < ((OldSelect-1) Div 10))
        Then
          Begin
          If ((Inizio-10) >= 0)
            Then
	      Begin
	      Dec(Inizio,10);
              StampaDir(Inizio,InizioDialX,InizioDialY,FineDialX,FineDialY,
                        NumFiles,Dir,Select,OldSelect,Risult);
                        Stampa := False;
              End;
          End;

    { Viene aggiornato il puntatore. }
    SetWriteMode(XOrPut);
    SetFillStyle(SolidFill,DialogSelect);
    SetColor(DialogSelect);
    WaitToWrite;
    HideMouse;
    If Stampa
      Then
        Begin
        If (OldSelect > Inizio)
          Then
            Begin
            If (OldSelect > Inizio+5)
              Then
	        For i := ((6+(OldSelect-Inizio-6)*2)*TextHeight('█')) To
		         ((8+(OldSelect-Inizio-6)*2)*TextHeight('█')) Do
	          Line(InizioDialX+15*TextWidth('█'),
	               InizioDialY+i,
	               InizioDialX+28*TextWidth('█'),
	               InizioDialY+i)

            Else

	      For i := ((6+(OldSelect-Inizio-1)*2)*TextHeight('█')) To
		       ((8+(OldSelect-Inizio-1)*2)*TextHeight('█')) Do
	        Line(InizioDialX+TextWidth('█'),
	             InizioDialY+i,
	             InizioDialX+14*TextWidth('█'),
	             InizioDialY+i);

            End;

        End;

    If (Select > 0)
      Then
        Begin
        If (Select > Inizio+5)
          Then
            For i := ((6+(Select-Inizio-6)*2)*TextHeight('█')) To
	             ((8+(Select-Inizio-6)*2)*TextHeight('█')) Do
	      Line(InizioDialX+15*TextWidth('█'),
	           InizioDialY+i,
	           InizioDialX+28*TextWidth('█'),
	           InizioDialY+i)

        Else

          For i := ((6+(Select-Inizio-1)*2)*TextHeight('█')) To
	           ((8+(Select-Inizio-1)*2)*TextHeight('█')) Do
	    Line(InizioDialX+TextWidth('█'),
	         InizioDialY+i,
	         InizioDialX+14*TextWidth('█'),
	         InizioDialY+i);
        End;

    { Viene aggiornato anche lo schermo piccolo, che dovrà contenere lo
      sprite selezionato o un messaggio di errore.                      }
    SetWriteMode(NormalPut);
    SetFillStyle(SolidFill,Black);
    Bar(InizioRealX,InizioRealY,
        InizioRealX+MaxColonne-1,InizioRealY+MaxRighe-1);
    SetColor(Brown);
    Rectangle(InizioRealX-1,InizioRealY-1,
	      InizioRealX+MaxColonne,InizioRealY+MaxRighe);
    Assign(f,Dir^[Select]);

    {$I-}
    Reset(f);
    {$I+}

    If (IOResult = 0)
      Then
        Begin

        {$I-}
        ReadLn(f);
        ReadLn(f);
        ReadLn(f,St);
        {$I+}

        If (IOResult = 0)
          Then
            Begin

            { Se il file differisce solo per la versione del programma,
              viene letto ugualmente, per avere più compatibilità }
            StApp := StrFile;
            If (Pos(Version,StApp) <> 0)
              Then
                Begin
                Delete(St,Pos(Version,StApp),Length(Version));
                Delete(StApp,Pos(Version,StApp),Length(Version));
                End;

            If (St <> StApp)
              Then

                { Il file non corrisponde. }
                Begin
                SetTextJustify(CenterText,CenterText);
                SetTextStyle(DefaultFont,HorizDir,1);
                SetColor(LightCyan);
                OutTextXY(InizioRealX+MaxColonne Div 2,InizioRealY+MaxRighe Div 2,
		          'No Sprite');
                End

            Else

              { Il file contiene dati per uno sprite : viene letto. }
              Begin

              For i := 1 To 6 Do
                ReadLn(f);

              {$I-}
              Read(f,Ch);
              ReadLn(f,Righe);
              ReadLn(f,Colonne);
              {$I+}

              If (Righe > MaxRighe)
                Then
                  Righe := MaxRighe
              Else
                If (Righe < 1)
                  Then
                    Righe := 1;

              If (Colonne > MaxColonne)
                Then
                  Colonne := MaxColonne
              Else
                If (Colonne < 1)
                  Then
                    Colonne := 1;

              For i := 1 To Colonne Do
	        For j := 1 To Righe Do
	          Begin
	          {$I-} Read(f,Ch); {$I+}
                  If (IOResult = 0)
                    Then
                      PutPixel16(InizioRealX+i-1,InizioRealY+j-1,
                                 Ord(Ch)-48,pRep);
	          End;

              End;

            End;
        Close(f);

        End

    Else

      Begin

      { Il file ha dato degli errori di lettura. }
      SetTextJustify(CenterText,CenterText);
      SetTextStyle(DefaultFont,HorizDir,1);
      SetColor(LightCyan);
      OutTextXY(InizioRealX+MaxColonne Div 2,InizioRealY+MaxRighe Div 2,
	        'No Sprite');
      End;

    ShowMouse;

    End;

End; { Aggiorna }


{===========================================================================}
{ PROCEDURA: LEGGI.PATH                                                     }
{                                                                           }
{ Legge il contenuto del disco e setta opportunamente le variabili interes_ }
{ sate (vettore nello heap, numero di files, ecc.).                         }
{ I parametri hanno gli stessi nomi delle variabili globali.                }
{===========================================================================}
Procedure LeggiPath ( Var Path:        StringPath;
                      Var Risult:      Boolean;
                      Var Tasti:       TipoTasti;
                      Var InizioDialX: Integer;
                      Var InizioDialY: Integer;
                      Var FineDialX:   Integer;
                      Var FineDialY:   Integer;
                      Var Dir:         PTRTipoDir;
                      Var NumFiles:    Integer;
                      Var Inizio:      Integer;
                      Var Select:      Integer;
                      Var OldSelect:   Integer );

Var

    { Ciclo }
    I:       Integer;

    { Directory }
    D:       DirStr;

    { Nome }
    N:       NameStr;

    { Estensione }
    E:       ExtStr;

    { File per controllare la directory }
    F:       File;

    { Attributi del file }
    Attr:    Word;

    { Serve la directory '..' o no ? }
    Puntini: Boolean;

    { Stringa che memorizza il drive/percorso }
    St:      StringPath;

    { Record per le informazioni su un file (nome, estensione,
      lunghezza, ecc. }
    DirInfo: SearchRec;


Begin { LeggiPath }

{ Aggiusta il path da eventuali errori. }
Risult := True;
Path := FExpand(Path);

If (Path[Length(Path)] <> '\')
  Then
    Begin
    Assign(F, Path);
    GetFAttr(F, Attr);
    If ((DosError = 0) And (Attr And Directory <> 0))
      Then
        Path := Path + '\';
    End;

FSplit(Path, D, N, E);
If ((DosError = 2) And (Tasti = SaveFile) And
    (Pos('*',d) = 0) And (Pos('?',d) = 0))
     Then
       FileName := N+E
Else
  FileName := '';

If (N = '')
  Then
    N := '*';
If (E = '')
  Then
    E := '.*';
Path := D+N+E;

Puntini := False;
If ((D[2] = ':') And (d[3] = '\') And (Length(d) = 3))
  Then
    Puntini := True;
If ((Not Puntini) And (d[Length(d)] = '\'))
  Then
    Delete(d,Length(d),1);

{ Cambia la directory corrente }
If (DosError In [2,3,18])
  Then
    Begin

    {$I-}
    ChDir(d);
    {$I+}

    End;

{ Scrive il path sullo schermo. }
SetFillStyle(EmptyFill,Black);
SetTextJustify(LeftText,TopText);
SetColor(White);
If (Length(Path) > 27)
  Then
    Begin
    FSplit(Path, D, N, E);
    Path := N+E;
    End;

WaitToWrite;
HideMouse;
Bar(InizioDialX+TextWidth('█'),
    InizioDialY+2*TextHeight('█'),
    InizioDialX+28*TextWidth('█'),
    InizioDialY+4*TextHeight('█'));
OutTextXY(InizioDialX+TextWidth('█')+3,
	  InizioDialY+2*TextHeight('█')+3,Path);

{ Legge i files della directory }
ShowMouse;
NumFiles := 0;
FindFirst(Path,AllFiles,DirInfo);
While (DosError = 0) Do
  Begin

  If (DirInfo.Attr <> Directory)
    Then
      Begin
      Inc(NumFiles);
      Dir^[NumFiles] := DirInfo.Name;
      End;

  FindNext(DirInfo);

  End;

{ Legge le sub-directory della directory. }
If ((NumFiles = 0) And (Tasti = SaveFile)) Or (NumFiles <> 0)
  Then
    Risult := True
Else
  Risult := False;
Risp := Risult;
FindFirst('*.*',AllFiles,DirInfo);
While (DosError = 0) Do
  Begin

  If ((DirInfo.Attr = Directory) And (DirInfo.Name <> '.'))
     Then
       Begin
       Inc(NumFiles);
       If (DirInfo.Name = '..')
         Then
	   Begin
	   Dir^[NumFiles] := ''+DirInfo.Name;
	   Puntini := True;
	   End
       Else
         Dir^[NumFiles] := ''+DirInfo.Name;

       End;

  FindNext(DirInfo);

  End;

{ Aggiunge i puntini '..' per la directory precedente se
  non ci sono.                                           }
If (Not Puntini)
  Then
    Begin
    Inc(NumFiles);
    Dir^[NumFiles] := '..';
    If (Tasti = ReadFile)
      Then
        Risp := True;
    Risult := Risp;
    End;

{ Ordina la directory secondo il nome (le sub-directory
  vengono per prime).                                   }
MergeSort(Dir,1,NumFiles);

{ Setup }
Inizio := 0;
Select := 1;
OldSelect := 0;

StampaDir(Inizio,InizioDialX,InizioDialY,FineDialX,FineDialY,
          NumFiles,Dir,Select,OldSelect,Risult);

Aggiorna(Select,OldSelect,Inizio,NumFiles,InizioDialX,
         InizioDialY,FineDialX,FineDialY,Dir,Risult);

{ scrittura del numero di files }
SetFillStyle(EmptyFill,Black);
SetTextJustify(CenterText,CenterText);
SetColor(White);
Str(NumFiles,St);
WaitToWrite;
HideMouse;
Bar(InizioDialX+5*TextWidth('█'),
    InizioDialY+18*TextHeight('█'),
    InizioDialX+24*TextWidth('█'),
    InizioDialY+21*TextHeight('█'));
OutTextXY(InizioDialX+15*TextWidth('█'),
	  InizioDialY+19*TextHeight('█')+3,St+' Files Totali ');

ShowMouse;
SetTextJustify(LeftText,TopText);

End; { LeggiPath }


{===========================================================================}
{ PROCEDURA: WINDOWS                                                        }
{                                                                           }
{ E' la procedura più importante del programma, in quanto tutte le finestre }
{ di dialogo sono gestite e disegnate da questa. I parametri sono:          }
{   X1:          inizio X                                                   }
{   Y1:          inizio Y                                                   }
{   X2:          fine X                                                     }
{   Y2:          fine Y                                                     }
{   Stringa:     testo della finestra (usare ^ per separare le righe)       }
{   PulsAlto:    colore delle linne in alto (come i tasti)                  }
{   PulsBasso:   colore delle linee in basso                                }
{   PulsSfondo:  colore di sfondo                                           }
{   Tasti:       tipo di tasti da integrare nella finestra.                 }
{===========================================================================}
Procedure Windows ( X1:         Integer;
		    Y1:         Integer;
                    X2:         Integer;
                    Y2:         Integer;
		    Stringa:    String;
		    PulsAlto:   Byte;
                    PulsBasso:  Byte;
                    PulsSfondo: Byte;
                    Tasti:      TipoTasti;
                    Ext:        String003 );

Var

    { Sono le righe del testo, al massimo 30 }
    Stringhe:    TipoStringhe;

    { Numero di righe che ha la finestra }
    NumRighe:    Byte;

    { Inizio X della finestra }
    InizioFinX:  Integer;

    { Inizio Y della finestra }
    InizioFinY:  Integer;

    { Fine X della finestra }
    FineFinX:    Integer;

    { Fine Y della finestra }
    FineFinY:    Integer;

    { Dimensione dell' area da salvare in memoria }
    Size:        Word;

    { Icone da visualizzare (al massimo 6) }
    Puls:        Array [1..6] Of
                   RecP;

    { Puntatore ad una icona }
    Punt:        Pointer;

    { Numero di icone (tasti) da visualizzare }
    NumTasti:    Byte;

    { E' stata scelta un' icona ? }
    Scelto:      Boolean;

    { Numero dell' icona scelta }
    Premuto:     Byte;

    { Inizio X della finestra della directory }
    InizioDialX: Integer;

    { Inizio Y della finestra della directory }
    InizioDialY: Integer;

    { Fine X della finestra della directory }
    FineDialX:   Integer;

    { Fine Y della finestra della directory }
    FineDialY:   Integer;

    { Stato del tasti Insert }
    InsKey:      Boolean;

    { File selezionato (evidenziato) }
    Select:      Integer;

    { File precedentemente selezionato }
    OldSelect:   Integer;

    { Ciclo }
    I:           Integer;

    { Percorso immesso dall' utente }
    Path:        StringPath;

    { Numero di files totali }
    NumFiles:    Integer;

    { Numero del primo file della lista }
    Inizio:      Integer;

    { Stringa di appoggio }
    App:         String012;

    { Carattere premuto dall' utente }
    Ch2:         Char;

    { L' immissione è corretta ? }
    Risult:      Boolean;

    { Stringa di appoggio }
    St:          StringPath;

    { Stringa di appoggio }
    St2:         StringPath;

    { Stringa di appoggio }
    St4:         String;

    { Ora }
    Hour:        Word;

    { Minuti }
    Minute:      Word;

    { Secondi }
    Second:      Word;

    { Centesimi di secondo }
    Sec100:      Word;

    { File temporaneo }
    TempF:       Text;

    { Ore precedente }
    OldHour:     Word;

    { Minuti precedenti }
    OldMinute:   Word;

    { Secondi precedenti }
    OldSecond:   Word;

    { Centesimi di secondi precedenti }
    OldSec100:   Word;

    { Come deve essere salvata l' area ? }
    Procedi:     (Fermo, Memoria, Finestrona);

    { Carattere premuto dall' utente }
    Ch:          Char;


Begin { Windows }

{ Icone che devono esserci sempre }
P[32].P := @ConstPOk;
P[33].P := @ConstPEscape;
Path := '*.'+Ext;
Path := FExpand(Path);

If (Stringa = '***INFO***')
  Then
    Informazione(NumRighe,Stringhe)
Else
  NormalWindow(NumRighe,Stringhe,Stringa);

SetTextStyle(DefaultFont,HorizDir,1);
SetTextJustify(CenterText,CenterText);

{ Aggiusta le varie righe della finestra }
St := Stringhe[1];
For i := 2 To NumRighe Do
  If (Length(St) < Length(Stringhe[i]))
    Then
      St := Stringhe[i];
Delete(St,1,1);

{ Determina l' inizio della finestra }
If ((X1 = Automatico) And (X2 = Automatico))
  Then
    Begin
    InizioFinX := ((GetMaxX-TextWidth(St)) Div 2)-30;
    FineFinX := ((GetMaxX+TextWidth(St)) Div 2)+30;
    End
Else
  Begin
  InizioFinX := X1;
  FineFinX := X2;
  End;

{ Determina la fine della finestra }
If ((Y1 = Automatico) And (Y2 = Automatico))
  Then
    Begin
    InizioFinY := ((GetMaxY-NumRighe*2*TextHeight('█')) Div 2)-30;
    FineFinY := ((GetMaxY+NumRighe*2*TextHeight('█')) Div 2)+30;
    End
Else
  Begin
  InizioFinY := Y1;
  FineFinY := Y2;
  End;

{ Determina le coordinate della finestra che conterrà la lista della
  directory del disco }
If (Tasti In [ReadFile,SaveFile])
  Then
    Begin
    InizioDialX := (FineFinX+InizioFinX) Div 2-15*TextWidth('█')-20;
    FineDialX := (FineFinX+InizioFinX) Div 2+15*TextWidth('█')+20;
    InizioDialY := (FineFinY+InizioFinY) Div 2-9*TextHeight('█')-20;
    FineDialY := (FineFinY+InizioFinY) Div 2+9*TextHeight('█')+20;
    End;

{ Dimensione dell' area da salvare }
Size := ImageSize(InizioFinX,InizioFinY,FineFinX,FineFinY);

{ Stabilisce se è necessario salvarla in memoria o no }
Procedi := Fermo;
If ((MemAvail > Size) And (Size > 0))
  Then
    Begin

    If (IOResult = 0)
      Then

        { Memoria suficiente }
        Procedi := Memoria;
    End

Else

  { Memoria non sufficiente }
  Procedi := Finestrona;

WaitToWrite;
HideMouse;
{ Se si può procedere ... }
If (Procedi <> Fermo)
  Then
    Begin

    If (Procedi = Memoria)
      Then
        Begin
        GetMem(Punt, Size);
        GetImage(InizioFinX,InizioFinY,FineFinX,FineFinY,Punt^);
        End;

    SetFillStyle(SolidFill,PulsSfondo);
    WaitToWrite;
    HideMouse;
    Bar(InizioFinX,InizioFinY,FineFinX,FineFinY);
    SetColor(PulsAlto);
    Line(InizioFinX,FineFinY,InizioFinX,InizioFinY);
    Line(InizioFinX+1,FineFinY-1,InizioFinX+1,InizioFinY+1);
    Line(InizioFinX,InizioFinY,FineFinX,InizioFinY);
    Line(InizioFinX,InizioFinY+1,FineFinX-1,InizioFinY+1);
    SetColor(PulsBasso);
    Line(InizioFinX,FineFinY,FineFinX,FineFinY);
    Line(InizioFinX+1,FineFinY-1,FineFinX,FineFinY-1);
    Line(FineFinX,FineFinY,FineFinX,InizioFinY);
    Line(FineFinX-1,FineFinY,FineFinX-1,InizioFinY+1);

    { Scrive il testo nella finestra }
    For i := 1 To NumRighe Do
      Begin
      SetColor(Ord(Stringhe[i,1])-65);
      Delete(Stringhe[i],1,1); 
      If ((Stringa = '***INFO***') And (i > 3))
        Then
          While Length(Stringhe[i]) < Length(St) Do
            Stringhe[i] := Stringhe[i]+' ';
      OutTextXY((FineFinX-InizioFinX) Div 2+InizioFinX,
	        InizioFinY+2*i*TextHeight('█'),Stringhe[i]);
      End;

    ShowMouse;

    { Set di icone da visualizzare }
    Case Tasti Of

      { Escape e Ok }
      EscapeOk:     Begin

                    NumTasti := 2;
                    Puls[1].P := P[CmdEscape].P;
                    Puls[2].P := P[CmdOk].P;
                    Puls[1].X := ((FineFinX-InizioFinX) Div 3)+InizioFinX-13;
                    Puls[1].Y := FineFinY-40;
                    Puls[2].X := 2*((FineFinX-InizioFinX) Div 3)+InizioFinX-13;
                    Puls[2].Y := FineFinY-40;

                    End;

      { Ok }
      SoloOk:       Begin

                    NumTasti := 1;
                    Puls[1].P := P[CmdOk].P;
		    Puls[1].X := (FineFinX-InizioFinX) Div 2+InizioFinX-13;
		    Puls[1].Y := FineFinY-40;

		    End;

      { Escape }
      SoloEscape:   Begin

                    NumTasti := 1;
                    Puls[1].P := P[CmdEscape].P;
		    Puls[1].X := (FineFinX-InizioFinX) Div 2+InizioFinX-13;
		    Puls[1].Y := FineFinY-40;

		    End;

      { Freccia destra e Freccia sinistra }
      FrecceOrizz: NumTasti := 4;

      { Freccia su e Freccia giù }
      FrecceVert:  NumTasti := 4;

      { Tutte le 4 frecce, Escape e Ok }
      ReadFile,
      SaveFile:     Begin

                    NumTasti := 6;
                    Puls[1].P := P[CmdEscape].P;
                    Puls[2].P := P[CmdOk].P;
                    Puls[3].P := P[CmdGiu].P;
                    Puls[4].P := P[CmdSu].P;
                    Puls[5].P := P[CmdSinistra].P;
                    Puls[6].P := P[CmdDestra].P;
                    Puls[1].X := ((FineFinX-InizioFinX) Div 3)+InizioFinX-13;
                    Puls[1].Y := FineFinY-40;
                    Puls[2].X := 2*((FineFinX-InizioFinX) Div 3)+
                                 InizioFinX-13;
                    Puls[2].Y := FineFinY-40;
                    Puls[3].X := FineDialX-40;
                    Puls[3].Y := FineDialY-80;
                    Puls[4].X := Puls[3].X;
                    Puls[4].Y := InizioDialX+10;
                    Puls[5].X := IniziodialX+10;
                    Puls[5].Y := FineDialY-40;
                    Puls[6].X := FineDialX-80;
                    Puls[6].Y := Puls[5].Y;

                    SetColor(DialogBackGround);
                    SetFillStyle(SolidFill,DialogBackGround);
                    WaitToWrite;
                    HideMouse;
                    Bar(InizioDialX,InizioDialY,FineDialX,FineDialY);
                    SetColor(White);
                    Rectangle(InizioDialX,InizioDialY,FineDialX,FineDialY);
                    SetFillStyle(EmptyFill,Black);
                    LeggiPath(Path,Risult,Tasti,InizioDialX,InizioDialY,
                              FineDialX,FineDialY,Dir,NumFiles,Inizio,
                              Select,OldSelect);
                    SetColor(DialogSelect);
                    SetWriteMode(XOrPut);
                    For i := (6*TextHeight('█')) To (8*TextHeight('█')) Do
                      Line(InizioDialX+TextWidth('█'),InizioDialY+i,
                           InizioDialX+14*TextWidth('█'),InizioDialY+i);
                    ShowMouse;
                    SetWriteMode(NormalPut);

                    End;

      End; { Case }

    WaitToWrite;
    HideMouse;

    { Visualizza le icone }
    For i := 1 To NumTasti Do
      PutImage(Puls[i].X,Puls[i].Y,Puls[i].P^,NormalPut);

    ShowMouse;
    Scelto := False;

    Repeat

      ShowMouse;

      { Finestra di informazione }
      If (Stringa = '***INFO***')
        Then
          Begin
          SetFillStyle(SolidFill,PulsSfondo);
          OldHour := 99;
          OldMinute := 99;
          OldSecond := 99;
          OldSec100 := 99;
          WaitToWrite;
          HideMouse;
          Bar(375,340,470,363);
          ShowMouse;
          End;

      { Attende la pressione di un pulsante del mouse }
      Repeat

        CheckTime(Stringa,PulsSfondo,Hour,Minute,Second,Sec100,
	          OldHour,OldMinute,OldSecond,OldSec100);

      Until MousePressed;

      { Controlla la zona in cui è stato premuto il pulsante }
      Premuto := 0;
      For i := 1 To NumTasti Do
        If MouseInG(Puls[i].X,Puls[i].Y,
		    Puls[i].X+25,Puls[i].Y+25)
          Then
	    Begin
	    PremiPulsante(i,Puls[i],Finestre);
	    Premuto := i;
	    End;

      If (Tasti In [ReadFile,SaveFile])
        Then
          Begin

          { Controllo nella lista dei files (parte sinistra) }
          For i := 0 To 4 Do
            If (MouseInG(InizioDialX+TextWidth('█'),
			 InizioDialY+(6+i*2)*TextHeight('█'),
			 InizioDialX+14*TextWidth('█'),
			 InizioDialY+(8+i*2)*TextHeight('█'))
	        And (Inizio+i+1 <= NumFiles))
                  Then
	            Begin
	            OldSelect := Select;
	            Select := Inizio+i+1;
                    Aggiorna(Select,OldSelect,Inizio,NumFiles,InizioDialX,
                             InizioDialY,FineDialX,FineDialY,Dir,Risult);
	            End;

          { Controllo nella lista dei files (parte destra) }
          For i := 5 To 9 Do
            If (MouseInG(InizioDialX+15*TextWidth('█'),
			 InizioDialY+(6+(i-5)*2)*TextHeight('█'),
			 InizioDialX+28*TextWidth('█'),
			 InizioDialY+(8+(i-5)*2)*TextHeight('█'))
	        And (Inizio+i+1 <= NumFiles))
                  Then
	            Begin
	            OldSelect := Select;
	            Select := Inizio+i+1;
                    Aggiorna(Select,OldSelect,Inizio,NumFiles,InizioDialX,
                             InizioDialY,FineDialX,FineDialY,Dir,Risult);
	            End;

          { Controllo dell' immissione del percorso }
          If MouseInG(InizioDialX+TextWidth('█'),
		      InizioDialY+2*TextHeight('█'),
		      InizioDialX+28*TextWidth('█'),
		      InizioDialY+4*TextHeight('█'))
            Then
	      Begin

              { Setup }
	      SetTextJustify(LeftText,TopText);
	      SetFillStyle(EmptyFill,Black);
	      St := Path;
	      InsKey := True;
	      x := 1;
	      HideMouse;

	      Repeat
	        SetColor(White);
	        Line(InizioDialX+x*TextWidth('█'),
	             InizioDialY+4*TextHeight('█'),
	             InizioDialX+(x+1)*TextWidth('█'),
	             InizioDialY+4*TextHeight('█'));
	        If InsKey
                  Then
	            Line(InizioDialX+x*TextWidth('█'),
		         InizioDialY+4*TextHeight('█')-2,
		         InizioDialX+(x+1)*TextWidth('█'),
		         InizioDialY+4*TextHeight('█')-2);

                { Attende un tasto }
	        Repeat

	          Ch := ReadKey;
	          If (Ch = kNull)
                    Then
                      Ch2 := ReadKey;

	        Until ((Ch = kNull) And
                      (Ch2 In [kLeft,kRight,kCancel,kInsert,kHome,kEnd]))
		      Or (Ch In [kEscape,kReturn,kDel,#32..#254]);

                { Aggiorna lo stato del tasto Insert sullo schermo }
	        SetColor(Black);
	        Line(InizioDialX+x*TextWidth('█'),
	             InizioDialY+4*TextHeight('█'),
	             InizioDialX+(x+1)*TextWidth('█'),
	             InizioDialY+4*TextHeight('█'));
	        If InsKey
                  Then
	            Line(InizioDialX+x*TextWidth('█'),
		         InizioDialY+4*TextHeight('█')-2,
		         InizioDialX+(x+1)*TextWidth('█'),
		         InizioDialY+4*TextHeight('█')-2);
	        SetColor(White);

	        Case Ch Of

                  { Tasto esteso }
	          kNull: Begin
		         Case Ch2 Of

                           { Destra: carattere a destra }
		           kRight:  If ((x <= Length(St)) And (x < 27))
                                      Then
                                        Inc(x);

                           { Sinistra: carattere a sinistra }
		           kLeft:   If (x > 1)
                                      Then
                                        Dec(x);

                           { Cancel: cancella il carattere }
		           kCancel: Delete(St,x,1);

                           { Insert: inserimento o sovrascrittura }
		           kInsert: InsKey := Not InsKey;

                           { Home: primo carattere }
		           kHome:   x := 1;

                           { End: ultimo carattere }
		           kEnd:    x := Length(St)+1;

		           End; { Case }

		         End;

                  { Escape: annulla la digitazione e ritorna alla lista }
	          kEscape: St := Path;

                  { Delete: cancella il carattere a sinistra }
	          kDel:    If (x > 1)
                             Then
		               Begin
		               Delete(St,x-1,1);
		               Dec(x);
		               End;

                  { Un carattere visualizzabile: lo scrive sul video }
	          #32..#254: Begin
		             If InsKey
                               Then

			         Begin
			         If (Length(St) < 26)
                                   Then
			             Begin
			             St := St+' ';
			             For i := Length(St) DownTo (x+1) Do
			               St[i] := St[i-1];
			             St[x] := UpCase(Ch);
			             End;
			         End

		               Else

			         Begin
			         If ((x > Length(St)) And (Length(St) < 26))
                                   Then
			             St := St+UpCase(Ch)
			         Else
                                   St[x] := UpCase(Ch);
			         End;

		             If ((Length(St) < 26) And (x < 27))
                               Then Inc(x);

		             End;

	          End; { Case }

                { Aggiornamento del path sullo schermo }
                WaitToWrite;
	        Bar(InizioDialX+TextWidth('█'),InizioDialY+2*TextHeight('█'),
	            InizioDialX+28*TextWidth('█'),InizioDialY+4*TextHeight('█'));
	        OutTextXY(InizioDialX+TextWidth('█')+3,
		          InizioDialY+2*TextHeight('█')+3,St);

	      Until (Ch In [kReturn,kEscape]);

              { Lettura del nuovo drive/percorso immesso }
	      ShowMouse;
	      St2 := Path;
	      Path := St;
              LeggiPath(Path,Risult,Tasti,InizioDialX,InizioDialY,
                        FineDialX,FineDialY,Dir,NumFiles,Inizio,
                        Select,OldSelect);
              WaitToWrite;
	      HideMouse;

              { Se l' operazione non ha dato problemi }
	      If Risult
                Then

	          Begin
	          SetColor(DialogSelect);
	          SetWriteMode(XOrPut);
	          For i := (6*TextHeight('█')) To (8*TextHeight('█')) Do
	            Line(InizioDialX+TextWidth('█'),InizioDialY+i,
		         InizioDialX+14*TextWidth('█'),InizioDialY+i);
	          SetWriteMode(NormalPut);
	          End

	        Else

	          Begin
	          Path := St2;
	          SetFillStyle(EmptyFill,Black);
	          Bar(InizioDialX+TextWidth('█'),InizioDialY+2*TextHeight('█'),
	              InizioDialX+28*TextWidth('█'),InizioDialY+4*TextHeight('█'));
	          SetColor(White);
	          OutTextXY(InizioDialX+TextWidth('█')+3,
		            InizioDialY+2*TextHeight('█')+3,Path);
	          End;

	      If (FileName <> '')
                Then

	          Begin
	          Premuto := 2;
	          OldSelect := 0;
	          Risp := True;
	          End;

	      ShowMouse;

	      End;

          End;

      { Se è stata scelta un' icona }
      If (Premuto <> 0)
        Then
          Begin

          { A seconda dell' icona selezionata ... }
          Case Tasti Of

            { Escape e Ok }
            EscapeOk:     Begin

		          If (Premuto = 1)
                            Then
                              Risp := False
		          Else
                            If (Premuto = 2)
                              Then
                                Risp := True;

		          Scelto := True;

		          End;

            { Ok }
            SoloOk:       If (Premuto = 1)
                            Then
		              Begin
		              Risp := True;
		              Scelto := True;
		              End;

            { Escape }
            SoloEscape:   If (Premuto = 1)
                            Then
                              Begin
                              Risp := False;
                              Scelto := True;
                              End;

            { Freccia sinistra e Freccia destra }
            FrecceOrizz: Begin
		         NumTasti := 4;
		         Scelto := True;
		         End;

            { Freccia su e Freccia giù }
            FrecceVert:  Begin
		         NumTasti := 4;
		         Scelto := True;
		         End;

            { Le 4 frecce, Escape e Ok }
            ReadFile,
            SaveFile:     Begin

		          If (Premuto In [3,4,5,6])
                            Then
                              OldSelect := Select;

		          Case Premuto Of

		            1: Risp := False;

		            2: If (OldSelect = 0) And
			         (Not (Dir^[Select,1] In ['',''])) And
			         (Tasti <> SaveFile)
			           Then
			             Begin
			             Risp := True;
			             Scelto := True;
			             End

			       Else

			         If ((FileName <> '') And (Tasti = SaveFile))
			           Then
			             Begin
			             Risp := True;
			             Scelto := True;
			             End

			       Else

			         Begin
			         If (Dir^[Select,1] In ['',''])
			           Then
				      Begin
				      Premuto := 255;
				      Delete(Dir^[Select],1,1);
				      Path := Dir^[Select]+'\*.'+Ext;
				      Path := FExpand(Path);
                                      LeggiPath(Path,Risult,Tasti,
                                                InizioDialX,InizioDialY,
                                                FineDialX,FineDialY,Dir,
                                                NumFiles,Inizio,
                                                Select,OldSelect);
				      End

			         Else

			           If ((Dir^[Select] <> '') And (Select > 0))
			             Or (Tasti In [SaveFile,ReadFile])
				       Then
				         Begin
				         Risp := True;
				         FileName := Dir^[Select];
				         End;

			         End;

		            3: If (Select < NumFiles)
                                 Then
                                   Inc(Select);

		            4: If (Select > 1)
                                 Then
                                   Dec(Select);

		            5: If ((Select-5) > 0)
                                 Then
                                   Dec(Select,5)
			       Else
                                 Select := 1;

		            6: If ((Select+5) < NumFiles)
                                 Then
                                   Inc(Select,5)
			       Else
                                 Select := NumFiles;

		            End; { Case }

                          { Aggiorna l' evidenziatore sul video }
		          If ((Premuto In [3,4,5,6]) Or (Premuto = 255))
		            Then
                              Aggiorna(Select,OldSelect,Inizio,NumFiles,
                                       InizioDialX,InizioDialY,FineDialX,
                                       FineDialY,Dir,Risult)
		          Else
                            Scelto := True;

		          End;
            End; { Case }

          End;

    Until Scelto;

    HideMouse;

    { Ripristino delle condizioni iniziali }
    Case Procedi Of

      { Memoria }
      Memoria: Begin

	       PutImage(InizioFinX,InizioFinY,Punt^,NormalPut);
	       FreeMem(Punt,Size);

	       End;

      { Nessun salvataggio }
      Finestrona: Begin

		  SetFillStyle(EmptyFill,Black);
		  Bar(InizioFinX,InizioFinY,FineFinX,FineFinY);
		  SetColor(Brown);
		  Rectangle(InizioRealX-1,InizioRealY-1,
			    InizioRealX+MaxColonne,InizioRealY+MaxRighe);
		  DisegnaGriglia;
		  DisegnaPixel(NotClear,AncheReal);
		  WriteBarCoord(VertDir,InizioY,FineY);
		  WriteBarCoord(HorizDir,InizioX,FineX);

		  For i := Black To CmdGiu Do
		    PutImage(P[i].x,P[i].y,P[i].p^,NormalPut);

		  i := Color;
		  If (Color = Black)
                    Then
                      Color := White
		  Else
                    Color := Black;
		  PremiPulsante(i,P[i],Colori);
		  Color := i;

		  SetColor(LightGreen);
		  SetTextStyle(DefaultFont,HorizDir,1);
                  St := '**** SPRITE MANAGER VERSIONE '+Version+' *** DI FOCHI '+
                        'MICHELE ****';
		  OutTextXY(8+(TextWidth(St) Div 2),4,St);

		  SetTextJustify(LeftText,CenterText);
		  SetColor(LightRed);
		  Str(MaxRighe:4,St);
		  St := St+' Righe';
		  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5,St);

		  Str(MaxColonne:4,St);
		  St := St+' Colonne';
		  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5+TextHeight('█'),
                            St);

		  Str(16:4,St);
		  St := St+' Colori';
		  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5+2*TextHeight('█'),
                            St);

                  { Scala e nome del file sul video }
                  AggiornaScala;
                  AggiornaNomeFile;

		  End;

      End; { Case Procedi }

    End

Else

  { La finestra non è stata aperta (valore False) }
  Risp := False;

ShowMouse;
ReleaseButtons;

End; { Windows }


{===========================================================================}
{ PROCEDURA: LEGGI.FILE                                                     }
{                                                                           }
{ Legge il file (con conferma) di nome FileName.                            }
{===========================================================================}
Procedure LeggiFile ( Var FileName: StringFile );

Var

    { File di testo dal leggere }
    F:       Text;

    { Ciclo }
    I:       Integer;

    { Ciclo }
    J:       Integer;

    { Stringa di appoggio }
    St:      String;

    { Numero di colonne }
    Colonne: Integer;

    { Numero di righe }
    Righe:   Integer;

    { Carattere premuto dall' utente }
    Ch:      Char;

    { Stringa di appoggio }
    StApp:   String;

    { E' stato riscontrato un errore di lettura dal disco ? }
    Errore:  Boolean;

Begin { LeggiFile }

Errore := False;

Assign(f,FileName);

{$I-}
Reset(f);
{$I+}

{ Il file esiste ? }
If (IOResult <> 0)
  Then
    Windows(Automatico,Automatico,Automatico,Automatico,
      	    'L ^LIl File '+FileName+'^LNon Esiste Sul Disco.^L ',
	    Yellow,Brown,Blue,SoloOk,SprExt)

Else

  { Il file è presente sul disco }
  Begin

  {$I-}
  ReadLn(f);
  ReadLn(f);
  ReadLn(f,St);
  {$I+}

  If (IOResult <> 0)
    Then
      Errore := True;

  { Se il file differisce solo per la versione del programma, viene letto
    ugualmente, per avere più compatibilità }
  StApp := StrFile;
  If (Pos(Version,StApp) <> 0)
    Then
      Begin
      Delete(St,Pos(Version,StApp),Length(Version));
      Delete(StApp,Pos(Version,StApp),Length(Version));
      End;

  { File errato }
  If (St <> StApp)
    Then
      Windows(Automatico,Automatico,Automatico,Automatico,
              'L ^LIl File '+FileName+' Contiene^'+
	      'LInformazioni Non Corrette.^L ',
	      Yellow,Brown,Blue,SoloOk,SprExt)

  Else

    { File corretto }
    Begin

    HideMouse;
    VuotaSchermo;

    For i := 1 To 6 Do
      Begin
      {$I-} ReadLn(f); {$I+}
      If (IOResult <> 0)
        Then
          Errore := True;
      End;

    { Lettura del numero di righe e di colonne }
    {$I-}
    Read(f,Ch);
    ReadLn(f,Righe);
    ReadLn(f,Colonne);
    {$I+}

    If (IOResult <> 0)
      Then
        Errore := False;

    { Controllo della validità dei valori letti }
    If (Righe > MaxRighe)
      Then
        Righe := MaxRighe
    Else
      If (Righe < 1)
        Then
          Righe := 1;

    If (Colonne > MaxColonne)
      Then
        Colonne := MaxColonne
    Else
      If (Colonne < 1)
        Then
          Colonne := 1;

    { Lettura dell' immagine }
    For i := 1 To Colonne Do
      For j := 1 To Righe Do
	Begin
	{$I-} Read(f,Ch); {$I+}
        If (IOResult = 0)
          Then
            Vet^[i,j] := Ord(Ch)-48
        Else
          Begin
          Errore := True;
          Vet^[i,j] := 0;
          End;
	End;

    DisegnaGriglia;
    ShowMouse;

    End;

  Close(f);
  Modificato := False;
  NomeFile := FileName;

  If Errore
    Then
      Begin
      Windows(Automatico,Automatico,Automatico,Automatico,
              'L ^LErrore Di Lettura^LDal Disco.^L ',
              Yellow,Brown,Blue,SoloOk,SprExt);
      NomeFile := '';
      End;

  End;

End; { LeggiFile }


{===========================================================================}
{ PROCEDURA: SALVA.FILE                                                     }
{                                                                           }
{ Salva il file (con conferma) di nome FileName.                            }
{===========================================================================}
Procedure SalvaFile ( Var FileName: StringFile );

Var

    { File di testo da creare/riscrivere }
    F:         Text;

    { Stringa di appoggio }
    St:        String;

    { Numero di colonne }
    Colonne:   Integer;

    { Numero di righe }
    Righe:     Integer;

    { Devo sovrascrivere ? }
    OverWrite: Boolean;

    { Ciclo }
    I:         Integer;

    { Ciclo }
    J:         Integer;

    { Errore in scrittura ? }
    Errore:    Boolean;

Begin { SalvaFile }

Errore := False;

OverWrite := True;
Assign(f,FileName);

{$I-}
Reset(f);
{$I+}

{ Se il file esiste chiede se deve essere sovrascritto }
If (IOResult = 0)
  Then
    Begin
    Windows(Automatico,Automatico,Automatico,Automatico,
	    'L ^LIl File '+FileName+' Esiste^LSul Disco,^OSovrascrivo ?^L ',
	    Yellow,Brown,Blue,EscapeOk,SprExt);
    OverWrite := Risp;
    End;

{ Sovrascrittura del file ? }
If OverWrite
  Then
    Begin

    {$I-}
    ReWrite(f);
    WriteLn(f);
    WriteLn(f,'╔═════════════════════════════════════════════════════════════════════════════╗');
    WriteLn(f,StrFile);
    {$I+}

    If (IOResult <> 0)
      Then
        Errore := True;
    Righe := 1;
    Colonne := 1;

    { Determinazione del numero di righe/colonne massimi }
    For i := 1 To MaxColonne Do
      For j := 1 To MaxRighe Do

        Begin

        If (Vet^[i,j] <> Black)
	  Then
	    Begin

	    If (i > Colonne)
              Then
                Colonne := i;

	    If (j > Righe)
              Then
                Righe := j;

	    End;

        End;

    { Scrittura dei dati dello sprite: dimensioni }
    {$I-}
    WriteLn(f,'╟─────────────────────────────────────────────────────────────────────────────╢');
    Write(f,'║ Dimensioni dello sprite '+FileName+' ........... ',Righe:3,
	    ' Righe e ',Colonne:3,' Colonne.');
    {$I+}

    { Memoria occupata }
    {$I-}
    For i := (65+Length(FileName)) To 79 Do
      Write(f,' ');
    WriteLn(f,'║');
    Write(f,'║ Memoria occupata ..........');
    For i := 1 To Length(FileName) Do
      Write(f,'.');
    Write(f,'......... ',((Righe*Colonne) Div 2)+7:5,' Bytes.');

    { Memoria libera }
    For i := (53+Length(FileName)) To 79 Do
      Write(f,' ');
    WriteLn(f,'║');
    Write(f,'║ Memoria libera ............');
    For i := 1 To Length(FileName) Do
      Write(f,'.');
    Write(f,'......... ',(MaxRighe*MaxColonne-Righe*Colonne) Div 2:5,' Bytes.');
    For i := 53+Length(FileName) To 79 Do
      Write(f,' ');
    WriteLn(f,'║');

    { Memoria fisicamente occupata }
    x := Colonne;
    y := Righe;
    While (x Div 8) <> (x / 8) Do
      Inc(x);
    While (y Div 8) <> (y / 8) Do
      Inc(y);
    Write(f,'║ Memoria realmente occupata ');
    For i := 1 To Length(FileName) Do
      Write(f,'.');
    Write(f,'......... ',((x*y) Div 2)+7:5,' Bytes.');
    For i := 53+Length(FileName) To 79 Do
      Write(f,' ');
    WriteLn(f,'║');

    WriteLn(f,'╚═════════════════════════════════════════════════════════════════════════════╝');
    WriteLn(f,#26);

    { Righe e colonne }
    WriteLn(f,Righe);
    WriteLn(f,Colonne);

    { Scrittura dei valori dei pixels }
    For i := 1 To Colonne Do
      For j := 1 To Righe Do
        Write(f,Chr(Vet^[i,j]+48));

    Close(f);
    {$I+}
    If (IOResult <> 0)
      Then
        Errore := True;

    Modificato := False;
    NomeFile := FileName;

    If Errore
      Then
        Windows(Automatico,Automatico,Automatico,Automatico,
      	        'L ^LErrore Di Scrittura'+'^LSul Disco.^L ',
	        Yellow,Brown,Blue,SoloOk,SprExt);

    End;

End; { SalvaFile }


{===========================================================================}
{ FUNZIONE: EXPAND.3                                                        }
{                                                                           }
{ Espande la cifra a 3 cifre, aggiungendogli se necessario degli zero in    }
{ testa. Restituisce una stringa (generalmente di 3 cifre).                 }
{===========================================================================}
Function  Expand3 ( Valore: Integer ): String;

Var

    { Stringhe di appoggio }
    StApp: String;

Begin { Expand3 }

Str(Valore:3,StApp);

If (StApp[1] = ' ')
  Then
    StApp[1] := '0';

If (StApp[2] = ' ')
  Then
    StApp[2] := '0';

Expand3 := StApp;

End; { Expand3 }


{===========================================================================}
{ PROCEDURA: CREA.FILE.TURBO                                                }
{                                                                           }
{ Crea un file in Turbo Pascal che visualizzi lo sprite che si trova in     }
{ memoria.                                                                  }
{===========================================================================}
Procedure CreaFileTurbo ( Var NomeFile: StringFile );

Var

    { Ciclo }
    I:          Integer;

    { Ciclo }
    J:          Integer;

    { Ciclo }
    K:          Integer;

    { Numero di colonne }
    X:          Integer;

    { Numero di righe }
    Y:          Integer;

    { Numero di valori scritti sulla stessa riga }
    N:          Integer;

    { Ciclo }
    L:          Integer;

    { Byte (8 pixels di seguito) }
    Temp:       String[8];

    { Una riga intera }
    Riga:       String080;

    { Potenza a cui elevare il valore 2 per le conversioni
      fra un numero decimale ed uno binario }
    Potenza:    Byte;

    { Colonne reali }
    RealX:      Integer;

    { Righe reali }
    RealY:      Integer;

    { File da salvare }
    F:          Text;

    { Carattere premuto dall' utente }
    Ch:         Char;

    { Cancellazione del file esistente ? }
    OverWrite:  Boolean;

    { Ciclo }
    A:          Integer;

    { Offset di inizio del byte da convertire }
    Da:         Integer;

    { Offset di fine del byte da convertire }
    Fino:       Integer;

    { Matrice che contiene tutti i valori convertiti }
    VetRiga:    Array [1..(MaxColonne Div 8),1..MaxRighe,1..4] Of
                  Byte;

    { Vettore per le conversioni dei 16 colori (15 senza il nero) }
    VetBin:     Array [1..16] Of
                  Byte;

    { Numero massimo di colori }
    MaxCol:     Integer;

    { Numero massimo di colonne }
    MaxX:       Integer;

    { Numero massimo di righe }
    MaxY:       Integer;

    { Il colore è stato trovato o no ? }
    Trovato:    Boolean;

    { Errore di scrittura ? }
    Errore:     Boolean;


Begin { CreaFileTurbo }

{ Azzeramento vettori e matrici }
For i := 1 To 16 Do
  VetBin[i] := 0;
For j := 1 To MaxRighe Do
  For k := 1 To 4 Do
    VetRiga[1,j,k] := 0;
For i := 2 To (MaxColonne Div 8) Do
  VetRiga[i] := VetRiga[1];

{ Determinazione del numero di righe/colonne dello sprite }
RealX := 1;
RealY := 1;
For i := 1 To MaxColonne Do
  For j := 1 To MaxRighe Do
    If (Vet^[i,j] <> Black)
      Then
        Begin

        If (i > RealX)
          Then
            RealX := i;

        If (j > RealY)
          Then
            RealY := j;

        End;

{ Dimensioni teoriche }
x := RealX;
MaxX := X;
y := RealY;
MaxY := Y;
While ((x Div 8) <> (x / 8)) Do
  Inc(x);
While ((y Div 8) <> (y / 8)) Do
  Inc(y);

{ Determinazione del numero di colori dello sprite }
MaxCol := 0;
For k := 1 To 15 Do
  Begin

  i := 0;
  j := 1;
  Trovato := False;

  Repeat
    Inc(i);
    If (i > RealX)
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

  Until (j > RealY) Or Trovato;

  End;

{ Conversione dei valori }
Da := 1;
Fino := 8;
j := 1;

Repeat
  i := 7;

  { Per ogni colore ci vuole una conversione diversa }
  For l := 1 To 15 Do
    Begin

    VetBin[l] := 0;
    Potenza := 1;
    For k := i DownTo 0 Do
      Begin
      If (Vet^[Da+k,j] = l)
        Then
          Inc(VetBin[l],Potenza);
      Inc(Potenza,Potenza);
      End;

    End;

  { Conversione dell' intera riga }
  n := (Fino Div 8);
  For l := 1 To 15 Do
    If (VetBin[l] > 0)
      Then
        Begin

        k := 1;
        a := l;

        Repeat

	  If ((a Mod 2) = 1)
            Then
	      Inc(VetRiga[n,j,5-k],VetBin[l]);

	  a := a Div 2;

	  Inc(k);

        Until (k > 4) Or (a = 0);

        End;

  { Incremento indici: prossimo byte }
  Inc(Da,8);
  Inc(Fino,8);
  I := Da;

  { Cambio riga se necessario }
  If (i > RealX)
    Then
      Begin
      Da := 1;
      Inc(j);
      Fino := 8;
      End;

Until (j > RealY);

Errore := False;

OverWrite := True;
Assign(f,NomeFile);

{$I-}
Reset(f);
{$I+}

{ Il file esiste sul disco ? }
If (IOResult = 0)
  Then

    { Si. Viene chiesto se si desidera sovrascriverlo }
    Begin
    Windows(Automatico,Automatico,Automatico,Automatico,
      	    'L ^LIl File '+NomeFile+' Esiste^LSul Disco,^OSovrascrivo ?^L ',
       	    Yellow,Brown,Blue,EscapeOk,PasExt);
    OverWrite := Risp;
    End;

{ Se il file deve essere creato ... }
If OverWrite
  Then
    Begin

    {$I-} ReWrite(f); {$I+}
    If (IOResult <> 0)
      Then
        Errore := True;

    { Informazioni generali sullo sprite }
    {$I-}
    WriteLn(f,'{');
    WriteLn(f,'  Generazione di uno sprite con il programma Sprite Manager.');
    WriteLn(f,'  E'' possibile modificare il file a seconda delle proprie');
    WriteLn(f,'  esigenze.');
    WriteLn(f,'  SPRITE MANAGER v'+Version+' - FOCHI MICHELE');
    WriteLn(f);
    WriteLn(f,'  ********** DATI DELLO SPRITE **********');
    WriteLn(f);
    WriteLn(f,'  Nome dello sprite              --->  NomeSprite');
    WriteLn(f,'  Lunghezza effettiva in pixels  --->  ',MaxX);
    WriteLn(f,'  Altezza effettiva in pixels    --->  ',MaxY);
    WriteLn(f,'  Lunghezza reale in pixels      --->  ',x);
    WriteLn(f,'  Altezza reale in pixels        --->  ',y);
    WriteLn(f,'  Numero colori presenti         --->  ',MaxCol,' + il Nero');
    WriteLn(f,'  Memoria totale occupata        --->  ',((x*y) Div 2)+7,
              ' Bytes.');
    WriteLn(f,'}');
    WriteLn(f,'                                ');
    WriteLn(f,'Program Generazione_Di_Uno_Sprite;');
    WriteLn(f,'Uses Crt,Graph;');

    { Definizio del tipo }
    WriteLn(f,'Type RecNomeSprite= Record');
    Write  (f,'        ');
    For i := 1 To Length('NomeSprite') Do
      Write(f,' ');
    WriteLn(f,'  X:   Word;');
    Write  (f,'        ');
    For i := 1 To Length('NomeSprite') Do
      Write(f,' ');
    WriteLn(f,'  Y:   Word;');
    Write  (f,'        ');
    For i := 1 To Length('NomeSprite') Do
      Write(f,' ');
    WriteLn(f,'  Vet: Array [0..',((x*y) Div 2)-1,'] Of Byte;');
    Write  (f,'        ');
    For i := 1 To Length('NomeSprite') Do
      Write(f,' ');
    WriteLn(f,'  End; { Record Sprite NomeSprite }');
    WriteLn(f,'        ');

    { Definizio dello sprite }
    WriteLn(f,'Const ConstNomeSprite: RecNomeSprite=');
    WriteLn(f,'      (X: ',(MaxX-1):3,';');
    WriteLn(f,'       Y: ',(MaxY-1):3,';');
    Write  (f,'       Vet: (');
    n := 0;

    { Tutte le righe }
    For i := 1 To y Do
      Begin

      { Tutti le 4 configurazioni per ogni riga }
      For j := 1 To 4 Do
        Begin

        { Tutte le colonne }
        For k := 1 To (x Div 8) Do
	  Begin
	  Inc(n);
          Write(f,Expand3(VetRiga[k,i,j]));
          If (Not ((i = y) And (j = 4) And (k = (x Div 8))))
            Then
              Write(f,', ')
          Else
            Write(f,'));');

          { Cambio riga ? }
          If (n > 12)
            Then
              Begin
              WriteLn(f);
              Write  (f,'             ');
              n := 0;
              End;

          End;

        End;

      End;

    { Programma principale }
    WriteLn(f);
    WriteLn(f,'Var NomeSprite:  Pointer;   { Puntatore allo sprite }');
    WriteLn(f,'    GraphDriver: Integer;   { Driver grafico        }');
    WriteLn(f,'    GraphMode:   Integer;   { Modo grafico          }');
    WriteLn(f);
    WriteLn(f,'Begin {* Main Program *}');
    WriteLn(f,'GraphDriver := Detect;');
    WriteLn(f,'GraphMode := Detect;');
    WriteLn(f,'InitGraph(GraphDriver,GraphMode,'''+DefaultBGI+''');');
    WriteLn(f,'NomeSprite := @ConstNomeSprite;');
    WriteLn(f,'With ConstNomeSprite Do');
    WriteLn(f,'  PutImage((GetMaxX-X) Div 2,(GetMaxY-Y) Div 2,NomeSprite^,'+
                         'NormalPut);');
    WriteLn(f,'ReadLn;');
    WriteLn(f,'CloseGraph;');
    WriteLn(f,'End. {* Main Program *}');
    Close(f);
    {$I+}

    If (IOResult <> 0)
      Then
        Errore := True;

    If Errore
      Then
        Windows(Automatico,Automatico,Automatico,Automatico,
      	        'L ^LErrore Di Scrittura'+'^LSul Disco.^L ',
	        Yellow,Brown,Blue,SoloOk,SprExt)
    End;

End; { CreaFileTurbo }


{===========================================================================}
{ PROCEDURA: SPRITE.MANAGER                                                 }
{                                                                           }
{ E' il cuore del programma, quello che lo fa partire.                      }
{===========================================================================}
Procedure SpriteManager;

Var

    { Modo grafico }
    GraphMode:   Integer;

    { Driver grafico }
    GraphDriver: Integer;

    { Errore grafico }
    Errore:      Integer;

    { Percorso per i files *.BGI e *.CHR }
    PathBGI:     String;

    { Ciclo }
    I:           Integer;

    { Ciclo }
    J:           Integer;


Begin { SpriteManager }

{ Salvataggio della directory corrente }
GetDir(DriveDefault,CurrDir);

PathBGI := DefaultBGI;

{ Immissione del percorso se non viene trovato il file 'EGAVGA.BGI' }
Repeat

  GraphDriver := VGA;
  GraphMode := VGAHI;

  InitGraph(GraphDriver,GraphMode,PathBGI);
  Errore := GraphResult;

  If (Errore <> GrOk)
    Then
      InsertPath(PathBGI,Errore);

Until (PathBGI = '') Or (Errore = GrOk);

{ Uscita dal programma }
If (Errore <> GrOk)
  Then
    Abort(Errore);

DefaultBGI := PathBGI;

{ Installazione del mouse }
InstallMouse;
If (Not MouseOk)
  Then

    { Errore: manca il mouse }
    ErroreMouse

Else

  Begin

  { Dimensione di default, scala 10:1 }
  Lato := DimLatoDefault;

  { Nessun file letto }
  NomeFile := '';

  { Definizioni griglia, retino, colore, forma, ecc. }
  Griglia := gLinee;
  OldGriglia := gNessuna;
  Shape := sDisegnoLibero;
  Lines := lSolid1;
  Pattern := pEmpty;

  { Installazioni dei 10 font richiesti }
  i := InstallUserFont('TRIP');
  i := InstallUserFont('LITT');
  i := InstallUserFont('SANS');
  i := InstallUserFont('GOTH');
  i := InstallUserFont('BOLD');
  i := InstallUserFont('EURO');
  i := InstallUserFont('LCOM');
  i := InstallUserFont('SCRI');
  i := InstallUserFont('SIMP');
  i := InstallUserFont('TSCR');

  { Definizione dei pulsanti (icone) }
  DefinisciPulsanti;

  { Disegno dello schermo di Sprite Manager }
  VuotaSchermo;
  DisegnaGriglia;
  RettangoloReal(1,1);

  { Coordinate laterali }
  WriteBarCoord(HorizDir,InizioX,FineX);
  WriteBarCoord(VertDir,InizioY,FineY);

  { Titolo }
  WaitToWrite;
  SetColor(LightGreen);
  SetTextStyle(DefaultFont,HorizDir,1);
  St := '**** SPRITE MANAGER VERSIONE '+Version+' *** DI FOCHI MICHELE ****';
  OutTextXY(8+(TextWidth(St) Div 2),4,St);

  { Posizione Y del cursore del mouse }
  SetTextJustify(LeftText,CenterText);
  SetColor(LightRed);
  Str(MaxRighe:4,St);
  St := St+' Righe';
  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5,St);

  { Posizione X del cursore del mouse }
  Str(MaxColonne:4,St);
  St := St+' Colonne';
  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5+TextHeight('█'),St);

  { Numero di colori }
  Str(16:4,St);
  St := St+' Colori';
  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5+2*TextHeight('█'),St);

  { Scala e nome del file sul video }
  AggiornaScala;
  AggiornaNomeFile;

  { Definiziode del cursore del mouse }
  ShowMouse;
  Cursor := CursorScreen;
  NewMouseCursor(Cursor);
  MouseType := Screen;

  { Pressione del colore di default }
  Color := Black;
  PremiPulsante(White,P[White],Colori);
  Color := White;
  Fine := False;
  Modificato := False;
  OldMouseX := 0;
  OldMouseY := 0;

  { Ciclo principale del programma Sprite Manager }
  Repeat

    ShowMouse;

    Repeat

      GetMPos;

      { Aggiornamento della posizione del mouse nella finestra grande }
      If ((MouseX >= 11) And (MouseX <= 9+MaxX*Lato) And
          (MouseY >= 11) And (MouseY <= 9+MaxY*Lato)) And
         ((((MouseX-10) Div Lato) <> ((OldMouseX-10) Div Lato)) Or
         (((MouseY-10) Div Lato) <> ((OldMouseY-10) Div Lato)))
	   Then
	     Begin
	     WritePosCoord(((MouseX-10) Div Lato+InizioX),
			   ((MouseY-10) Div Lato+InizioY));
             ShowMouse;
	     OldMouseX := MouseX;
	     OldMouseY := MouseY;
	     End

      Else

        { Aggiornamento della posizione del mouse nella finestra piccola }
        If ((MouseX >= InizioRealX) And
	   (MouseX <= InizioRealX+MaxColonne-1) And
	   (MouseY >= InizioRealY) And
	   (MouseY <= InizioRealY+MaxRighe-1)) And
	   ((OldMouseX <> MouseX) Or (OldMouseY <> MouseY))
	     Then
	       Begin
	       WritePosCoord(MouseX-InizioRealX+1,MouseY-InizioRealY+1);
               ShowMouse;
	       OldMouseX := MouseX;
	       OldMouseY := MouseY;
	       End;

      { Cambio della forma del cursore del mouse (freccia <---> mano) }
      If (MouseType <> Screen)
        Then

          { Freccia }
          Begin
          If ((MouseX >= 11) And (MouseX <= 9+MaxX*Lato) And
	      (MouseY >= 11) And (MouseY <= 9+MaxY*Lato)) Or
	     ((MouseX >= InizioRealX) And
	      (MouseX <= InizioRealX+MaxColonne-1) And
	      (MouseY >= InizioRealY) And
	      (MouseY <= InizioRealY+MaxRighe-1))
	        Then
	          Begin
	          Cursor := CursorScreen;
	          MouseType := Screen;
	          NewMouseCursor(Cursor);
                  ShowMouse;
	          End;
          End
      Else

        { Manina }
        If (MouseType <> Icone)
          Then
	    If Not (((MouseX >= 11) And (MouseX <= 9+MaxX*Lato) And
		     (MouseY >= 11) And (MouseY <= 9+MaxY*Lato)) Or
		    ((MouseX >= InizioRealX) And
		     (MouseX <= InizioRealX+MaxColonne-1) And
		     (MouseY >= InizioRealY) And
		     (MouseY <= InizioRealY+MaxRighe-1)))
		       Then
		         Begin
		         Cursor := CursorIcone;
		         MouseType := Icone;
		         NewMouseCursor(Cursor);
                         ShowMouse;
		         End;

    Until MousePressed;

    { E' stata scelta un' icona ? }
    If MouseInG(P[Black].x,P[Black].y,
                P[CmdLeggi].x+25,P[LightGray].y+25)
      Then

        { Se si, controllo di tutte le icone }
        Begin

        { Un colore (nero..bianco) }
        For i := Black To White Do
          If MouseInG(P[i].x,P[i].y,P[i].x+25,P[i].y+25)
            Then
              Begin
	      PremiPulsante(i,P[i],Colori);
	      Color := i;
	      End;

        { Icona 'Nuovo sprite' }
        If MouseInG(P[CmdNuovo].x,P[CmdNuovo].y,
                    P[CmdNuovo].x+25,P[CmdNuovo].y+25)
          Then
            Begin

	    PremiPulsante(CmdNuovo,P[CmdNuovo],Opzioni);

	    If Modificato
              Then
                St := 'N( Non E'' Stato Salvato )^'
	    Else
              St := '';

            { Finestra di conferma }
	    Windows(Automatico,Automatico,Automatico,Automatico,
		    'L ^LLo Sprite In Memoria Andrà Perso.^'+St+'OSei Sicuro ?^L ',
		    Yellow,Brown,Blue,EscapeOk,SprExt);

            { Ok ? }
            If Risp
              Then
                Begin

                VuotaSchermo;
	        DisegnaGriglia;

                WaitToWrite;

	        RettangoloReal(1,1);
                DefineEndCoords;
	        WriteBarCoord(HorizDir,InizioX,FineX);
	        WriteBarCoord(VertDir,InizioY,FineY);

                NomeFile := '';
                AggiornaNomeFile;

                End;

            End

        Else

          { Icona 'Leggi file' }
          If MouseInG(P[CmdLeggi].x,P[CmdLeggi].y,
                      P[CmdLeggi].x+25,P[CmdLeggi].y+25)
            Then
              Begin

	      PremiPulsante(CmdLeggi,P[CmdLeggi],Opzioni);

	      Windows(Automatico,Automatico,Automatico,Automatico,
		      'L ^LScegli Il Nome Del File Da Leggere^'+
		      'L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^',
		      Yellow,Brown,Blue,ReadFile,SprExt);

	      If (Risp And (Not NoFile))
                Then
	          Begin
	          If Modificato
                    Then
		      Windows(Automatico,Automatico,Automatico,Automatico,
			      'L ^LTutte Le Modifiche Effettuate Dopo^'+
			      'LIl Salvataggio Del File^'+
			      'LAndranno Perse.^'+
			      'OSei Sicuro di Voler Continuare ?^L ',
			      Yellow,Brown,Blue,EscapeOk,SprExt)
	          Else
                    Risp := True;

                  { Leggo il file ? }
	          If Risp
                    Then
		      LeggiFile(FileName);

	          End;

              AggiornaNomeFile;
              WaitToWrite;
              DefineEndCoords;
	      WriteBarCoord(HorizDir,InizioX,FineX);
	      WriteBarCoord(VertDir,InizioY,FineY);
              DisegnaPixel(NotClear,AncheReal);
              ShowMouse;

	      End

        Else

          { Icona 'Esci dal programma' }
          If MouseInG(P[CmdEsci].x,P[CmdEsci].y,
                      P[CmdEsci].x+25,P[CmdEsci].y+25)
            Then
              Begin

	      PremiPulsante(CmdEsci,P[CmdEsci],Opzioni);

	      If Modificato
                Then
                  St := 'N( Lo Sprite Non E'' Stato Salvato )^'
	      Else
                St := '';

              { Conferma dell' uscita }
	      Windows(Automatico,Automatico,Automatico,Automatico,
		      'L ^KSei Proprio Sicuro di Voler Uscire^'+
		      'Kda SPRITE MANAGER ?^'+St+'L ',
		      Yellow,Brown,Blue,EscapeOk,SprExt);

              { Uscita ? }
	      Fine := Risp;

	      End

        Else

          { Comando 'Salva file' }
          If MouseInG(P[CmdSalva].x,P[CmdSalva].y,
                      P[CmdSalva].x+25,P[CmdSalva].y+25)
            Then
              Begin

	      PremiPulsante(CmdSalva,P[CmdSalva],Opzioni);

	      Windows(Automatico,Automatico,Automatico,Automatico,
		      'L ^LScegli Il Nome Del File Su Cui Salvare^'+
		      'L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^',
		      Yellow,Brown,Blue,SaveFile,SprExt);

              { Salvataggio del file ? }
	      If Risp
                Then
	          SalvaFile(FileName);

              AggiornaNomeFile;
              DisegnaPixel(NotClear,AncheReal);

              ShowMouse;

	      End

        Else

          { Icona 'Zoom in' }
          If MouseInG(P[CmdZoomIn].x,P[CmdZoomIn].y,
                      P[CmdZoomIn].x+25,P[CmdZoomIn].y+25)
            Then
              Begin

	      PremiPulsante(CmdZoomIn,P[CmdZoomIn],Opzioni);

              { Comando di zoom valido ? }
              If (Lato < 420)
                Then

                  Begin
                  Inc(Lato);
                  WaitToWrite;
                  RettangoloReal(InizioX,InizioY);
                  DefineEndCoords;
                  RettangoloReal(InizioX,InizioY);
    	          DisegnaPixel(Clear,NoReal);
	          WriteBarCoord(HorizDir,InizioX,FineX);
                  WriteBarCoord(VertDir,InizioY,FineY);
                  DisegnaGriglia;
                  AggiornaScala;
                  End;

	      End

        Else

          { Icona 'Zoom out' }
          If MouseInG(P[CmdZoomOut].x,P[CmdZoomOut].y,
                      P[CmdZoomOut].x+25,P[CmdZoomOut].y+25)
            Then
              Begin

	      PremiPulsante(CmdZoomOut,P[CmdZoomOut],Opzioni);

              { Comando di zoom valido ? }
              If (Lato > 2)
                Then
                  Begin
                  Dec(Lato);
                  WaitToWrite;
                  RettangoloReal(InizioX,InizioY);
                  DefineEndCoords;
                  RettangoloReal(InizioX,InizioY);
    	          DisegnaPixel(Clear,NoReal);
	          WriteBarCoord(HorizDir,InizioX,FineX);
	          WriteBarCoord(VertDir,InizioY,FineY);
                  DisegnaGriglia;
                  AggiornaScala;
                  End;

 	      End

        Else

          { Icona 'Griglia' }
          If MouseInG(P[CmdGriglia].x,P[CmdGriglia].y,
                      P[CmdGriglia].x+25,P[CmdGriglia].y+25)
            Then
              Begin

	      PremiPulsante(CmdGriglia,P[CmdGriglia],Opzioni);

              { Scelta dell' icona }
	      IconWindows(Automatico,Automatico,Automatico,Automatico,
		          'L ^LScegli Il Tipo Di Griglia^'+
		          'L ^L ^L ^L ^L ^L ^',
		          Yellow,Brown,Blue,IconeGriglia);

              { Cambio dell' icona sul video }
              AssegnaPulsanteGriglia(Disegna,Griglia,P[CmdGriglia]);

              DisegnaGriglia;

	      End

        Else

          { Icona 'Forma' }
          If MouseInG(P[CmdShape].x,P[CmdShape].y,
                      P[CmdShape].x+25,P[CmdShape].y+25)
            Then
              Begin

	      PremiPulsante(CmdShape,P[CmdShape],Opzioni);

              { Scelta dell' icona }
	      IconWindows(Automatico,Automatico,Automatico,Automatico,
		          'L ^LScegli Il Tipo Di Figura^'+
		          'L ^L ^L ^L ^L ^L ^',
		          Yellow,Brown,Blue,IconeShape);

              { Cambio dell' icona sul video }
              AssegnaPulsanteShape(Disegna,Shape,P[CmdShape]);

	      End

        Else

          { Icona 'Linea' }
          If MouseInG(P[CmdLine].x,P[CmdLine].y,
                      P[CmdLine].x+25,P[CmdLine].y+25)
            Then
              Begin

	      PremiPulsante(CmdLine,P[CmdLine],Opzioni);

              { Scelta dell' icona }
	      IconWindows(Automatico,Automatico,Automatico,Automatico,
		          'L ^LScegli Il Tipo Di Linea^'+
		          'L ^L ^L ^L ^L ^L ^',
		          Yellow,Brown,Blue,IconeLines);

              { Cambio dell' icona sul video }
              AssegnaPulsanteLine(Disegna,Lines,P[CmdLine]);

	      End

        Else

          { Icona 'Retino' }
          If MouseInG(P[CmdPattern].x,P[CmdPattern].y,
                      P[CmdPattern].x+25,P[CmdPattern].y+25)
            Then
              Begin

	      PremiPulsante(CmdPattern,P[CmdPattern],Opzioni);

              { Scelta dell' icona }
	      IconWindows(Automatico,Automatico,Automatico,Automatico,
		          'L ^LScegli Tipo Di Il Retino^'+
		          'L ^L ^L ^L ^L ^L ^L ^L ^',
		          Yellow,Brown,Blue,IconePattern);

              { Cambio dell' icona sul video }
              AssegnaPulsantePattern(Disegna,Pattern,P[CmdPattern]);

	      End

        Else

          { Icona 'Informazioni' }
          If MouseInG(P[CmdInfo].x,P[CmdInfo].y,
                      P[CmdInfo].x+25,P[CmdInfo].y+25)
            Then
              Begin

	      PremiPulsante(CmdInfo,P[CmdInfo],Opzioni);

	      Windows(Automatico,Automatico,Automatico,Automatico,
		      '***INFO***',Yellow,Brown,Blue,SoloOk,SprExt)

	      End

        Else

          { Icona 'Crea file Turbo Pascal' }
          If MouseInG(P[CmdTurbo].x,P[CmdTurbo].y,
                      P[CmdTurbo].x+25,P[CmdTurbo].y+25)
            Then
              Begin

	      PremiPulsante(CmdTurbo,P[CmdTurbo],Opzioni);

	      Windows(Automatico,Automatico,Automatico,Automatico,
		      'L ^LScegli Il Nome Del File Da Creare^'+
		      'L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^L ^',
		      Yellow,Brown,Blue,SaveFile,PasExt);

              { Creazione del file ? }
	      If Risp
                Then
	          CreaFileTurbo(FileName);

              DisegnaPixel(NotClear,AncheReal);

              ShowMouse;

	      End;

        End

    Else

      { Mouse nella finestra grande }
      If MouseInG(11,11,9+MaxX*Lato,9+MaxY*Lato)
        Then
          DisegnaFigura(FinGrande)

    Else

      { Freccia verso il basso }
      If MouseInG(P[CmdSu].x,P[CmdSu].y,
                  P[CmdSu].x+25,P[CmdSu].y+25)
        Then
          Begin

          PremiPulsante(CmdSu,P[CmdSu],Opzioni);

          { Spostamento ? }
          If (InizioY > 1)
            Then
	      Begin
              WaitToWrite;
	      RettangoloReal(InizioX,InizioY);
	      WriteBarCoord(VertDir,InizioY-1,FineY-1);
              DefineEndCoords;
	      RettangoloReal(InizioX,InizioY);
	      DisegnaPixel(Clear,NoReal);
	      DisegnaGriglia;
	      End;

          End

    Else

      { Freccia verso l' alto }
      If MouseInG(P[CmdGiu].x,P[CmdGiu].y,
                  P[CmdGiu].x+25,P[CmdGiu].y+25)
        Then
          Begin

          PremiPulsante(CmdGiu,P[CmdGiu],Opzioni);

          { Spostamento ? }
          If (FineY < MaxRighe)
            Then
	      Begin
              WaitToWrite;
	      RettangoloReal(InizioX,InizioY);
	      WriteBarCoord(VertDir,InizioY+1,FineY+1);
              DefineEndCoords;
	      RettangoloReal(InizioX,InizioY);
	      DisegnaPixel(Clear,NoReal);
	      DisegnaGriglia;
	      End;

          End

    Else

      { Freccia verso la sinistra }
      If MouseInG(P[CmdSinistra].x,P[CmdSinistra].y,
                  P[CmdSinistra].x+25,P[CmdSinistra].y+25)
        Then
          Begin

          PremiPulsante(CmdSinistra,P[CmdSinistra],Opzioni);

          { Spostamento ? }
          If (InizioX > 1)
            Then
	      Begin
              WaitToWrite;
	      RettangoloReal(InizioX,InizioY);
	      WriteBarCoord(HorizDir,InizioX-1,FineX-1);
              DefineEndCoords;
	      RettangoloReal(InizioX,InizioY);
	      DisegnaPixel(Clear,NoReal);
	      DisegnaGriglia;
	      End;

          End

    Else

      { Freccia verso la destra }
      If MouseInG(P[CmdDestra].x,P[CmdDestra].y,
                  P[CmdDestra].x+25,P[CmdDestra].y+25)
        Then
          Begin

          PremiPulsante(CmdDestra,P[CmdDestra],Opzioni);

          { Spostamento ? }
          If (FineX < MaxColonne)
            Then
	      Begin
              WaitToWrite;
	      RettangoloReal(InizioX,InizioY);
	      WriteBarCoord(HorizDir,InizioX+1,FineX+1);
              DefineEndCoords;
	      RettangoloReal(InizioX,InizioY);
	      DisegnaPixel(Clear,NoReal);
	      DisegnaGriglia;
	      End;

          End
    Else

      { Mouse nella finestra piccola }
      If MouseInG(InizioRealX,InizioRealY,
		  InizioRealX+MaxColonne-1,InizioRealY+MaxRighe-1)
        Then
          DisegnaFigura(FinPiccola);

    ShowMouse;

  Until Fine;

  EndSpriteManager;

  End;

End; { SpriteManager }


{===========================================================================}
{ PROCEDURA: RELEASE.BUTTONS                                                }
{                                                                           }
{ Attende che l' utente rilasci tutti i pulsanti del mouse (nel frattenpo   }
{ non esegue nessuna operazione).                                           }
{===========================================================================}
Procedure ReleaseButtons;

Begin { ReleaseButtons }

ShowMouse;

Repeat

  GetMPos;

Until (Not MousePressed);

End; { ReleaseButtons }


{===========================================================================}
{ PROCEDURA: ICON.WINDOWS                                                   }
{                                                                           }
{ E' molto simile alla procedura WINDOWS, ma questa visualizza delle icone  }
{ (per la scelta del tipo di griglia, retino, linea o forma da disegnare).  }
{ I parametri sono quasi gli stessi, tranne l' ultimo:                      }
{   X1:          inizio X                                                   }
{   Y1:          inizio Y                                                   }
{   X2:          fine X                                                     }
{   Y2:          fine Y                                                     }
{   Stringa:     testo della finestra (usare ^ per separare le righe)       }
{   PulsAlto:    colore delle linne in alto (come i tasti)                  }
{   PulsBasso:   colore delle linee in basso                                }
{   PulsSfondo:  colore di sfondo                                           }
{   Icone:       tipo di icona da integrare nella finestra, scelte fra      }
{                IconeShape, IconeLines, IconePattern, IconeGriglia         }
{===========================================================================}
Procedure IconWindows ( X1:         Integer;
                        Y1:         Integer;
                        X2:         Integer;
                        Y2:         Integer;
                        Stringa:    String;
		        PulsAlto:   Byte;
                        PulsBasso:  Byte;
                        PulsSfondo: Byte;
                        Icone:      TipoIcone );

Const

      { Dati per l'icona del comando ESCAPE. }
      ConstPEscape: RecImage=
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
             192, 000, 001, 128,   063, 255, 254, 000,
             255, 243, 254, 000,   063, 243, 254, 000,
             192, 000, 001, 128,   063, 243, 254, 000,
             255, 195, 254, 000,   063, 195, 254, 000,
             192, 000, 001, 128,   063, 195, 254, 000,
             255, 003, 254, 000,   063, 003, 254, 000,
             192, 000, 001, 128,   063, 003, 254, 000,
             252, 000, 006, 000,   060, 000, 006, 000,
             192, 000, 001, 128,   060, 000, 006, 000,
             240, 000, 006, 000,   048, 000, 006, 000,
             192, 000, 001, 128,   048, 000, 006, 000,
             252, 000, 006, 000,   060, 000, 006, 000,
             192, 000, 001, 128,   060, 000, 006, 000,
             255, 003, 254, 000,   063, 003, 254, 000,
             192, 000, 001, 128,   063, 003, 254, 000,
             255, 195, 254, 000,   063, 195, 254, 000,
             192, 000, 001, 128,   063, 195, 254, 000,
             255, 243, 254, 000,   063, 243, 254, 000,
             192, 000, 001, 128,   063, 243, 254, 000,
             255, 255, 254, 000,   063, 255, 254, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             224, 000, 002, 000,   032, 000, 002, 000,
             192, 000, 001, 128,   063, 255, 254, 000,
             239, 190, 250, 000,   047, 190, 250, 000,
             207, 190, 249, 128,   048, 065, 006, 000,
             236, 048, 194, 000,   044, 048, 194, 000,
             204, 048, 193, 128,   051, 207, 062, 000,
             239, 190, 194, 000,   047, 190, 194, 000,
             207, 190, 193, 128,   048, 065, 062, 000,
             236, 006, 194, 000,   044, 006, 194, 000,
             204, 006, 193, 128,   051, 249, 062, 000,
             239, 190, 250, 000,   047, 190, 250, 000,
             207, 190, 249, 128,   048, 065, 006, 000,
             224, 000, 002, 000,   032, 000, 002, 000,
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
             000, 001, 128, 000,   255, 254, 000, 000,
             243, 254, 000, 000,   243, 254, 000, 000,
             000, 001, 128, 000,   243, 254, 000, 000,
             195, 254, 000, 000,   195, 254, 000, 000,
             000, 001, 128, 000,   195, 254, 000, 000));

Var

    { Sono le righe del testo, al massimo 30 }
    Stringhe:    TipoStringhe;

    { Numero di righe che ha la finestra }
    NumRighe:    Byte;

    { Inizio X della finestra }
    InizioFinX:  Integer;

    { Inizio Y della finestra }
    InizioFinY:  Integer;

    { Fine X della finestra }
    FineFinX:    Integer;

    { Fine Y della finestra }
    FineFinY:    Integer;

    { Numero di righe }
    Righe:       Integer;

    { Numero di colonne }
    Colonne:     Integer;

    { Dimensione dell' area da salvare in memoria }
    Size:        Word;

    { Icone da visualizzare (al massimo 13) }
    Puls:        Array [1..13] Of
                   RecP;

    { Puntatore ad una icona }
    Punt:        Pointer;

    { Numero di icone (tasti) da visualizzare }
    NumTasti:    Byte;

    { E' stata scelta un' icona ? }
    Scelto:      Boolean;

    { Numero dell' icona scelta }
    Premuto:     Byte;

    { Come deve essere salvata l' area ? }
    Procedi:     (Fermo, Memoria, Finestrona);

    { Ciclo }
    I:           Integer;


Begin { IconWindows }

{ Icona che deve esserci sempre }
P[33].P := @ConstPEscape;
NormalWindow(NumRighe,Stringhe,Stringa);

SetTextStyle(DefaultFont,HorizDir,1);
SetTextJustify(CenterText,CenterText);

{ Aggiusta le varie righe della finestra }
St := Stringhe[1];
For i := 2 To NumRighe Do
  If Length(St) < Length(Stringhe[i]) Then
    St := Stringhe[i];
Delete(St,1,1);

{ Determina l' inizio della finestra }
If ((X1 = Automatico) And (X2 = Automatico))
  Then
    Begin
    InizioFinX := ((GetMaxX-TextWidth(St)) Div 2)-30;
    FineFinX := ((GetMaxX+TextWidth(St)) Div 2)+30;
    End
Else
  Begin
  InizioFinX := X1;
  FineFinX := X2;
  End;

{ Determina la fine della finestra }
If ((Y1 = Automatico) And (Y2 = Automatico))
  Then
    Begin
    InizioFinY := ((GetMaxY-NumRighe*2*TextHeight('█')) Div 2)-30;
    FineFinY := ((GetMaxY+NumRighe*2*TextHeight('█')) Div 2)+30;
    End
Else
  Begin
  InizioFinY := Y1;
  FineFinY := Y2;
  End;

{ Dimensione dell' area da salvare }
Size := ImageSize(InizioFinX,InizioFinY,FineFinX,FineFinY);

{ Stabilisce se è necessario salvarla in memoria o no }
Procedi := Fermo;
If ((MemAvail > Size) And (Size > 0))
  Then

    Begin

    If (IOResult = 0)
      Then

      { Memoria suficiente }
      Procedi := Memoria;

    End

Else

  { Memoria non sufficiente }
  Procedi := Finestrona;

{ Se si può procedere ... }
If (Procedi <> Fermo)
  Then
    Begin

    If (Procedi = Memoria)
      Then
        Begin
        GetMem(Punt, Size);
        GetImage(InizioFinX,InizioFinY,FineFinX,FineFinY,Punt^);
        End;

    SetFillStyle(SolidFill,PulsSfondo);
    WaitToWrite;
    HideMouse;
    Bar(InizioFinX,InizioFinY,FineFinX,FineFinY);
    SetColor(PulsAlto);
    Line(InizioFinX,FineFinY,InizioFinX,InizioFinY);
    Line(InizioFinX+1,FineFinY-1,InizioFinX+1,InizioFinY+1);
    Line(InizioFinX,InizioFinY,FineFinX,InizioFinY);
    Line(InizioFinX,InizioFinY+1,FineFinX-1,InizioFinY+1);
    SetColor(PulsBasso);
    Line(InizioFinX,FineFinY,FineFinX,FineFinY);
    Line(InizioFinX+1,FineFinY-1,FineFinX,FineFinY-1);
    Line(FineFinX,FineFinY,FineFinX,InizioFinY);
    Line(FineFinX-1,FineFinY,FineFinX-1,InizioFinY+1);

    { Scrive il testo nella finestra }
    For i := 1 To NumRighe Do
      Begin
      SetColor(Ord(Stringhe[i,1])-65);
      Delete(Stringhe[i],1,1); 
      OutTextXY((FineFinX-InizioFinX) Div 2+InizioFinX,
	        InizioFinY+2*i*TextHeight('█'),Stringhe[i]);
      End;

    ShowMouse;

    { Set di icone da visualizzare }
    Case Icone Of

      { Forme }
      IconeShape:   Begin

                    NumTasti := 9;
                    AssegnaPulsanteShape(NonDisegnare,sCerchio,Puls[1]);
                    AssegnaPulsanteShape(NonDisegnare,sCerchioPieno,Puls[2]);
                    AssegnaPulsanteShape(NonDisegnare,sLinee,Puls[3]);
                    AssegnaPulsanteShape(NonDisegnare,sLineePiene,Puls[4]);
                    AssegnaPulsanteShape(NonDisegnare,sRettangolo,Puls[5]);
                    AssegnaPulsanteShape(NonDisegnare,sRettangoloPieno,
                                         Puls[6]);
                    AssegnaPulsanteShape(NonDisegnare,sDisegnoLibero,
                                         Puls[7]);
                    AssegnaPulsanteShape(NonDisegnare,sTesto,Puls[8]);
                    Puls[9].P := P[CmdEscape].P;

                    Puls[1].X := ((FineFinX-InizioFinX) Div 5)+InizioFinX-13;
                    Puls[1].Y := ((FineFinY-InizioFinY) Div 4)+InizioFinY+7;
                    Puls[2].X := 2*((FineFinX-InizioFinX) Div 5)+
                                 InizioFinX-13;
                    Puls[2].Y := Puls[1].Y;
                    Puls[3].X := 3*((FineFinX-InizioFinX) Div 5)+
                                 InizioFinX-13;
                    Puls[3].Y := Puls[1].Y;
                    Puls[4].X := 4*((FineFinX-InizioFinX) Div 5)+
                                 InizioFinX-13;
                    Puls[4].Y := Puls[1].Y;

                    Puls[5].X := Puls[1].X;
                    Puls[5].Y := 3*((FineFinY-InizioFinY) Div 5)+
                                 InizioFinY-13;
                    Puls[6].X := Puls[2].X;
                    Puls[6].Y := Puls[5].Y;
                    Puls[7].X := Puls[3].X;
                    Puls[7].Y := Puls[5].Y;
                    Puls[8].X := Puls[4].X;
                    Puls[8].Y := Puls[5].Y;

                    Puls[9].X := ((FineFinX-InizioFinX) Div 2)+InizioFinX-15;
                    Puls[9].Y := 3*((FineFinY-InizioFinY) Div 4)+InizioFinY;

                    End;

      { Griglia }
      IconeGriglia: Begin

                    NumTasti := 4;
                    AssegnaPulsanteGriglia(NonDisegnare,gLinee,Puls[1]);
                    AssegnaPulsanteGriglia(NonDisegnare,gPunti,Puls[2]);
                    AssegnaPulsanteGriglia(NonDisegnare,gNessuna,Puls[3]);
                    Puls[4].P := P[CmdEscape].P;

                    Puls[1].X := ((FineFinX-InizioFinX) Div 4)+InizioFinX-13;
                    Puls[1].Y := ((FineFinY-InizioFinY) Div 3)+InizioFinY+7;
                    Puls[2].X := 2*((FineFinX-InizioFinX) Div 4)+
                                 InizioFinX-13;
                    Puls[2].Y := Puls[1].Y;
                    Puls[3].X := 3*((FineFinX-InizioFinX) Div 4)+
                                 InizioFinX-13;
                    Puls[3].Y := Puls[1].Y;
                    Puls[4].X := Puls[2].X;
                    Puls[4].Y := 2*((FineFinY-InizioFinY) Div 3)+InizioFinY;

                    End;

      { Linee }
      IconeLines:   Begin

                    NumTasti := 9;
                    AssegnaPulsanteLine(NonDisegnare,lSolid1,Puls[1]);
                    AssegnaPulsanteLine(NonDisegnare,lSolid3,Puls[2]);
                    AssegnaPulsanteLine(NonDisegnare,lDotted1,Puls[3]);
                    AssegnaPulsanteLine(NonDisegnare,lDotted3,Puls[4]);
                    AssegnaPulsanteLine(NonDisegnare,lCenter1,Puls[5]);
                    AssegnaPulsanteLine(NonDisegnare,lCenter3,Puls[6]);
                    AssegnaPulsanteLine(NonDisegnare,lDashed1,Puls[7]);
                    AssegnaPulsanteLine(NonDisegnare,lDashed3,Puls[8]);
                    Puls[9].P := P[CmdEscape].P;

                    Puls[1].X := ((FineFinX-InizioFinX) Div 5)+InizioFinX-13;
                    Puls[1].Y := ((FineFinY-InizioFinY) Div 4)+InizioFinY+7;
                    Puls[2].X := 2*((FineFinX-InizioFinX) Div 5)+
                                 InizioFinX-13;
                    Puls[2].Y := Puls[1].Y;
                    Puls[3].X := 3*((FineFinX-InizioFinX) Div 5)+
                                 InizioFinX-13;
                    Puls[3].Y := Puls[1].Y;
                    Puls[4].X := 4*((FineFinX-InizioFinX) Div 5)+
                                 InizioFinX-13;
                    Puls[4].Y := Puls[1].Y;

                    Puls[5].X := Puls[1].X;
                    Puls[5].Y := 3*((FineFinY-InizioFinY) Div 5)+
                                 InizioFinY-13;
                    Puls[6].X := Puls[2].X;
                    Puls[6].Y := Puls[5].Y;
                    Puls[7].X := Puls[3].X;
                    Puls[7].Y := Puls[5].Y;
                    Puls[8].X := Puls[4].X;
                    Puls[8].Y := Puls[5].Y;

                    Puls[9].X := ((FineFinX-InizioFinX) Div 2)+InizioFinX-15;
                    Puls[9].Y := 3*((FineFinY-InizioFinY) Div 4)+InizioFinY;

                    End;

      { Retini }
      IconePattern: Begin

                    NumTasti := 13;
                    AssegnaPulsantePattern(NonDisegnare,pEmpty,Puls[01]);
                    AssegnaPulsantePattern(NonDisegnare,pSolid,Puls[02]);
                    AssegnaPulsantePattern(NonDisegnare,pLine,Puls[03]);
                    AssegnaPulsantePattern(NonDisegnare,pLtSlash,Puls[04]);
                    AssegnaPulsantePattern(NonDisegnare,pSlash,Puls[05]);
                    AssegnaPulsantePattern(NonDisegnare,pBkSlash,Puls[06]);
                    AssegnaPulsantePattern(NonDisegnare,pLtBkSlash,Puls[07]);
                    AssegnaPulsantePattern(NonDisegnare,pHatch,Puls[08]);
                    AssegnaPulsantePattern(NonDisegnare,pXHatch,Puls[09]);
                    AssegnaPulsantePattern(NonDisegnare,pInterleave,
                                           Puls[10]);
                    AssegnaPulsantePattern(NonDisegnare,pWideDot,Puls[11]);
                    AssegnaPulsantePattern(NonDisegnare,pCloseDot,Puls[12]);
                    Puls[13].P := P[CmdEscape].P;

                    Puls[01].X := ((FineFinX-InizioFinX) Div 5)+
                                  InizioFinX-13;
                    Puls[01].Y := ((FineFinY-InizioFinY) Div 5)+InizioFinY+7;
                    Puls[02].X := 2*((FineFinX-InizioFinX) Div 5)+
                                  InizioFinX-13;
                    Puls[02].Y := Puls[1].Y;
                    Puls[03].X := 3*((FineFinX-InizioFinX) Div 5)+
                                  InizioFinX-13;
                    Puls[03].Y := Puls[1].Y;
                    Puls[04].X := 4*((FineFinX-InizioFinX) Div 5)+
                                  InizioFinX-13;
                    Puls[04].Y := Puls[1].Y;

                    Puls[05].X := Puls[1].X;
                    Puls[05].Y := 2*((FineFinY-InizioFinY) Div 5)+
                                  InizioFinY-4;
                    Puls[06].X := Puls[2].X;
                    Puls[06].Y := Puls[5].Y;
                    Puls[07].X := Puls[3].X;
                    Puls[07].Y := Puls[5].Y;
                    Puls[08].X := Puls[4].X;
                    Puls[08].Y := Puls[5].Y;

                    Puls[09].X := Puls[1].X;
                    Puls[09].Y := 3*((FineFinY-InizioFinY) Div 5)+
                                  InizioFinY-13;
                    Puls[10].X := Puls[2].X;
                    Puls[10].Y := Puls[9].Y;
                    Puls[11].X := Puls[3].X;
                    Puls[11].Y := Puls[9].Y;
                    Puls[12].X := Puls[4].X;
                    Puls[12].Y := Puls[9].Y;

                    Puls[13].X := ((FineFinX-InizioFinX) Div 2)+
                                  InizioFinX-15;
                    Puls[13].Y := 3*((FineFinY-InizioFinY) Div 4)+InizioFinY;

                    End;

      End; { Case Icone }

    WaitToWrite;
    HideMouse;

    { Visualizza le icone }
    For i := 1 To NumTasti Do
      PutImage(Puls[i].X,Puls[i].Y,Puls[i].P^,NormalPut);

    ShowMouse;
    Scelto := False;

    Repeat

      ShowMouse;

      { Attende la pressione di un pulsante del mouse }
      Repeat

        GetMPos;

      Until MousePressed;

      { Controlla la zona in cui è stato premuto il pulsante }
      Premuto := 0;
      For i := 1 To NumTasti Do
        If MouseInG(Puls[i].X,Puls[i].Y,
		    Puls[i].X+25,Puls[i].Y+25)
	  Then
	    Begin
	    PremiPulsante(i,Puls[i],Finestre);
	    Premuto := i;
	    End;

      { Se è stata scelta un' icona }
      If (Premuto <> 0)
        Then
          Begin
          { A seconda dell' icona selezionata ... }
          Case Icone Of

            { Forme }
	    IconeShape:   Begin

                          Risp := True;

                          Case Premuto Of

                            1: Shape := sCerchio;
                            2: Shape := sCerchioPieno;
                            3: Shape := sLinee;
                            4: Shape := sLineePiene;
                            5: Shape := sRettangolo;
                            6: Shape := sRettangoloPieno;
                            7: Shape := sDisegnoLibero;
                            8: Shape := sTesto;

                            9: Risp := False;

                            End; { Case Premuto }

                          Scelto := True;

		          End;

            { Griglia }
	    IconeGriglia: Begin

                          Risp := True;

                          Case Premuto Of
                            1: Griglia := gLinee;
                            2: Griglia := gPunti;
                            3: Griglia := gNessuna;

                            4: Risp := False;

                            End; { Case Premuto }

                          Scelto := True;

		          End;

            { Linee }
	    IconeLines:   Begin

                          Risp := True;

                          Case Premuto Of

                            1: Lines := lSolid1;
                            2: Lines := lSolid3;
                            3: Lines := lDotted1;
                            4: Lines := lDotted3;
                            5: Lines := lCenter1;
                            6: Lines := lCenter3;
                            7: Lines := lDashed1;
                            8: Lines := lDashed3;

                            9: Risp := False;

                            End; { Case Premuto }

                          Scelto := True;

		          End;

            { Retini }
	    IconePattern: Begin

                          Risp := True;

                          Case Premuto Of

                             1: Pattern := pEmpty;
                             2: Pattern := pSolid;
                             3: Pattern := pLine;
                             4: Pattern := pLtSlash;
                             5: Pattern := pSlash;
                             6: Pattern := pBkSlash;
                             7: Pattern := pLtBkSlash;
                             8: Pattern := pHatch;
                             9: Pattern := pXHatch;
                            10: Pattern := pInterleave;
                            11: Pattern := pWideDot;
                            12: Pattern := pCloseDot;

                            13: Risp := False;

                            End; { Case Premuto }

                          Scelto := True;

		          End;

	    End; { Case Icone }

          End;

    Until Scelto;

    HideMouse;

    { Ripristino delle condizioni iniziali }
    Case Procedi Of

      { Memoria }
      Memoria: Begin

	       PutImage(InizioFinX,InizioFinY,Punt^,NormalPut);
	       FreeMem(Punt,Size);

	       End;

      { Nessun salvataggio }
      Finestrona: Begin

		  SetFillStyle(EmptyFill,Black);
		  Bar(InizioFinX,InizioFinY,FineFinX,FineFinY);
		  SetColor(Brown);
		  Rectangle(InizioRealX-1,InizioRealY-1,
			    InizioRealX+MaxColonne,InizioRealY+MaxRighe);
		  DisegnaGriglia;
		  DisegnaPixel(NotClear,AncheReal);
		  WriteBarCoord(VertDir,InizioY,FineY);
		  WriteBarCoord(HorizDir,InizioX,FineX);
                  HideMouse;

		  For i := Black To CmdGiu Do
		    PutImage(P[i].x,P[i].y,P[i].p^,NormalPut);

		  i := Color;
		  If (Color = Black)
                    Then
                      Color := White
		  Else
                    Color := Black;
		  PremiPulsante(i,P[i],Colori);
		  Color := i;

		  SetColor(LightGreen);
		  SetTextStyle(DefaultFont,HorizDir,1);
                  St := '**** SPRITE MANAGER VERSIONE '+Version+' *** DI FOCHI '+
                        'MICHELE ****';
		  OutTextXY(8+(TextWidth(St) Div 2),4,St);

		  SetTextJustify(LeftText,CenterText);
		  SetColor(LightRed);
		  Str(MaxRighe:4,St);
		  St := St+' Righe';
		  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5,St);

		  Str(MaxColonne:4,St);
		  St := St+' Colonne';
		  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5+TextHeight('█'),
                            St);

		  Str(16:4,St);
		  St := St+' Colori';
		  OutTextXY(P[Black].X+5,P[CmdDestra].Y+5+2*TextHeight('█'),
                            St);

                  { Scala e nome del file sul video }
                  AggiornaScala;
                  AggiornaNomeFile;

		  End;

      End; { Case Procedi }

    End

Else

  { La finestra non è stata aperta (valore False) }
  Risp := False;

ShowMouse;
ReleaseButtons;

End; { IconWindows }


{===========================================================================}
{ PROCEDURA: GET.SPRITE                                                     }
{                                                                           }
{ Legge il contenuto dell' immagine piccola in basso a destra e lo copia in }
{ quella grande (settando opportunamente tutti i valori dei pixels in       }
{ memoria).                                                                 }
{===========================================================================}
Procedure GetSprite;

Var

    { Ciclo }
    I: Integer;

    { Ciclo }
    J: Integer;

Begin { GetSprite }

HideMouse;

{ Lettura della zona interessata dell' immagine }
For i := (InizioRealX+InizioX-1) To (InizioRealX+FineX-1) Do
  For j := (InizioRealY+InizioY-1) To (InizioRealY+FineY-1) Do
    Vet^[i-InizioRealX+1,j-InizioRealY+1] := GetPixel16(i,j);

ShowMouse;

End; { GetSprite }


{===========================================================================}
{ PROCEDURA: GET.ALL.SPRITE                                                 }
{                                                                           }
{ Legge il contenuto dell' intera immagine piccola in basso a destra e lo   }
{ copia in quella grande (settando opportunamente tutti i valori dei pixels }
{ in { memoria).                                                            }
{===========================================================================}
Procedure GetAllSprite;

Var

    { Ciclo }
    I: Integer;

    { Ciclo }
    J: Integer;

Begin { GetAllSprite }

HideMouse;

{ Lettura di tutta l' immagine }
For i := InizioRealX To (InizioRealX+MaxColonne-1) Do
  For j := InizioRealY To (InizioRealY+MaxRighe-1) Do
    Vet^[i-InizioRealX+1,j-InizioRealY+1] := GetPixel16(i,j);

ShowMouse;

End; { GetAllSprite }


{===========================================================================}
{ PROCEDURA: DISEGNA.FIGURA                                                 }
{                                                                           }
{ Disegna la figura sullo schermo (cerchio, punto, linea, ellisse, figure   }
{ piene, ecc.). L' unico parametro è Luogo, che indica il luogo in cui deve }
{ essere disegnata (nella finestra grande o in quella piccola) e può assu_  }
{ mere i valori: FinGrande, FinPiccola.                                     }
{===========================================================================}
Procedure DisegnaFigura ( Luogo: TipoDisegna );

Var

    { Poligono a MaxNumPoints lati al massimo }
    Icona:       Array [1..MaxNumPoints] Of
                   PointType;

    { Numero di lato progressivo del poligono }
    NumLati:     Byte;

    { Tipo di retino selezionato }
    PatternSel:  Word;

    { Spessore della linea }
    WidthLine:   Word;

    { Tipo di linea }
    LineStyle:   Word;

    { Raggio X }
    RagX:        Integer;

    { Raggio Y }
    RagY:        Integer;

    { Punto di origine X }
    PointX:      Integer;

    { Punto di origine Y }
    PointY:      Integer;

    { Inizio della VGA in memoria ($A000) }
    InizioVGA:   Word;

    { Ciclo }
    J:           Word;

    { Immagine da salvare }
    Img:         Pointer;

    { Coordinate della figura }
    X1:          Integer;
    Y1:          Integer;
    X2:          Integer;
    Y2:          Integer;

    { Dimensione dell' area da salvare }
    Size:        Word;

    { Ciclo }
    I:           Integer;

    { Appoggio }
    AppMouseX:   Integer;

    { Appoggio }
    AppMouseY:   Integer;

    { Aggiornamento della finestra grande ? }
    Aggiorna:    Boolean;

    { Carattere premuto dall' utente }
    Ch:          Char;

    { Tipo di font }
    TipoFont:    Word;

    { Direzione del font }
    Direzione:   Word;

    { Dimensione del font }
    Dimensione:  Word;

    { Giustificazione orizzontale }
    OrizJust:    Word;

    { Giustificazione verticale }
    VertJust:    Word;

    { Stringa di testo }
    Stringa:     String;

    { Distanza X per i blocchi }
    DistX:       Byte;

    { Distanza Y per i blocchi }
    DistY:       Byte;


Begin { DisegnaFigura }

{Shape := sCopiaBlocco;}

{ Se non si disegna liberamente si salva l' immagine per un possibile
  annullamento della figura disegnata }
If (Shape <> sDisegnoLibero)
  Then

    Begin

    { Determinazione della sua occupazione in memoria }
    Size := ImageSize(InizioRealX,InizioRealY,InizioRealX+MaxColonne-1,
                      InizioRealY+MaxRighe-1);

    { Memorizzazione dell' immagine }
    GetMem(Img,Size);
    HideMouse;
    RettangoloReal(InizioX,InizioY);
    GetImage(InizioRealX,InizioRealY,InizioRealX+MaxColonne-1,
             InizioRealY+MaxRighe-1,Img^);
    RettangoloReal(InizioX,InizioY);
    ShowMouse;

    { Determinazione del retino selezionato }
    PatternSel := EmptyFill;
    Case Pattern Of
      pEmpty:      PatternSel := EmptyFill;
      pSolid:      PatternSel := SolidFill;
      pLine:       PatternSel := LineFill;
      pLtSlash:    PatternSel := LtSlashFill;
      pSlash:      PatternSel := SlashFill;
      pBkSlash:    PatternSel := BkSlashFill;
      pLtBkSlash:  PatternSel := LtBkSlashFill;
      pHatch:      PatternSel := HatchFill;
      pXHatch:     PatternSel := XHatchFill;
      pInterleave: PatternSel := InterleaveFill;
      pWideDot:    PatternSel := WideDotFill;
      pCloseDot:   PatternSel := CloseDotFill;
      End; { Case Pattern }

    { Determinazione dello spessore della linea selezionata }
    WidthLine := 1;
    Case Lines Of
      lSolid1,
      lDotted1,
      lCenter1,
      lDashed1: WidthLine := 1;
      lSolid3,
      lDotted3,
      lCenter3,
      lDashed3: WidthLine := 3;
      End; { Case Lines }

    { Determinazione del tipo di linea selezionato }
    LineStyle := SolidLn;
    Case Lines Of
      lSolid1,
      lSolid3:  LineStyle := SolidLn;
      lDotted1,
      lDotted3: LineStyle := DottedLn;
      lCenter1,
      lCenter3: LineStyle := CenterLn;
      lDashed1,
      lDashed3: LineStyle := DashedLn;
      End; { Case Lines }

    End;

{ Matrice di appoggio }
OldVet^ := Vet^;
OldMouseX := MouseX;
OldMouseY := MouseY;
PointX := OldMouseX;
PointY := OldMouseY;

{ A seconda della posizione in cui disegnare ... }
Case Luogo Of

  { Finestra piccola }
  FinPiccola: Begin

              x := PointX-InizioRealX+1;
              y := PointY-InizioRealY+1;

              End;

  { Finestra grande }
  FinGrande: Begin

             x := (PointX-10) Div Lato+InizioX;
             y := (PointY-10) Div Lato+InizioY;

             End;

  End; { Case Luogo }

{ Aggiusta le coordinate }
If (Shape <> sDisegnoLibero)
  Then
    Begin
    Dec(x);
    Dec(y);
    End;

{ A seconda della figura da disegnare ... }
Case Shape Of

  { Disegno libero }
  sDisegnoLibero: Begin

                  If (Vet^[x,y] <> Color)
                    Then

                      Begin

                      { Scrittura nella finestra piccola }
                      WaitToWrite;
                      HideMouse;
                      RettangoloReal(InizioRealX+x-1,InizioRealY+y-1);
                      PutPixel16(InizioRealX+x-1,InizioRealY+y-1,Color,pRep);
                      RettangoloReal(InizioRealX+x-1,InizioRealY+y-1);
                      ShowMouse;

                      { Scrittura in quella grande }
                      If ((x In [InizioX..FineX]) And
                          (y In [InizioY..FineY]))
	                    Then

	                      Begin
	                      Icona[1].x := 10+(x-InizioX)*Lato+1;
	                      Icona[1].y := 10+(y-InizioY)*Lato+1;
	                      Icona[2].x := Icona[1].x+Lato-2;
	                      Icona[2].y := Icona[1].y+Lato-2;
	                      SetFillStyle(SolidFill,Color);
                              WaitToWrite;
                              HideMouse;
	                      Bar(Icona[1].x,Icona[1].y,
                                  Icona[2].x,Icona[2].y);
                              ShowMouse;
	                      End;

                      Vet^[x,y] := Color;

                      End;

                  End;

  { Cerchio o Cerchio pieno }
  sCerchio,
  sCerchioPieno: Begin

                 { Setup e salvataggi }
                 RagX := 1;
                 RagY := 0;
                 OldMouseX := MouseX;
                 OldMouseY := MouseY;
                 ShowMouse;
                 ReleaseButtons;
                 Aggiorna := True;

                 Repeat

                   GetMPos;

                   { Il mouse è stato spostato ? }
                   If ((((MouseX <> OldMouseX) Or (MouseY <> OldMouseY)) And
                      (Luogo = FinPiccola)) Or ((((MouseX-10) Div Lato) <>
                      ((OldMouseX-10) Div Lato)) Or (((MouseY-10) Div Lato)
                      <> ((OldMouseY-10) Div Lato)) And (Luogo = FinGrande))
                      Or Aggiorna)
                        Then
                          Begin

                          { Calcolo del punto di destinazione }
                          Case Luogo Of

                            { Finestra piccola }
                            FinPiccola: Begin

                                        RagX := Abs(PointX-MouseX-1);
                                        RagY := Abs(PointY-MouseY-1);

                                        End;

                            { Finestra grande }
                            FinGrande: Begin

                                       RagX := Abs((PointX-10) Div
                                                   Lato+InizioX-((MouseX-10)
                                                   Div Lato+InizioX-1)-1);
                                       RagY := Abs((PointY-10) Div
                                                   Lato+InizioY-((MouseY-10)
                                                   Div Lato+InizioY-1)-1);

                                       End;

                            End; { Case Luogo }

                          { Ripristino dell' imagine originale }
                          Vet^ := OldVet^;
                          HideMouse;
                          RettangoloReal(InizioX,InizioY);
                          PutImage(InizioRealX,InizioRealY,Img^,NormalPut);

                          { Limitazioni dello schermo alla sola finestra
                            piccola }
                          ShowMouse;
                          SetColor(Color);
                          SetFillStyle(PatternSel,Color);
                          SetLineStyle(LineStyle,0,WidthLine);
                          SetViewPort(InizioRealX,InizioRealY,
                                      InizioRealX+MaxColonne-1,
                                      InizioRealY+MaxRighe-1,ClipOn);
                          HideMouse;

                          { Disegno della figura in dimensioni reali }
                          If (Shape = sCerchioPieno)
                            Then
                              FillEllipse(x,y,RagX,RagY)
                          Else
                            Ellipse(x,y,0,360,RagX,RagY);

                          { Ripristino delle dimensioni originali dello
                            schermo }
                          SetLineStyle(SolidLn,0,NormWidth);
                          ShowMouse;
                          SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
                          Aggiorna := True;
                          AppMouseX := MouseX;
                          AppMouseY := MouseY;
                          GetMPos;

                          { Se il mouse non è fermo, non occorre aggiornare
                            anche la finestra grande }
                          If ((MouseX = AppMouseX) And (MouseY = AppMouseY))
                            Then

                              { Aggiornamento della finestra grande }
                              Begin
                              GetSprite;
                              HideMouse;
                              DisegnaPixel(NotClear,NoReal);
                              Aggiorna := False;
                              End;

                          { Ritorno alle condizioni di attesa dello
                            spostamento del mouse }
                          HideMouse;
                          RettangoloReal(InizioX,InizioY);
                          ShowMouse;
                          ShowMouse;
                          OldMouseX := MouseX;
                          OldMouseY := MouseY;

                          End;

                 Until MousePressed;

                 End;

  { Rettangolo o Rettangolo pieno }
  sRettangolo,
  sRettangoloPieno: Begin

                    { Setup e salvataggi }
                    RagX := 1;
                    RagY := 0;
                    OldMouseX := MouseX;
                    OldMouseY := MouseY;
                    ShowMouse;
                    ReleaseButtons;
                    Aggiorna := True;

                    Repeat

                      GetMPos;

                      { Il mouse è stato spostato ? }
                      If ((((MouseX <> OldMouseX) Or (MouseY <> OldMouseY))
                         And (Luogo = FinPiccola)) Or ((((MouseX-10) Div
                         Lato) <> ((OldMouseX-10) Div Lato)) Or (((MouseY-10)
                         Div Lato) <> ((OldMouseY-10) Div Lato)) And
                         (Luogo = FinGrande)) Or Aggiorna)
                           Then
                             Begin

                             { Calcolo del punto di destinazione }
                             Case Luogo Of

                               { Finestra piccola }
                               FinPiccola: Begin

                                           RagX := PointX-MouseX;
                                           RagY := PointY-MouseY;

                                           End;

                               { Finestra grande }
                               FinGrande: Begin

                                          RagX := (PointX-10) Div
                                                  Lato+InizioX-((MouseX-10)
                                                  Div Lato+InizioX-1);
                                          RagY := (PointY-10) Div
                                                  Lato+InizioY-((MouseY-10)
                                                  Div Lato+InizioY-1);

                                          End;

                               End; { Case Luogo }

                             { Ripristino dell' imagine originale }
                             Vet^ := OldVet^;
                             HideMouse;
                             RettangoloReal(InizioX,InizioY);
                             PutImage(InizioRealX,InizioRealY,Img^,

                             { Limitazioni dello schermo alla sola finestra
                               piccola }
                                      NormalPut);
                             ShowMouse;
                             SetColor(Color);
                             SetFillStyle(PatternSel,Color);
                             SetLineStyle(LineStyle,0,WidthLine);
                             SetViewPort(InizioRealX,InizioRealY,
                                         InizioRealX+MaxColonne-1,
                                         InizioRealY+MaxRighe-1,ClipOn);
                             HideMouse;

                             { Calcola le coordinate finali (X) }
                             If (RagX > 0)
                               Then
                                 Begin
                                 X1 := x;
                                 X2 := x-RagX+1;
                                 End
                             Else
                               Begin
                               X1 := x-RagX+1;
                               X2 := x;
                               End;

                             { Calcola le coordinate finali (Y) }
                             If (RagY > 0)
                               Then
                                 Begin
                                 Y1 := y;
                                 Y2 := y-RagY+1;
                                 End
                             Else
                               Begin
                               Y1 := y-RagY+1;
                               Y2 := y;
                               End;

                             { Disegno della figura in dimensioni reali }
                             If (Shape = sRettangoloPieno)
                               Then
                                 Begin
                                 Bar(X1,Y1,X2,Y2);
                                 Rectangle(X1,Y1,X2,Y2);
                                 End
                             Else
                               Rectangle(X1,Y1,X2,Y2);

                             { Ripristino delle dimensioni originali dello
                               schermo }
                             SetLineStyle(SolidLn,0,NormWidth);
                             ShowMouse;
                             SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
                             Aggiorna := True;
                             AppMouseX := MouseX;
                             AppMouseY := MouseY;
                             GetMPos;

                             { Se il mouse non è fermo, non occorre aggiornare
                               anche la finestra grande }
                             If ((MouseX = AppMouseX) And
                                 (MouseY = AppMouseY))
                                   Then

                                     { Aggiornamento della finestra grande }
                                     Begin
                                     GetSprite;
                                     HideMouse;
                                     DisegnaPixel(NotClear,NoReal);
                                     Aggiorna := False;
                                     End;

                             { Ritorno alle condizioni di attesa dello
                               spostamento del mouse }
                             HideMouse;
                             RettangoloReal(InizioX,InizioY);
                             ShowMouse;
                             ShowMouse;
                             OldMouseX := MouseX;
                             OldMouseY := MouseY;
                             End;

                    Until MousePressed;

                    End;

  { Poligono o Poligono pieno }
  sLinee,
  sLineePiene: Begin

               { Setup e salvataggi }
               NumLati := 2;
               For i := 1 To MaxNumPoints Do
                 Begin
                 Icona[i].X := x;
                 Icona[i].Y := y;
                 End;

               RagX := 1;
               RagY := 0;

               Repeat
                 OldMouseX := MouseX;
                 OldMouseY := MouseY;
                 ShowMouse;
                 ReleaseButtons;
                 Aggiorna := True;

                 Repeat

                   GetMPos;

                   { Il mouse è stato spostato ? }
                   If ((((MouseX <> OldMouseX) Or (MouseY <> OldMouseY)) And
                      (Luogo = FinPiccola)) Or ((((MouseX-10) Div Lato) <>
                      ((OldMouseX-10) Div Lato)) Or (((MouseY-10) Div Lato)
                      <> ((OldMouseY-10) Div Lato)) And (Luogo = FinGrande))
                      Or Aggiorna)
                        Then
                          Begin

                          { Calcolo del punto di destinazione }
                          Case Luogo Of

                            { Finestra piccola }
                            FinPiccola: Begin

                                        RagX := PointX-MouseX;
                                        RagY := PointY-MouseY;

                                        End;

                            { Finestra grande }
                            FinGrande: Begin

                                       RagX := (PointX-10) Div Lato+InizioX-
                                               ((MouseX-10) Div Lato+
                                               InizioX-1);
                                       RagY := (PointY-10) Div Lato+InizioY-
                                               ((MouseY-10) Div Lato+
                                               InizioY-1);

                                       End;

                            End; { Case Luogo }

                          Icona[NumLati].X := x-RagX+1;
                          Icona[NumLati].Y := y-RagY+1;

                          { Ripristino dell' imagine originale }
                          Vet^ := OldVet^;
                          HideMouse;
                          RettangoloReal(InizioX,InizioY);
                          PutImage(InizioRealX,InizioRealY,Img^,NormalPut);

                          { Limitazioni dello schermo alla sola finestra
                            piccola }
                          ShowMouse;
                          SetColor(Color);
                          SetFillStyle(PatternSel,Color);
                          SetLineStyle(LineStyle,0,WidthLine);
                          SetViewPort(InizioRealX,InizioRealY,
                                      InizioRealX+MaxColonne-1,
                                      InizioRealY+MaxRighe-1,ClipOn);
                          HideMouse;

                          { Disegno della figura in dimensioni reali }
                          If (Shape = sLineePiene)
                            Then
                              FillPoly(NumLati,Icona)
                          Else
                            DrawPoly(NumLati,Icona);

                          { Ripristino delle dimensioni originali dello
                            schermo }
                          SetLineStyle(SolidLn,0,NormWidth);
                          ShowMouse;
                          SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
                          Aggiorna := True;
                          AppMouseX := MouseX;
                          AppMouseY := MouseY;
                          GetMPos;

                          { Se il mouse non è fermo, non occorre aggiornare
                            anche la finestra grande }
                          If ((MouseX = AppMouseX) And (MouseY = AppMouseY))
                            Then

                              { Aggiornamento della finestra grande }
                              Begin
                              GetSprite;
                              HideMouse;
                              DisegnaPixel(NotClear,NoReal);
                              Aggiorna := False;
                              End;

                          { Ritorno alle condizioni di attesa dello
                            spostamento del mouse }
                          HideMouse;
                          RettangoloReal(InizioX,InizioY);
                          ShowMouse;
                          ShowMouse;
                          OldMouseX := MouseX;
                          OldMouseY := MouseY;

                          End;

                 Until MousePressed;

                 { Il pulsante sinistro per continuare con un altro lato }
                 If (LeftButton And (Not RightButton))
                   Then
                     Begin

                     If (NumLati < MaxNumPoints)
                       Then
                         Inc(NumLati);

                     ShowMouse;

                     Repeat

                       GetMPos;

                     Until (Not MousePressed) Or
                           (RightButton And LeftButton);

                     End;

               { Entrambi i pulsanti per uscire oppure quello destro per
                 annullare }
               Until ((RightButton And (Not LeftButton)) Or
                      (RightButton And LeftButton));

               End;

  { Testo }
  sTesto: Begin

          { Setup e salvataggi iniziali }
          OldMouseX := MouseX;
          OldMouseY := MouseY;
          ShowMouse;
          ReleaseButtons;
          Aggiorna := True;
          TipoFont := DefaultFont;
          Dimensione := 1;
          OrizJust := CenterText;
          VertJust := CenterText;
          Stringa := '';
          Direzione := HorizDir;

          Repeat

            GetMPos;

            { Il mouse è stato spostato ? }
            If (((((MouseX <> OldMouseX) Or (MouseY <> OldMouseY))
               And (Luogo = FinPiccola)) Or ((((MouseX-10) Div
               Lato) <> ((OldMouseX-10) Div Lato)) Or (((MouseY-10)
               Div Lato) <> ((OldMouseY-10) Div Lato)) And
               (Luogo = FinGrande)) Or Aggiorna) Or KeyPressed)
                 Then
                   Begin

                   { Calcolo del punto di destinazione }
                   Case Luogo Of

                     { Finestra piccola }
                     FinPiccola: Begin

                                 RagX := MouseX-InizioRealX;
                                 RagY := MouseY-InizioRealY;

                                 End;

                     { Finestra grande }
                     FinGrande: Begin

                                RagX := (MouseX-10) Div Lato+InizioX-1;
                                RagY := (MouseY-10) Div Lato+InizioY-1;

                                End;

                     End; { Case Luogo }

                   { Ripristino dell' imagine originale }
                   Vet^ := OldVet^;
                   HideMouse;
                   RettangoloReal(InizioX,InizioY);
                   PutImage(InizioRealX,InizioRealY,Img^,NormalPut);

                   { Limitazioni dello schermo alla sola finestra piccola }
                   ShowMouse;

                   { Aggiustamenti }
                   If KeyPressed
                     Then
                       Begin

                       { Legge il tasto }
                       Ch := ReadKey;

                       { A seconda del tasto premuto ... }
                       Case Ch Of

                         { Tasto esteso }
                         kNull: Begin
                                Ch := ReadKey;
                                Case Ch Of

                                  { Tipo di font 0,1,...,11 }
                                  kF1: If (TipoFont < 11)
                                         Then
                                           Inc(TipoFont);

                                  { Tipo di font 11,10,...,0 }
                                  kSF1: If (TipoFont > 0)
                                          Then
                                            Dec(TipoFont);

                                  { Direzione orizzontale }
                                  kF2: Direzione := HorizDir;

                                  { Direzione verticale }
                                  kSF2: Direzione := VertDir;

                                  { Dimensione 1,2,...,30 }
                                  kF3: If (Dimensione < 30)
                                         Then
                                           Inc(Dimensione);

                                  { Dimensione 30,9,...,1 }
                                  kSF3: If (Dimensione > 1)
                                          Then
                                            Dec(Dimensione);

                                  { Giustificazione Sinistra,Centro,Destra }
                                  kF4: If (OrizJust < 2)
                                         Then
                                           Inc(OrizJust);

                                  { Giustificazione Destra,Centro,Sinistra }
                                  kSF4: If (OrizJust > 0)
                                          Then
                                            Dec(OrizJust);

                                  { Giustificazione Giù,Centro,Su }
                                  kF5: If (VertJust < 2)
                                         Then
                                           Inc(VertJust);

                                  { Giustificazione Su,Centro,Giù }
                                  kSF5: If (VertJust > 0)
                                          Then
                                            Dec(VertJust);

                                  End; { Case Ch }

                                End;

                         { Delete: cancella l' ultimo carattere }
                         kDel: If (Stringa <> '')
                                 Then
                                   Delete(Stringa,Length(Stringa),1);

                         { Ogni altro carattere viene aggiunto al testo
                           sul video (compresi i codici di controllo) }
                         Else
                           Stringa := Stringa+Ch;
                         End; { Case Ch }

                       End;

                   { Settaggi del testo }
                   SetColor(Color);
                   SetTextJustify(OrizJust,VertJust);
                   SetTextStyle(TipoFont,Direzione,Dimensione);
                   SetViewPort(InizioRealX,InizioRealY,
                               InizioRealX+MaxColonne-1,
                               InizioRealY+MaxRighe-1,ClipOn);
                   HideMouse;

                   { Scrittura del testo in dimensioni reali }
                   OutTextXY(RagX,RagY,Stringa);

                   { Ripristino delle dimensioni originali dello schermo }
                   ShowMouse;
                   SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
                   Aggiorna := True;
                   AppMouseX := MouseX;
                   AppMouseY := MouseY;
                   GetMPos;

                   { Se il mouse non è fermo, non occorre aggiornare
                     anche la finestra grande }
                   If ((MouseX = AppMouseX) And
                       (MouseY = AppMouseY))
                         Then

                           { Aggiornamento della finestra grande }
                           Begin
                           GetSprite;
                           HideMouse;
                           DisegnaPixel(NotClear,NoReal);
                           Aggiorna := False;
                           End;

                   { Ritorno alle condizioni di attesa dello
                     spostamento del mouse }
                   HideMouse;
                   RettangoloReal(InizioX,InizioY);
                   ShowMouse;
                   ShowMouse;
                   OldMouseX := MouseX;
                   OldMouseY := MouseY;
                   While KeyPressed Do
                     Ch := ReadKey;
                   End;

          Until MousePressed;

          End;

(*
  { Copia di un blocco }
  sCopiaBlocco: Begin

                { Setup e salvataggi }
                RagX := 1;
                RagY := 0;
                OldMouseX := MouseX;
                OldMouseY := MouseY;
                ShowMouse;
                ReleaseButtons;
                Aggiorna := True;

                Repeat

                  GetMPos;

                  { Il mouse è stato spostato ? }
                  If ((((MouseX <> OldMouseX) Or (MouseY <> OldMouseY))
                     And (Luogo = FinPiccola)) Or ((((MouseX-10) Div
                     Lato) <> ((OldMouseX-10) Div Lato)) Or (((MouseY-10)
                     Div Lato) <> ((OldMouseY-10) Div Lato)) And
                     (Luogo = FinGrande)) Or Aggiorna)
                       Then
                         Begin

                         { Calcolo del punto di destinazione }
                         Case Luogo Of

                           { Finestra piccola }
                           FinPiccola: Begin

                                       RagX := PointX-MouseX;
                                       RagY := PointY-MouseY;

                                       End;

                           { Finestra grande }
                           FinGrande: Begin

                                      RagX := (PointX-10) Div
                                              Lato+InizioX-((MouseX-10)
                                              Div Lato+InizioX-1);
                                      RagY := (PointY-10) Div
                                              Lato+InizioY-((MouseY-10)
                                              Div Lato+InizioY-1);

                                      End;

                           End; { Case Luogo }

                         { Ripristino dell' imagine originale }
                         Vet^ := OldVet^;
                         HideMouse;
                         RettangoloReal(InizioX,InizioY);
                         PutImage(InizioRealX,InizioRealY,Img^,

                         { Limitazioni dello schermo alla sola finestra
                           piccola }
                                  NormalPut);
                         ShowMouse;
                         SetColor(White);
                         SetWriteMode(XOrPut);
                         SetLineStyle(LineStyle,0,WidthLine);
                         SetViewPort(InizioRealX,InizioRealY,
                                     InizioRealX+MaxColonne-1,
                                     InizioRealY+MaxRighe-1,ClipOn);
                         HideMouse;

                         { Calcola le coordinate finali (X) }
                         X1 := x;
                         If (RagX < 0)
                           Then
                             X2 := x-RagX+1
                         Else
                           X2 := X1;

                         { Calcola le coordinate finali (Y) }
                         Y1 := y;
                         If (RagY < 0)
                           Then
                             Y2 := y-RagY+1
                         Else
                           Y2 := Y1;

                         { Disegno della figura in dimensioni reali }
                         Rectangle(X1,Y1,X2,Y2);

                         { Ripristino delle dimensioni originali dello
                           schermo }
                         SetWriteMode(NormalPut);
                         SetLineStyle(SolidLn,0,NormWidth);
                         ShowMouse;
                         SetViewPort(0,0,GetMaxX,GetMaxY,ClipOn);
                         Aggiorna := True;
                         AppMouseX := MouseX;
                         AppMouseY := MouseY;
                         GetMPos;

                         { Se il mouse non è fermo, non occorre aggiornare
                           anche la finestra grande }
                         If ((MouseX = AppMouseX) And
                             (MouseY = AppMouseY))
                               Then

                                 { Aggiornamento della finestra grande }
                                 Begin
                                 GetSprite;
                                 HideMouse;
                                 DisegnaPixel(NotClear,NoReal);
                                 Aggiorna := False;
                                 End;

                         { Ritorno alle condizioni di attesa dello
                           spostamento del mouse }
                         HideMouse;
                         RettangoloReal(InizioX,InizioY);
                         ShowMouse;
                         ShowMouse;
                         OldMouseX := MouseX;
                         OldMouseY := MouseY;
                         End;

                Until MousePressed;

                If (LeftButton And (Not RightButton))
                  Then
                    Begin

                    ReleaseButtons;
                    PointX := X2;
                    PointY := Y2;
                    DistX := X1-X2+1;
                    DistY := Y1-Y2+1;
                    Vet^ := OldVet^;

                    Repeat

                      GetMPos;

                      { Il mouse è stato spostato ? }
                      If ((((MouseX <> OldMouseX) Or (MouseY <> OldMouseY))
                         And (Luogo = FinPiccola)) Or ((((MouseX-10) Div
                         Lato) <> ((OldMouseX-10) Div Lato)) Or (((MouseY-10)
                         Div Lato) <> ((OldMouseY-10) Div Lato)) And
                         (Luogo = FinGrande)) Or Aggiorna)
                           Then
                             Begin

                             { Calcolo del punto di destinazione }
                             Case Luogo Of

                               { Finestra piccola }
                               FinPiccola: Begin

                                           RagX := MouseX-InizioRealX;
                                           RagY := MouseY-InizioRealY;

                                           End;

                               { Finestra grande }
                               FinGrande: Begin

                                          RagX := InizioX+(MouseX-10)
                                                  Div Lato-1;
                                          RagY := InizioY-(MouseY-10)
                                                  Div Lato-1;

                                          End;

                               End; { Case Luogo }

                             HideMouse;
                             RettangoloReal(InizioX,InizioY);
                             PutImage(InizioRealX,InizioRealY,Img^,
                                      NormalPut);

                             If (RagX < PointX)
                               Then
                                 RagX := PointX;

                             If (RagY < PointY)
                               Then
                                 RagY := PointY;

                             Vet := OldVet;
                             For i := 0 To (DistX-1) Do
                               For j := 0 To (DistY-1) Do
                                 Begin
                                 Vet^[i+RagX,j+RagY] := OldVet^[i+PointX,
                                                                j+PointY];
                                 PutPixel(i+RagX+InizioRealX,j+RagY+InizioRealY,Vet^[i+RagX,j+RagY]);
                                 End;

                             Aggiorna := True;
                             AppMouseX := MouseX;
                             AppMouseY := MouseY;
                             GetMPos;

                             { Se il mouse non è fermo, non occorre aggiornare
                               anche la finestra grande }
                             If ((MouseX = AppMouseX) And
                                 (MouseY = AppMouseY))
                                   Then

                                     { Aggiornamento della finestra grande }
                                     Begin
                                     GetSprite;
                                     HideMouse;
                                     DisegnaPixel(NotClear,NoReal);
                                     Aggiorna := False;
                                     End;

                             { Ritorno alle condizioni di attesa dello
                               spostamento del mouse }
                             HideMouse;
                             RettangoloReal(InizioX,InizioY);
                             ShowMouse;
                             ShowMouse;
                             OldMouseX := MouseX;
                             OldMouseY := MouseY;
                             End;

                    Until MousePressed;

                    End;

                End;
*)

  End; { Case Shape }

{ Se è stata disegnata una figura ... }
If (Shape <> sDisegnoLibero)
  Then
    Begin

    HideMouse;
    RettangoloReal(InizioX,InizioY);

    { Visualizzazione dell' immagine o annullamento e ritorno all'
      originale }
    If ((RightButton And (Not (Shape In [sLinee, sLineePiene]))) Or
        (RightButton And (Not LeftButton) And
        (Shape In [sLinee, sLineePiene])))
          Then
            Begin
            Vet^ := OldVet^;
            PutImage(InizioRealX,InizioRealY,Img^,NormalPut);
            End;

    { Lettura dello sprite risultante }
    GetAllSprite;

    { Aggiornamento dello schermo }
    HideMouse;
    RettangoloReal(InizioX,InizioY);
    DisegnaPixel(NotClear,NoReal);

    ShowMouse;
    ReleaseButtons;

    { De-allocazione della memoria }
    FreeMem(Img,Size);

    End;

Modificato := True;

End; { DisegnaFigura }


End. { UtilSpr2 }
