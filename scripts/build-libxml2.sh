#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=libxml2-2.9.8

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://xmlsoft.org/sources/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --disable-shared \
            --with-history \
            --with-python=$PREFIX/bin/python3 \
            --with-icu \
            --with-threads
make && make install
RESULT=$?
popd

popd

exit $RESULT
