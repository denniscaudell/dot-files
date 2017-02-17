#
# ~/.bash_profile
#

export CCACHE_DIR="/mnt/CACHE/CCACHE"
export CHROOT="/mnt/CACHE/CHROOT"
export ABSROOT="/mnt/CACHE/ABS"
export PATH="${HOME}/Scripts:${PATH}"
export AURDIR="${HOME}/Documents/informatica/AUR/personal"
export QT_QPA_PLATFORMTHEME="qt5ct"
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx dwm
[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx virtualbox

