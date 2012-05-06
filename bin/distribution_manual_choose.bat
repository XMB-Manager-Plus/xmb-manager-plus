@echo off
title Manual Distribute
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
if not exist %pkgoutput%\*.pkg goto :error_packages
if not exist %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES goto :error_dropbox
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo.
echo.
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo        Û                                                    Û
echo        Û                 Select the Package                 Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
set counter=0
for /f "tokens=1,2 delims=" %%Y IN ('dir /b %pkgoutput%\*.pkg') DO (
set /a counter += 1
echo        Û  !counter!. %%Y
)
echo        Û                                                    Û
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo.
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
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo        Û                                                    Û
echo        Û             Select the Version folder              Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
set counter=0
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\*.') DO (
set /a counter += 1
echo        Û  !counter!. %%Y
)
echo        Û                                                    Û
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo.
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
