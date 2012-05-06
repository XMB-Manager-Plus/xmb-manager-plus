@echo off
title Add new theme
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
if %encoding_prep%==yes goto :first
if %encoding_prep%==no goto :encodingprep
:encodingprep
ssr --nobackup --recurse --encoding ansi --dir "%bindir%" --include "settings.ini" --alter --search "encoding_prep=no" --replace "encoding_prep=yes"
start encoding_prep.bat

:first
cls
echo.
echo.
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo        Û                                                    Û
echo        Û                    Add new theme                   Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
echo        Û  Type the new theme id, title, info and author     Û
echo        Û                                                    Û
echo        Û  Theme id (uppercase, only alphabetic characters)  Û
echo        Û  Examples: BLUE; RED; BLACK; GREY                  Û
echo        Û                                                    Û
echo        ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
echo.
echo.
:ask_themeid
set /p themeid= Theme id: 
if ["%themeid%"]==[""] goto :ask_themeid
if exist "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%\" (
call "%bindir%\global_messages.bat" "SOURCE-THEME-EXISTS"
goto :ask_themeid
)
echo.
echo        ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo        Û                                                    Û
echo        Û                   Theme title                      Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
echo        Û              Example: Grey theme                   Û
echo        Û                                                    Û
echo        ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo.
:ask_themetitle
set /p themetitle= Theme title: 
if ["%themetitle%"]==[""] goto :ask_themetitle
echo.
echo        ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo        Û                                                    Û
echo        Û                    Theme info                      Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
echo        Û        Example: Theme with icons in grey           Û
echo        Û                                                    Û
echo        ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo.
:ask_themeinfo
set /p themeinfo= Theme info: 
if ["%themeinfo%"]==[""] goto :ask_themeinfo
echo.
:ask_themeauthor
set /p themeauthor= Theme author: 
if ["%themeauthor%"]==[""] goto :ask_themeauthor
call "%bindir%\global_messages.bat" "BUILDING"
:: Create new theme folder
mkdir "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%" >NUL
xcopy /E "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\ORIGINAL" "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%\" >NUL
:: Add new theme variables to all languages ini
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%bindir%\languages" --include "*.ini" --alter --search "LANG_TITL_SETTINGS-ABOUT-MAIN" --replace "LANG_TITL_SETTINGS-THEMES-PACKS-%themeid%=%themetitle%/SSR_CR//SSR_LF/LANG_INFO_SETTINGS-THEMES-PACKS-%themeid%=%themeinfo%. Author: %themeauthor%/SSR_CR//SSR_LF/LANG_TITL_SETTINGS-ABOUT-MAIN"
:: Add theme to game_settings.xml
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "<Table key=''original''>" --replace "<Table key=''%themeid%''>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''icon''><String>/dev_hdd0/game/XMBMANPLS/USRDIR/IMAGES/settings.png</String></Pair><Pair key=''title''><String>LANG_TITL_SETTINGS-THEMES-PACKS-%themeid%</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''info''><String>LANG_INFO_SETTINGS-THEMES-PACKS-%themeid%</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''module_name''><String>webbrowser_plugin</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''module_action''><String>http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/THEMEPACKS/XMBM%2BvURL-XMBMP-VERSION-THEMEPACK-%themeid%.pkg</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/</Table>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Table key=''original''>"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "attr=''blue''/>" --replace "attr=''blue''/>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Item class=''type:x-xmb/module-action'' key=''%themeid%'' attr=''%themeid%''/>"

:done
call "%bindir%\global_messages.bat" "SOURCE-THEME-CREATED"
goto :end

:end
start explorer.exe "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%\"
start %external%\notepad\notepad++.exe "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%\themeinfo.xml"
