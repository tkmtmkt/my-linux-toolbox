#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=npth-1.5

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=https://gnupg.org/ftp/gcrypt/npth/$TARGET.tar.bz2
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar jxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
