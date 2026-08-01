Unit GIPMain;

Interface { GIPMain }

Uses Crt,
     Graph,
     Keyboard,
     Mouse,
     Dos,
     GIPVars,
     GIPInit,
     GIPFast,
     GIPMenu,
     GIPBase,
{     GIPIntrp,}
     GIPStato,
     GIPProc,
     GIPGraph,
     GIPFile,
     GIPImage,
     GIPHelp;


Procedure ImageProcessor;


Implementation { GIPMain }


{============================================================================
  PROCEDURA: IMAGE.PROCESSOR
 ============================================================================}
Procedure ImageProcessor;

Var St1, St2: String003;

Begin { ImageProcessor }

If (Not Abort)
  Then
    Begin

    { Inizializzazione }
    ShowMouse;
    CreaImmagine;

    {StartClock;}

    DisegnaImmagine(WinBegX,WinBegY,WinEndX,WinEndY,Clear);
    AggiornaLineBar(Orizzontale);
    AggiornaLineBar(Verticale);

    DrawMenu(AllMenu);

    Repeat

      Defaults;
      RefreshScreen;

      { Fino a che non viene premuto il mouse o un tasto della tastiera
        valido ... }
      ShowMouse;

      Repeat
        GetMouse(True);
      Until (MousePressed Or Tastiera);

      Disegno := True;
      If (Not MyMouseInG(WinBegX,WinBegY,WinEndX,WinEndY) Or MouseInMenuBar)
        Then
          Begin
          If MouseInMenuBar
            Then
              Begin
              SelectMenu;
              CambioMouse := True;
              If OptionSelected
                Then
                  EseguiProcedura(ProcMenu,ProcOpz);
              End
          Else
            Begin
            CambioMouse := False;
            TestArrow;
            TestStrumenti;
            TestColori;
            End;
          Disegno := False;
          End
      Else
        Disegno := True;

      EseguiStato(Stato);

    Until UscitaProgramma;

    End;

EndProgram;

End; { ImageProcessor }


End. { GIPMain }
