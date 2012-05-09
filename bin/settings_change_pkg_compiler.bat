@echo off
title Change Package Compiler
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}              Change Package Compiler{04}              л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л{02}  1. {0F}"make_package_npdrm" Sony Official (debug){04}     л{\n}
%external%\cecho {04}        л{02}  2. {0F}"psn_package_npdrm"  Hacked Version{04}            л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лммммммммммммммммммммммммммммммммммммммммммммммммммммл{\n}
%external%\cecho {0F}{\n}
echo.
:ask_compiler
set /p pack= Choose a pacakge compiler: 
if [%pack%]==[1] (
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "packager=psn_package_npdrm" --replace "packager=make_package_npdrm"
goto :done
)
if [%pack%]==[2] (
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "packager=make_package_npdrm" --replace "packager=psn_package_npdrm"
goto :done
)
goto :ask_compiler

:done
call "%bindir%\global_messages.bat" "SETTINGS-PACKAGER-CHANGED"
goto :end

:end
exit
