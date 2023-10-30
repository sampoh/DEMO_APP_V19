
var $scHeight : Integer
var $LEFT; $TOP; $RIGHT; $BOTTOM : Integer
var $ref : Integer


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		$ref:=Current form window:C827
		
		SET WINDOW TITLE:C213("MAIN MENU"; $ref)
		
		GET WINDOW RECT:C443($LEFT; $TOP; $RIGHT; $BOTTOM; $ref)
		$scHeight:=Screen height:C188(*)
		$BOTTOM:=$TOP+$scHeight-160
		SET WINDOW RECT:C444($LEFT; $TOP; $RIGHT; $BOTTOM; $ref)
		
	: (Form event code:C388=On Close Box:K2:21)
		
		If (4DC_Confirm("ログアウトします。\r\nよろしいですか？"; "はい"; "いいえ"))
			4DC_COM_Logout("DEMO_Logout")
		End if 
		
End case 
