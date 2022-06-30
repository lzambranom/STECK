#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ARCTB001 ºAutor  ³Pablo Baez    ºFecha ³  17/10/10   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Reporte Ventas por cuenta contable y tipo Responsable       º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Arimex                                 ºModulo ³ Contabilidadº±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function ARCTB001()

Local oReport

If FindFunction("TRepInUse") .And. TRepInUse()
	oReport := ReportDef()
	oReport:PrintDialog()
Else
	MsgStop( 'Informe Solo Para R4!', 'Imposible Continuar' )
EndIf

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcion   ³ ReportDef³ Autor ³                       ³ Data ³ 05/11/09 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descrip.  ³                                                            ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ReportDef
Local oReport
Local oSection1
Local oSection2
Local oCell
Local cAliasTRB	:= GetNextAlias()
Local cTitSec1	:= "Informe de Ventas X Cta. Cont. y tipo Responsable"
Local oBreak
Local otorcorr
Private cPerg  	:= "ARCTB001"
Private cTit	:= OemToAnsi("Informe de Ventas X Cta. Cont. y tipo Responsable")
Private lArchExcel  := .F.
Private cClient :=''
Private cDestip :=''



AjustaSX1()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Creaci¢n del componente de impresion                                    ³
//³                                                                        ³
//³TReport():New                                                           ³
//³ExpC1 : Nombre del Informe                                              ³
//³ExpC2 : Titulo                                                          ³
//³ExpC3 : Pregunta                                                        ³
//³ExpB4 : Bloque de codigo que ser  ejecutado al confirmar la impresion   ³
//³ExpC5 : Descripcion                                                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

oReport:= TReport():New('ARCTB001',OemToAnsi('Informe de Ventas X Cta. Cont. y tipo Responsable'),cPerg, ;
{|oReport| ReportPrint(oReport,cAliasTRB)}, cTit)

oReport:SetLandScape()
//oReport:SetPortrait()
oReport:SetTotalInLine(.F.)
//---------------------------------------------------
//Aumenta el tamanho del fuente del reporte completo
//---------------------------------------------------
//oReport:CFONTBODY:="TAHOMA"
//oReport:nFontBody:=7
//oReport:NLINEHEIGHT := 40
//---------------------------------------------------

Pergunte(cPerg,.F.)

oSection1 := TRSection():New(oReport," ",{cAliasTRB})

oSection1:SetHeaderPage() //El titulo de la seccion se imprime al principio

TRCell():New(oSection1,'CONTA'		,cAliasTRB,'Cuenta contable'		, /*Picture */ , 10, /*lPixel */, /*{|| code-block de impressao } *//*{|| allTrim((cAliasTRB)->CLI)} */)
TRCell():New(oSection1,'DESCONTA'		,cAliasTRB,'Descripción contable'		, /*Picture */ , 40, /*lPixel */, /*{|| code-block de impressao } *//*{|| allTrim((cAliasTRB)->CLI)} */)
TRCell():New(oSection1,'TIPO'			,cAliasTRB,'Tipo Responsable' 				, /*Picture */ ,  40, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'NETO'			,cAliasTRB,'NETO' 				, PesqPict("SF2","F2_VALBRUT") ,  12, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'NOGRAV'		,cAliasTRB,'No Gravado' 		, PesqPict("SF2","F2_VALBRUT") , 14, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'IVA21'			,cAliasTRB,'Iva 21%' 				, PesqPict("SF2","F2_VALBRUT") ,  12, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'IVA105'		,cAliasTRB,'Iva 10.5 %'			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'IVA27'		,cAliasTRB,'Iva 27 %'			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'IIBB'			,cAliasTRB,'Perc IB' 				, PesqPict("SF2","F2_VALBRUT") ,  10, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'IVP'		,cAliasTRB,'Perc. IVP'			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'EXPORT'		,cAliasTRB,'Exportación'			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection1,'TOTAL'		,cAliasTRB,'Total '			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )

