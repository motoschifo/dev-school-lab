{ Essa contiene procedure e funzioni per il programma necessarie per         }
{ 'linkare' i driver dei vari tipi di font (parte 3).                        }

Unit GIPFont3;

Interface { GIPFont3 }


{===========================================================================}
{ PROCEDURA: LCOM.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'LCOM.CHR'.                                    }
{===========================================================================}
Procedure LComFont;


{===========================================================================}
{ PROCEDURA: EURO.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'EURO.CHR'.                                    }
{===========================================================================}
Procedure EuroFont;


{===========================================================================}
{ PROCEDURA: BOLD.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'BOLD.CHR'.                                    }
{===========================================================================}
Procedure BoldFont;


Implementation { GIPFont3 }


{===========================================================================}
{ PROCEDURA: LCOM.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'LCOM.CHR'.                                    }
{===========================================================================}
Procedure LComFont; External;
{$L LCOM.OBJ }


{===========================================================================}
{ PROCEDURA: EURO.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'EURO.CHR'.                                    }
{===========================================================================}
Procedure EuroFont; External;
{$L EURO.OBJ }


{===========================================================================}
{ PROCEDURA: BOLD.FONT                                                      }
{                                                                           }
{ Procedura relativa al file 'BOLD.CHR'.                                    }
{===========================================================================}
Procedure BoldFont; External;
{$L BOLD.OBJ }


End. { GIPFont3 }
