//%attributes = {}

DEMO_Compiler_Err

ON ERR CALL:C155("DEMO_ErrMethod")

DEMO_Window_Append(Current process name:C1392; Current process:C322)

var $1; $FORM : Text
var $2; $TITLE : Text
var $3; $WIN_TYPE : Integer

$FORM:=$1

If (Count parameters:C259>=2)
	$TITLE:=$2
End if 
If (Count parameters:C259>=3)
	$WIN_TYPE:=$3
Else 
	$WIN_TYPE:=Plain window:K34:13
End if 

4DC_WIN_FORM($FORM; $TITLE; $WIN_TYPE)

ON ERR CALL:C155("")

KILL WORKER:C1390
