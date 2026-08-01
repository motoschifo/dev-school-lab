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
 ║       FOCHI MICHELE                                                      ║
 ║       VERSIONE 1.0                          UNIT TIPCONV                 ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   14 Marzo 1993
  Ora:    17:00:00
  Autore: Fochi Michele
  File:   Unit TextImageProcessorConvert }

{ Converte l' immagine (in formato testo) nel programma in Turbo Pascal,
  Turbo Assembler, Turbo C, DataBase, Sequenze Escape,  GW-Basic. Per ogni
  linguaggio sono possibili dalle due alle 7 opzioni di conversione. }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Procedure TurboPascal;

  - Procedure TurboAssembler;

  - Procedure TurboC;

  - Procedure GWBasic;

  - Procedure DataBase;

  - Procedure SequenzeEscape;

  - Procedure MenuConversione; }


{ Nome della unit }
Unit
     TIPConv;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPConv }

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
     TIPTime;


{----------------------------------------------------------------------------
  PROCEDURA: TURBO.PASCAL

  Converte l' immagine in un file in Turbo Pascal. I tipi di conversione
  disponibili sono i seguenti:

    1) GoToXY + Write
    2) Solo Write
    3) Colori ottimizzati
    4) Con WriteStr
    5) Con Diretta
    6) Memoria video
    7) Con file maschera
 ----------------------------------------------------------------------------}
Procedure TurboPascal;


{----------------------------------------------------------------------------
  PROCEDURA: TURBO.ASSEMBLER

  Converte l' immagine in un file in Turbo Assembler. I tipi di conversione
  disponibili sono i seguenti:

    1) con le funzioni DOS
    2) con le funzioni BIOS
 ----------------------------------------------------------------------------}
Procedure TurboAssembler;


{----------------------------------------------------------------------------
  PROCEDURA: TURBO.C

  Converte l' immagine in un file in Turbo C. I tipi di conversione
  disponibili sono i seguenti:

    1) GoToXY + CPrintF
    2) Senza GoToXY
    3) Colori ottimizzati
    4) Con Diretta
 ----------------------------------------------------------------------------}
Procedure TurboC;


{----------------------------------------------------------------------------
  PROCEDURA: GW.BASIC

  Converte l' immagine in un file in GW-Basic. I tipi di conversione
  disponibili sono i seguenti:

    1) Con Locate
    2) Senza Locate
 ----------------------------------------------------------------------------}
Procedure GWBasic;


{----------------------------------------------------------------------------
  PROCEDURA: DATA.BASE

  Converte l' immagine in un file in DataBase. I tipi di conversione
  disponibili sono i seguenti:

    1) A colori
    2) Colori ottimizzati
    3) In bianco e nero
 ----------------------------------------------------------------------------}
Procedure DataBase;


{----------------------------------------------------------------------------
  PROCEDURA: SEQUENZE.ESCAPE

  Converte l' immagine in un file in Seeuqnze Escape, visualizzabile
  da DOS con il comando TYPE. I tipi di conversione disponibili sono i
  seguenti:

     1) Con posizionamento
     2) Senza posizionamento
 ----------------------------------------------------------------------------}
Procedure SequenzeEscape;


{----------------------------------------------------------------------------
  PROCEDURA: MENUCONVERSIONE

  Visualizza il menu di conversione, da cui sono possibili scegliere i
  seguenti linguaggi:
    1) Turbo Pascal
    2) Turbo Assembler
    3) Turbo C
    4) GW-Basic
    5) DataBase
    6) Sequenze Escape
 ----------------------------------------------------------------------------}
Procedure MenuConversione;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPConv }



{----------------------------------------------------------------------------
  PROCEDURA: TURBO.PASCAL

  Converte l' immagine in un file in Turbo Pascal. I tipi di conversione
  disponibili sono i seguenti:

    1) GoToXY + Write
    2) Solo Write
    3) Colori ottimizzati
    4) Con WriteStr
    5) Con Diretta
    6) Memoria video
    7) Con file maschera
 ----------------------------------------------------------------------------}
Procedure TurboPascal;

