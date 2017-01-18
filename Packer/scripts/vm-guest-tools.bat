
IF NOT EXIST "C:\Program Files\VMware\VMware Tools\" GOTO install

GOTO exit

:install

powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('http://www.7-zip.org/a/7z920-x64.msi', 'C:\Windows\Temp\7z920-x64.msi')"
timeout /t 30
msiexec /qb /i C:\Windows\Temp\7z920-x64.msi
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('http://softwareupdate.vmware.com/cds/vmw-desktop/ws/12.5.2/4638234/windows/packages/tools-windows.tar', 'C:\Windows\Temp\vmware-tools.tar')"
http://softwareupdate.vmware.com/cds/vmw-desktop/ws
timeout /t 30
cmd.exe /c ""C:\Program Files\7-Zip\7z.exe" x C:\Windows\Temp\vmware-tools.tar -oC:\Windows\Temp"
FOR /r "C:\Windows\Temp" %%a in (VMware-tools-windows-*.iso) DO REN "%%~a" "windows.iso"
rd /S /Q "C:\Program Files (x86)\VMWare"

cmd.exe /c ""C:\Program Files\7-Zip\7z.exe" x "C:\Windows\Temp\windows.iso" -oC:\Windows\Temp\VMWare"
cmd.exe /c C:\Windows\Temp\VMWare\setup.exe /S /v"/qn REBOOT=R\"

shutdown -r -f -t 10


:exit