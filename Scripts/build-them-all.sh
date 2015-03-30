#!/usr/bin/bash

if [[ "$(whoami)" != "buildbot" ]]; then
  echo "This script must be run by buildbot"
  exit 1
fi

SUMMARY="${HOME}/buildbot-build.log"

[[ -e "$SUMMARY" ]] && rm $SUMMARY

export PKGDIR="/home/buildbot/aur"
export LOGONLY="yes"
export LC_ALL=C

logmsg()
{
  echo "$@" | tee -a "$SUMMARY"
}

logmsg "buildbot - $(date -u) - building summary"
logmsg "Building packages from '${PKGDIR}'"

logmsg "Updating dot-files from git repo"
cd "${HOME}" && git pull oring master &> /dev/null 
[[ "$?" -eq 0  ]] || echo "Warning: cannot update dot-files"

logmsg "Updating AUR packages from git repo"
cd "${PKGDIR}" && git pull orign master &> /dev/null 
[[ "$?" -eq 0  ]] || echo "Warning: cannot update AUR packages"

"${PKGDIR}/ccm_test.sh" all 64
"${PKGDIR}/ccm_test.sh" all 32

logmsg "--- x86_64 ---"
grep "\[STATUS\]" "${PKGDIR}/ccm64.log" >> "$SUMMARY"
logmsg "--- i686 ---"
grep "\[STATUS\]" "${PKGDIR}/ccm32.log" >> "$SUMMARY"

logmsg "buildbot - $(date -u) - building ends"

