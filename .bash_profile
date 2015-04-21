#
# ~/.bash_profile
#

export CCACHE_DIR="/mnt/CACHE/CCACHE"
export CHROOT="/mnt/CACHE/CHROOT"
export ABSROOT="/mnt/CACHE/ABS"
export PATH="${HOME}/Scripts:${PATH}"
export AURDIR="${HOME}/Documents/informatica/AUR/personal"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx dwm

