#!/bin/bash

if [[ $1 == "--help" || $1 == "-h" ]]; then
  cat <<EOF
  Usage: 
    ./generate-theme.sh [COLOR1] [COLOR2] [COLOR3] [COLOR4] [NAME]
    
    COLOR1: The color for the background of the bar
    COLOR2: Foreground color of the bar
    COLOR3: Active window color
    COLOR4: Inactive window color
    NAME: Name of the theme

    Only use colors in hex format!

  Options:"
    --help / -h        Display this help message
    --remove / -r      Removes a theme. Example: ./generate-theme.sh -r AwensomeColor

  Info:
  Generates a theme with your Colors.
EOF
  exit 0
fi

COLOR1="#$1"
COLOR2="#$2"
COLOR3="#$3"
COLOR4="#$4"

if [[ $1 == "--remove"* || $1 == "-r" ]]; then
  rm ~/.xmonad/lib/Colors/$2.hs
  rm ~/.xmonad/polybar/colors.$2
  #sed -i 's/\'$2'/~/.xmonad/polybar/colors/g' ~/.xmonad/polybar/config
  sed -i 's|'"$2"'|colors|g' ~/.xmonad/polybar/config
  sed -i 's/import Colors.*/import Colors.Nord/g' ~/.xmonad/lib/Modules/Defaults.hs
  xmonad --restart
fi

if ! [[ $1 == "--remove"* || $1 == "-r" ]]; then
  # Apply xmonad colors
  cp ~/.xmonad/MaterialYouTemplate.hs ~/.xmonad/lib/Colors/$5.hs
  sed -i 's/Colors.MaterialYou*/Colors.'$5'/g' ~/.xmonad/lib/Colors/$5.hs
  sed -i 's/colorBack = "05color"*/colorBack = "'$COLOR4'"/g' ~/.xmonad/lib/Colors/$5.hs
  sed -i 's/colorFore = "02color"*/colorFore = "'$COLOR3'"/g' ~/.xmonad/lib/Colors/$5.hs
  sed -i 's/import Colors.*/import Colors.'$5'/g' ~/.xmonad/lib/Modules/Defaults.hs
  find ~/.xmonad/lib/Colors -type f -name 'sed*' -exec rm {} +
  xmonad --restart

  # Apply polybar colors
  cp ~/.xmonad/polybar/colors-template ~/.xmonad/polybar/$5
  sed -i 's/label-active-background = null*/label-active-background = '$COLOR1'/g' ~/.xmonad/polybar/$5
  sed -i 's/background = null*/background = '$COLOR1'/g' ~/.xmonad/polybar/$5
  sed -i 's#\(include-file =\) ~/.xmonad/polybar/colors$*#\1 ~/.xmonad/polybar/'$5'#' ~/.xmonad/polybar/config 
  sed -i 's/.my/ /g' ~/.xmonad/polybar/config

  sed -i 's/foreground = null*/foreground = '$COLOR2'/g' ~/.xmonad/polybar/$5
  find ~/.xmonad/polybar -type f -name 'sed*' -exec rm {} +
fi
