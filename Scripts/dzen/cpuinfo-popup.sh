#!/usr/bin/bash

exit_dzen=0

while [[ $? -eq $exit_dzen ]]; do
(
  echo "CPU usage Information" # First line goes to the title
  ps -A -o pcpu,pid,user,bsdtime,f,class,wchan,nlwp,nice,command --sort -pcpu | awk \
    '
    NR == 1 { 
       printf "\n    %-14s  %-6s %-10s %+6s %1s %3s %-6s N %+3s %-s\n", $1, $2, $3, $4, $5, $6, $7, $9, $10;
    }
    NR > 1 && NR < 10 {
       pbw=int(int($1)/10);
       bar=sprintf("%-10.*s", pbw, "██████████");
       gsub(/ /, "░", bar)
       gsub(/\/dev\//, "", $5)
       printf "  %6.2f %s %-6s %-10s %+6s %1d %+3s %6s %1d %+3d %-s\n", $1, bar, $2, $3, $4, $5, $6, $7, $8, $9, $10;
    }'
) | dzen2 -p -x "930" -y "-48" -w "950" -l "10" -sa 'l' -ta 'c'\
   -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit:1;button3=exit:3' \
   -bg \#000000 -fg \#ffffff -fn "DejaVu Sans Mono for Powerline:size=12" -p 5
# "onstart=uncollapse" ensures that slave window is visible from start.

exit_dzen=$?

done
