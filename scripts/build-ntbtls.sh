#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=ntbtls-0.1.2
ARCHIVE=$ARCH_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=https://gnupg.org/ftp/gcrypt/ntbtls/$TARGET.tar.bz2
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -d $TARGET ]] && rm -rf $TARGET
tar jxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --with-libgpg-error-prefix=$PREFIX \
            --with-libgcrypt-prefix=$PREFIX \
            --with-ksba-prefix=$PREFIX \
            --with-zlib=$PREFIX &&
# CentOS6でのコンパイルエラー対処
sed -i -e '100 s|^typedef|//typedef|' src/context.h &&
sed -i -e '196 s|^typedef|//typedef|' src/ciphersuites.h &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
