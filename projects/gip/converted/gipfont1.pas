{ Essa contiene procedure e funzioni per il programma necessarie per         }
{ 'linkare' i driver dei vari tipi di font (parte 1).                        }

Unit GIPFont1;

Interface { GIPFont1 }

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalità testo                       }
     Graph,    { Gestisce lo schermo in modalità grafica                     }
     GIPFont2, { Seconda unit delle 3 che definiscono i tipi di fonts        }
     GIPFont3; { Terza unit delle 3 che definiscono i tipi di fonts          }


{===========================================================================}
{ PROCEDURA: GOTHIC.FONT.PROC                                               }
{                                                                           }
{ Procedura relativa al file 'GOTH.CHR'.                                    }
{===========================================================================}
Procedure GothicFontProc;


{===========================================================================}
{ PROCEDURA: SANS.SERIF.FONT.PROC                                           }
{                                                                           }
{ Procedura relativa al file 'SANS.CHR'.                                    }
{===========================================================================}
Procedure SansSerifFontProc;


{===========================================================================}
{ PROCEDURA: SMALL.FONT.PROC                                                }
{                                                                           }
{ Procedura relativa al file 'LITT.CHR'.                                    }
{===========================================================================}
Procedure SmallFontProc;


Implementation { GIPFont1 }


{===========================================================================}
{ PROCEDURA: GOTHIC.FONT.PROC                                               }
{                                                                           }
{ Procedura relativa al file 'GOTH.CHR'.                                    }
{===========================================================================}
Procedure GothicFontProc; External;
{$L GOTH.OBJ }


{===========================================================================}
{ PROCEDURA: SANS.SERIF.FONT.PROC                                           }
{                                                                           }
{ Procedura relativa al file 'SANS.CHR'.                                    }
{===========================================================================}
Procedure SansSerifFontProc; External;
{$L SANS.OBJ }


{===========================================================================}
{ PROCEDURA: SMALL.FONT.PROC                                                }
{                                                                           }
{ Procedura relativa al file 'LITT.CHR'.                                    }
{===========================================================================}
Procedure SmallFontProc; External;
{$L LITT.OBJ }


End. { GIPFont1 }
