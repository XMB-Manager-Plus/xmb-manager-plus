@echo off
title Open Dropbox Folder
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
if not exist %dropboxdir%\Public\XMBMPLUS goto :error_dropbox
start explorer.exe "%dropboxdir%\Public\XMBMPLUS\"
goto :end

:error_dropbox
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-DROPBOX"
goto :end

:end
exit
