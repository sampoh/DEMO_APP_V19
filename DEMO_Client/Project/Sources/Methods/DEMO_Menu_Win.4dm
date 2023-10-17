//%attributes = {}

//< 新規プロセスでウインドウ生成 >

//第1引数 ( 必須 ) : プロジェクトフォーム名 【 テキスト型 】
//第2引数 ( 任意 ) : ウィンドウタイトル 【 テキスト型 】
//第3引数 ( 任意 ) : ウィンドウタイプ 【 倍長整数型 】 ( 未指定時は "Plain window" 定数 )
//戻り値 : プロセス番号 【 倍長整数型 】 ( プロセス始動に失敗した場合は -1 )

var $0; $process : Integer
var $1; $name : Text
var $2; $FORM : Text
var $3; $TITLE : Text
var $4; $WIN_TYPE : Integer

var $execute : Boolean

$execute:=(Count parameters:C259>=2)

If ($execute)
	$name:=$1
	If ($name="")
		$name:="DEMO_Menu_Win_P"
	End if 
	$FORM:=$2
	If (Count parameters:C259>=3)
		$TITLE:=$3
	End if 
	If (Count parameters:C259>=4)
		$WIN_TYPE:=$4
	Else 
		$WIN_TYPE:=Plain window:K34:13
	End if 
	$process:=New process:C317("DEMO_Menu_Win_P"; 0; $name; $FORM; $TITLE; $WIN_TYPE)
Else 
	$process:=-1
End if 

$0:=$process
