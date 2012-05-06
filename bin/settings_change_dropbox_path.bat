@echo off
title Change Dropbox Path
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
cls
echo.
echo.
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo        Û                                                    Û
echo        Û                 Change Dropbox Path                Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
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
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "dropboxdir=%dropboxdir%" --replace "dropboxdir=%location%"

:done
call "%bindir%\global_messages.bat" "SETTINGS-DROPBOX-CHANGED"
goto :end

:end
