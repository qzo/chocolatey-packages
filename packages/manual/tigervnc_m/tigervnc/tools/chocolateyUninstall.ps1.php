$packageName = 'tigervnc'
$registryUninstallerKey32 = 'TigerVNC_is1'
$registryUninstallerKey64 = 'TigerVNC 64-bit_is1'
$installerType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
$validExitCodes = @(0)

<?php require '../../../helpers/Uninstall-Application.ps1'; ?>

Uninstall-Application -packageName $packageName -installerType $installerType -registryUninstallerKey32 $registryUninstallerKey32 -registryUninstallerKey64 $registryUninstallerKey64 -silentArgs $silentArgs -validExitCodes $validExitCodes
