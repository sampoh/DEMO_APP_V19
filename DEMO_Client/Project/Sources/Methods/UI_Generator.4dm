//%attributes = {}
//UI半自動生成機能 ( このメソッドを実行して起動してください )

var $URL : Text
var $FORM; $TITLE : Text

$URL:="http://127.0.0.1:8000"

If (4DC($URL))
	
	$FORM:="UI_Generator"
	$TITLE:="UI Generator"
	4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13+Form has no menu bar:K39:18)
	
End if 
