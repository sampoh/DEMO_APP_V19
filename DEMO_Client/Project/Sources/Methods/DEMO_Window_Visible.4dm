//%attributes = {}

var $0; $visible : Boolean
var $1 : Pointer
var $colVisible : Collection

var $colCurrent; $colTemp; $colMenu : Collection

var $TEMP_A; $TEMP_B; $ONE : Object
var $pState; $pTime : Integer
var $pName : Text
var $index : Integer

var $i; $sizeI; $pos; $ref : Integer
ARRAY LONGINT:C221($alRef; 0)
ARRAY LONGINT:C221($alWinP; 0)

WINDOW LIST:C442($alRef; *)
$sizeI:=Size of array:C274($alRef)
For ($i; 1; $sizeI)
	APPEND TO ARRAY:C911($alWinP; Window process:C446($alRef{$i}))
End for 

$colTemp:=Storage:C1525.menu.data.group.copy()

//メニュー定義をロード
$colMenu:=New collection:C1472
For each ($TEMP_A; $colTemp)
	For each ($TEMP_B; $TEMP_A.list)
		$colMenu.push($TEMP_B.action)
	End for each 
End for each 

$colVisible:=New collection:C1472
$colCurrent:=Storage:C1525.window.data.copy()

For each ($ONE; $colCurrent)
	$pName:=""
	PROCESS PROPERTIES:C336($ONE.process; $pName; $pState; $pTime)
	$index:=$colMenu.indexOf($pName)
	If ($index>=0)  //メニュー定義に存在する場合
		$pos:=Find in array:C230($alWinP; $ONE.process)
		If ($pos>0)  //Window参照番号を取得
			$ref:=$alRef{$pos}
			$colVisible.push(New object:C1471(\
				"name"; $ONE.name; \
				"process"; $ONE.process; \
				"ref"; $ref))
		End if 
	End if 
End for each 

$visible:=($colVisible.length>0)

$0:=$visible

$1->:=$colVisible.copy()
