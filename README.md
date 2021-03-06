# Info

This is my current setup which is using xmonad as a wm. You are able to click the workspace names btw 😎. A list of keybinds is WIP (Open it if installed with Mod+F12). Feel free to fork it and do sth cool out of it, you dont need to give credits but I would be happy about it. 😁

##### Table of contents
[1. Info](https://github.com/Ftamino/dotfiles#info)

* [1.1 Included Programms](https://github.com/Ftamino/dotfiles#whats-included)
  
[2. Themes](https://github.com/Ftamino/dotfiles#themes)

*  [2.1 Premade Themes](https://github.com/Ftamino/dotfiles#standart-trasnsperent)
  
*  [2.2 Change Themes](https://github.com/Ftamino/dotfiles#change-themes)
  
*  [2.3 Make own Themes](https://github.com/Ftamino/dotfiles#make-themes)

[3. Installation](https://github.com/Ftamino/dotfiles#installing)

*  [3.1 Arch, Debian, Arch/Debian based](https://github.com/Ftamino/dotfiles/blob/main/README.md#arch-debian-and-archdebian-based)

*  [3.2 Others](https://github.com/Ftamino/dotfiles#others)

## What's included?

Xmonad as a window manager 

Xmobar as a panel for the top 

Trayer for the system tray

Dunst for notifications

Flameshot as a screenshot tool

Kitty as the terminal

Qclip as a clipboard manager

Picom for the rounded corners and transperency

Lxpolkit for apps that need authentication

Rofi to get the run promt (Super+Y)

Volumeicon for the volume indicator (To get it working uncomment some lines in startup hook)

A costum Python Application to configure themes

Doom Emacs as a Text Editor

# Themes

[Make your own theme](https://github.com/Ftamino/dotfiles#themeing)
  ## Standart (trasnsperent)
  ![standart](https://user-images.githubusercontent.com/83065176/173049288-e32979f1-a706-4b0f-8a14-1b4ea4ef4505.png)
  ## Standart (solid)
  ![standart-solid](https://user-images.githubusercontent.com/83065176/173049614-06468254-c50d-4831-a302-60686fdaaaf3.png)
  ## Nord (trasnsperent)
 ![nord](https://user-images.githubusercontent.com/83065176/173049724-bdbab4e6-6eaf-46bf-b14f-f7a518a60821.png)
  ## Nord (solid)
  ![nord-solid](https://user-images.githubusercontent.com/83065176/173049916-c36141db-75a1-4a72-a15a-11278ab03eb5.png)
  ## Solarized (trasnsperent)
![solarized](https://user-images.githubusercontent.com/83065176/173050234-bdd0d3ca-fb55-4111-9ae0-d849908fe4c4.png)
  ## Solarized (solid)
![solarized-solid](https://user-images.githubusercontent.com/83065176/173050299-9793d395-2830-46a7-8091-1e1c7c360927.png)

## Change Themes

To change Themes use the Python Programm. If the dotfiles are installed use F12 on your keyboard. A simple python3 ./configuration.py should also do it. Changing the Themes for GTK will come in the Programm soon, but its also possible to cahange it thorugh lxapperance.

## Make Themes

To make your own theme just go into .xmonad/lib/colors and copy one of the .hs files. Give it a new name and change in line 1 behind "Colors." the eg Standart to the name of your file. In line five to the same. Change the scheme in xmonad.hs in the imports section by changing the argument import Colors.Standart to the name of yours.
 
# Installing 
Disclaimer: The script is not perfect and my not work for everyone or destroy sth. 

## Arch, Debian and Arch/Debian based 
 1. Install dependences
```
sudo apt install git
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
