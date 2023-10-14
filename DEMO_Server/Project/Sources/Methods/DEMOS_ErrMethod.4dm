//%attributes = {}

//初期ストレージをキャスト
If (Storage:C1525.error=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.error:=New shared object:C1526
	End use 
	Use (Storage:C1525.error)
		Storage:C1525.error.errCode:=0
		Storage:C1525.error.errMethod:=""
		Storage:C1525.error.errLine:=0
		Storage:C1525.error.errStack:=New shared collection:C1527
	End use 
End if 

var $errCode; $i; $sizeI : Integer
var $col : Collection
ARRAY LONGINT:C221($alErrCodes; 0)
ARRAY TEXT:C222($atErrComp; 0)
ARRAY TEXT:C222($atErrText; 0)

If (Error=0)
	$errCode:=-1
Else 
	$errCode:=Error
End if 

GET LAST ERROR STACK:C1015($alErrCodes; $atErrComp; $atErrText)

$col:=New collection:C1472
$sizeI:=Size of array:C274($alErrCodes)
For ($i; 1; $sizeI)
	$col.push(New object:C1471(\
		"code"; $alErrCodes{$i}; \
		"comp"; $atErrComp{$i}; \
		"text"; $atErrText{$i}))
End for 

Use (Storage:C1525.error)
	Storage:C1525.error.errCode:=$errCode
	Storage:C1525.error.errMethod:=Error method
	Storage:C1525.error.errLine:=Error line
	Storage:C1525.error.errStack:=$col.copy(ck shared:K85:29; Storage:C1525.error)
End use 
