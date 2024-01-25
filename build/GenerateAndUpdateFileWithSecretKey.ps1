param(
    [Parameter(Mandatory)]
    [string] $FilePath,
    [int] $Length = 16,
    [string] $Template = "## SECRET HERE ##"
)

function Generate-RandomPassword {
    param (
        [Parameter(Mandatory)]
        [int] $Length
    )
 
    $charSet = '<>,:?[]~abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*()-+='.ToCharArray()
 
    $rng = New-Object System.Security.Cryptography.RNGCryptoServiceProvider
    $bytes = New-Object byte[]($length)
  
    $rng.GetBytes($bytes)
  
    $result = New-Object char[]($length)
  
    for ($i = 0 ; $i -lt $length ; $i++) {
        $result[$i] = $charSet[$bytes[$i]%$charSet.Length]
    }
 
    return -join $result
}

$secretKey = Generate-RandomPassword -Length $Length

$allText = [System.IO.File]::ReadAllText($FilePath)
[System.IO.File]::WriteAllText($FilePath, $allText.Replace($Template, $secretKey))

Write-Host "$FilePath updated with SecretKey!" -ForegroundColor Green

return $secretKey

<# READ ME MORE: 

- https://stackoverflow.com/questions/13509532/how-to-find-and-replace-text-in-a-file
- https://www.sharepointdiary.com/2020/04/powershell-generate-random-password.html

#>