//%attributes = {}
//分指定で待機

//※ "Tickcount" は不意にリセットされることがあるので日時で実装

var $1; $min : Integer

var $now; $limit : Text

$min:=$1

$now:=4DC_Calc_DateTimeSec
$limit:=4DC_Calc_DateTimeSec($now; 0; 0; 0; 0; $min; 0)

While ((Storage:C1525.version.worker) & ($now<$limit))
	If (Storage:C1525.version.worker)
		DELAY PROCESS:C323(Current process:C322; 60)
	End if 
	If (Storage:C1525.version.worker)
		DELAY PROCESS:C323(Current process:C322; 60)
	End if 
	If (Storage:C1525.version.worker)
		DELAY PROCESS:C323(Current process:C322; 60)
	End if 
	If (Storage:C1525.version.worker)
		DELAY PROCESS:C323(Current process:C322; 60)
	End if 
	If (Storage:C1525.version.worker)
		DELAY PROCESS:C323(Current process:C322; 60)
	End if 
	$now:=4DC_Calc_DateTimeSec
End while 
