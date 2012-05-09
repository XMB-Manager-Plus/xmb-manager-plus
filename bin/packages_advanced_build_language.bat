@echo off
title Build Language
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo.
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}             Select the Language{04}                   л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л{08} ЩЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЛ {04}л{\n}
%external%\cecho {08}        ЭЭМ                                                ШЭЭ{\n}
set counter=0
for /f "tokens=1,2 delims=." %%X IN ('dir /b %languageinisdir%\*.ini') DO (
set /a counter += 1
%external%\cecho {0F}           !counter!. %%X {\n}
)
%external%\cecho {08}        ЭЭЛ                                                ЩЭЭ{\n}
%external%\cecho {04}        л {08}ШЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭМ {04}л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {0F}{\n}
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
%external%\%packager% package.conf %pkgsource%\languagepacks\%langsrc%\XMBMANPLS
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
exit
