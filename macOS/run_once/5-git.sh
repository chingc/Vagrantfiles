#!/bin/bash
set -e -x


brew install git

# 86400 seconds is 1 day
git config credential.helper cache
git config credential.helper 'cache --timeout=86400'
