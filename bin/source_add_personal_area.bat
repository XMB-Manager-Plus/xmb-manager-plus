@echo off
title Add new theme
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                Add Personal Area                   �
echo        ������������������������������������������������������
IF EXIST "%pkgbase%\XMBMANPLS\USRDIR\FEATURES\Personal_Area.offline" goto :create_personal_area
IF EXIST "%pkgbase%\XMBMANPLS\USRDIR\FEATURES\Personal_Area.xml" goto :edit_personal_area
goto :end

:create_personal_area
echo        �                                                    �
echo        �  This will had a personal area to base source      �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
echo.
:ask_confirm
set /P choice= Do you want to add your personal area to base source? (Y/N): 
If /I [%choice%]==[Y] goto :add_to_source
If /I [%choice%]==[y] goto :add_to_source
If /I [%choice%]==[N] goto :done
If /I [%choice%]==[n] goto :done
goto :ask_confirm

:add_to_source
MOVE /Y "%pkgbase%\XMBMANPLS\USRDIR\FEATURES\Personal_Area.offline"  "%pkgbase%\XMBMANPLS\USRDIR\FEATURES\Personal_Area.xml"
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �        Personal Area added to base source          �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
wait 2
goto :first

:edit_personal_area
echo        �                                                    �
echo        �  What do you want to add?                          �
echo        �                                                    �
echo        �  1. Installable Package folder                     �
echo        �  2. File manager folder                            �
echo        �  3. Link                                           �
echo        �                                                    �
echo        �  0. Reset and remove Personal area from base       �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
echo.
:ask_option
set /p option= Choose an option: 
if ["%option%"]==["1"] goto :add_package
if ["%option%"]==["2"] goto :add_filemanager
if ["%option%"]==["3"] goto :add_link
if ["%option%"]==["0"] goto :remove_from_source
goto :ask_option

:remove_from_source
del /Q /S "%pkgbase%\XMBMANPLS\USRDIR\FEATURES\Personal_Area.xml" >NUL
copy "%bindir%\base.original\XMBMANPLS\USRDIR\FEATURES\Personal_Area.offline" "%pkgbase%\XMBMANPLS\USRDIR\FEATURES\Personal_Area.offline"
cls
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �       Personal Area removed to base source         �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
wait 2
goto :first

::
:: ADD PACKAGE FOLDER
:: 

:add_package
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                Package Folder title                �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                Example: USB packages               �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
:ask_packagetitle
set /p packagetitle= Package Folder title: 
if ["%packagetitle%"]==[""] goto :ask_packagetitle
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �               Package Folder info                  �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �             Example: My packages on USB            �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
set /p packageinfo= Package Folder info: 
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �               Package Folder path                  �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  Example:                                          �
echo        �  - /dev_hdd0/packages                              �
echo        �  - /dev_usb000/packages                            �
echo        �  - /dev_usb001/packages/multiman                   �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
:ask_packagepath
set /p packagepath= Package Folder path: 
if ["%packagepath%"]==[""] goto :ask_packagepath

:: Generate random ID
set /a ID=%random%*10000/32767+1
:: Make changes
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Packages attributes -->" --replace "<!-- Packages attributes -->/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Table key=''p%ID%''><Pair key=''icon''><String>/dev_hdd0/game/XMBMANPLS/USRDIR/IMAGES/pkgmanager.png</String></Pair><Pair key=''title''><String>%packagetitle%</String></Pair><Pair key=''info''><String>%packageinfo%</String></Pair><Pair key=''str_noitem''><String>msg_tool_no_package</String></Pair><Pair key=''child''><String>segment</String></Pair></Table>"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Packages items -->" --replace "<!-- Packages items -->/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Query class=''type:x-xmb/xmlpackagefolder'' key=''p%ID%'' attr=''p%ID%'' src=''#seg_personalarea_packages_p%ID%''/>"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Packages subitems -->" --replace "<!-- Packages subitems -->/SSR_CR//SSR_LF//SSR_TAB/<View id=''seg_personalarea_packages_p%ID%''><Items><Query class=''type:x-xmb/xmlpackagefolder'' key=''sp%ID%'' src=''host://localhost/q?path=%packagepath%&suffix=.pkg&subclass=x-host/package''/></Items></View>"
call "%bindir%\global_messages.bat" "SOURCE-PERSONALAREA-PACKAGE-ADDED"
goto :ask_confirm_end

