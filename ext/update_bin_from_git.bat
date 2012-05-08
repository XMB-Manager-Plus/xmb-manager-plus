@echo off
title Update bin from git
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                 Update bin from git                �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  Atention, this will:                              �
echo        �  - Replace all your bin dir                        �
echo        �  - Remove all your builded sources and packages    �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
echo.
:ask_confirm
set /P choice= Are you sure (Y/N): 
If /I %choice%==Y goto :ok
If /I %choice%==y goto :ok
If /I %choice%==N goto :first
If /I %choice%==n goto :first
goto :ask_confirm

:ok
%external%\wget --no-check-certificate %git_page%/zipball/master -O xmbmp.zip
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
