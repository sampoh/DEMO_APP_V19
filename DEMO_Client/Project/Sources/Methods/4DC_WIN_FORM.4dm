//%attributes = {"folder":"汎用","lang":"en"}
//< フォームを元にしたウインドウ生成 >

//第1引数 ( 必須 ) : プロジェクトフォーム名 【 テキスト型 】
//第2引数 ( 任意 ) : ウィンドウタイトル 【 テキスト型 】
//第3引数 ( 任意 ) : ウィンドウタイプ 【 倍長整数型 】 ( 未指定時は "Plain window" 定数 )
//第4引数 ( 任意 ) : 既存ウインドウにフォームだけロードする場合は True 【 ブール型 】 ( デフォルト False )
//第5引数 ( 任意 ) : ウインドウの位置を記憶する場合は True 【 ブール型 】 ( デフォルト False )
//戻り値 : 正常に実行できた場合は True を返却 【 ブール型 】

//※ この処理はコンポーネント化不可。

var $0; $execute : Boolean
var $1; $FORM : Text
var $2; $TITLE : Text
var $3; $WIN_TYPE : Integer
var $4; $ON_CURRENT_WIN : Boolean
var $5; $KEEP_POSITION : Boolean

var $fWidth; $fHeight : Integer
var $scWidth; $scHeight : Integer
var $LEFT; $TOP; $RIGHT; $BOTTOM : Integer
var $winRef : Integer

$execute:=(Count parameters:C259>=1)

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
	If (Count parameters:C259>=4)
		$ON_CURRENT_WIN:=$4
	Else 
		$ON_CURRENT_WIN:=False:C215
	End if 
	If (Count parameters:C259>=5)
		$KEEP_POSITION:=$5
	Else 
		$KEEP_POSITION:=False:C215
	End if 
End if 

If ($execute)
	
	FORM GET PROPERTIES:C674($FORM; $fWidth; $fHeight)
	
	$scWidth:=Screen width:C187(*)
	$scHeight:=Screen height:C188(*)
	
	$LEFT:=($scWidth-$fWidth)/2
	$TOP:=(($scHeight-$fHeight)/2)-10
	$RIGHT:=$LEFT+$fWidth
	$BOTTOM:=$TOP+$fHeight
	
	If ($KEEP_POSITION)
		$winRef:=Open form window:C675($FORM; $WIN_TYPE; $LEFT; $TOP; *)
	Else 
		$winRef:=Open form window:C675($FORM; $WIN_TYPE; $LEFT; $TOP)
	End if 
	
	SET WINDOW TITLE:C213($TITLE; $winRef)
	
	If ($ON_CURRENT_WIN)
		DIALOG:C40($FORM; *)
	Else 
		DIALOG:C40($FORM)
		CLOSE WINDOW:C154($winRef)
	End if 
	
End if 

$0:=$execute