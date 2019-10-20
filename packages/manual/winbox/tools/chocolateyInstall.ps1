$packageName = 'winbox'
$appName = 'WinBox'
$url32 = 'https://mt.lv/winbox'
$url64 = 'https://mt.lv/winbox64'
$dir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$is64 = ((Get-ProcessorBits 64) -and !$env:chocolateyForceX86)
$processName32 = 'winbox'
$processName64 = 'winbox64'
$processName = If ($is64) { $processName64 } Else { $processName32 }
$exe = $processName + '.exe'
$fullPath = Join-Path -Path $dir -ChildPath $exe
$checksum32 = 'a4dc2e4922b2048006fe0b6c5ec44785a2a38f3442d6090412b0f6b3f0ef44c79a7a3296c5dd2ec532d22cb7b55d5b97d61b355d54a5774212ec69920e7101c5'
$checksum64 = 'febeee6fe9f1375f7deffc7200ad771c045bc6cc8a895ec255330b7111a1288af7e60f77c7b423f772ce6d7dd9d7ed0a0962b34b175a2d653b23d0b2b431c5d0'
$checksumType = 'sha512'

$startFolder = $appName

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

Stop-Process -Name $processName32 -ErrorAction SilentlyContinue
Stop-Process -Name $processName64 -ErrorAction SilentlyContinue

# Workaround for https://github.com/chocolatey/choco/issues/952
Remove-Item -Path $fullPath -Force -Confirm:$FALSE -ErrorAction SilentlyContinue

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fullPath -Url $url32 -Url64bit $url64 -Checksum $checksum32 -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $ChecksumType

# create .gui file
New-Item -Path $dir -Name ($exe + '.gui') -ItemType file

CreateStartMenuShortcut

