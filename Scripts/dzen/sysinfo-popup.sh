#/bin/bash

#A simple popup showing system information

HOST=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$( uptime | sed 's/.* up //' | sed 's/[0-9]* us.*//' | sed 's/ day, /d /'\
         | sed 's/ days, /d /' | sed 's/:/h /' | sed 's/ min//'\
         |  sed 's/,/m/' | sed 's/  / /')

(
  echo -e "\n"
  echo "  System Information" # Fist line goes to title
  # The following lines go to slave window
  echo "  Host: $HOST "
  echo "  Kernel: $KERNEL"
  echo "  Uptime: $UPTIME "
) | dzen2 -p -x "10" -y "-48" -w "400" -l "6" -sa 'l' -ta 'c'\
   -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit;button3=exit'\
   -bg \#000000 -fg \#ffffff -fn "DejaVu Sans Mono for Powerline:size=12"

# "onstart=uncollapse" ensures that slave window is visible from start.
