#!/bin/bash

DAEMON_PATH=/Library/LaunchDaemons/
ALC_CONFIG_PATH=/Library/Preferences/ALCPlugFix/
BIN_PATH=/usr/local/bin/
ALC_DAEMON_FILE=com.black-dragon74.ALCPlugFix.plist
ALC_FIX_FILE=ALCPlugFix
ALC_FIX_CONFIG=ALC_Config.plist
TIME_FIX_FILE=localtime-toggle
TIME_DAEMON_FILE=org.osx86.localtime-toggle.plist
NUMLOCK_FIX_FILE=setleds
NUMLOCK_DAEMON_FILE=com.rajiteh.setleds.plist

echo "This script required to run as root"

echo "Remove ALCPlugFix..."

if sudo launchctl list | grep --quiet good.win.ALCPlugFix.plist; then
    sudo launchctl unload /Library/LaunchDaemons/good.win.ALCPlugFix.plist
	sudo rm /Library/LaunchDaemons/good.win.ALCPlugFix.plist
	sudo rm /usr/local/bin/hda-verb
fi

if sudo launchctl list | grep --quiet $ALC_DAEMON_FILE; then
    sudo launchctl unload $DAEMON_PATH$ALC_DAEMON_FILE
    sudo rm -rf $DAEMON_PATH$ALC_DAEMON_FILE
    sudo rm -rf $ALC_CONFIG_PATH$ALC_FIX_CONFIG
    sudo rm -rf $BIN_PATH$ALC_FIX_FILE
fi

echo "Remove Localtime-toggle..."
if sudo launchctl list | grep --quiet $TIME_DAEMON_FILE; then
    sudo launchctl unload $DAEMON_PATH$TIME_DAEMON_FILE
    sudo rm -rf $DAEMON_PATH$TIME_DAEMON_FILE
    sudo rm -rf $BIN_PATH$TIME_FIX_FILE
fi

echo "Remove FixNumLock..."
if sudo launchctl list | grep --quiet $NUMLOCK_DAEMON_FILE; then
   sudo launchctl unload $DAEMON_PATH$NUMLOCK_DAEMON_FILE
   sudo rm -rf $DAEMON_PATH$NUMLOCK_DAEMON_FILE
   sudo rm -rf $BIN_PATH$NUMLOCK_FIX_FILE
fi
