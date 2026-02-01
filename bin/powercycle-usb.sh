#!/bin/bash

logger -t "allsky" "power cycling ASI ZWO"
uhubctl -l 1-1 -a 0
uhubctl -l 2 -a 0
sleep 10
uhubctl -l 1-1 -a 1
uhubctl -l 2 -a 1
systemctl restart allsky.service
