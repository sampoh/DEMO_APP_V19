//%attributes = {}

var $1; $MODE : Text

var $LISTBOX : Text
var $col; $row; $pos; $i; $sizeI : Integer
var $siteType : Collection

$MODE:=$1

$LISTBOX:="LB_SITE_TYPE"
LISTBOX GET CELL POSITION:C971(*; $LISTBOX; $col; $row)

If ($row>0)
	
	$pos:=$row-1
	
	Case of 
		: ($MODE="UP")
			
			If ($pos>0)
				
				$siteType:=Form:C1466.siteType.copy()
				$sizeI:=$siteType.length-1
				For ($i; 0; $sizeI)
					Case of 
						: ($i=($pos-1))
							$siteType[$i].order:=$siteType[$i].order+1
						: ($i=$pos)
							$siteType[$i].order:=$siteType[$i].order-1
					End case 
				End for 
				Form:C1466.siteType:=$siteType.orderBy("order asc")
				
				Form:C1466.siteTypePos:=$row-1
				SET TIMER:C645(-1)  //※ "LISTBOX SELECT ROW" をここで実行すると正常に動作しない
				
			End if 
			
		: ($MODE="DOWN")
			
			$siteType:=Form:C1466.siteType.copy()
			
			$sizeI:=$siteType.length-1
			If ($pos<$sizeI)
				
				$sizeI:=$siteType.length-1
				For ($i; 0; $sizeI)
					Case of 
						: ($i=$pos)
							$siteType[$i].order:=$siteType[$i].order+1
						: ($i=($pos+1))
							$siteType[$i].order:=$siteType[$i].order-1
					End case 
				End for 
				Form:C1466.siteType:=$siteType.orderBy("order asc")
				
				Form:C1466.siteTypePos:=$row+1
				SET TIMER:C645(-1)  //※ "LISTBOX SELECT ROW" をここで実行すると正常に動作しない
				
			End if 
			
	End case 
	
	
End if 




