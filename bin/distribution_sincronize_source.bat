@echo off
title Distribute Base Source
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
if not exist %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES goto :error_dropbox
if not exist %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION mkdir %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION
if not exist %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\exist.ini echo dropboxver=0.00 > %dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\exist.ini
for /f "tokens=1,2 delims==" %%G in (%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\exist.ini) do set %%G=%%H
cls
echo.
echo.
echo        ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
echo        €                                                    €
echo        €          Sincronize Base Package Source            €
echo        €ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ€
echo        €                                                    €
echo        € Dropbox Base Source version: %dropboxver%                  €
echo        € Local Base Source version: %working_version%                    €
echo        €                                                    €
echo        € 1. Upload local base source to dropbox             €
echo        € 2. Download dropbox base source to local disk      €
echo        €    Atention: This will replace your base source,   €
echo        €              delete all your package source and    €
echo        €              builded packages                      €
echo        €                                                    €
echo        ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
echo.
echo.
:ask_sincronize
set /p sincronize= What do you want to do?: 
if [%sincronize%]==[1] goto :ask_confirm
if [%sincronize%]==[2] goto :ask_confirm
goto :ask_sincronize

:ask_confirm
set /P choice= Are you sure? (Y/N): 
If /I %choice%==Y goto :ok
If /I %choice%==y goto :ok
If /I %choice%==N goto :first
If /I %choice%==n goto :first
goto :ask_confirm

:ok
if [%sincronize%]==[1] goto :upload
if [%sincronize%]==[2] goto :download

:upload
call "%bindir%\global_messages.bat" "DISTRIBUTION-BASE-UPLOAD"
rmdir /s /q "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\base"
xcopy "%pkgbase%" "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\base\" /s
rd /s/q "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\languages"
xcopy "%languageinisdir%" "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\languages\" /s
ssr --nobackup --recurse --encoding ansi --dir "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION" --include "exist.ini" --alter --search "dropboxver=%dropboxver%" --replace "dropboxver=%working_version%"
goto :done

:download
call "%bindir%\global_messages.bat" "DISTRIBUTION-BASE-DOWNLOAD"
rmdir /s /q "%pkgbase%"
rmdir /s /q "%bindir%\base.original"
xcopy "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\base" "%pkgbase%\" /s
xcopy "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\base" "%bindir%\base.original\" /s
rmdir /s /q "%languageinisdir%"
xcopy "%dropboxdir%\Public\XMBMPLUS\INTERNAL_RELEASES\PACKAGE_TOOLKIT_SYNCRONISATION\languages" "%languageinisdir%\" /s
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "working_version=%working_version%" --replace "working_version=%dropboxver%"
goto :done

:done
call "%bindir%\global_messages.bat" "DISTRIBUTION-BASE-OK"
goto :end

:error_dropbox
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-BASE-NO-DROPBOX"
goto :end

:error_distribution
call "%bindir%\global_messages.bat" "ERROR-DISTRIBUTION-GENERIC"
goto :end

:end
