#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=highway-1.1.0
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/tkengo/highway/archive/v1.1.0.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -e $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
mkdir -p config
aclocal && \
autoconf && \
autoheader && \
automake --add-missing && \
./configure --prefix=$PREFIX && \
make && make install
RESULT=$?
popd

popd

exit $RESULT
