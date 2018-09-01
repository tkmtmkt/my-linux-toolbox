#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=texinfo-6.5

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/texinfo/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX_BUILDTOOL &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
