//%attributes = {}

var $0; $ACCEPT : Boolean
var $1; $BASE_URL : Text
var $2 : Pointer
var $voJSON : Object

var $httpCode; $CNT : Integer
var $URL; $JSON : Text
var $loop : Boolean

$BASE_URL:=$1

If ($BASE_URL#"@/")
	$BASE_URL:=$BASE_URL+"/"
End if 

$URL:=$BASE_URL+"client_binary/info.json"

$ACCEPT:=False:C215

$CNT:=0
$loop:=True:C214
While ($loop)
	$httpCode:=HTTP Get:C1157($URL; $JSON)
	If (($httpCode>=200) & ($httpCode<300))
		If ($JSON="{@}")
			//OK
			$ACCEPT:=True:C214
			$loop:=False:C215
		End if 
	End if 
	$CNT:=$CNT+1
	If ($loop)
		$loop:=($CNT<5)
	End if 
	If ($loop)
		DELAY PROCESS:C323(Current process:C322; 20)
	End if 
End while 

If ($ACCEPT)
	$voJSON:=JSON Parse:C1218($JSON)
Else 
	$voJSON:=New object:C1471
End if 

$0:=$ACCEPT

If (Count parameters:C259>=2)
	$2->:=OB Copy:C1225($voJSON)
End if 

