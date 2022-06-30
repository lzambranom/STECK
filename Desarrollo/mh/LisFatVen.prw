#Include "Protheus.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³LisFatVen  ºAutor  ³EDUAR ANDIA        ºFecha ³  16/01/2016 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Informe -Listado de Facturas de Venta NF/NDC/NCC +Impuesto º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ GAMA\Colombia                                              º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/	
	
User Function LisFatVen()
Local oReport
Private cPerg := "LISFATVEN"
 
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

oReport := TReport():New("LISFATVEN","LISTADO FACTURA VENTAS",cPerg,{|oReport| PrintReport(oReport)},"Relatorio de Facturas de Venta")
oReport:nFontBody := 6

/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 1  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/
/*
oSection1 := TRSection():New(oReport,"Fecha/Lote","SF2")
//oSection1:SetTotalInLine(.F.)
TRCell():New(oSection1,"F2_EMISSAO"	,"SF2","Emissao",,20,.T.,{|| cData })
*/
/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 2  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/
                                       
oSection1 := TRSection():New(oReport,'Listado de Facturas NF-NDC-NCC',,,,,,,,,,,,,,,,,,,) 
oSection1:SetTotalInLine(.T.)
oSection1:lHeaderVisible := .F.
oSection1:SetHeaderPage(.F.) 
oSection1:SetHeaderBreak(.F.) 

TRCell():New(oSection1,"FILIAL"		,"SF2","Filial "	,,TamSx3("F2_FILIAL")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"EMISSAO"	,"SF2","Emissao "	,,TamSx3("F2_EMISSAO")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"CLIENTE"	,"SF2","Cliente "	,,TamSx3("F2_CLIENTE")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"LOJA"		,"SF2","Loja "		,,TamSx3("F2_LOJA")[1],.T.)		//,{|| Descrip. })
TRCell():New(oSection1,"NOME"		,"SA1","Nombre "	,,TamSx3("A1_NOME")[1],.T.)		//,{|| Descrip. })
TRCell():New(oSection1,"ESPECIE"	,"SF2","Especie "	,,TamSx3("F2_ESPECIE")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"SERIE"		,"SF2","Serie "		,,TamSx3("F2_SERIE")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"DOC"		,"SF2","Doc "		,,TamSx3("F2_DOC")[1],.T.)		//,{|| Descrip. })
TRCell():New(oSection1,"VALBRUT"	,"SF2","ValBrut "	,PesqPict('SF2','F2_VALBRUT'), TamSx3("F2_VALBRUT")[1]) 
TRCell():New(oSection1,"VALMERC"	,"SF2","ValMerc "	,PesqPict('SF2','F2_VALMERC'), TamSx3("F2_VALMERC")[1])
TRCell():New(oSection1,"DESCONT"	,"SF2","Descuento "	,,TamSx3("F2_DESCONT")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP1"	,"SF2","IVA "		,,TamSx3("F2_VALIMP1")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP2"	,"SF2","RV0 "		,,TamSx3("F2_VALIMP2")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP3"	,"SF2","ICA "		,,TamSx3("F2_VALIMP3")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP4"	,"SF2","RF0 "		,,TamSx3("F2_VALIMP4")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP6"	,"SF2","IP8 "		,,TamSx3("F2_VALIMP6")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP9"	,"SF2","CREE "		,,TamSx3("F2_VALIMP9")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"MOTDEV"	    ,"SF2","MotDev "	,,TamSx3("F2_OBS")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"OBSERV"	    ,"SF2","Observacion" ,,TamSx3("F2_XOBSERV")[1],.T.)	//,{|| Descrip. })

/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 3  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/
/*
oSection3 := TRSection():New(oSection2,"Total","CT2")
oSection3:SetTotalInLine(.F.)

TRCell():New(oSection3,"VALORDEB"	,"CT2","VALOR DEB.",PesqPict('CT2','CT2_VALOR'), TamSx3("CT2_VALOR")	 [1])
TRCell():New(oSection3,"VALORCRD"	,"CT2","VALOR CRD.",PesqPict('CT2','CT2_VALOR'), TamSx3("CT2_VALOR")	 [1])
*/

Return oReport


Static Function PrintReport(oReport)
Local oSection1 := oReport:Section(1)
Local oSection2 //:= oSection1:Section(1) 		//oReport:Section(1):Section(1)
Local oSection3 //:= oSection2:Section(1)     	//oReport:Section(1):Section(1):Section(1)
Local cFiltro   := ""
Local cLote		:= ""
Local QRYSA3 	:= GetNextAlias()
Local dFchAnt 	:= STOD(" / / ")
Local cSubLote	:= ""

