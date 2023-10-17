//%attributes = {}

var $1; $col : Collection

var $ONE : Object
var $i; $sizeI : Integer

ARRAY LONGINT:C221($alRef; 0)
ARRAY LONGINT:C221($alWinP; 0)

$col:=$1.copy()

WINDOW LIST:C442($alRef; *)
$sizeI:=Size of array:C274($alRef)
For ($i; 1; $sizeI)
	APPEND TO ARRAY:C911($alWinP; Window process:C446($alRef{$i}))
End for 

For each ($ONE; $col)
	
	//同プロセスの小窓があれば先に閉じる
	For ($i; $sizeI; 1; -1)
		If (\
			($alWinP{$i}=$ONE.process) & \
			($alRef{$i}#$ONE.ref))
			CALL FORM:C1391($alRef{$i}; "DEMO_Window_Close")
		End if 
	End for 
	
	//対象の機能の窓を閉じる
	CALL FORM:C1391($ONE.ref; "DEMO_Window_Close")
	
End for each 

