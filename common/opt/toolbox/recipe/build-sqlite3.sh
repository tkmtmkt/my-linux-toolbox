#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=sqlite-autoconf-3210000
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://www.sqlite.org/2017/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-static \
            --disable-shared
make && make install
popd

popd
