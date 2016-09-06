<?php require '../common/common.inc'; ?>
<?xml version="1.0" encoding="utf-8"?>
<!-- Do not remove this test for UTF-8: if “Ω” doesn’t appear as greek uppercase omega letter enclosed in quotation marks, you should use an editor that supports UTF-8, not this one. -->
<package xmlns="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd">
  <metadata>
    <!-- Read this before publishing packages to chocolatey.org: https://github.com/chocolatey/chocolatey/wiki/CreatePackages -->
    <id>find-and-run-robot.install</id>
    <title>Find and Run Robot (Install)</title>
    <version><?php echo VERSION; ?></version>
    <authors><?php echo AUTHORS; ?></authors>
    <owners><?php echo OWNERS; ?></owners>
    <summary><?php echo SUMMARY; ?></summary>
    <description><?php echo DESCRIPTION; ?></description>
    <projectUrl><?php echo PROJECT_URL; ?></projectUrl>
    <tags><?php echo TAGS; ?> admin</tags>
    <licenseUrl><?php echo LICENSE_URL; ?></licenseUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <iconUrl><?php echo ICON_URL; ?></iconUrl>
    <releaseNotes><?php echo RELEASE_NOTES; ?></releaseNotes>
    <packageSourceUrl>https://github.com/qzo/chocolatey-packages/tree/master/packages/manual/farr_m/find-and-run-robot.install</packageSourceUrl>
    <docsUrl><?php echo DOCS_URL; ?></docsUrl>
    <mailingListUrl><?php echo MAILING_LIST_URL; ?></mailingListUrl>
  </metadata>
  <files>
    <file src="tools\*.*" target="tools" exclude="**\*.swp;**\*~;**\*.php" />
  </files>
</package>
