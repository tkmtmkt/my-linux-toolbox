#!/bin/bash

# Install buildtools
yum -q -y update &&
yum -q -y install unzip curl wget &&
yum -q -y install make gcc gcc-c++ patch &&
yum -q -y install flex &&
yum -q -y install cmake libtool libuuid-devel &&
yum -q -y install libicu-devel &&
yum -q -y install centos-release-scl &&
yum -q -y install devtoolset-8 &&

# Remove installation files
rm -r /assets/

exit $?
