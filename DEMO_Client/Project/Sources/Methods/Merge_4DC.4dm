//%attributes = {}
//コンポーネント機能のデバッグ用に "4DC" ソースをマージ
//※ 元に戻せないので実行する場合は必ず事前にソースを複製して別管理にしてください。

var $filename; $PATH : Text
var $ACCEPT : Boolean

$filename:=Select document:C905(""; "4DProject"; "4DCのプロジェクトファイルを選択してください。"; 0)
$ACCEPT:=(OK=1)

If ($ACCEPT)
	$ACCEPT:=($filename="4DC.4DProject")
	If (Not:C34($ACCEPT))
		ALERT:C41("これは4DCのプロジェクトファイルではありません。")
	End if 
End if 

If ($ACCEPT)
	Merge_4DC_Sub(Document)
End if 
