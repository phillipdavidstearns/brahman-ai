# Setting up external USB storage on Beaglebone Black

1. Locate USB drive
2. Mount the drive

## Locating the USB drive

1. Connect the USB drive
2. Switch to root `sudo su`
2. run `ls -ahl /dev/sda*`

```
brw-rw---- 1 root disk 8, 0 Feb  7 21:54 /dev/sda
brw-rw---- 1 root disk 8, 1 Feb  7 21:54 /dev/sda1
```

3. create a mount point: `mkdir /mnt/usb1`
4. mount the drive: `mount -t msdos /dev/sda1 /mnt/usb1` (The thumbdrive I'm using was pre-formatted for FAT32. simply omit the `-t msdos` if you're working with ext4)
5. (optional) create symlink to a user friendly place: `ln -s /mnt/usb1 /media`
6. `ls -alh /media`:

```
drwxr-xr-x  2 root root 4.0K Feb  7 22:17 .
drwxr-xr-x 21 root root 4.0K Feb  7 20:45 ..
lrwxrwxrwx  1 root root    9 Feb  7 22:17 usb1 -> /mnt/usb1
```

### Unmounting

1. remove the symlink `rm /media/usb1`
2. unmount the device `umount /dev/sda1`
3. remove the mount point `rmdir /mnt/usb1`