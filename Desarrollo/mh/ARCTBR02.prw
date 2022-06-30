#INCLUDE "rwmake.ch"
#INCLUDE "TOPCONN.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณSCCTBR02     บ Autor ณ AP6 IDE            บ Fecha ณ  28/04/11   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescripcion ณ Codigo generado por el AP6 IDE.                                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP6 IDE                                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function ARCTBR02


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declaracion de Variables                                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Local cDesc1         := "Este programa tiene como objetivo imprimir informe "
Local cDesc2         := "de acuerdo con los parแmetros informados por el usuario."
Local cDesc3         := "Mayor Contable Bimonetario"
Local cPict          := ""
Local titulo       := "Mayor Contable Bimonetario"
Local nLin         := 80

Local Cabec1       := "Fecha Lote Sublote Document Linea   Tipo          Numero            Historial                      Moneda     Tasa de  Cambio   Debe MO       Haber MO        Debe Pesos     Haber Pesos     Saldo    codigo         Codigo "
Local Cabec2       := "                                    Comprob       Comprob                                          Original   Dia    | Asiento                                                               Actual  proveedor Loja Cliente Loja"
Local imprime      := .T.
Local aOrd := {}
Private lEnd         := .F.
Private lAbortPrint  := .F.
Private CbTxt        := ""
Private limite           := 132
Private tamanho          := "G"
Private nomeprog         := "SCTBR02" // Coloque aquํ el nombre del programa para impresi๓n en el encabezamiento
Private nTipo            := 18
Private aReturn          := { "A Rayas", 1, "Administraci๓n", 2, 2, 1, "", 1}
Private nLastKey        := 0
Private cbtxt      := Space(10)
Private cbcont     := 00
Private CONTFL     := 01
Private m_pag      := 01
Private wnrel      := "SCTBR02" // Coloque aquํ el nombre del archivo usado para impresi๓n en disco
Private	cperg		:="SCTBR02"
Private cString := "CT2"

Preguntas()
If !Pergunte(cPerg,.t.)
	return
Endif
dbSelectArea("CT2")
dbSetOrder(1)


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Monta la interfase estandar con el usuario...                           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
/*
wnrel := SetPrint(cString,NomeProg,"",@titulo,cDesc1,cDesc2,cDesc3,.T.,aOrd,.T.,Tamanho,,.T.)

If nLastKey == 27
Return
Endif

SetDefault(aReturn,cString)

If nLastKey == 27
Return
Endif

nTipo := If(aReturn[4]==1,15,18)
*/
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Procesamiento. RPTSTATUS monta ventana con la regla de procesamiento. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncion    ณRUNREPORT บ Autor ณ AP6 IDE            บ Fecha ณ  28/04/11   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescripcion ณ Funcion auxiliar llamada por la RPTSTATUS. La funcion RPTSTATUS บฑฑ
ฑฑบ          ณ monta la ventana con la regla de procesamiento.               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)

Local nOrdem
Local _cCTaAnt	:= " "
Local _aDatAsi	:= array(0)
Local aColsLF	:= {}
Local aHeadLF	:= {}
Local aColsLin	:= {}
Local nCantReg	:= 0
Local nValord	:= 0
Local nValorc	:= 0
dbSelectArea(cString)
dbSetOrder(1)


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Posicion del primer registro y loop principal. Se puede crear ณ
//ณ la logica de la siguiente manera: Ubicarse en la sucursal corriente y pro ณ
//ณ cesar mientras la sucursal del registro sea la sucursal corriente. Por ejem- ณ
//ณ plo, substituya el dbGoTop() y el While !EOF() abajo por la sintaxis:    ณ
//ณ                                                                     ณ
//ณ dbSeek(xFilial())                                                   ณ
//ณ While !EOF() .And. xFilial() == A1_FILIAL                           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

