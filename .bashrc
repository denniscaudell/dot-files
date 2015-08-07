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

ddnet-check() {
  echo "Checking internet connection..."
  ping -W 1 -c 1 192.168.0.1 &> /dev/null 
  if [[ $? -ne 0 ]]; then
    echo "no response from the main router"
    return 1
  else
    ping -W 1 -c 1 192.168.1.254 &> /dev/null
    if [[ $? -ne 0 ]]; then
      echo "no response from the main gateway"
      return 2
    else
      ping -W 1 -c 1 193.187.74.3 &> /dev/null
      if [[ $? -ne 0 ]]; then
        echo "no response from ISP dns"
        return 3
      else
        ping -W 1 -c 1 8.8.8.8 &> /dev/null
        if [[ $? -ne 0 ]]; then
          echo "no response from google dns"
          return 4
        else
          echo "connection is ok."
        fi
      fi
    fi
  fi
}

# pacman() {
#   echo "No fun for today, sorry..."
# }

alias alsaequal='alsamixer -D equal'
alias ccm32='sudo ccm32'
alias ccm64='sudo ccm64'
alias ddnet-start='sudo netctl start DAddonaNet'
alias ddnet-stop='sudo netctl stop DAddonaNet'
alias ddnet-restart='sudo netctl restart DAddonaNet'
alias less='less -R'
alias ls='ls -l -h --color=auto --group-directories-first'
alias mountu2='udisksctl mount -b'
alias mountu2-iso='udisksctl loop-setup -r -f'
alias nspawna='sudo arch-nspawn'
alias nspawnd='sudo systemd-nspawn'
alias pdfview='apvlv'
alias umountu2='udisksctl unmount -b'
alias umountu2-iso='udisksctl loop-delete -b'

eval $(dircolors -b "${HOME}/.dir_colors")

