//%attributes = {}

var $execute : Boolean
var $LISTBOX; $URL; $html; $TEMP; $attr; $value; $TITLE : Text
var $httpCode; $start; $posFound; $lenFound; $group : Integer
var $colTemp; $colMeta : Collection
var $FLG_Description : Boolean
var $FLG_Title : Boolean
var $content; $meta_title : Text

ARRAY LONGINT:C221($alPosFound; 0)
ARRAY LONGINT:C221($alLenFound; 0)

$LISTBOX:="LB_META"

$colTemp:=New collection:C1472
$colMeta:=New collection:C1472

$URL:=Form:C1466.detail.url

$execute:=($URL="http@")

If ($execute)
	
	$httpCode:=HTTP Get:C1157($URL; $html)
	If (($httpCode>=200) & ($httpCode<300))
		
		$TITLE:=""
		If (Match regex:C1019("<title>(.*?)</title>"; Lowercase:C14($html); 1; $alPosFound; $alLenFound))
			$TITLE:=Substring:C12($html; $alPosFound{1}; $alLenFound{1})
		End if 
		4DC_WEB_Unescape($TITLE; ->$TITLE)
		Form:C1466.detail.title:=$TITLE
		
		//head以外削除
		If (Match regex:C1019("<head>((.|\\r|\\n)*?)</head>"; Lowercase:C14($html); 1; $posFound; $lenFound))
			$html:=Substring:C12($html; $posFound; $lenFound)
		End if 
		
		$start:=1
		While (Match regex:C1019("<meta (.*?)>"; Lowercase:C14($html); $start; $posFound; $lenFound))
			$TEMP:=Substring:C12($html; $posFound; $lenFound)
			$colTemp.push($TEMP)
			$start:=$posFound+$lenFound
		End while 
		
	End if 
	
	$group:=1
	For each ($TEMP; $colTemp)
		$content:=""
		$meta_title:=""
		$FLG_Description:=False:C215
		$FLG_Title:=False:C215
		While (Match regex:C1019("([a-z\\-\\_]+)=(\"(.*?)\"|'(.*?)')"; Lowercase:C14($TEMP); 1; $alPosFound; $alLenFound))
			$ONE:=Substring:C12($TEMP; $alPosFound{0}; $alLenFound{0})
			$attr:=Substring:C12($TEMP; $alPosFound{1}; $alLenFound{1})
			$value:=Substring:C12($TEMP; $alPosFound{3}; $alLenFound{3})
			$colMeta.push(New object:C1471(\
				"group"; $group; \
				"attr"; $attr; \
				"value"; $value))
			If ($attr="content")
				$content:=$value
				$meta_title:=$value
			End if 
			If ((($attr="name") | ($attr="itemprop")) & ($value="description"))
				$FLG_Description:=True:C214
			End if 
			If (($attr="property") & ($value="og:title"))
				$FLG_Title:=True:C214
			End if 
			$TEMP:=Substring:C12($TEMP; $alPosFound{0}+$alLenFound{0})
		End while 
		
		If ($FLG_Description)
			Form:C1466.detail.description:=$meta_title
		End if 
		
		If ($TITLE="")
			If ($FLG_Title)
				Form:C1466.detail.title:=$meta_title
			End if 
		End if 
		
		$group:=$group+1
		
	End for each 
	
End if 

$PTR:=OBJECT Get pointer:C1124(Object named:K67:5; $LISTBOX)
$PTR->:=$colMeta.copy()
