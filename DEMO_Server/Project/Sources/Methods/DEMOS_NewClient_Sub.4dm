//%attributes = {}
//新規 4DZ ファイルに差し替え

var vlErrCode : Integer

vlErrCode:=0

ON ERR CALL:C155("DEMOS_NewClient_OnErr")

var $1; $version : Object

var $ACCEPT : Boolean
var $ref; $filename : Text
var $PATH_JSON : Text
var $PATH_FROM; $PATH_TO : Text

$version:=$1

$ref:=Select document:C905(""; "4dz"; "4DZファイルを選択してください。"; 0)

$ACCEPT:=(\
(OK=1) & \
(Test path name:C476(Document)=Is a document:K24:1) & \
(vlErrCode=0))

If ($ACCEPT)
	
	$PATH_FROM:=Document
	
	//4DZファイルはセキュリティを考慮しリソースフォルダへ保管
	$PATH_TO:=DEMOS_NewClient_Path
	
	If (Test path name:C476($PATH_TO)=Is a document:K24:1)
		DELETE DOCUMENT:C159($PATH_TO)
	End if 
	
	COPY DOCUMENT:C541($PATH_FROM; $PATH_TO)
	
	$ACCEPT:=(\
		(OK=1) & \
		(Test path name:C476($PATH_TO)=Is a document:K24:1) & \
		(vlErrCode=0))
	
End if 

If ($ACCEPT)
	
	//バージョンチェック用JSONはWEBフォルダへ
	$PATH_JSON:=Get 4D folder:C485(HTML Root folder:K5:20)
	$PATH_JSON:=$PATH_JSON+"client_binary\\info.json"
	
	TEXT TO DOCUMENT:C1237($PATH_JSON; JSON Stringify:C1217($version); "UTF-8")
	
	ALERT:C41("クライアントを更新しました。")
	
End if 

ON ERR CALL:C155("")
