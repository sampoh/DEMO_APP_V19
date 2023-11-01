//%attributes = {}

DEMO_Compiler_Err

ON ERR CALL:C155("DEMO_ErrMethod")

var $1; $winRef : Integer

var $PATH_4DZ : Text
var $BASE_URL; $URL_BIN : Text
var $voOpt : Object
var $docRef : Time
var $ReceiveBLOB : Blob
var $i; $sizeI : Integer
var $percentile : Integer
var $IN : Object

$winRef:=$1

$PATH_4DZ:=Temporary folder:C486+Generate UUID:C1066+"_temp.4DZ"

CALL FORM:C1391($winRef; "DEMO_Client_DownloadWeb_Step"; "path"; New object:C1471("path"; $PATH_4DZ))

$voOpt:=4DC_COM_Get_Option

$BASE_URL:=$voOpt.url

If ($BASE_URL#"@/")
	$BASE_URL:=$BASE_URL+"/"
End if 

$BASE_URL:=$BASE_URL+"client_binary/"

CALL FORM:C1391($winRef; "DEMO_Client_DownloadWeb_Step"; "progress"; New object:C1471("progress"; 0))

$docRef:=Create document:C266($PATH_4DZ)

$sizeI:=Storage:C1525.version.json.files.length-1
For ($i; 0; $sizeI)
	
	CLEAR VARIABLE:C89($ReceiveBLOB)
	
	$URL_BIN:=$BASE_URL+Storage:C1525.version.json.files[$i]
	
	$httpCode:=HTTP_Get_Blob($URL_BIN; ->$ReceiveBLOB)
	
	If (($httpCode>=200) & ($httpCode<300))
		//OK
		SEND PACKET:C103($docRef; $ReceiveBLOB)
		$percentile:=100*(($i+1)/Storage:C1525.version.json.files.length)
		CALL FORM:C1391($winRef; "DEMO_Client_DownloadWeb_Step"; "progress"; New object:C1471("progress"; $percentile))
	Else 
		//NG
		voError.errCode:=-1
	End if 
	
	If (voError.errCode#0)
		$i:=$sizeI+1
	End if 
	
End for 

CLOSE DOCUMENT:C267($docRef)

If (voError.errCode=0)
	CALL FORM:C1391($winRef; "DEMO_Client_DownloadWeb_Step"; "complete")
Else 
	CALL FORM:C1391($winRef; "DEMO_Client_DownloadWeb_Step"; "failed")
End if 

ON ERR CALL:C155("")
