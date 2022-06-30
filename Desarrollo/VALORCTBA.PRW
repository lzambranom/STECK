#INCLUDE "PROTHEUS.CH"
//#INCLUDE "CTBXFUN.CH"
    
#DEFINE D_PRELAN		"9"

STATIC __Ct105CT2		// Ponto de entrada complementar CT2
STATIC aCtbIni := {}
STATIC __aTamVlr := TamSX3("CT7_DEBITO")

/*/
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡„o    ³ValorCTB   ³ Autor ³ Pilar S Albaladejo    ³ Data ³ 15.12.99 		     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡„o ³Imprime O Valor                                             			 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³ValorCtb(nSaldo,nLin,nCol,nTamanho,nDecimais,lSinal,cPicture,;         ³±±
±±³          ³						cTipo,cConta,lGraf,oPrint)					  	 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³.T.   .                                                                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Generico                                                  			 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ ExpN1 = Valor                            	                 		 ³±±
±±³          ³ ExpN2 = Numero da Linha                                   		     ³±±
±±³          ³ ExpN3 = Numero da Coluna                                  		     ³±±
±±³          ³ ExpN4 = Tamanho                                           		     ³±±
±±³          ³ ExpN5 = Numero de Decimais											 ³±±
±±³          ³ ExpL1 = Se devera ser impresso com sinal ou nao.          		     ³±±
±±³          ³ ExpC1 = Picture                                           		     ³±±
±±³          ³ ExpC2 = Tipo                                              		     ³±±
±±³          ³ ExpC3 = Conta                                             		     ³±±
±±³          ³ ExpC4 = Se eh grafico ou nao                              		     ³±±
±±³          ³ ExpO1 = Objeto oPrint                                     		     ³±±
±±³          ³ ExpC4 = Tipo do sinal utilizado                           		     ³±±
±±³          ³ ExpC5 = Identificar [USADO em modo gerencial]             		     ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
user Function UValorCtb(nSaldo          ,nLin,nCol,nTamanho   ,nDecimais,lSinal,cPicture,cTipo,cConta,lGraf,oPrint,cTipoSinal, cIdentifi,lPrintZero)
//          U_UValorCtb(cArqTmp->LANCDEB,    ,    ,TAM_VALOR+8,nDecimais,.F.   ,cPicture,"1",        ,     ,      ,          ,          ,lPrintZero,.F.)

Local aSaveArea	:= GetArea()
Local cImpSaldo := ""
Local lDifZero	:= .T.
Local lInformada:= .T.                      
Local cCharSinal:= ""

lPrintZero := Iif(lPrintZero==Nil,.T.,lPrintZero)

// Nao imprime o valor 0,00
If !lPrintZero 
	If (Int(nSaldo*100)/100) == 0
		lDifZero := .F.			// O saldo nao eh diferente de zero
	EndIf
EndIf		

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Tipo D -> Default (D/C)												  ³
//³ Tipo S -> Imprime saldo com sinal									  ³
//³ Tipo P -> Imprime saldo entre parenteses (qdo. negativo)	  ³
//³ Tipo C -> So imprime "C" (o "D" nao e impresso)              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//DEFAULT cTipoSinal := GetMV("MV_TPVALOR")       // Assume valor default

DEFAULT cTipoSinal := 'S'

cTipo 		:= Iif(cTipo == Nil, Space(1), cTipo)
nDecimais	:= Iif(nDecimais==Nil,GetMv("MV_CENT"),nDecimais)

dbSelectArea("CT1")
dbSetOrder(1)

If !Empty(cConta) .And. Empty(cTipo)
	If MsSeek(cFilial+cConta)
		cTipo := CT1->CT1_NORMAL
	Endif
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Retorna a picture. Caso nao exista espaco, retira os pontos  ³
//³ separadores de dezenas, centenas e milhares 					  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Empty(cPicture)        
	If cTipoSinal $ "D/C"
		cPicture := TmContab(Abs(nSaldo),nTamanho,nDecimais)
	Else
		cPicture := TmContab(nSaldo,nTamanho,nDecimais)
	EndIf	
	lInformada  := .F.
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³* Alguns valores, apesar de  terem sinal devem ser impressos  ³
//³ sem sinal (lSinal). Ex: valores de colunas Debito e Credito  ³
//³* Se estiver com a opcao de lingua estrangeira (lEstrang) a   ³
//³ picture sera invertida para exibir valores: 999,999,999.99   ³
//³* O tipo de sinal "D" - default nao leva em consideracao a    ³
//³ a natureza da conta. Dessa forma valores negativos serao	  ³
//³ impressos sem sinal, e ao seu lado "D" (Devedor) e valores   ³
//³ positivos terao um "C" (Credito) impresso ao seu lado.       ³
//³* O tipo de Sinal "P" - Parenteses, imprimira valores de saldo³
//³  invertidos da condicao normal da conta entre parenteses.	  ³
//³* O tipo de Sinal "S" - Sinal, imprimira valores de saldo in- ³
//³  vertidos da condicao normal da conta com sinal - 			  ³
//³EXEMPLOS  -  EXEMPLOS  -  EXEMPLOS	-	EXEMPLOS  - EXEMPLOS   ³
//³Cond Normal 	Saldo 	Default      Sinal   Parenteses		  ³
//³	D			   -1000	   1000 D 		 1000		 1000			  	  ³
//³	D				 1000 	1000 C		-1000 	(1000)			  ³
//³	C				-1000 	1000 D		-1000 	(1000)			  ³
//³	C				 1000 	1000 C		 1000 	 1000 			  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

// So imprime valor se for diferente de zero!
If lDifZero
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Neste caso (Default), nao importa a natureza da conta! Saldos³
	//³ devedores serao impressos com "D" e credores com "C".        ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	// Neste caso, nao importa a natureza da conta!!
	If cTipoSinal == "D" .Or. cTipoSinal == "C"         // D(Default) ou C(so Credito)
		If !lInformada
			cPicture := "@E " + cPicture
		Endif	         
		If lSinal
			If nSaldo < 0
				If lGraf                                     
					If cTipoSinal == "D"				
						If cIdentifi # Nil .And. cIdentifi $ "34"
							cCharSinal := Iif(cPaisLoc<>"MEX","D","C")
						Else
							cCharSinal := Iif(cPaisLoc<>"MEX","D","C")
						Endif
					EndIf
				Else	 
					// No Tipo C -> so sao impressos os "C´s"
					If cTipoSinal == "D"
						cCharSinal := Iif(cPaisLoc<>"MEX","D","C")
					EndIf	
				Endif
			ElseIf nSaldo > 0
				If lGraf                                                                
					If cIdentifi # Nil .And. cIdentifi $ "34"                                                           
						If cTipoSinal == "D"
							cCharSinal := Iif(cPaisLoc<>"MEX","D","C")
						EndIf
					Else
						cCharSinal := Iif(cPaisLoc<>"MEX","C","A")
					Endif
				Else
					cCharSinal := Iif(cPaisLoc<>"MEX","C","A")
				Endif
			EndIf
			cCharSinal := " "+cCharSinal			
		EndIf
		cImpSaldo := Transform(Abs(nSaldo),cPicture)+cCharSinal
		If lGraf                                                
			If cIdentifi # Nil .And. cIdentifi $ "34"
				oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
			Else
				oPrint:Say(nLin,nCol,cImpSaldo,oFont08)				
			Endif
		Else  
			@ nLin, nCol pSay cImpSaldo 
		Endif
		
	Else
		//Utiliza conceito de conta estourada e a conta eh redutora.
		If Select("cArqTmp") > 0 .And. cArqTmp->(FieldPos("ESTOUR")) <> 0 .And.  cArqTmp->ESTOUR == "1"
			If cTipo == "1" 								// Conta Devedora
				If cTipoSinal == "S"              			// Sinal
					If !lSinal
						nSaldo := Abs(nSaldo)
					EndIf
					If !lInformada
						cPicture := "@E " + cPicture
					EndIf 
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					Else
						@ nLin, nCol PSAY nSaldo Picture cPicture
					Endif
				ElseIf (cTipoSinal) == "P"              	// Parenteses
					If !lSinal 
						nSaldo := Abs(nSaldo)
					EndIf

					If !lInformada         				
						cPicture := "@E( " + cPicture
					EndIf
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					Else
						@ nLin, nCol pSay nSaldo Picture cPicture
					Endif
				EndIf
			Else
				If (cTipoSinal) == "S"                  	// Sinal
					If lSinal 
						nSaldo := nSaldo * (-1)
//					If !lSinal .And. cTipo == "2" 			// Conta Credora
					Else
						nSaldo := Abs(nSaldo)
					EndIf
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					Else
						@ nLin, nCol PSAY nSaldo Picture cPicture
					Endif
				ElseIf (cTipoSinal) == "P"              // Parenteses
					If lSinal                  
						nSaldo := nSaldo * (-1)					
//					If !lSinal .And. cTipo == "2" 			// Conta Credora
					Else
						nSaldo := Abs(nSaldo)
					EndIf
					If !lInformada
						cPicture := "@E( " + cPicture
					EndIf    
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			// Debito
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif					
					Else
						@ nLin, nCol pSay nSaldo Picture cPicture
					Endif
				EndIf		
			EndIf		
	    Else	//Se nao utiliza conceito de conta estourada
			If cTipo == "1" 								// Conta Devedora
				If cTipoSinal == "S"              			// Sinal
					If lSinal
						nSaldo := nSaldo * (-1)
					Else
						nSaldo := Abs(nSaldo)
					EndIf
					If !lInformada
						cPicture := "@E " + cPicture
					EndIf 
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					Else
						@ nLin, nCol PSAY nSaldo Picture cPicture
					Endif
				ElseIf (cTipoSinal) == "P"              	// Parenteses
					If lSinal 
						nSaldo := nSaldo * (-1) 		  		// a Picture so exibe parenteses para numeros negativos
					Else
						nSaldo := Abs(nSaldo)
					EndIf
        	
					If !lInformada         				
						cPicture := "@E( " + cPicture
					EndIf
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					Else
						@ nLin, nCol pSay nSaldo Picture cPicture
					Endif
				EndIf
			Else
				If (cTipoSinal) == "S"                  	// Sinal
					If !lSinal .And. cTipo == "2" 			// Conta Credora
						nSaldo := Abs(nSaldo)
					EndIf
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					Else
						@ nLin, nCol PSAY nSaldo Picture cPicture
					Endif
				ElseIf (cTipoSinal) == "P"              // Parenteses
					If !lSinal .And. cTipo == "2" 			// Conta Credora
						nSaldo := Abs(nSaldo)
					EndIf
					If !lInformada
						cPicture := "@E( " + cPicture
					EndIf    
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			// Debito
						If cIdentifi # Nil .And. cIdentifi $ "34"
							oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif					
					Else
						@ nLin, nCol pSay nSaldo Picture cPicture
					Endif
				EndIf
			EndIf
		EndIf
	EndIf
EndIf
RestArea(aSaveArea)

Return