oSection2 := TRSection():New(oReport," ",{cAliasTRB})
oSection2:SetHeaderPage(.F.) //El titulo de la seccion se imprime al principio
TRCell():New(oSection2,'TIPOT'			,cAliasTRB,'Tipo Responsable' 				, /*Picture */ ,  40, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'NETOT'			,cAliasTRB,'NETO' 				, PesqPict("SF2","F2_VALBRUT") ,  12, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'NOGRAVT'		,cAliasTRB,'No Gravado' 		, PesqPict("SF2","F2_VALBRUT") , 14, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'IVA21T'			,cAliasTRB,'Iva 21%' 				, PesqPict("SF2","F2_VALBRUT") ,  12, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'IVA105T'		,cAliasTRB,'Iva 10.5 %'			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'IVA27T'			,cAliasTRB,'Iva 27%' 				, PesqPict("SF2","F2_VALBRUT") ,  12, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'IIBBT'			,cAliasTRB,'Perc IB' 				, PesqPict("SF2","F2_VALBRUT") ,  10, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'IVPT'		,cAliasTRB,'Perc. IVP'			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )
TRCell():New(oSection2,'TOTALT'		,cAliasTRB,'Total '			, PesqPict("SF2","F2_VALBRUT") ,  17, /*lPixel */, /*{|| code-block de impressao } */ )

oBreak := TRBreak():New(oSection1, {|| (caliastrb)->(CONTA)} , {||"Total por Cuenta :"}) //"S U B - T O T A L --->"

