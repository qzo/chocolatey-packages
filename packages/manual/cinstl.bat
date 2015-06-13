@REM Run "cinstl 'package'" (f.i. "cinstl autover") to install a package from
@REM this directory. It's the same as calling "cinst 'package' -fdv -s "%%cd%%"

@ECHO OFF

IF "%1"=="" (
    ECHO You must supply a package name
    EXIT /B 1
)

SET ScriptDir=%~dp0
SET PackageDir=%~dp0%1
SET StartDir=%cd%

CD /D %PackageDir%
IF ERRORLEVEL 1 (
    ECHO The package directory doesn't exist
    EXIT /B 1
)
CD /D %ScriptDir%

cinst %1 -fdv -s "%cd%"

CD /D %StartDir%
