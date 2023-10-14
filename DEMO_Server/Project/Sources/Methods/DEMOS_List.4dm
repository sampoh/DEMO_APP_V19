//%attributes = {"shared":true}

var $0; $voOUT : Object
var $1; $voIN : Object
var $2; $session : Object

var $sitesSel : Object

$voIN:=$1
$session:=$2

//"[sites]" テーブルを全件取得
$sitesSel:=ds:C1482.sites.all()

//"title" フィールドの昇順でソート
$sitesSel.orderBy("title asc")

//テーブル名でコレクションを返却
$voOUT:=New object:C1471
$voOUT[Table name:C256(->[sites:5])]:=$sitesSel.toCollection()

$0:=$voOUT

