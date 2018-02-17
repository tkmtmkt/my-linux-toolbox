#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=gmp-6.1.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=ftp://gcc.gnu.org/pub/gcc/infrastructure/$TARGET.tar.bz2
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xjf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
