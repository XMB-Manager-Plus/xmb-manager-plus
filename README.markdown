XMB Manager Plus
================

XMB Manager Plus (XMBM+) is a Homebrew XMB item which does many things you could want to on the XMB and more.

This will replace the "Install Package Files" option or Rebug's "Package Manager" option.

Translated to EURO MULTI7 (English, French, German, Italian, Polish, Russian, Spanish) + Portuguese, supports five themes and has compatibility with most CFW.

## Main Features

### Personal Area

Allows to have your own package folders, folders and links.

Note: Only available when built with XMB Manager Builder Toolkit.

### Package Manager Plus

Allows homebrew/packages to be easily installed or deleted.

### Download Manager

Allows homebrew or PSN packages to be easily downloaded.

### Game Manager

View and manage your ps3 applications, by type, by folder, by category etc..

### Homebrew Manager

View and manage your homebrew applications

### File Manager

Browse and Delete files from all locations such as hdd, usb etc. 

### Multimedia Manager

Browse, Copy, Rename and Play all your PS3's internal hdds media from one location. All options from the normal XMB categories are available in one new  combined category

### Game Data Manager

Includes all the game data tools from main XMB plus some more additions. Things like Gamedata, Backups are contained here.

### User Data Manager

Includes all the user data tools from main XMB plus some more additions. Things like Save Data, Trophies and user folders are contained here.

### Web Links

This section includes links to some popular websites for easier access.

### Settings

Gives information about the XMBM+, allows users to download language packs, theme packs and XMBM+ updates, it also links to the PS3Crunch release thread.

## Release notes

### 1.00

-  New Italian language
-  Many minor changes, bug corrections and improvments
-  New update system based in aldostools mod
-  New All-in-one flexible installer to replace Rebug's Package Manager
-  Installer with backup, restore and multiple file chechs
-  Installer flexible for all files replaces, and so permiting the use of AppPacks (GameData updates with more apps for the installer)
-  Installer flexible to use in other projects (ex: PS3Ultimate TV). Replace the title ID in the SFO, the ID in the EBOOT, the USRDI/data/images/logo.png and the apps directory and your app will auto rebuild the installer (ex: USRDIR/apps/My App/4.30-CEX-Rogero)
-  Full core pack now includes a rco free version

Know issues: User data manager: VMC cause ps3 to freeze, PSN category does not work in rco version

### 0.70

-  Languages in core hdd0 packages now in RCO, so they are autodetected and so no need to install language packs
-  New option for installing packages from mmCM pkg directory
-  Many minor changes and bug corrections

### 0.60

-  New category User Data Manager
-  New category Homebrew Manager
-  Homebrew divided in categories
-  3.41 support now in a different instalable package for those who needed
-  Old original theme is now White theme and a new original theme
-  Removed all images and text entries from rco
-  Original theme icons rearranged
-  Many minor changes and bug corrections

### 0.50

-  Merged XMB Manager Plus Flash Mod package and XMB Manager Plus main package
-  New instalable package for Cobra CFW and NFW
-  New category Download Manager
-  New russian translation
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

## Firmware compability

### Core Pack

- 4.30 Rogero [TESTED]
- 4.30 E3
- 3.55 Normal (Kneaw, Rogero, etc) [TESTED]
- 3.55 Rebug [TESTED]

### Full Core Pack

- 4.30 Rogero [TESTED]
- 4.30 E3
- 4.21 Rogero
- 3.55 Normal (Kneaw, Rogero, etc) [TESTED]
- 3.55 Rebug [TESTED]
- 3.55 Cobra [TESTED]
- 3.55 NFW v3
- 3.41 Normal (Kneaw, Rogero, etc)
- 3.41 Rebug

Note: Full core pack also includes an rco free version for all this firmwares

## Install Instructions

### Install Core XMBM+

