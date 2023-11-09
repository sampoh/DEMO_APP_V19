//%attributes = {}

//↓必須パラメータ
var $0; $voOUT : Object
var $1; $action : Text
var $2; $voIN : Object
var $3; $TIPS : Object
//↑必須パラメータ

var $PATH_4DZ : Text

$action:=$1

If (Count parameters:C259>=2)
	$voIN:=$2
End if 

Case of 
	: ($action="before")
		//< 事前処理 >
		
		$PATH_4DZ:=Temporary folder:C486+Generate UUID:C1066+"_temp.4DZ"
		4DC_KEEP("PATH_4DZ"; ->$PATH_4DZ)
		
	: ($action="set")
		//< 値の送信 >
		//※ システム予約済み要素名 "method" , "files" 。 これらは特定機能専用のためその他の目的では使用不可能。
		//　"method" : サーバ側のメソッド指定 【 テキスト型 】
		//　"files" : ファイルダウンロード時のパス指定 【 テキスト配列 】
		
		$voOUT:=New object:C1471
		
		//サーバ側メソッドの指定
		$voOUT.method:="DEMOS_Client_Download"
		
		//ダウンロードパス
		4DC_KEEP_Get("PATH_4DZ"; ->$PATH_4DZ)
		$voOUT.files:=New collection:C1472
		$voOUT.files.push($PATH_4DZ)
		
	: ($action="progress")
		
	: ($action="progress_files")
		//< ファイルダウンロード処理進捗状況 >
		
		If ($voIN.percentile=Null:C1517)
			Form:C1466.update.progress:=0
			Form:C1466.update.text:="0%"
		Else 
			Form:C1466.update.progress:=$voIN.percentile
			Form:C1466.update.text:=String:C10(Form:C1466.update.progress)+"%"
		End if 
		
	: ($action="get")
		//< 値の取得 >
		
	: ($action="done")
		//< 正常時のみ実行 >
		
		FORM GOTO PAGE:C247(4)
		
	: ($action="fail")
		//< エラー時のみ実行 >
		
		4DC_KEEP_Remove("PATH_4DZ")
		
		ALERT:C41("Failed to download client application.")
		
	: ($action="always")
		//< 常時実行 >
		
End case 

$0:=$voOUT
