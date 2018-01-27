#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=ncurses-6.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/ncurses/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL

# build
export CPPFLAGS="-P"
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --with-pkg-config=$PREFIX/bin/pkg-config \
            --with-pkg-config-libdir=$PREFIX/lib/pkgconfig \
            --with-shared \
            --without-debug \
            --without-manpages \
            --enable-pc-files \
            --enable-rpath \
            --enable-widec \
            --enable-ext-colors &&
make && make install &&
for lib in ncurses form panel menu
do
  ln -sf lib${lib}w.a    $PREFIX/lib/lib${lib}.a
  ln -sf lib${lib}w.so   $PREFIX/lib/lib${lib}.so
  ln -sf lib${lib}w.so.6 $PREFIX/lib/lib${lib}.so.6
  ln -sf lib${lib}w.pc   $PREFIX/lib/pkgconfig/${lib}.pc
done
RESULT=$?
popd

popd

exit $RESULT
