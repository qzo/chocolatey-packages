$packageName = 'find-and-run-robot.portable'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotPortable.zip'
$checksum = '3183e972bf5d22e0051c1c5907aad3dc58206ce4'
$checksumType = 'sha1'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$processName = 'FindAndRunRobot'

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Install-ChocolateyZipPackage $packageName $url $unzipLocation -Checksum $checksum -ChecksumType $checksumType

New-Item -Path $unzipLocation -Name ($processName + '.exe.gui') -ItemType file
