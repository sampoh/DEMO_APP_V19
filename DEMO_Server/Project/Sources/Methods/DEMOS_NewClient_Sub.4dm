//%attributes = {}
//新規 4DZ ファイルに差し替え

var vlErrCode : Integer

vlErrCode:=0

ON ERR CALL:C155("DEMOS_NewClient_OnErr")

var $1; $version : Object

var $ACCEPT : Boolean
var $ref; $filename; $CRLF : Text
var $PATH_JSON : Text
var $PATH_ROBOTS; $ROBOTS : Text
var $PATH_FROM; $PATH_TO : Text

$version:=$1

$CRLF:=Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)

$ref:=Select document:C905(""; "4dz"; "4DZファイルを選択してください。"; 0)

$ACCEPT:=(\
(OK=1) & \
(Test path name:C476(Document)=Is a document:K24:1) & \
(vlErrCode=0))

If ($ACCEPT)
	
	$PATH_FROM:=Document
	
	If ($version.onWeb)
		//WebFolderに保管
		$ACCEPT:=DEMOS_NewClient_Block($PATH_FROM; ->$version)
		
	Else 
		
		//セキュリティを考慮し4DZファイルはリソースフォルダへ保管
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
	
End if 

If ($ACCEPT)
	
	//バージョンチェック用JSONはWEBフォルダへ
	$PATH_JSON:=Get 4D folder:C485(HTML Root folder:K5:20)
	$PATH_JSON:=$PATH_JSON+"client_binary"+Folder separator:K24:12+"info.json"
	TEXT TO DOCUMENT:C1237($PATH_JSON; JSON Stringify:C1217($version); "UTF-8")
	
	//"robots.txt" を設置しクローリングを回避
	$ROBOTS:="User-agent: *"+$CRLF+"Disallow: /"+$CRLF
	$PATH_ROBOTS:=Get 4D folder:C485(HTML Root folder:K5:20)
	$PATH_ROBOTS:=$PATH_ROBOTS+"client_binary"+Folder separator:K24:12+"robots.txt"
	TEXT TO DOCUMENT:C1237($PATH_ROBOTS; $ROBOTS; "UTF-8")
	
	ALERT:C41("クライアントを更新しました。")
	
End if 

ON ERR CALL:C155("")
