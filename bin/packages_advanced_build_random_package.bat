@echo off
title Build Random Package
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if [%encoding_prep%]==[yes] goto :first
if [%encoding_prep%]==[no] call "%bindir%\global_encoding.bat" %0
goto :end

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo.
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л                Select the Source                   л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
set counter=0
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %pkgsource%\*.') DO (
set /a counter += 1
echo        л  !counter!. %%Y                                                       
)
echo        л                                                    л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo.
echo.
:ask_source
set /p sourcenum= Choose a source directory: 
set counter=0
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %pkgsource%\*.') DO (
set /a counter += 1
if [!counter!]==[%sourcenum%] (
set sourcesrc=%%Y
goto :name
)
)
goto :ask_source

:name
cls
echo.
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л             Type the Name of your .pkg             л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л               example "reallycoolpackage"          л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
echo.
:ask_name
set /p pkgname= Choose the name: 
if ["%pkgname%"]==[""] goto :ask_name

:build
call "%bindir%\global_messages.bat" "BUILDING"
%external%\%packager% package.conf %pkgsource%\%sourcesrc%\XMBMANPLS
rename UP0001-XMBMANPLS_00-0000000000000000.pkg %pkgname%.pkg
if not exist "%pkgoutput%" mkdir "%pkgoutput%"
move "%bindir%\*.pkg" "%pkgoutput%"

:done
call "%bindir%\global_messages.bat" "BUILD-OK"
goto :end

:error_source
call "%bindir%\global_messages.bat" "ERROR-NO-SOURCE"
goto :end

:end
exit
