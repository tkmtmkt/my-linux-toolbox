#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=multitail-6.4.2

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://www.vanheusden.com/multitail/$TARGET.tgz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE

pushd $TARGET
sed -i "s|DESTDIR=|DESTDIR=$PREFIX|g" Makefile &&
sed -i "s|PREFIX=/usr|PREFIX=|g" Makefile &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
