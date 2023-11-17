
var $ONE : Object
var $colUuid : Collection
var $iCol : Collection
var $colNew : Collection
var $index : Integer

If (Form event code:C388=On Clicked:K2:4)
	
	If (Form:C1466.selectedOfSelected.length>0)
		
		$colUuid:=New collection:C1472
		For each ($ONE; Form:C1466.selectedOfSelected)
			$colUuid.push($ONE.uuid)
		End for each 
		
		$iCol:=Form:C1466.selected.indices("not ( uuid in :1 )"; $colUuid)
		
		$colNew:=New collection:C1472
		For each ($index; $iCol)
			$colNew.push(Form:C1466.selected[$index])
		End for each 
		Form:C1466.selected:=$colNew.copy()
		
		Form:C1466.form:=UI_ReGenerate
		OBJECT SET SUBFORM:C1138(*; "Subform"; Form:C1466.form)
		
	End if 
	
End if 
