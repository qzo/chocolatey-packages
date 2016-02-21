$processName = 'vncviewer*'
$startDirName = 'TigerVNC Viewer'

function Remove-StartMenuItem {

    Param(
      [string]$startDirName
    )

    $startMenuDirPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startDirName
    Remove-Item -Path $startMenuDirPath -Recurse -Force -Confirm:$FALSE -ErrorAction SilentlyContinue

}

# EXECUTION STARTS HERE #

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Remove-StartMenuItem -startDirName $startDirName
