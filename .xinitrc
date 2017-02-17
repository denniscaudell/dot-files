#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
 
export STARTX_LOG_FILE="${HOME}/.xsession-errors.tty${XDG_VTNR}"

echo "" > "${STARTX_LOG_FILE}"

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x "$f" ]] && . "$f"
  done
  unset f
fi

[[ -f /etc/xprofile ]] && source /etc/xprofile

xset +fp ~/.local/share/fonts
xset s off -dpms

[[ -e /usr/bin/nvida-settings ]] && /usr/bin/nvidia-settings -l

# sudo netctl start DAddonaNet &>> "${STARTX_LOG_FILE}" &

if [[ -z "$2" ]]; then
    echo "No DE/WM specified... we are back to console ;)" >> "${STARTX_LOG_FILE}"
else
    [[ -f ~/.xprofile ]] && source ~/.xprofile
    case "$2" in
        dwm)
            # xrandr --dpi 144
            exec ~/Scripts/startdwm &>> "${STARTX_LOG_FILE}"
            ;;
        kde)
            #exec /usr/bin/startkde &>> ~/.xsession-errors
            echo "KDE support temporary removed!"
            echo "back to the console..."
            ;;
        openbox)
            exec /usr/bin/openbox &>> "${STARTX_LOG_FILE}"

            ;;
        virtualbox)
            exec /usr/bin/vboxsdl \
              --fullscreen \
              --fullscreenresize \
              --nofstoggle \
              --noresize \
              --nohostkey \
              --hwvirtex \
              -s archtest &>> "${STARTX_LOG_FILE}"
            ;;
    esac
fi
