@echo off
title Change Package Compiler
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �               Change Package Compiler              �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  1. "make_package_npdrm" Sony Official (debug)     �
echo        �  2. "psn_package_npdrm"  Hacked Version            �
echo        �                                                    �
echo        ������������������������������������������������������
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
exit
