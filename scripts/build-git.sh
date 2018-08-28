#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=git-2.18.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/git/git/archive/v2.18.0.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
make configure
./configure --prefix=$PREFIX \
            --with-zlib=$PREFIX/lib \
            --with-perl=$PREFIX/bin/perl &&
make all &&
make install &&
cp -rp ./contrib $PREFIX/share/git-core/
RESULT=$?
popd

popd

exit $RESULT
