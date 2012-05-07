@echo off
title Build and Distribute BETA/RC
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if [%encoding_prep%]==[yes] goto :first
if [%encoding_prep%]==[no] call "%bindir%\global_encoding.bat" %0
goto :end

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
cls
echo.
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �   Type the version of the beta/RC Core Package  ?  �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                example "%working_version%"                      �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
echo.
set /p version= Choose a version (default %working_version%): 
if ["%version%"]==[""] set version=%working_version%
cls
echo.
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  Developement suffix of the beta/RC Core Package   �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  For example "BETA3" or "RC2".                     
echo        �  It is recommended to use capital letters          �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
echo.
:ask_suffix
set /p suffix= Choose a suffix: 
if ["%suffix%"]==[""] goto :ask_suffix
call "%bindir%\global_messages.bat" "BUILDING"
%external%\%packager% package.conf %pkgsource%\core-hdd0\XMBMANPLS\
rename UP0001-XMBMANPLS_00-0000000000000000.pkg XMBM+%version%_%suffix%_Core.pkg
if not exist "%pkgoutput%" mkdir "%pkgoutput%"
move %bindir%\*.pkg "%pkgoutput%\"

:done
call "%bindir%\global_messages.bat" "BUILD-OK"
goto :end

:error_source
call "%bindir%\global_messages.bat" "ERROR-NO-SOURCE"
goto :end

:end
exit
