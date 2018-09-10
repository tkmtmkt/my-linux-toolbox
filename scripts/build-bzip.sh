#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=bzip2-1.0.6

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://fossies.org/linux/misc/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE

pushd $TARGET
sed -i "s|CFLAGS=|CFLAGS=-fPIC |g" Makefile &&
make &&
make -f Makefile-libbz2_so &&
make install PREFIX=$PREFIX
RESULT=$?
popd

popd

exit $RESULT
