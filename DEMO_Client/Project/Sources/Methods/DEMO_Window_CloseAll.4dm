//%attributes = {}

var $1; $col : Collection

var $ONE : Object
var $i; $sizeI : Integer

ARRAY LONGINT:C221($alRef; 0)
ARRAY LONGINT:C221($alWinP; 0)

var $process : Integer
var $TARGET; $pName : Text
var $pState; $pTime : Integer

$col:=$1.copy()

If ($col.length>0)
	
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
	
End if 

//以下マルチウインドウをまとめて閉じる処理
$TARGET:=DEMO_Menu_Win_Multi_Name  //マルチウインドウ時のプロセス名 ( prefix )

CLEAR VARIABLE:C89($alRef)
CLEAR VARIABLE:C89($alWinP)
WINDOW LIST:C442($alRef; *)
$sizeI:=Size of array:C274($alRef)
For ($i; 1; $sizeI)
	$process:=Window process:C446($alRef{$i})
	$pName:=""
	PROCESS PROPERTIES:C336($process; $pName; $pState; $pTime)
	If ($pName=($TARGET+"_@"))
		CALL FORM:C1391($alRef{$i}; "DEMO_Window_Close")
	End if 
End for 
