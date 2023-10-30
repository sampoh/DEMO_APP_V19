//%attributes = {}

var $1; $INPUT : Text

var $execute : Boolean
var $THIS; $THAT : Object
var $ROOT; $PATH : Text
var $posFound; $lenFound : Integer
var $i; $k; $sizeI; $sizeK : Integer
ARRAY TEXT:C222($atName; 0)
ARRAY LONGINT:C221($alType; 0)
var $method; $oneRoot : Text
var $IO : Object
ARRAY TEXT:C222($atForms; 0)
ARRAY TEXT:C222($atFilesA; 0)
ARRAY TEXT:C222($atFilesB; 0)

$INPUT:=$1

If (Match regex:C1019("Project.4DC\\.4DProject$"; $INPUT; 1; $posFound; $lenFound))
	$ROOT:=Substring:C12($INPUT; 1; $posFound-1)
End if 

$execute:=(Test path name:C476($ROOT)=Is a folder:K24:2)

If ($execute)
	
	$THIS:=New object:C1471
	$THIS.path:=New object:C1471
	$THIS.path.root:=Get 4D folder:C485(Database folder:K5:14)
	$THIS.path.folders:=$THIS.path.root+"Project\\Sources\\folders.json"
	$THIS.path.roots:=New collection:C1472
	$THIS.path.roots.push($THIS.path.root+"Project\\Sources\\Methods\\")  //プロジェクトメソッド
	$THIS.path.roots.push($THIS.path.root+"Documentation\\Methods\\")  //ドキュメント
	$THIS.path.form:=$THIS.path.root+"Project\\Sources\\Forms\\"  //フォーム
	$THIS.data:=New object:C1471
	$THIS.data.folders:=JSON Parse:C1218(Document to text:C1236($THIS.path.folders; "UTF-8"))
	
	$THAT:=New object:C1471
	$THAT.path:=New object:C1471
	$THAT.path.root:=$ROOT
	$THAT.path.folders:=$THAT.path.root+"Project\\Sources\\folders.json"
	$THAT.path.roots:=New collection:C1472
	$THAT.path.roots.push($THAT.path.root+"Project\\Sources\\Methods\\")  //プロジェクトメソッド
	$THAT.path.roots.push($THAT.path.root+"Documentation\\Methods\\")  //ドキュメント
	$THAT.path.form:=$THAT.path.root+"Project\\Sources\\Forms\\"  //フォーム
	$THAT.data:=New object:C1471
	$THAT.data.folders:=JSON Parse:C1218(Document to text:C1236($THAT.path.folders; "UTF-8"))
	
	OB GET PROPERTY NAMES:C1232($THAT.data.folders; $atName; $alType)
	$sizeI:=Size of array:C274($atName)
	For ($i; 1; $sizeI)
		$THIS.data.folders[$atName{$i}]:=OB Get:C1224($THAT.data.folders; $atName{$i}; $alType{$i})
	End for 
	
	TEXT TO DOCUMENT:C1237($THIS.path.folders; JSON Stringify:C1217($THIS.data.folders); "UTF-8")
	
	$sizeI:=$THIS.path.roots.length-1
	For ($i; 0; $sizeI)
		CLEAR VARIABLE:C89($atFilesA)
		DOCUMENT LIST:C474($THAT.path.roots[$i]; $atFilesA)
		$sizeK:=Size of array:C274($atFilesA)
		For ($k; 1; $sizeK)
			$IO:=New object:C1471
			$IO.from:=$THAT.path.roots[$i]+$atFilesA{$k}
			$IO.to:=$THIS.path.roots[$i]+$atFilesA{$k}
			If (Test path name:C476($IO.to)=Is a document:K24:1)
				DELETE DOCUMENT:C159($IO.to)
			End if 
			COPY DOCUMENT:C541($IO.from; $IO.to)
		End for 
	End for 
	
	FOLDER LIST:C473($THAT.path.form; $atForms)
	$sizeI:=Size of array:C274($atForms)
	For ($i; 1; $sizeI)
		
		CLEAR VARIABLE:C89($atFilesA)
		CLEAR VARIABLE:C89($atFilesB)
		
		$IO:=New object:C1471
		$IO.form:=New object:C1471
		$IO.form.from:=$THAT.path.form+$atForms{$i}+"\\"
		$IO.form.to:=$THIS.path.form+$atForms{$i}+"\\"
		$IO.objects:=New object:C1471
		$IO.objects.from:=$IO.form.from+"ObjectMethods\\"
		$IO.objects.to:=$IO.form.to+"ObjectMethods\\"
		
		If (Test path name:C476($THAT.path.form)=Is a folder:K24:2)
			If (Test path name:C476($THIS.path.form)#Is a folder:K24:2)
				CREATE FOLDER:C475($THIS.path.form)
			End if 
		End if 
		
		If (Test path name:C476($IO.form.to)#Is a folder:K24:2)
			CREATE FOLDER:C475($IO.form.to)
		End if 
		
		DOCUMENT LIST:C474($IO.form.from; $atFilesA)
		$sizeK:=Size of array:C274($atFilesA)
		For ($k; 1; $sizeK)
			If (Test path name:C476($IO.form.to+$atFilesA{$k})=Is a document:K24:1)
				DELETE DOCUMENT:C159($IO.form.to+$atFilesA{$k})
			End if 
			COPY DOCUMENT:C541($IO.form.from+$atFilesA{$k}; $IO.form.to+$atFilesA{$k})
		End for 
		
		If (Test path name:C476($IO.objects.from)=Is a folder:K24:2)
			If (Test path name:C476($IO.objects.to)#Is a folder:K24:2)
				CREATE FOLDER:C475($IO.objects.to)
			End if 
			DOCUMENT LIST:C474($IO.objects.from; $atFilesB)
			$sizeK:=Size of array:C274($atFilesB)
			For ($k; 1; $sizeK)
				If (Test path name:C476($IO.objects.to+$atFilesB{$k})=Is a document:K24:1)
					DELETE DOCUMENT:C159($IO.objects.to+$atFilesB{$k})
				End if 
				COPY DOCUMENT:C541($IO.objects.from+$atFilesB{$k}; $IO.objects.to+$atFilesB{$k})
			End for 
		End if 
		
	End for 
	
	ALERT:C41("4DCのソースを当プロジェクトに統合しました。4DCコンポーネントを削除して再起動してください。")
	
End if 
