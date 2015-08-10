#/bin/bash

#A simple popup showing system information

HOST=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$( uptime | sed 's/.* up //' | sed 's/[0-9]* us.*//' | sed 's/ day, /d /'\
         | sed 's/ days, /d /' | sed 's/:/h /' | sed 's/ min//'\
         |  sed 's/,/m/' | sed 's/  / /')

(
  echo "System Information" # Fist line goes to title
  # The following lines go to slave window
  echo "Host: $HOST "
  echo "Kernel: $KERNEL"
  echo "Uptime: $UPTIME "
) | dzen2 -p -x "10" -y "-30" -w "300" -l "5" -sa 'l' -ta 'c'\
   -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit;button3=exit'\
   -bg \#000000 -fn "DejaVu Sans Mono for Powerline:size=8"

# "onstart=uncollapse" ensures that slave window is visible from start.
