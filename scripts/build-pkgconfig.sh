#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=pkg-config-0.29.2
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://pkg-config.freedesktop.org/releases/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ ! -e $TARGET ]] && tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --with-internal-glib \
            --disable-compile-warnings \
            --disable-host-tool
make && make install
RESULT=$?
popd

popd

exit $RESULT