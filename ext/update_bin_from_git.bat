@echo off
title Update bin from git
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
%external%\wget --no-check-certificate https://github.com/andreus-sebes/xmb-manager-plus/zipball/master -O xmbmp.zip
%external%\unzip -o -qq xmbmp.zip
del /Q /S xmbmp.zip
move "*xmb-manager-plus*" "new-version"
::del /Q /S "%external%\new-version\README*"
rmdir /Q /S "%external%\new-version\ext"
rmdir /Q /S "%bindir%"
move "%external%\new-version\bin" "..\bin"
rmdir /Q /S "%external%\new-version"

:end
exit
