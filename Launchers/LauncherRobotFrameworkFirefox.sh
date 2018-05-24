#!/bin/bash

cd /headless/Desktop/automation/selenium

#Lancer le hub selenium et ride
xfce4-terminal -H -e './start_selenium_hub.sh' --tab -x 'ride.py'

#Lancer selenium node avec les driver Chrome
./start_firefox_node.sh
