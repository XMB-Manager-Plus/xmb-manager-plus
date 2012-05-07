@echo off
title Build Theme
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo.
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л                Select the Theme                    л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
set counter=0
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %pkgbase%\XMBMANPLS\USRDIR\IMAGES\*.') DO (
set /a counter += 1
echo        л  !counter!. %%Y                                                       
)
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
echo.
:ask_theme
set /p themenum= Choose a theme: 
set counter=0
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %pkgbase%\XMBMANPLS\USRDIR\IMAGES\*.') DO (
set /a counter += 1
if [!counter!]==[%themenum%] (
set themesrc=%%Y
goto :build
)
)
goto :ask_theme

:build
call "%bindir%\global_messages.bat" "BUILDING"
%external%\%packager% package.conf %pkgsource%\themepacks\%themesrc%\XMBMANPLS
rename UP0001-XMBMANPLS_00-0000000000000000.pkg XMBM+v%working_version%-THEMEPACK-%themesrc%.pkg
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
