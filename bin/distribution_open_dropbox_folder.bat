@echo off
title Open Dropbox Folder
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if [%encoding_prep%]==[yes] goto :first
if [%encoding_prep%]==[no] call "%bindir%\global_encoding.bat" %0
goto :end

:first
if not exist %dropboxdir%\Public\XMBMPLUS goto :error_dropbox
start explorer.exe "%dropboxdir%\Public\XMBMPLUS\"
goto :end

:error_dropbox
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-NO-DROPBOX"
goto :end

:end
exit
