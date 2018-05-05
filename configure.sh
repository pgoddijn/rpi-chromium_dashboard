#!/bin/bash

echo $'#!/bin/bash
PATH=/sbin:/bin

sed -i \'s/\"exit_type\":\"Crashed\"/\"exit_type\":\"Normal\"/\' ~/.config/chromium/Default/Preferences
sed -i \'s/\"exited_cleanly\":false/\"exited_cleanly\":true/\' ~/.config/chromium/Default/Preferences' >> ~/.config/lxsession/LXDE-pi/chromiumsed.sh

chmod 760 ~/.config/lxsession/LXDE-pi/chromiumsed.sh

echo \'
@xset s off
@xset -dpms
@xset s noblank
@unclutter -idle 1
@~/.config/lxsession/LXDE-pi/chromiumsed.sh

@chromium-browser --noerrdialogs --kiosk\' >> ~/.config/lxsession/LXDE-pi/autostart

