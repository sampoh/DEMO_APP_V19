//%attributes = {}

var $0; $PATH_4DZ : Text

var $structureFile : Text
var $voStructureFile : Object

$structureFile:=Structure file:C489
$voStructureFile:=File:C1566($structureFile; fk platform path:K87:2)

$PATH_4DZ:=Get 4D folder:C485(Database folder:K5:14)+$voStructureFile.name+".4DZ"

$0:=$PATH_4DZ
