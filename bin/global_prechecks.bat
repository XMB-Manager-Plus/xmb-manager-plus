@echo off
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H

call "%bindir%\global_messages.bat" "CHECKING"

IF NOT EXIST "%pkgbase%\" (
mkdir "%pkgbase%" >NUL
xcopy /E "%bindir%\base.original\*.*" "%bindir%\base\" >NUL
)

IF NOT EXIST "%pkgsource%\" mkdir "%pkgsource%" >NUL
IF NOT EXIST "%pkgoutput%\" mkdir "%pkgoutput%" >NUL

if [%encoding_prep%]==[no] (
reg add HKEY_CURRENT_USER\Console /v FaceName /t REG_SZ /d "Lucida Console" /f >NUL
reg add HKEY_CURRENT_USER\Console /v FontFamily /t REG_DWORD /d 00000036 /f >NUL
reg add HKEY_CURRENT_USER\Console /v FontSize /t REG_DWORD /d 00786432 /f >NUL
reg add HKEY_CURRENT_USER\Console /v FontWeight /t REG_DWORD /d 00000190 /f >NUL
%external%\ssr\ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start "" "%~1"
exit
)
