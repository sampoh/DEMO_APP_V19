
C_LONGINT:C283($row; $col)
C_LONGINT:C283($ID)
C_TEXT:C284($value)

C_TEXT:C284($LISTBOX)
C_LONGINT:C283($selected)
ARRAY TEXT:C222($atPOPUP; 0)
C_OBJECT:C1216($voSELECTED)
ARRAY LONGINT:C221($alID; 0)
C_BOOLEAN:C305($ACCEPT)

$LISTBOX:="LB_URL"

Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		If (4DC_LB_GetEventCell(->$row; ->$col))  //クリック箇所を特定
			
			If (4DC_LB_GetCellVal($LISTBOX; $row; 1; ->$ID))  //対象行の1カラム目 "ID" を取得
				
				//"$ID" を一時保管
				4DC_KEEP("$ID"; ->$ID)
				
				//通信実施
				4DC_COM_Add("SCL_Detail_Show")
				
			End if 
			
		End if 
		
End case 

If (4DC_Popupevent)  //ポップアップイベント ( = 右クリック ) ハンドリング
	
	APPEND TO ARRAY:C911($atPOPUP; "選択行を削除")
	$selected:=4DC_Popupmenu(->$atPOPUP)  //ポップアップメニュー表示
	$ACCEPT:=($selected=1)  //選択肢番号判定
	
	If ($ACCEPT)
		$ACCEPT:=4DC_Confirm("選択行のデータを削除します。よろしいですか？"; "はい"; "いいえ")
	End if 
	
	If ($ACCEPT)
		
		//選択行の "IDs" 列を配列で取得
		$voSELECTED:=4DC_LB_GetSelected($LISTBOX; False:C215)  //選択行取得
		OB GET ARRAY:C1229($voSELECTED; "IDs"; $alID)
		
		//一時保管
		4DC_KEEP("$alID"; ->$alID)
		
		//削除実施
		4DC_COM_Add("SCL_List_Remove")
		
	End if 
	
End if 
