//%attributes = {}
//バージョン情報

var $ver : Object

$ver:=New object:C1471

//↓新バージョン時はここを編集する↓

$ver.appName:="DEMO Client"  //アプリケーション名
$ver.numberString:="0.002 dev"  //バージョン番号文字列 ( この文字列の相違でアップデート判定 )
$ver.date:="2023/11/01"
$ver.note:="動作確認および雛型用デモバージョン"  //メモ ( 用途ほか )

//↑新バージョン時はここを編集する↑

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
	Storage:C1525.version.numberStringNew:=""  //新バージョン番号
	Storage:C1525.version.json:=New shared object:C1526  //HTTP取得した情報
	
End use 
