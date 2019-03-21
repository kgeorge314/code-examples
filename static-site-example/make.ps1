Write-Verbose 'Create GUID'
$shortGUID = $([guid]::NewGuid().Guid.Substring(0,5).toLower())
$filePath = "$PSScriptRoot\create-static-side.azcli"
Write-Verbose 'Get file content'
$fileContent = Get-Content -Path $filePath 

Write-Verbose 'Replace [shortguid] with calculated GUID'
$fileContent = $fileContent.Replace(' $BlobStorageAccountName '," web000$shortGUID ")

Write-Verbose 'Write Result back to the file.'
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($filePath, $fileContent , $Utf8NoBomEncoding)