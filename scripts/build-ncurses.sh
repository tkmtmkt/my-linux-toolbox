#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh
export CPPFLAGS="-P"

pushd $BUILD_DIR

TARGET=ncurses-6.0
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/ncurses/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE
pushd $TARGET
./configure --prefix=$PREFIX \
            --with-pkg-config=$PREFIX/bin/pkg-config \
            --with-pkg-config-libdir=$PREFIX/lib/pkgconfig \
            --enable-pc-files \
            --with-shared \
            --with-normal \
            --without-debug \
            --without-manpages \
            --enable-widec
make && make install
ln -sf libncursesw.a    $PREFIX/lib/libncurses.a
#ln -sf libncursesw.so   $PREFIX/lib/libncurses.so
#ln -sf libncursesw.so.6 $PREFIX/lib/libncurses.so.6
popd

popd
