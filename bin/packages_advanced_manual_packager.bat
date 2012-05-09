@echo off
title Manual Packager
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {0F}           "%packager%" command line{04}{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F}                  (0 to exit){04}                      л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {0F}{\n}
echo.
%external%\%packager% --informal-help
:ask_command
set /p command= %packager% 
if ["%command%"]==["0"] goto :done
if ["%command%"]==[""] goto :ask_command
%external%\%packager% %command%
%external%\wait 2
goto :first

:done
call "%bindir%\global_messages.bat" "END"
goto :end

:end
exit
