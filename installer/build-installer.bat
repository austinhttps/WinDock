@echo off
setlocal
cd /d "%~dp0"
rem Builds WinDockSetup.exe from ..\WinDock.exe (run ..\build.bat first)
set "FW=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319"
if not exist "%FW%\csc.exe" set "FW=%WINDIR%\Microsoft.NET\Framework\v4.0.30319"
if not exist "..\WinDock.exe" (
  echo ..\WinDock.exe not found - run build.bat in the main folder first.
  pause
  exit /b 1
)
"%FW%\csc.exe" /nologo /codepage:65001 /target:winexe /optimize+ /out:..\WinDockSetup.exe /win32icon:..\windock.ico /win32manifest:setup.manifest /resource:..\WinDock.exe,WinDock.exe /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.Web.Extensions.dll Setup.cs SetupVersion.cs
if errorlevel 1 (
  echo Build failed.
  pause
  exit /b 1
)
echo Done: WinDockSetup.exe
pause
