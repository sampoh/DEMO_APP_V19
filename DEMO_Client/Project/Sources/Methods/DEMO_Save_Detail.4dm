//%attributes = {}

//↓必須パラメータ
var $0; $voOUT : Object
var $1; $action : Text
var $2; $voIN : Object
var $3; $TIPS : Object
//↑必須パラメータ

var $ID : Integer
var $voFORM : Object

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
		$voOUT.method:="DEMOS_Save_Detail"
		
		//入力フォームの値を取得
		$voOUT.site:=OB Copy:C1225(Form:C1466.detail)
		
		//"$ID" を取得
		4DC_KEEP_Get("[sites]ID"; ->$ID)
		$voOUT.site.ID:=$ID
		
		$voOUT.meta:=Form:C1466.meta.copy()
		//※ コレクションはポインタ経由で更新するとビルド時に型変換エラーになるが
		//　　読み込みは問題ない。ただし可読性向上のためここではプロセス変数経由
		
	: ($action="progress")
		
	: ($action="progress_files")
		//< ファイルダウンロード処理進捗状況 >
		
	: ($action="get")
		//< 値の取得 >
		
	: ($action="done")
		//< 正常時のみ実行 >
		
		If ($voIN.errCode=0)
			
			If ($voIN.ID>0)
				$voUnlock:=New object:C1471
				$voUnlock.name:="sites"
				$voUnlock.value:=String:C10($voIN.ID)
				4DC_KEEP("unlock"; ->$voUnlock)  //ロック解除対象の情報をプロセス共有値に保管
				4DC_COM_Add("DEMO_Unlock")  //ロック解除用通信処理
			End if 
			
			4DC_KEEP_Remove("[sites]ID")  //保管値からIDを削除
			4DC_COM_Add("DEMO_List")  //一覧リロード
			
		Else 
			ALERT:C41($voIN.errMsg)
		End if 
		
	: ($action="fail")
		//< エラー時のみ実行 >
		
		DEMO_Toggle_Progress(False:C215)
		
		ALERT:C41("Failed to save site data.")
		
	: ($action="always")
		//< 常時実行 >
		
End case 

$0:=$voOUT
