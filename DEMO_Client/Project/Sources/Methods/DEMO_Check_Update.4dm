//%attributes = {}

var $0; $RESULT : Object

var $voOpt : Object
var $voJSON : Object
var $FLG_UPDATE : Boolean
var $FLG_SUCCESS : Boolean

$voOpt:=4DC_COM_Get_Option

$RESULT:=New object:C1471
$RESULT.result:=False:C215
$RESULT.update:=False:C215

//バージョンチェック通信
$RESULT.result:=DEMO_Check_Update_HTTP($voOpt.url; ->$voJSON)

If ($RESULT.result)
	$RESULT.update:=($voJSON.numberString#Storage:C1525.version.numberString)
End if 

If ($RESULT.update)
	Use (Storage:C1525.version)
		Storage:C1525.version.update:=True:C214  //アップデートトリガ更新
		Storage:C1525.version.numberStringNew:=$voJSON.numberString
	End use 
End if 

$0:=$RESULT
