param(
    [Parameter(Mandatory)]
    [string] $FilePath,
    [Parameter(Mandatory)]
    [string] $Name,
    [Parameter(Mandatory)]
    [string] $Value
)

if (!(Test-Path $FilePath) ){
    throw "File does not exist'"
}

$cfg = [xml](Get-Content $FilePath)

if ($cfg -eq $null){
    throw "XML File Configuration does not loaded"
}
else
{
    $conn = $cfg.configuration.connectionStrings.add|?{$_.name -eq $Name }

    if ($conn -eq $null){
        throw "ConnectionString does not exist in Configuration'"
    }
    else
    {
        $conn.connectionString = $Value
        Write-Host "ConnectionString `"$Name`" updated!" -ForegroundColor Green
        $cfg.Save($FilePath)
    }
}