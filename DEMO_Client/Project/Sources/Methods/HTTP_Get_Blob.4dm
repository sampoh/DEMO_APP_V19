//%attributes = {}

var $0; $httpCode : Integer
var $1; $URL : Text
var $2 : Pointer
var $BLOB : Blob

var $loop : Boolean
var $cnt; $limit : Integer

$URL:=$1

$loop:=True:C214
$cnt:=0
$limit:=5

While ($loop)
	
	$cnt:=$cnt+1
	CLEAR VARIABLE:C89($BLOB)
	
	$httpCode:=HTTP Get:C1157($URL; $BLOB)
	
	If (($httpCode>=200) & ($httpCode<300))
		//OK
		$loop:=False:C215
	Else 
		//NG
		If ($cnt<$limit)
			DELAY PROCESS:C323(Current process:C322; 30)
		Else 
			$loop:=False:C215
		End if 
	End if 
	
End while 

$0:=$httpCode
$2->:=$BLOB
