
var $voFORM : Object

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		//初期値をフォームにバインド
		OB SET:C1220($voFORM; \
			"account"; "takahara"; \
			"password"; "1234")
		
		4DC_FORM_Attach($voFORM)
		
End case 

//センタリング対象オブジェクト
4DC_KeepCenter("APP_NAME")
4DC_KeepCenter("account")
4DC_KeepCenter("password")
4DC_KeepCenter("BTN_LOGIN")
4DC_KeepCenter("BTN_QUIT")