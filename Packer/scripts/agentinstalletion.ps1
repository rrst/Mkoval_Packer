
    $path = (Get-ChildItem "W:\" -Filter "6.1.0.*" | % { $_.fullname } | Sort-Object -Descending)| Select -First 1
    Write-Host $path
    Copy-Item -Path "$path\Agent-x64-*" -Destination C:\ -Recurse -Force 
    
    $pathAg = (Get-ChildItem "C:\" -Filter "Agent-X64-6.1.0.*" | % { $_.fullname } | Sort-Object -Descending)| Select -First 1

    cmd.exe /c $pathAg /silent reboot=never
