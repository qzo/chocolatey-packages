function Add-StartMenuItem {

    Param(
      [string]$startDirName,
      [array]$items,
      [string]$appDir
    )

    $startMenuDirPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startDirName
    $startMenuDir = New-Item $startMenuDirPath -Type Directory `
        -ErrorAction SilentlyContinue
    If ($startMenuDir) {
        ForEach ($item in $items) {
            Install-ChocolateyShortcut -shortcutFilePath `
                (Join-Path -Path $startMenuDirPath -ChildPath ($item.Name + '.lnk')) `
                -targetPath (Join-Path -Path $appDir -ChildPath ($item.File)) `
                -workingDirectory $appDir
        }
    } Else {
        Write-Warning "Start menu folder couldn't be created."
    }

}
