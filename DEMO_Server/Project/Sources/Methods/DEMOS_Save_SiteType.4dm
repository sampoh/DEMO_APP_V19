//%attributes = {}

var $0; $voOUT : Object
var $1; $voIN : Object
var $2; $session : Object

var $colIndex : Collection
var $index : Integer
var $ONE; $pulldownEntity; $statusSave; $statusLock : Object
var $delEntities; $lockingDel : Object
var $colID : Collection

$voIN:=$1
$session:=$2

$voOUT:=New object:C1471
$voOUT.errCode:=0
$voOUT.errMsg:=""

$colID:=New collection:C1472

ds:C1482.startTransaction()

//更新
For each ($ONE; $voIN.siteType)
	If ($ONE.ID>0)
		$colID.push($ONE.ID)
		$pulldownEntity:=ds:C1482.pullDown.query("ID = :1"; $ONE.ID).first()
		If ($pulldownEntity=Null:C1517)
			//既に削除されている
		Else 
			$statusLock:=$pulldownEntity.lock()
			If ($statusLock.success)
				$pulldownEntity.target:=$ONE.target
				$pulldownEntity.value:=$ONE.value
				$pulldownEntity.code:=$ONE.code
				$pulldownEntity.order:=$ONE.order
				$statusSave:=$pulldownEntity.save()
				$statusUnLock:=$pulldownEntity.unlock()
			End if 
		End if 
	End if 
End for each 

//追加
$colIndex:=$voIN.siteType.indices("ID = :1"; -1)
If ($colIndex.length>0)
	For each ($index; $colIndex)
		$pulldownEntity:=ds:C1482.pullDown.new()
		$pulldownEntity.target:=$voIN.siteType[$index].target
		$pulldownEntity.value:=$voIN.siteType[$index].value
		$pulldownEntity.code:=$voIN.siteType[$index].code
		$pulldownEntity.order:=$voIN.siteType[$index].order
		$statusSave:=$pulldownEntity.save()
		$voIN.siteType[$index].ID:=$pulldownEntity.ID
		$colID.push($pulldownEntity.ID)
	End for each 
End if 

If (vlErrCode=0)
	$delEntities:=ds:C1482.pullDown.query("target = :1 and not (ID in :2)"; "site_type"; $colID)
	If ($delEntities.length>0)
		$lockingDel:=$delEntities.drop()
		If ($lockingDel.length>0)
			vlErrCode:=-1
		End if 
	End if 
End if 

If (vlErrCode=0)
	ds:C1482.validateTransaction()
Else 
	ds:C1482.cancelTransaction()
End if 

$0:=$voOUT

