# Setting Up A Raspberry With Anisble

A guide to using Ansible to setup and configure an arbitrary number of rapsberry pis (RPis) on a wifi network.

### Assumptions:

* Some comfort with terminal, general understanding of linux.
* Written from the POV of a Mac OSX user. (Sorry WinBros)

### Requirements:

* **Admin Access to your Router**

### Outline:

1. Let's Get the Gear (Preparation)
1. Making a RaspberryPi from scratch (you must first invent the universe.)
	1. Flash
	1. Contact
1. Grab the MAC Address
1. Configure your router


## Go Get the Gear!

1. Homebrew if you got it ([get it if you don't](https://brew.sh/))
2. run `brew cask install balenaetcher`
3. download the [latest Raspbian Image](https://www.raspberrypi.org/downloads/raspbian/)

## Flashing

1. launch BalenaEtcher (from the terminal) `open /Applications/balenaEtcher.app/`
1. Flash MicroSD with Raspbian (remove and reinsert MicroSD)
1. open terminal
1. change working directory to the MicroSD card with `cd /Volume/boot`
1. create a blank file named 'ssh' `> ssh`
1. create the configuration to connect to your wifi network `nano wpa_supplicant.conf`

enter this:

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
	ssid="your-wifi-network"
	psk="s00p3r_53cr37"
	key_mgmt=WPA-PSK
	scan_ssid=1
}
```

* press `control+x`, then `y`, then `enter` to save and exit
* eject and remove MicroSD
* With the RPi **UNPLUGGED**
* Insert MicroSD and connect power/turn on

## Making Contact

We're going to attempt to make contact to our RPi. Assuming everything went well, the RPi should have automatically connected to the network we configured in the previous step using the credentials in the `wpa_supplicant.conf` file.

* run `ping raspberrypi.local`
* try a few times until you get a response that looks like:

```
$ ping raspberrypi.local
PING raspberrypi.local (169.254.125.107): 56 data bytes
Request timeout for icmp_seq 0
64 bytes from 169.254.125.107: icmp_seq=1 ttl=64 time=0.380 ms
64 bytes from 169.254.125.107: icmp_seq=2 ttl=64 time=0.233 ms
```

If after a minute or two, it doesn't work:

* Connect to the RPi via ethernet (use thunderbolt or USB to ethernet adapter)
* Ping as above

If you can't make contact via ethernet (Pi Zero):

* power off the RPi
* remove the MicroSD
* insert MicroSD into your computer
* using the CLI, change your working directory to `/Volumes/boot`
* run `nano wpa_supplicant.conf`
* copy the text from the previous seciont and double check you SSID and PSK. They must be 100% correct (case sensitive and all that)

You can also check your router to see if your RPi shows up as a connected or recently connected device.

## Grab the MAC Address

Once you make contact with your RPi, we can run a command over `ssh` to get the MAC address its wifi adapter, the `wlan0` device.

* run `ssh pi@raspberrypi.local 'ip wlan0'`
* copy paste the MAC address into a list
* Repeat this for all the RPis you wish to setup on your network

## Router Configuration

By default, all RPis have the hostname set to `raspberrypi`. If more than one device advertises the same hostname to a router, it's possible that the router will locally assign a hostname to the duplicate device. This is a bit unpredictable and can lead to confusion over which device you're actually connecting to.

The list of MAC addresses generated from the process above is necessary to configure the router so that static IP addresses are reserved for each RPi.


