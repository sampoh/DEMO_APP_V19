//%attributes = {}

var $0; $voOUT : Object
var $1; $voIN : Object
var $2; $session : Object

var $siteTypeSel : Object

$voIN:=$1
$session:=$2

//"[pullDown]" テーブルを全件取得
$siteTypeSel:=ds:C1482.pullDown.query("target = :1"; "site_type")

//ソートしつつコレクションを返却
$voOUT:=New object:C1471
$voOUT.siteType:=$siteTypeSel.orderBy("order asc").toCollection()

$0:=$voOUT

