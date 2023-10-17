//%attributes = {}

var $0; $voOUT : Object
var $1; $voIN : Object
var $2; $session : Object

var $sitesEntity; $metaEntitySel : Object
var $voSites : Object
var $colMeta : Collection

$voIN:=$1

$sitesEntity:=ds:C1482.sites.query("ID = :1"; $voIN.ID).first()
$metaEntitySel:=ds:C1482.meta.query("ID_sites = :1"; $voIN.ID).orderBy("group asc")

If ($voIN.ID>0)
	DEMOS_Local_Lock(Table name:C256(->[sites:5]); String:C10($voIN.ID))  //name&value方式でロック
End if 

$voOUT:=New object:C1471
$voOUT.ID:=$voIN.ID
If ($voIN.ID>0)
	$voOUT[Table name:C256(->[sites:5])]:=$sitesEntity.toObject()
Else 
	$voOUT[Table name:C256(->[sites:5])]:=DEMOS_Common_EmptyObj(->[sites:5])
End if 
$voOUT[Table name:C256(->[meta:6])]:=$metaEntitySel.toCollection()

$0:=$voOUT

