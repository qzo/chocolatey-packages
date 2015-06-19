$packageName = 'find-and-run-robot.install'
$registryUninstallerKeyName = 'Find and Run Robot_is1'
$installerType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
$validExitCodes = @(0)

$processName = 'FindAndRunRobot'

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"
$regPathWow6432 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"

$actualPath = If (Test-Path $regPath) { $regPath } `
    ElseIf (Test-Path $regPathWow6432) { $regPathWow6432} Else { $FALSE }
$uninstallerPath =
    If ($actualPath) {
        (Get-ItemProperty -Path $actualPath -ErrorAction SilentlyContinue).UninstallString
    } Else { $FALSE }

If ($uninstallerPath) {
    Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType `
        -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $uninstallerPath
}
Else
{
    Write-Warning "The registry uninstall data couldn't be found."
}
