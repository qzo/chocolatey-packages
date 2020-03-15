$packageName = 'find-and-run-robot.install'
$installerType = 'exe'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotSetup.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)
$checksum = '6a71f9218c4c14c0c2e9024b56ec474bbc84e67e9d4e01db1bd6aef226c75d4051f00b4fe55192c9947729d4c8aaa510a441e0c16f06c99a0e8d1300d908e392'
$checksumType = 'sha512'

Install-ChocolateyPackage $packageName $installerType $silentArgs $url `
    -validExitCodes $validExitCodes -Checksum $checksum -ChecksumType $checksumType
