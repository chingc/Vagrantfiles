#!/bin/bash
set -e


SWAP="${HOME}/.swap"

sudo dd if="/dev/zero" of="${SWAP}" bs=1024 count=6291456  # kilobytes
sudo chmod 600 "${SWAP}"
sudo mkswap "${SWAP}"
sudo swapon "${SWAP}"

echo "${SWAP} none swap sw 0 0" | sudo tee -a /etc/fstab
sudo mount -a
