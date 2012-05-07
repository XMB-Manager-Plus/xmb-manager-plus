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
echo        ������������������������������������������������������
echo        �                                                    �
echo        �         Compiler set to %packager% !       �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_settings-dropbox-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �         Dropbox path set to %dropboxdir% !       �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_settings-version-changed
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �       Working version set to %working_version% !       �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_source-building-ok
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �         Building source done successfully          �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_source-restoring
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �     Restore base will start please be patient      �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_source-restoring-ok
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �         Restoring base done successfully           �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_source-language-exists
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �              Language already exists               �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
goto :end

:msg_source-language-created
cls
echo.
echo              ���������������������������������������������������
echo         ������                Language created!!               ����Ŀ
echo        ��    ���������������������������������������������������    ��
echo  ���������������������������������������������������������������������������
echo  ������������������������������������������������������������������������ͻ�
echo  ۺ                                                                       ��
echo  ۺ   Don't forget to change the blank language flag in all themes in     ��
echo  ۺ                                                                       ��
echo  ۺ  bin\base\XMBMANPLS\USRDIR\IMAGES\THEMENAME\languages\*langcode*.png  ��
echo  ۺ                                                                       ��
echo  ۺ  *langcode* = to the name that you entered in second process          ��
echo  ۺ  Exemple: en-US, fr-FR, es-ES, de-DE, pl-PL, pt-PT, etc....           ��
echo  ۼ                                                                       ��
echo  ���������������������������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_source-theme-exists
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �              Theme id already exists               �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
goto :end

:msg_source-theme-created
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �             Theme created successfully             �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_building
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Build will start please be patient          �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_build-ok
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �             Building done successfully             �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_distribution
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �    Distribution will start please be patient       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_distribution-ok
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �             Distributed Successfully !             �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_distribution-base-upload
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �            Uploading Source in Progress            �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_distribution-base-download
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �           Downloading Source in Progress           �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_distribution-base-ok
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �     Local and dropbox Base Source Sincronized!     �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end


:msg_error-no-source
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �   Package source not builded, build source first   �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_error-distribution-generic
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �               Distributed Failed !!                �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_error-distribution-no-source
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �    Packages not distributed, build source first    �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_error-distribution-no-packages
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �   Packages not distributed, build packages first   �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_error-distribution-no-dropbox
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �   Packages not distributed, dropbox doesn't exist  �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_error-distribution-base-no-dropbox
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  Base source not sincronized,dropbox doesn't exist �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_custom
cls
echo.
echo        ������������������������������������������������������
echo.
echo          %~2
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:msg_end
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Will now return to XMBM+ Builder Menu       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
%external%\wait 2
goto :end

:end
