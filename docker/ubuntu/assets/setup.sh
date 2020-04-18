#!/bin/bash

# Install build tools
apt -q update &&
apt -q -y upgrade &&
apt -q -y install curl wget &&
apt -q -y install make g++ patch &&
apt -q -y install flex &&
apt -q -y install groff-base &&
apt -q -y install cmake uuid-dev &&

# Remove installation files
rm -r /assets/

exit $?
