
var $voField : Object

Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		If (Form:C1466.current.field#Null:C1517)
			
			$voField:=OB Copy:C1225(Form:C1466.current.field)
			
			If ($voField.type#Is BLOB:K8:12)
				
				$voField.label:=$voField.name
				$voField.uuid:=Generate UUID:C1066  //削除用
				$voField.table:=New object:C1471
				$voField.table.name:=Form:C1466.current.table.name
				$voField.table.number:=Form:C1466.current.table.number
				
				Form:C1466.selected.push($voField)
				
				Form:C1466.form:=UI_ReGenerate
				OBJECT SET SUBFORM:C1138(*; "Subform"; Form:C1466.form)
				
			End if 
			
		End if 
		
End case 