cQuery := "SELECT "
cQuery += "   ORIGEM,FILIAL,FILORI, TP_SALDO, FECHA, LOTE, SUBLOTE, DOC, LINEA, CUENTA, "
cQuery += "   COALESCE((SELECT TOP 1 CT1_DESC01 FROM " + RetSQLName('CT1') + " WHERE D_E_L_E_T_ <> '*' AND CT1_CONTA = CUENTA),'') AS DESC_CT1, "
cQuery += "   CCOSTO, "
cQuery += "   COALESCE((SELECT TOP 1 CTT_DESC01 FROM " + RetSQLName('CTT') + " WHERE D_E_L_E_T_ <> '*' AND CTT_CUSTO = CCOSTO),'') AS DESC_CTT, "
cQuery += "   ICONTABLE, "
cQuery += "   COALESCE((SELECT TOP 1 CTD_DESC01 FROM " + RetSQLName('CTD') + " WHERE D_E_L_E_T_ <> '*' AND CTD_ITEM = ICONTABLE),'') AS DESC_CTD, "
cQuery += "   HISTORIAL, LLAVE, ASIENTO, "
cQuery += "   SUM((CASE WHEN MOEDA = 1 THEN VLR_DEB ELSE 0 END)) AS VLR_DEB_ARS, "
cQuery += "   SUM((CASE WHEN MOEDA = 1 THEN VLR_CRE ELSE 0 END)) AS VLR_CRE_ARS, "
cQuery += "   SUM((CASE WHEN MOEDA = 2 THEN VLR_DEB ELSE 0 END)) AS VLR_DEB_USD, "
cQuery += "   SUM((CASE WHEN MOEDA = 2 THEN VLR_CRE ELSE 0 END)) AS VLR_CRE_USD, "
cQuery += "   SUM((CASE WHEN MOEDA = 3 THEN VLR_DEB ELSE 0 END)) AS VLR_DEB_EUR, "
cQuery += "   SUM((CASE WHEN MOEDA = 3 THEN VLR_CRE ELSE 0 END)) AS VLR_CRE_EUR, "
cQuery += "   SUM((CASE WHEN MOEDA = 4 THEN VLR_DEB ELSE 0 END)) AS VLR_DEB_IDX, "
cQuery += "   SUM((CASE WHEN MOEDA = 4 THEN VLR_CRE ELSE 0 END)) AS VLR_CRE_IDX, "
cQuery += "   SUM((CASE WHEN MOEDA = 5 THEN VLR_DEB ELSE 0 END)) AS VLR_DEB_REA, "
cQuery += "   SUM((CASE WHEN MOEDA = 5 THEN VLR_CRE ELSE 0 END)) AS VLR_CRE_REA "
cQuery += "   FROM "
cQuery += "   (SELECT "  
cQuery += " 	  CT2_ORIGEM AS ORIGEM, "
cQuery += " 	  CT2_FILIAL AS FILIAL, "
cQuery += " 	  CT2_FILORI AS FILORI, "
cQuery += " 	  CT2_TPSALD AS TP_SALDO, "
cQuery += " 	  CT2_DATA FECHA, "
cQuery += " 	  CT2_DC TIPO_MOV, "
cQuery += " 	  (CASE WHEN CT2_DC = 1 THEN CT2_DEBITO ELSE CT2_CREDIT END) CUENTA, "
cQuery += " 	  (CASE WHEN RTRIM(CT2_CCC) <> '' THEN CT2_CCC ELSE CT2_CCD END) AS CCOSTO, "
cQuery += " 	  (CASE WHEN RTRIM(CT2_ITEMC) <> '' THEN CT2_ITEMC ELSE CT2_ITEMD END) AS ICONTABLE, "
cQuery += " 	  (CASE WHEN CT2_DC = 1 THEN CT2_VALOR ELSE 0 END) AS VLR_DEB, "
cQuery += " 	  (CASE WHEN CT2_DC = 2 THEN CT2_VALOR ELSE 0 END) AS VLR_CRE, "
cQuery += " 	  CT2_LOTE AS LOTE, "
cQuery += " 	  CT2_SBLOTE AS SUBLOTE, "
cQuery += " 	  CT2_DOC AS DOC, "
cQuery += " 	  CT2_LINHA AS LINEA, "
cQuery += " 	  CT2_MOEDLC AS MOEDA, "
cQuery += " 	  CT2_HIST AS HISTORIAL, "
cQuery += " 	  CT2_KEY AS LLAVE, "
cQuery += " 	  CT2_LP AS ASIENTO "
cQuery += "    FROM "
cQuery += " 	   " + RetSQLName('CT2') + " "
cQuery += "    WHERE "
cQuery += "    	  (D_E_L_E_T_ <> '*' AND D_E_L_E_T_ IS NOT NULL) AND (CT2_DC = '1' OR CT2_DC = '2') AND "
cQuery += " 	  (CT2_TPSALD >= '"+MV_PAR09+"' AND CT2_TPSALD <= '"+MV_PAR10+"') AND "
cQuery += " 	  (CT2_FILIAL >= '"+MV_PAR07+"' AND CT2_FILIAL <= '"+MV_PAR08+"') AND "
cQuery += " 	  (CT2_DATA >= '"+DToS(MV_PAR05)+"' AND CT2_DATA <= '"+DToS(MV_PAR06)+"') "
				
cQuery += "    UNION ALL "
		
cQuery += "    SELECT "  
cQuery += " 	  CT2_ORIGEM AS ORIGEM, "
cQuery += " 	  CT2_FILIAL AS FILIAL, "
cQuery += " 	  CT2_FILORI AS FILORI, "
cQuery += " 	  CT2_TPSALD AS TP_SALDO, "
cQuery += " 	  CT2_DATA FECHA, "
cQuery += " 	  CT2_DC TIPO_MOV, "
cQuery += " 	  CT2_DEBITO CUENTA, " 
cQuery += " 	  (CASE WHEN RTRIM(CT2_CCD) <> '' THEN CT2_CCD ELSE CT2_CCC END) AS CCOSTO, "
cQuery += " 	  (CASE WHEN RTRIM(CT2_ITEMC) <> '' THEN CT2_ITEMC ELSE CT2_ITEMD END) AS ICONTABLE, "
cQuery += " 	  CT2_VALOR AS VLR_DEB, "
cQuery += " 	  0 AS VLR_CRE, "
cQuery += " 	  CT2_LOTE AS LOTE, "
cQuery += " 	  CT2_SBLOTE AS SUBLOTE, "
cQuery += " 	  CT2_DOC AS DOC, "
cQuery += " 	  CT2_LINHA AS LINEA, "
cQuery += " 	  CT2_MOEDLC AS MOEDA, "
cQuery += " 	  CT2_HIST AS HISTORIAL, "
cQuery += " 	  CT2_KEY AS LLAVE, "
cQuery += " 	  CT2_LP AS ASIENTO "
cQuery += "    FROM "
cQuery += " 	  " + RetSQLName('CT2') + " "
cQuery += "    WHERE "
cQuery += " 	  (D_E_L_E_T_ <> '*' AND D_E_L_E_T_ IS NOT NULL) AND CT2_DC = '3' AND "
cQuery += " 	  (CT2_TPSALD >= '"+MV_PAR09+"' AND CT2_TPSALD <= '"+MV_PAR10+"') AND "
cQuery += " 	  (CT2_FILIAL >= '"+MV_PAR07+"' AND CT2_FILIAL <= '"+MV_PAR08+"') AND "
cQuery += " 	  (CT2_DATA >= '"+DToS(MV_PAR05)+"' AND CT2_DATA <= '"+DToS(MV_PAR06)+"' ) "
			
cQuery += "    UNION ALL "
		
