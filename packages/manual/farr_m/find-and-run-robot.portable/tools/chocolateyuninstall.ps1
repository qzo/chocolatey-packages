$packageName = 'find-and-run-robot.portable'
$fileName = 'FindAndRunRobotPortable.zip'

$processName = 'FindAndRunRobot'

Stop-Process -Name $processName -ErrorAction SilentlyContinue

UnInstall-ChocolateyZipPackage $packageName $fileName
