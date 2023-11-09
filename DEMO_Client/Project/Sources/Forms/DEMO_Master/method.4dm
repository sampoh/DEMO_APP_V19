
var $LISTBOX : Text

$LISTBOX:="LB_SITE_TYPE"

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.siteTypePos:=-1
		Form:C1466.siteType:=New collection:C1472
		
		//通信処理
		4DC_COM_Add("DEMO_Load_SiteType")
		
	: (Form event code:C388=On Timer:K2:25)
		
		LISTBOX SELECT ROW:C912(*; $LISTBOX; Form:C1466.siteTypePos; lk replace selection:K53:1)
		SET TIMER:C645(0)
		
		4DC_COM_Add("DEMO_Save_SiteType")
		
End case 
