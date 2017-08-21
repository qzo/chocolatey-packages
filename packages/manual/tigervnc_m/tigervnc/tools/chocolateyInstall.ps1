$packageName = 'tigervnc'
$installerType = 'exe'
$url32 = 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.7.1.exe'
$url64 = 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc64-1.7.1.exe'
$checksum32 = 'e339062ab3a04dfd37f1442efb34100141f0c13b'
$checksum64 = '94360e688f7964b684f24c4b5f359e1053957a51'
$checksumType = 'sha1'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url32 `
    $url64 -validExitCodes $validExitCodes -checksum $checksum32 `
    -checksumType $checksumType -checksum64 $checksum64 `
    -checksumType64 $checksumType
