{╔══════════════════════════════════════════════════════════════════════════╗   
 ║                                                                          ║   
 ║    ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙    ║
 ║    ∙································································∙    ║
 ║    ∙···············┌──────┐········┌─────────────┐··················∙    ║
 ║    ∙···············│▒▒▒▒▒▒│········│▓▓▓▓▓▓▓▓▓▓▓▓▓└┐·················∙    ║
 ║    ∙···············└─┐▒▒┌─┘········└─┐▓▓┌──────┐▓▓└┐················∙    ║
 ║    ∙·················│▒▒│············│▓▓│······╞ ▓▓│················∙    ║
 ║    ∙·················│▒▒│············│▓▓└──────┘▓▓┌┘················∙    ║
 ║    ∙·················│▒▒│············│▓▓▓▓▓▓▓▓▓▓▓┌┘·················∙    ║
 ║    ∙·················│▒▒│············│▓▓┌────────┘··················∙    ║
 ║    ∙···············┌─┘▒▒└─┐········┌─┘▓▓└─┐·························∙    ║
 ║    ∙···············│▒▒▒▒▒▒│·IMAGE··│▓▓▓▓▓▓│·PROCESSOR···············∙    ║
 ║    ∙···············└──────┘········└──────┘·························∙    ║
 ║    ∙································································∙    ║
 ║    ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙    ║
 ║                                                                          ║
 ║    FOCHI MICHELE                           UNIT KEYBOARD                 ║
 ║    VERSIONE 1.0                                                          ║
 ║                                                                          ║
 ╚══════════════════════════════════════════════════════════════════════════╝}
{ Data:   18 Febbraio 1993
  Ora:    09:08:00
  Autore: Fochi Michele
  File:   Unit KeyboardKeyInitialisation }

{ Unit di definizione dei tasti che si possono premere: tramite queste
  costanti si possono controllare i tasti premuti, senza necessariamente
  conoscerne il codice ASCII. Ad esempio, per attendere uno Shift-F1,
  basta scrivere:

     Repeat
       Tasto1 := ReadKey;
       If (Tasto1 = kNull)
         Then
           Tasto2 := ReadKey;
     Until ((Tasto1 = kNull) And (Tasto2 = kSF1));

  Dato che il tasto è esteso, il primo codice sarà 0 (kNull) e il secondo
  84 (kSF1).

  Per risparmiare memoria, si possono eliminare le costanti dei tasti
  che non vengono utilizzati. }


{ Nome della unit }
Unit
     Keyboard;


{***************************************************************************}
{******************************* INTERFACCIA *******************************}
{***************************************************************************}


