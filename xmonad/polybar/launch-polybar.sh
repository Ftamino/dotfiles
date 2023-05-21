if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload  -c=~/.xmonad/polybar/config example &
  done
else
  polybar --reload  -c=~/.xmonad/polybar/config example &
fi
