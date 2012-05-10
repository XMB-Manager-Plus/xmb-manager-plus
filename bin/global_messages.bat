@echo off
title Build Themes
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H

:first
if [%~1]==[CHECKING] goto :msg_checking
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
if [%~1]==[SOURCE-PERSONALAREA-LINK-ADDED] goto :msg_source-personalarea-link-added
if [%~1]==[SOURCE-PERSONALAREA-FOLDER-ADDED] goto :msg_source-personalarea-folder-added
if [%~1]==[SOURCE-PERSONALAREA-PACKAGE-ADDED] goto :msg_source-personalarea-package-added
if [%~1]==[BUILDING] goto :msg_building
if [%~1]==[BUILD-OK] goto :msg_build-ok
if [%~1]==[DISTRIBUTION] goto :msg_distribution
if [%~1]==[DISTRIBUTION-OK] goto :msg_distribution-ok
if [%~1]==[DISTRIBUTION-BASE-UPLOAD] goto :msg_distribution-base-upload
if [%~1]==[DISTRIBUTION-BASE-DOWNLOAD] goto :msg_distribution-base-download
if [%~1]==[DISTRIBUTION-BASE-OK] goto :msg_distribution-base-ok
if [%~1]==[UPDATEFROMGIT_OK] goto :msg_updatefromgit-ok
if [%~1]==[ERROR-DISTRIBUTION-GENERIC] goto :msg_error-distribution-generic
if [%~1]==[ERROR-DISTRIBUTION-NO-SOURCE] goto :msg_error-distribution-no-source
if [%~1]==[ERROR-DISTRIBUTION-NO-PACKAGES] goto :msg_error-distribution-no-packages
if [%~1]==[ERROR-DISTRIBUTION-NO-DROPBOX] goto :msg_error-distribution-no-dropbox
if [%~1]==[ERROR-DISTRIBUTION-BASE-NO-DROPBOX] goto :msg_error-distribution-base-no-dropbox
if [%~1]==[ERROR-NO-SOURCE] goto :msg_error-no-source
if [%~1]==[CUSTOM] goto :msg_custom
if [%~1]==[END] goto :msg_end
goto :end

:msg_checking
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}             Checking your environment{04}             �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
goto :end

:msg_settings-packager-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {0E}                Compiler set to %packager% !{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_settings-dropbox-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �  {08}����������������������������������������������ͻ  {04}�{\n}
%external%\cecho {04}        � {08}ͼ{0F}  Dropbox path set to:{08}                        �� {04}�{\n}
%external%\cecho {0E}              %dropboxdir% {\n}
%external%\cecho {04}        � {08}ͻ                                              �� {04}�{\n}
%external%\cecho {04}        �  {08}����������������������������������������������ͼ  {04}�{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_settings-version-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}      Working version set to %working_version% !{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-building-ok
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}        Building source done successfully{04}          �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-restoring
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}    Restore base will start please be patient{04}      �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-restoring-ok
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}        Restoring base done successfully{04}           �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-language-exists
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}             Language already exists{04}               �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
goto :end

:msg_source-language-created
cls
echo.
%external%\cecho {04}              ���������������������������������������������������{\n}
%external%\cecho {04}              �                                                 �{\n}
%external%\cecho {04}         ������ {0E}               Language created !!{04}              ����Ŀ{\n}
%external%\cecho {04}        ��    ���������������������������������������������������    ��{\n}
%external%\cecho {04}  ������{0E}�{04}�������������������������������������������������������������{0E}�{04}������{\n}
%external%\cecho {04}  � {08}���������������������������������������������������������������������ͻ{04} �{\n}
%external%\cecho {04}  � {08}�                                                                     {08}�{04} �{\n}
%external%\cecho {04}  � {08}�   {0C}Don't forget{0F} to change the blank language flag in all themes in   {08}�{04} �{\n}
%external%\cecho {04}  � {08}�                                                                     {08}�{04} �{\n}
%external%\cecho {04}  � {08}�  {0F}bin\base\XMBMANPLS\USRDIR\IMAGES\THEMENAME\languages\*langcode*.png{08}�{04} �{\n}
%external%\cecho {04}  � {08}�                                                                     {08}� {04}�{\n}
%external%\cecho {04}  � {08}�  {0F}*langcode* = to the name that you entered in second process        {08}� {04}�{\n}
%external%\cecho {04}  � {08}�  {0F}Exemple: en-US, fr-FR, es-ES, de-DE, pl-PL, pt-PT, etc....         {08}� {04}�{\n}
%external%\cecho {04}  �{08}ͼ                                                                     ��{04}�{\n}
%external%\cecho {04}  ���������������������������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-theme-exists
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}             Theme id already exists{04}               �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
goto :end

:msg_source-theme-created
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}            Theme created successfully{04}             �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F} Dont forget to edit PNG and themeinfo.xml files{04}   �{\n}
%external%\cecho {04}        � {0F} The next process will open corresponding file{04}     �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-personalarea-package-added
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}     Package folder added to Personal Area{04}         �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-personalarea-folder-added
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}    File Manager Folder added to Personal Area{04}     �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_source-personalarea-link-added
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}            Link added to Personal Area{04}            �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_building
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}       Build will start please be patient{04}          �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_build-ok
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}            Building done successfully{04}             �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_distribution
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}   Distribution will start please be patient{04}      �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_distribution-ok
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}            Distributed Successfully !{04}             �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_distribution-base-upload
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}           Uploading Source in Progress{04}            �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_distribution-base-download
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}          Downloading Source in Progress{04}           �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_distribution-base-ok
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}    Local and dropbox Base Source Sincronized!{04}     �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_updatefromgit-ok
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}              Updated Successfully !{04}               �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_error-no-source
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}  Package source not builded, build source first{04}   �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_error-distribution-generic
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}              Distributed Failed !!{04}                �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_error-distribution-no-source
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}   Packages not distributed, build source first{04}    �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_error-distribution-no-packages
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}  Packages not distributed, build packages first{04}   �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_error-distribution-no-dropbox
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E}  Packages not distributed, dropbox doesn't exist{04}  �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_error-distribution-base-no-dropbox
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0E} Base source not sincronized,dropbox doesn't exist{04} �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:msg_custom
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
echo.
%external%\cecho {0E}          %~2
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
%external%\wait 2
goto :end

:msg_end
cls
echo.
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        � {0F}       Will now return to XMBM+ Builder Menu{04}       �{\n}
%external%\cecho {04}        �                                                    �{\n}
%external%\cecho {04}        ������������������������������������������������������{\n}
%external%\cecho {0F}{\n}
%external%\wait 2
goto :end

:end
