
var $PATH_4DZ : Text

ARRAY TEXT:C222($atFROM; 0)
ARRAY TEXT:C222($atTO; 0)

If (Form event code:C388=On Clicked:K2:4)
	
	4DC_KEEP_Get("PATH_4DZ"; ->$PATH_4DZ)
	
	APPEND TO ARRAY:C911($atFROM; $PATH_4DZ)
	APPEND TO ARRAY:C911($atTO; DEMO_Get_4DZ_Path)
	
	4DC_REBOOT(Null:C1517; ->$atFROM; ->$atTO)
	
	4DC_KEEP_Remove("PATH_4DZ")
	
End if 
