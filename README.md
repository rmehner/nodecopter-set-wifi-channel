# Sets the Wifi channel for the drone

This sets the wifi channel for the Parrot AR.Drone 2.0 by looking at the SSID
of the drone and sets the channel. This is quite of a hack but allows us to have
a more equal distribution to all channels when having a NodeCopter event.

## Requirements

* OSX (even though it's just how we determine the current SSID)

## How to run

* Give the drone a proper wifi name (like D3)
* Connect to the drone wifi
* run `set-channel.sh`
* reboot the drone