cQuery += "    SELECT "   
cQuery += " 	  CT2_ORIGEM AS ORIGEM, "
cQuery += " 	  CT2_FILIAL AS FILIAL, "
cQuery += " 	  CT2_FILORI AS FILORI, "
cQuery += " 	  CT2_TPSALD AS TP_SALDO, "
cQuery += " 	  CT2_DATA FECHA, "
cQuery += " 	  CT2_DC TIPO_MOV, "
cQuery += " 	  CT2_CREDIT CUENTA, "
cQuery += " 	  (CASE WHEN RTRIM(CT2_CCC) <> '' THEN CT2_CCC ELSE CT2_CCD END) AS CCOSTO, "
cQuery += " 	  (CASE WHEN RTRIM(CT2_ITEMC) <> '' THEN CT2_ITEMC ELSE CT2_ITEMD END) AS ICONTABLE, "
cQuery += " 	  0 AS VLR_DEB, "
cQuery += " 	  CT2_VALOR AS VLR_CRE, "
cQuery += " 	  CT2_LOTE AS LOTE, "
cQuery += " 	  CT2_SBLOTE AS SUBLOTE, "
cQuery += " 	  CT2_DOC AS DOC, "
cQuery += " 	  CT2_LINHA AS LINEA, "
cQuery += " 	  CT2_MOEDLC AS MOEDA, "
cQuery += " 	  CT2_HIST AS HISTORIAL, "
cQuery += " 	  CT2_KEY AS LLAVE, "
cQuery += " 	  CT2_LP AS ASIENTO "
cQuery += "     FROM "
cQuery += " 	  " + RetSQLName('CT2') + " "
cQuery += "     WHERE "
cQuery += " 	  (D_E_L_E_T_ <> '*' AND D_E_L_E_T_ IS NOT NULL) AND CT2_DC = '3' AND "
cQuery += " 	  (CT2_TPSALD >= '"+MV_PAR09+"' AND CT2_TPSALD <= '"+MV_PAR10+"') AND "
cQuery += " 	  (CT2_FILIAL >= '"+MV_PAR07+"' AND CT2_FILIAL <= '"+MV_PAR08+"') AND "
cQuery += " 	  (CT2_DATA >= '"+DToS(MV_PAR05)+"' AND CT2_DATA <= '"+DToS(MV_PAR06)+"' ) "
cQuery += "     ) TRB "

cQuery += "    WHERE "
cQuery += "       (CUENTA >= '"+MV_PAR03+"' AND CUENTA <= '"+MV_PAR04+"') "
cQuery += "    GROUP BY " 
cQuery += "       ORIGEM, "
cQuery += "       FILIAL, " 
cQuery += "       FILORI, "
cQuery += " 	  TP_SALDO, "
cQuery += " 	  FECHA, "
cQuery += " 	  LOTE, "
cQuery += " 	  SUBLOTE, "
cQuery += " 	  DOC, "
cQuery += " 	  LINEA, "
cQuery += " 	  CUENTA, "
cQuery += " 	  CCOSTO, "
cQuery += " 	  ICONTABLE, "
cQuery += " 	  HISTORIAL, "
cQuery += "  	  ASIENTO, "
cQuery += " 	  LLAVE "
cQuery += " 	ORDER BY "
cQuery += "       CUENTA, "
cQuery += " 	  FECHA, "
cQuery += " 	  FILIAL, "
cQuery += " 	  LOTE, "
cQuery += " 	  SUBLOTE, "
cQuery += " 	  DOC, "
cQuery += " 	  LINEA, "
cQuery += " 	  TP_SALDO "

TCQUERY cQuery Alias IS2 NEW
DbselectArea("IS2")
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ SETREGUA -> Indica cuantos registros seran procesados para la regla ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

SetRegua(RecCount("IS2"))

