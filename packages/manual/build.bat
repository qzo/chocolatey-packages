@REM Run "build 'package'" (f.i. "build autover") to check for Vim's swap files,
@REM remove Vim's backup and undo files and then build the specified package

@ECHO OFF

IF "%1"=="" (
    ECHO You must supply a package name
    EXIT /B 0
)

SET PackageDir=%~dp0%1
SET StartDir=%cd%

CD /D %PackageDir%

ECHO Checking for Vim swap files... & @ECHO.
DIR *.sw? /B/S /AH
IF NOT ERRORLEVEL 1 (
    ECHO Found Vim swap file(s^) (see above^), exiting...
    CD /D %StartDir%
    EXIT /B 1
)

ECHO Deleting Vim undo and backup files... & @ECHO.
DEL /F/S/Q *~

ECHO Creating Chocolatey package... & @ECHO.
cpack

CD /D %StartDir%
