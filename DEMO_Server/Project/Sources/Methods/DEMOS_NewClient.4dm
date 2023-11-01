//%attributes = {}
//< 新規 4DZ ファイルに差し替えてバージョンチェック用JSONを更新 >

//※ 手動実行用メソッド

var $version : Object
var $DIR_SMB : Text

//バージョンチェック用JSONの内容
$version:=New object:C1471
$version.appName:="DEMO_Client"
$version.numberString:="0.002 dev"  //バージョンアップ判定用文字列
$version.date:="2023/11/01"
$version.note:="動作確認および雛型用デモバージョン"
$version.onWeb:=True:C214  //セキュリティを考慮する場合は False パフォーマンスを重視する場合は True
$version.blockSize:=1024*1024  //WebFolder設置の際の分割サイズ ( バイト数 )

DEMOS_NewClient_Sub($version)

//※ リバースプロキシを使用する場合は
//　　WebFolder内の "client_binary" フォルダ以下をリバースプロキシ側に設置すれば
//　　アップデート時の4D側の負荷をゼロにできます。
//　　以下のパス "$DIR_SMB" にネットワークドライブ上で "client_binary" に該当するディレクトリパスを入力すれば
//　　アップデート用ファイルを複製します。
//　　( $version.onWeb:=False の場合は無意味です )

$DIR_SMB:=""  //リバースプロキシ上の "client_binary" ディレクトリのネットワークパス
If (($version.onWeb) & (Test path name:C476($DIR_SMB)=Is a folder:K24:2))
	DEMOS_NewClient_SMB($DIR_SMB)
End if 


