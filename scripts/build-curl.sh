#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=curl-7.56.1
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://curl.haxx.se/download/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

CA_CERT=$ARCH_DIR/cacert.pem
[[ ! -s $CA_CERT ]] && wget -O $CA_CERT http://curl.haxx.se/ca/cacert.pem
CA_PATH=$PREFIX/ssl/certs
CA_BUNDLE=$CA_PATH/ca-bundle.crt
cp $CA_CERT $CA_BUNDLE

pushd $TARGET
./configure --prefix=$PREFIX \
            --disable-manual \
            --enable-libcurl-option \
            --with-ssl=$PREFIX/ssl \
            --with-ca-path=$CA_PATH \
            --with-ca-bundle=$CA_BUNDLE &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
