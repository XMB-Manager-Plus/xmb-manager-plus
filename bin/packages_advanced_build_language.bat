@echo off
title Build Language
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo.
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л              Select the Language                   л
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
goto :build
)
)
goto :ask_language

:build
call "%bindir%\global_messages.bat" "BUILDING"
%packager% package.conf %pkgsource%\languagepacks\%langsrc%\XMBMANPLS
rename UP0001-XMBMANPLS_00-0000000000000000.pkg XMBM+v%working_version%-LANGUAGEPACK-%langsrc%.pkg
if not exist "%pkgoutput%" mkdir "%pkgoutput%"
move %bindir%\*.pkg "%pkgoutput%"

:done
call "%bindir%\global_messages.bat" "BUILD-OK"
goto :end

:error_source
call "%bindir%\global_messages.bat" "ERROR-NO-SOURCE"
goto :end

:end
