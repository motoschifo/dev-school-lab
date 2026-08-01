{---------------------------------------------------------------------------}
{                                                                           }
{  La procedura "Diretta" scrive direttamente in memoria video              }
{  Le procedure "WriteStr" e "WriteChar" scrivono anch' esse in memoria     }
{  video, con l' unica differenza che sono scritte in codice assembler      }
{  ( e sono più veloci ).                                                   }
{  Questa unit (VIDEO.TPU) viene utilizzata dal programma TIP come          }
{  supporto ai files convertiti in Turbo Pascal.                            }
{                                                                           }
{  Programma scritto da FOCHI MICHELE.                                      }
{                                                                           }
{---------------------------------------------------------------------------}

Unit Video;

{ Direttive al compilatore }
{$D-,S-}

Interface { Video }

Uses Crt;

{----------------------------------------------------------------------------
  PROCEDURA: WRITE.STR

  Scrive una stringa direttamente in memoria video.
  I parametri sono la posizione x (X), quella y (Y), la stringa da visualiz_
  zare (S) e il colore della stessa (ATTR).
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure WriteStr ( X:    Byte;
                     Y:    Byte;
		     S:    String;
		     Attr: Byte );


{----------------------------------------------------------------------------
  PROCEDURA: WRITE.CHAR

  Scrive un carattere direttamente in memoria video.
  I parametri sono la posizione x (X), quella y (Y), il carattere da visua_
  lizzare (CH), il colore dello stesso (ATTR) e il numero di volte che si
  desidera stamparlo (COUNT) (questo significa che se COUNT vale 3 e CH
  vale 'A', viene stampata la stringa 'AAA'.
  Il colore è definito come:

         <BackGround> * 16 + <ForeGround>

  Se si desidera un colore lampeggiante, aggiungere 128 al risultato (se
  si usa la unit CRT della Borland, si può usare la costante BLINK, che
  vale appunto 128).
 ----------------------------------------------------------------------------}
Procedure WriteChar ( X:     Byte;
                      Y:     Byte;
		      Count: Byte;
		      Ch:    Char;
		      Attr:  Byte );


{----------------------------------------------------------------------------
  PROCEDURA: DIRETTA

  Scrive una stringa direttamente in memoria video, utilizzando però un
  codice InLine (quindi un codice Pascal) e non un sorgente in Assembler.
  I parametri sono la posizione x (X), quella y (Y), la stringa da visua_
  lizzare (S), il colore di ForeGround (FG) e quello di BackGround (BG).
  I valori accettabili per i colori FG e BG sono tutti i numeri compresi
  tra 0 e 15 (per il background, i valori da 8 a 15 sono gli stessi dei
  valori tra 0 e 7 ma lampeggianti).
 ----------------------------------------------------------------------------}
Procedure Diretta (     X:  Byte;
                        Y:  Byte;
                    Var S:  String;
                        FG: Byte;
                        BG: Byte );


Implementation { Video }


{ File WIN.OBJ: tutte le procedure sono scritte direttamente in linguaggio
  macchina (assembler) per renderle più veloci }
{$L VIDEO}


{===========================================================================}
Procedure WriteStr ( X:    Byte;
                     Y:    Byte;
		     S:    String;
		     Attr: Byte );
External { Video };


{===========================================================================}
Procedure WriteChar ( X:     Byte;
                      Y:     Byte;
		      Count: Byte;
		      Ch:    Char;
		      Attr:  Byte );
External { Video };


{===========================================================================}
Procedure Diretta (     X:  Byte;
                        Y:  Byte;
                    Var S:  String;
                        FG: Byte;
                        BG: Byte );
Var VidType: Char;

Begin { Diretta }

InLine($1E/                 { PUSH  DS         }
       $33/$DB/             { XOR   BX,BX      }
       $33/$C0/             { XOR   AX,AX      }
       $8A/$5E/<x/          { MOV   BL,x       }
       $8A/$46/<y/          { MOV   AL,y       }
       $4B/                 { DEC   BX         }
       $48/                 { DEC   AX         }
       $B9/$50/$00/         { MOV   CX,0080    }
       $F7/$E1/             { MUL   CX         }
       $03/$C3/             { ADD   AX,BX      }
       $B9/$02/$00/         { MOV   CX,0002    }
       $F7/$E1/             { MUL   CX         }
       $8B/$F8/             { MOV   DI,AX      }
       $8A/$5E/<bg/         { MOV   BL,bg      }
       $8A/$46/<fg/         { MOV   AL,fg      }
       $B1/$04/             { MOV   CL,04      }
       $D3/$E3/             { SHL   BX,CL      }
       $03/$D8/             { ADD   BX,AX      }
       $86/$DF/             { XCHG  BL,BH      }
       $BA/$DA/$03/         { MOV   DX,03DA    }

       $33/$C0/             { XOR   AX,AX      }
       $8E/$C0/             { MOV   ES,AX      }
       $B8/$49/$04/         { MOV   AX,0449H   }
       $8B/$F0/             { MOV   SX,AX      }
       $26/$8B/$04/         { MOV   AX,ES:[SI] }
       $3C/$07/             { CMP   AL,7       }
       $74/$0D/             { JZ    MONO       }

       $B8/$00/$B8/         { MOV   AX,B800    }
       $8E/$C0/             { MOV   ES,AX      }
       $C6/$06/vidtype/$01/ { MOV   vidtype,1  }
       $EB/$0B/$90/         { JMP   VERIFICA   }

       {    MONO    }
       $B8/$00/$B0/         { MOV   AX,B000    }
       $8E/$C0/             { MOV   ES,AX      }
       $C6/$06/vidtype/$00/ { MOV   vidtype,0  }

       {    VERIFICA    }
       $C5/$76/<s/          { LDS   SI,s       }
       $8A/$0C/             { MOV   CL,[SI]    }
       $80/$F9/$00/         { CMP   CL,00      }
       $74/$1C/             { JZ    FINESTR    }
       $FC/                 { CLD              }
       $46/                 { INC   SI         }
       $8A/$1C/             { MOV   BL,[SI]    }
       $80/$3E/vidtype/$00/ { CMP   vidtype,0  }
       $74/$0B/             { JE    MUOVICAR   }

       {    BASSO    }
       $EC/                 { IN    AL,DX      }
       $A8/$01/             { TEST  AL,01      }
       $75/$FB/             { JNZ   BASSO      }
       $FA/                 { CLI              }

       {    ALTO    }
       $EC/                 { IN    AL,DX      }
       $A8/$01/             { TEST  AL,01      }
       $74/$FB/             { JZ    ALTO       }

       {    MUOVICAR    }
       $8B/$C3/             { MOV   AX,BX      }
       $AB/                 { STOSW            }
       $FB/                 { STI              }
       $E2/$E5/             { LOOP  movcar     }
       $1F)                 { POP   DS         }

End; { Diretta }


End. { Video }
