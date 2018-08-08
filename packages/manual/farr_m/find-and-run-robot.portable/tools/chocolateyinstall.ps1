$packageName = 'find-and-run-robot.portable'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotPortable.zip'
$checksum = 'fea48e21e92b7704b23591e960461da9475a4a8b'
$checksumType = 'sha1'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$processName = 'FindAndRunRobot'

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Install-ChocolateyZipPackage $packageName $url $unzipLocation -Checksum $checksum -ChecksumType $checksumType

New-Item -Path $unzipLocation -Name ($processName + '.exe.gui') -ItemType file
