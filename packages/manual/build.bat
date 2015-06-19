@REM Run "build 'package'" (f.i. "build autover" or
@REM "build farr\find-and-run-robot") to process PHP files (if there are any)
@REM and build the specified NuGet package using cpack
@REM
@REM More packages can be built using one command if they are put in a directory
@REM whose name ends in "_m" (f.i. "build farr_m)

@ECHO OFF

IF "%1"=="" (
    ECHO You must supply a directory name
    EXIT /B 1
)

SET PackageDir=%~dp0%1
SET StartDir=%cd%

CD /D %PackageDir%
IF ERRORLEVEL 1 (
    ECHO The package directory (%1^) doesn't exist, exiting...
    EXIT /B 1
)

ECHO. & ECHO Processing PHP files... & ECHO.
FOR /F %%a IN ('DIR *.php /B/S ^| FINDSTR /LIE ".php"') DO (
    CD /D %%~da%%~pa
    php -d short_open_tag=0 %%~a > %%~na
    CD /D %PackageDir%
)

IF "%PackageDir:~-2%"=="_m" (
    ECHO Processing all packages in the directory %1...
    FOR /F %%d IN ('DIR /A:D /B') do (
        CD /D %%d
        IF EXIST %%d.nuspec (
            ECHO. & ECHO Creating Chocolatey package (%%d^)... & ECHO.
            cpack
        )
        CD /D %PackageDir%
    )
) ELSE (
    ECHO Creating Chocolatey package (%1^)... & ECHO.
    cpack
)

CD /D %StartDir%
