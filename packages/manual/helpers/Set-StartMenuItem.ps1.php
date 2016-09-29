<?php require dirname(__FILE__) . './Add-StartMenuItem.ps1' ?>

<?php require dirname(__FILE__) . './Remove-StartMenuItem.ps1' ?>

function Set-StartMenuItem {

    Param(
      [string]$startDirName,
      [array]$items,
      [string]$appDir
    )

    Remove-StartMenuItem -startDirName $startDirName
    Add-StartMenuItem -startDirName $startDirName -items $items -appDir $appDir

}
