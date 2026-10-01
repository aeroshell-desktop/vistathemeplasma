# VistaThemePlasma

## Microsoft® Windows™ is a registered trademark of Microsoft® Corporation. This name is used for referential use only, and does not aim to usurp copyrights from Microsoft. Microsoft Ⓒ 2026 All rights reserved. All resources belong to Microsoft Corporation.

## Introduction

This is a fork of [WackyIdeas](https://gitgud.io/wackyideas/)' [AeroThemePlasma](https://gitgud.io/aeroshell/atp/aerothemeplasma) which aims to recreate the look and feel of Windows Vista as much as possible on KDE Plasma, whilst adapting the design to fit in with modern features provided by KDE Plasma and Linux.

VTP is in constant development and testing. So far it has been tested on:

1. Arch Linux x64 and other Arch derivatives
2. Plasma 6.7.5, KDE Frameworks 6.30.0, Qt 6.11.2
3. 96 DPI scaling, single monitor
4. X11, Wayland*

*VistaThemePlasma currently lacks full Wayland support, which may result in Wayland-specific issues. Proper Wayland support is planned for Plasma 6.8

## This software comes "as is" without warranty of any kind. It's always recommended to make backups of your system just in case. I am not responsible for broken systems, please proceed with caution.

[VistaThemePlasma](https://github.com/aeroshell-desktop/vistathemeplasma) and all of its AeroShell components are available as read-only [GitHub mirrors](https://github.com/aeroshell-desktop/).

## Installation

See [INSTALL.md](./INSTALL.md) for a quick install guide.

For the sidebar gadgets, go [here](https://gitgud.io/catpswin56/win-gadgets).


## Credits 

Many thanks to the people who helped out by testing and providing some suggestions for certain plasmoids and other stuff. Special thanks goes to [WackyIdeas](https://gitgud.io/wackyideas/) for making the original [AeroThemePlasma](https://gitgud.io/aeroshell/atp/aerothemeplasma) theme.

### Contributors

- [AngelBruni](https://github.com/angelbruni) for the SVG Vista taskbar texture
- [ThePhantom](https://github.com/ThePhantom6314) for remaking the task item textures and power button glyphs in SVG
- [aeoe](https://gitgud.io/aeoe) for fixing a minor issue with the VistaStart dialog texture
- [furkrn](https://gitgud.io/furkrn) for creating and maintaining the [Plymouth theme](https://github.com/furkrn/PlymouthVista)
- [xodus2002](https://github.com/xodus2002) for the Glass, Pearl and Tinker sound themes from Windows Ultimate Extras


### Very Cool projects that you should check out

- [Geckium](https://github.com/angelbruni/Geckium) by AngelBruni
- [Aero UserChrome](https://gitgud.io/souris/aero-userchrome) by Souris (Geckium in combination with Aero UserChrome works well with AeroThemePlasma and VistaThemePlasma)
- [AeroThemePlasma](https://gitgud.io/aeroshell/atp/aerothemeplasma) by [WackyIdeas](https://gitgud.io/wackyideas)
- [Ice2K.sys](https://toiletflusher.neocities.org/ice2k/) by 0penrc

## Aero apps for AeroThemePlasma
To install most of these, the commands to run after cloning are: `mkdir build; cd build; cmake .. -DCMAKE_INSTALL_PREFIX=/usr; sudo make install`.

### Complete re-creations
- [Linux Explorer](https://github.com/actuallyaridan/linux-explorer) by ActuallyAridan
- [Control Panel](https://github.com/actuallyaridan/linux-control) by ActuallyAridan
- [Device Manager](https://github.com/actuallyaridan/linux-devmgmt) by ActuallyAridan
- [Windows 7 Minesweeper](https://github.com/actuallyaridan/linux-minesweeper) by ActuallyAridan
- [TuxManager](https://github.com/benapetr/TuxManager) (task manager) by benapetr
- [Gadgets](https://gitgud.io/catpswin56/win-gadgets) by catpswin56
- [execbin](https://gitgud.io/catpswin56/execbin) (run dialog) by catpswin56
- [LinVer](https://gitgud.io/wackyideas/linver) (version dialog)

### KDE app forks
- [Aero Dolphin](https://gitgud.io/atmk/dolphin-aero) by Albert Tomanek
- [Aero GwenView](https://gitgud.io/atmk/gwenview-aero) by Albert Tomanek
- [Aero KolourPaint](https://invent.kde.org/albert-tomanek/kolourpaint/-/tree/saribbon-aero) by Albert Tomanek

### Other Aero Apps
- [Aero App Store](https://gitgud.io/atmk/app-store/-/tree/flatpak?ref_type=heads) by Albert Tomanek

### Development Libraries
- [libAeroQt](https://gitgud.io/atmk/libaero-qt) -- Re-usable QtWidgets and QML components for writing Aero apps. Also contains function to make glassy window headers.
- [SARibbon](https://github.com/czyt1988/SARibbon) -- Ribbon control for Qt. Gets styled by libAeroQt.

## Screenshots

### Desktop

![desktop](screenshots/desktop.png)

### Start Menu

![start_menu](screenshots/start_menu.png)
![start_menu_search](screenshots/start_menu_search.png)
![start_menu_apps](screenshots/start_menu_apps.png)
![start_menu_openshell](screenshots/start_menu_openshell.png)

### Clock

![clock](screenshots/clock.png)

### System Tray

![battery](screenshots/battery.png)
![network](screenshots/network.png)
![system_tray](screenshots/system_tray.png)

### Sound Mixer

![mixer](screenshots/mixer.png)
![mixer_expanded](screenshots/mixer_expanded.png)

### Notifications 

![notification](screenshots/notification.png)
![notification](screenshots/notification-progress.png)

### Desktop Icons 

![icons](screenshots/icons.png)

### Lockscreen 

![lockscreen](screenshots/lockscreen.png)

### Alt-Tab Switcher

![alt-tab](screenshots/alt-tab.png)

### Colorization 

![colorization](screenshots/colorization.png)
Regular colorization:
![aeroblur](screenshots/aeroblur.png)
Basic colorization:
![aeroblursimple](screenshots/aeroblursimple.png)
Maximized opaque colorization:
![aeroblur_opaque](screenshots/aeroblur_opaque.png)

### Decorations

![decorations](screenshots/decorations.png)

### Gadgets 

![gadgets](screenshots/gadgets.png)

### Librewolf

![geckium](screenshots/geckium.png)

### User Account Control (Polkit)

![uac](screenshots/uac.png)
![uac-trusted](screenshots/uac-trusted.png)

### Taskbar

![vistatasks-contextmenu](screenshots/vistatasks-contextmenu.png)
![vistatasks-contextmenu](screenshots/vistatasks-window_preview.png)
![wmptoolbar](screenshots/wmptoolbar.png)
