
If (Form event code:C388=On Clicked:K2:4)
	
	$ID:=-1
	4DC_KEEP("$ID"; ->$ID)
	
	//通信実施
	4DC_COM_Add("DEMO_Show_Detail")
	
End if 
