//%attributes = {"shared":true}

var $0; $voOUT : Object
var $1; $voIN : Object

var $loggedout; $FLG_REMOVE : Boolean
var $sessionid : Text
var $sessionSel; $lockSession : Object
var $lockSel; $lockLock : Object

$voIN:=$1

$FLG_REMOVE:=4DS_COM_HasSession(->$sessionid)

If ($FLG_REMOVE)
	$FLG_REMOVE:=($sessionid#"")
End if 

If ($FLG_REMOVE)
	$sessionSel:=ds:C1482.session.query("sessionId = :1"; $sessionid)
	$FLG_REMOVE:=($sessionSel#Null:C1517)
End if 

If ($FLG_REMOVE)
	$lockSel:=ds:C1482.lock.query("ID_session = :1"; $sessionSel[0].ID)
	$lockLock:=$lockSel.drop()
	$lockSession:=$sessionSel.drop()
	If (($lockLock.length>0) | ($lockSession.length>0))
		//必要に応じてここでエラーハンドリング
	End if 
End if 

$loggedout:=True:C214

$voOUT:=New object:C1471("$loggedout"; $loggedout)

$0:=$voOUT

