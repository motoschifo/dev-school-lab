{============================================================================}
{                                                                            }
{                            SPRITE MANAGER v5.0                             }
{                                                                            }
{ Data di ultima modifica .............. Mercoledi, 21 Aprile 1993           }
{                                                                            }
{ Gestione degli sprite in Turbo Pascal.                                     }
{ Il programma e tutte le unit ad esso associate sono state studiate e       }
{ scritte da :                                                               }
{                                                                            }
{    FOCHI MICHELE                                                           }
{    5¦ A Informatica                                                        }
{    I.T.I.S. 'Leonardo Da Vinci' (PR)                                       }
{    Tel. 0521/638420 (abitazione)                                           }
{                                                                            }
{ fanno eccezione ovviamente le unit standard DOS, CRT e GRAPH.              }
{                                                                            }
{ Questo Š un programma non protetto da nessun diritto, pertanto la          }
{ distribuzione e la copia di questo non sono vietate, ma consigliate,       }
{ facendo per• attenzione a seguire l' unica regola di non modificare i      }
{ files originali.                                                           }
{                                                                            }
{ Il programma presenta un'ottimo utilizzo delle risorse grafiche di         }
{ questo linguaggio, oltre a gestire in modo ottimale sia il mouse           }
{ (Microsoft compatibile) sia la tastiera (ricordo che il driver             }
{ per il mouse va caricato prima di eseguire questo programma).              }
{ Una volta disegnato lo sprite, premere sull'icona TURBO PASCAL per         }
{ creare il file in Turbo Pascal che visualizzi il disegno presente          }
{ sullo schermo.                                                             }
{                                                                            }
{ Tutte le icone sono state create con il programma Sprite Manager           }
{ versione 1.0 (la prima) e integrati tutti i dati nella unit PULSANTI.      }
{                                                                            }
{ Sullo schermo sono presenti due aree per disegnare :                       }
{                                                                            }
{ 1) quella pi— grande, che occupa quasi tutto lo schermo serve per          }
{    editare il disegno che ha dimensioni dieci volte pi— grandi             }
{    (scala 10:1),                                                           }
{ 2) quella pi— piccola, in basso a destra, per editare lo sprite            }
{    in dimensioni reali (scala 1:1).                                        }
{                                                                            }
{ Ci sono molti tools per disegnare, facilmente riconoscibili dal            }
{ disegno sulle icone, e lavorano tutti su entrambi gli schermi              }
{ contemporaneamente, per vedere subito il disegno risultante.               }
{                                                                            }
{ Per avere tutte le informazioni necessarie consultare il file SPRITE.TXT,  }
{ un file di soli caratteri ascii, facilmente visualizzabile con il          }
{ comando TYPE del DOS (o anche con l'editor dell'ambiente integrato del     }
{ Turbo Pascal).                                                             }
{                                                                            }
{ La maggior parte delle informazioni necessarie sono disponibili anche      }
{ premendo l'icona con il punto interrogativo ('?'), ossia l'icona di        }
{ help on-line.                                                              }
{                                                                            }
{ Il programma ha avuto diverse versioni:                                    }
{                                                                            }
{ Sprite Manager Versione 1.0                                                }
{ La prima versione: il programma era scritto per funzionare in modalit…     }
{ testo e lo sprite poteva essere al massimo di 25 righe per 80 colonne.     }
{ L' unica cosa possibile era la scelta dei colori tramite i tasti 0..9      }
{ e A..F (16 in tutto) e lo spostamento del cursore con i tasti freccia.     }
{                                                                            }
{ Sprite Manager Versione 1.5                                                }
{ Il programma Š passato in modalit… grafica (solo VGA) e occorreva          }
{ specificare le dimensioni dello sprite finale prima di disegnarlo.         }
{ La maggio parte delle icone erano state disegnate con la versione          }
{ 1.0. Il mouse non era utilizzabile.                                        }
{                                                                            }
{ Sprite Manager Versione 2.0                                                }
{ Implementazione del mouse. Barre di scorrimento per una dimensione         }
{ massima dello sprite di 180 righe per 120 colonne, con i soliti 16         }
{ colori disponibili.                                                        }
{                                                                            }
{ Sprite Manager Versione 2.1                                                }
{ E' stata aggiunta la finestra piccola, per vedere direttamente lo          }
{ sprite risultante.                                                         }
{                                                                            }
{ Sprite Manager Versione 2.5                                                }
{ E' stata aggiunta la griglia (disponibile in 3 modi diversi) ed il         }
{ tutto Š stato ottimizzato per evitare i vari sfarfallii, dovuti al         }
{ cancella/scrivi continuo.                                                  }
{                                                                            }
{ Sprite Manager Versione 2.8                                                }
{ Ulteriore ottimizzazione del codice per migliorare sia la velocit…         }
{ del programma sia la sua lunghezza in righe di istruzioni.                 }
{                                                                            }
{ Sprite Manager Versione 3.0                                                }
{ E' stata ampliata la finestra delle informazioni aggiungendo l' ora,       }
{ la data e alcune informazioni sulla memoria e sul disco.                   }
{                                                                            }
{ Sprite Manager Versione 3.1                                                }
{ Sono state aggiunte le descrizioni in alto allo sprite (titolo), in        }
{ alto alle icone (nome del file attivo), in fondo allo sprite in            }
{ dimensioni reali (caratteristiche) e le coordinate del mouse (tra le       }
{ due frecce <- e -> dello sprite ingrandito.                                }
{                                                                            }
{ Sprite Manager Versione 3.2                                                }
{ Cambio del metodo per il ripristino della finestra aperta, riscrivendo     }
{ tutto quello che poteva essere stato modificato, evitando di occupare      }
{ la memoria di massa (RAM) o il disco.                                      }
{                                                                            }
{ Sprite Manager Versione 3.5                                                }
{ Sono state aggiunte tutte le varie figure (7), i tipi di retino (12) e     }
{ quelli di linea (8). Il disegno avviene in contemporanea in tutte e due    }
{ le finestra. Sono state aggiunte le icone di ZOOM (In ed Out) per          }
{ variare il rapporto tra i due disegni e la dimensione attuale del lato     }
{ ingrandito di un pixel (specificato da Scala XX:1). L' intervallo di       }
{ variazione Š 2..420.                                                       }
{                                                                            }
{ Sprite Manager Versione 4.0                                                }
{ E' stata aggiunta la possibilit… di scrivere del testo, scegliendo tra     }
{ 12 tipi di font (con i tasti F1 e Shift-F1), 30 possibili grandezze (con   }
{ F2 e Shift-F2), 2 direzioni (orizzontale con F3 e verticale con Shift-F3), }
{ giustificazioni orizzontale e verticali (F4 o Shift-F4 e F5 o Shift-F5).   }
{ Per maggiore comodit… sono stati 'linkati' tutti i driver grafici e i      }
{ font disponibili in Turbo Pascal (per intenderci i files *.BGI e *.CHR).   }
{ In questo modo saranno sempre disponibili.                                 }
{ Sono stati corretti inoltre alcuni piccoli errori.                         }
{                                                                            }
{ Sprite Manager Versione 5.0                                                }
{ Sono state aggiunte due operazioni con i blocchi (copia e sposta) e        }
{ corretti alcuni 'bugs' (lettura, scrittura e conversione di un file).      }
{ Si prevedono successive versioni per migliorare la finestra di lettura e   }
{ di salvataggio e aggiungere nuovi strumenti di disegno o altre opzioni     }
{ speciali.                                                                  }
{                                                                            }
{============================================================================}
{$M 16384,8192,655360,S-,R-,B-,I-,V-,D-}

Program _SpriteManager_v50;

Uses Dos,      { Gestisce i file e la directory del disco                    }
     Crt,      { Gestisce lo schermo in modalit… testo                       }
     Graph,    { Gestisce lo schermo in modalit… grafica                     }
     SprLink,  { Unit che unisce i files *.BGI e *.CHR in un .EXE (Linker)   }
     SprFont1, { Prima unit delle 3 che definiscono i tipi di fonts          }
     SprFont2, { Seconda unit delle 3 che definiscono i tipi di fonts        }
     SprFont3, { Terza unit delle 3 che definiscono i tipi di fonts          }
     SprDriv,  { Contiene tutti i driver grafici per le schede necessarie    }
     Pulsanti, { Definisce tutte le icone del programma                      }
     Mouse,    { Gestisce il mouse                                           }
     UtilSpr1, { Procedure varie per il programma parte 1 di 2               }
     UtilSpr2; { Procedure varie per il programma parte 2 di 2               }

Begin {* Sprite Manager Versione 5.0 *}

SpriteManager;

End. {* Sprite Manager Versione 5.0 *}
