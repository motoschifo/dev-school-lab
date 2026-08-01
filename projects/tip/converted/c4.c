/*                                                                */
/* Questo file è stato creato da T.I.P., scritto da Fochi Michele */
/*                                                                */
/*                                                                */
/* La procedura "Diretta" è nella unit VIDEO.H                    */
/* Le procedure "clrscr()" e "textattr()" e la costante           */
/* "LIGHTGRAY" sono nella unit CONIO.H                            */
/*                                                                */
/* Per eseguire il programma occorrono quindi le seguenti linee   */
/* di codice (nelle prime righe del programma):                   */
/*                                                                */
/*     #include <conio.h>                                         */
/*     #include "video.h"                                         */

void C4()

  { /* C4 */

  /* Cancello lo schermo */
  textattr(LIGHTGRAY);
  clrscr();

  /* Ora viene riempito lo schermo */

  Diretta(1,1,"╔══════════════════════════════════════════════════════════════════════════════╗",14);
  Diretta(1,2,"║",14);
  Diretta(2,2,"                                                                              ",15);
  Diretta(80,2,"║",14);
  Diretta(1,3,"║",14);
  Diretta(2,3,"                                                                              ",15);
  Diretta(80,3,"║",14);
  Diretta(1,4,"║",14);
  Diretta(2,4,"        ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙           ",15);
  Diretta(80,4,"║",14);
  Diretta(1,5,"║",14);
  Diretta(2,5,"        ∙·························································∙           ",15);
  Diretta(80,5,"║",14);
  Diretta(1,6,"║",14);
  Diretta(2,6,"        ∙··",15);
  Diretta(13,6,"┌──────────────┐",13);
  Diretta(29,6,"····",15);
  Diretta(33,6,"┌──────┐",11);
  Diretta(41,6,"·······",15);
  Diretta(48,6,"┌─────────────┐",12);
  Diretta(63,6,"·····∙           ",15);
  Diretta(80,6,"║",14);
  Diretta(1,7,"║",14);
  Diretta(2,7,"        ∙··",15);
  Diretta(13,7,"│",13);
  Diretta(14,7,"░░░░░░░░░░░░░░",15);
  Diretta(28,7,"│",13);
  Diretta(29,7,"····",15);
  Diretta(33,7,"│",11);
  Diretta(34,7,"▒▒▒▒▒▒",15);
  Diretta(40,7,"│",11);
  Diretta(41,7,"·······",15);
  Diretta(48,7,"│",12);
  Diretta(49,7,"▓▓▓▓▓▓▓▓▓▓▓▓▓",15);
  Diretta(62,7,"└┐",12);
  Diretta(64,7,"····∙           ",15);
  Diretta(80,7,"║",14);
  Diretta(1,8,"║",14);
  Diretta(2,8,"        ∙··",15);
  Diretta(13,8,"│",13);
  Diretta(14,8,"░░",15);
  Diretta(16,8,"┌──┐",13);
  Diretta(20,8,"░░",15);
  Diretta(22,8,"┌──┐",13);
  Diretta(26,8,"░░",15);
  Diretta(28,8,"│",13);
  Diretta(29,8,"····",15);
  Diretta(33,8,"└─┐",11);
  Diretta(36,8,"▒▒",15);
  Diretta(38,8,"┌─┘",11);
  Diretta(41,8,"·······",15);
  Diretta(48,8,"└─┐",12);
  Diretta(51,8,"▓▓┌──────┐▓▓",15);
  Diretta(63,8,"└┐",12);
  Diretta(65,8,"···∙           ",15);
  Diretta(80,8,"║",14);
  Diretta(1,9,"║",14);
  Diretta(2,9,"        ∙··",15);
  Diretta(13,9,"└──┘",13);
  Diretta(17,9,"··",15);
  Diretta(19,9,"│",13);
  Diretta(20,9,"░░",15);
  Diretta(22,9,"│",13);
  Diretta(23,9,"··",15);
  Diretta(25,9,"└──┘",13);
  Diretta(29,9,"······",15);
  Diretta(35,9,"│",11);
  Diretta(36,9,"▒▒",15);
  Diretta(38,9,"│",11);
  Diretta(39,9,"···········",15);
  Diretta(50,9,"│",12);
  Diretta(51,9,"▓▓│······╞ ▓▓",15);
  Diretta(64,9,"│",12);
  Diretta(65,9,"···∙           ",15);
  Diretta(80,9,"║",14);
  Diretta(1,10,"║",14);
  Diretta(2,10,"        ∙········",15);
  Diretta(19,10,"│",13);
  Diretta(20,10,"░░",15);
  Diretta(22,10,"│",13);
  Diretta(23,10,"············",15);
  Diretta(35,10,"│",11);
  Diretta(36,10,"▒▒",15);
  Diretta(38,10,"│",11);
  Diretta(39,10,"···········",15);
  Diretta(50,10,"│",12);
  Diretta(51,10,"▓▓└──────┘▓▓",15);
  Diretta(63,10,"┌┘",12);
  Diretta(65,10,"···∙           ",15);
  Diretta(80,10,"║",14);
  Diretta(1,11,"║",14);
  Diretta(2,11,"        ∙········",15);
  Diretta(19,11,"│",13);
  Diretta(20,11,"░░",15);
  Diretta(22,11,"│",13);
  Diretta(23,11,"············",15);
  Diretta(35,11,"│",11);
  Diretta(36,11,"▒▒",15);
  Diretta(38,11,"│",11);
  Diretta(39,11,"···········",15);
  Diretta(50,11,"│",12);
  Diretta(51,11,"▓▓▓▓▓▓▓▓▓▓▓",15);
  Diretta(62,11,"┌┘",12);
  Diretta(64,11,"····∙           ",15);
  Diretta(80,11,"║",14);
  Diretta(1,12,"║",14);
  Diretta(2,12,"        ∙········",15);
  Diretta(19,12,"│",13);
  Diretta(20,12,"░░",15);
  Diretta(22,12,"│",13);
  Diretta(23,12,"············",15);
  Diretta(35,12,"│",11);
  Diretta(36,12,"▒▒",15);
  Diretta(38,12,"│",11);
  Diretta(39,12,"···········",15);
  Diretta(50,12,"│",12);
  Diretta(51,12,"▓▓",15);
  Diretta(53,12,"┌────────┘",12);
  Diretta(63,12,"·····∙           ",15);
  Diretta(80,12,"║",14);
  Diretta(1,13,"║",14);
  Diretta(2,13,"        ∙······",15);
  Diretta(17,13,"┌─┘",13);
  Diretta(20,13,"░░",15);
  Diretta(22,13,"└─┐",13);
  Diretta(25,13,"········",15);
  Diretta(33,13,"┌─┘",11);
  Diretta(36,13,"▒▒",15);
  Diretta(38,13,"└─┐",11);
  Diretta(41,13,"·······",15);
  Diretta(48,13,"┌─┘",12);
  Diretta(51,13,"▓▓",15);
  Diretta(53,13,"└─┐",12);
  Diretta(56,13,"············∙           ",15);
  Diretta(80,13,"║",14);
  Diretta(1,14,"║",14);
  Diretta(2,14,"        ∙······",15);
  Diretta(17,14,"│",13);
  Diretta(18,14,"░░░░░░",15);
  Diretta(24,14,"│",13);
  Diretta(25,14,"·TEXT···",15);
  Diretta(33,14,"│",11);
  Diretta(34,14,"▒▒▒▒▒▒",15);
  Diretta(40,14,"│",11);
  Diretta(41,14,"·IMAGE·",15);
  Diretta(48,14,"│",12);
  Diretta(49,14,"▓▓▓▓▓▓",15);
  Diretta(55,14,"│",12);
  Diretta(56,14,"·PROCESSOR··∙           ",15);
  Diretta(80,14,"║",14);
  Diretta(1,15,"║",14);
  Diretta(2,15,"        ∙······",15);
  Diretta(17,15,"└──────┘",13);
  Diretta(25,15,"········",15);
  Diretta(33,15,"└──────┘",11);
  Diretta(41,15,"·······",15);
  Diretta(48,15,"└──────┘",12);
  Diretta(56,15,"············∙           ",15);
  Diretta(80,15,"║",14);
  Diretta(1,16,"║",14);
  Diretta(2,16,"        ∙·························································∙           ",15);
  Diretta(80,16,"║",14);
  Diretta(1,17,"║",14);
  Diretta(2,17,"        ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙           ",15);
  Diretta(80,17,"║",14);
  Diretta(1,18,"║",14);
  Diretta(2,18,"                                                                              ",15);
  Diretta(80,18,"║",14);
  Diretta(1,19,"║",14);
  Diretta(2,19,"                                                                              ",15);
  Diretta(80,19,"║",14);
  Diretta(1,20,"║",14);
  Diretta(2,20,"        FOCHI MICHELE & AMATULLI DAVIDE                                       ",15);
  Diretta(80,20,"║",14);
  Diretta(1,21,"║",14);
  Diretta(2,21,"        VERSIONE 1.0                                                          ",15);
  Diretta(80,21,"║",14);
  Diretta(1,22,"║",14);
  Diretta(2,22,"                                                                              ",15);
  Diretta(80,22,"║",14);
  Diretta(1,23,"║",14);
  Diretta(2,23,"                                                                              ",15);
  Diretta(80,23,"║",14);
  Diretta(1,24,"╚══════════════════════════════════════════════════════════════════════════════╝",14);

  } /* C4 */

