#!/usr/bin/bash

# A simple popup showing filesystemd information
(
  echo "Filesystem Information" # First line goes to the title

  df -h --output=target,used,size,pcent,source -x tmpfs -x devtmpfs | awk \
    'NR > 1 {
       pbw=int(int($4)/10);
       bar=sprintf("%-10.*s", pbw, "██████████");
       gsub(/ /, "░", bar)
       gsub(/\/dev\//, "", $5)
       printf "%-10s %+6s/%-4s %s %s (%s)\n", $1, $2, $3, bar, $4, $5;
    }' | sort
) | dzen2 -p -x "350" -y "-30" -w "350" -l "5" -sa 'l' -ta 'c'\
   -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit;button3=exit'\
   -bg \#000000 -fn "DejaVu Sans Mono for Powerline:size=12"

# "onstart=uncollapse" ensures that slave window is visible from start.
