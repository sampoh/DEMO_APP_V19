
var $ACCEPT : Boolean
var $TEMPDIR; $DIR; $PATH : Text

$ACCEPT:=(Form event code:C388=On Clicked:K2:4)

If ($ACCEPT)
	$ACCEPT:=(Form:C1466.formname#"")
	If (Not:C34($ACCEPT))
		ALERT:C41("Fill \"Form name\".")
	End if 
End if 

If ($ACCEPT)
	$TEMPDIR:=System folder:C487(User preferences_user:K41:4)+"Downloads\\"
	$DIR:=Select folder:C670("出力先を選択してください。"; $TEMPDIR)
	$ACCEPT:=((OK=1) & (Test path name:C476($DIR)=Is a folder:K24:2))
End if 

If ($ACCEPT)
	//$PATH:=$DIR+"form.4DForm"
	$PATH:=$DIR+Form:C1466.formname+".4DForm"
	$ACCEPT:=(Test path name:C476($PATH)#Is a document:K24:1)
	If (Not:C34($ACCEPT))
		$ACCEPT:=4DC_Confirm("\""+Form:C1466.formname+"\" は既に存在します。上書きしますか？")
	End if 
End if 

If ($ACCEPT)
	
	If (Test path name:C476($PATH)=Is a document:K24:1)
		DELETE DOCUMENT:C159($PATH)
	End if 
	TEXT TO DOCUMENT:C1237($PATH; Form:C1466.json; "UTF-8")
	
	ALERT:C41("フォームをJSONとして書き出しました。")
	
End if 
