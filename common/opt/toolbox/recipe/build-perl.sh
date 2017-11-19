#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=perl-5.26.1
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://www.cpan.org/src/5.0/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure.gnu --prefix=$PREFIX
make && make install
popd

popd
