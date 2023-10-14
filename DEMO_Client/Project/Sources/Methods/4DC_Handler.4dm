//%attributes = {"shared":true}

var $0; $voInput : Object
var $1; $methodClient : Text
var $2; $action : Text
var $3; $voOutput : Object
var $4; $TIPS : Object

var $errMethod : Text
var $FLG_ErrHandle : Boolean

$methodClient:=$1
$action:=$2
$voOutput:=$3
$TIPS:=$4

$errMethod:=Method called on error:C704

//上位 "ON ERR CALL" があればここではエラーハンドリングしない
$FLG_ErrHandle:=False:C215
If ($errMethod#"")
	$FLG_ErrHandle:=Not:C34(4DC_IsMethod($errMethod))
End if 

If ($FLG_ErrHandle)
	ON ERR CALL:C155("4DC_HandlerOnErr")
End if 

$voInput:=New object:C1471
EXECUTE METHOD:C1007($methodClient; $voInput; $action; $voOutput; $TIPS)

If ($FLG_ErrHandle)
	ON ERR CALL:C155($errMethod)
End if 

$0:=$voInput
