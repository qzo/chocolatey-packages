$packageName = 'find-and-run-robot.install'
$installerType = 'exe'
$url = 'http://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotSetup.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url `
    -validExitCodes $validExitCodes
