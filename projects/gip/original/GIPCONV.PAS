Unit GIPConv;

Interface { GIPConv }

Uses
     Crt,Dos,Keyboard,Graph,GIPFast,Mouse,GIPVars,GIPInit,GIPGraph,GIPAppPrc,
     GIPBase,GIPImage,GIPShape,GIPFile;


Procedure ConvertiFile ( Ling: TipoLing );


Implementation { GIPConv }


Procedure ConvertiFile ( Ling: TipoLing );
Var Name:        String080;
    Ex:          ExtStr;
    St:          String;
    Over:        Boolean;
    F:           Text;
    N:           NameStr;
    E:           ExtStr;
    D:           DirStr;
    AppOp:       PTROperation;
    AppSt:       PTRStrings;
    Trovato:     Boolean;
    ScriviPrimo: Boolean;
    OldLineSt:   Word;
    OldLinePt:   Word;
    OldLineTh:   Word;
    OldRetino:   Word;
    OldColRet:   Word;
    OldColLin:   Word;
    OldFillPa:   FillPatternType;
    Uscita:      Boolean;

     Procedure Intestazione;
     Var
         St1:         String[3];
         St2:         String[3];
         St3:         String[3];
         I:           Byte;
         J:           Byte;
     Begin { Intestazione }
     Case Ling Of
       lTurboPascal: Begin
                     WriteLn(F,'{============================================================================}');
                     WriteLn(F,'{                                                                            }');
                     WriteLn(F,'{ QUESTO FILE E'' STATO CREATO DAL PROGRAMMA G.I.P.                           }');
                     WriteLn(F,'{                                                                            }');
                     WriteLn(F,'{ G.I.P Š uno dei 3 programmi della tesina per l'' anno scolastico 1992/93    }');
                     WriteLn(F,'{ del gruppo Fochi Michele e Amatulli Davide.                                }');
                     WriteLn(F,'{                                                                            }');
                     WriteLn(F,'{ I programmi sono stati scritti da Fochi Michele in Turbo Pascal.           }');
                     WriteLn(F,'{                                                                            }');
                     WriteLn(F,'{============================================================================}');
                     WriteLn(F,'Program Immagine;');
                     WriteLn(F);
                     WriteLn(F,'Uses Crt, Graph;');
                     WriteLn(F);
                     WriteLn(F,'Var Gd:       Integer;');
                     WriteLn(F,'    Gm:       Integer;');
                     WriteLn(F,'    Poly:     Array [1..',MaxPolyPoints,'] Of PointType;');
                     WriteLn(F,'    ArcC:     ArcCoordsType;');
                     WriteLn(F,'    FillPatt: FillPatternType;');
                     WriteLn(F,'    I:        Byte;');
                     WriteLn(F);
                     WriteLn(F,'Begin {* MAIN *}');
                     WriteLn(F,'Gd := Detect;');
                     WriteLn(F,'Gm := Detect;');
                     WriteLn(F,'InitGraph(Gd,Gm,'''');');
                     WriteLn(F,'');
                     WriteLn(F,'For i := Black To White Do');
                     WriteLn(F,'  SetPalette(i,i);');
                     WriteLn(F,'');
                     For i := Black To White Do
                       With Setup.Palette[i] Do
                         Begin
                         Str(Red:3,St1);
                         If (St1[1] = ' ')
                           Then
                             St1[1] := '0';
                         If (St1[2] = ' ')
                           Then
                             St1[2] := '0';
                         Str(Green:3,St2);
                         If (St2[1] = ' ')
                           Then
                             St2[1] := '0';
                         If (St2[2] = ' ')
                           Then
                             St2[2] := '0';
                         Str(Blue:3,St3);
                         If (St3[1] = ' ')
                           Then
                             St3[1] := '0';
                         If (St3[2] = ' ')
                           Then
                             St3[2] := '0';
                         Write(F,'SetRGBPalette(',VetCol[i],',');
                         For j := Length(VetCol[i]) To 12 Do
                           Write(F,' ');
                         WriteLn(F,St1,',',St2,',',St3,');');
                         End;
                     WriteLn(F,'');
                     WriteLn(F,'SetBkColor(Black);');
                     WriteLn(F,'SetFillStyle(SolidFill,',VetCol[ColorImage],');');
                     WriteLn(F,'Bar(0,0,GetMaxX,GetMaxY);');
                     End;
       lTurboC: Begin
                WriteLn(F,'/*=========================================================================*/');
                WriteLn(F,'/*                                                                         */');
                WriteLn(F,'/* QUESTO FILE E'' STATO CREATO DAL PROGRAMMA G.I.P.                        */');
                WriteLn(F,'/*                                                                         */');
                WriteLn(F,'/* G.I.P Š uno dei 3 programmi della tesina per l'' anno scolastico 1992/93 */');
                WriteLn(F,'/* del gruppo Fochi Michele e Amatulli Davide.                             */');
                WriteLn(F,'/*                                                                         */');
                WriteLn(F,'/* I programmi sono stati scritti da Fochi Michele in Turbo Pascal.        */');
                WriteLn(F,'/*                                                                         */');
                WriteLn(F,'/*=========================================================================*/');
                WriteLn(F,'#include <conio.h>');
                WriteLn(F,'#include <graphics.h>');
                WriteLn(F);
                WriteLn(F,'void main()');
                WriteLn(F);
                WriteLn(F,'  { /* MAIN */');
                WriteLn(F,'   int                    Gd;');
                WriteLn(F,'   int                    Gm;');
                WriteLn(F,'   int                    Poly[',MaxPolyPoints*2,'];');
                WriteLn(F,'   struct arccoordstype   ArcC;');
                WriteLn(F,'   char                   FillPatt[8];');
                WriteLn(F,'   char                   i;');
                WriteLn(F);
                WriteLn(F,'  Gd = DETECT;');
                WriteLn(F,'  Gm = DETECT;');
                WriteLn(F,'  initgraph(&Gd,&Gm,"");');
                WriteLn(F,'');
                WriteLn(F,'  for (i=BLACK; i<=WHITE; i++)');
                WriteLn(F,'    setpalette(i,i);');
                WriteLn(F,'');
                For i := Black To White Do
                  With Setup.Palette[i] Do
                    Begin
                    Str(Red,St1);
                    Str(Green,St2);
                    Str(Blue,St3);
                    Write(F,'  setrgbpalette(',VetColC[i],',');
                    For j := Length(VetCol[i]) To 12 Do
                      Write(F,' ');
                    WriteLn(F,St1,',',St2,',',St3,');');
                    End;
                WriteLn(F,'');
                WriteLn(F,'  setbkcolor(BLACK);');
                WriteLn(F,'  setfillstyle(SOLID_FILL,',VetColC[ColorImage],');');
                WriteLn(F,'  bar(0,0,getmaxx(),getmaxy());');
                End;
       lTurboAsm: ;
       End;
     End; { Intestazione }


     Procedure Termine;
     Begin { Termine }
     Case Ling Of
       lTurboPascal: Begin
                     WriteLn(F,'');
                     WriteLn(F,'ReadLn;');
                     WriteLn(F,'GraphDefaults;');
                     WriteLn(F,'CloseGraph;');
                     WriteLn(F,'End. {* MAIN *}');
                     End;
       lTurboC: Begin
                WriteLn(F,'');
                WriteLn(F,'  while (!kbhit()) /* attesa... */');
                WriteLn(F,'  graphdefaults();');
                WriteLn(F,'  closegraph();');
                WriteLn(F,'  } /* MAIN */');
                End;
       lTurboAsm: ;
       End;
     End; { Termine }


     Procedure Decodifica ( Var AppOp: PTROperation );
     Var I:      Word;
         NumPti: Word;
         Diverso: Boolean;
         AltezzaX,AltezzaY: Integer;
         Quad: Byte;
     Begin { Decodifica }
     Case Ling Of
       lTurboPascal: With AppOp^.Op Do
                       Begin

                       If ((LineSt <> OldLineSt) Or (LinePt <> OldLinePt) Or
                           (LineTh <> OldLineTh) Or ScriviPrimo) And
                           ((LineSt In [0..4]) And (LineTh In [1..3]))
                             Then
                               WriteLn(F,'SetLineStyle(',VetLin[LineSt],',',LinePt,',',VetThi[LineTh],');');
                       If ((ColLin <> OldColLin) Or ScriviPrimo) And
                          (ColLin In [0..15])
                            Then
                              WriteLn(F,'SetColor(',VetCol[ColLin],');');
                       If (OldFillPa[1] <> Setup.UserPattern[1]) Or
                          (OldFillPa[2] <> Setup.UserPattern[2]) Or
                          (OldFillPa[3] <> Setup.UserPattern[3]) Or
                          (OldFillPa[4] <> Setup.UserPattern[4]) Or
                          (OldFillPa[5] <> Setup.UserPattern[5]) Or
                          (OldFillPa[6] <> Setup.UserPattern[6]) Or
                          (OldFillPa[7] <> Setup.UserPattern[7]) Or
                          (OldFillPa[8] <> Setup.UserPattern[8])
                            Then Diverso := True
                       Else
                         Diverso := False;

                       If ((Retino <> OldRetino) Or (ColRet <> OldColRet) Or
                          Diverso Or
                          ScriviPrimo) And ((Retino In [0..12]) And
                          (ColRet In [0..15]))
                            Then
                              Begin
                              If (Retino = UserFill)
                                Then
                                  Begin
                                  WriteLn(F,'SetFillStyle(UserFill,',VetCol[ColRet],');');
                                  WriteLn(F,'SetFillPattern(FillPatt,',VetCol[ColRet],');');
                                  End
                               Else
                                 WriteLn(F,'SetFillStyle(',VetFil[Retino],',',VetCol[ColRet],');');
                              End;

                       OldLineSt := LineSt;
                       OldLinePt := LinePt;
                       OldLineTh := LineTh;
                       OldColLin := ColLin;
                       OldRetino := Retino;
                       OldColRet := ColRet;
                       OldFillPa := Setup.UserPattern;

                       Case Figura Of
                         fArcoCorda,
                         fArco: Begin
                                WriteLn(F,'Ellipse(',Word1,',',Word2,',',Word5,',',Word6,',',Word3,',',Word4,');');
                                If (Figura = fArcoCorda)
                                  Then
                                    Begin
                                    WriteLn(F,'GetArcCoords(ArcC);');
                                    WriteLn(F,'With ArcC Do');
                                    WriteLn(F,'  Line(XStart,YStart,XEnd,YEnd);');
                                    End;
                                End;
                         fRettangoloPieno: Begin
                                           WriteLn(F,'Bar(',Word1,',',Word2,',',Word3,',',Word4,');');
                                           WriteLn(F,'Rectangle(',Word1,',',Word2,',',Word3,',',Word4,');');
                                           End;
                         fRettangolo: WriteLn(F,'Rectangle(',Word1,',',Word2,',',Word3,',',Word4,');');
                         fPoligonoPieno,
                         fPoligono: Begin
                                    NumPti := Word1;
                                    i := 1;
                                    Repeat
                                      AppOp := AppOp^.Next;
                                      With AppOp^.Op Do
                                        If (i <= NumPti) And (Word1 <> NUW) And (Word2 <> NUW)
                                          Then
                                            Begin
                                            WriteLn(F,'Poly[',i,'].X := ',Word1,';');
                                            WriteLn(F,'Poly[',i,'].Y := ',Word2,';');
                                            Inc(i);
                                            If (i <= NumPti) And (Word3 <> NUW) And (Word4 <> NUW)
                                              Then
                                                Begin
                                                WriteLn(F,'Poly[',i,'].X := ',Word3,';');
                                                WriteLn(F,'Poly[',i,'].Y := ',Word4,';');
                                                Inc(i);
                                                If (i <= NumPti) And (Word5 <> NUW) And (Word6 <> NUW)
                                                  Then
                                                    Begin
                                                    WriteLn(F,'Poly[',i,'].X := ',Word5,';');
                                                    WriteLn(F,'Poly[',i,'].Y := ',Word6,';');
                                                    Inc(i);
                                                    End;
                                                End;
                                            End;

                                    Until (i > NumPti);

                                    If (Figura = fPoligonoPieno)
                                      Then
                                        WriteLn(F,'FillPoly(',NumPti,',Poly);')
                                    Else
                                      WriteLn(F,'DrawPoly(',NumPti,',Poly);');
                                    End;
                         fCerchio: WriteLn(F,'Ellipse(',Word1,',',Word2,',0,360,',Word3,',',Word4,');');
                         fCerchioPieno: WriteLn(F,'FillEllipse(',Word1,',',Word2,',',Word3,',',Word4,');');
                         fRiempimento: WriteLn(F,'FloodFill(',Word1,',',Word2,',',Word3,');');
                         fLinea: WriteLn(F,'Line(',Word1,',',Word2,',',Word3,',',Word4,');');
                         fDisegnoLibero: WriteLn(F,'PutPixel(',Word1,',',Word2,',',Word3,');');
                         fTestoInizio: Begin

                                       WriteLn(F,'SetTextStyle(',VetFont[Word1],',',VetDir[Word2],',',Word3,');');
                                       WriteLn(F,'SetTextJustify(',VetHoriz[Word5],',',VetVert[Word6],');');

                                       AppSt := InizioSt;
                                       St := StrNull;
                                       Trovato := False;
                                       While (AppSt <> NIL) And (Not Trovato) Do
                                         Begin
                                         If (AppSt^.St.Num = Word4)
                                           Then
                                             Begin
                                             Trovato := True;
                                             St := AppSt^.St.St;
                                             End;
                                         AppSt := AppSt^.Next;
                                         End;

                                       AppOp := AppOp^.Next;
                                       With AppOp^.Op Do
                                         Begin
                                         If (Word1 <> 1) Or (Word2 <> 1) Or (Word3 <> 1) Or (Word4 <> 1)
                                           Then
                                             WriteLn(F,'SetUserCharSize(',Word1,',',Word2,',',Word3,',',Word4,');');
                                         WriteLn(F,'OutTextXY(',Word5,',',Word6,',''',St,''');');
                                         End;

                                       End;
                         fSettore: Begin
                                   WriteLn(F,'Ellipse(',Word1,',',Word2,',',Word3,',',Word4,',',Word5,',',Word6,');');
                                   WriteLn(F,'GetArcCoords(ArcC);');
                                   WriteLn(F,'With ArcC Do');
                                   WriteLn(F,'  Begin');
                                   WriteLn(F,'  Line(XStart,YStart,X,Y);');
                                   WriteLn(F,'  Line(XEnd,YEnd,X,Y);');
                                   WriteLn(F,'  End;');
                                   End;
                         fSettorePieno: WriteLn(F,'Sector(',Word1,',',Word2,',',Word3,',',Word4,',',Word5,',',Word6,');');
                         fRettangolo3DPieno,
                         fRettangolo3D: Begin
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'Bar(',Word1,',',Word2,',',Word3,',',Word4,');');
                                        WriteLn(F,'Rectangle(',Word1,',',Word2,',',Word3,',',Word4,');');
                                        AltezzaX := Word5;
                                        AltezzaY := Word6 Mod 5000;
                                        Quad := Word6 Div 5000;
                                        Case Quad Of
                                          1: Begin
                                             WriteLn(F,'Poly[1].X := ',Word1,';');
                                             WriteLn(F,'Poly[1].Y := ',Word2,';');
                                             WriteLn(F,'Poly[2].X := ',Word1-AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word2-AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word3-AltezzaX,';');
                                             WriteLn(F,'Poly[3].Y := ',Word2-AltezzaY,';');
                                             WriteLn(F,'Poly[4].X := ',Word3,';');
                                             WriteLn(F,'Poly[4].Y := ',Word2,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(4,Poly);');
                                             WriteLn(F,'Poly[4] := Poly[1];');
                                             WriteLn(F,'Poly[1].X := ',Word1-AltezzaX,';');
                                             WriteLn(F,'Poly[1].Y := ',Word2-AltezzaY,';');
                                             WriteLn(F,'Poly[2].X := ',Word1-AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word4-AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word1,';');
                                             WriteLn(F,'Poly[3].Y := ',Word4,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(3,Poly);');
                                             End;
                                          2: Begin
                                             WriteLn(F,'Poly[1].X := ',Word1,';');
                                             WriteLn(F,'Poly[1].Y := ',Word2,';');
                                             WriteLn(F,'Poly[2].X := ',Word1+AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word2-AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word3+AltezzaX,';');
                                             WriteLn(F,'Poly[3].Y := ',Word2-AltezzaY,';');
                                             WriteLn(F,'Poly[4].X := ',Word3,';');
                                             WriteLn(F,'Poly[4].Y := ',Word2,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(4,Poly);');

                                             WriteLn(F,'Poly[1].X := ',Word3+AltezzaX,';');
                                             WriteLn(F,'Poly[1].Y := ',Word2-AltezzaY,';');
                                             WriteLn(F,'Poly[2].X := ',Word3+AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word4-AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word3,';');
                                             WriteLn(F,'Poly[3].Y := ',Word4,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(3,Poly);');
                                             End;
                                          3: Begin
                                             WriteLn(F,'Poly[1].X := ',Word1,';');
                                             WriteLn(F,'Poly[1].Y := ',Word4,';');
                                             WriteLn(F,'Poly[2].X := ',Word1+AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word4+AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word3+AltezzaX,';');
                                             WriteLn(F,'Poly[3].Y := ',Word4+AltezzaY,';');
                                             WriteLn(F,'Poly[4].X := ',Word3,';');
                                             WriteLn(F,'Poly[4].Y := ',Word4,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(4,Poly);');

                                             WriteLn(F,'Poly[1].X := ',Word3+AltezzaX,';');
                                             WriteLn(F,'Poly[1].Y := ',Word4+AltezzaY,';');
                                             WriteLn(F,'Poly[2].X := ',Word3+AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word2+AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word3,';');
                                             WriteLn(F,'Poly[3].Y := ',Word2,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(3,Poly);');
                                             End;
                                          4: Begin
                                             WriteLn(F,'Poly[1].X := ',Word1,';');
                                             WriteLn(F,'Poly[1].Y := ',Word4,';');
                                             WriteLn(F,'Poly[2].X := ',Word1-AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word4+AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word3-AltezzaX,';');
                                             WriteLn(F,'Poly[3].Y := ',Word4+AltezzaY,';');
                                             WriteLn(F,'Poly[4].X := ',Word3,';');
                                             WriteLn(F,'Poly[4].Y := ',Word4,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(4,Poly);');

                                             WriteLn(F,'Poly[4] := Poly[1];');
                                             WriteLn(F,'Poly[1].X := ',Word1-AltezzaX,';');
                                             WriteLn(F,'Poly[1].Y := ',Word4+AltezzaY,';');
                                             WriteLn(F,'Poly[2].X := ',Word1-AltezzaX,';');
                                             WriteLn(F,'Poly[2].Y := ',Word2+AltezzaY,';');
                                             WriteLn(F,'Poly[3].X := ',Word1,';');
                                             WriteLn(F,'Poly[3].Y := ',Word2,';');
                                             If (Figura = fRettangolo3DPieno)
                                               Then
                                                 WriteLn(F,'FillPoly(4,Poly);')
                                             Else
                                               WriteLn(F,'DrawPoly(3,Poly);');
                                             End;
                                          End; { Case Quad }

                                        End;
                         fUserFill: Begin
                                    WriteLn(F,'FillPatt[1] := ',LineSt,';');
                                    WriteLn(F,'FillPatt[2] := ',LinePt,';');
                                    WriteLn(F,'FillPatt[3] := ',LineTh,';');
                                    WriteLn(F,'FillPatt[4] := ',ColLin,';');
                                    WriteLn(F,'FillPatt[5] := ',Retino,';');
                                    WriteLn(F,'FillPatt[6] := ',ColRet,';');
                                    WriteLn(F,'FillPatt[7] := ',Word1,';');
                                    WriteLn(F,'FillPatt[8] := ',Word2,';');
                                    Setup.Pattern := UserFill;
                                    End;


                         End;
                       End;
       lTurboC: With AppOp^.Op Do
                  Begin

                  If ((LineSt <> OldLineSt) Or (LinePt <> OldLinePt) Or
                      (LineTh <> OldLineTh) Or ScriviPrimo) And
                      ((LineSt In [0..4]) And (LineTh In [1..3]))
                        Then
                          WriteLn(F,'  setlinestyle(',VetLinC[LineSt],',',LinePt,',',VetThiC[LineTh],');');
                  If ((ColLin <> OldColLin) Or ScriviPrimo) And
                     (ColLin In [0..15])
                       Then
                         WriteLn(F,'  setcolor(',VetColC[ColLin],');');
                  If (OldFillPa[1] <> Setup.UserPattern[1]) Or
                     (OldFillPa[2] <> Setup.UserPattern[2]) Or
                     (OldFillPa[3] <> Setup.UserPattern[3]) Or
                     (OldFillPa[4] <> Setup.UserPattern[4]) Or
                     (OldFillPa[5] <> Setup.UserPattern[5]) Or
                     (OldFillPa[6] <> Setup.UserPattern[6]) Or
                     (OldFillPa[7] <> Setup.UserPattern[7]) Or
                     (OldFillPa[8] <> Setup.UserPattern[8])
                       Then Diverso := True
                  Else
                    Diverso := False;

                  If ((Retino <> OldRetino) Or (ColRet <> OldColRet) Or
                     Diverso Or
                     ScriviPrimo) And ((Retino In [0..12]) And
                     (ColRet In [0..15]))
                       Then
                         Begin
                         If (Retino = UserFill)
                           Then
                             Begin
                             WriteLn(F,'  setfillstyle(USER_FILL,',VetColC[ColRet],');');
                             WriteLn(F,'  setfillpattern(FillPatt,',VetColC[ColRet],');');
                             End
                          Else
                            WriteLn(F,'  setfillstyle(',VetFilC[Retino],',',VetColC[ColRet],');');
                         End;

                  OldLineSt := LineSt;
                  OldLinePt := LinePt;
                  OldLineTh := LineTh;
                  OldColLin := ColLin;
                  OldRetino := Retino;
                  OldColRet := ColRet;
                  OldFillPa := Setup.UserPattern;

                  Case Figura Of
                    fArcoCorda,
                    fArco: Begin
                           WriteLn(F,'  ellipse(',Word1,',',Word2,',',Word5,',',Word6,',',Word3,',',Word4,');');
                           If (Figura = fArcoCorda)
                             Then
                               Begin
                               WriteLn(F,'  getarccoords(ArcC);');
                               WriteLn(F,'  with ArcC do');
                               WriteLn(F,'    line(xstart,ystart,xend,yend);');
                               End;
                           End;
                    fRettangoloPieno: Begin
                                      WriteLn(F,'  bar(',Word1,',',Word2,',',Word3,',',Word4,');');
                                      WriteLn(F,'  rectangle(',Word1,',',Word2,',',Word3,',',Word4,');');
                                      End;
                    fRettangolo: WriteLn(F,'  rectangle(',Word1,',',Word2,',',Word3,',',Word4,');');
                    fPoligonoPieno,
                    fPoligono: Begin
                               NumPti := Word1*2;
                               i := 1;
                               Repeat
                                 AppOp := AppOp^.Next;
                                 With AppOp^.Op Do
                                   If (i <= NumPti) And (Word1 <> NUW) And (Word2 <> NUW)
                                     Then
                                       Begin
                                       WriteLn(F,'  Poly[',i-1,'] = ',Word1,';');
                                       WriteLn(F,'  Poly[',i,'] = ',Word2,';');
                                       Inc(i,2);
                                       If (i <= NumPti) And (Word3 <> NUW) And (Word4 <> NUW)
                                         Then
                                           Begin
                                           WriteLn(F,'  Poly[',i-1,'] = ',Word3,';');
                                           WriteLn(F,'  Poly[',i,'] = ',Word4,';');
                                           Inc(i,2);
                                           If (i <= NumPti) And (Word5 <> NUW) And (Word6 <> NUW)
                                             Then
                                               Begin
                                               WriteLn(F,'  Poly[',i-1,'] = ',Word5,';');
                                               WriteLn(F,'  Poly[',i,'] = ',Word6,';');
                                               Inc(i,2);
                                               End;
                                           End;
                                       End;

                               Until (i > NumPti);

                               If (Figura = fPoligonoPieno)
                                 Then
                                   WriteLn(F,'  fillpoly(',NumPti Div 2,',Poly);')
                               Else
                                 WriteLn(F,'  drawpoly(',NumPti Div 2,',Poly);');
                               End;
                    fCerchio: WriteLn(F,'  ellipse(',Word1,',',Word2,',0,360,',Word3,',',Word4,');');
                    fCerchioPieno: WriteLn(F,'  fillellipse(',Word1,',',Word2,',',Word3,',',Word4,');');
                    fRiempimento: WriteLn(F,'  floodfill(',Word1,',',Word2,',',Word3,');');
                    fLinea: WriteLn(F,'  line(',Word1,',',Word2,',',Word3,',',Word4,');');
                    fDisegnoLibero: WriteLn(F,'  putpixel(',Word1,',',Word2,',',Word3,');');
                    fTestoInizio: Begin

                                  WriteLn(F,'  settextstyle(',VetFontC[Word1],',',VetDirC[Word2],',',Word3,');');
                                  WriteLn(F,'  settextjustify(',VetHoriC[Word5],',',VetVertC[Word6],');');

                                  AppSt := InizioSt;
                                  St := StrNull;
                                  Trovato := False;
                                  While (AppSt <> NIL) And (Not Trovato) Do
                                    Begin
                                    If (AppSt^.St.Num = Word4)
                                      Then
                                        Begin
                                        Trovato := True;
                                        St := AppSt^.St.St;
                                        End;
                                    AppSt := AppSt^.Next;
                                    End;

                                  AppOp := AppOp^.Next;
                                  With AppOp^.Op Do
                                    Begin
                                    If (Word1 <> 1) Or (Word2 <> 1) Or (Word3 <> 1) Or (Word4 <> 1)
                                      Then
                                        WriteLn(F,'  setusercharsize(',Word1,',',Word2,',',Word3,',',Word4,');');
                                    WriteLn(F,'  outtextxy(',Word5,',',Word6,',"',St,'");');
                                    End;

                                  End;
                    fSettore: Begin
                              WriteLn(F,'  ellipse(',Word1,',',Word2,',',Word3,',',Word4,',',Word5,',',Word6,');');
                              WriteLn(F,'  getarccoords(ArcC);');
                              WriteLn(F,'  with ArcC do');
                              WriteLn(F,'    {');
                              WriteLn(F,'    line(xstart,ystart,x,y);');
                              WriteLn(F,'    line(xend,yend,x,y);');
                              WriteLn(F,'    };');
                              End;
                    fSettorePieno: WriteLn(F,'  sector(',Word1,',',Word2,',',Word3,',',Word4,',',Word5,',',Word6,');');
                    fRettangolo3DPieno,
                    fRettangolo3D: Begin
                                   If (Figura = fRettangolo3DPieno)
                                     Then
                                       WriteLn(F,'  bar(',Word1,',',Word2,',',Word3,',',Word4,');');
                                   WriteLn(F,'  rectangle(',Word1,',',Word2,',',Word3,',',Word4,');');
                                   AltezzaX := Word5;
                                   AltezzaY := Word6 Mod 5000;
                                   Quad := Word6 Div 5000;
                                   Case Quad Of
                                     1: Begin
                                        WriteLn(F,'  Poly[0] = ',Word1,';');
                                        WriteLn(F,'  Poly[1] = ',Word2,';');
                                        WriteLn(F,'  Poly[2] = ',Word1-AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word2-AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word3-AltezzaX,';');
                                        WriteLn(F,'  Poly[5] = ',Word2-AltezzaY,';');
                                        WriteLn(F,'  Poly[6] = ',Word3,';');
                                        WriteLn(F,'  Poly[7] = ',Word2,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(4,Poly);');
                                        WriteLn(F,'  Poly[6] = Poly[0];');
                                        WriteLn(F,'  Poly[7] = Poly[1];');
                                        WriteLn(F,'  Poly[0] = ',Word1-AltezzaX,';');
                                        WriteLn(F,'  Poly[1] = ',Word2-AltezzaY,';');
                                        WriteLn(F,'  Poly[2] = ',Word1-AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word4-AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word1,';');
                                        WriteLn(F,'  Poly[5] = ',Word4,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(3,Poly);');
                                        End;
                                     2: Begin
                                        WriteLn(F,'  Poly[0] = ',Word1,';');
                                        WriteLn(F,'  Poly[1] = ',Word2,';');
                                        WriteLn(F,'  Poly[2] = ',Word1+AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word2-AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word3+AltezzaX,';');
                                        WriteLn(F,'  Poly[5] = ',Word2-AltezzaY,';');
                                        WriteLn(F,'  Poly[6] = ',Word3,';');
                                        WriteLn(F,'  Poly[7] = ',Word2,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(4,Poly);');

                                        WriteLn(F,'  Poly[0] = ',Word3+AltezzaX,';');
                                        WriteLn(F,'  Poly[1] = ',Word2-AltezzaY,';');
                                        WriteLn(F,'  Poly[2] = ',Word3+AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word4-AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word3,';');
                                        WriteLn(F,'  Poly[5] = ',Word4,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(3,Poly);');
                                        End;
                                     3: Begin
                                        WriteLn(F,'  Poly[0] = ',Word1,';');
                                        WriteLn(F,'  Poly[1] = ',Word4,';');
                                        WriteLn(F,'  Poly[2] = ',Word1+AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word4+AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word3+AltezzaX,';');
                                        WriteLn(F,'  Poly[5] = ',Word4+AltezzaY,';');
                                        WriteLn(F,'  Poly[6] = ',Word3,';');
                                        WriteLn(F,'  Poly[7] = ',Word4,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(4,Poly);');

                                        WriteLn(F,'  Poly[0] = ',Word3+AltezzaX,';');
                                        WriteLn(F,'  Poly[1] = ',Word4+AltezzaY,';');
                                        WriteLn(F,'  Poly[2] = ',Word3+AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word2+AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word3,';');
                                        WriteLn(F,'  Poly[5] = ',Word2,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(3,Poly);');
                                        End;
                                     4: Begin
                                        WriteLn(F,'  Poly[0] = ',Word1,';');
                                        WriteLn(F,'  Poly[1] = ',Word4,';');
                                        WriteLn(F,'  Poly[2] = ',Word1-AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word4+AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word3-AltezzaX,';');
                                        WriteLn(F,'  Poly[5] = ',Word4+AltezzaY,';');
                                        WriteLn(F,'  Poly[6] = ',Word3,';');
                                        WriteLn(F,'  Poly[7] = ',Word4,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(4,Poly);');

                                        WriteLn(F,'  Poly[6] = Poly[0];');
                                        WriteLn(F,'  Poly[7] = Poly[1];');
                                        WriteLn(F,'  Poly[0] = ',Word1-AltezzaX,';');
                                        WriteLn(F,'  Poly[1] = ',Word4+AltezzaY,';');
                                        WriteLn(F,'  Poly[2] = ',Word1-AltezzaX,';');
                                        WriteLn(F,'  Poly[3] = ',Word2+AltezzaY,';');
                                        WriteLn(F,'  Poly[4] = ',Word1,';');
                                        WriteLn(F,'  Poly[5] = ',Word2,';');
                                        If (Figura = fRettangolo3DPieno)
                                          Then
                                            WriteLn(F,'  fillpoly(4,Poly);')
                                        Else
                                          WriteLn(F,'  drawpoly(3,Poly);');
                                        End;
                                     End; { Case Quad }

                                   End;
                    fUserFill: Begin
                               WriteLn(F,'  FillPatt[0] = ',LineSt,';');
                               WriteLn(F,'  FillPatt[1] = ',LinePt,';');
                               WriteLn(F,'  FillPatt[2] = ',LineTh,';');
                               WriteLn(F,'  FillPatt[3] = ',ColLin,';');
                               WriteLn(F,'  FillPatt[4] = ',Retino,';');
                               WriteLn(F,'  FillPatt[5] = ',ColRet,';');
                               WriteLn(F,'  FillPatt[6] = ',Word1,';');
                               WriteLn(F,'  FillPatt[7] = ',Word2,';');
                               Setup.Pattern := UserFill;
                               End;


                    End;
                  End;
       lTurboAsm: ;
       End;
     End; { Decodifica }


Begin { ConvertiFile }

Case Ling Of
  lTurboC:      St := ' TURBO C';
  lTurboPascal: St := ' TURBO PASCAL';
  lTurboAsm:    St := ' TURBO ASSEMBLER';
  End;
Case Ling Of
  lTurboC:      Ex := 'C';
  lTurboPascal: Ex := 'PAS';
  lTurboAsm:    Ex := 'ASM';
  End;

Name := '';
InputFile('CONVERSIONE IN'+St,Name,Ex,fLeggiFile,PAS);
If (Name <> StrNull)
  Then
    Begin
    FSplit(Name,D,N,E);
    Over := True;
    Assign(F,Name);
    {$I-} Reset(F); {$I+}
    If (IOResult = 0)
      Then
        Begin
        Close(F);
        Over := Warning('Il file esiste '''+N+E+''' esiste gi… sul disco,',
                        'devo sovrascriverlo ?',2);
        End;
    If Over
      Then
        Begin
        {$I-} ReWrite(F); {$I+}

        If (IOResult <> 0)
          Then
            Warning('Errore di scrittura sul disco.',
                    'Il file non Š stato salvato correttamente',1)
        Else
          Begin
          Intestazione;

          ScriviPrimo := True;

          { Lettura immagine }
          AppOp := InizioOp;
          Uscita := False;
          While (AppOp <> NIL) And (Not Uscita) Do
            Begin
            {$I-}
            Decodifica(AppOp);
            {$I+}
            If (IOResult <> 0)
              Then
                Begin
                Uscita := True;
                If Warning('Errore di scrittura sul disco: il file '''+N+E+'''',
                           'non Š stato salvato correttamente.',1)
                             Then
                               ;
                End
            Else
              Begin
              ScriviPrimo := False;
              AppOp := AppOp^.Next;
              End;
            End;

          Termine;

          {$I-} Close(F); {$I+}
          End;
        End
    Else
      If Warning('Il file '''+N+E+''' non Š stato salvato,',
                 'correttamente sul disco.',1)
                   Then
                     ;

    End;
Stato := sAttesa;

End; { ConvertiFile }


End. { GIPConv }
