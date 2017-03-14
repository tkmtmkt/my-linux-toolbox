#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=git-2.12.0
ARCHIVE=$SRC_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/git/git/archive/v2.12.0.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
make configure
./configure --prefix=$PREFIX
make all doc
make install install-doc install-html
cp -rp ./contrib $PREFIX/share/git-core/
popd

popd
