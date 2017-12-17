#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=openssl-1.1.0g
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://www.openssl.org/source/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -e $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

PERL=$PREFIX/bin/perl

pushd $TARGET
./config zlib \
         --prefix=$PREFIX \
         --openssldir=$PREFIX/ssl \
         --with-zlib-include=$PREFIX/include \
         --with-zlib-lib=$PREFIX/lib \
         -Wl,-rpath,$PREFIX/lib
make &&
make install_sw &&
make install_ssldirs &&
make install_man_docs
RESULT=$?
popd

popd

exit $RESULT
