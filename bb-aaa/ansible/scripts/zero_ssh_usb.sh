#!/bin/bash

echo "dtoverlay=dwc2" >> /Volumes/boot/config.txt
sed -i.bu 's/rootwait/rootwait\ modules-load=dwc2,g_ether/' /Volumes/boot/cmdline.txt

for i in {1..5}; do
	echo "dtoverlay=dwc2" >> "/Volumes/boot $i/config.txt"
	sed -i.bu 's/rootwait/rootwait\ modules-load=dwc2,g_ether/' "/Volumes/boot $i/cmdline.txt"
done

for i in {2..7}; do
	diskutil unmountDisk "disk$i"
done

exit 0