Unit GIPIntrp;

Interface { GIPIntrp }

Uses
     Crt,Dos,Keyboard,Graph,Mouse,GIPVars,GIPFast,GIPInit,GIPGraph;


{----------------------------------------------------------------------------
  PROCEDURA: END.CLOCK

 ----------------------------------------------------------------------------}
Procedure EndClock;
Procedure StartClock;

{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


Implementation { TIPIntrp }


{----------------------------------------------------------------------------
  PROCEDURA: AGGIORNA.ORA

 ----------------------------------------------------------------------------}
Procedure AggiornaOra; Interrupt;

Var
    Count:    LongInt;
    PXS:      Integer;
    PYS:      Integer;
    PXM:      Integer;
    PYM:      Integer;
    PXH:      Integer;
    PYH:      Integer;
    App:      Real;
    Dentro:   Boolean;
    OldColor: Byte;
    { Inizio del display dell' orologio (X) }
    ClockBegX:       Integer;

    { Inizio del display dell' orologio (Y) }
    ClockBegY:       Integer;

    { Fine del display dell' orologio (X) }
    ClockEndX:       Integer;

    { Fine del display dell' orologio (Y) }
    ClockEndY:       Integer;


Begin { AggiornaOra }

If Orologio
  Then
    Begin

    Count := MemL[$0000:$046C];
    Hour := Trunc(Count / 65543);
    Remainder := Count Mod 65543;
    Minute := Trunc(Remainder / 1092);
    Remainder := Remainder Mod 1092;
    Second := Trunc(Remainder / 18.21);

    If (OldSecond <> Second)
      Then
        Begin

        If (Hour > 11)
          Then
            Dec(Hour,12);

        OldColor := GetColor;

        { Calcolo secondi }
        App := Second*Pi/30;
        PxS := ClockBegX+ClkMedioX+Round(Sin(App)*(ClkMedioX-4));
        PyS := ClockBegY+ClkMedioY-Round(Cos(App)*(ClkMedioY-4));

        { Calcolo minuti }
        App := Minute*Pi/30;
        PxM := ClockBegX+ClkMedioX+Round(Sin(App)*(ClkMedioX-4));
        PyM := ClockBegY+ClkMedioY-Round(Cos(App)*(ClkMedioY-4));

        { Calcolo ore }
        App := (Hour*Pi/6)+Minute*Pi*360;
        PxH := ClockBegX+ClkMedioX+Round(Sin(App)*(ClkMedioX-11));
        PyH := ClockBegY+ClkMedioY-Round(Cos(App)*(ClkMedioY-11));

        If (MouseX <= ClockEndX) And (MouseY >= ClockBegY)
          Then
            Begin
            Dentro := True;
            WaitToWrite;
            HideMouse;
            End
        Else
          Dentro := False;

        { Vecchie lancette }
        SetColor(cBkClock);
        Line(OldSecondX,OldSecondY,ClockBegX+ClkMedioX,ClockBegY+ClkMedioY);
        Line(OldMinuteX,OldMinuteY,ClockBegX+ClkMedioX,ClockBegY+ClkMedioY);
        Line(OldHourX,OldHourY,ClockBegX+ClkMedioX,ClockBegY+ClkMedioY);

        { Nuove lancette }
        SetColor(cClkSecond);
        Line(PxS,PyS,ClockBegX+ClkMedioX,ClockBegY+ClkMedioY);
        SetColor(cClkHour);
        Line(PxM,PyM,ClockBegX+ClkMedioX,ClockBegY+ClkMedioY);
        Line(PxH,PyH,ClockBegX+ClkMedioX,ClockBegY+ClkMedioY);

        { Puntini centrale (perno delle lancette) }
        PutPixel(ClockBegX+ClkMedioX,ClockBegY+ClkMedioY,cClkDisplay);

        If Dentro
          Then
            ShowMouse;

        { Aggiornamento dei nuovi valori }
        OldSecondX := PxS;
        OldSecondY := PyS;
        OldSecond := Second;

        OldMinuteX := PxM;
        OldMinuteY := PyM;

        OldHourX := PxS;
        OldHourY := PyS;

        SetColor(OldColor);

        End;

    If CambioMouse
      Then
        Begin
        If (Not MouseOk)
          Then
            Begin
            MouseX := TastieraX;
            MouseY := TastieraY;
            End;

        If ((MouseX >= WinBegX) And (MouseY >= WinBegY) And
            (MouseX <= WinEndX) And (MouseY <= WinEndY))
              Then
                Begin
                If (MouseCursor <> PosDisegno)
                  Then
                    Begin
                    HideMouse;
                    MouseCursor := PosDisegno;
                    NewMouseCursor(CurDisegno);
                    ShowMouse;
                    End;
                End
        Else
          If ((MouseX >= ClockBegX) And (MouseY >= (AltzMenu+AltzMenu)) And
              (MouseX <= ClockEndX) And (MouseY <= ClockBegY-2))
                Then
                  Begin
                  If (MouseCursor <> PosIcone)
                    Then
                      Begin
                      HideMouse;
                      MouseCursor := PosIcone;
                      NewMouseCursor(CurIcone);
                      ShowMouse;
                      End;
                  End;
        End;

    End;

InLine($9C);
Vect1CProc;

End; { AggiornaOra }


{----------------------------------------------------------------------------
  PROCEDURA: DISABILITA.INTERRUPT

 ----------------------------------------------------------------------------}
Procedure EndClock;
Begin { EndClock }
SetIntVec($1C,Save1CProc);
End; { EndClock }


{----------------------------------------------------------------------------
  PROCEDURA: DISEGNA.OROLOGIO

 ----------------------------------------------------------------------------}
Procedure DisegnaOrologio;

Var
    Count:     LongInt;
    I:         Integer;
    J:         Integer;
    PX:        Integer;
    PY:        Integer;
    App:       Real;
    OldHour:   Byte;
    OldMinute: Byte;

Begin { DisegnaOrologio }

ClkMedioX := (ClockEndX-ClockBegX) Div 2;
ClkMedioY := (ClockEndY-ClockBegY) Div 2;
SetFillStyle(SolidFill,cBkClock);
Bar(ClockBegX,ClockBegY,ClockEndX,ClockEndY);
SetColor(cClkDisplay);
Line(ClockBegX+1,ClockBegY+ClkMedioY,ClockBegX+3,ClockBegY+ClkMedioY);
Line(ClockEndX-1,ClockBegY+ClkMedioY,ClockEndX-3,ClockBegY+ClkMedioY);
Line(ClockBegX+ClkMedioX,ClockBegY+1,ClockBegX+ClkMedioX,ClockBegY+3);
Line(ClockBegX+ClkMedioX,ClockEndY-1,ClockBegX+ClkMedioX,ClockEndY-3);
PutPixel(ClockBegX+ClkMedioX,ClockBegY+ClkMedioY,cClkDisplay);
For i := 1 To 11 Do
  If Not (i In [3,6,9])
    Then
      Begin
      Px := ClockBegX+ClkMedioX+Round(Sin((i*2*Pi/12)+
            Round(Minute/12)*2*Pi*60)*(ClkMedioX-3));
      Py := ClockBegY+ClkMedioY-Round(Cos((i*2*Pi/12)+
            Round(Minute/12)*2*Pi*60)*(ClkMedioY-3));
      PutPixel(Px,Py,cClkDisplay);
      End;

Count := MemL[$0000:$046C];

OldHour := Trunc(Count / 65543)+1;
Remainder := Count Mod 65543;
OldMinute := Trunc(Remainder / 1092)+1;
Remainder := Remainder Mod 1092;
OldSecond := Trunc(Remainder / 18.21)+1;
If (OldHour > 11)
  Then
    Dec(OldHour,12);

App := (Hour*2*Pi/12)+Round(Minute/12)*2*Pi*60;
OldHourX := ClockBegX+ClkMedioX+Round(Sin(App)*(ClkMedioX-8));
OldHourY := ClockBegY+ClkMedioY-Round(Cos(App)*(ClkMedioY-8));

App := Minute*2*pi/60;
OldMinuteX := ClockBegX+ClkMedioX+Round(Sin(App)*(ClkMedioX-4));
OldMinuteY := ClockBegY+ClkMedioY-Round(Cos(App)*(ClkMedioY-4));

App := Second*2*pi/60;
OldSecondX := ClockBegX+ClkMedioX+Round(Sin(App)*(ClkMedioX-4));
OldSecondY := ClockBegY+ClkMedioY-Round(Cos(App)*(ClkMedioY-4));

End; { DisegnaOrologio }


{----------------------------------------------------------------------------
  PROCEDURA: START.CLOCK

 ----------------------------------------------------------------------------}
Procedure StartClock;
Begin { StartClock }

DisegnaOrologio;
Orologio := True;

GetIntVec($1C,Save1CProc);
GetIntVec($1C,Addr(Vect1CProc));
SetIntVec($1C,Addr(AggiornaOra));

End; { StartClock }


End. { GIPIntrp }
