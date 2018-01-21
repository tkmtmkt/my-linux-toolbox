#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=vim-8.0.1307
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/vim/vim/archive/v8.0.1307.tar.gz
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-fail-if-missing \
            --enable-python3interp=yes \
            --enable-multibyte \
            --with-features=huge &&
make && make install &&
ln -sf vim $PREFIX/bin/vi
RESULT=$?
popd

popd

exit $RESULT
