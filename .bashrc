#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -n "$SSH_CLIENT" ]; then
    PS1='[\[\e[0;33m\]SSH:\[\e[m\]\u@\h \W]\$ '
else
    PS1='[\u@\h \W]\$ '
fi

export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

complete -cf kdesu

export VISUAL=vim
export EDITOR=nano

export PULSE_LATENCY_MSEC=30
export _JAVA_AWT_WM_NONREPARENTING=1

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    /usr/bin/man "$@"
}

virtualbox() {
  if $(modprobe vboxdrv); then
    echo "running virtualbox"
    /usr/bin/virtualbox
  else
    echo "inserting vboxdrv"
    /usr/bin/gksu modprobe vboxdrv
    echo "running virtualbox"
    /usr/bin/virtualbox
  fi
}

alias ls='ls -l -h --color=auto --group-directories-first'
alias mountu2='udisksctl mount -b'
alias umountu2='udisksctl unmount -b'
alias mountu2-iso='udisksctl loop-setup -r -f'
alias umountu2-iso='udisksctl loop-delete -b'
alias ccm64='sudo ccm64'
alias ccm32='sudo ccm32'
alias nspawna='sudo arch-nspawn'
alias nspawnd='sudo systemd-nspawn'
alias less='less -R'
alias pdfview='apvlv'

eval $(dircolors -b "${HOME}/.dir_colors")

