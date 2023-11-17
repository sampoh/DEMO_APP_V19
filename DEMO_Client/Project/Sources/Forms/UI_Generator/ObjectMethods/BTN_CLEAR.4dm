
If (Form event code:C388=On Clicked:K2:4)
	
	Form:C1466.selected:=New collection:C1472
	
	Form:C1466.form:=UI_ReGenerate
	OBJECT SET SUBFORM:C1138(*; "Subform"; Form:C1466.form)
	
End if 
