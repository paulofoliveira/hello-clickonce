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
    $key = $cfg.configuration.appSettings.add|?{$_.key -eq $Name }

    if ($key -eq $null){
        throw "AppSettings does not exist in Configuration'"
    }
    else
    {
        $key.value = $Value
        Write-Host "AppSetting `"$Name`" updated!" -ForegroundColor Green
        $cfg.Save($FilePath)
    }
}