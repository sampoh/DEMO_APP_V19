//%attributes = {}

var $0; $JSON : Text

var $DIR; $PATH : Text

$DIR:=Get 4D folder:C485(Current resources folder:K5:16)

//リソースフォルダに配置したGoogle Oauth用JSONのフルパス
$PATH:=$DIR+"client_secret_70276041327-frscefpu2astg449r5ssgcl3gaq0kp0m.apps.googleusercontent.com.json"

If (Test path name:C476($PATH)=Is a document:K24:1)
	$JSON:=Document to text:C1236($PATH; "UTF-8")
Else 
	$JSON:="{}"
End if 

$0:=$JSON
