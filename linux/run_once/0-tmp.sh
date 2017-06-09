#!/bin/bash
set -e


sudo cp /usr/share/systemd/tmp.mount /etc/systemd/system/tmp.mount

sudo systemctl enable tmp.mount
sudo systemctl start tmp.mount
