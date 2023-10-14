//%attributes = {}
//< 雛型とするためプレフィックスを変更 >

//※1 絶対にgithubには反映しないでください。
//※2 プロジェクトおよび4DDのファイル名は手動で変更してください。

var $prefix : Object

$prefix:=New object:C1471
$prefix.client:=New object:C1471
$prefix.client.old:="DEMO"  //旧接頭文字 ( クライアント )
$prefix.client.new:="XXXX"  //新接頭文字 ( クライアント )
$prefix.server:=New object:C1471
$prefix.server.old:="DEMOS"  //旧接頭文字 ( サーバ )
$prefix.server.new:="XXXXS"  //新接頭文字 ( サーバ )

var $isTest : Boolean
var $i; $k; $sizeI; $sizeK : Integer
var $ROOT; $DIR; $PATH; $JSON; $CODE; $FROM; $TO : Text
var $batch; $PATH_BATCH : Text
var $STDIN; $STDOUT; $STDERR : Text

ARRAY TEXT:C222($atPath; 0)
ARRAY TEXT:C222($atDir; 0)

$isTest:=False:C215

//エクスプローラ上のフォルダ変更
$PATH:=Get 4D folder:C485(Database folder:K5:14)+"Project\\Sources\\folders.json"
$JSON:=Document to text:C1236($PATH; "UTF-8")
$JSON:=Replace string:C233($JSON; $prefix.client.old; $prefix.client.new)
If (Not:C34($isTest))
	TEXT TO DOCUMENT:C1237($PATH; $JSON; "UTF-8")
End if 

//プロジェクトメソッド名およびソース変更
$DIR:=Get 4D folder:C485(Database folder:K5:14)+"Project\\Sources\\Methods\\"
DOCUMENT LIST:C474($DIR; $atPath)
$sizeI:=Size of array:C274($atPath)
For ($i; 1; $sizeI)
	
	$FROM:=$atPath{$i}
	
	If (Not:C34($isTest))
		$CODE:=Document to text:C1236($DIR+$FROM; "UTF-8")
		$CODE:=Replace string:C233($CODE; $prefix.client.old+"_"; $prefix.client.new+"_")
		$CODE:=Replace string:C233($CODE; $prefix.server.old+"_"; $prefix.server.new+"_")
		If ($FROM=($prefix.client.old+"_Version.4dm"))
			$CODE:=Replace string:C233($CODE; $prefix.client.old; $prefix.client.new)
		End if 
		TEXT TO DOCUMENT:C1237($DIR+$FROM; $CODE; "UTF-8")
	End if 
	
	If ($FROM=($prefix.client.old+"@"))
		$TO:=Replace string:C233($FROM; $prefix.client.old+"_"; $prefix.client.new+"_")
		If (Not:C34($isTest))
			MOVE DOCUMENT:C540($DIR+$FROM; $DIR+$TO)
		End if 
	End if 
	
End for 

//データベースメソッドのソース変更
$DIR:=Get 4D folder:C485(Database folder:K5:14)+"Project\\Sources\\DatabaseMethods\\"
DOCUMENT LIST:C474($DIR; $atPath)
$sizeI:=Size of array:C274($atPath)
For ($i; 1; $sizeI)
	$CODE:=Document to text:C1236($DIR+$atPath{$i}; "UTF-8")
	$CODE:=Replace string:C233($CODE; $prefix.client.old+"_"; $prefix.client.new+"_")
	$CODE:=Replace string:C233($CODE; $prefix.server.old+"_"; $prefix.server.new+"_")
	If (Not:C34($isTest))
		TEXT TO DOCUMENT:C1237($DIR+$atPath{$i}; $CODE; "UTF-8")
	End if 
End for 

$ROOT:=Get 4D folder:C485(Database folder:K5:14)+"Project\\Sources\\Forms\\"
FOLDER LIST:C473($ROOT; $atDir)
$sizeI:=Size of array:C274($atDir)
For ($i; 1; $sizeI)
	
	$DIR:=$ROOT+$atDir{$i}+"\\"
	
	//フォームメソッド
	$PATH:=$DIR+"method.4dm"
	If (Test path name:C476($PATH)=Is a document:K24:1)
		$CODE:=Document to text:C1236($PATH; "UTF-8")
		$CODE:=Replace string:C233($CODE; $prefix.client.old+"_"; $prefix.client.new+"_")
		$CODE:=Replace string:C233($CODE; $prefix.server.old+"_"; $prefix.server.new+"_")
		If (Not:C34($isTest))
			TEXT TO DOCUMENT:C1237($PATH; $CODE; "UTF-8")
		End if 
	End if 
	
	//オブジェクトメソッド
	CLEAR VARIABLE:C89($atPath)
	If (Test path name:C476($DIR+"ObjectMethods\\")=Is a folder:K24:2)
		DOCUMENT LIST:C474($DIR+"ObjectMethods\\"; $atPath)
		$sizeK:=Size of array:C274($atPath)
		For ($k; 1; $sizeK)
			$PATH:=$DIR+"ObjectMethods\\"+$atPath{$k}
			If (Test path name:C476($PATH)=Is a document:K24:1)
				$CODE:=Document to text:C1236($PATH; "UTF-8")
				$CODE:=Replace string:C233($CODE; $prefix.client.old+"_"; $prefix.client.new+"_")
				$CODE:=Replace string:C233($CODE; $prefix.server.old+"_"; $prefix.server.new+"_")
				If (Not:C34($isTest))
					TEXT TO DOCUMENT:C1237($PATH; $CODE; "UTF-8")
				End if 
			End if 
		End for 
	End if 
	
	$FROM:=$atDir{$i}
	If ($FROM=($prefix.client.old+"@"))
		$TO:=Replace string:C233($FROM; $prefix.client.old+"_"; $prefix.client.new+"_")
		If ($batch#"")
			$batch:=$batch+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
		End if 
		$batch:=$batch+"rename \""+$ROOT+$FROM+"\" \""+$TO+"\""
	End if 
	
End for 

If (Not:C34($isTest))
	$PATH_BATCH:=Temporary folder:C486+Generate UUID:C1066+".bat"
	TEXT TO DOCUMENT:C1237($PATH_BATCH; $batch; "Windows-31J")
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
	LAUNCH EXTERNAL PROCESS:C811($PATH_BATCH; $STDIN; $STDOUT; $STDERR)
	DELETE DOCUMENT:C159($PATH_BATCH)
End if 

RELOAD PROJECT:C1739

ALERT:C41("プレフィックスを変更しました。")


