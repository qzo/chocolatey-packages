<?php require 'vars.inc'; ?>
<?xml version="1.0" encoding="utf-8"?>
<!-- Do not remove this test for UTF-8: if “Ω” doesn’t appear as greek uppercase omega letter enclosed in quotation marks, you should use an editor that supports UTF-8, not this one. -->
<package xmlns="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd">
  <metadata>
    <!-- Read this before publishing packages to chocolatey.org: https://github.com/chocolatey/chocolatey/wiki/CreatePackages -->
    <id>higan</id>
    <title>higan</title>
    <version><?php echo VERSION; ?></version>
    <authors>byuu et al.</authors>
    <owners>qzo</owners>
    <summary>Higan is a Nintendo multi-system emulator.</summary>
    <description>
Higan is a Nintendo multi-system emulator that began development on 2014-10-14. It currently supports the following systems: Famicom, Super Famicom, Game Boy, Game Boy Color, Game Boy Advance. Higan also supports the following subsystems: Super Game Boy, BS-X Satellaview, Sufami Turbo.

Note: The last and final version for 32-bit systems is 1.0.094.
    </description>
    <projectUrl>http://byuu.org/emulation/higan/</projectUrl>
    <tags>higan bsnes emulator emulation games gaming nintendo nes snes famicom super-famicom game-boy game-boy-color game-boy-advance</tags>
    <licenseUrl>http://byuu.org/emulation/higan/licensing</licenseUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <iconUrl>https://cdn.rawgit.com/qzo/chocolatey-packages/bc98320d99aedf6debf9080b6ece383aee36c0ec/icons/higan.png</iconUrl>
    <packageSourceUrl>https://github.com/qzo/chocolatey-packages/tree/master/packages/manual/higan</packageSourceUrl>
    <projectSourceUrl><?php echo PROJECT_SOURCE_URL; ?></projectSourceUrl>
    <dependencies>
      <dependency id="chocolatey" version="0.9.9" /> <!-- Install-ChocolateyShortcut required -->
    </dependencies>
  </metadata>
  <files>
    <file src="tools\*.*" target="tools" exclude="**\*.swp;**\*~;**\*.php" />
  </files>
</package>
