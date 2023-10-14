//%attributes = {}

var $0; $PATH_TO : Text

var $filename : Text

$filename:="DEMO_CLIENT_BINARY.4DZ"

//4DZファイルはセキュリティを考慮しリソースフォルダへ保管
$PATH_TO:=Get 4D folder:C485(Current resources folder:K5:16)
$PATH_TO:=$PATH_TO+"client_binary\\"+$filename

$0:=$PATH_TO
