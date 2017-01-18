@echo off
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3"  goto ver_8.1 
if "%version%" == "6.2"  goto ver_8
if "%version%" == "6.1"  goto ver_7

goto exit

:ver_8.1
set link="https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win8.1AndW2K12R2-KB3134758-x64.msu"
goto exec_commands

:ver_8
set link="https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/W2K12-KB3134759-x64.msu"
goto exec_commands

:ver_7
set link="https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win7AndW2K8R2-KB3134760-x64.msu"
goto exec_commands

:exec_commands
@echo off

@powershell -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('%link%', 'C:\Windows\Temp\powershell_5.msu'))"

timeout /t 30

set hotfix="C:\Windows\Temp\powershell_5.msu"

@echo on
start /wait wusa "%hotfix%" /quiet /norestart


:exit
::10.0  Windows 10
::6.3  Windows 8.1 and Windows Server 2012
::6.2  Windows 8
::6.1  Windows 7
::6.0  Windows Vista
::5.2  Windows XP x64
::5.1  Windows XP
::5.0  Windows 2000
::4.10  Windows 98