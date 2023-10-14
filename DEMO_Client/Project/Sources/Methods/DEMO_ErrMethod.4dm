//%attributes = {}

var $errCode : Integer
var $errMethod : Text
var $DT; $TAB; $msg : Text

var $i; $sizeI : Integer
var $colStack : Collection
ARRAY LONGINT:C221($alErrCodes; 0)
ARRAY TEXT:C222($atErrComp; 0)
ARRAY TEXT:C222($atErrText; 0)

ARRAY TEXT:C222($atDT; 0)
ARRAY TEXT:C222($atMSG; 0)

If (Error=0)
	$errCode:=-1
Else 
	$errCode:=Error
End if 

$TAB:=Char:C90(Tab:K15:37)

$DT:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)
$errMethod:=Error method+" 行番号"+String:C10(Error line)

GET LAST ERROR STACK:C1015($alErrCodes; $atErrComp; $atErrText)

$colStack:=New collection:C1472

$sizeI:=Size of array:C274($alErrCodes)
For ($i; 1; $sizeI)
	
	$colStack.push(New object:C1471(\
		"code"; $alErrCodes{$i}; \
		"comp"; $atErrComp{$i}; \
		"text"; $atErrText{$i}))
	
	$msg:=""
	$msg:=$msg+"【 メソッド 】 \""+$errMethod+"\""+$TAB
	$msg:=$msg+"【 エラーコード 】 "+String:C10($alErrCodes{$i})+$TAB
	$msg:=$msg+"【 コンポーネントコード 】 "+$atErrComp{$i}+$TAB
	$msg:=$msg+"【 詳細 】 "+$atErrText{$i}+$TAB
	
	APPEND TO ARRAY:C911($atDT; $DT)
	APPEND TO ARRAY:C911($atMSG; $msg)
	
End for 

//最終エラーを Storage に残す ( インタープロセス )
Use (Storage:C1525.error)
	Storage:C1525.error.errCode:=$errCode
	Storage:C1525.error.errMethod:=$errMethod
	Storage:C1525.error.stack:=$colStack.copy(ck shared:K85:29; Storage:C1525.error)
	Storage:C1525.error.datetime:=$DT
End use 

//プロセス単位
voError.errCode:=$errCode
voError.errMethod:=$errMethod
voError.stack:=$colStack.copy()
voError.datetime:=$DT

4DC_LOG_Remote(->$atDT; ->$atMSG)

