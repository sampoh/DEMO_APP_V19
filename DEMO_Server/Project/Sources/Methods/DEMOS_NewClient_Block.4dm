//%attributes = {}
//ブロック分割してWebFolderに配置

var $0; $ACCEPT : Boolean
var $1; $PATH_IN : Text
var $2 : Pointer
var $version : Object

var $docRef; $tempRef : Time
var $ReceiveBLOB : Blob
var $COUNTER : Integer
var $DIR_BIN; $filename : Text

$ACCEPT:=False:C215
$DIR_BIN:=Get 4D folder:C485(HTML Root folder:K5:20)+"client_binary"+Folder separator:K24:12

If (Test path name:C476($DIR_BIN)#Is a folder:K24:2)
	CREATE FOLDER:C475($DIR_BIN)
End if 

$PATH_IN:=$1
$version:=OB Copy:C1225($2->)

$version.files:=New collection:C1472

$docRef:=Open document:C264($PATH_IN; Read mode:K24:5)

If (OK=1)
	
	$COUNTER:=0
	
	SET DOCUMENT POSITION:C482($docRef; 0)
	
	Repeat 
		
		CLEAR VARIABLE:C89($ReceiveBLOB)
		RECEIVE PACKET:C104($docRef; $ReceiveBLOB; $version.blockSize)
		$BlobSize:=BLOB size:C605($ReceiveBLOB)
		
		If ($BlobSize>0)
			$COUNTER:=$COUNTER+1
			$filename:="file_"+String:C10($COUNTER; "000")+".dat"
			$version.files.push($filename)
			$tempRef:=Create document:C266($DIR_BIN+$filename)
			SEND PACKET:C103($tempRef; $ReceiveBLOB)
			CLOSE DOCUMENT:C267($tempRef)
		End if 
		
	Until ($BlobSize=0)
	
	CLOSE DOCUMENT:C267($docRef)
	
	$ACCEPT:=(vlErrCode=0)
	
End if 

$0:=$ACCEPT
$2->:=OB Copy:C1225($version)
