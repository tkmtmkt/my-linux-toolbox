#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=lua-5.3.5

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://www.lua.org/ftp/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
sed -i "s|INSTALL_TOP=.*|INSTALL_TOP= $PREFIX|g" Makefile
sed -i "s|MYLDFLAGS=.*|MYLDFLAGS= -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib|g" src/Makefile
sed -i "s|MYLIBS=.*|MYLIBS= -lncursesw|g" src/Makefile
make linux &&
make install
RESULT=$?
popd

popd

exit $RESULT
