//%attributes = {}

//↓必須パラメータ
var $0; $voOUT : Object
var $1; $action : Text
var $2; $voIN : Object
var $3; $TIPS : Object
//↑必須パラメータ

var $ID : Integer
var $OPEN : Boolean
var $ONE : Object
var $siteType : Text

$action:=$1

If (Count parameters:C259>=2)
	$voIN:=$2
End if 

Case of 
	: ($action="before")
		//< 事前処理 >
		
		DEMO_Toggle_Progress(True:C214)
		
	: ($action="set")
		//< 値の送信 >
		//※ システム予約済み要素名 "method" , "files" 。 これらは特定機能専用のためその他の目的では使用不可能。
		//　"method" : サーバ側のメソッド指定 【 テキスト型 】
		//　"files" : ファイルダウンロード時のパス指定 【 テキスト配列 】
		
		$voOUT:=New object:C1471
		
		//サーバ側メソッドの指定
		$voOUT.method:="DEMOS_Show_Detail"
		
		//"$ID" を取得
		4DC_KEEP_Get("[sites]ID"; ->$ID)
		$voOUT.ID:=$ID
		
	: ($action="progress")
		
	: ($action="progress_files")
		//< ファイルダウンロード処理進捗状況 >
		
	: ($action="get")
		//< 値の取得 >
		
	: ($action="done")
		//< 正常時のみ実行 >
		
		If ($voIN.sites.type="")
			$voIN.sites.type:="unknown"
		End if 
		
		//プルダウン親要素
		Form:C1466.pulldown:=New object:C1471
		
		//"siteType" プルダウン
		Form:C1466.pulldown.siteType:=New object:C1471
		Form:C1466.pulldown.siteType.values:=New collection:C1472
		For each ($ONE; $voIN.pullDown.site_type)
			Form:C1466.pulldown.siteType.values.push($ONE.value)
		End for each 
		Form:C1466.pulldown.siteType.index:=Form:C1466.pulldown.siteType.values.indexOf($voIN.sites.type)
		Form:C1466.pulldown.siteType.currentValue:=$voIN.sites.type
		
		OBJECT SET ENABLED:C1123(*; "BTN_SAVE"; Not:C34($voIN.lock.isLocked))
		
		If ($voIN.lock.isLocked)
			$OPEN:=4DC_Confirm("ユーザ \""+$voIN.lock.user.account+"\" によって編集中です。\r\n読み取り専用で開きますか？")
		Else 
			$OPEN:=True:C214
		End if 
		
		If ($OPEN)
			
			Form:C1466.detail:=OB Copy:C1225($voIN.sites)
			Form:C1466.meta:=$voIN.meta.copy()  //※ コレクションはポインタ経由で更新するとビルド時に型変換エラーになるので注意
			
			FORM GOTO PAGE:C247(2)
			
		End if 
		
	: ($action="fail")
		//< エラー時のみ実行 >
		
		ALERT:C41("Failed to load sites list.")
		
	: ($action="always")
		//< 常時実行 >
		
		DEMO_Toggle_Progress(False:C215)
		
End case 

$0:=$voOUT
