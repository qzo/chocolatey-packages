$packageName = 'tigervnc'
$installerType = 'exe'
$url32 = 'https://sourceforge.net/projects/tigervnc/files/stable/1.12.0/tigervnc-1.12.0.exe/download#'
$url64 = 'https://sourceforge.net/projects/tigervnc/files/stable/1.12.0/tigervnc64-1.12.0.exe/download#'
$checksum32 = 'c879d0ebb587d6a91bf50104046fcda388a533b9e075a7e38febe0a44d0a8fcde7a752622092a59a2964e6615057d7899d75b3ded77d3080d3fae0f55ec0f9b4'
$checksum64 = 'c9a4ae198ba2503d3fe4c70c001d4567a891a68c534ceccf80430976b4a5d767eae8f00a3bda7e24fbbe07ac60a4ee1d1c5836e1e44fc9b52d4b17d64f7e6bc5'
$checksumType = 'sha512'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url32 `
    $url64 -ValidExitCodes $validExitCodes -Checksum $checksum32 `
    -ChecksumType $checksumType -Checksum64 $checksum64 `
    -ChecksumType64 $checksumType