{ Dati e procedure accessibili all' utente }
Interface { Keyboard }

{ Units utilizzate }
Uses

     { Routines standard per la gestione dello schermo in modalità testo }
     Crt,

     { Gestione del disco, memoria, chiamate di sistema, ... }
     Dos;

{ Costanti globali della unit }
Const

      { Tasti funzione normali           Tasti funzione + CTRL }
      kF1=       {kNull} #059;           kCF1=     {kNull} #094;
      kF2=       {kNull} #060;           kCF2=     {kNull} #095;
      kF3=       {kNull} #061;           kCF3=     {kNull} #096;
      kF4=       {kNull} #062;           kCF4=     {kNull} #097;
      kF5=       {kNull} #063;           kCF5=     {kNull} #098;
      kF6=       {kNull} #064;           kCF6=     {kNull} #099;
      kF7=       {kNull} #065;           kCF7=     {kNull} #100;
      kF8=       {kNull} #066;           kCF8=     {kNull} #101;
      kF9=       {kNull} #067;           kCF9=     {kNull} #102;
      kF10=      {kNull} #068;           kCF10=    {kNull} #103;
      kF11=      {kNull} #133;           kCF11=    {kNull} #137;
      kF12=      {kNull} #134;           kCF12=    {kNull} #138;

      { Tasti funzione + ALT             Tasti funzione + SHIFT }
      kAF1=      {kNull} #104;           kSF1=     {kNull} #084;
      kAF2=      {kNull} #105;           kSF2=     {kNull} #085;
      kAF3=      {kNull} #106;           kSF3=     {kNull} #086;
      kAF4=      {kNull} #107;           kSF4=     {kNull} #087;
      kAF5=      {kNull} #108;           kSF5=     {kNull} #088;
      kAF6=      {kNull} #109;           kSF6=     {kNull} #089;
      kAF7=      {kNull} #110;           kSF7=     {kNull} #090;
      kAF8=      {kNull} #111;           kSF8=     {kNull} #091;
      kAF9=      {kNull} #112;           kSF9=     {kNull} #092;
      kAF10=     {kNull} #113;           kSF10=    {kNull} #093;
      kAF11=     {kNull} #139;           kSF11=    {kNull} #135;
      kAF12=     {kNull} #140;           kSF12=    {kNull} #136;

      { Lettere A..Z + CTRL              Lettere A..Z + ALT    }
      kCA=               #001;           kAA=      {kNull} #030;
      kCB=               #002;           kAB=      {kNull} #048;
      kCC=               #003;           kAC=      {kNull} #046;
      kCD=               #004;           kAD=      {kNull} #032;
      kCE=               #005;           kAE=      {kNull} #018;
      kCF=               #006;           kAF=      {kNull} #033;
      kCG=               #007;           kAG=      {kNull} #034;
      kCH=               #008;           kAH=      {kNull} #035;
      kCI=               #009;           kAI= 	   {kNull} #023;
      kCJ=               #010;    	 kAJ=      {kNull} #036;
      kCK=               #011;    	 kAK=      {kNull} #037;
      kCL=               #012;    	 kAL=      {kNull} #038;
      kCM=               #013;    	 kAM=      {kNull} #050;
      kCN=               #014;    	 kAN=      {kNull} #049;
      kCO=               #015;    	 kAO=      {kNull} #024;
      kCP=               #016;    	 kAP=      {kNull} #025;
      kCQ=               #017;    	 kAQ=      {kNull} #016;
      kCR=               #018;    	 kAR=      {kNull} #019;
      kCS=               #019;    	 kAS=      {kNull} #031;
      kCT=               #020;    	 kAT=      {kNull} #020;
      kCU=               #021;    	 kAU=      {kNull} #022;
      kCV=               #022;    	 kAV=      {kNull} #047;
      kCW=               #023;    	 kAW=      {kNull} #017;
      kCX=               #024;    	 kAX=      {kNull} #045;
      kCY=               #025;    	 kAY=      {kNull} #021;
      kCZ=               #026;           kAZ=      {kNull} #044;

      { Codici particolari                                     }
      kNull=             #000;
      kEscape=           #027;
      kSpazio=           #032;
      kBeep=             #007;
      kDel=              #008;           kCDel=            #127;
      kTab=              #009;           kSTab=    {kNull} #015;
      kLnFeed=           #010;           kALnFeed= {kNull} #036;
      kReturn=           #013;           kCReturn=         #010;
      kHome=     {kNull} #071;           kCHome=   {kNull} #119;
      kUp=       {kNull} #072;
      kPgUp=     {kNull} #073;           kCPgUp=   {kNull} #132;
      kLeft=     {kNull} #075;           kCLeft=   {kNull} #115;
      kRight=    {kNull} #077;           kCRight=  {kNull} #116;
      kEnd=      {kNull} #079;           kCEnd=    {kNull} #117;
      kDown=     {kNull} #080;
      kPgDown=   {kNull} #081;           kCPgDown= {kNull} #118;
      kInsert=   {kNull} #082;
      kCancel=   {kNull} #083;

      kA0=       {kNull} #129;
      kA1=       {kNull} #120;
      kA2=       {kNull} #121;
      kA3=       {kNull} #122;           kC3=      {kNull} #003;
      kA4=       {kNull} #123;
      kA5=       {kNull} #124;
      kA6=       {kNull} #125;           kC6=              #030;
      kA7=       {kNull} #126;
      kA8=       {kNull} #127;
      kA9=       {kNull} #128;

      kAMeno=    {kNull} #130;
      kAUguale=  {kNull} #131;
      kCPrtScrn= {kNull} #114;


{***************************************************************************}
{***************************** IMPLEMENTAZIONE *****************************}
{***************************************************************************}


{ Dati e procedure disponibili solo all' interno della unit stessa }
Implementation { Keyboard }

End. { Keyboard }
