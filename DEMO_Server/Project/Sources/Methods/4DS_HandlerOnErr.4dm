//%attributes = {}

If (Error=0)
	vlErrCode:=-1
Else 
	vlErrCode:=Error
End if 

var $errMethod; $dateTime : Text
var $i; $sizeI : Integer

ARRAY LONGINT:C221($alErrCodes; 0)
ARRAY TEXT:C222($atErrComp; 0)
ARRAY TEXT:C222($atErrText; 0)

$dateTime:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)

$errMethod:=Error method+" 行番号"+String:C10(Error line)

GET LAST ERROR STACK:C1015($alErrCodes; $atErrComp; $atErrText)

$sizeI:=Size of array:C274($alErrCodes)
For ($i; 1; $sizeI)
	4DS_LOGGING_OnErr\
		($errMethod; $alErrCodes{$i}; $atErrComp{$i}; $atErrText{$i}; $dateTime)
End for 

