@echo off
title Change Dropbox Path
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo        Û                                                    Û
echo        Û                 Change Dropbox Path                Û
echo        ÛออออออออออออออออออออออออออออออออออออออออออออออออออออÛ
echo        Û                                                    Û
echo        Û      Example: "C:\Users\XMBM+\Dropbox"             Û
echo        Û                                                    Û
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo.
echo.
:ask_location
set /p location= Dropbox Path: 
if ["%location%"]==[""] goto :ask_location
:ask_confirm
set /P choice= Are sure that %location% is the dropbox path location (Y/N): 
If /I %choice%==Y goto :ok
If /I %choice%==y goto :ok
If /I %choice%==N goto :first
If /I %choice%==n goto :first
goto :ask_confirm

:ok
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "dropboxdir=%dropboxdir%" --replace "dropboxdir=%location%"

:done
call "%bindir%\global_messages.bat" "SETTINGS-DROPBOX-CHANGED"
goto :end

:end
exit
