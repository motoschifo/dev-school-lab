Unit GIPAppPrc;

Interface { GIPAppPrc }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit,GIPGraph,GIPMenu,GIPFile;


Function  ConsensoNuovo: Boolean;
Function  AttendiInizio: Boolean;


Implementation { GIPAppPrc }


Function  ConsensoNuovo: Boolean;
Begin { ConsensoNuovo }
ConsensoNuovo := Warning('Desideri veramente iniziare un nuovo',
                         'disegno (cancellare quello attule) ?',2)
End; { ConsensoNuovo }


Function  AttendiInizio: Boolean;
Var Fine,Ok: Boolean;
Begin { AttendiInizio }
If ((LeftButton Or (Char1 In [kReturn,kSpazio])) And
    (MyMouseInG(WinBegX,WinBegY,WinEndX,WinEndY)))
      Then
        Begin
        ReleaseMouse;
        AttendiInizio := True;
        End
Else
  AttendiInizio := False;
End; { AttendiInizio }


End. { GIPAppPrc }
