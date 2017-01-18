:: Windows 8.1 require KB3138615 hotfix
:: Installing and searching for updates is slow and high CPU usage occurs in Windows 8.
:: https://support.microsoft.com/en-in/kb/3138615

@echo off

@powershell -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('https://download.microsoft.com/download/8/8/A/88AFE5D4-0021-4384-9D64-5411257CCC5B/Windows8.1-KB3138615-x64.msu', 'C:\Windows\Temp\Windows8.1-KB3138615-x64.msu'))"

timeout /t 60

set hotfix="C:\Windows\Temp\Windows8.1-KB3138615-x64.msu"

@echo on
start /wait wusa "%hotfix%" /quiet
