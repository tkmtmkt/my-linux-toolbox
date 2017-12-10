#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=curl-7.56.1
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://curl.haxx.se/download/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --disable-manual \
            --enable-libcurl-option \
            --with-ca-bundle=$PREFIX/etc/ca-bundle.crt \
            --with-ca-path=$PREFIX/etc/certificates \
            --with-ssl=$PREFIX/ssl
make && make install
RESULT=$?
popd

popd

exit $RESULT
