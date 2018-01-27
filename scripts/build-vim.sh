#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=vim-8.0.1307

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/vim/vim/archive/v8.0.1307.tar.gz
[[ ! -s $ARCHIVE ]] && curl -sSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
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
