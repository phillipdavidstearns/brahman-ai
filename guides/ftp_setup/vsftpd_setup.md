# Setting up NAS with `vsftpd` on a Beaglebone Black

These instructions will guide you through the setup of an FTP server on a Beaglebone Black with an external USB drive attached. These steps should work reasonably well on a Debian distribution, such as Raspbian.

This guide starts under the assumption that you've already setup the Beaglebone Black to a point where you can remotely access it on your network over `ssh`.


1. Login `$ ssh cluster_storage`
1. Update apt cache: `$ sudo apt-get update`
1. Update installed packages: `$ sudo apt-get upgrade`
1. Install `vsftpd`: `$ sudo apt install vsftpd`
1. Check that it installed and started OK: `$ sudo systemctl status vsftpd`

```
● vsftpd.service - vsftpd FTP server
   Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2020-03-19 23:42:22 UTC; 28s ago
 Main PID: 1959 (vsftpd)
    Tasks: 1 (limit: 1024)
   Memory: 376.0K
   CGroup: /system.slice/vsftpd.service
           └─1959 /usr/sbin/vsftpd /etc/vsftpd.conf

Mar 19 23:42:22 clusterNAS systemd[1]: Starting vsftpd FTP server...
Mar 19 23:42:22 clusterNAS systemd[1]: Started vsftpd FTP server.
```

1. Locate the USB storage device: `$ sudo fdisk -l`

```

<snip>

Disk identifier: 9B155057-6744-423B-B562-0E2040AD8C06

Device          Start         End    Sectors   Size Type
/dev/sda1          34      409633     409600   200M EFI System
/dev/sda2      409634  6844970129 6844560496   3.2T Apple HFS/HFS+
/dev/sda3  6845233152  7821533183  976300032 465.5G Microsoft basic data
/dev/sda4  7821795328 15627790335 7805995008   3.7T Microsoft basic data

<snip>

```


1. Create a mount point for the USD drive: `$ sudo mkdir /media/NAS`
1. Mount the USB drive to the mount point: `$ sudo mount /dev/sda3 /media/NAS`
1. Create a directory for the user on the USB drive: `$ sudo mkdir abraham'
1. Set ownership to user: `$ sudo chown abraham:abraham /media/NAS/abraham`
1. Set permissions: `$ sudo chmod 755 /media/NAS/abraham`
1. Create a user specific directory on the USB drive: `$ sudo mkdir /media/NAS/abraham`
1. Set the user's 'home' directory: `$ sudo usermod -d /media/NAS/abraham abraham`
1. Edit the configuration file: `$ sudo nano /etc/vsftpd.conf`
1. Make sure the following options are set:

```
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
ssl_enable=YES
```

*note:* The above options may need to be either uncommented or manually set.

1. `$ sudo systemctl restart vsftpd`