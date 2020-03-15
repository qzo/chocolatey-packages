$packageName = 'find-and-run-robot.portable'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotPortable.zip'
$checksum = 'd4cf6a9fae371fb1ed2e17de559e86c14c53f906b3a78123d7e02034c23f91895bb58f215897d5fd744b2feb156855d29fac0935da301f7e99ce8d151c471655'
$checksumType = 'sha512'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$processName = 'FindAndRunRobot'

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Install-ChocolateyZipPackage $packageName $url $unzipLocation -Checksum $checksum -ChecksumType $checksumType

New-Item -Path $unzipLocation -Name ($processName + '.exe.gui') -ItemType file
