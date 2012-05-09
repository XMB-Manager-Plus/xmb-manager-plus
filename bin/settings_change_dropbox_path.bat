@echo off
title Change Dropbox Path
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}                Change Dropbox Path{04}                л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F}     Example: "C:\Users\XMBM+\Dropbox"{04}             л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лммммммммммммммммммммммммммммммммммммммммммммммммммммл{\n}
%external%\cecho {0F}{\n}
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
