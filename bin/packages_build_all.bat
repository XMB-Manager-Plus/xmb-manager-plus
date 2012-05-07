@echo off
title Build All
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
if not exist %pkgsource%\core-hdd0\XMBMANPLS goto :error_source
call "%bindir%\global_messages.bat" "BUILDING"
%external%\%packager% package.conf %pkgsource%\core-hdd0\XMBMANPLS
rename UP0001-XMBMANPLS_00-0000000000000000.pkg XMB_Manager_Plus_v%working_version%_Core.pkg
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %pkgbase%\XMBMANPLS\USRDIR\IMAGES\*.') DO (
%external%\%packager% package.conf %pkgsource%\themepacks\%%Y\XMBMANPLS
rename UP0001-XMBMANPLS_00-0000000000000000.pkg XMBM+v%working_version%-THEMEPACK-%%Y.pkg
)
for /f "tokens=1,2 delims=." %%X IN ('dir /b %languageinisdir%\*.ini') DO (
%external%\%packager% package.conf %pkgsource%\languagepacks\%%X\XMBMANPLS
rename UP0001-XMBMANPLS_00-0000000000000000.pkg XMBM+v%working_version%-LANGUAGEPACK-%%X.pkg
)
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
