//%attributes = {}
//< 新規プロセスでウインドウ生成 >

//第1引数 ( 必須 ) : プロジェクトフォーム名 【 テキスト型 】
//第2引数 ( 任意 ) : ウィンドウタイトル 【 テキスト型 】
//第3引数 ( 任意 ) : ウィンドウタイプ 【 倍長整数型 】 ( 未指定時は "Plain window" 定数 )
//戻り値 : プロセス番号 【 倍長整数型 】 ( プロセス始動に失敗した場合は -1 )

var $0; $process : Integer
var $1; $FORM : Text
var $2; $TITLE : Text
var $3; $WIN_TYPE : Integer

var $execute : Boolean
var $pName : Text

$pName:=DEMO_Menu_Win_Multi_Name  //マルチウインドウ時のプロセス名 ( prefix )
$pName:=$pName+"_"+Uppercase:C13(Generate UUID:C1066)

$execute:=(Count parameters:C259>=2)

If ($execute)
	$FORM:=$1
	If (Count parameters:C259>=2)
		$TITLE:=$2
	End if 
	If (Count parameters:C259>=3)
		$WIN_TYPE:=$3
	Else 
		$WIN_TYPE:=Plain window:K34:13
	End if 
	$process:=New process:C317("DEMO_Menu_Win_Multi_P"; 0; $pName; $FORM; $TITLE; $WIN_TYPE)
Else 
	$process:=-1
End if 

$0:=$process
