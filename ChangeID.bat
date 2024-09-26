@echo off
setlocal enabledelayedexpansion

:: Terminate all TeamViewer-related processes
taskkill /f /im tv* >nul 2>&1
taskkill /f /im teamviewer.exe >nul 2>&1
taskkill /f /im teamviewer_service.exe >nul 2>&1

:: Change directory to the TeamViewer App folder
cd /d "%~dp0\App\TeamViewer"

:: Backup the registry keys related to TeamViewer and Apple Bonjour
echo Backing up registry keys...
reg export HKCU\Software\TeamViewer TeamViewer.reg >nul 2>&1
reg export HKLM\SOFTWARE\WOW6432Node\TeamViewer TeamViewerHKLM.reg >nul 2>&1
reg export "HKLM\SOFTWARE\WOW6432Node\Apple Inc." TeamViewerBonjour.reg >nul 2>&1

:: Start AlterID.exe with the -s parameter
echo Starting AlterID.exe...
start "" /wait AlterID.exe -s

:: Terminate TeamViewer processes again after AlterID execution
taskkill /f /im tv* >nul 2>&1
taskkill /f /im teamviewer.exe >nul 2>&1
taskkill /f /im teamviewer_service.exe >nul 2>&1

:: Restore or delete the registry keys
echo Restoring or cleaning up registry keys...
if exist TeamViewer.reg (
    reg import TeamViewer.reg >nul 2>&1
    del /q TeamViewer.reg
) else (
    reg delete HKCU\Software\TeamViewer /f >nul 2>&1
)

if exist TeamViewerHKLM.reg (
    reg import TeamViewerHKLM.reg >nul 2>&1
    del /q TeamViewerHKLM.reg
) else (
    reg delete HKLM\Software\Wow6432Node\TeamViewer /f >nul 2>&1
)

if exist TeamViewerBonjour.reg (
    reg import TeamViewerBonjour.reg >nul 2>&1
    del /q TeamViewerBonjour.reg
) else (
    reg delete "HKLM\SOFTWARE\WOW6432Node\Apple Inc." /f >nul 2>&1
)

:: Return to the original directory and start TeamViewer Portable
cd /d "%~dp0"
echo Starting TeamViewer Portable...
start "" TeamViewerPortable.exe

:: Open website and Facebook automatically
echo Opening your website and Facebook...
start "" "https://www.pasrur.pk"
start "" "https://www.facebook.com/MianAshfaq012"

:: End of script
endlocal
