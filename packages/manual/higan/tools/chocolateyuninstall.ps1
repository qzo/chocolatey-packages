$packageName = 'higan'
$fileName32 = 'higan_v094-32bit.7z'
$fileName64 = 'higan_v094-64bit.7z'
$fileName = If (Get-ProcessorBits 64) { $fileName64 } Else { $fileName32 }
$startFolder = $packageName

Function StopProcesses {
    Stop-Process -Name 'higan-accuracy' -ErrorAction SilentlyContinue
    Stop-Process -Name 'higan-balanced' -ErrorAction SilentlyContinue
    Stop-Process -Name 'higan-performance' -ErrorAction SilentlyContinue
}

Function RemoveStartMenuShortcuts {
    $startMenuFolderPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startFolder
    Remove-Item $startMenuFolderPath -Recurse -Force -Confirm:$FALSE -ErrorAction SilentlyContinue
}

# SCRIPT STARTS HERE #

StopProcesses

UnInstall-ChocolateyZipPackage $packageName $fileName

RemoveStartMenuShortcuts
