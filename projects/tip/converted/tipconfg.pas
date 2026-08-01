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
 ║       VERSIONE 1.0                          UNIT TIPCONFG                ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   14 Marzo 1993
  Ora:    18:45:00
  Autore: Fochi Michele
  File:   Unit UnitTextImageProcessorConfiguration }

{ Contiene le procedure che modificano le varie configurazioni: dai
  bordi delle finestre, alle velocità del mouse, a quelle dei vari
  ritardi, ai colori, al salvataggio/lettura del file di configurazione
  TIP.CFG, ecc. }

{ Elenco delle procedure e funzioni definite in questa unit:

  - Procedure ModifyColors;

  - Procedure ModifySpeeds;

  - Procedure ModifyWindows;

  - Procedure ModifyBordBlock;

  - Procedure ModifyArrowBlock;

  - Procedure ModifyMouseSpeed;

  - Procedure ModifySpecialOptions;

  - Procedure LeggiConfigurazione;

  - Procedure SalvaConfigurazione;

  - Procedure MenuConfigurazione; }


{ Nome della unit }
Unit
     TIPConfg;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { TIPConfg }


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

     { Visualizzazione dell' ora e della pressione dei tasti speciali }
     TIPTime;


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.COLORS

  Consente di modificare tutti i colori del programma: i colori devono
  essere salvati sul file di configurazione (sono in tutto una cinquantina)
  altrimenti il lavoro effettuato sarà inutile e, alla prossima esecuzione
  del programma TIP, si ritornerà a quelli memorizzati nel file TIP.CFG
  oppure a quelli memorizzati all' interno del programma stesso.
 ----------------------------------------------------------------------------}
Procedure ModifyColors;


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.SPEEDS

  Modifica le varie velocità per i ritardi di apparizione dei menu,
  per quelli di visualizzazione delle informazioni, di lampeggio
  dei blocchi, ecc.
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifySpeeds;


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.WINDOWS

  Modifica i caratteri che compongono la cornice delle finestre di
  dialogo e dei menu (i tipi di cornice sono gli stessi del menu TRACCIA).
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyWindows;


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.BORD.BLOCK

  Modifica i bordi del blocco selezionato, in modo analogo alla procedura
  ModifyWindows.
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyBordBlock;


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.ARROW.BLOCK

  Modifica le frecce dei bordi del blocco selezionato (frecce singole,
  frecce doppie, caratteri ASCII).
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyArrowBlock;


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.MOUSE.SPEED

  Modifica i settaggi del mouse (velocità X e Y di movimento).
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyMouseSpeed;


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.SPECIAL.OPTIONS

  Modifica le opzioni speciali:
    1) BloccaFore:   Blocca il colore di ForeGround
    2) BloccaBack:   Blocca il colore di BackGround
    3) BloccaCar:    Blocca il carattere
    4) ReturnDown:   RETURN per avanzare di una riga o per scrivere l''
                     ultimo carattere digitato
    5) InvertiXCar:  Inverti i caratteri X (opzione Inverti Blocco/Schermo
                     Su-Giù)
    6) InvertiYCar:  Inverti i caratteri Y (opzione Inverti Blocco/Schermo
                     Destra-Sinistra)
    7) EnableSound:  Abilita o disabilita il suono
    8) NormalCursor: Abilita o disabilita il normale cursore lampeggiante

  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifySpecialOptions;


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.CONFIGURAZIONE

  Legge il file di configurazione TIP.CFG.
 ----------------------------------------------------------------------------}
Procedure LeggiConfigurazione;


{----------------------------------------------------------------------------
  PROCEDURA: SALVA.CONFIGURAZIONE

  Salva la configurazione attuale nel file TIP.CFG.
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure SalvaConfigurazione;


{----------------------------------------------------------------------------
  PROCEDURA: MENU.CONFIGURAZIONE

  Disegna il menu Configurazione ed esegue l' opzione scelta dall' utente,
  chiamando la procedura opportuna.
 ----------------------------------------------------------------------------}
Procedure MenuConfigurazione;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { TIPConfg }


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.COLORS

  Consente di modificare tutti i colori del programma: i colori devono
  essere salvati sul file di configurazione (sono in tutto una cinquantina)
  altrimenti il lavoro effettuato sarà inutile e, alla prossima esecuzione
  del programma TIP, si ritornerà a quelli memorizzati nel file TIP.CFG
  oppure a quelli memorizzati all' interno del programma stesso.
 ----------------------------------------------------------------------------}
Procedure ModifyColors;

