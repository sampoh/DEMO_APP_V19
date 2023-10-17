//%attributes = {}

var $0; $FLG_FOUND : Boolean
var $1; $inputName : Text
var $2 : Pointer
var $process : Integer

var $col : Collection
var $ONE; $voTARGET : Object
var $pState; $pTime : Integer
var $pName : Text
var $index : Integer

$inputName:=$1

$col:=Storage:C1525.window.data.copy()

$FLG_FOUND:=False:C215
For each ($ONE; $col)
	If ($ONE.name=$inputName)
		$FLG_FOUND:=True:C214
		$voTARGET:=OB Copy:C1225($ONE)
	End if 
End for each 

If ($FLG_FOUND)
	
	
	PROCESS PROPERTIES:C336($voTARGET.process; $pName; $pState; $pTime)
	
	$FLG_FOUND:=(\
		($pName=$inputName) & \
		($pState>=Executing:K13:4))
	
	If (Not:C34($FLG_FOUND))
		Use (Storage:C1525.window)
			$col:=Storage:C1525.window.data.copy()
			$index:=$col.findIndex("Col_FindName"; $inputName)
			$col:=$col.remove($index)
			Storage:C1525.window.data:=$col.copy(ck shared:K85:29; Storage:C1525.window)
		End use 
	End if 
	
End if 

$0:=$FLG_FOUND

If ($FLG_FOUND)
	If (Count parameters:C259>=2)
		$2->:=$voTARGET.process
	End if 
End if 