::
:: ADD FILE MANAGER FOLDER
:: 

:add_filemanager
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �             File Manager Folder title              �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �              Example: My Games (USB)               �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
:ask_filemanagertitle
set /p filemanagertitle= File Manager Folder title: 
if ["%filemanagertitle%"]==[""] goto :ask_filemanagertitle
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �              File Manager Folder info              �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �              Example: My games on USB              �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
set /p filemanagerinfo= File Manager Folder info: 
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �             File Manager Folder path               �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  Example:                                          �
echo        �  - /dev_hdd0/game                                  �
echo        �  - /dev_usb000/GAMES                               �
echo        �  - /dev_usb001/GAMEZ                               �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
:ask_filemanagerpath
set /p filemanagerpath= File Manager path: 
if ["%filemanagerpath%"]==[""] goto :ask_filemanagerpath

:: Generate random ID
set /a ID=%random%*10000/32767+1
:: Make changes
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Folders attributes -->" --replace "<!-- Folders attributes -->/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Table key=''f%ID%''><Pair key=''icon''><String>/dev_hdd0/game/XMBMANPLS/USRDIR/IMAGES/filemanager.png</String></Pair><Pair key=''title''><String>%filemanagertitle%</String></Pair><Pair key=''info''><String>%filemanagerinfo%</String></Pair><Pair key=''str_noitem''><String>msg_no_data</String></Pair><Pair key=''child''><String>segment</String></Pair></Table>"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Folders items -->" --replace "<!-- Folders items -->/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Query class=''type:x-xmb/folder-pixmap'' key=''f%ID%'' attr=''f%ID%'' src=''#seg_personalarea_folders_f%ID%''/>"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Folders subitems -->" --replace "<!-- Folders subitems -->/SSR_CR//SSR_LF//SSR_TAB/<View id=''seg_personalarea_folders_f%ID%''><Items><Query class=''type:x-xmb/folder-pixmap'' key=''sf%ID%'' src=''host://localhost%filemanagerpath%''/></Items></View>"
call "%bindir%\global_messages.bat" "SOURCE-PERSONALAREA-FOLDER-ADDED"
goto :ask_confirm_end


::
:: ADD LINKS
:: 

:add_link
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                    Link title                      �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                   Example: NASA                    �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
:ask_linktitle
set /p linktitle= Link title: 
if ["%linktitle%"]==[""] goto :ask_linktitle
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                     Link info                      �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �               Example: Nasa Homepage               �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
set /p linkinfo= Link info: 
echo.
echo        ������������������������������������������������������
echo        �                                                    �
echo        �                     Link URL                       �
echo        ������������������������������������������������������
echo        �                                                    �
echo        �  Example: http://www.nasa.gov                      �
echo        �                                                    �
echo        ������������������������������������������������������
echo.
:ask_linkurl
set /p linkurl= Link URL: 
if ["%linkurl%"]==[""] goto :ask_linkurl

:: Generate random ID
set /a ID=%random%*10000/32767+1
:: Make changes
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Links attributes -->" --replace "<!-- Links attributes -->/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Table key=''l%ID%''><Pair key=''icon''><String>/dev_hdd0/game/XMBMANPLS/USRDIR/IMAGES/network.png</String></Pair><Pair key=''title''><String>%linktitle%</String></Pair><Pair key=''info''><String>%linkinfo%</String></Pair><Pair key=''module_name''><String>webbrowser_plugin</String></Pair><Pair key=''module_action''><String>%linkurl%</String></Pair></Table>"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "<!-- Links items -->" --replace "<!-- Links items -->/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Item class=''type:x-xmb/module-action'' key=''l%ID%'' attr=''l%ID%''/>"
call "%bindir%\global_messages.bat" "SOURCE-PERSONALAREA-LINK-ADDED"

:ask_confirm_end
set /P choice= Do you want to add more items (Y/N): 
If /I [%choice%]==[Y] goto :first
If /I [%choice%]==[y] goto :first
If /I [%choice%]==[N] goto :done
If /I [%choice%]==[n] goto :done
goto :ask_confirm_end

:done
call "%bindir%\global_messages.bat" "END"
goto :end

:end
exit