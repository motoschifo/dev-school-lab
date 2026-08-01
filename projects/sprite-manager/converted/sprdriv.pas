{============================================================================}
{                                                                            }
{                  SPRITE MANAGER v5.0 - UNIT SPRDRIV                        }
{                                                                            }
{ Data di ultima modifica .............. Mercoledi, 21 Aprile 1993           }
{                                                                            }
{ Questa UNIT fa parte del programma Sprite Manager 5.0.                     }
{                                                                            }
{ Essa contiene procedure e funzioni per il programma necessarie per         }
{ 'linkare' i driver delle schede grafiche.                                  }
{                                                                            }
{============================================================================}

Unit SprDriv;

Interface { SprDriv }

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalità testo                       }
     Graph;    { Gestisce lo schermo in modalità grafica                     }


{===========================================================================}
{ PROCEDURA: ATT.DRIVER.PROC                                                }
{                                                                           }
{ Procedura relativa al file 'ATT.OBJ'.                                     }
{===========================================================================}
Procedure ATTDriverProc;


{===========================================================================}
{ PROCEDURA: CGA.DRIVER.PROC                                                }
{                                                                           }
{ Procedura relativa al file 'CGA.OBJ'.                                     }
{===========================================================================}
Procedure CgaDriverProc;


{===========================================================================}
{ PROCEDURA: EGA.VGA.DRIVER.PROC                                            }
{                                                                           }
{ Procedura relativa al file 'EGAVGA.OBJ'.                                  }
{===========================================================================}
Procedure EgaVgaDriverProc;


{===========================================================================}
{ PROCEDURA: HERC.DRIVER.PROC                                               }
{                                                                           }
{ Procedura relativa al file 'HERC.OBJ'.                                    }
{===========================================================================}
Procedure HercDriverProc;


{===========================================================================}
{ PROCEDURA: PC3270.DRIVER.PROC                                             }
{                                                                           }
{ Procedura relativa al file 'PC3270.OBJ'.                                  }
{===========================================================================}
Procedure PC3270DriverProc;


Implementation { SprDriv }


{===========================================================================}
{ PROCEDURA: ATT.DRIVER.PROC                                                }
{                                                                           }
{ Procedura relativa al file 'ATT.OBJ'.                                     }
{===========================================================================}
Procedure ATTDriverProc; external;
{$L ATT.OBJ }


{===========================================================================}
{ PROCEDURA: CGA.DRIVER.PROC                                                }
{                                                                           }
{ Procedura relativa al file 'CGA.OBJ'.                                     }
{===========================================================================}
Procedure CgaDriverProc; external;
{$L CGA.OBJ }


{===========================================================================}
{ PROCEDURA: EGA.VGA.DRIVER.PROC                                            }
{                                                                           }
{ Procedura relativa al file 'EGAVGA.OBJ'.                                  }
{===========================================================================}
Procedure EgaVgaDriverProc; external;
{$L EGAVGA.OBJ }


{===========================================================================}
{ PROCEDURA: HERC.DRIVER.PROC                                               }
{                                                                           }
{ Procedura relativa al file 'HERC.OBJ'.                                    }
{===========================================================================}
Procedure HercDriverProc; external;
{$L HERC.OBJ }


{===========================================================================}
{ PROCEDURA: PC3270.DRIVER.PROC                                             }
{                                                                           }
{ Procedura relativa al file 'PC3270.OBJ'.                                  }
{===========================================================================}
Procedure PC3270DriverProc; external;
{$L PC3270.OBJ }


End. { SprDriv }
