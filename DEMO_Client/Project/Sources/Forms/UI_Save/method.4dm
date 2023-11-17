
var $JSON; $PATH : Text
var $selected : Collection
var $voFolders : Object
var $colFolders : Collection
var $name : Text
var $voTEMP : Object

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		4DC_KEEP_Get("form"; ->$JSON)
		4DC_KEEP_Get("selected"; ->$selected)
		
		Form:C1466.json:=$JSON
		Form:C1466.selected:=$selected.copy()
		
		Form:C1466.method:=New object:C1471
		Form:C1466.method.generate:=True:C214
		Form:C1466.method.name:=New object:C1471
		Form:C1466.method.name.prefix:="DEMO"
		Form:C1466.method.name.common:=Form:C1466.selected[0].table.name
		Form:C1466.method.name.show:=Form:C1466.method.name.prefix+"_Show_"+Form:C1466.method.name.common
		Form:C1466.method.name.save:=Form:C1466.method.name.prefix+"_Save_"+Form:C1466.method.name.common
		
		Form:C1466.formname:=""
		
		Form:C1466.system:=New object:C1471
		Form:C1466.system.formDir:=Get 4D folder:C485(Database folder:K5:14)+"Project\\Sources\\Forms\\"
		Form:C1466.system.folderPath:=Get 4D folder:C485(Database folder:K5:14)+"Project\\Sources\\folders.json"
		$voFolders:=JSON Parse:C1218(Document to text:C1236(Form:C1466.system.folderPath; "UTF-8"))
		Form:C1466.system.obj:=OB Copy:C1225($voFolders)
		
		$colFolders:=New collection:C1472
		For each ($name; $voFolders)
			$voTEMP:=New object:C1471
			If ($name#"trash")
				$voTEMP.name:=$name
				If ($voFolders[$name].groups#Null:C1517)
					$voTEMP.groups:=$voFolders[$name].groups.copy()
					$voTEMP.groupsStyled:=$voFolders[$name].groups.join(", ")
				End if 
				$colFolders.push($voTEMP)
			End if 
		End for each 
		
		Form:C1466.folders:=$colFolders.copy()
		
End case 
