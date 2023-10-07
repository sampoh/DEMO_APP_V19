//%attributes = {"shared":true}

var $0; $voOUT : Object
var $1; $voIN : Object

var $sessionid : Text
var $loggedin : Boolean
var $DT : Text

$voIN:=$1

READ ONLY:C145([user:1])
READ ONLY:C145([session:2])

//"[user]" テーブル検索
QUERY:C277([user:1]; [user:1]account:2=$voIN.form.account; *)
QUERY:C277([user:1];  & ; [user:1]password:3=$voIN.form.password)

$loggedin:=(Records in selection:C76([user:1])=1)

If ($loggedin)
	//4DSのセッションID自動配布機能を使用。
	If (4DS_COM_HasSession(->$sessionid))
		$DT:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)
		CREATE RECORD:C68([session:2])
		[session:2]ID_user:2:=[user:1]ID:1
		[session:2]sessionId:3:=$sessionid
		[session:2]loginDatetime:4:=$DT
		[session:2]accessDatetime:5:=$DT
		SAVE RECORD:C53([session:2])
	Else 
		$loggedin:=False:C215
	End if 
End if 

$voOUT:=New object:C1471("$loggedin"; $loggedin)

$0:=$voOUT
