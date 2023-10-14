//%attributes = {"shared":true}

//↓必須パラメータ
var $0; $voOUT : Object
var $1; $action : Text
var $2; $voIN : Object
var $3; $TIPS : Object
//↑必須パラメータ

var $loggedout : Boolean

$action:=$1

If (Count parameters:C259>=2)
	$voIN:=$2
End if 

Case of 
	: ($action="before")
		//< 事前処理 >
		
	: ($action="set")
		//< 値の送信 >
		//※ システム予約済み要素名 "method" , "files" 。 これらは特定機能専用のためその他の目的では使用不可能。
		//　"method" : サーバ側のメソッド指定 【 テキスト型 】
		//　"files" : ファイルダウンロード時のパス指定 【 テキスト配列 】
		
		$voOUT:=New object:C1471
		
		//サーバ側メソッドの指定
		$voOUT.method:="DEMOS_Logout"
		
	: ($action="progress")
		
	: ($action="progress_files")
		//< ファイルダウンロード処理進捗状況 >
		
	: ($action="get")
		//< 値の取得 >
		
	: ($action="done")
		//< 正常時のみ実行 >
		
	: ($action="fail")
		//< エラー時のみ実行 >
		
	: ($action="always")
		//< 常時実行 >
		
		DEMO_Storage_SessionId("")
		DEMO_Storage_LoggedIn(False:C215)
		
		//ログアウト結果を判定し画面遷移
		If (Storage:C1525.system.loggedIn)
			//ログアウト失敗
			ALERT:C41("Failed to logout.")
		Else 
			//ログアウト成功
			CANCEL:C270
		End if 
		
End case 

$0:=$voOUT
