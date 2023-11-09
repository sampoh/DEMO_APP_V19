
var $DATE : Date

Case of 
	: (\
		(Form event code:C388=On Getting Focus:K2:7) | \
		(Form event code:C388=On Clicked:K2:4))
		
		$DATE:=Date:C102(Form:C1466.multi.date)
		
		4DC_Input_Calendar(->$DATE)
		
		Form:C1466.multi.date:=String:C10($DATE; Internal date short:K1:7)
		
End case 
