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

User Function SCCTBR02


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
Local _aDatAsi	:= {"","","","","","","",""}
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
//cQuery:="SELECT * FROM SACVSTMAYORPESOS WHERE FECHA BETWEEN '"+ dtos(MV_PAR05)+"' AND '" + dtos(MV_PAR06)+"'"
cQuery	:= "SELECT PESOS.CT2_ORIGEM,PESOS.R_E_C_N_O_,PESOS.CT2_TPSALD,PESOS.FECHA,PESOS.TIPO_MOV,PESOS.CUENTA,PESOS.DESC_CUENTA,PESOS.ASIENTO,PESOS.LOTE,PESOS.SUBLOTE,PESOS.DOC,PESOS.HISTORIAL,PESOS.LLAVE,PESOS.VALOR_CREDITO,PESOS.VALOR_DEBITO,PESOS.LINEA,PESOS.CT2_FILIAL,
cQuery	+="DOLAR.VALOR_CREDITO AS CRED_DOLARES,DOLAR.VALOR_DEBITO AS DEB_DOLARES,EURO.VALOR_CREDITO AS CRED_EUROS,EURO.VALOR_DEBITO AS DEB_EUROS,"
cQuery	+="MON4.VALOR_CREDITO AS CRED_INDEX,MON4.VALOR_DEBITO  AS DEB_INDEX, MON5.VALOR_CREDITO AS CRED_REAJUS, MON5.VALOR_DEBITO AS DEB_REAJUST,  "
cQuery	+=" PESOS.ICONTABLE,PESOS.DESCICONTABLE,PESOS.CCOSTO,PESOS.DESCCCOSTO "
cQuery	+=" FROM (((ARIMAYORPESOS"+cempant+" PESOS "
cQuery	+=" LEFT JOIN ARIMAYORDOLAR"+cempant+" DOLAR  ON DOLAR.CT2_FILIAL=PESOS.CT2_FILIAL AND DOLAR.LOTE = PESOS.LOTE AND DOLAR.SUBLOTE = PESOS.SUBLOTE AND DOLAR.DOC=PESOS.DOC AND DOLAR.LINEA = PESOS.LINEA AND DOLAR.CUENTA = PESOS.CUENTA  AND DOLAR.FECHA=PESOS.FECHA AND DOLAR.TIPO_MOV=PESOS.TIPO_MOV )"
cQuery  += " LEFT JOIN ARIMAYOREUROS"+cempant+" EURO   ON EURO.CT2_FILIAL=PESOS.CT2_FILIAL AND  EURO.LOTE = PESOS.LOTE AND EURO.SUBLOTE = PESOS.SUBLOTE AND EURO.DOC=PESOS.DOC AND EURO.LINEA = PESOS.LINEA AND EURO.CUENTA = PESOS.CUENTA  AND EURO.FECHA=PESOS.FECHA AND EURO.TIPO_MOV=PESOS.TIPO_MOV )
cQuery  += " LEFT JOIN ARIMAYORM4"+cempant+" MON4  ON MON4.CT2_FILIAL=PESOS.CT2_FILIAL AND MON4.LOTE = PESOS.LOTE AND MON4.SUBLOTE = PESOS.SUBLOTE AND MON4.DOC=PESOS.DOC AND MON4.LINEA = PESOS.LINEA AND MON4.CUENTA = PESOS.CUENTA  AND MON4.FECHA=PESOS.FECHA AND MON4.TIPO_MOV=PESOS.TIPO_MOV)
cQuery  += " LEFT JOIN ARIMAYORM5"+cempant+"  MON5 ON MON5.CT2_FILIAL=PESOS.CT2_FILIAL AND MON5.LOTE = PESOS.LOTE AND MON5.SUBLOTE = PESOS.SUBLOTE AND MON5.DOC=PESOS.DOC AND MON5.LINEA = PESOS.LINEA AND MON5.CUENTA = PESOS.CUENTA  AND MON5.FECHA=PESOS.FECHA AND MON5.TIPO_MOV=PESOS.TIPO_MOV"
cQuery	+=" WHERE PESOS.FECHA BETWEEN '"+ dtos(MV_PAR05)+"' AND '" + dtos(MV_PAR06)+"' AND "
cQuery	+=" PESOS.CUENTA BETWEEN '"+ MV_PAR03 +"' AND '" + MV_PAR04 +"' AND PESOS.CT2_FILIAL BETWEEN '"+ MV_PAR07+"'AND '"+MV_PAR08 +"' "
cQuery	+=" AND PESOS.CT2_TPSALD BETWEEN '"+ MV_PAR09 +"' AND '" + MV_PAR10 +"'"
IF MV_PAR01 == 2 // SI PIDO ALGUNA MONEDA ESPECIFICA
	IF MV_PAR02 == 1  //SI ES PESOS
		cQuery	+= " AND DOLAR.VALOR_CREDITO IS NULL "
		cQuery	+= " AND DOLAR.VALOR_DEBITO IS NULL "
		cQuery	+= " AND EURO.VALOR_CREDITO IS NULL "
		cQuery	+= " AND EURO.VALOR_DEBITO  IS NULL "
		cQuery	+= " AND MON4.VALOR_CREDITO IS NULL "
		cQuery	+= " AND MON4.VALOR_DEBITO IS NULL "
		cQuery	+= " AND MON5.VALOR_CREDITO IS NULL "
		cQuery	+= " AND MON5.VALOR_CREDITO IS NULL "
	ElseIF MV_PAR02 == 2  //SI ES dolares
		cQuery	+= " AND (DOLAR.VALOR_CREDITO <> 0 "
		cQuery	+= " OR DOLAR.VALOR_DEBITO <>0)  "
	ElseIf MV_PAR02	== 3
		cQuery	+= " AND DOLAR.VALOR_CREDITO IS NULL "
		cQuery	+= " AND DOLAR.VALOR_DEBITO IS NULL "
		cQuery	+= " AND (EURO.VALOR_CREDITO <> 0 "
		cQuery	+= " OR EURO.VALOR_DEBITO  <> 0) "
		cQuery	+= " AND MON4.VALOR_CREDITO IS NULL "
		cQuery	+= " AND MON4.VALOR_DEBITO IS NULL "
		cQuery	+= " AND MON5.VALOR_CREDITO IS NULL "
		cQuery	+= " AND MON5.VALOR_CREDITO IS NULL "
	elseIf MV_PAR02 == 4
		cQuery	+= " AND DOLAR.VALOR_CREDITO IS NULL "
		cQuery	+= " AND DOLAR.VALOR_DEBITO IS NULL "
		cQuery	+= " AND EURO.VALOR_CREDITO IS NULL "
		cQuery	+= " AND EURO.VALOR_DEBITO  IS NULL "
		cQuery	+= " AND (MON4.VALOR_CREDITO <> 0 "
		cQuery	+= " OR MON4.VALOR_DEBITO <> 0) "
		cQuery	+= " AND MON5.VALOR_CREDITO IS NULL "
		cQuery	+= " AND MON5.VALOR_CREDITO IS NULL "
	ElseIF MV_PAR02 == 5
		cQuery	+= " AND DOLAR.VALOR_CREDITO IS NULL "
		cQuery	+= " AND DOLAR.VALOR_DEBITO IS NULL "
		cQuery	+= " AND EURO.VALOR_CREDITO IS NULL "
		cQuery	+= " AND EURO.VALOR_DEBITO  IS NULL "
		cQuery	+= " AND MON4.VALOR_CREDITO IS NULL "
		cQuery	+= " AND MON4.VALOR_DEBITO IS NULL "
		cQuery	+= " AND (MON5.VALOR_CREDITO <> 0 "
		cQuery	+= " OR MON5.VALOR_CREDITO <> 0) "
	EndIf
