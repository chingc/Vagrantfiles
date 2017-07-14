#!/bin/bash
set -e


DEVICE="/dev/sdc"
LABEL="custom-hdd"
MOUNT="${HOME}"

if sudo fdisk -l "${DEVICE}" | grep -q "Disklabel"
then
    echo "${DEVICE} is ready"
else
    echo "Preparing ${DEVICE}..."

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

    sudo rsync -av "${MOUNT}/" /tmp_home
    sudo mount -a

    sudo rsync -av /tmp_home/ "${MOUNT}"
    sudo rm -r /tmp_home
    sudo chown -R "${USER}:${USER}" "${MOUNT}"

    echo "${DEVICE} is ready"
fi
