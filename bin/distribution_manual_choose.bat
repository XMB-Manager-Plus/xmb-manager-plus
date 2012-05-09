@echo off
title Manual Distribute
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
if not exist %pkgoutput%\*.pkg goto :error_packages
if not exist %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES goto :error_dropbox
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo.
echo.
%external%\cecho {04}        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ{\n}
%external%\cecho {04}        Û                                                    Û{\n}
%external%\cecho {04}        Û {0E}                Select the Package{04}                 Û{\n}
%external%\cecho {04}        Û                                                    Û{\n}
%external%\cecho {04}        ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ{\n}
%external%\cecho {04}        Û{08} ษออออออออออออออออออออออออออออออออออออออออออออออออป {04}Û{\n}
%external%\cecho {08}        ออผ                                                ศออ{\n}
set counter=0
for /f "tokens=1,2 delims=" %%Y IN ('dir /b %pkgoutput%\*.pkg') DO (
set /a counter += 1
%external%\cecho {0F}             !counter!. %%Y {\n}
)
%external%\cecho {08}        ออป                                                ษออ{\n
%external%\cecho {04}        Û {08}ศออออออออออออออออออออออออออออออออออออออออออออออออผ {04}Û{\n}
%external%\cecho {04}        ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ{\n}
%external%\cecho {0F}{\n}
echo.
:ask_package
set /p packagenum= Choose a package: 
set counter=0
for /f "tokens=1,2 delims=" %%Y IN ('dir /b %pkgoutput%\*.pkg') DO (
set /a counter += 1
if [!counter!]==[%packagenum%] (
set packagesrc=%%Y
goto :version
)
)
goto :ask_package

:version
cls
echo.
echo.
%external%\cecho {04}        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ{\n}
%external%\cecho {04}        Û                                                    Û{\n}
%external%\cecho {04}        Û {0E}        Select the Version folder{04}                  Û{\n}
%external%\cecho {04}        Û                                                    Û{\n}
%external%\cecho {04}        ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ{\n}
%external%\cecho {04}        Û{08} ษออออออออออออออออออออออออออออออออออออออออออออออออป {04}Û{\n}
%external%\cecho {08}        ออผ                                                ศออ{\n}
set counter=0
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\*.') DO (
set /a counter += 1
%external%\cecho {0F}             !counter!. %%Y {\n}
)
%external%\cecho {08}        ออป                                                ษออ{\n}
%external%\cecho {04}        Û {08}ศออออออออออออออออออออออออออออออออออออออออออออออออผ {04}Û{\n}
%external%\cecho {04}        ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ{\n}
%external%\cecho {0F}{\n}
echo.
:ask_version
set /p versionnum= Choose a version folder: 
set counter=0
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\*.') DO (
set /a counter += 1
if [!counter!]==[%versionnum%] (
set versionsrc=%%Y
goto :distribute
)
)
goto :ask_version

:distribute
call "%bindir%\global_messages.bat" "DISTRIBUTION"
::mkdir "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\%versionsrc%"
move "%pkgoutput%\%packagesrc%" "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\%versionsrc%\"
if not exist "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\%versionsrc%\%packagesrc%" goto :error_distribution

:done
call "%bindir%\global_messages.bat" "DISTRIBUTION-OK"
goto :end

:error_source
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-SOURCE"
goto :end

:error_packages
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-PACKAGES"
goto :end

:error_dropbox
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-DROPBOX"
goto :end

:error_distribution
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-GENERIC"
goto :end

:end
exit
