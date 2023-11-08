//%attributes = {}

var $1; $DIR_SMB : Text

var $DIR_4D : Text
ARRAY TEXT:C222($atFiles; 0)
var $i; $sizeI : Integer
var $FROM; $TO : Text

$DIR_SMB:=$1

If ($DIR_SMB#("@"+Folder separator:K24:12))
	$DIR_SMB:=$DIR_SMB+Folder separator:K24:12
End if 

$DIR_4D:=Get 4D folder:C485(HTML Root folder:K5:20)+"client_binary"+Folder separator:K24:12
DOCUMENT LIST:C474($DIR_4D; $atFiles)

$sizeI:=Size of array:C274($atFiles)
For ($i; 1; $sizeI)
	$FROM:=$DIR_4D+$atFiles{$i}
	$TO:=$DIR_SMB+$atFiles{$i}
	COPY DOCUMENT:C541($FROM; $TO; *)
End for 

ALERT:C41("リバースプロキシ上にもファイルを設置しました。")

