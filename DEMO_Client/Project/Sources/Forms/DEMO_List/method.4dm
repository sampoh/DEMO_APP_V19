
//C_BOOLEAN($RESIZABLE)
//C_LONGINT($minWidth; $minHeight)

//Case of 
//: (Form event code=On Load)

////フォームの最小サイズを指定
//$RESIZABLE:=True
//$minWidth:=640
//$minHeight:=480
//FORM SET HORIZONTAL RESIZING($RESIZABLE; $minWidth; 32767)
//FORM SET VERTICAL RESIZING($RESIZABLE; $minHeight; 32767)

////最大化
////MAXIMIZE WINDOW(Current form window)

////一覧ロードのための通信処理
//4DC_COM_Add("SCL_List")

//: (Form event code=On Unload)

////最大化解除
////MINIMIZE WINDOW(Current form window)

//End case 

////横位置をセンタリングするオブジェクト
//4DC_KeepCenter("BTN_ADD")
//4DC_KeepCenter("Thermometer_001")
//4DC_KeepCenter("Thermometer_002")

////縦位置をセンタリングするオブジェクト
//4DC_KeepCenterVertical("Thermometer_001")
//4DC_KeepCenterVertical("Thermometer_002")