{ Variabili locali }
Var

    { Metodo di conversione scelto }
    Proced:      Integer;

    { Sovrascrivo il file sul disco ? }
    Sovrascrivi: Boolean;

    { File di testo }
    FileTXT:     Text;


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.PASCAL.GOTOXY

       Per scrivere il file in Turbo Pascal vengono utilizzati i metodi:

         1) GoToXY + Write         se UsoGoTo = True
         2) Solo Write             se UsoGoTo = False
      -----------------------------------------------------------------------}
     Procedure TurboPascalGoToXY ( UsoGoTo: Boolean );

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore del carattere da scrivere }
         St3:           String003;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

     Begin { TurboPascalGoToXY }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,50,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NamePascalFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Questo file è stato creato da T.I.P., scritto da Fochi Michele }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Le procedure "ClrScr", "Write" e "GoToXY", e le costanti       }');
     WriteLn(FileTXT,'{ "TextAttr" e "LightGray" sono nella unit CRT.TPU.              }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Per eseguire il programma occorre quindi la seguente linea     }');
     WriteLn(FileTXT,'{ di codice (nelle prime righe del programma):                   }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{     Uses Crt;                                                  }');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'Procedure '+NomeProcedura+';');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Begin { '+NomeProcedura+' }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Cancello lo schermo }');
     WriteLn(FileTXT,'TextAttr := LightGray;');
     WriteLn(FileTXT,'ClrScr;');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Ora viene riempito lo schermo }');
     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While (Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80) Do
             Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St: se ci sono degli apostrofi (')
             vengono scritti due volte, perchè in Turbo Pascal è un delimita_
             tore di stringhe (per questo motivo la stringa può essere al
             massimo di 160 caratteri) }
           While (k <= Num) Do
             Begin
             St := St+Page[i,j+k].Ch;
             If (Page[i,j+k].Ch = '''')
               Then
                 St := St+'''';
             Inc(k);
             End;

           { Determinazione del metodo da utilizzare }
           If UsoGoTo
             Then

               { Se vogliono scritte anche le istruzioni GoToXY(x,y)
                 vengono aggiunte }
               Begin
               Str(j:2,St1);
               If (St1[1] = kSpazio)
                 Then
                   St1[1] := '0';
               Str(i:2,St2);
               If (St2[1] = kSpazio)
                 Then
                   St2[1] := '0';
               Write(FileTXT,'GoToXY('+St1+','+St2+');     ');
               End;

           { Aggiusta l' attributo del carattere }
           Str(Page[i,j].At:3,St3);
           If (St3[1] = kSpazio)
             Then
               St3[1] := '0';
           If (St3[2] = kSpazio)
             Then
               St3[2] := '0';

           { Scrive le due istruzioni in Turbo Pascal }
           WriteLn(FileTXT,'TextAttr := '+St3+';');
           WriteLn(FileTXT,'Write('''+St+''');');

           Inc(j,Num+1);

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT);
     WriteLn(FileTXT,'End; { '+NomeProcedura+' }');
     WriteLn(FileTXT);

     End; { TurboPascalGoToXY }


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.PASCAL.GOTOXY.OTTIMIZZATO

       Per scrivere il file in Turbo Pascal viene utilizzato il metodo

         3) Colori ottimizzati
      -----------------------------------------------------------------------}
     Procedure TurboPascalGoToXYOttimizzato;

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Indice per i cicli }
         L:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore del carattere da scrivere }
         St3:           String003;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

         { Il colore è stato trovato ? }
         Trovato:       Boolean;

     Begin { TurboPascalGoToXYOttimizzato }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,50,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NamePascalFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Questo file è stato creato da T.I.P., scritto da Fochi Michele }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Le procedure "ClrScr", "Write" e "GoToXY", e le costanti       }');
     WriteLn(FileTXT,'{ "TextAttr" e "LightGray" sono nella unit CRT.TPU.              }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Per eseguire il programma occorre quindi la seguente linea     }');
     WriteLn(FileTXT,'{ di codice (nelle prime righe del programma):                   }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{     Uses Crt;                                                  }');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'Procedure '+NomeProcedura+';');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Begin { '+NomeProcedura+' }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Cancello lo schermo }');
     WriteLn(FileTXT,'TextAttr := LightGray;');
     WriteLn(FileTXT,'ClrScr;');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Ora viene riempito lo schermo }');
     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutti i 256 colori diversi }
       For l := 0 To 255 Do
         Begin
         Trovato := False;

         { Tutte le 24 righe }
         For i := 1 To 24 Do
           Begin

           { Tutte le 80 colonne }
           j := 1;
           While (j <= 80) Do
             Begin
             Num := 0;

             { Se il colore è quello considerato (ciclo L) }
             If (Page[i,j].At = l)
               Then
                 Begin

                 { Viene determinata una stringa con gli stessi attributi }
                 While (Page[i,j].At = Page[i,j+Num+1].At) And
                       (j+Num+1 <= 80) Do
                         Inc(Num);
                 St := StrNull;
                 k := 0;

                 { E memorizzata nella variabile St: se ci sono degli
                   apostrofi (') vengono scritti due volte, perchè in Turbo
                   Pascal è un delimitatore di stringhe (per questo motivo
                   la stringa può essere al massimo di 160 caratteri) }
                 While (k <= Num) Do
                   Begin
                   St := St+Page[i,j+k].Ch;
                   If (Page[i,j+k].Ch = '''')
                     Then
                       St := St+'''';
                   Inc(k);
                   End;

                 { Se è necessario il cambio di colore, viene aggiunta
                   l' istruzione TextAttr := <Colore> }
                 If (Not Trovato)
                   Then
                     Begin
                     Trovato := True;

                     { Aggiusta l' attributo del carattere }
                     Str(Page[i,j].At:3,St3);
                     If (St3[1] = kSpazio)
                       Then
                         St3[1] := '0';
                     If (St3[2] = kSpazio)
                       Then
                         St3[2] := '0';

                     { Scrive l' istruzione in Turbo Pascal }
                     WriteLn(FileTXT);
	             WriteLn(FileTXT,'TextAttr := '+St3+';');

                     End;

                 { Ora aggiusta le coordinate }
                 Str(j:2,St1);
                 If (St1[1] = kSpazio)
                   Then
                     St1[1] := '0';
                 Str(i:2,St2);
                 If (St2[1] = kSpazio)
                   Then
                     St2[1] := '0';

                 { Scrive le due istruzioni in Turbo Pascal }
                 WriteLn(FileTXT,'GoToXY('+St1+','+St2+');');
                 WriteLn(FileTXT,'Write('''+St+''');');

                 End;

             Inc(j,Num+1);

             End;

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT);
     WriteLn(FileTXT,'End; { '+NomeProcedura+' }');
     WriteLn(FileTXT);

     End; { TurboPascalGoToXYOttimizzato }


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.PASCAL.WRITESTR

       Per scrivere il file in Turbo Pascal vengono utilizzati i metodi

         4) Con WriteStr         se Diretta = False
         5) Con Diretta          se Diretta = True
      -----------------------------------------------------------------------}
     Procedure TurboPascalWriteStr ( Diretta: Boolean );

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore del carattere da scrivere (primo piano con Diretta) }
         St3:           String003;

         { Colore di sfondo del carattere da scrivere (con Diretta) }
         St4:           String002;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

     Begin { TurboPascalWriteStr }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,50,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NamePascalFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Questo file è stato creato da T.I.P., scritto da Fochi Michele }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ La procedura "ClrScr" e le costanti "TextAttr" e "LightGray"   }');
     WriteLn(FileTXT,'{ sono nella unit CRT.TPU.                                       }');

     { Cambio dei nomi delle procedure }
     If Diretta
       Then
         WriteLn(FileTXT,'{ La procedura "Diretta" è nella unit VIDEO.TPU.                 }')
     Else
       WriteLn(FileTXT,'{ La procedura "WriteStr" è nella unit VIDEO.TPU.                }');

     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Per eseguire il programma occorre quindi la seguente linea     }');
     WriteLn(FileTXT,'{ di codice (nelle prime righe del programma):                   }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{     Uses Crt,Video;                                            }');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'Procedure '+NomeProcedura+';');
     WriteLn(FileTXT);

     { Con Diretta si utilizza una stringa di appoggio }
     If Diretta
       Then
         Begin
         WriteLn(FileTXT,'Var St: String;');
         WriteLn(FileTXT);
         End;

     WriteLn(FileTXT,'Begin { '+NomeProcedura+' }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Cancello lo schermo }');
     WriteLn(FileTXT,'TextAttr := LightGray;');
     WriteLn(FileTXT,'ClrScr;');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Ora viene riempito lo schermo }');
     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While (Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80) Do
             Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St: se ci sono degli apostrofi (')
             vengono scritti due volte, perchè in Turbo Pascal è un delimita_
             tore di stringhe (per questo motivo la stringa può essere al
             massimo di 160 caratteri) }
           While (k <= Num) Do
             Begin
             St := St+Page[i,j+k].Ch;
             If (Page[i,j+k].Ch = '''')
               Then
                 St := St+'''';
             Inc(k);
             End;

           { Aggiusta le coordinate del cursore }
           Str(j:2,St1);
           If (St1[1] = kSpazio)
             Then
               St1[1] := '0';
           Str(i:2,St2);
           If (St2[1] = kSpazio)
             Then
               St2[1] := '0';

           { Quale metodo ? }
           If (Not Diretta)
             Then

               { Metodo WriteStr }
               Begin

               { Aggiusta l' attributo di visualizzazione }
               Str(Page[i,j].At:3,St3);
               If (St3[1] = kSpazio)
                 Then
                   St3[1] := '0';
               If (St3[2] = kSpazio)
                 Then
                   St3[2] := '0';

               { Scrive l' istruzione in Turbo Pascal }
               WriteLn(FileTXT,'WriteStr('+St1+','+St2+',''',St,''','+St3+');');

               End

           Else

             { Metodo Diretta }
             Begin

             { Aggiusta i colori di primo piano e di sfondo }
             Str((Page[i,j].At Mod 16):3,St3);
             If (St3[1] = kSpazio)
               Then
                 St3[1] := '0';
             Str((Page[i,j].At Div 16):3,St4);
             If (St4[1] = kSpazio)
               Then
                 St4[1] := '0';

             { Scrive le due istruzioni in Turbo Pascal }
             WriteLn(FileTXT,'St := '''+St+''';');
             WriteLn(FileTXT,'Diretta('+St1+','+St2+',St,'+St3+','+St4+');');

             End;

           Inc(j,Num+1);

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT);
     WriteLn(FileTXT,'End; { '+NomeProcedura+' }');
     WriteLn(FileTXT);

     End; { TurboPascalWriteStr }


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.PASCAL.MEMORIA.VIDEO

       Per scrivere il file in Turbo Pascal viene utilizzato il metodo

         6) Memoria video
      -----------------------------------------------------------------------}
     Procedure TurboPascalMemoriaVideo;

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Codice ASCII del carattere da scrivere }
         St:            String003;

         { Attributo del carattere da scrivere }
         St2:           String003;

     Begin { TurboPascalMemoriaVideo }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,50,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NamePascalFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Questo file è stato creato da T.I.P., scritto da Fochi Michele }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ La procedura "ClrScr" e le costanti "TextAttr" e "LightGray"   }');
     WriteLn(FileTXT,'{ sono nella unit CRT.TPU.                                       }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Per eseguire il programma occorre quindi la seguente linea     }');
     WriteLn(FileTXT,'{ di codice (nelle prime righe del programma):                   }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{     Uses Crt;                                                  }');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'Procedure '+NomeProcedura+';');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Type RecPage= Array [1..24,1..80] Of');
     WriteLn(FileTXT,'                Record');
     WriteLn(FileTXT,'                  Ch: Char;');
     WriteLn(FileTXT,'                  At: Byte;');
     WriteLn(FileTXT,'                  End; { RecPage }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Const');
     WriteLn(FileTXT,'      { Definizione della memoria video }');
     WriteLn(FileTXT,'      Screen:  RecPage= (');

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         Write(FileTXT,'      (');
         For j := 1 To 80 Do
           Begin

           { Aggiusta l' attributo }
           Str(Page[i,j].At:3,St);
           If (St[1] = kSpazio)
             Then
               St[1] := '0';
           If (St[2] = kSpazio)
             Then
               St[2] := '0';

           { Aggiusta il codice ASCII }
           Str(Ord(Page[i,j].Ch):3,St2);
           If (St2[1] = kSpazio)
             Then
               St2[1] := '0';
           If (St2[2] = kSpazio)
             Then
               St2[2] := '0';

           { Scrive l' istruzione in Turbo Pascal }
           Write(FileTXT,'(Ch:#'+St2+';At:'+St+')');

           { Aggiunge la congiunzione "," o ")" }
           If (j <> 80)
             Then
               Write(FileTXT,',')
           Else
             Write(FileTXT,')');

           { Se si è arrivati alla fine della riga, si deve andare a capo }
           If ((j Div 4) = (j / 4))
	     Then
	       Begin

               { A capo con indentazione }
               If (j <> 80)
	         Then
	           Begin
	           WriteLn(FileTXT);
                   Write(FileTXT,'       ');
                   End;

               End;

           End;

         { A capo }
         If (i <> 24)
           Then
             Begin
             WriteLn(FileTXT,',');
             WriteLn(FileTXT);
             End

         Else

           { Termine della definizione }
           WriteLn(FileTXT,');')

         End;

     { Programma principale }
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Var Fisico:  ^RecPage;    { Inizio dello schermo fisico }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Begin { '+NomeProcedura+' }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Cancello lo schermo }');
     WriteLn(FileTXT,'TextAttr := LightGray;');
     WriteLn(FileTXT,'ClrScr;');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Calcolo dell'' inizio della memoria video }');
     WriteLn(FileTXT,'If (Mem[$0000:$0499] = 7)');
     WriteLn(FileTXT,'  Then');
     WriteLn(FileTXT,'    Fisico := PTR($B000,$0000)');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Else');
     WriteLn(FileTXT,'    Fisico := PTR($B800,$0000);');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Il contenuto del record maschera va ora in memoria video }');
     WriteLn(FileTXT,'Fisico^ := Screen;');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'End; { '+NomeProcedura+' }');
     WriteLn(FileTXT);

     End; { TurboPascalMemoriaVideo }


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.PASCAL.FILE.MASCHERA

       Per scrivere il file in Turbo Pascal viene utilizzato il metodo

         7) Con file maschera
      -----------------------------------------------------------------------}
     Procedure TurboPascalFileMaschera;

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Nome del file maschera che contiene i dati }
         NomeFileMSK:   String;

     Begin { TurboPascalFileMaschera }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,40,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Input del nome del file maschera }
     NomeFileMSK := StrNull;
     NomeFileMSK := InputString(' Quale file maschera deve leggere?  ',
			        Color.InputField,40,255,
			        NomeFileMSK,Color.InputDigit,
			        Color.InputArrow,SetCarFile);

     { Aggiusta il nome }
     NomeFileMSK[1] := UpCase(NomeFileMSK[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NamePascalFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Questo file è stato creato da T.I.P., scritto da Fochi Michele }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ La procedura "ClrScr" e le costanti "TextAttr" e "LightGray"   }');
     WriteLn(FileTXT,'{ sono nella unit CRT.TPU.                                       }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{ Per eseguire il programma occorre quindi la seguente linea     }');
     WriteLn(FileTXT,'{ di codice (nelle prime righe del programma):                   }');
     WriteLn(FileTXT,'{                                                                }');
     WriteLn(FileTXT,'{     Uses Crt;                                                  }');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'Procedure '+NomeProcedura+';');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Type RecPage= Array [1..24,1..80] Of');
     WriteLn(FileTXT,'                Record');
     WriteLn(FileTXT,'                  Ch: Char;');
     WriteLn(FileTXT,'                  At: Byte;');
     WriteLn(FileTXT,'                  End; { RecPage }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'     Rec=     Record');
     WriteLn(FileTXT,'                Header: String[007];');
     WriteLn(FileTXT,'                Page:   RecPage;');
     WriteLn(FileTXT,'                End; { Rec }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Var MSKFile: File Of      { File strutturato }');
     WriteLn(FileTXT,'               Rec;');
     WriteLn(FileTXT,'    MSKRec:  ^Rec;        { Record del file }');
     WriteLn(FileTXT,'    Fisico:  ^RecPage;    { Inizio dello schermo fisico }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Begin { '+NomeProcedura+' }');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Cancello lo schermo }');
     WriteLn(FileTXT,'TextAttr := LightGray;');
     WriteLn(FileTXT,'ClrScr;');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Alloco nello Heap il record MSKRec (3848 Bytes) }');
     WriteLn(FileTXT,'New(MSKRec);');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Assegnazione del file maschera }');
     WriteLn(FileTXT,'Assign(MSKFile,'''+NomeFileMSK+''');');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{$I-}  Reset(MSKFile);  {$I+}');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Se il file esiste viene letto }');
     WriteLn(FileTXT,'If (IOResult = 0)');
     WriteLn(FileTXT,'  Then');
     WriteLn(FileTXT,'    Read(MSKFile,MSKRec^);');
     WriteLn(FileTXT);
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Calcolo dell'' inizio della memoria video }');
     WriteLn(FileTXT,'If (Mem[$0000:$0499] = 7)');
     WriteLn(FileTXT,'  Then');
     WriteLn(FileTXT,'    Fisico := PTR($B000,$0000)');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'Else');
     WriteLn(FileTXT,'    Fisico := PTR($B800,$0000);');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Il contenuto del record maschera va ora in memoria video }');
     WriteLn(FileTXT,'Fisico^ := MSKRec^.Page;');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'{ Libero la memoria dal record maschera (3848 Bytes) }');
     WriteLn(FileTXT,'Dispose(MSKRec);');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'End; { '+NomeProcedura+' }');
     WriteLn(FileTXT);

     { Salva il file maschera sul disco }
     SalvaFileMaschera(NomeFileMSK,False);

     End; { TurboPascalFileMaschera }


Begin { TurboPascal }

{ Disegna il menu Turbo Pascal }
With Color Do
  Proced := Menu('[TURBO PASCAL]',

	         '||'+

                 '               Con ^GoToXY e Write             |'+
                 ' Crea un file in Pascal che disegna l'' immagine con le '+
                 'procedure GoToXY e Write|',

                 '^Senza GoToXY|'+
                 ' Crea un file in Pascal che disegna l'' immagine con la p'+
                 'rocedure Write|',

                 'Colori ^Ottimizzati|'+
                 ' Crea un file in Pascal che disegna l'' immagine ottimizz'+
                 'ando i cambi di colore|',

                 'Con ^WriteStr|'+
                 ' Crea un file in Pascal che disegna l'' immagine con Writ'+
                 'eStr (Unit Video)|',

                 'Con ^Diretta|'+
                 ' Crea un file in Pascal che disegna l'' immagine con Dire'+
                 'tta (Unit Video)|',

                 'Memoria ^Video|'+
                 ' Crea un file in Pascal che disegna l'' immagine direttam'+
                 'ente in memoria video|',

                 'File ^Maschera|'+
                 ' Crea un file in Pascal che disegna l'' immagine leggendo'+
                 ' un file maschera|'+

	         '||','',

	         MenuTitle,MenuSel,MenuUnSel,
	         MenuBord,MenuText,MenuKeySel,
	         MenuKeyUnSel,SMenuConv);

{ Se la scelta è valida ... }
If (Proced <> -1)
  Then
    Begin

    { Input del nome del file in Turbo Pascal }
    NamePascalFile := InputFile('[File Pascal]','.PAS','*.PAS',
		      SetCarFile);

    { Se è diverso dalla stringa nulla }
    If (NamePascalFile <> StrNull)
      Then
        Begin

        Sovrascrivi := True;

        { Assegnazione del file sul disco ad un nome logico }
        Assign(FileTXT,NamePascalFile);

        { Lettura del file }
        {$I-}  Reset(FileTXT);  {$I+}

        { Se esiste sul disco viene visualizzata una finestra di dialogo
          in cui si chiede se il file deve essere sovrascritto o no }
        If (IOResult = 0)
          Then

	    Begin

	    { Chiusura del file }
	    Close(FileTXT);

	    { Finestra di dialogo per l' utente }
            With Color Do
	      If (Dialog('[AVVERTENZA]',
		         '|'+
		         '               Il file specificato               |'+
		         '( '+NamePascalFile+' )|'+
		         'esiste sul disco.|'+
		         '|'+
		         'Devo sovrascriverlo o no ?|','','',
		         __SI_NO__,WarningBord,WarningTitle,
		         WarningText,WarningSel,
		         WarningUnSel,WarningKeySel,
		         WarningKeyUnSel) = 1)

		           Then

		             { Può essere sovrascritto }
		             Sovrascrivi := True

	    Else

	      { Non può essere sovrascritto }
	      Sovrascrivi := False;

	    End;

        { Se il file non esiste o se si può sovrascrivere ... }
        If Sovrascrivi
          Then
            Begin

            { A seconda del metodo scelto ... }
            Case Proced Of

              { GoToXY + Write }
              2: TurboPascalGoToXY(True);

              { Solo Write }
              3: TurboPascalGoToXY(False);

              { Colori ottimizzati }
              4: TurboPascalGoToXYOttimizzato;

              { Con WriteStr }
              5: TurboPascalWriteStr(False);

              { Con Diretta }
              6: TurboPascalWriteStr(True);

              { Memoria video }
              7: TurboPascalMemoriaVideo;

              { Con il file maschera }
              8: TurboPascalFileMaschera;

              End; { Case Proced }

            { Chiude il file }
            Close(FileTXT);

            End;

        End;

    End;

End; { TurboPascal }


{----------------------------------------------------------------------------
  PROCEDURA: TURBO.ASSEMBLER

  Converte l' immagine in un file in Turbo Assembler. I tipi di conversione
  disponibili sono i seguenti:

    1) con le funzioni DOS
    2) con le funzioni BIOS
 ----------------------------------------------------------------------------}
Procedure TurboAssembler;

{ Variabili locali }
Var

    { Metodo di conversione scelto }
    Proced:      Integer;

    { Sovrascrivo il file sul disco ? }
    Sovrascrivi: Boolean;

    { File di testo }
    FileTXT:     Text;

    { File di testo di appoggio }
    FileTXT2:    Text;

    { Stringa di appoggio }
    StApp:       String;


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.ASSEMBLER.BIOS

       Per scrivere il file in Turbo Assembler vengono utilizzati i metodi

         1) con le funzioni DOS    se UsoDOS = True
         2) con le funzioni BIOS   se UsoDOS = False
      -----------------------------------------------------------------------}
     Procedure TurboAssembler ( UsoDOS: Boolean );
     Var NomeMainProgram: String;
         I,J,K,L: Byte;
         St: String160;
         Num: Byte;
         St1,St2:String002;
         St3: String003;
         StrSpz: String;
         VarMsg: Integer;
         StM: String;

     Begin { TurboAssemblerBIOS }

     { Input del nome del file in Turbo Assembler }
     NomeMainProgram := StrNull;
     NomeMainProgram := InputString(' Come chiamo il programma principale?  ',
		      	            Color.InputField,50,255,
			            NomeMainProgram,Color.InputDigit,
			            Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeMainProgram[1] := UpCase(NomeMainProgram[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT2);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NameAssemblerFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma }
     WriteLn(FileTXT2,';');
     WriteLn(FileTXT2,'; Questo file è stato creato da T.I.P., scritto da Fochi Michele');
     WriteLn(FileTXT2,';');
     WriteLn(FileTXT2);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT2,NomeMainProgram+' PROC NEAR');

     StrSpz := '';
     For i := 1 To (Length(NomeMainProgram)+1) Do
       StrSpz := StrSpz+kSpazio;

     WriteLn(FileTXT2);
     WriteLn(FileTXT2,StrSpz+'; Setto la modalità video 80x25 colori');
     WriteLn(FileTXT2,StrSpz+'SET_VIDEO 3');
     WriteLn(FileTXT2);
     WriteLn(FileTXT2,StrSpz+'; Scrittura delle stringhe');

     VarMsg := 0;
     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While (Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80) Do
             Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St }
           While (k <= Num) Do
             Begin
             St := St+Page[i,j+k].Ch;
             Inc(k);
             End;

           Inc(VarMsg);
           Str(VarMsg:4,StM);
           If (StM[1] = kSpazio)
             Then
               StM[1] := '0';
           If (StM[2] = kSpazio)
             Then
               StM[2] := '0';
           If (StM[3] = kSpazio)
             Then
               StM[3] := '0';
           Write(FileTXT,'MSG'+StM+'   DB   "');
           For l := 1 To Length(St) Do
             If (St[i] <> '"')
               Then
                 Write(FileTXT,St[i])
             Else
               Write(FileTXT,'",034,"');
           WriteLn(FileTXT,'"');

           Str((j-1):2,St1);
           If (St1[1] = kSpazio)
             Then
               St1[1] := '0';
           Str((i-1):2,St2);
           If (St2[1] = kSpazio)
             Then
               St2[1] := '0';
           Str(Page[i,j].At:3,St3);
           If (St3[1] = kSpazio)
             Then
               St3[1] := '0';
           If (St3[2] = kSpazio)
             Then
               St3[2] := '0';

           WriteLn(FileTXT2,StrSpz+'POS_CURSORE '+St1+','+St2);
           WriteLn(FileTXT2,StrSpz+'STAMPA_STR_COL MSG'+StM+','+St3);
           Inc(j,Num+1);
           End;
         End;
     WriteLn(FileTXT2);
     WriteLn(FileTXT2,'END '+NomeMainProgram);
     WriteLn(FileTXT2);

     End; { TurboAssemblerBIOS }


Begin { TurboAssembler }

{ Disegna il menu Turbo Assembler }
With Color Do
  Proced := Menu('[TURBO ASSEMBLER]',

	         '||'+

                 '               Con le funzioni del ^DOS             |'+
                 ' Crea un file in Assembler che disegna l'' immagine utili'+
                 'zzando le funzioni del DOS|',

                 'Con le funzioni del BIOS|'+
                 ' Crea un file in Assembler che disegna l'' immagine utili'+
                 'zzando le funzioni del BIOS|',

	         '||','','','','','',

	          MenuTitle,MenuSel,MenuUnSel,
	          MenuBord,MenuText,MenuKeySel,
	          MenuKeyUnSel,SMenuConv);

{ Se la scelta è valida ... }
If (Proced <> -1)
  Then
    Begin

    { Input del nome del file in Turbo Assembler }
    NameAssemblerFile := InputFile('[File Assembler]','.ASM','*.ASM',
                                   SetCarFile);

    { Se è diverso dalla stringa nulla }
    If (NameAssemblerFile <> StrNull)
      Then
        Begin

        Sovrascrivi := True;

        { Assegnazione del file sul disco ad un nome logico }
        Assign(FileTXT2,NameAssemblerFile);

        { Lettura del file }
        {$I-}  Reset(FileTXT2);  {$I+}

        { Se esiste sul disco viene visualizzata una finestra di dialogo
          in cui si chiede se il file deve essere sovrascritto o no }
        If (IOResult = 0)
          Then

	    Begin

	    { Chiusura del file }
	    Close(FileTXT2);

	    { Finestra di dialogo per l' utente }
            With Color Do
	      If (Dialog('[AVVERTENZA]',
		         '|'+
		         '               Il file specificato               |'+
		         '( '+NameAssemblerFile+' )|'+
		         'esiste sul disco.|'+
		         '|'+
		         'Devo sovrascriverlo o no ?|','','',
		         __SI_NO__,WarningBord,WarningTitle,
		         WarningText,WarningSel,
		         WarningUnSel,WarningKeySel,
		         WarningKeyUnSel) = 1)

		           Then

		             { Può essere sovrascritto }
		             Sovrascrivi := True

	    Else

	      { Non può essere sovrascritto }
	      Sovrascrivi := False;

	    End;

        { Se il file non esiste o se si può sovrascrivere ... }
        If Sovrascrivi
          Then
            Begin

            Assign(FileTXT,'{~~~~~~}.{~}');
            ReWrite(FileTXT);

            { A seconda del metodo scelto ... }
            Case Proced Of

              { Con le funzioni del DOS }
              2: TurboAssembler(True);

              { Con le funzioni del BIOS }
              3: TurboAssembler(False);

              End; { Case Proced }

            { Chiude il file }
            Close(FileTXT);

            { Chiude il file }
            Close(FileTXT2);

            Reset(FileTXT2);

            Append(FileTXT);

            While (Not EOF(FileTXT2)) Do
              Begin
              ReadLn(FileTXT2,StApp);
              WriteLn(FileTXT,StApp);
              End;

            Close(FileTXT2);
            Erase(FileTXT2);
            Close(FileTXT);
            Rename(FileTXT,NameAssemblerFile);
            End;

        End;

    End;

End; { TurboAssembler }


{----------------------------------------------------------------------------
  PROCEDURA: TURBO.C

  Converte l' immagine in un file in Turbo C. I tipi di conversione
  disponibili sono i seguenti:

    1) GoToXY + CPrintF
    2) Senza GoToXY
    3) Colori ottimizzati
    4) Con Diretta
 ----------------------------------------------------------------------------}
Procedure TurboC;

{ Variabili locali }
Var

    { Metodo di conversione scelto }
    Proced:      Integer;

    { Sovrascrivo il file sul disco ? }
    Sovrascrivi: Boolean;

    { File di testo }
    FileTXT:     Text;


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.C.GOTOXY

       Per scrivere il file in Turbo Pascal vengono utilizzati i metodi:

         1) GoToXY + CPrintF       se UsoGoTo = True
         2) Senza GoToXY           se UsoGoTo = False
      -----------------------------------------------------------------------}
     Procedure TurboCGoToXY ( UsoGoTo: Boolean );

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Indice per i cicli }
         L:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore del carattere da scrivere }
         St3:           String003;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;


     Begin { TurboCGoToXY }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,50,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NameCFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Questo file è stato creato da T.I.P., scritto da Fochi Michele */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Le procedure "clrscr()", "textattr()", "gotoxy()" e            */');
     WriteLn(FileTXT,'/* "cprintf()" e la costante "LIGHTGRAY" sono nella unit CONIO.H  */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Per eseguire il programma occorre quindi la seguente linea     */');
     WriteLn(FileTXT,'/* di codice (nelle prime righe del programma):                   */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/*     #include <conio.h>                                         */');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'void '+NomeProcedura+'()');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  { /* '+NomeProcedura+' */');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  /* Cancello lo schermo */');
     WriteLn(FileTXT,'  textattr(LIGHTGRAY);');
     WriteLn(FileTXT,'  clrscr();');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  /* Ora viene riempito lo schermo */');
     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While (Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80) Do
             Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St: se ci sono delle
             virgolette (") vengono scritte due volte, perchè in Turbo
             C sono dei delimitatori di stringhe (per questo motivo
             la stringa può essere al massimo di 160 caratteri) }
           While (k <= Num) Do
             Begin
             St := St+Page[i,j+k].Ch;
             If (Page[i,j+k].Ch = '"')
               Then
                 St := St+'"';
             Inc(k);
             End;

           { Determinazione del metodo da utilizzare }
           If UsoGoTo
             Then

               { Se vogliono scritte anche le istruzioni GoToXY(x,y)
                 vengono aggiunte }
               Begin

               { Conversioni numeri -> stringhe }
               Str(j,St1);
               Str(i,St2);

               { Scrive l' istruzione in Turbo C }
               Write(FileTXT,'  gotoxy('+St1+','+St2+');     ');

               { Indentazione }
               For l := (Length(St1)+Length(St2)) To 4 Do
                 Write(FileTXT,' ');

               End;

           { Conversione attributo }
           Str(Page[i,j].At,St3);

           { Scrive le due istruzioni in Turbo C }
           WriteLn(FileTXT,'  textattr('+St3+');');
           WriteLn(FileTXT,'  cprintf("'+St+'");');

           Inc(j,Num+1);

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  } /* '+NomeProcedura+' */');
     WriteLn(FileTXT);

     End; { TurboCGoToXY }


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.C.GOTOXY.OTTIMIZZATO

       Per scrivere il file in Turbo C viene utilizzato il metodo

         3) Colori ottimizzati
      -----------------------------------------------------------------------}
     Procedure TurboCGoToXYOttimizzato;

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Indice per i cicli }
         L:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore del carattere da scrivere }
         St3:           String003;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

         { Il colore è stato trovato ? }
         Trovato:       Boolean;

     Begin { TurboCGoToXYOttimizzato }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,50,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NameCFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Questo file è stato creato da T.I.P., scritto da Fochi Michele */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Le procedure "clrscr()", "textattr()", "gotoxy()" e            */');
     WriteLn(FileTXT,'/* "cprintf()" e la costante "LIGHTGRAY" sono nella unit CONIO.H  */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Per eseguire il programma occorre quindi la seguente linea     */');
     WriteLn(FileTXT,'/* di codice (nelle prime righe del programma):                   */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/*     #include <conio.h>                                         */');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'void '+NomeProcedura+'()');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  { /* '+NomeProcedura+' */');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  /* Cancello lo schermo */');
     WriteLn(FileTXT,'  textattr(LIGHTGRAY);');
     WriteLn(FileTXT,'  clrscr();');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  /* Ora viene riempito lo schermo */');
     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutti i 256 colori diversi }
       For l := 0 To 255 Do
         Begin
         Trovato := False;

         { Tutte le 24 righe }
         For i := 1 To 24 Do
           Begin

           { Tutte le 80 colonne }
           j := 1;
           While (j <= 80) Do
             Begin
             Num := 0;

             { Se il colore è quello considerato (ciclo L) }
             If (Page[i,j].At = l)
               Then
                 Begin

                 { Viene determinata una stringa con gli stessi attributi }
                 While (Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80) Do
                   Inc(Num);
                 St := StrNull;
                 k := 0;

                 { E memorizzata nella variabile St: se ci sono delle
                   virgolette (") vengono scritte due volte, perchè in Turbo
                   C sono dei delimitatori di stringhe (per questo motivo
                   la stringa può essere al massimo di 160 caratteri) }
                 While (k <= Num) Do
                   Begin
                   St := St+Page[i,j+k].Ch;
                   If (Page[i,j+k].Ch = '"')
                     Then
                       St := St+'"';
                   Inc(k);
                   End;

                 { Se è necessario il cambio di colore, viene aggiunta
                   l' istruzione TextAttr := <Colore> }
                 If Not Trovato
                   Then
                     Begin
                     Trovato := True;

                     { Converte l' attributo del carattere }
                     Str(Page[i,j].At,St3);

                     { Scrive l' istruzione in Turbo Pascal }
                     WriteLn(FileTXT);
	             WriteLn(FileTXT,'  textattr('+St3+');');

                     End;

                 { Ora converte le coordinate }
                 Str(j,St1);
                 Str(i,St2);

                 { Scrive le due istruzioni in Turbo Pascal }
                 WriteLn(FileTXT,'  gotoxy('+St1+','+St2+');');
                 WriteLn(FileTXT,'  cprintf("'+St+'");');
                 End;

             Inc(j,Num+1);

             End;

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  } /* '+NomeProcedura+' */');
     WriteLn(FileTXT);

     End; { TurboCGoToXYOttimizzato }


     {-----------------------------------------------------------------------
       PROCEDURA: TURBO.C.DIRETTA

       Per scrivere il file in Turbo C viene utilizzato il metodo

         4) Con Diretta
      -----------------------------------------------------------------------}
     Procedure TurboCDiretta;

     { Variabili locali }
     Var

         { Nome della procedura in Turbo Pascal }
         NomeProcedura: String;

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore del carattere da scrivere (primo piano con Diretta) }
         St3:           String003;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;


     Begin { TurboCDiretta }

     { Input del nome della procedura }
     NomeProcedura := StrNull;
     NomeProcedura := InputString(' Come chiamo la procedura?  ',
			          Color.InputField,50,255,
			          NomeProcedura,Color.InputDigit,
			          Color.InputArrow,SetCarProc);

     { Aggiusta il nome }
     NomeProcedura[1] := UpCase(NomeProcedura[1]);

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NameCFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Questo file è stato creato da T.I.P., scritto da Fochi Michele */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* La procedura "Diretta" è nella unit VIDEO.H                    */');
     WriteLn(FileTXT,'/* Le procedure "clrscr()" e "textattr()" e la costante           */');
     WriteLn(FileTXT,'/* "LIGHTGRAY" sono nella unit CONIO.H                            */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/* Per eseguire il programma occorrono quindi le seguenti linee   */');
     WriteLn(FileTXT,'/* di codice (nelle prime righe del programma):                   */');
     WriteLn(FileTXT,'/*                                                                */');
     WriteLn(FileTXT,'/*     #include <conio.h>                                         */');
     WriteLn(FileTXT,'/*     #include "video.h"                                         */');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'void '+NomeProcedura+'()');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  { /* '+NomeProcedura+' */');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  /* Cancello lo schermo */');
     WriteLn(FileTXT,'  textattr(LIGHTGRAY);');
     WriteLn(FileTXT,'  clrscr();');
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  /* Ora viene riempito lo schermo */');
     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While ((Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80)) Do
             Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St: se ci sono delle
             virgolette (") vengono scritte due volte, perchè in Turbo
             C sono dei delimitatori di stringhe (per questo motivo
             la stringa può essere al massimo di 160 caratteri) }
           While (k <= Num) Do
             Begin
             St := St+Page[i,j+k].Ch;
             If (Page[i,j+k].Ch = '"')
               Then
                 St := St+'"';
             Inc(k);
             End;

           { Converte le coordinate e l' atttributo }
           Str(j,St1);
           Str(i,St2);
           Str(Page[i,j].At,St3);

           { Scrive l' istruzione in Turbo C }
           WriteLn(FileTXT,'  Diretta('+St1+','+St2+',"',St,'",'+St3+');');

           Inc(j,Num+1);

           End;
         End;

     { Fine del programma sul file }
     WriteLn(FileTXT);
     WriteLn(FileTXT,'  } /* '+NomeProcedura+' */');
     WriteLn(FileTXT);

     End; { TurboCDiretta }


Begin { TurboC }

{ Disegna il menu Turbo C }
With Color Do
  Proced := Menu('[TURBO C]',

	         '||'+

                 '               Con ^GoToXY e CPrintF             |'+
                 ' Crea un file in C che disegna l'' immagine con le proced'+
                 'ure GoToXY e CPrintF|',

                 '^Senza GoToXY|'+
                 ' Crea un file in C che disegna l'' immagine con la proced'+
                 'ure CPrintF|',

                 'Colori ^Ottimizzati|'+
                 ' Crea un file in C che disegna l'' immagine ottimizzando '+
                 'i cambi di colore|',

                 'Con ^Diretta|'+
                 ' Crea un file in C che disegna l'' immagine con Diretta ('+
                 'Unit Video)|',

	         '||','','','',

	          MenuTitle,MenuSel,MenuUnSel,
	          MenuBord,MenuText,MenuKeySel,
	          MenuKeyUnSel,SMenuConv);

{ Se la scelta è valida ... }
If (Proced <> -1)
  Then
    Begin

    { Input del nome del file in Turbo C }
    NameCFile := InputFile('[File C]','.C','*.C',
		      SetCarFile);

    { Se è diverso dalla stringa nulla }
    If (NameCFile <> StrNull)
      Then
        Begin

        Sovrascrivi := True;

        { Assegnazione del file sul disco ad un nome logico }
        Assign(FileTXT,NameCFile);

        { Lettura del file }
        {$I-}  Reset(FileTXT);  {$I+}

        { Se esiste sul disco viene visualizzata una finestra di dialogo
          in cui si chiede se il file deve essere sovrascritto o no }
        If (IOResult = 0)
          Then

	    Begin

	    { Chiusura del file }
	    Close(FileTXT);

	    { Finestra di dialogo per l' utente }
            With Color Do
	      If (Dialog('[AVVERTENZA]',
		         '|'+
		         '               Il file specificato               |'+
		         '( '+NameCFile+' )|'+
		         'esiste sul disco.|'+
		         '|'+
		         'Devo sovrascriverlo o no ?|','','',
		         __SI_NO__,WarningBord,WarningTitle,
		         WarningText,WarningSel,
		         WarningUnSel,WarningKeySel,
		         WarningKeyUnSel) = 1)

		           Then

		             { Può essere sovrascritto }
		             Sovrascrivi := True

	    Else

	      { Non può essere sovrascritto }
	      Sovrascrivi := False;

	    End;

        { Se il file non esiste o se si può sovrascrivere ... }
        If Sovrascrivi
          Then
            Begin

            { A seconda del metodo scelto ... }
            Case Proced Of

              { GoToXY + CPrintF }
              2: TurboCGoToXY(True);

              { Senza GoToXY }
              3: TurboCGoToXY(False);

              { Colori ottimizzati }
              4: TurboCGoToXYOttimizzato;

              { Con Diretta }
              5: TurboCDiretta;

              End; { Case Proced }

            { Chiude il file }
            Close(FileTXT);

            End;

        End;

    End;

End; { TurboC }


{----------------------------------------------------------------------------
  PROCEDURA: GW.BASIC

  Converte l' immagine in un file in GW-Basic. I tipi di conversione
  disponibili sono i seguenti:

    1) Con Locate
    2) Senza Locate
 ----------------------------------------------------------------------------}
Procedure GWBasic;

{ Variabili locali }
Var

    { Metodo di conversione scelto }
    Proced:      Integer;

    { Sovrascrivo il file sul disco ? }
    Sovrascrivi: Boolean;

    { File di testo }
    FileTXT:     Text;


     {-----------------------------------------------------------------------
       PROCEDURA: GWBASIC.COLOR.PRINT

       Per scrivere il file in GW-Basic vengono utilizzati i metodi:

         1) Con Locate             se Locate = True
         2) Senza Locate           se Locate = False
      -----------------------------------------------------------------------}
     Procedure GWBasicColorPrint ( Locate: Boolean );

     { Variabili locali }
     Var

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Indice per i cicli }
         H:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore di primo piano del carattere }
         St3:           String002;

         { Colore di sfondo del carattere }
         St4:           String002;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

         { Numero di riga del programma }
         NumRiga:       Integer;

     Begin { GWBasicColorPrint }

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NamePascalFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'10 REM');
     WriteLn(FileTXT,'11 REM Questo file è stato creato da T.I.P., scritto da Fochi Michele');
     WriteLn(FileTXT,'12 REM');
     WriteLn(FileTXT,'30 REM');
     WriteLn(FileTXT,'40 REM Cancello lo schermo');

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'50 COLOR 15,00,00');
     WriteLn(FileTXT,'60 CLS');
     WriteLn(FileTXT,'70 REM');
     WriteLn(FileTXT,'80 REM Ora viene riempito lo schermo');
     WriteLn(FileTXT,'90 REM');

     NumRiga := 100;

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While ((Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80)) Do
             Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St }
           While (k <= Num) Do
             Begin
	     St := St+Page[i,j+k].Ch;
             Inc(k);
             End;

           { Determinazione del metodo da utilizzare }
           If Locate
             Then

               { Se vogliono scritte anche le istruzioni Locate x,y
                 vengono aggiunte }
               Begin

               Str(i:2,St1);
               If (St1[1] = kSpazio)
                 Then
                   St1[1] := '0';
               Str(j:2,St2);
               If (St2[1] = kSpazio)
                 Then
                   St2[1] := '0';
               WriteLn(FileTXT,NumRiga,' LOCATE '+St1+','+St2);
               Inc(NumRiga,10);

               End;

           { Aggiusta gli attributi del carattere }
           Str((Page[i,j].At Mod 16):2,St3);
           If (St3[1] = kSpazio)
             Then
               St3[1] := '0';
           Str((Page[i,j].At Div 16):2,St4);
           If (St4[1] = kSpazio)
             Then
               St4[1] := '0';

           { Scrive l' istruzione del cambio di colore in GW-Basic }
           WriteLn(FileTXT,NumRiga,' COLOR '+St3+','+St4+',00');
           Inc(NumRiga,10);

           { Scrive l' istruzione della stampa della stringa in GW-Basic }
           Write(FileTXT,NumRiga,' PRINT "');

           { Se ci sono delle virgolette (") vengono sostituite dai caratteri
             CHR$(34), perchè le virgolette delimitano una stringa }
           For h := 1 To Length(St) Do
             If (St[h] <> '"')
               Then
                 Write(FileTXT,St[h])
             Else
	       Write(FileTXT,'"CHR$(34)"');

           Write(FileTXT,'"');

           Inc(NumRiga,10);

           { Il punto e virgola (;) serve per non andare a capo in una nuova
             riga }
           If Locate
             Then
	       WriteLn(FileTXT)
           Else
             WriteLn(FileTXT,';');

           Inc(j,Num+1);

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT,NumRiga   ,' REM');
     WriteLn(FileTXT,NumRiga+10,' REM Fine del programma');
     WriteLn(FileTXT,NumRiga+20,' REM');

     End; { GWBasicColorPrint }


Begin { GWBasic }

{ Disegna il menu GW-Basic }
With Color Do
  Proced := Menu('[GW-BASIC]',

	         '||'+

                 '               GW-Basic con ^Locate               |'+
                 ' Crea un file in GW-Basic che disegna l'' immagine con Co'+
                 'lor e Print|',

                 'GW-Basic ^senza Locate|'+
                 ' Crea un file in GW-Basic che disegna l'' immagine con Co'+
                 'lor e Print|'+

	         '||','','','','','','',

	          MenuTitle,MenuSel,MenuUnSel,
	          MenuBord,MenuText,MenuKeySel,
	          MenuKeyUnSel,SMenuConv);

{ Se la scelta è valida ... }
If (Proced <> -1)
  Then
    Begin

    { Input del nome del file in GW-Basic }
    NameBasicFile := InputFile('[File GW-Basic]','.BAS','*.BAS',
		               SetCarFile);

    { Se è diverso dalla stringa nulla }
    If (NameBasicFile <> StrNull)
      Then
        Begin

        Sovrascrivi := True;

        { Assegnazione del file sul disco ad un nome logico }
        Assign(FileTXT,NameBasicFile);

        { Lettura del file }
        {$I-}  Reset(FileTXT);  {$I+}

        { Se esiste sul disco viene visualizzata una finestra di dialogo
          in cui si chiede se il file deve essere sovrascritto o no }
        If (IOResult = 0)
          Then

	    Begin

	    { Chiusura del file }
	    Close(FileTXT);

	    { Finestra di dialogo per l' utente }
            With Color Do
	      If (Dialog('[AVVERTENZA]',
		         '|'+
		         '               Il file specificato               |'+
		         '( '+NameBasicFile+' )|'+
		         'esiste sul disco.|'+
		         '|'+
		         'Devo sovrascriverlo o no ?|','','',
		         __SI_NO__,WarningBord,WarningTitle,
		         WarningText,WarningSel,
		         WarningUnSel,WarningKeySel,
		         WarningKeyUnSel) = 1)

		           Then

		             { Può essere sovrascritto }
		             Sovrascrivi := True

	    Else

	      { Non può essere sovrascritto }
	      Sovrascrivi := False;

	    End;

        { Se il file non esiste o se si può sovrascrivere ... }
        If Sovrascrivi
          Then
            Begin

            { A seconda del metodo scelto ... }
            Case Proced Of

              { Con Locate }
              2: GWBasicColorPrint(True);

              { Senza Locate }
              3: GWBasicColorPrint(False);

              End; { Case Proced }

            { Chiude il file }
            Close(FileTXT);

            End;

        End;

    End;

End; { GWBasic }


{----------------------------------------------------------------------------
  PROCEDURA: DATA.BASE

  Converte l' immagine in un file in DataBase. I tipi di conversione
  disponibili sono i seguenti:

    1) A colori
    2) Colori ottimizzati
    3) In bianco e nero
 ----------------------------------------------------------------------------}
Procedure DataBase;

{ Variabili locali }
Var

    { Metodo di conversione scelto }
    Proced:      Integer;

    { Sovrascrivo il file sul disco ? }
    Sovrascrivi: Boolean;

    { File di testo }
    FileTXT:     Text;


     {-----------------------------------------------------------------------
       PROCEDURA: DATA.BASE.FILE

       Per scrivere il file in DataBase vengono utilizzati i metodi:

         1) A colori               se ActiveColor = True
         2) In bianco e nero       se ActiveColor = False
      -----------------------------------------------------------------------}
     Procedure DataBaseFile ( ActiveColor: Boolean );

     { Variabili locali }
     Var

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Indice per i cicli }
         H:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore di primo piano del carattere da scrivere }
         St3:           String003;

         { Colore di sfondo del carattere da scrivere }
         St4:           String003;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

         { Colore di ForeGround }
         ForeColor:     Byte;

         { Colore di BackGround }
         BackColor:     Byte;

         { Contiene '*' per i colori che lampeggiano e '' per gli altri }
         Asterisco:     String001;

     Begin { DataBaseFile }

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NameDataBaseFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'*');
     WriteLn(FileTXT,'* Questo file è stato creato da T.I.P., scritto da Fochi Michele');
     WriteLn(FileTXT,'*');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'@ 0,0 CLEAR');

     { Colore di default }
     If ActiveColor
       Then
         WriteLn(FileTXT,'SET COLOR TO W/N');

     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While ((((Page[i,j].At = Page[i,j+Num+1].At) And ActiveColor)
                 Or (Not ActiveColor)) And (j+Num+1 <= 80)) Do
                   Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St: non vengono fatti controlli
             sui caratteri delimitatori }
           While (k <= Num) Do
             Begin
	     St := St+Page[i,j+k].Ch;
             Inc(k);
             End;

           { Se è a colori ... }
           If ActiveColor
             Then
               Begin

               { Determinazione del colore di foreground }
               ForeColor := Page[i,j].At Mod 16;
               Case ForeColor Of
                  0: St3 := 'N';
                  1: St3 := 'B';
                  2: St3 := 'G';
                  3: St3 := 'BG';
                  4: St3 := 'R';
                  5: St3 := 'RB';
                  6: St3 := 'GR';
                  7: St3 := 'W';
                  8: St3 := 'N+';
                  9: St3 := 'B+';
                 10: St3 := 'G+';
                 11: St3 := 'BG+';
                 12: St3 := 'R+';
                 13: St3 := 'RB+';
                 14: St3 := 'GR+';
                 15: St3 := 'W+';
                 End; { Case ForeColor }

               { Controllo del lampeggio del colore }
               If (Page[i,j].At >= 128)
                 Then

                   { Lampeggio attivo }
                   Begin
                   Asterisco := '*';
                   BackColor := (Page[i,j].At-128) Div 16;
                   End

               Else

                 { Lampeggio non attivo }
                 Begin
                 BackColor := Page[i,j].At Div 16;
                 Asterisco := '';
                 End;

               { Determinazione del colore di background }
               Case BackColor Of
                 0: St4 := 'N';
                 1: St4 := 'B';
                 2: St4 := 'G';
                 3: St4 := 'BG';
                 4: St4 := 'R';
                 5: St4 := 'RB';
                 6: St4 := 'GR';
                 7: St4 := 'W';
                 End; { Case BackColor }

               { Scrive l' istruzione in DataBase }
               WriteLn(FileTXT,'SET COLOR TO '+St3+Asterisco+'/'+St4);
               End;

           { Aggiusta le coordinate del cursore }
           Str((i-1):2,St1);
           If (St1[1] = kSpazio)
             Then
               St1[1] := '0';
           Str((j-1):2,St2);
           If (St2[1] = kSpazio)
             Then
               St2[1] := '0';

           { Scrive l' istruzione in DataBase }
           Write(FileTXT,'@ '+St1+','+St2+' SAY "');

           { Viene controllata la stringa e modificati i caratteri virgolette
             (") in CHR(34), perchè le virgolette sono dei delimitatori di
             stringhe in DataBase }
           For h := 1 To Length(St) Do
             If (St[h] <> '"')
               Then
                 Write(FileTXT,St[h])
             Else
	       Write(FileTXT,'"+CHR(34)+"');

           WriteLn(FileTXT,'"');

           Inc(j,Num+1);

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT,'*');
     WriteLn(FileTXT,'* Fine del programma');
     WriteLn(FileTXT,'*');

     End; { DataBaseFile }


     {-----------------------------------------------------------------------
       PROCEDURA: DATA.BASE.OTTIMIZZATO

       Per scrivere il file in DataBase viene utilizzato il metodo

         3) Colori ottimizzati
      -----------------------------------------------------------------------}
     Procedure DataBaseOttimizzato;

     { Variabili locali }
     Var

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Indice per i cicli }
         H:             Byte;

         { Indice per i cicli }
         L:             Byte;

         { Riga da scrivere }
         St:            String080;

         { Riga del cursore }
         St1:           String002;

         { Colonna del cursore }
         St2:           String002;

         { Colore di primo piano del carattere da scrivere }
         St3:           String003;

         { Colore di sfondo del carattere da scrivere }
         St4:           String003;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

         { Il colore è stato trovato ? }
         Trovato:       Boolean;

         { Colore di ForeGround }
         ForeColor:     Byte;

         { Colore di BackGround }
         BackColor:     Byte;

         { Contiene '*' per i colori che lampeggiano e '' per gli altri }
         Asterisco:     String001;

     Begin { DataBaseOttimizzato }

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NameDataBaseFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     { Intestazione del programma e breve descrizione }
     WriteLn(FileTXT,'*');
     WriteLn(FileTXT,'* Questo file è stato creato da T.I.P., scritto da Fochi Michele');
     WriteLn(FileTXT,'*');
     WriteLn(FileTXT);

     { Da qui inizia il programma vero e proprio }
     WriteLn(FileTXT,'@ 0,0 CLEAR');
     WriteLn(FileTXT);

     With Image^[NumPgVideo] Do

       { Tutti i 256 colori diversi }
       For l := 0 To 255 Do
         Begin
         Trovato := False;

         { Tutte le 24 righe }
         For i := 1 To 24 Do
           Begin

           { Tutte le 80 colonne }
           j := 1;
           While (j <= 80) Do
             Begin
             Num := 0;

             { Se il colore è quello considerato (ciclo L) }
             If (Page[i,j].At = l)
               Then
                 Begin

                 { Viene determinata una stringa con gli stessi attributi }
                 While (Page[i,j].At = Page[i,j+Num+1].At) And
                       (j+Num+1 <= 80) Do
                         Inc(Num);
                 St := StrNull;
                 k := 0;

                { E memorizzata nella variabile St: non vengono fatti
                  controlli sui caratteri delimitatori }
                 While (k <= Num) Do
                   Begin
                   St := St+Page[i,j+k].Ch;
                   Inc(k);
                   End;

                 { Se occorre cambiare colore ... }
                 If (Not Trovato)
                   Then
                     Begin
                     Trovato := True;

                     { Determinazione del colore di foreground }
                     ForeColor := Page[i,j].At Mod 16;
                     Case ForeColor Of
                        0: St3 := 'N';
                        1: St3 := 'B';
                        2: St3 := 'G';
                        3: St3 := 'BG';
                        4: St3 := 'R';
                        5: St3 := 'RB';
                        6: St3 := 'GR';
                        7: St3 := 'W';
                        8: St3 := 'N+';
                        9: St3 := 'B+';
                       10: St3 := 'G+';
                       11: St3 := 'BG+';
                       12: St3 := 'R+';
                       13: St3 := 'RB+';
                       14: St3 := 'GR+';
                       15: St3 := 'W+';
                       End; { Case ForeColor }

                     { Controllo del lampeggio del colore }
                     If Page[i,j].At >= 128
                       Then

                         { Lampeggio attivo }
                         Begin
                         Asterisco := '*';
                         BackColor := (Page[i,j].At-128) Div 16;
                         End

                     Else

                       { Lampeggio non attivo }
                       Begin
                       BackColor := Page[i,j].At Div 16;
                       Asterisco := '';
                       End;

                     { Determinazione del colore di background }
                     Case BackColor Of
                       0: St4 := 'N';
                       1: St4 := 'B';
                       2: St4 := 'G';
                       3: St4 := 'BG';
                       4: St4 := 'R';
                       5: St4 := 'RB';
                       6: St4 := 'GR';
                       7: St4 := 'W';
                       End; { Case BackColor }

                     { Scrive l' istruzione in DataBase }
                     WriteLn(FileTXT,'SET COLOR TO '+St3+Asterisco+'/'+St4);

                     End;

                 { Aggiusta le coordinate del cursore }
                 Str((i-1):2,St1);
                 If (St1[1] = kSpazio)
                   Then
                     St1[1] := '0';
                 Str((j-1):2,St2);
                 If (St2[1] = kSpazio)
                   Then
                     St2[1] := '0';

                 { Scrive l' istruzione in DataBase }
                 Write(FileTXT,'@ '+St1+','+St2+' SAY "');

                 { Viene controllata la stringa e modificati i caratteri
                   virgolette (") in CHR(34), perchè le virgolette sono
                   dei delimitatori di stringhe in DataBase }
                 For h := 1 To Length(St) Do
                   If (St[h] <> '"')
                     Then
                       Write(FileTXT,St[h])
                   Else
	             Write(FileTXT,'"+CHR(34)+"');

                 WriteLn(FileTXT,'"');

                 End;

             Inc(j,Num+1);

             End;

           End;

         End;

     { Fine del programma sul file }
     WriteLn(FileTXT,'*');
     WriteLn(FileTXT,'* Fine del programma');
     WriteLn(FileTXT,'*');

     End; { DataBaseOttimizzato }


Begin { DataBase }

{ Disegna il menu DataBase }
With Color Do
  Proced := Menu('[BATA BASE]',

	         '||'+

                 '               A ^Colori               |'+
                 ' Crea un file in DataBase che disegna l'' immagine a colo'+
                 'ri|',

                 'A Colori ^Ottimizzato|'+
                 ' Crea un file in DataBase che disegna l'' immagine a colo'+
                 'ri (ottimizzando i SET COLOR TO)|',

                 'In ^Bianco e Nero|'+
                 ' Crea un file in DataBase che disegna l'' immagine in bia'+
                 'nco e nero|'+

	         '||','','','','','',

	          MenuTitle,MenuSel,MenuUnSel,
	          MenuBord,MenuText,MenuKeySel,
	          MenuKeyUnSel,SMenuConv);

{ Se la scelta è valida ... }
If (Proced <> -1)
  Then
    Begin

    { Input del nome del file in DataBase }
    NameDataBaseFile := InputFile('[File DataBase]','.PRG','*.PRG',
		                  SetCarFile);

    { Se è diverso dalla stringa nulla }
    If (NameDataBaseFile <> StrNull)
      Then
        Begin

        Sovrascrivi := True;

        { Assegnazione del file sul disco ad un nome logico }
        Assign(FileTXT,NameDataBaseFile);

        { Lettura del file }
        {$I-}  Reset(FileTXT);  {$I+}

        { Se esiste sul disco viene visualizzata una finestra di dialogo
          in cui si chiede se il file deve essere sovrascritto o no }
        If (IOResult = 0)
          Then

	    Begin

	    { Chiusura del file }
	    Close(FileTXT);

	    { Finestra di dialogo per l' utente }
            With Color Do
	      If (Dialog('[AVVERTENZA]',
		         '|'+
		         '               Il file specificato               |'+
		         '( '+NameDataBaseFile+' )|'+
		         'esiste sul disco.|'+
		         '|'+
		         'Devo sovrascriverlo o no ?|','','',
		         __SI_NO__,WarningBord,WarningTitle,
		         WarningText,WarningSel,
		         WarningUnSel,WarningKeySel,
		         WarningKeyUnSel) = 1)

		           Then

		             { Può essere sovrascritto }
		             Sovrascrivi := True

	    Else

	      { Non può essere sovrascritto }
	      Sovrascrivi := False;

	    End;

        { Se il file non esiste o se si può sovrascrivere ... }
        If Sovrascrivi
          Then
            Begin

            { A seconda del metodo scelto ... }
            Case Proced Of

              { A colori }
              2: DataBaseFile(True);

              { Colori ottimizzati }
              3: DataBaseOttimizzato;

              { In bianco e nero }
              4: DataBaseFile(False);

              End; { Case Proced }

            { Chiude il file }
            Close(FileTXT);

            End;

        End;

    End;

End; { DataBase }


{----------------------------------------------------------------------------
  PROCEDURA: SEQUENZE.ESCAPE

  Converte l' immagine in un file in Seeuqnze Escape, visualizzabile
  da DOS con il comando TYPE. I tipi di conversione disponibili sono i
  seguenti:

     1) Con posizionamento
     2) Senza posizionamento
 ----------------------------------------------------------------------------}
Procedure SequenzeEscape;

{ Variabili locali }
Var

    { Metodo di conversione scelto }
    Proced:      Integer;

    { Sovrascrivo il file sul disco ? }
    Sovrascrivi: Boolean;

    { File di testo }
    FileTXT:     Text;


     {-----------------------------------------------------------------------
       PROCEDURA: SEQUENZE.ESCAPE.FILE

       Per scrivere il file in Sequenze Escape vengono utilizzati i metodi:

         1) Con posizionamento        se UsoPos = True
         2) Senza posizionamento      se UsoPos = False
      -----------------------------------------------------------------------}
     Procedure SequenzeEscapeFile ( UsoPos: Boolean);

     { Variabili locali }
     Var

         { Indice per i cicli }
         I:             Byte;

         { Indice per i cicli }
         J:             Byte;

         { Indice per i cicli }
         K:             Byte;

         { Riga da scrivere }
         St:            String160;

         { Numero di caratteri che hanno lo stesso attributo }
         Num:           Byte;

         { Colore di ForeGround }
         Fore:          Byte;

         { Colore di BackGround }
         Back:          Byte;


     Begin { SequenzeEscapeFile }

     { Cancellazione del file sul disco }
     ReWrite(FileTXT);

     { Messaggio per l' utente }
     Info(' Scrittura del file '+NameANSIFile+' ...',Color.Performing);
     Delay(Ritardo.Messaggi);

     With Image^[NumPgVideo] Do

       { Tutte le 24 righe }
       For i := 1 To 24 Do
         Begin

         { Tutte le 80 colonne }
         j := 1;
         While (j <= 80) Do
           Begin
           Num := 0;

           { Viene determinata una stringa con gli stessi attributi }
           While ((Page[i,j].At = Page[i,j+Num+1].At) And (j+Num+1 <= 80)) Do
             Inc(Num);
           St := StrNull;
           k := 0;

           { E memorizzata nella variabile St: non vengono fatti controlli
             sui caratteri delimitatori perchè non esistono in DOS }
           While (k <= Num) Do
             Begin
	     St := St+Page[i,j+k].Ch;
             Inc(k);
             End;

           { Se occorre posizionare il cursore viene aggiunta l' istruzione
             in Sequenze Escape opportuna }
           If UsoPos
             Then
               Write(FileTXT,kEscape,'[',i,';',j,'H');

           Write(FileTXT,kEscape,'[0;');

           { Determinazione del colore di foreground }
           Fore := Page[i,j].At Mod 16;

           { Se è un colore chiaro ... }
           If (Fore > 7)
             Then
               Write(FileTXT,'1;');

           { Decodifica del colore }
           Case Fore Of
             00,08: Fore := 30;
             01,09: Fore := 34;
             02,10: Fore := 32;
             03,11: Fore := 36;
             04,12: Fore := 31;
             05,13: Fore := 35;
             06,14: Fore := 33;
             07,15: Fore := 37;
             End; { Case Fore }

           { Scrive l' istruzione }
           Write(FileTXT,Fore,';');

           { Determinazione del colore di background }
           Back := Page[i,j].At Div 16;

           { Se è un colore lampeggiante ... }
           If (Back > 7)
	     Then
	       Write(FileTXT,'5;');

           { Decodifica del colore }
           Case Back Of
             00,08: Back := 40;
             01,09: Back := 44;
             02,10: Back := 42;
             03,11: Back := 46;
             04,12: Back := 41;
             05,13: Back := 45;
             06,14: Back := 43;
             07,15: Back := 47;
             End; { Case Back }

           { Scrive l' istruzione }
           Write(FileTXT,Back,'m'+St);

           Inc(j,Num+1);

           End;

         End;

     { Scrive l' istruzione finale }
     Write(FileTXT,kEscape,'[23;1H',kEscape,'[0m');

     End; { SequenzeEscapeFile }


Begin { SequenzeEscape }

{ Disegna il menu Sequenze Escape }
With Color Do
  Proced := Menu('[SEQUENZE ESCPAPE]',

	         '||'+

                 '               Sequenze Escape con ^Posizionamento       '+
                 '        |'+
                 ' Crea un file di sequenze Escape, visualizzabile con il T'+
                 'ype del DOS|'+

                 'Sequenze Escape ^senza Posizionamento|'+
                 ' Crea un file sequenze Escape, senza il posizionamento de'+
                 'l cursore|',

	         '||','','','','','','',

	          MenuTitle,MenuSel,MenuUnSel,
	          MenuBord,MenuText,MenuKeySel,
	          MenuKeyUnSel,SMenuConv);

{ Se la scelta è valida ... }
If (Proced <> -1)
  Then
    Begin

    { Input del nome del file in Sequenze Escape }
    NameANSIFile := InputFile('[File ANSI]','.ANS','*.ANS',
		               SetCarFile);

    { Se è diverso dalla stringa nulla }
    If (NameANSIFile <> StrNull)
      Then
        Begin

        Sovrascrivi := True;

        { Assegnazione del file sul disco ad un nome logico }
        Assign(FileTXT,NameANSIFile);

        { Lettura del file }
        {$I-}  Reset(FileTXT);  {$I+}

        { Se esiste sul disco viene visualizzata una finestra di dialogo
          in cui si chiede se il file deve essere sovrascritto o no }
        If (IOResult = 0)
          Then

	    Begin

	    { Chiusura del file }
	    Close(FileTXT);

	    { Finestra di dialogo per l' utente }
            With Color Do
	      If (Dialog('[AVVERTENZA]',
		         '|'+
		         '               Il file specificato               |'+
		         '( '+NameANSIFile+' )|'+
		         'esiste sul disco.|'+
		         '|'+
		         'Devo sovrascriverlo o no ?|','','',
		         __SI_NO__,WarningBord,WarningTitle,
		         WarningText,WarningSel,
		         WarningUnSel,WarningKeySel,
		         WarningKeyUnSel) = 1)

		           Then

		             { Può essere sovrascritto }
		             Sovrascrivi := True

	    Else

	      { Non può essere sovrascritto }
	      Sovrascrivi := False;

	    End;


        { Se il file non esiste o se si può sovrascrivere ... }
        If Sovrascrivi
          Then
            Begin

            { A seconda del metodo scelto ... }
            Case Proced Of

              { Con posizionamento }
              2: SequenzeEscapeFile(True);

              { Senza posizionamento }
              3: SequenzeEscapeFile(False);

              End; { Case Proced }

            { Chiude il file }
            Close(FileTXT);

            End;

        End;

    End;

End; { SequenzeEscape }


{----------------------------------------------------------------------------
  PROCEDURA: MENUCONVERSIONE

  Visualizza il menu di conversione, da cui sono possibili scegliere i
  seguenti linguaggi:
    1) Turbo Pascal
    2) Turbo Assembler
    3) Turbo C
    4) GW-Basic
    5) DataBase
    6) Sequenze Escape
 ----------------------------------------------------------------------------}
Procedure MenuConversione;

Begin { MenuConversione }

{ Disegna il menu Conversione }
With Color Do
  Case Menu('[CONVERSIONE]',

	    '||'+

            '               Turbo ^Pascal               |'+
            ' Crea un file in Pascal che disegna l'' immagine scelta|',

            'Turbo ^Assembler|'+
            ' Crea un file in Turbo Assembler che disegna l'' immagine scel'+
            'ta|',

            'Turbo ^C|'+
            ' Crea un file in Turbo C che disegna l'' immagine scelta|',

            'GW-^Basic|'+
            ' Crea un file in GW-Basic che disegna l'' immagine scelta|',

            '^Data Base|'+
            ' Crea un file in Data Base che disegna l'' immagine scelta|',

            'Sequenze ^Escape|'+
            ' Crea un file di sequenze Escape (ANSI) che disegna l'' immagi'+
            'ne scelta|',

	    '||','',

	    MenuTitle,MenuSel,MenuUnSel,
	    MenuBord,MenuText,MenuKeySel,
	    MenuKeyUnSel,SMenuConv)
       Of

         { Conversione in Turbo Pascal }
         2: TurboPascal;

         { Conversione in Turbo Assembler }
         3: TurboAssembler;

         { Conversione in Turbo C }
         4: TurboC;

         { Conversione in GW-Basic }
         5: GWBasic;

         { Conversione in DataBase }
         6: DataBase;

         { Conversione in Sequenze Escape }
         7: SequenzeEscape;

       End; { Case Menu }

End; { MenuConversione }


End. { TIPConv }
