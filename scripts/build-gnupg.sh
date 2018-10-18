#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=gnupg-2.2.9

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/gnupg/$TARGET.tar.bz2
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE

pushd $TARGET
export LDFLAGS="$LDFLAGS -lrt"
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
            --with-bzip2=$PREFIX &&
make && make install
RESULT=$?
popd

popd

log $TARGET
exit $RESULT