EndIf
cQuery	+=" ORDER BY PESOS.CUENTA,PESOS.FECHA,PESOS.DOC "

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
AADD(aHeadLF,{"Codigo Proveedor", "C",6,} )
AADD(aHeadLF,{"Loja", "C",2,} )
AADD(aHeadLF,{"Razon Social Proveedor", "C",40,} )
AADD(aHeadLF,{"CUIT Proveedor", "C",14,} )
AADD(aHeadLF,{"Codigo Cliente", "C",6,} )
AADD(aHeadLF,{"Loja", "C",2,} )
AADD(aHeadLF,{"Razon Social Cliente", "C",40,} )
AADD(aHeadLF,{"CUIT Cliente", "C",14,} )
AADD(aHeadLF,{"Moneda Original Transaccion", "C",20,} )
AADD(aHeadLF,{"Tipo de Saldo", "C",1,} )
AADD(aHeadLF,{"Observ. Comprobante", "C",60,} )
AADD(aHeadLF,{"Origen Asiento", "C",60,} )

While !EOF()
	Incregua()
	
	// Coloque aquํ la l๓gica de la impresi๓n de su programa...
	// Utilice PSAY para salida en la impresora. Por ejemplo:
	// busco la tasa de cambio de la moneda original
	If Empty(_cCtaAnt) .or. IS2->CUENTA <> _cCtaAnt // si es otra cuenta contable
		_nSaldoAnt	:= 0
		_nSaldoAct	:= 0
		_nSaldoAnt	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"01","1")[1] *-1
		_nSaldAct	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"01","1")[1] *-1
		_nSaldM2	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"02","1")[1] *-1
		_nSadAcM2	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"02","1")[1] *-1
		_nSaldM3	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"03","1")[1] *-1
		_nSadAcM3	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"03","1")[1] *-1
		_nSaldM4	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"04","1")[1] *-1
		_nSadAcM4	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"04","1")[1] *-1
		_nSaldM5	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"05","1")[1] *-1
		_nSadAcM5	:= SaldoCt7(IS2->CUENTA,stod(IS2->FECHA)-1,"05","1")[1] *-1
		
		_cCtaAnt := IS2->CUENTA
		
		
		
		aColsLin := {"Cuenta Contable: "+ IS2->CUENTA + " "+ IS2->DESC_CUENTA,,,,,,,,,,,,,,,,,,,,,if(mv_par01=1, _nSaldoAnt,""),;
		Iif(mv_par01=1, _nSaldM2,""),if(mv_par01=1, _nSaldM3,""),if(mv_par01=1, _nSaldM4,""),if(mv_par01=1, _nSaldM5,""), ,,,.f.}
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
		DbSeek (stoD(IS2->FECHA))
		nMoeda	 := &("SM2->M2_MOEDA"+alltrim(str(_cMoedOrig)))
		
		If _cMoedOrig == 2
			nMoedaas := Round((IS2->VALOR_DEBITO+ IS2->VALOR_CREDITO) / (IS2->DEB_DOLARES + IS2->CRED_DOLARES),4)
		elseIf _cMoedOrig == 3
			nMoedaas := Round((IS2->VALOR_DEBITO+ IS2->VALOR_CREDITO) / (IS2->DEB_EUROS + IS2->CRED_EUROS),4)
		elseIf _cMoedOrig == 4
			nMoedaas := Round((IS2->VALOR_DEBITO+ IS2->VALOR_CREDITO) / (IS2->DEB_INDEX + IS2->CRED_INDEX),4)
		elseIf _cMoedOrig == 5
			nMoedaas := Round((IS2->VALOR_DEBITO+ IS2->VALOR_CREDITO) / (IS2->DEB_REAJUS + IS2->CRED_REAJUS),4)
		EndIF
	Else
		nMoeda	:= 1
	EndIf
	
	dbselectarea("IS2")
	_aDatAsi	:=	scrastrea(IS2->ASIENTO)
	
	If _cMoedOrig == 1
		nValord	:= IS2->VALOR_DEBITO
		nvalorc	:=IS2->VALOR_CREDITO
	elseIf _cMoedOrig == 2
		nValord	:= IS2->DEB_DOLARES
		nvalorc	:=IS2->CRED_DOLARES
		_nSaldM2	:= _nSaldM2 + (IS2->DEB_DOLARES - IS2->CRED_DOLARES)
	elseIf _cMoedOrig == 3
		nValord	:= IS2->DEB_EUROS
		nvalorc	:= IS2->CRED_EUROS
		_nSaldM3	:= _nSaldM3 + (IS2->DEB_EUROS - IS2->CRED_EUROS)
	elseIf _cMoedOrig == 4
		nValord	:= IS2->DEB_INDEX
		nvalorc	:= IS2->CRED_INDEX
		_nSaldM4	:= _nSaldM4 + (IS2->DEB_INDEX - IS2->CRED_INDEX)
	elseIf _cMoedOrig == 5
		nValord	:= IS2->DEB_REAJUS
		nvalorc	:= IS2->CRED_REAJUS
		_nSaldM5	:= _nSaldM5 + (IS2->DEB_REAJUS - IS2->CRED_REAJUS)
	EndIF
	_nSaldAct	:= _nSaldAct + IS2->VALOR_DEBITO - IS2->VALOR_CREDITO
	//		@nLin,185 PSAY Transform(if(mv_par01==1, _nsaldAct,""),"@E 99999999999.99")
	SA1->(DBSEEK(Xfilial("SA1")+_aDatAsi[5]+_aDatAsi[6]))
	SA2->(DBSEEK(Xfilial("SA2")+_aDatAsi[3]+_aDatAsi[4]))
	
	//                   1             2            3           4        5
	aColsLin:={CHR(160)+IS2->CUENTA,IS2->DESC_CUENTA,CHR(160)+IS2->CCOSTO,IS2->DESCCCOSTO,CHR(160)+IS2->ICONTABLE,IS2->DESCICONTABLE,STOD(IS2->FECHA),chr(160)+is2->LOTE,chr(160)+IS2->SUBLOTE,chr(160)+IS2->DOC,chr(160)+IS2->LINEA,		IF(!EMPTY(_aDatAsi[1]),chr(160)+_aDatAsi[1],""),IF(!EMPTY(_aDatAsi[2]),chr(160)+_aDatAsi[2],""),Alltrim(IS2->HISTORIAL),Alltrim(getmv("MV_MOEDAP"+alltrim(Str(_cMoedOrig)))),nMoeda,nMoedaas,nvalord ,nvalorc,IS2->VALOR_DEBITO ,IS2->VALOR_CREDITO ,if(mv_par01==1, _nsaldAct,""),IF (_cMoedOrig == 2, _nSaldM2,""),IF (_cMoedOrig == 3, _nSaldM3,""),IF (_cMoedOrig == 4, _nSaldM4,""),IF (_cMoedOrig == 5, _nSaldM5,""),Chr(160)+_aDatAsi[3],chr(160)+_aDatAsi[4],chr(160)+SA2->A2_NOME,Chr(160)+SA2->A2_CGC,chr(160)+_aDatAsi[5],chr(160)+_aDatAsi[6],chr(160)+SA1->A1_NOME,Chr(160)+SA1->A1_CGC,_aDatAsi[7],IS2->CT2_TPSALD,_aDatAsi[8],IS2->CT2_ORIGEM,.F.}
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

