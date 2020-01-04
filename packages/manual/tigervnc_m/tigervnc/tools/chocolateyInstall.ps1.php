<?php require '../vars.inc'; ?>
$packageName = 'tigervnc'
$installerType = 'exe'
$url32 = '<?php echo URL32; ?>'
$url64 = '<?php echo URL64; ?>'
$checksum32 = '<?php echo CHECKSUM32; ?>'
$checksum64 = '<?php echo CHECKSUM64; ?>'
$checksumType = 'sha512'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url32 `
    $url64 -ValidExitCodes $validExitCodes -Checksum $checksum32 `
    -ChecksumType $checksumType -Checksum64 $checksum64 `
    -ChecksumType64 $checksumType
