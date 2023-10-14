//%attributes = {"shared":true}
//エラーハンドリング対応Executor

var vlErrCode : Integer  //"EXECUTE METHOD" 以下でのエラー判定用

vlErrCode:=0

var $errMethod : Text

$errMethod:=Method called on error:C704

ON ERR CALL:C155("4DS_HandlerOnErr")

var $0; $voOUT : Object
var $1; $method : Text
var $2; $voIN : Object

var $sessionid : Text
var $session : Object

$method:=$1
$voIN:=$2

If (4DS_COM_HasSession(->$sessionid))
	//必要に応じてここにセッションアップデート処理を実装
	$session:=DEMOS_Update_Session($sessionid)
Else 
	$session:=New object:C1471("hasSession"; False:C215)
End if 


//EXECUTE METHOD($method; $voOUT; $voIN)
//↓セッション情報を第2引数に追加 ( コンポーネント仕様ではないため注意 )
EXECUTE METHOD:C1007($method; $voOUT; $voIN; $session)

$0:=$voOUT

ON ERR CALL:C155($errMethod)
