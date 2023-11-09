//%attributes = {}

var $1; $STEP : Text
var $2; $IN : Object

var $PATH_4DZ : Text

$STEP:=$1

If (Count parameters:C259>=2)
	$IN:=$2
End if 

Case of 
	: ($STEP="path")
		
		$PATH_4DZ:=$IN.path
		4DC_KEEP("PATH_4DZ"; ->$PATH_4DZ)
		
	: ($STEP="progress")
		
		Form:C1466.update.progress:=$IN.progress
		Form:C1466.update.text:=String:C10($IN.progress)+"%"
		
	: ($STEP="complete")
		
		FORM GOTO PAGE:C247(4)
		
	: ($STEP="failed")
		
		ALERT:C41("Failed to download client application.")
		
End case 
