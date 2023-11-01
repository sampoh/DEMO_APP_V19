//%attributes = {}
//バージョン情報を Storage にキャスト

var $ver : Object

$ver:=DEMO_Version

If (Storage:C1525.version=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.version:=New shared object:C1526
	End use 
End if 

Use (Storage:C1525.version)
	
	//各バージョン固有
	Storage:C1525.version.appName:=$ver.appName
	Storage:C1525.version.numberString:=$ver.numberString
	Storage:C1525.version.date:=$ver.date
	Storage:C1525.version.note:=$ver.note
	
	//アップデート処理用
	Storage:C1525.version.update:=False:C215  //アップデートトリガ
	Storage:C1525.version.skip:=False:C215  //アップデート画面管理用
	Storage:C1525.version.worker:=False:C215  //アップデートチェックワーカー管理
	Storage:C1525.version.numberStringNew:=""  //新バージョン番号
	Storage:C1525.version.json:=New shared object:C1526  //HTTP取得した情報
	
End use 
