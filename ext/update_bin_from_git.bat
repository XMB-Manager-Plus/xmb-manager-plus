@echo off
title Update bin from git
for /f "tokens=1,2 delims==" %%G in (..\bin\settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

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
