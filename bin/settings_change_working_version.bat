@echo off
title Change Working Version
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}              Change Working Version{04}               л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F}    The version must be in the format{02} X.XX{04}         л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F} Do not use characters other than numbers, letter{04}  л{\n}
%external%\cecho {04}        л {0F} and dots otherwise will not work{04}                  л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0C} Attention: {0F}This will delete all your package{04}      л{\n}
%external%\cecho {04}        л {0F}            source and builded packages{04}            л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лммммммммммммммммммммммммммммммммммммммммммммммммммммл{\n}
%external%\cecho {0F}{\n}
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
exit
