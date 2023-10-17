//%attributes = {}
//※ ロックされていない場合があり複雑になるのでこのサンプルでは解除されたかの判定は省略

var $1; $name : Text
var $2; $value : Text

var $sessionid : Text
var $sessionEntity : Object
var $lockEntity : Object
var $lockingLock : Object

$name:=$1
$value:=$2

If (4DS_COM_HasSession(->$sessionid))
	$sessionEntity:=ds:C1482.session.query("sessionId = :1"; $sessionid).first()
	If ($sessionEntity#Null:C1517)
		$lockEntity:=ds:C1482.lock.query("ID_session = :1 and name = :2 and value = :3"; $sessionEntity.ID; $name; $value).first()
		If ($lockEntity=Null:C1517)
			$lockingLock:=$lockEntity.drop()
			If ($lockingLock.length>0)
				//必要に応じてここでエラーハンドリング
			End if 
		End if 
	End if 
End if 