{ Tipi locali }
Type

     { Vettore che contiene le stringhe di informazione e tutti i parametri
       necessari per determinare lo stato della variabile, la posizione,
       ecc. }
     Vet= Array [1..46] Of

            Record

            { Valore di ritardo }
            St:       Byte;

            { Descrizione del campo da editare }
            Campo:    String023;

            { Descrizione per l' utente in fondo alla pagina }
            Info:     String080;

            End;

{ Costanti locali }
Const

      { Numero massimo di cifre del campo da editare }
      MaxSize: Byte= 5;

{ Variabili locali }
Var

    { Vettore dei campi e di tutte le informazioni su di essi }
    St:          Vet;

    { Indice per i cicli }
    I:           Byte;

    { Uscita per Done=True }
    Done:        Boolean;

    { Numero di opzione selezionata }
    NumOpz:      Byte;

    { Opzione precedente }
    OldOpz:      Byte;

    { Tasto premuto dall' utente }
    Ch1:         Char;

    { Tasto esteso }
    Ch2:         Char;

    { Inizio della lista }
    Inizio:      Byte;

    { Inizio precedente della lista }
    OldInizio:   Byte;

    { Posizione di inizio del campo (X) }
    PosX:        Byte;

    { Posizione di inizio del campo (Y) }
    PosY:        Byte;


     {-----------------------------------------------------------------------
       FUNZIONE: INPUT.COLOR

       Riceve in input dall' utente il colore desiderato tra i 256 disponi_
       bili: se viene premuto il tasto ESCAPE la funzione restiruisce
       il colore specificato come parametro.
      -----------------------------------------------------------------------}
     Function  InputColor ( PrecCol: Byte ): Byte;

     { Costanti locali }
     Const

           { Carattere non evidenziato }
           UnSelCar: Char= '∙';

           { Carattere evidenziato }
           SelCar:   Char= '■';

     { Variabili locali }
     Var

         { Colore scelto }
         Colore:     Byte;

         { Uscita dalla funzione per Esci=True }
         Esci:       Boolean;

         { Carattere premuto dall' utente }
         Ch1:        Char;

         { Carattere esteso }
         Ch2:        Char;

         { Riga del cursore }
         Riga:       Byte;

         { Riga precedente }
         OldRiga:    Byte;

         { Colonna del cursore }
         Colonna:    Byte;

         { Colonna precedente }
         OldColonna: Byte;

         { Indice per i cicli }
         I:          Byte;

         { Indice per i cicli }
         J:          Byte;


     Begin { InputColor }

     { Apre una nuova finestra }
     With Color Do
       OpenWindow(01,03,77,22,'[Scegli un colore]',MenuTitle,MenuBord,
		  WinCornice);
     FillWin(kSpazio,Color.MenuText);

     { Campo di movimento del mouse }
     SetTHorRange(2,76);
     SetTVertRange(4,21);

     { Scrittura dei colori }
     For i := 0 To 15 Do
       For j := 0 To 15 Do
         WriteChar((i*3)+4,j+2,3,UnSelCar,i+j*16);

     WriteStr(57,2,'Colore scelto:',Color.MenuText);

     { Inizializzazione variabili }
     Riga := PrecCol Div 16+1;
     Colonna := PrecCol Mod 16+1;
     OldRiga := 255;
     OldColonna := 255;
     Esci := False;

     { Il ciclo si ripete fino alla scelta di un colore (RETURN o ESCAPE) }
     Repeat

       { Se la selezione è cambiata ... }
       If ((OldRiga <> Riga) Or (OldColonna <> Colonna))
         Then
           Begin

           { Aggiorna il colore precedente }
           If ((OldRiga In [1..16]) And (OldColonna In [1..16]))
             Then
               WriteChar((OldColonna-1)*3+4,OldRiga+1,3,UnSelCar,
                         (OldColonna-1)+(OldRiga-1)*16);

           { Aggiorna il nuovo colore }
           WriteChar((Colonna-1)*3+4,Riga+1,3,SelCar,
                     ((Colonna-1)+(Riga-1)*16) Mod 128);

           { Aggiorna la prova del testo colorato }
           For i := 4 To 15 Do
             WriteStr(56,i+1,'PROVA PROVA PROVA',(Colonna-1)+(Riga-1)*16);

           End;

       { Attende un tasto }
       Attendi(Ch1,Ch2,SMenuSpeed);

       { Aggiornamento delle variabili }
       OldRiga := Riga;
       OldColonna := Colonna;

       { Controllo della pressione del mouse ... }
       If MousePressed Then
         Begin

         { E' stato premuto il pulsante di sinistra ? }
         If LeftButton
           Then

             Begin

             { Inibizione della tastiera }
             Ch1 := kNull;
             Ch2 := kNull;

             { Se il mouse è nella zona specificata ... }
             If MouseInT(5,5,52,20)
               Then
                 Begin

                 { Il colore è già selezionato ? }
                 If ((Riga = MouseTextY-4) And
                     (Colonna = (MouseTextX-2) Div 3))
                       Then

                         { Si: simulazione return }
                         Ch1 := kReturn

                 Else

                   { No: spostamento }
                   Begin
                   Riga := MouseTextY-4;
                   Colonna := (MouseTextX-2) Div 3;
                   End;

                 End;

             End

         Else

           { E' stato premuto il pulsante di destra ? }
           If RightButton
             Then

               { Simulazione uscita dalla procedura }
               Ch1 := kEscape;

         { Rilascia i pulsanti del mouse }
         While MousePressed Do
           GetMPos;

         End;

       { A seconda del tasto premuto ... }
       Case Ch1 Of

         { Tasto esteso }
         kNull: Case Ch2 Of

                  { Su: sposta di una riga verso l' alto }
                  kUp: If (Riga > 1)
	                 Then
                           Dec(Riga);

                  { Giù: sposta di una riga verso il basso }
                  kDown: If (Riga < 16)
	                   Then
                             Inc(Riga);

                  { Destra: sposta di una colonna verso destra }
                  kRight: If (Colonna < 16)
                            Then
                              Inc(Colonna);

                  { Sinistra: sposta di una colonna verso sinistra }
                  kLeft: If (Colonna > 1)
                           Then
                             Dec(Colonna);

                  { Home: si posiziona sulla prima colonna }
                  kHome: Colonna := 1;

                  { End: si posiziona sull' ultima colonna }
                  kEnd: Colonna := 16;

                  { PageUp: si posiziona sulla prima riga }
                  kPgUp: Riga := 1;

                  { PageDown: si posiziona sull' ultima riga }
                  kPgDown: Riga := 16;

                  { F1: aiuto generale }
	          kF1: Help('Help Generale',Altro);

                  { Shift-F1: indice dell' aiuto }
	          kSF1: Help('Indice',Altro);

                  { Alt-F1: schermata di aiuto precedente }
                  kAF1: Help(LastHelp^[1],Precedente);

                  { Ctrl-F1: help specifico }
                  kCF1: Help('Modifica colori desktop',Altro);

                  End; { Case Ch2 }

         { Return: accetta il nuovo colore ed esce }
         kReturn: Begin

                  Esci := True;

                  InputColor := (Colonna-1)+(Riga-1)*16;

                  End;

         { Escape: esce senza salvare le modifiche }
         kEscape: Begin

                  Esci := True;

                  InputColor := PrecCol;

                  End;

         End; { Case Ch1 }

     Until Esci;

     If (WindowCount > 0)
       Then
         CloseWindow;

     End; { InputColor }


Begin { ModifyColors }

{ Definizione delle informazioni per l' utente in fondo alla pagina }
St[01].Info := ' Colore di default';
St[02].Info := ' Colore per le cancellazioni';
St[03].Info := ' Colore di default della riga di stato in fondo allo schermo';
St[04].Info := ' Colore dei messaggi di errore';
St[05].Info := ' Colore dei messaggi quando un'' operazione è in corso';
St[06].Info := ' Colore dei campi in input';
St[07].Info := ' Colore dei caratteri digitati in input';
St[08].Info := ' Colore dei caratteri freccia per le stringhe più lunghe (input stringhe)';
St[09].Info := ' Colore del bordo dei menu';
St[10].Info := ' Colore del titolo dei menu';
St[11].Info := ' Colore dell'' opzione selezionata dei menu';
St[12].Info := ' Colore dell'' opzione non selezionata dei menu';
St[13].Info := ' Colore della lettera selezionata dei menu';
St[14].Info := ' Colore della lettera non selezionata dei menu';
St[15].Info := ' Colore dell'' opzione selezionata nella finestra per la gestione dei files';
St[16].Info := ' Colore del testo dei menu';
St[17].Info := ' Colore della riga di stato in fondo allo schermo';
St[18].Info := ' Colore dei campi della riga di stato in fondo allo schermo';
St[19].Info := ' Colore dei caratteri freccia per la stringhe più lunghe (finestra file)';
St[20].Info := ' Colore delle frecce per la directory (gestione dei files)';
St[21].Info := ' Colore della barra di posizione per il file selezionato (directory)';
St[22].Info := ' Colore del testo relativo alle informazioni sui files nella directory';
St[23].Info := ' Colore del nome del file da ricercare (finestra file)';
St[24].Info := ' Colore della directory, utilizzato nelle finestre per la gestione dei files';
St[25].Info := ' Colore del messaggio nella directory quando non ci sono files';
St[26].Info := ' Colore del bordo della finestra delle avvertenze (file non salvato, ecc.)';
St[27].Info := ' Colore del titolo della finestra delle avvertenze (file non salvato, ecc.)';
St[28].Info := ' Colore dell'' opzione selezionata della finestra delle avvertenze';
St[29].Info := ' Colore dell'' opzione non selezionata della finestra delle avvertenze';
St[30].Info := ' Colore della lettera evidenziata della finestra delle avvertenze';
St[31].Info := ' Colore della lettera non selezionata della finestra delle avvertenze';
St[32].Info := ' Colore del testo della finestra delle avvertenze (file non salvato, ecc.)';
St[33].Info := ' Colore dell'' opzione lampeggio selezionata (finestra dei colori)';
St[34].Info := ' Colore dell'' opzione lampeggio non selezionata (finestra dei colori)';
St[35].Info := ' Colore del bordo del blocco selezionato';
St[36].Info := ' Colore delle frecce del bordo del un blocco';
St[37].Info := ' Colore dell'' angolo selezionato, del quale si vogliono cambiare le coordinate';
St[38].Info := ' Colore del bordo dell'' help';
St[39].Info := ' Colore del titolo dell'' help';
St[40].Info := ' Colore dell'' opzione selezionata dell'' help';
St[41].Info := ' Colore dell'' opzione non selezionata dell'' help';
St[42].Info := ' Colore del testo dell'' help';
St[43].Info := ' Colore del titolo della finestra aperta con il tasto CTRL';
St[44].Info := ' Colore del testo nella finestra aperta con il tasto CTRL';
St[45].Info := ' Colore del testo evidenziato nella finestra aperta con il tasto CTRL';
St[46].Info := ' Accetta i valori e chiudi la finestra';

{ Inizializzazioni dei valori dei campi }
With Color Do
  Begin
  St[01].St := Default;
  St[02].St := Cancel;
  St[03].St := UserInfo;
  St[04].St := Error;
  St[05].St := Performing;
  St[06].St := InputField;
  St[07].St := InputDigit;
  St[08].St := InputArrow;
  St[09].St := MenuBord;
  St[10].St := MenuTitle;
  St[11].St := MenuSel;
  St[12].St := MenuUnSel;
  St[13].St := MenuKeySel;
  St[14].St := MenuKeyUnSel;
  St[15].St := MenuSelUnSel;
  St[16].St := MenuText;
  St[17].St := Status;
  St[18].St := StatusSel;
  St[19].St := FileArrow;
  St[20].St := DirArrow;
  St[21].St := DirBar;
  St[22].St := DirInfo;
  St[23].St := Search;
  St[24].St := Dir;
  St[25].St := NoFiles;
  St[26].St := WarningBord;
  St[27].St := WarningTitle;
  St[28].St := WarningSel;
  St[29].St := WarningUnSel;
  St[30].St := WarningKeySel;
  St[31].St := WarningKeyUnSel;
  St[32].St := WarningText;
  St[33].St := ColoriBlinkON;
  St[34].St := ColoriBlinkOFF;
  St[35].St := BlockBord;
  St[36].St := BlockArrow;
  St[37].St := BlockAngle;
  St[38].St := HelpBord;
  St[39].St := HelpTitle;
  St[40].St := HelpSel;
  St[41].St := HelpUnSel;
  St[42].St := HelpText;
  St[43].St := SpecTitle;
  St[44].St := SpecText;
  St[45].St := SpecSel;
  End;

{ Descrizioni dei campi }
St[01].Campo := 'Default:         ';
St[02].Campo := 'Cencellazione:   ';
St[03].Campo := 'Informazione:    ';
St[04].Campo := 'Errore:          ';
St[05].Campo := 'Esecuzione:      ';
St[06].Campo := 'Campi input:     ';
St[07].Campo := 'Numeri input:    ';
St[08].Campo := 'Frecce input:    ';
St[09].Campo := 'Bordo menu:      ';
St[10].Campo := 'Titolo menu:     ';
St[11].Campo := 'Selezione menu:  ';
St[12].Campo := 'No Selez. menu:  ';
St[13].Campo := 'Tasti sel. menu: ';
St[14].Campo := 'Tasti non sel.:  ';
St[15].Campo := 'Opz. di default: ';
St[16].Campo := 'Testo del menu:  ';
St[17].Campo := 'Linea di stato:  ';
St[18].Campo := 'Linea stato sel.:';
St[19].Campo := 'Frecce fin. file:';
St[20].Campo := 'Frecce fin. dir: ';
St[21].Campo := 'Barre directory: ';
St[22].Campo := 'Informazione dir:';
St[23].Campo := 'Ricerca veloce:  ';
St[24].Campo := 'Directory:       ';
St[25].Campo := 'Nessun file:     ';
St[26].Campo := 'Bordo avvertenze:';
St[27].Campo := 'Titolo avvert.:  ';
St[28].Campo := 'Selez. avvert.:  ';
St[29].Campo := 'No selez. avv.:  ';
St[30].Campo := 'Tasti sel. avv.: ';
St[31].Campo := 'Non sel. avv.:   ';
St[32].Campo := 'Testo avvert.:   ';
St[33].Campo := 'Blink ON:        ';
St[34].Campo := 'Blink OFF:       ';
St[35].Campo := 'Bordo blocco:    ';
St[36].Campo := 'Freccia blocco:  ';
St[37].Campo := 'Angolo blocco:   ';
St[38].Campo := 'Bordo help:      ';
St[39].Campo := 'Titolo help:     ';
St[40].Campo := 'Selez. help:     ';
St[41].Campo := 'No selez. help:  ';
St[42].Campo := 'Testo help:      ';
St[43].Campo := 'Titolo speciale: ';
St[44].Campo := 'Testo speciale:  ';
St[45].Campo := 'Selez. speciale: ';
St[46].Campo := '────ACCETTA ED ESCI────';

{ Determinazioni delle posizioni dei campi/descrizioni }
PosX := 20;
PosY := 2;

{ Apre un quadro con effetto a scoppio }
ApriQuadro(9,1,71,24,'[Modifica Colori]',Color.MenuBord,
	   Color.MenuText,Color.MenuTitle,Ritardo.WinStep,
	   Ritardo.Windows);

{ Dscrizione sull' utilizzo dei tasti }
WriteStr(3,18,'Usa i tasti cursore per cambiare campo e RETURN per',Color.MenuText);
WriteStr(3,19,'editare il campo selezionato. ',Color.MenuText);
WriteStr(3,20,'Con il tasto ESCAPE si annullano le modifiche effettuate.',Color.MenuText);

{ Settagi iniziali }
Done := False;
NumOpz := 1;
OldOpz := 0;
Inizio := 1;
OldInizio := 0;

{ Inizializzazioni }
Window(1,1,80,25);
Info(St[NumOpz].Info,Color.UserInfo);
Window(9+1,1+1,71-1,24-1);

{ Ciclo che si ripete fino a che non si esce dalla procedura }
Repeat

  { C'è stato un cambio di campo ? }
  If (NumOpz <> OldOpz)
    Then
      Begin

      { Visualizza l' informazione in fondo alla pagina }
      Window(1,1,80,25);
      Info(St[NumOpz].Info,Color.UserInfo);
      Window(9+1,1+1,71-1,24-1);

      For i := 1 To 13 Do
        With St[i+Inizio-1] Do
          Begin

          WriteStr(PosX,PosY+i,Campo,Color.MenuText);

          WriteChar(PosX+Length(Campo),PosY+i,1,kSpazio,Color.MenuText);

          If ((i+Inizio-1) <> 46)
            Then
              WriteStr(PosX+Length(Campo)+1,PosY+i,'abcde',St);

          End;

      { Seleziona l' opzione corrente }
      With St[NumOpz] Do
        WriteStr(PosX,PosY+NumOpz-Inizio+1,Campo,Color.MenuSel)

      End;

  { Attende un tasto }
  Attendi(Ch1,Ch2,SMenuSpeed);

  { Aggiornamento delle variabili }
  OldOpz := NumOpz;
  OldInizio := Inizio;

  { Controllo della pressione del mouse ... }
  If MousePressed Then
    Begin

    { E' stato premuto il pulsante di sinistra ? }
    If LeftButton
      Then

        Begin

        { Inibizione della tastiera }
        Ch1 := kNull;
        Ch2 := kNull;

        { Se il mouse è nella zona specificata ... }
        If MouseInT(29,4,51,16)
          Then
            Begin

            { L' opzione è già evidenziata ? }
            If (NumOpz = MouseTextY+Inizio-4)
              Then

                { Si: simulazione Return }
                Ch1 := kReturn

            Else

              { No: spostamento }
              NumOpz := MouseTextY+Inizio-4;

            End;

        End

    Else

      { E' stato premuto il pulsante di destra ? }
      If RightButton
        Then

          { Simulazione uscita dalla procedura }
          Ch1 := kEscape;

    { Rilascia i pulsanti del mouse }
    While MousePressed Do
      GetMPos;

    End;

  { A seconda del tasto premuto ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: With St[NumOpz] Do

             Case Ch2 Of

               { Su: sposta al campo precedente }
               kUp: If (NumOpz > 1)
	              Then
                        Dec(NumOpz);

               { Giù: sposta al campo successivo }
               kDown: If (NumOpz < 46)
	                Then
                          Inc(NumOpz);

               { Home: si posiziona sulla prima cifra del campo }
               kHome: NumOpz := 1;

               { End: si posiziona sull' ultima cifra del campo }
               kEnd: NumOpz := 46;

               { PageUp: si posiziona sul primo campo }
               kPgUp: Begin

                      If (NumOpz > 11)
                        Then
                          Dec(NumOpz,11)
                      Else
                        NumOpz := 1;

                      End;

               { PageDown: si posiziona sull' ultimo campo }
               kPgDown: Begin

                        Inc(NumOpz,11);

                        If (NumOpz > 46)
                          Then
                            NumOpz := 46;

                        End;

               { F1: aiuto generale }
	       kF1: Help('Help Generale',Altro);

               { Shift-F1: indice dell' aiuto }
	       kSF1: Help('Indice',Altro);

               { Alt-F1: schermata di aiuto precedente }
               kAF1: Help(LastHelp^[1],Precedente);

               { Ctrl-F1: help specifico }
               kCF1: Help('Colori desktop',Altro);

               End; { Case Ch2 }

    { Return: edita un campo ed avanza al prossimo o accetta ed esce dalla
              procedura }
    kReturn: If (NumOpz < 46)
               Then

                 Begin

                 { Input del colore }
                 St[NumOpz].St := InputColor(St[NumOpz].St);

                 { Avanza }
	         Inc(NumOpz);

                 { Campo di movimento del mouse }
                 SetTHorRange(10,70);
                 SetTVertRange(2,23);

                 End

             Else

               { Controlla ed esce se tutto è corretto }
	       Begin

               Done := True;

               { Vengono passati tutti i valori }
               With Color Do
                 Begin
                 Default         := St[01].St;
                 Cancel          := St[02].St;
                 UserInfo        := St[03].St;
                 Error           := St[04].St;
                 Performing      := St[05].St;
                 InputField      := St[06].St;
                 InputDigit      := St[07].St;
                 InputArrow      := St[08].St;
                 MenuBord        := St[09].St;
                 MenuTitle       := St[10].St;
                 MenuSel         := St[11].St;
                 MenuUnSel       := St[12].St;
                 MenuKeySel      := St[13].St;
                 MenuKeyUnSel    := St[14].St;
                 MenuSelUnSel    := St[15].St;
                 MenuText        := St[16].St;
                 Status          := St[17].St;
                 StatusSel       := St[18].St;
                 FileArrow       := St[19].St;
                 DirArrow        := St[20].St;
                 DirBar          := St[21].St;
                 DirInfo         := St[22].St;
                 Search          := St[23].St;
                 Dir             := St[24].St;
                 NoFiles         := St[25].St;
                 WarningBord     := St[26].St;
                 WarningTitle    := St[27].St;
                 WarningSel      := St[28].St;
                 WarningUnSel    := St[29].St;
                 WarningKeySel   := St[30].St;
                 WarningKeyUnSel := St[31].St;
                 WarningText     := St[32].St;
                 ColoriBlinkON   := St[33].St;
                 ColoriBlinkOFF  := St[34].St;
                 BlockBord       := St[35].St;
                 BlockArrow      := St[36].St;
                 BlockAngle      := St[37].St;
                 HelpBord        := St[38].St;
                 HelpTitle       := St[39].St;
                 HelpSel         := St[40].St;
                 HelpUnSel       := St[41].St;
                 HelpText        := St[42].St;
                 SpecTitle       := St[43].St;
                 SpecText        := St[44].St;
                 SpecSel         := St[45].St;
                 End;

               End;

    { Escape: esce senza salvare le modifiche }
    kEscape: Done := True;

    End; { Case Ch1 }

  { Controllo di validità dell' inizio della lista }
  If (Inizio > NumOpz)
    Then
      Inizio := NumOpz

  Else

    If ((Inizio+12) < NumOpz)
      Then
        Inizio := NumOpz-12;

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { ModifyColors }


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.SPEEDS

  Modifica le varie velocità per i ritardi di apparizione dei menu,
  per quelli di visualizzazione delle informazioni, di lampeggio
  dei blocchi, ecc.
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifySpeeds;

{ Tipi locali }
Type

     { Vettore che contiene le stringhe di informazione e tutti i parametri
       necessari per determinare lo stato della variabile, la posizione,
       ecc. }
     Vet= Array [1..13] Of

            Record

            { Valore di ritardo }
            St:       String005;

            { Posizione del cursore }
            OffSet:   Byte;

            { Posizione X del campo da editare }
            PosX:     Byte;

            { Posizione Y del campo da editare }
            PosY:     Byte;

            { Descrizione del campo da editare }
            Campo:    String023;

            { Descrizione per l' utente in fondo alla pagina }
            Info:     String080;

            End;

{ Costanti locali }
Const

      { Numero massimo di cifre del campo da editare }
      MaxSize: Byte= 5;

{ Variabili locali }
Var

    { Vettore dei campi e di tutte le informazioni su di essi }
    St:          Vet;

    { Offset precedente del campo }
    OldOffSet:   Byte;

    { Insert on/off }
    InsertState: Boolean;

    { Indice per i cicli }
    I:           Byte;

    { Uscita per Done=True }
    Done:        Boolean;

    { Numero di opzione selezionata }
    NumOpz:      Byte;

    { Opzione precedente }
    OldOpz:      Byte;

    { Tasto premuto dall' utente }
    Ch1:         Char;

    { Tasto esteso }
    Ch2:         Char;

    { Valore precedente del campo }
    OldSt:       String005;

    { Numero convertito }
    Num:         LongInt;

    { Errore dopo la conversione }
    ErrorCode:   Integer;

Begin { ModifySpeeds }

{ Definizione delle informazioni per l' utente in fondo alla pagina }
St[01].Info := ' Ritardo di default';
St[02].Info := ' Ritardo per i BEEPs';
St[03].Info := ' Numero di passi per l'' apertura dei menu';
St[04].Info := ' Ritardo per ogni passo di apertura dei menu';
St[05].Info := ' Numero di passi per l'' apertura delle finestre di dialogo';
St[06].Info := ' Ritardo per ogni passo di apertura delle finestre di dialogo';
St[07].Info := ' Numero di passi per l'' apertura delle finestre generiche';
St[08].Info := ' Ritardo per ogni passo di apertura delle finestre generiche';
St[09].Info := ' Ritardo dopo la scrittura di un messaggio';
St[10].Info := ' Ritardo di movimento per le frecce del bordo del blocco';
St[11].Info := ' Ritardo per il lampeggio del bordo del blocco';
St[12].Info := ' Ritardo per l'' apparizione di un menu rapido (Ctrl, Alt, Shift, ecc.)';
St[13].Info := ' Accetta i valori e chiudi la finestra';

{ Inizializzazioni dei valori dei campi }
Str(Ritardo.Default,St[1].St);
Str(Ritardo.Beep,St[2].St);
Str(Ritardo.MenuStep,St[3].St);
Str(Ritardo.Menu,St[4].St);
Str(Ritardo.DialStep,St[5].St);
Str(Ritardo.Dialog,St[6].St);
Str(Ritardo.WinStep,St[7].St);
Str(Ritardo.Windows,St[8].St);
Str(Ritardo.Messaggi,St[9].St);
Str(Ritardo.BlockSpeed,St[10].St);
Str(Ritardo.BlockBlink,St[11].St);
Str(Ritardo.SpecialKey,St[12].St);

{ Descrizioni dei campi }
St[01].Campo := 'Default:         ';
St[02].Campo := 'Beep:            ';
St[03].Campo := 'Passi Menu:      ';
St[04].Campo := 'Menu:            ';
St[05].Campo := 'Passi Dialogo:   ';
St[06].Campo := 'Dialogo:         ';
St[07].Campo := 'Passi Finestra:  ';
St[08].Campo := 'Finestra:        ';
St[09].Campo := 'Messaggio:       ';
St[10].Campo := 'Bordo Blocco:    ';
St[11].Campo := 'Lampeggio Blocco:';
St[12].Campo := 'Menu Speciali:   ';
St[13].Campo := '────ACCETTA ED ESCI────';

{ Determinazioni delle posizioni dei campi/descrizioni }
For i := 1 To 13 Do
  With St[i] Do
    Begin
    OffSet := 1;
    PosY := i+2;
    PosX := 20;
    While (Length(St) < 5) Do
      St := ShadowChar+St;
    St := Copy(St,1,5);
    End;

Inc(St[13].PosY);

{ Apre un quadro con effetto a scoppio }
ApriQuadro(9,1,71,24,'[Modifica Velocità]',Color.MenuBord,
	   Color.MenuText,Color.MenuTitle,Ritardo.WinStep,
	   Ritardo.Windows);

{ Dscrizione sull' utilizzo dei tasti }
WriteStr(3,18,'Usa i tasti cursore per  cambiare campo e quelli numerici',Color.MenuText);
WriteStr(3,19,'per editare il campo selezionato.',Color.MenuText);
WriteStr(3,20,'Con il tasto ESCAPE si annullano le modifiche effettuate.',Color.MenuText);

{ Settagi iniziali }
Done := False;
NumOpz := 1;
OldOpz := 1;
OldOffSet := St[NumOpz].OffSet;
InsertState := False;

{ Scrittura dei dati }
For i := 1 To 12 Do
  With St[i] Do
    Begin
    WriteStr(PosX,PosY,Campo,Color.MenuText);
    WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuUnSel);
    End;

With St[13] Do
  WriteStr(PosX,PosY,Campo,Color.MenuUnSel);

{ Inizializzazioni }
OldSt := '';
Window(1,1,80,25);
Info(St[NumOpz].Info,Color.UserInfo);
Window(9+1,1+1,71-1,24-1);

{ Ciclo che si ripete fino a che non si esce dalla procedura }
Repeat

  { C'è stato un cambio di campo ? }
  If (NumOpz <> OldOpz)
    Then
      Begin

      { Visualizza l' informazione in fondo alla pagina }
      Window(1,1,80,25);
      Info(St[NumOpz].Info,Color.UserInfo);
      Window(9+1,1+1,71-1,24-1);

      { De-seleziona l' opzione precedente }
      With St[OldOpz] Do
        If (OldOpz = 13)
          Then
            WriteStr(PosX,PosY,Campo,Color.MenuUnSel)
        Else
          WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuUnSel);

      { Seleziona l' opzione corrente }
      With St[NumOpz] Do
        If (NumOpz = 13)
          Then
            WriteStr(PosX,PosY,Campo,Color.MenuSel)
        Else
          WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuSel);

      End;

  { Posizionamento del cursore }
  If (NumOpz <> 13)
    Then
      Begin
      With St[NumOpz] Do
        Begin
	GoToXY(PosX+Length(Campo)+OffSet,PosY);
        If (OldSt <> St)
          Then
            WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuSel);
        End;

      { Cambio del cursore secondo lo stato dell' Insert}
      If InsertState
        Then
          LineCursor
      Else
        BlockCursor;

      End;

  { Attende un tasto }
  Attendi(Ch1,Ch2,SMenuSpeed);

  { Aggiornamento delle variabili }
  OldOffSet := St[NumOpz].OffSet;
  OldSt := St[NumOpz].St;
  OldOpz := NumOpz;

  { Controllo della pressione del mouse ... }
  If MousePressed Then
    Begin

    { E' stato premuto il pulsante di sinistra ? }
    If LeftButton
      Then

        Begin

        { Inibizione della tastiera }
        Ch1 := kNull;
        Ch2 := kNull;

        { Se il mouse è nella zona specificata ... }
        If MouseInT(29,4,51,17)
          Then
            Begin

            { La linea 16 non viene considerata }
            If (MouseTextY <> 16)
              Then
                Begin

                If (MouseTextY = 17)
                  Then
                    Dec(MouseTextY);

                { L' opzione è già evidenziata ? }
                If (NumOpz = MouseTextY-3)
                  Then

                    { Si: simulazione Return }
                    Ch1 := kReturn

                Else

                  { No: spostamento }
                  NumOpz := MouseTextY-3;

                End;

            End;

        End

    Else

      { E' stato premuto il pulsante di destra ? }
      If RightButton
        Then

          { Simulazione uscita dalla procedura }
          Ch1 := kEscape;

    { Rilascia i pulsanti del mouse }
    While MousePressed Do
      GetMPos;

    End;

  { A seconda del tasto premuto ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: With St[NumOpz] Do

             Case Ch2 Of

               { Sinistra: sposta il cursore verso sinistra }
               kLeft: If (OffSet > 1)
	                Then
			  Dec(OffSet);

               { Destra: sposta il cursore verso destra }
               kRight: If (OffSet < MaxSize)
	                 Then
			   Inc(OffSet);

               { Su: sposta al campo precedente }
               kUp: If (NumOpz > 1)
	              Then
		        Dec(NumOpz);

               { Giù: sposta al campo successivo }
               kDown: If (NumOpz < 13)
	                Then
			  Inc(NumOpz);

               { Insert: cambio dello stato di inserzione }
               kInsert: InsertState := Not InsertState;

               { Cancel: cancella il carattere sul cursore }
               kCancel: If (NumOpz <> 13)
	                  Then
	                    Begin
	                    Delete(St,OffSet,1);
                            St := St+ShadowChar;
                            End;

               { Home: si posiziona sulla prima cifra del campo }
               kHome: OffSet := 1;

               { End: si posiziona sull' ultima cifra del campo }
               kEnd: OffSet := 5;

               { PageUp: si posiziona sul primo campo }
               kPgUp: NumOpz := 1;

               { PageDown: si posiziona sull' ultimo campo }
               kPgDown: NumOpz := 13;

               { F1: aiuto generale }
	       kF1: Help('Help Generale',Altro);

               { Shift-F1: indice dell' aiuto }
	       kSF1: Help('Indice',Altro);

               { Alt-F1: schermata di aiuto precedente }
               kAF1: Help(LastHelp^[1],Precedente);

               { Ctrl-F1: help specifico }
               kCF1: Help('Modifica velocita''',Altro);

               End; { Case Ch2 }

    { Delete: cancella la cifra precedente al cursore }
    kDel: If (NumOpz < 13)
            Then
              With St[NumOpz] Do
                If (OffSet > 1)
                  Then
                    Begin
		    Delete(St,OffSet-1,1);
                    St := St+ShadowChar;
                    Dec(OffSet);
                    End;

    { Return: avanza di un campo o accetta ed esce dalla procedura }
    kReturn: If (NumOpz < 13)
               Then

                 { Avanza }
	         Inc(NumOpz)

             Else

               { Controlla ed esce se tutto è corretto }
	       Begin
               Done := True;

               { Vengono passati tutti i valori }
               For i := 1 To 12 do
                 With St[i] Do
                   Begin

                   { Conversione stringa -> numero }
                   While (Pos(ShadowChar,St) <> 0) Do
                     Delete(St,Pos(ShadowChar,St),1);
                   If (St = '')
                     Then
                       St := '0';
                   Val(St,Num,ErrorCode);

                   If (ErrorCode = 0)
                     Then

                       { Nessun errore }
                       Begin

                       { Aggiusta il valore se troppo elevato o troppo
                         piccolo }
		       If (Num < 0)
		         Then Num := 0;
		       If (Num > 65535)
                         Then
                           Num := 65535;

                       { Setta la variabile opportuna }
                       With Ritardo Do
                         Case i Of
                           01: Default := Num;
                           02: Beep := Num;
                           03: MenuStep := Num;
                           04: Menu := Num;
                           05: DialStep := Num;
                           06: Dialog := Num;
                           07: WinStep := Num;
                           08: Windows := Num;
                           09: Messaggi := Num;
                           10: BlockSpeed := Num;
                           11: BlockBlink := Num;
                           12: SpecialKey := Num;
		           End; { Case i }

                       End

                   Else

                     { C'è stato un errore nella conversione }
		     Begin

		     Done := False;
                     For i := 1 To 12 Do
                       While (Length(St) < 5) Do
                         St := ShadowChar+St;

                     End;

                   End;

               End;

    { Escape: esce senza salvare le modifiche }
    kEscape: Done := True;

    { 0..9: edita il campo selezionato }
    '0'..'9': If (NumOpz <> 13)
                Then
	          With St[NumOpz] Do
                    Begin

                    { Aggiorna il valore del campo }
                    If (Not InsertState)
                      Then
                        St[OffSet] := Ch1
                    Else
                      Insert(Ch1,St,OffSet);

                    { Avanza di un carattere se possibile }
                    If (OffSet < MaxSize)
                      Then
                        Inc(OffSet);

                    End;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { ModifySpeeds }


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.WINDOWS

  Modifica i caratteri che compongono la cornice delle finestre di
  dialogo e dei menu (i tipi di cornice sono gli stessi del menu TRACCIA).
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyWindows;

{ Variabili locali }
Var

     { Cornice scelta dall' utente }
     Corn: String013;

Begin { ModifyWindows }

{ Scegli il tipo di cornice }
Corn := SelezionaCornice;

{ Se è un tipo valido si prosegue }
If (Corn <> kNull)
  Then
    WinCornice := Corn;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { ModifyWindows }


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.BORD.BLOCK

  Modifica i bordi del blocco selezionato, in modo analogo alla procedura
  ModifyWindows.
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyBordBlock;

{ Variabili locali }
Var

     { Cornice scelta dall' utente }
     Corn: String013;

Begin { ModifyBordBlock }

{ Scegli il tipo di cornice }
Corn := SelezionaCornice;

{ Se è un tipo valido si prosegue }
If (Corn <> kNull)
  Then
    BlockDef.Bord := Corn;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { ModifyBordBlock }


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.ARROW.BLOCK

  Modifica le frecce dei bordi del blocco selezionato (frecce singole,
  frecce doppie, caratteri ASCII).
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyArrowBlock;

{ Variabili locali }
Var

     { Frecce scelta dall' utente }
     Arrow: String004;

     { Carattere premuto dall' utente }
     Ch:    Char;

Begin { ModifyArrowBlock }

{ Disegna il menu Frecce }
With Color Do
  Case Menu('[MENU FRECCE]',

            '||'+

	    '               '+#27+' - '+#26+' - '+#25+' - '+#24+'               |'+
            ' Frecce sottili|',

	    '||'+

	    ''+#17+' - '+#16+' - '+#31+' - '+#30+'|'+
            ' Frecce grandi|',

	    '||'+

	    'Carattere|'+
            ' Frecce formate da un carattere ASCII|',

	    '||','','','','',

	     MenuTitle,MenuSel,MenuUnSel,
	     MenuBord,MenuText,MenuKeySel,
	     MenuKeyUnSel,SMenuArrow)
       Of

          { Frecce sottili }
	  2: Arrow := FrecceSottili;

          { Frecce grandi }
	  4: Arrow := FrecceGrandi;

          { Frecce formate da 4 caratteri ASCI uguali }
	  6: Begin

	     { Messaggio per l' utente }
	     Info(' Scegli il carattere ASCII da utilizzare come freccia.',
		   UserInfo);

	     { Scelta del carattere ASCII }
	     Ch := MenuASCII;

	     { Se il carattere è diverso dal carattere nullo ... }
	     If (Ch <> kNull)
	       Then

	         Arrow := Ch+Ch+Ch+Ch

	     Else

	       Arrow := kNull;

	     End;

	  { Altrimenti non c'è cornice }
	  Else
	    Arrow := kNull;

	  End; { Case Menu }

{ Se è un tipo valido si prosegue }
If (Arrow <> kNull)
  Then
    BlockDef.Arrow := Arrow;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { ModifyArrowBlock }


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.MOUSE.SPEED

  Modifica i settaggi del mouse (velocità X e Y di movimento).
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifyMouseSpeed;

{ Tipi locali }
Type

     { Vettore che contiene le stringhe di informazione e tutti i parametri
       necessari per determinare lo stato della variabile, la posizione,
       ecc. }
     Vet= Array [1..3] Of

            Record

            { Valore di ritardo }
            St:       String002;

            { Posizione X del campo da editare }
            PosX:     Byte;

            { Posizione Y del campo da editare }
            PosY:     Byte;

            { Descrizione del campo da editare }
            Campo:    String022;

            { Descrizione per l' utente in fondo alla pagina }
            Info:     String080;

            End;

{ Variabili locali }
Var

    { Vettore dei campi e di tutte le informazioni su di essi }
    St:          Vet;

    { Indice per i cicli }
    I:           Byte;

    { Uscita per Done=True }
    Done:        Boolean;

    { Numero di opzione selezionata }
    NumOpz:      Byte;

    { Opzione precedente }
    OldOpz:      Byte;

    { Tasto premuto dall' utente }
    Ch1:         Char;

    { Tasto esteso }
    Ch2:         Char;

    { Valore precedente del campo }
    OldSt:       String002;

    { Numero convertito }
    Num:         LongInt;

    { Valore della velocità orizzontale del mouse }
    X:           Integer;

    { Valore della velocità verticale del mouse }
    Y:           Integer;

Begin { ModifyMouseSpeed }

{ Definizione delle informazioni per l' utente in fondo alla pagina }
St[1].Info := ' Modifica la velocità orizzontale del mouse';
St[2].Info := ' Modifica la velocità verticale del mouse';
St[3].Info := ' Accetta i valori e chiude la finestra';

{ Inizializzazioni dei valori dei campi }
Str(MouseHorSpeed:2,St[1].St);
If (St[1].St[1] = kSpazio)
  Then
    St[1].St[1] := ShadowChar;
Str(MouseVerSpeed:2,St[2].St);
If (St[2].St[1] = kSpazio)
  Then
    St[2].St[1] := ShadowChar;
X := MouseHorSpeed;
Y := MouseVerSpeed;

{ Descrizioni dei campi }
St[1].Campo := 'Velocità Orizzontale: ';
St[2].Campo := 'Velocità Verticale:   ';
St[3].Campo := '────ACCETTA ED ESCI────';

{ Determinazioni delle posizioni dei campi/descrizioni }
For i := 1 To 3 Do
  With St[i] Do
    Begin
    PosY := i+2;
    PosX := 15;
    End;

Inc(St[3].PosY);

{ Apre un quadro con effetto a scoppio }
ApriQuadro(13,4,67,17,'[Velocità Mouse]',Color.MenuBord,
	   Color.MenuText,Color.MenuTitle,Ritardo.WinStep,
	   Ritardo.Windows);

{ Dscrizione sull' utilizzo dei tasti }
WriteStr(4,08,'Usa i tasti cursore ( SU e GIU'' ) per cambiare',Color.MenuText);
WriteStr(4,09,'cambio; DESTRA e SINISTRA per cambiare il valore',Color.MenuText);
WriteStr(4,10,'del campo selezionato; ESCAPE per uscire.',Color.MenuText);

{ Settagi iniziali }
Done := False;
NumOpz := 1;
OldOpz := 1;

{ Scrittura dei dati }
For i := 1 To 2 Do
  With St[i] Do
    Begin
    WriteStr(PosX,PosY,Campo,Color.MenuText);
    WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuUnSel);
    End;

With St[3] Do
  WriteStr(PosX,PosY,Campo,Color.MenuUnSel);

{ Inizializzazioni }
OldSt := '';
Window(1,1,80,25);
Info(St[NumOpz].Info,Color.UserInfo);
Window(13+1,4+1,67-1,17-1);

{ Ciclo che si ripete fino a che non si esce dalla procedura }
Repeat

  { C'è stato un cambio di campo ? }
  If (NumOpz <> OldOpz)
    Then
      Begin

      { Visualizza l' informazione in fondo alla pagina }
      Window(1,1,80,25);
      Info(St[NumOpz].Info,Color.UserInfo);
      Window(13+1,4+1,67-1,17-1);

      { De-seleziona l' opzione precedente }
      With St[OldOpz] Do
        If (OldOpz = 3)
          Then
            WriteStr(PosX,PosY,Campo,Color.MenuUnSel)
        Else
          WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuUnSel);

      { Seleziona l' opzione corrente }
      With St[NumOpz] Do
        If (NumOpz = 3)
          Then
            WriteStr(PosX,PosY,Campo,Color.MenuSel)
        Else
          WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuSel);

      End;

  { Aggiornamento delle velocità del mouse }
  If (NumOpz <> 3)
    Then
      With St[NumOpz] Do
        If (OldSt <> St)
          Then
            Begin
	    WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuSel);
            SetRatio(x,y);
            End;

  { Attende un tasto }
  Attendi(Ch1,Ch2,SMenuMouse);

  { Aggiornamento delle variabili }
  OldSt := St[NumOpz].St;
  OldOpz := NumOpz;

  { Controllo della pressione del mouse ... }
  If MousePressed Then
    Begin

    { E' stato premuto il pulsante di sinistra ? }
    If LeftButton
      Then
        Begin

        { Inibizione della tastiera }
        Ch1 := kNull;
        Ch2 := kNull;

        { Se il mouse è nella zona specificata ... }
        If MouseInT(28,7,52,10)
          Then
            Begin

            { La linea 9 non viene considerata }
            If (MouseTextY <> 9)
              Then
                Begin

                If (MouseTextY = 10)
                  Then
                    Dec(MouseTextY);

                { L' opzione è già evidenziata ? }
                If (NumOpz = MouseTextY-6)
                  Then

                    { Si: simulazione Return }
                    Ch1 := kReturn

                Else

                  { No: spostamento }
                  NumOpz := MouseTextY-6;

                End;

            End;

        End

    Else

      { E' stato premuto il pulsante di destra ? }
      If RightButton
        Then

          { Simulazione uscita dalla procedura }
          Ch1 := kEscape;

    { Rilascia i pulsanti del mouse }
    While MousePressed Do
      GetMPos;

    End;

  { A seconda del tasto premuto ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: With St[NumOpz] Do

             Case Ch2 Of

               { Su: sposta al campo precedente }
               kUp: If (NumOpz > 1)
	              Then
		        Dec(NumOpz);

               { Giù: sposta al campo successivo }
               kDown: If (NumOpz < 3)
	                Then
			  Inc(NumOpz);

               { Sinistra: decrementa il valore del campo }
               kLeft: If (NumOpz < 3)
                        Then
                          Begin

                          { Sceglie il campo da aggiornare }
                          Case NumOpz Of
			    1: Num := x;
			    2: Num := y;
                            End; { Case NumOpz }

                          { Aggiorna il campo }
			  If (Num > 1)
                            Then
                              Dec(Num);
                          Str(Num:2,St);
                          If (St[1] = kSpazio)
                            Then
                              St[1] := ShadowChar;

                          { Aggiorna la velocità corrente }
                          Case NumOpz Of
			    1: x := Num;
			    2: y := Num;
                            End; { Case NumOpz }

                          End;

               { Sinistra: decrementa il valore del campo }
               kRight: If (NumOpz < 3)
                         Then
                           Begin

                           { Sceglie il campo da aggiornare }
                           Case NumOpz Of
			     1: Num := x;
			     2: Num := y;
                             End; { Case NumOpz }

                           { Aggiorna il campo }
			   If (Num < 99)
                             Then
                               Inc(Num);
                           Str(Num:2,St);
                           If (St[1] = kSpazio)
                             Then
                               St[1] := ShadowChar;

                           { Aggiorna la velocità corrente }
                           Case NumOpz Of
			     1: x := Num;
			     2: y := Num;
                             End; { Case NumOpz }

                           End;

               { Home: porta a 1 il valore del campo }
               kHome: St := ShadowChar+'1';

               { PageUp: si posiziona sul primo campo }
	       kPgUp: NumOpz := 1;

               { Home: porta a 99 il valore del campo }
               kEnd: St := '99';

               { PageDown: si posiziona sull' ultimo campo }
               kPgDown: NumOpz := 7;

               { F1: aiuto generale }
	       kF1: Help('Help Generale',Altro);

               { Shift-F1: indice dell' aiuto }
	       kSF1: Help('Indice',Altro);

               { Alt-F1: schermata di aiuto precedente }
               kAF1: Help(LastHelp^[1],Precedente);

               { Ctrl-F1: help specifico }
               kCF1: Help('Modifica velocita'' mouse',Altro);

               End;  { Case Ch2 }

    { Return: avanza di un campo o accetta ed esce dalla procedura }
    kReturn: If (NumOpz < 3)
               Then

                 { Avanza }
	         Inc(NumOpz)

             Else

               { Esce }
	       Begin
               Done := True;
               MouseHorSpeed := X;
               MouseVerSpeed := Y;
               End;

    { Escape: esce senza salvare le modifiche }
    kEscape: Done := True;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { ModifyMouseSpeed }


{----------------------------------------------------------------------------
  PROCEDURA: MODIFY.SPECIAL.OPTIONS

  Modifica le opzioni speciali:
    1) BloccaFore:   Blocca il colore di ForeGround
    2) BloccaBack:   Blocca il colore di BackGround
    3) BloccaCar:    Blocca il carattere
    4) ReturnDown:   RETURN per avanzare di una riga o per scrivere l''
                     ultimo carattere digitato
    5) InvertiXCar:  Inverti i caratteri X (opzione Inverti Blocco/Schermo
                     Su-Giù)
    6) InvertiYCar:  Inverti i caratteri Y (opzione Inverti Blocco/Schermo
                     Destra-Sinistra)
    7) EnableSound:  Abilita o disabilita il suono
    8) NormalCursor: Abilita o disabilita il normale cursore lampeggiante

  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure ModifySpecialOptions;

{ Tipi locali }
Type

     { Vettore che contiene le stringhe di informazione e tutti i parametri
       necessari per determinare lo stato della variabile, la posizione,
       ecc. }
     Vet= Array [1..9] Of

            Record

            { Valore SI/NO }
            St:       String002;

            { Posizione X del campo da editare }
            PosX:     Byte;

            { Posizione Y del campo da editare }
            PosY:     Byte;

            { Descrizione del campo da editare }
            Campo:    String023;

            { Descrizione per l' utente in fondo alla pagina }
            Info:     String080;

            End;

{ Variabili locali }
Var

    { Vettore dei campi e di tutte le informazioni su di essi }
    St:          Vet;

    { Indice per i cicli }
    I:           Byte;

    { Uscita per Done=True }
    Done:        Boolean;

    { Numero di opzione selezionata }
    NumOpz:      Byte;

    { Opzione precedente }
    OldOpz:      Byte;

    { Tasto premuto dall' utente }
    Ch1:         Char;

    { Tasto esteso }
    Ch2:         Char;

    { Valore precedente del campo }
    OldSt:       String002;

    { Valore del campo selezionato }
    VarBool: Boolean;

Begin { ModifySpecialOptions }

{ Definizione delle informazioni per l' utente in fondo alla pagina }
St[01].Info := ' Blocca il colore di ForeGround';
St[02].Info := ' Blocca il colore di BackGround';
St[03].Info := ' Blocca il carattere';
St[04].Info := ' RETURN per avanzare di una riga o per scrivere l'' ultimo carattere digitato';
St[05].Info := ' Inverti i caratteri X (opzione Inverti Blocco/Schermo Su-Giù)';
St[06].Info := ' Inverti i caratteri Y (opzione Inverti Blocco/Schermo Destra-Sinistra)';
St[07].Info := ' Abilita o disabilita il suono';
St[08].Info := ' Abilita o disabilita il normale cursore lampeggiante';
St[09].Info := ' Accetta i valori e chiudi la finestra';

{ Inizializzazioni dei valori dei campi }
For i := 1 To 9 Do
  With St[i] Do
    St := 'NO';

With Special Do
  Begin

  If BloccaFore
    Then
      St[1].St := 'SI';

  If BloccaBack
    Then
      St[2].St := 'SI';

  If BloccaCar
    Then
      St[3].St := 'SI';

  If ReturnDown
    Then
      St[4].St := 'SI';

  If InvertXCar
    Then
      St[5].St := 'SI';

  If InvertYCar
    Then
      St[6].St := 'SI';

  If EnableSound
    Then
      St[7].St := 'SI';

  If NormalCursor
    Then
      St[8].St := 'SI';

  End;

{ Descrizioni dei campi }
St[1].Campo := 'Blocca ForeGround:  ';
St[2].Campo := 'Blocca BackGround:  ';
St[3].Campo := 'Blocca Caratttere:  ';
St[4].Campo := 'Return a Capo:      ';
St[5].Campo := 'Inverti Caratteri X:';
St[6].Campo := 'Inverti Caratteri Y:';
St[7].Campo := 'Abilita il Suono:   ';
St[8].Campo := 'Cursore Normale:    ';
St[9].Campo := '────ACCETTA ED ESCI────';

{ Determinazioni delle posizioni dei campi/descrizioni }
For i := 1 To 9 Do
  With St[i] Do
    Begin
    PosY := i+2;
    PosX := 15;
    End;

Inc(St[9].PosY);

{ Apre un quadro con effetto a scoppio }
ApriQuadro(13,2,67,21,'[Opzioni Avanzate]',Color.MenuBord,
	   Color.MenuText,Color.MenuTitle,Ritardo.WinStep,
	   Ritardo.Windows);

{ Dscrizione sull' utilizzo dei tasti }
WriteStr(4,14,'Usa i tasti cursore per cambiare campo e SPAZIO',Color.MenuText);
WriteStr(4,15,'per cambiarne il valore (SI/NO).',Color.MenuText);
WriteStr(4,16,'Con ESCAPE si annullano le modifiche effettuate.',Color.MenuText);

{ Settagi iniziali }
Done := False;
NumOpz := 1;
OldOpz := 1;

{ Scrittura dei dati }
For i := 1 To 8 Do
  With St[i] Do
    Begin
    WriteStr(PosX,PosY,Campo,Color.MenuText);
    WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuUnSel);
    End;

With St[9] Do
  WriteStr(PosX,PosY,Campo,Color.MenuUnSel);

{ Inizializzazioni }
OldSt := '';
Window(1,1,80,25);
Info(St[NumOpz].Info,Color.UserInfo);
Window(13+1,2+1,67-1,21-1);

{ Ciclo che si ripete fino a che non si esce dalla procedura }
Repeat

  { C'è stato un cambio di campo ? }
  If (NumOpz <> OldOpz)
    Then
      Begin

      { Visualizza l' informazione in fondo alla pagina }
      Window(1,1,80,25);
      Info(St[NumOpz].Info,Color.UserInfo);
      Window(13+1,2+1,67-1,21-1);

      { De-seleziona l' opzione precedente }
      With St[OldOpz] Do
        If (OldOpz = 9)
          Then
            WriteStr(PosX,PosY,Campo,Color.MenuUnSel)
        Else
          WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuUnSel);

      { Seleziona l' opzione corrente }
      With St[NumOpz] Do
        If (NumOpz = 9)
          Then
            WriteStr(PosX,PosY,Campo,Color.MenuSel)
        Else
          WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuSel);

      End;

  { Aggiornamento del campo sul video }
  If (NumOpz <> 9)
    Then
      With St[NumOpz] Do
        If (OldSt <> St)
          Then
            WriteStr(PosX+Length(Campo)+1,PosY,St,Color.MenuSel);

  { Attende un tasto }
  Attendi(Ch1,Ch2,SMenuSpecial);

  { Aggiornamento delle variabili }
  OldSt := St[NumOpz].St;
  OldOpz := NumOpz;

  { Controllo della pressione del mouse ... }
  If MousePressed Then
    Begin

    { E' stato premuto il pulsante di sinistra ? }
    If LeftButton
      Then
        Begin

        { Inibizione della tastiera }
        Ch1 := kNull;
        Ch2 := kNull;

        { Se il mouse è nella zona specificata ... }
        If MouseInT(28,5,50,14)
          Then
            Begin

            { La linea 13 non viene considerata }
            If (MouseTextY <> 13)
              Then
                Begin

                If (MouseTextY = 14)
                  Then
                    Dec(MouseTextY);

                { L' opzione è già evidenziata ? }
                If (NumOpz = MouseTextY-4)
                  Then

                    { Si: simulazione Return }
                    Ch1 := kReturn

                Else

                  { No: spostamento }
                  NumOpz := MouseTextY-4;

                End;

            End;

        End

    Else

      { E' stato premuto il pulsante di destra ? }
      If RightButton
        Then

          { Simulazione uscita dalla procedura }
          Ch1 := kEscape;

    { Rilascia i pulsanti del mouse }
    While MousePressed Do
      GetMPos;

    End;

  { A seconda del tasto premuto ... }
  Case Ch1 Of

    { Tasto esteso }
    kNull: With St[NumOpz] Do
             Case Ch2 Of

               { Su: sposta al campo precedente }
               kUp: If (NumOpz > 1)
	              Then
		        Dec(NumOpz);

               { Giù: sposta al campo successivo }
               kDown: If (NumOpz < 9)
	                Then
			  Inc(NumOpz);

               { Home,
                 PageUp: si posiziona sul primo campo }
               kHome,
	       kPgUp: NumOpz := 1;


               { End,
                 PageDown: si posiziona sull' ultimo campo }
               kEnd,
               kPgDown: NumOpz := 9;

               { F1: aiuto generale }
	       kF1: Help('Help Generale',Altro);

               { Shift-F1: indice dell' aiuto }
	       kSF1: Help('Indice',Altro);

               { Alt-F1: schermata di aiuto precedente }
               kAF1: Help(LastHelp^[1],Precedente);

               { Ctrl-F1: help specifico }
               kCF1: Help('Colori desktop',Altro);

               End;  { Case Ch2 }

    { Cambia il valore del campo (SI -> NO o NO -> SI) }
    kSpazio: If (NumOpz < 9)
               Then
                 With St[NumOpz] Do
                   If (St = 'SI')
                     Then
                       St := 'NO'
                   Else
                     St := 'SI';

    { Return: avanza di un campo o accetta ed esce dalla procedura }
    kReturn: If (NumOpz < 9)
               Then

                 { Avanza }
	         Inc(NumOpz)

             Else

               { Controlla ed esce se tutto è corretto }
	       Begin
               Done := True;

               { Vengono passati tutti i valori }
               For i := 1 To 8 do
                 With St[i] Do
                   Begin

                   VarBool := St = 'SI';

                   { Setta la variabile opportuna }
                   With Special Do
                     Case i Of
                       1: BloccaFore   := VarBool;
                       2: BloccaBack   := VarBool;
                       3: BloccaCar    := VarBool;
                       4: ReturnDown   := VarBool;
                       5: InvertXCar   := VarBool;
                       6: InvertYCar   := VarBool;
                       7: Enablesound  := VarBool;
                       8: NormalCursor := VarBool;
		       End; { Case i }

                   End;

               End;

    { Escape: esce senza salvare le modifiche }
    kEscape: Done := True;

    End; { Case Ch1 }

Until Done;

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { ModifySpecialOptions }


{----------------------------------------------------------------------------
  PROCEDURA: LEGGI.CONFIGURAZIONE

  Legge il file di configurazione TIP.CFG.
 ----------------------------------------------------------------------------}
Procedure LeggiConfigurazione;
Begin { LeggiConfigurazione }
ReadConfigFile;
End; { LeggiConfigurazione }


{----------------------------------------------------------------------------
  PROCEDURA: SALVA.CONFIGURAZIONE

  Salva la configurazione attuale nel file TIP.CFG.
  Il discorso fatto per la procedura ModifyColors vale anche per questa e
  per tutte le altre di questa unit.
 ----------------------------------------------------------------------------}
Procedure SalvaConfigurazione;
Begin { SalvaConfigurazione }
WriteConfigFile;
End; { SalvaConfigurazione }


{----------------------------------------------------------------------------
  PROCEDURA: MENU.CONFIGURAZIONE

  Disegna il menu Configurazione ed esegue l' opzione scelta dall' utente,
  chiamando la procedura opportuna.
 ----------------------------------------------------------------------------}
Procedure MenuConfigurazione;
Begin { MenuConfigurazione }

{ Disegna il menu Configurazione }
With Color Do
  Case Menu('[CONFIGURAZIONE]',

	    '||'+

            '               Modifica Colori               |'+
            ' Modifica i colori del programma|'+

            'Modifica Velocità|'+
            ' Modifica le velocità del programma (apertura finestre, messag'+
            'gi, ecc.)|',

            'Modifica Cornici Finestra|'+
            ' Modifica il tipo di cornice delle finestre|'+

            'Modifica Bordo Blocco|'+
            ' Modifica il tipo di bordo utilizzato del blocco|',

            'Modifica Frecce Blocco|'+
            ' Modifica il tipo di frecce utilizzate dal bordo del blocco|'+

            'Velocità Mouse|'+
            ' Modifica la velocità il mouse|'+

            'Opzioni Avanzate|'+
            ' Attiva o disattiva le opzioni avanzate (blocca i colori, i ca'+
            'ratteri, ecc.)|',

            '||'+

	    'Leggi Configurazione|'+
            ' Legge da disco il file di configurazione|'+

            'Salva Configurazione|'+
            ' Salva su disco il file di configurazione|'+

	    '||','','','','',

	    MenuTitle,MenuSel,MenuUnSel,
	    MenuBord,MenuText,MenuKeySel,
	    MenuKeyUnSel,SMenuConfig)
       Of

         { Modifica i colori }
         2: ModifyColors;

         { Modifica le velocità }
         3: ModifySpeeds;

         { Modifica i bordi delle finestre }
         4: ModifyWindows;

         { Modifica i bordi del blocco }
         5: ModifyBordBlock;

         { Modifica le frecce dei bordi del blocco }
         6: ModifyArrowBlock;

         { Modifica le velocità del mouse }
         7: ModifyMouseSpeed;

         { Modifica le opzioni speciali }
         8: ModifySpecialOptions;

         { Legge il file di configurazione }
         10: LeggiConfigurazione;

         { Salva il file di configurazione }
         11: SalvaConfigurazione;

       End; { Case Menu }

{ Ripristina le dimensioni della finestra attiva a tutto lo schermo }
Window(1,1,80,25);

{ Campo di movimento del mouse }
SetTHorRange(1,80);
SetTVertRange(1,24);

End; { MenuConfigurazione }


End. { TIPConfg }
