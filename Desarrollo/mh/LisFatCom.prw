#Include "Protheus.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³LisFatCom  ºAutor  ³EDUAR ANDIA        ºFecha ³  16/01/2016 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Informe -Listado de Facturas de Compra NF/NDP/NCP +Impuestoº±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ GAMA\Colombia                                         	  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/	
	
User Function LisFatCom()
Local oReport
Private cPerg := "LISFATCOM"
 
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

oReport := TReport():New("LISFATCOM","LISTADO FACTURA COMPRAS",cPerg,{|oReport| PrintReport(oReport)},"Relatorio de Facturas de Venta")
oReport:nFontBody := 6

/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 1  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/
                                       
oSection1 := TRSection():New(oReport,'Listado de Facturas NF-NDP-NCP',,,,,,,,,,,,,,,,,,,) 
oSection1:SetTotalInLine(.T.)
oSection1:lHeaderVisible := .F.
oSection1:SetHeaderPage(.F.) 
oSection1:SetHeaderBreak(.F.) 

TRCell():New(oSection1,"FILIAL"		,"SF1","Filial "	,,TamSx3("F1_FILIAL")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"EMISSAO"	,"SF1","Emissao "	,,TamSx3("F1_EMISSAO")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"PROVEEDOR"	,"SF1","Proveedor "	,,TamSx3("F1_FORNECE")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"LOJA"		,"SF1","Loja "		,,TamSx3("F1_LOJA")[1],.T.)		//,{|| Descrip. })
TRCell():New(oSection1,"NOME"		,"SA1","Nombre "	,,TamSx3("A2_NOME")[1],.T.)		//,{|| Descrip. })
TRCell():New(oSection1,"ESPECIE"	,"SF1","Especie "	,,TamSx3("F1_ESPECIE")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"SERIE"		,"SF1","Serie "		,,TamSx3("F1_SERIE")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"DOC"		,"SF1","Doc "		,,TamSx3("F1_DOC")[1],.T.)		//,{|| Descrip. })
TRCell():New(oSection1,"VALBRUT"	,"SF1","ValBrut "	,PesqPict('SF1','F1_VALBRUT'), TamSx3("F1_VALBRUT")[1]) 
TRCell():New(oSection1,"VALMERC"	,"SF1","ValMerc "	,PesqPict('SF1','F1_VALMERC'), TamSx3("F1_VALMERC")[1])
TRCell():New(oSection1,"DESCONT"	,"SF1","Descuento "	,,TamSx3("F1_DESCONT")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP1"	,"SF1","IVA "		,,TamSx3("F1_VALIMP1")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP2"	,"SF1","RV0 "		,,TamSx3("F1_VALIMP2")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP3"	,"SF1","ICA "		,,TamSx3("F1_VALIMP3")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP4"	,"SF1","RF0 "		,,TamSx3("F1_VALIMP4")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP6"	,"SF1","IP8 "		,,TamSx3("F1_VALIMP6")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"VALIMP9"	,"SF1","CREE "		,,TamSx3("F1_VALIMP9")[1],.T.)	//,{|| Descrip. })
TRCell():New(oSection1,"TIPODOC"	,"SF1","TipoDoc "	,,TamSx3("F1_TIPODOC")[1],.T.)	//,{|| Descrip. })

/*/
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  Secao 2  ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*/
/*
oSection2 := TRSection():New(oSection1,"Total","CT2")
oSection2:SetTotalInLine(.F.)

TRCell():New(oSection2,"VALORDEB"	,"CT2","VALOR DEB.",PesqPict('CT2','CT2_VALOR'), TamSx3("CT2_VALOR")	 [1])
TRCell():New(oSection2,"VALORCRD"	,"CT2","VALOR CRD.",PesqPict('CT2','CT2_VALOR'), TamSx3("CT2_VALOR")	 [1])
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
	
	oSection1:BeginQuery()
		
	BeginSql alias QRYSA3	
	SELECT F1_FILIAL FILIAL, F1_EMISSAO EMISSAO,F1_FORNECE PROVEEDOR,F1_LOJA LOJA,A2_NOME NOME,F1_ESPECIE ESPECIE,F1_SERIE SERIE,F1_DOC DOC,F1_VALBRUT VALBRUT,F1_VALMERC VALMERC,F1_DESCONT DESCONT,F1_VALIMP1 VALIMP1,F1_VALIMP2 VALIMP2,F1_VALIMP3 VALIMP3,F1_VALIMP4 VALIMP4,F1_VALIMP6 VALIMP6,F1_VALIMP9 VALIMP9, F1_TIPODOC TIPODOC
	FROM (
		SELECT F1_FILIAL, F1_EMISSAO,F1_FORNECE,F1_LOJA,A2_NOME,F1_ESPECIE,F1_SERIE,F1_DOC,F1_VALBRUT,F1_VALMERC,F1_DESCONT,F1_VALIMP1,F1_VALIMP2,F1_VALIMP3,F1_VALIMP4,F1_VALIMP6,F1_VALIMP9 ,F1_TIPODOC
		FROM %table:SF1% SF1
			LEFT OUTER JOIN %table:SA2% SA2 
			ON  SA2.A2_COD = F1_FORNECE AND SA2.A2_LOJA = F1_LOJA AND SA2.D_E_L_E_T_ = ''
		WHERE (F1_TIPODOC = '10' or F1_TIPODOC = '13')
			AND F1_EMISSAO BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)%
			AND F1_FILIAL BETWEEN %exp:mv_par03% AND %exp:mv_par04%
			AND SF1.D_E_L_E_T_ = ''
	) TAB
	UNION
	
	SELECT F1_FILIAL FILIAL, F1_EMISSAO EMISSAO,F1_FORNECE PROVEEDOR,F1_LOJA LOJA,A2_NOME NOME,F1_ESPECIE ESPECIE,F1_SERIE SERIE,F1_DOC DOC,F1_VALBRUT VALBRUT,F1_VALMERC VALMERC,F1_DESCONT DESCONT,F1_VALIMP1 VALIMP1,F1_VALIMP2 VALIMP2,F1_VALIMP3 VALIMP3,F1_VALIMP4 VALIMP4,F1_VALIMP6 VALIMP6,F1_VALIMP9 VALIMP9,F1_TIPODOC TIPODOC
	FROM (
		SELECT F1_FILIAL, F1_EMISSAO,F1_FORNECE,F1_LOJA,A2_NOME,F1_ESPECIE,F1_SERIE,F1_DOC,F1_VALBRUT,F1_VALMERC,F1_DESCONT,F1_VALIMP1,F1_VALIMP2,F1_VALIMP3,F1_VALIMP4,F1_VALIMP6,F1_VALIMP9 ,F1_TIPODOC
		FROM %table:SF1% SF1
			LEFT OUTER JOIN %table:SA2% SA2 
			ON  SA2.A2_COD = F1_FORNECE AND SA2.A2_LOJA = F1_LOJA AND SA2.D_E_L_E_T_ = ''
		WHERE F1_ESPECIE = 'NDP' //AND F1_TIPODOC = '09'
			AND F1_EMISSAO BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)%
			AND F1_FILIAL BETWEEN %exp:mv_par03% AND %exp:mv_par04%
			AND SF1.D_E_L_E_T_ = ''
	) TAB
	UNION
		
	SELECT F2_FILIAL FILIAL, F2_EMISSAO EMISSAO,F2_CLIENTE PROVEEDOR,F2_LOJA LOJA,A2_NOME NOME,F2_ESPECIE ESPECIE,F2_SERIE SERIE,F2_DOC DOC,F2_VALBRUT VALBRUT,F2_VALMERC VALMERC,F2_DESCONT DESCONT,F2_VALIMP1 VALIMP1,F2_VALIMP2 VALIMP2,F2_VALIMP3 VALIMP3,F2_VALIMP4 VALIMP4,F2_VALIMP6 VALIMP6,F2_VALIMP9 VALIMP9,F2_TIPODOC TIPODOC
	FROM (
		SELECT F2_FILIAL, F2_EMISSAO,F2_CLIENTE,F2_LOJA,A2_NOME,F2_ESPECIE,F2_SERIE,F2_DOC,F2_VALBRUT,F2_VALMERC,F2_DESCONT,F2_VALIMP1,F2_VALIMP2,F2_VALIMP3,F2_VALIMP4,F2_VALIMP6,F2_VALIMP9 ,F2_TIPODOC
		FROM %table:SF2% SF2
			LEFT OUTER JOIN %table:SA2% SA2 
			ON  SA2.A2_COD = F2_CLIENTE AND SA2.A2_LOJA = F2_LOJA AND SA2.D_E_L_E_T_ = ''
		WHERE F2_ESPECIE = 'NCP' //AND F2_TIPODOC = '07'
			AND F2_EMISSAO BETWEEN %exp:Dtos(mv_par01)% AND %exp:Dtos(mv_par02)%
			AND F2_FILIAL BETWEEN %exp:mv_par03% AND %exp:mv_par04%
			AND SF2.D_E_L_E_T_ = ''
	) TAB
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
