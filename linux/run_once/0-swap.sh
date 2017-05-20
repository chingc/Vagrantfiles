#!/bin/bash
set -e


sudo dd if=/dev/zero of=/swap bs=1024 count=6291456  # kilobytes
sudo chmod 600 /swap
sudo mkswap /swap
sudo swapon /swap

echo "/swap none swap sw 0 0" | sudo tee -a /etc/fstab
sudo mount -a
