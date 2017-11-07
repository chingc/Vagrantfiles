#!/bin/bash
set -e


sudo apt-get install git

git config --global credential.helper "cache --timeout=86400"  # seconds
