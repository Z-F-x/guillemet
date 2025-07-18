# Copy the startup batch file to the Startup folder
Copy-Item -Path ".\RunAnførselstegn.bat" -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Force

# Ensure the target directory exists
New-Item -ItemType Directory -Path "C:\Tools\AutoHotkey" -Force | Out-Null

# Copy the AHK script to the target directory
Copy-Item -Path ".\Anførselstegn.ahk" -Destination "C:\Tools\AutoHotkey" -Force

# Run the script immediately using AutoHotkey v1.1.37.02
$ahkExe = "C:\Program Files\AutoHotkey\v1.1.37.02\AutoHotkeyU64.exe"
$scriptPath = "C:\Tools\AutoHotkey\Anførselstegn.ahk"

# Check that the executable exists before launching
if (Test-Path $ahkExe) {
    Start-Process -FilePath $ahkExe -ArgumentList "`"$scriptPath`""
} else {
    Write-Warning "AutoHotkey v1.1 not found at: $ahkExe"
}