//  AADD(aHeadLF, "TITULO DEL CAMPO, "TIPO",TAMAัO,DECIMALES
AADD(aHeadLF,{"Cuenta contable", "C",20,} )
AADD(aHeadLF,{"Descrip. Cta ", "C",40,} )
AADD(aHeadLF,{"Centro de Costo", "C",9,} )
AADD(aHeadLF,{"Descrip. Centro de Costo", "C",40,} )
AADD(aHeadLF,{"Item Contable", "C",9,} )
AADD(aHeadLF,{"Descrip. Item Contable", "C",40,} )
AADD(aHeadLF,{"Fecha", "D",08,} )
AADD(aHeadLF,{"Lote", "C",20,} )
AADD(aHeadLF,{"Sublote", "C",20,} )
AADD(aHeadLF,{"Documento", "C",20,} )
AADD(aHeadLF,{"Linea", "C",3,} )
AADD(aHeadLF,{"Tipo Comprobante", "C",20,} )
AADD(aHeadLF,{"Numero Comprobante", "C",20,} )
AADD(aHeadLF,{"Historial", "C",40,} )
AADD(aHeadLF,{"Moneda Original Asiento", "C",20,} )
AADD(aHeadLF,{"Tasa de cambio Dia", "N",10,4} )
AADD(aHeadLF,{"Tasa de cambio Asiento", "N",10,4} )
AADD(aHeadLF,{"Debe MO", "N",14,2} )
AADD(aHeadLF,{"Haber MO", "N",14,2} )
AADD(aHeadLF,{"Debe Pesos", "N",14,2} )
AADD(aHeadLF,{"Haber Pesos", "N",14,2} )
AADD(aHeadLF,{"Saldo Actual Pesos", "N",14,2} )
AADD(aHeadLF,{"Saldo Actual Dolares", "N",14,2} )
AADD(aHeadLF,{"Saldo Actual Euros", "N",14,2} )
AADD(aHeadLF,{"Saldo Actual Moneda 4", "N",14,2} )
AADD(aHeadLF,{"Saldo Actual Moneda 5", "N",14,2} )
AADD(aHeadLF,{"Codigo Proveedor", "C",20,} )
AADD(aHeadLF,{"Loja", "C",4,} )
AADD(aHeadLF,{"Razon Social Proveedor", "C",40,} )
AADD(aHeadLF,{"NIT Proveedor", "C",20,} )
AADD(aHeadLF,{"Codigo Cliente", "C",20,} )
AADD(aHeadLF,{"Loja", "C",4,} )
AADD(aHeadLF,{"Razon Social Cliente", "C",40,} )
AADD(aHeadLF,{"NIT Cliente", "C",20,} )
AADD(aHeadLF,{"Moneda Original Transaccion", "C",20,} )
AADD(aHeadLF,{"Tipo de Saldo", "C",1,} ) 
AADD(aHeadLF,{"Observ. Comprobante", "C",60,} )
AADD(aHeadLF,{"Origen Asiento", "C",60,} )
//	AADD(aHeadLF,{"Resp. Proyecto", "C",20,} )
dbGoTop()
While !EOF()
	Incregua()
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Comprobar la anulacion por el usuario...                             ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	If lAbortPrint
		@nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
		Exit
	Endif
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Impresion del encabezamiento del informe. . .                            ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	If nLin > 55 // Salto de Pแgina. En este caso el impreso tiene 55 lํneas...
		Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
		nLin := 11
	Endif
	
	// Coloque aquํ la l๓gica de la impresi๓n de su programa...
	// Utilice PSAY para salida en la impresora. Por ejemplo:                              
	// busco la tasa de cambio de la moneda original                                       
	aSelFil:=	treEmp()
	If Empty(_cCtaAnt) .or. IS2->CUENTA <> _cCtaAnt // si es otra cuenta contable
		_nSaldoAnt	:= 0
		_nSaldoAct	:= 0
		_nSaldAct	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"01","1","CTBR400",,,aSelFil)[6] *-1
		_nSaldoAnt	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA)-1,"01","1","CTBR400",,,aSelFil)[6] *-1
		_nSaldM2	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"02","1","CTBR400",,,aSelFil)[6] *-1
		_nSadAcM2	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"02","1","CTBR400",,,aSelFil)[6] *-1
		_nSaldM3	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"03","1","CTBR400",,,aSelFil)[6] *-1
		_nSadAcM3	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"03","1","CTBR400",,,aSelFil)[6] *-1
		_nSaldM4	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"04","1","CTBR400",,,aSelFil)[6] *-1
		_nSadAcM4	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"04","1","CTBR400",,,aSelFil)[6] *-1
		_nSaldM5	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"05","1","CTBR400",,,aSelFil)[6] *-1
		_nSadAcM5	:= SaldoCT7Fil(IS2->CUENTA,SToD(IS2->FECHA),"01","1","CTBR400",,,aSelFil)[6] *-1
		
		/*
		@nLin,00 PSAY "Cuenta Contable: " + IS2->CUENTA + " "+ IS2->DESC_CUENTA
		@nLin, 155 PSAY if(mv_par01=1, "Saldo Anterior ($) :"," ")
		@nLin, 177 PSAY Transform(if(mv_par01=1, _nSaldoAnt," "),"@E 999999999999.99")
		*/
		_cCtaAnt := IS2->CUENTA
		
		
		
		aColsLin := {"Cuenta Contable: "+ IS2->CUENTA + " "+ IS2->DESC_CT1,,,,,,,,,,,,,,,,,,,,,if(mv_par01=1, _nSaldoAnt,""),;
		if(mv_par01=1, _nSaldM2,""),if(mv_par01=1, _nSaldM3,""),if(mv_par01=1, _nSaldM4,""),if(mv_par01=1, _nSaldM5,""), ,,,.f.}
			//		aAdd(aColsLin,.F.)
			aAdd(aColsLF, aClone(aColsLin))
			aColsLin := {}
		EndIf
		_cMoedOrig	:= TRAEMOEDOR()
		If _cMoedOrig == 1
			nMoedaas	:= 1
		EndIf
		
		If _cMoedOrig <> 1  // si es diferente de pesos
			DbSelectArea ("SM2")
			DbSetOrder (1)
			DbSeek (SToD(IS2->FECHA))
			nMoeda	 := &("SM2->M2_MOEDA"+alltrim(str(_cMoedOrig)))
			
			If _cMoedOrig == 2
				nMoedaas := Round(Iif((IS2->VLR_DEB_USD+IS2->VLR_CRE_USD) = 0,0,(IS2->VLR_DEB_ARS+IS2->VLR_CRE_ARS)/(IS2->VLR_DEB_USD+IS2->VLR_CRE_USD)),4)
			elseIf _cMoedOrig == 3
				nMoedaas := Round(Iif((IS2->VLR_DEB_EUR+IS2->VLR_CRE_EUR) = 0,0,(IS2->VLR_DEB_ARS+IS2->VLR_CRE_ARS)/(IS2->VLR_DEB_EUR+IS2->VLR_CRE_EUR)),4)
			elseIf _cMoedOrig == 4
				nMoedaas := Round(Iif((IS2->VLR_DEB_IDX+IS2->VLR_CRE_IDX) = 0,0,(IS2->VLR_DEB_ARS+IS2->VLR_CRE_ARS)/(IS2->VLR_DEB_IDX+IS2->VLR_CRE_REA)),4)
			elseIf _cMoedOrig == 5
				nMoedaas := Round(Iif((IS2->VLR_DEB_REA+IS2->VLR_CRE_REA) = 0,0,(IS2->VLR_DEB_ARS+IS2->VLR_CRE_ARS)/(IS2->VLR_DEB_REA+IS2->VLR_CRE_REA)),4)
			EndIF
		Else
			nMoeda	:= 1
		EndIf
		
		dbselectarea("IS2")
		_aDatAsi	:=	scrastrea(IS2->ASIENTO)
		
		If _cMoedOrig == 1
			nValord	:= IS2->VLR_DEB_ARS
			nvalorc	:=IS2->VLR_CRE_ARS
		elseIf _cMoedOrig == 2
			nValord	:= IS2->VLR_DEB_USD
			nvalorc	:=IS2->VLR_CRE_USD
			_nSaldM2	:= _nSaldM2 + (IS2->VLR_DEB_USD - IS2->VLR_CRE_USD)
		elseIf _cMoedOrig == 3
			nValord	:= IS2->VLR_DEB_EUR
			nvalorc	:= IS2->VLR_CRE_EUR
			_nSaldM3	:= _nSaldM3 + (IS2->VLR_DEB_EUR - IS2->VLR_CRE_EUR)
		elseIf _cMoedOrig == 4
			nValord	:= IS2->VLR_DEB_IDX
			nvalorc	:= IS2->VLR_CRE_IDX
			_nSaldM4	:= _nSaldM4 + (IS2->VLR_DEB_IDX - IS2->VLR_CRE_IDX)
		elseIf _cMoedOrig == 5
			nValord	:= IS2->VLR_DEB_REA
			nvalorc	:= IS2->VLR_CRE_REA
			_nSaldM5	:= _nSaldM5 + (IS2->VLR_DEB_REA - IS2->VLR_CRE_REA)
		EndIF
		_nSaldAct	:= _nSaldAct + IS2->VLR_DEB_ARS - IS2->VLR_CRE_ARS
		@nLin,185 PSAY Transform(if(mv_par01==1, _nsaldAct,""),"@E 99999999999.99")
		
		//                   1             2            3           4        5
		aColsLin:={CHR(160)+IS2->CUENTA,IS2->DESC_CT1,CHR(160)+IS2->CCOSTO,IS2->DESC_CTT,CHR(160)+IS2->ICONTABLE,IS2->DESC_CTD,SToD(IS2->FECHA),;
		chr(160)+is2->LOTE,chr(160)+IS2->SUBLOTE,chr(160)+IS2->DOC,chr(160)+IS2->LINEA,;
		IF(!EMPTY(_aDatAsi[1]),chr(160)+_aDatAsi[1],""),IF(!EMPTY(_aDatAsi[2]),chr(160)+_aDatAsi[2],""),Alltrim(IS2->HISTORIAL),;
		Alltrim(getmv("MV_MOEDAP"+alltrim(Str(_cMoedOrig)))),nMoeda,nMoedaas,nvalord ,nvalorc,IS2->VLR_DEB_ARS ,IS2->VLR_CRE_ARS ,;
		if(mv_par01==1, _nsaldAct,""),IF (_cMoedOrig == 2, _nSaldM2,""),IF (_cMoedOrig == 3, _nSaldM3,""),;
		IF (_cMoedOrig == 4, _nSaldM4,""),IF (_cMoedOrig == 5, _nSaldM5,""),;
		Chr(160)+_aDatAsi[3],chr(160)+_aDatAsi[4],chr(160)+IF(!Empty(_aDatAsi[3]),Posicione("SA2",1,Xfilial("SA2")+_aDatAsi[3]+_aDatAsi[4],"A2_NOME"),""),;
		Chr(160)+If(!Empty(_aDatAsi[3]),Posicione("SA2",1,Xfilial("SA2")+_aDatAsi[3]+_aDatAsi[4],"A2_COD"),""),;
		chr(160)+_aDatAsi[5],chr(160)+_aDatAsi[6],chr(160)+IF(!EMPTY(_aDatAsi[5]),Posicione("SA1",1,Xfilial("SA2")+_aDatAsi[5]+_aDatAsi[6],"A1_NOME"),""),;
		Chr(160)+If(!Empty(_aDatAsi[5]),Posicione("SA1",1,Xfilial("SA2")+_aDatAsi[5]+_aDatAsi[6],"A1_COD"),""),_aDatAsi[7],IS2->TP_SALDO,_aDatAsi[8],IS2->ORIGEM,.F.}
		/*FMCH 15.05.2015
			aColsLin:={CHR(160)+IS2->CUENTA,IS2->DESC_CT1,CHR(160)+IS2->CCOSTO,IS2->DESC_CTT,CHR(160)+IS2->ICONTABLE,IS2->DESC_CTD,SToD(IS2->FECHA),;
		chr(160)+is2->LOTE,chr(160)+IS2->SUBLOTE,chr(160)+IS2->DOC,chr(160)+IS2->LINEA,;
		IF(!EMPTY(_aDatAsi[1]),chr(160)+_aDatAsi[1],""),IF(!EMPTY(_aDatAsi[2]),chr(160)+_aDatAsi[2],""),Alltrim(IS2->HISTORIAL),;
		Alltrim(getmv("MV_MOEDAP"+alltrim(Str(_cMoedOrig)))),nMoeda,nMoedaas,nvalord ,nvalorc,IS2->VLR_DEB_ARS ,IS2->VLR_CRE_ARS ,;
		if(mv_par01==1, _nsaldAct,""),IF (_cMoedOrig == 2, _nSaldM2,""),IF (_cMoedOrig == 3, _nSaldM3,""),;
		IF (_cMoedOrig == 4, _nSaldM4,""),IF (_cMoedOrig == 5, _nSaldM5,""),;
		Chr(160)+_aDatAsi[3],chr(160)+_aDatAsi[4],chr(160)+IF(!Empty(_aDatAsi[3]),Posicione("SA2",1,Xfilial("SA2")+_aDatAsi[3]+_aDatAsi[4],"A2_NOME"),""),;
		Chr(160)+If(!Empty(_aDatAsi[3]),Posicione("SA2",1,Xfilial("SA2")+_aDatAsi[3]+_aDatAsi[4],"A2_CGC"),""),;
		chr(160)+_aDatAsi[5],chr(160)+_aDatAsi[6],chr(160)+IF(!EMPTY(_aDatAsi[5]),Posicione("SA1",1,Xfilial("SA2")+_aDatAsi[5]+_aDatAsi[6],"A1_NOME"),""),;
		Chr(160)+If(!Empty(_aDatAsi[5]),Posicione("SA1",1,Xfilial("SA2")+_aDatAsi[5]+_aDatAsi[6],"A1_CGC"),""),_aDatAsi[7],IS2->TP_SALDO,_aDatAsi[8],IS2->ORIGEM,.F.}
		*/
		aAdd(aColsLF, (aColsLin))
		aColsLin := {}
		dbSkip() // Avanza el puntero del registro en el archivo
	End
	
	IS2->(dbcloseareA())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Finaliza la ejecucion del informe...                                 ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	//	If MsgYesNo(OemToAnsi("Desea pasar a un archivo de excel?"))
	DlgToExcel({ {"GETDADOS","Mayor contable Bimonetario",aHeadLF,aColsLF}})
	//	EndIf

	Return
	
	/*
	ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
	ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
	ฑฑณFuncion   ณ Prreguntas ณ Autor ณ Skiddoo				ณ Data ณ 25.06.03 ณฑฑ
	ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
	ฑฑณDescrip   ณ Proceso para creacion de preguntas en el archivo SX1       ณฑฑ
	ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
	*/
	
	Static Function Preguntas()
	PutSx1(cPerg,"01","Monedas?","ฟMonedas?","Monedas?","mv_ch1","N", 1,0,0,"C","","","","","mv_par01",;
	"Todas","todas","Todas","","Seleccionada","Seleccionada","Selecccionada","","","","","","","","","","","","")
	PutSx1(cPerg,"02","Moneda?","Moneda?","Moneda?","mv_ch2","N",02,00,00,"G","","","","","mv_par02","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"03","Desde Cuenta?","Desde Cuenta?","Desde Cuenta?","mv_ch3","C",20,00,00,"G","","CT1","","","mv_par03","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"04","Hasta cuenta?","Hasta cuenta?","Hasta cuenta?","mv_ch4","C",20,00,00,"G","","CT1","","","mv_par04","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"05","Desde Fecha?","Desde Fecha?","Desde Fecha?","mv_ch5","D",08,00,00,"G","","","","","mv_par05","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"06","Hasta Fecha?","Hasta Fecha?","Hasta Fecha?","mv_ch6","D",08,00,00,"G","","","","","mv_par06","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"07","Desde Filial?","Desde Filial?","Desde Filial?","mv_ch7","C",4,00,00,"G","","SM0","","","mv_par07","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"08","Hasta Filial?","Hasta Filial?","Hasta Filial?","mv_ch8","C",4,00,00,"G","","SM0","","","mv_par08","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"09","Desde Tipo de saldo?"," Desde Tipo de saldo?","Desde Tipo de saldo?","mv_ch8","C",1,00,00,"G","","SL","","","mv_par09","","","","","","","",;
	"","","","","","","","","","","","","")
	PutSx1(cPerg,"10","Hasta Tipo de Saldo?","Hasta Tipo de Saldo?","Hasta Tipo de Saldo?","mv_chA","C",1,00,00,"G","","SL","","","mv_par10","","","","","","","",;
	"","","","","","","","","","","","","")
	Return
	
	/*
	ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
	ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
	ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
	ฑฑบPrograma  TRAEMOEDOR  บAutor  ณMicrosiga           บFecha ณ  05/05/11   บฑฑ
	ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
	ฑฑบDesc.     ณ Funcion para traer la moneda original del asiento          บฑฑ
	ฑฑบ          ณ                                                            บฑฑ
	ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
	ฑฑบUso       ณ AP                                                        บฑฑ
	ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
	ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
	฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
	*/
	static function traemoedor()
	Local _nMoedOr	:= 1
	If IS2->VLR_DEB_ARS <> 0 .or. IS2->VLR_CRE_ARS <> 0
		_nMoedOr	:= 2
	ElseIf	IS2->VLR_DEB_USD <> 0 .or. IS2->VLR_CRE_USD <> 0
		_nMoedOr	:= 3
	ElseIf	IS2->VLR_DEB_IDX <> 0 .or. IS2->VLR_CRE_IDX <> 0
		_nMoedOr	:= 4
	ElseIf	IS2->VLR_DEB_REA <> 0 .or. IS2->VLR_CRE_REA <> 0
		_nMoedOr	:= 5
	EndIf
	
	Return _nMoedOr
	
	/*
	ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
	ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
	ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
	ฑฑบPrograma  SCRASTREA  บAutor  ณMicrosiga           บFecha ณ  05/09/11   บฑฑ
	ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
	ฑฑบDesc.     ณ Rastrear Asientos                                          บฑฑ
	ฑฑบ          ณ                                                            บฑฑ
	ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
	ฑฑบUso       ณ AP                                                        บฑฑ
	ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
	ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
	฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
	*/
