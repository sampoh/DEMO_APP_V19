//%attributes = {}

var $0; $voOUT : Object
var $1; $voIN : Object
var $2; $session : Object

var $sessionEntity; $lockEntities : Object
var $lockingLock : Object

$voIN:=$1

If ($voIN.unlock#Null:C1517)
	
	$sessionEntity:=ds:C1482.session.query("sessionId = :1"; $voIN.unlock.sessionId).first()
	If ($sessionEntity#Null:C1517)
		$lockEntities:=ds:C1482.lock.query("ID_session = :1 and name = :2 and value = :3"; $sessionEntity.ID; $voIN.unlock.name; $voIN.unlock.value)
		If ($lockEntities.length>0)
			$lockingLock:=$lockEntities.drop()
			If ($lockingLock.length>0)
				//必要に応じてここでエラーハンドリング
			End if 
		End if 
	End if 
	
End if 

$0:=$voOUT

