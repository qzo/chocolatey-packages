$packageName = 'tigervnc-viewer'
$appName = 'TigerVNC Viewer'
$processName = 'vncviewer*'

$is64 = ((Get-ProcessorBits 64) -and !$env:chocolateyForceX86)
$url32 = 'https://bintray.com/tigervnc/stable/download_file?file_path=vncviewer-1.8.0.exe'
$url64 = 'https://bintray.com/tigervnc/stable/download_file?file_path=vncviewer64-1.8.0.exe'
$url = If ($is64) { $url64 } Else { $url32 }
$fileName = $url.SubString($url.LastIndexOf('=') + 1)
$checksum32 = 'b698bbb1427352ec1debe8e24f9ad8aea77f0954'
$checksum64 = '114f2b2f0b642d50b2e4eca80aeaae9042824961'
$checksumType = 'sha1'

$dir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$fullPath = Join-Path -Path $dir -ChildPath $fileName
$startDirName = $appName
$startDirItems = @( @{Name = $appName; File = $fileName } )

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

function Remove-StartMenuItem {

    Param(
      [string]$startDirName
    )

    $startMenuDirPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startDirName
    Remove-Item -Path $startMenuDirPath -Recurse -Force -Confirm:$FALSE -ErrorAction SilentlyContinue

}

function Set-StartMenuItem {

    Param(
      [string]$startDirName,
      [array]$items,
      [string]$appDir
    )

    Remove-StartMenuItem -startDirName $startDirName
    Add-StartMenuItem -startDirName $startDirName -items $items -appDir $appDir

}

# EXECUTION STARTS HERE #

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Get-ChocolateyWebFile -packageName $packageName -fileFullPath $fullPath -url $url32 -url64bit $url64 -checksum $checksum32 -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType

# create .gui file
New-Item -Path $dir -Name ($fileName + '.gui') -ItemType file

Set-StartMenuItem -startDirName $appName -items $startDirItems -appDir $dir
