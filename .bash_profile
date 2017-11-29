#
# ~/.bash_profile
#

export XKB_DEFAULT_LAYOUT="it"
export XKB_DEFAULT_VARIANT=",nodeadkeys"
export XKB_DEFAULT_MODEL="pc101"
export XKB_DEFAULT_OPTIONS="grp:alt_shift_toggle,"

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


export _LOG_FILE="${HOME}/.xsession-errors.tty${XDG_VTNR}"
echo "" > "${_LOG_FILE}"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startsway.sh &>> "${_LOG_FILE}"
[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx dwm &>> "${_LOG_FILE}"
[[ -z $DISPLAY && $XDG_VTNR -eq 7 ]] && exec startx virtualbox &>> "${_LOG_FILE}"

