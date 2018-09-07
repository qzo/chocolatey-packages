$packageName = 'tigervnc'
$installerType = 'exe'
$url32 = 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.9.0.exe'
$url64 = 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc64-1.9.0.exe'
$checksum32 = 'eccaace0d1ad16a556ad4969245f09ca4b85a00c'
$checksum64 = 'a687208ca2148ab98ab0a065c1260e9bafda37c0'
$checksumType = 'sha1'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url32 `
    $url64 -validExitCodes $validExitCodes -checksum $checksum32 `
    -checksumType $checksumType -checksum64 $checksum64 `
    -checksumType64 $checksumType
