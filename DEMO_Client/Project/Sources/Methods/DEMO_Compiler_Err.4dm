﻿//%attributes = {}

//エラーハンドリング用 ( インタープロセス )
If (Storage:C1525.error=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.error:=New shared object:C1526
	End use 
End if 
If (Storage:C1525.error.errCode=Null:C1517)
	Use (Storage:C1525.error)
		Storage:C1525.error.errCode:=0
		Storage:C1525.error.errMethod:=""
		Storage:C1525.error.stack:=New shared collection:C1527
		Storage:C1525.error.datetime:=""
	End use 
End if 

//エラーハンドリング用 ( プロセス単位 )
var voError : Object
voError:=New object:C1471
voError.errCode:=0
voError.errMethod:=""
voError.stack:=New collection:C1472
voError.datetime:=""
