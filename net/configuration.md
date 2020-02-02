# Cluster configuration

## Router Setup

* Using a Dlink DIR-250 Unified Service Router to connect to the BRAHMAN-AI LAN @ 10.79.10.30 via the dedicated WAN connection
* It's internal IP space is 10.79.20.0/24
* DHCP is enabled and using 10.79.20.2-254
* To allow for access to the cluster from the BRAHMAN-AI LAN, the DSR-250 was configured to:
	* Classical Routing - Allows internal IP range to be accessible via dedicated WAN
	* Added a firewall rule to allow packets from 10.79.10.0/24 to 10.79.20.0/24
	* Configured a static route on the EXR from 10.79.10.0/24 to 10.79.10.30 (named cluster)
* DHCP Reservation and IP/MAC binding (optional) used to set RPis on predictable IP addresses
* All the RPis have been preconfigured with unique hostnames, so this is a bit different than starting from scratch.
* Use a `bash` one-liner to grab hostnames and MAC addresses for the **ethernet interface**:

```
for i in {0..7}; do ssh hbd-0$i.local 'echo -n "$HOSTNAME: "; ip addr show eth0 | grep ether';done
hbd-00:     link/ether b8:27:eb:51:0a:9f brd ff:ff:ff:ff:ff:ff
hbd-01:     link/ether b8:27:eb:ff:fe:bb brd ff:ff:ff:ff:ff:ff
hbd-02:     link/ether b8:27:eb:f4:cc:9e brd ff:ff:ff:ff:ff:ff
hbd-03:     link/ether b8:27:eb:11:8d:94 brd ff:ff:ff:ff:ff:ff
hbd-04:     link/ether b8:27:eb:67:6a:43 brd ff:ff:ff:ff:ff:ff
hbd-05:     link/ether b8:27:eb:a0:23:fa brd ff:ff:ff:ff:ff:ff
hbd-06:     link/ether b8:27:eb:75:79:c2 brd ff:ff:ff:ff:ff:ff
hbd-07:     link/ether b8:27:eb:73:d0:e6 brd ff:ff:ff:ff:ff:ff
```

Or you can manually connect and look for broadcast packets from the RPis:

```
cluster_08:	b8:27:eb:c2:e9:ca	(169.254.47.137)
cluster_09:	b8:27:eb:f6:23:4b	(169.254.252.139)
cluster_10:	b8:27:eb:74:dd:bb	(169.254.202.68) * pi:bombaybeach2020
cluster_11:	b8:27:eb:ee:fd:8a	(169.254.239.97) * pi:bombaybeach2020
```

* There might be an automated way of doing this by connecting to the router over ssh...

![](images/ip_mac_binding.png)

## SSH configuration of the DSR-250

* Enabled SSH management from any IP address (not the most secure)
* Attempting to connect to the DSR-250 over ssh yielded:

```
Unable to negotiate with 10.79.10.30 port 22: no matching key exchange method found. Their offer: diffie-hellman-group-exchange-sha1,diffie-hellman-group1-sha1
```

[https://unix.stackexchange.com/questions/340844/how-to-enable-diffie-hellman-group1-sha1-key-exchange-on-debian-8-0](https://unix.stackexchange.com/questions/340844/how-to-enable-diffie-hellman-group1-sha1-key-exchange-on-debian-8-0)

>The OpenSSH website has a page dedicated to legacy issues such as this one. It suggests the following approach, on the client:

```
ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 123.123.123.123
```

>or more permanently, adding

```
Host 123.123.123.123
    KexAlgorithms +diffie-hellman-group1-sha1
```

>to `~/.ssh/config`.

* Changed `~/.ssh/config`, added:

```
Host 10.79.10.30
	User admin
	KexAlgorithms +diffie-hellman-group1-sha1
	KexAlgorithms +diffie-hellman-group-exchange-sha1
```

* Attempting to ssh in yielded the following:

```
no matching cipher found. Their offer: aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,arcfour,aes192-cbc,aes256-cbc,rijndael-cbc@lysator.liu.se
```

* From [https://www.openssh.com/legacy.html](https://www.openssh.com/legacy.html):
* Ran `ssh -Q cipher`
* Added cipher to `~/.ssh/config`: `Ciphers aes256-cbc`
* Attempting to login yielded:

```
BusyBox v1.17.4 (2018-05-03 11:31:38 IST) built-in shell (ash)
Enter 'help' for a list of built-in commands.

SSH login from user (admin) from IP (10.79.10.106) is not allowed.
Connection to 10.79.10.30 closed.
```