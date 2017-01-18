$passwd = convertto-securestring -AsPlainText -Force -String "raid4us!"
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist "administrator",$passwd

New-PSDrive -Name W -PSProvider FileSystem -Root \\192.168.64.127\Share -Credential $cred -Scope Global -Persist

Start-Sleep -Seconds 10