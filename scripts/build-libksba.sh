#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=libksba-1.3.5
ARCHIVE=$ARCH_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/libksba/$TARGET.tar.bz2
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -d $TARGET ]] && rm -rf $TARGET
tar jxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --with-libgpg-error-prefix=$PREFIX &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
