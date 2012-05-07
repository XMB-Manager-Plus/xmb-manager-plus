@echo off
title Build Themes
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if [%encoding_prep%]==[yes] goto :first
if [%encoding_prep%]==[no] call "%bindir%\global_encoding.bat" %0
goto :end

:first
if [%~1]==[SETTINGS-PACKAGER-CHANGED] goto :msg_settings-packager-changed
if [%~1]==[SETTINGS-DROPBOX-CHANGED] goto :msg_settings-dropbox-changed
if [%~1]==[SETTINGS-VERSION-CHANGED] goto :msg_settings-version-changed
if [%~1]==[SOURCE-BUILDING-OK] goto :msg_source-building-ok
if [%~1]==[SOURCE-RESTORING] goto :msg_source-restoring
if [%~1]==[SOURCE-RESTORING-OK] goto :msg_source-restoring-ok
if [%~1]==[SOURCE-LANGUAGE-EXISTS] goto :msg_source-language-exists
if [%~1]==[SOURCE-LANGUAGE-CREATED] goto :msg_source-language-created
if [%~1]==[SOURCE-THEME-EXISTS] goto :msg_source-theme-exists
if [%~1]==[SOURCE-THEME-CREATED] goto :msg_source-theme-created
if [%~1]==[BUILDING] goto :msg_building
if [%~1]==[BUILD-OK] goto :msg_build-ok
if [%~1]==[DISTRIBUTION] goto :msg_distribution
if [%~1]==[DISTRIBUTION-OK] goto :msg_distribution-ok
if [%~1]==[DISTRIBUTION-BASE-UPLOAD] goto :msg_distribution-base-upload
if [%~1]==[DISTRIBUTION-BASE-DOWNLOAD] goto :msg_distribution-base-download
if [%~1]==[DISTRIBUTION-BASE-OK] goto :msg_distribution-base-ok
if [%~1]==[ERROR-DISTRIBUTION-GENERIC] goto :msg_error-distribution-generic
if [%~1]==[ERROR-DISTRIBUTION-NO-SOURCE] goto :msg_error-distribution-no-source
if [%~1]==[ERROR-DISTRIBUTION-NO-PACKAGES] goto :msg_error-distribution-no-packages
if [%~1]==[ERROR-DISTRIBUTION-NO-DROPBOX] goto :msg_error-distribution-no-dropbox
if [%~1]==[ERROR-DISTRIBUTION-BASE-NO-DROPBOX] goto :msg_error-distribution-base-no-dropbox
if [%~1]==[ERROR-NO-SOURCE] goto :msg_error-no-source
if [%~1]==[CUSTOM] goto :msg_custom
if [%~1]==[END] goto :msg_end
goto :end

:msg_settings-packager-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л         Compiler set to %packager% !       л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_settings-dropbox-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л         Dropbox path set to %dropboxdir% !       л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_settings-version-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л       Working version set to %working_version% !       л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_source-building-ok
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л         Building source done successfully          л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_source-restoring
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л     Restore base will start please be patient      л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_source-restoring-ok
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л         Restoring base done successfully           л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_source-language-exists
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л              Language already exists               л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
goto :end

:msg_source-language-created
cls
echo.
echo              ммммммммммммммммммммммммммммммммммммммммммммммммммм
echo         кФФФФл                Language created!!               лФФФФП
echo        кй    лмммммммммммммммммммммммммммммммммммммммммммммммммл    РП
echo  ммммммЯмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммЯмммммм
echo  лЩЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЛл
echo  лК                                                                       Кл
echo  лК   Don't forget to change the blank language flag in all themes in     Кл
echo  лК                                                                       Кл
echo  лК  bin\base\XMBMANPLS\USRDIR\IMAGES\THEMENAME\languages\*langcode*.png  Кл
echo  лК                                                                       Кл
echo  лК  *langcode* = to the name that you entered in second process          Кл
echo  лК  Exemple: en-US, fr-FR, es-ES, de-DE, pl-PL, pt-PT, etc....           Кл
echo  лМ                                                                       Шл
echo  лмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммл
echo.
%external%\wait 2
goto :end

:msg_source-theme-exists
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л              Theme id already exists               л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
goto :end

:msg_source-theme-created
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л             Theme created successfully             л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_building
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л        Build will start please be patient          л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_build-ok
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л             Building done successfully             л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_distribution
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л    Distribution will start please be patient       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_distribution-ok
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л             Distributed Successfully !             л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_distribution-base-upload
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л            Uploading Source in Progress            л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_distribution-base-download
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л           Downloading Source in Progress           л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_distribution-base-ok
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л     Local and dropbox Base Source Sincronized!     л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end


:msg_error-no-source
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л   Package source not builded, build source first   л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_error-distribution-generic
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л               Distributed Failed !!                л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_error-distribution-no-source
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л    Packages not distributed, build source first    л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_error-distribution-no-packages
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л   Packages not distributed, build packages first   л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_error-distribution-no-dropbox
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л   Packages not distributed, dropbox doesn't exist  л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_error-distribution-base-no-dropbox
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л  Base source not sincronized,dropbox doesn't exist л
echo        лЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_custom
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
echo          %~2
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:msg_end
cls
echo.
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo        л                                                    л
echo        л        Will now return to XMBM+ Builder Menu       л
echo        л                                                    л
echo        лллллллллллллллллллллллллллллллллллллллллллллллллллллл
echo.
%external%\wait 2
goto :end

:end
