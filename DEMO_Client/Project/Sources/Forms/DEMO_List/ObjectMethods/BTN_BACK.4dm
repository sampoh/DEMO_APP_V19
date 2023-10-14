
var $voUnlock : Object
var $ID : Integer

If (Form event code:C388=On Clicked:K2:4)
	
	4DC_KEEP_Get("[sites]ID"; ->$ID)
	
	If ($ID>0)
		$voUnlock:=New object:C1471
		$voUnlock.name:="sites"
		$voUnlock.value:=String:C10($ID)
		4DC_KEEP("unlock"; ->$voUnlock)
		4DC_COM_Add("DEMO_Unlock")
	End if 
	
	4DC_KEEP_Remove("[sites]ID")
	4DC_COM_Add("DEMO_List")
	
End if 
