//%attributes = {}

var $0; $UI : Object

var $OBJ; $ONE : Object
var $LABEL; $INPUT : Object
var $pos : Object

$UI:=UI_Base

$pos:=New object:C1471
$pos.count:=1
$pos.margin:=35
$pos.label:=New object:C1471
$pos.label.type:="text"
$pos.label.text:=""
$pos.label.top:=18
$pos.label.left:=23
$pos.label.height:=21
$pos.label.width:=92
$pos.label.fontFamily:="Meiryo"
$pos.label.fontSize:=14
$pos.input:=New object:C1471
$pos.input.type:="input"
$pos.input.dataSource:=""
$pos.input.top:=18
$pos.input.left:=133
$pos.input.height:=22
$pos.input.width:=294
$pos.input.fontFamily:="Meiryo"
$pos.input.fontSize:=14

$OBJ:=New object:C1471
$OBJ.objects:=New object:C1471
For each ($ONE; Form:C1466.selected)
	
	//Label
	If ($ONE.type#Is boolean:K8:9)
		$LABEL:=OB Copy:C1225($pos.label)
		$LABEL.top:=$LABEL.top+(($pos.count-1)*$pos.margin)
		$LABEL.text:=$ONE.label
		$OBJ.objects["LABEL_"+String:C10($pos.count; "000")]:=OB Copy:C1225($LABEL)
	End if 
	
	//Input
	Case of 
		: (\
			($ONE.type=Is longint:K8:6) | ($ONE.type=Is integer:K8:5) | ($ONE.type=Is integer 64 bits:K8:25) | \
			($ONE.type=Is real:K8:4) | \
			($ONE.type=Is date:K8:7) | \
			($ONE.type=Is time:K8:8) | \
			($ONE.type=Is object:K8:27) | \
			($ONE.type=Is picture:K8:10) | \
			($ONE.type=Is text:K8:3) | ($ONE.type=Is alpha field:K8:1))
			
			$INPUT:=OB Copy:C1225($pos.input)
			$INPUT.top:=$INPUT.top+(($pos.count-1)*$pos.margin)
			$INPUT.dataSource:="Form:C1466."+$ONE.table.name+"."+$ONE.name
			
			Case of 
				: (($ONE.type=Is longint:K8:6) | ($ONE.type=Is integer:K8:5) | ($ONE.type=Is integer 64 bits:K8:25))
					$INPUT.dataSourceTypeHint:="integer"
					$INPUT.width:=150
				: ($ONE.type=Is real:K8:4)
					$INPUT.dataSourceTypeHint:="number"
					$INPUT.width:=150
				: ($ONE.type=Is date:K8:7)
					$INPUT.dataSourceTypeHint:="date"
					$INPUT.dateFormat:="short"
					$INPUT.width:=100
				: ($ONE.type=Is time:K8:8)
					$INPUT.dataSourceTypeHint:="time"
					$INPUT.timeFormat:="hh_mm_ss"
					$INPUT.width:=100
				: ($ONE.type=Is object:K8:27)
					$INPUT.dataSourceTypeHint:="object"
				: ($ONE.type=Is picture:K8:10)
					$INPUT.dataSourceTypeHint:="picture"
			End case 
			
			$OBJ.objects["INPUT_"+String:C10($pos.count; "000")]:=OB Copy:C1225($INPUT)
			
		: ($ONE.type=Is boolean:K8:9)
			
			$INPUT:=OB Copy:C1225($pos.input)
			$INPUT.top:=$INPUT.top+(($pos.count-1)*$pos.margin)
			$INPUT.dataSource:="Form:C1466."+$ONE.table.name+"."+$ONE.name
			$INPUT.type:="checkbox"
			$INPUT.height:=21
			$INPUT.text:=$ONE.label
			
			$OBJ.objects["CHECK_"+String:C10($pos.count; "000")]:=OB Copy:C1225($INPUT)
			
	End case 
	
	$pos.count:=$pos.count+1
	
End for each 

$UI.pages.push($OBJ)

$0:=$UI
