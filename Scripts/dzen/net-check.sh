#!/usr/bin/bash

ddnet-check() {
  ping -W 1 -c 1 192.168.0.1 &> /dev/null 
  if [[ $? -ne 0 ]]; then
    echo "!RTR"
    return 1
  else
    ping -W 1 -c 1 192.168.1.254 &> /dev/null
    if [[ $? -ne 0 ]]; then
      echo "!GTW"
      return 2
    else
      ping -W 1 -c 1 193.187.74.3 &> /dev/null
      if [[ $? -ne 0 ]]; then
        echo "!ISP"
        return 3
      else
        ping -W 1 -c 1 8.8.8.8 &> /dev/null
        if [[ $? -ne 0 ]]; then
          echo "!DNS"
          return 4
        else
          echo ""
        fi
      fi
    fi
  fi
}

net-check() {

  gateway="$(ip route show | awk '/default/ {print $3}')"

  ping -W 1 -c 1 8.8.8.8 &> /dev/null 
  if [[ $? -ne 0 ]]; then
    echo "!DNS"
    return 1
  else
    ping -W 1 -c 1 ${gateway} &> /dev/null
    if [[ $? -ne 0 ]]; then
      echo "!GTW"
      return 2
    else
      echo ""
    fi
  fi
}

if [[ "$(systemctl is-active netctl@DAddonaNet.service)" == "active" ]]; then
  ddnet-check
else
  net-check
fi
