@echo off
title SpideyBot Checker v1
color 06

:menu
cls
echo Welcome to Spidey Bot Checker v1
echo.
echo Source code availible at https://github.com/jackmcdougall/spideybotchecker
echo.
echo This scanner is only designed to work on version 0.0.305 (Build number: 48112), the GitHub repository will be updated periodically to include new versions of discord
echo --------------------------------
echo 1. Run scan
echo 2. Quit
set /p choice=
if %choice%==1 goto run
if %choice%==2 goto exit
goto menu
:run

SET check1=0

setlocal
cd %appdata%\Discord\0.0.305\modules\discord_desktop_core\
set file="index.js"
set maxbytesize=41

FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

if %size% LSS %maxbytesize% (
    SET check1=0
) ELSE (
    SET check1=1
)
goto finalCheck
:finalCheck
if %check1%==1 goto alarm
if %check1%==0 goto fine
:alarm
cls
echo It seems as though your discord client may been infected by the Spidey bot malware (or at least has been modified in an unexpected way that does not include BetterDiscord). It is recommended that you completely wipe out your discord files and reinstall the application. See https://support.discordapp.com/hc/en-us/articles/115004307527--Windows-Corrupt-Installation for help with this
pause
goto menu
:fine
cls
echo Everything looks okay :)
pause
goto menu
:exit
exit