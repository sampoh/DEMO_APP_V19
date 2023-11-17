
var $voRes : Object

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		SET MENU BAR:C67(1)  //コピペ許可
		
		Form:C1466.current:=New object:C1471
		
		$voRes:=4DC_COM_Dev
		
		Form:C1466.tables:=$voRes.tableCast.tables.copy()
		
		Form:C1466.form:=UI_Base
		OBJECT SET SUBFORM:C1138(*; "Subform"; Form:C1466.form)
		
		Form:C1466.selectedFelds:=New collection:C1472
		
		Form:C1466.selected:=New collection:C1472
		Form:C1466.selectedOfSelected:=New collection:C1472
		
End case 
