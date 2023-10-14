//%attributes = {}

var $root : Text
var $i; $sizeI : Integer

ARRAY TEXT:C222($atTitles; 0)
ARRAY TEXT:C222($atRefs; 0)

SET MENU BAR:C67(1)

$root:=Get menu bar reference:C979

GET MENU ITEMS:C977($root; $atTitles; $atRefs)

$sizeI:=Size of array:C274($atTitles)
For ($i; 1; $sizeI)
	If ($atTitles{$i}#"ファイル")
		DELETE MENU ITEM:C413($atRefs{$i}; 1)
	End if 
End for 

