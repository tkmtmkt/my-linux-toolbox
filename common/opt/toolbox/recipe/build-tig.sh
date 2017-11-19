#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=tig-2.2
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://jonas.nitro.dk/tig/releases/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX \
            --without-ncursesw
make && make install
popd

popd