Static Function SCRASTREA(cpadrao)
local _aArea	:= GetArea()
Local _aDatos	:= {" "," "," "," "," "," ","",""}
Local lachou	:= .t.
	CT2->(DBSETORDER(1))
	CT2->(DBSEEK(IS2->FILIAL+IS2->FECHA+IS2->LOTE+IS2->SUBLOTE+IS2->DOC+IS2->LINEA+"1"+CEMPANT+IS2->FILORI+"01"))
	cRecCT2 := ALLTRIM(STR(INT(CT2->(Recno()))))   
	_nRecnCtk	:= TraeRecno(cRecCt2)
	dbSelectArea("CV3")
/*	If dBOrdRecDes()	// SE NO ACHOU O NDICE PELO CV3_RECDES (NICKNAME CV3RECDES) J SETOU O NDICE
		If !dbSeek(IS2->CT2_FILIAL+padr(cRecCT2,17))
			lAchou := .F.
		EndIf
	Else
		lAchou := .F.
	EndIf*/

CV3->(Dbgoto(Val(_nRecNCTK)))
If lAchou // si existe en cv3
	cArq	:= CV3->CV3_TABORI
	CrECoRI	:= CV3->CV3_RECORI
	If !Empty(cArq)
		DBSELECTarEA(CaRQ)
		dbgoto(val(cRecOri))
		Do Case
			Case cArq	== "SE2"
			   	_cMoeda := Getmv("MV_MOEDAP"+ALLTRIM(STR(SE2->E2_MOEDA)))
				_aDatos	:= 	{SE2->E2_TIPO,SE2->E2_NUM+SE2->E2_PREFIXO,SE2->E2_FORNECE,SE2->E2_LOJA," "," ",_cMoeda,SE2->E2_HIST}
			Case cArq	== "SE1"
				_cMoeda := Getmv("MV_MOEDAP"+ALLTRIM(STR(SE1->E1_MOEDA)))
				_aDatos:=	{SE2->E2_TIPO,SE2->E2_NUM+SE2->E2_PREFIXO," "," ",SE1->E1_CLIENTE,SE1->E1_LOJA,_cMoeda,SE1->E1_LOJA}
			Case cArq	== "SF1"
				IF !Alltrim(SF1->F1_ESPECIE) $ "NCC|NDE"
					_cMoeda	:= Getmv("MV_MOEDAP"+ALLTRIM(STR(SF1->F1_MOEDA)))
					_aDatos	:=	{SF1->F1_ESPECIE,SF1->F1_DOC+SF1->F1_SERIE,SF1->F1_FORNECE,SF1->F1_LOJA," "," ",_cMoeda,SF1->F1_XOBSERV}
				eLSE
					_cMoeda	:= Getmv("MV_MOEDAP"+ALLTRIM(STR(SF1->F1_MOEDA)))
					_aDatos	:=	{SF1->F1_ESPECIE,SF1->F1_DOC+SF1->F1_SERIE," "," ",SF1->F1_FORNECE,SF1->F1_LOJA,_cMoeda,SF1->F1_XOBSERV}
				EndIf
			Case	cArq	== "SF2"
				If !Alltrim(SF2->F2_ESPECIE) $ "NCP|NDI"
					_cMoeda	:= Getmv("MV_MOEDAP"+ALLTRIM(STR(SF2->F2_MOEDA)))
					_aDatos	:=	{SF2->F2_ESPECIE,SF2->F2_DOC+SF2->F2_SERIE," "," ",SF2->F2_CLIENTE,SF2->F2_LOJA,_cMoeda,SF2->F2_XMEMOOB}
				Else
					_cMoeda	:= Getmv("MV_MOEDAP"+ALLTRIM(STR(SF2->F2_MOEDA)))
					_aDatos	:=	{SF2->F2_ESPECIE,SF2->F2_DOC+SF2->F2_SERIE,SF2->F2_CLIENTE,SF2->F2_LOJA," "," ",_cMoeda,SF2->F2_XMEMOOB}
				EndIf
			Case cArq		==	"SEK" .and. !alltrim(CPADRAO) $ "Z01|Z02"
				_cMoeda	:= GETMV('MV_MOEDAP'+If(len(ALLTRIM(SEK->EK_MOEDA))<> 1,substr(ALLTRIM(SEK->EK_MOEDA),2,1),aLLTRIM(SEK->EK_MOEDA)))
				_aDatos	:=	{"Generac. OP",SEK->EK_ORDPAGO,SEK->EK_FORNECE,SEK->EK_LOJA," "," ",_cMoeda,SEK->EK_XOBSERV}
			Case cArq		==	"SEK" .and. alltrim(CPADRAO) $ "Z01|Z02"
				_cMoeda	:= GETMV('MV_MOEDAP'+If(len(ALLTRIM(SEK->EK_MOEDA))<> 1,substr(ALLTRIM(SEK->EK_MOEDA),2,1),aLLTRIM(SEK->EK_MOEDA)))
				_aDatos	:=	{"Eefect. OP",SEK->EK_ORDPAGO,SEK->EK_FORNECE,SEK->EK_LOJA," "," ",_cMoeda,""}
			Case cArq		==	"SEL"
				_cMoeda	:= GETMV('MV_MOEDAP'+If(len(ALLTRIM(SEL->EL_MOEDA))<> 1,substr(ALLTRIM(SEL->EL_MOEDA),2,1),aLLTRIM(SEL->EL_MOEDA)))
				_aDatos	:=	{"Recibo ",SEL->EL_RECIBO," "," ",SEL->EL_CLIENTE,SEL->EL_LOJA,_cMoeda,SEL->EL_XOBSERV}
			Case carq		== "SD2"
				IF !Alltrim(SD2->D2_ESPECIE) $ "NCP|NDI"
					_cMoeda	:= Posicione("SF2",1,xFilial("SF2")+SD2->D2_DOC+SD2->D2_SERIE+SD2->D2_CLIENTE+SD2->D2_LOJA,"F2_MOEDA")
					_cMoeda	:= GETMV('MV_MOEDAP'+Alltrim(Str(SF2->F2_MOEDA)))
					_aDatos	:=	{SD2->D2_ESPECIE,SD2->D2_DOC+SD2->D2_SERIE," "," ",SD2->D2_CLIENTE,SD2->D2_LOJA,_cMoeda,""}
				eLSE
					_cMoeda	:= Posicione("SF2",1,xFilial("SF2")+SD2->D2_DOC+SD2->D2_SERIE+SD2->D2_CLIENTE+SD2->D2_LOJA,"F2_MOEDA")
					_cMoeda	:= GETMV('MV_MOEDAP'+Alltrim(Str(SF2->F2_MOEDA)))
					_aDatos	:=	{SD2->D2_ESPECIE,SD2->D2_DOC+SD2->D2_SERIE,SD2->D2_CLIENTE,SD2->D2_LOJA," "," ",_cMoeda,""}
				eNDiF
			Case carq		== "SD1"
				If !Alltrim(SD1->D1_ESPECIE) $ "NCC|NDE"
					_cMoeda	:= Posicione("SF1",1,xFilial("SF1")+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA,"F1_MOEDA")
					_cMoeda	:= GETMV('MV_MOEDAP'+Alltrim(Str(SF1->F1_MOEDA)))
					_aDatos	:=	{SD1->D1_ESPECIE,SD1->D1_DOC+SD1->D1_SERIE,SD1->D1_FORNECE,SD1->D1_LOJA," "," ",_cMoeda,SF1->F1_XOBSERV}
				Else
					_cMoeda	:= Posicione("SF1",1,xFilial("SF1")+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA,"F1_MOEDA")
					_cMoeda	:= GETMV('MV_MOEDAP'+Alltrim(Str(SF1->F1_MOEDA)))
					_aDatos	:=	{SD1->D1_ESPECIE,SD1->D1_DOC+SD1->D1_SERIE," "," ",SD1->D1_FORNECE,SD1->D1_LOJA,_cMoeda,SF1->F1_XOBSERV}
				EndIf
			Case cArq		== "SE5"
				_aDatos	:=	{SUBSTR(POSICIONE("CVA",1,XFILIAL("CVA")+CV3->CV3_LP,"CVA_DESCRI"),1,15),;
				IIf(SE5->E5_TIPO ='CH' .and. SE5->E5_RECPAG =='P', Posicione("SE2",1,Xfilial("SE2")+SE5->(E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_TIPO+E5_FORNECE+E5_LOJA),"E2_NUMBCO"),;
				Alltrim(if(!Empty(SE5->E5_NUMERO),SE5->E5_NUMERO,SE5->E5_DOCUMEN))) + " SUC:" + SE5->E5_FILIAL,IIF(SE5->E5_RECPAG=='P',;
				iIF(Len(Alltrim(SE5->E5_DOCUMENT)) = 21.and. SE5->E5_TIPO <> 'APB' .and. CV3->CV3_DC ='1',SE5->E5_FORNADT,SE5->E5_CLIFOR),""),IIF(SE5->E5_RECPAG=='P',;
				iIF(Len(Alltrim(SE5->E5_DOCUMENT)) = 21.and. SE5->E5_TIPO <> 'APB' .and. CV3->CV3_DC ='1',SE5->E5_LOJAADT,SE5->E5_LOJA),""),IIF(SE5->E5_RECPAG=='R',SE5->E5_CLIFOR,""),IIF(SE5->E5_RECPAG=='R',SE5->E5_LOJA,""),;
				IIF(SE5->E5_VALOR <> SE5->E5_VLMOED2, "EXTRANJERA","PESOS "),SE5->E5_HISTOR}
				/* FMCH 15.05.2015
				_aDatos	:=	{SUBSTR(POSICIONE("CVA",1,XFILIAL("CVA")+CV3->CV3_LP,"CVA_DESCRI"),1,15),;
				IIf(SE5->E5_TIPO ='CH' .and. SE5->E5_RECPAG =='P', Posicione("SE2",1,Xfilial("SE2")+SE5->(E5_PREFIXO+E5_NUMERO+E5_PARCELA+E5_TIPO+E5_FORNECE+E5_LOJA),"E2_NUMBCO"),;
				Alltrim(if(!Empty(SE5->E5_NUMERO),SE5->E5_NUMERO,SE5->E5_DOCUMEN))) + " SUC:" + SE5->E5_MSFIL,IIF(SE5->E5_RECPAG=='P',;
				iIF(Len(Alltrim(SE5->E5_DOCUMENT)) = 21.and. SE5->E5_TIPO <> 'APB' .and. CV3->CV3_DC ='1',SE5->E5_FORNADT,SE5->E5_CLIFOR),""),IIF(SE5->E5_RECPAG=='P',;
				iIF(Len(Alltrim(SE5->E5_DOCUMENT)) = 21.and. SE5->E5_TIPO <> 'APB' .and. CV3->CV3_DC ='1',SE5->E5_LOJAADT,SE5->E5_LOJA),""),IIF(SE5->E5_RECPAG=='R',SE5->E5_CLIFOR,""),IIF(SE5->E5_RECPAG=='R',SE5->E5_LOJA,""),;
				IIF(SE5->E5_VALOR <> SE5->E5_VLMOED2, "EXTRANJERA","PESOS "),SE5->E5_HISTOR}
				*/
			Case cArq == "SD3"
				_aDatos	:=	{POSICIONE("CVA",1,XFILIAL("CVA")+CV3->CV3_LP,"CVA_DESCRI"),SD3->D3_DOC+ " "+ SD3->D3_TM," "," "," "," ",;
				,"","",""}
			Case cArq	== "SEU"
				SET->(DBSETORDER(1))
				SET->(DBSEEK(XFILIAL("SET")+SEU->EU_CAIXA))
				_aDatos	:=	{POSICIONE("CVA",1,XFILIAL("CVA")+CV3->CV3_LP,"CVA_DESCRI"),SEU->EU_NUM+ " "+ SEU->EU_CAIXA,SET->ET_FORNECE,SET->ET_LOJA," "," ","";
				,"","",""}
			Case cArq	== "SL4" 
				SL1->(dbsetorder(1))
				SL1->(Dbseek(SL4->L4_FILIAL+SL4->L4_NUM))                                                                                                       
