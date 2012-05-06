@echo off
title Add new language
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
echo        Û                  Add new language                  Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
echo        Û    Type the new languague name, code and author    Û
echo        Û                                                    Û
echo        ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
echo.
echo.
:ask_langname
set /p langname= Language name: 
if ["%langname%"]==[""] goto :ask_langname
echo.
echo        ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo        Û                                                    Û
echo        Û                    Language code                   Û
echo        ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ
echo        Û                                                    Û
echo        Û  Examples: en-US, fr-FR, es-ES, de-DE,pt-PT, etc   Û
echo        Û                                                    Û
echo        Û  See more language codes:                          Û
echo        Û  http://www.i18nguy.com/unicode/language-identifiers.html
echo        Û                                                    Û
echo        ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
echo.
:ask_langcode
set /p langcode= Language code: 
if ["%langcode%"]==[""] goto :ask_langcode
if exist %bindir%\languages\%langcode%.ini (
call "%bindir%\global_messages.bat" "SOURCE-LANGUAGE-EXISTS"
goto :ask_langcode
)
:ask_langauthor
set /p langauthor= Language author: 
if ["%langauthor%"]==[""] goto :ask_langauthor
call "%bindir%\global_messages.bat" "BUILDING"
:: Create and add variables to language ini
copy "%bindir%\languages\en-US.ini" "%bindir%\languages\%langcode%.ini" > NUL
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%bindir%\languages" --include "%langcode%.ini" --alter --search "LANGUAGE-CODE=en-US" --replace "LANGUAGE-CODE=%langcode%"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%bindir%\languages" --include "%langcode%.ini" --alter --search "American English (en-US)" --replace "%langname% (%langcode%)"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%bindir%\languages" --include "%langcode%.ini" --alter --search "Built: 2012-04-14" --replace "Built: %DATE%"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%bindir%\languages" --include "%langcode%.ini" --alter --search "Author: Team XMBM+" --replace "Author: %langauthor%"
:: Add new language variables to all languages ini
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%bindir%\languages" --include "*.ini" --alter --search "LANG_TITL_SETTINGS-THEMES-MAIN" --replace "LANG_TITL_SETTINGS-LANGUAGES-PACKS-%langcode%=%langname%/SSR_CR//SSR_LF/LANG_INFO_SETTINGS-LANGUAGES-PACKS-%langcode%=Autor: %langauthor%/SSR_CR//SSR_LF/LANG_TITL_SETTINGS-THEMES-MAIN"
:: Add language to game_settings.xml
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "<Table key=''english''>" --replace "<Table key=''%langcode%''>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''icon''><String>/dev_hdd0/game/XMBMANPLS/USRDIR/IMAGES/languages/%langcode%.png</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''title''><String>LANG_TITL_SETTINGS-LANGUAGES-PACKS-%langcode%</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''info''><String>LANG_INFO_SETTINGS-LANGUAGES-PACKS-%langcode%</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''module_name''><String>webbrowser_plugin</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''module_action''><String>http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/LANGUAGEPACKS/XMBM%2BvURL-XMBMP-VERSION-LANGUAGEPACK-%langcode%.pkg</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/</Table>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Table key=''english''>"
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "attr=''polish''/>" --replace "attr=''polish''/>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Item class=''type:x-xmb/module-action'' key=''%langcode%'' attr=''%langcode%''/>"
:: Create language image for all themes
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %pkgbase%\XMBMANPLS\USRDIR\IMAGES\*.') DO (
copy "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\ORIGINAL\languages\other.png" "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%%Y\languages\%langcode%.png" > NUL
%bindir%\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%%Y" --include "themeinfo.xml" --alter --search "</XMBML>" --replace "<View id=''seg_current_theme_%langcode%''>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB/<Attributes>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Table key=''current_theme''>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''icon''><String>/dev_hdd0/game/XMBMANPLS/USRDIR/IMAGES/settings.png</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''title''><String>[%langcode%]_TITL_SETTINGS-THEMES-PACKS</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''info''><String>[%langcode%]_INFO_SETTINGS-THEMES-PACKS</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/</Table>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB/</Attributes>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB/<Items>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Query class=''type:x-xmb/module-action'' key=''current_theme'' attr=''current_theme''/>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB/</Items>/SSR_CR//SSR_LF//SSR_TAB/</View>/SSR_CR//SSR_LF//SSR_CR//SSR_LF/</XMBML>"
)

:done
call "%bindir%\global_messages.bat" "SOURCE-LANGUAGE-CREATED"
goto :end

:end
start %external%\notepad\notepad++.exe "%bindir%\languages\%langcode%.ini"
