//%attributes = {}

var $0; $voOUT : Object
var $1; $voIN : Object

var $PATH : Text

$voIN:=$1

$PATH:=DEMOS_NewClient_Path

$voOUT:=New object:C1471
$voOUT.files:=New collection:C1472
$voOUT.files.push($PATH)

$0:=$voOUT
