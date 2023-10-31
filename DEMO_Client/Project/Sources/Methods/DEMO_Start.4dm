//%attributes = {}
//※ 必ず当メソッド経由でワーカーとして起動すること

//< 基本コーディングルール >
//　・ 変数キャストは "var" コマンドを使用すること ( "C_" 系は使用禁止 )
//　・ インタープロセス変数は全面的に使用禁止
//　・ 必要なインタープロセス値は "Storage" コマンドで実装すること
//　・ フォームオブジェクトに割り当てる値にはプロセス変数使用OK
//　・ フォームオブジェクト以外にはプロセス変数を使用しないこと ( 例外あり )
//　・ リストボックスはコレクションで実装すること
//　・ コレクションで代用可能な場合は配列の使用をなるべく避けること ( 煩雑になってしまう場合は配列でOK )
//　・ 引数が大量にならないようにすること ( オブジェクト等を使用する )

CALL WORKER:C1389("MAIN_PROCESS"; "DEMO_App")
