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

-  Download the CFW Core Pack
-  Download the CFW Flash Mod
-  Copy the "XMB_Manager_Plus_v0.20_Flash_Mod.pkg" and "XMB_Manager_Plus_vX.XX_Core.pkg" files to the root of your USB media
-  Install "XMB_Manager_Plus_vX.XX_Core.pkg"
-  Install "XMB_Manager_Plus_v0.20_Flash_Mod.pkg" 
-  Run the XMB Manager Plus installer (you can delete it afterwards)
-  Enjoy!

NOTE: Follow the correct order or your "Install Package Files" (or "Package Manager") option will disappear and you'll have to reinstall Firmware

#### Cobra CFW or NFW v3 (CobraUSB)

-  Download the CFW Core Pack
-  Download either the Cobra CFW or NFW v3(CobraUSB) dev_flash swap
-  Copy "XMB_Manager_Plus_vX.XX_Core.pkg" files to the root of your USB media. As well as Cobra CFW or NFW v3 dev_flash swap
-  Install "XMB_Manager_Plus_vX.XX_Core.pkg"
-  Mount dev_blind or similar 
-  Copy the contents of the relevant dev_flash swap to dev_blind
-  Restart PS3
-  Enjoy

NOTE: Follow the correct order or your "Install Package Files" (or "Package Manager") option will disappear and you'll have to reinstall Firmware

#### 4.00 HFW

-  Either download the Update using the update function (if you had a previous installed), or straight from the release page
-  Extract the contents of the archive to the root of your USB drive you are using to host the XMBM+
-  Plugin the USB drive in /dev_usb000/(closest to the disc drive) before you turn the PS3 on
-  Turn PS3 on to see the XMBM+ on the XMB

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

-  Download Rebug Package Manager pkg
-  Install Rebug Package Manager pkg file
-  Run the Rebug Package Manager installer (you can delete it afterwards)
-  Delete XMB Manager Plus in the XMB "Game Data" category

NOTE: Follow the correct order or your "Install Package Files" (or "Package Manager") option will not appear and you'll have to reinstall Firmware

## Downloads

### Core Package

-  Normal CFW (Kneaw, Rebug, etc) http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/XMB_Manager_Plus_v0.20.rar
-  4.00 HFW http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/XMB_Manager_Plus_v0.20_4.00HFW.rar

### Flash mods (only need to do this once)

-  Normal CFW (Kneaw, Rebug, etc) http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/XMB_Manager_Plus_v0.20.rar
-  Cobra CFW dev_flash swap http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/XMBM%2B_v0.20_devblind_fix_CobraCFW.rar
-  NFW v3 (cobraUSB) dev_flash swap http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/XMBM%2B_0.20_devblind_fix_NFWv3.rar
-  4.00 HFW http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/XMB_Manager_Plus_v0.20_4.00HFW.rar

### Language packs

-  American English http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/LANGUAGEPACKS/XMBM%2Bv0.20-ENGLISH-LANGPACK.pkg
-  French http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/LANGUAGEPACKS/XMBM%2Bv0.20-FRANCAIS-LANGPACK.pkg
-  German http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/LANGUAGEPACKS/XMBM%2Bv0.20-DEUTSCH-LANGPACK.pkg
-  Polish http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/LANGUAGEPACKS/XMBM%2Bv0.20-POLSKI-LANGPACK.pkg
-  European Portuguese http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/LANGUAGEPACKS/XMBM%2Bv0.20-PORTUGUES-LANGPACK.pkg
-  Polish http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/LANGUAGEPACKS/XMBM%2Bv0.20-ESPANOL-LANGPACK.pkg

### Theme packs

-  Original http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/THEMEPACKS/XMBM%2Bv0.20-ORIGINAL-THEME.pkg
-  Colour http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/THEMEPACKS/XMBM%2Bv0.20-COLOUR-THEME.pkg
-  Black http://dl.dropbox.com/u/60710927/XMBMPLUS/RELEASES/THEMEPACKS/XMBM%2Bv0.20-BLACK-THEME.pkg

### XMBM+ Builder Toolkit

All packages are compiled with the XMBM+ Builder Toolkit. With the XMBM+ Builder Toolkit you can create your own XMBM+ themes, language packs and more.

## Team XMBM+

-  Aldostools (coding)
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
-  Git (Flash): https://github.com/XMB-Manager-Plus/xmb-manager-plus-flash
-  Git (Builder Toolkit): https://github.com/XMB-Manager-Plus/xmb-manager-plus-builder-toolkit

-  A Special Big Thanks to all the Team XMBM+ and the public because without you the project would never exist
