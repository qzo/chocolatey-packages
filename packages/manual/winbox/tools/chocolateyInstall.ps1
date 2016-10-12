$packageName = 'winbox'
$appName = 'WinBox'
$url = 'http://download2.mikrotik.com/routeros/winbox/3.7/winbox.exe'
$dir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$exe = $packageName + '.exe'
$fullPath = Join-Path -Path $dir -ChildPath $exe
$checksum = 'a91dd01f5389cc44d0b4b8b796204f1fbd616d1c'
$checksumType = 'sha1'

$startFolder = $appName
$processName = 'winbox'

Function CreateStartMenuShortcut {
    $startMenuFolderPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startFolder
    New-Item $startMenuFolderPath -Type Directory -ErrorAction SilentlyContinue
    If (Test-Path -Path $startMenuFolderPath -PathType Container) {
            Install-ChocolateyShortcut -shortcutFilePath `
                (Join-Path -Path $startMenuFolderPath -ChildPath ($appName + '.lnk')) `
                -targetPath $fullPath -workingDirectory $dir
    } Else {
        Write-Warning "Start menu folder couldn't be created."
    }
}

# SCRIPT STARTS HERE #

Stop-Process -Name $processName -ErrorAction SilentlyContinue

# Workaround for https://github.com/chocolatey/choco/issues/952
Remove-Item -Path $fullPath -Force -Confirm:$FALSE -ErrorAction SilentlyContinue

Get-ChocolateyWebFile -packageName $packageName -fileFullPath $fullPath -url $url -checksum $checksum -checksumType $checksumType

# create .gui file
New-Item -Path $dir -Name ($exe + '.gui') -ItemType file

CreateStartMenuShortcut

