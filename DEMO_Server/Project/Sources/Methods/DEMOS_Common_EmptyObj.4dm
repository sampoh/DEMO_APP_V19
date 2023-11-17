//%attributes = {}
//< 初期値オブジェクトを返却 >

//第1引数 ( 必須 ) : テーブルポインタ 【 ポインタ型 】
//戻り値 : オブジェクト 【 オブジェクト型 】

var $0; $OBJ : Object
var $1; $vpTable : Pointer

var $vlTable : Integer
var $i; $sizeI; $TYPE : Integer
var $ACCEPT : Boolean
var $vpField : Pointer
var $name : Text

$vpTable:=$1

$vlTable:=Table:C252($vpTable)

$OBJ:=New object:C1471

$sizeI:=Get last field number:C255($vpTable)
For ($i; 1; $sizeI)
	$ACCEPT:=Is field number valid:C1000($vlTable; $i)
	If ($ACCEPT)
		$vpField:=Field:C253($vlTable; $i)
		$TYPE:=Type:C295($vpField->)
		$ACCEPT:=(\
			($TYPE#Is picture:K8:10) & \
			($TYPE#Is BLOB:K8:12))
	End if 
	If ($ACCEPT)
		$name:=Field name:C257($vpField)
		Case of 
			: (\
				($TYPE=Is integer:K8:5) | \
				($TYPE=Is longint:K8:6) | \
				($TYPE=Is integer 64 bits:K8:25) | \
				($TYPE=Is real:K8:4))
				$OBJ[$name]:=0
			: (($TYPE=Is alpha field:K8:1) | ($TYPE=Is text:K8:3))
				$OBJ[$name]:=""
			: ($TYPE=Is boolean:K8:9)
				$OBJ[$name]:=False:C215
			: ($TYPE=Is date:K8:7)
				$OBJ[$name]:=!00-00-00!
			: ($TYPE=Is time:K8:8)
				$OBJ[$name]:=?00:00:00?
			: ($TYPE=Is object:K8:27)
				$OBJ[$name]:=New object:C1471
		End case 
	End if 
End for 

$0:=OB Copy:C1225($OBJ)
