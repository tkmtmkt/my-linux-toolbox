#!/bin/bash
PREFIX=/opt/toolbox
export PATH=$PREFIX/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib

SRC_DIR=$PREFIX/src
[[ ! -e $SRC_DIR ]] && mkdir -p $SRC_DIR

BUILD_DIR=$PREFIX/build
[[ ! -e $BUILD_DIR ]] && mkdir -p $BUILD_DIR

pushd $BUILD_DIR

# install m4
TARGET=m4-1.4.18
ARCHIVE=$SRC_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/m4/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX
make && make install
popd

# install autoconf
TARGET=autoconf-2.69
ARCHIVE=$SRC_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/autoconf/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX
popd

popd
