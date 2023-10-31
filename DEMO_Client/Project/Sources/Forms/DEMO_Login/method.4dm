
var $voFORM : Object
var $msg : Text

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		//初期値をフォームに設定
		voLogin:=New object:C1471
		voLogin.account:="takahara"
		voLogin.password:="1234"
		
		If (Storage:C1525.version.update)
			If (Is compiled mode:C492)
				FORM GOTO PAGE:C247(2)
			Else 
				//※ インタプリタ時にはバージョンアップを強制しない
				$msg:="現在のバージョン : "+Storage:C1525.version.numberString+"\r"
				$msg:=$msg+"最新版バージョン : "+Storage:C1525.version.numberStringNew+"\r"
				$msg:=$msg+"( ※ インタプリタ時にはバージョンアップせず続行します )"
				ALERT:C41($msg)
			End if 
		End if 
		
	: (Form event code:C388=On Page Change:K2:54)
		
		If (FORM Get current page:C276=3)
			//クライアントダウンロード処理
			4DC_COM_Add("DEMO_Client_Download")
		End if 
		
	: (Form event code:C388=On Close Box:K2:21)
		
		DEMO_Storage_Quit(True:C214)
		CANCEL:C270
		
End case 

//センタリング対象オブジェクト
4DC_KeepCenter("APP_NAME")
4DC_KeepCenter("account")
4DC_KeepCenter("password")
4DC_KeepCenter("BTN_LOGIN")
4DC_KeepCenter("BTN_QUIT")