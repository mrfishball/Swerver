#!/usr/bin/env bash

# Automatically installs clang and swift snapshot.
# This script was designed for usage in Travis CI.

sudo apt-get update
sudo apt-get install clang libicu-dev
mkdir swift
curl https://swift.org/builds/$SWIFT_BRANCH/ubuntu1610/$SWIFT_VERSION/$SWIFT_VERSION-ubuntu16.10.tar.gz -s | tar xz -C swift &> /dev/null
export PATH="$(pwd)/swift/$SWIFT_VERSION-ubuntu16.10/usr/bin:$PATH"
