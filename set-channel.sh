#!/bin/sh
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
ID=$(echo $SSID | sed s/[^0-9]//g)

if [[ -z "$ID" ]]; then
  echo "No approiate SSID found (script expects a SSID of the drone like 'D3')"
  exit 1
fi

CHANNEL=$(($(($ID % 13)) + 1))

echo "Setting drone $SSID to channel $CHANNEL"

expect << EOF
spawn telnet 192.168.1.1
expect "#"
send "sed -i 's/RANDOM_CHAN=.*/RANDOM_CHAN=$CHANNEL/g' /bin/wifi_setup.sh\n"
expect "#"
EOF

echo "Done"
