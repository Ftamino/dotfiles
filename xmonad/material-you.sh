#!/bin/bash

if [[ $1 == "--help" || $1 == "-h" ]]; then
  echo "Usage: ./material-you.sh [OPTION]"
  echo "Options:"
  echo "  --help / -h        Display this help message"
  echo "  --uninstall / -u   Uninstalles theme"
  echo "  --polybar / -p     Only generates polybar theme"
  echo "  --xmonad / -x      Only generates xmonad theme"
  echo "Info:"
  echo "This script generates a theme for polybar and/or xmonad based on your wallpaper."

  exit 0
fi

if [[ $1 == "--uninstall" || $1 == "-u" ]]; then
  sed -i 's/import Colors.*/import Colors.Nord/g' ~/.xmonad/lib/Modules/Defaults.hs
  sed -i 's/\.my//g' ~/.xmonad/polybar/config
  sed -i 's#\(include-file =\) ~/.xmonad/polybar/colors$#\1 ~/.xmonad/polybar/colors#' ~/.xmonad/polybar/config
  xmonad --restart
fi

#Find current wallpaper of nitrogen
IMAGE="$(grep -a -m 1 -h -r file= ~/.config/nitrogen/bg-saved.cfg | cut --characters=6-200)"

#Copy current wallpaper as a backup and delete older ones
IMAGEBACKUP="$(echo "${IMAGE}.backup.png")" 

cp $IMAGE $IMAGEBACKUP

#Generate the palette
echo "Generating Colors..."

ffmpeg -i $IMAGEBACKUP -vf palettegen=max_colors=10 mat-you.png

convert mat-you.png -colors 8 -depth 6 txt:- | sed -e "1d;s/.* #/#/;s/ .*//" | awk '!/^#00000000/' | head -n20 | sort -u | tr -d 'FF'  > ./log.txt

rm mat-you.png
rm $IMAGEBACKUP

#Change the colors
echo "Applying colors to theme..."

COLOR1="$(head -n 1 ./log.txt | tail -1)"
COLOR2="$(head -n 2 ./log.txt | tail -1)"
COLOR3="$(head -n 3 ./log.txt | tail -1)"
COLOR4="$(head -n 4 ./log.txt | tail -1)"
COLOR5="$(head -n 5 ./log.txt | tail -1)"

if [[ $1 == "--xmonad"* || $1 == "-x" || $2 == "--xmonad"* || $2 == "-x" ]]; then
    cp ~/.xmonad/MaterialYouTemplate.hs ~/.xmonad/lib/Colors/MaterialYou.hs
    sed -i 's/import Colors.*/import Colors.MaterialYou/g' ~/.xmonad/lib/Modules/Defaults.hs
    sed -i 's/colorBack = "05color"*/colorBack = "'$COLOR1'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
    sed -i 's/colorFore = "02color"*/colorFore = "'$COLOR2'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
    find ~/.xmonad/lib/Colors -type f -name 'sed*' -exec rm {} +
    xmonad --restart
    echo "xmonad"
fi

if [[ $2 == "--polybar" || $2 == "-p" || $1 == "--polybar" || $1 == "-p" ]]; then
    cp ~/.xmonad/polybar/colors-template ~/.xmonad/polybar/colors.my

    sed -i 's/label-active-background = null*/label-active-background = '$COLOR2'/g' ~/.xmonad/polybar/colors.my
    sed -i 's/background = null*/background = '$COLOR1'/g' ~/.xmonad/polybar/colors.my

   #Generating Text Color by  inverting $COLOR1
    printf -v COLORINV '#%06X' $((0x${COLOR1#\#} ^ 0xFFFFFF))
    sed -i 's/foreground = null*/foreground = '$COLORINV'/g' ~/.xmonad/polybar/colors.my

    #Change settings
    sed -i 's#\(include-file =\) ~/.xmonad/polybar/colors$#\1 ~/.xmonad/polybar/colors.my#' ~/.xmonad/polybar/config
    
    find ~/.xmonad/polybar -type f -name 'sed*' -exec rm {} +
    echo "polybar"
fi
