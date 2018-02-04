#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=gcc-7.3.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.xz
DOWNLOAD_URL=http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/$TARGET/$TARGET.tar.xz
[[ ! -s $ARCHIVE ]] && curl -sSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xJf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-languages=c,c++ \
            --disable-bootstrap \
            --disable-multilib \
            --with-gmp \
            --with-mpfr \
            --with-mpc  &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
