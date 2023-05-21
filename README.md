# Info

This is my current setup which is using xmonad as a base. A list of keybinds is WIP (Open it if installed with Mod+F12). Feel free to fork it and do sth cool out of it, you don't need to give credits but I would be happy about it. 😁

##### Table of contents
[1. Info](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#info)

* [1.1 Included Programms](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#whats-included)
  
[2. Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#themes)

*  [2.1 Premade Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#themes)
  
*  [2.2 Change Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#change-themes)
  
*  [2.3 Make own Themes](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#make-themes)

[3. Installation](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#installing)

*  [3.1 Arch, Debian, Arch/Debian based](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#arch-debian-and-archdebian-based)

*  [3.2 Others](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#others)

[4. Troubleshooting](https://github.com/Ftamino/dotfiles-polybar/blob/main/README.md#troubleshooting)

## What's included?

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
# Themes
## Note: Themes are very experimental and currently not available for the bar but will be in the future

  ## Standart
  ![standart](https://i.imgur.com/mhBvwN9.jpg)
  ## Nord
 ![nord](https://i.imgur.com/LkO6SYF.jpg)
  ## Solarized
![solarized](https://i.imgur.com/JCSvtvB.jpg)

## Change Themes

To change Themes use the Python Programm. If the dotfiles are installed use F12 on your keyboard. A simple python3 ./configuration.py should also do it. Changing the Themes for GTK will come in the Programm soon, but its also possible to cahange it thorugh lxapperance.

## Make Themes

To make your own theme just go into .xmonad/lib/colors and copy one of the .hs files. Give it a new name and change in line 1 behind "Colors." the eg Standart to the name of your file. In line five to the same. Change the scheme in xmonad.hs in the imports section by changing the argument import Colors.Standart to the name of yours.
 
# Installing 
Disclaimer: The script is not perfect and my not work for everyone or destroy sth. 

## Arch, Debian and Arch/Debian based 
 1. Install dependences
```
sudo apt install git whiptail
```
 2. Download the repo
```
git clone https://github.com/Ftamino/dotfiles.git dotfiles
```
 3. Go into the downloaded dir
```
cd dotfiles
```
 4. Give the script permissions 
```
chmod +x ./install.sh
```
 5. Run it
```
./install.sh
```
6. To get fish as the default shell use
```
sudo usermod -s yourname /bin/fish
```

 Done
 
## Others:
 1. Use your package manager to install dependences (if u dont use the flatpak of flameshot you have to change the hotkey action for it in the xmonad config)
 ```
 xmonad xmobar neofetch lxpolkit dunst rofi picom copyq volumeicon nitrogen emacs kitty git flameshot arandr
 ```
 2. Download the repo
 ```
 git clone https://github.com/Ftamino/dotfiles.git dotfiles
 ```
 3. Find out where the files need to go (look at the install script)
 
 ## Troubleshooting: 
 
Open a issue if something went wrong and i will add it here (;
