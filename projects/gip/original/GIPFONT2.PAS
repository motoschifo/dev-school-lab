{ Essa contiene procedure e funzioni per il programma necessarie per         }
{ 'linkare' i driver dei vari tipi di font (parte 2).                        }

Unit GIPFont2;


Interface { GIPFont2 }

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalit… testo                       }
     Graph,    { Gestisce lo schermo in modalit… grafica                     }
     GIPFont3; { Terza unit delle 3 che definiscono i tipi di fonts          }


{===========================================================================}
{ PROCEDURA: TRIPLEX.FONT.PROC                                              }
{                                                                           }
{ Procedura relativa al file 'TRIP.CHR'.                                    }
{===========================================================================}
Procedure TriplexFontProc;


{===========================================================================}
{ PROCEDURA: SCROPT.FONT                                                    }
{                                                                           }
{ Procedura relativa al file 'SCRI.CHR'.                                    }
{===========================================================================}
Procedure ScroptFont;


{===========================================================================}
{ PROCEDURA: SIMPLE.FONT                                                    }
{                                                                           }
{ Procedura relativa al file 'SIMP.CHR'.                                    }
{===========================================================================}
Procedure SimpleFont;


{===========================================================================}
{ PROCEDURA: TSCR.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'TSCR.CHR'.                                    }
{===========================================================================}
Procedure TSCRFont;


Implementation { GIPFont2 }


{===========================================================================}
{ PROCEDURA: TRIPLEX.FONT.PROC                                              }
{                                                                           }
{ Procedura relativa al file 'TRIP.CHR'.                                    }
{===========================================================================}
Procedure TriplexFontProc; External;
{$L TRIP.OBJ }


{===========================================================================}
{ PROCEDURA: SCROPT.FONT                                                    }
{                                                                           }
{ Procedura relativa al file 'SCRI.CHR'.                                    }
{===========================================================================}
Procedure ScroptFont; External;
{$L SCRI.OBJ }


{===========================================================================}
{ PROCEDURA: SIMPLE.FONT                                                    }
{                                                                           }
{ Procedura relativa al file 'SIMP.CHR'.                                    }
{===========================================================================}
Procedure SimpleFont; External;
{$L SIMP.OBJ }


{===========================================================================}
{ PROCEDURA: TSCR.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'TSCR.CHR'.                                    }
{===========================================================================}
Procedure TSCRFont; External;
{$L TSCR.OBJ }


End. { GIPFont2 }
