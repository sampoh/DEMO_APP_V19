//%attributes = {}

DEMO_Compiler

ON ERR CALL:C155("DEMO_ErrMethod")

var $Connected : Boolean
var $FORM; $TITLE : Text

$Connected:=4DC("http://127.0.0.1:8000")

If ($Connected)
	
	If (Is compiled mode:C492)
		HIDE TOOL BAR:C434
		HIDE MENU BAR:C432
		SET MENU BAR:C67(1)
	End if 
	
	//共有ストレージ ( インタープロセス変数の後継機能 )
	DEMO_Storage_Quit(False:C215)  //Storage.system.quit に False をセット
	
	While (Not:C34(Storage:C1525.system.quit))
		
		//"DEMO_Login" フォームを元にウィンドウ生成
		$FORM:="DEMO_Login"
		$TITLE:="DEMO Client - LOGIN"
		4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13)
		
		If (Storage:C1525.system.quit)
			If (Not:C34(4DC_Confirm("アプリケーションを終了します。よろしいですか？")))
				DEMO_Storage_Quit(False:C215)
			End if 
		Else 
			
			If (Storage:C1525.system.loggedIn)
				//"DEMO_List" フォームを元にウィンドウ生成
				$FORM:="DEMO_List"
				$TITLE:="DEMO Client - List"
				4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13)
			End if 
			
		End if 
		
	End while 
	
	If (Is compiled mode:C492)
		SHOW TOOL BAR:C433
		SHOW MENU BAR:C431
	End if 
	
Else 
	ALERT:C41("サーバと接続できませんでした。")
End if 

//コンパイル時はアプリ終了
If (Is compiled mode:C492)
	QUIT 4D:C291
End if 

ON ERR CALL:C155("")
