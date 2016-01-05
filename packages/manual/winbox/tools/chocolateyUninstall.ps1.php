<?php require '../vars.inc'; ?>
$startFolder = 'WinBox'

Function RemoveStartMenuShortcut {
    $startMenuFolderPath = Join-Path -Path ([Environment]::GetFolderPath('Programs')) `
        -ChildPath $startFolder
    Remove-Item $startMenuFolderPath -Recurse -Force -Confirm:$FALSE -ErrorAction SilentlyContinue
}

# SCRIPT STARTS HERE #

Stop-Process -Name '<?php echo PROCESS_NAME; ?>' -ErrorAction SilentlyContinue
RemoveStartMenuShortcut
