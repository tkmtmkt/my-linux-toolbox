#!/bin/bash
PREFIX=/opt/toolbox
export PATH=$PREFIX/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib

BUILD_DIR=$(cd $(dirname $0);pwd)
pushd $BUILD_DIR

# install m4
TARGET=m4-1.4.18
wget -O $TARGET.tar.gz http://ftp.gnu.org/gnu/m4/$TARGET.tar.gz
tar zxf $TARGET.tar.gz
pushd $TARGET
./configure --prefix=$PREFIX
make && make install
popd

# install autoconf
TARGET=autoconf-2.69
wget -O $TARGET.tar.gz http://ftp.gnu.org/gnu/autoconf/$TARGET.tar.gz
tar zxf $TARGET.tar.gz
pushd $TARGET
./configure --prefix=$PREFIX
popd

popd
