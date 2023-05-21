#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"

if [[ $1 == "--help" ]]; then
  echo "This script installs various applications and configures them to provide a customized xmonad desktop experience."
  echo "Usage: ./install.sh"
  echo "Options:"
  echo "  --help        Display this help message"
  echo "  --config      Only copys the configuration files"
  exit 0
fi

if [[ $1 == "--config" ]]; then
  echo -e "${BLUE}Copying Configs${RESET}"
  mkdir -p ~/.xmonad
  cp  ./configuration.py ~/.configuration.py
  cp -r ./config/* ~/.config/
  cp -r ./xmonad/* ~/.xmonad/
  exit 0
fi

echo -e "${BLUE}Starting Installer${RESET}"
echo -e "${BLUE}Updating${RESET}"

if [ -f /etc/debian_version ]; then
  sudo apt update
  sudo apt upgrade -y
elif [ -f /etc/arch-release ]; then
  sudo pacman -Syu
else
  echo -e "${RED}Unsupported distribution.${RESET}"
  exit 1
fi

if [ -f /etc/debian_version ]; then
  sudo apt-get install -y xmonad polybar neofetch lxpolkit dunst fish picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget 
elif [ -f /etc/arch-release ]; then
  sudo pacman -S xmonad polybar neofetch lxpolkit dunst fish picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget
else
  echo -e "${RED}Unsupported distribution.${RESET}"
  exit 1
fi

flatpak install flameshot

echo -e "${BLUE}Install Fish Theme${RESET}"
curl -L https://get.oh-my.fish
omf install bobthefish

echo -e "${BLUE}Installing Doom Emacs${RESET}"
rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo -e "${BLUE}Install Nerd Fonts${RESET}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip
unzip 3270.zip -d ~/.fonts
fc-cache -fv

echo -e "${BLUE}Copying Configs${RESET}"

mkdir -p ~/.xmonad
cp  ./configuration.py ~/.configuration.py
cp -r ./config/* ~/.config/
cp -r ./xmonad/* ~/.xmonad/