TRFunction():New(oSection1:Cell("TOTAL"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("EXPORT"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("IVP"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("IIBB"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("IVA105"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("IVA21"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("IVA27"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("NOGRAV"),"","SUM",oBreak,,,,.F.,.T.)
TRFunction():New(oSection1:Cell("NETO"),"","SUM",oBreak,,,,.F.,.T.)

obreak2 := TRFunction():New(oSection1:Cell("TOTAL"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("EXPORT"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("IVP"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("IIBB"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("IVA105"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("IVA21"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("IVA27"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("NOGRAV"),"","SUM",,,,,.F.,.F.)
obreak2 := TRFunction():New(oSection1:Cell("NETO"),"","SUM",,,,,.F.,.F.)


Return( oReport )


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcion   ³ ReportDef³ Autor ³                       ³ Data ³ 05/11/09 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descrip.  ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³                                                            ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ReportPrint(oReport,cAliasTRB)
Local oSection1	:= oReport:Section(1)
Local oSection2	:= oReport:Section(2)
Local oBreak
Local oBreak1
Local aArea
Local cDesEst   := ""
Local cOrden	:= ""
Local nTotReg	:= 0
Local cCorte	:= ""
Local bPrim     := .T.
Local xImpu    :={}
Local nAuxTotBru:= 0
Local nAuxTotal := 0
Local cDescri   := ""
Local nAuxAliq  := 0
Local nAuxImp   := 0
Local nTxMoeda  := 0
Local nVlrUnit  := 0
Local nVlrTot   := 0
Local cQuery 	:= ""
Local cAntProc	:= ""
Local nTasa 	:= 0
Local _ntotI	:= 0
Local _ntotE	:= 0
Local _ntotF	:= 0
Local _ntotM	:= 0
Local _ntotN	:= 0
Local _ntotS	:= 0
Local _ntotX	:= 0
Local _ntotZ	:= 0
Local _ntotNGI	:= 0
Local _ntotNGE	:= 0
Local _ntotNGF	:= 0
Local _ntotNGM	:= 0
Local _ntotNGN	:= 0
Local _ntotNGS	:= 0
Local _ntotNGX	:= 0
Local _ntotNGZ	:= 0
Local _nTot21I	:= 0
Local _nTot105I	:= 0
Local _nTotIVA27I	:= 0
Local _nTotIVPI		:= 0
Local _nTotNETOI	:= 0
LOCAL _nTotIIBBI	:= 0
Local _nTot21E	:= 0
Local _nTot105E	:= 0
Local _nTotIVA27E	:= 0
Local _nTotIVPE		:= 0
Local _nTotNETOE	:= 0
LOCAL _nTotIIBBE	:= 0
Local _nTot21F	:= 0
Local _nTot105F	:= 0
Local _nTotIVA27F	:= 0
Local _nTotIVPF		:= 0
Local _nTotNETOF	:= 0
LOCAL _nTotIIBBF	:= 0
Local _nTot21M	:= 0
Local _nTot105M	:= 0
Local _nTotIVA27M	:= 0
Local _nTotIVPM		:= 0
Local _nTotNETOM	:= 0
LOCAL _nTotIIBBM	:= 0
Local _nTot21N	:= 0
Local _nTot105N	:= 0
Local _nTotIVA27N	:= 0
Local _nTotIVPN		:= 0
Local _nTotNETON	:= 0
LOCAL _nTotIIBBN	:= 0
Local _ntot21X	:= 0
Local _nTot105X	:= 0
Local _nTotIVA27X	:= 0
Local _nTotIVPX		:= 0
Local _nTotNETOX	:= 0
LOCAL _nTotIIBBX	:= 0
Local _nTot21Z	:= 0
Local _nTot105Z	:= 0
Local _nTotIVA27Z	:= 0
Local _nTotIVPZ		:= 0
Local _nTotNETOZ	:= 0
LOCAL _nTotIIBBZ	:= 0
Local _nTot21S	:= 0
Local _nTot105S	:= 0
Local _nTotIVA27S	:= 0
Local _nTotIVPS		:= 0
Local _nTotNETOS	:= 0
LOCAL _nTotIIBBS	:= 0






oReport:SetTitle(oReport:Title() )

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Filtragem do relatorio                                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ



cQuery := "SELECT D2_CONTA AS CONTA,SUM(NETO)AS NETO, " + CRLF
cQuery += " SUM(IVA21) AS IVA21,  " + CRLF
cQuery += " SUM(IVA105)AS IVA105, " + CRLF
cQuery += " SUM(IVA27) AS IVA27, "  + CRLF
cQuery += " SUM(IIBB) AS IIBB, "    + CRLF
cQuery += " SUM(EXENTO) AS EXENTO, "    + CRLF
cQuery += " SUM(IVP) AS IVP ,A1_TIPO FROM VCTB"+CEMPANT + CRLF
cQuery += " WHERE D2_EMISSAO BETWEEN '"+DTOS(MV_PAR01)+"' AND '"+DTOS(MV_PAR02)+"' " + CRLF
cQuery += " AND D2_CONTA BETWEEN '"+MV_PAR03+"' AND '"+MV_PAR04+"'     " + CRLF
cQuery += " AND D2_CLIENTE BETWEEN '"+MV_PAR05+"' AND '"+MV_PAR07+"' " +CRLF
cQuery += " AND D2_LOJA BETWEEN '"+MV_PAR06+"' AND '"+MV_PAR08+"' " +CRLF
cQuery += " AND D2_FILIAL BETWEEN '"+MV_PAR09+"' AND '"+MV_PAR10+"' " +CRLF
cQuery += " AND F2_NATUREZ BETWEEN '"+MV_PAR11+"' AND '"+MV_PAR12+"' " +CRLF
cQuery += "GROUP BY D2_CONTA,A1_TIPO " + CRLF
cQuery += "ORDER BY D2_CONTA,A1_TIPO " + CRLF
cQuery := ChangeQuery(cQuery)
dbUseArea( .T., 'TOPCONN', TCGENQRY(,,cQuery), cAliasTRB, .F., .T.)

DbSelectArea(cAliasTRB)

DbGoTop()
oSection1:Init()
oSection1:Cell("CONTA"):SetBlock({|| allTrim((cAliasTRB)->CONTA)} )
oSection1:Cell("DESCONTA"):SetBlock({|| Alltrim(posicione("CT1",1,Xfilial("CT1")+(cAliasTRB)->CONTA,"CT1_DESC01"))} )
oSection1:Cell("TIPO"):SetBlock({|| Tabela("SF",(caliasTRB)->A1_TIPO)} )

(cAliasTRB)->(DbGoTop())
While !oReport:Cancel() .And. !(cAliasTRB)->(Eof())
	oReport:IncMeter()
	If oReport:Cancel()
		Exit
	EndIf
	
	While !(cAliasTRB)->(EOF())
		do case
			case (caliasTRB)->A1_TIPO == 'F'
				_nTotF		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_nTot21F	+=(caliasTRB)->IVA21
				_nTotNETOF  +=(caliasTRB)->NETO
				_nTot105F+=(caliasTRB)->IVA105
				_nTotIVA27F	+=(caliasTRB)->IVA27
				_nTotIIBBF	+=(caliasTRB)->IIBB
				_nTotIVPF	+=(caliasTRB)->IVP
				_nTotNGF	+=(caliasTRB)->EXENTO
			case (caliasTRB)->A1_TIPO == 'E'
				_nTotE		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_nTot21E	+=(caliasTRB)->IVA21
				_nTotNETOE  +=(caliasTRB)->NETO
				_nTot105E+=(caliasTRB)->IVA105
				_nTotIVA27E	+=(caliasTRB)->IVA27
				_nTotIIBBE	+=(caliasTRB)->IIBB
				_nTotIVPE	+=(caliasTRB)->IVP
			case (caliasTRB)->A1_TIPO == 'I'
				_nTotI		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_nTot21I	+=(caliasTRB)->IVA21
				_nTotNETOI  +=(caliasTRB)->NETO
				_nTot105I+=(caliasTRB)->IVA105
				_nTotIVA27I	+=(caliasTRB)->IVA27
				_nTotIIBBI	+=(caliasTRB)->IIBB
				_nTotIVPI	+=(caliasTRB)->IVP
				_nTotNGI	+=(caliasTRB)->EXENTO
			case (caliasTRB)->A1_TIPO == 'N'
				_nTotN		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_nTot21N	+=(caliasTRB)->IVA21
				_nTotNETON  +=(caliasTRB)->NETO
				_nTot105N   +=(caliasTRB)->IVA105
				_nTotIVA27N	+=(caliasTRB)->IVA27
				_nTotIIBBN	+=(caliasTRB)->IIBB
				_nTotIVPN	+=(caliasTRB)->IVP
				_nTotNGN	+=(caliasTRB)->EXENTO
			case (caliasTRB)->A1_TIPO == 'M'
				_nTotM		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_nTot21M	+=(caliasTRB)->IVA21
				_nTotNETOM  +=(caliasTRB)->NETO
				_nTot105M+=(caliasTRB)->IVA105
				_nTotIVA27M	+=(caliasTRB)->IVA27
				_nTotIIBBM	+=(caliasTRB)->IIBB
				_nTotIVPM	+=(caliasTRB)->IVP
				_nTotNGM	+=(caliasTRB)->EXENTO
			case (caliasTRB)->A1_TIPO == 'X'
				_nTotX		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_ntot21X	+=(caliasTRB)->IVA21
				_nTotNETOX  +=(caliasTRB)->NETO
				_nTot105X+=(caliasTRB)->IVA105
				_nTotIVA27X	+=(caliasTRB)->IVA27
				_nTotIIBBX	+=(caliasTRB)->IIBB
				_nTotIVPX	+=(caliasTRB)->IVP
				_nTotNGX	+=(caliasTRB)->EXENTO
			case (caliasTRB)->A1_TIPO == 'Z'
				_nTotZ		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_nTot21Z	+=(caliasTRB)->IVA21
				_nTotNETOZ  +=(caliasTRB)->NETO
				_nTot105Z+=(caliasTRB)->IVA105
				_nTotIVA27Z	+=(caliasTRB)->IVA27
				_nTotIIBBZ	+=(caliasTRB)->IIBB
				_nTotIVPZ	+=(caliasTRB)->IVP
				_nTotNGZ	+=(caliasTRB)->EXENTO
			case (caliasTRB)->A1_TIPO == 'S'
				_nTotS		+= (caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP
				_nTot21S	+=(caliasTRB)->IVA21
				_nTotNETOS  +=(caliasTRB)->NETO
				_nTot105S+=(caliasTRB)->IVA105
				_nTotIVA27S	+=(caliasTRB)->IVA27
				_nTotIIBBS	+=(caliasTRB)->IIBB
				_nTotIVPS	+=(caliasTRB)->IVP
				_nTotNGS	+=(caliasTRB)->EXENTO
		EndCase
		
		If (caliasTRB)->A1_TIPO <> 'E'
			oSection1:Cell("NOGRAV"):SetBlock({|| (caliasTRB)->EXENTO} )
		Else
			oSection1:Cell("NOGRAV"):SetBlock({|| 0 } )
		EndIf
		
		If (caLiasTrb)->A1_TIPO == 'E'
			oSection1:Cell("EXPORT"):SetBlock({|| (caliasTRB)->NETO - (caliasTRB)->EXENTO } )
			oSection1:Cell("NETO"):SetBlock({||0} )
		ELSE
			oSection1:Cell("EXPORT"):SetBlock({|| 0} )
			oSection1:Cell("NETO"):SetBlock({||(caliasTRB)->NETO - (caliasTRB)->EXENTO} )
		EndIf
		oSection1:Cell("TOTAL"):SetBlock({||(caliasTRB)->NETO +(caliasTRB)->IVA21+(caliasTRB)->IVA105+(caliasTRB)->IVA27+(caliasTRB)->IIBB+(caliasTRB)->IVP } )
		oSection1:PrintLine()
		(cAliasTRB)->(dbSkip())
		
	EndDo

EndDo
oSection1:Finish()

oSection2:Init()


	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'I') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotI } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETOI } )
	oSection2:Cell("IVA21T"):SetBlock({||_nTot21I } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105I } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27I } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBI } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPI } )
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGI } )
	oSection2:PrintLine()
	
	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'E') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotE } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETOE } )
	oSection2:Cell("IVA21T"):SetBlock({||_nTot21E } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105E } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27E } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBE } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPE } )
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGE } )
	oSection2:PrintLine()
	
	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'F') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotF } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETOF } )
	oSection2:Cell("IVA21T"):SetBlock({||_nTot21F } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105F } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27F } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBF } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPF })
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGF } ) 
	oSection2:PrintLine()
	
	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'M') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotM } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETOM } )
	oSection2:Cell("IVA21T"):SetBlock({||_nTot21M } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105M } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27M } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBM } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPM } )
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGM } )
	oSection2:PrintLine()
	
	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'X') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotX } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETOX } )
	oSection2:Cell("IVA21T"):SetBlock({||_ntot21X } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105X } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27X } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBX } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPX } )
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGX } )
	oSection2:PrintLine()
	
	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'Z') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotZ } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETOZ } )
	oSection2:Cell("IVA21T"):SetBlock({||_nTot21Z } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105Z } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27Z } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBZ } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPZ} )
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGZ } )
	oSection2:PrintLine()
	
	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'S') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotS } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETOS } )
	oSection2:Cell("IVA21T"):SetBlock({||_nTot21S } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105S } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27S } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBS } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPS } )
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGS } )
	oSection2:PrintLine()
	
	oSection2:Cell("TIPOT"):SetBlock({||"TOTAL:"+ Tabela("SF",'N') } )
	oSection2:Cell("TOTALT"):SetBlock({||_nTotN } )
	oSection2:Cell("NETOT"):SetBlock({||_nTotNETON } )
	oSection2:Cell("IVA21T"):SetBlock({||_nTot21N } )
	oSection2:Cell("IVA105T"):SetBlock({||_nTot105N } )
	oSection2:Cell("IVA27T"):SetBlock({||_nTotIVA27N } )
	oSection2:Cell("IIBBT"):SetBlock({||_nTotIIBBN } )
	oSection2:Cell("IVPT"):SetBlock({||_nTotIVPN } )
	oSection2:Cell("NOGRAVT"):SetBlock({||_nTotNGN } )
	oSection2:PrintLine()


