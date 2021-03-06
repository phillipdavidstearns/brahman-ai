# Setting up NAS with `vsftpd` on a Beaglebone Black (or Raspberry Pi)

These instructions will guide you through the setup of an FTP server on a Beaglebone Black (running Debian 10) with an external USB drive attached. These steps should work reasonably well on a Debian distribution, such as Raspbian.

### This guide starts under the assumption that:

* you've already setup the Beaglebone Black to a point where you can remotely access it on your network over `ssh`.
* you've formatted a drive partition on a USB storage device
* that storage device is attached to your Beaglebone (or RPi)
* you know how to create a non-privledged user
* you've configured your ~/.ssh/config file with an alias for your device

## Setup the Server

1. Login `$ ssh clusterNAS` or `$ ssh <user>@<ip_address>`
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

Disk /dev/sda: 7.3 TiB, 8001563221504 bytes, 15628053167 sectors
Disk model: Backup+ Hub BK  
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 9B155057-6744-423B-B562-0E2040AD8C06

Device          Start         End    Sectors  Size Type
/dev/sda1          34      409633     409600  200M EFI System
/dev/sda2      409634  6844970129 6844560496  3.2T Apple HFS/HFS+
/dev/sda3  6844971008 15628053133 8783082126  4.1T Linux filesystem

<snip>

```


1. Create a mount point for the USD drive: `$ sudo mkdir /media/NAS`
1. Mount the Linux filesystem partition of USB drive to the mount point: `$ sudo mount /dev/sda3 /media/NAS`
1. Create a directory for the user on the USB drive: `$ sudo mkdir /media/NAS/abraham`
1. Set ownership to user: `$ sudo chown abraham:abraham /media/NAS/abraham`
1. Set permissions: `$ sudo chmod 755 /media/NAS/abraham`
1. Set the user's 'home' directory to the directory on the USB drive: `$ sudo usermod -d /media/NAS/abraham abraham`
1. Edit `/etc/fstab` to setup auto-mount: `$ sudo nano /etc/fstab`
1. Add the line: `/dev/sda3    /media/NAS/    ext4    defaults    0    1`
1. Save and reboot: `$ sudo reboot`
1. Edit the `vsftp` configuration file: `$ sudo nano /etc/vsftpd.conf`
1. Make sure the following options are set:

```
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
ssl_enable=YES
```

*note:* The above options may need to be either uncommented or manually added.

1. Restart the `vsftp` daemon: `$ sudo systemctl restart vsftpd`

## Connecting

I have long used [FileZilla](https://filezilla-project.org/) for all my FTP needs. Any FTP client should do.

1. Download and install [FileZilla](https://filezilla-project.org/download.php?type=client)
1. Connect to the FTP server running on the Beaglebone Black:
	1. Host: 10.79.20.99
	1. Username: abraham
	1. Password: (ask me on the discords)
	1. Port: (leave blank)
	1. Click Quickconnect

![](images/fileZilla_01.png)

1. Upload to and download from the `/movies/` directory

![](images/fileZilla_02.png)

**Enjoy!**
