
//C_TEXT($LISTBOX)
//C_LONGINT($selected)
//ARRAY TEXT($atPOPUP; 0)

//$LISTBOX:="LB_META"

//If (4DC_Popupevent)  //ポップアップイベント ( = 右クリック ) ハンドリング
//APPEND TO ARRAY($atPOPUP; "選択行を削除")
//$selected:=4DC_Popupmenu(->$atPOPUP)  //ポップアップメニュー表示
//If ($selected=1)  //選択肢番号判定
//4DC_LB_RemoveSelected($LISTBOX)  //選択行の削除
//SCL_Detail_Renumber
//End if 
//End if 
