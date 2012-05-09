@echo off
title Build Source
for /f "tokens=1,2 delims==" %%G in (settings.ini) do set %%G=%%H
call "%bindir%\global_prechecks.bat" %0

:first
call "%bindir%\global_messages.bat" "BUILDING"
if exist "%pkgsource%" rmdir /Q /S "%pkgsource%"
if not exist "%pkgsource%" mkdir "%pkgsource%"
echo.
echo CREATING language packs source files ...
echo.
FOR /F "tokens=*" %%A IN ('CHCP') DO FOR %%B IN (%%~A) DO SET CodePage=%%B
chcp 65001 >NUL
if exist "%pkgsource%\languagepacks" rmdir /Q /S "%pkgsource%\languagepacks"
for /f "tokens=1,2 delims=." %%X IN ('dir /b %languageinisdir%\*.ini') DO (
echo - %%X language pack source files ...
if not exist "%pkgsource%\languagepacks\%%X\XMBMANPLS" mkdir "%pkgsource%\languagepacks\%%X\XMBMANPLS"
xcopy /E "%pkgbase%\XMBMANPLS\*.*" "%pkgsource%\languagepacks\%%X\XMBMANPLS" >NUL
if exist "%pkgsource%\languagepacks\%%X\XMBMANPLS\*.pkg" del /Q /S "%pkgsource%\languagepacks\%%X\XMBMANPLS\*.pkg" >NUL
if exist "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\IMAGES" rmdir /Q /S "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\IMAGES" >NUL
if exist "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\THEMES" rmdir /Q /S "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\THEMES" >NUL
for /f "tokens=1,2 delims==" %%G IN (%languageinisdir%\%%X.ini) DO (
FOR /F "tokens=1,2 delims=-" %%E IN ('echo %%G') DO (
FOR /F "tokens=1,2,3 delims=_" %%O IN ('echo %%E') DO (
IF [%%Q]==[MAIN] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR" --include "game_main.xml" --alter --search "%%G" --replace "%%H"
IF [%%Q]==[SETTINGS] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "%%G" --replace "%%H"
IF [%%Q]==[FILEMANAGER] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES" --include "File_Manager.xml" --alter --search "%%G" --replace "%%H"
IF [%%Q]==[GAMEDATAMANAGER] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES" --include "Game_Data_Manager.xml" --alter --search "%%G" --replace "%%H"
IF [%%Q]==[GAMEMANAGER] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES" --include "Game_Manager.xml" --alter --search "%%G" --replace "%%H"
IF [%%Q]==[WEBLINKS] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES" --include "Links.xml" --alter --search "%%G" --replace "%%H"
IF [%%Q]==[MULTIMEDIAMANAGER] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES" --include "Multimedia_Manager.xml" --alter --search "%%G" --replace "%%H"
IF [%%Q]==[PACKAGEMANAGER] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES" --include "Package_Manager.xml" --alter --search "%%G" --replace "%%H"
IF EXIST "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES\Personal_Area.xml" IF [%%Q]==[PERSONALAREA] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR\FEATURES" --include "Personal_Area.xml" --alter --search "%%G" --replace "%%H"
)
)
)
%external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "URL-XMBMP-VERSION" --replace "%working_version%"
%external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\languagepacks\%%X\XMBMANPLS\USRDIR" --include "*.xml" --alter --search "FILEPROVIDER_BASE_URL" --replace "%fileprovider_base_url%"
)
echo.
echo CREATING theme packs source files ...
echo.
if exist "%pkgsource%\themepacks" rmdir /Q /S "%pkgsource%\themepacks"
for /f "tokens=1,2 delims=." %%Y IN ('dir /b %pkgbase%\XMBMANPLS\USRDIR\IMAGES\*.') DO (
echo - %%Y theme pack source files ...

if not exist "%pkgsource%\themepacks\%%Y\XMBMANPLS" mkdir "%pkgsource%\themepacks\%%Y\XMBMANPLS"
xcopy /E "%pkgbase%\XMBMANPLS\*.*" "%pkgsource%\themepacks\%%Y\XMBMANPLS" >NUL
if exist "%pkgsource%\themepacks\%%Y\XMBMANPLS\*.pkg" del /Q /S "%pkgsource%\themepacks\%%Y\XMBMANPLS\*.pkg" >NUL
if exist "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\*.xml" del /Q /S "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\*.xml" >NUL
if exist "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\FEATURES" rmdir /Q /S "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\FEATURES" >NUL
move /Y "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\IMAGES\%%Y" "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\"
if exist "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\IMAGES" rmdir /Q /S "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\IMAGES" >NUL
echo rename "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\%%Y" "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\IMAGES"
rename %pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\%%Y IMAGES
copy "%pkgbase%\XMBMANPLS\USRDIR\IMAGES\%%Y\themeinfo.xml" "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\IMAGES\themeinfo.xml"
for /f "tokens=1,2 delims=." %%S IN ('dir /b %languageinisdir%\*.ini') DO (
for /f "tokens=1,2 delims==" %%G in (%languageinisdir%\%%S.ini) DO (
IF [%%G]==[LANG_TITL_SETTINGS-THEMES-PACKS-%%Y] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\IMAGES" --include "themeinfo.xml" --alter --search "[%%S]_TITL_SETTINGS-THEMES-PACKS" --replace "%%H"
IF [%%G]==[LANG_INFO_SETTINGS-THEMES-PACKS-%%Y] %external%\ssr\ssr --nobackup --recurse --encoding utf8 --dir "%pkgsource%\themepacks\%%Y\XMBMANPLS\USRDIR\IMAGES" --include "themeinfo.xml" --alter --search "[%%S]_INFO_SETTINGS-THEMES-PACKS" --replace "%%H"
)
)
)
chcp %CodePage% >NUL
echo.
echo CREATING core source files ...
echo.
FOR %%A IN (hdd0 usb000 usb001 usb006) DO (
echo - core %%A source files ...
if exist "%pkgsource%\core-%%A" rmdir /Q /S "%pkgsource%\core-%%A" >NUL
if not exist "%pkgsource%\core-%%A\XMBMANPLS" mkdir "%pkgsource%\core-%%A\XMBMANPLS" >NUL
xcopy /E "%pkgbase%\XMBMANPLS\*.*" "%pkgsource%\core-%%A\XMBMANPLS" >NUL
if exist "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\*.xml" del /Q /S "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\*.xml" >NUL
if exist "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\FEATURES" rmdir /Q /S "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\FEATURES" >NUL
if exist "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\IMAGES" rmdir /Q /S "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\IMAGES" >NUL
xcopy /E "%pkgsource%\languagepacks\en-US\XMBMANPLS\USRDIR\*.*" "%pkgsource%\core-%%A\XMBMANPLS\USRDIR" >NUL
if not exist "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\IMAGES" mkdir "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\IMAGES" >NUL
xcopy /E "%pkgsource%\themepacks\ORIGINAL\XMBMANPLS\USRDIR\IMAGES" "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\IMAGES\" >NUL
if not %%A==hdd0 %external%\ssr\ssr  --nobackup --recurse --encoding auto --dir "%pkgsource%\core-%%A\XMBMANPLS\USRDIR" --include "*.xml" --alter --search "/dev_hdd0/game/XMBMANPLS/USRDIR/" --replace "/dev_%%A/PS3/XMB/"
if not %%A==hdd0 del "%pkgsource%\core-%%A\XMBMANPLS\PARAM.SFO"
if not %%A==hdd0 del "%pkgsource%\core-%%A\XMBMANPLS\ICON0.PNG"
if not %%A==hdd0 del "%pkgsource%\core-%%A\XMBMANPLS\PS3LOGO.DAT"
if not %%A==hdd0 mkdir "%pkgsource%\core-%%A\PS3"
if not %%A==hdd0 xcopy "%pkgsource%\core-%%A\XMBMANPLS" "%pkgsource%\core-%%A\PS3" /s
if not %%A==hdd0 mkdir "%pkgsource%\core-%%A\PS3\XMB"
if not %%A==hdd0 xcopy "%pkgsource%\core-%%A\PS3\USRDIR" "%pkgsource%\core-%%A\PS3\XMB" /s
if not %%A==hdd0 rmdir /s /q "%pkgsource%\core-%%A\XMBMANPLS"
if not %%A==hdd0 rmdir /s /q "%pkgsource%\core-%%A\PS3\USRDIR" 
)
echo.
echo CREATING HFW core source files ...
echo.
if exist "%pkgsource%\core-HFW" rmdir /Q /S "%pkgsource%\core-HFW" >NUL
if not exist "%pkgsource%\core-HFW\XMBMANPLS" mkdir "%pkgsource%\core-HFW\XMBMANPLS" >NUL
xcopy /E "%pkgbase%\XMBMANPLS\*.*" "%pkgsource%\core-HFW\XMBMANPLS" >NUL
if exist "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\*.xml" del /Q /S "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\*.xml" >NUL
if exist "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\FEATURES" rmdir /Q /S "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\FEATURES" >NUL
if exist "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\IMAGES" rmdir /Q /S "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\IMAGES" >NUL
xcopy /E "%pkgsource%\languagepacks\en-US\XMBMANPLS\USRDIR\*.*" "%pkgsource%\core-HFW\XMBMANPLS\USRDIR" >NUL
if not exist "%pkgsource%\core-%%A\XMBMANPLS\USRDIR\IMAGES" mkdir "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\IMAGES" >NUL
xcopy /E "%pkgsource%\themepacks\ORIGINAL\XMBMANPLS\USRDIR\IMAGES" "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\IMAGES\" >NUL
%external%\ssr\ssr  --nobackup --recurse --encoding auto --dir "%pkgsource%\core-HFW\XMBMANPLS\USRDIR" --include "*.xml" --alter --search "/dev_hdd0/game/XMBMANPLS/USRDIR/" --replace "/dev_usb000/XMB/"
%external%\ssr\ssr  --nobackup --recurse --encoding auto --dir "%pkgsource%\core-HFW\XMBMANPLS\USRDIR" --include "game_main.xml" --alter --search "seg_xmb_hdd0_app" --replace "seg_gamexmb"
%external%\ssr\ssr  --nobackup --recurse --encoding auto --dir "%pkgsource%\core-HFW\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search ".pkg" --replace ".rar"
%external%\ssr\ssr  --nobackup --recurse --encoding auto --dir "%pkgsource%\core-HFW\XMBMANPLS\USRDIR" --include "game_settings.xml" --alter --search "/CFW/Latest_version_CFW.html" --replace "/4.00_HFW/Latest_version_400.html"
ren "%pkgsource%\core-HFW\XMBMANPLS\USRDIR\game_main.xml" "xmb.xml"
mkdir "%pkgsource%\core-HFW\XMB"
xcopy "%pkgsource%\core-HFW\XMBMANPLS\USRDIR" "%pkgsource%\core-HFW\XMB" /s
rmdir /s /q "%pkgsource%\core-HFW\XMBMANPLS"

:done
call "%bindir%\global_messages.bat" "SOURCE-BUILDING-OK"
goto :end

:end
exit
