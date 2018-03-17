$packageName = 'tigervnc'
$installerType = 'exe'
$url32 = 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.8.0.exe'
$url64 = 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc64-1.8.0.exe'
$checksum32 = '3b6d87b810647d275082ba023977cb35236ee3b5'
$checksum64 = 'f6ce938ee99fe5c1ca246628725065f438ef092c'
$checksumType = 'sha1'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url32 `
    $url64 -validExitCodes $validExitCodes -checksum $checksum32 `
    -checksumType $checksumType -checksum64 $checksum64 `
    -checksumType64 $checksumType
