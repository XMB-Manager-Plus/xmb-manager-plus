@echo off
title Change Working Version
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
cls
echo.
echo.
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo        Û                                                    Û
echo        Û               Change Working Version               Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
echo        Û     The version must be in the format X.XX         Û
echo        Û                                                    Û
echo        Û  Do not use characters other than numbers, letter  Û
echo        Û  and dots otherwise will not work                  Û
echo        Û                                                    Û
echo        Û  Atention: This will delete all your package       Û
echo        Û             source and builded packages            Û
echo        Û                                                    Û
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo.
echo.
:ask_version
set /p version= Version: 
if ["%version%"]==[""] goto :ask_version
:ask_confirm
set /P choice= Are sure that %version% is the base version (Y/N): 
If /I %choice%==Y goto :ok
If /I %choice%==y goto :ok
If /I %choice%==N goto :first
If /I %choice%==n goto :first
goto :ask_confirm

:ok
if exist "%pkgsource%" rmdir /Q /S "%pkgsource%"
if exist "%pkgoutput%" rmdir /Q /S "%pkgoutput%"
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "working_version=%working_version%" --replace "working_version=%version%"

:done
call "%bindir%\global_messages.bat" "SETTINGS-VERSION-CHANGED"
goto :end

:end
