//%attributes = {"shared":true}

var $0; $voOUT : Object
var $1; $voIN : Object

var $sessionid : Text
var $loggedin : Boolean
var $DT : Text

$voIN:=$1

var $userSel; $voSession : Object

//"[user]" テーブル検索
$userSel:=ds:C1482.user.query("account = :1 and password = :2"; $voIN.form.account; $voIN.form.password)

$loggedin:=($userSel.length=1)

If ($loggedin)
	//4DSのセッションID自動配布機能を使用。
	If (4DS_COM_HasSession(->$sessionid))
		
		$DT:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)
		
		//"[session]" テーブルにレコード追加
		$voSession:=ds:C1482.session.new()
		$voSession.ID_user:=$userSel[0].ID
		$voSession.sessionId:=$sessionid
		$voSession.loginDatetime:=$DT
		$voSession.accessDatetime:=$DT
		$voSession.data:=New object:C1471  //セッション関連付加情報用
		$voSession.save()
		
	Else 
		$loggedin:=False:C215
	End if 
End if 

$voOUT:=New object:C1471("$loggedin"; $loggedin)

$0:=$voOUT

