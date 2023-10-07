//%attributes = {}

//エラー準備
If (Storage:C1525.error=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.error:=New shared object:C1526
	End use 
End if 
Use (Storage:C1525.error)
	Storage:C1525.error.errCode:=0
	Storage:C1525.error.errMethod:=""
	Storage:C1525.error.stack:=New shared collection:C1527
	Storage:C1525.error.datetime:=""
End use 
