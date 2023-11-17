
var $ACCEPT : Boolean
var $JSON : Text
var $selected : Collection

$ACCEPT:=(Form event code:C388=On Clicked:K2:4)

If ($ACCEPT)
	$ACCEPT:=(Form:C1466.selected.length>0)
	If (Not:C34($ACCEPT))
		ALERT:C41("Select field(s).")
	End if 
End if 

If ($ACCEPT)
	
	$JSON:=JSON Stringify:C1217(Form:C1466.form)
	$selected:=Form:C1466.selected.copy()
	4DC_KEEP("form"; ->$JSON)
	4DC_KEEP("selected"; ->$selected)
	
	$FORM:="UI_Save"
	$TITLE:="UI Save"
	4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13+Form has no menu bar:K39:18)
	
End if 
