
var $execute : Boolean
var $voFORM : Object

$execute:=(Form event code:C388=On Clicked:K2:4)

If ($execute)
	
	$execute:=(\
		(voLogin.account#"") & \
		(voLogin.password#""))
	
	If (Not:C34($execute))
		ALERT:C41("Account and password are required.")
	End if 
	
End if 

If ($execute)
	
	//ログイン実施
	4DC_COM_Login("DEMO_Login")
	
End if 
