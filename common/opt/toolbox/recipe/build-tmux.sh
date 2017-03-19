#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=tmux-2.3
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/tmux/tmux/archive/2.3.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./autogen.sh
./configure --prefix=$PREFIX \
            LIBNCURSES_CFLAGS="-I$PREFIX/include/ncursesw" \
            LIBNCURSES_LIBS="-L$PREFIX/lib"
make && make install
popd

popd
