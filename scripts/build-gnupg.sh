#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=gnupg-2.2.2
ARCHIVE=$ARCH_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/gnupg/$TARGET.tar.bz2
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar jxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            ac_cv_func_inotify_init=no \
            --with-tar=$PREFIX/bin/tar \
            --with-libgpg-error-prefix=$PREFIX \
            --with-libgcrypt-prefix=$PREFIX \
            --with-libassuan-prefix=$PREFIX \
            --with-ksba-prefix=$PREFIX \
            --with-npth-prefix=$PREFIX \
            --with-ntbtls-prefix=$PREFIX \
            --with-zlib=$PREFIX \
            --with-bzip2=$PREFIX
make && make install
RESULT=$?
popd

popd

exit $RESULT