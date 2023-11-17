
var $ONE : Object
var $group; $groupStyled; $delimiter : Text

$delimiter:=", "

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Form:C1466.selectedFolder=Null:C1517)
			
			For each ($ONE; Form:C1466.folders)
				If ($ONE.groups#Null:C1517)
					$ONE.groupsStyled:=$ONE.groups.join($delimiter)
				End if 
			End for each 
			
		Else 
			
			For each ($ONE; Form:C1466.folders)
				If ($ONE.groups#Null:C1517)
					$ONE.groupsStyled:=$ONE.groups.join(",,,,,,")
				End if 
			End for each 
			
			For each ($ONE; Form:C1466.folders)
				$groupStyled:=""
				If ($ONE.groups#Null:C1517)
					For each ($group; $ONE.groups)
						If ($groupStyled#"")
							$groupStyled:=$groupStyled+$delimiter
						End if 
						If ($group=Form:C1466.selectedFolder.name)
							$groupStyled:=$groupStyled+\
								"<SPAN STYLE=\"COLOR:#0000FF;FONT-WEIGHT:BOLD;\">"+$group+"</SPAN>"
						Else 
							$groupStyled:=$groupStyled+$group
						End if 
					End for each 
				End if 
				$ONE.groupsStyled:=$groupStyled
			End for each 
			
		End if 
		
End case 
