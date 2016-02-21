function Uninstall-Application {
    Param(
        [string]$packageName,
        [string]$installerType,
        [string]$registryUninstallerKey32,
        [string]$registryUninstallerKey64,
        [string]$silentArgs,
        [string]$validExistCodes
    )
    $regPath32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKey32"
    $regPath64 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKey64"
    $regPathWow6432 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKey32"

    $actualPath = If (Test-Path $regPath64) { $regPath64 } `
        ElseIf (Test-Path $regPath32) { $regPath32 } `
        ElseIf (Test-Path $regPathWow6432) { $regPathWow6432 } Else { $FALSE }
    $uninstallerPath =
        If ($actualPath) {
            (Get-ItemProperty -Path $actualPath -ErrorAction SilentlyContinue).UninstallString
        } Else { $FALSE }

    If ($uninstallerPath) {
        Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType `
            -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $uninstallerPath
    }
    Else {
        Write-Warning "The registry uninstall data couldn't be found."
    }
}
