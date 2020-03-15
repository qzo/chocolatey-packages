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
$checksum32 = 'dcf3f840c83b73efa02c6d07c353d3a2e29f8d2a45e35d7c192ae6247045e3fd1a3c663aefb22ebf10ac4e3ee78fba01a7190e0765627be7d0c32af5d1ffdb78'
$checksum64 = 'b05c38349da12cc2865df6f04b18ff2e4a77080a575718a760860e79b52f724a2cacbe4337d457fa3894ccdc3950ce37f66da565591ed57c58297753df4e8ef2'
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

