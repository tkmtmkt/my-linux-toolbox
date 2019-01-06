#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=3.7.2
TARGET=Python-$VERSION

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.xz
DOWNLOAD_URL=https://www.python.org/ftp/python/$VERSION/$TARGET.tar.xz
[[ ! -s $ARCHIVE ]] && curl -ksSL -o $ARCHIVE $DOWNLOAD_URL

pushd $BUILD_DIR

# expand
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE
cd $TARGET

# build
./configure --prefix=$PREFIX \
            --disable-shared \
            --with-doc-strings \
            --with-system-expat \
            --with-system-ffi \
            --with-ensurepip=install &&
make && make install &&
ln -sf python3 $PREFIX/bin/python &&
RESULT=$?

popd

log $TARGET
exit $RESULT
