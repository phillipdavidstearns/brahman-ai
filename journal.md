# Journal

## Jan 26 Sun

* Reset Ubiquiti IP Cam
* Attempt to upgrade WiFi
	* Replace Jetpack with NETGEAR 4G modem
* Identified a possible corrupted MicroSD in hbd-01
	* Attempting to re-flash with an image of hbd-03
* Relocated the Cisco E3000 to the main house @ Chatsubo
* 
### Setup UniFi controller on a Beaglebone

Caveat:
 
> At the moment Ubiquiti does not support arm64, hence it is not available via the repo. A download and manual installation will be necessary for this. 

* Arch:
	* [https://icub3d.github.io/post/unifi-controller-arch-linux-arm/](https://icub3d.github.io/post/unifi-controller-arch-linux-arm/)
* Debian:
	1. [Installing a Debian Linux Armhf O/S on the Beaglebone Black](https://www.ofitselfso.com/Beagle/InstallingArmhfKernelBeagleboneBlack.php)
		* [Flasher Debian Image for BeagleBone](https://beagleboard.org/latest-images)
	2. [UniFi - How to Install and Update via APT on Debian or Ubuntu](https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-and-Update-via-APT-on-Debian-or-Ubuntu) 

## Jan 25 Sat

* Extended WiFi on Mars
	* R6400 functioning as AP/Switch on Mars
	* TPLink Archer C9 replaced R6400
* Rewrote `wg-start.sh` script for setting up wireguard interface on IOS
	* added ability to take optional arguments for iface, ip, config file
	* checks whether input values are somewhat valid
	* automatically identifies next available tunnel interface name
* Having difficulties getting IP/MAC binding working on the DLINK DSR-250
* Need to figure out what's going on with the cluster.
* Checked the Solar System at Lode Star
	* Batteries were at 14V after a day and half of charging
	* Reconnected the sculpture to the timer
	* Fully lit at dusk, will have to check the voltage levels of the batteries in the AM

## Jan 24 Fri

* Spent much of the day configuring routers
	* NETGEAR R6400 has an AP mode. Placed on 10.79.10.21
	* Cisco E3000 configured to act as an AP
		1. Disable NAT
		2. Disable DHCP
		3. Set LAN IP to 10.79.10.23/24
		4. WAN IP set to DHCP
		5. Ethernet to gateway router connection on LAN instead of WAN port
	* TPLink Archer C9 configured to act as an AP
		1. Disable NAT
		2. Disable DHCP
		3. Set LAN IP to 10.79.10.22/24
		4. WAN IP set to DHCP
		5. Ethernet to gateway router connection on LAN instead of WAN port
		6. Aborted an attempt to use wireless bridging (extension)
	* NETGEAR EX6200 configured as wireless extender
		* Assigned LAN IP to 10.79.10.24/24
* Epic light switch rave in the evening

## Jan 23 Thu

* Solar Day 2
	* Load tested batteries
	* Removed a suspect battery
	* Left to charge

## Jan 22 Wed

* Solar Day 1
	* Climbed "Lode Star"
	* Tested solar rig with Seva, Ben, and Freeman
		* Panels are OK
		* Charge controller seems OK
		* Inverter and Batteries need to be tested
	* Cleaned Panels
	* Started trouble shooting batteries
* Cluster more "properly" configured
	* reset router
	* assigned static IPs to RPis
	* cluster now NATed behind the router
	* router is connected to BRAHMAN-AI with Internet Access
	* can now start working on Kubernetes!!!

## Jan 21 Tue

* Grocery Run
	* Gene heads to Riyadh
	* spent something like $485 (including personal requests)
	* WinCo doesn't take credit. Cash and debit only.
* Setup the cluster

## Jan 20 Mon

* Fixed Giger Counter lamp
* Added 720p, EXT, and 1080p synch mode to the VGA Synth
* Repaired VGA Synth analog inputs and internal routing bobbles


## Jan 19 Sun

* All the Dreams that Money Can Buy
* Explored some of Bombay Beach shoreline and art installations
* Setup Workstation

## Jan 18 Sat

* Dusting off of the video synth in prep to do visuals for Flo's concert on Mars

## Jan 17 Fri

* More component sorting
* Creating guide for RPi setup

## Jan 16 Thu

* Sorting Components
* Mars trip
	* I'm not very good at the electric unicycle, but made it 2 yards before tipping
	* Biked back and had Norman run with me the WHOLE WAY!!!

## Jan 15 Wed

* Shipment arrived
	* Bucket Brigaded TVs out of Truck
	* 50% of neon tubes broke
	* LCD TV was 
* Pot Luck
* Lightning Talks

## Jan 14 Tue

* Spa Day
* Biked back 

## Jan 13 Mon

* Cleaning out Chatsubo
* Cleaning the Trailer
* Setup 4G Equipment
	* Got signal and internet
* Visit to Mars
	* Norman Learned to keep away from Electric Unicycles 

## Jan 12 Sun

* Setup Yurts
* Close Encounters of the 3rd Kind

## Jan 11 Sat

* Depart JFK
* Arrival PSP
* Setup in Pirates