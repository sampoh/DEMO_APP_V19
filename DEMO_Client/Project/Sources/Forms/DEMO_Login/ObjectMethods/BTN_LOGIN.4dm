
var $execute : Boolean
var $voFORM : Object

$execute:=(Form event code:C388=On Clicked:K2:4)

If ($execute)
	
	$execute:=(\
		(Form:C1466.login.account#"") & \
		(Form:C1466.login.password#""))
	
	If (Not:C34($execute))
		ALERT:C41("Account and password are required.")
	End if 
	
End if 

If ($execute)
	
	//ログイン実施
	4DC_COM_Login("DEMO_Login")
	
End if 
