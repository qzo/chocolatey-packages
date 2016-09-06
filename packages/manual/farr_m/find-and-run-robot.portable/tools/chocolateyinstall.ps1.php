<?php require '../../checksums.inc'; ?>
$packageName = 'find-and-run-robot.portable'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotPortable.zip'
$checksum = '<?php echo CHECKSUM_PORTABLE; ?>'
$checksumType = '<?php echo CHECKSUM_TYPE; ?>'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$processName = 'FindAndRunRobot'

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Install-ChocolateyZipPackage $packageName $url $unzipLocation -Checksum $checksum -ChecksumType $checksumType

New-Item -Path $unzipLocation -Name ($processName + '.exe.gui') -ItemType file
