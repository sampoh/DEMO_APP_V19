//※1 コンポーネント "4DS" , "4DC" 間の通信処理は
//　　　"4DS_COM_OnWebConnection" 内または
//　　　"4DS_COM_DEBUG_START" + "4DS_COM_DEBUG_END" 内で実施されます。
//※2 "4DS_COM_OnWebConnection" の第1引数に True を渡す場合は、
//　　　"4DS_COM_DEBUG_START" , "4DS_COM_DEBUG_END" および
//　　　"EXECUTE METHOD" コマンドによる実装がないと正常に動作しないので気をつけてください。

var TICK : Object  //テスト用
TICK:=New object:C1471
TICK.start:=Tickcount:C458

var $1; $URL : Text

var $METHOD : Text
var $INPUT; $OUTPUT : Object
var $HTML : Text

$URL:=4DS_WEB_Clean_URL($1)

If (Not:C34(4DS_COM_OnWebConnection))
	
	Case of 
		: ($URL="manual")  //コンポーネントマニュアル表示用 ( ※ URLは任意のものに修正可能です )
			
			$HTML:=4DS_WEB_Manual_HTML
			WEB SEND TEXT:C677($HTML)
			
		: ($URL="screen_master")  //画面マスタ管理画面用 ( ※ URLは任意のものに修正可能です )
			
			If (4DS_IsComponent("4DS_MASTER"))
				EXECUTE METHOD:C1007("4DS_MST_WEB")
			Else 
				4DS_MST_NotFound
			End if 
			
		Else 
			//↓ WEBアプリを実装する場合はここに記述 ↓
			
			
			
			//↑ WEBアプリを実装する場合はここに記述 ↑
	End case 
	
End if 
