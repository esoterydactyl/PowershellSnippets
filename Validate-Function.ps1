#This function tests a file to determine whether it is a powershell function.
#This is intended to be used in metaprogramming cases- specifically in the "Convert-FunctionsToModule" case.
function validate-function($FilePath)
    {        
        $Exists = Test-Path $FilePath
        
        if($Exists -eq $true)
        {
            $FileObj = get-item $FilePath -ErrorAction SilentlyContinue
            $Extension = $FileObj.Extension
            $FileContents = Get-Content $FilePath|?{$_ -notmatch "^\n.*\s.+"}
            $startsWithFunction = ($FileContents|select -first 1) -imatch "^function\s\D.+"
            $LastLine = $FileContents|?{$_ -notlike " " -and $_ -notlike $null} |select -last 1
            $EndsWithCurlyBrace = $LastLine -like "*}"
            
        }
    }