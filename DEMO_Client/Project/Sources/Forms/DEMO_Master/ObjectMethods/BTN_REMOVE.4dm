
var $LISTBOX : Text
var $col; $row; $pos; $i; $sizeI; $order : Integer
var $siteType : Collection
var $ONE : Object
var $ACCEPT : Boolean

$ACCEPT:=(Form event code:C388=On Clicked:K2:4)

If ($ACCEPT)
	
	$LISTBOX:="LB_SITE_TYPE"
	LISTBOX GET CELL POSITION:C971(*; $LISTBOX; $col; $row)
	
	$ACCEPT:=($row>0)
	
End if 

If ($ACCEPT)
	
	$pos:=$row-1
	
	$order:=1
	$siteType:=New collection:C1472
	$sizeI:=Form:C1466.siteType.length-1
	For ($i; 0; $sizeI)
		If ($i#$pos)
			$ONE:=OB Copy:C1225(Form:C1466.siteType[$i])
			$ONE.order:=$order
			$siteType.push($ONE)
			$order:=$order+1
		End if 
	End for 
	Form:C1466.siteType:=$siteType.copy()
	
	4DC_COM_Add("DEMO_Save_SiteType")
	
End if 
