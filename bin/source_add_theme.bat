@echo off
title Add new theme
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
cls
echo.
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}                   Add new theme{04}                   л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лммммммммммммммммммммммммммммммммммммммммммммммммммммл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F} Type the new theme id, title, info and author{04}     л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F} Theme id (uppercase, only alphabetic characters){04}  л{\n}
%external%\cecho {04}        л {0F} Examples: BLUE; RED; BLACK; GREY{04}                  л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {0F}{\n}
echo.
:ask_themeid
set /p themeid= Theme id: 
if ["%themeid%"]==[""] goto :ask_themeid
if exist "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%\" (
call "%bindir%\global_messages.bat" "SOURCE-THEME-EXISTS"
goto :ask_themeid
)
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}                  Theme title{04}                      л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лммммммммммммммммммммммммммммммммммммммммммммммммммммл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F}             Example: Grey theme{04}                   л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {0F}{\n}
:ask_themetitle
set /p themetitle= Theme title: 
if ["%themetitle%"]==[""] goto :ask_themetitle
echo.
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0E}                   Theme info{04}                       л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лммммммммммммммммммммммммммммммммммммммммммммммммммммл{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        л {0F}       Example: Theme with icons in grey{04}           л{\n}
%external%\cecho {04}        л                                                    л{\n}
%external%\cecho {04}        лллллллллллллллллллллллллллллллллллллллллллллллллллллл{\n}
%external%\cecho {0F}{\n}
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
%external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%languageinisdir%" --include "*.ini" --alter --search "LANG_TITL_SETTINGS-ABOUT-MAIN" --replace "LANG_TITL_SETTINGS-THEMES-PACKS-%themeid%=%themetitle%/SSR_CR//SSR_LF/LANG_INFO_SETTINGS-THEMES-PACKS-%themeid%=%themeinfo%. Author: %themeauthor%/SSR_CR//SSR_LF/LANG_TITL_SETTINGS-ABOUT-MAIN"
:: Add theme to game_settings.xml
%external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "<Table key=''original''>" --replace "<Table key=''%themeid%''>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''icon''><String>/dev_hdd0/game/XMBMANPLS/USRDIR/IMAGES/settings.png</String></Pair><Pair key=''title''><String>LANG_TITL_SETTINGS-THEMES-PACKS-%themeid%</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''info''><String>LANG_INFO_SETTINGS-THEMES-PACKS-%themeid%</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''module_name''><String>webbrowser_plugin</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB//SSR_TAB/<Pair key=''module_action''><String>http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/THEMEPACKS/XMBM%2BvURL-XMBMP-VERSION-THEMEPACK-%themeid%.pkg</String></Pair>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/</Table>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Table key=''original''>"
%external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgbase%\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "attr=''blue''/>" --replace "attr=''blue''/>/SSR_CR//SSR_LF//SSR_TAB//SSR_TAB//SSR_TAB/<Item class=''type:x-xmb/module-action'' key=''%themeid%'' attr=''%themeid%''/>"

:done
call "%bindir%\global_messages.bat" "SOURCE-THEME-CREATED"
start explorer.exe "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%\"
start %external%\notepad\notepad++.exe "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%themeid%\themeinfo.xml"
goto :end

:end
exit
