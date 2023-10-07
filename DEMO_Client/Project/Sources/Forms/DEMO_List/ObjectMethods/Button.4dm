
C_TEXT:C284($PATH_4DZ)

If (Form event code:C388=On Clicked:K2:4)
	
	$PATH_4DZ:=Temporary folder:C486+Generate UUID:C1066+"_temp.4DZ"
	4DC_KEEP("PATH_4DZ"; ->$PATH_4DZ)
	4DC_COM_Add("SCL_Verup")
	
End if 
