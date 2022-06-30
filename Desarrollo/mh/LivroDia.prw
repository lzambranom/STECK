#Include "Protheus.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³LivroDia  ºAutor  ³EDUAR ANDIA         ºFecha ³  12/03/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Libro diario (Contable)                                    º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ PROMOS (Colombia)                                          º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/	
	
User Function LivroDia()
Local oReport
Private cPerg := "CTBLD"
 
If TRepInUse()

	CriaPerg(cPerg)
	Pergunte(cPerg,.F.)
	
	oReport := ReportDef()
	oReport:PrintDialog()	
EndIf
Return

Static Function ReportDef()
Local oReport
Local oSection1
Local oSection2
Local oSection3

oReport := TReport():New("LIVRODIA","LIBRO DIARIO",cPerg,{|oReport| PrintReport(oReport)},"Reporte de Libro Diario")

/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 1  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/
oSection1 := TRSection():New(oReport,"Fecha/Lote","CT2")
//oSection1:SetTotalInLine(.F.)

TRCell():New(oSection1,"CT2_DATA"	,"CT2","Fecha",,20,.T.,{|| cData })

/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 2  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/

oSection2 := TRSection():New(oReport /*oSection1*/,"Sub-Lote","CT2")
TRCell():New(oSection2,"SBLOTE"	,"CT2","Sub-Lote/"		,,10,.T.)	//,{|| Sub-Lote })
TRCell():New(oSection2,"SBDESC"	,"CT2","Descripción "	,,40,.T.)	//,{|| Descrip. })


/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 3  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/
oSection3 := TRSection():New(oReport /*oSection2*/,"Total","CT2")
oSection3:SetTotalInLine(.F.)

TRCell():New(oSection3,"CT2_FILIAL"	,"CT2","Filial")
TRCell():New(oSection3,"CT2_DATA"	,"CT2")
TRCell():New(oSection3,"CT2_LOTE"	,"CT2","Lote")
TRCell():New(oSection3,"CT2_SBLOTE"	,"CT2","Sub-Lote"			,,05,.T.)	//,{|| cData })
TRCell():New(oSection3,"DESCSISBLT"	,"CT2","Descripcion"		,,40,.T.)	//,{|| cData })
TRCell():New(oSection3,"DESCTA"		,"CT2","Descripcion Cta."	,,40,.T.,{|| cDesCta })
TRCell():New(oSection3,"CT2_DEBITO"	,"CT2")
TRCell():New(oSection3,"CT2_CREDIT"	,"CT2")
TRCell():New(oSection3,"VALORDEB"	,"CT2","VALOR DEB.",PesqPict('CT2','CT2_VALOR'), TamSx3("CT2_VALOR")	 [1])
TRCell():New(oSection3,"VALORCRD"	,"CT2","VALOR CRD.",PesqPict('CT2','CT2_VALOR'), TamSx3("CT2_VALOR")	 [1])


Return oReport

/*
Static Function PrintReport(oReport)
Local oSection1 := oReport:Section(1)
Local oSection2 := oSection1:Section(1) 	//oReport:Section(1):Section(1)
Local oSection3 := oSection2:Section(1)     //oReport:Section(1):Section(1):Section(1)
*/
Static Function PrintReport(oReport)
Local oSection1 := oReport:Section(1)
Local oSection2 := oReport:Section(2) 		//oReport:Section(1):Section(1)
Local oSection3 := oReport:Section(3)     	//oReport:Section(1):Section(1):Section(1)
Local cFiltro   := ""
Local cLote		:= ""
Local cSbLote	:= ""
Local QRYSA3 	:= GetNextAlias()
Local dFchAnt 	:= STOD(" / / ")
Local cSubLote	:= ""
Local cTxtSbL	:= ""   
Local cTpSal    := ""

