#!/usr/bin/bash

checkturbo()
{
if [[ $(cat /sys/devices/system/cpu/intel_pstate/no_turbo) -eq 1 ]]; then
  echo "○"
else
  echo "●"
fi
}

checkgovernor()
{
  awk '{if ($1 == "powersave") {printf "▂"} else {printf "█"}}' /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}

printf "%s %s" "$(checkgovernor)" "$(checkturbo)"

