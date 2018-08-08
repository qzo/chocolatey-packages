$packageName = 'find-and-run-robot.install'
$installerType = 'exe'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotSetup.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)
$checksum = '0b9db29f0c5b32d44a5738c16541ed5f7a29ff00'
$checksumType = 'sha1'

Install-ChocolateyPackage $packageName $installerType $silentArgs $url `
    -validExitCodes $validExitCodes -Checksum $checksum -ChecksumType $checksumType
