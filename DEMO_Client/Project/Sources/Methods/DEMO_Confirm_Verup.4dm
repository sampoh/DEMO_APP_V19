//%attributes = {}

var $0; $ACCEPT : Boolean

var $msg : Text

$msg:="現在作業中の内容は保存されません。\r続行してよろしいですか？"

$ACCEPT:=4DC_Confirm($msg; "はい"; "いいえ")

If ($ACCEPT)
	Use (Storage:C1525.version)
		Storage:C1525.version.skip:=True:C214  //ログイン時のアップデートの確認画面をスキップ
	End use 
End if 

$0:=$ACCEPT
