#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

echo "" > ~/.xsession-errors

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x "$f" ]] && . "$f"
  done
  unset f
fi

[[ -f /etc/xprofile ]] && source /etc/xprofile

xset +fp ~/.local/share/fonts

[[ -e /usr/bin/nvida-settings ]] && /usr/bin/nvidia-settings -l

if [[ -z "$2" ]]; then
    echo "No DE/WM specified... we are back to console ;)" >> ~/.xsession-errors
else

    case "$2" in
        dwm)
            [[ -f ~/.xprofile ]] && source ~/.xprofile
            /usr/bin/-config ~/.dunstrc  &>> ~/.xsession-errors &

            exec ~/Scripts/startdwm &>> ~/.xsession-errors
            ;;
        kde)
            #exec /usr/bin/startkde &>> ~/.xsession-errors
            echo "KDE support temporary removed!"
            echo "back to the console..."
            ;;
    esac
fi
