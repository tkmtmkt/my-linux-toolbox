#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=1.7
TARGET=ssh-chat

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET-$VERSION.tar.gz
DOWNLOAD_URL=https://github.com/shazow/ssh-chat/releases/download/v$VERSION/${TARGET}-linux_amd64.tgz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

pushd $BUILD_DIR

# expand
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE
cd $TARGET

# build
cp ./ssh-chat $PREFIX/bin/
RESULT=$?

popd

log $TARGET
exit $RESULT