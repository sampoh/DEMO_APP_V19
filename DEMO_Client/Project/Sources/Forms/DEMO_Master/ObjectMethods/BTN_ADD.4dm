
var $TXT : Text
var $CODE; $ORDER : Integer
var $colIndex : Collection

If (Form event code:C388=On Clicked:K2:4)
	
	$TXT:=Request:C163("新しいタイプを入力してください。"; ""; "OK"; "CANCEL")
	
	If (OK=1)
		If ($TXT#"")
			$colIndex:=Form:C1466.siteType.indices("value = :1"; $TXT)  //重複チェック
			If ($colIndex.length=0)
				$CODE:=Form:C1466.siteType.max("code")+1
				$ORDER:=Form:C1466.siteType.max("order")+1
				Form:C1466.siteType.push(New object:C1471("ID"; -1; "target"; "site_type"; "value"; $TXT; "code"; $CODE; "order"; $ORDER))
				4DC_COM_Add("DEMO_Save_SiteType")
			End if 
		End if 
	End if 
	
End if 
