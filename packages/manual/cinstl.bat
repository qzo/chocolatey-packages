@REM Run "cinstl 'package'" (f.i. "cinstl autover" or
@REM "cinstl farr_m\find-and-run-robot") to install a package using an nuspec
@REM file in that directory.
@REM It's the same as calling "cinst 'package' -fdv -s "%%cd%%" -y"
@REM from inside the package directory
@REM Up to eight additional parameters can be entered after the
@REM package / directory name (f.i. "cinstl higan --x86")

@ECHO OFF

IF "%1"=="" (
    ECHO You must supply a directory name
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

FOR /F %%i IN ('DIR *.nuspec /B') DO SET Package=%%~ni

cinst %Package% -fdv -s "%cd%" -y %2 %3 %4 %5 %6 %7 %8 %9

CD /D %StartDir%
