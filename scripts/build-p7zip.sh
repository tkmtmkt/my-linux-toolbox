#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=p7zip_16.02

# download
ARCHIVE=$ARCHIVES_DIR/${TARGET}_src_all.tar.bz2
DOWNLOAD_URL=https://sourceforge.net/projects/p7zip/files/p7zip/16.02/${TARGET}_src_all.tar.bz2
[[ ! -s $ARCHIVE ]] && curl -ksSL -o $ARCHIVE $DOWNLOAD_URL

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE

pushd $TARGET
sed -i "s|/usr/local|$PREFIX|g" makefile.common &&
make all3 && make install
RESULT=$?
popd

popd

log $TARGET
exit $RESULT
