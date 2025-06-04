#!/bin/bash

# Stop Apache2 if running
isExistApp="$(pgrep apache2)"
if [[ -n $isExistApp ]]; then
  sudo systemctl stop apache2.service
fi

# Stop Tomcat9 if running
isExistApp="$(pgrep -f tomcat)"
if [[ -n $isExistApp ]]; then
  sudo systemctl stop tomcat9.service
fi
