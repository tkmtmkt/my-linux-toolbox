#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR

TARGET=ncurses-6.0
ARCHIVE=$SRC_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/ncurses/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX \
            --with-shared \
            --without-debug \
            --without-normal \
            --enable-widec
make && make install
ln -sf libncursesw.so   $PREFIX/lib/libncurses.so
ln -sf libncursesw.so.6 $PREFIX/lib/libncurses.so.6
popd

popd
