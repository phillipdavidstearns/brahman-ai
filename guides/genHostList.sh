#!/bin/bash

FILENAME="all"
GROUP_NAME="raspberry_pis"
BASE_NAME="brahman_vision"
IP_SUBNET="192.168.1"
START=0
END=99

# create a list
> $FILENAME

# add group name
echo -e "[$GROUP_NAME]\n" >> $FILENAME

# generate the list
for (( i=$START; i<=$END; i++ )); do
	HOST_NUMBER=$(printf "%0*d\n" 3 $i)
	HOST_IP=$(( $i + 100 ))
	echo "${BASE_NAME}_${HOST_NUMBER} ansible_host=${IP_SUBNET}.${HOST_IP}" >> $FILENAME
done

exit $?
