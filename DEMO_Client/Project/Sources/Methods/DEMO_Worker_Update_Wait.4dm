//%attributes = {}
//分指定で待機

//※ "Tickcount" は不意にリセットされることがあるので日時で実装

var $1; $min : Integer

var $now; $limit : Object
var $nowFull : Text

$min:=$1

$now:=New object:C1471

$now.date:=New object:C1471
$now.date.full:=String:C10(Current date:C33; Internal date short:K1:7)
$now.date.year:=Num:C11(Substring:C12($now.date.full; 1; 4))
$now.date.month:=Num:C11(Substring:C12($now.date.full; 6; 2))
$now.date.day:=Num:C11(Substring:C12($now.date.full; 9; 2))

$now.time:=New object:C1471
$now.time.full:=String:C10(Current time:C178; HH MM SS:K7:1)
$now.time.hour:=Num:C11(Substring:C12($now.time.full; 1; 2))
$now.time.min:=Num:C11(Substring:C12($now.time.full; 4; 2))
$now.time.sec:=Num:C11(Substring:C12($now.time.full; 7; 2))

$now.full:=$now.date.full+" "+$now.time.full

$limit:=OB Copy:C1225($now)
$limit.time.min:=$limit.time.min+$min
While ($limit.time.min>=60)
	$limit.time.hour:=$limit.time.hour+1
	$limit.time.min:=$limit.time.min-60
End while 
While ($limit.time.hour>=24)
	$limit.date.full:=String:C10(Add to date:C393(Date:C102($limit.date.full); 0; 0; 1); Internal date short:K1:7)
	$limit.time.hour:=$limit.time.hour-24
End while 

$limit.time.full:=String:C10($limit.time.hour; "00")+":"+String:C10($limit.time.min; "00")+":"+String:C10($limit.time.sec; "00")
$limit.date.year:=Num:C11(Substring:C12($limit.date.full; 1; 4))
$limit.date.month:=Num:C11(Substring:C12($limit.date.full; 6; 2))
$limit.date.day:=Num:C11(Substring:C12($limit.date.full; 9; 2))
$limit.full:=$limit.date.full+" "+$limit.time.full

While ((Storage:C1525.version.worker) & ($now.full<$limit.full))
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
	$now.full:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)
End while 
