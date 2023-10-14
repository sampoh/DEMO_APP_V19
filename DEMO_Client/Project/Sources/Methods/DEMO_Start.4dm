﻿//%attributes = {}

//< 基本コーディングルール >
//　・ インタープロセス変数は全面的に使用禁止
//　・ 必要なインタープロセス値は "Storage" コマンドで実装すること
//　・ フォームオブジェクトに割り当てる値にはプロセス変数使用OK
//　・ フォームオブジェクト以外にはプロセス変数を使用しないこと ( 例外あり )
//　・ リストボックスはコレクションで実装すること

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
				$FORM:="DEMO_List"
				$TITLE:="DEMO Client - List"
				4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13+Form has no menu bar:K39:18)
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
