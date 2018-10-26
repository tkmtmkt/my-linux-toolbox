#!/bin/bash
# https://sourceware.org/libffi/
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=3.2.1
TARGET=libffi-$VERSION

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://sourceware.org/ftp/libffi/$TARGET.tar.gz
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
