#!/bin/bash
#
# by painless - https://bbs.archlinux.org/viewtopic.php?pid=1509183#p1509183
#

for i in $(seq -f %03g 0 255)
do
  j=$(echo $i | sed 's/^0*//')
  printf "\e[48;5;${i}m\e[38;5;15m ${i} "
  printf "\e[48;5;0m\e[38;5;${i}m ${i} "
  case "$i" in
    "007") printf "\n" ;;
    "015") printf "\n" ;;
  esac
  if [[ $j -ge 21 && $(( (${j}-15) % 6 )) -eq 0 ]]
  then
    printf "\n"
  fi
done
