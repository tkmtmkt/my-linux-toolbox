#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=vim-8.0.0433
ARCHIVE=$SRC_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/vim/vim/archive/v8.0.0433.tar.gz
[[ ! -e $ARCHIVE ]] && wget -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX \
            --disable-selinux \
            --enable-python3interp
make && make install
popd

popd
