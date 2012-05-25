XMB Manager Plus
================

XMB Manager Plus (XMBM+) is a Homebrew XMB item which does many things you could want to on the XMB and more.

This will replace the "Install Package Files" option or for REBUG CFW the "Package Manager".

It officially supports six languages, four themes and boasts compatibility with most CFW and 4.00 HFW.

## Main Features

### Personal Area

Allows to have your own package folders, folders and links.

Note: Only available when built with XMB Manager Builder Toolkit.

### Package Manager Plus

Allows homebrew/packages to be easily downloaded, installed and deleted.

### File Manager

Browse and Delete files from all locations such as hdd, usb etc. 

### Game Manager

View and manage your ps3 applications, by type, by folder, by category etc..

### Game Data Manager

Includes all the game data tools from main XMB plus some more additions. Things like Gamedata, Savedata, Backups and Trophies are contained here.

### Multi-Media Manager

Browse, Copy, Rename and Play all your PS3's internal hdds media from one location. All options from the normal XMB categories are available in one new  combined category

### Web Links

This section includes links to some popular websites for easier access.

### Settings

Gives information about the XMBM+, allows users to download language packs, theme packs and XMBM+ updates, it also links to the PS3Crunch release thread.

## Release notes

### 0.50

-  Merged XMB Manager Plus Flash Mod package and XMB Manager Plus main package
-  New instalable package for Cobra CFW and NFW
-  Corrected bug in RCO's

### 0.40

-  Now items that links to webpages can show images and descriptions
-  New images for links (thanks xlsound)
-  New images for languages
-  New links
-  New BLUE theme (thanks MO3)
-  Added development page in 'About' subcategory
-  Added PSN packages subcategory to 'Package Manager Plus' category
-  Changed order of items in 'Package Manager Plus' category
-  Showtime link updated in 'Homebrew Downloads' subcategory
-  Some languages updated
-  Major code rewrite to be simpler to read & smaller
-  Major code review to integrate with the changes made in the Toolkit
-  Other minor changes

### 0.20

-  Adds "/net_host/" as a possible directory to browse in the File Manager
-  Revamped 'Game Data Manager' category (trophy related) 
-  Adds the 'Game Manager' category
-  Replaced About category with Settings Category
-  The capability for language packs and theme packs to be downloaded and installed from within the XMBM+
-  6 Languages and 3 Themes are supported on launch. Also the 4.00 HFW version is launch similataniously
-  Update links point to redirect html files for flexiblity

Release page: http://www.ps3crunch.net/forum/threads/3167

### 0.10

-  Complete new file and xmb layout, rebuilt from the ground up.
-  New Package Manager Plus
-  New Homebrew downloader integrated into Package Manager Plus. 
-  New custom file manager (only for browsing and deleting files).
-  New Multi-Media Manager.
-  Works from HDD and on USB (special version needed).
-  New icons and texts all around
-  New logo
-  New integrated update system for XMBM+ updates
-  Links to some popular websites added to a new category.

Release page: http://www.ps3crunch.net/forum/threads/2708

### 0.02 to 0.09

-  Ported to 4.00 HFW
-  Works on all 3.41 CFWs
-  Works on all 3.55 CFWs
-  Works now on retail XMB, and one for REBUG/debug XMB
-  PKG installer

### 0.01

-  Initial version POC/WIP

## Install Instructions

### Install Core XMBM+

#### Normal CFW (Kneaw, Rebug, etc)

