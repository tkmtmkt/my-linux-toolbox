#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=perl-5.26.1

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://www.cpan.org/src/5.0/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -sSL -o $ARCHIVE $DOWNLOAD_URL

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
./configure.gnu --prefix=$PREFIX &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