/*
SET DEVICE TO SCREEN

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Si imprime en disco, llama al gerente de impresion...          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

If aReturn[5]==1
dbCommitAll()
SET PRINTER TO
OurSpool(wnrel)
Endif

MS_FLUSH()
*/
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
PutSx1(cPerg,"07","Desde Filial?","Desde Filial?","Desde Filial?","mv_ch7","C",2,00,00,"G","","SM0","","","mv_par07","","","","","","","",;
"","","","","","","","","","","","","")
PutSx1(cPerg,"08","Hasta Filial?","Hasta Filial?","Hasta Filial?","mv_ch8","C",2,00,00,"G","","SM0","","","mv_par08","","","","","","","",;
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
If IS2->CRED_DOLARES <> 0 .or. IS2->DEB_DOLARES <> 0
	_nMoedOr	:= 2
ElseIf	IS2->CRED_EUROS <> 0 .or. IS2->DEB_EUROS <> 0
	_nMoedOr	:= 3
ElseIf	IS2->CRED_INDEX <> 0 .or. IS2->DEB_INDEX <> 0
	_nMoedOr	:= 4
ElseIf	IS2->CRED_REAJUS <> 0 .or. IS2->DEB_REAJUS <> 0
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

cRecCT2 := ALLTRIM(STR(INT(IS2->R_E_C_N_O_)))
_nRecnCtk	:= TraeRecno(cRecCt2)

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
					_aDatos	:=	{SD1->D1_ESPECIE,SD1->D1_DOC+SD1->D1_SERIE,SD1->D1_FORNECE,SD1->D1_LOJA," "," ",_cMoeda,SF1->F1_XOBERV}
				Else
					_cMoeda	:= Posicione("SF1",1,xFilial("SF1")+SD1->D1_DOC+SD1->D1_SERIE+SD1->D1_FORNECE+SD1->D1_LOJA,"F1_MOEDA")
					_cMoeda	:= GETMV('MV_MOEDAP'+Alltrim(Str(SF1->F1_MOEDA)))
					_aDatos	:=	{SD1->D1_ESPECIE,SD1->D1_DOC+SD1->D1_SERIE," "," ",SD1->D1_FORNECE,SD1->D1_LOJA,_cMoeda,SF1->F1_XOBERV}
				EndIf
			Case cArq		== "SE5"
				_aDatos	:=	{SUBSTR(CTL->CTL_DESC,1,15),Alltrim(if(!Empty(SE5->E5_NUMERO),SE5->E5_NUMERO,SE5->E5_DOCUMEN)) + "SUC:" + SE5->E5_MSFIL," "," "," "," ",;
				IIF(SE5->E5_VALOR <> SE5->E5_VLMOED2, "EXTRANJERA","PESOS "),SE5->E5_HISTOR}
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


If cPadrao == '002'
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
ฑฑบUso       ณ AP                                                        บฑฑ
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
