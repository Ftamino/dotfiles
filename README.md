# Info

This is my current setup which is using xmonad as a base. A list of keybinds is WIP (Open it if installed with Mod+F12). Feel free to fork it and do sth cool out of it, you don't need to give credits but I would be happy about it. 😁

##### Table of contents
[1. Info](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#info)

* [1.1 Included Programms](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#whats-included)

* [1.2 Keybinds](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#whats-included)
  
[2. Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#themes)

*  [2.1 Premade Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#themes)
  
*  [2.2 Change Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#change-themes)
  
*  [2.3 Make own Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#make-themes)

*  [2.4 Remove own Themes](https://github.com/Ftamino/dotfiles/tree/main#uninstall-selfmade-themes)

[3. Installation](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#installing)

*  [3.1 Arch, Debian, Arch/Debian based](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#arch-debian-and-archdebian-based)

*  [3.2 Others](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#others)

[4. Troubleshooting](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#troubleshooting)

# What's included?

* Xmonad as a window manager 
* Polybar as a panel
* Dunst for notifications
* Flameshot as a screenshot tool
* Kitty as the terminal
* Qclip as a clipboard manager
* Picom as a compositor
* Lxpolkit for apps that need authentication
* Rofi to get the run promt and logout menu
* A costum Python Application to configure themes
* Doom Emacs as a Text Editor

# Keybinds

<details>
<summary>Keybindings</summary>

Launch a terminal: Super + t

Launch rofi: Super + y

Launch rofi window switcher: Alt + Tab

Launch browser: Super + c

Launch flameshot GUI with flatpak: Print

Open emacsclient: Super + F10

Media keys:

Volume up: Volume Up Key
  
Volume down: Volume Down Key
  
Mute: Volume Mute Key
  
Open Configuration Program: Super + F12

Close focused window: Super + q

Force kill focused window: Super + Shift + q

Rotate through the available layout algorithms: Super + space

Reset the layouts on the current workspace to default: Super + Shift + space

Toggle Fullscreen: Super + F11

Resize viewed windows to the correct size: Super + n

Move focus to the next window: Super + Tab or Super + j

Move focus to the previous window: Super + k

Move focus to the master window: Super + m

Swap the focused window and the master window: Super + Return

Swap the focused window with the next window: Super + Shift + a

Swap the focused window with the previous window: Super + Shift + d

Shrink the master area: Super + a

Expand the master area: Super + d

Push window back into tiling: Super + Shift + t

Quit Dialog: Super + Shift + o

Restart xmonad: Super + z

Resize current window to 5760*1200: Super + Shift + f

</details>
<details>
<summary>Workspace Switching</summary>

Switch to workspace N: Super + [1..9]

Move client to workspace N: Super + Shift + [1..9]

</details>
<details>
<summary>Screen Switching</summary>

Switch to physical/Xinerama screens 1, 2, or 3: Super + [w,e,r]

Move client to screen 1, 2, or 3: Super + Shift + [w,e,r]

</details>
<details>
<summary>Mouse Bindings</summary>

Set the window to floating mode and move by dragging: Super + button1

Raise the window to the top of the stack: Super + button2

Set the window to floating mode and resize by dragging: Super + button3

</details>

# Themes
## Note: Themes are very experimental and currently not available for the bar but will be in the future

  ## Standart
  ![standart](https://i.imgur.com/mhBvwN9.jpg)
  ## Material U(nix)
  ![Material U(nix)](https://i.imgur.com/Mwtx3aA.jpg)
  ## Nord
 ![nord](https://i.imgur.com/LkO6SYF.jpg)
  ## Solarized
![solarized](https://i.imgur.com/JCSvtvB.jpg)

## Material U(nix)

If you have ever used android 12 or up you are familiar with [material you](https://material.io/blog/announcing-material-you). For those who don't know, it basically changes all the colors on your display to some from your wallpaper. To use it press F12 > Change Themes > Material You or use material-you.sh in .xmonad. Feel free to adapt this script to your rice. I would love to see someone using it. It can only handle .jpg and .png files for now.

## Change Themes

To change Themes use the Python Programm. If the dotfiles are installed use F12 on your keyboard. A simple python3 ./configuration.py should also do it. Changing the Themes for GTK will come in the Programm soon, but its also possible to cahange it thorugh lxapperance.

## Make Themes

To make your own theme run 
```
~/.xmonad/generate-theme.sh [COLOR1] [COLOR2] [COLOR3] [COLOR4] [NAME]
```

* COLOR1: The color for the background of the bar
* COLOR2: Foreground color of the bar
* COLOR3: Active window color
* COLOR4: Inactive window color
* NAME: Name of the theme

All the colors have to be in hex code but WITHOUT THE #


Example:
```
~/.xmonad/generate-theme.sh 2E3440 B48EAD 5E81AC A3BE8C NordTheme
```
## Uninstall selfmade Themes

To remove your generated themes from [above](https://github.com/Ftamino/dotfiles/edit/main/README.md#make-themes) run
```
~/.xmonad/generate-theme.sh -r [NAME]
```
Use the exact NAME as [above](https://github.com/Ftamino/dotfiles/edit/main/README.md#make-themes)



# Installing 
Disclaimer: The script is not perfect and my not work for everyone or destroy sth. 

## Arch, Debian and Arch/Debian based 
 1. Download the repo
```
git clone https://www.github.com/Ftamino/dotfiles-polybar 
```
 2. Go into the downloaded dir
```
cd dotfiles-polybar
```
 3. Give the script permissions 
```
chmod +x ./install.sh
```
 4. Run it
```
./install.sh
```
5. To get fish as the default shell use
```
sudo usermod -s yourname /bin/fish
```

 Done
 
## Others:
 1. Use your package manager to install dependences (if u dont use the flatpak of flameshot you have to change the hotkey action for it in the xmonad config)
 ```
 xmonad polybar neofetch lxpolkit dunst rofi picom copyq volumeicon nitrogen emacs kitty git flameshot arandr
 ```
 2. Download the repo
 ```
git clone https://www.github.com/Ftamino/dotfiles-polybar 
```
 3. Find out where the files need to go (look at the install script)
 
 ## Troubleshooting: 
 
Open a issue if something went wrong and i will add it here (;
