#!/usr/bin/env bash

# Automatically installs swiftenv and run's swiftenv install.
# This script was designed for usage in CI systems.

sudo apt-get install clang libicu-dev
mkdir swift
curl https://swift.org/builds/$SWIFT_BRANCH/ubuntu1404/$SWIFT_VERSION/$SWIFT_VERSION-ubuntu14.04.tar.gz -s | tar xz -C swift &> /dev/null
export PATH="$(pwd)/swift/$SWIFT_VERSION-ubuntu14.04/usr/bin:$PATH"
