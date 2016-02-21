$packageName = 'tigervnc'
$installerType = 'exe'
$url32 = 'https://bintray.com/artifact/download/tigervnc/stable/tigervnc-1.6.0.exe'
$url64 = 'https://bintray.com/artifact/download/tigervnc/stable/tigervnc64-1.6.0.exe'
$checksum32 = 'e8c69f7be9f84d9b574746655d4d44f63068348b'
$checksum64 = '72b763986e9fbd76adf156b2eed10052dff25c37'
$checksumType = 'sha1'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url32 `
    $url64 -validExitCodes $validExitCodes -checksum $checksum32 `
    -checksumType $checksumType -checksum64 $checksum64 `
    -checksumType64 $checksumType
