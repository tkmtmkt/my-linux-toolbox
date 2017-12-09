#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=npth-1.5
ARCHIVE=$ARCH_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=https://gnupg.org/ftp/gcrypt/npth/$TARGET.tar.bz2
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar jxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-static \
            --disable-shared
make && make install
popd

popd
