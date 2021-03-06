﻿<?php require '../vars.inc'; ?>
$packageName = 'higan'
$dir32 = 'higan_v094-32bit'
$dir64 = '<?php echo DIR64; ?>'
$is64 = ((Get-ProcessorBits 64) -and !$env:chocolateyForceX86)
$dir = If ($is64) { $dir64 } Else { $dir32 }
$url32 = 'http://files.byuu.org/download/higan_v094-32bit.7z'
$url64 = '<?php echo URL64; ?>'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$checksum32 = '16a4703d0d2abbd2f62c0f456cb2a74573c6e63b'
$checksum64 = '<?php echo CHECKSUM64; ?>'
$checksumType = 'sha1'
$higanExecutables32 = @('higan-balanced', 'higan-accuracy', 'higan-performance')
$higanExecutables64 = @('higan-balanced', 'higan-accuracy', 'higan-performance', 'icarus')
$higanExecutables = If ($is64) { $higanExecutables64 } Else { $higanExecutables32 }

$startFolder = $packageName
$path = Join-Path -Path $unzipLocation -ChildPath $dir

Function CreateStartMenuShortcuts {
    $startMenuFolderPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startFolder
    $startMenuFolder = New-Item $startMenuFolderPath -Type Directory `
        -ErrorAction SilentlyContinue
    If ($startMenuFolder) {
        ForEach ($executable in $higanExecutables) {
            Install-ChocolateyShortcut -shortcutFilePath `
                (Join-Path -Path $startMenuFolderPath -ChildPath ($executable + '.lnk')) `
                -targetPath (Join-Path -Path $path -ChildPath ($executable + '.exe')) `
                -workingDirectory $path
        }
    } Else {
        Write-Warning "Start menu folder couldn't be created."
    }
}

# SCRIPT STARTS HERE #

ForEach ($executable in $higanExecutables) `
    { Stop-Process -Name $executable -ErrorAction SilentlyContinue }

Install-ChocolateyZipPackage $packageName $url32 $unzipLocation $url64 `
    -checksum $checksum32 -checksumType $checksumType -checksum64 $checksum64

# create .gui files
$higanExecutables | ForEach-Object `
    { New-Item -Path $path -Name ($_ + '.exe.gui') -ItemType file }

# remember which version is installed
If ($is64) { New-Item -Path $env:chocolateyPackageFolder -Name '64' -ItemType file }

CreateStartMenuShortcuts

