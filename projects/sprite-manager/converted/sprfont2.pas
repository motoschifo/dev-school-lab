{============================================================================}
{                                                                            }
{                  SPRITE MANAGER v5.0 - UNIT SPRFONT2                       }
{                                                                            }
{ Data di ultima modifica .............. Mercoledi, 21 Aprile 1993           }
{                                                                            }
{ Questa UNIT fa parte del programma Sprite Manager 5.0.                     }
{                                                                            }
{ Essa contiene procedure e funzioni per il programma necessarie per         }
{ 'linkare' i driver dei vari tipi di font (parte 2).                        }
{                                                                            }
{============================================================================}

Unit SprFont2;


Interface { SprFont2 }

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalità testo                       }
     Graph,    { Gestisce lo schermo in modalità grafica                     }
     SprFont3; { Terza unit delle 3 che definiscono i tipi di fonts          }


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


Implementation { SprFont2 }


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


End. { SprFont2 }
