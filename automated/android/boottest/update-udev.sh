#!/bin/bash -x

target_user="testuser"
# https://developer.android.com/studio/run/device.html
# https://github.com/M0Rf30/android-udev-rules

dir_parent=$(dirname $0)

# this files is copied from path /lib/udev/rules.d/51-android.rules
# after apt-get install android-sdk-platform-tools-common
f_rules=${dir_parent}/51-android.rules

# Copy rules file
sudo cp -v ${f_rules} /etc/udev/rules.d/51-android.rules
# Change file permissions
sudo chmod a+r /etc/udev/rules.d/51-android.rules

# assuming plugdev is there by default
# sudo groupdel plugdev
# sudo groupadd plugdev

# would be done outside
# sudo usermod -a -G plugdev ${target_user}

# Restart UDEV
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo service udev restart
