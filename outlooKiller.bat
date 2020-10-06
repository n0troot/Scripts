@echo off
Title outlooKiller ver 1.0
:start
set /p choice="[R]estart Computer // [K]ill Outlook -OR- [Q]uit: "
IF "%choice%"=="R" goto sdown
IF "%choice%"=="r" goto sdown
IF "%choice%"=="K" goto tkill
IF "%choice%"=="k" goto tkill
IF "%choice%"=="Q" goto fin
IF "%choice%"=="q" goto tkill
IF "%choice%" NEQ "R" goto start
IF "%choice%" NEQ "r" goto start
IF "%choice%" NEQ "K" goto start
IF "%choice%" NEQ "k" goto start
IF "%choice%" NEQ "Q" goto start
IF "%choice%" NEQ "q" goto start

:sdown
set /p ip=Enter IP to shutdown:
shutdown /m %ip% /r -t 0 && echo [+]%ip% rebooted successfully!.
goto end

:tkill
set /p ip=Enter IP to close Outlook:
taskkill /S %ip% /T /PID outlook.exe && echo [+]Outlook successfully closed on %ip%!.
goto end

:end
set /p choice2="Press any key to exit -OR- [R]e-run: "
IF "%choice2%"=="R" goto start
IF "%choice2%"=="r" goto start
IF "%choice2%"=="" goto fin
IF "%choice2%" NEQ "R" goto fin
if "%choice2%" NEQ "r" goto fin

:fin
break
