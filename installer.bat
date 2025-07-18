@echo off
setlocal

rem Define paths
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "sourceBat=RunAnførselstegn.bat"
set "targetScriptDir=C:\Tools\AutoHotkey"
set "ahkScript=Anførselstegn.ahk"
set "ahkExe=C:\Program Files\AutoHotkey\v1.1.37.02\AutoHotkeyU64.exe"

rem Copy startup batch file
copy "%~dp0%sourceBat%" "%startupFolder%" /Y

rem Create script directory
if not exist "%targetScriptDir%" (
    mkdir "%targetScriptDir%"
)

rem Copy the .ahk script
copy "%~dp0%ahkScript%" "%targetScriptDir%" /Y

rem Run the script immediately
if exist "%ahkExe%" (
    start "" "%ahkExe%" "%targetScriptDir%\%ahkScript%"
) else (
    echo [WARN] AutoHotkey not found at: %ahkExe%
)

endlocal