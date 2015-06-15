$packageName = 'higan'
$baseUrl = 'http://files.byuu.org/download/'
$name32 = 'higan_v094-32bit'
$name64 = 'higan_v094-64bit'
$dir = If (Get-ProcessorBits 64) { $name64 } Else { $name32 }
$url = $baseUrl + $name32 + '.7z'
$url64 = $baseUrl + $name64 + '.7z'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$checksum = '16a4703d0d2abbd2f62c0f456cb2a74573c6e63b'
$checksum64 = 'b525aecd2604dcae5251d51b13d7ceb7f4a32489'
$checksumType = 'sha1'
$higanVariants = @('higan-balanced', 'higan-accuracy', 'higan-performance')

$startFolder = $packageName
$path = Join-Path -Path $unzipLocation -ChildPath $dir

Function CreateStartMenuShortcuts {
    $startMenuFolderPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startFolder
    $startMenuFolder = New-Item $startMenuFolderPath -Type Directory `
        -ErrorAction SilentlyContinue
    If ($startMenuFolder) {
        ForEach ($variant in $higanVariants) {
            Install-ChocolateyShortcut -shortcutFilePath `
                (Join-Path -Path $startMenuFolderPath -ChildPath ($variant + '.lnk')) `
                -targetPath (Join-Path -Path $path -ChildPath ($variant + '.exe')) `
                -workingDirectory $path
        }
    } Else {
        Write-Warning "Start menu folder couldn't be created."
    }
}

# SCRIPT STARTS HERE #

ForEach ($variant in $higanVariants) `
    { Stop-Process -Name $variant -ErrorAction SilentlyContinue }

Install-ChocolateyZipPackage $packageName $url $unzipLocation $url64 `
    -checksum $checksum -checksumType $checksumType -checksum64 $checksum64

# create .gui files
$higanVariants | ForEach-Object `
    { New-Item -Path $path -Name ($_ + '.exe.gui') -ItemType file }

CreateStartMenuShortcuts

