#!/usr/bin/bash

checkturbo()
{
if [[ $(cat /sys/devices/system/cpu/intel_pstate/no_turbo) -eq 1 ]]; then
  echo "OFF"
else
  echo "ON"
fi
}

printf "T:%3s" $(checkturbo)

