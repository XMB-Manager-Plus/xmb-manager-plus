@echo off
title Edit settings
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
start %external%\notepad\notepad++.exe "%bindir%\settings.ini"

:end
exit
