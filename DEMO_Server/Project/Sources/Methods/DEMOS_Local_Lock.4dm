//%attributes = {}

var $0; $FLG_SUCCESS : Boolean
var $1; $name : Text
var $2; $value : Text
var $3 : Pointer
var $user : Object

var $FLG_LOCKABLE : Boolean
var $sessionid : Text
var $currentLockEntity : Object
var $sessionEntity : Object
var $lockEntity : Object
var $statusSave; $statusLock; $statusUnLock : Object
var $userEntity : Object

$name:=$1
$value:=$2

$user:=New object:C1471

$FLG_SUCCESS:=False:C215

$FLG_LOCKABLE:=4DS_COM_HasSession(->$sessionid)

If ($FLG_LOCKABLE)
	$sessionEntity:=ds:C1482.session.query("sessionId = :1"; $sessionid).first()
	$FLG_LOCKABLE:=($sessionEntity#Null:C1517)
End if 

If ($FLG_LOCKABLE)
	$currentLockEntity:=ds:C1482.lock.query("name = :1 and value = :2"; $name; $value).first()
	If ($currentLockEntity=Null:C1517)
		//Lock可能
		$FLG_LOCKABLE:=True:C214
	Else 
		//自セッションかチェック
		$FLG_LOCKABLE:=($currentLockEntity.ID_session=$sessionEntity.ID)
		If (Not:C34($FLG_LOCKABLE))
			//自セッションでない場合は返却用のユーザ情報取得
			$userEntity:=ds:C1482.user.query("ID = :1"; $currentLockEntity.ID_user).first()
			$user:=$userEntity.toObject()
		End if 
	End if 
End if 

If ($FLG_LOCKABLE)
	//"[lock]" テーブルにレコード生成
	$lockEntity:=ds:C1482.lock.query("ID_session = :1 and name = :2 and value = :3"; $sessionEntity.ID; $name; $value).first()
	If ($lockEntity=Null:C1517)
		$lockEntity:=ds:C1482.lock.new()
		$lockEntity.ID_user:=$sessionEntity.ID_user
		$lockEntity.ID_session:=$sessionEntity.ID
		$lockEntity.name:=$name
		$lockEntity.value:=$value
		$lockEntity.datetime:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)
		$statusSave:=$lockEntity.save()
		$FLG_SUCCESS:=$statusSave.success
	Else 
		//既存レコード更新
		$statusLock:=$lockEntity.lock()
		If ($statusLock.success)
			$lockEntity.datetime:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)
			$statusSave:=$lockEntity.save()
			$statusUnLock:=$lockEntity.unlock()
			$FLG_SUCCESS:=$statusSave.success
		End if 
	End if 
End if 

$0:=$FLG_SUCCESS

If (Count parameters:C259>=3)
	$3->:=OB Copy:C1225($user)
End if 
