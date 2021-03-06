﻿<?php require '../vars.inc'; ?>
$packageName = 'tigervnc-viewer'
$appName = 'TigerVNC Viewer'
$processName = 'vncviewer*'

$is64 = ((Get-ProcessorBits 64) -and !$env:chocolateyForceX86)
$url32 = '<?php echo URL32; ?>'
$url64 = '<?php echo URL64; ?>'
$url = If ($is64) { $url64 } Else { $url32 }
$fileName = $url.SubString($url.LastIndexOf('=') + 1)
$checksum32 = '<?php echo CHECKSUM32; ?>'
$checksum64 = '<?php echo CHECKSUM64; ?>'
$checksumType = 'sha512'

$dir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$fullPath = Join-Path -Path $dir -ChildPath $fileName
$startDirName = $appName
$startDirItems = @( @{Name = $appName; File = $fileName } )

<?php require '../../../helpers/Set-StartMenuItem.ps1.php'; ?>

# EXECUTION STARTS HERE #

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Get-ChocolateyWebFile -packageName $packageName -fileFullPath $fullPath -url $url32 -url64bit $url64 -checksum $checksum32 -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType

# create .gui file
New-Item -Path $dir -Name ($fileName + '.gui') -ItemType file

Set-StartMenuItem -startDirName $appName -items $startDirItems -appDir $dir
