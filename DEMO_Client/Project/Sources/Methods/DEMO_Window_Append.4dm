//%attributes = {}

var $1; $name : Text
var $2; $process : Integer

$name:=$1
$process:=$2

Use (Storage:C1525.window)
	Storage:C1525.window.data.push(New shared object:C1526(\
		"name"; $name; \
		"process"; $process))
End use 
