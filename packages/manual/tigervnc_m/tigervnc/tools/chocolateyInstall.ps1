$packageName = 'tigervnc'
$installerType = 'exe'
$url32 = 'https://bintray.com/artifact/download/tigervnc/stable/tigervnc-1.7.0.exe'
$url64 = 'https://bintray.com/artifact/download/tigervnc/stable/tigervnc64-1.7.0.exe'
$checksum32 = 'eb0dd84855e5d388986fc95daede4055ee09bb34'
$checksum64 = '114f95c4dc692f46dcf205620f9947ae61bd3890'
$checksumType = 'sha1'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url32 `
    $url64 -validExitCodes $validExitCodes -checksum $checksum32 `
    -checksumType $checksumType -checksum64 $checksum64 `
    -checksumType64 $checksumType
