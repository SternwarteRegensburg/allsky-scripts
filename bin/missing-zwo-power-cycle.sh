#!/bin/bash

ZWO=$(lsusb | grep ZWO)

if [ -z "${ZWO}" ]; then
  logger "Did not detect an ASI ZWO camera, power cycling USB ports ..."
  /usr/local/bin/powercycle-usb.sh
fi

ZWO=$(lsusb | grep ZWO)

if [ -z "${ZWO}" ]; then
  logger "Still no ASI ZWO camera, rebooting ..."
  sleep 2
  reboot
fi
