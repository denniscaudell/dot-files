#!/usr/bin/bash

if [[ "$(whoami)" -ne "buildbot" ]]; then
  echo "This script must be run by buildbot"
  exit 1
fi

export PKGDIR="/home/buildbot/aur"

echo "Building packages from '${PKGDIR}' as '$(whoami)'"

cd "${HOME}" && git pull
cd "${PKGDIR}" && git pull

"${PKGDIR}/ccm_test.sh" all 64
"${PKGDIR}/ccm_test.sh" all 32

