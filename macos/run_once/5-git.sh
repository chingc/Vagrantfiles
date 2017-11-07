#!/bin/bash
set -e


brew install git

git config --global credential.helper "cache --timeout=86400"  # seconds
