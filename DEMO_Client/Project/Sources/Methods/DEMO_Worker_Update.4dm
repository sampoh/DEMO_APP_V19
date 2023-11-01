//%attributes = {}
//アップデート定期チェック用ワーカープロセス

//※ 通知窓を閉じても60分おきに再表示する仕様

DEMO_Compiler_Err

ON ERR CALL:C155("DEMO_ErrMethod")

var $FORM; $TITLE : Text

$FORM:="DEMO_Verup"
$TITLE:="アップデート"


Use (Storage:C1525.version)
	Storage:C1525.version.worker:=True:C214
End use 

While (Storage:C1525.version.worker)
	
	DEMO_Worker_Update_Wait(60)  //60分待機
	
	DEMO_Check_Update
	
	If (Storage:C1525.version.update)
		
		4DC_WIN_FORM($FORM; $TITLE; Plain window:K34:13+Form has no menu bar:K39:18; False:C215; False:C215; On the right:K39:3; At the top:K39:5)
		
		If (Storage:C1525.version.skip)
			Use (Storage:C1525.version)
				Storage:C1525.version.worker:=False:C215
			End use 
		End if 
		
	End if 
	
End while 

ON ERR CALL:C155("")

KILL WORKER:C1390
