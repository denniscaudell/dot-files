#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

logfile="${HOME}/.xsession-errors.$XDG_VTNR"

echo "" > "${logfile}"

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x "$f" ]] && . "$f"
  done
  unset f
fi

[[ -f /etc/xprofile ]] && source /etc/xprofile

xset +fp ~/.local/share/fonts

[[ -e /usr/bin/nvida-settings ]] && /usr/bin/nvidia-settings -l

sudo netctl start DAddonaNet &>> "${logfile}" &

if [[ -z "$2" ]]; then
    echo "No DE/WM specified... we are back to console ;)" >> "${logfile}"
else
    [[ -f ~/.xprofile ]] && source ~/.xprofile
    case "$2" in
        dwm)
            xrandr --dpi 144
            exec ~/Scripts/startdwm &>> "${logfile}"
            ;;
        kde)
            #exec /usr/bin/startkde &>> ~/.xsession-errors
            echo "KDE support temporary removed!"
            echo "back to the console..."
            ;;
        openbox)
            exec /usr/bin/openbox &>> "${logfile}"

            ;;
        virtualbox)
            exec /usr/bin/vboxsdl \
              --fullscreen \
              --fullscreenresize \
              --nofstoggle \
              --noresize \
              --nohostkey \
              --hwvirtex \
              -s archtest &>> "${logfile}"
            ;;
    esac
fi
