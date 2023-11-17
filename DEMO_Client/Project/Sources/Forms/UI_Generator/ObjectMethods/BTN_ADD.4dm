
var $voField; $voTemp : Object

If (Form event code:C388=On Clicked:K2:4)
	
	If (Form:C1466.current.fields.length>0)
		
		For each ($voField; Form:C1466.current.fields)
			
			If ($voField.type#Is BLOB:K8:12)
				
				$voTemp:=OB Copy:C1225($voField)
				$voTemp.label:=$voTemp.name
				$voTemp.uuid:=Generate UUID:C1066  //削除用
				$voTemp.table:=New object:C1471
				$voTemp.table.name:=Form:C1466.current.table.name
				$voTemp.table.number:=Form:C1466.current.table.number
				
				Form:C1466.selected.push($voTemp)
				
			End if 
			
		End for each 
		
		Form:C1466.form:=UI_ReGenerate
		OBJECT SET SUBFORM:C1138(*; "Subform"; Form:C1466.form)
		
	Else 
		ALERT:C41("Select field(s).")
	End if 
	
End if 
