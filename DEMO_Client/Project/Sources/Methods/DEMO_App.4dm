//%attributes = {}
//※ 直接実行せず必ず "DEMO_Start" からワーカーとして実行してください
//　　ワーカーとして実行することでフォームの有無に依存せずに通信可能となります。

DEMO_Compiler

ON ERR CALL:C155("DEMO_ErrMethod")

var $URL : Text
var $Connected : Boolean
var $FORM; $TITLE : Text
var $RESULT : Object

$URL:="http://127.0.0.1:8000"

$Connected:=4DC($URL)

If ($Connected)
	
	If (Is compiled mode:C492)
		//アップデートチェック
		DEMO_Check_Update($URL)
	End if 
	
	//共有ストレージ ( インタープロセス変数の後継機能 )
	DEMO_Storage_Quit(False:C215)  //Storage.system.quit に False をセット
	
	While (Not:C34(Storage:C1525.system.quit))
		
		//"DEMO_Login" フォームを元にウィンドウ生成
		$FORM:="DEMO_Login"
		$TITLE:="DEMO Client - LOGIN"
		4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13+Form has no menu bar:K39:18)
		
		If (Storage:C1525.system.quit)
			If (Not:C34(4DC_Confirm("アプリケーションを終了します。よろしいですか？")))
				DEMO_Storage_Quit(False:C215)
			End if 
		Else 
			
			If (Storage:C1525.system.loggedIn)
				//"DEMO_List" フォームを元にウィンドウ生成
				//$FORM:="DEMO_List"
				//$TITLE:="DEMO Client - List"
				//↓メニューに変更
				$FORM:="DEMO_Menu"
				$TITLE:="MAIN MENU"
				4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13+Form has no menu bar:K39:18; False:C215; False:C215; On the left:K39:2; At the top:K39:5)
			End if 
			
		End if 
		
	End while 
	
Else 
	ALERT:C41("サーバと接続できませんでした。")
End if 

//コンパイル時はアプリ終了
If (Is compiled mode:C492)
	QUIT 4D:C291
End if 

ON ERR CALL:C155("")

KILL WORKER:C1390
