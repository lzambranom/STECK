#Include "TopConn.ch"
#Include "Protheus.ch"
#Include "RPTDef.ch"
user Function SelCli(cCod,cLoja)
    Local cID:=space(TamSX3("A1_CGC")[1])
    cID:=Posicione("SA1",1,xfilial("SA1")+cCod+cLoja,"A1_CGC")
    IF EMPTY(cID)
        cID:=Posicione("SA1",1,xfilial("SA1")+cCod+cLoja,"A1_PFISICA")
    EndIf
return cID 
