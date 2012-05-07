@echo off
title Distribute Themes
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
if not exist %pkgoutput%\*.pkg goto :error_packages
if not exist %dropboxdir%\Public\XMBMPLUS\RELEASES\THEMEPACKS goto :error_dropbox
call "%bindir%\global_messages.bat" "DISTRIBUTION"
mkdir "%dropboxdir%\Public\XMBMPLUS\RELEASES\THEMEPACKS"
for /f "tokens=1,2 delims=" %%Y IN ('dir /b %pkgoutput%\*THEMEPACK*.pkg') DO (
move "%pkgoutput%\%%Y" "%dropboxdir%\Public\XMBMPLUS\RELEASES\THEMEPACKS\"
if not exist "%dropboxdir%\Public\XMBMPLUS\RELEASES\THEMEPACKS\%%Y" goto :error_distribution
)

:done
call "%bindir%\global_messages.bat" "DISTRIBUTION-OK"
goto :end

:error_source
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-SOURCE"
goto :end

:error_packages
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-PACKAGES"
goto :end

:error_dropbox
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-DROPBOX"
goto :end

:error_distribution
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-GENERIC"
goto :end

:end
exit
