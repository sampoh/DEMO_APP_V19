//%attributes = {}

var $1; $QUIT : Boolean

$QUIT:=$1

//共有ストレージ ( インタープロセス変数の後継機能 )
If (Storage:C1525.system=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.system:=New shared object:C1526
	End use 
End if 

Use (Storage:C1525.system)
	Storage:C1525.system.quit:=$QUIT
End use 

//※ セマフォの代替機能も兼ねる