-  Download the Core Pack - [Normal CFW or Rebug](http://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/Latest_version_hdd0-cfw.html) or [Cobra CFW or NFW v3 (cobraUSB)](http://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/Latest_version_hdd0-cobra.html)
-  Copy the pkg file to the root of your USB media
-  Install the pkg file
-  Run the XMB Manager Plus application (you can delete it afterwards)
-  Enjoy!

NOTE: Before uninstalling "XMB Manager Plus" run the application again to revert back to your "Install Package Files" option or you'll have to reinstall the Firmware

#### 4.00 HFW

-  Download the Core Pack - [HFW](http://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/Latest_version_hfw.html)
-  Extract the contents of the archive to the root of your USB drive you are using to host the XMBM+
-  Plugin the USB drive in /dev_usb000/(closest to the disc drive) before you turn the PS3 on
-  Turn PS3 on to see the XMB Manager Plus on the XMB

NOTE: due to the constant requirements to call to the USB for resources, removing the USB drive after the ps3 has booted will break the XMBM+, but pluging it back in should fix it.

### Update Core XMBM+

-  Update using the update function ["Settings" -> "Update XMB Manager Plus" -> ]
-  Install the downloaded package
-  Restart PS3
-  Enjoy!

### Install Language Pack

#### Normal CFW (Kneaw, Rebug, etc) and Cobra CFW or NFW v3 (CobraUSB)

-  In the XMBM+ go to ["Settings" -> "Language Settings" -> "Language Packs" ->]
-  Choose a language pack and download it to the root of the USB Stick
-  Install it, like you would any other homebrew package
-  Restart PS3 to see the new language 

#### 4.00 HFW

-  In the XMBM+ go to ["Settings" -> "Language Settings" -> "Language Packs" ->]
-  Choose a language pack and download it to the root of the USB Stick
-  Extract the contents of the archive to the root of your USB drive you are using to host the XMBM+, let it overwrite any files it wants
-  Plugin the USB drive in /dev_usb000/(closest to the disc drive) before you turn the PS3 on
-  Turn PS3 on to see the new language pack

### Install Theme Pack

#### Normal CFW (Kneaw, Rebug, etc) and Cobra CFW or NFW v3 (CobraUSB)

-  In the XMBM+ go to ["Settings" -> "XMBM+ Themes" -> "XMBM+ Theme Packs" ->]
-  Choose a theme pack and download it to the root of the USB Stick
-  Install it, like you would any other homebrew package
-  Restart PS3 to see the new theme

#### 4.00 HFW

-  In the XMBM+ go to ["Settings" -> "XMBM+ Themes" -> "XMBM+ Theme Packs" ->]
-  Choose a theme pack and download it to the root of the USB Stick
-  Extract the contents of the archive to the root of your USB drive you are using to host the XMBM+, let it overwrite any files it wants
-  Plugin the USB drive in /dev_usb000/(closest to the disc drive) before you turn the PS3 on
-  Turn PS3 on to see the new theme pack

## Uninstall Instructions

-  Run previous installed "XMB Manager Plus" application and revert to your previous "Install Package Files" option
-  Uninstall XMB Manager Plus from the XMB "Game Data" category (if any themes/language packs installed)
-  Uninstall XMB Manager Plus from the XMB "Game" category

NOTE: Before uninstalling "XMB Manager Plus" run the application again to revert back to your "Install Package Files" option or you'll have to reinstall the Firmware

## Downloads

### Core Package

-  Normal CFW (Kneaw, Rebug, etc) http://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/Latest_version_hdd0-cfw.html
-  Cobra CFW or NFW v3 (cobraUSB http://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/Latest_version_hdd0-cobra.html
-  4.00 HFW http://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/Latest_version_hfw.html

### Language packs

-  American English http://dl.dropbox.com/u/60710927/XMBMANPLS/LANGUAGEPACKS/XMBM%2Bv0.50-LANGUAGEPACK-en-US.pkg
-  French http://dl.dropbox.com/u/60710927/XMBMANPLS/LANGUAGEPACKS/XMBM%2Bv0.50-LANGUAGEPACK-fr-FR.pkg
-  German http://dl.dropbox.com/u/60710927/XMBMANPLS/LANGUAGEPACKS/XMBM%2Bv0.50-LANGUAGEPACK-de-DE.pkg
-  Polish http://dl.dropbox.com/u/60710927/XMBMANPLS/LANGUAGEPACKS/XMBM%2Bv0.50-LANGUAGEPACK-pl-PL.pkg
-  European Portuguese http://dl.dropbox.com/u/60710927/XMBMANPLS/LANGUAGEPACKS/XMBM%2Bv0.50-LANGUAGEPACK-pt-PT.pkg
-  Polish http://dl.dropbox.com/u/60710927/XMBMANPLS/LANGUAGEPACKS/XMBM%2Bv0.50-LANGUAGEPACK-es-ES.pkg

### Theme packs

-  Original http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMBM%2Bv0.50-THEMEPACK-ORIGINAL.pkg
-  Colour http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMBM%2Bv0.50-THEMEPACK-COLOUR.pkg
-  Black http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMBM%2Bv0.50-THEMEPACK-BLACK.pkg
-  Blue http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMBM%2Bv0.50-THEMEPACK-BLUE.pkg

### XMBM+ Builder Toolkit

All packages are compiled with the XMBM+ Builder Toolkit. With the XMBM+ Builder Toolkit you can create your own XMBM+ themes, language packs and more.

## Team XMBM+

-  aldostools (coding, SFX/SFO editor/converter)
-  andreus (coding, translator)
-  Berion (official logos)
-  bitsbubba (coding, themes)
-  CloneD (themes, tester, videos)
-  DeViL303 (coding, POC/WIP)
-  ps3Hen (coding, 4.00 port, translator, batch toolkit)
-  XiorgON (tester, translator, coding, GUI tookit)
-  xlsound (images)
-  wawryn (translator)

## Source/Development

As a team we believe in open collaboration which means sharing everything so everyone can understand if they want to.

The Development Page, this is where we discuss/plan for the XMBM+. If you have any ideas/suggestions send them there.

The entire source in available for download in the git

-  Development page: http://www.ps3crunch.net/forum/threads/2431
-  Git: https://github.com/XMB-Manager-Plus/xmb-manager-plus
-  Git (Builder Toolkit): https://github.com/XMB-Manager-Plus/xmb-manager-plus-builder-toolkit

-  A Special Big Thanks to the Rebug team and the public because without you the project would never exist
