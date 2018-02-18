#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=Python-3.6.4

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tgz
DOWNLOAD_URL=https://www.python.org/ftp/python/3.6.4/$TARGET.tgz
[[ ! -s $ARCHIVE ]] && curl -ksSL -o $ARCHIVE $DOWNLOAD_URL

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX \
            --enable-shared \
            --with-doc-strings \
            --with-system-expat \
            --with-ensurepip=install &&
make && make install &&
ln -sf python3.6 $PREFIX/bin/python &&
ln -sf pip3.6 $PREFIX/bin/pip
RESULT=$?
popd

popd

exit $RESULT
