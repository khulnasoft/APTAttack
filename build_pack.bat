@ECHO OFF
:: APT Attack Build Script

SET BUILD=.\build\
SET ZIP=.\helpers\7z.exe
SET PASS=aptattack
SET ARCHPASS=apt

:: Preperations
MKDIR %BUILD%
:: Remove old package
del /q ./dist/APTAttack_pw_apt.zip
IF ERRORLEVEL 1 (
    ECHO Error: Failed to delete old package.
    EXIT /B 1
)

:: Script
copy APTAttack.bat %BUILD%
IF ERRORLEVEL 1 (
    ECHO Error: Failed to copy APTAttack.bat.
    EXIT /B 1
)
copy welcome.txt %BUILD%
IF ERRORLEVEL 1 (
    ECHO Error: Failed to copy welcome.txt.
    EXIT /B 1
)

:: HELPERS
del /Q %BUILD%\helpers\*.*
IF ERRORLEVEL 1 (
    ECHO Error: Failed to delete old helpers.
    EXIT /B 1
)
xcopy /S /Y .\helpers %BUILD%\helpers\
IF ERRORLEVEL 1 (
    ECHO Error: Failed to copy helpers.
    EXIT /B 1
)

:: TEST SETS
rd %BUILD%\test-sets\ /S /Q
IF ERRORLEVEL 1 (
    ECHO Error: Failed to remove old test sets.
    EXIT /B 1
)
xcopy /S /Y .\test-sets %BUILD%\test-sets\
IF ERRORLEVEL 1 (
    ECHO Error: Failed to copy test sets.
    EXIT /B 1
)

:: TOOLS
:: Compress and encrypt toolset
%ZIP% u -bb3 -t7z -r -mx=9 -mmt=4 -mhe=on -p%PASS% enc-toolset.7z ./toolset/
IF ERRORLEVEL 1 (
    ECHO Error: Failed to compress toolset.
    EXIT /B 1
)
:: Copy it to the build dir
copy enc-toolset.7z %BUILD%
IF ERRORLEVEL 1 (
    ECHO Error: Failed to copy enc-toolset.7z.
    EXIT /B 1
)

:: FILES
:: Compress and encrypt workfiles
%ZIP% u -bb3 -t7z -r -mx=9 -mmt=4 -mhe=on -p%PASS% enc-files.7z ./workfiles/
IF ERRORLEVEL 1 (
    ECHO Error: Failed to compress workfiles.
    EXIT /B 1
)
:: Copy it to the build dir
copy enc-files.7z %BUILD%
IF ERRORLEVEL 1 (
    ECHO Error: Failed to copy enc-files.7z.
    EXIT /B 1
)

:: PACK
ren build APTAttack
IF ERRORLEVEL 1 (
    ECHO Error: Failed to rename build directory.
    EXIT /B 1
)
del /Q APTAttack_pw_nextron.zip
IF ERRORLEVEL 1 (
    ECHO Error: Failed to delete old APTAttack_pw_nextron.zip.
    EXIT /B 1
)
%ZIP% a -bb1 -tzip -r -p%ARCHPASS% ./dist/APTAttack_pw_apt.zip ./APTAttack/
IF ERRORLEVEL 1 (
    ECHO Error: Failed to create APTAttack_pw_apt.zip.
    EXIT /B 1
)
ren APTAttack build
IF ERRORLEVEL 1 (
    ECHO Error: Failed to rename APTAttack directory back to build.
    EXIT /B 1
)
