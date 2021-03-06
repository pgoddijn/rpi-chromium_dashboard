# Raspberry Pi Dashboard with Chromium install script
Have you ever wanted to use a Raspberry Pi as a stand-alone device that can simply be configured to display a webpage in a browser, only to find that the screen blanks every 5 minutes and every time you power off the Pi and boot it up again, Chromium asks to restore the previous session?
This script simply adds default configuration to the autostart file and creates a bash script that replaces the "Crashed" value in the Chromium preferences file to "Normal" so you can simply turn off your Pi at the end of the day (or turn of your TV if you power your Pi with the TV's USB-port).

What do you need:
1. A Raspberry Pi with Raspian OS
2. Internet connection to download this script

# Installation:

    curl -sSL https://raw.githubusercontent.com/pgoddijn/rpi-chromium_dashboard/master/configure.sh | bash

Okay, that is **very unsafe** (vulnerable to server side detection which can be abused, read more here: https://www.idontplaydarts.com/2016/04/detecting-curl-pipe-bash-server-side/), so you should try this command:

    bash -c "$(curl -Ssl https://raw.githubusercontent.com/pgoddijn/rpi-chromium_dashboard/master/configure.sh)"

Now, that's still pretty unsafe if you don't know what the script really does, so you should always download it and check the script yourself before running it ;-)


# What's left

The only thing you want to install yourself is "unclutter" because I don't want to make you run this script with elevated privileges.

    sudo apt install unclutter

I put "unclutter -idle 1" in the Pi's autostart file so you don't have to ;)


# Basic overview
When you start the Chromium browser, Chromium sets a flag in its settings file to "Crashed". This is in case your device actually crashes so it can ask to restore the session. When you quit Chromium in a normal fashion, it sets the flag to "Normal".
When you pull the plug from your Pi, this flag is still set to "Crashed" and we don't want that. We just want the Pi to boot, start Chromium with predefined pages and cut the power when we leave the office (or whereever).
This script creates a file in ~/.config/lxsession/LXDE-pi/ with the name "chromiumsed.sh. This is a simple script that attempts to search in the Chromium browser settings for the string '"exit_type":"Crashed"' and replace it with '"exit_type":"Normal"'.
Last, it adds basic config to the autostart file. This config disables the screensaver, screen blanking, runs the previously generated script to get rid of the restore message in Chromium and then runs Chromium in kiosk mode (full screen without bars).
If you install unclutter, it'll hide your mousepointer after a specified idle time (1 second in this config's case).

You can always quit the browser with Alt+F4 or Ctrl+Shift+W, start Chromium normally and configure it to start with the pages you want, install plugins, etc. Just reboot afterwards and those settings will still be there.

~~When it's done, it's done. If you're impatient, please feel free to fork and write your own script ;-)~~


Enjoy!
