
var $ACCEPT : Boolean
var $DIR; $PATH : Text
var $voFolders : Object
var $name : Text

ARRAY TEXT:C222($atFolder; 0)

$ACCEPT:=(Form event code:C388=On Clicked:K2:4)

If ($ACCEPT)
	$ACCEPT:=(Form:C1466.formname#"")
	If (Not:C34($ACCEPT))
		ALERT:C41("Fill \"Form name\".")
	End if 
End if 

If ($ACCEPT)
	FOLDER LIST:C473(Form:C1466.system.formDir; $atFolder)
	$ACCEPT:=(Find in array:C230($atFolder; Form:C1466.formname)<=0)
	If (Not:C34($ACCEPT))
		$ACCEPT:=4DC_Confirm("\""+Form:C1466.formname+"\" は既に存在します。上書きしますか？")
	End if 
End if 

If ($ACCEPT)
	$DIR:=Form:C1466.system.formDir+Form:C1466.formname+"\\"
	If (Test path name:C476($DIR)#Is a folder:K24:2)
		CREATE FOLDER:C475($DIR)
	End if 
	$PATH:=$DIR+"form.4DForm"
	TEXT TO DOCUMENT:C1237($PATH; Form:C1466.json; "UTF-8")
	
	If (Form:C1466.selectedFolder#Null:C1517)
		
		$voFolders:=OB Copy:C1225(Form:C1466.system.obj)
		
		$name:=Form:C1466.selectedFolder.name
		If ($voFolders[$name].forms=Null:C1517)
			$voFolders[$name].forms:=New collection:C1472
		End if 
		$voFolders[$name].forms.push(Form:C1466.formname)
		
		TEXT TO DOCUMENT:C1237(Form:C1466.system.folderPath; JSON Stringify:C1217($voFolders); "UTF-8")
		
	End if 
	
	RELOAD PROJECT:C1739
	
	ALERT:C41("フォームをプロジェクトに追加しました。")
	
End if 
