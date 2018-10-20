#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=3.7.0
TARGET=Python-$VERSION

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tgz
DOWNLOAD_URL=https://www.python.org/ftp/python/$VERSION/$TARGET.tgz
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