-  Download the [Core Pack](https://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/updater.html?type=hdd0_cfw) or the [Full Core Pack](https://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/updater.html?type=hdd0_cfw_full)
-  Copy the pkg file to the root of your USB media
-  Install the pkg file
-  Run the XMB Manager Plus application and select your firmware and what you want to install

NOTE: Before uninstalling "XMB Manager Plus" run the application again to revert back to your "Install Package Files" option or you'll have to reinstall the Firmware

### Update XMBM+

-  Update using the update function ["Settings" -> "Update XMB Manager Plus" ->]
-  Install the downloaded package
-  Restart PS3
-  Enjoy!

### Install Theme Pack

-  In the XMBM+ go to ["Settings" -> "XMBM+ Themes" -> "XMBM+ Theme Packs" ->]
-  Choose a theme pack and download it to the root of the USB Stick
-  Install it, like you would any other homebrew package
-  Restart PS3 to see the new theme

## Uninstall Instructions

-  Run previous installed "XMB Manager Plus" application and restore your previous backup using restore option
-  Uninstall XMB Manager Plus from the XMB "Game Data" category (if any themes packs installed)
-  Uninstall XMB Manager Plus from the XMB "Game" category

NOTE: Before uninstalling "XMB Manager Plus" run the application again to revert back to your "Install Package Files" option or you'll have to reinstall the Firmware

## Translating to your language

### Manual

- Go to [XMBM+ Git language page](https://github.com/XMB-Manager-Plus/xmb-manager-plus/tree/master/languages)
- Download the en-US.ini file
- Find your [language code](http://www.i18nguy.com/unicode/language-identifiers.html)
- Translate it
- Push to git or send it to [XMB Manager Plus Development page](http://www.ps3crunch.net/forum/threads/2431)

### With XMB Manager Toolkit

- Use Toolkit "Add language" option
- Go to \bin\base-source\languages\langcode.ini
- Translate it
- Push to git or send it to [XMB Manager Plus Development page](http://www.ps3crunch.net/forum/threads/2431)

## Downloads

### Core Package

-  [Core Pack](https://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/updater.html?type=hdd0_cfw)
-  [Full Core Pack](https://dl.dropbox.com/u/60710927/XMBMANPLS/UPDATES/updater.html?type=hdd0_cfw_full)

### Theme packs

-  [Original](http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMB_Manager_Plus_v1.00-THEMEPACK-ORIGINAL.pkg)
-  [White](http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMB_Manager_Plus_v1.00-THEMEPACK-WHITE.pkg)
-  [Colour](http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMB_Manager_Plus_v1.00-THEMEPACK-COLOUR.pkg)
-  [Black](http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMB_Manager_Plus_v1.00-THEMEPACK-BLACK.pkg)
-  [Blue](http://dl.dropbox.com/u/60710927/XMBMANPLS/THEMEPACKS/XMB_Manager_Plus_v1.00-THEMEPACK-BLUE.pkg)

### XMBM+ Builder Toolkit

All packages are compiled with the XMBM+ Builder Toolkit. With the XMBM+ Builder Toolkit you can create your own XMBM+ themes and more.

## Credits

### XMBM+

-  aldostools (coding, SFX/SFO editor/converter)
-  andreus (coding, translator)
-  Berion (graphical design)
-  bitsbubba (coding, themes)
-  CloneD (themes, tester, videos)
-  DeViL303 (coding, POC/WIP)
-  dragoangel (translator, themes)
-  ps3Hen (coding, 4.00 port, translator)
-  XiorgON (tester, translator, coding)
-  xlsound (images)
-  wawryn (translator)

### XMBM+ Builder Toolkit

-  GUI: XiorgON
-  Batch coding: andreus, ps3hen, XiorgON
-  SFX/SFO editor/converter: aldostools
-  Graphical design: Berion

### XMBM+ Installer

-  Coding: andreus

### Special thanks

- rebug team for the package manager installer
- sandungas for the ps3devwiki and all is help
- deroad for the PSXBrew, NoRSX and all is help
- all xmbm+ toolkit tools developers
- all the testers and bug reporters
- and of course the users

## Source/Development

As a team we believe in open collaboration which means sharing everything so everyone can understand if they want to.

The Development Page, this is where we discuss/plan for the XMBM+. If you have any ideas/suggestions send them there.

The entire source in available for download in the git

-  Development page: http://www.ps3crunch.net/forum/threads/2431
-  Git: https://github.com/XMB-Manager-Plus/xmb-manager-plus
-  Git (Builder Toolkit): https://github.com/XMB-Manager-Plus/xmb-manager-plus-builder-toolkit
-  Git (Installer): https://github.com/XMB-Manager-Plus/xmb-manager-plus-installer
