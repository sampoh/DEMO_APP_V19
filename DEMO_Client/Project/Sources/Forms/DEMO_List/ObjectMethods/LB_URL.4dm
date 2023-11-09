
var $PTR : Pointer
var $LISTBOX : Text
var $col; $row; $pos : Integer
var $voSite : Object
var $ID : Integer

Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		$LISTBOX:=OBJECT Get name:C1087(Object current:K67:2)
		LISTBOX GET CELL POSITION:C971(*; $LISTBOX; $col; $row)
		
		If ($row>0)
			
			$pos:=$row-1
			
			$voSite:=Form:C1466.siteList[$pos]
			$ID:=$voSite.ID
			
			//"$ID" を一時保管
			4DC_KEEP("[sites]ID"; ->$ID)
			
			//通信実施
			4DC_COM_Add("DEMO_Show_Detail")
			
			
		End if 
		
End case 
