//%attributes = {"shared":true}
//エラー時にセッションIDをユーザ名に変換する

//※ セッションIDがブランクの場合もあります。

var $0; $user : Text
var $1; $sessionId : Text

$sessionId:=$1

READ ONLY:C145([session:2])
READ ONLY:C145([user:1])

If ($sessionId="")
	$user:="no session"
Else 
	QUERY:C277([session:2]; [session:2]sessionId:3=$sessionId)
	If (Records in selection:C76([session:2])>0)
		QUERY:C277([user:1]; [user:1]ID:1=[session:2]ID_user:2)
		If (Records in selection:C76([user:1])>0)
			$user:="user :"+[user:1]account:2
		Else 
			$user:="sessionId :"+$sessionId
		End if 
	Else 
		$user:="sessionId :"+$sessionId
	End if 
End if 

$0:=$user
