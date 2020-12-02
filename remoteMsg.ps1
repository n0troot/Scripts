$name = Read-Host "Enter computer name"
$msg = Read-Host "Enter remote message"
Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * $msg" -ComputerName $name
