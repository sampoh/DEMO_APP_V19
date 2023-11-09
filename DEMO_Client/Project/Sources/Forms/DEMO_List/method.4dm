
var $RESIZABLE : Boolean
var $minWidth; $minHeight : Integer

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		//HIDE MENU BAR
		
		//フォームの最小サイズを指定
		$RESIZABLE:=True:C214
		$minWidth:=640
		$minHeight:=480
		FORM SET HORIZONTAL RESIZING:C892($RESIZABLE; $minWidth; 32767)
		FORM SET VERTICAL RESIZING:C893($RESIZABLE; $minHeight; 32767)
		
		//最大化
		//MAXIMIZE WINDOW(Current form window)
		
		//一覧ロードのための通信処理
		4DC_COM_Add("DEMO_List")
		
	: (Form event code:C388=On Close Box:K2:21)
		
		CANCEL:C270
		
	: (Form event code:C388=On Unload:K2:2)
		
		//最大化解除
		//MINIMIZE WINDOW(Current form window)
		
End case 

//横位置をセンタリングするオブジェクト
4DC_KeepCenter("BTN_ADD")

