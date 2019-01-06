#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=2.1.8-stable
TARGET=libevent-$VERSION

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/libevent/libevent/releases/download/release-$VERSION/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

pushd $BUILD_DIR

# expand
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE
cd $TARGET

# build
./configure --prefix=$PREFIX &&
make && make install
RESULT=$?

popd

log $TARGET
exit $RESULT
