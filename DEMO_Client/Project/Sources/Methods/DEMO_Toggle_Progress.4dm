//%attributes = {}

var $1; $ENABLED : Boolean

If (Count parameters:C259>=1)
	$ENABLED:=$1
Else 
	$ENABLED:=True:C214
End if 

OBJECT SET VISIBLE:C603(*; "progress_bg_@"; $ENABLED)
OBJECT SET VISIBLE:C603(*; "Thermometer_@"; $ENABLED)
Thermometer:=Num:C11($ENABLED)
