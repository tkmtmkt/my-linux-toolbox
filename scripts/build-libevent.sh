#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=libevent-2.1.8-stable
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
