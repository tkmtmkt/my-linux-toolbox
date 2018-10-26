#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=3.6.3
TARGET=geos-$VERSION

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.bz2
DOWNLOAD_URL=http://download.osgeo.org/geos/$TARGET.tar.bz2
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

pushd $BUILD_DIR

# expand
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE
cd $TARGET

# build
./configure --prefix=$PREFIX &&
make && make install
RESULT=$?

popd

log $TARGET
exit $RESULT
