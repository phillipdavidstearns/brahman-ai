#!/bin/bash

#----------------------------------------------------------------------------
# Wireguard Server Setup Script
# Phillip David Stearns 2019
# To Do:
#	
#	1. SIGINT trap to close the tunnel and remove the interface
#	2. Setup for daemonization
#
#	Usage:
#		wg_setup.sh -i iface_name -a ip_address -c path_to_conf_file
#----------------------------------------------------------------------------

# display usage
function usage {
	echo -e "\nUsage: wg_setup.sh -i iface_name -a ip_address -c path_to_conf_file"
	echo -e "\nNOTE: Must be run as root!\n"
	echo -e "\t-h\t\tdisplay this help message"
	echo -e "\t-i\t\tinterface name (e.g. wg0)"
	echo -e "\t-a\t\tip address (e.g. 10.0.0.1)"
	echo -e "\t-c\t\t/full/path/to/file.conf (e.g. /etc/wireguard/wg0.conf)"
	echo -e "\n"
}

# check if being run as root
if [ "$EUID" -ne 0 ]; then
	echo "[!] Must be run as root."
	exit 1
fi

# were enough arguments supplied?
if [ $# -lt 6 ]; then
	usage
	exit 1
fi

# parse the arguments
while getopts ":hi:a:c:" opt; do
 	case ${opt} in
 		h)
			usage
			exit 0
			;;
		i)
			IFACE=${OPTARG}
			;;
		a)
			IPADDR=${OPTARG}
			;;
		c)
			CONF=${OPTARG}
			;;
		:)
		echo '[!] Option requires an argument.'
		exit 1
		;;
	\?)
		echo '[!] Invalid option.'
		exit 1
		;;
	esac
done
shift $((OPTIND -1))

# The argument quantity check should make this moot
if [[ -z $IFACE ]]; then
	echo "[!] Supply an interface name (e.g. wg0)"
	exit 1
fi

if [[ -z $IPADDR ]]; then
	echo "[!] Supply an IP address for the interface (e.g. 10.0.0.1)"
	exit 1
fi

if [[ -z $CONF ]]; then
	echo "[!] Provide the /full/path/to/file.conf (e.g. /etc/wireguard/wg0.conf)"
	exit 1
fi

# test for valid IP address
# source: https://www.linuxjournal.com/content/validating-ip-address-bash-script

ip_is_valid () {
	local  ip=$1
	local  stat=1
	if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		IFS='.'
		ip=($ip)
		unset IFS
		[[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
		stat=$?
    fi
    return $stat
}

if ip_is_valid $IPADDR; then
	ip=$IPADDR
	IFS='.'
	ip=($ip)
	unset IFS
	SUBNET=${ip[0]}.${ip[1]}.${ip[2]}.0/24
else
	echo "[!] $IPADDR is not a valid IP"
	exit 1
fi

# Check if the conf file exists (future: interface and peers config files)
if [ ! -e $CONF ]; then
	echo "[!] $CONF does not exist."
	exit 1
elif [ ! -r $CONF ]; then
	echo "[!] You don't have permission to read $CONF"
	exit 1
elif [ -d $CONF ]; then
	echo "[!] $CONF is a directory."
	exit 1
fi

# Create and setup Wireguard interface

add_iface () {
    ip link add dev $1 type wireguard
    if [ $? -eq 0 ]; then
        echo "[+] Created Wireguard interface at $IFACE"
    else
        echo "[!] Could not create interface at $IFACE"
        exit 1
    fi
}

del_iface () {
    ip link del $1
    if [ $? -eq 0 ]; then
        echo "[+] Deleted interface at $IFACE"
    else
        echo "[!] Could not delete interface at $IFACE"
        exit 1
    fi
}

# Add the interface if it doesn't already exist
if [[ $(ip a | grep -o $IFACE) == '' ]]; then
    add_iface $IFACE
else
    echo "[*] WARNING: $IFACE already exists."
    del_iface $IFACE
    add_iface $IFACE
fi

# Assign the specified IP address to the interface:

if [[ $(ip a s $IFACE | grep -o $IPADDR/32) == $IPADDR/32 ]]; then
	echo "[*] $IFACE already assigned the $IPADDR/32"
else
	ip address add dev $IFACE $IPADDR/32
	if [ $? -eq 0 ]; then
		echo "[+] Set $IFACE IP to $IPADDR/32"
	else
		echo "[!] Could not set $IFACE IP."
		exit 1
	fi
fi

# Setup wireguard configuration for the interface
wg setconf $IFACE $CONF

if [ $? -eq 0 ]; then
	echo "[+] $IFACE successfully configured using $CONF"
else
	echo "[!] Configuration of $IFACE failed using $CONF"
	exit 1
fi

# Bring the interface online
ip link set $IFACE up

if [ $? -eq 0 ]; then
	echo "[+] $IFACE successfully brought up"
else
	echo "[!] Failed to bring $IFACE up"
	exit 1
fi

# Assign a subnet route to the interface
SUBNET_CHECK=$(ip route show dev $IFACE | grep -oE $SUBNET)

if [[ $SUBNET_CHECK == '' ]]; then
    ip route add dev $IFACE $SUBNET

    if [ $? -eq 0 ]; then
        echo "[+] Added route $SUBNET to $IFACE"
    elif [ $? -eq 2 ]; then
        echo "[*] Route to $SUBNET is already asigned"
    else
        echo "[!] Failed to add route $SUBNET to $IFACE"
        exit 1
    fi

elif [[ $SUBNET_CHECK == $SUBNET ]]; then
    echo "[*] $IFACE already assigned route $SUBNET"
else
    echo "[!] Error creating route for $IFACE. Consider removing it before trying again."
fi

# Show the current Wireguard configuration
echo "[+] GREAT SUCCESS!"

wg show

exit 0
