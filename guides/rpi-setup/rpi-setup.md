# Setting Up A Raspberry

## Flashing and Connecting (on a Mac)

* Copy BalenaEtcher and Raspbian ISO from the thumbdrive
* Flash MicroSD with Raspbian
* open terminal
* `cd /Volume/boot`
* `> ssh`
* `nano wpa_supplicant.conf`

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
* Connect to the RPi via ethernet (use thunderbolt or USB to ethernet adapter)
* in the terminal type `ping raspberrypi.local`
* try a few times until you get a response that looks like:

```
$ ping raspberrypi.local
PING raspberrypi.local (169.254.125.107): 56 data bytes
Request timeout for icmp_seq 0
64 bytes from 169.254.125.107: icmp_seq=1 ttl=64 time=0.380 ms
64 bytes from 169.254.125.107: icmp_seq=2 ttl=64 time=0.233 ms
```

## `ssh` into the RPi

* in the terminal type `ssh pi@raspberrypi.local`
* you'll be asked if you want to add the RPi to a list of "known hosts", type `y` and press `enter`
* enter the default password, `raspberry`

## Change the Password

* run `passwd` and follow the prompts

## Change the Hostname

* add your new hostname to `/etc/hostname` using `sudo echo "new_hostname" > /etc/hostname`
* add the hostname to `/etc/hosts`, replace "raspberrypi" which follows 127.0.1.1 with your "new_hostname"
* reboot `sudo reboot`

You can connect to your RPi using `ssh pi@new_hostname.local`