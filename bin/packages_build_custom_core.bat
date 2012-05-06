@echo off
title Build Custom Core
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
cls
echo.
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л      Version that you want for the main core       л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л                 Example "%working_version%"                     л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
echo.
set /p version= Choose a version (default %working_version%): 
if ["%version%"]==[""] set version=%working_version%
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo.
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л      Language that you want for the main core      л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
set counter=0
for /f "tokens=1,2 delims=." %%X IN ('dir /b %languageinisdir%\*.ini') DO (
set /a counter += 1
echo        л  !counter!. %%X                                          л
)
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
echo.
:ask_language
set /p langnum= Choose a language: 
set counter=0
for /f "tokens=1,2 delims=." %%X IN ('dir /b %languageinisdir%\*.ini') DO (
set /a counter += 1
if [!counter!]==[%langnum%] (
set langsrc=%%X
goto :themes
)
)
goto :ask_language

:themes
cls
echo.
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л      Theme that you want for the main core         л
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
if exist "%pkgsource%\custom" rmdir /Q /S "%pkgsource%\custom"
mkdir "%pkgsource%\custom\XMBMANPLS"
xcopy %pkgsource%\core-hdd0\XMBMANPLS\*.* /e /y %pkgsource%\custom\XMBMANPLS\
xcopy %pkgsource%\languagepacks\%langsrc%\XMBMANPLS\USRDIR\*.* /e /y %pkgsource%\custom\XMBMANPLS\USRDIR\
xcopy %pkgsource%\themepacks\%themesrc%\XMBMANPLS\USRDIR\IMAGES\*.* /e /y %pkgsource%\custom\XMBMANPLS\USRDIR\IMAGES\
%external%\%packager% package.conf %pkgsource%\custom\XMBMANPLS
rename UP0001-XMBMANPLS_00-0000000000000000.pkg XMB_Manager_Plus_v%version%_Core-%langsrc%-%themesrc%.pkg
if not exist "%pkgoutput%" mkdir "%pkgoutput%"
move %bindir%\*.pkg "%pkgoutput%\"
if exist "%pkgsource%\custom" rmdir /Q /S "%pkgsource%\custom"

:done
call "%bindir%\global_messages.bat" "BUILD-OK"
goto :end

:error_source
call "%bindir%\global_messages.bat" "ERROR-NO-SOURCE"
goto :end

:end
