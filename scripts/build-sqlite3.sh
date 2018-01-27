#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=sqlite-autoconf-3210000

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://www.sqlite.org/2017/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -sSL -o $ARCHIVE $DOWNLOAD_URL

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-readline &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
