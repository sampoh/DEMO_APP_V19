//%attributes = {}

var $WA_NAME : Text

ARRAY TEXT:C222($atFilterURLs; 0)
ARRAY BOOLEAN:C223($abAllow; 0)

var $URL : Text
var $DOMAIN; $URL4D; $GROUP : Text
var $JSON : Text

ARRAY LONGINT:C221($alPosFound; 0)
ARRAY LONGINT:C221($alLenFound; 0)

var $FORM; $TITLE : Text
var $process : Integer

$WA_NAME:=OBJECT Get name:C1087(Object current:K67:2)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		//4D側でハンドリングするURLを指定
		APPEND TO ARRAY:C911($atFilterURLs; "http://liquidsystem/*")
		APPEND TO ARRAY:C911($atFilterURLs; "http://liquidmenu/*")
		APPEND TO ARRAY:C911($abAllow; False:C215)
		APPEND TO ARRAY:C911($abAllow; False:C215)
		
		WA SET URL FILTERS:C1030(*; $WA_NAME; $atFilterURLs; $abAllow)
		
		//URLをロード
		$URL:=Get 4D folder:C485(Current resources folder:K5:16)+"menu_liquid.html"
		$URL:="file:///"+Replace string:C233($URL; "\\"; "/")
		WA OPEN URL:C1020(*; $WA_NAME; $URL)
		
	: (Form event code:C388=On URL Filtering:K2:49)
		
		$URL:=WA Get last filtered URL:C1035(*; $WA_NAME)
		Case of 
			: (Match regex:C1019("^http://(liquidsystem)/(.*?)$"; $URL; 1; $alPosFound; $alLenFound))
				$DOMAIN:=Substring:C12($URL; $alPosFound{1}; $alLenFound{1})
				$URL4D:=Substring:C12($URL; $alPosFound{2}; $alLenFound{2})
			: (Match regex:C1019("^http://(liquidmenu)/(.*?)\\?group=(.*?)$"; $URL; 1; $alPosFound; $alLenFound))
				$DOMAIN:=Substring:C12($URL; $alPosFound{1}; $alLenFound{1})
				$URL4D:=Substring:C12($URL; $alPosFound{2}; $alLenFound{2})
				$GROUP:=Substring:C12($URL; $alPosFound{3}; $alLenFound{3})
		End case 
		
End case 

Case of 
	: ($DOMAIN="liquidsystem")
		
		Case of 
			: ($URL4D="load")
				$JSON:=JSON Stringify:C1217(Storage:C1525.menu.data)
				WA EXECUTE JAVASCRIPT FUNCTION:C1043(*; $WA_NAME; "loadData"; *; $JSON)
		End case 
		
		
	: ($DOMAIN="liquidmenu")
		
		Case of 
			: ($URL4D="analyze_sites")
				
				//"DEMO_Window_Detect" および "DEMO_Window_Append" は1つしか開かせない制御。
				//もし制限不要であれば単純に開けばよい
				
				If (DEMO_Window_Detect($URL4D; ->$process))
					BRING TO FRONT:C326($process)
				Else 
					$FORM:="DEMO_List"
					$TITLE:="DEMO Client - List"
					$process:=DEMO_Menu_Win($URL4D; $FORM; $TITLE; Plain window:K34:13+Form has no menu bar:K39:18)
					DEMO_Window_Append($URL4D; $process)
				End if 
				
			Else 
				ALERT:C41("これはダミー項目です。")
				
		End case 
		
End case 
