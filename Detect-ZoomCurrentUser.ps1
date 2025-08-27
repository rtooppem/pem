[System.Collections.ArrayList]$UserArray = (Get-ChildItem C:\Users\).Name
$UserArray.Remove('Public')
 
Foreach($obj in $UserArray){
    $Parent  = "$env:SystemDrive\users\$obj\Appdata\Roaming"
    $Path = Test-Path -Path (Join-Path $Parent 'zoom\bin\zoom.exe')

    if($Path){
        "Zoom is installed for user $obj"
	exit 1
    }

    else{
        "Zoom is not installed for user $obj"
    }
}