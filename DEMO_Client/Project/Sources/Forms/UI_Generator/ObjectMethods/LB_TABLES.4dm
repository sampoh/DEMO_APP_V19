
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Form:C1466.current.table#Null:C1517)
			Form:C1466.formname:="Detail_"+Form:C1466.current.table.name
			Form:C1466.current.table:=OB Copy:C1225(Form:C1466.current.table)
			Form:C1466.fields:=Form:C1466.current.table.fields.copy()
		End if 
		
End case 
