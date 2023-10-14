//%attributes = {}
//テーブルフォームを自動生成

var $i; $sizeI : Integer

$sizeI:=Get last table number:C254
For ($i; 1; $sizeI)
	If (Is table number valid:C999($i))
		4DS_TableForm(Table:C252($i); "INPUT"; "OUTPUT"; False:C215)
	End if 
End for 

ALERT:C41("4Dを再起動してください。")

TRACE:C157

