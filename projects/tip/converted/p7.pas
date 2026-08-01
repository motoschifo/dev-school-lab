{                                                                }
{ Questo file è stato creato da T.I.P., scritto da Fochi Michele }
{                                                                }
{                                                                }
{ La procedura "ClrScr" e le costanti "TextAttr" e "LightGray"   }
{ sono nella unit CRT.TPU.                                       }
{                                                                }
{ Per eseguire il programma occorre quindi la seguente linea     }
{ di codice (nelle prime righe del programma):                   }
{                                                                }
{     Uses Crt;                                                  }

Procedure P7;

Type RecPage= Array [1..24,1..80] Of
                Record
                  Ch: Char;
                  At: Byte;
                  End; { RecPage }

     Rec=     Record
                Header: String[007];
                Page:   RecPage;
                End; { Rec }

Var MSKFile: File Of      { File strutturato }
               Rec;
    MSKRec:  ^Rec;        { Record del file }
    Fisico:  ^RecPage;    { Inizio dello schermo fisico }

Begin { P7 }

{ Cancello lo schermo }
TextAttr := LightGray;
ClrScr;

{ Alloco nello Heap il record MSKRec (3848 Bytes) }
New(MSKRec);

{ Assegnazione del file maschera }
Assign(MSKFile,'P7');

{$I-}  Reset(MSKFile);  {$I+}

{ Se il file esiste viene letto }
If (IOResult = 0)
  Then
    Read(MSKFile,MSKRec^);


{ Calcolo dell' inizio della memoria video }
If (Mem[$0000:$0499] = 7)
  Then
    Fisico := PTR($B000,$0000)

Else
    Fisico := PTR($B800,$0000);

{ Il contenuto del record maschera va ora in memoria video }
Fisico^ := MSKRec^.Page;

{ Libero la memoria dal record maschera (3848 Bytes) }
Dispose(MSKRec);

End; { P7 }

