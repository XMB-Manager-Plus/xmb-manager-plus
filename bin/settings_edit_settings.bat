@echo off
title Edit settings
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if [%encoding_prep%]==[yes] goto :first
if [%encoding_prep%]==[no] call "%bindir%\global_encoding.bat" %0
goto :end

:first
start %external%\notepad\notepad++.exe "%bindir%\settings.ini"

:end
exit
