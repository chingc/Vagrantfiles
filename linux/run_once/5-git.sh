#!/bin/bash
set -e


sudo apt-get install git

# 86400 seconds is 1 day
git config --global credential.helper "cache --timeout=86400"
