@echo off
title Change Package Compiler
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
echo        Û               Change Package Compiler              Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
echo        Û  1. "make_package_npdrm" Sony Official (debug)     Û
echo        Û  2. "psn_package_npdrm"  Hacked Version            Û
echo        Û                                                    Û
echo        ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
echo.
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
