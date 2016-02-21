$processName = 'vncviewer*'
$startDirName = 'TigerVNC Viewer'

<?php require '../../../helpers/Remove-StartMenuItem.ps1'; ?>

# EXECUTION STARTS HERE #

Stop-Process -Name $processName -ErrorAction SilentlyContinue

Remove-StartMenuItem -startDirName $startDirName
