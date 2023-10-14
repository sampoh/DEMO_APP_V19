//%attributes = {}
//< Oauth認証 >

//！！！！！！ 手動実行専用なので注意 ！！！！！！

TRACE:C157

//※1 一度実行すると "Resources" フォルダに各種情報を保管するので再起動しても問題ありません。
//※2 使用するGoogleアカウントを変更する場合やメールサーバの設定変更の際は再度実行してください。

var $PATH; $JSON; $errMsg : Text
var $BLOB : Blob
var $FLG_ACCEPT : Boolean
var $OBJ : Object

//Google クラウド Console から取得した認証用JSON
$JSON:=DEMOS_GoogleJSON

//JSONの内容をコンポーネントに登録
If (Not:C34(AUTOBK_Oauth_Json($JSON; ->$errMsg)))
	TRACE:C157  //※ 戻り値が False ならエラーなので確認すること
End if 

//Oauth認証実施
$FLG_ACCEPT:=AUTOBK_Oauth
//$FLG_ACCEPT:=AUTOBK_Oauth(True)
//※ 戻り値が False の場合は失敗なので要確認

//メール通知する場合は↓は必須
AUTOBK_Smtp("smtp.rna.co.jp"; 587; "info@dev.rna.co.jp"; "xh$Wa26#"; "info@dev.rna.co.jp")

TRACE:C157
