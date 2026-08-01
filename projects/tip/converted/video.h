/*                                                                         */
/*                                                                         */
/*  La procedura "Diretta" scrive direttamente in memoria video            */
/*  Questa unit (VIDEO.H) viene utilizzata dal programma TIP come          */
/*  supporto ai files convertiti in Turbo C                                */
/*                                                                         */
/*                                                                         */

void Diretta ( char x,
               char y,
               char st [80],
               char colore )

  { /* Diretta */

  textattr(colore);
  gotoxy(x,y);
  cprintf(st);

  } /* Diretta */
