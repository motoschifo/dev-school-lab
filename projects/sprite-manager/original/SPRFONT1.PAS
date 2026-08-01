{============================================================================}
{                                                                            }
{                  SPRITE MANAGER v5.0 - UNIT SPRFONT1                       }
{                                                                            }
{ Data di ultima modifica .............. Mercoledi, 21 Aprile 1993           }
{                                                                            }
{ Questa UNIT fa parte del programma Sprite Manager 5.0.                     }
{                                                                            }
{ Essa contiene procedure e funzioni per il programma necessarie per         }
{ 'linkare' i driver dei vari tipi di font (parte 1).                        }
{                                                                            }
{============================================================================}

Unit SprFont1;

Interface { SprFont1 }

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalit… testo                       }
     Graph,    { Gestisce lo schermo in modalit… grafica                     }
     SprFont2, { Seconda unit delle 3 che definiscono i tipi di fonts        }
     SprFont3; { Terza unit delle 3 che definiscono i tipi di fonts          }


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


Implementation { SprFont1 }


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


End. { SprFont1 }
