$packageName = 'autover'
$installerType = 'exe'
$url = 'http://beanland.net.au/autover/AutoVer-setup.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)
$checksum = '732aebe6b33a043888158fec5b473be37cb57da1'
$checksumType = 'sha1'

$serviceName = 'AutoVerService'
$running = 'Running'

# Stops AutoVer process and service
Function AutoVerStop {
    $processName = $packageName
    Stop-Process -Name $processName -ErrorAction SilentlyContinue

    $serviceStopped = $FALSE
    $service = Get-Service $serviceName -ErrorAction SilentlyContinue
    If ($service -and ($service.Status -eq $running)) {
        try {
            $service.Stop()
            $serviceStopped = $TRUE
        } catch {
            Write-Warning "The running AutoVer service couldn't be stopped"
        }
    }

    Return $serviceStopped
}

# Starts AutoVer service (the process is started automatically after install)
Function AutoVerStartService {
    $Service = Get-Service $serviceName -ErrorAction SilentlyContinue
    If ($Service -and ($Service.Status -ne $running)) {
        try {
            $Service.Start()
        } catch {
            Write-Warning "The AutoVer service couldn't be started"
        }
    }
}

# SCRIPT STARTS HERE #

# According to the installer, AutoVer (and its service) must not be running,
# otherwise a restart is needed after the installation
$serviceStopped = AutoVerStop

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" `
    -validExitCodes $validExitCodes -Checksum $checksum -ChecksumType $checksumType

If ($serviceStopped) {
    AutoVerStartService
}
