//%attributes = {}
//バージョン情報

If (Storage:C1525.version=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.version:=New shared object:C1526
	End use 
End if 

If (Storage:C1525.version.data=Null:C1517)
	Use (Storage:C1525.version)
		Storage:C1525.version.appName:="DEMO Client"
		Storage:C1525.version.numberString:="0.001 dev"  //バージョンアップ判定文字列
		Storage:C1525.version.date:="2023/10/14"
		Storage:C1525.version.note:="動作確認および雛型用デモバージョン"
		Storage:C1525.version.update:=False:C215  //アップデートトリガ
		Storage:C1525.version.numberStringNew:=""  //アップデート処理用
	End use 
End if 
