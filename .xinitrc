#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
 
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
    echo "No DE/WM specified... we are back to console ;)"
else
    [[ -f ~/.xprofile ]] && source ~/.xprofile
    case "$2" in
        dwm)
            xrandr --dpi 144
            exec ~/Scripts/startdwm
            ;;
        i3)
            exec /usr/bin/i3
            ;;
        openbox)
            exec /usr/bin/openbox
            ;;
        virtualbox)
            exec /usr/bin/vboxsdl \
              --fullscreen \
              --fullscreenresize \
              --nofstoggle \
              --noresize \
              --nohostkey \
              --hwvirtex \
              -s debian
            ;;
    esac
fi
