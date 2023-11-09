//%attributes = {}

var $0; $voOUT : Object
var $1; $voIN : Object
var $2; $session : Object

var $ID_INPUT; $ID_SAVED : Integer
var $siteEntity; $metaEntities; $metaEntity; $tempEntity : Object
var $statusLock; $statusSave; $statusUnLock : Object
var $voMeta : Object
var $lockingMeta : Object
var $isNew; $ACCEPT : Boolean

$voIN:=$1
$session:=$2

$voOUT:=New object:C1471
$voOUT.errCode:=0
$voOUT.errMsg:=""

$ID_INPUT:=$voIN.ID

$isNew:=False:C215

ds:C1482.startTransaction()

If ($voIN.site.ID>=1)
	$siteEntity:=ds:C1482.sites.query("ID = :1"; $voIN.site.ID).first()
	If ($siteEntity=Null:C1517)
		vlErrCode:=-1
		$voOUT.errMsg:="このデータは既に削除されています。"
	End if 
	$metaEntities:=ds:C1482.meta.query("ID_sites = :1"; $voIN.site.ID)
Else 
	$tempEntity:=ds:C1482.sites.query("url = :1 and url != :2"; $voIN.site.url; "").first()
	If ($tempEntity=Null:C1517)
		$siteEntity:=ds:C1482.sites.new()
		$isNew:=True:C214
	Else 
		vlErrCode:=-1
		$voOUT.errMsg:="このURLは既に登録されています。"
	End if 
End if 

If (vlErrCode=0)
	If ($metaEntities#Null:C1517)
		If ($metaEntities.length>0)
			$lockingMeta:=$metaEntities.drop()
			If ($lockingMeta.length>0)
				vlErrCode:=-1
			End if 
		End if 
	End if 
End if 

If (vlErrCode=0)
	
	//"[sites]" 保存
	If ($isNew)
		$ACCEPT:=True:C214
	Else 
		$statusLock:=$siteEntity.lock()
		$ACCEPT:=($statusLock.success)
	End if 
	If ($ACCEPT)
		$siteEntity.title:=$voIN.site.title
		$siteEntity.url:=$voIN.site.url
		$siteEntity.description:=$voIN.site.description
		$siteEntity.type:=$voIN.site.type
		$statusSave:=$siteEntity.save()
		$ID_SAVED:=$siteEntity.ID
		If (Not:C34($isNew))
			$statusUnLock:=$siteEntity.unlock()
		End if 
	End if 
	
	//"[meta]" 保存
	If ($ACCEPT)
		For each ($voMeta; $voIN.meta)
			$metaEntity:=ds:C1482.meta.new()
			$metaEntity.ID_sites:=$ID_SAVED
			$metaEntity.group:=$voMeta.group
			$metaEntity.attr:=$voMeta.attr
			$metaEntity.value:=$voMeta.value
			$statusSave:=$metaEntity.save()
		End for each 
	End if 
	
End if 

If (vlErrCode=0)
	ds:C1482.validateTransaction()
Else 
	ds:C1482.cancelTransaction()
End if 

$voOUT.ID:=$ID_INPUT
$voOUT.errCode:=vlErrCode
If (vlErrCode#0)
	If ($voOUT.errMsg="")
		$voOUT.errMsg:="システムエラー"
	End if 
End if 

$0:=$voOUT

