#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=bc-1.07.1

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/bc/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -sSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --with-readline &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
