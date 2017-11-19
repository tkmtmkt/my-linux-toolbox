#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=openssl-1.1.0g
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://www.openssl.org/source/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./config no-shared zlib \
         --prefix=$PREFIX \
         --openssldir=$PREFIX \
         --with-zlib-include=$PREFIX/include \
         --with-zlib-lib=$PREFIX/lib
make && make install
popd

popd
