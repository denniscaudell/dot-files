#
# ~/.bash_profile
#


export IRAF_DIR="/opt/iraf"
export IRAF_BIN="${IRAF_DIR}/bin"
export IRAF_LIB="${IRAF_DIR}/bin"
export IRAF_INC="${IRAF_DIR}/bin"

export iraf="/iraf/iraf/"
export IRAFARCH="linux64"

export CCACHE_DIR="/mnt/CACHE/CCACHE"
export CHROOT="/mnt/CACHE/CHROOT"
export ABSROOT="/mnt/CACHE/ABS"
export PATH="${HOME}/Scripts:${IRAF_BIN}:${PATH}"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib:${IRAF_LIB}"
export AURDIR="${HOME}/Documents/informatica/AUR/personal"
export QT_QPA_PLATFORMTHEME="qt5ct"
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx dwm
[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx virtualbox

