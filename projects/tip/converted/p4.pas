{                                                                }
{ Questo file è stato creato da T.I.P., scritto da Fochi Michele }
{                                                                }
{                                                                }
{ La procedura "ClrScr" e le costanti "TextAttr" e "LightGray"   }
{ sono nella unit CRT.TPU.                                       }
{ La procedura "WriteStr" è nella unit VIDEO.TPU.                }
{                                                                }
{ Per eseguire il programma occorre quindi la seguente linea     }
{ di codice (nelle prime righe del programma):                   }
{                                                                }
{     Uses Crt,Video;                                            }

Procedure P4;

Begin { P4 }

{ Cancello lo schermo }
TextAttr := LightGray;
ClrScr;

{ Ora viene riempito lo schermo }

WriteStr(01,01,'╔══════════════════════════════════════════════════════════════════════════════╗',014);
WriteStr(01,02,'║',014);
WriteStr(02,02,'                                                                              ',015);
WriteStr(80,02,'║',014);
WriteStr(01,03,'║',014);
WriteStr(02,03,'                                                                              ',015);
WriteStr(80,03,'║',014);
WriteStr(01,04,'║',014);
WriteStr(02,04,'        ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙           ',015);
WriteStr(80,04,'║',014);
WriteStr(01,05,'║',014);
WriteStr(02,05,'        ∙·························································∙           ',015);
WriteStr(80,05,'║',014);
WriteStr(01,06,'║',014);
WriteStr(02,06,'        ∙··',015);
WriteStr(13,06,'┌──────────────┐',013);
WriteStr(29,06,'····',015);
WriteStr(33,06,'┌──────┐',011);
WriteStr(41,06,'·······',015);
WriteStr(48,06,'┌─────────────┐',012);
WriteStr(63,06,'·····∙           ',015);
WriteStr(80,06,'║',014);
WriteStr(01,07,'║',014);
WriteStr(02,07,'        ∙··',015);
WriteStr(13,07,'│',013);
WriteStr(14,07,'░░░░░░░░░░░░░░',015);
WriteStr(28,07,'│',013);
WriteStr(29,07,'····',015);
WriteStr(33,07,'│',011);
WriteStr(34,07,'▒▒▒▒▒▒',015);
WriteStr(40,07,'│',011);
WriteStr(41,07,'·······',015);
WriteStr(48,07,'│',012);
WriteStr(49,07,'▓▓▓▓▓▓▓▓▓▓▓▓▓',015);
WriteStr(62,07,'└┐',012);
WriteStr(64,07,'····∙           ',015);
WriteStr(80,07,'║',014);
WriteStr(01,08,'║',014);
WriteStr(02,08,'        ∙··',015);
WriteStr(13,08,'│',013);
WriteStr(14,08,'░░',015);
WriteStr(16,08,'┌──┐',013);
WriteStr(20,08,'░░',015);
WriteStr(22,08,'┌──┐',013);
WriteStr(26,08,'░░',015);
WriteStr(28,08,'│',013);
WriteStr(29,08,'····',015);
WriteStr(33,08,'└─┐',011);
WriteStr(36,08,'▒▒',015);
WriteStr(38,08,'┌─┘',011);
WriteStr(41,08,'·······',015);
WriteStr(48,08,'└─┐',012);
WriteStr(51,08,'▓▓┌──────┐▓▓',015);
WriteStr(63,08,'└┐',012);
WriteStr(65,08,'···∙           ',015);
WriteStr(80,08,'║',014);
WriteStr(01,09,'║',014);
WriteStr(02,09,'        ∙··',015);
WriteStr(13,09,'└──┘',013);
WriteStr(17,09,'··',015);
WriteStr(19,09,'│',013);
WriteStr(20,09,'░░',015);
WriteStr(22,09,'│',013);
WriteStr(23,09,'··',015);
WriteStr(25,09,'└──┘',013);
WriteStr(29,09,'······',015);
WriteStr(35,09,'│',011);
WriteStr(36,09,'▒▒',015);
WriteStr(38,09,'│',011);
WriteStr(39,09,'···········',015);
WriteStr(50,09,'│',012);
WriteStr(51,09,'▓▓│······╞ ▓▓',015);
WriteStr(64,09,'│',012);
WriteStr(65,09,'···∙           ',015);
WriteStr(80,09,'║',014);
WriteStr(01,10,'║',014);
WriteStr(02,10,'        ∙········',015);
WriteStr(19,10,'│',013);
WriteStr(20,10,'░░',015);
WriteStr(22,10,'│',013);
WriteStr(23,10,'············',015);
WriteStr(35,10,'│',011);
WriteStr(36,10,'▒▒',015);
WriteStr(38,10,'│',011);
WriteStr(39,10,'···········',015);
WriteStr(50,10,'│',012);
WriteStr(51,10,'▓▓└──────┘▓▓',015);
WriteStr(63,10,'┌┘',012);
WriteStr(65,10,'···∙           ',015);
WriteStr(80,10,'║',014);
WriteStr(01,11,'║',014);
WriteStr(02,11,'        ∙········',015);
WriteStr(19,11,'│',013);
WriteStr(20,11,'░░',015);
WriteStr(22,11,'│',013);
WriteStr(23,11,'············',015);
WriteStr(35,11,'│',011);
WriteStr(36,11,'▒▒',015);
WriteStr(38,11,'│',011);
WriteStr(39,11,'···········',015);
WriteStr(50,11,'│',012);
WriteStr(51,11,'▓▓▓▓▓▓▓▓▓▓▓',015);
WriteStr(62,11,'┌┘',012);
WriteStr(64,11,'····∙           ',015);
WriteStr(80,11,'║',014);
WriteStr(01,12,'║',014);
WriteStr(02,12,'        ∙········',015);
WriteStr(19,12,'│',013);
WriteStr(20,12,'░░',015);
WriteStr(22,12,'│',013);
WriteStr(23,12,'············',015);
WriteStr(35,12,'│',011);
WriteStr(36,12,'▒▒',015);
WriteStr(38,12,'│',011);
WriteStr(39,12,'···········',015);
WriteStr(50,12,'│',012);
WriteStr(51,12,'▓▓',015);
WriteStr(53,12,'┌────────┘',012);
WriteStr(63,12,'·····∙           ',015);
WriteStr(80,12,'║',014);
WriteStr(01,13,'║',014);
WriteStr(02,13,'        ∙······',015);
WriteStr(17,13,'┌─┘',013);
WriteStr(20,13,'░░',015);
WriteStr(22,13,'└─┐',013);
WriteStr(25,13,'········',015);
WriteStr(33,13,'┌─┘',011);
WriteStr(36,13,'▒▒',015);
WriteStr(38,13,'└─┐',011);
WriteStr(41,13,'·······',015);
WriteStr(48,13,'┌─┘',012);
WriteStr(51,13,'▓▓',015);
WriteStr(53,13,'└─┐',012);
WriteStr(56,13,'············∙           ',015);
WriteStr(80,13,'║',014);
WriteStr(01,14,'║',014);
WriteStr(02,14,'        ∙······',015);
WriteStr(17,14,'│',013);
WriteStr(18,14,'░░░░░░',015);
WriteStr(24,14,'│',013);
WriteStr(25,14,'·TEXT···',015);
WriteStr(33,14,'│',011);
WriteStr(34,14,'▒▒▒▒▒▒',015);
WriteStr(40,14,'│',011);
WriteStr(41,14,'·IMAGE·',015);
WriteStr(48,14,'│',012);
WriteStr(49,14,'▓▓▓▓▓▓',015);
WriteStr(55,14,'│',012);
WriteStr(56,14,'·PROCESSOR··∙           ',015);
WriteStr(80,14,'║',014);
WriteStr(01,15,'║',014);
WriteStr(02,15,'        ∙······',015);
WriteStr(17,15,'└──────┘',013);
WriteStr(25,15,'········',015);
WriteStr(33,15,'└──────┘',011);
WriteStr(41,15,'·······',015);
WriteStr(48,15,'└──────┘',012);
WriteStr(56,15,'············∙           ',015);
WriteStr(80,15,'║',014);
WriteStr(01,16,'║',014);
WriteStr(02,16,'        ∙·························································∙           ',015);
WriteStr(80,16,'║',014);
WriteStr(01,17,'║',014);
WriteStr(02,17,'        ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙           ',015);
WriteStr(80,17,'║',014);
WriteStr(01,18,'║',014);
WriteStr(02,18,'                                                                              ',015);
WriteStr(80,18,'║',014);
WriteStr(01,19,'║',014);
WriteStr(02,19,'                                                                              ',015);
WriteStr(80,19,'║',014);
WriteStr(01,20,'║',014);
WriteStr(02,20,'        FOCHI MICHELE & AMATULLI DAVIDE                                       ',015);
WriteStr(80,20,'║',014);
WriteStr(01,21,'║',014);
WriteStr(02,21,'        VERSIONE 1.0                                                          ',015);
WriteStr(80,21,'║',014);
WriteStr(01,22,'║',014);
WriteStr(02,22,'                                                                              ',015);
WriteStr(80,22,'║',014);
WriteStr(01,23,'║',014);
WriteStr(02,23,'                                                                              ',015);
WriteStr(80,23,'║',014);
WriteStr(01,24,'╚══════════════════════════════════════════════════════════════════════════════╝',014);

End; { P4 }

