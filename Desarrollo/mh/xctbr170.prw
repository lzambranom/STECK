#Include "CTBR170.Ch"
#Include "PROTHEUS.Ch"
     

#DEFINE TAM_VALOR           23
#define	TAM_TOTAIS			17


// 17/08/2009 -- Filial com mais de 2 caracteres

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o	 ³CTBR170	³ Autor ³ Cicero J. Silva   	³ Data ³ 03.08.06 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Balancete 6 Colunas                         	 		      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe	 ³ CTBR170()    											  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno	 ³ Nenhum       											  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso 	     ³ Generico     											  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Nenhum													  ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function XCTBR170()
Local aArea 		:= GetArea()
Local oReport
Local aCtbMoeda		:= {}
Local lOk 			:= .T.

PRIVATE cPerg	 	:= "CTR170" 
PRIVATE nomeProg	:= "CTBR170"
PRIVATE cTipoAnt	:= ""
PRIVATE aSelFil		:= {}

CtAjustSx1(cPerg)

If FindFunction("TRepInUse") .And. TRepInUse()
	
	If ( !AMIIn(34) )		// Acesso somente pelo SIGACTB
		lOk := .F. 
	EndIf
	
	Pergunte(cPerg,.T.) // Precisa ativar as perguntas antes das definicoes.
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Verifica se usa Set Of Books + Plano Gerencial (Se usar Plano³
	//³ Gerencial -> montagem especifica para impressao)				  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If !ct170Valid(mv_par06)
		lOk := .F.
	Endif
	
	If lOk
		aCtbMoeda  	:= CtbMoeda(mv_par08)
		If Empty(aCtbMoeda[1])                       
	      Help(" ",1,"NOMOEDA")
	      lOk := .F.
	   Endif
	Endif
	
	If mv_par24 == 1 .And. Len( aSelFil ) <= 0
		aSelFil := AdmGetFil()
		If Len( aSelFil ) <= 0
			lOk := .F.
		EndIf 
	EndIf
	
	If lOk
		oReport := ReportDef(aCtbMoeda)
		oReport:PrintDialog()
	EndIf
Else
	Return CTBR170R3() // Executa versão anterior do fonte
Endif

RestArea(aArea)

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ReportDef º Autor ³ Cicero J. Silva    º Data ³  07/07/06  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Definicao do objeto do relatorio personalizavel e das      º±±
±±º          ³ secoes que serao utilizadas                                º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±³Parametros³ aCtbMoeda  - Matriz ref. a moeda                           ³±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function ReportDef(aCtbMoeda)

Local oReport
Local oPlcontas
Local oTotais

Local cDesc1 	 := OemToAnsi(STR0001)	//"Este programa ira imprimir o Balancete de Verificacao de 6 colunas. As colunas"
Local cDesc2 	 := OemToansi(STR0002)	//"impressas sao conta, descricao, debito, credito, tambem saldo anterior e saldo"
Local cDesc3	 := OemToansi(STR0016)	//"atual do periodo que sao demonstrados separadamente a debito e a credito."
Local titulo 	 := OemToAnsi(STR0003)	//"Balancete de Verificacao"

Local aSetOfBook	:= CTBSetOf(mv_par06)
Local cSeparador	:= "" 
Local cMascara		:= IIf( Empty(aSetOfBook[2]),GetMv("MV_MASCARA"),RetMasCtb(aSetOfBook[2],@cSeparador))
Local cPicture		:= IIf( Empty(aSetOfBook[4]),PesqPict("CT2","CT2_VALOR"),aSetOfBook[4])
Local nDecimais 	:= DecimalCTB(aSetOfBook,mv_par08)

Local lmov			:= Iif(mv_par16==1,.T.,.F.)	// Imprime Coluna Mov ?
Local lNormal		:= Iif(mv_par19==1,.T.,.F.)	// Imprimir Codigo? Normal / Reduzido
Local lPula			:= Iif(mv_par17==1,.T.,.F.)	// Salta linha sintetica ? 
Local lPrintZero	:= Iif(mv_par18==1,.T.,.F.)	// Imprime valor 0.00    ?
Local cSegAte   	:= mv_par21						// Imprimir Ate o segmento?
Local aTamConta		:= TAMSX3("CT1_CONTA")
Local aTamCtaRes	:= TAMSX3("CT1_RES")
Local nTamGrupo		:= Len(CriaVar("CT1->CT1_GRUPO"))
Local nTamCta 		:= Len(CriaVar("CT1->CT1_DESC"+mv_par08)) 

oReport := TReport():New(nomeProg,titulo,,{|oReport| ReportPrint(oReport,aSetOfBook,aCtbMoeda,cMascara,cPicture,cSegAte,nDecimais)},cDesc1+cDesc2+cDesc3)
oReport:SetLandScape(.T.)
oReport:nFontBody := 4
// Sessao 1
oPlcontas := TRSection():New(oReport,STR0021,{"cArqTmp","CT1"},/*aOrder*/,/*lLoadCells*/,/*lLoadOrder*/)//"Periodos"
oPlcontas:SetTotalInLine(.F.)

TRCell():New(oPlcontas,"CONTA"		,"cArqTmp"	,STR0022		,/*Picture*/,aTamConta[1]	,/*lPixel*/,{|| IIF(cArqTmp->TIPOCONTA=="2","  ","")+EntidadeCTB(cArqTmp->CONTA ,0,0,70,.F.,cMascara,cSeparador,,,,,.F.) })// Codigo da Conta
TRCell():New(oPlcontas,"CTARES"		,"cArqTmp"	,STR0023		,/*Picture*/,aTamCtaRes[1]	,/*lPixel*/,{|| IIF(cArqTmp->TIPOCONTA=="2","  ","")+EntidadeCTB(cArqTmp->CTARES,0,0,70,.F.,cMascara,cSeparador,,,,,.F.) })// Codigo Reduzido da Conta
TRCell():New(oPlcontas,"DESCCTA"	,"cArqTmp"	,STR0024		,/*Picture*/,nTamCta		,/*lPixel*/,/*{|| }*/)// Descricao da Conta
TRCell():New(oPlcontas,"SLDANTDEB"	," "		,STR0025		,/*Picture*/,TAM_VALOR		,/*lPixel*/,{|| IIF(cArqTmp->SALDOANT < 0,u_xValCtb(cArqTmp->SALDOANT,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),IIF(cArqTmp->SALDOANT > 0,u_xValCtb(0,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),u_xValCtb(0,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.)) )},"RIGHT",,"RIGHT" )// Saldo Anterior
TRCell():New(oPlcontas,"SLDANTCRD"	," "		,STR0026		,/*Picture*/,TAM_VALOR		,/*lPixel*/,{|| IIF(cArqTmp->SALDOANT < 0,u_xValCtb(0,,,TAM_VALOR,nDecimais,.T.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),IIF(cArqTmp->SALDOANT > 0,u_xValCtb(cArqTmp->SALDOANT,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),u_xValCtb(0,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.)) )},"RIGHT",,"RIGHT" )// Saldo Anterior
TRCell():New(oPlcontas,"SALDODEB"	,"cArqTmp"	,STR0027		,/*Picture*/,TAM_VALOR		,/*lPixel*/,{|| u_xValCtb(cArqTmp->SALDODEB ,,,TAM_VALOR,2,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.)},"RIGHT",,"RIGHT" )// Debito
TRCell():New(oPlcontas,"SALDOCRD"	,"cArqTmp"	,STR0028		,/*Picture*/,TAM_VALOR		,/*lPixel*/,{|| u_xValCtb(cArqTmp->SALDOCRD ,,,TAM_VALOR,2,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.)},"RIGHT",,"RIGHT" )// Credito
TRCell():New(oPlcontas,"MOVIMENTO"	,"cArqTmp"	,STR0029		,/*Picture*/,TAM_VALOR		,/*lPixel*/,{|| u_xValCtb(cArqTmp->MOVIMENTO,,,TAM_VALOR,2,.T.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.)},"RIGHT",,"RIGHT" )// Movimento do Periodo
TRCell():New(oPlcontas,"SLDATUDEB"	," "		,STR0030		,/*Picture*/,TAM_VALOR		,/*lPixel*/,{|| IIF(cArqTmp->SALDOATU < 0,u_xValCtb(cArqTmp->SALDOATU,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),IIF(cArqTmp->SALDOATU > 0,u_xValCtb(0,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),u_xValCtb(0,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.)) )},"RIGHT",,"RIGHT")// Saldo Atual
TRCell():New(oPlcontas,"SLDATUCRD"	," "		,STR0031		,/*Picture*/,TAM_VALOR		,/*lPixel*/,{|| IIF(cArqTmp->SALDOATU < 0,u_xValCtb(0,,,TAM_VALOR,nDecimais,.T.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),IIF(cArqTmp->SALDOATU > 0,u_xValCtb(cArqTmp->SALDOATU,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.),u_xValCtb(0,,,TAM_VALOR,nDecimais,.F.,cPicture,cArqTmp->NORMAL,,,,,,lPrintZero,.F.)) )},"RIGHT",,"RIGHT")// Saldo Atual
TRCell():New(oPlcontas,"NORMAL"		,"cArqTmp"	,STR0032		,/*Picture*/,01				,/*lPixel*/,/*{|| }*/)// Situacao
TRCell():New(oPlcontas,"TIPOCONTA"	,"cArqTmp"	,STR0033		,/*Picture*/,01				,/*lPixel*/,/*{|| }*/)// Conta Analitica / Sintetica           
TRCell():New(oPlcontas,"GRUPO"		,"cArqTmp"	,STR0034		,/*Picture*/,nTamGrupo		,/*lPixel*/,/*{|| }*/)// Grupo Contabil
TRCell():New(oPlcontas,"NIVEL1"		,"cArqTmp"	,STR0035		,/*Picture*/,01				,/*lPixel*/,/*{|| }*/)// Logico para identificar se 

oPlcontas:OnPrintLine( {|| ( IIf( lPula .And. (cTipoAnt == "1" .Or. (cArqTmp->TIPOCONTA == "1" .And. cTipoAnt == "2")), oReport:SkipLine(),NIL),; // mv_par17	-	Salta linha sintetica ?
								 cTipoAnt := cArqTmp->TIPOCONTA;
							)  })

TRPosition():New( oPlcontas, "CT1", 1, {|| xFilial("CT1") + cArqTMP->CONTA })

oPlcontas:Cell("NORMAL"   ):Disable()
oPlcontas:Cell("TIPOCONTA"):Disable()
oPlcontas:Cell("GRUPO"    ):Disable()
oPlcontas:Cell("NIVEL1"   ):Disable()

If lNormal
	oPlcontas:Cell("CTARES"):Disable()
Else
	oPlcontas:Cell("CONTA" ):Disable()
EndIf

If !lMov
	oPlcontas:Cell("MOVIMENTO"):Disable()
EndIf

oPlcontas:SetHeaderPage()

oTotais := TRSection():New( oReport,STR0036,,, .F., .F. ) //"Total"
TRCell():New( oTotais, "TOT"			,,""		,/*Picture*/,aTamConta[1]+nTamCta,/*lPixel*/,/*{|| code-block de impressao }*/)
TRCell():New( oTotais, "TOT_DEBITO"		,,STR0037	,/*Picture*/,TAM_TOTAIS+3,/*lPixel*/,/*{|| code-block de impressao }*/)
TRCell():New( oTotais, "TOT_CREDITO"	,,STR0038	,/*Picture*/,TAM_TOTAIS+3,/*lPixel*/,/*{|| code-block de impressao }*/)

Return oReport

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ReportPrintº Autor ³ Cicero J. Silva    º Data ³  14/07/06  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Definicao do objeto do relatorio personalizavel e das      º±±
±±º          ³ secoes que serao utilizadas                                º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function ReportPrint(oReport,aSetOfBook,aCtbMoeda,cMascara,cPicture,cSegAte,nDecimais)

Local oPlcontas		:= oReport:Section(1)
Local oTotais	 	:= oReport:Section(2)  

Local cArqTmp
Local cFiltro		:= oPlcontas:GetAdvPlExp('CT1') 
Local lImpAntLP		:= Iif(mv_par22 == 1,.T.,.F.)	// Posicao Ant. L/P? Sim / Nao
Local dDataLP		:= mv_par23						// Data Lucros/Perdas?
Local lVlrZerado	:= Iif(mv_par07==1,.T.,.F.)		// Saldos Zerados?
Local dDataFim	 	:= mv_par02						// Data Final
Local lImpSint		:= Iif(mv_par05=1 .Or. mv_par05 ==3,.T.,.F.)
Local nDivide		:= mv_par20
Local cDescMoeda 	:= Alltrim(aCtbMoeda[2])
Local l132			:= .T.
Local lPrintZero	:= Iif(mv_par18==1,.T.,.F.)		// Imprime valor 0.00    ?
Local nDigitate		:= 0
Local nTotDeb		:= 0
Local nGrpDeb		:= 0
Local nTotCrd		:= 0
Local nGrpCrd		:= 0


	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Carrega titulo do relatorio: Analitico / Sintetico			  ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	IF mv_par05 == 1      
		Titulo := STR0009  //"BALANCETE CONVERSAO MOEDAS SINTETICO DE "
	ElseIf mv_par05 == 2
		Titulo := STR0006  //"BALANCETE CONVERSAO MOEDAS SINTETICO DE "
	ElseIf mv_par05 == 3
		Titulo := STR0017  //"BALANCETE CONVERSAO MOEDAS DE "
	EndIf
	Titulo += 	DTOC(mv_par01) + OemToAnsi(STR0007) + Dtoc(mv_par02) + ;
					OemToAnsi(STR0008) + cDescMoeda
	
	If mv_par10 > "1"
		Titulo += " (" + Tabela("SL", mv_par10, .F.) + ")"
	EndIf
		      
	Titulo := OemToAnsi("LIBRO OFICIAL MAYOR Y BALANCE - ") // + Chr(13)+Chr(10)
	Titulo += 	DTOC(mv_par01) + OemToAnsi(STR0007) + Dtoc(mv_par02) + OemToAnsi(STR0008) + cDescMoeda
	
	oReport:SetTitle(Titulo)
	oReport:SetPageNumber(mv_par09)

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Monta Arquivo Temporario para Impressao					     ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	MsgMeter({|	oMeter, oText, oDlg, lEnd | ;
			CTGerPlan(oMeter, oText, oDlg, @lEnd,@cArqTmp,;
			 mv_par01,mv_par02,"CT7","",mv_par03,mv_par04,,,,,,,mv_par08,;
			  mv_par10,aSetOfBook,mv_par12,mv_par13,mv_par14,mv_par15,;
			   l132,.F.,mv_par11,,lImpAntLP,dDataLP, nDivide,lVlrZerado,,,,,,,,,,,,,,lImpSint,cFiltro /*aReturn[7]*/,,,,,,,,,,,,aSelFil)},;				
				OemToAnsi(OemToAnsi(STR0015)),;  //"Criando Arquivo Tempor rio..."
				 OemToAnsi(STR0003))  				//"Balancete Verificacao"
	
	
	dbSelectArea("cArqTmp")
	dbGoTop()

	oPlcontas:SetMeter( RecCount() )
	cGrupoAnt := AllTrim(cArqTmp->GRUPO)

	oPlcontas:NoUserFilter()

	oPlcontas:Init()
   While !Eof()           

      If oPlcontas:Cancel()
	    	Exit
    	EndIf        

	    oPlcontas:IncMeter() 

		If R170Fil(cSegAte, nDigitAte,cMascara)
			dbSkip()
			Loop
		EndIf

    	oPlcontas:Printline()

		nTotDeb += R170Soma("D",cSegAte)
		nGrpDeb += R170Soma("D",cSegAte)
		nTotCrd += R170Soma("C",cSegAte)
		nGrpCrd += R170Soma("C",cSegAte)

    	dbSkip()

   		If mv_par11 == 1 // mv_par11 - Quebra por Grupo Contabil? 
			If cGrupoAnt <> AllTrim(cArqTmp->GRUPO)

				oTotais:Cell("TOT"):SetTitle(OemToAnsi(STR0020) + cGrupoAnt + " )")
				oTotais:Cell( "TOT_DEBITO"	):SetBlock( { || u_xValCtb(nGrpDeb,,,TAM_VALOR,nDecimais,.F.,cPicture,"1",,,,,,lPrintZero,.F.) } )
				oTotais:Cell( "TOT_CREDITO"	):SetBlock( { || u_xValCtb(nGrpCrd,,,TAM_VALOR,nDecimais,.F.,cPicture,"2",,,,,,lPrintZero,.F.) } )
										
				oTotais:Init()
					oTotais:PrintLine()
				oTotais:Finish()
				oReport:SkipLine()
				
				oReport:EndPage()
				
				nGrpDeb	:= 0
				nGrpCrd	:= 0		
				cGrupoAnt := AllTrim(cArqTmp->GRUPO)
			EndIf
		Else
			If cArqTmp->NIVEL1				// Sintetica de 1o. grupo
				oReport:EndPage()
			EndIf
		EndIf
	EndDo

	oPlcontas:Finish()

	oTotais:Cell("TOT"):SetTitle(OemToAnsi(STR0011))  		// T O T A I S  D O  P E R I O D O:
	oTotais:Cell("TOT_DEBITO"):SetBlock( { || u_xValCtb(nTotDeb,,,TAM_VALOR,nDecimais,.F.,cPicture,"1",,,,,,lPrintZero,.F.) } )
	oTotais:Cell("TOT_CREDITO"):SetBlock( { || u_xValCtb(nTotCrd,,,TAM_VALOR,nDecimais,.F.,cPicture,"2",,,,,,lPrintZero,.F.) } )
	oTotais:Init()
		oTotais:PrintLine()
	oTotais:Finish()

	
	dbSelectArea("cArqTmp")
	Set Filter To
	dbCloseArea() 
	If Select("cArqTmp") == 0
		FErase(cArqTmp+GetDBExtension())
		FErase(cArqTmp+OrdBagExt())
	EndIF	
	dbselectArea("CT2")

Return                                                                          

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³R170Soma  ºAutor  ³Cicero J. Silva     º Data ³  24/07/06   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³                                                            º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ CTBR045                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function R170Soma(cTipo,cSegAte)

Local nRetValor := 0

	If mv_par05 == 1	// So imprime Sinteticas - Soma Sinteticas
		If cArqTmp->TIPOCONTA == "1" .And. cArqTmp->NIVEL1            
			If cTipo == "D"
				nRetValor := cArqTmp->SALDODEB
			ElseIf cTipo == "C"
				nRetValor := cArqTmp->SALDOCRD
			EndIf
		EndIf
	Else	// Soma Analiticas
		If Empty(cSegAte)	//Se nao tiver filtragem ate o nivel
			If cArqTmp->TIPOCONTA == "2"
				If cTipo == "D"
					nRetValor := cArqTmp->SALDODEB
				ElseIf cTipo == "C"
					nRetValor := cArqTmp->SALDOCRD
				EndIf
			EndIf
		Else							//Se tiver filtragem, somo somente as sinteticas
			If cArqTmp->TIPOCONTA == "1" .And. cArqTmp->NIVEL1
				If cTipo == "D"
					nRetValor := cArqTmp->SALDODEB
				ElseIf cTipo == "C"
					nRetValor := cArqTmp->SALDOCRD
				EndIf
			EndIf	
    	Endif			
	EndIf

Return nRetValor                                                                         


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³R170Fil   ºAutor  ³Cicero J. Silva     º Data ³  24/07/06   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³                                                            º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ CTBR170                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function R170Fil(cSegAte, nDigitAte,cMascara)

Local lDeixa := .F.

	If mv_par05 == 1					// So imprime Sinteticas
		If cArqTmp->TIPOCONTA == "2"
			lDeixa := .T.
		EndIf
	ElseIf mv_par05 == 2				// So imprime Analiticas
		If cArqTmp->TIPOCONTA == "1"
			lDeixa := .T.
		EndIf
	EndIf                
	
	If mv_par07 == 2	// Saldos Zerados nao serao impressos
		If (Abs(cArqTmp->SALDOANT)+Abs(cArqTmp->SALDOATU)+Abs(cArqTmp->SALDODEB)+Abs(cArqTmp->SALDOCRD)) == 0
			lDeixa := .T.
		EndIf
	EndIf

	//Filtragem ate o Segmento ( antigo nivel do SIGACON)		
	If !Empty(cSegAte)
		// Verifica Se existe filtragem Ate o Segmento
		nDigitAte := CtbRelDig(cSegAte,cMascara) 	

		If Len(Alltrim(cArqTmp->CONTA)) > nDigitAte
			lDeixa := .T.
		Endif
	EndIf

//dbSelectArea("cArqTmp")

Return (lDeixa)               

//----------- funcion de impresion de valores para corregir mascara de impresion y que no se agregue arrobaE
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
±±³          ³ ExpL2 = Se eh grafico ou nao                              		     ³±±
±±³          ³ ExpO1 = Objeto oPrint                                     		     ³±±
±±³          ³ ExpC4 = Tipo do sinal utilizado                           		     ³±±
±±³          ³ ExpC5 = Identificar [USADO em modo gerencial]             		     ³±±
±±³          ³ ExpL3 = Imprime zero                                      		     ³±±
±±³          ³ ExpL4 = Se .F., ao inves de imprimir retornara o valor como caracter³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function xValCtb(	nSaldo,nLin,nCol,nTamanho,nDecimais,lSinal,cPicture,;
							cTipo,cConta,lGraf,oPrint,cTipoSinal, cIdentifi,lPrintZero,lSay)

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
//³ Tipo N -> Imprime saldo com sinal (-) se o saldo for credor³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DEFAULT cTipoSinal := GetMV("MV_TPVALOR")       // Assume valor default

DEFAULT lSay := .T.

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
	If cTipoSinal == "D" .Or. cTipoSinal == "C" .Or. cTipoSinal == "N"			// D(Default) ou C(so Credito)
		If !lInformada
			cPicture := "@E " + cPicture
		Endif	         
		If lSinal
			If nSaldo < 0
				If lGraf                                     
					If cTipoSinal == "D"				
						cCharSinal := Iif(cPaisLoc<>"MEX","D","C")
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
							cCharSinal := Iif(cPaisLoc<>"MEX","C","A")
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
		                           
		//Se o parametro MV_TPVALOR == "N" => nao considera a condicao normal da conta. 
		//So imprime sinal (-) se o saldo for credor. 
		If cTipoSinal == "N"
			If lSinal 
				cImpSaldo := Transform(nSaldo*(-1),cPicture)
			Else
				cImpSaldo := Transform(ABS(nSaldo),cPicture)			                                                 
			EndIf
		Else
			cImpSaldo := Transform(Abs(nSaldo),cPicture)+cCharSinal
		EndIf
		
		If lGraf                                                
			If cIdentifi # Nil .And. cIdentifi $ "34"
				If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
					oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
				Else
					oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
				EndIf
			Else
				oPrint:Say(nLin,nCol,cImpSaldo,oFont08)				
			Endif
		ElseIf lSay
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
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else						
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					ElseIf lSay
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
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					ElseIf lSay
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
					If !lInformada
						cPicture := "@E " + cPicture
					EndIf 
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					ElseIf lSay
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
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif					
					ElseIf lSay
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
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					ElseIf lSay
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
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					ElseIf lSay
						@ nLin, nCol pSay nSaldo Picture cPicture
					Endif
				EndIf
			Else
				If (cTipoSinal) == "S"                  	// Sinal
					If !lSinal .And. cTipo == "2" 			// Conta Credora
						nSaldo := Abs(nSaldo)
					EndIf
					If !lInformada
						cPicture := "@E " + cPicture
					EndIf 
					If lGraf
						cImpSaldo := Transform(nSaldo,cPicture)			
						If cIdentifi # Nil .And. cIdentifi $ "34"
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif
					ElseIf lSay
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
							If cIdentifi == "3" .And. Type("oCouNew08N") <> "U"
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08N)
							Else
								oPrint:Say(nLin,nCol,cImpSaldo,oCouNew08S)
							EndIf
						Else
							oPrint:Say(nLin,nCol,cImpSaldo,oFont08)
						Endif					
					ElseIf lSay
						@ nLin, nCol pSay nSaldo Picture cPicture
					Endif
				EndIf
			EndIf
		EndIf
	EndIf
EndIf
RestArea(aSaveArea)
         
If lSay
	Return
Else
	If Empty( cImpSaldo )
		If lPrintZero
			cImpSaldo := Transform(nSaldo,cPicture)
		EndIf
	EndIf
	Return cImpSaldo
EndIf


 



