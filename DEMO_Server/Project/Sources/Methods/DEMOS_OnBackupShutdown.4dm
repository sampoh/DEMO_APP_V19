//%attributes = {}
//< "On Backup Shutdown" データベースメソッドで実行する処理 >

ON ERR CALL:C155("DEMOS_ErrMethod")

var $UUID : Text
var $ZIP; $FLG_STARTED : Boolean
ARRAY TEXT:C222($atTO; 0)

//完了時のメール送信先
APPEND TO ARRAY:C911($atTO; "takahara@rna.co.jp")

//ZIP圧縮するかどうか指定
$ZIP:=False:C215

//バックアップ保存先ルートフォルダをGoogle DriveのUUIDで指定
$UUID:="1q5WTqFV0E2YaGj7KPzboaijBtZjAf12D"  //Google Drive上の "Backups" ドライブの "TEST" フォルダ

$FLG_STARTED:=AUTOBK_Start($UUID; $ZIP; ->$atTO)

ON ERR CALL:C155("")