#IFDEF TOP
	
	oSection1:SetTotalInLine(.F.)
	oSection1:SetTotalText("Total Saldo "+MV_PAR05)
	oSection1:SetHeaderSection(.F.)
		
	//oSection3:SetTotalinLine(.F.)
	oSection3:SetHeaderPage()	//Define o cabecalho da secao como padrao	
		                                                             
	oBreak2 := TRBreak():New(oReport /*oSection3*/,oSection3:Cell("CT2_SBLOTE"),{|| cTxtSbL },.F.)
	TRFunction():New(oSection3:Cell("VALORDEB"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection3:Cell("VALORCRD"),NIL,"SUM",oBreak2,,,,,.F.)
	
	oBreak := TRBreak():New(oReport /*oSection3*/,oSection3:Cell("CT2_LOTE"),"Total Lote")
	TRFunction():New(oSection3:Cell("VALORDEB"),NIL,"SUM",oBreak,,,,,.T.)
	TRFunction():New(oSection3:Cell("VALORCRD"),NIL,"SUM",oBreak,,,,,.T.)
	
	oBreak3 := TRBreak():New(oReport /*oSection3*/,oSection3:Cell("CT2_DATA"),"Total Fecha")
	TRFunction():New(oSection3:Cell("VALORDEB"),NIL,"SUM",oBreak3,,,,,.F.)
	TRFunction():New(oSection3:Cell("VALORCRD"),NIL,"SUM",oBreak3,,,,,.F.)
	
	
	If !Empty(mv_par03)
		SX5->(DbSetOrder(1))
		If SX5->(DbSeek(xFilial("SA1")+"09"+mv_par03))
			cLote := "% AND CT2_LOTE = '" + SX5->X5_DESCRI + "' %"
		Else
			cLote := "% AND CT2_LOTE = '' %"
		Endif
	Else
		cLote := "%%"
	EndIf
	
	If !Empty(mv_par04)
		cSbLote := "% CT2_SBLOTE = '" + mv_par04 + "' %"
	Else
		cSbLote := "% CT2_SBLOTE <> '' %"
	EndIf   
	
	If !Empty(mv_par05)
		cTpSal := "% CT2_TPSALD = '" + mv_par05 + "' %"
	EndIf
	
	oSection3:BeginQuery()
		
	BeginSql alias QRYSA3
	SELECT CT2_FILIAL,CT2_DATA,CT2_LOTE,CT2_SBLOTE,SX5.X5_DESCSPA AS DESCSISBLT,CT2_DEBITO,CT2_CREDIT,
	Case When LEN(CT2_DEBITO) > 0 then SUM(CT2_VALOR) Else 0 END AS VALORDEB,
	Case When LEN(CT2_CREDIT) > 0 then SUM(CT2_VALOR) Else 0 END AS VALORCRD
	FROM %table:CT2% CT2
		LEFT OUTER JOIN %table:SX5% SX5 
		ON  SX5.X5_CHAVE = CT2_SBLOTE AND SX5.X5_TABELA = 'SB' AND SX5.%notDel%
	WHERE CT2.%notDel% %exp:cLote% 
	AND CT2_DATA BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)% AND %exp:cSbLote% AND %exp:cTpSal%
	GROUP BY CT2_FILIAL,CT2_DATA,CT2_LOTE,CT2_SBLOTE,SX5.X5_DESCSPA,CT2_DEBITO,CT2_CREDIT
	ORDER BY CT2_FILIAL,CT2_DATA,CT2_LOTE,CT2_SBLOTE,CT2_CREDIT,CT2_DEBITO
	EndSql	
	
	//Aviso("cQuery1",GetLastQuery()[2],{"OK"},,,,,.T.)
		
	oSection3:EndQuery()
	//oSection3:SetParentQuery()
	//oSection3:SetParentFilter({|cParam| QRYSA3->A1_VEND >= cParam .and. QRYSA3->A1_VEND <= cParam},{|| QRYSA3->A3_COD})

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Inicio da impressao do fluxo do relatório                               ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	
	oSection3:Cell("DESCSISBLT"):Disable()
	oSection3:Cell("DESCTA"):SetLineBreak(.T.)
	
	DbSelectArea(QRYSA3)
	dbGoTop()
	While !oReport:Cancel() .And. !(QRYSA3)->(Eof())
		              
		//oSection1:Init()
		//oSection2:Init()						//oReport:Section(1):Section(1):Init()
		oSection3:Init()				
		
		oSection2:Cell("SBLOTE"):SetValue( (QRYSA3)->CT2_SBLOTE )
		oSection2:Cell("SBDESC"):SetValue( (QRYSA3)->DESCSISBLT )
		
		cCta	:= If(!Empty((QRYSA3)->CT2_DEBITO),(QRYSA3)->CT2_DEBITO,(QRYSA3)->CT2_CREDIT)
		cDesCta := AllTrim(Posicione("CT1", 1, xFilial("CT1") + cCta, "CT1_DESC01"))
		
		/*
		If (QRYSA3)->CT2_DATA <> dFchAnt			
			cData := (QRYSA3)->CT2_DATA
			oSection1:Init()
			oSection1:PrintLine()
			oSection1:Finish()
		Endif
		*/
		/*		
		If (QRYSA3)->CT2_SBLOTE <> cSubLote
			oSection2:Init()
			oSection2:PrintLine()
			oSection2:Finish()
		Endif                             
 		*/
 		
		oSection3:PrintLine()
		
		cTxtSbL := "Total - " + AllTrim((QRYSA3)->DESCSISBLT) + "-->>"
		
		dFchAnt	:= (QRYSA3)->CT2_DATA
		cSubLote:= (QRYSA3)->CT2_SBLOTE
		
		dbSelectArea(QRYSA3)
		dbSkip()
	EndDo
	
