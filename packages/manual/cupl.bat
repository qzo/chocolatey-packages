@REM Run "cupl 'package'" (f.i. "cupl autover" or
@REM "cupl farr_m\find-and-run-robot") to update a package using an nuspec
@REM file in that directory.
@REM It's the same as calling "cup 'package' -fdv -s "%%cd%%" -y"
@REM from inside the package directory
@REM Up to eight additional parameters can be entered after the
@REM package / directory name (f.i. "cupl higan --version 1.0.096")

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

cup %Package% -fdv -s "%cd%" -y %2 %3 %4 %5 %6 %7 %8 %9

CD /D %StartDir%
