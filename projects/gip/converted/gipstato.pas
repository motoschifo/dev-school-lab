Unit GIPStato;

Interface { GIPStato }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit,GIPGraph,GIPProc,
     GIPAppPrc, GIPImage, GIPShape, GIPFile;


Procedure EseguiStato ( Stato: TipoStato);


Implementation { GIPStato }


Procedure EseguiStato ( Stato: TipoStato);
Begin { EseguiStato }

With Icone^[IcnAttivo] Do
  PutImage(x,y,Icn^,NormalPut);

CambioMouse := True;

If (Stato = sAttesa)
  Then
    Stato := OldStato;

If Not Disegno
  Then
    If (Stato In [(*sZoomPiu,sZoomMeno,sZoomNorm,*) sBlockMemorizza,
       sBlockRichiama,sBlockCopia,sCerchio,sCerchioPieno,sRettangolo,
       sRettangoloPieno,sPoligono,sPoligonoPieno,sSettore,sSettorePieno,
       sArco,sRedraw,sArcoCorda,sRiempimento,sSceltaOggetti,
       sDisegnoLibero])
         Then
           Stato := sAttesa;

Case Stato Of
  sAttesa:            { Niente da fare: attesa };
  (*sZoomPiu:           {pZoomPiu};
  sZoomNorm:          {pZoomNorm};
  sZoomMeno:          {pZoomMeno};*)
  sBlockMemorizza:    {pBlockMemorizza};
  sBlockRichiama:     {pBlockRichiama};
  sBlockSposta:       {pBlockSposta};
  sBlockCopia:        {pBlockCopia};
  sCerchio:           pCerchio(Vuoto);
  sCerchioPieno:      pCerchio(Pieno);
  sRettangolo:        pRettangolo(Vuoto);
  sRettangoloPieno:   pRettangolo(Pieno);
  sPoligono:          pPoligono(Vuoto);
  sPoligonoPieno:     pPoligono(Pieno);
  sDiscoLeggi:        pDiscoLeggi;
  sDiscoSalva:        pDiscoSalva;
  sDiscoNuovo:        pDiscoNuovo;
  sDiscoEsci:         pDiscoEsci;
  sConvTurboC:        pConvTurboC;
  sConvTurboPascal:   pConvTurboPascal;
  sConvTurboAsm:      pConvTurboAsm;
  sUserCharSize:      pUserCharSize;
  sSettore:           pSettore(Vuoto);
  sSettorePieno:      pSettore(Pieno);
  sArco:              pArco(Pieno);
  sArcoCorda:         pArco(Vuoto);
  sRiempimento:       pRiempimento;
  sUserDefinedFill:   pUserDefinedFill;
  sUserDefinedLn:     pUserDefinedLn;
  sSceltaOggetti:     {pSceltaOggetti};
  sDisegnoLibero:     pDisegnoLibero;
  sHelpOnLine:        pHelpOnLine;
  sDiscoStampa:       {pDiscoStampa};
  sNewPalette:        pNewPalette;
  sHelpPrecedente:    pHelpPrecedente;
  sHelpIndice:        pHelpIndice;
  sHelpGIP:           pHelpGIP;
  sLinea:             pLinea;
  sRettangolo3D:      pRettangolo3D(Vuoto);
  sRettangolo3DPieno: pRettangolo3D(Pieno);
  sTesto:             pTesto;
  sOrologio:          pClock;
  sSfondoImmagine:    pSfondoImmagine;
  sRedraw:            {...};
  sMovPrimo:          pMovPrimo;
  sMovPrec:           pMovPrec;
  sMovSucc:           pMovSucc;
  sMovUltimo:         pMovUltimo;
  sMovDelete:         pMovDelete;
  sDiscoPaletteLeggi: pDiscoPaletteLeggi;
  sDiscoPaletteSalva: pDiscoPaletteSalva;
  End; { Case Stato }

End; { EseguiStato }


End. { GIPStato }
