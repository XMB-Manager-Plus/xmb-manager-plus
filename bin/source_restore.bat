@echo off
title Restore Base
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                 Restore Base Source                �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  Atention: This will delete all your package       �
echo        �             source and builded packages            �
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
call "%bindir%\global_messages.bat" "SOURCE-RESTORING"
if exist "%pkgsource%" rmdir /Q /S "%pkgsource%"
if exist "%pkgoutput%" rmdir /Q /S "%pkgoutput%"
if exist "%pkgbase%" rmdir /Q /S "%pkgbase%"
xcopy /E "%bindir%\base.original" "%pkgbase%\" >NUL

:done
call "%bindir%\global_messages.bat" "SOURCE-RESTORING-OK"
goto :end

:end
exit
