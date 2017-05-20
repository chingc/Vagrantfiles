#!/bin/bash


sudo apt-get update
sudo apt-get -u upgrade --assume-no
exit 0  # avoid exit 1 from --assume-no
