#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=p7zip_16.02
ARCHIVE=$ARCH_DIR/${TARGET}_src_all.tar.bz2
DOWNLOAD_URL=https://sourceforge.net/projects/p7zip/files/p7zip/16.02/${TARGET}_src_all.tar.bz2
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -d $TARGET ]] && rm -rf $TARGET
tar jxf $ARCHIVE

pushd $TARGET
sed -i "s|/usr/local|$PREFIX|g" makefile.common &&
make all3 && make install
RESULT=$?
popd

popd

exit $RESULT