//Cierra tabla temporal
DbSelectArea(cAliasTRB)
(cAliasTRB)->(DbCloseArea())

Return NIL


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcion   ³          ³ Autor ³ Diego Fernando Rivero ³ Data ³ 19/05/08 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function AjustaSX1()
Local aArea := GetArea()
Local aRegs := {}, i, j

cPerg := Padr(cPerg,Len(SX1->X1_GRUPO))

DbSelectArea("SX1")
DbSetOrder(1)

aAdd(aRegs,{cPerg,"01","Desde Fecha","Desde Fecha","Desde Fecha","mv_ch1","D",8,0,0,"G","","MV_PAR01","","","","","","","","","","","","","","","","","","","","","","","","","","","" } )
aAdd(aRegs,{cPerg,"02","Hasta Fecha","Hasta Fecha","Hasta Fecha","mv_ch2","D",8,0,0,"G","","MV_PAR02","","","","","","","","","","","","","","","","","","","","","","","","","","","" } )
aAdd(aRegs,{cPerg,"03","Desde Cuenta","Desde Cuenta","Desde Cuenta","mv_ch3","C",9,0,0,"G","","MV_PAR03","","","","","","","","","","","","","","","","","","","","","","","","","CT1","","" } )
aAdd(aRegs,{cPerg,"04","Hasta Cuenta","Hasta Cuenta","Hasta Cuenta","mv_ch4","C",9,0,0,"G","","MV_PAR04","","","","","","","","","","","","","","","","","","","","","","","","","CT1","","" } )
aAdd(aRegs,{cPerg,"05","Desde Cliente ","Desde Cliente ","Desde Cliente","mv_ch5","C",06,0,0,"G","","MV_PAR05","","","","","","","","","","","","","","","","","","","","","","","","","SA1","","" } )
aAdd(aRegs,{cPerg,"06","Desde Tienda","Desde Tienda","Desde Tienda","mv_ch6","C",02,0,0,"G","","MV_PAR06","","","","","","","","","","","","","","","","","","","","","","","","","","","" } )
aAdd(aRegs,{cPerg,"07","Hasta Cliente","Hasta Cliente","Hasta Cliente","mv_ch7","C",06,0,0,"G","","MV_PAR07","","","","","","","","","","","","","","","","","","","","","","","","","SA1","","" } )
aAdd(aRegs,{cPerg,"08","Hasta Tienda","Hasta Tienda","Hasta Tienda","mv_ch8","C",02,0,0,"G","","MV_PAR08","","","","","","","","","","","","","","","","","","","","","","","","","","","" } )
aAdd(aRegs,{cPerg,"09","Desde Sucursal","Desde Sucursal","Desde Sucursal","mv_ch9","C",04,0,0,"G","","MV_PAR09","","","","","","","","","","","","","","","","","","","","","","","","","SM0","","" } )
aAdd(aRegs,{cPerg,"10","Hasta Sucursal","Hasta Sucursal","Hasta Sucursal","mv_cha","C",04,0,0,"G","","MV_PAR10","","","","","","","","","","","","","","","","","","","","","","","","","SM0","","" } )
aAdd(aRegs,{cPerg,"11","Desde Naturaleza","Desde Naturaleza","Desde Naturaleza","mv_chb","C",10,0,0,"G","","MV_PAR11","","","","","","","","","","","","","","","","","","","","","","","","","SED","","" } )
aAdd(aRegs,{cPerg,"12","Hasta Naturaleza","Hasta Naturaleza","Hasta Naturaleza","mv_chc","C",10,0,0,"G","","MV_PAR12","","","","","","","","","","","","","","","","","","","","","","","","","SED","","" } )


For i:=1 to Len(aRegs)
	If !dbSeek(cPerg+aRegs[i,2])
		RecLock("SX1",.T.)
		For j:=1 to FCount()
			If j <= Len(aRegs[i])
				FieldPut(j,aRegs[i,j])
			Endif
		Next
		MsUnlock()
	Endif
Next

RestArea(aArea)
Return

