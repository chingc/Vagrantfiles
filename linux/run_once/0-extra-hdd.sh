#!/bin/bash
set -e


DEVICE="/dev/sdc"
MOUNT="${HOME}/extra-hdd"
LABEL="$(basename "${MOUNT}")"

if sudo fdisk -l "${DEVICE}" | grep -q "Disklabel"
then
    echo "${DEVICE} is ready"
else
    echo "${DEVICE} is being prepared..."

    {
        echo g;  # new GPT partition table
        echo n;  # add new partition
        echo 1;  # partition number
        echo  ;  # first sector (accept default)
        echo  ;  # last sector (accept default)
        echo w;  # write changes
    } | sudo fdisk "${DEVICE}"

    sudo mkfs.ext4 "${DEVICE}1"  # format partition 1
    sudo e2label "${DEVICE}1" "${LABEL}"  # label partition 1

    echo "LABEL=${LABEL} ${MOUNT} ext4 defaults 0 0" | sudo tee -a /etc/fstab
    mkdir "${MOUNT}"

    sudo mount -a

    echo "${DEVICE} is ready"
fi
