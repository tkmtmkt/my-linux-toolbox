#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=tmux-2.6

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/tmux/tmux/archive/2.6.tar.gz
[[ ! -s $ARCHIVE ]] && curl -sSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./autogen.sh &&
./configure --prefix=$PREFIX &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
