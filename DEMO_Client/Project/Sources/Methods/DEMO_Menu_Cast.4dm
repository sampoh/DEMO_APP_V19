//%attributes = {}

var $OBJ : Object

$OBJ:=New object:C1471
$OBJ.group:=New collection:C1472

$OBJ.group.push(New object:C1471("title"; "機能 1"; "name"; "group_001"; \
"list"; New collection:C1472(\
New object:C1471("title"; "サイト解析"; "action"; "analyze_sites"); \
New object:C1471("title"; "マスタ管理"; "action"; "admin_master"); \
New object:C1471("title"; "マルチウインドウテスト"; "action"; "multi_test"))))

$OBJ.group.push(New object:C1471("title"; "機能 2"; "name"; "group_002"; \
"list"; New collection:C1472(\
New object:C1471("title"; "テスト項目 A"; "action"; "testing_a"); \
New object:C1471("title"; "テスト項目 B"; "action"; "testing_b"); \
New object:C1471("title"; "テスト項目 C"; "action"; "testing_c"); \
New object:C1471("title"; "テスト項目 D"; "action"; "testing_d"))))

$OBJ.group.push(New object:C1471("title"; "機能 3"; "name"; "group_003"; \
"list"; New collection:C1472(\
New object:C1471("title"; "テスト項目 E"; "action"; "testing_e"); \
New object:C1471("title"; "テスト項目 F"; "action"; "testing_f"); \
New object:C1471("title"; "テスト項目 G"; "action"; "testing_g"); \
New object:C1471("title"; "テスト項目 H"; "action"; "testing_h"))))

$OBJ.group.push(New object:C1471("title"; "機能 4"; "name"; "group_004"; \
"list"; New collection:C1472(\
New object:C1471("title"; "テスト項目 I"; "action"; "testing_i"); \
New object:C1471("title"; "テスト項目 J"; "action"; "testing_j"); \
New object:C1471("title"; "テスト項目 K"; "action"; "testing_k"); \
New object:C1471("title"; "テスト項目 L"; "action"; "testing_l"); \
New object:C1471("title"; "テスト項目 M"; "action"; "testing_m"); \
New object:C1471("title"; "テスト項目 N"; "action"; "testing_n"); \
New object:C1471("title"; "テスト項目 O"; "action"; "testing_o"); \
New object:C1471("title"; "テスト項目 P"; "action"; "testing_p"); \
New object:C1471("title"; "テスト項目 Q"; "action"; "testing_q"); \
New object:C1471("title"; "テスト項目 R"; "action"; "testing_r"); \
New object:C1471("title"; "テスト項目 S"; "action"; "testing_s"); \
New object:C1471("title"; "テスト項目 T"; "action"; "testing_t"); \
New object:C1471("title"; "テスト項目 U"; "action"; "testing_u"))))

$OBJ.group.push(New object:C1471("title"; "機能 5"; "name"; "group_005"; \
"list"; New collection:C1472(\
New object:C1471("title"; "テスト項目 V"; "action"; "testing_v"); \
New object:C1471("title"; "テスト項目 W"; "action"; "testing_w"); \
New object:C1471("title"; "テスト項目 X"; "action"; "testing_x"); \
New object:C1471("title"; "テスト項目 Y"; "action"; "testing_y"); \
New object:C1471("title"; "テスト項目 Z"; "action"; "testing_z"))))

If (Storage:C1525.menu=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.menu:=New shared object:C1526
	End use 
End if 

Use (Storage:C1525.menu)
	Storage:C1525.menu.data:=OB Copy:C1225($OBJ; ck shared:K85:29; Storage:C1525.menu)
End use 
