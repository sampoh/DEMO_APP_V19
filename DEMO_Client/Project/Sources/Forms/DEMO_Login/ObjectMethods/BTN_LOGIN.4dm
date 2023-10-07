
var $execute : Boolean
var $voFORM : Object

$execute:=(Form event code:C388=On Clicked:K2:4)

If ($execute)
	
	//フォームの入力内容を取得
	$voFORM:=4DC_FORM_Save
	
	$execute:=(\
		(OB Get:C1224($voFORM; "account"; Is text:K8:3)#"") & \
		(OB Get:C1224($voFORM; "password"; Is text:K8:3)#""))
	
	If (Not:C34($execute))
		ALERT:C41("Account and password are required.")
	End if 
	
End if 

If ($execute)
	
	//ログイン実施
	4DC_COM_Login("DEMO_Login")
	
End if 
