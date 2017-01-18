powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://notepad-plus-plus.org/repository/7.x/7.2.2/npp.7.2.2.bin.x64.zip', 'C:\Windows\Temp\notepad++.zip')"

"C:\Program Files\7-Zip\7z.exe" x C:\Windows\Temp\notepad++.zip -oC:\Notepad++

@echo off
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\notepad.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Notepad++\notepad++.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs