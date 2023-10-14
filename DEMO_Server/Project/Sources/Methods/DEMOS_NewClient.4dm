//%attributes = {}
//新規 4DZ ファイルに差し替えてバージョンチェック用JSONを更新

var $version : Object

$version:=New object:C1471
$version.appName:="DEMO_Client"
$version.numberString:="0.001 dev"  //バージョンアップ判定用文字列
$version.date:="2023/10/14"
$version.note:="動作確認および雛型用デモバージョン"

DEMOS_NewClient_Sub($version)