//				_aDatos	:=	{SD2->D2_ESPECIE,SD2->D2_DOC+SD2->D2_SERIE,SD2->D2_CLIENTE,SD2->D2_LOJA," "," ",_cMoeda,""}
				_aDatos	:=	{"CF " ,SL1->L1_DOC+ " " + SL1->L1_SERIE," "," ",SL1->L1_CLIENTE ,SL1->L1_LOJA, " "," "}
		EndCase
	EndIf
EndIF


If cPadrao == '020'
	_aDatos	:= {"IMPORTACION"," "," "," "," ", " "," ",""}
EndIf
RestArea(_aArea)
Return(_aDatos)




/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณSCCTBR02  บAutor  ณMicrosiga           บ Data ณ  02/16/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static function traerecno(_cRecno)
Local _cRecCv3	:= " "
Local _cQuery	:= ""
Local _aArea	:= Getarea()


_cQuery	:= "SELECT CTK_RECCV3 FROM " +RetSqlname("CTK")
_cQuery	+= " WHERE CTK_RECDES = '"+ _cRecno+"' AND D_E_L_E_T_ <>'*' "
              
              TCQUERY _cQuery Alias IS3 NEW
DbselectArea("IS3")
While !EOF()
	_cRecCV3	:= IS3->CTK_RECCV3
dbskip()
EndDo                        
IS3->(Dbclosearea())
RestArea(_aArea)
Return _cRecCv3


Static Function treEmp()

Local aArea := GetArea()
Local aSM0  := SM0->(GetArea())
Local aRet  := {}

//FMCH 14.05.2015 If SM0->( DbSeek( cEmpant+"00") )
If SM0->( DbSeek( cEmpant) )
	While !SM0->(EOF()) .and. SM0->M0_CODIGO == CempAnt
	Aadd(aRet,SM0->M0_CODFIL)
	SM0->(dbskip())
	EndDo
EndIf

RestArea( aSM0 )
RestArea( aArea )

Return (aRet)