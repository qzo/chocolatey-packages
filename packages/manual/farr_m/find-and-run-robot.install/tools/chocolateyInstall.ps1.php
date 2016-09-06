<?php require '../../checksums.inc'; ?>
$packageName = 'find-and-run-robot.install'
$installerType = 'exe'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotSetup.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)
$checksum = '<?php echo CHECKSUM_INSTALL; ?>'
$checksumType = '<?php echo CHECKSUM_TYPE; ?>'

Install-ChocolateyPackage $packageName $installerType $silentArgs $url `
    -validExitCodes $validExitCodes -Checksum $checksum -ChecksumType $checksumType
