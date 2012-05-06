@echo off
title Manual Packager
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
cls
echo        ������������������������������������������������������
echo        �                                                    �
echo        �             "%packager%" command line              �
echo        �                                                    �
echo        �                    (0 to exit)                     �
echo        �                                                    �
echo        ������������������������������������������������������
%packager% --informal-help
:ask_command
set /p command= %packager% 
if ["%command%"]==["0"] goto :done
if ["%command%"]==[""] goto :ask_command
%packager% %command%
wait 2
goto :first

:done
call "%bindir%\global_messages.bat" "END"
goto :end

:end
