//%attributes = {}
//セッションアップデート

var $0; $session : Object
var $1; $sessionid : Text

var $sessionEntity; $userEntity; $user : Object
var $statusSave; $statusLock; $statusUnLock : Object
var $hasSession : Boolean

$sessionid:=$1

//"[session]" テーブル検索
$sessionEntity:=ds:C1482.session.query("sessionId = :1"; $sessionid).first()

$hasSession:=False:C215

$user:=New object:C1471

If ($sessionEntity#Null:C1517)
	
	//"[user]" テーブル検索
	$userEntity:=ds:C1482.user.query("ID = :1"; $sessionEntity.ID_user).first()
	
	If ($userEntity#Null:C1517)
		
		$user:=$userEntity.toObject()
		$hasSession:=True:C214
		
		$statusLock:=$sessionEntity.lock()
		
		//アップデート実施
		If ($statusLock.success)
			$sessionEntity.accessDatetime:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)
			$statusSave:=$sessionEntity.save()
			$statusUnLock:=$sessionEntity.unlock()
		End if 
		
	End if 
	
End if 

//セキュリティを考慮しパスワードを除去
OB REMOVE:C1226($user; Field name:C257(->[user:1]password:3))

$session:=New object:C1471
$session.user:=$user
$session.hasSession:=$hasSession

$0:=$session
