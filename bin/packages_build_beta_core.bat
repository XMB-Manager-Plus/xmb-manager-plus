@echo off
title Build and Distribute BETA/RC
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
cls
echo.
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}  Type the version of the beta/RC Core Package  ?{04}  л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F}                  example "{02}%working_version%{0F}"{04}                   л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {0F}{\n}
echo.
set /p version= Choose a version (default %working_version%): 
if ["%version%"]==[""] set version=%working_version%
cls
echo.
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E} Developement suffix of the beta/RC Core Package{04}   л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F} For example: "{02}BETA3{0F}" or "{02}RC2{0F}".{04}                    л{\n}
%external%\cecho {04}        л {0F} It is recommended to use capital letters{04}          л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {0F}{\n}
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