#IFDEF TOP
	
	oSection1:SetTotalInLine(.F.)
	oSection1:SetTotalText("Total")
	//oSection1:SetHeaderSection(.F.)
		
	//oSection3:SetTotalinLine(.F.)
	oSection1:SetHeaderPage()	//Define o cabecalho da secao como padrao	
	//oSection1:ShowHeader()
	//lHeaderPage
		                                                             
	oBreak1 := TRBreak():New(oSection1,oSection1:Cell("ESPECIE"),"Total ESPECIE",.F.)
	TRFunction():New(oSection1:Cell("VALBRUT"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALMERC"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("DESCONT"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP1"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP2"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP3"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP4"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP6"),NIL,"SUM",oBreak1,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP9"),NIL,"SUM",oBreak1,,,,,.F.)
	
	oBreak2 := TRBreak():New(oSection1,oSection1:Cell("FILIAL"),"Total FILIAL",.F.)
	TRFunction():New(oSection1:Cell("VALBRUT"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALMERC"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("DESCONT"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP1"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP2"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP3"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP4"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP6"),NIL,"SUM",oBreak2,,,,,.F.)
	TRFunction():New(oSection1:Cell("VALIMP9"),NIL,"SUM",oBreak2,,,,,.F.)
	
	
	/*
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
	*/
	oSection1:BeginQuery()
		
	BeginSql alias QRYSA3
	
	SELECT F2_FILIAL FILIAL, F2_EMISSAO EMISSAO,F2_CLIENTE CLIENTE,F2_LOJA LOJA,A1_NOME NOME,F2_ESPECIE ESPECIE,
	F2_SERIE SERIE,F2_DOC DOC,F2_VALBRUT VALBRUT,F2_VALMERC VALMERC,F2_DESCONT DESCONT,F2_VALIMP1 VALIMP1,F2_VALIMP2 VALIMP2,
	F2_VALIMP3 VALIMP3,F2_VALIMP4 VALIMP4,F2_VALIMP6 VALIMP6,F2_VALIMP9 VALIMP9,F2_OBS MOTDEV,F2_XOBSERV OBSERV
	FROM (
		SELECT F2_FILIAL, F2_EMISSAO,F2_CLIENTE,F2_LOJA,A1_NOME,F2_ESPECIE,F2_SERIE,F2_DOC,
		CASE F2_MOEDA WHEN '2' THEN F2_TXMOEDA * F2_VALBRUT ELSE F2_VALBRUT END AS F2_VALBRUT,
		CASE F2_MOEDA WHEN '2' THEN F2_TXMOEDA * F2_VALMERC ELSE F2_VALMERC END AS F2_VALMERC,F2_DESCONT,F2_VALIMP1,F2_VALIMP2,
		F2_VALIMP3,F2_VALIMP4,F2_VALIMP6,F2_VALIMP9,F2_OBS,F2_XOBSERV
		FROM %table:SF2% SF2
			LEFT OUTER JOIN %table:SA1% SA1 
			ON  SA1.A1_COD = F2_CLIENTE AND SA1.A1_LOJA = F2_LOJA AND SA1.D_E_L_E_T_ = ''
		WHERE F2_TIPODOC in ( '01','N')	
			AND F2_EMISSAO BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)%
			AND F2_FILIAL BETWEEN %exp:mv_par03% AND %exp:mv_par04%
			AND SF2.%notDel%			
	) TAB
	UNION
