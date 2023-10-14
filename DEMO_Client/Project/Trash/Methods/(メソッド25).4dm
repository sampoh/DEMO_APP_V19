//%attributes = {}

var $structureFile : Text
var $voStructureFile : Object

var $PATH_4DZ : Text
var $TXT : Text

$structureFile:=Structure file:C489
$voStructureFile:=File:C1566($structureFile; fk platform path:K87:2)

$PATH_4DZ:=Get 4D folder:C485(Database folder:K5:14)+$voStructureFile.name+".4DZ"

$TXT:=$PATH_4DZ+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
If (Test path name:C476($PATH_4DZ)=Is a document:K24:1)
	$TXT:=$TXT+" is visible"
Else 
	$TXT:=$TXT+" is not visible"
End if 

ALERT:C41($TXT)



