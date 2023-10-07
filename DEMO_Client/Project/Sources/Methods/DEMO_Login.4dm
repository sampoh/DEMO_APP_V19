//%attributes = {"folder":"DEMO","lang":"en","shared":true}

//↓必須パラメータ
var $0; $voOUT : Object
var $1; $action : Text
var $2; $voIN : Object
var $3; $TIPS : Object
//↑必須パラメータ

var $loggedin : Boolean
var $sessionid : Text

$action:=$1

If (Count parameters:C259>=2)
	$voIN:=$2
End if 

Case of 
	: ($action="before")
		//< 事前処理 >
		
		//ログイン機能を一時無効化
		4DC_ObjectDisableAll
		
		//セッションID保管値をクリア
		DEMO_Storage_SessionId("")
		
		//ログオフ状態を保管
		DEMO_Storage_LoggedIn(False:C215)
		
	: ($action="set")
		//< 値の送信 >
		//※ システム予約済み要素名 "method" , "files" 。 これらは特定機能専用のためその他の目的では使用不可能。
		//　"method" : サーバ側のメソッド指定 【 テキスト型 】
		//　"files" : ファイルダウンロード時のパス指定 【 テキスト配列 】
		
		$voOUT:=New object:C1471
		
		//サーバ側メソッドの指定
		$voOUT.method:="DEMOS_Login"
		
		//フォーム上の値を送信
		$voOUT.form:=4DC_FORM_Save
		
	: ($action="progress")
		
	: ($action="progress_files")
		//< ファイルダウンロード処理進捗状況 >
		
	: ($action="get")
		//< 値の取得 >
		
	: ($action="done")
		//< 正常時のみ実行 >
		
		If (4DC_COM_HasSession(->$sessionid))
			//OK
		Else 
			//NG
			$sessionid:=""
		End if 
		
		$loggedin:=OB Get:C1224($voIN; "$loggedin"; Is boolean:K8:9)
		
		//セッションIDとログイン可否情報を Storage に保管
		DEMO_Storage_SessionId($sessionid)
		DEMO_Storage_LoggedIn($loggedin)
		
	: ($action="fail")
		//< エラー時のみ実行 >
		
		//SCL_CMN_Error($voIN)
		
	: ($action="always")
		//< 常時実行 >
		
		//ログイン結果を判定し画面遷移
		If (Storage:C1525.system.loggedIn)
			//ログイン成功 → ログイン画面を閉じる
			CANCEL:C270
		Else 
			//ログイン失敗 → ログイン機能を再度有効化
			4DC_ObjectEnableAll
			ALERT:C41("Failed to login.")
		End if 
		
End case 

$0:=$voOUT
