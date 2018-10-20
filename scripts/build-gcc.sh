#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=7.3.0
TARGET=gcc-$VERSION

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.xz
DOWNLOAD_URL=http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/$TARGET/$TARGET.tar.xz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

pushd $BUILD_DIR

# expand
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE
cd $TARGET

# build
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

log $TARGET
exit $RESULT
