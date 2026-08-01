Unit GIPFast;

Interface { GIPFast }

Uses
     Crt,Dos,Keyboard,Graph,GIPVars,Mouse;

Procedure WaitToWrite;
Procedure ReleaseMouse;
Function  ShiftPressed: Boolean;
Function  ControlPressed: Boolean;
Function  AltPressed: Boolean;
Function  NumLockActivated: Boolean;

Implementation { GIPFast }


Procedure WaitToWrite;
Begin { WaitToWrite }
Repeat
  { Maschera il 5§ bit }
Until ((Port[$3DA] And $08) <> 0);
End; { WaitToWrite }


Procedure ReleaseMouse;
Begin (* ReleaseMouse *)
CambioMouse := False;
ShowMouse;
Repeat
  GetMPos;
Until (Not MousePressed);
End; (* ReleaseMouse *)


{----------------------------------------------------------------------------
  FUNZIONE: SHIFT.PRESSED

  Restituisce TRUE se il tasto SHIFT (di destra o di sinistra) Š premuto;
  FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  ShiftPressed: Boolean;

Begin { ShiftPressed }

{ Viene letto lo stato all' indirizzo di memoria 0000h:0417h, nei bit
  1 (Destra) e 2 (Sinistra) }
ShiftPressed := ((Mem[$0000:$0417] And $01) > 0)
                Or ((Mem[$0000:$0417] And $02) > 0);

End; { ShiftPressed }


{----------------------------------------------------------------------------
  FUNZIONE: CONTROL.PRESSED

  Restituisce TRUE se il tasto CTRL Š premuto; FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  ControlPressed: Boolean;

Begin { ControlPressed }

{ Viene letto lo stato all' indirizzo di memoria 0000h:0417h, nel 3§ bit }
ControlPressed := (Mem[$0000:$0417] And $04) > 0;

End; { ControlPressed }


{----------------------------------------------------------------------------
  FUNZIONE: ALT.PRESSED

  Restituisce TRUE se il tasto ALT Š premuto; FALSE in caso contrario.
 ----------------------------------------------------------------------------}
Function  AltPressed: Boolean;

Begin { AltPressed }

{ Viene letto lo stato all' indirizzo di memoria 0000h:0417h, nel 4§ bit }
AltPressed := (Mem[$0000:$0417] And $08) > 0;

End; { AltPressed }


Function  NumLockActivated: Boolean;
Begin { NumLockActivated }

NumLockActivated := (Mem[$0000:$0417] And $20) > 0;

End; { NumLockActivated }


End. { GIPFast }
