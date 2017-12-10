#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=libassuan-2.4.4
ARCHIVE=$ARCH_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/libassuan/$TARGET.tar.bz2
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar jxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-static \
            --disable-shared \
            --with-libgpg-error-prefix=$PREFIX
make && make install
RESULT=$?
popd

popd

exit $RESULT