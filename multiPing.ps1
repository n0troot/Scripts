$i = 0
$h = Read-Host "How many hosts to ping?"
$ips = Get-Content .\ips.txt
while($i -lt $h){Read-Host "Enter IP" >> .\ips.txt -ErrorAction Ignore; $i+=1}
foreach($ip in $ips){
if(Test-Connection -ComputerName $ip -Count 1 -ErrorAction SilentlyContinue){
Write-Host "$ip is Online!"; $ips = Write-Host $null > .\ips.txt}
else{Write-Host "$ip is Offline!"; $ips = Write-Host $null > .\ips.txt}
}
