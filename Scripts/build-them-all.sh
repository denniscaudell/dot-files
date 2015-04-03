#!/usr/bin/bash

if [[ "$(whoami)" != "buildbot" ]]; then
  echo "This script must be run by buildbot"
  exit 1
fi

SUMMARY="${HOME}/buildbot-build.log"
NOTIFY_HEADER="BuildBot sent you a message"

[[ -e "$SUMMARY" ]] && rm $SUMMARY

export PKGDIR="/home/buildbot/aur"
export LOGONLY="yes"
export LC_ALL=C

notifyall()
{
  sudo -u daddona DISPLAY=":0" notify-send -u normal "$NOTIFY_HEADER" "$*"

  wall "$*"
}


logmsg()
{
  echo "$@" | tee -a "$SUMMARY"
}

notifyall "I'm starting the weekly building check for the AUR packages."\
          "Please, dont't turn off the PC... It won't take too long ;)"

logmsg "buildbot - $(date -u) - building summary"
logmsg "Building packages from '${PKGDIR}'"

logmsg "Updating dot-files from git repo"
cd "${HOME}" && timeout 10 git pull origin master &> /dev/null

if [[ "$?" -ne 0  ]]; then
  echo "Warning: cannot update dot-files"
  notifyall "Something went wrong when I tried to"\
            "update the git repo 'dot-files'"
fi

logmsg "Updating AUR packages from git repo"
cd "${PKGDIR}" && timeout 10 git pull origin master &> /dev/null

if [[ "$?" -ne 0  ]]; then
  echo "Warning: cannot update AUR packages"
  notifyall "Something went wrong when I tried to"\
            "update the AUR packages from the git repo"
fi

"${PKGDIR}/ccm_test.sh" all 64
"${PKGDIR}/ccm_test.sh" all 32

logmsg "--- x86_64 ---"
grep "\[STATUS\]" "${PKGDIR}/ccm64.log" >> "$SUMMARY"
logmsg "--- i686 ---"
grep "\[STATUS\]" "${PKGDIR}/ccm32.log" >> "$SUMMARY"

logmsg "buildbot - $(date -u) - building ends"

notifyall "Ok, I finished the building. See you the next time ;)\n"\
          "\n Here there is the building summary:\n"\
          "\n$(egrep '\[STATUS\].*(succeded|failed)' ${SUMMARY} |\
           awk '{printf "%-20s %s\n", $3, $8}')"

if [[ "$(who | wc -l)" -eq 0 ]]; then
  # well, there is nobody logged-in :(
  # let's shutdown the machine then ;)
  logmsg "No user connected, shutting down..."
  shutdown now
fi

