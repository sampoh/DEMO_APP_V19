//%attributes = {}

var $0; $RESULT : Object
var $1; $BASE_URL : Text

var $voJSON : Object
var $FLG_UPDATE : Boolean
var $FLG_SUCCESS : Boolean

$BASE_URL:=$1

$RESULT:=New object:C1471
$RESULT.result:=False:C215
$RESULT.update:=False:C215

//バージョンチェック通信
$RESULT.result:=DEMO_Check_Update_HTTP($BASE_URL; ->$voJSON)

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