/*	SELECT F2_FILIAL FILIAL, F2_EMISSAO EMISSAO,F2_CLIENTE CLIENTE,F2_LOJA LOJA,A1_NOME NOME,F2_ESPECIE ESPECIE,F2_SERIE SERIE,F2_DOC DOC,F2_VALBRUT VALBRUT,F2_VALMERC VALMERC,F2_DESCONT DESCONT,F2_VALIMP1 VALIMP1,F2_VALIMP2 VALIMP2,F2_VALIMP3 VALIMP3,F2_VALIMP4 VALIMP4,F2_VALIMP6 VALIMP6,F2_VALIMP9 VALIMP9
	FROM (
		SELECT F2_FILIAL, F2_EMISSAO,F2_CLIENTE,F2_LOJA,A1_NOME,F2_ESPECIE,F2_SERIE,F2_DOC,F2_VALBRUT,F2_VALMERC,F2_DESCONT,F2_VALIMP1,F2_VALIMP2,F2_VALIMP3,F2_VALIMP4,F2_VALIMP6,F2_VALIMP9 
		FROM %table:SF2% SF2
			LEFT OUTER JOIN %table:SA1% SA1 
			ON  SA1.A1_COD = F2_CLIENTE AND SA1.A1_LOJA = F2_LOJA AND SA1.%notDel%
		WHERE F2_ESPECIE = 'NDC' 
			AND F2_EMISSAO BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)%
			AND F2_FILIAL BETWEEN %exp:mv_par03% AND %exp:mv_par04%
			AND SF2.%notDel%			) TAB	UNION
*/	
	SELECT DISTINCT F1_FILIAL FILIAL, F1_EMISSAO EMISSAO,F1_FORNECE CLIENTE,F1_LOJA LOJA,A1_NOME NOME,F1_ESPECIE ESPECIE,F1_SERIE SERIE,F1_DOC DOC,
	F1_VALBRUT *(-1) AS VALBRUT, F1_VALMERC *(-1) AS VALMERC,F1_DESCONT *(-1) DESCONT,F1_VALIMP1 *(-1) VALIMP1,F1_VALIMP2 *(-1) VALIMP2,
	F1_VALIMP3 *(-1) VALIMP3,F1_VALIMP4 *(-1) VALIMP4,F1_VALIMP6 *(-1) VALIMP6,F1_VALIMP9 *(-1) VALIMP9,X5_DESCRI MOTDEV, F1_XOBSERV OBSERV
	FROM(SELECT F1_FILIAL, F1_EMISSAO,F1_FORNECE,F1_LOJA,A1_NOME,F1_ESPECIE,F1_SERIE,F1_DOC,
	CASE F1_MOEDA WHEN '2' THEN (F1_VALBRUT *(-1)) * F1_TXMOEDA ELSE (F1_VALBRUT *(-1)) END AS F1_VALBRUT,
	CASE F1_MOEDA WHEN '2' THEN (F1_VALMERC *(-1)) * F1_TXMOEDA ELSE (F1_VALMERC *(-1)) END AS F1_VALMERC,
	F1_DESCONT,F1_VALIMP1,F1_VALIMP2,F1_VALIMP3,F1_VALIMP4,F1_VALIMP6,F1_VALIMP9,SX5.X5_DESCRI, SF1.F1_XOBSERV
		FROM %table:SF1% SF1
			LEFT OUTER JOIN %table:SA1% SA1 
			ON  SA1.A1_COD = F1_FORNECE AND SA1.A1_LOJA = F1_LOJA AND SA1.%notDel%
			INNER JOIN %table:SD1% SD1 
			ON SD1.D1_SERIE+SD1.D1_DOC+SD1.D1_FORNECE+SD1.D1_LOJA+D1_EMISSAO = F1_SERIE+F1_DOC+F1_FORNECE+F1_LOJA+F1_EMISSAO AND SF1.%notDel%
			AND SD1.D1_TES NOT IN ('363','362','361','862','861','051') AND SD1.D1_EMISSAO BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)%
			// AND SD1.FILIAL BETWEEN %exp:mv_par03% AND %exp:mv_par04%                         
			LEFT JOIN %table:SX5%  SX5 ON SF1.F1_XMOTDEV = SX5.X5_CHAVE AND SX5.X5_TABELA = 'OP' AND SX5.%notDel%
		WHERE F1_ESPECIE = 'NCC' AND F1_SERIE <>'NCX'// AND F1_TIPODOC = '04'
			AND F1_EMISSAO BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)%
			AND F1_FILIAL BETWEEN %exp:mv_par03% AND %exp:mv_par04%
			AND SF1.%notDel%
	)TAB
	ORDER BY FILIAL, ESPECIE,EMISSAO,SERIE,DOC
	
	EndSql	
		
	//Aviso("cQuery1",GetLastQuery()[2],{"OK"},,,,,.T.)
		
	oSection1:EndQuery()
	//oSection3:SetParentQuery()
	//oSection3:SetParentFilter({|cParam| QRYSA3->A1_VEND >= cParam .and. QRYSA3->A1_VEND <= cParam},{|| QRYSA3->A3_COD})

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Inicio da impressao do fluxo do relatório                               ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	DbSelectArea(QRYSA3)
	dbGoTop()
	While !oReport:Cancel() .And. !(QRYSA3)->(Eof())
		              
		oSection1:Init()				                             
		oSection1:PrintLine()			
		//dFchAnt	:= (QRYSA3)->CT2_DATA
		//cSubLote	:= (QRYSA3)->CT2_SBLOTE
		
		dbSelectArea(QRYSA3)
		dbSkip()
	EndDo
	
	//oSection1:SetTotalText("TOTAL "+DTOC(dFchAnt)+ " : ")	//Totaliza x Fecha
	//oSection1:Print()
	oSection1:Finish()
#ELSE
#ENDIF	

Return

//+------------------------------------------------------------------------+
//|Función que verifica si existe la Pregunta, caso no exista lo crea	   |
//+------------------------------------------------------------------------+
Static Function CriaPerg(cPerg)
Local aRegs 	:= {}
Local i			:= 0   
Local nTamFil	:= TamSx3("F1_FILIAL")[1]

cPerg := PADR(cPerg,10)
aAdd(aRegs,{"01","De Fecha?     :","mv_ch1","D",08		,0,0,"G","mv_par01",""       ,""            ,""        ,""     ,""  	,""})
aAdd(aRegs,{"02","A Fecha?      :","mv_ch2","D",08		,0,0,"G","mv_par02",""       ,""            ,""        ,""     ,""   	,""})
aAdd(aRegs,{"03","De Sucursal?	:","mv_ch3","C",nTamFil	,0,1,"G","mv_par03",""       ,""            ,""        ,""     ,"SM0"	,""})
aAdd(aRegs,{"04","a Sucursal?	:","mv_ch4","C",nTamFil	,0,1,"G","mv_par04",""       ,""            ,""        ,""     ,"SM0"	,""})

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
