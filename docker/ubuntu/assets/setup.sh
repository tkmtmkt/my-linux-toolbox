#!/bin/bash

# Install build tools
apt -q update &&
apt -q -y upgrade &&
apt -q -y install unzip curl wget &&
apt -q -y install make g++ patch &&
apt -q -y install flex &&
apt -q -y install groff-base &&
apt -q -y install cmake uuid-dev &&
apt -q -y install libicu-dev &&

# Remove installation files
rm -r /assets/

exit $?
