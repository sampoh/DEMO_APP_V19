//%attributes = {}

var $0; $voOUT : Object
var $1; $voIN : Object
var $2; $session : Object

var $sitesEntity; $metaEntitySel : Object
var $voSites : Object
var $colMeta : Collection
var $lockUser : Object
var $pullDownSel : Object

$lockUser:=New object:C1471

$voIN:=$1

$sitesEntity:=ds:C1482.sites.query("ID = :1"; $voIN.ID).first()
$metaEntitySel:=ds:C1482.meta.query("ID_sites = :1"; $voIN.ID).orderBy("group asc")

If ($voIN.ID>0)
	DEMOS_Local_Lock(Table name:C256(->[sites:5]); String:C10($voIN.ID); ->$lockUser)  //name&value方式でロック
End if 

$voOUT:=New object:C1471
$voOUT.ID:=$voIN.ID
If ($voIN.ID>0)
	$voOUT[Table name:C256(->[sites:5])]:=$sitesEntity.toObject()
Else 
	$voOUT[Table name:C256(->[sites:5])]:=DEMOS_Common_EmptyObj(->[sites:5])
End if 
$voOUT[Table name:C256(->[meta:6])]:=$metaEntitySel.toCollection()

//"[pullDown]" テーブルを全件取得
$pullDownSel:=ds:C1482.pullDown.query("target = :1"; "site_type").orderBy("order asc")

$voOUT.pullDown:=New object:C1471
$voOUT.pullDown.site_type:=$pullDownSel.toCollection()

//他ユーザによるレコードロック情報返却
$voOUT.lock:=New object:C1471
$voOUT.lock.isLocked:=($lockUser.account#Null:C1517)
$voOUT.lock.user:=$lockUser

$0:=$voOUT

