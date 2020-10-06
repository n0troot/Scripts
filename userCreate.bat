@echo off
net user <USERNAME> <PASSWORD> /fullname:<NAME> /add /active:yes
net localgroup Administrators <USERNAME> /add
wmic useraccount WHERE Name='<USERNAME>' set PasswordExpires=false
