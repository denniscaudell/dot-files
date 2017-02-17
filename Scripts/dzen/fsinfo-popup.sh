#!/usr/bin/bash
# A simple popup showing filesystem information

exit_dzen=0

while [[ $? -eq $exit_dzen ]]; do

(
  echo "Filesystem Information" # First line goes to the title

  LC_ALL=C df -h --output=target,used,size,pcent,source -x tmpfs -x devtmpfs | awk \
    '
    NR == 1{
       printf "\n  %-10s %+6s/%-4s            %s (dev)\n", $1, $2, $3, $4;
    }
    NR > 1 {
       pbw=int(int($4)/10);
       bar=sprintf("%-10.*s", pbw, "██████████");
       gsub(/ /, "░", bar)
       gsub(/\/dev\//, "", $5)
       printf "  %-10s %+6s/%-4s %s %s (%s)\n", $1, $2, $3, bar, $4, $5;
    }'
) | dzen2 -p -x "420" -y "-48" -w "500" -l "8" -sa 'l' -ta 'c'\
   -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit:1;button3=exit:3' \
   -bg \#000000 -fg \#ffffff -fn "DejaVu Sans Mono for Powerline:size=8" -p 30
# "onstart=uncollapse" ensures that slave window is visible from start.

exit_dzen=$?

done