#ELSE
#ENDIF	

Return

//+------------------------------------------------------------------------+
//|Función que verifica si existe la Pregunta, caso no exista lo crea	   |
//+------------------------------------------------------------------------+
Static Function CriaPerg(cPerg)
Local aRegs := {}
Local i		:= 0

cPerg := PADR(cPerg,10)
aAdd(aRegs,{"01","De Fecha?     :","mv_ch1","D",08,0,0,"G","mv_par01",""       ,""            ,""        ,""     ,""   ,""})
aAdd(aRegs,{"02","A Fecha?      :","mv_ch2","D",08,0,0,"G","mv_par02",""       ,""            ,""        ,""     ,""   ,""})
aAdd(aRegs,{"03","Lote?			:","mv_ch3","C",06,0,1,"G","mv_par03",""       ,""            ,""        ,""     ,"09" ,""})
aAdd(aRegs,{"04","Sub-Lote?		:","mv_ch4","C",03,0,1,"G","mv_par04",""       ,""            ,""        ,""     ,"SB" ,""})  
aAdd(aRegs,{"05","Imprime Saldo?:","mv_ch5","C",01,0,1,"G","mv_par05",""       ,""            ,""        ,""     ,"SLD" ,"VldTpSald( MV_PAR05,.T. )"})

DbSelectArea("SX1")
DbSetOrder(1)
For i:=1 to Len(aRegs)
   dbSeek(cPerg+aRegs[i][1])
   If !Found()
      RecLock("SX1",!Found())
         SX1->X1_GRUPO    := cPerg
         SX1->X1_ORDEM    := aRegs[i][01]
         SX1->X1_PERSPA   := aRegs[i][02]
         SX1->X1_VARIAVL  := aRegs[i][03]
         SX1->X1_TIPO     := aRegs[i][04]
         SX1->X1_TAMANHO  := aRegs[i][05]
         SX1->X1_DECIMAL  := aRegs[i][06]
         SX1->X1_PRESEL   := aRegs[i][07]
         SX1->X1_GSC      := aRegs[i][08]
         SX1->X1_VAR01    := aRegs[i][09]
         SX1->X1_DEFSPA1  := aRegs[i][10]
         SX1->X1_DEFSPA2  := aRegs[i][11]
         SX1->X1_DEFSPA3  := aRegs[i][12]
         SX1->X1_DEFSPA4  := aRegs[i][13]
         SX1->X1_F3       := aRegs[i][14]
         SX1->X1_VALID    := aRegs[i][15]         
      MsUnlock()
   Endif
Next i
Return
